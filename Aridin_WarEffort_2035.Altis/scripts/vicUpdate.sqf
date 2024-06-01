
private _index = lbCurSel 1500;

private _array = [];

switch (buyType) do
{
    case "carrier": { _array = listCarrier };
    case "BOAT": { _array = listBOAT };
	case "ground": { _array = listGround };
	case "fixedWing": { _array = listFixedWing };
    case "UAV": { _array = listUAV };
	default { _array = listHeli };
};

private _vicClass = _array select _index select 0;
private _vicCost = _array select _index select 1;
private _picture = getText (configFile >> "CfgVehicles" >> _vicClass >> "editorPreview");

ctrlSetText [1002, str _vicCost];
ctrlSetText [1200, _picture];
ctrlSetText [1005, str BLUFORresource];