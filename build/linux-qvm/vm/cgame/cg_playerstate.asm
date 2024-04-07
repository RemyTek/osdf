export CG_CheckAmmo
code
proc CG_CheckAmmo 20 8
file "../../../../code/cgame/cg_playerstate.c"
line 17
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_playerstate.c -- this file acts on changes in a new playerState_t
;4:// With normal play, this will be done after local prediction, but when
;5:// following another player or playing back a demo, it will be checked
;6:// when the snapshot transitions like all the other entities
;7:
;8:#include "cg_local.h"
;9:
;10:/*
;11:==============
;12:CG_CheckAmmo
;13:
;14:If the ammo has gone low enough to generate the warning, play a sound
;15:==============
;16:*/
;17:void CG_CheckAmmo(void) {
line 24
;18:	int i;
;19:	int total;
;20:	int previous;
;21:	int weapons;
;22:
;23:	// see about how many seconds of ammo we have remaining
;24:	weapons = cg.snap->ps.stats[STAT_WEAPONS];
ADDRLP4 8
ADDRGP4 cg+36
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ASGNI4
line 25
;25:	total   = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 26
;26:	for (i = WP_MACHINEGUN; i < WP_NUM_WEAPONS; i++) {
ADDRLP4 0
CNSTI4 2
ASGNI4
LABELV $74
line 27
;27:		if (!(weapons & (1 << i))) {
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $78
line 28
;28:			continue;
ADDRGP4 $75
JUMPV
LABELV $78
line 30
;29:		}
;30:		switch (i) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $80
ADDRLP4 0
INDIRI4
CNSTI4 7
GTI4 $80
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $85-12
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $85
address $82
address $82
address $82
address $80
address $82
code
LABELV $82
line 38
;31:		case WP_ROCKET_LAUNCHER:
;32:		case WP_GRENADE_LAUNCHER:
;33:		case WP_RAILGUN:
;34:		case WP_SHOTGUN:
;35:#ifdef MISSIONPACK
;36:		case WP_PROX_LAUNCHER:
;37:#endif
;38:			total += cg.snap->ps.ammo[i] * 1000;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 39
;39:			break;
ADDRGP4 $81
JUMPV
LABELV $80
line 41
;40:		default:
;41:			total += cg.snap->ps.ammo[i] * 200;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 420
ADDP4
ADDP4
INDIRI4
CNSTI4 200
MULI4
ADDI4
ASGNI4
line 42
;42:			break;
LABELV $81
line 44
;43:		}
;44:		if (total >= 5000) {
ADDRLP4 4
INDIRI4
CNSTI4 5000
LTI4 $87
line 45
;45:			cg.lowAmmoWarning = 0;
ADDRGP4 cg+117528
CNSTI4 0
ASGNI4
line 46
;46:			return;
ADDRGP4 $72
JUMPV
LABELV $87
line 48
;47:		}
;48:	}
LABELV $75
line 26
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
LTI4 $74
line 50
;49:
;50:	previous = cg.lowAmmoWarning;
ADDRLP4 12
ADDRGP4 cg+117528
INDIRI4
ASGNI4
line 52
;51:
;52:	if (total == 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $91
line 53
;53:		cg.lowAmmoWarning = 2;
ADDRGP4 cg+117528
CNSTI4 2
ASGNI4
line 54
;54:	} else {
ADDRGP4 $92
JUMPV
LABELV $91
line 55
;55:		cg.lowAmmoWarning = 1;
ADDRGP4 cg+117528
CNSTI4 1
ASGNI4
line 56
;56:	}
LABELV $92
line 59
;57:
;58:	// play a sound on transitions
;59:	if (cg.lowAmmoWarning != previous) {
ADDRGP4 cg+117528
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $95
line 60
;60:		trap_S_StartLocalSound(cgs.media.noAmmoSound, CHAN_LOCAL_SOUND);
ADDRGP4 cgs+148692+708
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 61
;61:	}
LABELV $95
line 62
;62:}
LABELV $72
endproc CG_CheckAmmo 20 8
export CG_DamageFeedback
proc CG_DamageFeedback 80 16
line 69
;63:
;64:/*
;65:==============
;66:CG_DamageFeedback
;67:==============
;68:*/
;69:void CG_DamageFeedback(int yawByte, int pitchByte, int damage) {
line 85
;70:	float       left, front, up;
;71:	float       kick;
;72:	int         health;
;73:	int         attacker;
;74:	float       scale;
;75:	vec3_t      dir;
;76:	vec3_t      angles;
;77:	float       dist;
;78:	float       yaw, pitch;
;79:	const char* info;
;80:
;81:	// show the attacking player's head and name in corner
;82:	// but only if client is valid
;83:
;84:	// attacker = cg.predictedPlayerState.persistant[PERS_ATTACKER]; ?
;85:	attacker = cg.snap->ps.persistant[PERS_ATTACKER];
ADDRLP4 16
ADDRGP4 cg+36
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
ASGNI4
line 87
;86:
;87:	if ((unsigned)attacker < MAX_CLIENTS && attacker != cg.snap->ps.clientNum) {
ADDRLP4 16
INDIRI4
CVIU4 4
CNSTU4 64
GEU4 $102
ADDRLP4 16
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $102
line 89
;88:		// dont do it when cg_draw2d = 0 ?
;89:		info = CG_ConfigString(CS_PLAYERS + attacker);
ADDRLP4 16
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 72
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 72
INDIRP4
ASGNP4
line 90
;90:		if (*info) {
ADDRLP4 52
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $105
line 91
;91:			BG_CleanName(Info_ValueForKey(info, "n"), cg.attackerName, sizeof(cg.attackerName), "???");
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 $107
ARGP4
ADDRLP4 76
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 cg+117552
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $110
ARGP4
ADDRGP4 BG_CleanName
CALLV
pop
line 92
;92:			cg.attackerClientNum = attacker;
ADDRGP4 cg+117584
ADDRLP4 16
INDIRI4
ASGNI4
line 93
;93:			cg.attackerTime      = cg.time;
ADDRGP4 cg+117588
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 94
;94:		}
LABELV $105
line 95
;95:	}
LABELV $102
line 98
;96:
;97:	// the lower on health you are, the greater the view kick will be
;98:	health = cg.snap->ps.stats[STAT_HEALTH];
ADDRLP4 24
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ASGNI4
line 99
;99:	if (health < 40) {
ADDRLP4 24
INDIRI4
CNSTI4 40
GEI4 $115
line 100
;100:		scale = 1;
ADDRLP4 32
CNSTF4 1065353216
ASGNF4
line 101
;101:	} else {
ADDRGP4 $116
JUMPV
LABELV $115
line 102
;102:		scale = 40.0 / health;
ADDRLP4 32
CNSTF4 1109393408
ADDRLP4 24
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 103
;103:	}
LABELV $116
line 104
;104:	kick = damage * scale;
ADDRLP4 12
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
MULF4
ASGNF4
line 106
;105:
;106:	if (kick < 5)
ADDRLP4 12
INDIRF4
CNSTF4 1084227584
GEF4 $117
line 107
;107:		kick = 5;
ADDRLP4 12
CNSTF4 1084227584
ASGNF4
LABELV $117
line 108
;108:	if (kick > 10)
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $119
line 109
;109:		kick = 10;
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
LABELV $119
line 112
;110:
;111:	// if yaw and pitch are both 255, make the damage always centered (falling, etc)
;112:	if (yawByte == 255 && pitchByte == 255) {
ADDRFP4 0
INDIRI4
CNSTI4 255
NEI4 $121
ADDRFP4 4
INDIRI4
CNSTI4 255
NEI4 $121
line 113
;113:		cg.damageX     = 0;
ADDRGP4 cg+117864
CNSTF4 0
ASGNF4
line 114
;114:		cg.damageY     = 0;
ADDRGP4 cg+117868
CNSTF4 0
ASGNF4
line 115
;115:		cg.v_dmg_roll  = 0;
ADDRGP4 cg+117912
CNSTF4 0
ASGNF4
line 116
;116:		cg.v_dmg_pitch = -kick;
ADDRGP4 cg+117908
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
line 117
;117:	} else {
ADDRGP4 $122
JUMPV
LABELV $121
line 119
;118:		// positional
;119:		pitch = pitchByte / 255.0 * 360;
ADDRLP4 64
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1068807349
MULF4
ASGNF4
line 120
;120:		yaw   = yawByte / 255.0 * 360;
ADDRLP4 60
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1068807349
MULF4
ASGNF4
line 122
;121:
;122:		angles[PITCH] = pitch;
ADDRLP4 36
ADDRLP4 64
INDIRF4
ASGNF4
line 123
;123:		angles[YAW]   = yaw;
ADDRLP4 36+4
ADDRLP4 60
INDIRF4
ASGNF4
line 124
;124:		angles[ROLL]  = 0;
ADDRLP4 36+8
CNSTF4 0
ASGNF4
line 126
;125:
;126:		AngleVectors(angles, dir, NULL, NULL);
ADDRLP4 36
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 127
;127:		VectorSubtract(vec3_origin, dir, dir);
ADDRLP4 0
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 129
;128:
;129:		front = DotProduct(dir, cg.refdef.viewaxis[0]);
ADDRLP4 20
ADDRLP4 0
INDIRF4
ADDRGP4 cg+109056+36
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+109056+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+109056+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 130
;130:		left  = DotProduct(dir, cg.refdef.viewaxis[1]);
ADDRLP4 28
ADDRLP4 0
INDIRF4
ADDRGP4 cg+109056+36+12
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+109056+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+109056+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 131
;131:		up    = DotProduct(dir, cg.refdef.viewaxis[2]);
ADDRLP4 56
ADDRLP4 0
INDIRF4
ADDRGP4 cg+109056+36+24
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRGP4 cg+109056+36+24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRGP4 cg+109056+36+24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 133
;132:
;133:		dir[0] = front;
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 134
;134:		dir[1] = left;
ADDRLP4 0+4
ADDRLP4 28
INDIRF4
ASGNF4
line 135
;135:		dir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 136
;136:		dist   = VectorLength(dir);
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 72
INDIRF4
ASGNF4
line 137
;137:		if (dist < 0.1) {
ADDRLP4 48
INDIRF4
CNSTF4 1036831949
GEF4 $173
line 138
;138:			dist = 0.1f;
ADDRLP4 48
CNSTF4 1036831949
ASGNF4
line 139
;139:		}
LABELV $173
line 141
;140:
;141:		cg.v_dmg_roll = kick * left;
ADDRGP4 cg+117912
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 143
;142:
;143:		cg.v_dmg_pitch = -kick * front;
ADDRGP4 cg+117908
ADDRLP4 12
INDIRF4
NEGF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 145
;144:
;145:		if (front <= 0.1) {
ADDRLP4 20
INDIRF4
CNSTF4 1036831949
GTF4 $177
line 146
;146:			front = 0.1f;
ADDRLP4 20
CNSTF4 1036831949
ASGNF4
line 147
;147:		}
LABELV $177
line 148
;148:		cg.damageX = -left / front;
ADDRGP4 cg+117864
ADDRLP4 28
INDIRF4
NEGF4
ADDRLP4 20
INDIRF4
DIVF4
ASGNF4
line 149
;149:		cg.damageY = up / dist;
ADDRGP4 cg+117868
ADDRLP4 56
INDIRF4
ADDRLP4 48
INDIRF4
DIVF4
ASGNF4
line 150
;150:	}
LABELV $122
line 153
;151:
;152:	// clamp the position
;153:	if (cg.damageX > 1.0) {
ADDRGP4 cg+117864
INDIRF4
CNSTF4 1065353216
LEF4 $181
line 154
;154:		cg.damageX = 1.0;
ADDRGP4 cg+117864
CNSTF4 1065353216
ASGNF4
line 155
;155:	}
LABELV $181
line 156
;156:	if (cg.damageX < -1.0) {
ADDRGP4 cg+117864
INDIRF4
CNSTF4 3212836864
GEF4 $185
line 157
;157:		cg.damageX = -1.0;
ADDRGP4 cg+117864
CNSTF4 3212836864
ASGNF4
line 158
;158:	}
LABELV $185
line 160
;159:
;160:	if (cg.damageY > 1.0) {
ADDRGP4 cg+117868
INDIRF4
CNSTF4 1065353216
LEF4 $189
line 161
;161:		cg.damageY = 1.0;
ADDRGP4 cg+117868
CNSTF4 1065353216
ASGNF4
line 162
;162:	}
LABELV $189
line 163
;163:	if (cg.damageY < -1.0) {
ADDRGP4 cg+117868
INDIRF4
CNSTF4 3212836864
GEF4 $193
line 164
;164:		cg.damageY = -1.0;
ADDRGP4 cg+117868
CNSTF4 3212836864
ASGNF4
line 165
;165:	}
LABELV $193
line 168
;166:
;167:	// don't let the screen flashes vary as much
;168:	if (kick > 10) {
ADDRLP4 12
INDIRF4
CNSTF4 1092616192
LEF4 $197
line 169
;169:		kick = 10;
ADDRLP4 12
CNSTF4 1092616192
ASGNF4
line 170
;170:	}
LABELV $197
line 171
;171:	cg.damageValue = kick;
ADDRGP4 cg+117872
ADDRLP4 12
INDIRF4
ASGNF4
line 172
;172:	cg.v_dmg_time  = cg.time + DAMAGE_TIME;
ADDRGP4 cg+117904
ADDRGP4 cg+107604
INDIRI4
CNSTI4 500
ADDI4
CVIF4 4
ASGNF4
line 173
;173:	cg.damageTime  = cg.snap->serverTime;
ADDRGP4 cg+117860
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 174
;174:}
LABELV $100
endproc CG_DamageFeedback 80 16
export CG_Respawn
proc CG_Respawn 0 0
line 183
;175:
;176:/*
;177:================
;178:CG_Respawn
;179:
;180:A respawn happened this snapshot
;181:================
;182:*/
;183:void CG_Respawn(void) {
line 185
;184:	// no error decay on player movement
;185:	cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
line 188
;186:
;187:	// display weapons available
;188:	cg.weaponSelectTime = cg.time;
ADDRGP4 cg+117848
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 191
;189:
;190:	// select the weapon the server says we are using
;191:	cg.weaponSelect = cg.snap->ps.weapon;
ADDRGP4 cg+108956
ADDRGP4 cg+36
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 193
;192:
;193:	cg.timeResidual = cg.snap->ps.commandTime + 1000;
ADDRGP4 cg+149072
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 194
;194:}
LABELV $204
endproc CG_Respawn 0 0
proc CG_CheckPlayerstateEvents 40 12
line 204
;195:
;196:/*
;197:==============
;198:CG_CheckPlayerstateEvents
;199:==============
;200:*/
;201:extern int  eventStack;
;202:extern int  eventParm2[MAX_PREDICTED_EVENTS];
;203:
;204:static void CG_CheckPlayerstateEvents(const playerState_t* ps, const playerState_t* ops) {
line 209
;205:	int        i, n;
;206:	int        event;
;207:	centity_t* cent;
;208:
;209:	if (ps->externalEvent && ps->externalEvent != ops->externalEvent) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CNSTI4 0
EQI4 $213
ADDRLP4 16
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
EQI4 $213
line 210
;210:		cent                         = &cg_entities[ps->clientNum];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 211
;211:		cent->currentState.event     = ps->externalEvent;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 212
;212:		cent->currentState.eventParm = ps->externalEventParm;
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ASGNI4
line 213
;213:		CG_EntityEvent(cent, cent->lerpOrigin, -1);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 214
;214:	}
LABELV $213
line 216
;215:
;216:	cent = &cg.predictedPlayerEntity;  // cg_entities[ ps->clientNum ];
ADDRLP4 4
ADDRGP4 cg+108104
ASGNP4
line 217
;217:	n    = eventStack - MAX_PS_EVENTS;
ADDRLP4 12
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 218
;218:	if (n < 0)
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $216
line 219
;219:		n = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $216
line 221
;220:	// go through the predictable events buffer
;221:	for (i = ps->eventSequence - MAX_PS_EVENTS; i < ps->eventSequence; i++) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $218
line 223
;222:		// if we have a new predictable event
;223:		if (i >= ops->eventSequence
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
GEI4 $224
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
LEI4 $222
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
EQI4 $222
LABELV $224
line 226
;224:		    // or the server told us to play another event instead of a predicted event we already issued
;225:		    // or something the server told us changed our prediction causing a different event
;226:		    || (i > ops->eventSequence - MAX_PS_EVENTS && ps->events[i & (MAX_PS_EVENTS - 1)] != ops->events[i & (MAX_PS_EVENTS - 1)])) {
line 228
;227:
;228:			event = ps->events[i & (MAX_PS_EVENTS - 1)];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 229
;229:			if (event == EV_NONE)  // ignore empty events
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $225
line 230
;230:				continue;
ADDRGP4 $219
JUMPV
LABELV $225
line 231
;231:			cent->currentState.event     = event;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 232
;232:			cent->currentState.eventParm = ps->eventParms[i & (MAX_PS_EVENTS - 1)];
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ASGNI4
line 234
;233:
;234:			CG_EntityEvent(cent, cent->lerpOrigin, eventParm2[n++]);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParm2
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 236
;235:
;236:			cg.predictableEvents[i & (MAX_PREDICTED_EVENTS - 1)] = event;
ADDRLP4 0
INDIRI4
CNSTI4 15
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cg+108868
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 238
;237:
;238:			cg.eventSequence++;
ADDRLP4 36
ADDRGP4 cg+108864
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 239
;239:		}
LABELV $222
line 240
;240:	}
LABELV $219
line 221
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $221
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $218
line 241
;241:}
LABELV $212
endproc CG_CheckPlayerstateEvents 40 12
proc pushReward 4 0
line 248
;242:
;243:/*
;244:==================
;245:pushReward
;246:==================
;247:*/
;248:static void pushReward(sfxHandle_t sfx, qhandle_t shader, int rewardCount) {
line 249
;249:	if (cg.rewardStack < (MAX_REWARDSTACK - 1)) {
ADDRGP4 cg+117596
INDIRI4
CNSTI4 9
GEI4 $230
line 250
;250:		cg.rewardStack++;
ADDRLP4 0
ADDRGP4 cg+117596
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 251
;251:		cg.rewardSound[cg.rewardStack]  = sfx;
ADDRGP4 cg+117596
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117684
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 252
;252:		cg.rewardShader[cg.rewardStack] = shader;
ADDRGP4 cg+117596
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117644
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 253
;253:		cg.rewardCount[cg.rewardStack]  = rewardCount;
ADDRGP4 cg+117596
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117604
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 254
;254:	}
LABELV $230
line 255
;255:}
LABELV $229
endproc pushReward 4 0
export CG_CheckLocalSounds
proc CG_CheckLocalSounds 24 12
line 262
;256:
;257:/*
;258:==================
;259:CG_CheckLocalSounds
;260:==================
;261:*/
;262:void CG_CheckLocalSounds(playerState_t* ps, playerState_t* ops) {
line 270
;263:#ifdef MISSIONPACK
;264:	int health, armor;
;265:#endif
;266:	int         highScore, reward;
;267:	sfxHandle_t sfx;
;268:
;269:	// don't play the sounds if the player just changed teams
;270:	if (ps->persistant[PERS_TEAM] != ops->persistant[PERS_TEAM]) {
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
EQI4 $241
line 271
;271:		return;
ADDRGP4 $240
JUMPV
LABELV $241
line 275
;272:	}
;273:
;274:	// hit changes
;275:	if (ps->persistant[PERS_HITS] > ops->persistant[PERS_HITS]) {
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
LEI4 $243
line 287
;276:#ifdef MISSIONPACK
;277:		armor  = ps->persistant[PERS_ATTACKEE_ARMOR] & 0xff;
;278:		health = ps->persistant[PERS_ATTACKEE_ARMOR] >> 8;
;279:		if (armor > 50) {
;280:			trap_S_StartLocalSound(cgs.media.hitSoundHighArmor, CHAN_LOCAL_SOUND);
;281:		} else if (armor || health > 100) {
;282:			trap_S_StartLocalSound(cgs.media.hitSoundLowArmor, CHAN_LOCAL_SOUND);
;283:		} else {
;284:			trap_S_StartLocalSound(cgs.media.hitSound, CHAN_LOCAL_SOUND);
;285:		}
;286:#else
;287:		if (cg_hitSounds.integer > 0 && (ps->persistant[PERS_ATTACKEE_ARMOR] & 0xFF00) == 0) {
ADDRGP4 cg_hitSounds+12
INDIRI4
CNSTI4 0
LEI4 $245
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 65280
BANDI4
CNSTI4 0
NEI4 $245
line 291
;288:			// high byte of PERS_ATTACKEE_ARMOR is target->health in vq3/ta i.e. it is always non-zero
;289:			// so we will use this value to filter legacy data from our new hitsounds where it is always 0
;290:			int damage, index;
;291:			damage = ps->persistant[PERS_ATTACKEE_ARMOR] & 0xFF;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 276
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 294
;292:
;293:			// damage value is already scaled by STAT_MAX_HEALTH on server side
;294:			if (damage > 75)
ADDRLP4 16
INDIRI4
CNSTI4 75
LEI4 $248
line 295
;295:				index = 3;
ADDRLP4 12
CNSTI4 3
ASGNI4
ADDRGP4 $249
JUMPV
LABELV $248
line 296
;296:			else if (damage > 50)
ADDRLP4 16
INDIRI4
CNSTI4 50
LEI4 $250
line 297
;297:				index = 2;
ADDRLP4 12
CNSTI4 2
ASGNI4
ADDRGP4 $251
JUMPV
LABELV $250
line 298
;298:			else if (damage > 25)
ADDRLP4 16
INDIRI4
CNSTI4 25
LEI4 $252
line 299
;299:				index = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $253
JUMPV
LABELV $252
line 301
;300:			else
;301:				index = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $253
LABELV $251
LABELV $249
line 303
;302:
;303:			if (cg_hitSounds.integer > 1)  // reversed: higher damage - higher tone
ADDRGP4 cg_hitSounds+12
INDIRI4
CNSTI4 1
LEI4 $254
line 304
;304:				index = 3 - index;
ADDRLP4 12
CNSTI4 3
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
LABELV $254
line 306
;305:
;306:			trap_S_StartLocalSound(cgs.media.hitSounds[index], CHAN_LOCAL_SOUND);
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+756
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 307
;307:		} else {
ADDRGP4 $244
JUMPV
LABELV $245
line 308
;308:			trap_S_StartLocalSound(cgs.media.hitSound, CHAN_LOCAL_SOUND);
ADDRGP4 cgs+148692+752
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 309
;309:		}
line 311
;310:#endif
;311:	} else if (ps->persistant[PERS_HITS] < ops->persistant[PERS_HITS]) {
ADDRGP4 $244
JUMPV
LABELV $243
ADDRFP4 0
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 252
ADDP4
INDIRI4
GEI4 $261
line 312
;312:		trap_S_StartLocalSound(cgs.media.hitTeamSound, CHAN_LOCAL_SOUND);
ADDRGP4 cgs+148692+772
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 313
;313:	}
LABELV $261
LABELV $244
line 316
;314:
;315:	// health changes of more than -1 should make pain sounds
;316:	if (ps->stats[STAT_HEALTH] < ops->stats[STAT_HEALTH] - 1) {
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $265
line 317
;317:		if (ps->stats[STAT_HEALTH] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LEI4 $267
line 318
;318:			CG_PainEvent(&cg.predictedPlayerEntity, ps->stats[STAT_HEALTH]);
ADDRGP4 cg+108104
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 319
;319:		}
LABELV $267
line 320
;320:	}
LABELV $265
line 323
;321:
;322:	// if we are going into the intermission, don't start any voices
;323:	if (cg.intermissionStarted) {
ADDRGP4 cg+24
INDIRI4
CNSTI4 0
EQI4 $270
line 324
;324:		return;
ADDRGP4 $240
JUMPV
LABELV $270
line 328
;325:	}
;326:
;327:	// reward sounds
;328:	reward = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 329
;329:	if (ps->persistant[PERS_CAPTURES] != ops->persistant[PERS_CAPTURES]) {
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
EQI4 $273
line 330
;330:		pushReward(cgs.media.captureAwardSound, cgs.media.medalCapture, ps->persistant[PERS_CAPTURES]);
ADDRGP4 cgs+148692+832
INDIRI4
ARGI4
ADDRGP4 cgs+148692+512
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 331
;331:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 333
;332:		// Com_Printf("capture\n");
;333:	}
LABELV $273
line 334
;334:	if (ps->persistant[PERS_IMPRESSIVE_COUNT] != ops->persistant[PERS_IMPRESSIVE_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
EQI4 $279
line 342
;335:#ifdef MISSIONPACK
;336:		if (ps->persistant[PERS_IMPRESSIVE_COUNT] == 1) {
;337:			sfx = cgs.media.firstImpressiveSound;
;338:		} else {
;339:			sfx = cgs.media.impressiveSound;
;340:		}
;341:#else
;342:		sfx = cgs.media.impressiveSound;
ADDRLP4 4
ADDRGP4 cgs+148692+776
INDIRI4
ASGNI4
line 344
;343:#endif
;344:		pushReward(sfx, cgs.media.medalImpressive, ps->persistant[PERS_IMPRESSIVE_COUNT]);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+148692+492
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 345
;345:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 347
;346:		// Com_Printf("impressive\n");
;347:	}
LABELV $279
line 348
;348:	if (ps->persistant[PERS_EXCELLENT_COUNT] != ops->persistant[PERS_EXCELLENT_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
EQI4 $285
line 356
;349:#ifdef MISSIONPACK
;350:		if (ps->persistant[PERS_EXCELLENT_COUNT] == 1) {
;351:			sfx = cgs.media.firstExcellentSound;
;352:		} else {
;353:			sfx = cgs.media.excellentSound;
;354:		}
;355:#else
;356:		sfx = cgs.media.excellentSound;
ADDRLP4 4
ADDRGP4 cgs+148692+780
INDIRI4
ASGNI4
line 358
;357:#endif
;358:		pushReward(sfx, cgs.media.medalExcellent, ps->persistant[PERS_EXCELLENT_COUNT]);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+148692+496
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 359
;359:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 361
;360:		// Com_Printf("excellent\n");
;361:	}
LABELV $285
line 362
;362:	if (ps->persistant[PERS_GAUNTLET_FRAG_COUNT] != ops->persistant[PERS_GAUNTLET_FRAG_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
EQI4 $291
line 370
;363:#ifdef MISSIONPACK
;364:		if (ps->persistant[PERS_GAUNTLET_FRAG_COUNT] == 1) {
;365:			sfx = cgs.media.firstHumiliationSound;
;366:		} else {
;367:			sfx = cgs.media.humiliationSound;
;368:		}
;369:#else
;370:		sfx = cgs.media.humiliationSound;
ADDRLP4 4
ADDRGP4 cgs+148692+788
INDIRI4
ASGNI4
line 372
;371:#endif
;372:		pushReward(sfx, cgs.media.medalGauntlet, ps->persistant[PERS_GAUNTLET_FRAG_COUNT]);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 cgs+148692+500
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 373
;373:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 375
;374:		// Com_Printf("guantlet frag\n");
;375:	}
LABELV $291
line 376
;376:	if (ps->persistant[PERS_DEFEND_COUNT] != ops->persistant[PERS_DEFEND_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
EQI4 $297
line 377
;377:		pushReward(cgs.media.defendSound, cgs.media.medalDefend, ps->persistant[PERS_DEFEND_COUNT]);
ADDRGP4 cgs+148692+796
INDIRI4
ARGI4
ADDRGP4 cgs+148692+504
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 378
;378:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 380
;379:		// Com_Printf("defend\n");
;380:	}
LABELV $297
line 381
;381:	if (ps->persistant[PERS_ASSIST_COUNT] != ops->persistant[PERS_ASSIST_COUNT]) {
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
EQI4 $303
line 382
;382:		pushReward(cgs.media.assistSound, cgs.media.medalAssist, ps->persistant[PERS_ASSIST_COUNT]);
ADDRGP4 cgs+148692+792
INDIRI4
ARGI4
ADDRGP4 cgs+148692+508
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRGP4 pushReward
CALLV
pop
line 383
;383:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 385
;384:		// Com_Printf("assist\n");
;385:	}
LABELV $303
line 387
;386:	// if any of the player event bits changed
;387:	if (ps->persistant[PERS_PLAYEREVENTS] != ops->persistant[PERS_PLAYEREVENTS]) {
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
EQI4 $309
line 388
;388:		if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_DENIEDREWARD) != (ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_DENIEDREWARD)) {
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 1
BANDI4
EQI4 $311
line 389
;389:			trap_S_StartLocalSound(cgs.media.deniedSound, CHAN_ANNOUNCER);
ADDRGP4 cgs+148692+784
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 390
;390:		} else if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_GAUNTLETREWARD) != (ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_GAUNTLETREWARD)) {
ADDRGP4 $312
JUMPV
LABELV $311
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 2
BANDI4
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 2
BANDI4
EQI4 $315
line 391
;391:			trap_S_StartLocalSound(cgs.media.humiliationSound, CHAN_ANNOUNCER);
ADDRGP4 cgs+148692+788
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 392
;392:		} else if ((ps->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_HOLYSHIT) != (ops->persistant[PERS_PLAYEREVENTS] & PLAYEREVENT_HOLYSHIT)) {
ADDRGP4 $316
JUMPV
LABELV $315
ADDRFP4 0
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 4
BANDI4
ADDRFP4 4
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 4
BANDI4
EQI4 $319
line 393
;393:			trap_S_StartLocalSound(cgs.media.holyShitSound, CHAN_ANNOUNCER);
ADDRGP4 cgs+148692+912
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 394
;394:		}
LABELV $319
LABELV $316
LABELV $312
line 395
;395:		reward = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 396
;396:	}
LABELV $309
line 399
;397:
;398:	// check for flag pickup
;399:	if (cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $323
line 400
;400:		if ((ps->powerups[PW_REDFLAG] != ops->powerups[PW_REDFLAG] && ps->powerups[PW_REDFLAG]) ||
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
EQI4 $329
ADDRLP4 12
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
NEI4 $330
LABELV $329
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
EQI4 $331
ADDRLP4 16
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
NEI4 $330
LABELV $331
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
EQI4 $326
ADDRLP4 20
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $326
LABELV $330
line 402
;401:		    (ps->powerups[PW_BLUEFLAG] != ops->powerups[PW_BLUEFLAG] && ps->powerups[PW_BLUEFLAG]) ||
;402:		    (ps->powerups[PW_NEUTRALFLAG] != ops->powerups[PW_NEUTRALFLAG] && ps->powerups[PW_NEUTRALFLAG])) {
line 403
;403:			trap_S_StartLocalSound(cgs.media.youHaveFlagSound, CHAN_ANNOUNCER);
ADDRGP4 cgs+148692+904
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 404
;404:		}
LABELV $326
line 405
;405:	}
LABELV $323
line 408
;406:
;407:	// lead changes
;408:	if (!reward) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $334
line 410
;409:		//
;410:		if (!cg.warmup) {
ADDRGP4 cg+117820
INDIRI4
CNSTI4 0
NEI4 $336
line 412
;411:			// never play lead changes during warmup
;412:			if (ps->persistant[PERS_RANK] != ops->persistant[PERS_RANK]) {
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
EQI4 $339
line 413
;413:				if (cgs.gametype < GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
GEI4 $341
line 414
;414:					if (ps->persistant[PERS_RANK] == 0) {
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
NEI4 $344
line 415
;415:						CG_AddBufferedSound(cgs.media.takenLeadSound);
ADDRGP4 cgs+148692+800
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 416
;416:					} else if (ps->persistant[PERS_RANK] == RANK_TIED_FLAG) {
ADDRGP4 $345
JUMPV
LABELV $344
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 16384
NEI4 $348
line 417
;417:						CG_AddBufferedSound(cgs.media.tiedLeadSound);
ADDRGP4 cgs+148692+804
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 418
;418:					} else if ((ops->persistant[PERS_RANK] & ~RANK_TIED_FLAG) == 0) {
ADDRGP4 $349
JUMPV
LABELV $348
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
CNSTI4 0
NEI4 $352
line 419
;419:						CG_AddBufferedSound(cgs.media.lostLeadSound);
ADDRGP4 cgs+148692+808
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 420
;420:					}
LABELV $352
LABELV $349
LABELV $345
line 421
;421:				}
LABELV $341
line 422
;422:			}
LABELV $339
line 423
;423:		}
LABELV $336
line 424
;424:	}
LABELV $334
line 427
;425:
;426:	// timelimit warnings
;427:	if (cgs.timelimit > 0 && !cg.warmup && cg.warmupFightSound < cg.time) {
ADDRGP4 cgs+31500
INDIRI4
CNSTI4 0
LEI4 $356
ADDRGP4 cg+117820
INDIRI4
CNSTI4 0
NEI4 $356
ADDRGP4 cg+117828
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $356
line 430
;428:		int msec;
;429:
;430:		msec = cg.time - cgs.levelStartTime;
ADDRLP4 12
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+34820
INDIRI4
SUBI4
ASGNI4
line 431
;431:		if (!(cg.timelimitWarnings & 4) && msec > (cgs.timelimit * 60 + 2) * 1000) {
ADDRGP4 cg+107616
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $364
ADDRLP4 12
INDIRI4
ADDRGP4 cgs+31500
INDIRI4
CNSTI4 60
MULI4
CNSTI4 1000
MULI4
CNSTI4 2000
ADDI4
LEI4 $364
line 432
;432:			cg.timelimitWarnings |= 1 | 2 | 4;
ADDRLP4 16
ADDRGP4 cg+107616
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 7
BORI4
ASGNI4
line 433
;433:			trap_S_StartLocalSound(cgs.media.suddenDeathSound, CHAN_ANNOUNCER);
ADDRGP4 cgs+148692+736
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 434
;434:		} else if (!(cg.timelimitWarnings & 2) && msec > (cgs.timelimit - 1) * 60 * 1000) {
ADDRGP4 $365
JUMPV
LABELV $364
ADDRGP4 cg+107616
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $371
ADDRLP4 12
INDIRI4
ADDRGP4 cgs+31500
INDIRI4
CNSTI4 60
MULI4
CNSTI4 1000
MULI4
CNSTI4 60000
SUBI4
LEI4 $371
line 435
;435:			cg.timelimitWarnings |= 1 | 2;
ADDRLP4 16
ADDRGP4 cg+107616
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
line 436
;436:			CG_AddBufferedSound(cgs.media.oneMinuteSound);
ADDRGP4 cgs+148692+728
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 437
;437:		} else if (cgs.timelimit > 5 && !(cg.timelimitWarnings & 1) && msec > (cgs.timelimit - 5) * 60 * 1000) {
ADDRGP4 $372
JUMPV
LABELV $371
ADDRGP4 cgs+31500
INDIRI4
CNSTI4 5
LEI4 $378
ADDRGP4 cg+107616
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $378
ADDRLP4 12
INDIRI4
ADDRGP4 cgs+31500
INDIRI4
CNSTI4 60
MULI4
CNSTI4 1000
MULI4
CNSTI4 300000
SUBI4
LEI4 $378
line 438
;438:			cg.timelimitWarnings |= 1;
ADDRLP4 16
ADDRGP4 cg+107616
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 439
;439:			CG_AddBufferedSound(cgs.media.fiveMinuteSound);
ADDRGP4 cgs+148692+732
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 440
;440:		}
LABELV $378
LABELV $372
LABELV $365
line 441
;441:	}
LABELV $356
line 444
;442:
;443:	// fraglimit warnings
;444:	if (cgs.fraglimit > 0 && cgs.gametype < GT_CTF) {
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 0
LEI4 $386
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
GEI4 $386
line 445
;445:		highScore = cgs.scores1;
ADDRLP4 8
ADDRGP4 cgs+34824
INDIRI4
ASGNI4
line 447
;446:
;447:		if (cgs.gametype == GT_TEAM && cgs.scores2 > highScore) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
NEI4 $391
ADDRGP4 cgs+34828
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $391
line 448
;448:			highScore = cgs.scores2;
ADDRLP4 8
ADDRGP4 cgs+34828
INDIRI4
ASGNI4
line 449
;449:		}
LABELV $391
line 451
;450:
;451:		if (!(cg.fraglimitWarnings & 4) && highScore == (cgs.fraglimit - 1)) {
ADDRGP4 cg+107620
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $396
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 1
SUBI4
NEI4 $396
line 452
;452:			cg.fraglimitWarnings |= 1 | 2 | 4;
ADDRLP4 12
ADDRGP4 cg+107620
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 7
BORI4
ASGNI4
line 453
;453:			CG_AddBufferedSound(cgs.media.oneFragSound);
ADDRGP4 cgs+148692+748
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 454
;454:		} else if (cgs.fraglimit > 2 && !(cg.fraglimitWarnings & 2) && highScore == (cgs.fraglimit - 2)) {
ADDRGP4 $397
JUMPV
LABELV $396
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 2
LEI4 $403
ADDRGP4 cg+107620
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $403
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 2
SUBI4
NEI4 $403
line 455
;455:			cg.fraglimitWarnings |= 1 | 2;
ADDRLP4 12
ADDRGP4 cg+107620
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 3
BORI4
ASGNI4
line 456
;456:			CG_AddBufferedSound(cgs.media.twoFragSound);
ADDRGP4 cgs+148692+744
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 457
;457:		} else if (cgs.fraglimit > 3 && !(cg.fraglimitWarnings & 1) && highScore == (cgs.fraglimit - 3)) {
ADDRGP4 $404
JUMPV
LABELV $403
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 3
LEI4 $411
ADDRGP4 cg+107620
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $411
ADDRLP4 8
INDIRI4
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 3
SUBI4
NEI4 $411
line 458
;458:			cg.fraglimitWarnings |= 1;
ADDRLP4 12
ADDRGP4 cg+107620
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 459
;459:			CG_AddBufferedSound(cgs.media.threeFragSound);
ADDRGP4 cgs+148692+740
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 460
;460:		}
LABELV $411
LABELV $404
LABELV $397
line 461
;461:	}
LABELV $386
line 462
;462:}
LABELV $240
endproc CG_CheckLocalSounds 24 12
export CG_TransitionPlayerState
proc CG_TransitionPlayerState 12 12
line 470
;463:
;464:/*
;465:===============
;466:CG_TransitionPlayerState
;467:
;468:===============
;469:*/
;470:void CG_TransitionPlayerState(playerState_t* ps, playerState_t* ops) {
line 474
;471:	qboolean respawn;
;472:
;473:	// check for changing follow mode
;474:	if (ps->clientNum != ops->clientNum) {
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
EQI4 $420
line 475
;475:		cg.thisFrameTeleport = qtrue;
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
line 477
;476:		// make sure we don't get any unwanted transition effects
;477:		*ops = *ps;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 468
line 478
;478:	}
LABELV $420
line 481
;479:
;480:	// damage events (player is getting wounded)
;481:	if (ps->damageEvent != ops->damageEvent && ps->damageCount) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
EQI4 $423
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 0
EQI4 $423
line 482
;482:		CG_DamageFeedback(ps->damageYaw, ps->damagePitch, ps->damageCount);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DamageFeedback
CALLV
pop
line 483
;483:	}
LABELV $423
line 486
;484:
;485:	// respawning / map restart
;486:	respawn = ps->persistant[PERS_SPAWN_COUNT] != ops->persistant[PERS_SPAWN_COUNT];
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
EQI4 $426
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $427
JUMPV
LABELV $426
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $427
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 487
;487:	if (respawn || cg.mapRestart) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $431
ADDRGP4 cg+107624
INDIRI4
CNSTI4 0
EQI4 $428
LABELV $431
line 488
;488:		cg.mapRestart = qfalse;
ADDRGP4 cg+107624
CNSTI4 0
ASGNI4
line 489
;489:		CG_Respawn();
ADDRGP4 CG_Respawn
CALLV
pop
line 490
;490:	}
LABELV $428
line 492
;491:
;492:	if (cg.snap->ps.pm_type != PM_INTERMISSION && ps->persistant[PERS_TEAM] != TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
EQI4 $433
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
EQI4 $433
line 493
;493:		CG_CheckLocalSounds(ps, ops);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckLocalSounds
CALLV
pop
line 494
;494:	}
LABELV $433
line 497
;495:
;496:	// check for going low on ammo
;497:	CG_CheckAmmo();
ADDRGP4 CG_CheckAmmo
CALLV
pop
line 500
;498:
;499:	// try to play potentially dropped events
;500:	CG_PlayDroppedEvents(ps, ops);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayDroppedEvents
CALLV
pop
line 503
;501:
;502:	// run events
;503:	CG_CheckPlayerstateEvents(ps, ops);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_CheckPlayerstateEvents
CALLV
pop
line 506
;504:
;505:	// reset event stack
;506:	eventStack = 0;
ADDRGP4 eventStack
CNSTI4 0
ASGNI4
line 509
;507:
;508:	// smooth the ducking viewheight change
;509:	if (ps->viewheight != ops->viewheight && !respawn) {
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
EQI4 $436
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $436
line 510
;510:		cg.duckChange = ps->viewheight - ops->viewheight;
ADDRGP4 cg+108940
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 511
;511:		cg.duckTime   = cg.time;
ADDRGP4 cg+108944
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 512
;512:	}
LABELV $436
line 513
;513:}
LABELV $419
endproc CG_TransitionPlayerState 12 12
import eventParm2
import eventStack
import trap_R_AddLinearLightToScene
import trap_R_AddRefEntityToScene2
import linearLight
import intShaderTime
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_inPVS
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddAdditiveLightToScene
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedCapsuleTrace
import trap_CM_TransformedBoxTrace
import trap_CM_CapsuleTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_RemoveCommand
import trap_AddCommand
import trap_RealTime
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_ShaderStateChanged
import CG_SetConfigValues
import CG_ParseSysteminfo
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_ScoreboardClick
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_PlayDroppedEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_TrackClientTeamChange
import CG_ForceModelChange
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_SelectFont
import CG_LoadFonts
import CG_DrawString
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColorTime
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawStringExt
import CG_DrawPic
import CG_FillScreen
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_SetScoreCatcher
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import eventnames
import phy_movetype
import cg_timerBest_y
import cg_timerBest_x
import cg_timerActive_y
import cg_timerActive_x
import cg_timerSkim_y
import cg_timerSkim_x
import cg_speed_y
import cg_speed_x
import cg_followKiller
import cg_fovAdjust
import cg_deadBodyDarken
import cg_teamColors
import cg_teamModel
import cg_enemyColors
import cg_enemyModel
import cg_hitSounds
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import cg_smoothClients
import cg_scorePlum
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_drawSpeed
import cg_drawAttacker
import cg_lagometer
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailRadius
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_drawWeaponSelect
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
import Pmove
import PM_UpdateViewAngles
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
LABELV $110
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $107
byte 1 110
byte 1 0
