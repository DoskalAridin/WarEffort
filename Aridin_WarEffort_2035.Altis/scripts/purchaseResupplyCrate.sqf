if (BLUFORresource > 1) then {
    BLUFORresource = BLUFORresource - 1; publicVariable "BLUFORresource";
    private _LPOP = createVehicle ["B_supplyCrate_F", getMarkerPos "marker_LPOP", [], 0, "NONE"];
    hint "Resupply crate purchased"
} else {hint "Insufficient funds"};