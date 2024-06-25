compat_ace = false;
compat_cigs = false;
compat_acre = false;
compat_tfar = false;
compat_ARDN = false;
compat_ARDNCAF = false;
compat_WS = false;
compat_RF = false;
compat_UKSOF = false;
compat_CAFSOF = false;
compat_FRACOS = false;
compat_NORSOF = false;
compat_ADFU = false;
if (isClass(configfile >> "CfgPatches" >> "Characters_f_lxWS")) then {
  compat_WS = true;  
};
if (isClass(configfile >> "CfgPatches" >> "RF_Characters")) then {
  compat_RF = true;  
};
if (isClass (configFile >> "CfgPatches" >> "ace_main")) then {
    compat_ace = true;
};
if (isClass (configFile >> "CfgPatches" >> "murshun_cigs")) then {
  compat_cigs = true;  
};
if (isClass (configFile >> "CfgPatches" >> "acre_main")) then {
  compat_acre = true;  
};
if (isClass (configFile >> "CfgPatches" >> "tfar_core")) then {
  compat_tfar = true;  
};
if (isClass (configFile >> "CfgPatches" >> "ARDN_main")) then {
  compat_ARDN = true;  
};
if (isClass (configFile >> "CfgPatches" >> "ARDN_caf")) then {
  compat_ARDNCAF = true;  
};
if (isClass (configFile >> "CfgPatches" >> "mas_ukl_lite_common")) then {
  compat_UKSOF = true;  
};
if (isClass (configFile >> "CfgPatches" >> "mas_can_lite_common")) then {
  compat_CAFSOF = true;  
};
if (isClass (configFile >> "CfgPatches" >> "mas_fra_lite_common")) then {
  compat_FRACOS = true;  
};
if (isClass (configFile >> "CfgPatches" >> "mas_nor_lite_common")) then {
  compat_NORSOF = true;  
};
if (isClass (configFile >> "CfgPatches" >> "ADFU_Base")) then {
  compat_ADFU = true;  
};
