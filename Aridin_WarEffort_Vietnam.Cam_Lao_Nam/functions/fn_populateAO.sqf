/*
	Author: Doskal Aridin

	Description:
		Populates AO
        
    Parameters:
        0 - AO position in [x,y] format.
        1 - AO size (radius)
        2 - Blacklist, array of markers
        3 - Enemy strength modifier. Intended values between 1-10
        4 - Minimum enemy spawns, flat increase to the minium enemy spawn counts.

	Returns:
		true - if mission is generated

	Examples:
		[[0,0], 2, 1] remoteExec ["ARDN_fnc_populateAO", 2];
*/
params [["_missionArea", [0,0]],["_aoSize", 500],["_blackList", [""]],["_enemyStrength", 1],["_minEnemy", 1]];

private _nearRoads = _missionArea nearRoads _aoSize;
private _nearRoadsCount = count _nearRoads;

// Spawn random number of patrols
private _numPatrols = ceil ((random _enemyStrength) + _minEnemy); // Adjust patrol count range as needed
for "_i" from 1 to _numPatrols do
{
    private _spawnPos = [_missionArea, 0, _aoSize, 5, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos == 2) then {
        private _patrolGroup = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.01], 0, false, _enemyStrength] call BIS_fnc_spawnGroup;	
        [_patrolGroup, _spawnPos, ceil random [250, 500, 1000]] call BIS_fnc_taskPatrol;
        sleep 0.1;
    };
};
// Spawn idle squads (main infantry force)
private _numSquadUnits = ceil ((random _enemyStrength) + (3 + _minEnemy)); // Adjust garrison count range as needed
for "_i" from 1 to _numSquadUnits do
{
    private _spawnPos = [_missionArea, 0, _aoSize, 5, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos == 2) then {
         private _SquadUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1]] call BIS_fnc_spawnGroup;
        [_SquadUnit, _spawnPos] call BIS_fnc_taskDefend;
        sleep 0.1;   
    };
};
// Spawn garrisoned units (in building locations w/ pathing disabled)
private _garrisonAvailableBuildings = nearestObjects [_missionArea, ["House", "Building", "Land_vn_cave_base"], _aoSize];
private _garrisonAvailablePos = [];
{
    private _garrisionPos = _x buildingPos -1;
    _garrisonAvailablePos insert [-1, _garrisionPos, true];
} forEach _garrisonAvailableBuildings;

if (count _garrisonAvailablePos != 0) then {
    private _numGarrisonedUnits = ceil ((random _enemyStrength) + (9 + _minEnemy));
    for "_i" from 1 to _numGarrisonedUnits do
    {
        private _garrisonClass = selectRandom array_infantry;
		private _garrisonPos = selectrandom _garrisonAvailablePos;
        _garrisonAvailablePos = _garrisonAvailablePos - _garrisonPos;
		private _GarrisonedGroup = createGroup east; 
        private _GarrisionedUnit = _GarrisonedGroup createUnit [_garrisonClass, _garrisonPos, [], 0, "NONE"];
        _GarrisionedUnit disableAI "PATH";
        sleep 0.1;
    };
};

// Spawn ground vehicles
private _numVehicles = ceil ((random (_enemyStrength / 2)) + (2 + _minEnemy));
for "_i" from 1 to _numVehicles do
{
    private _spawnPos = [_missionArea, 0, _aoSize, 6, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos == 2) then {
        private _vehicleClass = selectRandom array_vehicles; // Replace with your vehicle array name
        private _vehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "NONE"];
        _vehicle setDir random 360;
        createVehicleCrew  _vehicle;
        sleep 0.1;
    };
};

// Spawn anti-air units
private _numAA = ceil ((random (_enemyStrength / 4)) + (1 + _minEnemy)); // Adjust anti-air count range as needed
for "_i" from 1 to _numAA do
{
    private _spawnPos = [_missionArea, 0, _aoSize, 5, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos == 2) then {
        private _aaClass = selectRandom array_aa;
        private _aaUnit = createVehicle [_aaClass, _spawnPos, [], 0, "NONE"];
        _aaUnit setDir random 360;
        createVehicleCrew _aaUnit;
        if (_aaClass == "vn_o_static_rsna75") then {
            for "_i" from 1 to (ceil _enemyStrength / 3) do {
                private _spawnPos = [_spawnPos, 0, 100, 5, 0, 0.3, 0, [], [_spawnPos, _spawnPos]] call BIS_fnc_findSafePos;
                private _aaUnit = createVehicle ["vn_sa2", _spawnPos, [], 0, "NONE"];
                _aaUnit setDir random 360;
                createVehicleCrew _aaUnit;
            };
        };
        if (selectRandomWeighted [true, 0.75, false, 1] == true && _aaClass != "vn_o_static_rsna75") then {
            [_spawnPos, 0, SelectRandom VCcamps, 0.1] call BIS_fnc_objectsMapper;
        };
        private _SquadUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1]] call BIS_fnc_spawnGroup;
        [_SquadUnit, _spawnPos] call BIS_fnc_taskDefend;
        sleep 0.1;
    };
};

// Spawn artillery
private _numArtillery = ceil ((random (_enemyStrength / 4)) + _minEnemy); // Adjust artillery count range as needed
for "_i" from 1 to _numArtillery do
{
    private _spawnPos = [_missionArea, 0, _aoSize, 5, 0, 0.3, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos == 2) then {
        private _artilleryClass = selectRandom array_arty; // Replace with your artillery array name
        private _artillery = createVehicle [_artilleryClass, _spawnPos, [], 0, "NONE"];
        _artillery setDir random 360;
        createVehicleCrew  _artillery;
        if (selectRandomWeighted [true, 0.75, false, 1] == true) then {
            [_spawnPos, 0, SelectRandom VCcamps, 0.1] call BIS_fnc_objectsMapper;
        };
        private _SquadUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1]] call BIS_fnc_spawnGroup;
        [_SquadUnit, _spawnPos] call BIS_fnc_taskDefend;
        sleep 0.1;
    };
};

// Spawn B O A T
private _numBOAT = floor (random (_enemyStrength / 2));
for "_i" from 1 to _numBOAT do
{
    private _spawnPos = [_missionArea, 0, _aoSize, 15, 2, 0.2, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos == 2) then {
        private _BOATClass = selectRandom array_BOAT;
        private _BOAT = createVehicle [_BOATClass, _spawnPos, [], 0, "NONE"];
        _BOAT setDir random 360;
        createVehicleCrew  _BOAT;
        sleep 0.1;
    };
};

// Spawn air units
private _numAir = floor (random (_enemyStrength / 2) + (_minEnemy / 2));
for "_i" from 1 to _numAir do
{
    private _spawnPos = [_missionArea, 0, _aoSize] call BIS_fnc_findSafePos;
    if (count _spawnPos == 2) then {
        private _airClass = selectRandom array_air;
        private _air = createVehicle [_airClass, _spawnPos, [], 0, "FLY"];
        _air setDir random 360;
        createVehicleCrew  _air;
        _airGroup = group _air;
        _waypoint = _airGroup addWaypoint [_spawnPos, 5];
        _waypoint setWaypointType "SAD";
        sleep 0.1;
    };
};

// Randomly place mines around the mission location
private _numtrap = ceil (random [20, 40, 80] + (_aoSize / 10) - (_enemyStrength * 2));
for "_i" from 1 to _numtrap do
{
    private _trapPos = [_missionArea, 0, _aoSize, 1, 0, 0.1, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _trapPos == 2) then {
        private _trapClass = selectRandom array_traps;
        private _trap = createMine [_trapClass, _trapPos, [], 0];
    };
};
//place IEDs on roads
if (_nearRoadsCount != 0) then {
    for "_i" from 1 to (_enemyStrength min (_nearRoadsCount - 1)) do
    {
        private _IEDroad = _nearRoads select _i;
        private _IEDpos = getPos _IEDroad;
        private _IEDposValid = true;
        {if (_IEDpos inArea _x == true) then {_IEDposValid = false;}} forEach _blackList;
        if (_IEDposValid == true) then {
            private _IEDClass = selectRandom array_ied;
            private _IED = createMine [_IEDClass, _IEDpos, [], 0];
        };
    };
};

true;