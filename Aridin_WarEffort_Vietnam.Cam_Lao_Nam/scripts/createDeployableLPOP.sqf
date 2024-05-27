if (MACVresource > 100) then {
    MACVresource = MACVresource - 100; publicVariable "MACVresource";
    private _LPOP = createVehicle ["vn_us_komex_small_01", getMarkerPos "marker_LPOP", [], 0, "NONE"];
    [_LPOP,
     "Deploy LP/OP",
     "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa",
     "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa",
     "(getPos _target inArea 'markerHQ') == false",
     true,
     {},
     {},
     {_pos = getPos _target; deleteVehicle _target; [_pos, 0, SelectRandom MACVfobs] remoteExec ["BIS_fnc_objectsMapper", 2]; [west, _pos, "LP/OP"] remoteExec ["BIS_fnc_addRespawnPosition",2]},
     {},
     [],
     15,
     1000,
     true,
     false,
     true] call BIS_fnc_holdActionAdd;
    hint "Deployable LP/OP purchased"
} else {hint "Insufficient funds"};