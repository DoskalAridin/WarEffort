private _index = lbCurSel 1500;
ctrlSetText [1005, str MACVresource];

private _array = [];
private _arrayMarkers = [];
private _spawnPos = [0,0,0];
private _spawnDir = 180;

switch (buyType) do
{
    case "BOAT": {_array = listBOAT; _spawnPos = getMarkerPos "spawnPoint_BOAT"; _arrayMarkers = ["spawnPoint_BOAT","spawnPoint_BOAT_1","spawnPoint_BOAT_2","spawnPoint_BOAT_3","spawnPoint_BOAT_4","spawnPoint_BOAT_5","spawnPoint_BOAT_6"];
    _spawnDir = 0;
    };
	case "ground": { _array = listGround; _spawnPos = getMarkerPos "spawnPoint_vic"; _arrayMarkers = ["spawnPoint_vic","spawnPoint_vic_1","spawnPoint_vic_2"]};
	case "fixedWing": { _array = listFixedWing; _spawnPos = getMarkerPos "spawnPoint_plane"; _arrayMarkers = ["spawnPoint_plane","spawnPoint_plane_1","spawnPoint_plane_2","spawnPoint_plane_3"]};
	default { _array = listHeli; _spawnPos = getMarkerPos "spawnPoint_heli"; _arrayMarkers = ["spawnPoint_heli","spawnPoint_heli_1","spawnPoint_heli_2"]};
};

_vicClass = _array select _index select 0;
_vicCost = _array select _index select 1;
_vicName = _array select _index select 2;

if (MACVresource >= _vicCost) then {
    MACVresource = MACVresource - _vicCost;
    publicVariable "MACVresource";
    private _vic = createVehicle [_vicClass, _spawnPos, _arrayMarkers, 0, "NONE"];
    _vic setDir _spawnDir;
    closeDialog 1;
    hint format ["%1 Purchased", _vicName];
} else {
    hint "Insuficent funds";
};