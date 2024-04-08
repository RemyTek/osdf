//
// all phy/* code is part of bg_pmove  (both games player movement code)
// takes playerstate and usercmd as input, and returns a modifed playerstate
#include "bg_phy.h"

// Physics variables
qboolean phy_initialized;
//  General
float phy_stopspeed;
// Acceleration
float phy_fly_accel;
// Friction
float phy_friction;
float phy_fly_friction;
float phy_spectator_friction;

// New variables
float phy_crouch_scale;  // Default renamed
// int   phy_movetype;             // pm->movetype; // Physics type selection
// Ground
float phy_ground_basespeed;  // Movement speed on the ground (aka maxspeed). Equivalent to the default g_speed
float phy_ground_accel;      // Acceleration when on the ground. sv_accelerate
// Air
float phy_air_basespeed;  // Maxspeed on air when in VQ3, or when strafing diagonally in CPM
float phy_air_accel;      // Acceleration when in VQ3, or when strafing diagonally in CPM
// Air deceleration. To have different accel values for stopping down than for accelerating normally.
float phy_air_decel;       // Factor to scale down air acceleration, when the current angle is over decelAngle
float phy_air_decelAngle;  // Angle at which air deceleration will change
// AirStrafe (aka AD turning)
float phy_airstrafe_accel;      // Acceleration when strafing "quakeworld style" in CPM
float phy_airstrafe_basespeed;  // Maxspeed on air when in VQ3, or when strafing diagonally in CPM
// AirControl (aka W turning)
qboolean phy_aircontrol;         // Turns aircontrol on or off
float    phy_aircontrol_amount;  // Amount you can control yourself with W/S
float    phy_aircontrol_power;   // Aircontrol formula exponent
float	phy_airstopaccelerate = 1;
float phy_wishspeed = 400;
// Stepup
int phy_step_size;    // Distance that will be moved up/down for step behavior. (default = STEPSIZE = 18)
int phy_step_maxvel;  // When set, it limits the maximum vertical speed at which you can multi/double jump. Prevents stairs-climb crazyness
// Jump
int phy_jump_type;         // Jump type selection. Available VQ3, CPM
int phy_jump_velocity;     // Vertical velocity that will be set/added when jumping (default = JUMP_VELOCITY = 270)
int phy_jump_timebuffer;   // Amount of time(ms) since last jump, where CPM dj behavior can happen. (default CPM = 400)
int phy_jump_dj_velocity;  // Amount of velocity to add to CPM dj behavior. (default CPM = 100)
// Powerups
// float phy_haste_factor;           // Multiplier to apply during haste powerup (q3 default = 1.3)
// float phy_quad_factor;            // Multiplier to apply during quad powerup  (q3 default = 3)
// Water
float phy_water_accel;
float phy_water_scale;  // phy_swimScale;
// Slick
float       phy_water_friction;
float       phy_slick_accel;

// Initialize Physics Values
qboolean phy_initialized = qfalse;

void     phy_init(int movetype) {
		// Reset all values, in case each init function is missing any
    phy_reset();
    // Initialize physics variables.
    switch (movetype) {
    case VQ3:
        vq3_init();
        break;
    case CPM:
        cpm_init();
        break;
    case CQ3:
        cq3_init();
        break;
    default:
        Com_Printf("::ERR physics not initialized:  phy_movetype %i not recognized\n", movetype);
        break;
    }
    Com_Printf("Initialized: phy_movetype %i\n", movetype);
    phy_initialized = qtrue;
}

// VectorReflect
// =============
// PM_ClipVelocity = VelocityProject = Vector_RotateAndScale = Vector_ReflectAndScale
//     Wrongly named "clip", due to doom naming inheritance.
//     It no longer "clips" a vector, but instead reflects / projects it with a scale
//     This is used when we want the player to not simply just go through a surface.
//
// - Takes an incoming vector (in), and reflects it on a surface (normal), scaled by the desired amount (overbounce)
//   This is also used to reflect vectors based on any other arbitrary vector
//
static void VectorReflect_(vec3_t in, vec3_t normal, vec3_t out, float overbounce, int dimensions, qboolean onesided) {
	// Calculate direction of rotation / reflection
	float backoff = DotProduct(in, normal);
	int i;
	// Scale the direction
	if (backoff < 0) {
		backoff *= overbounce;
	} else {
		if (!onesided) {
			backoff /= overbounce;
		}  // Standard behavior
		else {
			backoff = 0;
		}  // Ignore backoff when moving away from the surface   dot(in, normal) = positive
	}
	// Apply scale to the vector
	for (i = 0; i < dimensions; i++) {  // Will ignore Z when dimensions set to 2
		float change = normal[i] * backoff;
		out[i]       = in[i] - change;  // An overbounce value of 1.000 completely negates incoming velocity, due to this line
	}
}
// VectorReflect: Standard Behavior (Unmodded Q3A)
void VectorReflect(vec3_t in, vec3_t normal, vec3_t out, float overbounce) {
	VectorReflect_(in, normal, out, overbounce, 3, qfalse);
}
// VectorReflect: Horizontal Only
void VectorReflect2D(vec3_t in, vec3_t normal, vec3_t out, float overbounce) {
	VectorReflect_(in, normal, out, overbounce, 2, qfalse);
}
// VectorReflect: One Sided
//   Doesn't affect the vector, when we are moving away from the surface   dot(in, normal) = positive
void VectorReflectOS(vec3_t in, vec3_t normal, vec3_t out, float overbounce) {
	VectorReflect_(in, normal, out, overbounce, 3, qtrue);
}
// VectorReflect: Bouncy
//   Increases incoming overbounce value
void VectorReflectBC(vec3_t in, vec3_t normal, vec3_t out, float overbounce) {
	VectorReflect_(in, normal, out, overbounce + 1, 3, qfalse);
}

// Ground Trace
//   OBfix is applied here
// Forward declare
void q3a_GroundTrace(void);
void new_GroundTrace(void);
// Select type
void core_GroundTrace(void) {
	switch (pm->movetype) {
	case CPM:
		q3a_GroundTrace();
		break;
	case VQ3:
		q3a_GroundTrace();
		break;
	case CQ3:
		q3a_GroundTrace();
		break;
	default:
		break;
	}
}
// Unmodded Q3A version
void q3a_GroundTrace(void) {
	vec3_t  point;
	trace_t trace;

	point[0] = pm->ps->origin[0];
	point[1] = pm->ps->origin[1];
	point[2] = pm->ps->origin[2] - 0.25;

	pm->trace(&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
	pml.groundTrace = trace;

	// do something corrective if the trace starts in a solid...
	if (trace.allsolid) {
		if (!PM_CorrectAllSolid(&trace)) {
			return;
		}
	}
	// if the trace didn't hit anything, we are in free fall
	if (trace.fraction == 1.0) {
		PM_GroundTraceMissed();
		pml.groundPlane = qfalse;
		pml.walking     = qfalse;
		return;
	}
	// check if getting thrown off the ground
	if (pm->ps->velocity[2] > 0 && DotProduct(pm->ps->velocity, trace.plane.normal) > 10) {
		if (pm->debugLevel) {
			Com_Printf("%i:kickoff\n", c_pmove);
		}
		// go into jump animation
		if (pm->cmd.forwardmove >= 0) {
			PM_ForceLegsAnim(LEGS_JUMP);
			pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
		} else {
			PM_ForceLegsAnim(LEGS_JUMPB);
			pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
		}
		pm->ps->groundEntityNum = ENTITYNUM_NONE;
		pml.groundPlane         = qfalse;
		pml.walking             = qfalse;
		return;
	}

	// slopes that are too steep will not be considered onground
	if (trace.plane.normal[2] < MIN_WALK_NORMAL) {
		if (pm->debugLevel) {
			Com_Printf("%i:steep\n", c_pmove);
		}
		// FIXME: if they can't slide down the slope, let them walk (sharp crevices)
		pm->ps->groundEntityNum = ENTITYNUM_NONE;
		pml.groundPlane         = qtrue;
		pml.walking             = qfalse;
		return;
	}

	pml.groundPlane = qtrue;
	pml.walking     = qtrue;

	// hitting solid ground will end a waterjump
	if (pm->ps->pm_flags & PMF_TIME_WATERJUMP) {
		pm->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND);
		pm->ps->pm_time = 0;
	}

	if (pm->ps->groundEntityNum == ENTITYNUM_NONE) {
		// just hit the ground
		if (pm->debugLevel) {
			Com_Printf("%i:Land\n", c_pmove);
		}
		PM_CrashLand();

		// OBfix Reflect velocity on floor normal when landing
		if (pml.groundTrace.surfaceFlags & SURF_NOOB) {
			VectorReflect(pm->ps->velocity, trace.plane.normal, pm->ps->velocity, OVERCLIP);
		}

		//don't do landing time if we were just going down a slope
		if (pml.previous_velocity[2] < -200) {
			//don't allow another jump for a little while
			pm->ps->pm_flags != PMF_TIME_LAND;
			pm->ps->pm_time = 250;
		}
	}

	pm->ps->groundEntityNum = trace.entityNum;

	// OBfix Remove vertical OBs from Flat surfaces
	if (pml.groundTrace.surfaceFlags & SURF_NOOB && trace.plane.normal[2] == 1.0f) {
		pm->ps->velocity[2] = 0;
	}

	PM_AddTouchEnt(trace.entityNum);
}

//:::::::::::::::::::::::::::::::::::::::::
// core_CmdScale
//   Scale factor to apply to inputs (cmd).
//   Modified to (optionally) allow fixing slowdown when holding jump.
//   fix = Input scaling fix (active/inactive). For fixing slowdown on jump-hold
//   .. fix is ignored for VQ3/CPM
float core_CmdScale(usercmd_t* cmd, qboolean fix) {
	// Aliases, for readability
	float fmove = (float)abs(cmd->forwardmove);
	float smove = (float)abs(cmd->rightmove);
	float umove = (float)abs(cmd->upmove);
	int max;
	float total;

	// Select maximum input value (absolute)
	max = fmove;
	if (smove > max) {
		max = smove;
	}
	if (umove > max && !fix) {
		max = umove;
	}  // Ignore umove for scalefix
	if (!max) {
		return 0;
	}

	// Calculate total input value
	
	if (fix) {
		total = sqrt(fmove * fmove + smove * smove);
	}  // Ignore umove for scalefix
	else {
		total = sqrt(fmove * fmove + smove * smove + umove * umove);
	}

	// Calculate scale value and return it
	return (float)pm->ps->speed * max / (127.0 * total);
}

// Changed from q3a-gpl behavior to include basespeed.
void core_Accelerate(vec3_t wishdir, float wishspeed, float accel, float basespeed) {
	// Clamp wishpeed to a maximum of basespeed
	float wishspeed_c = wishspeed;  // Initialize clamped wishspeed
	float currentspeed;
	float addspeed;
	float accelspeed;	
	vec3_t accelVelocity;
	int i;

	if (wishspeed_c > basespeed) {
		wishspeed_c = basespeed;
	}
	// Determine veer amount
	currentspeed = DotProduct(pm->ps->velocity, wishdir);
	// See how much to add
	addspeed = wishspeed_c - currentspeed;
	// If not adding any, done.
	if (addspeed <= 0) {
		return;
	}
	// Acceleration speed to add after accel
	accelspeed = accel * wishspeed_c * pml.frametime;
	// Cap it
	if (accelspeed > addspeed) {
		accelspeed = addspeed;
	}

	// Adjust player velocity
	for (i = 0; i < 3; i++) {
		accelVelocity[i] = accelspeed * wishdir[i];  // dir*speed = velocity
		pm->ps->velocity[i] += accelVelocity[i];     // Vector addition, the typical visualization explained in videos of strafing math theory
	}
}

void core_Friction(void) {
	vec3_t vec;
	float* vel = pm->ps->velocity;
	float drop;
	float newspeed, control;
	float speed;

	VectorCopy(vel, vec);

	if (pml.walking) {
		vec[2] = 0;
	}  // ignore slope movement

	speed = VectorLength(vec);
	// allow sinking underwater   FIXME: still have z friction underwater?
	if (speed < 1) {
		vel[0] = 0;
		vel[1] = 0;
		return;
	}
	drop = 0;
	// apply ground friction

	if (pm->waterlevel <= 1) {
		if (pml.walking && !(pml.groundTrace.surfaceFlags & SURF_SLICK)) {
			if (!(pm->ps->pm_flags & PMF_TIME_KNOCKBACK)) {  // if getting knocked back, no friction
				control = speed < phy_stopspeed ? phy_stopspeed : speed;
				drop += control * phy_friction * pml.frametime;
			}
		}
	}
	// apply water friction even if just wading
	if (pm->waterlevel) {
		drop += speed * phy_water_friction * pm->waterlevel * pml.frametime;
	}
	// apply flying friction
	if (pm->ps->powerups[PW_FLIGHT]) {
		drop += speed * phy_fly_friction * pml.frametime;
	}
	if (pm->ps->pm_type == PM_SPECTATOR) {
		drop += speed * phy_spectator_friction * pml.frametime;
	}

	// scale the velocity
	newspeed = speed - drop;
	if (newspeed < 0) {
		newspeed = 0;
	}
	newspeed /= speed;
	VectorScale(vel, newspeed, vel);
}

static void core_FinishWeaponChange(void) {
	int weapon = pm->cmd.weapon;
	if (weapon < WP_NONE || weapon >= WP_NUM_WEAPONS) {
		weapon = WP_NONE;
	}
	if (!(pm->ps->stats[STAT_WEAPONS] & (1 << weapon))) {
		weapon = WP_NONE;
	}

	pm->ps->weapon      = weapon;
	pm->ps->weaponstate = WEAPON_RAISING;
	pm->ps->weaponTime += pm->movetype == CPM ? 0 : 250;  // Instant weapon switch for cpm
	PM_StartTorsoAnim(TORSO_RAISE);
}

static void core_BeginWeaponChange(int weapon) {
	if (weapon <= WP_NONE || weapon >= WP_NUM_WEAPONS) {
		return;
	}
	if (!(pm->ps->stats[STAT_WEAPONS] & (1 << weapon))) {
		return;
	}
	if (pm->ps->weaponstate == WEAPON_DROPPING) {
		return;
	}

	PM_AddEvent(EV_CHANGE_WEAPON);
	pm->ps->weaponstate = WEAPON_DROPPING;
	pm->ps->weaponTime += pm->movetype == CPM ? 0 : 250;
	PM_StartTorsoAnim(TORSO_DROP);
}

void core_Weapon(void) {

	int addTime;

	// don't allow attack until all buttons are up
	if (pm->ps->pm_flags & PMF_RESPAWNED) {
		return;
	}
	// ignore if spectator
	if (pm->ps->persistant[PERS_TEAM] == TEAM_SPECTATOR) {
		return;
	}
	// check for dead player
	if (pm->ps->stats[STAT_HEALTH] <= 0) {
		pm->ps->weapon = WP_NONE;
		return;
	}
	// check for item using
	if (pm->cmd.buttons & BUTTON_USE_HOLDABLE) {
		if (!(pm->ps->pm_flags & PMF_USE_ITEM_HELD)) {
			if (bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag == HI_MEDKIT && pm->ps->stats[STAT_HEALTH] >= (pm->ps->stats[STAT_MAX_HEALTH] + 25)) {
				// don't use medkit if at max health
			} else {
				pm->ps->pm_flags |= PMF_USE_ITEM_HELD;
				PM_AddEvent(EV_USE_ITEM0 + bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag);
				pm->ps->stats[STAT_HOLDABLE_ITEM] = 0;
			}
			return;
		}
	} else {
		pm->ps->pm_flags &= ~PMF_USE_ITEM_HELD;
	}

	// make weapon function
	if (pm->ps->weaponTime > 0) {
		pm->ps->weaponTime -= pml.msec;
	}

	// check for weapon change
	// can't change if weapon is firing, but can change
	// again if lowering or raising
	if (pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING) {
		if (pm->ps->weapon != pm->cmd.weapon) {
			core_BeginWeaponChange(pm->cmd.weapon);
		}
	}
	if (pm->ps->weaponTime > 0) {
		return;
	}

	// change weapon if time
	if (pm->ps->weaponstate == WEAPON_DROPPING) {
		core_FinishWeaponChange();
		return;
	}

	if (pm->ps->weaponstate == WEAPON_RAISING) {
		pm->ps->weaponstate = WEAPON_READY;
		if (pm->ps->weapon == WP_GAUNTLET) {
			PM_StartTorsoAnim(TORSO_STAND2);
		} else {
			PM_StartTorsoAnim(TORSO_STAND);
		}
		return;
	}

	// check for fire
	if (!(pm->cmd.buttons & BUTTON_ATTACK)) {
		pm->ps->weaponTime  = 0;
		pm->ps->weaponstate = WEAPON_READY;
		return;
	}

	// start the animation even if out of ammo
	if (pm->ps->weapon == WP_GAUNTLET) {
		// the guantlet only "fires" when it actually hits something
		if (!pm->gauntletHit) {
			pm->ps->weaponTime  = 0;
			pm->ps->weaponstate = WEAPON_READY;
			return;
		}
		PM_StartTorsoAnim(TORSO_ATTACK2);
	} else {
		PM_StartTorsoAnim(TORSO_ATTACK);
	}

	pm->ps->weaponstate = WEAPON_FIRING;

	// check for out of ammo
	if (!pm->ps->ammo[pm->ps->weapon]) {
		PM_AddEvent(EV_NOAMMO);
		pm->ps->weaponTime += 500;
		return;
	}

	// take an ammo away if not infinite
	if (pm->ps->ammo[pm->ps->weapon] != -1) {
		pm->ps->ammo[pm->ps->weapon]--;
	}

	// fire weapon
	PM_AddEvent(EV_FIRE_WEAPON);

	switch (pm->ps->weapon) {
	default:
	case WP_GAUNTLET:
		addTime = 400;
		break;
	case WP_LIGHTNING:
		addTime = 50;
		break;
	case WP_SHOTGUN:
		addTime = 1000;
		break;
	case WP_MACHINEGUN:
		addTime = 100;
		break;
	case WP_GRENADE_LAUNCHER:
		addTime = 800;
		break;
	case WP_ROCKET_LAUNCHER:
		addTime = 800;
		break;
	case WP_PLASMAGUN:
		addTime = 100;
		break;
	case WP_RAILGUN:
		addTime = 1500;
		break;
	case WP_BFG:
		addTime = 200;
		break;
	case WP_GRAPPLING_HOOK:
		addTime = 400;
		break;

#ifdef TEAMARENA
	case WP_NAILGUN:
		addTime = 1000;
		break;
	case WP_PROX_LAUNCHER:
		addTime = 800;
		break;
	case WP_CHAINGUN:
		addTime = 30;
		break;
#endif
	}

#ifdef TEAMARENA
	if (bg_itemlist[pm->ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT) {
		addTime /= 1.5;
	} else if (bg_itemlist[pm->ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN) {
		addTime /= 1.3;
	} else
#endif
		if (pm->ps->powerups[PW_HASTE]) {
		addTime /= 1.3;
	}
	pm->ps->weaponTime += addTime;
}

//================
// PmoveSingle
//================
void phy_PmoveSingle(pmove_t* pmove) {
	// Initialize
	pm = pmove;
	// this counter lets us debug movement problems with a journal
	// by setting a conditional breakpoint for the previous frame
	c_pmove++;
	// clear results
	pm->numtouch   = 0;
	pm->watertype  = 0;
	pm->waterlevel = 0;

	// corpses can fly through bodies
	if (pm->ps->stats[STAT_HEALTH] <= 0) {
		pm->tracemask &= ~CONTENTS_BODY;
	}
	// make sure walking button is clear if running, avoids proxy no-footsteps cheats
	if (abs(pm->cmd.forwardmove) > 64 || abs(pm->cmd.rightmove) > 64) {
		pm->cmd.buttons &= ~BUTTON_WALKING;
	}
	// set the talk balloon flag
	if (pm->cmd.buttons & BUTTON_TALK) {
		pm->ps->eFlags |= EF_TALK;
	} else {
		pm->ps->eFlags &= ~EF_TALK;
	}
	// set the firing flag for continuous beam weapons
	if (!(pm->ps->pm_flags & PMF_RESPAWNED) && pm->ps->pm_type != PM_INTERMISSION && pm->ps->pm_type != PM_NOCLIP && (pm->cmd.buttons & BUTTON_ATTACK) &&
	    pm->ps->ammo[pm->ps->weapon]) {
		pm->ps->eFlags |= EF_FIRING;
	} else {
		pm->ps->eFlags &= ~EF_FIRING;
	}
	// clear the respawned flag if attack and use are cleared
	if (pm->ps->stats[STAT_HEALTH] > 0 && !(pm->cmd.buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE))) {
		pm->ps->pm_flags &= ~PMF_RESPAWNED;
	}

	// if talk button is down, disallow all other input. Prevents potential intercept proxies from adding fake talk balloons
	if (pmove->cmd.buttons & BUTTON_TALK) {
		// keep talk button set, for when cmd.serverTime > 66 msec and the same cmd is used multiple times in Pmove
		pmove->cmd.buttons     = BUTTON_TALK;
		pmove->cmd.forwardmove = 0;
		pmove->cmd.rightmove   = 0;
		pmove->cmd.upmove      = 0;
	}
	// clear all pmove local vars
	memset(&pml, 0, sizeof(pml));
	// determine the time
	pml.msec = pmove->cmd.serverTime - pm->ps->commandTime;
	if (pml.msec < 1) {
		pml.msec = 1;
	} else if (pml.msec > 200) {
		pml.msec = 200;
	}
	pm->ps->commandTime = pmove->cmd.serverTime;
	pml.frametime       = pml.msec * 0.001;

	// save old org in case we get stuck
	VectorCopy(pm->ps->origin, pml.previous_origin);
	// save old velocity for crashlanding
	VectorCopy(pm->ps->velocity, pml.previous_velocity);

	// update viewangles
	PM_UpdateViewAngles(pm->ps, &pm->cmd);
	AngleVectors(pm->ps->viewangles, pml.forward, pml.right, pml.up);
	// not holding jump
	if (pm->cmd.upmove < 10) {
		pm->ps->pm_flags &= ~PMF_JUMP_HELD;
	}
	// decide if backpedaling animations should be used
	if (pm->cmd.forwardmove < 0) {
		pm->ps->pm_flags |= PMF_BACKWARDS_RUN;
	} else if (pm->cmd.forwardmove > 0 || (pm->cmd.forwardmove == 0 && pm->cmd.rightmove)) {
		pm->ps->pm_flags &= ~PMF_BACKWARDS_RUN;
	}
	// remove inputs if dead
	if (pm->ps->pm_type >= PM_DEAD) {
		pm->cmd.forwardmove = 0;
		pm->cmd.rightmove   = 0;
		pm->cmd.upmove      = 0;
	}
	// do spectator move
	if (pm->ps->pm_type == PM_SPECTATOR) {
		PM_CheckDuck();
		PM_FlyMove();
		PM_DropTimers();
		return;
	}
	// do noclip move
	if (pm->ps->pm_type == PM_NOCLIP) {
		PM_NoclipMove();
		PM_DropTimers();
		return;
	}
	// dont do anything else if frozen or intermission
	if (pm->ps->pm_type == PM_FREEZE) {
		return;
	}
	if (pm->ps->pm_type == PM_INTERMISSION || pm->ps->pm_type == PM_SPINTERMISSION) {
		return;
	}
	// do deadmove
	if (pm->ps->pm_type == PM_DEAD) {
		PM_DeadMove();
	}

	// set watertype, and waterlevel
	PM_SetWaterLevel();
	pml.previous_waterlevel = pmove->waterlevel;

	// do physics movement
	phy_move(pm);
	return;
}

// Select the type of movement to execute. Flow control only.
// Behavior happens inside each function
void phy_move(pmove_t* pmove) {
	if (!phy_initialized) {
		phy_init(pmove->movetype);
	}
	switch (pmove->movetype) {
	case CPM:
		cpm_move(pmove);
		break;
	case VQ3:
		vq3_move(pmove);
		break;
	case CQ3:
		cq3_move(pmove);
		break;
	default:
		Com_Printf("::ERR phy_movetype %i not recognized\n", pmove->movetype);
		break;
	}
}

//:::::::::::::
// phy_reset
//  Reset all values to vq3 behavior, in case some init function is missing one of them
//:::::::::::::
void phy_reset(void) {
	phy_stopspeed = pm_stopspeed;
	// Crouch
	phy_crouch_scale = pm_duckScale;
	// Slick
	phy_slick_accel = 1;
	// Acceleration
	phy_ground_accel = pm_accelerate;
	phy_air_accel    = pm_airaccelerate;
	phy_fly_accel    = pm_flyaccelerate;
	// Friction
	phy_friction           = pm_friction;
	phy_fly_friction       = pm_flightfriction;
	phy_spectator_friction = pm_spectatorfriction;
	// New variables
	// Ground
	phy_ground_basespeed = 320;
	phy_ground_accel     = 10;
	// Air
	phy_air_basespeed = 320;
	phy_air_accel     = 1;
	phy_airstopaccelerate = 1;
	phy_wishspeed = 400;
	// Air deceleration.
	phy_air_decel      = 0;
	phy_air_decelAngle = 0;
	// AirStrafe (aka AD turning)
	phy_airstrafe_accel     = 0;
	phy_airstrafe_basespeed = 0;
	// AirControl (aka W turning)
	phy_aircontrol        = qfalse;
	phy_aircontrol_amount = 0;
	phy_aircontrol_power  = 0;
	// Stepup
	phy_step_size   = STEPSIZE;
	phy_step_maxvel = JUMP_VELOCITY;
	// Jump
	phy_jump_type        = VQ3;
	phy_jump_velocity    = JUMP_VELOCITY;
	phy_jump_timebuffer  = 0;
	phy_jump_dj_velocity = 0;
	// Powerups
	// phy_haste_factor        = 0;
	// phy_quad_factor         = 0;
	// Water
	phy_water_accel    = pm_wateraccelerate;
	phy_water_scale    = pm_swimScale;
	phy_water_friction = pm_waterfriction;
	Com_Printf("Physics Reset\n");
}
//:::::::::::::::::::::::::::::::::::::::::::::::::::::

//:::::::::::::::::::::::::::::::::::::::::::::::::::::
// Initialize physics values
//::::::::::::::::::::::
void cpm_init(void) {
	phy_stopspeed    = pm_stopspeed;
	phy_crouch_scale = pm_duckScale;
	// Acceleration
	phy_fly_accel = pm_flyaccelerate;
	// Friction
	phy_friction           = pm_friction;
	phy_fly_friction       = pm_flightfriction;
	phy_spectator_friction = pm_spectatorfriction;
	// Water
	phy_water_accel    = pm_wateraccelerate;
	phy_water_scale    = pm_swimScale;
	phy_water_friction = 0.5;
	// New
	phy_ground_basespeed = 320;
	phy_ground_accel     = 15;
	// Air movement
	phy_air_basespeed  = 320;
	phy_air_accel      = 1;
	phy_air_decel      = 2.5;
	phy_air_decelAngle = 100;
	// W turning
	phy_aircontrol        = qtrue;
	phy_aircontrol_amount = 150;
	phy_aircontrol_power  = 2;
	// AD turning
	phy_airstrafe_basespeed = 30;
	phy_airstrafe_accel     = 70;
	// Jump
	phy_jump_type        = CPM;
	phy_jump_timebuffer  = 400;
	phy_jump_dj_velocity = 100;
	phy_jump_velocity    = JUMP_VELOCITY;
	phy_step_maxvel      = phy_jump_velocity + phy_jump_dj_velocity;
}

void vq3_init(void) {
	phy_stopspeed    = pm_stopspeed;
	phy_crouch_scale = pm_duckScale;
	// Acceleration
	phy_ground_accel = pm_accelerate;
	phy_air_accel    = pm_airaccelerate;
	phy_fly_accel    = pm_flyaccelerate;
	// Friction
	phy_friction           = pm_friction;
	phy_fly_friction       = pm_flightfriction;
	phy_spectator_friction = pm_spectatorfriction;
	// Water
	phy_water_accel    = pm_wateraccelerate;
	phy_water_scale    = pm_swimScale;
	phy_water_friction = pm_waterfriction;
	// New
	phy_aircontrol    = qfalse;
	phy_jump_type     = VQ3;
	phy_jump_velocity = JUMP_VELOCITY;
}

void cq3_init(void) {
	phy_stopspeed    = pm_stopspeed;
	phy_crouch_scale = pm_duckScale;
	// Slick
	phy_slick_accel = 15;  // CPM groundaccel value
	// Acceleration
	phy_fly_accel = pm_flyaccelerate;
	// Friction
	phy_friction           = pm_friction;
	phy_fly_friction       = pm_flightfriction;
	phy_spectator_friction = pm_spectatorfriction;
	// Water
	phy_water_accel    = pm_wateraccelerate;
	phy_water_scale    = pm_swimScale;
	phy_water_friction = 0.5;
	// Ground movement
	phy_ground_basespeed = 320;
	phy_ground_accel     = 10;
	// Air movement
	phy_air_basespeed  = 320;
	phy_air_accel      = 1;
	phy_air_decel      = 2.5;
	phy_air_decelAngle = 100;
	// W turning
	phy_aircontrol        = qfalse;
	phy_aircontrol_amount = 0;
	phy_aircontrol_power  = 0;
	// AD turning
	phy_airstrafe_basespeed = 0;
	phy_airstrafe_accel     = 0;
	// Jump
	phy_jump_type        = CPM;
	phy_jump_timebuffer  = 400;
	phy_jump_dj_velocity = 100;
	phy_jump_velocity    = JUMP_VELOCITY;
	phy_step_maxvel      = phy_jump_velocity + phy_jump_dj_velocity;
}

static qboolean q3a_CheckJump(void) {
	
	qboolean canDoubleJump;
	
	// Can't jump cases. Cannot jump again under these conditions
	// don't allow jump until all buttons are up
	if (pm->ps->pm_flags & PMF_RESPAWNED) {
		return qfalse;
	}
	if (pm->cmd.upmove < 10) {
		return qfalse;
	}                                        // not holding jump
	if (pm->ps->pm_flags & PMF_JUMP_HELD) {  // must wait for jump to be released
		pm->cmd.upmove = 0;                  // clear upmove so cmdscale doesn't lower running speed
		return qfalse;
	}

	// Else: Can jump. Do jump behavior
	pml.groundPlane = qfalse;  // jumping away
	pml.walking     = qfalse;
	pm->ps->pm_flags |= PMF_JUMP_HELD;
	pm->ps->groundEntityNum = ENTITYNUM_NONE;

	//:: vq3 or CPM jump selection
	//
	// Select ADD or SET vertical velocity.
	canDoubleJump = (pm->ps->velocity[2] > 0 && pm->movetype != VQ3) ? qtrue : qfalse;
	if (canDoubleJump) {
		pm->ps->velocity[2] += phy_jump_velocity;
	}  // ADD velocity, without resetting current
	else {
		pm->ps->velocity[2] = phy_jump_velocity;
	}  // SET velocity, resets current
	//
	// Timer check
	if (pm->movetype == CPM || pm->movetype == CQ3) {
		int      djtimer   = pm->cmd.serverTime - pm->ps->stats[STAT_TIME_LASTJUMP];
		qboolean djtimerOn = ((djtimer <= phy_jump_timebuffer) && (djtimer > 0)) ? qtrue : qfalse;  // We can dj when this is true.
		if (djtimerOn) {  // Increase height by +100 (default cpm). We can jump, and timer is on.
			pm->ps->velocity[2] += phy_jump_dj_velocity;
			if (pm->debugLevel) {
				Com_Printf(":: DoubleJump -> Timer= %i, Lastjump= %i, servertime= %i\n", djtimer, pm->ps->stats[STAT_TIME_LASTJUMP], pm->cmd.serverTime);
			}
		} else {
			pm->ps->stats[STAT_TIME_LASTJUMP] = pm->cmd.serverTime;
		}  // Reset the timer: We can jump, but dj timer is off.
	}
	//:: vq3 or CPM jump selection end

	PM_AddEvent(EV_JUMP);
	if (pm->cmd.forwardmove >= 0) {
		PM_ForceLegsAnim(LEGS_JUMP);
		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
	} else {
		PM_ForceLegsAnim(LEGS_JUMPB);
		pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
	}
	// We have jumped
	if (pm->debugLevel) {
		Com_Printf("%i:Jump\n", c_pmove);
	}
	return qtrue;
}

static void q3a_AirControl(vec3_t wishdir, float wishspeed) {

	float zVel;
	float speed;
	float dot;
	float k;

	// Initial values
	zVel          = pm->ps->velocity[2];
	pm->ps->velocity[2] = 0;
	speed         = VectorLength(pm->ps->velocity);
	VectorNormalize(pm->ps->velocity);
	k = 32;  // Magic constant. Why 32?

	// Calculate turning amount
	dot = DotProduct(pm->ps->velocity, wishdir);
	if (dot > 0) {
		k = k * phy_aircontrol_amount * Q_powf(dot, phy_aircontrol_power) * pml.frametime;
		VectorMAM(speed, pm->ps->velocity, k, wishdir, pm->ps->velocity);
		VectorNormalize(pm->ps->velocity);
	}
	// Apply speed
	pm->ps->velocity[0] *= speed;
	pm->ps->velocity[1] *= speed;
	pm->ps->velocity[2] = zVel;  // Restore starting vertical velocity
}

void q3a_AirMove(void) {void     phy_init(int movetype) {
		// Reset all values, in case each init function is missing any
    phy_reset();
    // Initialize physics variables.
    switch (movetype) {
    case VQ3:
        vq3_init();
        break;
    case CPM:
        cpm_init();
        break;
    case CQ3:
        cq3_init();
        break;
    default:
        Com_Printf("::ERR physics not initialized:  phy_movetype %i not recognized\n", movetype);
        break;
    }
    Com_Printf("Initialized: phy_movetype %i\n", movetype);
    phy_initialized = qtrue;
}