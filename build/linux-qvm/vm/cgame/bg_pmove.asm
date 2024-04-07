data
export pm_stopspeed
align 4
LABELV pm_stopspeed
byte 4 1120403456
export pm_duckScale
align 4
LABELV pm_duckScale
byte 4 1048576000
export pm_swimScale
align 4
LABELV pm_swimScale
byte 4 1056964608
export pm_wadeScale
align 4
LABELV pm_wadeScale
byte 4 1060320051
export pm_accelerate
align 4
LABELV pm_accelerate
byte 4 1092616192
export pm_airaccelerate
align 4
LABELV pm_airaccelerate
byte 4 1065353216
export pm_wateraccelerate
align 4
LABELV pm_wateraccelerate
byte 4 1082130432
export pm_flyaccelerate
align 4
LABELV pm_flyaccelerate
byte 4 1090519040
export pm_friction
align 4
LABELV pm_friction
byte 4 1086324736
export pm_waterfriction
align 4
LABELV pm_waterfriction
byte 4 1065353216
export pm_flightfriction
align 4
LABELV pm_flightfriction
byte 4 1077936128
export pm_spectatorfriction
align 4
LABELV pm_spectatorfriction
byte 4 1084227584
export c_pmove
align 4
LABELV c_pmove
byte 4 0
align 4
LABELV pm_respawntimer
byte 4 0
export phy_initialized
align 4
LABELV phy_initialized
byte 4 0
export PM_AddEvent
code
proc PM_AddEvent 0 16
file "../../../../code/game/bg_pmove.c"
line 91
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_pmove.c -- both games player movement code
;4:// takes a playerstate and a usercmd as input and returns a modifed playerstate
;5:
;6:#include "bg_pmove.h"
;7:#include "bg_phy.h"
;8:
;9:pmove_t* pm;
;10:pml_t    pml;
;11:
;12:// movement parameters
;13:float pm_stopspeed = 100.0f;
;14:float pm_duckScale = 0.25f;
;15:float pm_swimScale = 0.50f;
;16:float pm_wadeScale = 0.70f;
;17:
;18:float pm_accelerate      = 10.0f;
;19:float pm_airaccelerate   = 1.0f;
;20:float pm_wateraccelerate = 4.0f;
;21:float pm_flyaccelerate   = 8.0f;
;22:
;23:float pm_friction          = 6.0f;
;24:float pm_waterfriction     = 1.0f;
;25:float pm_flightfriction    = 3.0f;
;26:float pm_spectatorfriction = 5.0f;
;27:
;28:int   c_pmove = 0;
;29:
;30:#define NO_RESPAWN_OVERBOUNCE 250
;31:
;32:static int pm_respawntimer = 0;
;33:
;34:// Physics variables
;35:qboolean phy_initialized;
;36://  General
;37:float phy_stopspeed;
;38:// Acceleration
;39:float phy_fly_accel;
;40:// Friction
;41:float phy_friction;
;42:float phy_fly_friction;
;43:float phy_spectator_friction;
;44:
;45:// New variables
;46:float phy_crouch_scale;  // Default renamed
;47:// int   phy_movetype;             // pm->movetype; // Physics type selection
;48:// Ground
;49:float phy_ground_basespeed;  // Movement speed on the ground (aka maxspeed). Equivalent to the default g_speed
;50:float phy_ground_accel;      // Acceleration when on the ground. sv_accelerate
;51:// Air
;52:float phy_air_basespeed;  // Maxspeed on air when in VQ3, or when strafing diagonally in CPM
;53:float phy_air_accel;      // Acceleration when in VQ3, or when strafing diagonally in CPM
;54:// Air deceleration. To have different accel values for stopping down than for accelerating normally.
;55:float phy_air_decel;       // Factor to scale down air acceleration, when the current angle is over decelAngle
;56:float phy_air_decelAngle;  // Angle at which air deceleration will change
;57:// AirStrafe (aka AD turning)
;58:float phy_airstrafe_accel;      // Acceleration when strafing "quakeworld style" in CPM
;59:float phy_airstrafe_basespeed;  // Maxspeed on air when in VQ3, or when strafing diagonally in CPM
;60:// AirControl (aka W turning)
;61:qboolean phy_aircontrol;         // Turns aircontrol on or off
;62:float    phy_aircontrol_amount;  // Amount you can control yourself with W/S
;63:float    phy_aircontrol_power;   // Aircontrol formula exponent
;64:// Stepup
;65:int phy_step_size;    // Distance that will be moved up/down for step behavior. (default = STEPSIZE = 18)
;66:int phy_step_maxvel;  // When set, it limits the maximum vertical speed at which you can multi/double jump. Prevents stairs-climb crazyness
;67:// Jump
;68:int phy_jump_type;         // Jump type selection. Available VQ3, CPM
;69:int phy_jump_velocity;     // Vertical velocity that will be set/added when jumping (default = JUMP_VELOCITY = 270)
;70:int phy_jump_timebuffer;   // Amount of time(ms) since last jump, where CPM dj behavior can happen. (default CPM = 400)
;71:int phy_jump_dj_velocity;  // Amount of velocity to add to CPM dj behavior. (default CPM = 100)
;72:// Powerups
;73:// float phy_haste_factor;           // Multiplier to apply during haste powerup (q3 default = 1.3)
;74:// float phy_quad_factor;            // Multiplier to apply during quad powerup  (q3 default = 3)
;75:// Water
;76:float phy_water_accel;
;77:float phy_water_scale;  // phy_swimScale;
;78:// Slick
;79:float       phy_water_friction;
;80:float       phy_slick_accel;
;81:
;82:// Initialize Physics Values
;83:qboolean phy_initialized = qfalse;
;84:
;85:/*
;86:===============
;87:PM_AddEvent
;88:
;89:===============
;90:*/
;91:void PM_AddEvent(int newEvent) {
line 92
;92:	BG_AddPredictableEventToPlayerstate(newEvent, 0, pm->ps, -1);
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 pm
INDIRP4
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 93
;93:}
LABELV $41
endproc PM_AddEvent 0 16
export PM_AddTouchEnt
proc PM_AddTouchEnt 12 0
line 100
;94:
;95:/*
;96:===============
;97:PM_AddTouchEnt
;98:===============
;99:*/
;100:void PM_AddTouchEnt(int entityNum) {
line 103
;101:	int i;
;102:
;103:	if (entityNum == ENTITYNUM_WORLD) {
ADDRFP4 0
INDIRI4
CNSTI4 1022
NEI4 $43
line 104
;104:		return;
ADDRGP4 $42
JUMPV
LABELV $43
line 107
;105:	}
;106:
;107:	if (pm->numtouch >= MAXTOUCH) {
ADDRGP4 pm
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 32
LTI4 $45
line 108
;108:		return;
ADDRGP4 $42
JUMPV
LABELV $45
line 112
;109:	}
;110:
;111:	// see if it is already added
;112:	for (i = 0; i < pm->numtouch; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $50
JUMPV
LABELV $47
line 113
;113:		if (pm->touchents[i] == entityNum) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
CNSTI4 48
ADDP4
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $51
line 114
;114:			return;
ADDRGP4 $42
JUMPV
LABELV $51
line 116
;115:		}
;116:	}
LABELV $48
line 112
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $50
ADDRLP4 0
INDIRI4
ADDRGP4 pm
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LTI4 $47
line 119
;117:
;118:	// add it
;119:	pm->touchents[pm->numtouch] = entityNum;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 48
ADDP4
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 120
;120:	pm->numtouch++;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 121
;121:}
LABELV $42
endproc PM_AddTouchEnt 12 0
export PM_StartTorsoAnim
proc PM_StartTorsoAnim 4 0
line 128
;122:
;123:/*
;124:===================
;125:PM_StartTorsoAnim
;126:===================
;127:*/
;128:void PM_StartTorsoAnim(int anim) {
line 129
;129:	if (pm->ps->pm_type >= PM_DEAD) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $54
line 130
;130:		return;
ADDRGP4 $53
JUMPV
LABELV $54
line 132
;131:	}
;132:	pm->ps->torsoAnim = ((pm->ps->torsoAnim & ANIM_TOGGLEBIT) ^ ANIM_TOGGLEBIT) | anim;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 128
BXORI4
ADDRFP4 0
INDIRI4
BORI4
ASGNI4
line 133
;133:}
LABELV $53
endproc PM_StartTorsoAnim 4 0
export PM_StartLegsAnim
proc PM_StartLegsAnim 4 0
line 134
;134:void PM_StartLegsAnim(int anim) {
line 135
;135:	if (pm->ps->pm_type >= PM_DEAD) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $57
line 136
;136:		return;
ADDRGP4 $56
JUMPV
LABELV $57
line 138
;137:	}
;138:	if (pm->ps->legsTimer > 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $59
line 139
;139:		return;  // a high priority animation is running
ADDRGP4 $56
JUMPV
LABELV $59
line 141
;140:	}
;141:	pm->ps->legsAnim = ((pm->ps->legsAnim & ANIM_TOGGLEBIT) ^ ANIM_TOGGLEBIT) | anim;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 128
BXORI4
ADDRFP4 0
INDIRI4
BORI4
ASGNI4
line 142
;142:}
LABELV $56
endproc PM_StartLegsAnim 4 0
export PM_ContinueLegsAnim
proc PM_ContinueLegsAnim 0 4
line 144
;143:
;144:void PM_ContinueLegsAnim(int anim) {
line 145
;145:	if ((pm->ps->legsAnim & ~ANIM_TOGGLEBIT) == anim) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ADDRFP4 0
INDIRI4
NEI4 $62
line 146
;146:		return;
ADDRGP4 $61
JUMPV
LABELV $62
line 148
;147:	}
;148:	if (pm->ps->legsTimer > 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $64
line 149
;149:		return;  // a high priority animation is running
ADDRGP4 $61
JUMPV
LABELV $64
line 151
;150:	}
;151:	PM_StartLegsAnim(anim);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartLegsAnim
CALLV
pop
line 152
;152:}
LABELV $61
endproc PM_ContinueLegsAnim 0 4
export PM_ContinueTorsoAnim
proc PM_ContinueTorsoAnim 0 4
line 154
;153:
;154:void PM_ContinueTorsoAnim(int anim) {
line 155
;155:	if ((pm->ps->torsoAnim & ~ANIM_TOGGLEBIT) == anim) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ADDRFP4 0
INDIRI4
NEI4 $67
line 156
;156:		return;
ADDRGP4 $66
JUMPV
LABELV $67
line 158
;157:	}
;158:	if (pm->ps->torsoTimer > 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $69
line 159
;159:		return;  // a high priority animation is running
ADDRGP4 $66
JUMPV
LABELV $69
line 161
;160:	}
;161:	PM_StartTorsoAnim(anim);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 162
;162:}
LABELV $66
endproc PM_ContinueTorsoAnim 0 4
export PM_ForceLegsAnim
proc PM_ForceLegsAnim 0 4
line 164
;163:
;164:void PM_ForceLegsAnim(int anim) {
line 165
;165:	pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 166
;166:	PM_StartLegsAnim(anim);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_StartLegsAnim
CALLV
pop
line 167
;167:}
LABELV $71
endproc PM_ForceLegsAnim 0 4
export PM_ClipVelocity
proc PM_ClipVelocity 24 0
line 176
;168:
;169:/*
;170:==================
;171:PM_ClipVelocity
;172:
;173:Slide off of the impacting surface
;174:==================
;175:*/
;176:void PM_ClipVelocity(vec3_t in, vec3_t normal, vec3_t out, float overbounce) {
line 181
;177:	float backoff;
;178:	float change;
;179:	int   i;
;180:
;181:	backoff = DotProduct(in, normal);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 16
INDIRP4
INDIRF4
MULF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 183
;182:
;183:	if (backoff < 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $73
line 184
;184:		backoff *= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 185
;185:	} else {
ADDRGP4 $74
JUMPV
LABELV $73
line 186
;186:		backoff /= overbounce;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
ASGNF4
line 187
;187:	}
LABELV $74
line 189
;188:
;189:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $75
line 190
;190:		change = normal[i] * backoff;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ASGNF4
line 191
;191:		out[i] = in[i] - change;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
line 192
;192:	}
LABELV $76
line 189
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $75
line 193
;193:}
LABELV $72
endproc PM_ClipVelocity 24 0
export PM_Friction
proc PM_Friction 48 4
line 202
;194:
;195:/*
;196:==================
;197:PM_Friction
;198:
;199:Handles both ground friction and water friction
;200:==================
;201:*/
;202:void PM_Friction(void) {
line 208
;203:	vec3_t vec;
;204:	float* vel;
;205:	float  speed, newspeed, control;
;206:	float  drop;
;207:
;208:	vel = pm->ps->velocity;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
line 210
;209:
;210:	VectorCopy(vel, vec);
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 12
line 211
;211:	if (pml.walking) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $80
line 212
;212:		vec[2] = 0;  // ignore slope movement
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 213
;213:	}
LABELV $80
line 215
;214:
;215:	speed = VectorLength(vec);
ADDRLP4 16
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 216
;216:	if (speed < 1) {
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
GEF4 $84
line 217
;217:		vel[0] = 0;
ADDRLP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 218
;218:		vel[1] = 0;  // allow sinking underwater
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 220
;219:		// FIXME: still have z friction underwater?
;220:		if (pm->ps->pm_type == PM_SPECTATOR || pm->ps->powerups[PW_FLIGHT])
ADDRLP4 36
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $88
ADDRLP4 36
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $79
LABELV $88
line 221
;221:			vel[2] = 0.0f;  // no slow-sinking/raising movements
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 222
;222:		return;
ADDRGP4 $79
JUMPV
LABELV $84
line 225
;223:	}
;224:
;225:	drop = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 228
;226:
;227:	// apply ground friction
;228:	if (pm->waterlevel <= 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
GTI4 $89
line 229
;229:		if (pml.walking && !(pml.groundTrace.surfaceFlags & SURF_SLICK)) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $91
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $91
line 231
;230:			// if getting knocked back, no friction
;231:			if (!(pm->ps->pm_flags & PMF_TIME_KNOCKBACK)) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $96
line 232
;232:				control = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 8
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $99
ADDRLP4 36
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $100
JUMPV
LABELV $99
ADDRLP4 36
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $100
ADDRLP4 28
ADDRLP4 36
INDIRF4
ASGNF4
line 233
;233:				drop += control * pm_friction * pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
ADDRGP4 pm_friction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 234
;234:			}
LABELV $96
line 235
;235:		}
LABELV $91
line 236
;236:	}
LABELV $89
line 239
;237:
;238:	// apply water friction even if just wading
;239:	if (pm->waterlevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
EQI4 $102
line 240
;240:		drop += speed * pm_waterfriction * pm->waterlevel * pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_waterfriction
INDIRF4
MULF4
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 241
;241:	}
LABELV $102
line 244
;242:
;243:	// apply flying friction
;244:	if (pm->ps->powerups[PW_FLIGHT]) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $105
line 245
;245:		drop += speed * pm_flightfriction * pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_flightfriction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 246
;246:	}
LABELV $105
line 248
;247:
;248:	if (pm->ps->pm_type == PM_SPECTATOR) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $108
line 249
;249:		drop += speed * pm_spectatorfriction * pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 pm_spectatorfriction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 250
;250:	}
LABELV $108
line 253
;251:
;252:	// scale the velocity
;253:	newspeed = speed - drop;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 254
;254:	if (newspeed < 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $111
line 255
;255:		newspeed = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 256
;256:	}
LABELV $111
line 257
;257:	newspeed /= speed;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 259
;258:
;259:	vel[0] = vel[0] * newspeed;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 260
;260:	vel[1] = vel[1] * newspeed;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 261
;261:	vel[2] = vel[2] * newspeed;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 262
;262:}
LABELV $79
endproc PM_Friction 48 4
export PM_Accelerate
proc PM_Accelerate 32 0
line 271
;263:
;264:/*
;265:==============
;266:PM_Accelerate
;267:
;268:Handles user intended acceleration
;269:==============
;270:*/
;271:void PM_Accelerate(vec3_t wishdir, float wishspeed, float accel) {
line 277
;272:#if 1
;273:	// q2 style
;274:	int   i;
;275:	float addspeed, accelspeed, currentspeed;
;276:
;277:	currentspeed = DotProduct(pm->ps->velocity, wishdir);
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 278
;278:	addspeed     = wishspeed - currentspeed;
ADDRLP4 8
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 279
;279:	if (addspeed <= 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $114
line 280
;280:		return;
ADDRGP4 $113
JUMPV
LABELV $114
line 282
;281:	}
;282:	accelspeed = accel * pml.frametime * wishspeed;
ADDRLP4 4
ADDRFP4 8
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 283
;283:	if (accelspeed > addspeed) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $117
line 284
;284:		accelspeed = addspeed;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 285
;285:	}
LABELV $117
line 287
;286:
;287:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $119
line 288
;288:		pm->ps->velocity[i] += accelspeed * wishdir[i];
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 289
;289:	}
LABELV $120
line 287
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $119
line 308
;290:#else
;291:	// proper way (avoids strafe jump maxspeed bug), but feels bad
;292:	vec3_t wishVelocity;
;293:	vec3_t pushDir;
;294:	float  pushLen;
;295:	float  canPush;
;296:
;297:	VectorScale(wishdir, wishspeed, wishVelocity);
;298:	VectorSubtract(wishVelocity, pm->ps->velocity, pushDir);
;299:	pushLen = VectorNormalize(pushDir);
;300:
;301:	canPush = accel * pml.frametime * wishspeed;
;302:	if (canPush > pushLen) {
;303:		canPush = pushLen;
;304:	}
;305:
;306:	VectorMA(pm->ps->velocity, canPush, pushDir, pm->ps->velocity);
;307:#endif
;308:}
LABELV $113
endproc PM_Accelerate 32 0
export PM_CmdScale
proc PM_CmdScale 32 4
line 319
;309:
;310:/*
;311:============
;312:PM_CmdScale
;313:
;314:Returns the scale factor to apply to cmd movements
;315:This allows the clients to use axial -127 to 127 values for all directions
;316:without getting a sqrt(2) distortion in speed.
;317:============
;318:*/
;319:float PM_CmdScale(usercmd_t* cmd) {
line 324
;320:	int   max;
;321:	float total;
;322:	float scale;
;323:
;324:	max = abs(cmd->forwardmove);
ADDRFP4 0
INDIRP4
CNSTI4 21
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 325
;325:	if (abs(cmd->rightmove) > max) {
ADDRFP4 0
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 16
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $124
line 326
;326:		max = abs(cmd->rightmove);
ADDRFP4 0
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 327
;327:	}
LABELV $124
line 328
;328:	if (abs(cmd->upmove) > max) {
ADDRFP4 0
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $126
line 329
;329:		max = abs(cmd->upmove);
ADDRFP4 0
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 330
;330:	}
LABELV $126
line 331
;331:	if (!max) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $128
line 332
;332:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $123
JUMPV
LABELV $128
line 335
;333:	}
;334:
;335:	total = sqrt(cmd->forwardmove * cmd->forwardmove + cmd->rightmove * cmd->rightmove + cmd->upmove * cmd->upmove);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 21
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRP4
CNSTI4 21
ADDP4
INDIRI1
CVII4 1
MULI4
ADDRLP4 24
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
MULI4
ADDI4
ADDRLP4 24
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
ADDRLP4 24
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
MULI4
ADDI4
CVIF4 4
ARGF4
ADDRLP4 28
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
line 336
;336:	scale = (float)pm->ps->speed * max / (127.0 * total);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
CNSTF4 1123942400
MULF4
DIVF4
ASGNF4
line 338
;337:
;338:	return scale;
ADDRLP4 8
INDIRF4
RETF4
LABELV $123
endproc PM_CmdScale 32 4
export PM_SetMovementDir
proc PM_SetMovementDir 36 0
line 349
;339:}
;340:
;341:/*
;342:================
;343:PM_SetMovementDir
;344:
;345:Determine the rotation of the legs relative
;346:to the facing dir
;347:================
;348:*/
;349:void PM_SetMovementDir(void) {
line 350
;350:	if (pm->cmd.forwardmove || pm->cmd.rightmove) {
ADDRLP4 0
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $133
ADDRLP4 0
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $131
LABELV $133
line 351
;351:		if (pm->cmd.rightmove == 0 && pm->cmd.forwardmove > 0) {
ADDRLP4 4
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $134
ADDRLP4 4
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $134
line 352
;352:			pm->ps->movementDir = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 0
ASGNI4
line 353
;353:		} else if (pm->cmd.rightmove < 0 && pm->cmd.forwardmove > 0) {
ADDRGP4 $132
JUMPV
LABELV $134
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $136
ADDRLP4 8
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $136
line 354
;354:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 355
;355:		} else if (pm->cmd.rightmove < 0 && pm->cmd.forwardmove == 0) {
ADDRGP4 $132
JUMPV
LABELV $136
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $138
ADDRLP4 12
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $138
line 356
;356:			pm->ps->movementDir = 2;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 2
ASGNI4
line 357
;357:		} else if (pm->cmd.rightmove < 0 && pm->cmd.forwardmove < 0) {
ADDRGP4 $132
JUMPV
LABELV $138
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $140
ADDRLP4 16
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $140
line 358
;358:			pm->ps->movementDir = 3;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 3
ASGNI4
line 359
;359:		} else if (pm->cmd.rightmove == 0 && pm->cmd.forwardmove < 0) {
ADDRGP4 $132
JUMPV
LABELV $140
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $142
ADDRLP4 20
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $142
line 360
;360:			pm->ps->movementDir = 4;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 4
ASGNI4
line 361
;361:		} else if (pm->cmd.rightmove > 0 && pm->cmd.forwardmove < 0) {
ADDRGP4 $132
JUMPV
LABELV $142
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $144
ADDRLP4 24
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $144
line 362
;362:			pm->ps->movementDir = 5;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 5
ASGNI4
line 363
;363:		} else if (pm->cmd.rightmove > 0 && pm->cmd.forwardmove == 0) {
ADDRGP4 $132
JUMPV
LABELV $144
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $146
ADDRLP4 28
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $146
line 364
;364:			pm->ps->movementDir = 6;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 6
ASGNI4
line 365
;365:		} else if (pm->cmd.rightmove > 0 && pm->cmd.forwardmove > 0) {
ADDRGP4 $132
JUMPV
LABELV $146
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $132
ADDRLP4 32
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $132
line 366
;366:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 7
ASGNI4
line 367
;367:		}
line 368
;368:	} else {
ADDRGP4 $132
JUMPV
LABELV $131
line 372
;369:		// if they aren't actively going directly sideways,
;370:		// change the animation to the diagonal so they
;371:		// don't stop too crooked
;372:		if (pm->ps->movementDir == 2) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 2
NEI4 $150
line 373
;373:			pm->ps->movementDir = 1;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 1
ASGNI4
line 374
;374:		} else if (pm->ps->movementDir == 6) {
ADDRGP4 $151
JUMPV
LABELV $150
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 6
NEI4 $152
line 375
;375:			pm->ps->movementDir = 7;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 88
ADDP4
CNSTI4 7
ASGNI4
line 376
;376:		}
LABELV $152
LABELV $151
line 377
;377:	}
LABELV $132
line 378
;378:}
LABELV $130
endproc PM_SetMovementDir 36 0
export PM_CheckJump
proc PM_CheckJump 8 4
line 385
;379:
;380:/*
;381:=============
;382:PM_CheckJump
;383:=============
;384:*/
;385:qboolean PM_CheckJump(void) {
line 386
;386:	if (pm->ps->pm_flags & PMF_RESPAWNED) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $155
line 387
;387:		return qfalse;  // don't allow jump until all buttons are up
CNSTI4 0
RETI4
ADDRGP4 $154
JUMPV
LABELV $155
line 390
;388:	}
;389:
;390:	if (pm->cmd.upmove < 10) {
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $157
line 392
;391:		// not holding jump
;392:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $154
JUMPV
LABELV $157
line 396
;393:	}
;394:
;395:	// must wait for jump to be released
;396:	if (pm->ps->pm_flags & PMF_JUMP_HELD) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $159
line 398
;397:		// clear upmove so cmdscale doesn't lower running speed
;398:		pm->cmd.upmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 399
;399:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $154
JUMPV
LABELV $159
line 402
;400:	}
;401:
;402:	pml.groundPlane = qfalse;  // jumping away
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 403
;403:	pml.walking     = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 404
;404:	pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 406
;405:
;406:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 407
;407:	pm->ps->velocity[2]     = JUMP_VELOCITY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1132920832
ASGNF4
line 408
;408:	PM_AddEvent(EV_JUMP);
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 410
;409:
;410:	if (pm->cmd.forwardmove >= 0) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $163
line 411
;411:		PM_ForceLegsAnim(LEGS_JUMP);
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 412
;412:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 413
;413:	} else {
ADDRGP4 $164
JUMPV
LABELV $163
line 414
;414:		PM_ForceLegsAnim(LEGS_JUMPB);
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 415
;415:		pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 416
;416:	}
LABELV $164
line 418
;417:
;418:	return qtrue;
CNSTI4 1
RETI4
LABELV $154
endproc PM_CheckJump 8 4
export PM_CheckWaterJump
proc PM_CheckWaterJump 52 8
line 426
;419:}
;420:
;421:/*
;422:=============
;423:PM_CheckWaterJump
;424:=============
;425:*/
;426:qboolean PM_CheckWaterJump(void) {
line 431
;427:	vec3_t spot;
;428:	int    cont;
;429:	vec3_t flatforward;
;430:
;431:	if (pm->ps->pm_time) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $166
line 432
;432:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $165
JUMPV
LABELV $166
line 436
;433:	}
;434:
;435:	// check for water jump
;436:	if (pm->waterlevel != 2) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
EQI4 $168
line 437
;437:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $165
JUMPV
LABELV $168
line 440
;438:	}
;439:
;440:	flatforward[0] = pml.forward[0];
ADDRLP4 12
ADDRGP4 pml
INDIRF4
ASGNF4
line 441
;441:	flatforward[1] = pml.forward[1];
ADDRLP4 12+4
ADDRGP4 pml+4
INDIRF4
ASGNF4
line 442
;442:	flatforward[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 443
;443:	VectorNormalize(flatforward);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 445
;444:
;445:	VectorMA(pm->ps->origin, 30, flatforward, spot);
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1106247680
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
CNSTF4 1106247680
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 1106247680
MULF4
ADDF4
ASGNF4
line 446
;446:	spot[2] += 4;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1082130432
ADDF4
ASGNF4
line 447
;447:	cont = pm->pointcontents(spot, pm->ps->clientNum);
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 36
INDIRI4
ASGNI4
line 448
;448:	if (!(cont & CONTENTS_SOLID)) {
ADDRLP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $178
line 449
;449:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $165
JUMPV
LABELV $178
line 452
;450:	}
;451:
;452:	spot[2] += 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 453
;453:	cont = pm->pointcontents(spot, pm->ps->clientNum);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 454
;454:	if (cont & (CONTENTS_SOLID | CONTENTS_PLAYERCLIP | CONTENTS_BODY)) {
ADDRLP4 24
INDIRI4
CNSTI4 33619969
BANDI4
CNSTI4 0
EQI4 $181
line 455
;455:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $165
JUMPV
LABELV $181
line 459
;456:	}
;457:
;458:	// jump out of water
;459:	VectorScale(pml.forward, 200, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 pml
INDIRF4
CNSTF4 1128792064
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ADDRGP4 pml+4
INDIRF4
CNSTF4 1128792064
MULF4
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ADDRGP4 pml+8
INDIRF4
CNSTF4 1128792064
MULF4
ASGNF4
line 460
;460:	pm->ps->velocity[2] = 350;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1135542272
ASGNF4
line 462
;461:
;462:	pm->ps->pm_flags |= PMF_TIME_WATERJUMP;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 463
;463:	pm->ps->pm_time = 2000;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 2000
ASGNI4
line 465
;464:
;465:	return qtrue;
CNSTI4 1
RETI4
LABELV $165
endproc PM_CheckWaterJump 52 8
export PM_WaterJumpMove
proc PM_WaterJumpMove 12 4
line 477
;466:}
;467:
;468://============================================================================
;469:
;470:/*
;471:===================
;472:PM_WaterJumpMove
;473:
;474:Flying out of the water
;475:===================
;476:*/
;477:void PM_WaterJumpMove(void) {
line 480
;478:	// waterjump has no control, but falls
;479:
;480:	PM_StepSlideMove(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 482
;481:
;482:	pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 483
;483:	if (pm->ps->velocity[2] < 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
GEF4 $187
line 485
;484:		// cancel as soon as we are falling down again
;485:		pm->ps->pm_flags &= ~PMF_ALL_TIMES;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -353
BANDI4
ASGNI4
line 486
;486:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 487
;487:	}
LABELV $187
line 488
;488:}
LABELV $185
endproc PM_WaterJumpMove 12 4
export PM_WaterMove
proc PM_WaterMove 76 16
line 496
;489:
;490:/*
;491:===================
;492:PM_WaterMove
;493:
;494:===================
;495:*/
;496:void PM_WaterMove(void) {
line 504
;497:	int    i;
;498:	vec3_t wishvel;
;499:	float  wishspeed;
;500:	vec3_t wishdir;
;501:	float  scale;
;502:	float  vel;
;503:
;504:	if (PM_CheckWaterJump()) {
ADDRLP4 40
ADDRGP4 PM_CheckWaterJump
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $190
line 505
;505:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 506
;506:		return;
ADDRGP4 $189
JUMPV
LABELV $190
line 522
;507:	}
;508:#if 0
;509:	// jump = head for surface
;510:	if ( pm->cmd.upmove >= 10 ) {
;511:		if (pm->ps->velocity[2] > -300) {
;512:			if ( pm->watertype & CONTENTS_WATER ) {
;513:				pm->ps->velocity[2] = 100;
;514:			} else if ( pm->watertype & CONTENTS_SLIME ) {
;515:				pm->ps->velocity[2] = 80;
;516:			} else {
;517:				pm->ps->velocity[2] = 50;
;518:			}
;519:		}
;520:	}
;521:#endif
;522:	PM_Friction();
ADDRGP4 PM_Friction
CALLV
pop
line 524
;523:
;524:	scale = PM_CmdScale(&pm->cmd);
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 44
INDIRF4
ASGNF4
line 528
;525:	//
;526:	// user intentions
;527:	//
;528:	if (!scale) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $192
line 529
;529:		wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 530
;530:		wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 531
;531:		wishvel[2] = -60;  // sink towards bottom
ADDRLP4 8+8
CNSTF4 3262119936
ASGNF4
line 532
;532:	} else {
ADDRGP4 $193
JUMPV
LABELV $192
line 533
;533:		for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $196
line 534
;534:			wishvel[i] = scale * pml.forward[i] * pm->cmd.forwardmove + scale * pml.right[i] * pm->cmd.rightmove;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 56
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
LABELV $197
line 533
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $196
line 536
;535:
;536:		wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 537
;537:	}
LABELV $193
line 539
;538:
;539:	VectorCopy(wishvel, wishdir);
ADDRLP4 24
ADDRLP4 8
INDIRB
ASGNB 12
line 540
;540:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 48
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 542
;541:
;542:	if (wishspeed > pm->ps->speed * pm_swimScale) {
ADDRLP4 20
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_swimScale
INDIRF4
MULF4
LEF4 $202
line 543
;543:		wishspeed = pm->ps->speed * pm_swimScale;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_swimScale
INDIRF4
MULF4
ASGNF4
line 544
;544:	}
LABELV $202
line 546
;545:
;546:	PM_Accelerate(wishdir, wishspeed, pm_wateraccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 20
INDIRF4
ARGF4
ADDRGP4 pm_wateraccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 549
;547:
;548:	// make sure we can go up slopes easily under water
;549:	if (pml.groundPlane && DotProduct(pm->ps->velocity, pml.groundTrace.plane.normal) < 0) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $204
ADDRLP4 52
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRLP4 52
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 52
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $204
line 550
;550:		vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 56
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 56
INDIRF4
ASGNF4
line 552
;551:		// slide along the ground plane
;552:		PM_ClipVelocity(pm->ps->velocity, pml.groundTrace.plane.normal, pm->ps->velocity, OVERCLIP);
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 554
;553:
;554:		VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 555
;555:		VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 64
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ASGNF4
line 556
;556:	}
LABELV $204
line 558
;557:
;558:	PM_SlideMove(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 559
;559:}
LABELV $189
endproc PM_WaterMove 76 16
export PM_FlyMove
proc PM_FlyMove 52 12
line 584
;560:
;561:#ifdef MISSIONPACK
;562:/*
;563:===================
;564:PM_InvulnerabilityMove
;565:
;566:Only with the invulnerability powerup
;567:===================
;568:*/
;569:static void PM_InvulnerabilityMove(void) {
;570:	pm->cmd.forwardmove = 0;
;571:	pm->cmd.rightmove   = 0;
;572:	pm->cmd.upmove      = 0;
;573:	VectorClear(pm->ps->velocity);
;574:}
;575:#endif
;576:
;577:/*
;578:===================
;579:PM_FlyMove
;580:
;581:Only with the flight powerup
;582:===================
;583:*/
;584:void PM_FlyMove(void) {
line 592
;585:	int    i;
;586:	vec3_t wishvel;
;587:	float  wishspeed;
;588:	vec3_t wishdir;
;589:	float  scale;
;590:
;591:	// normal slowdown
;592:	PM_Friction();
ADDRGP4 PM_Friction
CALLV
pop
line 594
;593:
;594:	scale = PM_CmdScale(&pm->cmd);
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
ASGNF4
line 598
;595:	//
;596:	// user intentions
;597:	//
;598:	if (!scale) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $218
line 599
;599:		wishvel[0] = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 600
;600:		wishvel[1] = 0;
ADDRLP4 8+4
CNSTF4 0
ASGNF4
line 601
;601:		wishvel[2] = 0;
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 602
;602:	} else {
ADDRGP4 $219
JUMPV
LABELV $218
line 603
;603:		for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $222
line 604
;604:			wishvel[i] = scale * pml.forward[i] * pm->cmd.forwardmove + scale * pml.right[i] * pm->cmd.rightmove;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 605
;605:		}
LABELV $223
line 603
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $222
line 607
;606:
;607:		wishvel[2] += scale * pm->cmd.upmove;
ADDRLP4 8+8
ADDRLP4 8+8
INDIRF4
ADDRLP4 4
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CVIF4 4
MULF4
ADDF4
ASGNF4
line 608
;608:	}
LABELV $219
line 610
;609:
;610:	VectorCopy(wishvel, wishdir);
ADDRLP4 20
ADDRLP4 8
INDIRB
ASGNB 12
line 611
;611:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 20
ARGP4
ADDRLP4 40
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 40
INDIRF4
ASGNF4
line 613
;612:
;613:	PM_Accelerate(wishdir, wishspeed, pm_flyaccelerate);
ADDRLP4 20
ARGP4
ADDRLP4 32
INDIRF4
ARGF4
ADDRGP4 pm_flyaccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 615
;614:
;615:	PM_StepSlideMove(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 616
;616:}
LABELV $217
endproc PM_FlyMove 52 12
export PM_AirMove
proc PM_AirMove 80 16
line 624
;617:
;618:/*
;619:===================
;620:PM_AirMove
;621:
;622:===================
;623:*/
;624:void PM_AirMove(void) {
line 633
;625:	int       i;
;626:	vec3_t    wishvel;
;627:	float     fmove, smove;
;628:	vec3_t    wishdir;
;629:	float     wishspeed;
;630:	float     scale;
;631:	usercmd_t cmd;
;632:
;633:	PM_Friction();
ADDRGP4 PM_Friction
CALLV
pop
line 635
;634:
;635:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 636
;636:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 638
;637:
;638:	cmd   = pm->cmd;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 24
line 639
;639:	scale = PM_CmdScale(&cmd);
ADDRLP4 44
ARGP4
ADDRLP4 68
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 68
INDIRF4
ASGNF4
line 642
;640:
;641:	// set the movementDir so clients can rotate the legs for strafing
;642:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 645
;643:
;644:	// project moves down to flat plane
;645:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 646
;646:	pml.right[2]   = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 647
;647:	VectorNormalize(pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 648
;648:	VectorNormalize(pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 650
;649:
;650:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $233
line 651
;651:		wishvel[i] = pml.forward[i] * fmove + pml.right[i] * smove;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 652
;652:	}
LABELV $234
line 650
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $233
line 653
;653:	wishvel[2] = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 655
;654:
;655:	VectorCopy(wishvel, wishdir);
ADDRLP4 24
ADDRLP4 4
INDIRB
ASGNB 12
line 656
;656:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 24
ARGP4
ADDRLP4 72
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 36
ADDRLP4 72
INDIRF4
ASGNF4
line 657
;657:	wishspeed *= scale;
ADDRLP4 36
ADDRLP4 36
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 660
;658:
;659:	// not on ground, so little effect on velocity
;660:	PM_Accelerate(wishdir, wishspeed, pm_airaccelerate);
ADDRLP4 24
ARGP4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 pm_airaccelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 665
;661:
;662:	// we may have a ground plane that is very steep, even
;663:	// though we don't have a groundentity
;664:	// slide along the steep plane
;665:	if (pml.groundPlane) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $239
line 666
;666:		PM_ClipVelocity(pm->ps->velocity, pml.groundTrace.plane.normal, pm->ps->velocity, OVERCLIP);
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 667
;667:	}
LABELV $239
line 679
;668:
;669:#if 0
;670:	//ZOID:  If we are on the grapple, try stair-stepping
;671:	//this allows a player to use the grapple to pull himself
;672:	//over a ledge
;673:	if (pm->ps->pm_flags & PMF_GRAPPLE_PULL)
;674:		PM_StepSlideMove ( qtrue );
;675:	else
;676:		PM_SlideMove ( qtrue );
;677:#endif
;678:
;679:	PM_StepSlideMove(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 680
;680:}
LABELV $228
endproc PM_AirMove 80 16
export PM_GrappleMove
proc PM_GrappleMove 44 4
line 688
;681:
;682:/*
;683:===================
;684:PM_GrappleMove
;685:
;686:===================
;687:*/
;688:void PM_GrappleMove(void) {
line 692
;689:	vec3_t vel, v;
;690:	float  vlen;
;691:
;692:	VectorScale(pml.forward, -16, v);
ADDRLP4 12
ADDRGP4 pml
INDIRF4
CNSTF4 3246391296
MULF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 pml+4
INDIRF4
CNSTF4 3246391296
MULF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 pml+8
INDIRF4
CNSTF4 3246391296
MULF4
ASGNF4
line 693
;693:	VectorAdd(pm->ps->grapplePoint, v, v);
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDF4
ASGNF4
line 694
;694:	VectorSubtract(v, pm->ps->origin, vel);
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+8
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 695
;695:	vlen = VectorLength(vel);
ADDRLP4 0
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 36
INDIRF4
ASGNF4
line 696
;696:	VectorNormalize(vel);
ADDRLP4 0
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 698
;697:
;698:	if (vlen <= 100)
ADDRLP4 24
INDIRF4
CNSTF4 1120403456
GTF4 $257
line 699
;699:		VectorScale(vel, 10 * vlen, vel);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1092616192
MULF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1092616192
MULF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1092616192
MULF4
MULF4
ASGNF4
ADDRGP4 $258
JUMPV
LABELV $257
line 701
;700:	else
;701:		VectorScale(vel, 800, vel);
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
LABELV $258
line 703
;702:
;703:	VectorCopy(vel, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 705
;704:
;705:	pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 706
;706:}
LABELV $244
endproc PM_GrappleMove 44 4
export PM_WalkMove
proc PM_WalkMove 112 16
line 714
;707:
;708:/*
;709:===================
;710:PM_WalkMove
;711:
;712:===================
;713:*/
;714:void PM_WalkMove(void) {
line 725
;715:	int       i;
;716:	vec3_t    wishvel;
;717:	float     fmove, smove;
;718:	vec3_t    wishdir;
;719:	float     wishspeed;
;720:	float     scale;
;721:	usercmd_t cmd;
;722:	float     accelerate;
;723:	float     vel;
;724:
;725:	if (pm->waterlevel > 2 && DotProduct(pml.forward, pml.groundTrace.plane.normal) > 0) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LEI4 $269
ADDRGP4 pml
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRGP4 pml+4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRGP4 pml+8
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
LEF4 $269
line 727
;726:		// begin swimming
;727:		PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 728
;728:		return;
ADDRGP4 $268
JUMPV
LABELV $269
line 731
;729:	}
;730:
;731:	if (PM_CheckJump()) {
ADDRLP4 76
ADDRGP4 PM_CheckJump
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $281
line 733
;732:		// jumped away
;733:		if (pm->waterlevel > 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
LEI4 $283
line 734
;734:			PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 735
;735:		} else {
ADDRGP4 $268
JUMPV
LABELV $283
line 736
;736:			PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 737
;737:		}
line 738
;738:		return;
ADDRGP4 $268
JUMPV
LABELV $281
line 741
;739:	}
;740:
;741:	PM_Friction();
ADDRGP4 PM_Friction
CALLV
pop
line 743
;742:
;743:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 744
;744:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 746
;745:
;746:	cmd   = pm->cmd;
ADDRLP4 44
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 24
line 747
;747:	scale = PM_CmdScale(&cmd);
ADDRLP4 44
ARGP4
ADDRLP4 80
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 80
INDIRF4
ASGNF4
line 750
;748:
;749:	// set the movementDir so clients can rotate the legs for strafing
;750:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 753
;751:
;752:	// project moves down to flat plane
;753:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 754
;754:	pml.right[2]   = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 757
;755:
;756:	// project the forward and right directions onto the ground plane
;757:	PM_ClipVelocity(pml.forward, pml.groundTrace.plane.normal, pml.forward, OVERCLIP);
ADDRLP4 84
ADDRGP4 pml
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 758
;758:	PM_ClipVelocity(pml.right, pml.groundTrace.plane.normal, pml.right, OVERCLIP);
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRGP4 pml+12
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 760
;759:	//
;760:	VectorNormalize(pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 761
;761:	VectorNormalize(pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 763
;762:
;763:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $295
line 764
;764:		wishvel[i] = pml.forward[i] * fmove + pml.right[i] * smove;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 765
;765:	}
LABELV $296
line 763
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $295
line 769
;766:	// when going up or down slopes the wish velocity should Not be zero
;767:	//	wishvel[2] = 0;
;768:
;769:	VectorCopy(wishvel, wishdir);
ADDRLP4 28
ADDRLP4 4
INDIRB
ASGNB 12
line 770
;770:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 28
ARGP4
ADDRLP4 88
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 88
INDIRF4
ASGNF4
line 771
;771:	wishspeed *= scale;
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ASGNF4
line 774
;772:
;773:	// clamp the speed lower if ducking
;774:	if (pm->ps->pm_flags & PMF_DUCKED) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $300
line 775
;775:		if (wishspeed > pm->ps->speed * pm_duckScale) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
LEF4 $302
line 776
;776:			wishspeed = pm->ps->speed * pm_duckScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pm_duckScale
INDIRF4
MULF4
ASGNF4
line 777
;777:		}
LABELV $302
line 778
;778:	}
LABELV $300
line 781
;779:
;780:	// clamp the speed lower if wading or walking on the bottom
;781:	if (pm->waterlevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
EQI4 $304
line 784
;782:		float waterScale;
;783:
;784:		waterScale = pm->waterlevel / 3.0;
ADDRLP4 92
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1051372203
MULF4
ASGNF4
line 785
;785:		waterScale = 1.0 - (1.0 - pm_swimScale) * waterScale;
ADDRLP4 92
CNSTF4 1065353216
CNSTF4 1065353216
ADDRGP4 pm_swimScale
INDIRF4
SUBF4
ADDRLP4 92
INDIRF4
MULF4
SUBF4
ASGNF4
line 786
;786:		if (wishspeed > pm->ps->speed * waterScale) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
MULF4
LEF4 $306
line 787
;787:			wishspeed = pm->ps->speed * waterScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
line 788
;788:		}
LABELV $306
line 789
;789:	}
LABELV $304
line 793
;790:
;791:	// when a player gets hit, they temporarily lose
;792:	// full control, which allows them to be moved a bit
;793:	if ((pml.groundTrace.surfaceFlags & SURF_SLICK) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $312
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $308
LABELV $312
line 794
;794:		accelerate = pm_airaccelerate;
ADDRLP4 68
ADDRGP4 pm_airaccelerate
INDIRF4
ASGNF4
line 795
;795:	} else {
ADDRGP4 $309
JUMPV
LABELV $308
line 796
;796:		accelerate = pm_accelerate;
ADDRLP4 68
ADDRGP4 pm_accelerate
INDIRF4
ASGNF4
line 797
;797:	}
LABELV $309
line 799
;798:
;799:	PM_Accelerate(wishdir, wishspeed, accelerate);
ADDRLP4 28
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 804
;800:
;801:	// Com_Printf("velocity = %1.1f %1.1f %1.1f\n", pm->ps->velocity[0], pm->ps->velocity[1], pm->ps->velocity[2]);
;802:	// Com_Printf("velocity1 = %1.1f\n", VectorLength(pm->ps->velocity));
;803:
;804:	if ((pml.groundTrace.surfaceFlags & SURF_SLICK) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $317
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $313
LABELV $317
line 805
;805:		pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 806
;806:	} else {
LABELV $313
line 809
;807:		// don't reset the z velocity for slopes
;808:		//		pm->ps->velocity[2] = 0;
;809:	}
LABELV $314
line 811
;810:
;811:	if (pm_respawntimer) {  // no more overbounce at respawn
ADDRGP4 pm_respawntimer
INDIRI4
CNSTI4 0
EQI4 $319
line 813
;812:		// slide along the ground plane
;813:		PM_ClipVelocity(pm->ps->velocity, pml.groundTrace.plane.normal, pm->ps->velocity, OVERCLIP);
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 92
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 814
;814:	} else {
ADDRGP4 $320
JUMPV
LABELV $319
line 815
;815:		vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 72
ADDRLP4 92
INDIRF4
ASGNF4
line 818
;816:
;817:		// slide along the ground plane
;818:		PM_ClipVelocity(pm->ps->velocity, pml.groundTrace.plane.normal, pm->ps->velocity, OVERCLIP);
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 821
;819:
;820:		// don't decrease velocity when going up or down a slope
;821:		VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 822
;822:		VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 100
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 100
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 72
INDIRF4
MULF4
ASGNF4
ADDRLP4 104
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 104
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 72
INDIRF4
MULF4
ASGNF4
ADDRLP4 108
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 108
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 72
INDIRF4
MULF4
ASGNF4
line 823
;823:	}
LABELV $320
line 826
;824:
;825:	// don't do anything if standing still
;826:	if (!pm->ps->velocity[0] && !pm->ps->velocity[1]) {
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
NEF4 $325
ADDRLP4 92
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
NEF4 $325
line 827
;827:		return;
ADDRGP4 $268
JUMPV
LABELV $325
line 830
;828:	}
;829:
;830:	PM_StepSlideMove(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 PM_StepSlideMove
CALLV
pop
line 833
;831:
;832:	// Com_Printf("velocity2 = %1.1f\n", VectorLength(pm->ps->velocity));
;833:}
LABELV $268
endproc PM_WalkMove 112 16
export PM_DeadMove
proc PM_DeadMove 20 4
line 840
;834:
;835:/*
;836:==============
;837:PM_DeadMove
;838:==============
;839:*/
;840:void PM_DeadMove(void) {
line 843
;841:	float forward;
;842:
;843:	if (!pml.walking) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
NEI4 $328
line 844
;844:		return;
ADDRGP4 $327
JUMPV
LABELV $328
line 849
;845:	}
;846:
;847:	// extra friction
;848:
;849:	forward = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 850
;850:	forward -= 20;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 851
;851:	if (forward <= 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GTF4 $331
line 852
;852:		VectorClear(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 853
;853:	} else {
ADDRGP4 $332
JUMPV
LABELV $331
line 854
;854:		VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 855
;855:		VectorScale(pm->ps->velocity, forward, pm->ps->velocity);
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 856
;856:	}
LABELV $332
line 857
;857:}
LABELV $327
endproc PM_DeadMove 20 4
export PM_NoclipMove
proc PM_NoclipMove 92 12
line 864
;858:
;859:/*
;860:===============
;861:PM_NoclipMove
;862:===============
;863:*/
;864:void PM_NoclipMove(void) {
line 873
;865:	float  speed, drop, friction, control, newspeed;
;866:	int    i;
;867:	vec3_t wishvel;
;868:	float  fmove, smove;
;869:	vec3_t wishdir;
;870:	float  wishspeed;
;871:	float  scale;
;872:
;873:	pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 26
ASGNI4
line 877
;874:
;875:	// friction
;876:
;877:	speed = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 64
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 64
INDIRF4
ASGNF4
line 878
;878:	if (speed < 1) {
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
GEF4 $334
line 879
;879:		VectorCopy(vec3_origin, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 880
;880:	} else {
ADDRGP4 $335
JUMPV
LABELV $334
line 881
;881:		drop = 0;
ADDRLP4 52
CNSTF4 0
ASGNF4
line 883
;882:
;883:		friction = pm_friction * 1.5;  // extra friction
ADDRLP4 56
ADDRGP4 pm_friction
INDIRF4
CNSTF4 1069547520
MULF4
ASGNF4
line 884
;884:		control  = speed < pm_stopspeed ? pm_stopspeed : speed;
ADDRLP4 24
INDIRF4
ADDRGP4 pm_stopspeed
INDIRF4
GEF4 $337
ADDRLP4 68
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $338
JUMPV
LABELV $337
ADDRLP4 68
ADDRLP4 24
INDIRF4
ASGNF4
LABELV $338
ADDRLP4 60
ADDRLP4 68
INDIRF4
ASGNF4
line 885
;885:		drop += control * friction * pml.frametime;
ADDRLP4 52
ADDRLP4 52
INDIRF4
ADDRLP4 60
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 888
;886:
;887:		// scale the velocity
;888:		newspeed = speed - drop;
ADDRLP4 28
ADDRLP4 24
INDIRF4
ADDRLP4 52
INDIRF4
SUBF4
ASGNF4
line 889
;889:		if (newspeed < 0)
ADDRLP4 28
INDIRF4
CNSTF4 0
GEF4 $340
line 890
;890:			newspeed = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
LABELV $340
line 891
;891:		newspeed /= speed;
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
DIVF4
ASGNF4
line 893
;892:
;893:		VectorScale(pm->ps->velocity, newspeed, pm->ps->velocity);
ADDRLP4 72
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 894
;894:	}
LABELV $335
line 897
;895:
;896:	// accelerate
;897:	scale = PM_CmdScale(&pm->cmd);
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 68
ADDRGP4 PM_CmdScale
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 68
INDIRF4
ASGNF4
line 899
;898:
;899:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 900
;900:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 902
;901:
;902:	for (i = 0; i < 3; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $342
line 903
;903:		wishvel[i] = pml.forward[i] * fmove + pml.right[i] * smove;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $343
line 902
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $342
line 904
;904:	wishvel[2] += pm->cmd.upmove;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ADDF4
ASGNF4
line 906
;905:
;906:	VectorCopy(wishvel, wishdir);
ADDRLP4 32
ADDRLP4 4
INDIRB
ASGNB 12
line 907
;907:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 32
ARGP4
ADDRLP4 76
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 76
INDIRF4
ASGNF4
line 908
;908:	wishspeed *= scale;
ADDRLP4 44
ADDRLP4 44
INDIRF4
ADDRLP4 48
INDIRF4
MULF4
ASGNF4
line 910
;909:
;910:	PM_Accelerate(wishdir, wishspeed, pm_accelerate);
ADDRLP4 32
ARGP4
ADDRLP4 44
INDIRF4
ARGF4
ADDRGP4 pm_accelerate
INDIRF4
ARGF4
ADDRGP4 PM_Accelerate
CALLV
pop
line 913
;911:
;912:	// move
;913:	VectorMA(pm->ps->origin, pml.frametime, pm->ps->velocity, pm->ps->origin);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 80
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 84
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 88
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 88
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 88
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 914
;914:}
LABELV $333
endproc PM_NoclipMove 92 12
export PM_FootstepForSurface
proc PM_FootstepForSurface 0 0
line 925
;915:
;916://============================================================================
;917:
;918:/*
;919:================
;920:PM_FootstepForSurface
;921:
;922:Returns an event number apropriate for the groundsurface
;923:================
;924:*/
;925:int PM_FootstepForSurface(void) {
line 926
;926:	if (pml.groundTrace.surfaceFlags & SURF_NOSTEPS) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $352
line 927
;927:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $351
JUMPV
LABELV $352
line 929
;928:	}
;929:	if (pml.groundTrace.surfaceFlags & SURF_METALSTEPS) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $356
line 930
;930:		return EV_FOOTSTEP_METAL;
CNSTI4 2
RETI4
ADDRGP4 $351
JUMPV
LABELV $356
line 932
;931:	}
;932:	return EV_FOOTSTEP;
CNSTI4 1
RETI4
LABELV $351
endproc PM_FootstepForSurface 0 0
export PM_CrashLand
proc PM_CrashLand 52 4
line 942
;933:}
;934:
;935:/*
;936:=================
;937:PM_CrashLand
;938:
;939:Check for hard landings that generate sound events
;940:=================
;941:*/
;942:void PM_CrashLand(void) {
line 950
;943:	float delta;
;944:	float dist;
;945:	float vel, acc;
;946:	float t;
;947:	float a, b, c, den;
;948:
;949:	// decide which landing animation to use
;950:	if (pm->ps->pm_flags & PMF_BACKWARDS_JUMP) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $361
line 951
;951:		PM_ForceLegsAnim(LEGS_LANDB);
CNSTI4 21
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 952
;952:	} else {
ADDRGP4 $362
JUMPV
LABELV $361
line 953
;953:		PM_ForceLegsAnim(LEGS_LAND);
CNSTI4 19
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 954
;954:	}
LABELV $362
line 956
;955:
;956:	pm->ps->legsTimer = TIMER_LAND;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 130
ASGNI4
line 959
;957:
;958:	// calculate the exact velocity on landing
;959:	dist = pm->ps->origin[2] - pml.previous_origin[2];
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 pml+112+8
INDIRF4
SUBF4
ASGNF4
line 960
;960:	vel  = pml.previous_velocity[2];
ADDRLP4 8
ADDRGP4 pml+124+8
INDIRF4
ASGNF4
line 961
;961:	acc  = -pm->ps->gravity;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 963
;962:
;963:	a = acc / 2;
ADDRLP4 16
ADDRLP4 12
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 964
;964:	b = vel;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 965
;965:	c = -dist;
ADDRLP4 32
ADDRLP4 24
INDIRF4
NEGF4
ASGNF4
line 967
;966:
;967:	den = b * b - 4 * a * c;
ADDRLP4 20
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 16
INDIRF4
CNSTF4 1082130432
MULF4
ADDRLP4 32
INDIRF4
MULF4
SUBF4
ASGNF4
line 968
;968:	if (den < 0) {
ADDRLP4 20
INDIRF4
CNSTF4 0
GEF4 $367
line 969
;969:		return;
ADDRGP4 $360
JUMPV
LABELV $367
line 971
;970:	}
;971:	t = (-b - sqrt(den)) / (2 * a);
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 40
INDIRF4
SUBF4
ADDRLP4 16
INDIRF4
CNSTF4 1073741824
MULF4
DIVF4
ASGNF4
line 973
;972:
;973:	delta = vel + t * acc;
ADDRLP4 0
ADDRLP4 8
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 974
;974:	delta = delta * delta * 0.0001;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 953267991
MULF4
ASGNF4
line 977
;975:
;976:	// ducking while falling doubles damage
;977:	if (pm->ps->pm_flags & PMF_DUCKED) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $369
line 978
;978:		delta *= 2;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
MULF4
ASGNF4
line 979
;979:	}
LABELV $369
line 982
;980:
;981:	// never take falling damage if completely underwater
;982:	if (pm->waterlevel == 3) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 3
NEI4 $371
line 983
;983:		return;
ADDRGP4 $360
JUMPV
LABELV $371
line 987
;984:	}
;985:
;986:	// reduce falling damage if there is standing water
;987:	if (pm->waterlevel == 2) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
NEI4 $373
line 988
;988:		delta *= 0.25;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1048576000
MULF4
ASGNF4
line 989
;989:	}
LABELV $373
line 990
;990:	if (pm->waterlevel == 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
NEI4 $375
line 991
;991:		delta *= 0.5;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 992
;992:	}
LABELV $375
line 994
;993:
;994:	if (delta < 1) {
ADDRLP4 0
INDIRF4
CNSTF4 1065353216
GEF4 $377
line 995
;995:		return;
ADDRGP4 $360
JUMPV
LABELV $377
line 1002
;996:	}
;997:
;998:	// create a local entity event to play the sound
;999:
;1000:	// SURF_NODAMAGE is used for bounce pads where you don't ever
;1001:	// want to take damage or play a crunch sound
;1002:	if (!(pml.groundTrace.surfaceFlags & SURF_NODAMAGE)) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $379
line 1003
;1003:		if (delta > 60) {
ADDRLP4 0
INDIRF4
CNSTF4 1114636288
LEF4 $383
line 1004
;1004:			PM_AddEvent(EV_FALL_FAR);
CNSTI4 12
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1005
;1005:		} else if (delta > 40) {
ADDRGP4 $384
JUMPV
LABELV $383
ADDRLP4 0
INDIRF4
CNSTF4 1109393408
LEF4 $385
line 1007
;1006:			// this is a pain grunt, so don't play it if dead
;1007:			if (pm->ps->stats[STAT_HEALTH] > 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $386
line 1008
;1008:				PM_AddEvent(EV_FALL_MEDIUM);
CNSTI4 11
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1009
;1009:			}
line 1010
;1010:		} else if (delta > 7) {
ADDRGP4 $386
JUMPV
LABELV $385
ADDRLP4 0
INDIRF4
CNSTF4 1088421888
LEF4 $389
line 1011
;1011:			PM_AddEvent(EV_FALL_SHORT);
CNSTI4 10
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1012
;1012:		} else {
ADDRGP4 $390
JUMPV
LABELV $389
line 1013
;1013:			PM_AddEvent(PM_FootstepForSurface());
ADDRLP4 48
ADDRGP4 PM_FootstepForSurface
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1014
;1014:		}
LABELV $390
LABELV $386
LABELV $384
line 1015
;1015:	}
LABELV $379
line 1018
;1016:
;1017:	// start footstep cycle over
;1018:	pm->ps->bobCycle = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1019
;1019:}
LABELV $360
endproc PM_CrashLand 52 4
export PM_CorrectAllSolid
proc PM_CorrectAllSolid 36 28
line 1042
;1020:
;1021:/*
;1022:=============
;1023:PM_CheckStuck
;1024:=============
;1025:*/
;1026:/*
;1027:void PM_CheckStuck(void) {
;1028:    trace_t trace;
;1029:
;1030:    pm->trace (&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask);
;1031:    if (trace.allsolid) {
;1032:        //int shit = qtrue;
;1033:    }
;1034:}
;1035:*/
;1036:
;1037:/*
;1038:=============
;1039:PM_CorrectAllSolid
;1040:=============
;1041:*/
;1042:int PM_CorrectAllSolid(trace_t* trace) {
line 1046
;1043:	int    i, j, k;
;1044:	vec3_t point;
;1045:
;1046:	if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $392
line 1047
;1047:		Com_Printf("%i:allsolid\n", c_pmove);
ADDRGP4 $394
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1048
;1048:	}
LABELV $392
line 1051
;1049:
;1050:	// jitter around
;1051:	for (i = -1; i <= 1; i++) {
ADDRLP4 20
CNSTI4 -1
ASGNI4
LABELV $395
line 1052
;1052:		for (j = -1; j <= 1; j++) {
ADDRLP4 16
CNSTI4 -1
ASGNI4
LABELV $399
line 1053
;1053:			for (k = -1; k <= 1; k++) {
ADDRLP4 12
CNSTI4 -1
ASGNI4
LABELV $403
line 1054
;1054:				VectorCopy(pm->ps->origin, point);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1055
;1055:				point[0] += (float)i;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1056
;1056:				point[1] += (float)j;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1057
;1057:				point[2] += (float)k;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1058
;1058:				pm->trace(trace, point, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 1059
;1059:				if (!trace->allsolid) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $409
line 1060
;1060:					point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1061
;1061:					point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1062
;1062:					point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 1064
;1063:
;1064:					pm->trace(trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
ADDRLP4 28
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 1065
;1065:					pml.groundTrace = *trace;
ADDRGP4 pml+52
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 56
line 1066
;1066:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $391
JUMPV
LABELV $409
line 1068
;1067:				}
;1068:			}
LABELV $404
line 1053
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LEI4 $403
line 1069
;1069:		}
LABELV $400
line 1052
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LEI4 $399
line 1070
;1070:	}
LABELV $396
line 1051
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 1
LEI4 $395
line 1072
;1071:
;1072:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1073
;1073:	pml.groundPlane         = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1074
;1074:	pml.walking             = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1076
;1075:
;1076:	return qfalse;
CNSTI4 0
RETI4
LABELV $391
endproc PM_CorrectAllSolid 36 28
export PM_GroundTraceMissed
proc PM_GroundTraceMissed 80 28
line 1086
;1077:}
;1078:
;1079:/*
;1080:=============
;1081:PM_GroundTraceMissed
;1082:
;1083:The ground trace didn't hit a surface, so we are in freefall
;1084:=============
;1085:*/
;1086:void PM_GroundTraceMissed(void) {
line 1090
;1087:	trace_t trace;
;1088:	vec3_t  point;
;1089:
;1090:	if (pm->ps->groundEntityNum != ENTITYNUM_NONE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $417
line 1092
;1091:		// we just transitioned into freefall
;1092:		if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $419
line 1093
;1093:			Com_Printf("%i:lift\n", c_pmove);
ADDRGP4 $421
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1094
;1094:		}
LABELV $419
line 1098
;1095:
;1096:		// if they aren't in a jumping animation and the ground is a ways away, force into it
;1097:		// if we didn't do the trace, the player would be backflipping down staircases
;1098:		VectorCopy(pm->ps->origin, point);
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1099
;1099:		point[2] -= 64;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 1101
;1100:
;1101:		pm->trace(&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 12
ARGP4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 1102
;1102:		if (trace.fraction == 1.0) {
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $423
line 1103
;1103:			if (pm->cmd.forwardmove >= 0) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $426
line 1104
;1104:				PM_ForceLegsAnim(LEGS_JUMP);
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1105
;1105:				pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1106
;1106:			} else {
ADDRGP4 $427
JUMPV
LABELV $426
line 1107
;1107:				PM_ForceLegsAnim(LEGS_JUMPB);
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1108
;1108:				pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1109
;1109:			}
LABELV $427
line 1110
;1110:		}
LABELV $423
line 1111
;1111:	}
LABELV $417
line 1113
;1112:
;1113:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1114
;1114:	pml.groundPlane         = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1115
;1115:	pml.walking             = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1116
;1116:}
LABELV $416
endproc PM_GroundTraceMissed 80 28
export PM_GroundTrace
proc PM_GroundTrace 84 28
line 1123
;1117:
;1118:/*
;1119:=============
;1120:PM_GroundTrace
;1121:=============
;1122:*/
;1123:void PM_GroundTrace(void) {
line 1127
;1124:	vec3_t  point;
;1125:	trace_t trace;
;1126:
;1127:	point[0] = pm->ps->origin[0];
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1128
;1128:	point[1] = pm->ps->origin[1];
ADDRLP4 56+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1129
;1129:	point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 56+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 1131
;1130:
;1131:	pm->trace(&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 1132
;1132:	pml.groundTrace = trace;
ADDRGP4 pml+52
ADDRLP4 0
INDIRB
ASGNB 56
line 1135
;1133:
;1134:	// do something corrective if the trace starts in a solid...
;1135:	if (trace.allsolid) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $434
line 1136
;1136:		if (!PM_CorrectAllSolid(&trace))
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 PM_CorrectAllSolid
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $436
line 1137
;1137:			return;
ADDRGP4 $430
JUMPV
LABELV $436
line 1138
;1138:	}
LABELV $434
line 1141
;1139:
;1140:	// if the trace didn't hit anything, we are in free fall
;1141:	if (trace.fraction == 1.0) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $438
line 1142
;1142:		PM_GroundTraceMissed();
ADDRGP4 PM_GroundTraceMissed
CALLV
pop
line 1143
;1143:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1144
;1144:		pml.walking     = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1145
;1145:		return;
ADDRGP4 $430
JUMPV
LABELV $438
line 1149
;1146:	}
;1147:
;1148:	// check if getting thrown off the ground
;1149:	if (pm->ps->velocity[2] > 0 && DotProduct(pm->ps->velocity, trace.plane.normal) > 10) {
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $443
ADDRLP4 76
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+24
INDIRF4
MULF4
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 76
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 0+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 1092616192
LEF4 $443
line 1150
;1150:		if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $450
line 1151
;1151:			Com_Printf("%i:kickoff\n", c_pmove);
ADDRGP4 $452
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1152
;1152:		}
LABELV $450
line 1154
;1153:		// go into jump animation
;1154:		if (pm->cmd.forwardmove >= 0) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $453
line 1155
;1155:			PM_ForceLegsAnim(LEGS_JUMP);
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1156
;1156:			pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 1157
;1157:		} else {
ADDRGP4 $454
JUMPV
LABELV $453
line 1158
;1158:			PM_ForceLegsAnim(LEGS_JUMPB);
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 1159
;1159:			pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 1160
;1160:		}
LABELV $454
line 1162
;1161:
;1162:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1163
;1163:		pml.groundPlane         = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 1164
;1164:		pml.walking             = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1165
;1165:		return;
ADDRGP4 $430
JUMPV
LABELV $443
line 1169
;1166:	}
;1167:
;1168:	// slopes that are too steep will not be considered onground
;1169:	if (trace.plane.normal[2] < MIN_WALK_NORMAL) {
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $457
line 1170
;1170:		if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $461
line 1171
;1171:			Com_Printf("%i:steep\n", c_pmove);
ADDRGP4 $463
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1172
;1172:		}
LABELV $461
line 1175
;1173:		// FIXME: if they can't slide down the slope, let them
;1174:		// walk (sharp crevices)
;1175:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 1176
;1176:		pml.groundPlane         = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 1177
;1177:		pml.walking             = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 1178
;1178:		return;
ADDRGP4 $430
JUMPV
LABELV $457
line 1181
;1179:	}
;1180:
;1181:	pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 1182
;1182:	pml.walking     = qtrue;
ADDRGP4 pml+44
CNSTI4 1
ASGNI4
line 1185
;1183:
;1184:	// hitting solid ground will end a waterjump
;1185:	if (pm->ps->pm_flags & PMF_TIME_WATERJUMP) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $468
line 1186
;1186:		pm->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 -289
BANDI4
ASGNI4
line 1187
;1187:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1188
;1188:	}
LABELV $468
line 1190
;1189:
;1190:	if (pm->ps->groundEntityNum == ENTITYNUM_NONE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $470
line 1192
;1191:		// just hit the ground
;1192:		if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $472
line 1193
;1193:			Com_Printf("%i:Land\n", c_pmove);
ADDRGP4 $474
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 1194
;1194:		}
LABELV $472
line 1196
;1195:
;1196:		PM_CrashLand();
ADDRGP4 PM_CrashLand
CALLV
pop
line 1199
;1197:
;1198:		// don't do landing time if we were just going down a slope
;1199:		if (pml.previous_velocity[2] < -200) {
ADDRGP4 pml+124+8
INDIRF4
CNSTF4 3276275712
GEF4 $475
line 1201
;1200:			// don't allow another jump for a little while
;1201:			pm->ps->pm_flags |= PMF_TIME_LAND;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1202
;1202:			pm->ps->pm_time = 250;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 250
ASGNI4
line 1203
;1203:		}
LABELV $475
line 1204
;1204:	}
LABELV $470
line 1206
;1205:
;1206:	pm->ps->groundEntityNum = trace.entityNum;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 1211
;1207:
;1208:	// don't reset the z velocity for slopes
;1209:	//	pm->ps->velocity[2] = 0;
;1210:
;1211:	PM_AddTouchEnt(trace.entityNum);
ADDRLP4 0+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 1212
;1212:}
LABELV $430
endproc PM_GroundTrace 84 28
export PM_SetWaterLevel
proc PM_SetWaterLevel 48 8
line 1219
;1213:
;1214:/*
;1215:=============
;1216:PM_SetWaterLevel	FIXME: avoid this twice?  certainly if not moving
;1217:=============
;1218:*/
;1219:void PM_SetWaterLevel(void) {
line 1228
;1220:	vec3_t point;
;1221:	int    cont;
;1222:	int    sample1;
;1223:	int    sample2;
;1224:
;1225:	//
;1226:	// get waterlevel, accounting for ducking
;1227:	//
;1228:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 1229
;1229:	pm->watertype  = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 1231
;1230:
;1231:	point[0] = pm->ps->origin[0];
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 1232
;1232:	point[1] = pm->ps->origin[1];
ADDRLP4 0+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1233
;1233:	point[2] = pm->ps->origin[2] + MINS_Z + 1;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 1234
;1234:	cont     = pm->pointcontents(point, pm->ps->clientNum);
ADDRLP4 0
ARGP4
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 1236
;1235:
;1236:	if (cont & MASK_WATER) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $484
line 1237
;1237:		sample2 = pm->ps->viewheight - MINS_Z;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 -24
SUBI4
ASGNI4
line 1238
;1238:		sample1 = sample2 / 2;
ADDRLP4 20
ADDRLP4 16
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 1240
;1239:
;1240:		pm->watertype  = cont;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1241
;1241:		pm->waterlevel = 1;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 1
ASGNI4
line 1242
;1242:		point[2]       = pm->ps->origin[2] + MINS_Z + sample1;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 20
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1243
;1243:		cont           = pm->pointcontents(point, pm->ps->clientNum);
ADDRLP4 0
ARGP4
ADDRLP4 32
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 1244
;1244:		if (cont & MASK_WATER) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $487
line 1245
;1245:			pm->waterlevel = 2;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 2
ASGNI4
line 1246
;1246:			point[2]       = pm->ps->origin[2] + MINS_Z + sample2;
ADDRLP4 0+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 16
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1247
;1247:			cont           = pm->pointcontents(point, pm->ps->clientNum);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
ADDRLP4 40
INDIRP4
CNSTI4 224
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 1248
;1248:			if (cont & MASK_WATER) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $490
line 1249
;1249:				pm->waterlevel = 3;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 3
ASGNI4
line 1250
;1250:			}
LABELV $490
line 1251
;1251:		}
LABELV $487
line 1252
;1252:	}
LABELV $484
line 1253
;1253:}
LABELV $481
endproc PM_SetWaterLevel 48 8
export PM_CheckDuck
proc PM_CheckDuck 72 28
line 1262
;1254:
;1255:/*
;1256:==============
;1257:PM_CheckDuck
;1258:
;1259:Sets mins, maxs, and pm->ps->viewheight
;1260:==============
;1261:*/
;1262:void PM_CheckDuck(void) {
line 1265
;1263:	trace_t trace;
;1264:
;1265:	if (pm->ps->powerups[PW_INVULNERABILITY]) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $493
line 1266
;1266:		if (pm->ps->pm_flags & PMF_INVULEXPAND) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $495
line 1268
;1267:			// invulnerability sphere has a 42 units radius
;1268:			VectorSet(pm->mins, -42, -42, -42);
ADDRGP4 pm
INDIRP4
CNSTI4 176
ADDP4
CNSTF4 3257401344
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 3257401344
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 3257401344
ASGNF4
line 1269
;1269:			VectorSet(pm->maxs, 42, 42, 42);
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 1109917696
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 1109917696
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1109917696
ASGNF4
line 1270
;1270:		} else {
ADDRGP4 $496
JUMPV
LABELV $495
line 1271
;1271:			VectorSet(pm->mins, -15, -15, MINS_Z);
ADDRGP4 pm
INDIRP4
CNSTI4 176
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 3250585600
ASGNF4
line 1272
;1272:			VectorSet(pm->maxs, 15, 15, 16);
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1098907648
ASGNF4
line 1273
;1273:		}
LABELV $496
line 1274
;1274:		pm->ps->pm_flags |= PMF_DUCKED;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1275
;1275:		pm->ps->viewheight = CROUCH_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 12
ASGNI4
line 1276
;1276:		return;
ADDRGP4 $492
JUMPV
LABELV $493
line 1278
;1277:	}
;1278:	pm->ps->pm_flags &= ~PMF_INVULEXPAND;
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1280
;1279:
;1280:	pm->mins[0] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 176
ADDP4
CNSTF4 3245342720
ASGNF4
line 1281
;1281:	pm->mins[1] = -15;
ADDRGP4 pm
INDIRP4
CNSTI4 180
ADDP4
CNSTF4 3245342720
ASGNF4
line 1283
;1282:
;1283:	pm->maxs[0] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 188
ADDP4
CNSTF4 1097859072
ASGNF4
line 1284
;1284:	pm->maxs[1] = 15;
ADDRGP4 pm
INDIRP4
CNSTI4 192
ADDP4
CNSTF4 1097859072
ASGNF4
line 1286
;1285:
;1286:	pm->mins[2] = MINS_Z;
ADDRGP4 pm
INDIRP4
CNSTI4 184
ADDP4
CNSTF4 3250585600
ASGNF4
line 1288
;1287:
;1288:	if (pm->ps->pm_type == PM_DEAD) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $497
line 1289
;1289:		pm->maxs[2]        = -8;
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 3238002688
ASGNF4
line 1290
;1290:		pm->ps->viewheight = DEAD_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 -16
ASGNI4
line 1291
;1291:		return;
ADDRGP4 $492
JUMPV
LABELV $497
line 1294
;1292:	}
;1293:
;1294:	if (pm->cmd.upmove < 0) {  // duck
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $499
line 1295
;1295:		pm->ps->pm_flags |= PMF_DUCKED;
ADDRLP4 60
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1296
;1296:	} else {  // stand up if possible
ADDRGP4 $500
JUMPV
LABELV $499
line 1297
;1297:		if (pm->ps->pm_flags & PMF_DUCKED) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $501
line 1299
;1298:			// try to stand up
;1299:			pm->maxs[2] = 32;
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1107296256
ASGNF4
line 1300
;1300:			pm->trace(&trace, pm->ps->origin, pm->mins, pm->maxs, pm->ps->origin, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 60
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 60
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 64
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 60
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 1301
;1301:			if (!trace.allsolid)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $503
line 1302
;1302:				pm->ps->pm_flags &= ~PMF_DUCKED;
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
LABELV $503
line 1303
;1303:		}
LABELV $501
line 1304
;1304:	}
LABELV $500
line 1306
;1305:
;1306:	if (pm->ps->pm_flags & PMF_DUCKED) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $505
line 1307
;1307:		pm->maxs[2]        = 16;
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1098907648
ASGNF4
line 1308
;1308:		pm->ps->viewheight = CROUCH_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 12
ASGNI4
line 1309
;1309:	} else {
ADDRGP4 $506
JUMPV
LABELV $505
line 1310
;1310:		pm->maxs[2]        = 32;
ADDRGP4 pm
INDIRP4
CNSTI4 196
ADDP4
CNSTF4 1107296256
ASGNF4
line 1311
;1311:		pm->ps->viewheight = DEFAULT_VIEWHEIGHT;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 26
ASGNI4
line 1312
;1312:	}
LABELV $506
line 1313
;1313:}
LABELV $492
endproc PM_CheckDuck 72 28
export PM_Footsteps
proc PM_Footsteps 24 4
line 1322
;1314:
;1315://===================================================================
;1316:
;1317:/*
;1318:===============
;1319:PM_Footsteps
;1320:===============
;1321:*/
;1322:void PM_Footsteps(void) {
line 1335
;1323:	float    bobmove;
;1324:	float    xyspeedQ;
;1325:	int      old;
;1326:	qboolean footstep;
;1327:
;1328:	//
;1329:	// calculate speed and cycle to be used for
;1330:	// all cyclic walking effects
;1331:	//
;1332:	// xyspeedQ = pm->ps->velocity[0] * pm->ps->velocity[0]
;1333:	//	+ pm->ps->velocity[1] * pm->ps->velocity[1];
;1334:
;1335:	if (pm->ps->groundEntityNum == ENTITYNUM_NONE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $508
line 1337
;1336:
;1337:		if (pm->ps->powerups[PW_INVULNERABILITY]) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 368
ADDP4
INDIRI4
CNSTI4 0
EQI4 $510
line 1338
;1338:			PM_ContinueLegsAnim(LEGS_IDLECR);
CNSTI4 23
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1339
;1339:		}
LABELV $510
line 1341
;1340:		// airborne leaves position in cycle intact, but doesn't advance
;1341:		if (pm->waterlevel > 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
LEI4 $507
line 1342
;1342:			PM_ContinueLegsAnim(LEGS_SWIM);
CNSTI4 17
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1343
;1343:		}
line 1344
;1344:		return;
ADDRGP4 $507
JUMPV
LABELV $508
line 1348
;1345:	}
;1346:
;1347:	// if not trying to move
;1348:	if (!pm->cmd.forwardmove && !pm->cmd.rightmove) {
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $514
ADDRLP4 16
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $514
line 1349
;1349:		xyspeedQ = pm->ps->velocity[0] * pm->ps->velocity[0] + pm->ps->velocity[1] * pm->ps->velocity[1];
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 1350
;1350:		if (xyspeedQ < 5.0 * 5.0) {  // not using sqrt() there
ADDRLP4 8
INDIRF4
CNSTF4 1103626240
GEF4 $507
line 1351
;1351:			pm->ps->bobCycle = 0;    // start at beginning of cycle again
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 1352
;1352:			if (pm->ps->pm_flags & PMF_DUCKED) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $518
line 1353
;1353:				PM_ContinueLegsAnim(LEGS_IDLECR);
CNSTI4 23
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1354
;1354:			} else {
ADDRGP4 $507
JUMPV
LABELV $518
line 1355
;1355:				PM_ContinueLegsAnim(LEGS_IDLE);
CNSTI4 22
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1356
;1356:			}
line 1357
;1357:		}
line 1358
;1358:		return;
ADDRGP4 $507
JUMPV
LABELV $514
line 1361
;1359:	}
;1360:
;1361:	footstep = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1363
;1362:
;1363:	if (pm->ps->pm_flags & PMF_DUCKED) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $520
line 1364
;1364:		bobmove = 0.5;  // ducked characters bob much faster
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1365
;1365:		if (pm->ps->pm_flags & PMF_BACKWARDS_RUN) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $522
line 1366
;1366:			PM_ContinueLegsAnim(LEGS_BACKCR);
CNSTI4 32
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1367
;1367:		} else {
ADDRGP4 $521
JUMPV
LABELV $522
line 1368
;1368:			PM_ContinueLegsAnim(LEGS_WALKCR);
CNSTI4 13
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1369
;1369:		}
line 1381
;1370:		// ducked characters never play footsteps
;1371:		/*
;1372:		} else 	if ( pm->ps->pm_flags & PMF_BACKWARDS_RUN ) {
;1373:		    if ( !( pm->cmd.buttons & BUTTON_WALKING ) ) {
;1374:		        bobmove = 0.4;	// faster speeds bob faster
;1375:		        footstep = qtrue;
;1376:		    } else {
;1377:		        bobmove = 0.3;
;1378:		    }
;1379:		    PM_ContinueLegsAnim( LEGS_BACK );
;1380:		*/
;1381:	} else {
ADDRGP4 $521
JUMPV
LABELV $520
line 1382
;1382:		if (!(pm->cmd.buttons & BUTTON_WALKING)) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $524
line 1383
;1383:			bobmove = 0.4f;  // faster speeds bob faster
ADDRLP4 4
CNSTF4 1053609165
ASGNF4
line 1384
;1384:			if (pm->ps->pm_flags & PMF_BACKWARDS_RUN) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $526
line 1385
;1385:				PM_ContinueLegsAnim(LEGS_BACK);
CNSTI4 16
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1386
;1386:			} else {
ADDRGP4 $527
JUMPV
LABELV $526
line 1387
;1387:				PM_ContinueLegsAnim(LEGS_RUN);
CNSTI4 15
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1388
;1388:			}
LABELV $527
line 1389
;1389:			footstep = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1390
;1390:		} else {
ADDRGP4 $525
JUMPV
LABELV $524
line 1391
;1391:			bobmove = 0.3f;  // walking bobs slow
ADDRLP4 4
CNSTF4 1050253722
ASGNF4
line 1392
;1392:			if (pm->ps->pm_flags & PMF_BACKWARDS_RUN) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $528
line 1393
;1393:				PM_ContinueLegsAnim(LEGS_BACKWALK);
CNSTI4 33
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1394
;1394:			} else {
ADDRGP4 $529
JUMPV
LABELV $528
line 1395
;1395:				PM_ContinueLegsAnim(LEGS_WALK);
CNSTI4 14
ARGI4
ADDRGP4 PM_ContinueLegsAnim
CALLV
pop
line 1396
;1396:			}
LABELV $529
line 1397
;1397:		}
LABELV $525
line 1399
;1398:		
;1399:		phy_PmoveSingle;
line 1400
;1400:		PM_AddEvent(EV_SWIM);
CNSTI4 5
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1402
;1401:		
;1402:		} //else if (pm->waterlevel == 3) {
LABELV $521
line 1406
;1403:			// no sound when completely underwater
;1404:		//}
;1405:	//}
;1406:}
LABELV $507
endproc PM_Footsteps 24 4
proc PM_BeginWeaponChange 8 4
line 1450
;1407:
;1408:/*
;1409:==============
;1410:PM_WaterEvents
;1411:
;1412:Generate sound events for entering and leaving water
;1413:==============
;1414:*/
;1415:/* void PM_WaterEvents(void) {  // FIXME?
;1416:	//
;1417:	// if just entered a water volume, play a sound
;1418:	//
;1419:	if (!pml.previous_waterlevel && pm->waterlevel) {
;1420:		PM_AddEvent(EV_WATER_TOUCH);
;1421:	}
;1422:
;1423:	//
;1424:	// if just completely exited a water volume, play a sound
;1425:	//
;1426:	if (pml.previous_waterlevel && !pm->waterlevel) {
;1427:		PM_AddEvent(EV_WATER_LEAVE);
;1428:	}
;1429:
;1430:	//
;1431:	// check for head just going under water
;1432:	//
;1433:	if (pml.previous_waterlevel != 3 && pm->waterlevel == 3) {
;1434:		PM_AddEvent(EV_WATER_UNDER);
;1435:	}
;1436:
;1437:	//
;1438:	// check for head just coming out of water
;1439:	//
;1440:	if (pml.previous_waterlevel == 3 && pm->waterlevel != 3) {
;1441:		PM_AddEvent(EV_WATER_CLEAR);
;1442:	}
;1443:} */
;1444:
;1445:/*
;1446:===============
;1447:PM_BeginWeaponChange
;1448:===============
;1449:*/
;1450:static void PM_BeginWeaponChange(int weapon) {
line 1451
;1451:	if (weapon <= WP_NONE || weapon >= WP_NUM_WEAPONS) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $533
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $531
LABELV $533
line 1452
;1452:		return;
ADDRGP4 $530
JUMPV
LABELV $531
line 1455
;1453:	}
;1454:
;1455:	if (!(pm->ps->stats[STAT_WEAPONS] & (1 << weapon))) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $534
line 1456
;1456:		return;
ADDRGP4 $530
JUMPV
LABELV $534
line 1459
;1457:	}
;1458:
;1459:	if (pm->ps->weaponstate == WEAPON_DROPPING) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $536
line 1460
;1460:		pm->ps->eFlags &= ~EF_FIRING;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 1461
;1461:		return;
ADDRGP4 $530
JUMPV
LABELV $536
line 1464
;1462:	}
;1463:
;1464:	PM_AddEvent(EV_CHANGE_WEAPON);
CNSTI4 22
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1465
;1465:	pm->ps->weaponstate = WEAPON_DROPPING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 1466
;1466:	pm->ps->weaponTime += 200;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1467
;1467:	PM_StartTorsoAnim(TORSO_DROP);
CNSTI4 9
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1468
;1468:}
LABELV $530
endproc PM_BeginWeaponChange 8 4
proc PM_FinishWeaponChange 16 4
line 1475
;1469:
;1470:/*
;1471:===============
;1472:PM_FinishWeaponChange
;1473:===============
;1474:*/
;1475:static void PM_FinishWeaponChange(void) {
line 1478
;1476:	int weapon;
;1477:
;1478:	weapon = pm->cmd.weapon;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 1479
;1479:	if (weapon < WP_NONE || weapon >= WP_NUM_WEAPONS) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $541
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $539
LABELV $541
line 1480
;1480:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1481
;1481:	}
LABELV $539
line 1483
;1482:
;1483:	if (!(pm->ps->stats[STAT_WEAPONS] & (1 << weapon))) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $542
line 1484
;1484:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1485
;1485:	}
LABELV $542
line 1487
;1486:
;1487:	pm->ps->weapon      = weapon;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1488
;1488:	pm->ps->weaponstate = WEAPON_RAISING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 1489
;1489:	pm->ps->eFlags &= ~EF_FIRING;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 1490
;1490:	pm->ps->weaponTime += 250;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 1491
;1491:	PM_StartTorsoAnim(TORSO_RAISE);
CNSTI4 10
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1492
;1492:}
LABELV $538
endproc PM_FinishWeaponChange 16 4
export PM_TorsoAnimation
proc PM_TorsoAnimation 0 4
line 1500
;1493:
;1494:/*
;1495:==============
;1496:PM_TorsoAnimation
;1497:
;1498:==============
;1499:*/
;1500:void PM_TorsoAnimation(void) {
line 1501
;1501:	if (pm->ps->weaponstate == WEAPON_READY) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 0
NEI4 $545
line 1502
;1502:		if (pm->ps->weapon == WP_GAUNTLET) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $547
line 1503
;1503:			PM_ContinueTorsoAnim(TORSO_STAND2);
CNSTI4 12
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 1504
;1504:		} else {
ADDRGP4 $544
JUMPV
LABELV $547
line 1505
;1505:			PM_ContinueTorsoAnim(TORSO_STAND);
CNSTI4 11
ARGI4
ADDRGP4 PM_ContinueTorsoAnim
CALLV
pop
line 1506
;1506:		}
line 1507
;1507:		return;
LABELV $545
line 1509
;1508:	}
;1509:}
LABELV $544
endproc PM_TorsoAnimation 0 4
export PM_Weapon
proc PM_Weapon 28 4
line 1518
;1510:
;1511:/*
;1512:==============
;1513:PM_Weapon
;1514:
;1515:Generates weapon events and modifes the weapon counter
;1516:==============
;1517:*/
;1518:void PM_Weapon(void) {
line 1522
;1519:	int addTime;
;1520:
;1521:	// don't allow attack until all buttons are up
;1522:	if (pm->ps->pm_flags & PMF_RESPAWNED) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $550
line 1523
;1523:		return;
ADDRGP4 $549
JUMPV
LABELV $550
line 1527
;1524:	}
;1525:
;1526:	// ignore if spectator
;1527:	if (pm->ps->persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
NEI4 $552
line 1528
;1528:		return;
ADDRGP4 $549
JUMPV
LABELV $552
line 1532
;1529:	}
;1530:
;1531:	// check for dead player
;1532:	if (pm->ps->stats[STAT_HEALTH] <= 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $554
line 1533
;1533:		pm->ps->weapon = WP_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 1534
;1534:		return;
ADDRGP4 $549
JUMPV
LABELV $554
line 1538
;1535:	}
;1536:
;1537:	// check for item using
;1538:	if (pm->cmd.buttons & BUTTON_USE_HOLDABLE) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $556
line 1539
;1539:		if (!(pm->ps->pm_flags & PMF_USE_ITEM_HELD)) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $557
line 1540
;1540:			if (bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag == HI_MEDKIT && pm->ps->stats[STAT_HEALTH] >= (pm->ps->stats[STAT_MAX_HEALTH] + 25)) {
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
NEI4 $560
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
LTI4 $560
line 1542
;1541:				// don't use medkit if at max health
;1542:			} else {
ADDRGP4 $549
JUMPV
LABELV $560
line 1543
;1543:				pm->ps->pm_flags |= PMF_USE_ITEM_HELD;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 1544
;1544:				PM_AddEvent(EV_USE_ITEM0 + bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 24
ADDI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1545
;1545:				pm->ps->stats[STAT_HOLDABLE_ITEM] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 1546
;1546:			}
line 1547
;1547:			return;
ADDRGP4 $549
JUMPV
line 1549
;1548:		}
;1549:	} else {
LABELV $556
line 1550
;1550:		pm->ps->pm_flags &= ~PMF_USE_ITEM_HELD;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 1551
;1551:	}
LABELV $557
line 1554
;1552:
;1553:	// make weapon function
;1554:	if (pm->ps->weaponTime > 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $564
line 1555
;1555:		pm->ps->weaponTime -= pml.msec;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1556
;1556:	}
LABELV $564
line 1561
;1557:
;1558:	// check for weapon change
;1559:	// can't change if weapon is firing, but can change
;1560:	// again if lowering or raising
;1561:	if (pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING) {
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $569
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
EQI4 $567
LABELV $569
line 1562
;1562:		if (pm->ps->weapon != pm->cmd.weapon) {
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
EQI4 $570
line 1563
;1563:			PM_BeginWeaponChange(pm->cmd.weapon);
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 PM_BeginWeaponChange
CALLV
pop
line 1564
;1564:		}
LABELV $570
line 1565
;1565:	}
LABELV $567
line 1567
;1566:
;1567:	if (pm->ps->weaponTime > 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $572
line 1568
;1568:		return;
ADDRGP4 $549
JUMPV
LABELV $572
line 1572
;1569:	}
;1570:
;1571:	// change weapon if time
;1572:	if (pm->ps->weaponstate == WEAPON_DROPPING) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $574
line 1573
;1573:		PM_FinishWeaponChange();
ADDRGP4 PM_FinishWeaponChange
CALLV
pop
line 1574
;1574:		return;
ADDRGP4 $549
JUMPV
LABELV $574
line 1577
;1575:	}
;1576:
;1577:	if (pm->ps->weaponstate == WEAPON_RAISING) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
NEI4 $576
line 1578
;1578:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1579
;1579:		if (pm->ps->weapon == WP_GAUNTLET) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $578
line 1580
;1580:			PM_StartTorsoAnim(TORSO_STAND2);
CNSTI4 12
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1581
;1581:		} else {
ADDRGP4 $549
JUMPV
LABELV $578
line 1582
;1582:			PM_StartTorsoAnim(TORSO_STAND);
CNSTI4 11
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1583
;1583:		}
line 1584
;1584:		return;
ADDRGP4 $549
JUMPV
LABELV $576
line 1588
;1585:	}
;1586:
;1587:	// check for fire
;1588:	if (!(pm->cmd.buttons & BUTTON_ATTACK)) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $580
line 1589
;1589:		pm->ps->weaponTime  = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1590
;1590:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1591
;1591:		return;
ADDRGP4 $549
JUMPV
LABELV $580
line 1595
;1592:	}
;1593:
;1594:	// start the animation even if out of ammo
;1595:	if (pm->ps->weapon == WP_GAUNTLET) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $582
line 1597
;1596:		// the guantlet only "fires" when it actually hits something
;1597:		if (!pm->gauntletHit) {
ADDRGP4 pm
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $584
line 1598
;1598:			pm->ps->weaponTime  = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1599
;1599:			pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1600
;1600:			return;
ADDRGP4 $549
JUMPV
LABELV $584
line 1602
;1601:		}
;1602:		PM_StartTorsoAnim(TORSO_ATTACK2);
CNSTI4 8
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1603
;1603:	} else {
ADDRGP4 $583
JUMPV
LABELV $582
line 1604
;1604:		PM_StartTorsoAnim(TORSO_ATTACK);
CNSTI4 7
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1605
;1605:	}
LABELV $583
line 1607
;1606:
;1607:	pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 1610
;1608:
;1609:	// check for out of ammo
;1610:	if (!pm->ps->ammo[pm->ps->weapon]) {
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $586
line 1611
;1611:		PM_AddEvent(EV_NOAMMO);
CNSTI4 21
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1612
;1612:		pm->ps->weaponTime += 500;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 1613
;1613:		return;
ADDRGP4 $549
JUMPV
LABELV $586
line 1617
;1614:	}
;1615:
;1616:	// take an ammo away if not infinite
;1617:	if (pm->ps->ammo[pm->ps->weapon] != -1) {
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $588
line 1618
;1618:		pm->ps->ammo[pm->ps->weapon]--;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 376
ADDP4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1619
;1619:	}
LABELV $588
line 1622
;1620:
;1621:	// fire weapon
;1622:	PM_AddEvent(EV_FIRE_WEAPON);
CNSTI4 23
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1624
;1623:
;1624:	switch (pm->ps->weapon) {
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LTI4 $590
ADDRLP4 16
INDIRI4
CNSTI4 10
GTI4 $590
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $603-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $603
address $593
address $596
address $595
address $597
address $598
address $594
address $600
address $599
address $601
address $602
code
LABELV $590
LABELV $593
line 1627
;1625:	default:
;1626:	case WP_GAUNTLET:
;1627:		addTime = 400;
ADDRLP4 0
CNSTI4 400
ASGNI4
line 1628
;1628:		break;
ADDRGP4 $591
JUMPV
LABELV $594
line 1630
;1629:	case WP_LIGHTNING:
;1630:		addTime = 50;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 1631
;1631:		break;
ADDRGP4 $591
JUMPV
LABELV $595
line 1633
;1632:	case WP_SHOTGUN:
;1633:		addTime = 1000;
ADDRLP4 0
CNSTI4 1000
ASGNI4
line 1634
;1634:		break;
ADDRGP4 $591
JUMPV
LABELV $596
line 1636
;1635:	case WP_MACHINEGUN:
;1636:		addTime = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 1637
;1637:		break;
ADDRGP4 $591
JUMPV
LABELV $597
line 1639
;1638:	case WP_GRENADE_LAUNCHER:
;1639:		addTime = 800;
ADDRLP4 0
CNSTI4 800
ASGNI4
line 1640
;1640:		break;
ADDRGP4 $591
JUMPV
LABELV $598
line 1642
;1641:	case WP_ROCKET_LAUNCHER:
;1642:		addTime = 800;
ADDRLP4 0
CNSTI4 800
ASGNI4
line 1643
;1643:		break;
ADDRGP4 $591
JUMPV
LABELV $599
line 1645
;1644:	case WP_PLASMAGUN:
;1645:		addTime = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 1646
;1646:		break;
ADDRGP4 $591
JUMPV
LABELV $600
line 1648
;1647:	case WP_RAILGUN:
;1648:		addTime = 1500;
ADDRLP4 0
CNSTI4 1500
ASGNI4
line 1649
;1649:		break;
ADDRGP4 $591
JUMPV
LABELV $601
line 1651
;1650:	case WP_BFG:
;1651:		addTime = 200;
ADDRLP4 0
CNSTI4 200
ASGNI4
line 1652
;1652:		break;
ADDRGP4 $591
JUMPV
LABELV $602
line 1654
;1653:	case WP_GRAPPLING_HOOK:
;1654:		addTime = 400;
ADDRLP4 0
CNSTI4 400
ASGNI4
line 1655
;1655:		break;
LABELV $591
line 1676
;1656:#ifdef MISSIONPACK
;1657:	case WP_NAILGUN:
;1658:		addTime = 1000;
;1659:		break;
;1660:	case WP_PROX_LAUNCHER:
;1661:		addTime = 800;
;1662:		break;
;1663:	case WP_CHAINGUN:
;1664:		addTime = 30;
;1665:		break;
;1666:#endif
;1667:	}
;1668:
;1669:#ifdef MISSIONPACK
;1670:	if (bg_itemlist[pm->ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT) {
;1671:		addTime /= 1.5;
;1672:	} else if (bg_itemlist[pm->ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN) {
;1673:		addTime /= 1.3;
;1674:	} else
;1675:#endif
;1676:		if (pm->ps->powerups[PW_HASTE]) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $605
line 1677
;1677:		addTime /= 1.3;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1061481551
MULF4
CVFI4 4
ASGNI4
line 1678
;1678:	}
LABELV $605
line 1680
;1679:
;1680:	pm->ps->weaponTime += addTime;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 1681
;1681:}
LABELV $549
endproc PM_Weapon 28 4
export PM_Animate
proc PM_Animate 0 4
line 1689
;1682:
;1683:/*
;1684:================
;1685:PM_Animate
;1686:================
;1687:*/
;1688:
;1689:void PM_Animate(void) {
line 1690
;1690:	if (pm->cmd.buttons & BUTTON_GESTURE) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $608
line 1691
;1691:		if (pm->ps->torsoTimer == 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
NEI4 $610
line 1692
;1692:			PM_StartTorsoAnim(TORSO_GESTURE);
CNSTI4 6
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 1693
;1693:			pm->ps->torsoTimer = TIMER_GESTURE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 2294
ASGNI4
line 1694
;1694:			PM_AddEvent(EV_TAUNT);
CNSTI4 76
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 1695
;1695:		}
LABELV $610
line 1728
;1696:#ifdef MISSIONPACK
;1697:	} else if (pm->cmd.buttons & BUTTON_GETFLAG) {
;1698:		if (pm->ps->torsoTimer == 0) {
;1699:			PM_StartTorsoAnim(TORSO_GETFLAG);
;1700:			pm->ps->torsoTimer = 600;  // TIMER_GESTURE;
;1701:		}
;1702:	} else if (pm->cmd.buttons & BUTTON_GUARDBASE) {
;1703:		if (pm->ps->torsoTimer == 0) {
;1704:			PM_StartTorsoAnim(TORSO_GUARDBASE);
;1705:			pm->ps->torsoTimer = 600;  // TIMER_GESTURE;
;1706:		}
;1707:	} else if (pm->cmd.buttons & BUTTON_PATROL) {
;1708:		if (pm->ps->torsoTimer == 0) {
;1709:			PM_StartTorsoAnim(TORSO_PATROL);
;1710:			pm->ps->torsoTimer = 600;  // TIMER_GESTURE;
;1711:		}
;1712:	} else if (pm->cmd.buttons & BUTTON_FOLLOWME) {
;1713:		if (pm->ps->torsoTimer == 0) {
;1714:			PM_StartTorsoAnim(TORSO_FOLLOWME);
;1715:			pm->ps->torsoTimer = 600;  // TIMER_GESTURE;
;1716:		}
;1717:	} else if (pm->cmd.buttons & BUTTON_AFFIRMATIVE) {
;1718:		if (pm->ps->torsoTimer == 0) {
;1719:			PM_StartTorsoAnim(TORSO_AFFIRMATIVE);
;1720:			pm->ps->torsoTimer = 600;  // TIMER_GESTURE;
;1721:		}
;1722:	} else if (pm->cmd.buttons & BUTTON_NEGATIVE) {
;1723:		if (pm->ps->torsoTimer == 0) {
;1724:			PM_StartTorsoAnim(TORSO_NEGATIVE);
;1725:			pm->ps->torsoTimer = 600;  // TIMER_GESTURE;
;1726:		}
;1727:#endif
;1728:	}
LABELV $608
line 1729
;1729:}
LABELV $607
endproc PM_Animate 0 4
export PM_DropTimers
proc PM_DropTimers 4 0
line 1736
;1730:
;1731:/*
;1732:================
;1733:PM_DropTimers
;1734:================
;1735:*/
;1736:void PM_DropTimers(void) {
line 1738
;1737:	// drop misc timing counter
;1738:	if (pm->ps->pm_time) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $613
line 1739
;1739:		if (pml.msec >= pm->ps->pm_time) {
ADDRGP4 pml+40
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
LTI4 $615
line 1740
;1740:			pm->ps->pm_flags &= ~PMF_ALL_TIMES;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -353
BANDI4
ASGNI4
line 1741
;1741:			pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 1742
;1742:		} else {
ADDRGP4 $616
JUMPV
LABELV $615
line 1743
;1743:			pm->ps->pm_time -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1744
;1744:		}
LABELV $616
line 1745
;1745:	}
LABELV $613
line 1748
;1746:
;1747:	// drop animation counter
;1748:	if (pm->ps->legsTimer > 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
LEI4 $619
line 1749
;1749:		pm->ps->legsTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1750
;1750:		if (pm->ps->legsTimer < 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
GEI4 $622
line 1751
;1751:			pm->ps->legsTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 1752
;1752:		}
LABELV $622
line 1753
;1753:	}
LABELV $619
line 1755
;1754:
;1755:	if (pm->ps->torsoTimer > 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
LEI4 $624
line 1756
;1756:		pm->ps->torsoTimer -= pml.msec;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1757
;1757:		if (pm->ps->torsoTimer < 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CNSTI4 0
GEI4 $627
line 1758
;1758:			pm->ps->torsoTimer = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 80
ADDP4
CNSTI4 0
ASGNI4
line 1759
;1759:		}
LABELV $627
line 1760
;1760:	}
LABELV $624
line 1761
;1761:}
LABELV $612
endproc PM_DropTimers 4 0
export PM_UpdateViewAngles
proc PM_UpdateViewAngles 24 0
line 1771
;1762:
;1763:/*
;1764:================
;1765:PM_UpdateViewAngles
;1766:
;1767:This can be used as another entry point when only the viewangles
;1768:are being updated instead of a full move
;1769:================
;1770:*/
;1771:void PM_UpdateViewAngles(playerState_t* ps, const usercmd_t* cmd) {
line 1775
;1772:	short temp;
;1773:	int   i;
;1774:
;1775:	if (ps->pm_type == PM_INTERMISSION || ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $632
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $630
LABELV $632
line 1776
;1776:		return;  // no view changes at all
ADDRGP4 $629
JUMPV
LABELV $630
line 1779
;1777:	}
;1778:
;1779:	if (ps->pm_type != PM_SPECTATOR && ps->stats[STAT_HEALTH] <= 0) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $633
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $633
line 1780
;1780:		return;  // no view changes at all
ADDRGP4 $629
JUMPV
LABELV $633
line 1784
;1781:	}
;1782:
;1783:	// circularly clamp the angles with deltas
;1784:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $635
line 1785
;1785:		temp = cmd->angles[i] + ps->delta_angles[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
INDIRI4
ADDI4
CVII2 4
ASGNI2
line 1786
;1786:		if (i == PITCH) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $639
line 1788
;1787:			// don't let the player look up or down more than 90 degrees
;1788:			if (temp > 16000) {
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 16000
LEI4 $641
line 1789
;1789:				ps->delta_angles[i] = (16000 - cmd->angles[i]) & 0xFFFF;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
CNSTI4 16000
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
CNSTI4 65535
BANDI4
ASGNI4
line 1790
;1790:				temp                = 16000;
ADDRLP4 4
CNSTI2 16000
ASGNI2
line 1791
;1791:			} else if (temp < -16000) {
ADDRGP4 $642
JUMPV
LABELV $641
ADDRLP4 4
INDIRI2
CVII4 2
CNSTI4 -16000
GEI4 $643
line 1792
;1792:				ps->delta_angles[i] = (-16000 - cmd->angles[i]) & 0xFFFF;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 56
ADDP4
ADDP4
CNSTI4 -16000
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
SUBI4
CNSTI4 65535
BANDI4
ASGNI4
line 1793
;1793:				temp                = -16000;
ADDRLP4 4
CNSTI2 -16000
ASGNI2
line 1794
;1794:			}
LABELV $643
LABELV $642
line 1795
;1795:		}
LABELV $639
line 1796
;1796:		ps->viewangles[i] = SHORT2ANGLE(temp);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
ADDP4
ADDRLP4 4
INDIRI2
CVII4 2
CVIF4 4
CNSTF4 1001652224
MULF4
ASGNF4
line 1797
;1797:	}
LABELV $636
line 1784
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $635
line 1798
;1798:}
LABELV $629
endproc PM_UpdateViewAngles 24 0
export PmoveSingle
proc PmoveSingle 36 16
line 1808
;1799:
;1800:/*
;1801:================
;1802:PmoveSingle
;1803:
;1804:================
;1805:*/
;1806:void trap_SnapVector(float* v);
;1807:
;1808:void PmoveSingle(pmove_t* pmove) {
line 1809
;1809:	pm = pmove;
ADDRGP4 pm
ADDRFP4 0
INDIRP4
ASGNP4
line 1813
;1810:
;1811:	// this counter lets us debug movement problems with a journal
;1812:	// by setting a conditional breakpoint fot the previous frame
;1813:	c_pmove++;
ADDRLP4 0
ADDRGP4 c_pmove
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1816
;1814:
;1815:	// clear results
;1816:	pm->numtouch   = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 1817
;1817:	pm->watertype  = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 1818
;1818:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 1820
;1819:
;1820:	if (pm->ps->stats[STAT_HEALTH] <= 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $646
line 1821
;1821:		pm->tracemask &= ~CONTENTS_BODY;  // corpses can fly through bodies
ADDRLP4 4
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -33554433
BANDI4
ASGNI4
line 1822
;1822:	}
LABELV $646
line 1826
;1823:
;1824:	// make sure walking button is clear if they are running, to avoid
;1825:	// proxy no-footsteps cheats
;1826:	if (abs(pm->cmd.forwardmove) > 64 || abs(pm->cmd.rightmove) > 64) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
GTI4 $650
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LEI4 $648
LABELV $650
line 1827
;1827:		pm->cmd.buttons &= ~BUTTON_WALKING;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 1828
;1828:	}
LABELV $648
line 1831
;1829:
;1830:	// set the talk balloon flag
;1831:	if (pm->cmd.buttons & BUTTON_TALK) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $651
line 1832
;1832:		pm->ps->eFlags |= EF_TALK;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1833
;1833:	} else {
ADDRGP4 $652
JUMPV
LABELV $651
line 1834
;1834:		pm->ps->eFlags &= ~EF_TALK;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 1835
;1835:	}
LABELV $652
line 1838
;1836:
;1837:	// set the firing flag for continuous beam weapons
;1838:	if (!(pm->ps->pm_flags & PMF_RESPAWNED) && pm->ps->pm_type != PM_INTERMISSION && pm->ps->pm_type != PM_NOCLIP && (pm->cmd.buttons & BUTTON_ATTACK) &&
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $653
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $653
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $653
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $653
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $653
line 1839
;1839:	    pm->ps->ammo[pm->ps->weapon]) {
line 1840
;1840:		pm->ps->eFlags |= EF_FIRING;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 1841
;1841:	} else {
ADDRGP4 $654
JUMPV
LABELV $653
line 1842
;1842:		pm->ps->eFlags &= ~EF_FIRING;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 1843
;1843:	}
LABELV $654
line 1846
;1844:
;1845:	// clear the respawned flag if attack and use are cleared
;1846:	if (pm->ps->stats[STAT_HEALTH] > 0 && !(pm->cmd.buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE))) {
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $655
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
NEI4 $655
line 1847
;1847:		pm->ps->pm_flags &= ~PMF_RESPAWNED;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 1848
;1848:	}
LABELV $655
line 1853
;1849:
;1850:	// if talk button is down, dissallow all other input
;1851:	// this is to prevent any possible intercept proxy from
;1852:	// adding fake talk balloons
;1853:	if (pmove->cmd.buttons & BUTTON_TALK) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $657
line 1856
;1854:		// keep the talk button set tho for when the cmd.serverTime > 66 msec
;1855:		// and the same cmd is used multiple times in Pmove
;1856:		pmove->cmd.buttons     = BUTTON_TALK;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 2
ASGNI4
line 1857
;1857:		pmove->cmd.forwardmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 1858
;1858:		pmove->cmd.rightmove   = 0;
ADDRFP4 0
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 1859
;1859:		pmove->cmd.upmove      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 1860
;1860:	}
LABELV $657
line 1863
;1861:
;1862:	// clear all pmove local vars
;1863:	memset(&pml, 0, sizeof(pml));
ADDRGP4 pml
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1866
;1864:
;1865:	// determine the time
;1866:	pml.msec = pmove->cmd.serverTime - pm->ps->commandTime;
ADDRGP4 pml+40
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 1867
;1867:	if (pml.msec < 1) {
ADDRGP4 pml+40
INDIRI4
CNSTI4 1
GEI4 $660
line 1868
;1868:		pml.msec = 1;
ADDRGP4 pml+40
CNSTI4 1
ASGNI4
line 1869
;1869:	} else if (pml.msec > 200) {
ADDRGP4 $661
JUMPV
LABELV $660
ADDRGP4 pml+40
INDIRI4
CNSTI4 200
LEI4 $664
line 1870
;1870:		pml.msec = 200;
ADDRGP4 pml+40
CNSTI4 200
ASGNI4
line 1871
;1871:	}
LABELV $664
LABELV $661
line 1872
;1872:	pm->ps->commandTime = pmove->cmd.serverTime;
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1875
;1873:
;1874:	// save old org in case we get stuck
;1875:	VectorCopy(pm->ps->origin, pml.previous_origin);
ADDRGP4 pml+112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1878
;1876:
;1877:	// save old velocity for crashlanding
;1878:	VectorCopy(pm->ps->velocity, pml.previous_velocity);
ADDRGP4 pml+124
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 1880
;1879:
;1880:	pml.frametime = pml.msec * 0.001;
ADDRGP4 pml+36
ADDRGP4 pml+40
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ASGNF4
line 1883
;1881:
;1882:	// update the viewangles
;1883:	PM_UpdateViewAngles(pm->ps, &pm->cmd);
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 1885
;1884:
;1885:	AngleVectors(pm->ps->viewangles, pml.forward, pml.right, pml.up);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 pml
ARGP4
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+24
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 1887
;1886:
;1887:	if (pm->cmd.upmove < 10) {
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $674
line 1889
;1888:		// not holding jump
;1889:		pm->ps->pm_flags &= ~PMF_JUMP_HELD;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 1890
;1890:	}
LABELV $674
line 1893
;1891:
;1892:	// decide if backpedaling animations should be used
;1893:	if (pm->cmd.forwardmove < 0) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $676
line 1894
;1894:		pm->ps->pm_flags |= PMF_BACKWARDS_RUN;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1895
;1895:	} else if (pm->cmd.forwardmove > 0 || (pm->cmd.forwardmove == 0 && pm->cmd.rightmove)) {
ADDRGP4 $677
JUMPV
LABELV $676
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GTI4 $680
ADDRLP4 28
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $678
ADDRLP4 28
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $678
LABELV $680
line 1896
;1896:		pm->ps->pm_flags &= ~PMF_BACKWARDS_RUN;
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 1897
;1897:	}
LABELV $678
LABELV $677
line 1899
;1898:
;1899:	if (pm->ps->pm_type >= PM_DEAD) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $681
line 1900
;1900:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 1901
;1901:		pm->cmd.rightmove   = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 1902
;1902:		pm->cmd.upmove      = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 1903
;1903:	}
LABELV $681
line 1905
;1904:
;1905:	if (pm_respawntimer) {
ADDRGP4 pm_respawntimer
INDIRI4
CNSTI4 0
EQI4 $683
line 1906
;1906:		pm_respawntimer -= pml.msec;
ADDRLP4 32
ADDRGP4 pm_respawntimer
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 1907
;1907:		if (pm_respawntimer < 0) {
ADDRGP4 pm_respawntimer
INDIRI4
CNSTI4 0
GEI4 $686
line 1908
;1908:			pm_respawntimer = 0;
ADDRGP4 pm_respawntimer
CNSTI4 0
ASGNI4
line 1909
;1909:		}
LABELV $686
line 1910
;1910:	}
LABELV $683
line 1912
;1911:
;1912:	if (pm->ps->pm_type == PM_SPECTATOR) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $688
line 1913
;1913:		PM_CheckDuck();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 1914
;1914:		PM_FlyMove();
ADDRGP4 PM_FlyMove
CALLV
pop
line 1915
;1915:		PM_DropTimers();
ADDRGP4 PM_DropTimers
CALLV
pop
line 1916
;1916:		return;
ADDRGP4 $645
JUMPV
LABELV $688
line 1919
;1917:	}
;1918:
;1919:	if (pm->ps->pm_type == PM_NOCLIP) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $690
line 1920
;1920:		PM_NoclipMove();
ADDRGP4 PM_NoclipMove
CALLV
pop
line 1921
;1921:		PM_DropTimers();
ADDRGP4 PM_DropTimers
CALLV
pop
line 1922
;1922:		return;
ADDRGP4 $645
JUMPV
LABELV $690
line 1925
;1923:	}
;1924:
;1925:	if (pm->ps->pm_type == PM_FREEZE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 4
NEI4 $692
line 1926
;1926:		return;  // no movement at all
ADDRGP4 $645
JUMPV
LABELV $692
line 1929
;1927:	}
;1928:
;1929:	if (pm->ps->pm_type == PM_INTERMISSION || pm->ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $696
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $694
LABELV $696
line 1930
;1930:		return;  // no movement at all
ADDRGP4 $645
JUMPV
LABELV $694
line 1934
;1931:	}
;1932:
;1933:	// set watertype, and waterlevel
;1934:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 1935
;1935:	pml.previous_waterlevel = pmove->waterlevel;
ADDRGP4 pml+136
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 1938
;1936:
;1937:	// set mins, maxs, and viewheight
;1938:	PM_CheckDuck();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 1941
;1939:
;1940:	// set groundentity
;1941:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 1943
;1942:
;1943:	if (pm->ps->pm_type == PM_DEAD) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $698
line 1944
;1944:		PM_DeadMove();
ADDRGP4 PM_DeadMove
CALLV
pop
line 1945
;1945:	}
LABELV $698
line 1947
;1946:
;1947:	PM_DropTimers();
ADDRGP4 PM_DropTimers
CALLV
pop
line 1954
;1948:
;1949:#ifdef MISSIONPACK
;1950:	if (pm->ps->powerups[PW_INVULNERABILITY]) {
;1951:		PM_InvulnerabilityMove();
;1952:	} else
;1953:#endif
;1954:		if (pm->ps->powerups[PW_FLIGHT]) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $700
line 1956
;1955:		// flight powerup doesn't allow jump and has different friction
;1956:		PM_FlyMove();
ADDRGP4 PM_FlyMove
CALLV
pop
line 1957
;1957:	} else if (pm->ps->pm_flags & PMF_GRAPPLE_PULL) {
ADDRGP4 $701
JUMPV
LABELV $700
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $702
line 1958
;1958:		PM_GrappleMove();
ADDRGP4 PM_GrappleMove
CALLV
pop
line 1960
;1959:		// We can wiggle a bit
;1960:		PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 1961
;1961:	} else if (pm->ps->pm_flags & PMF_TIME_WATERJUMP) {
ADDRGP4 $703
JUMPV
LABELV $702
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $704
line 1962
;1962:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 1963
;1963:	} else if (pm->waterlevel > 1) {
ADDRGP4 $705
JUMPV
LABELV $704
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
LEI4 $706
line 1965
;1964:		// swimming
;1965:		PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 1966
;1966:	} else if (pml.walking) {
ADDRGP4 $707
JUMPV
LABELV $706
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $708
line 1968
;1967:		// walking on ground
;1968:		PM_WalkMove();
ADDRGP4 PM_WalkMove
CALLV
pop
line 1969
;1969:	} else {
ADDRGP4 $709
JUMPV
LABELV $708
line 1971
;1970:		// airborne
;1971:		PM_AirMove();
ADDRGP4 PM_AirMove
CALLV
pop
line 1972
;1972:	}
LABELV $709
LABELV $707
LABELV $705
LABELV $703
LABELV $701
line 1974
;1973:
;1974:	PM_Animate();
ADDRGP4 PM_Animate
CALLV
pop
line 1977
;1975:
;1976:	// set groundentity, watertype, and waterlevel
;1977:	PM_GroundTrace();
ADDRGP4 PM_GroundTrace
CALLV
pop
line 1978
;1978:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 1981
;1979:
;1980:	// weapons
;1981:	PM_Weapon();
ADDRGP4 PM_Weapon
CALLV
pop
line 1984
;1982:
;1983:	// torso animation
;1984:	PM_TorsoAnimation();
ADDRGP4 PM_TorsoAnimation
CALLV
pop
line 1987
;1985:
;1986:	// footstep events / legs animations
;1987:	PM_Footsteps();
ADDRGP4 PM_Footsteps
CALLV
pop
line 1992
;1988:
;1989:	// entering / leaving water splashes
;1990:	//PM_WaterEvents();
;1991:
;1992:	if (pm->ps->powerups[PW_FLIGHT] && !pml.groundPlane) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $711
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
NEI4 $711
line 1994
;1993:		// don't snap velocity in free-fly or we will be not able to stop via flight friction
;1994:		return;
ADDRGP4 $645
JUMPV
LABELV $711
line 1998
;1995:	}
;1996:
;1997:	// snap some parts of playerstate to save network bandwidth
;1998:	trap_SnapVector(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 1999
;1999:}
LABELV $645
endproc PmoveSingle 36 16
export Pmove
proc Pmove 16 4
line 2008
;2000:
;2001:/*
;2002:================
;2003:Pmove
;2004:
;2005:Can be called by either the server or the client
;2006:================
;2007:*/
;2008:void Pmove(pmove_t* pmove) {
line 2011
;2009:	int finalTime;
;2010:
;2011:	finalTime = pmove->cmd.serverTime;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2013
;2012:
;2013:	if (finalTime < pmove->ps->commandTime) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
GEI4 $715
line 2014
;2014:		return;  // should not happen
ADDRGP4 $714
JUMPV
LABELV $715
line 2017
;2015:	}
;2016:
;2017:	if (finalTime > pmove->ps->commandTime + 1000) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $717
line 2018
;2018:		pmove->ps->commandTime = finalTime - 1000;
ADDRFP4 0
INDIRP4
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 2019
;2019:	}
LABELV $717
line 2021
;2020:
;2021:	pmove->ps->pmove_framecount = (pmove->ps->pmove_framecount + 1) & ((1 << PS_PMOVEFRAMECOUNTBITS) - 1);
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 63
BANDI4
ASGNI4
line 2023
;2022:
;2023:	if (pmove->ps->pm_flags & PMF_RESPAWNED && pm_respawntimer == 0) {
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $722
ADDRGP4 pm_respawntimer
INDIRI4
CNSTI4 0
NEI4 $722
line 2024
;2024:		pm_respawntimer = NO_RESPAWN_OVERBOUNCE;
ADDRGP4 pm_respawntimer
CNSTI4 250
ASGNI4
line 2025
;2025:	}
ADDRGP4 $722
JUMPV
LABELV $721
line 2029
;2026:
;2027:	// chop the move up if it is too long, to prevent framerate
;2028:	// dependent behavior
;2029:	while (pmove->ps->commandTime != finalTime) {
line 2032
;2030:		int msec;
;2031:
;2032:		msec = finalTime - pmove->ps->commandTime;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 2034
;2033:
;2034:		if (pmove->pmove_fixed) {
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 0
EQI4 $724
line 2035
;2035:			if (msec > pmove->pmove_msec) {
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
LEI4 $725
line 2036
;2036:				msec = pmove->pmove_msec;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 2037
;2037:			}
line 2038
;2038:		} else {
ADDRGP4 $725
JUMPV
LABELV $724
line 2039
;2039:			if (msec > 66) {
ADDRLP4 8
INDIRI4
CNSTI4 66
LEI4 $728
line 2040
;2040:				msec = 66;
ADDRLP4 8
CNSTI4 66
ASGNI4
line 2041
;2041:			}
LABELV $728
line 2042
;2042:		}
LABELV $725
line 2043
;2043:		pmove->cmd.serverTime = pmove->ps->commandTime + msec;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 12
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 2044
;2044:		if (0) {
ADDRGP4 $730
JUMPV
line 2045
;2045:			PmoveSingle(pmove);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 PmoveSingle
CALLV
pop
line 2046
;2046:		}  // Uses all baseq3a default PM_ functions
ADDRGP4 $731
JUMPV
LABELV $730
line 2047
;2047:		else {
line 2048
;2048:			phy_PmoveSingle(pmove);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 phy_PmoveSingle
CALLV
pop
line 2049
;2049:		}  // Uses custom move code
LABELV $731
line 2051
;2050:
;2051:		if (pmove->ps->pm_flags & PMF_JUMP_HELD) {
ADDRFP4 0
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $732
line 2052
;2052:			pmove->cmd.upmove = 20;
ADDRFP4 0
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 20
ASGNI1
line 2053
;2053:		}
LABELV $732
line 2054
;2054:	}
LABELV $722
line 2029
ADDRFP4 0
INDIRP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $721
line 2056
;2055:	// PM_CheckStuck();
;2056:}
LABELV $714
endproc Pmove 16 4
export phy_init
proc phy_init 4 8
line 2058
;2057:
;2058:void     phy_init(int movetype) {
line 2060
;2059:		// Reset all values, in case each init function is missing any
;2060:    phy_reset();
ADDRGP4 phy_reset
CALLV
pop
line 2062
;2061:    // Initialize physics variables.
;2062:    switch (movetype) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $738
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $737
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $739
ADDRGP4 $735
JUMPV
LABELV $737
line 2064
;2063:    case VQ3:
;2064:        vq3_init();
ADDRGP4 vq3_init
CALLV
pop
line 2065
;2065:        break;
ADDRGP4 $736
JUMPV
LABELV $738
line 2067
;2066:    case CPM:
;2067:        cpm_init();
ADDRGP4 cpm_init
CALLV
pop
line 2068
;2068:        break;
ADDRGP4 $736
JUMPV
LABELV $739
line 2070
;2069:    case CQ3:
;2070:        cq3_init();
ADDRGP4 cq3_init
CALLV
pop
line 2071
;2071:        break;
ADDRGP4 $736
JUMPV
LABELV $735
line 2073
;2072:    default:
;2073:        Com_Printf("::ERR physics not initialized:  phy_movetype %i not recognized\n", movetype);
ADDRGP4 $740
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2074
;2074:        break;
LABELV $736
line 2076
;2075:    }
;2076:    Com_Printf("Initialized: phy_movetype %i\n", movetype);
ADDRGP4 $741
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2077
;2077:    phy_initialized = qtrue;
ADDRGP4 phy_initialized
CNSTI4 1
ASGNI4
line 2078
;2078:}
LABELV $734
endproc phy_init 4 8
proc VectorReflect_ 24 0
line 2090
;2079:
;2080:// VectorReflect
;2081:// =============
;2082:// PM_ClipVelocity = VelocityProject = Vector_RotateAndScale = Vector_ReflectAndScale
;2083://     Wrongly named "clip", due to doom naming inheritance.
;2084://     It no longer "clips" a vector, but instead reflects / projects it with a scale
;2085://     This is used when we want the player to not simply just go through a surface.
;2086://
;2087:// - Takes an incoming vector (in), and reflects it on a surface (normal), scaled by the desired amount (overbounce)
;2088://   This is also used to reflect vectors based on any other arbitrary vector
;2089://
;2090:static void VectorReflect_(vec3_t in, vec3_t normal, vec3_t out, float overbounce, int dimensions, qboolean onesided) {
line 2092
;2091:	// Calculate direction of rotation / reflection
;2092:	float backoff = DotProduct(in, normal);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 12
INDIRP4
INDIRF4
MULF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2095
;2093:	int i;
;2094:	// Scale the direction
;2095:	if (backoff < 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $743
line 2096
;2096:		backoff *= overbounce;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 2097
;2097:	} else {
ADDRGP4 $744
JUMPV
LABELV $743
line 2098
;2098:		if (!onesided) {
ADDRFP4 20
INDIRI4
CNSTI4 0
NEI4 $745
line 2099
;2099:			backoff /= overbounce;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
ASGNF4
line 2100
;2100:		}  // Standard behavior
ADDRGP4 $746
JUMPV
LABELV $745
line 2101
;2101:		else {
line 2102
;2102:			backoff = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 2103
;2103:		}  // Ignore backoff when moving away from the surface   dot(in, normal) = positive
LABELV $746
line 2104
;2104:	}
LABELV $744
line 2106
;2105:	// Apply scale to the vector
;2106:	for (i = 0; i < dimensions; i++) {  // Will ignore Z when dimensions set to 2
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $750
JUMPV
LABELV $747
line 2107
;2107:		float change = normal[i] * backoff;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 2108
;2108:		out[i]       = in[i] - change;  // An overbounce value of 1.000 completely negates incoming velocity, due to this line
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
line 2109
;2109:	}
LABELV $748
line 2106
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $750
ADDRLP4 0
INDIRI4
ADDRFP4 16
INDIRI4
LTI4 $747
line 2110
;2110:}
LABELV $742
endproc VectorReflect_ 24 0
export VectorReflect
proc VectorReflect 0 24
line 2112
;2111:// VectorReflect: Standard Behavior (Unmodded Q3A)
;2112:void VectorReflect(vec3_t in, vec3_t normal, vec3_t out, float overbounce) {
line 2113
;2113:	VectorReflect_(in, normal, out, overbounce, 3, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 VectorReflect_
CALLV
pop
line 2114
;2114:}
LABELV $751
endproc VectorReflect 0 24
export VectorReflect2D
proc VectorReflect2D 0 24
line 2116
;2115:// VectorReflect: Horizontal Only
;2116:void VectorReflect2D(vec3_t in, vec3_t normal, vec3_t out, float overbounce) {
line 2117
;2117:	VectorReflect_(in, normal, out, overbounce, 2, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 VectorReflect_
CALLV
pop
line 2118
;2118:}
LABELV $752
endproc VectorReflect2D 0 24
export VectorReflectOS
proc VectorReflectOS 0 24
line 2121
;2119:// VectorReflect: One Sided
;2120://   Doesn't affect the vector, when we are moving away from the surface   dot(in, normal) = positive
;2121:void VectorReflectOS(vec3_t in, vec3_t normal, vec3_t out, float overbounce) {
line 2122
;2122:	VectorReflect_(in, normal, out, overbounce, 3, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
CNSTI4 3
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 VectorReflect_
CALLV
pop
line 2123
;2123:}
LABELV $753
endproc VectorReflectOS 0 24
export VectorReflectBC
proc VectorReflectBC 0 24
line 2126
;2124:// VectorReflect: Bouncy
;2125://   Increases incoming overbounce value
;2126:void VectorReflectBC(vec3_t in, vec3_t normal, vec3_t out, float overbounce) {
line 2127
;2127:	VectorReflect_(in, normal, out, overbounce + 1, 3, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
ADDF4
ARGF4
CNSTI4 3
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 VectorReflect_
CALLV
pop
line 2128
;2128:}
LABELV $754
endproc VectorReflectBC 0 24
export core_GroundTrace
proc core_GroundTrace 8 0
line 2136
;2129:
;2130:// Ground Trace
;2131://   OBfix is applied here
;2132:// Forward declare
;2133:void q3a_GroundTrace(void);
;2134:void new_GroundTrace(void);
;2135:// Select type
;2136:void core_GroundTrace(void) {
line 2137
;2137:	switch (pm->movetype) {
ADDRLP4 0
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $759
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $760
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $761
ADDRGP4 $757
JUMPV
LABELV $759
line 2139
;2138:	case CPM:
;2139:		q3a_GroundTrace();
ADDRGP4 q3a_GroundTrace
CALLV
pop
line 2140
;2140:		break;
ADDRGP4 $757
JUMPV
LABELV $760
line 2142
;2141:	case VQ3:
;2142:		q3a_GroundTrace();
ADDRGP4 q3a_GroundTrace
CALLV
pop
line 2143
;2143:		break;
ADDRGP4 $757
JUMPV
LABELV $761
line 2145
;2144:	case CQ3:
;2145:		q3a_GroundTrace();
ADDRGP4 q3a_GroundTrace
CALLV
pop
line 2146
;2146:		break;
line 2148
;2147:	default:
;2148:		break;
LABELV $757
line 2150
;2149:	}
;2150:}
LABELV $755
endproc core_GroundTrace 8 0
export q3a_GroundTrace
proc q3a_GroundTrace 84 28
line 2152
;2151:// Unmodded Q3A version
;2152:void q3a_GroundTrace(void) {
line 2156
;2153:	vec3_t  point;
;2154:	trace_t trace;
;2155:
;2156:	point[0] = pm->ps->origin[0];
ADDRLP4 56
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 2157
;2157:	point[1] = pm->ps->origin[1];
ADDRLP4 56+4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 2158
;2158:	point[2] = pm->ps->origin[2] - 0.25;
ADDRLP4 56+8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1048576000
SUBF4
ASGNF4
line 2160
;2159:
;2160:	pm->trace(&trace, pm->ps->origin, pm->mins, pm->maxs, point, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 68
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 68
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 2161
;2161:	pml.groundTrace = trace;
ADDRGP4 pml+52
ADDRLP4 0
INDIRB
ASGNB 56
line 2164
;2162:
;2163:	// do something corrective if the trace starts in a solid...
;2164:	if (trace.allsolid) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $766
line 2165
;2165:		if (!PM_CorrectAllSolid(&trace)) {
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 PM_CorrectAllSolid
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $768
line 2166
;2166:			return;
ADDRGP4 $762
JUMPV
LABELV $768
line 2168
;2167:		}
;2168:	}
LABELV $766
line 2170
;2169:	// if the trace didn't hit anything, we are in free fall
;2170:	if (trace.fraction == 1.0) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $770
line 2171
;2171:		PM_GroundTraceMissed();
ADDRGP4 PM_GroundTraceMissed
CALLV
pop
line 2172
;2172:		pml.groundPlane = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 2173
;2173:		pml.walking     = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2174
;2174:		return;
ADDRGP4 $762
JUMPV
LABELV $770
line 2177
;2175:	}
;2176:	// check if getting thrown off the ground
;2177:	if (pm->ps->velocity[2] > 0 && DotProduct(pm->ps->velocity, trace.plane.normal) > 10) {
ADDRLP4 76
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $775
ADDRLP4 76
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+24
INDIRF4
MULF4
ADDRLP4 76
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 76
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 0+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 1092616192
LEF4 $775
line 2178
;2178:		if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $782
line 2179
;2179:			Com_Printf("%i:kickoff\n", c_pmove);
ADDRGP4 $452
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2180
;2180:		}
LABELV $782
line 2182
;2181:		// go into jump animation
;2182:		if (pm->cmd.forwardmove >= 0) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $784
line 2183
;2183:			PM_ForceLegsAnim(LEGS_JUMP);
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 2184
;2184:			pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 2185
;2185:		} else {
ADDRGP4 $785
JUMPV
LABELV $784
line 2186
;2186:			PM_ForceLegsAnim(LEGS_JUMPB);
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 2187
;2187:			pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2188
;2188:		}
LABELV $785
line 2189
;2189:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 2190
;2190:		pml.groundPlane         = qfalse;
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 2191
;2191:		pml.walking             = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2192
;2192:		return;
ADDRGP4 $762
JUMPV
LABELV $775
line 2196
;2193:	}
;2194:
;2195:	// slopes that are too steep will not be considered onground
;2196:	if (trace.plane.normal[2] < MIN_WALK_NORMAL) {
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1060320051
GEF4 $788
line 2197
;2197:		if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $792
line 2198
;2198:			Com_Printf("%i:steep\n", c_pmove);
ADDRGP4 $463
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2199
;2199:		}
LABELV $792
line 2201
;2200:		// FIXME: if they can't slide down the slope, let them walk (sharp crevices)
;2201:		pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 2202
;2202:		pml.groundPlane         = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 2203
;2203:		pml.walking             = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2204
;2204:		return;
ADDRGP4 $762
JUMPV
LABELV $788
line 2207
;2205:	}
;2206:
;2207:	pml.groundPlane = qtrue;
ADDRGP4 pml+48
CNSTI4 1
ASGNI4
line 2208
;2208:	pml.walking     = qtrue;
ADDRGP4 pml+44
CNSTI4 1
ASGNI4
line 2211
;2209:
;2210:	// hitting solid ground will end a waterjump
;2211:	if (pm->ps->pm_flags & PMF_TIME_WATERJUMP) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $798
line 2212
;2212:		pm->ps->pm_flags &= ~(PMF_TIME_WATERJUMP | PMF_TIME_LAND);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 -289
BANDI4
ASGNI4
line 2213
;2213:		pm->ps->pm_time = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 2214
;2214:	}
LABELV $798
line 2216
;2215:
;2216:	if (pm->ps->groundEntityNum == ENTITYNUM_NONE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $800
line 2218
;2217:		// just hit the ground
;2218:		if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $802
line 2219
;2219:			Com_Printf("%i:Land\n", c_pmove);
ADDRGP4 $474
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2220
;2220:		}
LABELV $802
line 2221
;2221:		PM_CrashLand();
ADDRGP4 PM_CrashLand
CALLV
pop
line 2224
;2222:
;2223:		// OBfix Reflect velocity on floor normal when landing
;2224:		if (pml.groundTrace.surfaceFlags & SURF_NOOB) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $804
line 2225
;2225:			VectorReflect(pm->ps->velocity, trace.plane.normal, pm->ps->velocity, OVERCLIP);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 VectorReflect
CALLV
pop
line 2226
;2226:		}
LABELV $804
line 2229
;2227:
;2228:		//don't do landing time if we were just going down a slope
;2229:		if (pml.previous_velocity[2] < -200) {
ADDRGP4 pml+124+8
INDIRF4
CNSTF4 3276275712
GEF4 $809
line 2231
;2230:			//don't allow another jump for a little while
;2231:			pm->ps->pm_flags != PMF_TIME_LAND;
line 2232
;2232:			pm->ps->pm_time = 250;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 250
ASGNI4
line 2233
;2233:		}
LABELV $809
line 2234
;2234:	}
LABELV $800
line 2236
;2235:
;2236:	pm->ps->groundEntityNum = trace.entityNum;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 2239
;2237:
;2238:	// OBfix Remove vertical OBs from Flat surfaces
;2239:	if (pml.groundTrace.surfaceFlags & SURF_NOOB && trace.plane.normal[2] == 1.0f) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $814
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1065353216
NEF4 $814
line 2240
;2240:		pm->ps->velocity[2] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 2241
;2241:	}
LABELV $814
line 2243
;2242:
;2243:	PM_AddTouchEnt(trace.entityNum);
ADDRLP4 0+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 2244
;2244:}
LABELV $762
endproc q3a_GroundTrace 84 28
export core_CmdScale
proc core_CmdScale 48 4
line 2252
;2245:
;2246://:::::::::::::::::::::::::::::::::::::::::
;2247:// core_CmdScale
;2248://   Scale factor to apply to inputs (cmd).
;2249://   Modified to (optionally) allow fixing slowdown when holding jump.
;2250://   fix = Input scaling fix (active/inactive). For fixing slowdown on jump-hold
;2251://   .. fix is ignored for VQ3/CPM
;2252:float core_CmdScale(usercmd_t* cmd, qboolean fix) {
line 2254
;2253:	// Aliases, for readability
;2254:	float fmove = (float)abs(cmd->forwardmove);
ADDRFP4 0
INDIRP4
CNSTI4 21
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
CVIF4 4
ASGNF4
line 2255
;2255:	float smove = (float)abs(cmd->rightmove);
ADDRFP4 0
INDIRP4
CNSTI4 22
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 24
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
CVIF4 4
ASGNF4
line 2256
;2256:	float umove = (float)abs(cmd->upmove);
ADDRFP4 0
INDIRP4
CNSTI4 23
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 28
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
CVIF4 4
ASGNF4
line 2261
;2257:	int max;
;2258:	float total;
;2259:
;2260:	// Select maximum input value (absolute)
;2261:	max = fmove;
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 2262
;2262:	if (smove > max) {
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
LEF4 $822
line 2263
;2263:		max = smove;
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 2264
;2264:	}
LABELV $822
line 2265
;2265:	if (umove > max && !fix) {
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
LEF4 $824
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $824
line 2266
;2266:		max = umove;
ADDRLP4 0
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 2267
;2267:	}  // Ignore umove for scalefix
LABELV $824
line 2268
;2268:	if (!max) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $826
line 2269
;2269:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $821
JUMPV
LABELV $826
line 2274
;2270:	}
;2271:
;2272:	// Calculate total input value
;2273:	
;2274:	if (fix) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $828
line 2275
;2275:		total = sqrt(fmove * fmove + smove * smove);
ADDRLP4 8
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 40
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 40
INDIRF4
ASGNF4
line 2276
;2276:	}  // Ignore umove for scalefix
ADDRGP4 $829
JUMPV
LABELV $828
line 2277
;2277:	else {
line 2278
;2278:		total = sqrt(fmove * fmove + smove * smove + umove * umove);
ADDRLP4 8
INDIRF4
ADDRLP4 8
INDIRF4
MULF4
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDF4
ADDRLP4 12
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 44
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 44
INDIRF4
ASGNF4
line 2279
;2279:	}
LABELV $829
line 2282
;2280:
;2281:	// Calculate scale value and return it
;2282:	return (float)pm->ps->speed * max / (127.0 * total);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRI4
CVIF4 4
MULF4
ADDRLP4 16
INDIRF4
CNSTF4 1123942400
MULF4
DIVF4
RETF4
LABELV $821
endproc core_CmdScale 48 4
export core_Accelerate
proc core_Accelerate 52 0
line 2286
;2283:}
;2284:
;2285:// Changed from q3a-gpl behavior to include basespeed.
;2286:void core_Accelerate(vec3_t wishdir, float wishspeed, float accel, float basespeed) {
line 2288
;2287:	// Clamp wishpeed to a maximum of basespeed
;2288:	float wishspeed_c = wishspeed;  // Initialize clamped wishspeed
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
line 2295
;2289:	float currentspeed;
;2290:	float addspeed;
;2291:	float accelspeed;	
;2292:	vec3_t accelVelocity;
;2293:	int i;
;2294:
;2295:	if (wishspeed_c > basespeed) {
ADDRLP4 20
INDIRF4
ADDRFP4 12
INDIRF4
LEF4 $831
line 2296
;2296:		wishspeed_c = basespeed;
ADDRLP4 20
ADDRFP4 12
INDIRF4
ASGNF4
line 2297
;2297:	}
LABELV $831
line 2299
;2298:	// Determine veer amount
;2299:	currentspeed = DotProduct(pm->ps->velocity, wishdir);
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 32
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
INDIRF4
MULF4
ADDRLP4 32
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 32
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2301
;2300:	// See how much to add
;2301:	addspeed = wishspeed_c - currentspeed;
ADDRLP4 24
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
line 2303
;2302:	// If not adding any, done.
;2303:	if (addspeed <= 0) {
ADDRLP4 24
INDIRF4
CNSTF4 0
GTF4 $833
line 2304
;2304:		return;
ADDRGP4 $830
JUMPV
LABELV $833
line 2307
;2305:	}
;2306:	// Acceleration speed to add after accel
;2307:	accelspeed = accel * wishspeed_c * pml.frametime;
ADDRLP4 16
ADDRFP4 8
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ASGNF4
line 2309
;2308:	// Cap it
;2309:	if (accelspeed > addspeed) {
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
LEF4 $836
line 2310
;2310:		accelspeed = addspeed;
ADDRLP4 16
ADDRLP4 24
INDIRF4
ASGNF4
line 2311
;2311:	}
LABELV $836
line 2314
;2312:
;2313:	// Adjust player velocity
;2314:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $838
line 2315
;2315:		accelVelocity[i] = accelspeed * wishdir[i];  // dir*speed = velocity
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
MULF4
ASGNF4
line 2316
;2316:		pm->ps->velocity[i] += accelVelocity[i];     // Vector addition, the typical visualization explained in videos of strafing math theory
ADDRLP4 48
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2317
;2317:	}
LABELV $839
line 2314
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $838
line 2318
;2318:}
LABELV $830
endproc core_Accelerate 52 0
export core_Friction
proc core_Friction 48 4
line 2320
;2319:
;2320:void core_Friction(void) {
line 2322
;2321:	vec3_t vec;
;2322:	float* vel = pm->ps->velocity;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
line 2327
;2323:	float drop;
;2324:	float newspeed, control;
;2325:	float speed;
;2326:
;2327:	VectorCopy(vel, vec);
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 12
line 2329
;2328:
;2329:	if (pml.walking) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $843
line 2330
;2330:		vec[2] = 0;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 2331
;2331:	}  // ignore slope movement
LABELV $843
line 2333
;2332:
;2333:	speed = VectorLength(vec);
ADDRLP4 16
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 2335
;2334:	// allow sinking underwater   FIXME: still have z friction underwater?
;2335:	if (speed < 1) {
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
GEF4 $847
line 2336
;2336:		vel[0] = 0;
ADDRLP4 0
INDIRP4
CNSTF4 0
ASGNF4
line 2337
;2337:		vel[1] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 2338
;2338:		return;
ADDRGP4 $842
JUMPV
LABELV $847
line 2340
;2339:	}
;2340:	drop = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 2343
;2341:	// apply ground friction
;2342:
;2343:	if (pm->waterlevel <= 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
GTI4 $849
line 2344
;2344:		if (pml.walking && !(pml.groundTrace.surfaceFlags & SURF_SLICK)) {
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $851
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $851
line 2345
;2345:			if (!(pm->ps->pm_flags & PMF_TIME_KNOCKBACK)) {  // if getting knocked back, no friction
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
NEI4 $856
line 2346
;2346:				control = speed < phy_stopspeed ? phy_stopspeed : speed;
ADDRLP4 8
INDIRF4
ADDRGP4 phy_stopspeed
INDIRF4
GEF4 $859
ADDRLP4 36
ADDRGP4 phy_stopspeed
INDIRF4
ASGNF4
ADDRGP4 $860
JUMPV
LABELV $859
ADDRLP4 36
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $860
ADDRLP4 28
ADDRLP4 36
INDIRF4
ASGNF4
line 2347
;2347:				drop += control * phy_friction * pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
ADDRGP4 phy_friction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 2348
;2348:			}
LABELV $856
line 2349
;2349:		}
LABELV $851
line 2350
;2350:	}
LABELV $849
line 2352
;2351:	// apply water friction even if just wading
;2352:	if (pm->waterlevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
EQI4 $862
line 2353
;2353:		drop += speed * phy_water_friction * pm->waterlevel * pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 phy_water_friction
INDIRF4
MULF4
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CVIF4 4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 2354
;2354:	}
LABELV $862
line 2356
;2355:	// apply flying friction
;2356:	if (pm->ps->powerups[PW_FLIGHT]) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $865
line 2357
;2357:		drop += speed * phy_fly_friction * pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 phy_fly_friction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 2358
;2358:	}
LABELV $865
line 2359
;2359:	if (pm->ps->pm_type == PM_SPECTATOR) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $868
line 2360
;2360:		drop += speed * phy_spectator_friction * pml.frametime;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 phy_spectator_friction
INDIRF4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ADDF4
ASGNF4
line 2361
;2361:	}
LABELV $868
line 2364
;2362:
;2363:	// scale the velocity
;2364:	newspeed = speed - drop;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 2365
;2365:	if (newspeed < 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
GEF4 $871
line 2366
;2366:		newspeed = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 2367
;2367:	}
LABELV $871
line 2368
;2368:	newspeed /= speed;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
ASGNF4
line 2369
;2369:	VectorScale(vel, newspeed, vel);
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ASGNF4
line 2370
;2370:}
LABELV $842
endproc core_Friction 48 4
proc core_FinishWeaponChange 20 4
line 2372
;2371:
;2372:static void core_FinishWeaponChange(void) {
line 2373
;2373:	int weapon = pm->cmd.weapon;
ADDRLP4 0
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 2374
;2374:	if (weapon < WP_NONE || weapon >= WP_NUM_WEAPONS) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $876
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $874
LABELV $876
line 2375
;2375:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2376
;2376:	}
LABELV $874
line 2377
;2377:	if (!(pm->ps->stats[STAT_WEAPONS] & (1 << weapon))) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $877
line 2378
;2378:		weapon = WP_NONE;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2379
;2379:	}
LABELV $877
line 2381
;2380:
;2381:	pm->ps->weapon      = weapon;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 2382
;2382:	pm->ps->weaponstate = WEAPON_RAISING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1
ASGNI4
line 2383
;2383:	pm->ps->weaponTime += pm->movetype == CPM ? 0 : 250;  // Instant weapon switch for cpm
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $880
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $881
JUMPV
LABELV $880
ADDRLP4 8
CNSTI4 250
ASGNI4
LABELV $881
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 2384
;2384:	PM_StartTorsoAnim(TORSO_RAISE);
CNSTI4 10
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2385
;2385:}
LABELV $873
endproc core_FinishWeaponChange 20 4
proc core_BeginWeaponChange 16 4
line 2387
;2386:
;2387:static void core_BeginWeaponChange(int weapon) {
line 2388
;2388:	if (weapon <= WP_NONE || weapon >= WP_NUM_WEAPONS) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $885
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $883
LABELV $885
line 2389
;2389:		return;
ADDRGP4 $882
JUMPV
LABELV $883
line 2391
;2390:	}
;2391:	if (!(pm->ps->stats[STAT_WEAPONS] & (1 << weapon))) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $886
line 2392
;2392:		return;
ADDRGP4 $882
JUMPV
LABELV $886
line 2394
;2393:	}
;2394:	if (pm->ps->weaponstate == WEAPON_DROPPING) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $888
line 2395
;2395:		return;
ADDRGP4 $882
JUMPV
LABELV $888
line 2398
;2396:	}
;2397:
;2398:	PM_AddEvent(EV_CHANGE_WEAPON);
CNSTI4 22
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2399
;2399:	pm->ps->weaponstate = WEAPON_DROPPING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 2
ASGNI4
line 2400
;2400:	pm->ps->weaponTime += pm->movetype == CPM ? 0 : 250;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $891
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $892
JUMPV
LABELV $891
ADDRLP4 4
CNSTI4 250
ASGNI4
LABELV $892
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 2401
;2401:	PM_StartTorsoAnim(TORSO_DROP);
CNSTI4 9
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2402
;2402:}
LABELV $882
endproc core_BeginWeaponChange 16 4
export core_Weapon
proc core_Weapon 28 4
line 2404
;2403:
;2404:void core_Weapon(void) {
line 2409
;2405:
;2406:	int addTime;
;2407:
;2408:	// don't allow attack until all buttons are up
;2409:	if (pm->ps->pm_flags & PMF_RESPAWNED) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $894
line 2410
;2410:		return;
ADDRGP4 $893
JUMPV
LABELV $894
line 2413
;2411:	}
;2412:	// ignore if spectator
;2413:	if (pm->ps->persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
NEI4 $896
line 2414
;2414:		return;
ADDRGP4 $893
JUMPV
LABELV $896
line 2417
;2415:	}
;2416:	// check for dead player
;2417:	if (pm->ps->stats[STAT_HEALTH] <= 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $898
line 2418
;2418:		pm->ps->weapon = WP_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 0
ASGNI4
line 2419
;2419:		return;
ADDRGP4 $893
JUMPV
LABELV $898
line 2422
;2420:	}
;2421:	// check for item using
;2422:	if (pm->cmd.buttons & BUTTON_USE_HOLDABLE) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $900
line 2423
;2423:		if (!(pm->ps->pm_flags & PMF_USE_ITEM_HELD)) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $901
line 2424
;2424:			if (bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag == HI_MEDKIT && pm->ps->stats[STAT_HEALTH] >= (pm->ps->stats[STAT_MAX_HEALTH] + 25)) {
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
NEI4 $904
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
LTI4 $904
line 2426
;2425:				// don't use medkit if at max health
;2426:			} else {
ADDRGP4 $893
JUMPV
LABELV $904
line 2427
;2427:				pm->ps->pm_flags |= PMF_USE_ITEM_HELD;
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 2428
;2428:				PM_AddEvent(EV_USE_ITEM0 + bg_itemlist[pm->ps->stats[STAT_HOLDABLE_ITEM]].giTag);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 24
ADDI4
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2429
;2429:				pm->ps->stats[STAT_HOLDABLE_ITEM] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 2430
;2430:			}
line 2431
;2431:			return;
ADDRGP4 $893
JUMPV
line 2433
;2432:		}
;2433:	} else {
LABELV $900
line 2434
;2434:		pm->ps->pm_flags &= ~PMF_USE_ITEM_HELD;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 2435
;2435:	}
LABELV $901
line 2438
;2436:
;2437:	// make weapon function
;2438:	if (pm->ps->weaponTime > 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $908
line 2439
;2439:		pm->ps->weaponTime -= pml.msec;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 pml+40
INDIRI4
SUBI4
ASGNI4
line 2440
;2440:	}
LABELV $908
line 2445
;2441:
;2442:	// check for weapon change
;2443:	// can't change if weapon is firing, but can change
;2444:	// again if lowering or raising
;2445:	if (pm->ps->weaponTime <= 0 || pm->ps->weaponstate != WEAPON_FIRING) {
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $913
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 3
EQI4 $911
LABELV $913
line 2446
;2446:		if (pm->ps->weapon != pm->cmd.weapon) {
ADDRLP4 8
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
EQI4 $914
line 2447
;2447:			core_BeginWeaponChange(pm->cmd.weapon);
ADDRGP4 pm
INDIRP4
CNSTI4 24
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRGP4 core_BeginWeaponChange
CALLV
pop
line 2448
;2448:		}
LABELV $914
line 2449
;2449:	}
LABELV $911
line 2450
;2450:	if (pm->ps->weaponTime > 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
LEI4 $916
line 2451
;2451:		return;
ADDRGP4 $893
JUMPV
LABELV $916
line 2455
;2452:	}
;2453:
;2454:	// change weapon if time
;2455:	if (pm->ps->weaponstate == WEAPON_DROPPING) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $918
line 2456
;2456:		core_FinishWeaponChange();
ADDRGP4 core_FinishWeaponChange
CALLV
pop
line 2457
;2457:		return;
ADDRGP4 $893
JUMPV
LABELV $918
line 2460
;2458:	}
;2459:
;2460:	if (pm->ps->weaponstate == WEAPON_RAISING) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1
NEI4 $920
line 2461
;2461:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2462
;2462:		if (pm->ps->weapon == WP_GAUNTLET) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $922
line 2463
;2463:			PM_StartTorsoAnim(TORSO_STAND2);
CNSTI4 12
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2464
;2464:		} else {
ADDRGP4 $893
JUMPV
LABELV $922
line 2465
;2465:			PM_StartTorsoAnim(TORSO_STAND);
CNSTI4 11
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2466
;2466:		}
line 2467
;2467:		return;
ADDRGP4 $893
JUMPV
LABELV $920
line 2471
;2468:	}
;2469:
;2470:	// check for fire
;2471:	if (!(pm->cmd.buttons & BUTTON_ATTACK)) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $924
line 2472
;2472:		pm->ps->weaponTime  = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 2473
;2473:		pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2474
;2474:		return;
ADDRGP4 $893
JUMPV
LABELV $924
line 2478
;2475:	}
;2476:
;2477:	// start the animation even if out of ammo
;2478:	if (pm->ps->weapon == WP_GAUNTLET) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $926
line 2480
;2479:		// the guantlet only "fires" when it actually hits something
;2480:		if (!pm->gauntletHit) {
ADDRGP4 pm
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $928
line 2481
;2481:			pm->ps->weaponTime  = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 2482
;2482:			pm->ps->weaponstate = WEAPON_READY;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 2483
;2483:			return;
ADDRGP4 $893
JUMPV
LABELV $928
line 2485
;2484:		}
;2485:		PM_StartTorsoAnim(TORSO_ATTACK2);
CNSTI4 8
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2486
;2486:	} else {
ADDRGP4 $927
JUMPV
LABELV $926
line 2487
;2487:		PM_StartTorsoAnim(TORSO_ATTACK);
CNSTI4 7
ARGI4
ADDRGP4 PM_StartTorsoAnim
CALLV
pop
line 2488
;2488:	}
LABELV $927
line 2490
;2489:
;2490:	pm->ps->weaponstate = WEAPON_FIRING;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 3
ASGNI4
line 2493
;2491:
;2492:	// check for out of ammo
;2493:	if (!pm->ps->ammo[pm->ps->weapon]) {
ADDRLP4 8
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $930
line 2494
;2494:		PM_AddEvent(EV_NOAMMO);
CNSTI4 21
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2495
;2495:		pm->ps->weaponTime += 500;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 500
ADDI4
ASGNI4
line 2496
;2496:		return;
ADDRGP4 $893
JUMPV
LABELV $930
line 2500
;2497:	}
;2498:
;2499:	// take an ammo away if not infinite
;2500:	if (pm->ps->ammo[pm->ps->weapon] != -1) {
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $932
line 2501
;2501:		pm->ps->ammo[pm->ps->weapon]--;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 376
ADDP4
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 2502
;2502:	}
LABELV $932
line 2505
;2503:
;2504:	// fire weapon
;2505:	PM_AddEvent(EV_FIRE_WEAPON);
CNSTI4 23
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2507
;2506:
;2507:	switch (pm->ps->weapon) {
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 1
LTI4 $934
ADDRLP4 16
INDIRI4
CNSTI4 10
GTI4 $934
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $947-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $947
address $937
address $940
address $939
address $941
address $942
address $938
address $944
address $943
address $945
address $946
code
LABELV $934
LABELV $937
line 2510
;2508:	default:
;2509:	case WP_GAUNTLET:
;2510:		addTime = 400;
ADDRLP4 0
CNSTI4 400
ASGNI4
line 2511
;2511:		break;
ADDRGP4 $935
JUMPV
LABELV $938
line 2513
;2512:	case WP_LIGHTNING:
;2513:		addTime = 50;
ADDRLP4 0
CNSTI4 50
ASGNI4
line 2514
;2514:		break;
ADDRGP4 $935
JUMPV
LABELV $939
line 2516
;2515:	case WP_SHOTGUN:
;2516:		addTime = 1000;
ADDRLP4 0
CNSTI4 1000
ASGNI4
line 2517
;2517:		break;
ADDRGP4 $935
JUMPV
LABELV $940
line 2519
;2518:	case WP_MACHINEGUN:
;2519:		addTime = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 2520
;2520:		break;
ADDRGP4 $935
JUMPV
LABELV $941
line 2522
;2521:	case WP_GRENADE_LAUNCHER:
;2522:		addTime = 800;
ADDRLP4 0
CNSTI4 800
ASGNI4
line 2523
;2523:		break;
ADDRGP4 $935
JUMPV
LABELV $942
line 2525
;2524:	case WP_ROCKET_LAUNCHER:
;2525:		addTime = 800;
ADDRLP4 0
CNSTI4 800
ASGNI4
line 2526
;2526:		break;
ADDRGP4 $935
JUMPV
LABELV $943
line 2528
;2527:	case WP_PLASMAGUN:
;2528:		addTime = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 2529
;2529:		break;
ADDRGP4 $935
JUMPV
LABELV $944
line 2531
;2530:	case WP_RAILGUN:
;2531:		addTime = 1500;
ADDRLP4 0
CNSTI4 1500
ASGNI4
line 2532
;2532:		break;
ADDRGP4 $935
JUMPV
LABELV $945
line 2534
;2533:	case WP_BFG:
;2534:		addTime = 200;
ADDRLP4 0
CNSTI4 200
ASGNI4
line 2535
;2535:		break;
ADDRGP4 $935
JUMPV
LABELV $946
line 2537
;2536:	case WP_GRAPPLING_HOOK:
;2537:		addTime = 400;
ADDRLP4 0
CNSTI4 400
ASGNI4
line 2538
;2538:		break;
LABELV $935
line 2560
;2539:
;2540:#ifdef TEAMARENA
;2541:	case WP_NAILGUN:
;2542:		addTime = 1000;
;2543:		break;
;2544:	case WP_PROX_LAUNCHER:
;2545:		addTime = 800;
;2546:		break;
;2547:	case WP_CHAINGUN:
;2548:		addTime = 30;
;2549:		break;
;2550:#endif
;2551:	}
;2552:
;2553:#ifdef TEAMARENA
;2554:	if (bg_itemlist[pm->ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT) {
;2555:		addTime /= 1.5;
;2556:	} else if (bg_itemlist[pm->ps->stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN) {
;2557:		addTime /= 1.3;
;2558:	} else
;2559:#endif
;2560:		if (pm->ps->powerups[PW_HASTE]) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $949
line 2561
;2561:		addTime /= 1.3;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1061481551
MULF4
CVFI4 4
ASGNI4
line 2562
;2562:	}
LABELV $949
line 2563
;2563:	pm->ps->weaponTime += addTime;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 2564
;2564:}
LABELV $893
endproc core_Weapon 28 4
export phy_PmoveSingle
proc phy_PmoveSingle 36 16
line 2569
;2565:
;2566://================
;2567:// PmoveSingle
;2568://================
;2569:void phy_PmoveSingle(pmove_t* pmove) {
line 2571
;2570:	// Initialize
;2571:	pm = pmove;
ADDRGP4 pm
ADDRFP4 0
INDIRP4
ASGNP4
line 2574
;2572:	// this counter lets us debug movement problems with a journal
;2573:	// by setting a conditional breakpoint for the previous frame
;2574:	c_pmove++;
ADDRLP4 0
ADDRGP4 c_pmove
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2576
;2575:	// clear results
;2576:	pm->numtouch   = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 2577
;2577:	pm->watertype  = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 0
ASGNI4
line 2578
;2578:	pm->waterlevel = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 2581
;2579:
;2580:	// corpses can fly through bodies
;2581:	if (pm->ps->stats[STAT_HEALTH] <= 0) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $952
line 2582
;2582:		pm->tracemask &= ~CONTENTS_BODY;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -33554433
BANDI4
ASGNI4
line 2583
;2583:	}
LABELV $952
line 2585
;2584:	// make sure walking button is clear if running, avoids proxy no-footsteps cheats
;2585:	if (abs(pm->cmd.forwardmove) > 64 || abs(pm->cmd.rightmove) > 64) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 64
GTI4 $956
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LEI4 $954
LABELV $956
line 2586
;2586:		pm->cmd.buttons &= ~BUTTON_WALKING;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 2587
;2587:	}
LABELV $954
line 2589
;2588:	// set the talk balloon flag
;2589:	if (pm->cmd.buttons & BUTTON_TALK) {
ADDRGP4 pm
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $957
line 2590
;2590:		pm->ps->eFlags |= EF_TALK;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 2591
;2591:	} else {
ADDRGP4 $958
JUMPV
LABELV $957
line 2592
;2592:		pm->ps->eFlags &= ~EF_TALK;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 2593
;2593:	}
LABELV $958
line 2595
;2594:	// set the firing flag for continuous beam weapons
;2595:	if (!(pm->ps->pm_flags & PMF_RESPAWNED) && pm->ps->pm_type != PM_INTERMISSION && pm->ps->pm_type != PM_NOCLIP && (pm->cmd.buttons & BUTTON_ATTACK) &&
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
NEI4 $959
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $959
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $959
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $959
ADDRLP4 16
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 16
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $959
line 2596
;2596:	    pm->ps->ammo[pm->ps->weapon]) {
line 2597
;2597:		pm->ps->eFlags |= EF_FIRING;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2598
;2598:	} else {
ADDRGP4 $960
JUMPV
LABELV $959
line 2599
;2599:		pm->ps->eFlags &= ~EF_FIRING;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -257
BANDI4
ASGNI4
line 2600
;2600:	}
LABELV $960
line 2602
;2601:	// clear the respawned flag if attack and use are cleared
;2602:	if (pm->ps->stats[STAT_HEALTH] > 0 && !(pm->cmd.buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE))) {
ADDRLP4 20
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $961
ADDRLP4 20
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
NEI4 $961
line 2603
;2603:		pm->ps->pm_flags &= ~PMF_RESPAWNED;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 -513
BANDI4
ASGNI4
line 2604
;2604:	}
LABELV $961
line 2607
;2605:
;2606:	// if talk button is down, disallow all other input. Prevents potential intercept proxies from adding fake talk balloons
;2607:	if (pmove->cmd.buttons & BUTTON_TALK) {
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $963
line 2609
;2608:		// keep talk button set, for when cmd.serverTime > 66 msec and the same cmd is used multiple times in Pmove
;2609:		pmove->cmd.buttons     = BUTTON_TALK;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 2
ASGNI4
line 2610
;2610:		pmove->cmd.forwardmove = 0;
ADDRFP4 0
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 2611
;2611:		pmove->cmd.rightmove   = 0;
ADDRFP4 0
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 2612
;2612:		pmove->cmd.upmove      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 2613
;2613:	}
LABELV $963
line 2615
;2614:	// clear all pmove local vars
;2615:	memset(&pml, 0, sizeof(pml));
ADDRGP4 pml
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2617
;2616:	// determine the time
;2617:	pml.msec = pmove->cmd.serverTime - pm->ps->commandTime;
ADDRGP4 pml+40
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 pm
INDIRP4
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 2618
;2618:	if (pml.msec < 1) {
ADDRGP4 pml+40
INDIRI4
CNSTI4 1
GEI4 $966
line 2619
;2619:		pml.msec = 1;
ADDRGP4 pml+40
CNSTI4 1
ASGNI4
line 2620
;2620:	} else if (pml.msec > 200) {
ADDRGP4 $967
JUMPV
LABELV $966
ADDRGP4 pml+40
INDIRI4
CNSTI4 200
LEI4 $970
line 2621
;2621:		pml.msec = 200;
ADDRGP4 pml+40
CNSTI4 200
ASGNI4
line 2622
;2622:	}
LABELV $970
LABELV $967
line 2623
;2623:	pm->ps->commandTime = pmove->cmd.serverTime;
ADDRGP4 pm
INDIRP4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2624
;2624:	pml.frametime       = pml.msec * 0.001;
ADDRGP4 pml+36
ADDRGP4 pml+40
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ASGNF4
line 2627
;2625:
;2626:	// save old org in case we get stuck
;2627:	VectorCopy(pm->ps->origin, pml.previous_origin);
ADDRGP4 pml+112
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 2629
;2628:	// save old velocity for crashlanding
;2629:	VectorCopy(pm->ps->velocity, pml.previous_velocity);
ADDRGP4 pml+124
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 2632
;2630:
;2631:	// update viewangles
;2632:	PM_UpdateViewAngles(pm->ps, &pm->cmd);
ADDRLP4 24
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 2633
;2633:	AngleVectors(pm->ps->viewangles, pml.forward, pml.right, pml.up);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 pml
ARGP4
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+24
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 2635
;2634:	// not holding jump
;2635:	if (pm->cmd.upmove < 10) {
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $980
line 2636
;2636:		pm->ps->pm_flags &= ~PMF_JUMP_HELD;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 2637
;2637:	}
LABELV $980
line 2639
;2638:	// decide if backpedaling animations should be used
;2639:	if (pm->cmd.forwardmove < 0) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GEI4 $982
line 2640
;2640:		pm->ps->pm_flags |= PMF_BACKWARDS_RUN;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 2641
;2641:	} else if (pm->cmd.forwardmove > 0 || (pm->cmd.forwardmove == 0 && pm->cmd.rightmove)) {
ADDRGP4 $983
JUMPV
LABELV $982
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
GTI4 $986
ADDRLP4 28
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $984
ADDRLP4 28
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $984
LABELV $986
line 2642
;2642:		pm->ps->pm_flags &= ~PMF_BACKWARDS_RUN;
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 2643
;2643:	}
LABELV $984
LABELV $983
line 2645
;2644:	// remove inputs if dead
;2645:	if (pm->ps->pm_type >= PM_DEAD) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
LTI4 $987
line 2646
;2646:		pm->cmd.forwardmove = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
CNSTI1 0
ASGNI1
line 2647
;2647:		pm->cmd.rightmove   = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
CNSTI1 0
ASGNI1
line 2648
;2648:		pm->cmd.upmove      = 0;
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 2649
;2649:	}
LABELV $987
line 2651
;2650:	// do spectator move
;2651:	if (pm->ps->pm_type == PM_SPECTATOR) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $989
line 2652
;2652:		PM_CheckDuck();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 2653
;2653:		PM_FlyMove();
ADDRGP4 PM_FlyMove
CALLV
pop
line 2654
;2654:		PM_DropTimers();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2655
;2655:		return;
ADDRGP4 $951
JUMPV
LABELV $989
line 2658
;2656:	}
;2657:	// do noclip move
;2658:	if (pm->ps->pm_type == PM_NOCLIP) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $991
line 2659
;2659:		PM_NoclipMove();
ADDRGP4 PM_NoclipMove
CALLV
pop
line 2660
;2660:		PM_DropTimers();
ADDRGP4 PM_DropTimers
CALLV
pop
line 2661
;2661:		return;
ADDRGP4 $951
JUMPV
LABELV $991
line 2664
;2662:	}
;2663:	// dont do anything else if frozen or intermission
;2664:	if (pm->ps->pm_type == PM_FREEZE) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 4
NEI4 $993
line 2665
;2665:		return;
ADDRGP4 $951
JUMPV
LABELV $993
line 2667
;2666:	}
;2667:	if (pm->ps->pm_type == PM_INTERMISSION || pm->ps->pm_type == PM_SPINTERMISSION) {
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
EQI4 $997
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 6
NEI4 $995
LABELV $997
line 2668
;2668:		return;
ADDRGP4 $951
JUMPV
LABELV $995
line 2671
;2669:	}
;2670:	// do deadmove
;2671:	if (pm->ps->pm_type == PM_DEAD) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $998
line 2672
;2672:		PM_DeadMove();
ADDRGP4 PM_DeadMove
CALLV
pop
line 2673
;2673:	}
LABELV $998
line 2676
;2674:
;2675:	// set watertype, and waterlevel
;2676:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 2677
;2677:	pml.previous_waterlevel = pmove->waterlevel;
ADDRGP4 pml+136
ADDRFP4 0
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
ASGNI4
line 2680
;2678:
;2679:	// do physics movement
;2680:	phy_move(pm);
ADDRGP4 pm
INDIRP4
ARGP4
ADDRGP4 phy_move
CALLV
pop
line 2681
;2681:	return;
LABELV $951
endproc phy_PmoveSingle 36 16
export phy_move
proc phy_move 8 8
line 2686
;2682:}
;2683:
;2684:// Select the type of movement to execute. Flow control only.
;2685:// Behavior happens inside each function
;2686:void phy_move(pmove_t* pmove) {
line 2687
;2687:	if (!phy_initialized) {
ADDRGP4 phy_initialized
INDIRI4
CNSTI4 0
NEI4 $1002
line 2688
;2688:		phy_init(pmove->movetype);
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ARGI4
ADDRGP4 phy_init
CALLV
pop
line 2689
;2689:	}
LABELV $1002
line 2690
;2690:	switch (pmove->movetype) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1007
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $1008
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $1009
ADDRGP4 $1004
JUMPV
LABELV $1007
line 2692
;2691:	case CPM:
;2692:		cpm_move(pmove);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cpm_move
CALLV
pop
line 2693
;2693:		break;
ADDRGP4 $1005
JUMPV
LABELV $1008
line 2695
;2694:	case VQ3:
;2695:		vq3_move(pmove);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 vq3_move
CALLV
pop
line 2696
;2696:		break;
ADDRGP4 $1005
JUMPV
LABELV $1009
line 2698
;2697:	case CQ3:
;2698:		cq3_move(pmove);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cq3_move
CALLV
pop
line 2699
;2699:		break;
ADDRGP4 $1005
JUMPV
LABELV $1004
line 2701
;2700:	default:
;2701:		Com_Printf("::ERR phy_movetype %i not recognized\n", pmove->movetype);
ADDRGP4 $1010
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2702
;2702:		break;
LABELV $1005
line 2704
;2703:	}
;2704:}
LABELV $1001
endproc phy_move 8 8
export phy_reset
proc phy_reset 0 4
line 2710
;2705:
;2706://:::::::::::::
;2707:// phy_reset
;2708://  Reset all values to vq3 behavior, in case some init function is missing one of them
;2709://:::::::::::::
;2710:void phy_reset(void) {
line 2711
;2711:	phy_stopspeed = pm_stopspeed;
ADDRGP4 phy_stopspeed
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
line 2713
;2712:	// Crouch
;2713:	phy_crouch_scale = pm_duckScale;
ADDRGP4 phy_crouch_scale
ADDRGP4 pm_duckScale
INDIRF4
ASGNF4
line 2715
;2714:	// Slick
;2715:	phy_slick_accel = 1;
ADDRGP4 phy_slick_accel
CNSTF4 1065353216
ASGNF4
line 2717
;2716:	// Acceleration
;2717:	phy_ground_accel = pm_accelerate;
ADDRGP4 phy_ground_accel
ADDRGP4 pm_accelerate
INDIRF4
ASGNF4
line 2718
;2718:	phy_air_accel    = pm_airaccelerate;
ADDRGP4 phy_air_accel
ADDRGP4 pm_airaccelerate
INDIRF4
ASGNF4
line 2719
;2719:	phy_fly_accel    = pm_flyaccelerate;
ADDRGP4 phy_fly_accel
ADDRGP4 pm_flyaccelerate
INDIRF4
ASGNF4
line 2721
;2720:	// Friction
;2721:	phy_friction           = pm_friction;
ADDRGP4 phy_friction
ADDRGP4 pm_friction
INDIRF4
ASGNF4
line 2722
;2722:	phy_fly_friction       = pm_flightfriction;
ADDRGP4 phy_fly_friction
ADDRGP4 pm_flightfriction
INDIRF4
ASGNF4
line 2723
;2723:	phy_spectator_friction = pm_spectatorfriction;
ADDRGP4 phy_spectator_friction
ADDRGP4 pm_spectatorfriction
INDIRF4
ASGNF4
line 2726
;2724:	// New variables
;2725:	// Ground
;2726:	phy_ground_basespeed = 320;
ADDRGP4 phy_ground_basespeed
CNSTF4 1134559232
ASGNF4
line 2727
;2727:	phy_ground_accel     = 10;
ADDRGP4 phy_ground_accel
CNSTF4 1092616192
ASGNF4
line 2729
;2728:	// Air
;2729:	phy_air_basespeed = 320;
ADDRGP4 phy_air_basespeed
CNSTF4 1134559232
ASGNF4
line 2730
;2730:	phy_air_accel     = 1;
ADDRGP4 phy_air_accel
CNSTF4 1065353216
ASGNF4
line 2732
;2731:	// Air deceleration.
;2732:	phy_air_decel      = 0;
ADDRGP4 phy_air_decel
CNSTF4 0
ASGNF4
line 2733
;2733:	phy_air_decelAngle = 0;
ADDRGP4 phy_air_decelAngle
CNSTF4 0
ASGNF4
line 2735
;2734:	// AirStrafe (aka AD turning)
;2735:	phy_airstrafe_accel     = 0;
ADDRGP4 phy_airstrafe_accel
CNSTF4 0
ASGNF4
line 2736
;2736:	phy_airstrafe_basespeed = 0;
ADDRGP4 phy_airstrafe_basespeed
CNSTF4 0
ASGNF4
line 2738
;2737:	// AirControl (aka W turning)
;2738:	phy_aircontrol        = qfalse;
ADDRGP4 phy_aircontrol
CNSTI4 0
ASGNI4
line 2739
;2739:	phy_aircontrol_amount = 0;
ADDRGP4 phy_aircontrol_amount
CNSTF4 0
ASGNF4
line 2740
;2740:	phy_aircontrol_power  = 0;
ADDRGP4 phy_aircontrol_power
CNSTF4 0
ASGNF4
line 2742
;2741:	// Stepup
;2742:	phy_step_size   = STEPSIZE;
ADDRGP4 phy_step_size
CNSTI4 18
ASGNI4
line 2743
;2743:	phy_step_maxvel = JUMP_VELOCITY;
ADDRGP4 phy_step_maxvel
CNSTI4 270
ASGNI4
line 2745
;2744:	// Jump
;2745:	phy_jump_type        = VQ3;
ADDRGP4 phy_jump_type
CNSTI4 1
ASGNI4
line 2746
;2746:	phy_jump_velocity    = JUMP_VELOCITY;
ADDRGP4 phy_jump_velocity
CNSTI4 270
ASGNI4
line 2747
;2747:	phy_jump_timebuffer  = 0;
ADDRGP4 phy_jump_timebuffer
CNSTI4 0
ASGNI4
line 2748
;2748:	phy_jump_dj_velocity = 0;
ADDRGP4 phy_jump_dj_velocity
CNSTI4 0
ASGNI4
line 2753
;2749:	// Powerups
;2750:	// phy_haste_factor        = 0;
;2751:	// phy_quad_factor         = 0;
;2752:	// Water
;2753:	phy_water_accel    = pm_wateraccelerate;
ADDRGP4 phy_water_accel
ADDRGP4 pm_wateraccelerate
INDIRF4
ASGNF4
line 2754
;2754:	phy_water_scale    = pm_swimScale;
ADDRGP4 phy_water_scale
ADDRGP4 pm_swimScale
INDIRF4
ASGNF4
line 2755
;2755:	phy_water_friction = pm_waterfriction;
ADDRGP4 phy_water_friction
ADDRGP4 pm_waterfriction
INDIRF4
ASGNF4
line 2756
;2756:	Com_Printf("Physics Reset\n");
ADDRGP4 $1012
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 2757
;2757:}
LABELV $1011
endproc phy_reset 0 4
export cpm_init
proc cpm_init 0 0
line 2763
;2758://:::::::::::::::::::::::::::::::::::::::::::::::::::::
;2759:
;2760://:::::::::::::::::::::::::::::::::::::::::::::::::::::
;2761:// Initialize physics values
;2762://::::::::::::::::::::::
;2763:void cpm_init(void) {
line 2764
;2764:	phy_stopspeed    = pm_stopspeed;
ADDRGP4 phy_stopspeed
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
line 2765
;2765:	phy_crouch_scale = pm_duckScale;
ADDRGP4 phy_crouch_scale
ADDRGP4 pm_duckScale
INDIRF4
ASGNF4
line 2767
;2766:	// Acceleration
;2767:	phy_fly_accel = pm_flyaccelerate;
ADDRGP4 phy_fly_accel
ADDRGP4 pm_flyaccelerate
INDIRF4
ASGNF4
line 2769
;2768:	// Friction
;2769:	phy_friction           = pm_friction;
ADDRGP4 phy_friction
ADDRGP4 pm_friction
INDIRF4
ASGNF4
line 2770
;2770:	phy_fly_friction       = pm_flightfriction;
ADDRGP4 phy_fly_friction
ADDRGP4 pm_flightfriction
INDIRF4
ASGNF4
line 2771
;2771:	phy_spectator_friction = pm_spectatorfriction;
ADDRGP4 phy_spectator_friction
ADDRGP4 pm_spectatorfriction
INDIRF4
ASGNF4
line 2773
;2772:	// Water
;2773:	phy_water_accel    = pm_wateraccelerate;
ADDRGP4 phy_water_accel
ADDRGP4 pm_wateraccelerate
INDIRF4
ASGNF4
line 2774
;2774:	phy_water_scale    = pm_swimScale;
ADDRGP4 phy_water_scale
ADDRGP4 pm_swimScale
INDIRF4
ASGNF4
line 2775
;2775:	phy_water_friction = 0.5;
ADDRGP4 phy_water_friction
CNSTF4 1056964608
ASGNF4
line 2777
;2776:	// New
;2777:	phy_ground_basespeed = 320;
ADDRGP4 phy_ground_basespeed
CNSTF4 1134559232
ASGNF4
line 2778
;2778:	phy_ground_accel     = 15;
ADDRGP4 phy_ground_accel
CNSTF4 1097859072
ASGNF4
line 2780
;2779:	// Air movement
;2780:	phy_air_basespeed  = 320;
ADDRGP4 phy_air_basespeed
CNSTF4 1134559232
ASGNF4
line 2781
;2781:	phy_air_accel      = 1;
ADDRGP4 phy_air_accel
CNSTF4 1065353216
ASGNF4
line 2782
;2782:	phy_air_decel      = 2.5;
ADDRGP4 phy_air_decel
CNSTF4 1075838976
ASGNF4
line 2783
;2783:	phy_air_decelAngle = 100;
ADDRGP4 phy_air_decelAngle
CNSTF4 1120403456
ASGNF4
line 2785
;2784:	// W turning
;2785:	phy_aircontrol        = qtrue;
ADDRGP4 phy_aircontrol
CNSTI4 1
ASGNI4
line 2786
;2786:	phy_aircontrol_amount = 150;
ADDRGP4 phy_aircontrol_amount
CNSTF4 1125515264
ASGNF4
line 2787
;2787:	phy_aircontrol_power  = 2;
ADDRGP4 phy_aircontrol_power
CNSTF4 1073741824
ASGNF4
line 2789
;2788:	// AD turning
;2789:	phy_airstrafe_basespeed = 30;
ADDRGP4 phy_airstrafe_basespeed
CNSTF4 1106247680
ASGNF4
line 2790
;2790:	phy_airstrafe_accel     = 70;
ADDRGP4 phy_airstrafe_accel
CNSTF4 1116471296
ASGNF4
line 2792
;2791:	// Jump
;2792:	phy_jump_type        = CPM;
ADDRGP4 phy_jump_type
CNSTI4 0
ASGNI4
line 2793
;2793:	phy_jump_timebuffer  = 400;
ADDRGP4 phy_jump_timebuffer
CNSTI4 400
ASGNI4
line 2794
;2794:	phy_jump_dj_velocity = 100;
ADDRGP4 phy_jump_dj_velocity
CNSTI4 100
ASGNI4
line 2795
;2795:	phy_jump_velocity    = JUMP_VELOCITY;
ADDRGP4 phy_jump_velocity
CNSTI4 270
ASGNI4
line 2796
;2796:	phy_step_maxvel      = phy_jump_velocity + phy_jump_dj_velocity;
ADDRGP4 phy_step_maxvel
ADDRGP4 phy_jump_velocity
INDIRI4
ADDRGP4 phy_jump_dj_velocity
INDIRI4
ADDI4
ASGNI4
line 2797
;2797:}
LABELV $1013
endproc cpm_init 0 0
export vq3_init
proc vq3_init 0 0
line 2799
;2798:
;2799:void vq3_init(void) {
line 2800
;2800:	phy_stopspeed    = pm_stopspeed;
ADDRGP4 phy_stopspeed
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
line 2801
;2801:	phy_crouch_scale = pm_duckScale;
ADDRGP4 phy_crouch_scale
ADDRGP4 pm_duckScale
INDIRF4
ASGNF4
line 2803
;2802:	// Acceleration
;2803:	phy_ground_accel = pm_accelerate;
ADDRGP4 phy_ground_accel
ADDRGP4 pm_accelerate
INDIRF4
ASGNF4
line 2804
;2804:	phy_air_accel    = pm_airaccelerate;
ADDRGP4 phy_air_accel
ADDRGP4 pm_airaccelerate
INDIRF4
ASGNF4
line 2805
;2805:	phy_fly_accel    = pm_flyaccelerate;
ADDRGP4 phy_fly_accel
ADDRGP4 pm_flyaccelerate
INDIRF4
ASGNF4
line 2807
;2806:	// Friction
;2807:	phy_friction           = pm_friction;
ADDRGP4 phy_friction
ADDRGP4 pm_friction
INDIRF4
ASGNF4
line 2808
;2808:	phy_fly_friction       = pm_flightfriction;
ADDRGP4 phy_fly_friction
ADDRGP4 pm_flightfriction
INDIRF4
ASGNF4
line 2809
;2809:	phy_spectator_friction = pm_spectatorfriction;
ADDRGP4 phy_spectator_friction
ADDRGP4 pm_spectatorfriction
INDIRF4
ASGNF4
line 2811
;2810:	// Water
;2811:	phy_water_accel    = pm_wateraccelerate;
ADDRGP4 phy_water_accel
ADDRGP4 pm_wateraccelerate
INDIRF4
ASGNF4
line 2812
;2812:	phy_water_scale    = pm_swimScale;
ADDRGP4 phy_water_scale
ADDRGP4 pm_swimScale
INDIRF4
ASGNF4
line 2813
;2813:	phy_water_friction = pm_waterfriction;
ADDRGP4 phy_water_friction
ADDRGP4 pm_waterfriction
INDIRF4
ASGNF4
line 2815
;2814:	// New
;2815:	phy_aircontrol    = qfalse;
ADDRGP4 phy_aircontrol
CNSTI4 0
ASGNI4
line 2816
;2816:	phy_jump_type     = VQ3;
ADDRGP4 phy_jump_type
CNSTI4 1
ASGNI4
line 2817
;2817:	phy_jump_velocity = JUMP_VELOCITY;
ADDRGP4 phy_jump_velocity
CNSTI4 270
ASGNI4
line 2818
;2818:}
LABELV $1014
endproc vq3_init 0 0
export cq3_init
proc cq3_init 0 0
line 2820
;2819:
;2820:void cq3_init(void) {
line 2821
;2821:	phy_stopspeed    = pm_stopspeed;
ADDRGP4 phy_stopspeed
ADDRGP4 pm_stopspeed
INDIRF4
ASGNF4
line 2822
;2822:	phy_crouch_scale = pm_duckScale;
ADDRGP4 phy_crouch_scale
ADDRGP4 pm_duckScale
INDIRF4
ASGNF4
line 2824
;2823:	// Slick
;2824:	phy_slick_accel = 15;  // CPM groundaccel value
ADDRGP4 phy_slick_accel
CNSTF4 1097859072
ASGNF4
line 2826
;2825:	// Acceleration
;2826:	phy_fly_accel = pm_flyaccelerate;
ADDRGP4 phy_fly_accel
ADDRGP4 pm_flyaccelerate
INDIRF4
ASGNF4
line 2828
;2827:	// Friction
;2828:	phy_friction           = pm_friction;
ADDRGP4 phy_friction
ADDRGP4 pm_friction
INDIRF4
ASGNF4
line 2829
;2829:	phy_fly_friction       = pm_flightfriction;
ADDRGP4 phy_fly_friction
ADDRGP4 pm_flightfriction
INDIRF4
ASGNF4
line 2830
;2830:	phy_spectator_friction = pm_spectatorfriction;
ADDRGP4 phy_spectator_friction
ADDRGP4 pm_spectatorfriction
INDIRF4
ASGNF4
line 2832
;2831:	// Water
;2832:	phy_water_accel    = pm_wateraccelerate;
ADDRGP4 phy_water_accel
ADDRGP4 pm_wateraccelerate
INDIRF4
ASGNF4
line 2833
;2833:	phy_water_scale    = pm_swimScale;
ADDRGP4 phy_water_scale
ADDRGP4 pm_swimScale
INDIRF4
ASGNF4
line 2834
;2834:	phy_water_friction = 0.5;
ADDRGP4 phy_water_friction
CNSTF4 1056964608
ASGNF4
line 2836
;2835:	// Ground movement
;2836:	phy_ground_basespeed = 320;
ADDRGP4 phy_ground_basespeed
CNSTF4 1134559232
ASGNF4
line 2837
;2837:	phy_ground_accel     = 10;
ADDRGP4 phy_ground_accel
CNSTF4 1092616192
ASGNF4
line 2839
;2838:	// Air movement
;2839:	phy_air_basespeed  = 320;
ADDRGP4 phy_air_basespeed
CNSTF4 1134559232
ASGNF4
line 2840
;2840:	phy_air_accel      = 1;
ADDRGP4 phy_air_accel
CNSTF4 1065353216
ASGNF4
line 2841
;2841:	phy_air_decel      = 2.5;
ADDRGP4 phy_air_decel
CNSTF4 1075838976
ASGNF4
line 2842
;2842:	phy_air_decelAngle = 100;
ADDRGP4 phy_air_decelAngle
CNSTF4 1120403456
ASGNF4
line 2844
;2843:	// W turning
;2844:	phy_aircontrol        = qfalse;
ADDRGP4 phy_aircontrol
CNSTI4 0
ASGNI4
line 2845
;2845:	phy_aircontrol_amount = 0;
ADDRGP4 phy_aircontrol_amount
CNSTF4 0
ASGNF4
line 2846
;2846:	phy_aircontrol_power  = 0;
ADDRGP4 phy_aircontrol_power
CNSTF4 0
ASGNF4
line 2848
;2847:	// AD turning
;2848:	phy_airstrafe_basespeed = 0;
ADDRGP4 phy_airstrafe_basespeed
CNSTF4 0
ASGNF4
line 2849
;2849:	phy_airstrafe_accel     = 0;
ADDRGP4 phy_airstrafe_accel
CNSTF4 0
ASGNF4
line 2851
;2850:	// Jump
;2851:	phy_jump_type        = CPM;
ADDRGP4 phy_jump_type
CNSTI4 0
ASGNI4
line 2852
;2852:	phy_jump_timebuffer  = 400;
ADDRGP4 phy_jump_timebuffer
CNSTI4 400
ASGNI4
line 2853
;2853:	phy_jump_dj_velocity = 100;
ADDRGP4 phy_jump_dj_velocity
CNSTI4 100
ASGNI4
line 2854
;2854:	phy_jump_velocity    = JUMP_VELOCITY;
ADDRGP4 phy_jump_velocity
CNSTI4 270
ASGNI4
line 2855
;2855:	phy_step_maxvel      = phy_jump_velocity + phy_jump_dj_velocity;
ADDRGP4 phy_step_maxvel
ADDRGP4 phy_jump_velocity
INDIRI4
ADDRGP4 phy_jump_dj_velocity
INDIRI4
ADDI4
ASGNI4
line 2856
;2856:}
LABELV $1015
endproc cq3_init 0 0
proc q3a_CheckJump 48 16
line 2858
;2857:
;2858:static qboolean q3a_CheckJump(void) {
line 2864
;2859:	
;2860:	qboolean canDoubleJump;
;2861:	
;2862:	// Can't jump cases. Cannot jump again under these conditions
;2863:	// don't allow jump until all buttons are up
;2864:	if (pm->ps->pm_flags & PMF_RESPAWNED) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1017
line 2865
;2865:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1016
JUMPV
LABELV $1017
line 2867
;2866:	}
;2867:	if (pm->cmd.upmove < 10) {
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
INDIRI1
CVII4 1
CNSTI4 10
GEI4 $1019
line 2868
;2868:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1016
JUMPV
LABELV $1019
line 2870
;2869:	}                                        // not holding jump
;2870:	if (pm->ps->pm_flags & PMF_JUMP_HELD) {  // must wait for jump to be released
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1021
line 2871
;2871:		pm->cmd.upmove = 0;                  // clear upmove so cmdscale doesn't lower running speed
ADDRGP4 pm
INDIRP4
CNSTI4 27
ADDP4
CNSTI1 0
ASGNI1
line 2872
;2872:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1016
JUMPV
LABELV $1021
line 2876
;2873:	}
;2874:
;2875:	// Else: Can jump. Do jump behavior
;2876:	pml.groundPlane = qfalse;  // jumping away
ADDRGP4 pml+48
CNSTI4 0
ASGNI4
line 2877
;2877:	pml.walking     = qfalse;
ADDRGP4 pml+44
CNSTI4 0
ASGNI4
line 2878
;2878:	pm->ps->pm_flags |= PMF_JUMP_HELD;
ADDRLP4 4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 2879
;2879:	pm->ps->groundEntityNum = ENTITYNUM_NONE;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 1023
ASGNI4
line 2884
;2880:
;2881:	//:: vq3 or CPM jump selection
;2882:	//
;2883:	// Select ADD or SET vertical velocity.
;2884:	canDoubleJump = (pm->ps->velocity[2] > 0 && pm->movetype != VQ3) ? qtrue : qfalse;
ADDRLP4 12
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $1026
ADDRLP4 12
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1026
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $1027
JUMPV
LABELV $1026
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $1027
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 2885
;2885:	if (canDoubleJump) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1028
line 2886
;2886:		pm->ps->velocity[2] += phy_jump_velocity;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRGP4 phy_jump_velocity
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2887
;2887:	}  // ADD velocity, without resetting current
ADDRGP4 $1029
JUMPV
LABELV $1028
line 2888
;2888:	else {
line 2889
;2889:		pm->ps->velocity[2] = phy_jump_velocity;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ADDRGP4 phy_jump_velocity
INDIRI4
CVIF4 4
ASGNF4
line 2890
;2890:	}  // SET velocity, resets current
LABELV $1029
line 2893
;2891:	//
;2892:	// Timer check
;2893:	if (pm->movetype == CPM || pm->movetype == CQ3) {
ADDRLP4 16
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1032
ADDRLP4 16
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1030
LABELV $1032
line 2894
;2894:		int      djtimer   = pm->cmd.serverTime - pm->ps->stats[STAT_TIME_LASTJUMP];
ADDRLP4 28
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
SUBI4
ASGNI4
line 2895
;2895:		qboolean djtimerOn = ((djtimer <= phy_jump_timebuffer) && (djtimer > 0)) ? qtrue : qfalse;  // We can dj when this is true.
ADDRLP4 36
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
ADDRGP4 phy_jump_timebuffer
INDIRI4
GTI4 $1034
ADDRLP4 36
INDIRI4
CNSTI4 0
LEI4 $1034
ADDRLP4 32
CNSTI4 1
ASGNI4
ADDRGP4 $1035
JUMPV
LABELV $1034
ADDRLP4 32
CNSTI4 0
ASGNI4
LABELV $1035
ADDRLP4 24
ADDRLP4 32
INDIRI4
ASGNI4
line 2896
;2896:		if (djtimerOn) {  // Increase height by +100 (default cpm). We can jump, and timer is on.
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $1036
line 2897
;2897:			pm->ps->velocity[2] += phy_jump_dj_velocity;
ADDRLP4 40
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRGP4 phy_jump_dj_velocity
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 2898
;2898:			if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1037
line 2899
;2899:				Com_Printf(":: DoubleJump -> Timer= %i, Lastjump= %i, servertime= %i\n", djtimer, pm->ps->stats[STAT_TIME_LASTJUMP], pm->cmd.serverTime);
ADDRGP4 $1040
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2900
;2900:			}
line 2901
;2901:		} else {
ADDRGP4 $1037
JUMPV
LABELV $1036
line 2902
;2902:			pm->ps->stats[STAT_TIME_LASTJUMP] = pm->cmd.serverTime;
ADDRLP4 40
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
INDIRP4
CNSTI4 212
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 2903
;2903:		}  // Reset the timer: We can jump, but dj timer is off.
LABELV $1037
line 2904
;2904:	}
LABELV $1030
line 2907
;2905:	//:: vq3 or CPM jump selection end
;2906:
;2907:	PM_AddEvent(EV_JUMP);
CNSTI4 14
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 2908
;2908:	if (pm->cmd.forwardmove >= 0) {
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LTI4 $1041
line 2909
;2909:		PM_ForceLegsAnim(LEGS_JUMP);
CNSTI4 18
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 2910
;2910:		pm->ps->pm_flags &= ~PMF_BACKWARDS_JUMP;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 2911
;2911:	} else {
ADDRGP4 $1042
JUMPV
LABELV $1041
line 2912
;2912:		PM_ForceLegsAnim(LEGS_JUMPB);
CNSTI4 20
ARGI4
ADDRGP4 PM_ForceLegsAnim
CALLV
pop
line 2913
;2913:		pm->ps->pm_flags |= PMF_BACKWARDS_JUMP;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2914
;2914:	}
LABELV $1042
line 2916
;2915:	// We have jumped
;2916:	if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1043
line 2917
;2917:		Com_Printf("%i:Jump\n", c_pmove);
ADDRGP4 $1045
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 2918
;2918:	}
LABELV $1043
line 2919
;2919:	return qtrue;
CNSTI4 1
RETI4
LABELV $1016
endproc q3a_CheckJump 48 16
proc q3a_AirControl 36 20
line 2922
;2920:}
;2921:
;2922:static void q3a_AirControl(vec3_t wishdir, float wishspeed) {
line 2930
;2923:
;2924:	float zVel;
;2925:	float speed;
;2926:	float dot;
;2927:	float k;
;2928:
;2929:	// Initial values
;2930:	zVel          = pm->ps->velocity[2];
ADDRLP4 12
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ASGNF4
line 2931
;2931:	pm->ps->velocity[2] = 0;
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 2932
;2932:	speed         = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 2933
;2933:	VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2934
;2934:	k = 32;  // Magic constant. Why 32?
ADDRLP4 8
CNSTF4 1107296256
ASGNF4
line 2937
;2935:
;2936:	// Calculate turning amount
;2937:	dot = DotProduct(pm->ps->velocity, wishdir);
ADDRLP4 20
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
INDIRF4
MULF4
ADDRLP4 20
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 20
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 2938
;2938:	if (dot > 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $1047
line 2939
;2939:		k = k * phy_aircontrol_amount * Q_powf(dot, phy_aircontrol_power) * pml.frametime;
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 phy_aircontrol_power
INDIRF4
ARGF4
ADDRLP4 28
ADDRGP4 Q_powf
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRGP4 phy_aircontrol_amount
INDIRF4
MULF4
ADDRLP4 28
INDIRI4
CVIF4 4
MULF4
ADDRGP4 pml+36
INDIRF4
MULF4
ASGNF4
line 2940
;2940:		VectorMAM(speed, pm->ps->velocity, k, wishdir, pm->ps->velocity);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorMAM
CALLV
pop
line 2941
;2941:		VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2942
;2942:	}
LABELV $1047
line 2944
;2943:	// Apply speed
;2944:	pm->ps->velocity[0] *= speed;
ADDRLP4 28
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 2945
;2945:	pm->ps->velocity[1] *= speed;
ADDRLP4 32
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ASGNF4
line 2946
;2946:	pm->ps->velocity[2] = zVel;  // Restore starting vertical velocity
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 2947
;2947:}
LABELV $1046
endproc q3a_AirControl 36 20
export q3a_AirMove
proc q3a_AirMove 116 16
line 2949
;2948:
;2949:void q3a_AirMove(void) {
line 2958
;2950:	int       i;
;2951:	vec3_t    wishvel;  //, wishvel_c;
;2952:	float     fmove, smove;
;2953:	vec3_t    wishdir;
;2954:	float     wishspeed;  //, wishspeed_c;
;2955:	usercmd_t cmd;
;2956:	qboolean  doSideMove, doForwMove;
;2957:
;2958:	qboolean  doAircontrol = qfalse;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 2966
;2959:	float     realAccel;    // Acceleration to apply
;2960:	float     realSpeed;    // Called maxspeed. Actually just baseSpeed (320ups)
;2961:	float     realWishSpd;  // Wishpeed to apply in each case
;2962:
;2963:	// float angle;
;2964:	// vec3_t vel2D;
;2965:
;2966:	core_Friction();
ADDRGP4 core_Friction
CALLV
pop
line 2970
;2967:
;2968:	// fmove & smove = -127 to 127
;2969:	// upmove        =    0 to  20
;2970:	fmove = pm->cmd.forwardmove;  // AKA: finput, forward_cmd
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 2971
;2971:	smove = pm->cmd.rightmove;    //      sinput
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 2972
;2972:	cmd   = pm->cmd;              // Inputs for this AirMove = current inputs
ADDRLP4 56
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 24
line 2973
;2973:	PM_SetMovementDir();          // set the movementDir so clients can rotate the legs for strafing
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 2977
;2974:
;2975:	// Project moves down to flat plane. Zero out z components of movement vectors
;2976:	// Forward & Right x/y ranges are 0/640 and 0/480 //??Not convinced
;2977:	pml.forward[2] = 0;  // AKA: forward_viewangle
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 2978
;2978:	pml.right[2]   = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 2979
;2979:	VectorNormalize(pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2980
;2980:	VectorNormalize(pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2983
;2981:
;2982:	// Calculate player desired velocity vector (wishvel)
;2983:	for (i = 0; i < 2; i++) {  // Determine x and y parts of velocity
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1055
line 2984
;2984:		wishvel[i] = pml.forward[i] * fmove + pml.right[i] * smove;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 2985
;2985:	}
LABELV $1056
line 2983
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $1055
line 2986
;2986:	wishvel[2] = 0;  // Zero out z part of velocity
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 2989
;2987:
;2988:	// Calculate desired direction (aka normalized wishvel)
;2989:	VectorCopy(wishvel, wishdir);  // Store wishvel in wishdir
ADDRLP4 24
ADDRLP4 4
INDIRB
ASGNB 12
line 2990
;2990:	VectorNormalize(wishdir);      // Normalize wishvel so its actually a 'dir'
ADDRLP4 24
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2993
;2991:
;2992:	// Calculate desired speed amount, based on wishvel (aka wishpeed)
;2993:	wishspeed = VectorLength(wishvel);  // wishspeed = normalized speed (aka wishvel.length). Because speed = velocity.length
ADDRLP4 4
ARGP4
ADDRLP4 88
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 88
INDIRF4
ASGNF4
line 2996
;2994:
;2995:	// CPM specific
;2996:	doSideMove = (smove > 0.1 || smove < -0.1) ? qtrue : qfalse;
ADDRLP4 20
INDIRF4
CNSTF4 1036831949
GTF4 $1064
ADDRLP4 20
INDIRF4
CNSTF4 3184315597
GEF4 $1062
LABELV $1064
ADDRLP4 92
CNSTI4 1
ASGNI4
ADDRGP4 $1063
JUMPV
LABELV $1062
ADDRLP4 92
CNSTI4 0
ASGNI4
LABELV $1063
ADDRLP4 36
ADDRLP4 92
INDIRI4
ASGNI4
line 2997
;2997:	doForwMove = (fmove > 0.1 || fmove < -0.1) ? qtrue : qfalse;
ADDRLP4 16
INDIRF4
CNSTF4 1036831949
GTF4 $1068
ADDRLP4 16
INDIRF4
CNSTF4 3184315597
GEF4 $1066
LABELV $1068
ADDRLP4 100
CNSTI4 1
ASGNI4
ADDRGP4 $1067
JUMPV
LABELV $1066
ADDRLP4 100
CNSTI4 0
ASGNI4
LABELV $1067
ADDRLP4 40
ADDRLP4 100
INDIRI4
ASGNI4
line 2999
;2998:
;2999:	if (phy_aircontrol && doForwMove && !doSideMove) {
ADDRGP4 phy_aircontrol
INDIRI4
CNSTI4 0
EQI4 $1069
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $1069
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $1069
line 3000
;3000:		doAircontrol = qtrue;
ADDRLP4 44
CNSTI4 1
ASGNI4
line 3001
;3001:	}
LABELV $1069
line 3002
;3002:	if (pm->movetype == CPM) {
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1071
line 3004
;3003:		// We do haste in xxx_move. Default is: pm->ps->speed , which comes from g_active.c and has haste factor included in it.
;3004:		if (doSideMove && !doForwMove) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $1073
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $1073
line 3005
;3005:			realAccel   = phy_airstrafe_accel;
ADDRLP4 80
ADDRGP4 phy_airstrafe_accel
INDIRF4
ASGNF4
line 3006
;3006:			realSpeed   = phy_airstrafe_basespeed;
ADDRLP4 84
ADDRGP4 phy_airstrafe_basespeed
INDIRF4
ASGNF4
line 3007
;3007:			realWishSpd = wishspeed * core_CmdScale(&cmd, qfalse);
ADDRLP4 56
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 108
ADDRGP4 core_CmdScale
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 52
INDIRF4
ADDRLP4 108
INDIRF4
MULF4
ASGNF4
line 3008
;3008:		} else {
ADDRGP4 $1072
JUMPV
LABELV $1073
line 3009
;3009:			realAccel   = phy_air_accel;
ADDRLP4 80
ADDRGP4 phy_air_accel
INDIRF4
ASGNF4
line 3010
;3010:			realSpeed   = pm->ps->speed;
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 3011
;3011:			realWishSpd = wishspeed * core_CmdScale(&cmd, qfalse);
ADDRLP4 56
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 108
ADDRGP4 core_CmdScale
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 52
INDIRF4
ADDRLP4 108
INDIRF4
MULF4
ASGNF4
line 3024
;3012:
;3013:			// Deceleration behavior
;3014:			/*
;3015:			VectorCopy(pm->ps->velocity, vel2D);    // Store velocity in 2D vector
;3016:			vel2D[0] = 0;                           // Zero out its vertical velocity
;3017:			angle = acos_alt(DotProduct(wishdir, vel2D) /
;3018:			                (VectorLength(wishdir) * VectorLength2D(vel2D)));
;3019:			angle *= (180 / M_PI);                  // Convert radians to degrees
;3020:			if (angle > phy_air_decelAngle){        // If the angle is over the decel angle
;3021:			  realAccel *= phy_air_decel;           // Scale down air accel by decel factor
;3022:			}
;3023:			*/
;3024:		}
line 3025
;3025:	} else if (pm->movetype == VQ3 || pm->movetype == CQ3) {
ADDRGP4 $1072
JUMPV
LABELV $1071
ADDRLP4 108
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1077
ADDRLP4 108
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1050
LABELV $1077
line 3026
;3026:		realAccel   = phy_air_accel;
ADDRLP4 80
ADDRGP4 phy_air_accel
INDIRF4
ASGNF4
line 3027
;3027:		realSpeed   = pm->ps->speed;
ADDRLP4 84
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 3028
;3028:		realWishSpd = wishspeed * core_CmdScale(&cmd, qfalse);
ADDRLP4 56
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 112
ADDRGP4 core_CmdScale
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 52
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ASGNF4
line 3030
;3029:
;3030:	} else {
line 3032
;3031:		//Com_Printf("Undefined movetype in %s. pm->movetype = %i", pm->movetype, __func__);
;3032:		return;
LABELV $1076
LABELV $1072
line 3037
;3033:	}  // Undefined physics
;3034:	//::::::::::::::::::
;3035:
;3036:	// not on ground, so little effect on velocity
;3037:	core_Accelerate(wishdir, realWishSpd, realAccel, realSpeed);
ADDRLP4 24
ARGP4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 80
INDIRF4
ARGF4
ADDRLP4 84
INDIRF4
ARGF4
ADDRGP4 core_Accelerate
CALLV
pop
line 3038
;3038:	if (doAircontrol) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $1078
line 3039
;3039:		q3a_AirControl(wishdir, realWishSpd);
ADDRLP4 24
ARGP4
ADDRLP4 48
INDIRF4
ARGF4
ADDRGP4 q3a_AirControl
CALLV
pop
line 3040
;3040:	}
LABELV $1078
line 3044
;3041:
;3042:	// we may have a ground plane that is very steep, even though we don't have a
;3043:	// groundentity. slide along the steep plane
;3044:	if (pml.groundPlane) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $1080
line 3045
;3045:		VectorReflect(pm->ps->velocity, pml.groundTrace.plane.normal, pm->ps->velocity, OVERCLIP);
ADDRLP4 112
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 VectorReflect
CALLV
pop
line 3046
;3046:	}
LABELV $1080
line 3048
;3047:	// Do the movement
;3048:	core_StepSlideMove(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 core_StepSlideMove
CALLV
pop
line 3049
;3049:}
LABELV $1050
endproc q3a_AirMove 116 16
export q3a_WalkMove
proc q3a_WalkMove 116 16
line 3051
;3050:
;3051:void q3a_WalkMove(void) {
line 3062
;3052:	int       i;
;3053:	vec3_t    wishvel;
;3054:	float     fmove, smove;
;3055:	vec3_t    wishdir;
;3056:	float     wishspeed;
;3057:	float     scale;
;3058:	usercmd_t cmd;
;3059:	float     accelerate;
;3060:	float     vel;
;3061:
;3062:	if (pm->waterlevel > 2 && DotProduct(pml.forward, pml.groundTrace.plane.normal) > 0) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 2
LEI4 $1086
ADDRGP4 pml
INDIRF4
ADDRGP4 pml+52+24
INDIRF4
MULF4
ADDRGP4 pml+4
INDIRF4
ADDRGP4 pml+52+24+4
INDIRF4
MULF4
ADDF4
ADDRGP4 pml+8
INDIRF4
ADDRGP4 pml+52+24+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
LEF4 $1086
line 3063
;3063:		PM_WaterMove();  // begin swimming
ADDRGP4 PM_WaterMove
CALLV
pop
line 3064
;3064:		return;
ADDRGP4 $1085
JUMPV
LABELV $1086
line 3067
;3065:	}
;3066:
;3067:	if (q3a_CheckJump()) {
ADDRLP4 76
ADDRGP4 q3a_CheckJump
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $1098
line 3068
;3068:		if (pm->waterlevel > 1) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
LEI4 $1100
line 3069
;3069:			PM_WaterMove();
ADDRGP4 PM_WaterMove
CALLV
pop
line 3070
;3070:		}  // jumped away
ADDRGP4 $1085
JUMPV
LABELV $1100
line 3071
;3071:		else {
line 3072
;3072:			q3a_AirMove();
ADDRGP4 q3a_AirMove
CALLV
pop
line 3073
;3073:		}
line 3074
;3074:		return;
ADDRGP4 $1085
JUMPV
LABELV $1098
line 3077
;3075:	}
;3076:
;3077:	PM_Friction();
ADDRGP4 PM_Friction
CALLV
pop
line 3079
;3078:
;3079:	fmove = pm->cmd.forwardmove;
ADDRLP4 16
ADDRGP4 pm
INDIRP4
CNSTI4 25
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 3080
;3080:	smove = pm->cmd.rightmove;
ADDRLP4 20
ADDRGP4 pm
INDIRP4
CNSTI4 26
ADDP4
INDIRI1
CVII4 1
CVIF4 4
ASGNF4
line 3081
;3081:	cmd   = pm->cmd;
ADDRLP4 48
ADDRGP4 pm
INDIRP4
CNSTI4 4
ADDP4
INDIRB
ASGNB 24
line 3082
;3082:	scale = core_CmdScale(&cmd, qfalse);
ADDRLP4 48
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 80
ADDRGP4 core_CmdScale
CALLF4
ASGNF4
ADDRLP4 44
ADDRLP4 80
INDIRF4
ASGNF4
line 3085
;3083:
;3084:	// set the movementDir so clients can rotate the legs for strafing
;3085:	PM_SetMovementDir();
ADDRGP4 PM_SetMovementDir
CALLV
pop
line 3087
;3086:	// project moves down to flat plane
;3087:	pml.forward[2] = 0;
ADDRGP4 pml+8
CNSTF4 0
ASGNF4
line 3088
;3088:	pml.right[2]   = 0;
ADDRGP4 pml+12+8
CNSTF4 0
ASGNF4
line 3090
;3089:	// project the forward and right directions onto the ground plane
;3090:	VectorReflect(pml.forward, pml.groundTrace.plane.normal, pml.forward, OVERCLIP);
ADDRLP4 84
ADDRGP4 pml
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 VectorReflect
CALLV
pop
line 3091
;3091:	VectorReflect(pml.right, pml.groundTrace.plane.normal, pml.right, OVERCLIP);
ADDRGP4 pml+12
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRGP4 pml+12
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 VectorReflect
CALLV
pop
line 3092
;3092:	VectorNormalize(pml.forward);
ADDRGP4 pml
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3093
;3093:	VectorNormalize(pml.right);
ADDRGP4 pml+12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3095
;3094:
;3095:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1112
line 3096
;3096:		wishvel[i] = pml.forward[i] * fmove + pml.right[i] * smove;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 pml+12
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 3097
;3097:	}
LABELV $1113
line 3095
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1112
line 3100
;3098:	// when going up or down slopes the wish velocity should Not be zero
;3099:	//	wishvel[2] = 0;
;3100:	VectorCopy(wishvel, wishdir);  // Determine magnitude of speed of move
ADDRLP4 32
ADDRLP4 4
INDIRB
ASGNB 12
line 3101
;3101:	wishspeed = VectorNormalize(wishdir);
ADDRLP4 32
ARGP4
ADDRLP4 88
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 88
INDIRF4
ASGNF4
line 3102
;3102:	wishspeed *= scale;
ADDRLP4 24
ADDRLP4 24
INDIRF4
ADDRLP4 44
INDIRF4
MULF4
ASGNF4
line 3104
;3103:	// clamp the speed lower if ducking
;3104:	if (pm->ps->pm_flags & PMF_DUCKED) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1117
line 3105
;3105:		if (wishspeed > pm->ps->speed * phy_crouch_scale) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 phy_crouch_scale
INDIRF4
MULF4
LEF4 $1119
line 3106
;3106:			wishspeed = pm->ps->speed * phy_crouch_scale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 phy_crouch_scale
INDIRF4
MULF4
ASGNF4
line 3107
;3107:		}
LABELV $1119
line 3108
;3108:	}
LABELV $1117
line 3110
;3109:	// clamp the speed lower if wading or walking on the bottom
;3110:	if (pm->waterlevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1121
line 3112
;3111:		float waterScale;
;3112:		waterScale = pm->waterlevel / 3.0;
ADDRLP4 92
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1051372203
MULF4
ASGNF4
line 3113
;3113:		waterScale = 1.0 - (1.0 - phy_water_scale) * waterScale;
ADDRLP4 92
CNSTF4 1065353216
CNSTF4 1065353216
ADDRGP4 phy_water_scale
INDIRF4
SUBF4
ADDRLP4 92
INDIRF4
MULF4
SUBF4
ASGNF4
line 3114
;3114:		if (wishspeed > pm->ps->speed * waterScale) {
ADDRLP4 24
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
MULF4
LEF4 $1123
line 3115
;3115:			wishspeed = pm->ps->speed * waterScale;
ADDRLP4 24
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 92
INDIRF4
MULF4
ASGNF4
line 3116
;3116:		}
LABELV $1123
line 3117
;3117:	}
LABELV $1121
line 3119
;3118:	// when a player gets hit, they temporarily lose full control, which allows them to be moved a bit
;3119:	if ((pml.groundTrace.surfaceFlags & SURF_SLICK || pm->ps->pm_flags & PMF_TIME_KNOCKBACK) && pm->movetype != CPM) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $1129
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1125
LABELV $1129
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1125
line 3120
;3120:		switch (pm->movetype) {
ADDRLP4 92
ADDRGP4 pm
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 1
EQI4 $1133
ADDRLP4 92
INDIRI4
CNSTI4 2
EQI4 $1134
ADDRGP4 $1130
JUMPV
LABELV $1130
LABELV $1133
line 3123
;3121:		default: /* fall through */
;3122:		case VQ3:
;3123:			accelerate = phy_air_accel;
ADDRLP4 72
ADDRGP4 phy_air_accel
INDIRF4
ASGNF4
line 3124
;3124:			break;
ADDRGP4 $1126
JUMPV
LABELV $1134
line 3126
;3125:		case CQ3:
;3126:			accelerate = phy_slick_accel;
ADDRLP4 72
ADDRGP4 phy_slick_accel
INDIRF4
ASGNF4
line 3127
;3127:			break;
line 3129
;3128:		}
;3129:	} else {
ADDRGP4 $1126
JUMPV
LABELV $1125
line 3130
;3130:		accelerate = phy_ground_accel;
ADDRLP4 72
ADDRGP4 phy_ground_accel
INDIRF4
ASGNF4
line 3131
;3131:	}
LABELV $1126
line 3132
;3132:	core_Accelerate(wishdir, wishspeed, accelerate, pm->ps->speed);
ADDRLP4 32
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 72
INDIRF4
ARGF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 core_Accelerate
CALLV
pop
line 3133
;3133:	if ((pml.groundTrace.surfaceFlags & SURF_SLICK) || pm->ps->pm_flags & PMF_TIME_KNOCKBACK) {
ADDRGP4 pml+52+44
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $1139
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1135
LABELV $1139
line 3134
;3134:		pm->ps->velocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
ADDRLP4 92
INDIRP4
CNSTI4 40
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 3135
;3135:	} else {  // pm->ps->velocity[2] = 0; // don't reset the z velocity for slopes
LABELV $1135
line 3136
;3136:	}
LABELV $1136
line 3138
;3137:
;3138:	vel = VectorLength(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 92
INDIRF4
ASGNF4
line 3140
;3139:	// slide along the ground plane
;3140:	VectorReflect(pm->ps->velocity, pml.groundTrace.plane.normal, pm->ps->velocity, OVERCLIP);
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 96
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 VectorReflect
CALLV
pop
line 3142
;3141:	// don't decrease velocity when going up or down a slope
;3142:	VectorNormalize(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3143
;3143:	VectorScale(pm->ps->velocity, vel, pm->ps->velocity);
ADDRLP4 100
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 100
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 104
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 104
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
ADDRLP4 108
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 108
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 3145
;3144:	// don't do anything if standing still
;3145:	if (!pm->ps->velocity[0] && !pm->ps->velocity[1]) {
ADDRLP4 112
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1143
ADDRLP4 112
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1143
line 3146
;3146:		return;
ADDRGP4 $1085
JUMPV
LABELV $1143
line 3149
;3147:	}
;3148:	// Do the movement
;3149:	core_StepSlideMove(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 core_StepSlideMove
CALLV
pop
line 3150
;3150:}
LABELV $1085
endproc q3a_WalkMove 116 16
export q3a_move
proc q3a_move 0 4
line 3152
;3151:
;3152:void q3a_move(pmove_t* pmove) {
line 3154
;3153:	// set mins, maxs, and viewheight
;3154:	PM_CheckDuck();
ADDRGP4 PM_CheckDuck
CALLV
pop
line 3156
;3155:	// set groundentity
;3156:	core_GroundTrace();
ADDRGP4 core_GroundTrace
CALLV
pop
line 3160
;3157:
;3158:	// do deadmove  :moved to top
;3159:	// drop timers
;3160:	PM_DropTimers();
ADDRGP4 PM_DropTimers
CALLV
pop
line 3162
;3161:
;3162:	if (pm->ps->powerups[PW_FLIGHT]) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1146
line 3163
;3163:		PM_FlyMove();  // flight powerup doesn't allow jump and has different friction
ADDRGP4 PM_FlyMove
CALLV
pop
line 3164
;3164:	} else if (pm->ps->pm_flags & PMF_GRAPPLE_PULL) {
ADDRGP4 $1147
JUMPV
LABELV $1146
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1148
line 3165
;3165:		PM_GrappleMove();
ADDRGP4 PM_GrappleMove
CALLV
pop
line 3166
;3166:		PM_AirMove();  // We can wiggle a bit
ADDRGP4 PM_AirMove
CALLV
pop
line 3167
;3167:	} else if (pm->ps->pm_flags & PMF_TIME_WATERJUMP) {
ADDRGP4 $1149
JUMPV
LABELV $1148
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1150
line 3168
;3168:		PM_WaterJumpMove();
ADDRGP4 PM_WaterJumpMove
CALLV
pop
line 3169
;3169:	} else if (pm->waterlevel > 1) {
ADDRGP4 $1151
JUMPV
LABELV $1150
ADDRGP4 pm
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 1
LEI4 $1152
line 3170
;3170:		PM_WaterMove();  // swimming
ADDRGP4 PM_WaterMove
CALLV
pop
line 3171
;3171:	} else if (pml.walking) {
ADDRGP4 $1153
JUMPV
LABELV $1152
ADDRGP4 pml+44
INDIRI4
CNSTI4 0
EQI4 $1154
line 3172
;3172:		q3a_WalkMove();  // walking on ground
ADDRGP4 q3a_WalkMove
CALLV
pop
line 3173
;3173:	} else {
ADDRGP4 $1155
JUMPV
LABELV $1154
line 3174
;3174:		q3a_AirMove();  // airborne
ADDRGP4 q3a_AirMove
CALLV
pop
line 3175
;3175:	}
LABELV $1155
LABELV $1153
LABELV $1151
LABELV $1149
LABELV $1147
line 3177
;3176:	// animations
;3177:	PM_Animate();
ADDRGP4 PM_Animate
CALLV
pop
line 3179
;3178:	// set groundentity, watertype, and waterlevel
;3179:	core_GroundTrace();
ADDRGP4 core_GroundTrace
CALLV
pop
line 3180
;3180:	PM_SetWaterLevel();
ADDRGP4 PM_SetWaterLevel
CALLV
pop
line 3182
;3181:	// weapons
;3182:	core_Weapon();
ADDRGP4 core_Weapon
CALLV
pop
line 3184
;3183:	// torso animation
;3184:	PM_TorsoAnimation();
ADDRGP4 PM_TorsoAnimation
CALLV
pop
line 3186
;3185:	// footstep events / legs animations
;3186:	PM_Footsteps();
ADDRGP4 PM_Footsteps
CALLV
pop
line 3190
;3187:	// entering / leaving water splashes
;3188:	//PM_WaterEvents();
;3189:	// Snapzones: Snap some parts of playerstate to save network bandwidth
;3190:	trap_SnapVector(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 trap_SnapVector
CALLV
pop
line 3191
;3191:}
LABELV $1145
endproc q3a_move 0 4
export cpm_move
proc cpm_move 0 4
line 3192
;3192:void cpm_move(pmove_t* pmove) {
line 3193
;3193:	q3a_move(pmove);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 q3a_move
CALLV
pop
line 3194
;3194:}
LABELV $1157
endproc cpm_move 0 4
export vq3_move
proc vq3_move 0 4
line 3195
;3195:void vq3_move(pmove_t* pmove) {
line 3196
;3196:	q3a_move(pmove);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 q3a_move
CALLV
pop
line 3197
;3197:}
LABELV $1158
endproc vq3_move 0 4
export cq3_move
proc cq3_move 0 4
line 3198
;3198:void cq3_move(pmove_t* pmove) {
line 3199
;3199:	q3a_move(pmove);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 q3a_move
CALLV
pop
line 3200
;3200:}
LABELV $1159
endproc cq3_move 0 4
export core_SlideMove
proc core_SlideMove 288 28
line 3203
;3201:
;3202:#define MAX_CLIP_PLANES 5
;3203:qboolean core_SlideMove(qboolean gravity) {
line 3219
;3204:	int     bumpcount, numbumps;
;3205:	vec3_t  dir;
;3206:	float   d;
;3207:	int     numplanes;
;3208:	vec3_t  planes[MAX_CLIP_PLANES];
;3209:	vec3_t  primal_velocity;
;3210:	vec3_t  clipVelocity;
;3211:	int     i, j, k;
;3212:	trace_t trace;
;3213:	vec3_t  end;
;3214:	float   time_left;
;3215:	float   into;
;3216:	vec3_t  endVelocity;
;3217:	vec3_t  endClipVelocity;
;3218:
;3219:	numbumps = 4;
ADDRLP4 208
CNSTI4 4
ASGNI4
line 3221
;3220:
;3221:	VectorCopy(pm->ps->velocity, primal_velocity);
ADDRLP4 212
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 3223
;3222:
;3223:	if (gravity) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1161
line 3224
;3224:		VectorCopy(pm->ps->velocity, endVelocity);
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 3225
;3225:		endVelocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 116+8
ADDRLP4 116+8
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 3226
;3226:		pm->ps->velocity[2] = (pm->ps->velocity[2] + endVelocity[2]) * 0.5;
ADDRLP4 224
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 224
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 116+8
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3227
;3227:		primal_velocity[2]  = endVelocity[2];
ADDRLP4 212+8
ADDRLP4 116+8
INDIRF4
ASGNF4
line 3228
;3228:		if (pml.groundPlane) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $1168
line 3230
;3229:			// slide along the ground plane
;3230:			VectorReflect(pm->ps->velocity, pml.groundTrace.plane.normal, pm->ps->velocity, OVERCLIP);
ADDRLP4 228
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 228
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 VectorReflect
CALLV
pop
line 3231
;3231:		}
LABELV $1168
line 3232
;3232:	}
LABELV $1161
line 3234
;3233:
;3234:	time_left = pml.frametime;
ADDRLP4 188
ADDRGP4 pml+36
INDIRF4
ASGNF4
line 3237
;3235:
;3236:	// never turn against the ground plane
;3237:	if (pml.groundPlane) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $1174
line 3238
;3238:		numplanes = 1;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 3239
;3239:		VectorCopy(pml.groundTrace.plane.normal, planes[0]);
ADDRLP4 4
ADDRGP4 pml+52+24
INDIRB
ASGNB 12
line 3240
;3240:	} else {
ADDRGP4 $1175
JUMPV
LABELV $1174
line 3241
;3241:		numplanes = 0;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 3242
;3242:	}
LABELV $1175
line 3245
;3243:
;3244:	// never turn against original velocity
;3245:	VectorNormalize2(pm->ps->velocity, planes[numplanes]);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 96
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 3246
;3246:	numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3248
;3247:
;3248:	for (bumpcount = 0; bumpcount < numbumps; bumpcount++) {
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRGP4 $1182
JUMPV
LABELV $1179
line 3250
;3249:		// calculate position we are trying to move to
;3250:		VectorMA(pm->ps->origin, time_left, pm->ps->velocity, end);
ADDRLP4 224
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 228
ADDRLP4 224
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192
ADDRLP4 228
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 228
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 236
ADDRLP4 224
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192+4
ADDRLP4 236
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 240
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192+8
ADDRLP4 240
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 240
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
line 3252
;3251:		// see if we can make it there
;3252:		pm->trace(&trace, pm->ps->origin, pm->mins, pm->maxs, end, pm->ps->clientNum, pm->tracemask);
ADDRLP4 128
ARGP4
ADDRLP4 244
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 248
ADDRLP4 244
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 192
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 3255
;3253:
;3254:		// entity is completely trapped in another solid
;3255:		if (trace.allsolid) {
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $1185
line 3256
;3256:			pm->ps->velocity[2] = 0;  // don't build up falling damage, but allow sideways acceleration
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 3257
;3257:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1160
JUMPV
LABELV $1185
line 3261
;3258:		}
;3259:
;3260:		// actually covered some distance
;3261:		if (trace.fraction > 0) {
ADDRLP4 128+8
INDIRF4
CNSTF4 0
LEF4 $1187
line 3262
;3262:			VectorCopy(trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 128+12
INDIRB
ASGNB 12
line 3263
;3263:		}
LABELV $1187
line 3265
;3264:		// moved the entire distance
;3265:		if (trace.fraction == 1) {
ADDRLP4 128+8
INDIRF4
CNSTF4 1065353216
NEF4 $1191
line 3266
;3266:			break;
ADDRGP4 $1181
JUMPV
LABELV $1191
line 3269
;3267:		}
;3268:		// save entity for contact
;3269:		PM_AddTouchEnt(trace.entityNum);
ADDRLP4 128+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 3271
;3270:
;3271:		time_left -= time_left * trace.fraction;
ADDRLP4 188
ADDRLP4 188
INDIRF4
ADDRLP4 188
INDIRF4
ADDRLP4 128+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 3273
;3272:
;3273:		if (numplanes >= MAX_CLIP_PLANES) {
ADDRLP4 96
INDIRI4
CNSTI4 5
LTI4 $1196
line 3275
;3274:			// this shouldn't really happen
;3275:			VectorClear(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 3276
;3276:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1160
JUMPV
LABELV $1196
line 3284
;3277:		}
;3278:
;3279:		//
;3280:		// if this is the same plane we hit before, nudge velocity
;3281:		// out along it, which fixes some epsilon issues with
;3282:		// non-axial planes
;3283:		//
;3284:		for (i = 0; i < numplanes; i++) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $1201
JUMPV
LABELV $1198
line 3285
;3285:			if (DotProduct(trace.plane.normal, planes[i]) > 0.99) {
ADDRLP4 128+24
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $1202
line 3286
;3286:				VectorAdd(trace.plane.normal, pm->ps->velocity, pm->ps->velocity);
ADDRLP4 260
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 128+24
INDIRF4
ADDRLP4 260
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 264
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 264
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 268
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDF4
ASGNF4
line 3287
;3287:				break;
ADDRGP4 $1200
JUMPV
LABELV $1202
line 3289
;3288:			}
;3289:		}
LABELV $1199
line 3284
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1201
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $1198
LABELV $1200
line 3290
;3290:		if (i < numplanes) {
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
GEI4 $1216
line 3291
;3291:			continue;
ADDRGP4 $1180
JUMPV
LABELV $1216
line 3293
;3292:		}
;3293:		VectorCopy(trace.plane.normal, planes[numplanes]);
ADDRLP4 96
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ADDRLP4 128+24
INDIRB
ASGNB 12
line 3294
;3294:		numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3299
;3295:		//
;3296:		// modify velocity so it parallels all of the clip planes
;3297:		//
;3298:		// find a plane that it enters
;3299:		for (i = 0; i < numplanes; i++) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $1222
JUMPV
LABELV $1219
line 3300
;3300:			into = DotProduct(pm->ps->velocity, planes[i]);
ADDRLP4 256
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 184
ADDRLP4 256
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 256
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 256
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3301
;3301:			if (into >= 0.1) {
ADDRLP4 184
INDIRF4
CNSTF4 1036831949
LTF4 $1225
line 3302
;3302:				continue;
ADDRGP4 $1220
JUMPV
LABELV $1225
line 3305
;3303:			}  // move doesn't interact with the plane
;3304:			// see how hard we are hitting things
;3305:			if (-into > pml.impactSpeed) {
ADDRLP4 184
INDIRF4
NEGF4
ADDRGP4 pml+108
INDIRF4
LEF4 $1227
line 3306
;3306:				pml.impactSpeed = -into;
ADDRGP4 pml+108
ADDRLP4 184
INDIRF4
NEGF4
ASGNF4
line 3307
;3307:			}
LABELV $1227
line 3309
;3308:			// slide along the plane
;3309:			VectorReflect(pm->ps->velocity, planes[i], clipVelocity, OVERCLIP);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 VectorReflect
CALLV
pop
line 3311
;3310:			// slide along the plane
;3311:			VectorReflect(endVelocity, planes[i], endClipVelocity, OVERCLIP);  // IoQuake3 Wrapped this behind a gravity check. This version is default q3a
ADDRLP4 116
ARGP4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 VectorReflect
CALLV
pop
line 3314
;3312:
;3313:			// see if there is a second plane that the new move enters
;3314:			for (j = 0; j < numplanes; j++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $1234
JUMPV
LABELV $1231
line 3315
;3315:				if (j == i) {
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $1235
line 3316
;3316:					continue;
ADDRGP4 $1232
JUMPV
LABELV $1235
line 3318
;3317:				}
;3318:				if (DotProduct(clipVelocity, planes[j]) >= 0.1) {
ADDRLP4 64
INDIRF4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $1237
line 3319
;3319:					continue;
ADDRGP4 $1232
JUMPV
LABELV $1237
line 3322
;3320:				}  // move doesn't interact with the plane
;3321:				// try clipping the move to the plane
;3322:				VectorReflect(clipVelocity, planes[j], clipVelocity, OVERCLIP);
ADDRLP4 64
ARGP4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 VectorReflect
CALLV
pop
line 3323
;3323:				VectorReflect(
ADDRLP4 104
ARGP4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 VectorReflect
CALLV
pop
line 3326
;3324:					endClipVelocity, planes[j], endClipVelocity, OVERCLIP);  // IoQuake3 wrapped this inside a gravity check. This version is default q3a-1.32
;3325:				// see if it goes back into the first clip plane
;3326:				if (DotProduct(clipVelocity, planes[i]) >= 0) {
ADDRLP4 64
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
LTF4 $1243
line 3327
;3327:					continue;
ADDRGP4 $1232
JUMPV
LABELV $1243
line 3330
;3328:				}
;3329:				// slide the original velocity along the crease
;3330:				CrossProduct(planes[i], planes[j], dir);
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 3331
;3331:				VectorNormalize(dir);
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3332
;3332:				d = DotProduct(dir, pm->ps->velocity);
ADDRLP4 272
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 3333
;3333:				VectorScale(dir, d, clipVelocity);
ADDRLP4 64
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 3335
;3334:
;3335:				if (gravity) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1255
line 3336
;3336:					CrossProduct(planes[i], planes[j], dir);
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 3337
;3337:					VectorNormalize(dir);
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3338
;3338:					d = DotProduct(dir, endVelocity);
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 116+4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 116+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3339
;3339:					VectorScale(dir, d, endClipVelocity);
ADDRLP4 104
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 3340
;3340:				}
LABELV $1255
line 3343
;3341:
;3342:				// see if there is a third plane the the new move enters
;3343:				for (k = 0; k < numplanes; k++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1268
JUMPV
LABELV $1265
line 3344
;3344:					if (k == i || k == j) {
ADDRLP4 0
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $1271
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $1269
LABELV $1271
line 3345
;3345:						continue;
ADDRGP4 $1266
JUMPV
LABELV $1269
line 3347
;3346:					}
;3347:					if (DotProduct(clipVelocity, planes[k]) >= 0.1) {
ADDRLP4 64
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $1272
line 3348
;3348:						continue;
ADDRGP4 $1266
JUMPV
LABELV $1272
line 3351
;3349:					}  // move doesn't interact with the plane
;3350:					// stop dead at a tripple plane interaction
;3351:					VectorClear(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 3352
;3352:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1160
JUMPV
LABELV $1266
line 3343
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1268
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $1265
line 3354
;3353:				}
;3354:			}
LABELV $1232
line 3314
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1234
ADDRLP4 76
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $1231
line 3356
;3355:			// if we have fixed all interactions, try another move
;3356:			VectorCopy(clipVelocity, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 64
INDIRB
ASGNB 12
line 3357
;3357:			VectorCopy(endClipVelocity, endVelocity);  // IoQuake3 wrapped this inside a gravity check. This version is default q3a-1.32
ADDRLP4 116
ADDRLP4 104
INDIRB
ASGNB 12
line 3358
;3358:			break;
ADDRGP4 $1221
JUMPV
LABELV $1220
line 3299
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1222
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $1219
LABELV $1221
line 3360
;3359:		}
;3360:	}
LABELV $1180
line 3248
ADDRLP4 204
ADDRLP4 204
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1182
ADDRLP4 204
INDIRI4
ADDRLP4 208
INDIRI4
LTI4 $1179
LABELV $1181
line 3362
;3361:
;3362:	if (gravity) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1278
line 3363
;3363:		VectorCopy(endVelocity, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 116
INDIRB
ASGNB 12
line 3364
;3364:	}
LABELV $1278
line 3366
;3365:	// don't change velocity if in a timer (aka do skimming)
;3366:	if (pm->ps->pm_time) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1280
line 3367
;3367:		VectorCopy(primal_velocity, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 212
INDIRB
ASGNB 12
line 3368
;3368:	}
LABELV $1280
line 3369
;3369:	return (bumpcount != 0);
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $1283
ADDRLP4 224
CNSTI4 1
ASGNI4
ADDRGP4 $1284
JUMPV
LABELV $1283
ADDRLP4 224
CNSTI4 0
ASGNI4
LABELV $1284
ADDRLP4 224
INDIRI4
RETI4
LABELV $1160
endproc core_SlideMove 288 28
export core_StepSlideMove
proc core_StepSlideMove 172 28
line 3376
;3370:}
;3371:
;3372://::::::::::::::::
;3373:// StepSlideMove
;3374://   Handles stepmove behavior
;3375://::::::::::::::::
;3376:void core_StepSlideMove(qboolean gravity) {
line 3388
;3377:	vec3_t start_o, start_v;
;3378:	// vec3_t    down_o, down_v;
;3379:	trace_t trace;
;3380:	// float     down_dist, up_dist;
;3381:	// vec3_t    delta, delta2;
;3382:	vec3_t   up, down;
;3383:	float    stepSize;
;3384:	float    delta;
;3385:	qboolean timerActive, cantDoubleJump, isSteepRamp;
;3386:	int      max_jumpvel;
;3387:
;3388:	VectorCopy(pm->ps->origin, start_o);
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3389
;3389:	VectorCopy(pm->ps->velocity, start_v);
ADDRLP4 96
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 3391
;3390:
;3391:	if (core_SlideMove(gravity) == 0) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 128
ADDRGP4 core_SlideMove
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
NEI4 $1286
line 3392
;3392:		return;
ADDRGP4 $1285
JUMPV
LABELV $1286
line 3394
;3393:	}  // we got exactly where we wanted to go first try
;3394:	VectorCopy(start_o, down);
ADDRLP4 80
ADDRLP4 68
INDIRB
ASGNB 12
line 3395
;3395:	down[2] -= STEPSIZE;
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1099956224
SUBF4
ASGNF4
line 3396
;3396:	pm->trace(&trace, start_o, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 132
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 132
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 132
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 3398
;3397:	// Step up
;3398:	max_jumpvel    = phy_jump_velocity + phy_jump_dj_velocity;
ADDRLP4 124
ADDRGP4 phy_jump_velocity
INDIRI4
ADDRGP4 phy_jump_dj_velocity
INDIRI4
ADDI4
ASGNI4
line 3399
;3399:	timerActive    = (pm->cmd.serverTime - pm->ps->stats[STAT_TIME_LASTJUMP] < phy_jump_timebuffer) ? qtrue : qfalse;
ADDRLP4 140
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 140
INDIRP4
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
SUBI4
ADDRGP4 phy_jump_timebuffer
INDIRI4
GEI4 $1290
ADDRLP4 136
CNSTI4 1
ASGNI4
ADDRGP4 $1291
JUMPV
LABELV $1290
ADDRLP4 136
CNSTI4 0
ASGNI4
LABELV $1291
ADDRLP4 112
ADDRLP4 136
INDIRI4
ASGNI4
line 3400
;3400:	cantDoubleJump = (pm->movetype == VQ3 || !timerActive || pm->ps->velocity[2] > max_jumpvel) ? qtrue : qfalse;
ADDRLP4 148
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 216
ADDP4
INDIRI4
CNSTI4 1
EQI4 $1296
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $1296
ADDRLP4 148
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 124
INDIRI4
CVIF4 4
LEF4 $1293
LABELV $1296
ADDRLP4 144
CNSTI4 1
ASGNI4
ADDRGP4 $1294
JUMPV
LABELV $1293
ADDRLP4 144
CNSTI4 0
ASGNI4
LABELV $1294
ADDRLP4 116
ADDRLP4 144
INDIRI4
ASGNI4
line 3401
;3401:	VectorSet(up, 0, 0, 1);
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 56+4
CNSTF4 0
ASGNF4
ADDRLP4 56+8
CNSTF4 1065353216
ASGNF4
line 3402
;3402:	isSteepRamp = DotProduct(trace.plane.normal, up) < MIN_WALK_NORMAL ? qtrue : qfalse;
ADDRLP4 0+24
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 56+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 56+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
GEF4 $1307
ADDRLP4 152
CNSTI4 1
ASGNI4
ADDRGP4 $1308
JUMPV
LABELV $1307
ADDRLP4 152
CNSTI4 0
ASGNI4
LABELV $1308
ADDRLP4 120
ADDRLP4 152
INDIRI4
ASGNI4
line 3408
;3403:	// never step up when:
;3404:	//   Step-down trace moved all the way down, (or) we are in a steepramp
;3405:	//   (and) still have up velocity
;3406:	//   (and) You can't doublejump (vq3 or dj-timer is not active)
;3407:	//   (and) Vertical speed is bigger than the maximum possible dj speed (prevent stairs-climb crazyness) (included in cantDoubleJump)
;3408:	if (((trace.fraction == 1.0 || isSteepRamp) && pm->ps->velocity[2] > 0) && cantDoubleJump) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $1312
ADDRLP4 120
INDIRI4
CNSTI4 0
EQI4 $1309
LABELV $1312
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $1309
ADDRLP4 116
INDIRI4
CNSTI4 0
EQI4 $1309
line 3409
;3409:		return;
ADDRGP4 $1285
JUMPV
LABELV $1309
line 3415
;3410:	}
;3411:
;3412:	// VectorCopy (pm->ps->origin, down_o);
;3413:	// VectorCopy (pm->ps->velocity, down_v);
;3414:
;3415:	VectorCopy(start_o, up);
ADDRLP4 56
ADDRLP4 68
INDIRB
ASGNB 12
line 3416
;3416:	up[2] += STEPSIZE;
ADDRLP4 56+8
ADDRLP4 56+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 3418
;3417:	// test the player position if they were a stepheight higher
;3418:	pm->trace(&trace, start_o, pm->mins, pm->maxs, up, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 156
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 156
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 3419
;3419:	if (trace.allsolid) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1314
line 3420
;3420:		if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1316
line 3421
;3421:			Com_Printf("%i:bend can't step\n", c_pmove);
ADDRGP4 $1318
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 3422
;3422:		}
LABELV $1316
line 3423
;3423:		VectorClear(pm->ps->velocity);  // Wallbug fix
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 3424
;3424:		return;                         // can't step up
ADDRGP4 $1285
JUMPV
LABELV $1314
line 3427
;3425:	}
;3426:
;3427:	stepSize = trace.endpos[2] - start_o[2];
ADDRLP4 108
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 68+8
INDIRF4
SUBF4
ASGNF4
line 3429
;3428:	// try slidemove from this position
;3429:	VectorCopy(trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 3430
;3430:	VectorCopy(start_v, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 96
INDIRB
ASGNB 12
line 3432
;3431:
;3432:	core_SlideMove(gravity);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 core_SlideMove
CALLI4
pop
line 3435
;3433:
;3434:	// push down the final amount
;3435:	VectorCopy(pm->ps->origin, down);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 3436
;3436:	down[2] -= stepSize;
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
ADDRLP4 108
INDIRF4
SUBF4
ASGNF4
line 3437
;3437:	pm->trace(&trace, pm->ps->origin, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 160
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 164
ADDRLP4 160
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 160
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 160
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 164
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 3438
;3438:	if (!trace.allsolid) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1324
line 3439
;3439:		VectorCopy(trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 3440
;3440:	}
LABELV $1324
line 3441
;3441:	if (trace.fraction < 1.0) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $1327
line 3442
;3442:		VectorReflect(pm->ps->velocity, trace.plane.normal, pm->ps->velocity, OVERCLIP);
ADDRLP4 168
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 168
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 VectorReflect
CALLV
pop
line 3443
;3443:	}  // VectorReflect2D for CPM ??
LABELV $1327
line 3445
;3444:	// use the step move
;3445:	delta = pm->ps->origin[2] - start_o[2];
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 68+8
INDIRF4
SUBF4
ASGNF4
line 3446
;3446:	if (delta > 2) {
ADDRLP4 92
INDIRF4
CNSTF4 1073741824
LEF4 $1332
line 3447
;3447:		if (delta < 7) {
ADDRLP4 92
INDIRF4
CNSTF4 1088421888
GEF4 $1334
line 3448
;3448:			PM_AddEvent(EV_STEP_4);
CNSTI4 6
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3449
;3449:		} else if (delta < 11) {
ADDRGP4 $1335
JUMPV
LABELV $1334
ADDRLP4 92
INDIRF4
CNSTF4 1093664768
GEF4 $1336
line 3450
;3450:			PM_AddEvent(EV_STEP_8);
CNSTI4 7
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3451
;3451:		} else if (delta < 15) {
ADDRGP4 $1337
JUMPV
LABELV $1336
ADDRLP4 92
INDIRF4
CNSTF4 1097859072
GEF4 $1338
line 3452
;3452:			PM_AddEvent(EV_STEP_12);
CNSTI4 8
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3453
;3453:		} else {
ADDRGP4 $1339
JUMPV
LABELV $1338
line 3454
;3454:			PM_AddEvent(EV_STEP_16);
CNSTI4 9
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 3455
;3455:		}
LABELV $1339
LABELV $1337
LABELV $1335
line 3456
;3456:	}
LABELV $1332
line 3457
;3457:	if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1340
line 3458
;3458:		Com_Printf("%i:stepped\n", c_pmove);
ADDRGP4 $1342
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 3459
;3459:	}
LABELV $1340
line 3460
;3460:}
LABELV $1285
endproc core_StepSlideMove 172 28
import Q_powf
import new_GroundTrace
bss
export phy_slick_accel
align 4
LABELV phy_slick_accel
skip 4
export phy_water_friction
align 4
LABELV phy_water_friction
skip 4
export phy_water_scale
align 4
LABELV phy_water_scale
skip 4
export phy_water_accel
align 4
LABELV phy_water_accel
skip 4
export phy_jump_dj_velocity
align 4
LABELV phy_jump_dj_velocity
skip 4
export phy_jump_timebuffer
align 4
LABELV phy_jump_timebuffer
skip 4
export phy_jump_velocity
align 4
LABELV phy_jump_velocity
skip 4
export phy_jump_type
align 4
LABELV phy_jump_type
skip 4
export phy_step_maxvel
align 4
LABELV phy_step_maxvel
skip 4
export phy_step_size
align 4
LABELV phy_step_size
skip 4
export phy_aircontrol_power
align 4
LABELV phy_aircontrol_power
skip 4
export phy_aircontrol_amount
align 4
LABELV phy_aircontrol_amount
skip 4
export phy_aircontrol
align 4
LABELV phy_aircontrol
skip 4
export phy_airstrafe_basespeed
align 4
LABELV phy_airstrafe_basespeed
skip 4
export phy_airstrafe_accel
align 4
LABELV phy_airstrafe_accel
skip 4
export phy_air_decelAngle
align 4
LABELV phy_air_decelAngle
skip 4
export phy_air_decel
align 4
LABELV phy_air_decel
skip 4
export phy_air_accel
align 4
LABELV phy_air_accel
skip 4
export phy_air_basespeed
align 4
LABELV phy_air_basespeed
skip 4
export phy_ground_accel
align 4
LABELV phy_ground_accel
skip 4
export phy_ground_basespeed
align 4
LABELV phy_ground_basespeed
skip 4
export phy_crouch_scale
align 4
LABELV phy_crouch_scale
skip 4
export phy_spectator_friction
align 4
LABELV phy_spectator_friction
skip 4
export phy_fly_friction
align 4
LABELV phy_fly_friction
skip 4
export phy_friction
align 4
LABELV phy_friction
skip 4
export phy_fly_accel
align 4
LABELV phy_fly_accel
skip 4
export phy_stopspeed
align 4
LABELV phy_stopspeed
skip 4
import PM_WaterEvents
import trap_SnapVector
import PM_StepSlideMove
import PM_SlideMove
export pml
align 4
LABELV pml
skip 140
export pm
align 4
LABELV pm
skip 4
import BigEndian
import replace1
import Q_stradd
import Q_strcpy
import BG_StripColor
import BG_CleanName
import DecodedString
import EncodedString
import strtok
import Q_stristr
import BG_sprintf
import BG_PlayerTouchesItem
import BG_PlayerStateToEntityStateExtraPolate
import BG_PlayerStateToEntityState
import BG_TouchJumpPad
import BG_AddPredictableEventToPlayerstate
import BG_EvaluateTrajectoryDelta
import BG_EvaluateTrajectory
import BG_CanItemBeGrabbed
import BG_FindItemForHoldable
import BG_FindItemForPowerup
import BG_FindItemForWeapon
import BG_FindItem
import bg_numItems
import bg_itemlist
import Com_Printf
import Com_Error
import Info_NextPair
import Info_ValidateKeyValue
import Info_Validate
import Info_SetValueForKey_Big
import Info_SetValueForKey
import Info_ValueForKey
import va
import Q_CleanStr
import Q_PrintStrlen
import Q_strcat
import Q_strncpyz
import Q_strrchr
import Q_strupr
import Q_strlwr
import Q_stricmpn
import Q_strncmp
import Q_stricmp
import Q_isalpha
import Q_isupper
import Q_islower
import Q_isprint
import locase
import Com_sprintf
import Parse3DMatrix
import Parse2DMatrix
import Parse1DMatrix
import SkipRestOfLine
import SkipBracedSection
import COM_MatchToken
import Com_Split
import COM_ParseSep
import Com_InitSeparators
import SkipTillSeparators
import COM_ParseWarning
import COM_ParseError
import COM_Compress
import COM_ParseExt
import COM_Parse
import COM_GetCurrentParseLine
import COM_BeginParseSession
import COM_DefaultExtension
import COM_StripExtension
import COM_SkipPath
import Com_Clamp
import PerpendicularVector
import AngleVectors
import MatrixMultiply
import MakeNormalVectors
import RotateAroundDirection
import RotatePointAroundVector
import ProjectPointOnPlane
import PlaneFromPoints
import AngleDelta
import AngleNormalize180
import AngleNormalize360
import AnglesSubtract
import AngleSubtract
import LerpAngle
import AngleMod
import BoxOnPlaneSide
import SetPlaneSignbits
import AxisCopy
import AxisClear
import AnglesToAxis
import vectoangles
import Q_crandom
import Q_random
import Q_rand
import Q_acos
import Q_log2
import VectorRotate
import Vector4Scale
import VectorNormalize2
import VectorNormalize
import CrossProduct
import VectorInverse
import VectorNormalizeFast
import DistanceSquared
import Distance
import VectorLengthSquared
import VectorLength
import VectorCompare
import AddPointToBounds
import ClearBounds
import RadiusFromBounds
import NormalizeColor
import ColorBytes4
import ColorBytes3
import VectorMAM
import _VectorMA
import _VectorScale
import _VectorCopy
import _VectorAdd
import _VectorSubtract
import _DotProduct
import ByteToDir
import DirToByte
import ClampShort
import ClampChar
import Q_rsqrt
import Q_fabs
import axisDefault
import vec3_origin
import g_color_table
import colorDkGrey
import colorMdGrey
import colorLtGrey
import colorWhite
import colorCyan
import colorMagenta
import colorYellow
import colorBlue
import colorGreen
import colorRed
import colorBlack
import bytedirs
import Hunk_Alloc
import acos
import fabs
import abs
import tan
import atan2
import cos
import sin
import sqrt
import floor
import ceil
import memcpy
import memset
import memmove
import Q_sscanf
import ED_vsprintf
import atoi
import atof
import toupper
import tolower
import strncpy
import strstr
import strchr
import strcmp
import strcpy
import strcat
import strlen
import rand
import srand
import qsort
lit
align 1
LABELV $1342
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1318
byte 1 37
byte 1 105
byte 1 58
byte 1 98
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $1045
byte 1 37
byte 1 105
byte 1 58
byte 1 74
byte 1 117
byte 1 109
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $1040
byte 1 58
byte 1 58
byte 1 32
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 74
byte 1 117
byte 1 109
byte 1 112
byte 1 32
byte 1 45
byte 1 62
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 61
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 76
byte 1 97
byte 1 115
byte 1 116
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 61
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 61
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $1012
byte 1 80
byte 1 104
byte 1 121
byte 1 115
byte 1 105
byte 1 99
byte 1 115
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $1010
byte 1 58
byte 1 58
byte 1 69
byte 1 82
byte 1 82
byte 1 32
byte 1 112
byte 1 104
byte 1 121
byte 1 95
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 103
byte 1 110
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $741
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 112
byte 1 104
byte 1 121
byte 1 95
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $740
byte 1 58
byte 1 58
byte 1 69
byte 1 82
byte 1 82
byte 1 32
byte 1 112
byte 1 104
byte 1 121
byte 1 115
byte 1 105
byte 1 99
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 32
byte 1 112
byte 1 104
byte 1 121
byte 1 95
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 99
byte 1 111
byte 1 103
byte 1 110
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $474
byte 1 37
byte 1 105
byte 1 58
byte 1 76
byte 1 97
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $463
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 101
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $452
byte 1 37
byte 1 105
byte 1 58
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 111
byte 1 102
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $421
byte 1 37
byte 1 105
byte 1 58
byte 1 108
byte 1 105
byte 1 102
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $394
byte 1 37
byte 1 105
byte 1 58
byte 1 97
byte 1 108
byte 1 108
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 10
byte 1 0
