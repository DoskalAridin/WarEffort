if (!isServer) exitWith {};
while {true} do
{
	if (daytime >= 20 || daytime < 4.5) then
	{
		setTimeMultiplier 7.75
	}
	else
	{
		setTimeMultiplier 8.5
	};
	uiSleep 30;
};