**Legend**
> new : New features  
> chg : Change in existing functionality  
> dep : Soon-to-be removed feature  
> rmv : Removed feature  
> fix : Bug fixes.  
> sec : Security, in case of vulnerabilities.  
> ... : Part of the feature listed above it


# TODO : gpl to sdk
```
chg : CPM Item Pickup: Above size increased from 36u (32u doesn't trigger) to 66 (62u doesn't trigger)  
new : Added basic buildsystem instructions (sketch)  
new : Initial edits to the buildsystem for native windows compilation  
fix : CPM Rocket Launcher: Vertical self knockback scaling reduced to 1  
new : (cfg) VM configuration disables QVM loading (vm_cgame 0, vm_game 0, vm_ui 0)  
new : (cfg) Server Pure is deactivated, to allow Library Loading (sv_pure 0)  
new : Buildscript creates and zips both platform binaries  
new : Custom fork of oDFe. Loads osdf mod directly
chg : CPM Rocket Launcher: Self knockback increased to 1.2  
fix : /cpm and /vq3 commands now work with osdf
new : Local Timer. Best per session. All maps have TimeReset (temporary hack until better Timer support)  
new : target_startTimer entity support  
new : target_stopTimer entity support  
chg : Rocket Launcher speed increased from 900 to 1000  
new : Initial Main Menu UI layout, background and theme
new : Instant respawn.   
... : player_die() has no delay.   
... : g_forcerespawn now means miliseconds, instead of seconds  
... : g_forcerespawn default value changed to 1. Previous behavior is now `g_forcerespawn 20000`  
new : Gamemode "run" (basic). Replaces FFA, `g_gametype 0`  
... : Powerups no longer drop on dead
chg : Changed default pmove_fixed value to 1. It doesn't need to be changed by cfg to work correctly.  
```

# TODO
#::::::::::::::
_Urgent    : Cause us to react. We stop what we're currently doing and work on the urgent task instead._
_Important : Lead us towards our mission/goals. Require planning, organization and initiative._
#::::::::::::::
# 1 : IMP.URG : Critical
#::::::::::::::
chg : `g_synchronousClients 1` by default for offline

#:::::::::::::::
# 2 : IMP.notU : Planned Goals
#:::::::::::::::
new : Velocity pads  
new : Proxymod support  
new : Hud element: Current map & Internal version  
new : Map loader UI  
new : Launcher / Updater / Downloader
new : New hud for Player state configuration (health, ammo, powerups, etc)  

#:::::::::::::::
# 3 : notI.URG : Non-critical Fixes
#:::::::::::::::
fix : map_restart doesn't reset timer

#::::::::::::::::
# 4 : notI.notU : Implement when possible
#::::::::::::::::
