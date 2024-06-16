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
private _playerCount_enemyStrength = floor ((count call BIS_fnc_listPlayers) / 8);
private _AO_enemyStrength = AO_enemyStrength + _playerCount_enemyStrength + WarEffortDifficulty;

private _AIlimit = AIlimit + (count activeAOs);

// Chance for Main Op to be a defense
private _defendChance = 1.5^(-20+2*_AO_enemyStrength);
private _mainOpType = selectRandomWeighted ["attack", 1, "defend", _defendChance];
if (_mainOpType == "defend" && count BLUFORterritory > 1) exitWith {
    remoteExec ["ARDN_fnc_generateMainDefend", 2];
};

//Find and select near Main AO
private _mainAO_size = AO_size + 500;
private _availableMainAOs = [];
private _nearestMainAOs = [];
private _selectedAO = "";

_availableMainAOs = AOmarkersMain - BLUFORterritory;
{_nearest = [_availableMainAOs, _x] call BIS_fnc_nearestPosition; _nearestMainAOs pushBackUnique _nearest;} forEach BLUFORterritory;
//_selectedAO = marker string | _missionArea = marker pos [x,y,z]
_selectedAO = selectRandom _nearestMainAOs;
operationAO = _selectedAO;
publicvariable "operationAO";
_missionArea = getMarkerPos _selectedAO;

private _enemyStrengthArea = 0;
{
    if (_missionArea inArea _x) then {_enemyStrengthArea = -2;}
} forEach enemyStrengthMarker_low;
{
    if (_missionArea inArea _x) then {_enemyStrengthArea = 2;}
} forEach enemyStrengthMarker_high;

_AO_enemyStrength = _AO_enemyStrength + _enemyStrengthArea;
if (_AO_enemyStrength > 10) then {_AO_enemyStrength = 10};

// Select random faction and apply faction's arrays to approprate variables used by script
call ARDN_fnc_selectOPFOR;

if (!isNil _selectedAO || _selectedAO == "") then {
    _objectiveTask = [BLUFOR, "Objective_MissionComplete", ["We have successfully captured all key locations.", "War Effort"], objNull, "SUCCEEDED", 1, true, "default", false] call BIS_fnc_taskCreate;
};
//check AO isn't already in use
if (activeAOs find _selectedAO >= 0) then {[_selectedAO] call ARDN_fnc_clearAO};
activeAOs pushBack _selectedAO;
publicVariable "activeAOs";

private _nearRoads = _missionArea nearRoads _mainAO_size;
private _roadsBlacklist = _missionArea nearRoads AO_size;
private _nearRoads = _nearRoads - _roadsBlacklist;
private _nearRoadsCount = count _nearRoads;

private _blackList = [];
_blackList pushBack BLUFORterritory;

private _AOpopulated = [_missionArea, AO_size, _blackList, _AO_enemyStrength, 2] spawn ARDN_fnc_populateAO;
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
//Generate Objectives
private _OpName1st = selectRandom OpName1st;
private _OpName2nd = selectRandom OpName2nd;
private _MainOpTask = [BLUFOR, "mainOperation", [format ["All forces deploy to the area. Complete all tasks and secure the area.<br/><br/>Intel:<br/>Traps and IEDs will be scattered throught the AO, make sure to bring a Trapkit.<br/>%1", _textIntel], format ["Operation %1 %2", _OpName1st, _OpName2nd]], _missionArea, "CREATED", 1, false, "attack", false] call BIS_fnc_taskCreate;

//Objective Anti-Air
private _POIaa = [_missionArea, 0, 500, 30, 0, 0.3, 0] call BIS_fnc_findSafePos;
if (count _POIaa != 3) then {
    private _UnitPos = [_POIaa, 0, 100, 30, 0, 0.3, 0] call BIS_fnc_findSafePos;
    if (count _UnitPos != 3) then {
        [_UnitPos, random 360, VCsiteAA] call BIS_fnc_ObjectsMapper;
        private _numUnits = ceil ((random _AO_enemyStrength) + 1); // Adjust patrol count range as needed
        for "_i" from 1 to _numUnits do
        {
            private _spawnPos = [_UnitPos, 0, 200, 5, 0, 0.3, 0] call BIS_fnc_findSafePos;
            private _aaClass = selectRandom array_aa;
            private _aaUnit = createVehicle [_aaClass, _spawnPos, [], 0, "NONE"];
            _aaUnit setDir random 360;
            createVehicleCrew _aaUnit;
            sleep 0.5;
        };
        private _MainOpAA = [BLUFOR, ["mainOperation_aa", "mainOperation"], ["Looks like the enemy has SA-2s and other AA stationed here.", "Eliminate Anti-Air emplacment"], _POIaa, "CREATED", 1, false, "destroy", false] call BIS_fnc_taskCreate;
        _blackList pushBack [_POIaa, 40];
        OperationAA = true;
        private _array_infantry = [];
        _array_infantry pushBack (array_infantry select 0);
        for "_i" from 1 to 10 do {
            _array_infantry pushBack (selectRandom array_infantry);
        };
        private _spawnPos = [_UnitPos, 0, 10, 5, 0, 0.5, 0] call BIS_fnc_findSafePos;
        private _SquadUnit = [_spawnPos, EAST, _array_infantry, [], [], [], [], [4,0.2], 0, false, 8] call BIS_fnc_spawnGroup;
        [_SquadUnit, _spawnPos] call BIS_fnc_taskDefend;
    };
};          

//Objective Artillery
private _POIarty = [_missionArea, 0, 500, 30, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
if (count _POIarty != 3) then {
    private _UnitPos = [_POIarty, 0, 100, 30, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _UnitPos != 3) then {
        [_UnitPos, random 360, OPFORsiteArty] call BIS_fnc_ObjectsMapper;
        private _MainOpArty = [BLUFOR, ["mainOperation_arty", "mainOperation"], ["", "Eliminate artillery position"], _POIarty, "CREATED", 1, false, "destroy", false] call BIS_fnc_taskCreate;
        _blackList pushBack [_POIarty, 40];
        OperationArty = true;
        private _array_infantry = [];
        _array_infantry pushBack (array_infantry select 0);
        for "_i" from 1 to 10 do {
            _array_infantry pushBack (selectRandom array_infantry);
        };
        private _spawnPos = [_UnitPos, 0, 10, 5, 0, 0.5, 0] call BIS_fnc_findSafePos;
        private _SquadUnit = [_spawnPos, EAST, _array_infantry, [], [], [], [], [4,0.2], 0, false, 8] call BIS_fnc_spawnGroup;
        [_SquadUnit, _spawnPos] call BIS_fnc_taskDefend;
    };
};

//Objective Officer
private _POIofficer = [_missionArea, 0, 500, 8, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
if (count _POIofficer != 3) then {
    private _UnitPos = [_POIofficer, 0, 100, 8, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _UnitPos != 3) then {
        [_UnitPos, random 360, VCsiteOfficer] call BIS_fnc_ObjectsMapper;
        private _objGroup = createGroup east;
        "vn_o_men_nva_65_01" createUnit [_UnitPos, _objGroup, "this addEventHandler ['Killed', {['mainOperation_officer' ,'SUCCEEDED'] call BIS_fnc_taskSetState; BLUFORresource = floor (BLUFORresource + (missionReward * 2)); publicVariable 'BLUFORresource'; OperationOfficer = false; publicVariable 'OperationOfficer';['mainOperation_officer', true] call BIS_fnc_deleteTask;}];", 1, "COLONEL"];
        private _array_infantry = [];
        _array_infantry pushBack (array_infantry select 0);
        for "_i" from 1 to 10 do {
            _array_infantry pushBack (selectRandom array_infantry);
        };
        private _objUnit = [_UnitPos, EAST, _array_infantry, [], [], [], [], [4,0.2], 0, false, 8] call BIS_fnc_spawnGroup;
        units _objUnit join _objGroup;
        private _MainOpOfficer = [BLUFOR, ["mainOperation_officer", "mainOperation"], ["", "Eliminate Officer"], _POIofficer, "CREATED", 1, false, "kill", false] call BIS_fnc_taskCreate;
        OperationOfficer = true;
    };
};

//Objective Secure Area
private _MainOpArea = [BLUFOR, ["mainOperation_area", "mainOperation"], ["Clear out enemy forces from the area and establish control of the area.", "Secure the area"], objNull, "CREATED", 1, false, "attack", false] call BIS_fnc_taskCreate;
OperationArea = true;


// Spawn idle squads (main infantry force)
private _numSquadUnits = ceil ((random _AO_enemyStrength / 2) + 5); // Adjust garrison count range as needed
for "_i" from 1 to _numSquadUnits do
{
    if (count groups east < _AIlimit) then {
        private _spawnPos = [_missionArea, 0, 250, 2, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
        if (count _spawnPos != 3) then {
            private _array_infantry = [];
            _array_infantry pushBack (array_infantry select 0);
            for "_i" from 1 to 10 do {
                _array_infantry pushBack (selectRandom array_infantry);
            };
            private _SquadUnit = [_spawnPos, EAST, _array_infantry, [], [], [], [], [2,0.1]] call BIS_fnc_spawnGroup;
            [_SquadUnit, _spawnPos] call BIS_fnc_taskDefend;
            sleep 0.1;
        };
    } else {OPFORreserves = OPFORreserves + 1; publicVariable "OPFORreserves"};
};
// Spawn garrisoned units (in building locations w/ pathing disabled)
private _garrisonAvailablePos = nearestObjects [_missionArea, ["House", "Building", "Land_vn_cave_base"], AO_size];
if (count _garrisonAvailablePos != 0) then {
    private _numGarrisonedUnits = ceil (((random _AO_enemyStrength * 5) + 20) min count _garrisonAvailablePos);
    for "_i" from 1 to _numGarrisonedUnits do
    {
        private _garrisonClass = selectRandom array_infantry;
		private _garrisonBuilding = selectRandom _garrisonAvailablePos; 
		private _garrisonPos = selectrandom (_garrisonBuilding buildingPos -1); 
		private _GarrisonedGroup = createGroup east; 
        private _GarrisionedUnit = _GarrisonedGroup createUnit [_garrisonClass, _garrisonPos, [], 0, "NONE"];
        _GarrisionedUnit disableAI "PATH";
        sleep 0.1;
    };
};

// Spawn patrols

private _numPatrols = ceil ((random _AO_enemyStrength) + 5); // Adjust patrol count range as needed
for "_i" from 1 to _numPatrols do
{
    if (count groups east < _AIlimit) then {
        private _spawnPos = [_missionArea, AO_size, _mainAO_size, 5, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
        if (count _spawnPos == 2) then {
            private _array_infantry = [];
            _array_infantry pushBack (array_infantry select 0);
            for "_i" from 1 to 10 do {
                _array_infantry pushBack (selectRandom array_infantry);
            };
            private _patrolGroup = [_spawnPos, EAST, _array_infantry, [], [], [], [], [2,0.01], 0, false, _enemyStrength] call BIS_fnc_spawnGroup;	
            [_patrolGroup, _spawnPos, ceil random [250, 500, 1000]] call BIS_fnc_taskPatrol;
            sleep 0.1;
        };
    } else {OPFORreserves = OPFORreserves + 1; publicVariable "OPFORreserves"};
};

private _ViperSpawnPos = [_missionArea, AO_size, _mainAO_size, 5, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
private _Viper = [_spawnPos, EAST, array_soldier_Viper, [], [], [], [], [4,0.1], 0, false, _enemyStrength] call BIS_fnc_spawnGroup;	
[_Viper, _ViperSpawnPos, AO_size] call BIS_fnc_taskPatrol;

["mainOperation" , "ASSIGNED"] call BIS_fnc_taskSetState;

sleep 30;

[_missionArea, _POIaa, _POIarty, _selectedAO] spawn {
    params ["_missionArea", "_POIaa", "_POIarty", "_selectedAO"];
    while {OperationActive == true} do {
        if (count (units east inAreaArray [_missionArea, AO_size, AO_size]) < count (units west inAreaArray [_missionArea, AO_size, AO_size])) then {
            ["mainOperation_area" , "SUCCEEDED"] call BIS_fnc_taskSetState;
            OperationArea = false;
            ["mainOperation_area", true] call BIS_fnc_deleteTask;
        };
        if (count (vehicles select { _x isKindOf "vn_o_static_rsna75" } inAreaArray [_POIaa, 50, 50]) == 0) then {
            ["mainOperation_aa" , "SUCCEEDED"] call BIS_fnc_taskSetState;
            OperationAA = false;
            ["mainOperation_aa", true] call BIS_fnc_deleteTask;
        };
        if (count (vehicles select { _x isKindOf "vn_o_nva_static_d44_01" } inAreaArray [_POIarty, 50, 50]) == 0) then {
            ["mainOperation_arty" , "SUCCEEDED"] call BIS_fnc_taskSetState;
            OperationArea = false;
            ["mainOperation_arty", true] call BIS_fnc_deleteTask;
        };
        if (OperationAA == false && OperationArty == false && OperationOfficer == false && OperationArea == false) then {
            ["mainOperation" , "SUCCEEDED"] call BIS_fnc_taskSetState;
            OperationActive = false;
            publicVariable "OperationActive";
            cleanAOs pushBack _selectedAO;
            operationAO = "";
            publicVariable "operationAO";
            publicVariable "cleanAOs";
            BLUFORterritory pushBackUnique _selectedAO;
            publicVariable "BLUFORterritory";
            _selectedAO setMarkerAlpha 0.5;
            AO_enemyStrength = AO_enemyStrength - 1;
            if (AO_enemyStrength < 1) then {AO_enemyStrength = 1};
            publicVariable "AO_enemyStrength";
            BLUFORresource = BLUFORresource + floor (missionReward * 5);
            publicVariable "BLUFORresource";
            remoteExec ["ARDN_fnc_saveMission", 2];
        };
        diag_log format ["MISSION: Main OP -OPFOR: %1", count (units east inAreaArray [_missionArea, AO_size, AO_size])];
        diag_log format ["MISSION: Main OP - BLUFOR: %1", count (units west inAreaArray [_missionArea, AO_size, AO_size])];
        sleep 30;
    };
};