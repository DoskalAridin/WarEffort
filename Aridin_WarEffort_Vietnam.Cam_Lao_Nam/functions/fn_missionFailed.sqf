/*
	Author: Doskal Aridin

	Description:
		Handles events that occur when an Objective fails

	Returns:
		true

	Examples:
		 [unit] remoteExec ["ARDN_fnc_missionFailed"];
*/
params ["_obj"];

private _objectiveAO = _obj getVariable "objectiveAO";
private _objectiveNumber = _obj getVariable "objectiveNumber";
[format ["Objective_%1",str _objectiveNumber] ,"FAILED"] call BIS_fnc_taskSetState;
objectivesActive = objectivesActive - 1;
publicVariable "objectivesActive";

cleanAOs pushbackUnique _objectiveAO; publicVariable "cleanAOs";

AO_enemyStrength = AO_enemyStrength + enemyStrengthMissionFailPenalty;
if (AO_enemyStrength > 5) then {AO_enemyStrength = 5};
publicVariable "AO_enemyStrength";