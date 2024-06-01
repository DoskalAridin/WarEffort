/*
	Author: Doskal Aridin

	Description:
		Spawns OPFOR to attack given position
        
	Examples:
		[_missionArea,_AO_enemyStrength] execVM "scripts\OPFORassault.sqf";
*/
params [["_pos",[0,0]],["_enemyStrength", 1]];

private _AIlimit = AIlimit + (count activeAOs);
private _mainAO_size = AO_size + 500;

private _blackList = ["markerHQ"];

// Decide enemy attack direction
private _dir = (getMarkerPos "markerHQ") getDir _pos;
private _enemyPos = _pos getPos [_mainAO_size, _dir];
private _enemyPos1 = _pos getPos [_mainAO_size, (_dir + 45)];
private _enemyPos2 = _pos getPos [_mainAO_size, (_dir - 45)];
private _enemyPosStart = [_enemyPos, 0, 100, 10, 0, 0.3, 0] call BIS_fnc_findSafePos;
private _enemyPosStart1 = [_enemyPos, 0, 100, 10, 0, 0.3, 0] call BIS_fnc_findSafePos;
private _enemyPosStart2 = [_enemyPos, 0, 100, 10, 0, 0.3, 0] call BIS_fnc_findSafePos;
if (count _enemyPosStart == 3) then {_enemyPosStart = _enemyPos};
if (count _enemyPosStart1 == 3) then {_enemyPosStart1 = _enemyPos};
if (count _enemyPosStart2 == 3) then {_enemyPosStart2 = _enemyPos};

private _enemyPosAir = _pos getPos [_mainAO_size + 500, _dir];

_arrayInfantryPos = [_enemyPosStart,_enemyPosStart1,_enemyPosStart2];

// Spawn a couple artillery
for "_i" from 1 to 2 do
{
    private _spawnPos = [_enemyPosStart, 0, 100, 15, 0, 0.2, 0, _blackList] call BIS_fnc_findSafePos;
    if (count _spawnPos == 2) then {
        private _artilleryClass = selectRandom array_arty;
        private _artillery = createVehicle [_artilleryClass, _spawnPos, [], 0, "NONE"];
        _artillery setDir random 360;
        createVehicleCrew  _artillery;
        _blackList append [[_spawnPos, 20]];
        sleep 0.1;
    } else {OPFORreserves = OPFORreserves + 1; publicVariable "OPFORreserves"};
};

// Spawn a couple anti-air units
for "_i" from 1 to 3 do
{
    private _spawnPos = [_enemyPosStart, 0, 100, 15, 0, 0.2, 0, _blackList] call BIS_fnc_findSafePos;
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
        _blackList append [[_spawnPos, 20]];
        sleep 0.1;
    } else {OPFORreserves = OPFORreserves + 1; publicVariable "OPFORreserves"};
};

private _numVehicles = ceil ((random (_enemyStrength / 2)) + 4);
for "_i" from 1 to _numVehicles do
{
    if (count units east < _AIlimit) then {
        private _spawnPos = [_enemyPosStart, 0, 100, 15, 0, 0.2, 0, _blackList] call BIS_fnc_findSafePos;
        if (count _spawnPos == 2) then {
            private _vehicleClass = selectRandom array_vehicles;
            private _vehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "NONE"];
            _vehicle setDir random 360;
            private _vicGroup = createVehicleCrew  _vehicle;
            private _waypoint = _vicGroup addWaypoint [_pos, 100];
            _waypoint setWaypointType "SAD";
            sleep 0.1;
        }  else {OPFORreserves = OPFORreserves + 1; publicVariable "OPFORreserves"};
    } else {OPFORreserves = OPFORreserves + 1; publicVariable "OPFORreserves"};
};

// attack helios
private _numAir = ceil (random (_enemyStrength / 4));
for "_i" from 1 to _numAir do
{
    private _spawnPos = [_enemyPosAir, 0, 100, 5, 0, 0, 0, _blackList] call BIS_fnc_findSafePos;
    private _airClass = selectRandom array_air;
    private _air = createVehicle [_airClass, _spawnPos, [], 0, "FLY"];
    _air setDir random 360;
    createVehicleCrew  _air;
    _airGroup = group _air;
    private _waypoint = _airGroup addWaypoint [_pos, 100];
    _waypoint setWaypointType "SAD";
    sleep 0.1;
};

// infantry
private _numInfantry = ceil ((random _enemyStrength) + 5);
for "_i" from 1 to _numInfantry do
{
    if (count units east < _AIlimit) then {
        private _array_infantry = [];
        _array_infantry pushBack (array_infantry select 0);
        for "_i" from 1 to 10 do {
            _array_infantry pushBack (selectRandom array_infantry);
        };
        private _spawnPos = selectRandom _arrayInfantryPos;
        private _infantryGroup = [_spawnPos, EAST, _array_infantry, [], [], [], [], [5,0.02], 0, false, _enemyStrength] call BIS_fnc_spawnGroup;
        private _waypoint = _infantryGroup addWaypoint [_pos, 100];
        _waypoint setWaypointType "SAD";
        sleep 0.1;
    } else {OPFORreserves = OPFORreserves + 1; publicVariable "OPFORreserves"};
};