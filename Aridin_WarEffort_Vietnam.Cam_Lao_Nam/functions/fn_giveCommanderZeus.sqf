/*
	Author: Doskal Aridin

	Description:
		Gives unit control over Zeus

	Returns:
		true

	Examples:
		[unit] remoteExec ["ARDN_fnc_giveCommanderZeus"];
*/

params ["_unit"];

private _cmdr = _this select 0;
_cmdr assignCurator cmdr_z;