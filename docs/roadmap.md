# Roadmap:

## Port from osdf-gpl to osdf-sdk (0.2.5)
- [x] Ported physics to baseq3a: CPM, VQ3 and CQ3
- [ ] CPM specific weapon/items changes
  - [ ] Rocket Launcher speed increased from 900 to 1000
  - [ ] Rocket Launcher knockback increased from 1 to 1.2
  - [ ] Item pickup size increased (from 36 to 66)
- [ ] Instant respawn (g_combat.c/player_die()/line608  & some other spots to switch timer to ms and make 1 mean immediate )
- [ ] Gamemode "run" (basic)
  - [ ] Definition in code (replaced FFA, g_gametype 0)
- [ ] Timer (local, best per session, all maps have TimeReset)

## Strafehud and velocity pads (0.3.0)
- [ ] Proxymod strafehud
- [ ] Velocity pads  

## Proxymod port (0.4.0) 
_// Requires a non-qvm environment (depends on <stdlib.h> for math)_
- [ ] Complete proxymod port
  - [ ] strafehud
    - [ ] accel
    - [ ] snaps
  - [ ] pitch
  - [ ] compass
  - [ ] jump
  - [ ] RL
  - [ ] GL
  - [ ] bbox

## 0.5.0 and over
- [ ] Crouch doesn't remove +left/+right
- [ ] Menus
- [ ] cg_drawgun 2
- [ ] cg_nodamagekick
- [ ] ...
  - [ ] Complete the list of TODO features
- [ ] Auto demo recording on timerStart, stop on timerEnd, and cancel on playerdie
- [ ] /varcommand
- [ ] (CPM) Correct deceleration values


## Entities (0.6.0)
- [ ] Map entities reset on `ClientSpawn()`
- [ ] No reset speed Teleporter SpawnFlag
- [ ] Support for all Entities
  - [ ] target_ entities
    - [ ] target_startTimer
    - [ ] target_stopTimer
    - [ ] target_checkpoint
    - [ ] target_speed
    - [ ] target_fragsFilter
    - [ ] target_init
    - [ ] target_smallprint
    - [ ] target_print
    - [ ] target_multimanager
  - [ ] shooter_ entities
    - [ ] shooter_grenade_targetplayer
    - [ ] shooter_plasma_targetplayer
    - [ ] shooter_rocket_targetplayer
    - [ ] shooter_bfg
  - [ ] trigger_ entities
    - [ ] trigger_push_velocity
  - [ ] weapon_grapplinghook_types (support for all df hook types)
- [ ] Entity filters:
  - [ ] notcpm
  - [ ] notvq3
  - [ ] notsp
  - [ ] notmp
  - [ ] notdf
  - [ ] nottm
  - [ ] notfc
  - [ ] notdefrag
- [ ] EntityPlus port
- [ ] Warp entities (aka portals)

## Gamemodes (0.7.0)
- [ ] Run (complete)
- [ ] Tricks Mode
- [ ] FastCap
- [ ] Hooks

## Multiplayer (0.8.0)
- [ ] Multiplayer
  - [ ] Remove player interaction (`df_mp_interferenceOff`)
  - [ ] Per client entity state (timers, weapons, etc)
  - [ ] Scoreboard
- [ ] Better timer
  - [ ] Independent timer score (separate to fragfilters/score)
  - [ ] Revert hack for `trigger_multiple->wait -1` being hardcoded to `0.5`
  - [ ] Per-client activation of triggers
  - [ ] Checkpoints and comparison to best times

## Ghosts and Records (0.9.0)
- [ ] Records saving to disk 
- [ ] Automatic replay recording
- [ ] Ghosts

## Complete functionality (1.0.0)
- [ ] Entity compatibility for existing maps
- [ ] HUD customization
- [ ] HUD cvar compatibility
- [ ] Server leaderboards
- [ ] Web access to leaderboards data

## Expand (+1.0.0)
_[this section is not a todo, but more like a wishlist of sorts]_
- [ ] Airjump Powerup
- [ ] Physics selection Powerups (cpm and vq3 sections in the same map)
- [ ] Client sided logic (EntityPlus and SourceEngine-I/O inspired)
- [ ] Gamemodes:
  - [ ] Native race mode (like AG, first to finish wins. also FFA race, standings based on finish order)
  - [ ] PVP race mode (can interact with other players, and do things to change their movement)
  - [ ] Timed Duel maps : Pick all key items to set a time (like ctf, but for duel maps instead)
  - [ ] Killrun
- [ ] Look-behind command (map-based, not global)
- [ ] Improved replay tools (q3mme inspired, using the new UI tools)
- [ ] New data and stats:
  - [ ] Persistent stats per map.
  - [ ] Checkpoints: player vs wr, p vs pb (spec or own), p vs own pb
  - [ ] Getting data from leaderboards server to compare
- [ ] Ghosts expand:
  - [ ] Multiple ghosts (example: own & spec'ed player)
- [ ] Conditional binds (bind X if cvar cvarvalue actionTrue actionFalse)
- [ ] Improved Loading screen:
  - [ ] Adjust thumbnail based on resolution
  - [ ] Better map info distribution
  - [ ] Add map description text field
- [ ] Separate respawn command
- [ ] 0ups Teleport property
- [ ] Improved networking
  - [ ] serverside rollback
  - [ ] clientside prediction for projectiles
  - [ ] predicted explosions
- [ ] SURF_FORCESTEPUP forces VQ3 stepup behavior on ledges (for CPM/CQ3)


## Wishlist
- [ ] Steam integration (requires Standalone game, since we are not modding baseq3 but gpl code)
- [ ] Vortex weapons (implosion/pull instead of explosion/knockback)
- [ ] Portals
- [ ] Halfjumps
- [ ] Gaus (needs new name)
- [ ] Walljumps (urt insp) (optional wsw-like powerup, to boost its power)

## Fixes
- [ ] Make target_speaker loop globally (currently can either loop or global, but not both)
- [ ] Solve issues with clip/slick/trigger brush rendering. transparency, render limit, impossible to hide some brushes from gameplay

# Done:
## Works in default q3a
- [x] Surface flags (uses shader properties)
- [x] Vq3 movement (`pmove_fixed 1`)
- [x] Vq3 Teleports
- [x] vq3 Hurt Trigger
- [x] target score

# Carried over from osdf-gpl
## Minimal working mod (0.0.1)
- [x] Initial setup & compilation (manual)
- [x] Map loading
- [x] Changes to the code actually affect gameplay through `.qvm` files

## Automated compilation on bash shell (0.0.2)
- [x] Automated compilation from makefile
- [x] Automated packing

## Minimal mod (0.1.0)
- [x] Full vq3 movement
- [x] Basic vq3 Weapons (should be full by default)  
- [x] Basic cpm strafing (Correct accel, aircontrol and A/D strafing)
- [x] First cpm/vq3 alpha/dev release version

## CPM and Physics selection (0.2.0)
- [x] Physics type Selection (phy_movetype NUMBER :: 0=CPM, 3=VQ3, 1:Q1-ag)
- [x] Full cpm strafing (double jumps, slick and other specific mechanics)
- [x] Full CPM weapons
  - [x] Instant weapon switch
  - [x] CPMA changes: Need side-by-side comparison of csdf-cpm and osdf-cpm
    - [x] (false) Shotgun damage decreased from 10 to 7
    - [x] (false) Shotgun spread increased from 700 to 900
    - [x] (false) Shotgun knockback increased from 1 to 1.35
    - [x] (false) Plasma Gun damage reduced from 20 to 15
    - [x] (false) Plasma Gun knockback reduced from 1 to 0.5
    - [x] (false) Grenade Launcher reload reduced from 800 to 600
    - [x] (false) Gauntlet knockback changed from 1 to 0.5
    - [x] (false) Machine Gun damage changed from 7 to 5
    - [x] (false) Lightning Gun knockback increased from 1 to 1.55
    - [x] (false) Railgun cooldown decreased from 1500 to 1000 for weapon switch
- [x] no-ob
  - [x] Rough implementation (cvar phy_overbounce_scale = 1.000f) //TODO Code is created. cvar is currently disconnected
  - [x] Robust fix for random overbounces only, while keeping the good ones.

