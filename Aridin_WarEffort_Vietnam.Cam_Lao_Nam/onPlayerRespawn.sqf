player setUnitTrait ["camouflageCoef", 0.7];
player setUnitTrait ["audibleCoef", 0.5];
AO_enemyStrength = AO_enemyStrength + deathPenalty;
if (AO_enemyStrength > 10) then {
    AO_enemyStrength = 10;
    publicVariable "AO_enemyStrength";
};
diag_log format ["MISSION: Enemy strength increased to %1!", AO_enemyStrength];