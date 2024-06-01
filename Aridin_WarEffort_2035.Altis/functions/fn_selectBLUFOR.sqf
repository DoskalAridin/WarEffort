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

private _selectedFaction = selectRandom array_factions;

switch (_selectedFaction) do
{
	default {
		blufor_sl = "B_Soldier_SL_F";
		array_infantry_BLUFOR = array_soldier_NATO;
		array_vehicles_BLUFOR = array_vehicles_NATO;
		array_aa_BLUFOR = array_aa_NATO;
		array_arty_BLUFOR = array_arty_NATO;
        array_BOAT_BLUFOR = array_BOAT_NATO;
        array_air_BLUFOR = array_heli_NATO;
        if (_AO_enemyStrength > 5) then {
            array_vehicles_BLUFOR append array_vehicles_strong_NATO;
            array_aa_BLUFOR append array_aa_strong_NATO;
            array_arty_BLUFOR append array_arty_strong_NATO;
            array_air_BLUFOR append array_heli_strong_NATO;
        };
	};
};
_selectedFaction