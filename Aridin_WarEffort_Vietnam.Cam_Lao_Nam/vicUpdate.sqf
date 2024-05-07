
_index = lbCurSel 1500;

_array = [];

switch (buyType) do
{
    case "BOAT": { _array = listBOAT };
	case "ground": { _array = listGround };
	case "fixedWing": { _array = listFixedWing };
	default { _array = listHeli };
};

_vicClass = _array select _index select 0;
_vicCost = _array select _index select 1;
_picture = getText (configFile >> "CfgVehicles" >> _vicClass >> "editorPreview");

ctrlSetText [1002, str _vicCost];
ctrlSetText [1200, _picture];
ctrlSetText [1005, str MACVresource];