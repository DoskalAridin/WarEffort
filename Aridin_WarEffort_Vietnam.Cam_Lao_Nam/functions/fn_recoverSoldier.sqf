/*
	Author: Doskal Aridin

	Description:
		Generates a random AO.
    
    Parameters:
        0 - Position array [x, y]:

	Returns:
		true

	Examples:
		[[0, 0]] remoteExec ["ARDN_fnc_recoverSoldier", 2];
*/
params ["_pos"];

_nearUnits = nearestObjects [_pos, ["Man"], 100];
{
    if (_x getVariable ["POW", false] == true) then {
        [_x] remoteExec  ["ARDN_fnc_missionSuccess", 2];
        sleep 2;
        deleteVehicle _x;
    };
} forEach _nearUnits;