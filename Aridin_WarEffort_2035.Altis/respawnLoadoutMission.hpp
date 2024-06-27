/*
	Author: Doskal Aridin

	Description:
		Sets up arsenal saved respawn loadout, saved to mission.
		
	Examples:
		initPlayerLocal.sqf:
		ARDN_respawnLoadoutName = "respawnLoadout";
		#include "respawnLoadoutMission.hpp"

*/
_varName = ARDN_respawnLoadoutName regexReplace ["[^a-zA-Z0-9]",""];
ARDN_varName = format ["ARDN_%1",_varName];	

player setVariable ["ARDN_defaultKit", getUnitLoadout player];

player setVariable [format ["%1_%2", getPlayerUID player, ARDN_varName], missionProfileNamespace getVariable format ["%1_%2", getPlayerUID player, ARDN_varName]];
player addEventHandler ["Respawn", {
	if (isNil {player getVariable format ["%1_%2", getPlayerUID player, ARDN_varName]}) then {
		player setUnitLoadout (player getVariable "ARDN_defaultKit");
		systemChat "Loading default loadout";
	}
	else {
		player setUnitLoadout (player getVariable format ["%1_%2", getPlayerUID player, ARDN_varName]);
		systemChat "Loading saved loadout";
	};
}];
		
["ace_arsenal_displayClosed", {
	player setVariable [format ["%1_%2", getPlayerUID player, ARDN_varName], getUnitLoadout player];
	systemChat "Respawn loadout saved";
	missionProfileNamespace setVariable [format ["%1_%2", getPlayerUID player, ARDN_varName], getUnitLoadout player];
	saveMissionProfileNamespace;
	systemChat "Loadout saved to mission";
    execVM "scripts\disableUAVs.sqf";
}] call CBA_fnc_addEventHandler;

[missionNamespace, "arsenalClosed", {
	player setVariable [format ["%1_%2", getPlayerUID player, ARDN_varName], getUnitLoadout player];
	systemChat "Respawn loadout saved";
	missionProfileNamespace setVariable [format ["%1_%2", getPlayerUID player, ARDN_varName], getUnitLoadout player];
	saveMissionProfileNamespace;
	systemChat "Loadout saved to mission";
    execVM "scripts\disableUAVs.sqf";
}] call BIS_fnc_addScriptedEventHandler;