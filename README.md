<p align="center">
    <img src="https://github.com/DoskalAridin/WarEffort/blob/main/github%20Files/preview_1.png" width="480">
</p>

# WarEffort
Arma 3 procedural &amp; persistent mission
Sort of a Mike Force "light" / Dynamic Recon Ops scenario. Intended to be something left running on a dedicated server, providing passive activity for players to join freely at anytime and have something to do, while also having a larger goal for when your community has an Ops night.

Players start at a base with the ability to purchase vehicles and training (medic, engineer, EOD, etc.),
and are provided with a constant set of side missions to complete, generated in proximity to the base. Rewarded with supply points used to make purchases and lowering the enemy strength.
When ready a "main operation" can be started. Being a mission requiring multiple objectes to be completed. Once complete, the operation area is marked as captured, expanding the area where side missions can generated.
*side missions generate in proxmity relative to all player controlled areas. And only generate when all players are at base.

## Features

- Constant side missions, including; POW and downed pilot "Bright light" missions, "eldest son" sabotage enemy ammo supply, and straight forward eliminate officer / ammo cache missions.
- Manually activated "Main Operations" to secure and capture territory
- Basic economy for purchasing vehicles and soldier training
- Deployable LP/OP "FOBs" for field respawns
- Support for [ACE](https://steamcommunity.com/sharedfiles/filedetails/?id=463939057), [ACRE2](https://steamcommunity.com/sharedfiles/filedetails/?id=751965892), [TFAR](https://steamcommunity.com/sharedfiles/filedetails/?id=894678801), [S&S](https://steamcommunity.com/sharedfiles/filedetails/?id=2183975396), [Immersion Cigs
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
