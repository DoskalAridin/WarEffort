<p align="center">
    <img src="https://github.com/DoskalAridin/WarEffort/blob/main/github%20Files/preview_1.png" width="480">
</p>

# WarEffort
Arma 3 procedural &amp; persistent mission.<br/>
Sort of a Mike Force "light" / Dynamic Recon Ops scenario. Intended to be something left running on a dedicated server, providing passive activity for players to join freely at anytime and have something to do, while also having a larger goal for when your community has an Ops night.

Players start at a base with the ability to purchase vehicles and training (medic, engineer, EOD, etc.),
and are provided with a constant set of side missions to complete, generated in proximity to the base. Success rewards supply points (used to make purchases) and lowers the enemy strength.<br/>
When ready, a "main operation" can be started. Being a mission requiring multiple objectes to be completed. Once complete, the operation area is marked as captured, expanding the area where side missions can generated.<br/>
*side missions generate in proxmity relative to all player controlled areas. And only generate when all players are back in controlled territory.
<br/>
<br/>
Steam workshop links:<br/>
[Cam Lao Nam](https://steamcommunity.com/sharedfiles/filedetails/?id=3257635684)<br/>
[Altis](https://steamcommunity.com/sharedfiles/filedetails/?id=3260238783)<br/>
<br/>

## Features

- Constant side missions, including; POW and downed pilot "Bright light" missions, "eldest son" sabotage enemy ammo supply, and straight forward eliminate officer / ammo cache missions.
- Manually activated "Main Operations" to secure and capture territory
- Basic economy for purchasing vehicles and soldier training
- Deployable LP/OP "FOBs" for field respawns
- Support for [ACE](https://steamcommunity.com/sharedfiles/filedetails/?id=463939057), [ACRE2](https://steamcommunity.com/sharedfiles/filedetails/?id=751965892), [TFAR](https://steamcommunity.com/sharedfiles/filedetails/?id=894678801), [S.O.G. Nickel Steel](https://steamcommunity.com/sharedfiles/filedetails/?id=3083451905), [UNSUNG Redux](https://steamcommunity.com/sharedfiles/filedetails/?id=2554978758), [S&S](https://steamcommunity.com/sharedfiles/filedetails/?id=2183975396), [Immersion Cigs
](https://steamcommunity.com/sharedfiles/filedetails/?id=753946944) and [Aridin's SOG:PF](https://steamcommunity.com/sharedfiles/filedetails/?id=2524282029)

### The Economy
War Effort features a basic economy, where completing objectives rewards the team with "supply".<br/>
Supply is then able to be used to purchase vehicles from various shops around base. Players are also able to purchase training for medic, doctor (ace), EOD, Engineer and RTO (SOG:PF radio support).<br/>
The economy isn't intended to be a grind to be able to buy the best fire power, mearly a deterient to endlessly spawning vehicles and allowing them to be quickly destroyed. I want players to have access to assets and have fun with them.<br/>

### Missions
The scenario will populate an AO with a scattering of enemy patrols, idle squads, vehicles, artillery anti-air and IED/traps.<br/>
Objective task descriptions will give a very basic description of what to do, as well as including some info on enemy presence in the area.<br/>
Enemy presence is a value determined from player count, location on the map (some areas are designated as having higher or lower presense) and player performance (completing missions, player deaths, etc. influence this).<br/>
Objective markers aren't pinpoint accurate, but do point to the general location of the objective, within a few 100m.<br/>
#### Side missions
**Destroy ammo cache & eliminate officer:**<br/>
The most straight forward objectives, as they can be potentialy completed simply by blindly carpet bombing the AO.

**Rescue POW:**<br/>
Find the captured friendly soldier and get him back to base the marked "Proccessing" tent to recover him.<br/>
The POW will have an interaction to free him and have him join your squad. Alternitively, if your running ACE, you can also just grab him and move him in his captive state.

**Rescue Pilot:**<br/>
Similar to the POW mission, however, you'll find a smoking wreck from which a wounded pilot will move away from to *hopefully* a safer location, where he'll then pop purple smoke to mark his location.<br/>
The pilot will leave a blood trail that you should be able to follow, incase you're unable to, or just miss the purple smoke.<br/>
Like the POW mission, extract him back to base and recover him.

**Sabotage enemy ammo supply:**<br/>
Locate the enemy's ammo truck and leave an "ammo box (booby-trapped)" next to it.

Note that Destroy ammo cache & eliminate officer will generate more often and are simple, straight forward missions.<br/>
All others, blindly bombing and shelling the AO risks failing the mission as the POW, pilot and ammo truck need to stay alive to complete the objective.

#### Main Operations
Manually started from the "Operations" hootch, it will attempt to generate a number of objectives, once all are completed the whole operation completes.<br/>
The objectives will be;<br/>
Secure the area: Simply elimiate enemy forces and establish superiority in numbers.<br/>
Elminate officer: Self explanatory.<br/>
Destory artillery & destory SAM site: Self explanatory. These objective don't always generate due to map terrain.<br/>
<br/>
**Defense Operation:**<br/>
There's a rare chance (which increases with enemy strength), that a defense mission will generate. One of your previously captured areas will come under attack. Occupied by friendly forces, you will be required to assist them to hold out long enough.<br/>
The defense will fail once two tasks fail; "Defend area", when the enemy has over run the area, out numbering friendly forces. and "defend officer", once a designated officer has been killed.<br/>
Failure means losing that territory, and a significant spike in enemy strength.

### Mission Parameters
For server hosts:
```
class Missions {
    class Mission1 {
        template ="Aridin_WarEffort_Vietnam.Cam_Lao_Nam";
        difficulty = "Regular";
        class Params {
            commanderZeus = true; // (true, false) Sets if the Commander slot should have access to Zues
            adminMainOps = true; // (true, false) If true, Commander can start Main Ops, if false, only admin can start Main Ops
            WarEffortDifficulty = 1; // (0,1,2) "Easy, Medium, Hard". Influences how much AI spawns.
            AO_size = 500; // (250,500,750,1000) AO radius. Smaller means higher density of AI, as it doesn't change how much AI spawns, only how large of an area they spawn in.
            AIlimit = 100; // (50,100,200) Not a hard cap on AI spawns, as objective specific AI will always spawn. Used to limit how much AI spawns (patrols, squads, etc). If cap is hit, turns them into "reinforcement budget" allowing for reinforements once the AI count drops below the limit.
            missionReward = 10; // (2,5,10,15,20) How much Supply is rewarded for completing objectives.
            deathPenalty = 2; // (0,1,2,4,10) How much the enemy strenght value increases when a player dies. Higher value means tougher fights in the future.
            enemyStrengthMissionSuccessReward = 5; // (1,5,10) values are converted to "0.1, 0.5, 1". How much enemy strength decreases upon mission success.
            enemyStrengthMissionFailPenalty = 10; // (5,10,15) values are converted to "0.5, 1, 1.5". How much enemy strength increases upon mission failure.
            manualSideMissions = false; // Enable manual side missions, if "true" side missions will need to be manually started at the Operations hootch.
        };
    };
};
```

# 2035 - Altis
Classic Arma 3, NATO vs CSAT.
- Supports [Western Sahara](https://store.steampowered.com/app/1681170/Arma_3_Creator_DLC_Western_Sahara/), [Reaction Forces](https://store.steampowered.com/app/2647760/Arma_3_Creator_DLC_Reaction_Forces/), [ACE](https://steamcommunity.com/sharedfiles/filedetails/?id=463939057), [ACRE2](https://steamcommunity.com/sharedfiles/filedetails/?id=751965892), [TFAR](https://steamcommunity.com/sharedfiles/filedetails/?id=894678801), [Immersion Cigs
](https://steamcommunity.com/sharedfiles/filedetails/?id=753946944) [Aridin's Canadian Armed Forces](https://steamcommunity.com/sharedfiles/filedetails/?id=2244946752), [Norwegian SOF](https://steamcommunity.com/sharedfiles/filedetails/?id=1654680843), [UK SOF](https://steamcommunity.com/sharedfiles/filedetails/?id=1145621857), [Canadian SOF](https://steamcommunity.com/sharedfiles/filedetails/?id=1659731670), [French SOF](https://steamcommunity.com/sharedfiles/filedetails/?id=1162059703) and [Project Uncut](https://steamcommunity.com/sharedfiles/filedetails/?id=1502320540)
