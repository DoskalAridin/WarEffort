
[] execVM "scripts\timeCycle.sqf";
call ARDN_fnc_setDate;
// Side mission and AO cleanup loop
[] spawn {
    while {true} do {
        waitUntil {
            sleep 10;
            private _AllPlayers = call BIS_fnc_listPlayers;
            private _PlayersAtBase = _AllPlayers inAreaArray "markerHQ";
            (count _AllPlayers == count _PlayersAtBase);
        };
        if (manualSideMissions == false) then {
            remoteExec ["ARDN_fnc_generateSubMission", 2];
        };
        sleep 10;
        remoteExec ["ARDN_fnc_clearAO", 2];
        sleep 10;
    };
};

