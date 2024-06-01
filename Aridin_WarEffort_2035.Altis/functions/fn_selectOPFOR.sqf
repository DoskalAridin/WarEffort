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
	case "CSAT SF": {
		opfor_sl = "O_recon_TL_F";
		array_infantry = array_soldier_CSATSF;
		array_vehicles = array_vehicles_CSAT;
		array_aa = array_aa_CSAT;
		array_arty = array_arty_CSAT;
        array_BOAT = array_BOAT_CSAT;
        array_air = array_heli_CSAT;
        if (_AO_enemyStrength > 5) then {
            array_vehicles append array_vehicles_strong_CSAT;
            array_aa append array_aa_strong_CSAT;
            array_arty append array_arty_strong_CSAT;
            array_air append array_heli_strong_CSAT;
        };
	};
	case "Spetsnaz": {
		opfor_sl = "O_R_Soldier_TL_F";
		array_infantry = array_soldier_Spetsnaz;
		array_vehicles = array_vehicles_CSAT;
		array_aa = array_aa_CSAT;
		array_arty = array_arty_CSAT;
        array_BOAT = array_BOAT_CSAT;
        array_air = array_heli_CSAT;
        if (_AO_enemyStrength > 5) then {
            array_vehicles append array_vehicles_strong_CSAT;
            array_aa append array_aa_strong_CSAT;
            array_arty append array_arty_strong_CSAT;
            array_air append array_heli_strong_CSAT;
        };
	};
	default {
		opfor_sl = "O_Soldier_SL_F";
		array_infantry = array_soldier_CSAT;
		array_vehicles = array_vehicles_CSAT;
		array_aa = array_aa_CSAT;
		array_arty = array_arty_CSAT;
        array_BOAT = array_BOAT_CSAT;
        array_air = array_heli_CSAT;
        if (_AO_enemyStrength > 5) then {
            array_vehicles append array_vehicles_strong_CSAT;
            array_aa append array_aa_strong_CSAT;
            array_arty append array_arty_strong_CSAT;
            array_air append array_heli_strong_CSAT;
        };
	};
};
_selectedFaction