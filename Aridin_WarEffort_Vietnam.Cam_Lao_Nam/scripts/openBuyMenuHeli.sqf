
buyType = "heli";
createDialog "vicBuyMenu";

{
    private _VicName = _x select 2;
    lbAdd [1500, _VicName];
} forEach listHeli;
ctrlSetText [1005, str MACVresource];