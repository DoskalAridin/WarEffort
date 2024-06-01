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
    ["B_Heli_Light_01_dynamicLoadout_F", 10], 
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
        ["B_Pickup_rf"], 
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
	["vn_o_static_rsna75",[2.11157,-1.44653,-5.17413],0,1,0,[],"","createVehicleCrew this",true,false],
	["vn_sa2",[-0.124878,14.6333,-0.0749979],0,1,0,[],"","createVehicleCrew this",true,false], 
	["vn_sa2",[-0.690674,-17.6155,-0.0749998],179.656,1,0,[],"","createVehicleCrew this",true,false], 
	["Land_vn_o_trench_firing_01",[-3.93384,17.0603,0],284.471,1,0,[0,0],"","",true,false], 
	["Land_vn_o_trench_firing_01",[4.62329,17.8357,-9.53674e-07],71.3419,1,0,[0,0],"","",true,false], 
	["vn_sa2",[-19.2419,-0.126953,-0.0749998],270.468,1,0,[],"","createVehicleCrew this",true,false], 
	["vn_sa2",[20.1296,-0.0297852,-0.0749998],90.2563,1,0,[],"","createVehicleCrew this",true,false], 
	["Land_vn_o_trench_firing_01",[3.13281,-20.0197,-1.90735e-06],104.127,1,0,[0,0],"","",true,false], 
	["Land_vn_o_trench_firing_01",[-5.41956,-20.8463,-2.86102e-06],250.998,1,0,[0,0],"","",true,false], 
	["Land_vn_o_trench_firing_01",[-21.7,-3.91577,-1.90735e-06],194.938,1,0,[0,0],"","",true,false], 
	["Land_vn_o_trench_firing_01",[-22.4054,4.64722,-2.86102e-06],341.81,1,0,[0,0],"","",true,false], 
	["Land_vn_o_trench_firing_01",[22.5737,3.76831,-1.90735e-06],14.7269,1,0,[0,0],"","",true,false], 
	["Land_vn_o_trench_firing_01",[23.3108,-4.79199,-2.86102e-06],161.598,1,0,[0,0],"","",true,false], 
	["Land_vn_o_bunker_03",[-0.0045166,25.7832,0],0,1,0,[0,0],"","",true,false],
	["Land_vn_o_bunker_03",[-0.744141,-28.7657,-1.90735e-06],179.656,1,0,[0,0],"","",true,false], 
	["Land_vn_o_bunker_03",[-30.3905,0.0847168,-1.90735e-06],270.468,1,0,[0,0],"","",true,false],
	["Land_vn_o_bunker_03",[31.2789,-0.200195,-1.90735e-06],90.2563,1,0,[0,0],"","",true,false]
];
OPFORsiteArty = [
	["Land_vn_b_trench_revetment_05_01",[3.12598,0.418335,0],112.95,1,0,[0,0],"","",true,false], 
	["Land_vn_b_trench_revetment_05_01",[1.2644,4.98169,0],131.028,1,0,[0,0],"","",true,false], 
	["Land_vn_b_trench_revetment_05_01",[-3.49438,-3.91931,0],78.6829,1,0,[0,0],"","",true,false], 
	["Land_vn_b_trench_revetment_05_01",[6.36865,0.345581,0],203.165,1,0,[0,0],"","",true,false], 
	["Land_vn_b_trench_revetment_05_01",[-1.21362,6.67798,0],222.045,1,0,[0,0],"","",true,false], 
	["Land_vn_b_trench_revetment_05_01",[-6.54956,-4.17053,0],0,1,0,[0,0],"","",true,false], 
	["vn_o_nva_static_d44_01",[-7.34961,4.6814,-0.0750003],307.898,1,0,[],"","createVehicleCrew this",true,false], 
	["vn_o_nva_static_d44_01",[7.92163,-5.73206,-0.0750003],118.154,1,0,[],"","createVehicleCrew this",true,false], 
	["Land_vn_b_trench_revetment_05_01",[-0.0114746,-10.1837,0],88.6575,1,0,[0,0],"","",true,false], 
	["Land_vn_b_trench_revetment_05_01",[-9.83936,-4.15161,0],0,1,0,[0,0],"","",true,false], 
	["Land_vn_b_trench_revetment_05_01",[2.94263,-10.2058,0],177.55,1,0,[0,0],"","",true,false], 
	["Land_vn_b_trench_revetment_05_01",[-4.65479,9.81421,0],222.045,1,0,[0,0],"","",true,false], 
	["Land_vn_b_trench_revetment_05_01",[11.3059,-1.62427,0],203.165,1,0,[0,0],"","",true,false], 
	["Land_vn_b_trench_revetment_05_01",[7.59644,-9.99609,0],177.55,1,0,[0,0],"","",true,false], 
	["vn_o_nva_static_d44_01",[-9.3938,-8.47668,-0.0750003],273.681,1,0,[],"","createVehicleCrew this",true,false], 
	["vn_o_nva_static_d44_01",[11.2629,6.31335,-0.0750003],75.4257,1,0,[],"","createVehicleCrew this",true,false], 
	["Land_vn_b_trench_revetment_05_01",[5.6001,11.6825,0],102.669,1,0,[0,0],"","",true,false], 
	["vn_o_nva_static_d44_01",[0.984863,13.7676,-0.0750003],3.40085,1,0,[],"","createVehicleCrew this",true,false], 
	["Land_vn_o_trench_firing_01",[-12.2009,-0.300171,0.525753],278.113,1,0,[0,0],"","",true,false], 
	["Land_vn_b_trench_revetment_05_01",[-6.19092,-12.948,0],194.331,1,0,[0,0],"","",true,false], 
	["Land_vn_o_trench_firing_01",[13.8096,-0.11438,0.525753],108.88,1,0,[0,0],"","",true,false], 
	["Land_vn_b_trench_revetment_05_01",[-11.1738,-11.6682,0],194.331,1,0,[0,0],"","",true,false], 
	["Land_vn_o_trench_firing_01",[-4.04858,14.0055,0.525753],319.188,1,0,[0,0],"","",true,false], 
	["Land_vn_o_trench_firing_01",[9.28247,12.5586,0.525753],33.3083,1,0,[0,0],"","",true,false]
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

textIntel_min = "Enemy presence in the AO is minimal. Expect small scatering of HMGs, mortars, trucks and armored cars, and a couple of patrols.";
textIntel_low = "Enemy presence in the AO is low. Expect some HMGs, mortars, trucks and armored cars, and a few patrols.";
textIntel_mid = "Expect AA guns with a possiblity of SAMs, tanks and APCs, mortars and artillery. Enemy will have plenty of patrols in the area.";
textIntel_high = "Enemy presence is high. Plan for the worst.";