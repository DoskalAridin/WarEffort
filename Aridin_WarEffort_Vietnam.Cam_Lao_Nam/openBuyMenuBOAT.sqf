
buyType = "BOAT";
createDialog "vicBuyMenu";

{
    _VicName = _x select 2;
    lbAdd [1500, _VicName];
} forEach listBOAT;
ctrlSetText [1005, str MACVresource];