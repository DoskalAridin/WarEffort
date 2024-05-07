#include "config\arsenal.hpp"
#include "config\arrays.hpp"

//Variables, can be changed
AO_size = 500;
missionReward = 10;
deathPenalty = 0.2;

if (isServer) then {
    MACVresource = missionProfileNamespace getVariable ["MACVresource", 20];
    diag_log format ["MISSION: Available resources: %1", MACVresource];
    publicVariable "MACVresource";
    MACVterritory = missionProfileNamespace getVariable ["MACVterritory", ["markerHQ"]];
    publicVariable "MACVterritory";
    AOmarkersMain = AOmarkersMain - MACVterritory;
    publicVariable "AOmarkersMain";
    AO_enemyStrength = missionProfileNamespace getVariable ["AO_enemyStrength", 1];
    diag_log format ["MISSION: Enemy Strength: %1", MACVresource];
    publicVariable "AO_enemyStrength";
};

if (hasInterface) then {
	[] spawn {
		waitUntil {alive player};
		player setUnitTrait ["camouflageCoef", 0.7];
		player setUnitTrait ["audibleCoef", 0.5];
	};
};

OperationActive = false;
OperationAA = false;
OperationArty = false;
OperationOfficer = false;
OperationArea = false;
ObjectiveCount = 1;
objectivesActive = 0;
primaryAO = "ao_0";
activeAOs = [];
cleanAOs = [];

{
    _x setMarkerAlpha 0;
} forEach enemyStrengthMarker_high;
{
    _x setMarkerAlpha 0;
} forEach enemyStrengthMarker_low;

{
    _x setMarkerAlpha 0;
} forEach AOmarkersMain;
{
  _x setMarkerAlpha 0.5;  
} forEach MACVterritory;

player createDiarySubject ["WarEffort", "War Effort"];
player createDiaryRecord [
    "WarEffort", 
    [
        "Side Objectives",
        "Destroy ammo cache:<br/>Straight forward objective. Simply find and destroy the enemy’s ammo cache hidden somewhere in the area.<br/><br/>Eliminate enemy officer:<br/>Enemy officer is in the area, find and eliminate him.<br/>Alternatively, capture and bring him to <marker name='marker_Processing'>Processing</marker>.<br/><br/>Sabotage enemy ammo supply:<br/>Locate an ammo truck in the area. Simply leave a Mine Ammobox (booby-trapped) next to it to complete the objective.<br/><br/>Rescue POW:<br/>A friendly has been captured. Locate and extract him back to base.<br/>Bring him to <marker name='marker_Processing'>Processing</marker> to complete the objective.<br/><br/>Recover downed Pilot:<br/>A friendly pilot has been shot down. Locate the wreck, and search the area for the pilot.</br>Extract him and bring him to <marker name=’marker_Processing’>Processing</marker> to complete the objective.<br/>The pilot is unlikely to stay near the wreckage, SOP will have him dropping purple smoke once in a safer location."
    ], 
    taskNull, 
    "", 
    true
];
player createDiaryRecord [
    "WarEffort", 
    [
        "Base Guide",
        "Virtual arsenals can be found at marked S4 logistics buildings, <marker name='marker_S4'>here</marker> and <marker name='marker_S4_1'>here</marker>. As well as at every vehicle shop.<br/><marker name='marker_Helicopters'>Helicopter shop</marker><br/><marker name='marker_GroundVehicles'>Ground vehicle shop</marker><br/><marker name='marker_FixedWing'>Fixed wing shop</marker><br/><marker name='marker_BOAT'>Boat shop</marker><br/><br/>Bring recovered POWs, downed pilots and captured enemy officers to <marker name='marker_Processing'>Processing</marker> to secure them and complete related objectives.<br/><br/><marker name='marker_operations'>Operations:</marker> The Commander or admin can start a main operation here."
    ], 
    taskNull, 
    "", 
    true
];
player createDiaryRecord [
    "WarEffort", 
    [
        "Overview",
        "Welcome to War Effort!<br/><br/>The enemy never sleeps, and there's a constant need for action.<br/>Priority Targets to hit and friendly forces to assist, keep hitting the enemy and prepare for a major operation to claim territory.<br/><br/>War Effort will maintain a couple side objectives for players to continually complete, generating only when all players are at base. Completing these will reward the team with resources to spend on vehicles and extra firepower, and additionally will lower the enemy’s strength.<br/>Objective failure and player deaths will gradually increase enemy strength.<br/><br/>Once your team feels ready, request a main operation; requiring multiple objectives to complete, you’ll need a coordinated team and sufficient firepower to succeed.<br/>Completing the operation will put the area under friendly control, expanding the area of operations for all missions."
    ], 
    taskNull, 
    "", 
    true
];