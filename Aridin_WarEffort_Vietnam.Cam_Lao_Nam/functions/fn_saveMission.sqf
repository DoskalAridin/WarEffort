/*
	Author: Doskal Aridin

	Description:
		Saves the resource value to server

	Returns:
		true

	Examples:
		 remoteExec ["ARDN_fnc_saveMission", 2];
*/

missionProfileNamespace setVariable ["MACVresource", MACVresource];
missionProfileNamespace setVariable ["AO_enemyStrength", AO_enemyStrength];
missionProfileNamespace setVariable ["MACVterritory", MACVterritory];
saveMissionProfileNamespace;
diag_log "MISSION: Mission Saved!";
diag_log format ["MISSION: Resources: %1", MACVresource];
diag_log format ["MISSION: Enemy Strength: %1", AO_enemyStrength];
diag_log format ["MISSION: Captured Territory: %1", MACVterritory];

true;