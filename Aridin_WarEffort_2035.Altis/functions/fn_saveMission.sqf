/*
	Author: Doskal Aridin

	Description:
		Saves the resource value to server

	Returns:
		true

	Examples:
		 remoteExec ["ARDN_fnc_saveMission", 2];
*/

missionProfileNamespace setVariable ["BLUFORresource", BLUFORresource];
missionProfileNamespace setVariable ["AO_enemyStrength", AO_enemyStrength];
missionProfileNamespace setVariable ["BLUFORterritory", BLUFORterritory];
saveMissionProfileNamespace;
diag_log "MISSION: Mission Saved!";
diag_log format ["MISSION: Resources: %1", BLUFORresource];
diag_log format ["MISSION: Enemy Strength: %1", AO_enemyStrength];
diag_log format ["MISSION: Captured Territory: %1", BLUFORterritory];

true;