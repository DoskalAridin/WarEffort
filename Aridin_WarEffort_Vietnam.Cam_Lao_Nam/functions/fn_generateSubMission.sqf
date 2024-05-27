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

if (ObjectiveCount < 0) then {ObjectiveCount = 0};
if (objectivesActive < 2) then 
{
diag_log "MISSION: Generating mission...";
ObjectiveCount = ObjectiveCount + 1;
publicVariable "ObjectiveCount";

// Select objective type

private _objectiveType = selectRandomWeighted ["ammoCache", 0.9, "hvt", 0.9, "eldestSon", 0.5, "pow", 0.75, "pilot", 0.2];

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
private _availableNearAOs = [];
private _selectedAO = "";
private _AOsNearMACV = [];
private _AOsInMACV = [];

// Select AO location
// Filter out AOs down to just ones adjacent to MACV controled territory
// Select AO and set it as the "Primary", if there's already a primary AO, select an AO adjacent to it
{
    private _AOinAreaIndices = AOmarkers inAreaArrayIndexes _x;
    private _AOinArea = [];
    {
        _AOinArea pushBack (AOmarkers select _x);
    } forEach _AOinAreaIndices;
    _AOsInMACV insert [-1, _AOinArea, true];
} forEach MACVterritory;

{
    private _AOnearAreaIndices = AOmarkers inAreaArrayIndexes [_x, 5000, 5000, 0, false, -1];
    private _AOnearArea = [];
    {
        _AOnearArea pushBack (AOmarkers select _x);
    } forEach _AOnearAreaIndices;
    _AOsNearMACV insert [-1, _AOnearArea, true];
    _AOsNearMACV = _AOsNearMACV - _AOsInMACV;
} forEach MACVterritory;


if (objectivesActive == 0) then {activeAOs = []};
if (objectivesActive > 0) then {
    private _nearAOs = AOmarkers select {(getMarkerPos _x) inArea [getmarkerPos primaryAO, 2000, 2000, 0, false]};
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

private _missionArea = getMarkerPos _selectedAO;

//Calculate enemy strength
private _enemyStrengthArea = 0;
{
    if (_missionArea inArea _x) then {_enemyStrengthArea = -2;}
} forEach enemyStrengthMarker_low;
{
    if (_missionArea inArea _x) then {_enemyStrengthArea = 2;}
} forEach enemyStrengthMarker_high;
private _playerCount_enemyStrength = ((count call BIS_fnc_listPlayers) / 8);
private _AO_enemyStrength = AO_enemyStrength + _playerCount_enemyStrength + _enemyStrengthArea + WarEffortDifficulty;
if (_AO_enemyStrength > 10) then {_AO_enemyStrength = 10};

// Select random faction and apply faction's arrays to approprate variables used by script
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
            array_aa append array_aa_VC;
            array_arty append array_arty_VC;
            array_BOAT append array_BOAT_PAVN;
        };
	};
};

private _blackList = MACVterritory;
private _AOpopulated = [_missionArea, AO_size, _blackList, _AO_enemyStrength, 1] spawn ARDN_fnc_populateAO;
waitUntil {scriptDone _AOpopulated};

private _textIntel = "";
if (_AO_enemyStrength <= 2.5) then {
    _textIntel = textIntel_min;
} else {
    if (_AO_enemyStrength <= 5) then {
        _textIntel = textIntel_low;
    } else {
        if (_AO_enemyStrength <= 7.5) then {
            _textIntel = textIntel_mid;
        } else {
            _textIntel = textIntel_high;
        };
    };
};

//Spawn objective
switch (_objectiveType) do {
    default {
        private _objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective %1:<br/>Locate and destroy an enemy ammo cache in the area.<br/><br/>Intel:<br/>Traps and IEDs will be scattered throught the AO, make sure to bring a Trapkit.<br/>%2", str ObjectiveCount, _textIntel], "Destroy enemy ammo cache"], _missionArea, "AUTOASSIGNED", 0, true, "destroy", false] call BIS_fnc_taskCreate;
        private _spawnPos = [_missionArea, 0, 200, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
        private _objObject = createVehicle ["vn_o_ammobox_full_06", _spawnPos, [], 0, "NONE"];
        private _bunkerCache = createVehicle ["Land_vn_o_shelter_05", _spawnPos, [], 0, "CAN_COLLIDE"];
        _objObject setVariable ["objectiveNumber", ObjectiveCount];
        _objObject setVariable ["objectiveAO", _selectedAO];
        _objObject addEventHandler ["Killed", {
            _obj = _this select 0;
            [_obj] remoteExec  ["ARDN_fnc_missionSuccess", 2];
        }];
        _spawnPos = [_spawnPos, 0, 25, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
        private _objUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
        [_objUnit, _spawnPos] call BIS_fnc_taskDefend;
        [_spawnPos, 0, SelectRandom VCcamps, 0.05] call BIS_fnc_objectsMapper;
    };
    case "hvt": {
        private _array_infantry = [];
        _array_infantry pushBack (array_infantry select 0);
        for "_i" from 1 to 10 do {
            _array_infantry pushBack (selectRandom array_infantry);
        };
        private _objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective %1:<br/>Intel indicates an enemy officer is in the area.<br/>Locate and eliminate them.<br/><br/>Intel:<br/>Traps and IEDs will be scattered throught the AO, make sure to bring a Trapkit.<br/>%2", str ObjectiveCount, _textIntel], "Eliminate enemy officer"], _missionArea, "AUTOASSIGNED", 0, true, "kill", false] call BIS_fnc_taskCreate;
        private _spawnPos = [_missionArea, 0, 200, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
        [_spawnPos, 0, SelectRandom VCcamps, 0.05] call BIS_fnc_objectsMapper;
        private _objGroup = createGroup east;
        opfor_sl createUnit [_spawnPos, _objGroup, "this setVariable ['objectiveNumber', ObjectiveCount]; this setVariable ['objectiveAO', _selectedAO]; this addEventHandler ['Killed', {_obj = _this select 0; [_obj] remoteExec  ['ARDN_fnc_missionSuccess', 2];}];", 1, "COLONEL"];
        private _objUnit = [_spawnPos, EAST, _array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
        units _objUnit join _objGroup;
    };
    case "eldestSon": {
        private _array_infantry = [];
        _array_infantry pushBack (array_infantry select 0);
        for "_i" from 1 to 10 do {
            _array_infantry pushBack (selectRandom array_infantry);
        };
        private _objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective %1:<br/>Locate an enemy ammo truck and leave a booby-trapped ammobox nearby.<br/><br/>Intel:<br/>Traps and IEDs will be scattered throught the AO, make sure to bring a Trapkit.<br/>%2", str ObjectiveCount, _textIntel], "Sabotage enemy ammo supply"], _missionArea, "AUTOASSIGNED", 0, true, "box", false] call BIS_fnc_taskCreate;
        private _spawnPos = [_missionArea, 0, 200, 8, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
        private _objObject = createVehicle ["vn_o_wheeled_z157_ammo_nva65", _spawnPos, [], 0, "NONE"];
        _objObject setVariable ["objectiveNumber", ObjectiveCount];
        _objObject setVariable ["objectiveAO", _selectedAO];
        _objObject addEventHandler ["Killed", {
            _obj = _this select 0;
            [_obj] remoteExec  ["ARDN_fnc_missionFailed", 2];
        }];
        _spawnPos = [_spawnPos, 0, 50, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
        private _objUnit = [_spawnPos, EAST, _array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
        [_objUnit, _spawnPos] call BIS_fnc_taskDefend;
        [_objObject] spawn {
            params ["_objObject"];
            _objectiveNumber = _objObject getVariable "objectiveNumber";
            while {alive _objObject} do {
                private _boobytrap = nearestMines [getPos _objObject, ["vn_mine_ammobox_range_ammo"], 20];
                if (count _boobytrap >= 1) then {
                    [_objObject] remoteExec  ["ARDN_fnc_missionSuccess", 2];
                };
                sleep 30;
            };
        };
    };
    case "pow": {
        private _array_infantry = [];
        _array_infantry pushBack (array_infantry select 0);
        for "_i" from 1 to 10 do {
            _array_infantry pushBack (selectRandom array_infantry);
        };
        private _objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective %1:<br/>The enemy is holding a prisoner of war in the area.<br/>Locate and extract them back to base.<br/><br/>Intel:<br/>Traps and IEDs will be scattered throught the AO, make sure to bring a Trapkit.<br/>%2", str ObjectiveCount, _textIntel], "Rescue POW"], _missionArea, "AUTOASSIGNED", 0, true, "danger", false] call BIS_fnc_taskCreate;
        private _spawnPos = [_missionArea, 0, 200, 9, 0, 0.1, 0, MACVterritory] call BIS_fnc_findSafePos;
        private _objCage = [_spawnPos, 0, SelectRandom VCcamps, 0.05] call BIS_fnc_objectsMapper;
        private _objGroup = createGroup west;
        private _objObject = _objGroup createUnit ["vn_b_men_lrrp_01", _spawnPos, [], 0, "NONE"];
        [_objObject] remoteExec ["ARDN_fnc_POWcaptive", 2];
        _objObject setVariable ["objectiveNumber", ObjectiveCount];
        _objObject setVariable ["objectiveAO", _selectedAO];
        _objObject setVariable ["pow", true];
        _objObject addAction ["<t color='#149616'>Follow me!</t>", {
             _pow = _this select 0;
             [_pow] remoteExec ["ARDN_fnc_POWcaptive", 2];
             _player = _this select 1;
             _group = group _player;
             [_pow] join _group;
        }, nil,6,true,true,"","true",4];
        _objObject addEventHandler ["Killed", {_obj = _this select 0; [_obj] remoteExec  ["ARDN_fnc_missionFailed", 2];}];
        _spawnPos = [_spawnPos, 0, 50, 5, 0, 0.3, 0, MACVterritory] call BIS_fnc_findSafePos;
        private _objUnit = [_spawnPos, EAST, _array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
        [_objUnit, _spawnPos] call BIS_fnc_taskDefend;
    };
    case "pilot": {
        private _wreckType = selectRandom ["heli", "plane"];
        private _wreckCraft = "vn_air_f4b_wreck";
        private _wreckPilot = "vn_b_men_aircrew_09";
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
        private _objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective %1:<br/>A friendly pilot has been shot down.<br/>Locate them, and extract them back to base.<br/><br/>Intel:<br/>Traps and IEDs will be scattered throught the AO, make sure to bring a Trapkit.<br/>%2", str ObjectiveCount, _textIntel], "Recover downed Pilot"], _missionArea, "AUTOASSIGNED", 0, true, _wreckType, false] call BIS_fnc_taskCreate;
        private _spawnPos = [_missionArea, 0, 250, 10, 0, 0.2, 0, MACVterritory] call BIS_fnc_findSafePos;
        private _wreck = createVehicle [_wreckCraft, _spawnPos, [], 0, "CAN_COLLIDE"];
        private _smoke = createVehicle ["test_EmptyObjectForSmoke", getPos _wreck, [], 0, "CAN_COLLIDE"];
        private _objGroup = createGroup west;
        private _objPilot = _objGroup createUnit [_wreckPilot, _spawnPos, [], 0, "NONE"];
        _objPilot setSkill 1;
        _objPilot setUnitTrait ["camouflageCoef", 0];
        _objPilot setUnitTrait ["audibleCoef", 0];
        _objPilot setVariable ["objectiveNumber", ObjectiveCount];
        _objPilot setVariable ["objectiveAO", _selectedAO];
        _objPilot setVariable ["pow", true];
        _objPilot setVariable ["bleeding", true];
        _objPilot addAction ["<t color='#149616'>Follow me!</t>", {
             private _pilot = _this select 0;
             private _player = _this select 1;
             private _group = group _player;
             [_pilot] join _group;
        }, nil,6,true,true,"","true",4];
        private _blood = createVehicle ["BloodPool_01_Medium_New_F", getPos _objPilot, [], 0, "NONE"];
        [_objPilot] spawn {
            params ["_objPilot"];
            while {_objPilot getVariable "bleeding" == true && alive _objPilot} do {
                sleep 5;
                if (speed _objPilot <= 4) then {
                        private _bloodTrail = createVehicle ["BloodPool_01_Medium_New_F", getPos _objPilot, [], 0, "CAN_COLLIDE"]
                    } else {
                        private _bloodTrail = createVehicle ["BloodTrail_01_New_F", getPos _objPilot, [], 0, "CAN_COLLIDE"];
                        _bloodTrail setDir (getDir _objPilot);
                        _bloodTrail setVectorUp surfaceNormal position _bloodTrail;
                    };
                private _cutter = createVehicle ["Land_ClutterCutter_medium_F", getPos _objPilot, [], 0, "CAN_COLLIDE"];
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
        private _waypointPos = [getPos _wreck, AO_size - 10, AO_size + 10, 0, 0, 0.3, 0, [], [getMarkerPos "marker_20", getMarkerPos "marker_20"]] call BIS_fnc_findSafePos;
        private _waypoint = _objGroup addWaypoint [_waypointPos, 5];
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

// Inform players about the generated mission
diag_log  "MISSION: Mission generated!";
true;
} else { diag_log "MISSION: Maximum missions reached."; false;};