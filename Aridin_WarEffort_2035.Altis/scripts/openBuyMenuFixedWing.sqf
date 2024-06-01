
buyType = "fixedWing";
createDialog "vicBuyMenu";

{
    private _VicName = _x select 2;
    lbAdd [1500, _VicName];
} forEach listFixedWing;
ctrlSetText [1005, str BLUFORresource];