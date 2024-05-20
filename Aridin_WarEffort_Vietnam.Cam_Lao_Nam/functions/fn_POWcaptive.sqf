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
		[this] remoteExec ["ARDN_fnc_POWcaptive", 2];
*/
params ["_unit"];

if (_unit getVariable ["captive", false] == false) then {
    if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
        [_unit, true, _unit] call ACE_captives_fnc_setHandcuffed;
        _unit setVariable ["captive", true, true];
    } else {
        [_unit] joinSilent createGroup civilian;
        _unit disableAI "PATH";
        _unit disableAI "WEAPONAIM";
        _unit disableAI "FIREWEAPON";
        _unit setVariable ["captive", true, true];
    };
} else {
    if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
        [_unit, false, _unit] call ACE_captives_fnc_setHandcuffed;
        _unit setVariable ["captive", false, true];
    } else {
        [_unit] joinSilent createGroup west;
        _unit enableAI "PATH";
        _unit enableAI "WEAPONAIM";
        _unit enableAI "FIREWEAPON";
        _unit setVariable ["captive", false, true];
    };
};
