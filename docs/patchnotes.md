**Legend**
> new : New features  
> chg : Change in existing functionality  
> dep : Soon-to-be removed feature  
> rmv : Removed feature  
> fix : Bug fixes.  
> sec : Security, in case of vulnerabilities.  
> ... : Part of the feature listed above it


# Unreleased
```md
```
... :  

## 0.2.5
_v0.2.5c_
```md
2022.09.04
fix : .clang-format file no longer breaks the formatting of the Cvar lists in g_main.c and cg_main.c
chg : g_forcerespawn now means miliseconds, instead of seconds  
... : g_forcerespawn default value changed to 1. Previous behavior is now `g_forcerespawn 20000`  
new : Gamemode "run" (basic). Replaces FFA, `g_gametype 0`  
... : Replaced all GT_FFA enum entries with GT_RUN (value stays the same)
... : Replaced all "Free for All" text strings with "Defrag Run"
chg : Removed the "Waiting for players" message when cg.warmup is < 0
chg : Respawn minimum delay changed from 1700 to 0 on player_die()
chg : Powerups no longer drop on player_die()
chg : Score is now set to 0 on player_die()
new : New function SetScore() on g_combat.c. Modified version of AddScore()
chg : (CPM) Rocket Launcher: Missile speed increased from 900 to 1000  
fix : (CPM) Rocket Launcher: Vertical self knockback scaling reduced to 1  
chg : (CPM) Rocket Launcher: Self knockback increased to 1.2  
```

_v0.2.5b_
```md
2022.09.03
fix : Cursor shader for the new ui is no longer broken
chg : Extended the content of `docs/contribute.md`. Including PR, Rebasing, Commit style, Guidelines, etc
new : Added file `docs/bugs.md` to keep a todo list of user bug reports
new : Added function `isEmpty()` to the `build/linux/helper.py` tools script
new : Added function `Pk3CreateAll()` to the `build/linux/helper.py` tools script
new : Initial Main Menu UI layout, background and theme
chg : Added `game/mod-info.h` file. For defining mod info defines (version, license, name, etc)
chg : Removed Quake3 3D banner from the menu. TODO: Cleanup code. Only commented the line where its added to the scene.
```

_v0.2.5_
```md
2022.09.02
chg : CPM Item Pickup: Above size increased from 36u (32u doesn't trigger) to 66 (62u doesn't trigger)  
new : Added verbose switch `-v` to the build/linux/build.py file
chg : Renamed `COMPILE_` to `CURRENT_` in the file build/linux/Makefile
fix : Reverted COMPILE_PLATFORM changes to the makefile. Automated buildscript now uses PLATFORM instead (as it was intended. compile_platform actually means current_platform)
fix : .clang-format file no longer breaks the whole project due to include sorting
fix : .clang-format file no longer breaks the formatting of array tables (cvar tables, command lists, etc)
fix : .clang-format file no longer packs single-instruction functions into one line when they fit the line-width
fix : .clang-format file now aligns variable declarations, like id-Tech3 does
chg : cg_drawSpeed now defaults to 1
chg : Bob cvars now default to 0
chg : Updated project's readme, to better represent its goals.  
chg : Moved `win32-qvm` into the deprecated subfolder, and added readme explaining the reasons to move away from qvm.  

2022.09.01
new : Added python buildscript helper in `build/linux`. For automatic building/packing of releases. Multiplatform, but currently depends on the Makefile
new : Buildscript creates and zips both platform binaries  
new : Added basic buildsystem instructions (sketch)  
new : (cfg) New osdf-visual.cfg file, with some modern/saner visual config defaults. Loads from autoexec.cfg
new : (cfg) Added the autoexec.cfg file that will be distributed with the mod
... : (cfg) VM configuration disables QVM loading (vm_cgame 0, vm_game 0, vm_ui 0)  
... : (cfg) Server Pure is deactivated, to allow Library Loading (sv_pure 0)  
chg : Changed default pmove_fixed value to 1. It doesn't need to be changed by cfg to work correctly.  
new : (cfg) Added the description.txt file that will be distributed with the mod

2022.08.31
chg : moved b3a speedmeter closer to the center of the screen
... : changed `cg_drawSpeed 2` to mean `not centered`
... : removed "ups" from the string
chg : Default cg_fov from 90 to 105
chg : com_blood and cg_gibs now default to 0
new : Math function: VectorMAM
new : phy_movetype cvars for cg_ and g_
new : Added surface type SURF_NOOB, to support the OBfix code ported from osdf-gpl
new : Added STAT_TIME_LASTJUMP to the pm_stats enum, to support jump timer control
new : New file bg_pmove.h, contains declarations needed in bg_phy
chg : Changed the codeflow at the end of Pmove() from PmoveSingle to phy_PmoveSingle
new : Added code/game/bg_phy files, for storing custom movement functions outside of bg_pmove.c
new : Added Lumia's LLVM based clang-format file to the project. Changed its linewidth to 160, to not break q3 code standards
new : Added a simple nimscript compiling script, for automated building for both platforms (win/lnx x64)
chg : Added ifndef guard to COMPILE_FLAGS in the linux makefile, to allow cross compiling from cli arguments
fix : `ED_vsprintf()`: Changed all calls to `va_arg` that contained `char` type, into `int` instead, to fix the compiler correcting undefined behavior on native (-Wvarargs)
... : First build of the code didn't launch with native libraries. Had to fix this char promotion bug to make it launch
```

# Ported from osdf-gpl
## 0.3.0
2022.07.14  
```
new : (CQ3) New physics: VQ3 aircontrol, with CPM tech (dj/ramps/slick/etc)  
```

2022.07.12  
```
fix : (VQ3) Fixed upramps giving the wrong amount of velocity on jump  
```

## 0.2.0
2022.06.21  
_v0.2.0-r0_  
```
new : OBfix. Applied on SURF_NOOB surfaces (cvar to be done)
chg : bg_pmove restructure. Moved all custom code to bg_phy.* files
new : (code) VectorReflectOS. Sets backoff = 0 when facing away from the surface
```

## 0.0.2
```
new : Full cpm strafing (double jumps, slick haste, telejumps, stairjumps, rampjumps, etc)  
new : CPM weapon behavior  
... : Instant weapon switch on CPM  
new : Physics type Selection (phy_movetype NUMBER :: 0=CPM, 1=VQ3, 2=CQ3)  
```

## 0.0.1
```
new : Basic cpm strafing (Correct accel, aircontrol and A/D strafing)  
```

## 0.0.0 (Mod Compiling Basics)  
```
new : Initial setup & compilation (manual)  
```
```
:: Worked by default  
: Surface flags (uses shader properties)  
: Vq3 movement (`pmove_fixed 1`)  
: Vq3 Weapons  
: Vq3 Teleports  
: vq3 Hurt Trigger  
: target_score  
: Map loading  
```
