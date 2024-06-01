/*
	Author: Doskal Aridin

	Description:
		Sets in game date/time to system's month and time, selecting a new moon day within the month.

	Returns:
		true

	Examples:
		remoteExec ["ARDN_fnc_setDate", 2];
*/
private _systemTime = systemTime;
private _systemMonth = _systemTime select 1;
private _fullMoonDates = [];
private ["_date", "_phase", "_fullMoonDate"];
private _fullMoonPhase = 1;
private _waxing = false;
for "_i" from dateToNumber [2035, _systemMonth, 1, 0, 0] to dateToNumber [2035, _systemMonth, 31, 23, 59] step 1 / 365 do
{
    _date = numberToDate [2035, _i];
    _phase = moonPhase _date;

    call
    {
        if (_phase > _fullMoonPhase) exitWith
        {
            _waxing = true;
            _fullMoonDate = _date;
        };

        if (_waxing) exitWith
        {
            _waxing = false;
            _fullMoonDates pushBack _fullMoonDate;
        };
    };

    _fullMoonPhase = _phase;
};

private _fullMoon = selectRandom _fullMoonDates;
_systemTime set [0, 2035];
_systemTime set [2, _fullMoon select 2];
[_systemTime, true, false] call BIS_fnc_setDate;
true;