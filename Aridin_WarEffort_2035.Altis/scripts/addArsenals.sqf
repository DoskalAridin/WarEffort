params ["_boxes"];

{
_x addAction ["<t color='#149616'>Reload Kit</t>", {  
if (isNil {player getVariable format ["%1_%2", getPlayerUID player, ARDN_varName]}) then {
player setUnitLoadout (player getVariable "ARDN_defaultKit");
systemChat "Loading default loadout";
}
else {
player setUnitLoadout (player getVariable format ["%1_%2", getPlayerUID player, ARDN_varName]);
systemChat "Loading saved loadout";
};
},nil,6,true,true,"","true",2];
} forEach _boxes;


arsenalBackpacks = [ 
    "B_AssaultPack_blk","B_AssaultPack_cbr","B_AssaultPack_rgr","B_AssaultPack_khk","B_AssaultPack_mcamo","B_AssaultPack_sgg","B_AssaultPack_tna_F","B_AssaultPack_wdl_F","B_Bergen_mcamo_F","B_Bergen_tna_F","B_Patrol_Respawn_bag_F","B_Respawn_TentDome_F","B_Respawn_TentA_F","B_Carryall_blk","B_Carryall_cbr","B_Carryall_green_F","B_Carryall_khk","B_Carryall_mcamo","B_Carryall_oli","B_Carryall_wdl_F","B_GMG_01_A_weapon_F","B_HMG_01_A_weapon_F","B_HMG_01_high_weapon_F","B_HMG_01_weapon_F","B_GMG_01_high_weapon_F","B_GMG_01_weapon_F","B_Mortar_01_support_F","B_Mortar_01_weapon_F","B_HMG_01_support_high_F","B_HMG_01_support_F","B_Kitbag_cbr","B_RadioBag_01_black_F","B_RadioBag_01_mtp_F","B_RadioBag_01_tropic_F","B_RadioBag_01_wdl_F","B_Static_Designator_01_weapon_F","B_AA_01_weapon_F","B_AT_01_weapon_F","B_Parachute","B_TacticalPack_blk","B_TacticalPack_rgr","B_TacticalPack_mcamo","B_TacticalPack_oli","B_UAV_06_backpack_F","B_UAV_06_medical_backpack_F","B_UAV_02_backpack_lxWS","B_UAV_01_backpack_F","B_UGV_02_Demining_backpack_F","B_UGV_02_Science_backpack_F"
];
arsenalGear = [
    "U_B_CombatUniform_mcam","U_B_CombatUniform_mcam_tshirt","U_B_CTRG_1","U_B_CTRG_3","U_B_CTRG_2","U_B_FullGhillie_ard","U_B_FullGhillie_lsh","U_B_FullGhillie_sard","U_B_GhillieSuit","U_B_HeliPilotCoveralls","U_B_PilotCoveralls","U_B_CombatUniform_mcam_vest","U_B_Wetsuit","U_B_survival_uniform","U_B_CombatUniform_mcam_worn","U_B_T_Soldier_F","U_B_T_Soldier_AR_F","U_B_CTRG_Soldier_F","U_B_CTRG_Soldier_Arid_F","U_B_CTRG_Soldier_3_F","U_B_CTRG_Soldier_3_Arid_F","U_B_CTRG_Soldier_2_F","U_B_CTRG_Soldier_2_Arid_F","U_B_CTRG_Soldier_urb_1_F","U_B_CTRG_Soldier_urb_3_F","U_B_CTRG_Soldier_urb_2_F","U_B_T_FullGhillie_tna_F","U_B_T_Soldier_SL_F","U_B_CBRN_Suit_01_MTP_F","U_B_CBRN_Suit_01_Tropic_F","U_B_CBRN_Suit_01_Wdl_F","U_B_CombatUniform_mcam_wdl_f","U_B_CombatUniform_tshirt_mcam_wdL_f","H_Bandanna_gry","H_Bandanna_cbr","H_Bandanna_khk_hs","H_Bandanna_khk","H_Bandanna_mcamo","H_Bandanna_sgg","H_Bandanna_sand","H_Bandanna_camo","H_Watchcap_blk","H_Watchcap_cbr","H_Watchcap_camo","H_Watchcap_khk","H_Beret_02","H_Booniehat_khk_hs","H_Booniehat_khk","H_Booniehat_mcamo","H_Booniehat_oli","H_Booniehat_tan","H_Cap_grn_BI","H_Cap_blk","H_Cap_blk_CMMG","H_Cap_grn","H_Cap_blk_ION","H_Cap_Lyfe","H_Cap_MaldenTours","H_Cap_oli","H_Cap_oli_hs","H_Cap_red","H_Cap_tan","H_Cap_khaki_specops_UK","H_Cap_usblack","H_Cap_tan_specops_US","H_HelmetB","H_HelmetB_black","H_HelmetB_camo","H_HelmetB_desert","H_HelmetB_grass","H_HelmetB_sand","H_HelmetB_snakeskin","H_HelmetCrew_B","H_HelmetSpecB","H_HelmetSpecB_blk","H_HelmetSpecB_paint2","H_HelmetSpecB_paint1","H_HelmetSpecB_sand","H_HelmetSpecB_snakeskin","H_CrewHelmetHeli_B","H_PilotHelmetHeli_B","H_HelmetB_light","H_HelmetB_light_black","H_HelmetB_light_desert","H_HelmetB_light_grass","H_HelmetB_light_sand","H_HelmetB_light_snakeskin","H_MilCap_gry","H_MilCap_mcamo","H_PilotHelmetFighter_B","H_Cap_headphones","H_Booniehat_tna_F","H_HelmetB_tna_F","H_HelmetB_Enh_tna_F","H_HelmetB_Light_tna_F","H_MilCap_tna_F","H_HelmetB_TI_tna_F","H_HelmetB_TI_arid_F","H_ParadeDressCap_01_US_F","H_Booniehat_mgrn","H_Booniehat_wdl","H_HelmetB_plain_wdl","H_HelmetSpecB_wdl","H_HelmetB_light_wdl","H_MilCap_wdl","G_Aviator","G_Balaclava_blk","G_Balaclava_combat","G_Balaclava_lowprofile","G_Balaclava_oli","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_CandySkull","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_shades","G_Bandanna_sport","G_Bandanna_tan","G_Combat","G_B_Diving","G_Lady_Blue","G_Lowprofile","G_Shades_Black","G_Shades_Blue","G_Shades_Green","G_Shades_Red","G_Spectacles","G_Sport_Red","G_Sport_Blackyellow","G_Sport_BlackWhite","G_Sport_Checkered","G_Sport_Blackred","G_Sport_Greenblack","G_Squares_Tinted","G_Squares","G_Tactical_Clear","G_Tactical_Black","G_Spectacles_Tinted","G_Combat_Goggles_tna_F","G_Balaclava_TI_blk_F","G_Balaclava_TI_G_blk_F","G_Balaclava_TI_tna_F","G_Balaclava_TI_G_tna_F","G_AirPurifyingRespirator_01_F","V_PlateCarrierGL_blk","V_PlateCarrierGL_rgr","V_PlateCarrierGL_mtp","V_PlateCarrier1_blk","V_PlateCarrier1_rgr","V_PlateCarrier2_blk","V_PlateCarrier2_rgr","V_PlateCarrierSpec_blk","V_PlateCarrierSpec_rgr","V_PlateCarrierSpec_mtp","V_Chestrig_blk","V_Chestrig_rgr","V_Chestrig_khk","V_Chestrig_oli","V_PlateCarrierL_CTRG","V_PlateCarrierH_CTRG","V_Rangemaster_belt","V_TacVestIR_blk","V_RebreatherB","V_BandollierB_blk","V_BandollierB_cbr","V_BandollierB_rgr","V_BandollierB_khk","V_BandollierB_oli","V_TacVest_blk","V_TacVest_brn","V_TacVest_camo","V_TacVest_khk","V_TacVest_oli","V_I_G_resistanceLeader_F","V_PlateCarrierGL_tna_F","V_PlateCarrier1_rgr_noflag_F","V_PlateCarrier1_tna_F","V_PlateCarrier2_rgr_noflag_F","V_PlateCarrier2_tna_F","V_PlateCarrierSpec_tna_F","V_TacChestrig_cbr_F","V_TacChestrig_grn_F","V_TacChestrig_oli_F","V_PlateCarrierGL_wdl","V_PlateCarrier1_wdl","V_PlateCarrier2_wdl","V_PlateCarrierSpec_wdl","V_CarrierRigKBT_01_heavy_Olive_F","V_CarrierRigKBT_01_light_Olive_F","V_CarrierRigKBT_01_Olive_F"
];
arsenalItems = [
    "NVGoggles","NVGoggles_OPFOR","NVGogglesB_blk_F","NVGogglesB_grn_F","NVGogglesB_gry_F","NVGoggles_tna_F","Binocular","Laserdesignator","Rangefinder","Laserdesignator_01_khk_F","Laserdesignator_03","ItemMap","ItemGPS","B_UavTerminal","ItemRadio","ItemCompass","ItemWatch","ToolKit","MineDetector","acc_flashlight_pistol","muzzle_snds_acp","optic_MRD","optic_MRD_black","muzzle_snds_L","optic_Yorris","optic_DMS","optic_ACO_grn","optic_Aco","optic_ACO_grn_smg","optic_Aco_smg","optic_Arco","optic_Holosight","optic_Holosight_smg","optic_MRCO","optic_Hamr","optic_SOS","optic_LRPS","optic_Nightstalker","optic_NVS","optic_tws","optic_tws_mg","optic_Arco_blk_F","optic_Holosight_blk_F","optic_Holosight_khk_F","optic_Holosight_smg_blk_F","optic_Holosight_smg_khk_F","optic_Hamr_khk_F","optic_SOS_khk_F","optic_LRPS_tna_F","optic_ERCO_blk_F","optic_ERCO_khk_F","optic_ERCO_snd_F","optic_DMS_weathered_Kir_F","optic_DMS_weathered_F","optic_Arco_arid_F","optic_Arco_lush_F","optic_Arco_AK_arid_F","optic_Arco_AK_blk_F","optic_Arco_AK_lush_F","optic_Holosight_arid_F","optic_Holosight_lush_F","optic_KHS_blk","optic_KHS_old","optic_KHS_tan","optic_AMS","optic_AMS_khk","optic_AMS_snd","acc_pointer_IR","acc_flashlight","muzzle_snds_H_khk_F","muzzle_snds_H_snd_F","muzzle_snds_65_TI_blk_F","bipod_01_F_khk","bipod_01_F_blk","bipod_01_F_snd","muzzle_snds_338_black","muzzle_snds_338_green","muzzle_snds_338_sand","muzzle_snds_M","muzzle_snds_m_khk_F","muzzle_snds_m_snd_F","muzzle_snds_B","muzzle_snds_B_khk_F","muzzle_snds_B_snd_F","muzzle_snds_B_arid_F","muzzle_snds_B_lush_F"
];
arsenalMags = [
    "Laserbatteries","APERSMineDispenser_Mag","DemoCharge_Remote_Mag","ATMine_Range_Mag","ClaymoreDirectionalMine_Remote_Mag","SatchelCharge_Remote_Mag","APERSBoundingMine_Range_Mag","SLAMDirectionalMine_Wire_Mag","Chemlight_blue","Chemlight_green","Chemlight_red","Chemlight_yellow","B_IR_Grenade","SmokeShellBlue","SmokeShellGreen","SmokeShellOrange","SmokeShellPurple","SmokeShellRed","SmokeShellYellow","HandGrenade","SmokeShell","MiniGrenade","9Rnd_45ACP_Mag","11Rnd_45ACP_Mag","16Rnd_9x21_green_Mag","16Rnd_9x21_red_Mag","16Rnd_9x21_yellow_Mag","16Rnd_9x21_Mag","30Rnd_9x21_Mag","30Rnd_9x21_Green_Mag","30Rnd_9x21_Red_Mag","30Rnd_9x21_Yellow_Mag","100Rnd_65x39_caseless_black_mag","100Rnd_65x39_caseless_khaki_mag","100Rnd_65x39_caseless_mag","100Rnd_65x39_caseless_black_mag_tracer","100Rnd_65x39_caseless_khaki_mag_tracer","100Rnd_65x39_caseless_mag_Tracer","30Rnd_65x39_caseless_black_mag","30Rnd_65x39_caseless_khaki_mag","30Rnd_65x39_caseless_mag","30Rnd_65x39_caseless_black_mag_Tracer","30Rnd_65x39_caseless_khaki_mag_Tracer","30Rnd_65x39_caseless_mag_Tracer","3Rnd_UGL_FlareGreen_F","3Rnd_UGL_FlareCIR_F","3Rnd_UGL_FlareRed_F","3Rnd_UGL_FlareWhite_F","3Rnd_UGL_FlareYellow_F","3Rnd_SmokeBlue_Grenade_shell","3Rnd_SmokeGreen_Grenade_shell","3Rnd_SmokeOrange_Grenade_shell","3Rnd_SmokePurple_Grenade_shell","3Rnd_SmokeRed_Grenade_shell","3Rnd_Smoke_Grenade_shell","3Rnd_SmokeYellow_Grenade_shell","3Rnd_HE_Grenade_shell","1Rnd_HE_Grenade_shell","UGL_FlareGreen_F","UGL_FlareCIR_F","UGL_FlareRed_F","UGL_FlareWhite_F","UGL_FlareYellow_F","1Rnd_SmokeBlue_Grenade_shell","1Rnd_SmokeGreen_Grenade_shell","1Rnd_SmokeOrange_Grenade_shell","1Rnd_SmokePurple_Grenade_shell","1Rnd_SmokeRed_Grenade_shell","1Rnd_Smoke_Grenade_shell","1Rnd_SmokeYellow_Grenade_shell","20Rnd_556x45_UW_mag","30Rnd_556x45_Stanag_green","30Rnd_556x45_Stanag_Sand_green","30Rnd_556x45_Stanag_red","30Rnd_556x45_Stanag_Sand_red","30Rnd_556x45_Stanag","30Rnd_556x45_Stanag_Sand","30Rnd_556x45_Stanag_Tracer_Green","30Rnd_556x45_Stanag_Sand_Tracer_Green","30Rnd_556x45_Stanag_Tracer_Red","30Rnd_556x45_Stanag_Sand_Tracer_Red","30Rnd_556x45_Stanag_Tracer_Yellow","30Rnd_556x45_Stanag_Sand_Tracer_Yellow","150Rnd_556x45_Drum_Green_Mag_F","150Rnd_556x45_Drum_Mag_F","150Rnd_556x45_Drum_Sand_Mag_F","150Rnd_556x45_Drum_Green_Mag_Tracer_F","150Rnd_556x45_Drum_Mag_Tracer_F","150Rnd_556x45_Drum_Sand_Mag_Tracer_F","20Rnd_762x51_Mag","10Rnd_338_Mag","7Rnd_408_Mag","Titan_AA","Titan_AP","Titan_AT","MRAWS_HE_F","MRAWS_HEAT55_F","MRAWS_HEAT_F","Vorona_HE","Vorona_HEAT"
];
arsenalWeapons = [
    "hgun_ACPC2_F","hgun_Pistol_heavy_01_F","hgun_P07_F","hgun_P07_blk_F","hgun_P07_khk_F","hgun_Pistol_heavy_01_green_F","hgun_PDW2000_F","arifle_MX_F","arifle_MX_Black_F","arifle_MX_GL_F","arifle_MX_GL_Black_F","arifle_MX_SW_F","arifle_MX_SW_Black_F","arifle_MXC_F","arifle_MXC_Black_F","arifle_MXM_F","arifle_MXM_Black_F","arifle_SDAR_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_khk_F","arifle_SPAR_01_snd_F","arifle_SPAR_01_GL_blk_F","arifle_SPAR_01_GL_khk_F","arifle_SPAR_01_GL_snd_F","arifle_SPAR_02_blk_F","arifle_SPAR_02_khk_F","arifle_SPAR_02_snd_F","arifle_SPAR_03_blk_F","arifle_SPAR_03_khk_F","arifle_SPAR_03_snd_F","arifle_MX_khk_F","arifle_MX_GL_khk_F","arifle_MX_SW_khk_F","arifle_MXM_khk_F","MMG_02_black_F","MMG_02_camo_F","MMG_02_sand_F","srifle_DMR_02_F","srifle_DMR_02_camo_F","srifle_DMR_02_sniper_F","srifle_LRR_F","srifle_LRR_camo_F","srifle_LRR_tna_F","launch_NLAW_F","launch_B_Titan_F","launch_I_Titan_short_F","launch_B_Titan_short_F","launch_B_Titan_tna_F","launch_B_Titan_short_tna_F","launch_B_Titan_olive_F","launch_MRAWS_green_rail_F","launch_MRAWS_olive_rail_F","launch_MRAWS_sand_rail_F","launch_MRAWS_green_F","launch_MRAWS_olive_F","launch_MRAWS_sand_F","launch_O_Vorona_brown_F","launch_O_Vorona_green_F"
];

if (compat_WS == true) then {
    arsenalBackpacks append [
        "B_AssaultPack_desert_lxWS","B_Carryall_desert_lxWS","B_Kitbag_desert_lxWS","B_Kitbag_rgr","B_Kitbag_mcamo","B_Kitbag_sgg","B_Kitbag_tan","B_shield_backpack_lxWS"
    ];
    arsenalGear append [
        "U_lxWS_B_CombatUniform_desert","U_lxWS_B_CombatUniform_desert_tshirt","U_lxWS_ION_Casual3","U_lxWS_ION_Casual6","U_lxWS_ION_Casual5","U_lxWS_ION_Casual2","U_lxWS_ION_Casual4","U_B_CTRG_3_lxWS","U_B_CTRG_4_lxWS","U_lxWS_B_CombatUniform_desert_vest","H_Shemag_olive","H_Shemag_olive_hs","H_ShemagOpen_tan","H_ShemagOpen_khk","lxWS_H_Bandanna_blk_hs","lxWS_H_Booniehat_desert","H_Cap_headphones_ion_lxws","lxWS_H_CapB_rvs_blk_ION","lxWS_H_MilCap_desert","lxWS_H_Headset","lxWS_H_turban_03_black","lxWS_H_turban_03_green","lxWS_H_turban_03_green_pattern","lxWS_H_turban_03_sand","lxWS_H_turban_04_black","lxWS_H_turban_04_green","lxWS_H_turban_04_sand","lxWS_H_turban_02_black","lxWS_H_turban_02_green","lxWS_H_turban_02_green_pattern","lxWS_H_turban_02_sand","lxWS_H_turban_01_black","lxWS_H_turban_01_green","lxWS_H_turban_01_sand","G_Balaclava_blk_lxWS","G_Balaclava_oli_lxWS","G_Balaclava_snd_lxWS","G_Combat_lxWS","G_Headset_lxWS","V_lxWS_PlateCarrierGL_desert","V_lxWS_PlateCarrier1_desert","V_lxWS_PlateCarrier2_desert","V_lxWS_PlateCarrierSpec_desert","V_PlateCarrier_CTRG_lxWS","V_lxWS_TacVestIR_oli"
    ];
    arsenalItems append [
     "Camera_lxWS","optic_DMS_snake_lxWS","optic_Holosight_snake_lxWS","optic_Holosight_smg_snake_lxWS","optic_Hamr_arid_lxWS","optic_Hamr_lush_lxWS","optic_Hamr_sand_lxWS","optic_Hamr_snake_lxWS","optic_r1_high_arid_lxWS","optic_r1_high_lxWS","optic_r1_high_black_sand_lxWS","optic_r1_high_khaki_lxWS","optic_r1_high_lush_lxWS","optic_r1_high_sand_lxWS","optic_r1_high_snake_lxWS","optic_r1_low_arid_lxWS","optic_r1_low_lxWS","optic_r1_low_khaki_lxWS","optic_r1_low_lush_lxWS","optic_r1_low_sand_lxWS","optic_r1_low_snake_lxWS","acc_pointer_IR_arid_lxWS","acc_pointer_IR_lush_lxWS","acc_pointer_IR_sand_lxWS","acc_pointer_IR_snake_lxWS","saber_light_lxWS","saber_light_arid_lxWS","saber_light_khaki_lxWS","saber_light_lush_lxWS","saber_light_sand_lxWS","saber_light_snake_lxWS","saber_light_ir_lxWS","saber_light_ir_arid_lxWS","saber_light_ir_khaki_lxWS","saber_light_ir_lush_lxWS","saber_light_ir_sand_lxWS","saber_light_ir_snake_lxWS","muzzle_snds_12Gauge_lxWS","muzzle_snds_12Gauge_snake_lxWS","suppressor_m_lxWS","suppressor_m_arid_lxWS","suppressor_m_khaki_lxWS","suppressor_m_lush_lxWS","suppressor_m_sand_lxWS","suppressor_m_snake_lxWS","suppressor_l_lxWS","suppressor_l_arid_lxWS","suppressor_l_khaki_lxWS","suppressor_l_lush_lxWS","suppressor_l_sand_lxWS","suppressor_l_snake_lxWS","suppressor_h_lxWS","suppressor_h_arid_lxWS","suppressor_h_khaki_lxWS","suppressor_h_lush_lxWS","suppressor_h_sand_lxWS","suppressor_h_snake_lxWS"
    ];
    arsenalMags append [
        "20Rnd_12Gauge_AA40_HE_lxWS","20Rnd_12Gauge_AA40_HE_Snake_lxWS","20Rnd_12Gauge_AA40_HE_Tan_lxWS","20Rnd_12Gauge_AA40_Pellets_lxWS","20Rnd_12Gauge_AA40_Pellets_Snake_lxWS","20Rnd_12Gauge_AA40_Pellets_Tan_lxWS","20Rnd_12Gauge_AA40_Slug_lxWS","20Rnd_12Gauge_AA40_Slug_Snake_lxWS","20Rnd_12Gauge_AA40_Slug_Tan_lxWS","20Rnd_12Gauge_AA40_Smoke_lxWS","20Rnd_12Gauge_AA40_Smoke_Snake_lxWS","20Rnd_12Gauge_AA40_Smoke_Tan_lxWS","8Rnd_12Gauge_AA40_HE_lxWS","8Rnd_12Gauge_AA40_HE_Snake_lxWS","8Rnd_12Gauge_AA40_HE_Tan_lxWS","8Rnd_12Gauge_AA40_Pellets_lxWS","8Rnd_12Gauge_AA40_Pellets_Snake_lxWS","8Rnd_12Gauge_AA40_Pellets_Tan_lxWS","8Rnd_12Gauge_AA40_Slug_lxWS","8Rnd_12Gauge_AA40_Slug_Snake_lxWS","8Rnd_12Gauge_AA40_Slug_Tan_lxWS","8Rnd_12Gauge_AA40_Smoke_lxWS","8Rnd_12Gauge_AA40_Smoke_Snake_lxWS","8Rnd_12Gauge_AA40_Smoke_Tan_lxWS","75Rnd_556x45_Stanag_green_lxWS","75Rnd_556x45_Stanag_red_lxWS","75Rnd_556x45_Stanag_lxWS","1Rnd_Pellet_Grenade_shell_lxWS","1Rnd_40mm_HE_lxWS","75Rnd_556x45_Stanag_green_lxWS","75Rnd_556x45_Stanag_red_lxWS","75Rnd_556x45_Stanag_lxWS"
    ];
    arsenalWeapons append [
        "sgun_aa40_lxWS","sgun_aa40_tan_lxWS","sgun_aa40_snake_lxWS","arifle_XMS_Base_lxWS","arifle_XMS_Base_khk_lxWS","arifle_XMS_Base_Sand_lxWS","arifle_XMS_GL_lxWS","arifle_XMS_GL_khk_lxWS","arifle_XMS_GL_Sand_lxWS","arifle_XMS_Shot_lxWS","arifle_XMS_Shot_khk_lxWS","arifle_XMS_Shot_Sand_lxWS","arifle_XMS_M_lxWS","arifle_XMS_M_khk_lxWS","arifle_XMS_M_Sand_lxWS"
    ];
};

if (compat_RF == true) then {
    arsenalBackpacks append [
        "B_DuffleBag_Black_NoLogo_RF","B_DuffleBag_Sand_NoLogo_RF","B_DuffleBag_MTP_RF","B_DuffleBag_Olive_NoLogo_RF","B_CommandoMortar_weapon_RF"
    ];
    arsenalGear append [
        "U_C_HeliPilotCoveralls_Green_RF","U_B_HeliPilotCoveralls_MTP_RF","G_Glasses_black_RF","G_Glasses_white_RF","H_HelmetB_plain_sb_khaki_RF","H_HelmetB_plain_sb_mtp_RF","H_HelmetB_plain_sb_tna_RF","H_HelmetB_plain_sb_wdl_RF","V_PlateCarrierLite_black_noFlag_RF","V_TacVest_rig_blk_RF","V_TacVest_rig_khk_RF","V_TacVest_rig_oli_RF"
    ];
    arsenalItems append [
        "TiGoggles_RF","TiGoggles_grn_RF","optic_rds_RF","optic_VRCO_pistol_RF","optic_MRD_khk_RF","optic_MRD_tan_RF","acc_flashlight_IR_pistol_RF","acc_pointer_IR_pistol_RF","suppressor_65_black_RF","suppressor_65_green_RF","suppressor_65_khaki_RF","suppressor_65_sand_RF","suppressor_65_tan_RF"
    ];
    arsenalMags append [
        "17Rnd_9x19_Mag_RF","17Rnd_9x19_green_Mag_RF","17Rnd_9x19_green_Mag_RF","17Rnd_9x19_yellow_Mag_RF","33Rnd_9x19_Mag_RF","33Rnd_9x19_Mag_khk_RF","33Rnd_9x19_Green_Mag_RF","33Rnd_9x19_Green_Mag_khk_RF","33Rnd_9x19_Red_Mag_RF","33Rnd_9x19_Red_Mag_khk_RF","33Rnd_9x19_Red_Mag_Tan_RF","33Rnd_9x19_Yellow_Mag_RF","33Rnd_9x19_Yellow_Mag_khk_RF","33Rnd_9x19_Yellow_Mag_Tan_RF","33Rnd_9x19_Mag_Tan_RF","65Rnd_9x19_Mag_RF","65Rnd_9x19_Green_Mag_RF","65Rnd_9x19_Red_Mag_RF","65Rnd_9x19_Yellow_Mag_RF","7Rnd_50AE_Mag_RF","30Rnd_556x45_AP_Stanag_green_RF","30Rnd_556x45_AP_Stanag_green_khk_RF","30Rnd_556x45_AP_Stanag_green_Tan_RF","30Rnd_556x45_AP_Stanag_red_RF","30Rnd_556x45_AP_Stanag_red_khk_RF","30Rnd_556x45_AP_Stanag_red_Tan_RF","30Rnd_556x45_AP_Stanag_RF","30Rnd_556x45_AP_Stanag_khk_RF","30Rnd_556x45_AP_Stanag_Tan_RF","1Rnd_RC40_HE_shell_RF","1Rnd_RC40_shell_RF","1Rnd_RC40_SmokeBlue_shell_RF","1Rnd_RC40_SmokeGreen_shell_RF","1Rnd_RC40_SmokeOrange_shell_RF","1Rnd_RC40_SmokeRed_shell_RF","1Rnd_RC40_SmokeWhite_shell_RF","30Rnd_556x45_AP_Stanag_green_RF","30Rnd_556x45_AP_Stanag_green_khk_RF","30Rnd_556x45_AP_Stanag_green_Tan_RF","30Rnd_556x45_AP_Stanag_red_RF","30Rnd_556x45_AP_Stanag_red_khk_RF","30Rnd_556x45_AP_Stanag_red_Tan_RF","30Rnd_556x45_AP_Stanag_RF","30Rnd_556x45_AP_Stanag_khk_RF","30Rnd_556x45_AP_Stanag_Tan_RF"
    ];
    arsenalWeapons append [
        "hgun_Glock19_RF","hgun_Glock19_khk_RF","hgun_Glock19_Tan_RF","hgun_Glock19_auto_RF","hgun_Glock19_auto_khk_RF","hgun_Glock19_auto_Tan_RF","hgun_DEagle_RF","hgun_DEagle_classic_RF"
    ];
};

if (compat_ARDN == true) then {
    arsenalBackpacks append [
        "ARDN_gg_B_Kitbag_blk","ARDN_rpack_brown","ARDN_rpack_grey","ARDN_rpack_m81","ARDN_rpack_od","ARDN_rpack_olive","ARDN_rpack_tan"
    ];
    arsenalGear append [
        "ARDN_gg_cap_shdwMoses","ARDN_main_G_Balaclava_combat_blk","ARDN_main_G_Combat_blk","ARDN_main_viper_corduroy","ARDN_main_viper","ARDN_main_viper_rubber","ARDN_main_viper_smoke","ARDN_gg_G_Balaclava_TI_G","ARDN_gg_carrierRigKBT_heavy_blk","ARDN_gg_carrierRigKBT_light_blk","ARDN_gg_carrierRigKBT_blk"
    ];
    arsenalWeapons append [
      "ARDN_gg_hgun_pHeavy"  
    ];
};


if (compat_ARDNCAF == true) then {
    arsenalBackpacks append [
        "ARDN_CAF_Assaultpack","ARDN_CAF_Kitbag_respawn","ARDN_CAF_Kitbag","ARDN_rpack_cadpat"
    ];
    arsenalGear append [
        "ARDN_U_CAF_Uniform","ARDN_U_CAF_FullGhillie","ARDN_U_CAF_HeliPilotCoveralls","ARDN_U_CAF_PilotCoveralls","ARDN_CAF_Booniehat","ARDN_CAF_helmet_camo","ARDN_CAF_helmet_plain","ARDN_CAF_helmet_spec","ARDN_CAF_helmet_light","ARDN_CAF_MilCap","ARDN_CAF_platecarriergl","ARDN_CAF_platecarrier1","ARDN_CAF_platecarrier2","ARDN_CAF_platecarrierspec"
    ];
};

if (compat_cigs == true) then {
    arsenalItems append [
    "murshun_cigs_cig0_nv","immersion_cigs_cigar0","murshun_cigs_cig0","immersion_pops_pop0","immersion_cigs_cigar0_nv"
    ];
    arsenalMags append [
    "murshun_cigs_cigpack","murshun_cigs_lighter","immersion_pops_poppack","murshun_cigs_matches"
    ];
};

if (compat_acre == true) then {
    arsenalItems append [
    "ACRE_VHF30108","ACRE_PRC77","ACRE_PRC343"
    ];
    arsenalBackpacks append [
        "TFAR_anarc210","TFAR_mr3000_bwmod","TFAR_mr3000_bwmod_tropen","TFAR_rt1523g","TFAR_rt1523g_big","TFAR_rt1523g_big_bwmod","TFAR_rt1523g_big_bwmod_tropen","TFAR_rt1523g_big_rhs","TFAR_rt1523g_black","TFAR_rt1523g_bwmod","TFAR_rt1523g_fabric","TFAR_rt1523g_green","TFAR_rt1523g_rhs","TFAR_rt1523g_sage"
    ];
};

if (compat_tfar == true) then {
    arsenalItems append [
        "TFAR_anprc152","TFAR_rf7800str","TFAR_microdagr"
    ];
};


if (compat_ace == true) then {
    arsenalBackpacks append [
        "ACE_NonSteerableParachute","ACE_TacticalLadder_Pack"
    ];
    arsenalItems append [
    "ACE_painkillers","ACE_suture","ACE_fieldDressing","ACE_elasticBandage","ACE_packingBandage","ACE_quikclot","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_epinephrine","ACE_morphine","ACE_adenosine","ACE_salineIV","ACE_salineIV_250","ACE_salineIV_500","ACE_splint","ACE_surgicalKit","ACE_tourniquet","ACE_bodyBag","ACE_CableTie","ACE_DefusalKit","ACE_EarPlugs","ACE_EntrenchingTool","ACE_Flashlight_MX991","ACE_Clacker","ACE_MapTools","ACE_RangeCard","ACE_Fortify","ACE_rope12","ACE_rope15","ACE_rope18","ACE_rope27","ACE_rope3","ACE_rope36","ACE_rope6","ace_marker_flags_black","ace_marker_flags_blue","ace_marker_flags_green","ace_marker_flags_orange","ace_marker_flags_purple","ace_marker_flags_red","ace_marker_flags_white","ace_marker_flags_yellow","acex_intelitems_notepad","ACE_PlottingBoard","ACE_NVGoggles_OPFOR_WP","ACE_NVGoggles_WP","ACE_NVG_Gen4_Black","ACE_NVG_Gen4_Black_WP","ACE_NVG_Gen4","ACE_NVG_Gen4_WP","ACE_NVG_Wide_Black","ACE_NVG_Wide_Black_WP","ACE_Altimeter","ACE_artilleryTable","ACE_microDAGR","ACE_Flashlight_XL50","ACE_wirecutter","ACE_muzzle_mzls_smg_01","ACE_muzzle_mzls_smg_02","ACE_muzzle_mzls_338","ACE_muzzle_mzls_L","ACE_muzzle_mzls_B"
    ];
    arsenalMags append [
    "ACE_HandFlare_Green","ACE_HandFlare_Red","ACE_HandFlare_White","ACE_HandFlare_Yellow","ACE_M14","ACE_Chemlight_HiBlue","ACE_Chemlight_HiGreen","ACE_Chemlight_HiRed","ACE_Chemlight_HiWhite","ACE_Chemlight_HiYellow","ACE_Chemlight_IR","ACE_Chemlight_Orange","ACE_Chemlight_UltraHiOrange","ACE_Chemlight_White","ACE_M84","ACE_HuntIR_M203","ACE_40mm_Flare_white","ACE_40mm_Flare_green","ACE_40mm_Flare_red","ACE_40mm_Flare_ir","ACE_30Rnd_556x45_Stanag_M995_AP_mag","ACE_30Rnd_556x45_Stanag_Mk262_mag","ACE_30Rnd_556x45_Stanag_Mk318_mag","ACE_30Rnd_556x45_Stanag_Tracer_Dim","ACE_20Rnd_762x51_Mag_Tracer_Dim","ACE_20Rnd_762x51_M118LR_Mag","ACE_20Rnd_762x51_M993_AP_Mag","ACE_20Rnd_762x51_Mk316_Mod_0_Mag","ACE_20Rnd_762x51_Mk319_Mod_0_Mag","ACE_20Rnd_762x51_Mag_SD","ACE_20Rnd_762x51_Mag_Tracer","ACE_10Rnd_762x67_Berger_Hybrid_OTM_Mag","ACE_10Rnd_762x67_Mk248_Mod_0_Mag","ACE_10Rnd_762x67_Mk248_Mod_1_Mag","ACE_10Rnd_338_300gr_HPBT_Mag","ACE_10Rnd_338_API526_Mag","ACE_7Rnd_408_305gr_Mag"
    ];
    arsenalWeapons append [
      "ACE_Flashlight_Maglite_ML300L"  
    ];
    {
        [_x, [], true] call ace_arsenal_fnc_initBox;
        [_x, arsenalBackpacks, true] call ace_arsenal_fnc_addVirtualItems;
        [_x, arsenalGear, true] call ace_arsenal_fnc_addVirtualItems;
        [_x, arsenalItems, true] call ace_arsenal_fnc_addVirtualItems;
        [_x, arsenalMags, true] call ace_arsenal_fnc_addVirtualItems;
        [_x, arsenalWeapons, true] call ace_arsenal_fnc_addVirtualItems;

        [_x, false, [0, 0, 0], 0, false] call ace_dragging_fnc_setDraggable;
        [_x, false, [0, 0, 0], 0, false] call ace_dragging_fnc_setCarryable;
    } forEach _boxes;
    } else {
        {
        ["AmmoboxInit", [_x, false, true]] call BIS_fnc_arsenal;
        [_x, arsenalBackpacks, true, true] call BIS_fnc_addVirtualBackpackCargo;
        [_x, arsenalGear, true, true] call BIS_fnc_addVirtualItemCargo;
        [_x, arsenalItems, true, true] call BIS_fnc_addVirtualItemCargo;
        [_x, arsenalMags, true, true] call BIS_fnc_addVirtualMagazineCargo;
        [_x, arsenalWeapons, true, true] call BIS_fnc_addVirtualWeaponCargo;

    } forEach _boxes;
};