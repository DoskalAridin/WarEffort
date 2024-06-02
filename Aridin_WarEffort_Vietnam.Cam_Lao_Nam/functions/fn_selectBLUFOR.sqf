/*
	Author: Doskal Aridin

	Description:
		selects random BLUFOR faction
        
    Parameters:
        0 - position

	Returns:
		STRING - selected faction

	Examples:
		call ARDN_fnc_selectBLUFOR;
*/

private _selectedFactionBLUFOR = selectRandom array_factions_blufor;

switch (_selectedFactionBLUFOR) do
{
    default {
        blufor_sl = "vn_b_men_army_02";
		array_infantry_blufor = array_soldier_Army;
		array_vehicles_blufor = array_vehicles_Army;
		array_aa_blufor = array_aa_Army;
		array_arty_blufor = array_arty_Army;
        array_BOAT_blufor = array_BOAT_macv;
        array_air_blufor = array_air_Army;
    };
    case "USMC": {
        blufor_sl = "vn_b_men_usmc_68_02";
		array_infantry_blufor = array_soldiers_usmc;
		array_vehicles_blufor = array_vehicles_usmc;
		array_aa_blufor = array_aa_usmc;
		array_arty_blufor = array_arty_usms;
        array_BOAT_blufor = array_BOAT_macv;
        array_air_blufor = array_air_usmc;
    };
    case "SOG": {
        blufor_sl = "vn_b_men_sog_04";
		array_infantry_blufor = array_soldiers_SOG;
		array_vehicles_blufor = array_vehicles_SOG;
		array_aa_blufor = array_aa_SOG;
		array_arty_blufor = array_arty_SOG;
        array_BOAT_blufor = array_BOAT_macv;
        array_air_blufor = array_air_SOG;
    };
};
_selectedFaction