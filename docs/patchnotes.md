**Legend**
> new : New features  
> chg : Change in existing functionality  
> dep : Soon-to-be removed feature  
> rmv : Removed feature  
> fix : Bug fixes.  
> sec : Security, in case of vulnerabilities.  
> ... : Part of the feature listed above it


# Unreleased
_v0.2.5-r0_
2022.09.02
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

```md
```
... :  


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
