/*
	Author: Doskal Aridin

	Description:
		selects random OPFOR faction
        
    Parameters:
        0 - position

	Returns:
		STRING - selected faction

	Examples:
		call ARDN_fnc_selectOPFOR;
*/

private _selectedFaction = selectRandom array_factions;

switch (_selectedFaction) do
{
	case "PAVN": {
		opfor_sl = "vn_o_men_nva_15";
		array_infantry = array_soldier_PAVN;
		array_vehicles = array_vehicles_PAVN;
		array_aa = array_aa_PAVN;
		array_arty = array_arty_PAVN;
        array_BOAT = array_BOAT_VC;
        array_air = array_heli_PAVN;
        if (_AO_enemyStrength > 5) then {
            array_vehicles append array_vehicles_strong_PAVN;
            array_aa append array_aa_strong_PAVN;
            array_arty append array_arty_strong_PAVN;
            array_BOAT append array_BOAT_PAVN;
        };
	};
	case "DacCong": {
		opfor_sl = "vn_o_men_nva_dc_01";
		array_infantry = array_soldier_DacCong;
		array_vehicles = array_vehicles_VC;
		array_aa = array_aa_VC;
		array_arty = array_arty_VC;
        array_BOAT = array_BOAT_VC;
        array_air = array_heli_PAVN;
        if (_AO_enemyStrength > 5) then {
            array_vehicles append array_vehicles_strong_VC;
            array_aa append array_aa_strong_VC;
            array_arty append array_arty_strong_VC;
            array_BOAT append array_BOAT_PAVN;
        };
	};
	default {
		opfor_sl = "vn_o_men_vc_01";
		array_infantry = array_soldier_VC;
		array_vehicles = array_vehicles_VC;
		array_aa = array_aa_VC;
		array_arty = array_arty_VC;
        array_BOAT = array_BOAT_VC;
        array_air = array_heli_PAVN;
        if (_AO_enemyStrength > 5) then {
            array_vehicles append array_vehicles_strong_VC;
            array_aa append array_aa_strong_VC;
            array_arty append array_arty_strong_VC;
            array_BOAT append array_BOAT_PAVN;
        };
	};
};
_selectedFaction