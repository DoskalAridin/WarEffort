/*
	Author: Doskal Aridin

	Description:
		Generates a main operation defence mission

	Returns:
		true - if mission is generated

	Examples:
		remoteExec ["ARDN_fnc_generateMainDefend", 2];
*/
private _playerCount_enemyStrength = ((count call BIS_fnc_listPlayers) / 2);
private _AO_enemyStrength = AO_enemyStrength + _playerCount_enemyStrength;

//Find and select near Main AO
private _mainAO_size = AO_size + 500;
private _availableMainAOs = [];
private _nearestMainAOs = [];
private _selectedAO = "";

_availableMainAOs = MACVterritory - ["markerHQ"];
//_selectedAO = marker string | _missionArea = marker pos [x,y,z]
_selectedAO = selectRandom _availableMainAOs;
_missionArea = getMarkerPos _selectedAO;

operationAO = _selectedAO;
publicvariable "operationAO";

private _enemyStrengthArea = 0;
{
    if (_missionArea inArea _x) then {_enemyStrengthArea = -2;}
} forEach enemyStrengthMarker_low;
{
    if (_missionArea inArea _x) then {_enemyStrengthArea = 2;}
} forEach enemyStrengthMarker_high;

_AO_enemyStrength = _AO_enemyStrength + _enemyStrengthArea;
if (_AO_enemyStrength > 10) then {_AO_enemyStrength = 10};

private _selectedFaction = selectRandom array_factions;

switch (_selectedFaction) do
{
	case "PAVN": {
		opfor_sl = "vn_o_men_nva_15";
		array_infantry = array_soldier_PAVN;
		array_vehicles = array_vehicles_PAVN;
		array_aa = array_aa_PAVN;
		array_arty = array_arty_PAVN;
        array_BOAT = array_BOAT_VC;
        array_air = array_heli_PAVN;
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
        array_air = array_heli_PAVN;
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
        array_air = array_heli_PAVN;
        if (_AO_enemyStrength > 5) then {
            array_vehicles append array_vehicles_strong_VC;
            array_aa append array_aa_strong_VC;
            array_arty append array_arty_strong_VC;
            array_BOAT append array_BOAT_PAVN;
        };
	};
};

private _selectedFactionBLUFOR = selectRandom array_factions_blufor;

switch (_selectedFactionBLUFOR) do
{
    default {
        blufor_sl = "vn_b_men_army_02";
		array_infantry_blufor = array_soldier_Army;
		array_vehicles_blufor = array_vehicles_Army;
		array_aa_blufor = array_aa_Army;
		array_arty_blufor = array_arty_Army;
        array_BOAT_blufor = array_BOAT_macv;
        array_air_blufor = array_air_Army;
    };
    case "USMC": {
        blufor_sl = "vn_b_men_usmc_68_02";
		array_infantry_blufor = array_soldiers_usmc;
		array_vehicles_blufor = array_vehicles_usmc;
		array_aa_blufor = array_aa_usmc;
		array_arty_blufor = array_arty_usms;
        array_BOAT_blufor = array_BOAT_macv;
        array_air_blufor = array_air_usmc;
    };
    case "SOG": {
        blufor_sl = "vn_b_men_sog_04";
		array_infantry_blufor = array_soldiers_SOG;
		array_vehicles_blufor = array_vehicles_SOG;
		array_aa_blufor = array_aa_SOG;
		array_arty_blufor = array_arty_SOG;
        array_BOAT_blufor = array_BOAT_macv;
        array_air_blufor = array_air_SOG;
    };
};

if (!isNil _selectedAO || _selectedAO == "") then {
    _objectiveTask = [BLUFOR, "Objective_MissionComplete", ["We have successfully captured all key locations.", "War Effort"], objNull, "SUCCEEDED", 1, true, "default", false] call BIS_fnc_taskCreate;
};
//check AO isn't already in use
if (activeAOs find _selectedAO >= 0) then {[_selectedAO] call ARDN_fnc_clearAO};
activeAOs pushBack _selectedAO;
publicVariable "activeAOs";

private _blackList = [];

// Spawn garrisoned units (in building locations w/ pathing disabled)
private _garrisonAvailableBuildings = nearestObjects [_missionArea, ["House", "Building", "Land_vn_cave_base"], 200];
private _garrisonAvailablePos = [];
{
    private _garrisionPos = _x buildingPos -1;
    _garrisonAvailablePos insert [-1, _garrisionPos, true];
} forEach _garrisonAvailableBuildings;

if (count _garrisonAvailablePos != 0) then {
    private _numGarrisonedUnits = ceil ((random 5) + 10);
    for "_i" from 1 to _numGarrisonedUnits do
    {
        private _garrisonClass = selectRandom array_infantry_blufor;
		private _garrisonPos = selectrandom _garrisonAvailablePos;
        _garrisonAvailablePos = _garrisonAvailablePos - _garrisonPos;
		private _GarrisonedGroup = createGroup west; 
        private _GarrisionedUnit = _GarrisonedGroup createUnit [_garrisonClass, _garrisonPos, [], 0, "NONE"];
        _GarrisionedUnit disableAI "PATH";
        sleep 0.1;
    };
};

// Spawn idle squads (main infantry force)
private _numSquadUnits = ceil ((random 3) + 2); // Adjust garrison count range as needed
for "_i" from 1 to _numSquadUnits do
{
    private _spawnPos = [_missionArea, 0, AO_size, 5, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos == 2) then {
         private _SquadUnit = [_spawnPos, WEST, array_infantry_blufor, [], [], [], [], [2,0.1]] call BIS_fnc_spawnGroup;
        [_SquadUnit, _spawnPos] call BIS_fnc_taskDefend;
        sleep 0.1;   
    };
};

// Spawn anti-air units
private _numAA = ceil ((random 2) + 1); // Adjust anti-air count range as needed
for "_i" from 1 to _numAA do
{
    private _spawnPos = [_missionArea, 0, AO_size, 5, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos == 2) then {
        private _aaClass = selectRandom array_aa_blufor;
        private _aaUnit = createVehicle [_aaClass, _spawnPos, [], 0, "NONE"];
        _aaUnit setDir random 360;
        createVehicleCrew _aaUnit;
        private _SquadUnit = [_spawnPos, WEST, array_infantry_blufor, [], [], [], [], [2,0.1]] call BIS_fnc_spawnGroup;
        [_SquadUnit, _spawnPos] call BIS_fnc_taskDefend;
        sleep 0.1;
    };
};

// Spawn ground vehicles
private _numVehicles = ceil ((random 2) + 2);
for "_i" from 1 to _numVehicles do
{
    private _spawnPos = [_missionArea, 0, AO_size, 6, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos == 2) then {
        private _vehicleClass = selectRandom array_vehicles_blufor;
        private _vehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "NONE"];
        _vehicle setDir random 360;
        createVehicleCrew  _vehicle;
        sleep 0.1;
    };
};
private _OpName1st = selectRandom OpName1st;
private _MainOpTask = [BLUFOR, "mainOperation", ["All forces deploy to the area. Defend against an enemy counter attack.", format ["Operation %1 Defense", _OpName1st]], _missionArea, "CREATED", 1, false, "defend", false] call BIS_fnc_taskCreate;

// Spawn officer to defend
private _POIofficer = selectrandom _garrisonAvailablePos;
private _objGroup = createGroup west;
private _objOfficer = _objGroup createUnit [blufor_sl, _POIofficer, [], 0, "NONE"];
_objOfficer addEventHandler ["Killed", {["mainOperation_officer" ,"FAILED"] call BIS_fnc_taskSetState; MACVresource = floor (MACVresource - (enemyStrengthMissionFailPenalty * 2)); publicVariable "MACVresource"; OperationOfficer = false; publicVariable "OperationOfficer";}];
private _objUnit = [_POIofficer, WEST, array_infantry_blufor, [], [], [], [], [4,0.1], 0, false] call BIS_fnc_spawnGroup;
units _objUnit join _objGroup;
 private _MainOpOfficer = [BLUFOR, ["mainOperation_officer", "mainOperation"], ["", "Defend Officer"], [_objOfficer, true], "CREATED", 1, false, "defend", false] call BIS_fnc_taskCreate;
OperationOfficer = true;

private _MainOpArea = [BLUFOR, ["mainOperation_area", "mainOperation"], ["Prevent enemy forces from over running the area.", "Defend area"], objNull, "CREATED", 1, false, "defend", false] call BIS_fnc_taskCreate;
OperationArea = true;

// Spawn assaulting force
[_missionArea,_AO_enemyStrength] execVM "scripts\OPFORassault.sqf";
OPFORreserves = OPFORreserves + (_AO_enemyStrength * 2);

["mainOperation" , "ASSIGNED"] call BIS_fnc_taskSetState;

sleep 30;

// Mission fail check
[_missionArea, _selectedAO] spawn {
    params ["_missionArea", "_selectedAO"];
    while {OperationActive == true} do {
        if (count (units east inAreaArray [_missionArea, AO_size, AO_size]) > count (units west inAreaArray [_missionArea, AO_size, AO_size])) then {
            ["mainOperation_area" , "FAILED"] call BIS_fnc_taskSetState;
            OperationArea = false;
        };
        if (OperationOfficer == false && OperationArea == false) then {
            ["mainOperation" , "FAILED"] call BIS_fnc_taskSetState;
            ["mainOperation_area", true] call BIS_fnc_deleteTask;
            ["mainOperation_officer", true] call BIS_fnc_deleteTask;
            ["mainOperation" , "FAILED"] call BIS_fnc_deleteTask;
            OperationActive = false;
            publicVariable "OperationActive";
            cleanAOs pushBack _selectedAO;
            publicVariable "cleanAOs";
            MACVterritory - _selectedAO;
            publicVariable "MACVterritory";
            _selectedAO setMarkerAlpha 0;
            AO_enemyStrength = AO_enemyStrength + (enemyStrengthMissionFailPenalty * 2.5);
            if (AO_enemyStrength > 10) then {AO_enemyStrength = 10};
            publicVariable "AO_enemyStrength";
            operationAO = "";
            publicvariable "operationAO";
            remoteExec ["ARDN_fnc_saveMission", 2];
        };
        sleep 30;
    };
};

//mission success check
[_missionArea, _selectedAO] spawn {
    params ["_missionArea", "_selectedAO"];
    while {OperationActive == true} do {
        sleep 1800;
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
        MACVresource = MACVresource + floor (missionReward * 5);
        publicVariable "MACVresource";
        operationAO = "";
        publicvariable "operationAO";
        remoteExec ["ARDN_fnc_saveMission", 2];
    };
};