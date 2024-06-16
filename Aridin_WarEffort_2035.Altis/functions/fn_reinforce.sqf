/*
	Author: Doskal Aridin

	Description:
		Reinforces AO with infantry
        
    Parameters:
        0 - position

	Returns:
		true

	Examples:
		[POS] remoteExec ["ARDN_fnc_reinforce", 2];
*/
params ["_pos"];

diag_log "MISSION: Spawning reinforcements";

private _playerCount_enemyStrength = floor ((count call BIS_fnc_listPlayers) / 8);
private _AO_enemyStrength = AO_enemyStrength + _playerCount_enemyStrength + WarEffortDifficulty;
if (_AO_enemyStrength > 10) then {_AO_enemyStrength = 10};

if (OPFORreserves > (10 + _AO_enemyStrength)) then {OPFORreserves = (10 + _AO_enemyStrength)};

private _vicClass = selectRandom array_heliTransport;

private _dir = (getMarkerPos "markerHQ") getDir _pos;

private _spawnPos = _pos getPos [5000, _dir];
private _lzPos = [_pos, 0, AO_size, 15, 0, 0.3, 0] call BIS_fnc_findSafePos;
if (count _lzPos == 3) then {_lzPos = _pos};

private _heliPad = createVehicle ["Land_HelipadEmpty_F", _lzPos, [], 0, "CAN_COLLIDE"];

private _air = createVehicle [_vicClass, _spawnPos, [], 0, "FLY"];
_air setDir random 360;
createVehicleCrew  _air;
private _airGroup = group _air;

private _waypoint = _airGroup addWaypoint [_lzPos, 10];
_waypoint setWaypointTimeout [5, 5, 5];
_waypoint setWaypointBehaviour "CARELESS";
private _waypoint1 = _airGroup addWaypoint [_lzPos, 0];
_waypoint1 setWaypointType "SCRIPTED";
_waypoint1 setWaypointScript "A3\functions_f\waypoints\fn_wpLand.sqf";
_waypoint1 setWaypointTimeout [20, 20, 20];
_waypoint1 setWaypointStatements ["true", "{unassignVehicle (_x select 0); [(_x select 0)] allowGetIn false;} forEach (fullCrew [assignedVehicle this, 'cargo', false])"];

private _waypoint3 = _airGroup addWaypoint [_spawnPos, 5];
_waypoint3 setWaypointCompletionRadius 100;
_waypoint3 setWaypointStatements ["true", "deleteVehicle (vehicle this);{deleteVehicle _x} forEach thisList;"];

if (isNil "array_infantry") then {
    private _selectedFaction = selectRandom array_factions;

    switch (_selectedFaction) do
    {
        case "PAVN": {
            array_infantry = array_soldier_PAVN;
        };
        case "DacCong": {
            array_infantry = array_soldier_DacCong;
        };
        default {
            array_infantry = array_soldier_VC;
        };
    };
};

private _array_infantry = [];
_array_infantry pushBack (array_infantry select 0);

private _vicSeats = _air emptyPositions "Cargo";
for "_i" from 1 to _vicSeats do {
    _array_infantry pushBack (selectRandom array_infantry);
};

private _qrfGroup = [_spawnPos, EAST, _array_infantry, [], [], [], [], [_vicSeats,0], 0, false, _vicSeats] call BIS_fnc_spawnGroup;
private _qrfWaypoint2 = _qrfGroup addWaypoint [_lzPos, 10];
private _qrfWaypoint3 = _qrfGroup addWaypoint [_pos, 100];
_qrfWaypoint3 setWaypointType "SAD";
{_x moveInCargo _air; _x assignAsCargo _air} forEach units _qrfGroup;

OPFORreserves = OPFORreserves - 1;
if (OPFORreserves < 0) then {OPFORreserves = 0};
publicVariable "OPFORreserves";
true