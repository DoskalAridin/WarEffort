array_factions = ["CSAT","CSAT SF","Spetsnaz"];
array_factions_blufor = ["NATO"];

array_heliTransport = ["O_Heli_Transport_04_covered_F", "O_Heli_Light_02_unarmed_F"];

array_soldier_CSAT = ["O_Soldier_SL_F", 
"O_Soldier_TL_F", 
"O_Soldier_AR_F", 
"O_medic_F", 
"O_engineer_F", 
"O_soldier_exp_F", 
"O_Soldier_GL_F", 
"O_HeavyGunner_F", 
"O_soldier_M_F", 
"O_soldier_mine_F", 
"O_Soldier_AA_F", 
"O_Soldier_AT_F", 
"O_soldier_repair_F", 
"O_Soldier_F", 
"O_Soldier_LAT_F", 
"O_Soldier_HAT_F", 
"O_Sharpshooter_F"];

array_vehicles_CSAT = ["O_MRAP_02_gmg_F", 
"O_MRAP_02_hmg_F", 
"O_LSV_02_AT_F", 
"O_APC_Wheeled_02_rcws_v2_F", 
"O_LSV_02_armed_F"];
array_vehicles_strong_CSAT = ["O_APC_Tracked_02_cannon_F",  
"O_MBT_02_cannon_F", 
"O_MBT_02_railgun_F", 
"O_MBT_04_cannon_F", 
"O_MBT_04_command_F"];

array_aa_CSAT = ["O_static_AA_F"];
array_aa_strong_CSAT = ["O_APC_Tracked_02_AA_F", 
"O_Radar_System_02_F"];

array_arty_CSAT = ["O_Mortar_01_F"];
array_arty_strong_CSAT = ["O_MBT_02_arty_F"];

array_BOAT_CSAT = ["O_Boat_Armed_01_hmg_F"];

array_heli_CSAT = ["O_Heli_Light_02_dynamicLoadout_F"];
array_heli_strong_CSAT = ["O_Heli_Attack_02_dynamicLoadout_F"];

array_soldier_CSATSF = ["O_recon_TL_F", 
"O_recon_F", 
"O_recon_LAT_F", 
"O_Pathfinder_F", 
"O_recon_medic_F", 
"O_recon_M_F", 
"O_recon_JTAC_F", 
"O_recon_exp_F", 
"O_sniper_F"];

array_soldier_Spetsnaz = ["O_R_Soldier_TL_F", 
"O_R_Soldier_LAT_F", 
"O_R_soldier_M_F", 
"O_R_JTAC_F", 
"O_R_Soldier_GL_F", 
"O_R_soldier_exp_F", 
"O_R_medic_F", 
"O_R_Soldier_AR_F"];

array_soldier_Viper = ["O_V_Soldier_TL_hex_F", 
"O_V_Soldier_LAT_hex_F", 
"O_V_Soldier_Medic_hex_F", 
"O_V_Soldier_hex_F", 
"O_V_Soldier_M_hex_F", 
"O_V_Soldier_JTAC_hex_F", 
"O_V_Soldier_Exp_hex_F"];

array_traps = ["APERSBoundingMine", 
"APERSMine"];

array_ied = ["ATMine",
"IEDUrbanBig_F", 
"IEDUrbanSmall_F"];

array_soldier_NATO = ["B_Soldier_SL_F", 
"B_Soldier_TL_F", 
"B_soldier_AR_F", 
"B_medic_F", 
"B_engineer_F", 
"B_soldier_exp_F", 
"B_Soldier_GL_F", 
"B_HeavyGunner_F", 
"B_soldier_M_F", 
"B_soldier_mine_F", 
"B_soldier_AA_F", 
"B_soldier_AT_F", 
"B_soldier_repair_F", 
"B_Soldier_F", 
"B_soldier_LAT_F", 
"B_soldier_LAT2_F", 
"B_Sharpshooter_F"];

array_vehicles_NATO = ["B_MRAP_01_gmg_F", 
"B_MRAP_01_hmg_F", 
"B_LSV_01_AT_F", 
"B_LSV_01_armed_F",
"B_APC_Wheeled_01_cannon_F"];
array_vehicles_strong_NATO = ["B_APC_Tracked_01_CRV_F", 
"B_APC_Tracked_01_rcws_F", 
"B_AFV_Wheeled_01_cannon_F", 
"B_MBT_01_cannon_F", 
"B_AFV_Wheeled_01_up_cannon_F", 
"B_MBT_01_TUSK_F"];

array_aa_NATO = ["B_static_AA_F"];
array_aa_strong_NATO = ["B_APC_Tracked_01_AA_F"];

array_arty_NATO = ["B_Mortar_01_F"];
array_arty_strong_NATO = ["B_MBT_01_arty_F", 
"B_MBT_01_mlrs_F"];

array_BOAT_NATO = ["B_Boat_Armed_01_minigun_F"];

array_heli_NATO = ["B_Heli_Light_01_dynamicLoadout_F"];
array_heli_strong_NATO = ["B_Heli_Attack_01_dynamicLoadout_F"];


AOmarkers = [];
{	
   _currMarker = toArray _x;
  
   if(count _currMarker >= 3) then {
      _currMarker resize 3;
      _currMarker = toString _currMarker;
      if(_currMarker == "ao_") then{
         AOmarkers append [_x];
      };
   };
} foreach allMapMarkers;

AOmarkersMain = [];
{	
   _currMarker = toArray _x;
  
   if(count _currMarker >= 8) then {
      _currMarker resize 8;
      _currMarker = toString _currMarker;
      if(_currMarker == "ao_main_") then{
         AOmarkersMain append [_x];
      };
   };
} foreach allMapMarkers;

enemyStrengthMarker_high = [];
{	
   _currMarker = toArray _x;
  
   if(count _currMarker >= 19) then {
      _currMarker resize 19;
      _currMarker = toString _currMarker;
      if(_currMarker == "enemystrength_high_") then{
         enemyStrengthMarker_high append [_x];
      };
   };
} foreach allMapMarkers;

enemyStrengthMarker_low = [];
{	
   _currMarker = toArray _x;
  
   if(count _currMarker >= 18) then {
      _currMarker resize 18;
      _currMarker = toString _currMarker;
      if(_currMarker == "enemystrength_low_") then{
         enemyStrengthMarker_low append [_x];
      };
   };
} foreach allMapMarkers;

listHeli = 
[
    ["B_Heli_Light_01_F", 0], 
    ["B_Heli_Light_01_dynamicLoadout_F", 5], 
    ["B_Heli_Transport_01_F", 0], 
    ["B_Heli_Transport_03_F", 0], 
    ["B_Heli_Attack_01_dynamicLoadout_F", 15]
];

listGround = 
[
    ["B_Quadbike_01_F", 0], 
    ["B_LSV_01_unarmed_F", 0], 
    ["B_LSV_01_armed_F", 0], 
    ["B_LSV_01_AT_F", 0], 
    ["B_MRAP_01_F", 0], 
    ["B_MRAP_01_gmg_F", 5], 
    ["B_MRAP_01_hmg_F", 5], 
    ["B_Truck_01_transport_F", 0], 
    ["B_Truck_01_covered_F", 0], 
    ["B_Truck_01_Repair_F", 0], 
    ["B_Truck_01_medical_F", 0], 
    ["B_Truck_01_fuel_F", 0], 
    ["B_Truck_01_ammo_F", 0],
    ["B_APC_Wheeled_01_cannon_F", 10],
    ["B_APC_Tracked_01_CRV_F", 10],
    ["B_APC_Tracked_01_rcws_F", 10],
    ["B_APC_Tracked_01_AA_F", 10],
    ["B_AFV_Wheeled_01_cannon_F", 15],
    ["B_AFV_Wheeled_01_up_cannon_F", 20],
    ["B_MBT_01_cannon_F", 20],
    ["B_MBT_01_TUSK_F", 25],
    ["B_MBT_01_arty_F", 20],
    ["B_MBT_01_mlrs_F", 20]
];
listFixedWing =
[
    ["B_Plane_CAS_01_dynamicLoadout_F", 30], 
    ["B_Plane_Fighter_01_F", 30], 
    ["B_Plane_Fighter_01_Stealth_F", 30],
    ["B_T_VTOL_01_armed_F", 30], 
    ["B_T_VTOL_01_infantry_F", 0], 
    ["B_T_VTOL_01_vehicle_F", 0]
];
listCarrier =
[ 
    ["B_Plane_Fighter_01_F", 20], 
    ["B_Plane_Fighter_01_Stealth_F", 20]
];
listBOAT =
[
    ["B_Boat_Transport_01_F", 0], 
    ["B_Boat_Armed_01_minigun_F", 0]
];
listUAV = [
    ["B_UGV_01_rcws_F", 10],
    ["B_UAV_02_dynamicLoadout_F", 15],
    ["B_UAV_05_F", 20],
    ["B_T_UAV_03_dynamicLoadout_F", 20]
];

if (compat_WS == true) then {
    private _WS_vic = [
        ["B_APC_Wheeled_01_command_lxWS", 5],
        ["B_APC_Wheeled_01_atgm_lxWS", 15],
        ["B_APC_Wheeled_01_mortar_lxWS",10]
    ];
    listGround append _WS_vic;
};

if (compat_RF == true) then {
    private _RF_vic = [
        ["B_Pickup_aat_rf", 0],
        ["B_Pickup_rf", 0], 
        ["B_Pickup_Comms_rf", 0], 
        ["B_Pickup_mmg_rf", 0]
    ];
    private _RF_heli = [
        ["B_Heli_light_03_dynamicLoadout_RF", 10], 
        ["B_Heli_light_03_unarmed_RF", 0],
        ["B_Heli_EC_03_RF", 5], 
        ["B_Heli_EC_04_military_RF", 0]
    ];
    listGround append _RF_vic;
    listHeli append _RF_heli;
};

if (compat_ARDNCAF == true) then {
    private _CAF_vic = [
        ["ARDN_CAF_MRAP", 0], 
        ["ARDN_CAF_MRAP_gmg", 5], 
        ["ARDN_CAF_MRAP_hmg", 5], 
        ["ARDN_CAF_APC", 10], 
        ["ARDN_CAF_MBT", 20]
    ];
    private _CAF_heli = [
        ["ARDN_CAF_Heli_light_unarmed", 0], 
        ["ARDN_CAF_Heli_light", 10], 
        ["ARDN_CAF_Heli_Transport_02", 0], 
        ["ARDN_CAF_Heli_Transport_03", 0]
    ];
    private _CAF_FixedWing = [
        ["ARDN_CAF_Plane_Fighter", 30]
    ];
    listGround append _CAF_vic;
    listHeli append _CAF_heli;
    listFixedWing append _CAF_FixedWing;
};

if (compat_ADFU == true) then {
    private _vic = [
        ["ADFU_armour_aslav_t1", 10]
    ];
    private _heli = [
        ["ADF_S70_E", 0], 
        ["ADF_S70_T", 0],
        ["ADF_S70", 0]
    ];
    listGround append _vic;
    listHeli append _heli;
};

{
    private _className = _x select 0;
    private _text = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
    _x pushBack _text;
    listHeli set [_forEachIndex, _x];
} forEach listHeli;
{
    private _className = _x select 0;
    private _text = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
    _x pushBack _text;
    listGround set [_forEachIndex, _x];
} forEach listGround;
{
    private _className = _x select 0;
    private _text = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
    _x pushBack _text;
    listFixedWing set [_forEachIndex, _x];
} forEach listFixedWing;
{
    private _className = _x select 0;
    private _text = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
    _x pushBack _text;
    listCarrier set [_forEachIndex, _x];
} forEach listCarrier;
{
    private _className = _x select 0;
    private _text = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
    _x pushBack _text;
    listBOAT set [_forEachIndex, _x];
} forEach listBOAT;
{
    private _className = _x select 0;
    private _text = getText (configFile >> "CfgVehicles" >> _className >> "displayName");
    _x pushBack _text;
    listUAV set [_forEachIndex, _x];
} forEach listUAV;

OpName1st = ["Crimson","Silver","Iron","Midnight","Golden","Azure","Jade","Ruby","Emerald","Cobalt","Crimson","Granite","Indigo","Sapphire","Amber","Obsidian","Steel","Ivory","Onyx"];
OpName2nd = ["Tiger","Rain","Eagle","Panther","Serpent","Storm","Falcon","Ridge","Thunder","Mirage","Tide","Peak","Dawn","Sky","Fury","Shadow","Cascade","Spear","Horizon"];

OPFORsiteAA = [
	["Land_HBarrier_Big_F",[3.5708,1.05664,0],270.004,1,0,[0,0],"","",true,false], 
	["O_Radar_System_02_F",[0.0170898,1.0127,-1.87827],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[-3.61426,1.11279,0],270.004,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[-0.269043,-4.07275,0],180.882,1,0,[0,0],"","",true,false], 
	["O_UAV_AI",[9.90088,-2.24463,2.17692],179.483,1,0,[0,-0],"","",true,false], 
	["O_UAV_AI",[0.0170898,1.0127,-0.0251875],0,1,0,[0,0],"","",true,false], 
	["O_SAM_System_04_F",[9.90088,-2.24463,-0.0750003],179.483,1,0,[0,-0],"","",true,false], 
	["O_SAM_System_04_F",[-10.7813,-1.99219,-0.0750003],179.483,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_Big_F",[-0.453125,13.2993,0],179.338,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_Big_F",[13.7725,-2.05176,0],270.004,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[-14.1909,-1.271,0],270.004,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Small_F",[14.644,3.94971,0],271.149,1,0,[0,0],"","",true,false], 
	["O_UAV_AI",[-10.7813,-1.99219,2.17692],179.483,1,0,[0,-0],"","",true,false], 
	["Land_BagBunker_Small_F",[-15.9785,5.03076,0],88.7751,1,0,[0,0],"","",true,false], 
	["O_APC_Tracked_02_AA_F",[-0.275391,-17.6128,0.105],181.737,1,0,[0,0],"","this disableAI 'MOVE';",true,false], 
	["CamoNet_OPFOR_F",[-12.8438,13.6445,0],315.038,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[-4.51904,-18.3286,0],87.4814,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[3.43262,-18.8672,0],277.101,1,0,[0,0],"","",true,false], 
	["CamoNet_OPFOR_F",[12.5815,14.7319,0],31.3722,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[-12.8921,14.7651,0],142.792,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_Big_F",[12.9502,15.6533,0],213.61,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[13.8999,-16.6372,0],125.634,1,0,[0,-0],"","",true,false], 
	["CamoNet_OPFOR_F",[13.5474,-17.2773,0],124.919,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_Big_F",[-0.630371,-22.3335,0],3.84082,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[-14.9561,-17.4023,0],235.377,1,0,[0,0],"","",true,false], 
	["CamoNet_OPFOR_F",[-15.3374,-18.3276,0],224.207,1,0,[0,0],"","",true,false]
];
OPFORsiteArty = [
	["Land_HBarrier_Big_F",[-7.4624,2.86914,0],228.843,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[8.28613,1.02344,0],123.291,1,0,[0,-0],"","",true,false], 
	["O_MBT_02_arty_F",[0.773926,8.20508,0.105],0,1,0,[0,0],"","this disableAI 'MOVE';",true,false], 
	["Land_HBarrier_Big_F",[-3.1958,8.37354,0],93.682,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_Big_F",[4.77344,8.31055,0],264.062,1,0,[0,0],"","",true,false], 
	["O_MBT_02_arty_F",[-10.6689,0.476074,0.105],324.781,1,0,[0,0],"","this disableAI 'MOVE';",true,false], 
	["Land_HBarrier_5_F",[-1.53662,11.6143,0],0,1,0,[0,0],"","",true,false], 
	["O_MBT_02_arty_F",[11.6543,-1.08447,0.105],29.6095,1,0,[0,0],"","this disableAI 'MOVE';",true,false], 
	["Land_HBarrier_5_F",[-14.5225,1.92871,0],324.781,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[11.3296,3.021,0],29.6095,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[6.8042,-12.2861,0],339.935,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[-14.0098,-1.67578,0],58.463,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Tower_F",[-7.30371,-11.8867,0],299.009,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[15.1841,-2.96875,0],293.672,1,0,[0,0],"","",true,false]
];
OPFORsitePOW = [
	["CamoNet_OPFOR_big_F",[0.0625,-0.48291,0],180,1,0,[0,-0],"","",true,false], 
	["Land_NetFence_02_m_gate_v1_F",[-0.0449219,2.65381,0],0,1,0,[0,0],"","",true,false], 
	["Land_CncShelter_F",[-0.0415039,2.54443,0],0,1,0,[0,0],"","",true,false], 
	["Land_NetFence_02_m_2m_F",[1.55029,2.61328,0],0,1,0,[0,0],"","",true,false], 
	["Land_NetFence_02_m_2m_F",[-1.64551,2.62842,0],180,1,0,[0,-0],"","",true,false], 
	["Land_HBarrierWall4_F",[-3.51831,0.594727,0],90,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall4_F",[3.53662,0.725098,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall4_F",[0.244629,-4.17822,0],0,1,0,[0,0],"","",true,false]
];
    

OPFORcamp_1 = [
	["Land_HBarrier_5_F",[6.81421,-6.51807,0],270,1,0,[0,0],"","",true,false], 
	["CamoNet_OPFOR_open_F",[2.77002,-8.24561,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Small_F",[0.0771484,-9.4043,0],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-8.89966,-3.43896,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-5.57275,-7.4375,0],225,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[7.03296,-8.03955,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[5.50928,7.02246,0],225,1,0,[0,0],"","",true,false], 
	["Land_ConcreteHedgehog_01_F",[9.52979,1.01318,0],0,1,0,[0,0],"","",true,false], 
	["Land_ConcreteHedgehog_01_F",[9.02954,5.33789,0],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-5.10986,9.19434,0],180,1,0,[0,0],"","",true,false], 
	["Land_ConcreteHedgehog_01_F",[-10.8284,5.69824,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Large_F",[-2.90527,14.4365,0],180,1,0,[0,0],"","",true,false]
];

OPFORcamp_2 = [
	["Land_HBarrier_5_F",[-2.90698,-5.0791,0],225,1,0,[0,0],"","",true,false], 
	["CamoNet_OPFOR_open_F",[1.84204,-7.06055,0],135,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[6.30811,-7.13232,0],270,1,0,[0,0],"","",true,false], 
	["CamoNet_OPFOR_open_F",[7.30518,4.98438,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-2.50073,-10.6035,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-6.07495,3.51563,0],225,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[9.33838,6.88867,0],135,1,0,[0,-0],"","",true,false], 
	["Land_ConcreteHedgehog_01_F",[9.67065,-2.12305,0],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[5.77759,-7.65771,0],135,1,0,[0,-0],"","",true,false], 
	["Land_ConcreteHedgehog_01_F",[-10.4404,-1.00195,0],0,1,0,[0,0],"","",true,false], 
	["CamoNet_OPFOR_open_F",[-7.40552,6.53174,0],315,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-1.646,10.5254,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[5.96509,10.6274,0],180,1,0,[0,0],"","",true,false], 
	["Land_ConcreteHedgehog_01_F",[-11.1411,3.94727,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Small_F",[-0.00878906,-12.3789,0],0,1,0,[0,0],"","",true,false], 
	["Land_ConcreteHedgehog_01_F",[11.5356,3.5,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Small_F",[-8.81592,9.90137,0],135,1,0,[0,-0],"","",true,false], 
	["Land_BagBunker_Small_F",[8.67163,10.0703,0],225,1,0,[0,0],"","",true,false]
];

OPFORcamp_3 = [
	["Land_Cargo_Patrol_V3_F",[7.46753,-4.86426,0],270,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Tower_F",[-9.61987,0.783203,0],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-5.10205,9.65479,0],1.53679e-05,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[2.44824,-9.31445,0],135,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[-9.26587,6.25488,0],315,1,0,[0,0],"","",true,false], 
	["Land_ConcreteHedgehog_01_F",[11.0217,2.11133,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Small_F",[1.48291,11.7417,0],180,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_Big_F",[10.8784,-4.38574,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[7.36401,9.50732,0],180,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[7.09839,-9.79053,0],0,1,0,[0,0],"","",true,false], 
	["Land_ConcreteHedgehog_01_F",[10.8228,6.28564,0],0,1,0,[0,0],"","",true,false], 
	["Land_ConcreteHedgehog_01_F",[-12.5144,-5.70605,0],0,1,0,[0,0],"","",true,false], 
	["Land_BagBunker_Small_F",[-3.30225,-13.9312,0],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-10.0203,-11.7905,0],2.56132e-05,1,0,[0,0],"","",true,false], 
	["Land_ConcreteHedgehog_01_F",[-11.3015,-9.05566,0],0,1,0,[0,0],"","",true,false]
];

OPFORcamp_4 = [
	["Land_HBarrier_5_F",[-8.83936,0.244141,0],36.5702,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[6.01221,-2.73438,0],357.498,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-9.18701,5.13672,0],88.7307,1,0,[0,0],"","",true,false], 
	["Land_Cargo_HQ_V3_F",[-2.13818,11.6426,0],267.333,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-2.61475,-11.3418,0],21.7148,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[2.31494,-12.752,0],324.922,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-8.03076,-11.7949,0],354.618,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-12.1909,9.1875,0],50.8217,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[11.4712,-2.23633,0],329.047,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[11.6743,-10.0039,0],179.263,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[-11.8218,-7.94922,0],48.1373,1,0,[0,0],"","",true,false], 
	["Land_Cargo_Patrol_V3_F",[-14.8892,2.42578,0],89.0383,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[15.6821,0.878906,0],273.522,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[15.9983,-7.13477,0],135.593,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[-13.8274,9.5498,0],138.137,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[-12.6675,14.668,0],88.1428,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-18.2122,0.583008,0],93.1373,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[-17.9441,6.0249,0],93.1373,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[16.5823,6.13086,0],3.52164,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[8.42627,17.1172,0],230.768,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[13.9087,16.8457,0],180.593,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-0.554199,20.8926,0],177.693,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[4.88721,21.1797,0],177.693,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[-11.2671,20.1035,0],108.365,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_5_F",[-6.1499,20.668,0],177.693,1,0,[0,-0],"","",true,false], 
	["Land_Cargo_Patrol_V3_F",[19.5562,12.0371,0],269.038,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[19.4741,16.8408,0],180.593,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[21.457,6.80762,0],315.593,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[24.5803,16.626,0],180.593,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[24.5994,11.0269,0],270.593,1,0,[0,0],"","",true,false]
];

OPFORcamp_5 = [
	["Land_HBarrierWall6_F",[-5.76807,7.67725,0],315,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_Big_F",[-9.0437,1.30811,0],90,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_Big_F",[-2.896,-8.93799,0],225,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[1.07104,10.8076,0],0,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[4.8894,-11.5981,0],180,1,0,[0,-0],"","",true,false], 
	["CamoNet_OPFOR_F",[-10.3384,-7.3252,0],225,1,0,[0,0],"","",true,false], 
	["Land_HBarrierWall6_F",[11.0593,-8.3252,0],135,1,0,[0,-0],"","",true,false], 
	["Land_HBarrier_Big_F",[12.4888,5.01709,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrierTower_F",[8.76538,10.7944,0],225,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-13.1367,-6.91602,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[-9.37012,-11.0723,0],225,1,0,[0,0],"","",true,false], 
	["CamoNet_OPFOR_F",[18.3618,-1.99219,0],90,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[16.4758,-9.0874,0],315,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[19.6924,-4.95215,0],270,1,0,[0,0],"","",true,false], 
	["Land_HBarrier_5_F",[19.6665,0.72168,0],270,1,0,[0,0],"","",true,false]
];

OPFORcamps = [OPFORcamp_1, OPFORcamp_2, OPFORcamp_3, OPFORcamp_4, OPFORcamp_5];

BLUFORfob = [
	["CamoNet_BLUFOR_open_F",[0.0771484,0.417969,-0.00655746],243.869,1,0,[0.542036,0.584953],"","",true,false], 
	["Land_HBarrier_Big_F",[2.49902,4.11621,0.000741959],59.9576,1,0,[-0.646636,-0.508468],"","",true,false], 
	["Land_HBarrier_Big_F",[-2.82715,-4.47852,0.000457764],59.9557,1,0,[-0.47579,-0.519116],"","",true,false], 
	["Land_HBarrier_Big_F",[-3.93164,4.11426,-0.00102425],149.735,1,0,[0.544357,-0.582794],"","",true,false], 
	["Land_HBarrier_Big_F",[3.44531,-4.59668,0.00125313],330.1,1,0,[-0.51007,0.645373],"","",true,false], 
	["CamoNet_BLUFOR_F",[3.63672,-8.66992,0.00213623],150.598,1,0,[0.648761,-0.715931],"","",true,false], 
	["CamoNet_BLUFOR_F",[-4.56738,8.96484,-0.00155067],330.291,1,0,[-0.54999,0.577482],"","",true,false], 
	["Land_HBarrier_5_F",[8.91992,-7.22656,-0.026701],153.538,1,0,[0.684629,-0.681713],"","",true,false], 
	["Land_HBarrier_5_F",[-6.32324,-9.7002,0.0181637],239.849,1,0,[0.268471,0.462181],"","",true,false], 
	["Land_HBarrier_5_F",[11.9678,-0.993164,0.0203438],239.851,1,0,[0.476738,0.518245],"","",true,false], 
	["Land_HBarrier_5_F",[3.84863,-9.70313,-0.0156498],151.093,1,0,[0.56488,-0.399429],"","",true,false], 
	["Land_HBarrier_5_F",[8.04688,6.70215,0.0214405],239.852,1,0,[0.581679,0.545548],"","",true,false], 
	["Land_HBarrier_5_F",[-9.96484,-3.03516,0.0203438],239.851,1,0,[0.476738,0.518245],"","",true,false], 
	["Land_HBarrier_5_F",[-0.621094,11.8398,-0.0204582],155.802,1,0,[0.602905,-0.521995],"","",true,false], 
	["Land_HBarrier_5_F",[-5.78809,9.56445,-0.0160999],153.357,1,0,[0.648421,-0.411029],"","",true,false], 
	["Land_BagBunker_Small_F",[11.6377,-4.1875,0.0018158],299.554,1,0,[-0.177581,0.777435],"","",true,false], 
	["Land_BagBunker_Small_F",[-4.8252,-12.0869,0.00453758],29.8742,1,0,[-0.463472,-0.266234],"","",true,false], 
	["Land_BagBunker_Small_F",[-12.5527,3.62207,0.000923157],94.6532,1,0,[-0.0832952,-0.84979],"","",true,false], 
	["Land_BagBunker_Small_F",[3.68066,13.0352,-0.00761986],192.577,1,0,[0.795402,-0.0571792],"","",true,false]
];
BLUFORfobs = [BLUFORfob];

textIntel_min = "Enemy presence in the AO is minimal. Expect small scatering of mortars, manpads, Ifrits and APCs, and a couple of patrols.";
textIntel_low = "Enemy presence in the AO is low. Expect some mortars, manpads, Ifrits and APCs, and a few patrols.";
textIntel_mid = "Expect AA guns with a possiblity of SAMs, tanks, APCs, and artillery. Enemy will have plenty of patrols in the area.";
textIntel_high = "Enemy presence is high. Plan for the worst.";