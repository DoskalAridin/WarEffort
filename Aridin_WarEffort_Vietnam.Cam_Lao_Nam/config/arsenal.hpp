ArsenalBoxes = [ArsenalBox,ArsenalBox_1,ArsenalBox_2,ArsenalBox_3,ArsenalBox_4];
{
[_x, [], true] call ace_arsenal_fnc_initBox;
[_x, [
//Primary
"vn_m45","vn_m45_camo","vn_m45_fold","vn_s_m45_camo","vn_s_m45","vn_m45_mag","vn_m45_t_mag",
"vn_m1carbine","vn_m1carbine_gl","vn_o_3x_m84","vn_b_carbine","vn_carbine_15_mag","vn_carbine_15_t_mag","vn_carbine_30_mag","vn_carbine_30_t_mag",
"vn_22mm_cs_mag","vn_22mm_lume_mag","vn_22mm_m17_frag_mag","vn_22mm_m19_wp_mag","vn_22mm_m1a2_frag_mag","vn_22mm_m22_smoke_mag","vn_22mm_m9_heat_mag",
"vn_m14","vn_m14_camo","vn_o_9x_m14","vn_o_anpvs2_m14","vn_b_m14","vn_s_m14","vn_b_camo_m14","vn_m14_10_mag","vn_m14_10_t_mag","vn_m14_mag","vn_m14_t_mag",
"vn_m16","vn_m16_camo","vn_m16_xm148","vn_o_9x_m16","vn_o_4x_m16","vn_o_anpvs2_m16","vn_b_m16","vn_s_m16","vn_m16_20_mag","vn_m16_40_mag","vn_m16_20_t_mag","vn_m16_40_t_mag","vn_m16_30_mag","vn_m16_30_t_mag",
"vn_40mm_m381_he_mag","vn_40mm_m397_ab_mag","vn_40mm_m406_he_mag","vn_40mm_m433_hedp_mag","vn_40mm_m583_flare_w_mag","vn_40mm_m651_cs_mag","vn_40mm_m661_flare_g_mag","vn_40mm_m662_flare_r_mag","vn_40mm_m680_smoke_w_mag","vn_40mm_m682_smoke_r_mag","vn_40mm_m695_flare_y_mag","vn_40mm_m715_smoke_g_mag","vn_40mm_m716_smoke_y_mag","vn_40mm_m717_smoke_p_mag",
"vn_m1897","vn_b_m1897","vn_m1897_buck_mag","vn_m1897_fl_mag",
"vn_m2carbine","vn_m2carbine_gl",
"vn_m3carbine",
"vn_m3a1","vn_s_m3a1","vn_m3a1_mag","vn_m3a1_t_mag",
"vn_m40a1","vn_m40a1_camo","vn_o_9x_m40a1","vn_o_anpvs2_m40a1","vn_b_camo_m40a1","vn_m40a1_mag","vn_m40a1_t_mag",
"vn_m60","vn_m60_shorty","vn_m60_shorty_camo","vn_m60_100_mag",
"vn_m63a","vn_m63a_30_mag","vn_m63a_30_t_mag",
"vn_m63a_cdo","vn_m63a_150_mag","vn_m63a_150_t_mag",
"vn_m63a_lmg","vn_m63a_100_mag","vn_m63a_100_t_mag",
"vn_m79",
"vn_mat49","vn_mat49_f","vn_s_mat49","vn_mat49_vc","vn_mat49_mag","vn_mat49_t_mag",
"vn_mc10","vn_s_mc10","vn_mc10_mag","vn_mc10_t_mag",
"vn_rpd","vn_rpd_shorty_01","vn_rpd_100_mag","vn_rpd_125_mag",
"vn_sten","vn_s_sten","vn_sten_mag","vn_sten_t_mag",
"vn_type56","vn_b_type56","vn_type56_mag","vn_type56_t_mag",
"vn_xm177","vn_xm177_camo","vn_xm177_fg","vn_xm177_short","vn_xm177_stock","vn_xm177_stock_camo","vn_xm177_xm148","vn_xm177_xm148_camo",
"vn_m1928_tommy","vn_m1928a1_tommy","vn_m1a1_tommy","vn_m1a1_tommy_so","vn_m1a1_20_mag","vn_m1a1_20_t_mag","vn_m1a1_30_mag","vn_m1a1_30_t_mag","vn_m1928_mag","vn_m1928_t_mag",
"vn_mk1_udg","vn_mk1_udg_mag",
"vn_mpu","vn_s_mpu","vn_mpu_mag","vn_mpu_t_mag",
"vn_ak_01",
"vn_dp28","vn_dp28_mag",
"vn_f1_smg","vn_b_l1a1","vn_f1_smg_mag","vn_f1_smg_t_mag",
"vn_gau5a","vn_o_1x_sp_m16",
"vn_izh54","vn_izh54_mag",
"vn_izh54_shorty","vn_izh54_so_mag",
"vn_k50m","vn_ppsh41_35_mag","vn_ppsh41_35_t_mag","vn_ppsh41_71_mag","vn_ppsh41_71_t_mag",
"vn_k98k","vn_o_1_5x_k98k","vn_b_k98k","vn_b_camo_k98k","vn_k98k_mag","vn_k98k_t_mag",
"vn_kbkg","vn_kbkg_mag","vn_kbkg_t_mag",
"vn_kbkg_gl","vn_20mm_dgn_wp_mag","vn_20mm_f1n60_frag_mag","vn_20mm_kgn_frag_mag","vn_20mm_pgn60_heat_mag",
"vn_l1a1_01","vn_o_3x_l1a1","vn_l1a1_10_mag","vn_l1a1_10_t_mag","vn_l1a1_20_mag","vn_l1a1_20_t_mag","vn_l1a1_30_mag","vn_l1a1_30_t_mag","vn_l1a1_30_02_mag","vn_l1a1_30_02_t_mag",
"vn_l1a1_01_camo","vn_l1a1_01_gl","vn_l1a1_02","vn_l1a1_02_camo","vn_l1a1_02_gl","vn_l1a1_03","vn_l1a1_03_camo","vn_l1a1_xm148","vn_l1a1_xm148_camo","vn_l2a1_01",
"vn_l2a3","vn_l2a3_f","vn_l34a1","vn_l34a1_f","vn_l34a1_xm148",
"vn_l4",
"vn_m45",
"vn_m1carbine_shorty",
"vn_m1_garand","vn_b_m1_garand","vn_b_camo_m1_garand","vn_m1_garand_mag","vn_m1_garand_t_mag",
"vn_m1_garand_gl",
"vn_m14a1","vn_bipod_m14",
"vn_m14a1_shorty","vn_o_m14_front",
"vn_m16_usaf",
"vn_m16_m203",
"vn_m1891","vn_b_m38","vn_m38_mag","vn_m38_t_mag",
"vn_m1903_gl","vn_m1903_mag","vn_m1903_t_mag",
"vn_m1903","vn_o_8x_m1903","vn_b_m1903","vn_b_camo_m1903",
"vn_m1918","vn_bipod_m1918","vn_m1918_mag","vn_m1918_t_mag",
"vn_m36","vn_b_m36","vn_b_camo_m36","vn_m36_mag","vn_m36_t_mag",
"vn_m38",
"vn_m4956","vn_o_4x_m4956","vn_b_m4956","vn_m4956_10_mag","vn_m4956_10_t_mag",
"vn_m4956_gl",
"vn_m9130","vn_o_3x_m9130","vn_b_camo_m9130",
"vn_mg42","vn_mg42_50_mag","vn_mg42_50_t_mag",
"vn_mp40","vn_mp40_mag","vn_mp40_t_mag",
"vn_pk","vn_pk_100_mag",
"vn_pps43","vn_pps_mag","vn_pps_t_mag",
"vn_pps52",
"vn_ppsh41","vn_ppsh41_35_mag","vn_ppsh41_35_t_mag","vn_ppsh41_71_mag","vn_ppsh41_71_t_mag",
"vn_rpd_shorty",
"vn_sks","vn_o_3x_sks","vn_b_sks","vn_sks_mag","vn_sks_t_mag",
"vn_sks_gl",
"vn_svd","vn_o_4x_svd","vn_b_camo_svd","vn_svd_mag","vn_svd_t_mag",
"vn_type64_smg","vn_type64_smg_mag","vn_type64_smg_t_mag",
"vn_type64_f_smg",
"vn_vz61","vn_vz61_mag","vn_vz61_t_mag",
"vn_vz54","vn_o_3x_vz54","vn_b_camo_vz54",
"vn_xm16e1","vn_xm16e1_xm148","vn_xm177e1","vn_xm177e1_camo","vn_xm177","vn_xm177_camo","vn_xm177_fg","vn_xm177_m203","vn_xm177_m203_camo","vn_xm177_short","vn_xm177_stock","vn_xm177_stock_camo","vn_xm177_xm148","vn_xm177_xm148_camo",

//Sidearms
"vn_p38s","vn_m10_mag",
"vn_fkb1","vn_fkb1_red",
"vn_hd","vn_hd_mag",
"vn_hp","vn_s_hp","vn_hp_mag",
"vn_m1911","vn_mx991_m1911","vn_s_m1911","vn_m1911_mag",
"vn_m79_p",
"vn_mk22","vn_s_mk22","vn_mk22_mag",
"vn_m10",
"vn_mx991","vn_mx991_red",
"vn_pm","vn_fkb1_pm","vn_s_pm","vn_pm_mag",
"vn_welrod","vn_welrod_mag",
"vn_izh54_p",
"vn_m1895","vn_s_m1895","vn_m1895_mag",
"vn_m712","vn_m712_mag",
"vn_p38","vn_s_ppk","vn_p38_mag",
"vn_ppk","vn_ppk_mag",
"vn_tt33","vn_tt33_mag",
"vn_type64","vn_type64_mag",
"vn_vz61_p",

//launchers
"vn_m127","vn_m127_mag","vn_m128_mag","vn_m129_mag",
"vn_m72","vn_m72_mag",
"vn_sa7","vn_sa7_mag",
"vn_sa7b","vn_sa7b_mag",
"vn_rpg2","vn_rpg2_fuze_mag","vn_rpg2_mag",
"vn_rpg7","RPG7_F","vn_rpg7_mag",
"vn_m20a1b1_01","vn_m20a1b1_heat_mag","vn_m20a1b1_wp_mag",

//headgear
//Bandana
"vn_b_bandana_03","vn_b_bandana_06","vn_b_bandana_01","vn_b_bandana_07","vn_b_bandana_04","vn_b_bandana_05","vn_b_bandana_02",

//Beret
"vn_b_beret_01_05","vn_b_beret_01_06","vn_b_beret_04_01","vn_b_beret_01_07","vn_b_beret_03_01","vn_b_beret_01_09","vn_b_beret_01_10","vn_b_beret_01_11",
//Boonie
"vn_b_boonie_02_03","vn_b_boonie_02_06","vn_b_boonie_02_01","vn_b_boonie_02_07","vn_b_boonie_02_04","vn_b_boonie_02_05","vn_b_boonie_02_02","vn_b_boonie_03_03","vn_b_boonie_03_06","vn_b_boonie_03_01","vn_b_boonie_03_07","vn_b_boonie_03_04","vn_b_boonie_03_05","vn_b_boonie_03_02","vn_b_boonie_04_03","vn_b_boonie_04_06","vn_b_boonie_04_01","vn_b_boonie_04_07","vn_b_boonie_04_04","vn_b_boonie_04_05","vn_b_boonie_04_02","vn_b_boonie_05_03","vn_b_boonie_05_06","vn_b_boonie_05_01","vn_b_boonie_05_07","vn_b_boonie_05_04","vn_b_boonie_05_05","vn_b_boonie_05_02","vn_b_boonie_01_03","vn_b_boonie_01_06","vn_b_boonie_01_01","vn_b_boonie_01_07","vn_b_boonie_01_04","vn_b_boonie_01_05","vn_b_boonie_01_02",

//Boonie ANZAC
"vn_b_boonie_08_02","vn_b_boonie_08_01","vn_b_boonie_07_02","vn_b_boonie_07_01","vn_b_boonie_06_02","vn_b_boonie_06_01",

//Boonie hat
"vn_o_boonie_vc_01_02","vn_o_boonie_vc_01_01",

//Headband
"vn_b_headband_03","vn_c_headband_04","vn_c_headband_03","vn_b_headband_05","vn_b_headband_08","vn_c_headband_02","vn_b_headband_01","vn_c_headband_01","vn_b_headband_04","vn_b_headband_02",

//M1
"vn_b_helmet_m1_01_02","vn_b_helmet_m1_01_01","vn_b_helmet_m1_02_02","vn_b_helmet_m1_02_01","vn_b_helmet_m1_03_02","vn_b_helmet_m1_03_01","vn_b_helmet_m1_05_02","vn_b_helmet_m1_05_01","vn_b_helmet_m1_06_02","vn_b_helmet_m1_06_01","vn_b_helmet_m1_07_02","vn_b_helmet_m1_07_01","vn_b_helmet_m1_09_02","vn_b_helmet_m1_09_01","vn_b_helmet_m1_04_02","vn_b_helmet_m1_04_01","vn_b_helmet_m1_08_02","vn_b_helmet_m1_08_01","vn_b_helmet_m1_12_01","vn_b_helmet_m1_12_02","vn_b_helmet_m1_14_02","vn_b_helmet_m1_14_01","vn_b_helmet_m1_15_02","vn_b_helmet_m1_15_01","vn_b_helmet_m1_16_02","vn_b_helmet_m1_16_01","vn_b_helmet_m1_18_02","vn_b_helmet_m1_18_01","vn_b_helmet_m1_19_02","vn_b_helmet_m1_19_01","vn_b_helmet_m1_17_02","vn_b_helmet_m1_17_01",

//M1 Net
"vn_b_helmet_m1_10_01","vn_b_helmet_m1_11_01","vn_i_helmet_m1_02_01","vn_i_helmet_m1_03_01",

//PL cap
"vn_o_pl_cap_02_02","vn_o_pl_cap_02_01","vn_o_pl_cap_01_01","vn_o_cap_03",

//APH6
"vn_b_helmet_aph6_01_02","vn_b_helmet_aph6_02_02","vn_b_helmet_aph6_01_05","vn_b_helmet_aph6_02_05","vn_b_helmet_aph6_01_03","vn_b_helmet_aph6_02_03","vn_b_helmet_aph6_01_04","vn_b_helmet_aph6_02_04","vn_b_helmet_aph6_01_01","vn_b_helmet_aph6_02_01",

//ASVH4
"vn_b_helmet_svh4_01_01","vn_b_helmet_svh4_02_01","vn_b_helmet_svh4_01_04","vn_b_helmet_svh4_02_04","vn_b_helmet_svh4_01_02","vn_b_helmet_svh4_02_02","vn_b_helmet_svh4_01_05","vn_b_helmet_svh4_02_05","vn_b_helmet_svh4_01_06","vn_b_helmet_svh4_02_06","vn_b_helmet_svh4_01_03","vn_b_helmet_svh4_02_03",

//T56
"vn_b_helmet_t56_01_01","vn_b_helmet_t56_02_01","vn_b_helmet_t56_01_02","vn_b_helmet_t56_02_02","vn_b_helmet_t56_01_03","vn_b_helmet_t56_02_03",

//Non la
"vn_c_conehat_02","vn_c_conehat_01",

//Uniform
//MACV
"vn_b_uniform_macv_01_03","vn_b_uniform_macv_01_06","vn_b_uniform_macv_01_08","vn_b_uniform_macv_01_07","vn_b_uniform_macv_01_01","vn_b_uniform_macv_01_04","vn_b_uniform_macv_01_05","vn_b_uniform_macv_01_02","vn_b_uniform_macv_02_06","vn_b_uniform_macv_02_08","vn_b_uniform_macv_02_07","vn_b_uniform_macv_02_01","vn_b_uniform_macv_02_05","vn_b_uniform_macv_02_02","vn_b_uniform_macv_03_06","vn_b_uniform_macv_03_08","vn_b_uniform_macv_03_07","vn_b_uniform_macv_03_01","vn_b_uniform_macv_03_05","vn_b_uniform_macv_03_02","vn_b_uniform_macv_04_06","vn_b_uniform_macv_04_08","vn_b_uniform_macv_04_07","vn_b_uniform_macv_04_01","vn_b_uniform_macv_04_05","vn_b_uniform_macv_04_02","vn_b_uniform_macv_05_06","vn_b_uniform_macv_05_08","vn_b_uniform_macv_05_07","vn_b_uniform_macv_05_01","vn_b_uniform_macv_05_05","vn_b_uniform_macv_05_02","vn_b_uniform_macv_06_06","vn_b_uniform_macv_06_08","vn_b_uniform_macv_06_07","vn_b_uniform_macv_06_01","vn_b_uniform_macv_06_05","vn_b_uniform_macv_06_02",

//ARVN
"vn_b_uniform_macv_01_17","vn_b_uniform_macv_02_17","vn_b_uniform_macv_03_17","vn_b_uniform_macv_04_17","vn_b_uniform_macv_05_17","vn_b_uniform_macv_06_17",

//SOG
"vn_b_uniform_sog_01_03","vn_b_uniform_sog_01_01","vn_b_uniform_sog_01_04","vn_b_uniform_sog_01_06","vn_b_uniform_sog_01_02","vn_b_uniform_sog_01_05","vn_b_uniform_sog_02_03","vn_b_uniform_sog_02_01","vn_b_uniform_sog_02_04","vn_b_uniform_sog_02_06","vn_b_uniform_sog_02_02","vn_b_uniform_sog_02_05",

//AUS
"vn_b_uniform_aus_01_01","vn_b_uniform_aus_10_01","vn_b_uniform_aus_02_01","vn_b_uniform_aus_03_01","vn_b_uniform_aus_04_01","vn_b_uniform_aus_05_01","vn_b_uniform_aus_06_01","vn_b_uniform_aus_07_01","vn_b_uniform_aus_08_01","vn_b_uniform_aus_09_01",

//NZ
"vn_b_uniform_nz_01_01","vn_b_uniform_nz_02_01","vn_b_uniform_nz_03_01","vn_b_uniform_nz_04_01","vn_b_uniform_nz_05_01","vn_b_uniform_nz_06_01",

//RLA
"vn_b_uniform_macv_01_16","vn_b_uniform_macv_02_16","vn_b_uniform_macv_03_16","vn_b_uniform_macv_04_16","vn_b_uniform_macv_05_16","vn_b_uniform_macv_06_16",

//ROK
"vn_b_uniform_macv_01_18","vn_b_uniform_macv_02_18","vn_b_uniform_macv_03_18","vn_b_uniform_macv_04_18","vn_b_uniform_macv_05_18","vn_b_uniform_macv_06_18",

//SAS
"vn_b_uniform_sas_01_06","vn_b_uniform_sas_02_06","vn_b_uniform_sas_03_06",

//ANZAC
"vn_b_vest_anzac_09","vn_b_vest_anzac_10","vn_b_vest_anzac_04","vn_b_vest_anzac_06","vn_b_vest_anzac_05","vn_b_vest_anzac_07","vn_b_vest_anzac_08","vn_b_vest_anzac_01","vn_b_vest_anzac_02","vn_b_vest_anzac_03",

//Army
"vn_b_vest_usarmy_11","vn_b_vest_usarmy_12","vn_b_vest_usarmy_13","vn_b_vest_usarmy_14","vn_b_vest_usarmy_10","vn_b_vest_usarmy_05","vn_b_vest_usarmy_08","vn_b_vest_usarmy_07","vn_b_vest_usarmy_06","vn_b_vest_usarmy_09","vn_b_vest_aircrew_03","vn_b_vest_aircrew_05","vn_b_vest_usarmy_02","vn_b_vest_usarmy_03","vn_b_vest_usarmy_04","vn_b_vest_usarmy_01",

//SAS
"vn_b_vest_sas_02","vn_b_vest_sas_03","vn_b_vest_sas_04","vn_b_vest_sas_01",

//SEAL
"vn_b_vest_seal_01","vn_b_vest_seal_07","vn_b_vest_seal_06","vn_b_vest_seal_03","vn_b_vest_seal_04","vn_b_vest_seal_05","vn_b_vest_seal_02",

//SOG
"vn_b_vest_sog_03","vn_b_vest_sog_05","vn_b_vest_sog_06","vn_b_vest_sog_02","vn_b_vest_sog_01","vn_b_vest_sog_04",

//Air crew | USAF
"vn_b_vest_aircrew_01","vn_b_vest_aircrew_02","vn_b_vest_aircrew_06","vn_b_vest_aircrew_04","vn_b_vest_aircrew_07",

//USMC
"vn_b_vest_usmc_05","vn_b_vest_usmc_04","vn_b_vest_usmc_09","vn_b_vest_usmc_03","vn_b_vest_usmc_08","vn_b_vest_usmc_06","vn_b_vest_usmc_01","vn_b_vest_usmc_02","vn_b_vest_usmc_07",

//Backpacks
//statics
"vn_b_pack_static_tow","vn_b_pack_static_m1919a4_low_01","vn_b_pack_static_m1919a4_high_01","vn_b_pack_static_m1919a6_01","vn_b_pack_static_m2_scoped_high_01","vn_b_pack_static_m2_high_01","vn_b_pack_static_m2_scoped_low_01","vn_b_pack_static_m2_low_01","vn_b_pack_static_m2_01","vn_b_pack_static_m29_01","vn_b_pack_static_m60_high_01","vn_b_pack_static_m60_low_01","vn_b_pack_static_base_01","vn_b_pack_static_mk18",

//ANZAC
"vn_b_pack_pfield_01","vn_b_pack_pfield_02","vn_b_pack_p08_01","vn_b_pack_p08_02","vn_b_pack_p08_03","vn_b_pack_p44_01","vn_b_pack_p44_02","vn_b_pack_p44_03",

//Army
"vn_b_pack_lw_04","vn_b_pack_m5_01","vn_b_pack_lw_07","vn_b_pack_lw_05","vn_b_pack_lw_02","vn_b_pack_lw_01","vn_b_pack_lw_06","vn_b_pack_prc77_01","vn_b_pack_lw_03","vn_b_pack_trp_03_02","vn_b_pack_trp_01_02","vn_b_pack_trp_04_02","vn_b_pack_trp_02_02",

//SEAL
"vn_b_pack_seal_01",

//SOG
"vn_b_pack_05","vn_b_pack_02","vn_b_pack_03","vn_b_pack_04","vn_b_pack_01","vn_b_pack_trp_03","vn_b_pack_trp_01","vn_b_pack_trp_04","vn_b_pack_trp_02",

//USMC
"vn_b_pack_m41_01","vn_b_pack_m41_02","vn_b_pack_m41_03","vn_b_pack_m41_04","vn_b_pack_m41_05",

//Parachute
"vn_b_pack_ba18_01","vn_b_pack_ba22_01","vn_b_pack_t10_01",

//Facewear
"vn_b_acc_seal_01",
"vn_b_aviator",
"vn_b_bandana_a","vn_o_bandana_b","vn_o_bandana_g",
"vn_o_acc_goggles_01",
"vn_b_acc_m17_01","vn_b_acc_m17_02",
"vn_b_acc_goggles_01",
"vn_o_acc_km32_01",
"vn_b_acc_ms22001_01","vn_b_acc_ms22001_02",
"vn_o_acc_goggles_02","vn_o_acc_goggles_03",
"vn_o_poncho_01_01",
"vn_b_scarf_01_03","vn_o_scarf_01_04","vn_o_scarf_01_03","vn_o_scarf_01_02","vn_b_scarf_01_01","vn_o_scarf_01_01",
"vn_b_acc_rag_01","vn_b_acc_rag_02",
"vn_b_spectacles","vn_g_spectacles_02","vn_g_spectacles_01","vn_b_squares","vn_b_squares_tinted","vn_g_glasses_01","vn_b_spectacles_tinted",
"vn_b_acc_towel_01","vn_b_acc_towel_02",

"G_Aviator","G_Bandanna_aviator","G_Bandanna_beast","G_Bandanna_blk","G_Bandanna_khk","G_Bandanna_oli","G_Bandanna_tan","G_Spectacles","G_Squares_Tinted","G_Squares","G_Spectacles_Tinted","G_Blindfold_01_black_F","G_Blindfold_01_white_F",

"vn_m19_binocs_grn","vn_m19_binocs_grey","vn_mk21_binocs","vn_anpvs2_binoc",

"vn_b_item_map",
"vn_b_item_compass_sog","vn_b_item_compass",
"vn_b_item_watch",
"vn_b_item_trapkit",

//grenades
//BLUFOR
"vn_m14_grenade_mag","vn_m34_grenade_mag","vn_m61_grenade_mag","vn_m67_grenade_mag","vn_m18_green_mag","vn_m18_purple_mag","vn_m18_red_mag","vn_m18_white_mag","vn_m18_yellow_mag","vn_v40_grenade_mag","vn_m7_grenade_mag","vn_m14_early_grenade_mag","vn_satchelcharge_02_throw_mag",

//OPFOR
"vn_molotov_grenade_mag","vn_chicom_grenade_mag","vn_f1_grenade_mag","vn_rdg2_mag","vn_rg42_grenade_mag","vn_rgd33_grenade_mag","vn_rgd5_grenade_mag","vn_rkg3_grenade_mag","vn_t67_grenade_mag",

//explosives
"vn_mine_m112_remote_mag","vn_mine_ammobox_range_mag","vn_mine_m14_mag","vn_mine_m15_mag","vn_mine_tripwire_m16_02_mag","vn_mine_tripwire_m16_04_mag","vn_mine_m16_mag","vn_mine_m18_range_mag","vn_mine_m18_mag","vn_mine_m18_x3_range_mag","vn_mine_m18_x3_mag","vn_mine_tripwire_m49_02_mag","vn_mine_tripwire_m49_04_mag","vn_mine_tripwire_f1_02_mag","vn_mine_tripwire_f1_04_mag","vn_mine_tripwire_arty_mag","vn_mine_m18_wp_range_mag","vn_mine_m18_wp_mag","vn_mine_m18_fuze10_mag","vn_mine_m18_wp_fuze10_mag","vn_mine_mortar_range_mag","vn_mine_satchel_remote_02_mag",

//tools
"vn_b_item_firstaidkit","vn_b_item_medikit_01","vn_b_item_toolkit","vn_b_item_wiretap",

//melee
"vn_m_axe_01", "vn_m_axe_fire", "vn_m_bayo_carbine", "vn_m_bayo_m14", "vn_m_bayo_m16", "vn_m_bayo_m1897", "vn_m_bayo_m4956", "vn_m_bolo_01", "vn_m_fighting_knife_01", "vn_m_hammer", "vn_m_m51_etool_01", "vn_m_machete_01", "vn_m_machete_02", "vn_m_mk2_knife_01", "vn_m_shovel_01", "vn_m_typeivaxe_01", "vn_m_vc_knife_01", "vn_m_wrench_01",

//Food
"vn_prop_drink_05","vn_prop_drink_01","vn_prop_drink_03","vn_prop_drink_02","vn_prop_drink_04","vn_prop_drink_06","vn_prop_food_fresh_03","vn_prop_food_fresh_09","vn_prop_food_fresh_05","vn_prop_drink_07_02","vn_prop_food_lrrp_01_04","vn_prop_food_lrrp_01_01","vn_prop_food_lrrp_01_07","vn_prop_food_lrrp_01_08","vn_prop_food_lrrp_01_05","vn_prop_food_lrrp_01_02","vn_prop_food_lrrp_01_06","vn_prop_food_lrrp_01_03","vn_prop_food_meal_01_17","vn_prop_food_meal_01_04","vn_prop_food_meal_01_13","vn_prop_food_meal_01_03","vn_prop_food_meal_01_15","vn_prop_food_meal_02_04","vn_prop_food_meal_01_10","vn_prop_food_meal_02_01","vn_prop_food_meal_02_03","vn_prop_food_meal_02_05","vn_prop_food_meal_02_02","vn_prop_food_meal_01_08","vn_prop_food_meal_01_14","vn_prop_food_meal_01_09","vn_prop_food_meal_01_01","vn_prop_food_meal_01_12","vn_prop_food_meal_01_05","vn_prop_food_meal_01_11","vn_prop_food_meal_01_18","vn_prop_food_meal_02_06","vn_prop_food_meal_01_06","vn_prop_food_meal_01_16","vn_prop_food_meal_01_02","vn_prop_food_meal_01_07","vn_prop_med_antibiotics","vn_prop_med_antimalaria","vn_prop_med_antivenom","vn_prop_med_dysentery","vn_prop_med_painkillers","vn_prop_med_wormpowder","vn_prop_drink_07_03","vn_prop_food_fresh_01","vn_prop_food_pir_01_01","vn_prop_food_pir_01_02","vn_prop_food_pir_01_04","vn_prop_food_pir_01_05","vn_prop_food_pir_01_03","vn_prop_food_fresh_06","vn_prop_food_fresh_02","vn_prop_food_box_02_03","vn_prop_food_box_02_07","vn_prop_food_box_02_08","vn_prop_food_box_02_01","vn_prop_food_box_02_02","vn_prop_food_box_01_01","vn_prop_food_box_01_03","vn_prop_food_box_01_02","vn_prop_food_box_02_06","vn_prop_food_box_02_04","vn_prop_food_box_02_05","vn_prop_food_can_02_06","vn_prop_food_can_01_10","vn_prop_food_can_01_11","vn_prop_food_can_02_05","vn_prop_food_can_02_03","vn_prop_food_can_02_01","vn_prop_food_can_01_01","vn_prop_food_can_03_04","vn_prop_food_can_01_07","vn_prop_food_can_01_08","vn_prop_food_can_01_14","vn_prop_food_can_01_15","vn_prop_food_can_01_05","vn_prop_food_can_02_02","vn_prop_food_can_01_04","vn_prop_food_can_03_02","vn_prop_food_can_02_07","vn_prop_food_can_03_01","vn_prop_food_can_02_08","vn_prop_food_can_01_13","vn_prop_food_can_03_03","vn_prop_food_can_01_09","vn_prop_food_can_01_12","vn_prop_food_can_02_04","vn_prop_food_can_01_02","vn_prop_food_can_01_06","vn_prop_food_can_01_03","vn_prop_food_can_01_16","vn_prop_food_meal_01","vn_prop_food_fresh_10","vn_prop_food_sack_01","vn_prop_food_sack_02","vn_prop_fort_mag","vn_prop_drink_08_01","vn_prop_food_fresh_04","vn_prop_food_fresh_07","vn_prop_food_fresh_08","vn_prop_drink_07_01","vn_prop_drink_09_01",

//Facewear
"G_SWDG","G_SWDG_low","G_Anduk_1","G_Anduk_2",

//ACE
"ACE_painkillers","ACE_suture","ACE_fieldDressing","ACE_elasticBandage","ACE_packingBandage","ACE_quikclot","ACE_bloodIV","ACE_bloodIV_250","ACE_bloodIV_500","ACE_bodyBag","ACE_CableTie","ACE_DefusalKit","ACE_EarPlugs","ACE_EntrenchingTool","ACE_epinephrine","ACE_Flashlight_MX991","ACE_Clacker","ACE_MapTools","ACE_morphine","ACE_adenosine","ACE_RangeCard","ACE_salineIV","ACE_salineIV_250","ACE_salineIV_500","ACE_splint","ACE_surgicalKit","ACE_tourniquet","ACRE_VHF30108","ACE_Fortify","ACE_rope12","ACE_rope15","ACE_rope18","ACE_rope27","ACE_rope3","ACE_rope36","ACE_rope6","ace_marker_flags_black","ace_marker_flags_blue","ace_marker_flags_green","ace_marker_flags_orange","ace_marker_flags_purple","ace_marker_flags_red","ace_marker_flags_white","ace_marker_flags_yellow","acex_intelitems_notepad","ACE_PlottingBoard"
], true] call ace_arsenal_fnc_addVirtualItems;

[_x, false, [0, 0, 0], 0, false] call ace_dragging_fnc_setDraggable;
[_x, false, [0, 0, 0], 0, false] call ace_dragging_fnc_setCarryable;

} forEach ArsenalBoxes;

if (isClass (configFile >> "CfgPatches" >> "murshun_cigs")) then {
    {
    [_x, [
       "murshun_cigs_cigpack","murshun_cigs_lighter","immersion_pops_poppack","murshun_cigs_matches","murshun_cigs_cig0_nv","immersion_cigs_cigar0","murshun_cigs_cig0","immersion_pops_pop0","immersion_cigs_cigar0_nv"
    ], true] call ace_arsenal_fnc_addVirtualItems;
    } forEach ArsenalBoxes;
};

if (isClass (configFile >> "CfgPatches" >> "acre_main")) then {
    {
    [_x, [
        "ACRE_PRC77","ACRE_PRC343"
    ], true] call ace_arsenal_fnc_addVirtualItems;
    } forEach ArsenalBoxes;
};

if (isClass (configFile >> "CfgPatches" >> "tfar_core")) then {
    {
    [_x, [
        "vn_b_item_radio_urc10"
    ], true] call ace_arsenal_fnc_addVirtualItems;
    } forEach ArsenalBoxes;
};

if (isClass (configFile >> "CfgPatches" >> "simc_mc_67_core")) then {
    {
    [_x, [
        "G_SWDG","G_SWDG_low","G_Anduk_1","G_Anduk_2","U_Simc_TCU_tee_top_weiss","U_Simc_TCU_tee_long_weiss","U_Simc_TCU_tee_long","U_Simc_TCU_tee_weiss","U_Simc_TCU_tee_top","U_Simc_TCU_mk1_blench","U_Simc_TCU_mk1_roll_blench","U_Simc_TCU_mk1_trop_blench","U_Simc_TCU_mk2_blench","U_Simc_TCU_mk2_trop_blench","U_Simc_TCU_mk2_roll_blench","U_Simc_TCU_mk3_poplijn_blench","U_Simc_TCU_mk3_trop_blench","U_Simc_TCU_mk3_blench","U_Simc_TCU_mk3_poplijn_trop_blench","U_Simc_TCU_mk3_tuck","U_Simc_TCU_mk3_erdl_H_low","U_Simc_TCU_mk3_erdl_H_top","U_Simc_TCU_mk3_erdl_H","U_Simc_TCU_mk3_erdl_H_trop","U_Simc_TCU_tee_erdl_high_long","U_Simc_TCU_tee_erdl_high","U_Simc_TCU_tee_erdl_high_top","U_Simc_TCU_mk3_leg","U_Simc_TCU_mk1_leg_roll","U_Simc_TCU_mk1_leg","U_Simc_TCU_mk3_leg_roll","V_Simc_56","V_Simc_56_ligt_zusp","V_Simc_56_alt","V_Simc_56_ligt_2","V_Simc_56_ligt","V_Simc_56_4cm","V_Simc_56_4cm_ligt_alt","V_Simc_56_4cm_ligt","V_Simc_56_bandoleer","V_Simc_56_frag","V_Simc_56_frag_alt","V_Simc_56_frag_3","V_Simc_56_frag_ligt","V_Simc_56_frag_ligt_3","V_Simc_56_frag_ligt_b","V_Simc_56_M43","V_Simc_56_M43_ligt","V_Simc_56_M43_ligt_2","V_Simc_56_M43_bandoleer","V_Simc_56_M43_frags_ass","V_Simc_56_M43_frags","V_Simc_56_M43_frags_zusp","V_Simc_56_M43_45_ass","V_Simc_56_M43_45","V_Simc_56_M43_45_ligt","V_Simc_67","V_Simc_67_ass","V_Simc_67_frag_ass","V_Simc_67_frag","V_Simc_67_frag_ligt","V_Simc_67_ligt","V_Simc_67_45","V_Simc_67_45_ass","V_Simc_67_45_ligt","V_Simc_56_claymore","V_Simc_56_claymore_band","V_Simc_56_med","V_Simc_56_med_side","V_Simc_56_med_side_ass","V_Simc_56_60_ligt_zusp","V_Simc_56_60_doppel_ligt","V_Simc_56_60","V_Simc_56_60_doppel","V_Simc_56_60_ligt","V_Simc_56_45","V_Simc_56_45_alt","V_Simc_56_45_ligt_alt","V_Simc_56_45_ligt","V_Simc_56_45_ligt_zusp","V_Simc_56_45_B_ass","V_Simc_56_45_B","V_Simc_56_claymore_45_band","V_Simc_56_claymore_45","B_simc_rajio_4","B_simc_rajio_2_a","B_simc_rajio_2","B_simc_rajio_base","B_simc_rajio_1","B_simc_rajio_3_alt","B_simc_rajio_M43_1","B_simc_rajio_3","B_simc_rajio_Frem_Ligt","B_simc_rajio_Frem","B_simc_rajio_Frem_2","B_simc_ARVN_ruck_gump","B_simc_ARVN_ruck_sheen","B_simc_pack_frem_3","B_simc_pack_frem_8","B_simc_pack_frem_2_alt","B_simc_pack_frem_1_alt","B_simc_pack_frem_1","B_simc_pack_frem_2","B_simc_pack_frem_empty","B_simc_pack_frem_qt","B_simc_pack_frem_5_alt","B_simc_pack_frem_4","B_simc_pack_frem_0","B_simc_pack_frem_6_alt","B_simc_pack_frem_7","B_simc_pack_frem_9","B_simc_pack_frem_3_b","B_simc_pack_frem_3_a","B_simc_pack_frem_med3","B_simc_pack_frem_med5","B_simc_pack_med_m3","B_simc_pack_med_m5","B_claymore_sack","B_simc_pack_trop_1_alt","B_simc_pack_trop_1","B_simc_pack_trop_2","B_simc_pack_trop_3","B_simc_pack_trop_4_alt","B_simc_pack_trop_4","B_simc_pack_trop_6","B_simc_pack_trop_5","B_simc_pack_trop_6_alt","B_simc_US_Bandoleer_556_1","B_simc_US_Bandoleer_556_fore","B_simc_US_Bandoleer_556_3","B_simc_US_Bandoleer_60_R","B_simc_US_Bandoleer_60_L","B_simc_US_Bandoleer_60","B_simc_US_Bandoleer_556_doppel_2","B_simc_US_Bandoleer_556_doppel_1v"
    ], true] call ace_arsenal_fnc_addVirtualItems;
    } forEach ArsenalBoxes;
};

if (isClass (configFile >> "CfgPatches" >> "ARDN_sogpf")) then {
    {
    [_x, [
        "ARDN_ace_pak","ARDN_main_viper","ARDN_main_viper_rubber","ARDN_sogpf_b_pack_bike","ARDN_sogpf_h_m1_gar","ARDN_sogpf_h_m1_intrepid","ARDN_sogpf_b_u_macv_04_01_eff","ARDN_sogpf_b_u_macv_04_01_mummy","ARDN_sogpf_b_u_macv_04_01_watersnake","ARDN_sogpf_b_u_macv_05_01_anubis","ARDN_sogpf_b_u_macv_05_01_do","ARDN_sogpf_b_u_macv_05_01_eff","ARDN_sogpf_b_u_macv_05_01_mummy","ARDN_sogpf_b_u_macv_05_01_watersnake","ARDN_sogpf_b_u_macv_06_01_anubis","ARDN_sogpf_b_u_macv_06_01_do","ARDN_sogpf_b_u_macv_06_01_eff","ARDN_sogpf_b_u_macv_06_01_mummy","ARDN_sogpf_b_u_macv_06_01_watersnake","ARDN_sogpf_b_u_sog_01_blkTgr","ARDN_sogpf_b_u_sog_02_blkTgr","ARDN_sogpf_b_u_macv_01_01_anubis","ARDN_sogpf_b_u_macv_01_01_do","ARDN_sogpf_b_u_macv_01_01_eff","ARDN_sogpf_b_u_macv_01_01_mummy","ARDN_sogpf_b_u_macv_01_01_watersnake","ARDN_sogpf_b_u_macv_02_01_anubis","ARDN_sogpf_b_u_macv_02_01_do","ARDN_sogpf_b_u_macv_02_01_eff","ARDN_sogpf_b_u_macv_02_01_mummy","ARDN_sogpf_b_u_macv_02_01_watersnake","ARDN_sogpf_b_u_macv_03_01_anubis","ARDN_sogpf_b_u_macv_03_01_do","ARDN_sogpf_b_u_macv_03_01_eff","ARDN_sogpf_b_u_macv_03_01_mummy","ARDN_sogpf_b_u_macv_03_01_watersnake","ARDN_sogpf_b_u_macv_04_01_anubis","ARDN_sogpf_b_u_macv_04_01_do"
    ], true] call ace_arsenal_fnc_addVirtualItems;
    } forEach ArsenalBoxes;
};

