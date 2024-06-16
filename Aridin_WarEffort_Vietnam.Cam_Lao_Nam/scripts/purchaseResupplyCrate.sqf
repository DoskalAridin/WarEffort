if (MACVresource > 1) then {
    MACVresource = MACVresource - 1; publicVariable "MACVresource";
    private _LPOP = createVehicle ["vn_b_ammobox_full_01", getMarkerPos "marker_LPOP", [], 0, "NONE"];
    hint "Resupply crate purchased"
} else {hint "Insufficient funds"};