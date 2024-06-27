private _index = lbCurSel 1500;
ctrlSetText [1005, str BLUFORresource];

private _array = [];
private _arrayMarkers = [];
private _spawnPos = [0,0,0];
private _spawnDir = 180;

switch (buyType) do
{
    case "BOAT": {_array = listBOAT; _spawnPos = getMarkerPos "spawnPoint_BOAT"; _arrayMarkers = ["spawnPoint_BOAT"];
    };
	case "ground": { _array = listGround; _spawnPos = getMarkerPos "spawnPoint_vic"; _spawnDir = markerDir "spawnPoint_vic"; _arrayMarkers = ["spawnPoint_vic","spawnPoint_vic_1","spawnPoint_vic_2"]};
	case "fixedWing": { _array = listFixedWing; _spawnPos = getMarkerPos "spawnPoint_plane"; _spawnDir = markerDir "spawnPoint_plane"; _arrayMarkers = ["spawnPoint_plane","spawnPoint_plane_1","spawnPoint_plane_2","spawnPoint_plane_3"]};
    case "UAV": { _array = listUAV; _spawnPos = getMarkerPos "spawnPoint_plane"; _spawnDir = markerDir "spawnPoint_plane"; _arrayMarkers = ["spawnPoint_plane","spawnPoint_plane_1","spawnPoint_plane_2","spawnPoint_plane_3"]};
    case "carrier": { _array = listCarrier; _spawnPos = getMarkerPos "spawnPoint_carrier"; _spawnDir = 213.617; _arrayMarkers = ["spawnPoint_carrier","spawnPoint_carrier_1","spawnPoint_carrier_2","spawnPoint_carrier_3"]};
	default { _array = listHeli; _spawnPos = getMarkerPos "spawnPoint_heli"; _spawnDir = markerDir "spawnPoint_heli"; _arrayMarkers = ["spawnPoint_heli","spawnPoint_heli_1","spawnPoint_heli_2","spawnPoint_heli_3","spawnPoint_heli_4"]};
};

_vicClass = _array select _index select 0;
_vicCost = _array select _index select 1;
_vicName = _array select _index select 2;

if (BLUFORresource >= _vicCost) then {
    BLUFORresource = BLUFORresource - _vicCost;
    publicVariable "BLUFORresource";
    private _vic = createVehicle [_vicClass, _spawnPos, _arrayMarkers, 0, "NONE"];
    if (buyType == "UAV") then {
        createVehicleCrew _vic;
    };
    _vic setDir _spawnDir;
    closeDialog 1;
    hint format ["%1 Purchased", _vicName];
} else {
    hint "Insuficent funds";
};