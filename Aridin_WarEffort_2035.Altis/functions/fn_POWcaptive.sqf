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
		[unit] remoteExec ["ARDN_fnc_POWcaptive"];
*/
params ["_unit", ["_setCaptured", true]];


if (_setCaptured == true) then {
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
};

if (_setCaptured == true) then {
    _unit addAction ["<t color='#149616'>Follow me!</t>", {
         private _pow = _this select 0;
         [_pow] remoteExec ["ARDN_fnc_POWcaptive"];
         private _player = _this select 1;
         private _group = group _player;
         [_pow] join _group;
         _pow setVariable ["bleeding", false];
    }, nil,6,true,true,"","true",4];
} else {
    _unit addAction ["<t color='#149616'>Follow me!</t>", {
         private _pow = _this select 0;
         private _player = _this select 1;
         private _group = group _player;
         [_pow] join _group;
         _pow setVariable ["bleeding", false];
    }, nil,6,true,true,"","true",4];
};
