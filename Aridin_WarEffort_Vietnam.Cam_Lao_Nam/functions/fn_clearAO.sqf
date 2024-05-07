/*
	Author: Doskal Aridin

	Description:
		Cleans up AO. If marker name provided, uses that as area to clean.
        Otherwise pulls from the array "cleanAOs", selecting the first element.
        
    Parameters:
        0 - _ao:
            Marker name, default "any".

	Returns:
		true

	Examples:
		["ao_0"] remoteExec ["ARDN_fnc_clearAO", 2];
*/
params [["_ao", "any"]];

if (count cleanAOs == 0) exitWith {diag_log "No AOs to clean"};
_AOtoClean = [];
if (_ao == "any") then {
    _AOtoClean pushBack (cleanAOs select 0);
} else {
    _AOtoClean pushBack _ao;
};

diag_log format ["Clearing %1...", _AOtoClean];

_garbage = [];

_garbage insert [-1, vehicles inAreaArray [getMarkerPos (_AOtoClean select 0), AO_size + 100, AO_size + 100], true];
_garbage insert [-1, allUnits inAreaArray [getMarkerPos (_AOtoClean select 0), AO_size + 100, AO_size + 100], true];

_players = playableUnits;
_garbage = _garbage - _players;
{_x setDamage 1; sleep 0.5;} forEach _garbage;

_garbage = [];
_garbage insert [-1, allDead inAreaArray [getMarkerPos (_AOtoClean select 0), AO_size + 100, AO_size + 100], true];
_garbage insert [-1, allMines inAreaArray [getMarkerPos (_AOtoClean select 0), AO_size + 100, AO_size + 100], true];

{deleteVehicle _x; sleep 0.5;} forEach _garbage;
    
diag_log format ["%1 cleared!", _AOtoClean];

activeAOs = activeAOs - _AOtoClean;
cleanAOs = cleanAOs -_AOtoClean;
publicVariable "activeAOs";
publicVariable "cleanAOs";

true;