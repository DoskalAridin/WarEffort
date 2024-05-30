/*
	Author: Doskal Aridin

	Description:
		Sets unit as captive or releases them.
        if ACE is available, simply sets them as handcuffed.
        if not, sets unit civilian and disables apropreate AI features.
        
    Parameters:
        0 - _unit:
            Unit to make captive.

	Returns:
		true

	Examples:
		[arsenalBoxes] remoteExec ["ARDN_fnc_POWcaptive", player];
*/
params ["_unit"];

if (_unit getVariable ["captive", false] == false) then {
    if (compat_ace == true) then {
        [_unit, true, _unit] call ACE_captives_fnc_setHandcuffed;
        _unit setVariable ["captive", true, true];
    } else {
        [_unit] joinSilent createGroup civilian;
        _unit disableAI "ALL";
        _unit setVariable ["captive", true, true];
    };
} else {
    if (compat_ace == true) then {
        [_unit, false, _unit] call ACE_captives_fnc_setHandcuffed;
        _unit setVariable ["captive", false, true];
    } else {
        _unit setVariable ["captive", false, true];
        _unit enableAI "ALL";        
    };
};
