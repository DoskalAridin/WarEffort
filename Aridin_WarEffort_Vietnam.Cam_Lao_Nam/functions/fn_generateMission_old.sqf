/*
	Author: Doskal Aridin

	Description:
		Generates a random AO.

	Returns:
		true

	Examples:
		 remoteExec ["ARDN_fnc_generateMission"];
*/

if (objectivesActive <= 3) then 
{
"Generating mission..." remoteExec ["systemChat"];	

_selectedFaction = selectRandom array_factions;

switch (_selectedFaction) do
{
	case "PAVN": {
		opfor_sl = "vn_o_men_nva_15";
		array_infantry = array_PAVN;
		array_spider = array_PAVN_spider;
		array_vehicles = array_PAVN_vehicles;
		array_aa = array_PAVN_aa;
		array_arty = array_PAVN_arty;
	};
	case "Dac Cong": {
		opfor_sl = "vn_o_men_nva_dc_01";
		array_infantry = array_DacCong;
		array_spider = array_VC_spider;
		array_vehicles = array_VC_vehicles;
		array_aa = array_VC_aa;
		array_arty = array_VC_arty;
	};
	default {
		opfor_sl = "vn_o_men_vc_01";
		array_infantry = array_VC;
		array_spider = array_VC_spider;
		array_vehicles = array_VC_vehicles;
		array_aa = array_VC_aa;
		array_arty = array_VC_arty;
	};
};
// Select objective type

_objectiveType = selectRandomWeighted ["ammoCache", 1, "HVT", 1, "Pilot", 0.8, "eldestSon", 0.8, "POW", 0.8, "ambush", 0.8,"defend", 0.2];
/**
_objectiveType = selectRandomWeighted ["ammoCache", 0, "HVT", 0, "Pilot", 0, "eldestSon", 0, "POW", 0, "ambush", 0.7,"defend", 0];
**/
// Select a random marker as the Area of Operation (AO)

switch (_objectiveType) do
{
	case "defend": {
		_selectedFactionBLUFOR = selectRandom array_factions_blufor;
		switch (_selectedFactionBLUFOR) do
		{
			case "USMC": {
				blufor_sl = "vn_b_men_usmc_68_01";
				array_infantry_blufor = array_army;
				array_vehicles_blufor = array_army_vehicles;
				array_turrets_blufor = array_army_turrets;
			};
			default {
				blufor_sl = "vn_b_men_army_01";
				array_infantry_blufor = array_army;
				array_vehicles_blufor = array_army_vehicles;
				array_turrets_blufor = array_army_turrets;
			};
		};
		if (objectivesActive == 0) then {activeAOs = []};
		_selectedAO = selectRandom defendMarkers;
		if (objectivesActive == 0) then {primaryAO = _selectedAO};
		objectivesActive = objectivesActive + 1;
		publicVariable "objectivesActive";
		
		activeAOs pushBack _selectedAO;
		publicVariable "activeAOs";
		// Set up the mission area
		_missionArea = getMarkerPos _selectedAO;
		
		// Set up BLUFOR
		_numPatrols_blufor = floor ((random 2) + 2); // Adjust patrol count range as needed
		for "_i" from 1 to _numPatrols_blufor do
		{
			_spawnPos = [_missionArea, 0, 150, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
			_patrolGroup = [_spawnPos, WEST, array_infantry_blufor, [], [], [], [], [2,0.01]] call BIS_fnc_spawnGroup;	
			[_patrolGroup, _spawnPos, floor random [250, 500, 1000]] call BIS_fnc_taskPatrol;
		};
		_numSquadUnits = floor ((random 4) + 1); // Adjust garrison count range as needed
		for "_i" from 1 to _numSquadUnits do
		{
			_spawnPos = [_missionArea, 0, 150, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
			_SquadUnit = [_spawnPos, WEST, array_infantry_blufor, [], [], [], [], [2,0.1]] call BIS_fnc_spawnGroup;
			[_SquadUnit, _spawnPos] call BIS_fnc_taskDefend;
		};
		_garrisonAvailablePos = nearestObjects [_missionArea, ["House", "Building"], 150];
		_numGarrisonedUnits = floor ((random 4) + 2); // Adjust garrison count range as needed
		for "_i" from 1 to _numGarrisonedUnits do
		{
			_garrisonClass = selectRandom array_infantry_blufor;
			_garrisonPos = getPosASL selectRandom _garrisonAvailablePos;
			_GarrisonedGroup = createGroup west;
			_GarrisonedUnit = _garrisonClass createUnit [_garrisonPos, _GarrisonedGroup, "this disableAI 'PATH';", 1];
			_garrisonAvailablePos - _garrisonPos;
		};
		_numVehicles = floor ((random 2) + 2); // Adjust vehicle count range as needed
		for "_i" from 1 to _numVehicles do
		{
			_spawnPos = [_missionArea, 0, 150, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
			_vehicleClass = selectRandom array_vehicles_blufor; // Replace with your vehicle array name
			_vehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "CAN_COLLIDE"];
			_vehicle setDir random 360;
			createVehicleCrew  _vehicle;
		};
		_numVehicles = floor ((random 2) + 2); // Adjust vehicle count range as needed
		for "_i" from 1 to _numVehicles do
		{
			_spawnPos = [_missionArea, 0, 150, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
			_vehicleClass = selectRandom array_turrets_blufor; // Replace with your vehicle array name
			_vehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "CAN_COLLIDE"];
			_vehicle setDir random 360;
			createVehicleCrew  _vehicle;
		};
		
		//Set up OPFOR
		_numPatrols = floor ((random (AO_enemyStrength * 4)) + 4); // Adjust patrol count range as needed
		for "_i" from 1 to _numPatrols do
		{
			_spawnPos = [_missionArea, 1000, 2000, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
			_patrolGroup = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.01]] call BIS_fnc_spawnGroup;	
			_waypoint = _patrolGroup addWaypoint [_missionArea, 100];
			_waypoint setWaypointType "SAD";
		};
		// Spawn vehicles
		_numVehicles = floor ((random (AO_enemyStrength * 4)) + 6); // Adjust vehicle count range as needed
		for "_i" from 1 to _numVehicles do
		{
			_spawnPos = [_missionArea, 1000, 2000, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
			_vehicleClass = selectRandom array_vehicles; // Replace with your vehicle array name
			_vehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "CAN_COLLIDE"];
			_vehicle setDir random 360;
			_crew = createVehicleCrew  _vehicle;
			_waypoint = _crew addWaypoint [_missionArea, 100];
			_waypoint setWaypointType "SAD";
		};
		
		//Set up Objective
		_objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective #%1", str ObjectiveCount], "Defend"], _missionArea, "AUTOASSIGNED", 0, true, "attack", false] call BIS_fnc_taskCreate;
		_objGroup = createGroup west;
		_objObject = "vn_b_men_army_28" createUnit [_missionArea, _objGroup, "this setVariable ['objectiveNumber', ObjectiveCount]; this addEventHandler ['Killed', {_objectiveNumber = _this select 0 getVariable 'objectiveNumber'; [format ['Objective_%1',str _objectiveNumber] ,'FAILED'] call BIS_fnc_taskSetState; objectivesActive = objectivesActive - 1; publicVariable 'objectivesActive';}]; this disableAI 'PATH';", 1, "COLONEL"];
		_bunkerObj = createVehicle ["Land_vn_b_trench_bunker_01_01", _missionArea, [], 0, "CAN_COLLIDE"];
		
		ObjectiveCount = ObjectiveCount + 1;
		publicVariable "ObjectiveCount";

		// Inform players about the generated mission
		"Mission generated!" remoteExec ["systemChat"];
	};
	case "ambush": {
		_availableNearAOs = [];
		
		if (objectivesActive == 0) then {activeAOs = []};
		if (objectivesActive > 0) then {
			_nearAOs = AOmarkers select {(getMarkerPos _x) inArea [getmarkerPos primaryAO, 2000, 2000, 0, false]};
			_availableNearAOs = _nearAOs - activeAOs;
		};
		_selectedAO = if (objectivesActive == 0) then {selectRandom AOmarkers} else {selectRandom _availableNearAOs};
		if (_selectedAO == nil) then {
			_selectedAO = selectRandom AOmarkers;
			primaryAO = _selectedAO;
			systemChat "Primary AO assigned.";
			systemChat "No nearby AOs available, selecting random AO. New primary AO assigned.";
		};
		activeAOs pushBack _selectedAO;
		publicVariable "activeAOs";
		if (objectivesActive == 0) then {
			primaryAO = _selectedAO;
			systemChat "Primary AO assigned.";
		};
		
		objectivesActive = objectivesActive + 1;
		publicVariable "objectivesActive";
		
		_missionStart = getMarkerPos _selectedAO;
		
		_numPatrols = floor ((random AO_enemyStrength) + 1); // Adjust patrol count range as needed
		for "_i" from 1 to _numPatrols do
		{
			_spawnPos = [_missionStart, 0, AO_size, 5, 0, 0.3, 0, [], [_missionStart, _missionStart]] call BIS_fnc_findSafePos;
			_patrolGroup = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.01], 0, false, AO_enemyStrength] call BIS_fnc_spawnGroup;	
			[_patrolGroup, _spawnPos, floor random [250, 500, 1000]] call BIS_fnc_taskPatrol;
		};
		
		_numVehicles = floor ((random (AO_enemyStrength * 2)) + 1); // Adjust vehicle count range as needed
		for "_i" from 1 to _numVehicles do
		{
			_spawnPos = [_missionStart, 0, AO_size, 5, 0, 0.3, 0, [], [_missionStart, _missionStart]] call BIS_fnc_findSafePos;
			_vehicleClass = selectRandom array_vehicles; // Replace with your vehicle array name
			_vehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "CAN_COLLIDE"];
			_vehicle setDir random 360;
			createVehicleCrew  _vehicle;
		};

		// Spawn anti-air units
		_numAA = floor random ((random (AO_enemyStrength * 2)) + 4); // Adjust anti-air count range as needed
		for "_i" from 1 to _numAA do
		{
			_spawnPos = [_missionStart, 0, AO_size, 5, 0, 0.3, 0, [], [_missionStart, _missionStart]] call BIS_fnc_findSafePos;
			_aaClass = selectRandom array_aa; // Replace with your anti-air array name
			_aaUnit = createVehicle [_aaClass, _spawnPos, [], 0, "CAN_COLLIDE"];
			_aaUnit setDir random 360;
			createVehicleCrew _aaUnit;
		};

		// Spawn artillery
		_numArtillery = floor ((random (AO_enemyStrength * 2)) + 2); // Adjust artillery count range as needed
		for "_i" from 1 to _numArtillery do
		{
			_spawnPos = [_missionStart, 0, AO_size, 5, 0, 0.3, 0, [], [_missionStart, _missionStart]] call BIS_fnc_findSafePos;
			_artilleryClass = selectRandom array_arty; // Replace with your artillery array name
			_artillery = createVehicle [_artilleryClass, _spawnPos, [], 0, "CAN_COLLIDE"];
			_artillery setDir random 360;
			createVehicleCrew  _artillery;
		};

		// Randomly place mines around the mission location
		_numtrap = floor (random [20, 40, 80] + (AO_size / 10) - (AO_enemyStrength * 2));
		for "_i" from 1 to _numtrap do
		{
			_trapPos = [_missionStart, 0, AO_size, 1, 0, 0.1, 0, [], [_missionStart, _missionStart]] call BIS_fnc_findSafePos;
			_trapClass = selectRandom array_traps; // Replace with your traps array name
			_trap = createMine [_trapClass, _trapPos, [], 0];
		};
		
		// setup convoy end point
		_endAOs = AOmarkers select {(getMarkerPos _x) inArea [getmarkerPos primaryAO, 5000, 5000, 0, false]};
		_regectAOs = AOmarkers select {(getMarkerPos _x) inArea [_missionStart, 2000, 2000, 0, false]};
		_availableEndAOs = _endAOs - activeAOs;
		_availableEndAOs = _availableEndAOs - _regectAOs;
		
		_selectedEnd = selectRandom _availableEndAOs; 
		
		_missionEnd = getMarkerPos _selectedEnd;
		
		_missionMid = [];
		_midX = (((_missionStart select 0) + (_missionEnd select 0)) / 2);
		_midY = (((_missionStart select 1) + (_missionEnd select 1)) / 2);
		_missionMid pushBack _midX;
		_missionMid pushBack _midY;
		_missionMid pushBack 0;
		
		activeAOs pushBack _selectedEnd;
		publicVariable "activeAOs";
		
		_numPatrols = floor ((random AO_enemyStrength) + 1); // Adjust patrol count range as needed
		for "_i" from 1 to _numPatrols do
		{
			_spawnPos = [_missionEnd, 0, AO_size, 5, 0, 0.3, 0, [], [_missionEnd, _missionEnd]] call BIS_fnc_findSafePos;
			_patrolGroup = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.01], 0, false, AO_enemyStrength] call BIS_fnc_spawnGroup;	
			[_patrolGroup, _spawnPos, floor random [250, 500, 1000]] call BIS_fnc_taskPatrol;
		};
		
		_numVehicles = floor ((random (AO_enemyStrength * 2)) + 1); // Adjust vehicle count range as needed
		for "_i" from 1 to _numVehicles do
		{
			_spawnPos = [_missionEnd, 0, AO_size, 5, 0, 0.3, 0, [], [_missionEnd, _missionEnd]] call BIS_fnc_findSafePos;
			_vehicleClass = selectRandom array_vehicles; // Replace with your vehicle array name
			_vehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "CAN_COLLIDE"];
			_vehicle setDir random 360;
			createVehicleCrew  _vehicle;
		};

		// Spawn anti-air units
		_numAA = floor random ((random (AO_enemyStrength * 2)) + 4); // Adjust anti-air count range as needed
		for "_i" from 1 to _numAA do
		{
			_spawnPos = [_missionEnd, 0, AO_size, 5, 0, 0.3, 0, [], [_missionEnd, _missionEnd]] call BIS_fnc_findSafePos;
			_aaClass = selectRandom array_aa; // Replace with your anti-air array name
			_aaUnit = createVehicle [_aaClass, _spawnPos, [], 0, "CAN_COLLIDE"];
			_aaUnit setDir random 360;
			createVehicleCrew _aaUnit;
		};

		// Spawn artillery
		_numArtillery = floor ((random (AO_enemyStrength * 2)) + 2); // Adjust artillery count range as needed
		for "_i" from 1 to _numArtillery do
		{
			_spawnPos = [_missionEnd, 0, AO_size, 5, 0, 0.3, 0, [], [_missionEnd, _missionEnd]] call BIS_fnc_findSafePos;
			_artilleryClass = selectRandom array_arty; // Replace with your artillery array name
			_artillery = createVehicle [_artilleryClass, _spawnPos, [], 0, "CAN_COLLIDE"];
			_artillery setDir random 360;
			createVehicleCrew  _artillery;
		};

		// Randomly place mines around the mission location
		_numtrap = floor (random [20, 40, 80] + (AO_size / 10) - (AO_enemyStrength * 2));
		for "_i" from 1 to _numtrap do
		{
			_trapPos = [_missionEnd, 0, AO_size, 1, 0, 0.1, 0, [], [_missionEnd, _missionEnd]] call BIS_fnc_findSafePos;
			_trapClass = selectRandom array_traps; // Replace with your traps array name
			_trap = createMine [_trapClass, _trapPos, [], 0];
		};
		
		_ambushType = selectRandom ["officer"];
		switch (_ambushType) do {
			default {
				_objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective #%1", str ObjectiveCount], "Ambush enemy officer"], _missionMid, "AUTOASSIGNED", 0, true, "kill", false] call BIS_fnc_taskCreate;
				_objGroup = createGroup east;
				_objObject = "vn_o_men_nva_65_01" createUnit [_missionStart, _objGroup, "this setVariable ['objectiveNumber', ObjectiveCount]; this addEventHandler ['Killed', {_objectiveNumber = _this select 0 getVariable 'objectiveNumber'; [format ['Objective_%1',str _objectiveNumber] ,'SUCCEEDED'] call BIS_fnc_taskSetState; objectivesActive = objectivesActive - 1; publicVariable 'objectivesActive';}];", 1, "COLONEL"];
				_objUnit = [_missionStart, EAST, array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
				units _objUnit join _objGroup;
				_objGroup setSpeedMode "LIMITED";
				_waypoint = _objGroup addWaypoint [_missionEnd, 200];
				_waypoint = _objGroup addWaypoint [_missionStart, 200];
				_waypoint setWaypointType "CYCLE";
				
			};
			case "convoy": {
				_objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective #%1", str ObjectiveCount], "Ambush convoy"], _missionMid, "AUTOASSIGNED", 0, true, "kill", false] call BIS_fnc_taskCreate;
				_vehicleClass = selectRandom array_vehicles; // Replace with your vehicle array name
				_vehicle = createVehicle [_vehicleClass, _missionStart, [], 0, "NONE"];
				_vehicle setDir (_missionStart getDir _missionEnd);
				createVehicleCrew  _vehicle;
				_objGroup = group _vehicle;
				_objGroup setSpeedMode "LIMITED";
				_waypoint = _objGroup addWaypoint [_missionEnd, 200];
				_waypoint = _objGroup addWaypoint [_missionStart, 200];
				_waypoint setWaypointType "CYCLE";
			};
		};
	};
	default {
		// Set up the mission area
		// define local variables for if statements
		_availableNearAOs = [];
		
		if (objectivesActive == 0) then {activeAOs = []};
		if (objectivesActive > 0) then {
			_nearAOs = AOmarkers select {(getMarkerPos _x) inArea [getmarkerPos primaryAO, 2000, 2000, 0, false]};
			_availableNearAOs = _nearAOs - activeAOs;
		};
		_selectedAO = if (objectivesActive == 0) then {selectRandom AOmarkers} else {selectRandom _availableNearAOs};
		if (_selectedAO == nil) then {
			_selectedAO = selectRandom AOmarkers;
			primaryAO = _selectedAO;
			systemChat "Primary AO assigned.";
			systemChat "No nearby AOs available, selecting random AO. New primary AO assigned.";
		};
		activeAOs pushBack _selectedAO;
		publicVariable "activeAOs";
		if (objectivesActive == 0) then {
			primaryAO = _selectedAO;
			systemChat "Primary AO assigned.";
		};
		
		objectivesActive = objectivesActive + 1;
		publicVariable "objectivesActive";
		
		_missionArea = getMarkerPos _selectedAO;
		
		_nearRoads = _missionArea nearRoads AO_size;
		_nearRoadsCount = count _nearRoads;

		// Spawn random number of patrols
		_numPatrols = floor ((random AO_enemyStrength) + 1); // Adjust patrol count range as needed
		for "_i" from 1 to _numPatrols do
		{
			_spawnPos = [_missionArea, 0, AO_size, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
			_patrolGroup = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.01], 0, false, AO_enemyStrength] call BIS_fnc_spawnGroup;	
			[_patrolGroup, _spawnPos, floor random [250, 500, 1000]] call BIS_fnc_taskPatrol;
		};

		_numSquadUnits = floor ((random AO_enemyStrength) + 2); // Adjust garrison count range as needed
		for "_i" from 1 to _numSquadUnits do
		{
			_spawnPos = [_missionArea, 0, AO_size, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
			_SquadUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1]] call BIS_fnc_spawnGroup;
			[_SquadUnit, _spawnPos] call BIS_fnc_taskDefend;
		};
		_garrisonAvailablePos = nearestObjects [_missionArea, ["House", "Building", "Land_vn_cave_base"], AO_size];
		_numGarrisonedUnits = floor ((random AO_enemyStrength * 2) + 4); // Adjust garrison count range as needed
		for "_i" from 1 to _numGarrisonedUnits do
		{
			_garrisonClass = selectRandom array_infantry;
			_garrisonPos = getPosASL selectRandom _garrisonAvailablePos;
			_GarrisonedGroup = createGroup east;
			_GarrisonedUnit = _garrisonClass createUnit [_garrisonPos, _GarrisonedGroup, "this disableAI 'PATH';", 1];
			_garrisonAvailablePos - _garrisonPos;
		};

		// Spawn vehicles
		_numVehicles = floor ((random (AO_enemyStrength * 2)) + 1); // Adjust vehicle count range as needed
		for "_i" from 1 to _numVehicles do
		{
			_spawnPos = [_missionArea, 0, AO_size, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
			_vehicleClass = selectRandom array_vehicles; // Replace with your vehicle array name
			_vehicle = createVehicle [_vehicleClass, _spawnPos, [], 0, "CAN_COLLIDE"];
			_vehicle setDir random 360;
			createVehicleCrew  _vehicle;
		};

		// Spawn anti-air units
		_numAA = floor random ((random (AO_enemyStrength * 2)) + 4); // Adjust anti-air count range as needed
		for "_i" from 1 to _numAA do
		{
			_spawnPos = [_missionArea, 0, AO_size, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
			_aaClass = selectRandom array_aa; // Replace with your anti-air array name
			_aaUnit = createVehicle [_aaClass, _spawnPos, [], 0, "CAN_COLLIDE"];
			_aaUnit setDir random 360;
			createVehicleCrew _aaUnit;
		};

		// Spawn artillery
		_numArtillery = floor ((random (AO_enemyStrength * 2)) + 2); // Adjust artillery count range as needed
		for "_i" from 1 to _numArtillery do
		{
			_spawnPos = [_missionArea, 0, AO_size, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
			_artilleryClass = selectRandom array_arty; // Replace with your artillery array name
			_artillery = createVehicle [_artilleryClass, _spawnPos, [], 0, "CAN_COLLIDE"];
			_artillery setDir random 360;
			createVehicleCrew  _artillery;
		};

		// Randomly place mines around the mission location
		_numtrap = floor (random [20, 40, 80] + (AO_size / 10) - (AO_enemyStrength * 2));
		for "_i" from 1 to _numtrap do
		{
			_trapPos = [_missionArea, 0, AO_size, 1, 0, 0.1, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
			_trapClass = selectRandom array_traps; // Replace with your traps array name
			_trap = createMine [_trapClass, _trapPos, [], 0];
		};
		
		for "_i" from 1 to (AO_enemyStrength min (_nearRoadsCount - 1)) do
		{
			_IEDPos = _nearRoads select _i;
			_IEDClass = selectRandom array_ied;
			_IED = createMine [_IEDClass, getPos _IEDPos, [], 0];
		};
		
		switch (_objectiveType) do {
			default {
				_objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective #%1", str ObjectiveCount], "Destroy enemy ammo cache"], _missionArea, "AUTOASSIGNED", 0, true, "attack", false] call BIS_fnc_taskCreate;
				_spawnPos = [_missionArea, 0, 200, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
				_objObject = createVehicle ["vn_o_ammobox_full_06", _spawnPos, [], 0, "NONE"];
				_bunkerCache = createVehicle ["Land_vn_o_shelter_05", _spawnPos, [], 0, "CAN_COLLIDE"];
				_objObject setVariable ["objectiveNumber", ObjectiveCount];
				_objObject addEventHandler ["Killed", {
					_objectiveNumber = _this select 0 getVariable "objectiveNumber";
					[format ["Objective_%1",str _objectiveNumber] ,"SUCCEEDED"] call BIS_fnc_taskSetState;
					objectivesActive = objectivesActive - 1;
					publicVariable "objectivesActive";
				}];
				_spawnPos = [_spawnPos, 0, 25, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
				_objUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
				[_objUnit, _spawnPos] call BIS_fnc_taskDefend;
			};
			case "HVT": {
				_objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective #%1", str ObjectiveCount], "Eliminate enemy officer"], _missionArea, "AUTOASSIGNED", 0, true, "kill", false] call BIS_fnc_taskCreate;
				_objGroup = createGroup east;
				_objObject = "vn_o_men_nva_65_01" createUnit [_missionArea, _objGroup, "this setVariable ['objectiveNumber', ObjectiveCount]; this addEventHandler ['Killed', {_objectiveNumber = _this select 0 getVariable 'objectiveNumber'; [format ['Objective_%1',str _objectiveNumber] ,'SUCCEEDED'] call BIS_fnc_taskSetState; objectivesActive = objectivesActive - 1; publicVariable 'objectivesActive';}];", 1, "COLONEL"];
				_objUnit = [_missionArea, EAST, array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
				units _objUnit join _objGroup;
			};
			case "eldestSon": {
				_objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective #%1", str ObjectiveCount], "Sabotage enemy ammo supply"], _missionArea, "AUTOASSIGNED", 0, true, "danger", false] call BIS_fnc_taskCreate;
				_spawnPos = [_missionArea, 0, 200, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
				_objObject = createVehicle ["vn_o_wheeled_z157_ammo_nva65", _spawnPos, [], 0, "NONE"];
				_objObject setVariable ["objectiveNumber", ObjectiveCount];
				_objObject addEventHandler ["Killed", {
					_objectiveNumber = _this select 0 getVariable "objectiveNumber";
					[format ["Objective_%1",str _objectiveNumber] ,"FAILED"] call BIS_fnc_taskSetState;
					objectivesActive = objectivesActive - 1;
					publicVariable "objectivesActive";
				}];
				_spawnPos = [_spawnPos, 0, 50, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
				_objUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
				[_objUnit, _spawnPos] call BIS_fnc_taskDefend;
				[_objObject] spawn {
					params ["_objObject"];
					_objectiveNumber = _objObject getVariable "objectiveNumber";
					while {alive _objObject} do {
						_boobytrap = nearestMines [getPos _objObject, ["vn_mine_ammobox_range_ammo"], 20];
						if (count _boobytrap >= 1) then {
							[format ["Objective_%1",str _objectiveNumber] ,"SUCCEEDED"] call BIS_fnc_taskSetState;
							objectivesActive = objectivesActive - 1;
							publicVariable "objectivesActive";
						};
						sleep 30;
					};
				};
			};
			case "POW": {
				_objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective #%1", str ObjectiveCount], "Rescue POW"], _missionArea, "AUTOASSIGNED", 0, true, "danger", false] call BIS_fnc_taskCreate;
				_spawnPos = [_missionArea, 0, 200, 5, 0, 0.1, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
				_objGroup = createGroup west;
				_objObject = "vn_b_men_lrrp_01" createUnit [_spawnPos, _objGroup, "[this, true, this] call ACE_captives_fnc_setHandcuffed; this setVariable ['objectiveNumber', ObjectiveCount]; this setVariable ['POW', true]; this addEventHandler ['Killed', {_objectiveNumber = _this select 0 getVariable 'objectiveNumber'; [format ['Objective_%1',str _objectiveNumber] ,'FAILED'] call BIS_fnc_taskSetState; objectivesActive = objectivesActive - 1; publicVariable 'objectivesActive';}];", 1, "COLONEL"];
				_objCage = createVehicle ["Land_vn_o_prop_cong_cage_01", _spawnPos, [], 0, "CAN_COLLIDE"];
				_spawnPos = [_spawnPos, 0, 50, 5, 0, 0.3, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
				_objUnit = [_spawnPos, EAST, array_infantry, [], [], [], [], [2,0.1], 0, false] call BIS_fnc_spawnGroup;
				[_objUnit, _spawnPos] call BIS_fnc_taskDefend;
			};
			case "Pilot": {
				_objectiveTask = [BLUFOR, format ["Objective_%1",str ObjectiveCount], [format ["Objective #%1", str ObjectiveCount], "Recover downed Pilot"], _missionArea, "AUTOASSIGNED", 0, true, "danger", false] call BIS_fnc_taskCreate;
				_wreckType = selectRandom ["heli", "jet"];
				_wreckCraft = "vn_air_f4b_wreck";
				_wreckPilot = "vn_b_men_aircrew_09";
				switch (_wreckType) do {
					case "heli": {
						_wreckCraft = selectRandom ["vn_air_ah1g_01_wreck","vn_air_ch47_wreck","vn_air_ch34_01_wreck","vn_air_oh6a_01_wreck","vn_air_uh1c_01_wreck","vn_air_uh1d_med_wreck","vn_air_uh1d_01_wreck"];
						_wreckPilot = "vn_b_men_aircrew_09";
					};
					default {
						_wreckCraft = selectRandom ["vn_air_f100d_01_wreck","vn_air_f4b_wreck"];
						_wreckPilot = "vn_b_men_jetpilot_07";
					};
				};
				_spawnPos = [_missionArea, 0, 250, 10, 0, 0.2, 0, [], [_missionArea, _missionArea]] call BIS_fnc_findSafePos;
				_wreck = createVehicle [_wreckCraft, _spawnPos, [], 0, "CAN_COLLIDE"];
				_smoke = createVehicle ["test_EmptyObjectForSmoke", getPos _wreck, [], 0, "CAN_COLLIDE"];
				_spawnPos = [getPos _wreck, 0, 10, 5, 0, 0.1, 0, [], getPos _wreck] call BIS_fnc_findSafePos;
				_objGroup = createGroup west;
				_objPilot = _objGroup createUnit [_wreckPilot, _spawnPos, [], 0, "NONE"];
				_objPilot setSkill 1;
				_objPilot setUnitTrait ["camouflageCoef", 0.001];
				_objPilot setUnitTrait ["audibleCoef", 0];
				_objPilot setVariable ["objectiveNumber", ObjectiveCount];
				_objPilot setVariable ["POW", true];
				_blood = createVehicle ["BloodPool_01_Medium_New_F", getPos _objPilot, [], 0, "CAN_COLLIDE"];
				[_objPilot] spawn {
					params ["_objPilot"];
					while {alive _objPilot} do {
						sleep 5;
						if (speed _objPilot <= 4) then {
								_bloodTrail = createVehicle ["BloodPool_01_Medium_New_F", getPos _objPilot, [], 0, "CAN_COLLIDE"]
							} else {
								_bloodTrail = createVehicle ["BloodTrail_01_New_F", getPos _objPilot, [], 0, "CAN_COLLIDE"];
								_bloodTrail setDir (getDir _objPilot);
								_bloodTrail setVectorUp surfaceNormal position _bloodTrail;
							};
						_cutter = createVehicle ["Land_ClutterCutter_medium_F", getPos _objPilot, [], 0, "CAN_COLLIDE"];
					};
				};
				_objGroup setBehaviourStrong "STEALTH";
				_objGroup setCombatMode "GREEN";
				_objGroup setSpeedMode "LIMITED";
				_waypointPos = [getPos _wreck, AO_size - 10, AO_size + 10, 0, 0, 0.3, 0, [], [getMarkerPos "marker_20", getMarkerPos "marker_20"]] call BIS_fnc_findSafePos;
				_waypoint = _objGroup addWaypoint [_waypointPos, 5];
				_waypoint setWaypointCombatMode "GREEN";
				_waypoint setWaypointBehaviour "STEALTH";
				_waypoint setWaypointSpeed "LIMITED";
				_objPilot addEventHandler ["Deleted", {
					_pilot = _this select 0;
					_objectiveNumber = _pilot getVariable "objectiveNumber";
					[format ['Objective_%1',str _objectiveNumber] ,"SUCCEEDED"] call BIS_fnc_taskSetState;
				}];
			};
		};
	};
};

ObjectiveCount = ObjectiveCount + 1;
publicVariable "ObjectiveCount";

// Inform players about the generated mission
"Mission generated!" remoteExec ["systemChat"];
} else { "Maximum missions reached." remoteExec ["systemChat"] };