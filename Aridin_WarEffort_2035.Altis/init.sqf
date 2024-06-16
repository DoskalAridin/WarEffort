#include "config\compats.hpp"
#include "config\arrays.hpp"

ArsenalBoxes = [ArsenalBox,ArsenalBox_1,ArsenalBox_2];
[ArsenalBoxes] execVM "scripts\addArsenals.sqf";

// Mission parameters
WarEffortDifficulty = "WarEffortDifficulty" call BIS_fnc_getParamValue;
if (WarEffortDifficulty == 0) then {
    WarEffortDifficulty = -4;
} else {
    if (WarEffortDifficulty == 2) then {
        WarEffortDifficulty = 0;
    } else {
        WarEffortDifficulty = 4;
    };
};
hardcoreMode = false;
if ("hardcoreMode" call BIS_fnc_getParamValue == 1) then {
    hardcoreMode = true;
};
AO_size = "AO_size" call BIS_fnc_getParamValue;
missionReward = "missionReward" call BIS_fnc_getParamValue;
deathPenalty = ("deathPenalty" call BIS_fnc_getParamValue) / 10;
enemyStrengthMissionSuccessReward = ("enemyStrengthMissionSuccessReward" call BIS_fnc_getParamValue) / 10;
enemyStrengthMissionFailPenalty = ("enemyStrengthMissionFailPenalty" call BIS_fnc_getParamValue) / 10;
manualSideMissions = false;
if ("manualSideMissions" call BIS_fnc_getParamValue == 1) then {
    manualSideMissions = true
};
AIlimit = "AIlimit" call BIS_fnc_getParamValue;

commanderZeus = true;
if ("commanderZeus" call BIS_fnc_getParamValue == 0) then {
    commanderZeus = false
};
adminMainOps = true;
if ("adminMainOps" call BIS_fnc_getParamValue == 0) then {
    adminMainOps = false
};

// Setup global variables
OperationActive = false;
OperationAA = false;
OperationArty = false;
OperationOfficer = false;
OperationArea = false;
ObjectiveCount = 1;
objectivesActive = 0;
primaryAO = "";
operationAO = "";
activeAOs = [];
cleanAOs = [];

OPFORreserves = 0;

cmdr setVariable ["isCommander", true, true];
// Faction defaults
opfor_sl = "O_Soldier_SL_F";
array_infantry = array_soldier_CSAT;
array_vehicles = array_vehicles_CSAT;
array_aa = array_aa_CSAT;
array_arty = array_arty_CSAT;
array_BOAT = array_BOAT_CSAT;
array_air = array_heli_CSAT;

blufor_sl = "B_Soldier_SL_F";
array_infantry_BLUFOR = array_soldier_NATO;
array_vehicles_BLUFOR = array_vehicles_NATO;
array_aa_BLUFOR = array_aa_NATO;
array_arty_BLUFOR = array_arty_NATO;
array_BOAT_BLUFOR = array_BOAT_NATO;
array_air_BLUFOR = array_heli_NATO;

// Load saved variabled from server
if (isServer) then {
    BLUFORresource = missionProfileNamespace getVariable ["BLUFORresource", 20];
    diag_log format ["MISSION: Available resources: %1", BLUFORresource];
    publicVariable "BLUFORresource";
    BLUFORterritory = missionProfileNamespace getVariable ["BLUFORterritory", ["markerHQ"]];
    publicVariable "BLUFORterritory";
    AOmarkersMain = AOmarkersMain - BLUFORterritory;
    publicVariable "AOmarkersMain";
    AO_enemyStrength = missionProfileNamespace getVariable ["AO_enemyStrength", 1];
    diag_log format ["MISSION: Enemy Strength: %1", BLUFORresource];
    publicVariable "AO_enemyStrength";
    
    // Reinforcement loop
    [] spawn {
        while {true} do {
            private _AIlimit = AIlimit + (count activeAOs * 0.5);
            if (count units east < _AIlimit && OPFORreserves > 0) then {
                if (operationAO != "") then {
                    private _AOpos = getMarkerPos operationAO;
                    [_AOpos] remoteExec ["ARDN_fnc_reinforce", 2];
                } else {
                    if (count activeAOs != 0) then {
                        private _AOpos = getMarkerPos selectRandom activeAOs;
                        [_AOpos] remoteExec ["ARDN_fnc_reinforce", 2];
                    };
                };
            };
            sleep 120;
        };
    };
};

private _carrierSpawnPos = ["spawnPoint_carrier","spawnPoint_carrier_1","spawnPoint_carrier_2","spawnPoint_carrier_3"];
{
    private _pos = MarkerPos _x;
    _pos set [2, 209.498];
    _x setMarkerPos _pos;
} forEach _carrierSpawnPos;

// Hide and show map markers
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
} forEach BLUFORterritory;

player createDiarySubject ["WarEffort", "War Effort"];
player createDiaryRecord [
    "WarEffort", 
    [
        "Side Objectives",
        "Destroy ammo cache:<br/>Straight forward objective. Simply find and destroy the enemy’s ammo cache hidden somewhere in the area.<br/><br/>Eliminate enemy officer:<br/>Enemy officer is in the area, find and eliminate him.<br/>Alternatively, capture and bring him to <marker name='marker_Processing'>Processing</marker>.<br/><br/>Rescue POW:<br/>A friendly has been captured. Locate and extract him back to base.<br/>Bring him to <marker name='marker_Processing'>Processing</marker> to complete the objective.<br/><br/>Recover downed Pilot:<br/>A friendly pilot has been shot down. Locate the wreck, and search the area for the pilot.</br>Extract him and bring him to <marker name='marker_Processing'>Processing</marker> to complete the objective.<br/>The pilot is unlikely to stay near the wreckage, SOP will have him dropping purple smoke once in a safer location."
    ], 
    taskNull, 
    "", 
    true
];
player createDiaryRecord [
    "WarEffort", 
    [
        "Base Guide",
        "<marker name='marker_Helicopters'>Fixed Wing, Rotarty and UAV shop</marker><br/><marker name='marker_GroundVehicles'>Ground vehicle shop, field respawn, resupply crates and soldier training</marker><br/><marker name='marker_medical'>Medical Cargo House:</marker> Provides an instant full heal.<br/><marker name='marker_mess'>Food tables:</marker> Restores hunger and thurst if ACE field rations are enabled.<br/><br/><marker name='marker_Processing'>Processing:</marker> Bring recovered POWs, downed pilots and captured enemy officers here to secure them and complete related objectives.<br/><marker name='marker_operations'>Operations:</marker> Purchase USS Liberty rearm, and the commander can purchase friendly AI units (command them with Arma 3's High Command). The Commander or admin can start a main operation from here."
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