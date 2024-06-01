if (BLUFORresource > 100) then {
    BLUFORresource = BLUFORresource - 100; publicVariable "BLUFORresource";
    private _LPOP = createVehicle ["B_Slingload_01_Cargo_F", getMarkerPos "marker_LPOP", [], 0, "NONE"];
    [_LPOP,
     "Deploy LP/OP",
     "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa",
     "\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_unloaddevice_ca.paa",
     "(getPos _target inArea 'markerHQ') == false && _this distance _target < 6",
     true,
     {},
     {},
     {_pos = getPos _target; deleteVehicle _target; [_pos, 0, SelectRandom BLUFORfobs] remoteExec ["BIS_fnc_objectsMapper", 2]; [west, _pos, "LP/OP"] remoteExec ["BIS_fnc_addRespawnPosition",2]},
     {},
     [],
     15,
     1000,
     true,
     false,
     true] call BIS_fnc_holdActionAdd;
    hint "Deployable LP/OP purchased"
} else {hint "Insufficient funds"};