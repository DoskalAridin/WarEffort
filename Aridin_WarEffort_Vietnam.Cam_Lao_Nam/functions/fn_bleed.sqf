/*
	Author: Doskal Aridin

	Description:
		causes the given unit to leave a trail of blood.

	Returns:
		true

	Examples:
		 [this] remoteExec ["ARDN_fnc_bleed", 2];
*/
params ["_unit"];
while {alive _unit} do {
	_blood = "BloodTrail_01_New_F" createVehicle (getPos _unit);
	_blood setDir (getDir _unit);
	sleep 30;
};