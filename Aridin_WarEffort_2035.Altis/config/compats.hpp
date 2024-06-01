compat_ace = false;
compat_cigs = false;
compat_acre = false;
compat_tfar = false;
compat_ARDN = false;
compat_ARDNCAF = false;
compat_WS = false;
compat_RF = false;
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
