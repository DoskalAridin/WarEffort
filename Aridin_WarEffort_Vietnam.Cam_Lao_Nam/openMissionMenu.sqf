createDialog "dialogGenerateAO";

_ctrl = (findDisplay 2023) displayCtrl 1500;

{
lbAdd [1500, _x];
} forEach activeAOs;
