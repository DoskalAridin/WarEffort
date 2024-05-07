
[] execVM "timeCycle.sqf";
_setTime = systemTime;
_setTime set [0, 1968];
[_setTime, true, false] call BIS_fnc_setDate;

[] spawn {
    while {true} do {
        waitUntil {
            sleep 10;
            _AllPlayers = call BIS_fnc_listPlayers;
            _PlayersAtBase = _AllPlayers inAreaArray "markerHQ";
            (count _AllPlayers == count _PlayersAtBase);
        };
        remoteExec ["ARDN_fnc_generateSubMission", 2];
        sleep 10;
        remoteExec ["ARDN_fnc_clearAO", 2];
        sleep 10;
    };
};