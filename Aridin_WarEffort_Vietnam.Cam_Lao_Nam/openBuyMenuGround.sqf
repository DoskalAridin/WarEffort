
buyType = "ground";
createDialog "vicBuyMenu";

{
    _VicName = _x select 2;
    lbAdd [1500, _VicName];
} forEach listGround;
ctrlSetText [1005, str MACVresource];