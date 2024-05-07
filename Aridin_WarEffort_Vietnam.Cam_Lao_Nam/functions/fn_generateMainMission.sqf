/*
	Author: Doskal Aridin

	Description:
		Generates a random AO.

	Returns:
		true - if mission is generated
        false - if mission isn't generated (maximum missions reached)

	Examples:
		remoteExec ["ARDN_fnc_generateMainMission", 2];
*/
// Select random faction and apply faction's arrays to approprate variables used by script
OperationActive = true;
publicVariable "OperationActive";

//Find and select near Main AO
_mainAO_size = AO_size + 500;
_availableMainAOs = [];
_nearestMainAOs = [];
_selectedAO = "";

_availableMainAOs = AOmarkersMain - MACVterritory;
{_nearest = [_availableMainAOs, _x] call BIS_fnc_nearestPosition; _nearestMainAOs pushBackUnique _nearest;} forEach MACVterritory;
//_selectedAO = marker string | _missionArea = marker pos [x,y,z]
_selectedAO = selectRandom _nearestMainAOs;
_missionArea = getMarkerPos _selectedAO;

_enemyStrengthArea = 0;
{
    if (_missionArea inArea _x) then {_enemyStrengthArea = -2;}
} forEach enemyStrengthMarker_low;
{
    if (_missionArea inArea _x) then {_enemyStrengthArea = 2;}
} forEach enemyStrengthMarker_high;
_playerCount_enemyStrength = ((count call BIS_fnc_listPlayers) / 2);
_AO_enemyStrength = AO_enemyStrength + _playerCount_enemyStrength + _enemyStrengthArea;
if (_AO_enemyStrength > 10) then {_AO_enemyStrength = 10};

// Select random faction and apply faction's arrays to approprate variables used by script
_selectedFaction = selectRandom array_factions;

switch (_selectedFaction) do
{
	case "PAVN": {
		opfor_sl = "vn_o_men_nva_15";
		array_infantry = array_soldier_PAVN;
		array_vehicles = array_vehicles_PAVN;
		array_aa = array_aa_PAVN;
		array_arty = array_arty_PAVN;
        array_BOAT = array_BOAT_VC;
        if (_AO_enemyStrength > 5) then {
            array_vehicles append array_vehicles_strong_PAVN;
            array_aa append array_aa_strong_PAVN;
            array_arty append array_arty_strong_PAVN;
            array_BOAT append array_BOAT_PAVN;
        };
	};
	case "DacCong": {
		opfor_sl = "vn_o_men_nva_dc_01";
		array_infantry = array_soldier_DacCong;
		array_vehicles = array_vehicles_VC;
		array_aa = array_aa_VC;
		array_arty = array_arty_VC;
        array_BOAT = array_BOAT_VC;
        if (_AO_enemyStrength > 5) then {
            array_vehicles append array_vehicles_strong_VC;
            array_aa append array_aa_strong_VC;
            array_arty append array_arty_strong_VC;
            array_BOAT append array_BOAT_PAVN;
        };
	};
	default {
		opfor_sl = "vn_o_men_vc_01";
		array_infantry = array_soldier_VC;
		array_vehicles = array_vehicles_VC;
		array_aa = array_aa_VC;
		array_arty = array_arty_VC;
        array_BOAT = array_BOAT_VC;
        if (_AO_enemyStrength > 5) then {
            array_vehicles append array_vehicles_strong_VC;
            array_aa append array_aa_VC;
            array_arty append array_arty_VC;
            array_BOAT append array_BOAT_PAVN;
        };
	};
};

if (!isNil _selectedAO || _selectedAO == "") then {
    _objectiveTask = [BLUFOR, "Objective_MissionComplete", ["We have successfully captured all key locations.", "War Effort"], objNull, "SUCCEEDED", 1, true, "default", false] call BIS_fnc_taskCreate;
};
//check AO isn't already in use
if (activeAOs find _selectedAO >= 0) then {[_selectedAO] call ARDN_fnc_clearAO};
activeAOs pushBack _selectedAO;
publicVariable "activeAOs";

_nearRoads = _missionArea nearRoads _mainAO_size;
_roadsBlacklist = _missionArea nearRoads AO_size;
_nearRoads = _nearRoads - _roadsBlacklist;
_nearRoadsCount = count _nearRoads;

_blackList = [];
_blackList pushBack MACVterritory;

// Spawn random number of patrols
_numPatrols = ceil ((random _AO_enemyStrength * 1.5) + 5); // Adjust patrol count range as needed
for "_i" from 1 to _numPatrols do
{
    _spawnPos = [_missionArea, 0, _mainAO_size, 5, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos != 3) then {
        _patrolGroup = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.01], 0, false, _AO_enemyStrength] call BIS_fnc_spawnGroup;	
        [_patrolGroup, _spawnPos, ceil random [250, 500, 1000]] call BIS_fnc_taskPatrol;
        sleep 0.05;
    };
};
// Spawn idle squads (main infantry force)
_numSquadUnits = ceil ((random _AO_enemyStrength) + 3); // Adjust garrison count range as needed
for "_i" from 1 to _numSquadUnits do
{
    _spawnPos = [_missionArea, 0, _mainAO_size, 5, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos != 3) then {
        _SquadUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1]] call BIS_fnc_spawnGroup;
        [_SquadUnit, _spawnPos] call BIS_fnc_taskDefend;
        sleep 0.05;
    };
};
// Spawn garrisoned units (in building locations w/ pathing disabled)
_garrisonAvailablePos = nearestObjects [_missionArea, ["House", "Building", "Land_vn_cave_base"], _mainAO_size];
if (count _garrisonAvailablePos != 0) then {
    _numGarrisonedUnits = ceil (((random _AO_enemyStrength * 4) + 10) min count _garrisonAvailablePos);
    for "_i" from 1 to _numGarrisonedUnits do
    {
        _garrisonClass = selectRandom array_infantry;
		_garrisonBuilding = selectRandom _garrisonAvailablePos; 
		_garrisonPos = selectrandom (_garrisonBuilding buildingPos -1); 
		_GarrisonedGroup = createGroup east; 
        _GarrisionedUnit = _GarrisonedGroup createUnit [_garrisonClass, _garrisonPos, [], 0, "NONE"];
        _GarrisionedUnit disableAI "PATH";
        sleep 0.05;
    };
};
//Repeat last two, but concentrait around center of AO
// Spawn idle squads (main infantry force)
_numSquadUnits = ceil ((random _AO_enemyStrength) + 5); // Adjust garrison count range as needed
for "_i" from 1 to _numSquadUnits do
{
    _spawnPos = [_missionArea, 0, AO_size, 2, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos != 3) then {
        _SquadUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1]] call BIS_fnc_spawnGroup;
        [_SquadUnit, _spawnPos] call BIS_fnc_taskDefend;
        sleep 0.05;
    };
};
// Spawn garrisoned units (in building locations w/ pathing disabled)
_garrisonAvailablePos = nearestObjects [_missionArea, ["House", "Building", "Land_vn_cave_base"], AO_size];
if (count _garrisonAvailablePos != 0) then {
    _numGarrisonedUnits = ceil (((random _AO_enemyStrength * 4) + 10) min count _garrisonAvailablePos);
    for "_i" from 1 to _numGarrisonedUnits do
    {
        _garrisonClass = selectRandom array_infantry;
		_garrisonBuilding = selectRandom _garrisonAvailablePos; 
		_garrisonPos = selectrandom (_garrisonBuilding buildingPos -1); 
		_GarrisonedGroup = createGroup east; 
        _GarrisionedUnit = _GarrisonedGroup createUnit [_garrisonClass, _garrisonPos, [], 0, "NONE"];
        _GarrisionedUnit disableAI "PATH";
        sleep 0.05;
    };
};

// Spawn ground vehicles
_numVehicles = ceil ((random _AO_enemyStrength) + 2);
for "_i" from 1 to _numVehicles do
{
    _spawnPos = [_missionArea, AO_size, _mainAO_size, 5, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos != 3) then {
        _vehicleClass = selectRandom array_vehicles; // Replace with your vehicle array name
        _vehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "NONE"];
        _vehicle setDir random 360;
        createVehicleCrew  _vehicle;
        sleep 0.05;
    };
};

// Spawn anti-air units
_numAA = ceil random ((random _AO_enemyStrength) + 1);
for "_i" from 1 to _numAA do
{
    _spawnPos = [_missionArea, AO_size, _mainAO_size, 5, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos != 3) then {
        _aaClass = selectRandom array_aa;
        _aaUnit = createVehicle [_aaClass, _spawnPos, [], 0, "NONE"];
        _aaUnit setDir random 360;
        createVehicleCrew _aaUnit;
        if (_aaClass == "vn_o_static_rsna75") then {
            for "_i" from 1 to (ceil _AO_enemyStrength / 3) do {
                _spawnPos = [_spawnPos, 0, 100, 5, 0, 0.3, 0, [], [_spawnPos, _spawnPos]] call BIS_fnc_findSafePos;
                _aaUnit = createVehicle ["vn_sa2", _spawnPos, [], 0, "NONE"];
                _aaUnit setDir random 360;
                createVehicleCrew _aaUnit;
            };
        };
        sleep 0.05;
    };
};

// Spawn artillery
_numArtillery = ceil ((random _AO_enemyStrength) + 1);
for "_i" from 1 to _numArtillery do
{
    _spawnPos = [_missionArea, AO_size, _mainAO_size, 5, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos != 3) then {
        _artilleryClass = selectRandom array_arty;
        _artillery = createVehicle [_artilleryClass, _spawnPos, [], 0, "NONE"];
        _artillery setDir random 360;
        createVehicleCrew  _artillery;
        sleep 0.05;
    };
};

// Spawn B O A T
_numBOAT = ceil (random _AO_enemyStrength);
for "_i" from 1 to _numArtillery do
{
    _spawnPos = [_missionArea, AO_size, _mainAO_size, 5, 2, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos != 3) then {
        _BOATClass = selectRandom array_BOAT;
        _BOAT = createVehicle [_artilleryClass, _spawnPos, [], 0, "NONE"];
        _BOAT setDir random 360;
        createVehicleCrew  _BOAT;
        sleep 0.05;
    };
};

// Randomly place mines around the mission area
_numtrap = ceil (random [20, 40, 80] + (AO_size / 10) - (_AO_enemyStrength * 2));
for "_i" from 1 to _numtrap do
{
    _trapPos = [_missionArea, AO_size, _mainAO_size, 1, 0, 0.1, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos != 3) then {
        _trapClass = selectRandom array_traps;
        _trap = createMine [_trapClass, _trapPos, [], 0];
    };
};
//place IEDs on roads
if (_nearRoadsCount != 0) then {
    for "_i" from 1 to (_AO_enemyStrength min (_nearRoadsCount - 1)) do
    {
        _IEDroad = _nearRoads select _i;
        _IEDpos = getPos _IEDroad;
        _IEDposValid = true;
        {if (_IEDpos inArea _x == true) then {_IEDposValid = false;}} forEach MACVterritory;
        if (_IEDposValid == true) then {
            _IEDClass = selectRandom array_ied;
            _IED = createMine [_IEDClass, _IEDpos, [], 0];
        };
    };
};

//Generate Objectives
_OpName1st = selectRandom OpName1st;
_OpName2nd = selectRandom OpName2nd;
_MainOpTask = [BLUFOR, "mainOperation", ["All forces deploy to the area. Complete all tasks and secure the area.", format ["Operation %1 %2", _OpName1st, _OpName2nd]], _missionArea, "CREATED", 1, false, "attack", false] call BIS_fnc_taskCreate;

//Objective Anti-Air
_POIaa = [_missionArea, 0, 500, 40, 0, 0.3, 0] call BIS_fnc_findSafePos;
if (count _POIaa != 3) then {
    _UnitPos = [_POIaa, 0, 100, 40, 0, 0.3, 0] call BIS_fnc_findSafePos;
    if (count _UnitPos != 3) then {
        [_UnitPos, random 360, VCsiteAA] call BIS_fnc_ObjectsMapper;
        _numUnits = ceil ((random _AO_enemyStrength) + 1); // Adjust patrol count range as needed
        for "_i" from 1 to _numPatrols do
        {
            _spawnPos = [_UnitPos, 0, 200, 5, 0, 0.3, 0] call BIS_fnc_findSafePos;
            _aaClass = selectRandom array_aa; // Replace with your anti-air array name
            _aaUnit = createVehicle [_aaClass, _spawnPos, [], 0, "NONE"];
            _aaUnit setDir random 360;
            createVehicleCrew _aaUnit;
            sleep 0.5;
        };
        _MainOpAA = [BLUFOR, ["mainOperation_aa", "mainOperation"], ["Looks like the enemy has SA-2s and other AA stationed here.", "Eliminate Anti-Air emplacment"], _POIaa, "CREATED", 1, false, "destroy", false] call BIS_fnc_taskCreate;
        _blackList pushBack [_POIaa, 40];
        OperationAA = true;
    };
};          

//Objective Artillery
_POIarty = [_missionArea, 0, 500, 40, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
if (count _POIarty != 3) then {
    _UnitPos = [_POIarty, 0, 100, 40, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _UnitPos != 3) then {
        [_UnitPos, random 360, VCsiteArty] call BIS_fnc_ObjectsMapper;
        _MainOpArty = [BLUFOR, ["mainOperation_arty", "mainOperation"], ["", "Eliminate artillery position"], _POIarty, "CREATED", 1, false, "destroy", false] call BIS_fnc_taskCreate;
        _blackList pushBack [_POIarty, 40];
        OperationArty = true;
    };
};

//Objective Officer
_POIofficer = [_missionArea, 0, 500, 8, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
if (count _POIofficer != 3) then {
    _UnitPos = [_POIofficer, 0, 100, 8, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _UnitPos != 3) then {
        [_UnitPos, random 360, VCsiteOfficer] call BIS_fnc_ObjectsMapper;
        _objGroup = createGroup east;
        "vn_o_men_nva_65_01" createUnit [_UnitPos, _objGroup, "this addEventHandler ['Killed', {['mainOperation_officer' ,'SUCCEEDED'] call BIS_fnc_taskSetState; MACVresource = floor (MACVresource + (missionReward * 2)); publicVariable 'MACVresource'; OperationOfficer = false; publicVariable 'OperationOfficer';['mainOperation_arty', true] call BIS_fnc_deleteTask;}];", 1, "COLONEL"];
        _objUnit = [_UnitPos, EAST, array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
        units _objUnit join _objGroup;
        _MainOpOfficer = [BLUFOR, ["mainOperation_officer", "mainOperation"], ["", "Eliminate Officer"], _POIofficer, "CREATED", 1, false, "kill", false] call BIS_fnc_taskCreate;
        OperationOfficer = true;
    };
};

//Objective Secure Area
_MainOpArea = [BLUFOR, ["mainOperation_area", "mainOperation"], ["Clear out enemy forces from the area and establish control of the area.", "Secure the area"], objNull, "CREATED", 1, false, "attack", false] call BIS_fnc_taskCreate;
OperationArea = true;

["mainOperation" , "ASSIGNED"] call BIS_fnc_taskSetState;

[_missionArea, _POIaa, _POIarty, _selectedAO] spawn {
    params ["_missionArea", "_POIaa", "_POIarty", "_selectedAO"];
    while {OperationActive == true} do {
        if (count (units east inAreaArray [_missionArea, 500, 500]) < count units west) then {
            ["mainOperation_area" , "SUCCEEDED"] call BIS_fnc_taskSetState;
            OperationArea = false;
            ["mainOperation_area", true] call BIS_fnc_deleteTask;
        };
        if (count (units east inAreaArray [_POIaa, 50, 50]) == 0) then {
            ["mainOperation_aa" , "SUCCEEDED"] call BIS_fnc_taskSetState;
            OperationAA = false;
            ["mainOperation_aa", true] call BIS_fnc_deleteTask;
        };
        if (count (units east inAreaArray [_POIarty, 50, 50]) == 0) then {
            ["mainOperation_arty" , "SUCCEEDED"] call BIS_fnc_taskSetState;
            OperationArea = false;
            ["mainOperation_arty", true] call BIS_fnc_deleteTask;
        };
        if (OperationAA == false && OperationArty == false && OperationOfficer == false && OperationArea == false) then {
            ["mainOperation" , "SUCCEEDED"] call BIS_fnc_taskSetState;
            OperationActive = false;
            publicVariable "OperationActive";
            cleanAOs pushBack _selectedAO;
            publicVariable "cleanAOs";
            MACVterritory pushBackUnique _selectedAO;
            publicVariable "MACVterritory";
            _selectedAO setMarkerAlpha 0.5;
            AO_enemyStrength = AO_enemyStrength - 1;
            if (AO_enemyStrength < 1) then {AO_enemyStrength = 1};
            publicVariable "AO_enemyStrength";
            MACVresource = floor (MACVresource + missionReward) * 5;
            publicVariable "MACVresource";
            remoteExec ["ARDN_fnc_saveMission", 2];
        };
        sleep 30;
    };
};