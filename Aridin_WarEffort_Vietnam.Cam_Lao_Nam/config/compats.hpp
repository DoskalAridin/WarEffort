compat_ace = false;
compat_NickelSteel = false;
compat_cigs = false;
compat_acre = false;
compat_tfar = false;
compat_SnS = false;
compat_ARDNsogpf = false;
if (isClass(configfile >> "CfgPatches" >> "air_f_vietnam_04_c")) then {
  compat_NickelSteel = true;  
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
if (isClass (configFile >> "CfgPatches" >> "simc_mc_67_core")) then {
  compat_SnS = true;  
};
if (isClass (configFile >> "CfgPatches" >> "ARDN_sogpf")) then {
  compat_ARDNsogpf = true;  
};