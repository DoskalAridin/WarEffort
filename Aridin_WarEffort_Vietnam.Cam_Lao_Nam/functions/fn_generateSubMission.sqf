/*
	Author: Doskal Aridin

	Description:
		Generates a random AO.
        Can force objective type by passing argument
        "ammoCache" - destroy ammo cache
        "hvt" - eliminate office
        "eldestSon" - Sabotage enemy ammo supply
        "pow" - Rescue POW
        "pilot" - Rescue Pilot
        
        Any other argument will default to random selection.
    
    Parameters:
        0 - _forceObjectiveType:
            Marker name, default "any".

	Returns:
		true - if mission is generated
        false - if mission isn't generated (maximum missions reached)

	Examples:
		["any"] remoteExec ["ARDN_fnc_generateSubMission", 2];
*/
params [["_forceObjectiveType", "any"]];

if (objectivesActive < 2) then 
{
diag_log "MISSION: Generating mission...";

// Select objective type

_objectiveType = selectRandomWeighted ["ammoCache", 1, "hvt", 1, "eldestSon", 0.75, "pow", 0.75, "pilot", 0.5];

switch (_forceObjectiveType) do
{
    default {
        diag_log "MISSION: Selecting random objective";
    };
    case "ammoCache": {
        diag_log "MISSION: Forcing ammo cache objective";
        _objectiveType = "ammoCache";
    };
    case "hvt": {
        diag_log "MISSION: Forcing HVT objective";
        _objectiveType = "hvt";
    };
    case "eldestSon": {
        diag_log "MISSION: Forcing Eldest Son objective";
        _objectiveType = "eldestSon";
    };
    case "pow": {
        diag_log "MISSION: Forcing POW objective";
        _objectiveType = "pow";
    };
    case "pilot": {
        diag_log "MISSION: Forcing pilot rescue objective";
        _objectiveType = "pilot";
    };
};

diag_log format ["MISSION: Mission type selected, %1", _objectiveType];
// Set up the mission area
diag_log "MISSION: Selecting new AO.";
_availableNearAOs = [];
_selectedAO = "ao_0";
_AOsNearMACV = [];
_AOsInMACV = [];

// Select AO location
// Filter out AOs down to just ones adjacent to MACV controled territory
// Select AO and set it as the "Primary", if there's already a primary AO, select an AO adjacent to it
_aoPositions = [];
{
    _aoPos = getMarkerPos _x;
    _aoPositions pushBack _aoPos;
} forEach AOmarkers;

{
    _AOinAreaIndices = _aoPositions inAreaArrayIndexes _x;
    _AOinArea = [];
    {
        _AOinArea pushBack (AOmarkers select _x);
    } forEach _AOinAreaIndices;
    _AOsInMACV insert [-1, _AOinArea, true];

} forEach MACVterritory;

{
    _AOnearAreaIndices = _aoPositions inAreaArrayIndexes [_x, 5000, 5000, 0, false, -1];
    _AOnearArea = [];
    {
        _AOnearArea pushBack (AOmarkers select _x);
    } forEach _AOnearAreaIndices;
    _AOsNearMACV insert [-1, _AOnearArea, true];
    _AOsNearMACV = _AOsNearMACV - _AOsInMACV;
} forEach MACVterritory;


if (objectivesActive == 0) then {activeAOs = []};
if (objectivesActive > 0) then {
    _nearAOs = AOmarkers select {(getMarkerPos _x) inArea [getmarkerPos primaryAO, 2000, 2000, 0, false]};
    _availableNearAOs = _nearAOs - activeAOs;
};
diag_log "MISSION: Selecting new AO.";
_selectedAO = if (objectivesActive == 0) then {
    selectRandom _AOsNearMACV;
} else {
    diag_log "MISSION: Primary AO already exists, selecting adjacent AO.";
    selectRandom _availableNearAOs;
};
if (_selectedAO == nil || _selectedAO == "") then {
    diag_log "MISSION: Failed to select AO. Selecting random AO.";
    _selectedAO = selectRandom AOmarkers;
};
activeAOs pushBack _selectedAO;
publicVariable "activeAOs";
if (objectivesActive == 0) then {
    primaryAO = _selectedAO;
    diag_log "MISSION: Primary AO assigned.";
};
diag_log format ["MISSION: AO %1 selected", _selectedAO];


objectivesActive = objectivesActive + 1;
publicVariable "objectivesActive";

_missionArea = getMarkerPos _selectedAO;

//Calculate enemy strength
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

_nearRoads = _missionArea nearRoads AO_size;
_nearRoadsCount = count _nearRoads;

// Spawn random number of patrols
_numPatrols = ceil ((random _AO_enemyStrength) + 1); // Adjust patrol count range as needed
for "_i" from 1 to _numPatrols do
{
    _spawnPos = [_missionArea, 0, AO_size, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
    _patrolGroup = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.01], 0, false, _AO_enemyStrength] call BIS_fnc_spawnGroup;	
    [_patrolGroup, _spawnPos, ceil random [250, 500, 1000]] call BIS_fnc_taskPatrol;
    sleep 0.05;
};
// Spawn idle squads (main infantry force)
_numSquadUnits = ceil ((random _AO_enemyStrength) + 2); // Adjust garrison count range as needed
for "_i" from 1 to _numSquadUnits do
{
    _spawnPos = [_missionArea, 0, AO_size, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
    _SquadUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1]] call BIS_fnc_spawnGroup;
    [_SquadUnit, _spawnPos] call BIS_fnc_taskDefend;
    sleep 0.05;
};
// Spawn garrisoned units (in building locations w/ pathing disabled)
_garrisonAvailablePos = nearestObjects [_missionArea, ["House", "Building", "Land_vn_cave_base"], AO_size];
if (count _garrisonAvailablePos != 0) then {
    _numGarrisonedUnits = ceil ((random _AO_enemyStrength) + 10);
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
_numVehicles = ceil ((random _AO_enemyStrength) + 1);
for "_i" from 1 to _numVehicles do
{
    _spawnPos = [_missionArea, 0, AO_size, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
    _vehicleClass = selectRandom array_vehicles; // Replace with your vehicle array name
    _vehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "NONE"];
    _vehicle setDir random 360;
    createVehicleCrew  _vehicle;
    sleep 0.05;
};

// Spawn anti-air units
_numAA = ceil random ((random _AO_enemyStrength) + 4); // Adjust anti-air count range as needed
for "_i" from 1 to _numAA do
{
    _spawnPos = [_missionArea, 0, AO_size, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
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

// Spawn artillery
_numArtillery = ceil ((random _AO_enemyStrength) + 2); // Adjust artillery count range as needed
for "_i" from 1 to _numArtillery do
{
    _spawnPos = [_missionArea, 0, AO_size, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
    _artilleryClass = selectRandom array_arty; // Replace with your artillery array name
    _artillery = createVehicle [_artilleryClass, _spawnPos, [], 0, "NONE"];
    _artillery setDir random 360;
    createVehicleCrew  _artillery;
    sleep 0.05;
};

// Spawn B O A T
_numBOAT = ceil (random _AO_enemyStrength);
for "_i" from 1 to _numBOAT do
{
    _spawnPos = [_missionArea, 0, AO_size, 5, 2, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
    _BOATClass = selectRandom array_BOAT;
    _BOAT = createVehicle [_BOATClass, _spawnPos, [], 0, "NONE"];
    _BOAT setDir random 360;
    createVehicleCrew  _BOAT;
    sleep 0.05;
};

// Randomly place mines around the mission location
_numtrap = ceil (random [20, 40, 80] + (AO_size / 10) - (_AO_enemyStrength * 2));
for "_i" from 1 to _numtrap do
{
    _trapPos = [_missionArea, 0, AO_size, 1, 0, 0.1, 0, MACVterritory] call BIS_fnc_findSafePos;
    _trapClass = selectRandom array_traps;
    _trap = createMine [_trapClass, _trapPos, [], 0];
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
//Spawn objective
switch (_objectiveType) do {
    default {
        _objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective %1:<br/>Locate and destroy an enemy ammo cache in the area.", str ObjectiveCount], "Destroy enemy ammo cache"], _missionArea, "AUTOASSIGNED", 0, true, "destroy", false] call BIS_fnc_taskCreate;
        _spawnPos = [_missionArea, 0, 200, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
        _objObject = createVehicle ["vn_o_ammobox_full_06", _spawnPos, [], 0, "NONE"];
        _bunkerCache = createVehicle ["Land_vn_o_shelter_05", _spawnPos, [], 0, "NONE"];
        _objObject setVariable ["objectiveNumber", ObjectiveCount];
        _objObject setVariable ["objectiveAO", _selectedAO];
        _objObject addEventHandler ["Killed", {
            _obj = _this select 0;
            [_obj] remoteExec  ["ARDN_fnc_missionSuccess", 2];
        }];
        _spawnPos = [_spawnPos, 0, 25, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
        _objUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
        [_objUnit, _spawnPos] call BIS_fnc_taskDefend;
    };
    case "hvt": {
        _objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective %1:<br/>Intel indicates an enemy officer is in the area.<br/>Locate and eliminate them.", str ObjectiveCount], "Eliminate enemy officer"], _missionArea, "AUTOASSIGNED", 0, true, "kill", false] call BIS_fnc_taskCreate;
        _objGroup = createGroup east;
        "vn_o_men_nva_65_01" createUnit [_missionArea, _objGroup, "this setVariable ['objectiveNumber', ObjectiveCount]; this setVariable ['objectiveAO', _selectedAO]; this addEventHandler ['Killed', {_obj = _this select 0; [_obj] remoteExec  ['ARDN_fnc_missionSuccess', 2];}];", 1, "COLONEL"];
        _objUnit = [_missionArea, EAST, array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
        units _objUnit join _objGroup;
    };
    case "eldestSon": {
        _objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective %1:<br/>Locate an enemy ammo truck and leave a booby-trapped ammobox nearby.", str ObjectiveCount], "Sabotage enemy ammo supply"], _missionArea, "AUTOASSIGNED", 0, true, "box", false] call BIS_fnc_taskCreate;
        _spawnPos = [_missionArea, 0, 200, 8, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
        _objObject = createVehicle ["vn_o_wheeled_z157_ammo_nva65", _spawnPos, [], 0, "NONE"];
        _objObject setVariable ["objectiveNumber", ObjectiveCount];
        _objObject setVariable ["objectiveAO", _selectedAO];
        _objObject addEventHandler ["Killed", {
            _obj = _this select 0;
            [_obj] remoteExec  ["ARDN_fnc_missionFailed", 2];
        }];
        _spawnPos = [_spawnPos, 0, 50, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
        _objUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
        [_objUnit, _spawnPos] call BIS_fnc_taskDefend;
        [_objObject] spawn {
            params ["_objObject"];
            _objectiveNumber = _objObject getVariable "objectiveNumber";
            while {alive _objObject} do {
                _boobytrap = nearestMines [getPos _objObject, ["vn_mine_ammobox_range_ammo"], 20];
                if (count _boobytrap >= 1) then {
                    [_objObject] remoteExec  ["ARDN_fnc_missionSuccess", 2];
                };
                sleep 30;
            };
        };
    };
    case "pow": {
        _objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective %1:<br/>The enemy is holding a prisoner of war in the area.<br/>Locate and extract them back to base.", str ObjectiveCount], "Rescue POW"], _missionArea, "AUTOASSIGNED", 0, true, "danger", false] call BIS_fnc_taskCreate;
        _spawnPos = [_missionArea, 0, 200, 9, 0, 0.1, 0, MACVterritory] call BIS_fnc_findSafePos;
        _objCage = [_spawnPos, 0, VCpow] call BIS_fnc_objectsMapper;
        _objGroup = createGroup west;
        _objObject = _objGroup createUnit ["vn_b_men_lrrp_01", _spawnPos, [], 0, "NONE"];
        [_objObject, true, _objObject] call ACE_captives_fnc_setHandcuffed;
        _objObject setVariable ["objectiveNumber", ObjectiveCount];
        _objObject setVariable ["objectiveAO", _selectedAO];
        _objObject setVariable ["pow", true];
        _objObject addEventHandler ["Killed", {_obj = _this select 0; [_obj] remoteExec  ["ARDN_fnc_missionFailed", 2];}];
        _spawnPos = [_spawnPos, 0, 50, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
        _objUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
        [_objUnit, _spawnPos] call BIS_fnc_taskDefend;
    };
    case "pilot": {
        _wreckType = selectRandom ["heli", "plane"];
        _wreckCraft = "vn_air_f4b_wreck";
        _wreckPilot = "vn_b_men_aircrew_09";
        switch (_wreckType) do {
            case "heli": {
                _wreckCraft = selectRandom ["vn_air_ah1g_01_wreck","vn_air_ch47_wreck","vn_air_ch34_01_wreck","vn_air_oh6a_01_wreck","vn_air_uh1c_01_wreck","vn_air_uh1d_med_wreck","vn_air_uh1d_01_wreck"];
                _wreckPilot = "vn_b_men_aircrew_09";
            };
            default {
                _wreckCraft = selectRandom ["vn_air_f100d_01_wreck","vn_air_f4b_wreck"];
                _wreckPilot = "vn_b_men_jetpilot_07";
            };
        };
        _objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective %1:<br/>A friendly pilot has been shot down.<br/>Locate them, and extract them back to base.", str ObjectiveCount], "Recover downed Pilot"], _missionArea, "AUTOASSIGNED", 0, true, _wreckType, false] call BIS_fnc_taskCreate;
        _spawnPos = [_missionArea, 0, 250, 10, 0, 0.2, 0, MACVterritory] call BIS_fnc_findSafePos;
        _wreck = createVehicle [_wreckCraft, _spawnPos, [], 0, "CAN_COLLIDE"];
        _smoke = createVehicle ["test_EmptyObjectForSmoke", getPos _wreck, [], 0, "CAN_COLLIDE"];
        _objGroup = createGroup west;
        _objPilot = _objGroup createUnit [_wreckPilot, _spawnPos, [], 0, "NONE"];
        _objPilot setSkill 1;
        _objPilot setUnitTrait ["camouflageCoef", 0];
        _objPilot setUnitTrait ["audibleCoef", 0];
        _objPilot setVariable ["objectiveNumber", ObjectiveCount];
        _objPilot setVariable ["objectiveAO", _selectedAO];
        _objPilot setVariable ["pow", true];
        _objPilot setVariable ["bleeding", true];
        _blood = createVehicle ["BloodPool_01_Medium_New_F", getPos _objPilot, [], 0, "NONE"];
        [_objPilot] spawn {
            params ["_objPilot"];
            while {_objPilot getVariable "bleeding" == true && alive _objPilot} do {
                sleep 5;
                if (speed _objPilot <= 4) then {
                        _bloodTrail = createVehicle ["BloodPool_01_Medium_New_F", getPos _objPilot, [], 0, "CAN_COLLIDE"]
                    } else {
                        _bloodTrail = createVehicle ["BloodTrail_01_New_F", getPos _objPilot, [], 0, "CAN_COLLIDE"];
                        _bloodTrail setDir (getDir _objPilot);
                        _bloodTrail setVectorUp surfaceNormal position _bloodTrail;
                    };
                _cutter = createVehicle ["Land_ClutterCutter_medium_F", getPos _objPilot, [], 0, "CAN_COLLIDE"];
            };
        };
        _objPilot allowDamage false;
        [_objPilot] spawn {
            params ["_objPilot"];
            sleep 300;
            _objPilot allowDamage true;
        };
        _objGroup setBehaviourStrong "STEALTH";
        _objGroup setCombatMode "GREEN";
        _objGroup setSpeedMode "LIMITED";
        _waypointPos = [getPos _wreck, AO_size - 10, AO_size + 10, 0, 0, 0.3, 0, [], [getMarkerPos "marker_20", getMarkerPos "marker_20"]] call BIS_fnc_findSafePos;
        _waypoint = _objGroup addWaypoint [_waypointPos, 5];
        _waypoint setWaypointCompletionRadius 10;
        _waypoint setWaypointStatements [true, "'SmokeShellPurple' createVehicle (getPos this)"];
        _waypoint setWaypointCombatMode "GREEN";
        _waypoint setWaypointBehaviour "STEALTH";
        _waypoint setWaypointSpeed "LIMITED";
        _objPilot addEventHandler ["Killed", {
            _obj = _this select 0;
            [_obj] remoteExec  ["ARDN_fnc_missionFailed", 2];
        }];
        _objGroup addEventHandler ["WaypointComplete", {
            _group = _this select 0;
            _pilot = leader _group;
            "SmokeShellPurple" createVehicle getPos leader _group;
            _pilot setVariable ["bleeding", false];
            _group removeEventHandler [_thisEvent, _thisEventHandler];
        }];
    };
};

ObjectiveCount = ObjectiveCount + 1;
if (ObjectiveCount < 0) then {ObjectiveCount = 0};
publicVariable "ObjectiveCount";

// Inform players about the generated mission
diag_log  "MISSION: Mission generated!";
true;
} else { diag_log "MISSION: Maximum missions reached."; false;};