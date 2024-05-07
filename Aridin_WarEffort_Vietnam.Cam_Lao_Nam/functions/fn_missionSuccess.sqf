/*
	Author: Doskal Aridin

	Description:
		Handles events that occur when an Objective completes

	Returns:
		true

	Examples:
		 [unit] remoteExec ["ARDN_fnc_missionSuccess"];
*/
params ["_obj"];

_objectiveAO = _obj getVariable "objectiveAO";
_objectiveNumber = _obj getVariable "objectiveNumber";
[format ["Objective_%1",str _objectiveNumber] ,"SUCCEEDED"] call BIS_fnc_taskSetState;
objectivesActive = objectivesActive - 1;
publicVariable "objectivesActive";

MACVresource = floor (MACVresource + missionReward);
publicVariable "MACVresource";

AO_enemyStrength = AO_enemyStrength - 0.5;
if (AO_enemyStrength < 1) then {AO_enemyStrength = 1};
publicVariable "AO_enemyStrength";

cleanAOs pushbackUnique _objectiveAO; publicVariable "cleanAOs";
[] remoteExec ["ARDN_fnc_saveMission", 2];