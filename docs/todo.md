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
fix : CPM Rocket Launcher: Vertical self knockback scaling reduced to 1  
chg : CPM Rocket Launcher: Self knockback increased to 1.2  
chg : Rocket Launcher speed increased from 900 to 1000  

new : Gamemode "run" (basic). Replaces FFA, `g_gametype 0`  
... : Powerups no longer drop on dead
new : Instant respawn.   
... : player_die() has no delay.   
... : g_forcerespawn now means miliseconds, instead of seconds  
... : g_forcerespawn default value changed to 1. Previous behavior is now `g_forcerespawn 20000`  

new : target_startTimer entity support  
new : target_stopTimer entity support  
new : Local Timer. Best per session. All maps have TimeReset (temporary hack until better Timer support)  

new : Custom fork of oDFe. Loads osdf mod directly
fix : /cpm and /vq3 commands now work with osdf

new : Test Makefile buildsystem for native windows compilation  
chg : Moved `build/linux/` folder to `build/make/` to reflect its multiplatform nature

chg : Changed versioning system from `0.0.0x` to `0.00x`
new : Automated version management from the files `build/linux/build.py` and `code/game/mod-info.h`
```

## TODO
**Priority Quadrant**  
_Urgent:_  
Cause us to react.  
We stop what we're currently doing and work on the urgent task instead.  
_Important:_   
Lead us towards our vision / goals.  
Require planning, organization and initiative.  

### 1 : IMP.URG : Critical
```
```

### 2 : IMP.notU : Planned Goals
```
new : Velocity pads  
new : Proxymod support  
new : Hud element: Current map & Internal version  
new : Map loader UI  
new : New hud for Player state configuration (health, ammo, powerups, etc)  
```

### 3 : notI.URG : Non-critical Fixes
```
fix : map_restart doesn't reset timer
chg : `g_synchronousClients 1` by default for offline
```

### 4 : notI.notU : Implement when possible
```
```
