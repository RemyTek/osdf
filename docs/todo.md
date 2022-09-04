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
fix : .clang-format file no longer breaks function indentation in between macros

new : Test Makefile buildsystem for native windows compilation  
chg : Moved `build/linux/` folder to `build/make/` to reflect its multiplatform nature

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
fix : /cpm and /vq3 commands now work with osdf
new : Custom fork of oDFe. Loads osdf mod directly
```

### 4 : notI.notU : Implement when possible
```
new : Correct usage of new baseq3a CONTENTS_NODROP flag
```
