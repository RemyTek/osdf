export CG_BuildSolidList
code
proc CG_BuildSolidList 24 0
file "../../../../code/cgame/cg_predict.c"
line 26
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_predict.c -- this file generates cg.predictedPlayerState by either
;4:// interpolating between snapshots from the server or locally predicting
;5:// ahead the client's movement.
;6:// It also handles local physics interaction, like fragments bouncing off walls
;7:
;8:#include "cg_local.h"
;9:
;10:static pmove_t    cg_pmove;
;11:
;12:static int        cg_numSolidEntities;
;13:static centity_t* cg_solidEntities[MAX_ENTITIES_IN_SNAPSHOT];
;14:static int        cg_numTriggerEntities;
;15:static centity_t* cg_triggerEntities[MAX_ENTITIES_IN_SNAPSHOT];
;16:
;17:/*
;18:====================
;19:CG_BuildSolidList
;20:
;21:When a new cg.snap has been set, this function builds a sublist
;22:of the entities that are actually solid, to make for more
;23:efficient collision detection
;24:====================
;25:*/
;26:void CG_BuildSolidList(void) {
line 32
;27:	int            i;
;28:	centity_t*     cent;
;29:	snapshot_t*    snap;
;30:	entityState_t* ent;
;31:
;32:	cg_numSolidEntities   = 0;
ADDRGP4 cg_numSolidEntities
CNSTI4 0
ASGNI4
line 33
;33:	cg_numTriggerEntities = 0;
ADDRGP4 cg_numTriggerEntities
CNSTI4 0
ASGNI4
line 35
;34:
;35:	if (cg.nextSnap && !cg.nextFrameTeleport && !cg.thisFrameTeleport) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $73
ADDRGP4 cg+107596
INDIRI4
CNSTI4 0
NEI4 $73
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
NEI4 $73
line 36
;36:		snap = cg.nextSnap;
ADDRLP4 12
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 37
;37:	} else {
ADDRGP4 $74
JUMPV
LABELV $73
line 38
;38:		snap = cg.snap;
ADDRLP4 12
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 39
;39:	}
LABELV $74
line 41
;40:
;41:	for (i = 0; i < snap->numEntities; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $80
line 42
;42:		cent = &cg_entities[snap->entities[i].number];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 208
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 43
;43:		ent  = &cent->currentState;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 45
;44:
;45:		if (ent->eType == ET_ITEM || ent->eType == ET_PUSH_TRIGGER || ent->eType == ET_TELEPORT_TRIGGER) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $87
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
EQI4 $87
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
NEI4 $84
LABELV $87
line 46
;46:			cg_triggerEntities[cg_numTriggerEntities] = cent;
ADDRGP4 cg_numTriggerEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 47
;47:			cg_numTriggerEntities++;
ADDRLP4 20
ADDRGP4 cg_numTriggerEntities
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 48
;48:			continue;
ADDRGP4 $81
JUMPV
LABELV $84
line 51
;49:		}
;50:
;51:		if (cent->nextState.solid) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $88
line 52
;52:			cg_solidEntities[cg_numSolidEntities] = cent;
ADDRGP4 cg_numSolidEntities
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 53
;53:			cg_numSolidEntities++;
ADDRLP4 20
ADDRGP4 cg_numSolidEntities
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 54
;54:			continue;
LABELV $88
line 56
;55:		}
;56:	}
LABELV $81
line 41
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $83
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $80
line 57
;57:}
LABELV $72
endproc CG_BuildSolidList 24 0
proc CG_ClipMoveToEntities 144 36
line 65
;58:
;59:/*
;60:====================
;61:CG_ClipMoveToEntities
;62:
;63:====================
;64:*/
;65:static void CG_ClipMoveToEntities(const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end, int skipNumber, int mask, trace_t* tr) {
line 74
;66:	int            i, x, zd, zu;
;67:	trace_t        trace;
;68:	entityState_t* ent;
;69:	clipHandle_t   cmodel;
;70:	vec3_t         bmins, bmaxs;
;71:	vec3_t         origin, angles;
;72:	centity_t*     cent;
;73:
;74:	for (i = 0; i < cg_numSolidEntities; i++) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $94
JUMPV
LABELV $91
line 75
;75:		cent = cg_solidEntities[i];
ADDRLP4 60
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
line 76
;76:		ent  = &cent->currentState;
ADDRLP4 0
ADDRLP4 60
INDIRP4
ASGNP4
line 78
;77:
;78:		if (ent->number == skipNumber) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 16
INDIRI4
NEI4 $95
line 79
;79:			continue;
ADDRGP4 $92
JUMPV
LABELV $95
line 82
;80:		}
;81:
;82:		if (ent->solid == SOLID_BMODEL) {
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $97
line 84
;83:			// special value for bmodel
;84:			cmodel = trap_CM_InlineModel(ent->modelindex);
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 132
INDIRI4
ASGNI4
line 85
;85:			VectorCopy(cent->lerpAngles, angles);
ADDRLP4 108
ADDRLP4 60
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 86
;86:			BG_EvaluateTrajectory(&cent->currentState.pos, cg.physicsTime, origin);
ADDRLP4 60
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRLP4 96
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 87
;87:		} else {
ADDRGP4 $98
JUMPV
LABELV $97
line 89
;88:			// encoded bbox
;89:			x  = (ent->solid & 255);
ADDRLP4 120
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 90
;90:			zd = ((ent->solid >> 8) & 255);
ADDRLP4 124
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
ASGNI4
line 91
;91:			zu = ((ent->solid >> 16) & 255) - 32;
ADDRLP4 128
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CNSTI4 32
SUBI4
ASGNI4
line 93
;92:
;93:			bmins[0] = bmins[1] = -x;
ADDRLP4 132
ADDRLP4 120
INDIRI4
NEGI4
CVIF4 4
ASGNF4
ADDRLP4 72+4
ADDRLP4 132
INDIRF4
ASGNF4
ADDRLP4 72
ADDRLP4 132
INDIRF4
ASGNF4
line 94
;94:			bmaxs[0] = bmaxs[1] = x;
ADDRLP4 136
ADDRLP4 120
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 84+4
ADDRLP4 136
INDIRF4
ASGNF4
ADDRLP4 84
ADDRLP4 136
INDIRF4
ASGNF4
line 95
;95:			bmins[2]            = -zd;
ADDRLP4 72+8
ADDRLP4 124
INDIRI4
NEGI4
CVIF4 4
ASGNF4
line 96
;96:			bmaxs[2]            = zu;
ADDRLP4 84+8
ADDRLP4 128
INDIRI4
CVIF4 4
ASGNF4
line 98
;97:
;98:			cmodel = trap_CM_TempBoxModel(bmins, bmaxs);
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 140
ADDRGP4 trap_CM_TempBoxModel
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 140
INDIRI4
ASGNI4
line 99
;99:			VectorCopy(vec3_origin, angles);
ADDRLP4 108
ADDRGP4 vec3_origin
INDIRB
ASGNB 12
line 100
;100:			VectorCopy(cent->lerpOrigin, origin);
ADDRLP4 96
ADDRLP4 60
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 101
;101:		}
LABELV $98
line 103
;102:
;103:		trap_CM_TransformedBoxTrace(&trace, start, end, mins, maxs, cmodel, mask, origin, angles);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 68
INDIRI4
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 96
ARGP4
ADDRLP4 108
ARGP4
ADDRGP4 trap_CM_TransformedBoxTrace
CALLV
pop
line 105
;104:
;105:		if (trace.allsolid || trace.fraction < tr->fraction) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $107
ADDRLP4 4+8
INDIRF4
ADDRFP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
GEF4 $104
LABELV $107
line 106
;106:			trace.entityNum = ent->number;
ADDRLP4 4+52
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 107
;107:			*tr             = trace;
ADDRFP4 24
INDIRP4
ADDRLP4 4
INDIRB
ASGNB 56
line 108
;108:		} else if (trace.startsolid) {
ADDRGP4 $105
JUMPV
LABELV $104
ADDRLP4 4+4
INDIRI4
CNSTI4 0
EQI4 $109
line 109
;109:			tr->startsolid = qtrue;
ADDRFP4 24
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 110
;110:		}
LABELV $109
LABELV $105
line 111
;111:		if (tr->allsolid) {
ADDRFP4 24
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $112
line 112
;112:			return;
ADDRGP4 $90
JUMPV
LABELV $112
line 114
;113:		}
;114:	}
LABELV $92
line 74
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $94
ADDRLP4 64
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
LTI4 $91
line 115
;115:}
LABELV $90
endproc CG_ClipMoveToEntities 144 36
export CG_Trace
proc CG_Trace 56 28
line 122
;116:
;117:/*
;118:================
;119:CG_Trace
;120:================
;121:*/
;122:void CG_Trace(trace_t* result, const vec3_t start, const vec3_t mins, const vec3_t maxs, const vec3_t end, int skipNumber, int mask) {
line 125
;123:	trace_t t;
;124:
;125:	trap_CM_BoxTrace(&t, start, end, mins, maxs, 0, mask);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 126
;126:	if (t.fraction == 1.0)
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $115
line 127
;127:		t.entityNum = ENTITYNUM_NONE;
ADDRLP4 0+52
CNSTI4 1023
ASGNI4
ADDRGP4 $116
JUMPV
LABELV $115
line 129
;128:	else
;129:		t.entityNum = ENTITYNUM_WORLD;
ADDRLP4 0+52
CNSTI4 1022
ASGNI4
LABELV $116
line 132
;130:
;131:	// check all other solid models
;132:	CG_ClipMoveToEntities(start, mins, maxs, end, skipNumber, mask, &t);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 CG_ClipMoveToEntities
CALLV
pop
line 134
;133:
;134:	*result = t;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 56
line 135
;135:}
LABELV $114
endproc CG_Trace 56 28
export CG_PointContents
proc CG_PointContents 36 16
line 142
;136:
;137:/*
;138:================
;139:CG_PointContents
;140:================
;141:*/
;142:int CG_PointContents(const vec3_t point, int passEntityNum) {
line 149
;143:	int            i;
;144:	entityState_t* ent;
;145:	centity_t*     cent;
;146:	clipHandle_t   cmodel;
;147:	int            contents;
;148:
;149:	contents = trap_CM_PointContents(point, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 trap_CM_PointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 20
INDIRI4
ASGNI4
line 151
;150:
;151:	for (i = 0; i < cg_numSolidEntities; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $124
JUMPV
LABELV $121
line 152
;152:		cent = cg_solidEntities[i];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_solidEntities
ADDP4
INDIRP4
ASGNP4
line 154
;153:
;154:		ent = &cent->currentState;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 156
;155:
;156:		if (ent->number == passEntityNum) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $125
line 157
;157:			continue;
ADDRGP4 $122
JUMPV
LABELV $125
line 160
;158:		}
;159:
;160:		if (ent->solid != SOLID_BMODEL) {  // special value for bmodel
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $127
line 161
;161:			continue;
ADDRGP4 $122
JUMPV
LABELV $127
line 164
;162:		}
;163:
;164:		cmodel = trap_CM_InlineModel(ent->modelindex);
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 24
INDIRI4
ASGNI4
line 165
;165:		if (!cmodel) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $129
line 166
;166:			continue;
ADDRGP4 $122
JUMPV
LABELV $129
line 169
;167:		}
;168:
;169:		contents |= trap_CM_TransformedPointContents(point, cmodel, cent->lerpOrigin, cent->lerpAngles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRLP4 32
ADDRGP4 trap_CM_TransformedPointContents
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 32
INDIRI4
BORI4
ASGNI4
line 170
;170:	}
LABELV $122
line 151
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $124
ADDRLP4 8
INDIRI4
ADDRGP4 cg_numSolidEntities
INDIRI4
LTI4 $121
line 172
;171:
;172:	return contents;
ADDRLP4 16
INDIRI4
RETI4
LABELV $120
endproc CG_PointContents 36 16
proc CG_InterpolatePlayerState 52 12
line 183
;173:}
;174:
;175:/*
;176:========================
;177:CG_InterpolatePlayerState
;178:
;179:Generates cg.predictedPlayerState by interpolating between
;180:cg.snap->player_state and cg.nextFrame->player_state
;181:========================
;182:*/
;183:static void CG_InterpolatePlayerState(qboolean grabAngles) {
line 189
;184:	float          f;
;185:	int            i;
;186:	playerState_t* out;
;187:	snapshot_t *   prev, *next;
;188:
;189:	out  = &cg.predictedPlayerState;
ADDRLP4 12
ADDRGP4 cg+107636
ASGNP4
line 190
;190:	prev = cg.snap;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 191
;191:	next = cg.nextSnap;
ADDRLP4 8
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 193
;192:
;193:	*out = cg.snap->ps;
ADDRLP4 12
INDIRP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 196
;194:
;195:	// if we are still allowing local input, short circuit the view angles
;196:	if (grabAngles) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $136
line 200
;197:		usercmd_t cmd;
;198:		int       cmdNum;
;199:
;200:		cmdNum = trap_GetCurrentCmdNumber();
ADDRLP4 48
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 48
INDIRI4
ASGNI4
line 201
;201:		trap_GetUserCmd(cmdNum, &cmd);
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 20
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 203
;202:
;203:		PM_UpdateViewAngles(out, &cmd);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 204
;204:	}
LABELV $136
line 207
;205:
;206:	// if the next frame is a teleport, we can't lerp to it
;207:	if (cg.nextFrameTeleport) {
ADDRGP4 cg+107596
INDIRI4
CNSTI4 0
EQI4 $138
line 208
;208:		return;
ADDRGP4 $131
JUMPV
LABELV $138
line 211
;209:	}
;210:
;211:	if (!next || next->serverTime <= prev->serverTime) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $143
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GTI4 $141
LABELV $143
line 212
;212:		return;
ADDRGP4 $131
JUMPV
LABELV $141
line 215
;213:	}
;214:
;215:	f = (float)(cg.time - prev->serverTime) / (next->serverTime - prev->serverTime);
ADDRLP4 16
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 217
;216:
;217:	i = next->ps.bobCycle;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 218
;218:	if (i < prev->ps.bobCycle) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
GEI4 $145
line 219
;219:		i += 256;  // handle wraparound
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
ASGNI4
line 220
;220:	}
LABELV $145
line 221
;221:	out->bobCycle = prev->ps.bobCycle + f * (i - prev->ps.bobCycle);
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
SUBI4
CVIF4 4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 223
;222:
;223:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $147
line 224
;224:		out->origin[i] = prev->ps.origin[i] + f * (next->ps.origin[i] - prev->ps.origin[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 225
;225:		if (!grabAngles) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $151
line 226
;226:			out->viewangles[i] = LerpAngle(prev->ps.viewangles[i], next->ps.viewangles[i], f);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 196
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 44
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 152
ADDP4
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
line 227
;227:		}
LABELV $151
line 228
;228:		out->velocity[i] = prev->ps.velocity[i] + f * (next->ps.velocity[i] - prev->ps.velocity[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 229
;229:	}
LABELV $148
line 223
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $147
line 230
;230:}
LABELV $131
endproc CG_InterpolatePlayerState 52 12
export CG_StoreEvent
proc CG_StoreEvent 4 4
line 246
;231:
;232:int            eventStack;
;233:entity_event_t events[MAX_PREDICTED_EVENTS];
;234:int            eventParms[MAX_PREDICTED_EVENTS];
;235:int            eventParm2[MAX_PREDICTED_EVENTS];  // client entity index
;236:
;237:void           CG_AddFallDamage(int damage);
;238:
;239:/*
;240:===================
;241:CG_StoreEvents
;242:
;243:Save events that may be dropped during prediction
;244:===================
;245:*/
;246:void CG_StoreEvent(entity_event_t evt, int eventParm, int entityNum) {
line 247
;247:	if (eventStack >= MAX_PREDICTED_EVENTS)
ADDRGP4 eventStack
INDIRI4
CNSTI4 16
LTI4 $154
line 248
;248:		return;
ADDRGP4 $153
JUMPV
LABELV $154
line 250
;249:
;250:	if (evt == EV_FALL_FAR) {
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $156
line 251
;251:		CG_AddFallDamage(10);
CNSTI4 10
ARGI4
ADDRGP4 CG_AddFallDamage
CALLV
pop
line 252
;252:	} else if (evt == EV_FALL_MEDIUM) {
ADDRGP4 $157
JUMPV
LABELV $156
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $158
line 253
;253:		CG_AddFallDamage(5);
CNSTI4 5
ARGI4
ADDRGP4 CG_AddFallDamage
CALLV
pop
line 254
;254:	}
LABELV $158
LABELV $157
line 256
;255:
;256:	events[eventStack]     = evt;
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 events
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 257
;257:	eventParms[eventStack] = eventParm;
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParms
ADDP4
ADDRFP4 4
INDIRI4
ASGNI4
line 258
;258:	eventParm2[eventStack] = entityNum;
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParm2
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 259
;259:	eventStack++;
ADDRLP4 0
ADDRGP4 eventStack
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 260
;260:}
LABELV $153
endproc CG_StoreEvent 4 4
export CG_PlayDroppedEvents
proc CG_PlayDroppedEvents 24 12
line 267
;261:
;262:/*
;263:===================
;264:CG_PlayDroppedEvents
;265:===================
;266:*/
;267:void CG_PlayDroppedEvents(playerState_t* ps, playerState_t* ops) {
line 272
;268:	centity_t*     cent;
;269:	entity_event_t oldEvent;
;270:	int            i, oldParam;
;271:
;272:	if (ps == ops) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $161
line 273
;273:		return;
ADDRGP4 $160
JUMPV
LABELV $161
line 276
;274:	}
;275:
;276:	if (eventStack <= MAX_PS_EVENTS) {
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
GTI4 $163
line 277
;277:		return;
ADDRGP4 $160
JUMPV
LABELV $163
line 280
;278:	}
;279:
;280:	cent = &cg.predictedPlayerEntity;
ADDRLP4 4
ADDRGP4 cg+108104
ASGNP4
line 282
;281:
;282:	oldEvent = cent->currentState.event;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 283
;283:	oldParam = cent->currentState.eventParm;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 285
;284:
;285:	for (i = 0; i < eventStack - MAX_PS_EVENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $169
JUMPV
LABELV $166
line 286
;286:		cent->currentState.event     = events[i];
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 events
ADDP4
INDIRI4
ASGNI4
line 287
;287:		cent->currentState.eventParm = eventParms[i];
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParms
ADDP4
INDIRI4
ASGNI4
line 288
;288:		if (cg_showmiss.integer) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $170
line 289
;289:			CG_Printf("Playing dropped event: %s %i", eventnames[events[i]], eventParms[i]);
ADDRGP4 $173
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 events
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventnames
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventParms
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 290
;290:		}
LABELV $170
line 291
;291:		CG_EntityEvent(cent, cent->lerpOrigin, eventParm2[i]);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 0
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
line 292
;292:		cg.eventSequence++;
ADDRLP4 20
ADDRGP4 cg+108864
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 293
;293:	}
LABELV $167
line 285
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $169
ADDRLP4 0
INDIRI4
ADDRGP4 eventStack
INDIRI4
CNSTI4 2
SUBI4
LTI4 $166
line 295
;294:
;295:	cent->currentState.event     = oldEvent;
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 296
;296:	cent->currentState.eventParm = oldParam;
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 297
;297:}
LABELV $160
endproc CG_PlayDroppedEvents 24 12
proc CG_AddArmor 4 0
line 299
;298:
;299:static void CG_AddArmor(const gitem_t* item, int quantity) {
line 301
;300:
;301:	cg.predictedPlayerState.stats[STAT_ARMOR] += quantity;
ADDRLP4 0
ADDRGP4 cg+107636+184+12
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 303
;302:
;303:	if (cg.predictedPlayerState.stats[STAT_ARMOR] > cg.predictedPlayerState.stats[STAT_MAX_HEALTH] * 2)
ADDRGP4 cg+107636+184+12
INDIRI4
ADDRGP4 cg+107636+184+24
INDIRI4
CNSTI4 1
LSHI4
LEI4 $179
line 304
;304:		cg.predictedPlayerState.stats[STAT_ARMOR] = cg.predictedPlayerState.stats[STAT_MAX_HEALTH] * 2;
ADDRGP4 cg+107636+184+12
ADDRGP4 cg+107636+184+24
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
LABELV $179
line 305
;305:}
LABELV $175
endproc CG_AddArmor 4 0
proc CG_AddAmmo 12 0
line 307
;306:
;307:static void CG_AddAmmo(int weapon, int count) {
line 308
;308:	if (weapon == WP_GAUNTLET || weapon == WP_GRAPPLING_HOOK) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $196
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $194
LABELV $196
line 309
;309:		cg.predictedPlayerState.ammo[weapon] = -1;
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
CNSTI4 -1
ASGNI4
line 310
;310:	} else {
ADDRGP4 $195
JUMPV
LABELV $194
line 311
;311:		cg.predictedPlayerState.ammo[weapon] += count;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 312
;312:		if (weapon >= WP_MACHINEGUN && weapon <= WP_BFG) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LTI4 $201
ADDRLP4 8
INDIRI4
CNSTI4 9
GTI4 $201
line 313
;313:			if (cg.predictedPlayerState.ammo[weapon] > AMMO_HARD_LIMIT) {
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
INDIRI4
CNSTI4 200
LEI4 $203
line 314
;314:				cg.predictedPlayerState.ammo[weapon] = AMMO_HARD_LIMIT;
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
CNSTI4 200
ASGNI4
line 315
;315:			}
LABELV $203
line 316
;316:		}
LABELV $201
line 317
;317:	}
LABELV $195
line 318
;318:}
LABELV $193
endproc CG_AddAmmo 12 0
proc CG_AddWeapon 4 8
line 320
;319:
;320:static void CG_AddWeapon(int weapon, int quantity, qboolean dropped) {
line 326
;321:	// int	ammo;
;322:
;323:	// ammo = quantity;
;324:
;325:	// dropped items and teamplay weapons always have full ammo
;326:	if (!dropped && cgs.gametype != GT_TEAM) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $210
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
EQI4 $210
line 327
;327:		if (cg.predictedPlayerState.ammo[weapon] < quantity) {
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
GEI4 $213
line 328
;328:			quantity = quantity - cg.predictedPlayerState.ammo[weapon];
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
INDIRI4
SUBI4
ASGNI4
line 329
;329:		} else {
ADDRGP4 $214
JUMPV
LABELV $213
line 330
;330:			quantity = 1;
ADDRFP4 4
CNSTI4 1
ASGNI4
line 331
;331:		}
LABELV $214
line 332
;332:	}
LABELV $210
line 335
;333:
;334:	// add the weapon
;335:	cg.predictedPlayerState.stats[STAT_WEAPONS] |= (1 << weapon);
ADDRLP4 0
ADDRGP4 cg+107636+184+8
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 337
;336:
;337:	CG_AddAmmo(weapon, quantity);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_AddAmmo
CALLV
pop
line 338
;338:}
LABELV $209
endproc CG_AddWeapon 4 8
proc CG_CheckArmor 16 4
line 340
;339:
;340:static int CG_CheckArmor(int damage) {
line 344
;341:	int save;
;342:	int count;
;343:
;344:	count = cg.predictedPlayerState.stats[STAT_ARMOR];
ADDRLP4 4
ADDRGP4 cg+107636+184+12
INDIRI4
ASGNI4
line 346
;345:
;346:	save = ceil(damage * ARMOR_PROTECTION);
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1059648963
MULF4
ARGF4
ADDRLP4 8
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 348
;347:
;348:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $226
line 349
;349:		save = count;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $226
line 351
;350:
;351:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $228
line 352
;352:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $222
JUMPV
LABELV $228
line 354
;353:
;354:	cg.predictedPlayerState.stats[STAT_ARMOR] -= save;
ADDRLP4 12
ADDRGP4 cg+107636+184+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 356
;355:
;356:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $222
endproc CG_CheckArmor 16 4
export CG_AddFallDamage
proc CG_AddFallDamage 16 4
line 359
;357:}
;358:
;359:void CG_AddFallDamage(int damage) {
line 362
;360:	int take, asave;
;361:
;362:	if (cg.predictedPlayerState.powerups[PW_BATTLESUIT])
ADDRGP4 cg+107636+312+8
INDIRI4
CNSTI4 0
EQI4 $234
line 363
;363:		return;
ADDRGP4 $233
JUMPV
LABELV $234
line 365
;364:
;365:	if (cg.predictedPlayerState.clientNum != cg.snap->ps.clientNum || cg.snap->ps.pm_flags & PMF_FOLLOW) {
ADDRGP4 cg+107636+140
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $245
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $239
LABELV $245
line 366
;366:		return;
ADDRGP4 $233
JUMPV
LABELV $239
line 369
;367:	}
;368:
;369:	take = damage;
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
line 371
;370:
;371:	asave = CG_CheckArmor(take);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_CheckArmor
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 373
;372:
;373:	take -= asave;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 375
;374:
;375:	cg.predictedPlayerState.stats[STAT_HEALTH] -= take;
ADDRLP4 12
ADDRGP4 cg+107636+184
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 382
;376:
;377:#if 0
;378:	CG_Printf( "take: %i asave:%i health:%i armor:%i\n", take, asave, 
;379:		cg.predictedPlayerState.stats[STAT_HEALTH], cg.predictedPlayerState.stats[STAT_ARMOR] );
;380:#endif
;381:
;382:	cg.predictedPlayerState.damagePitch = 255;
ADDRGP4 cg+107636+176
CNSTI4 255
ASGNI4
line 383
;383:	cg.predictedPlayerState.damageYaw   = 255;
ADDRGP4 cg+107636+172
CNSTI4 255
ASGNI4
line 385
;384:	// cg.predictedPlayerState.damageEvent++;
;385:	cg.predictedPlayerState.damageCount = take + asave;
ADDRGP4 cg+107636+180
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 386
;386:}
LABELV $233
endproc CG_AddFallDamage 16 4
proc CG_PickupPrediction 16 12
line 388
;387:
;388:static void CG_PickupPrediction(centity_t* cent, const gitem_t* item) {
line 391
;389:
;390:	// health prediction
;391:	if (item->giType == IT_HEALTH && cent->currentState.time2 > 0) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 4
NEI4 $255
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $255
line 394
;392:		int limit;
;393:
;394:		limit = cg.predictedPlayerState.stats[STAT_MAX_HEALTH];  // soft limit
ADDRLP4 0
ADDRGP4 cg+107636+184+24
INDIRI4
ASGNI4
line 395
;395:		if (!Q_stricmp(item->classname, "item_health_small") || !Q_stricmp(item->classname, "item_health_mega")) {
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $262
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $264
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $260
LABELV $264
line 396
;396:			limit *= 2;  // hard limit
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 397
;397:		}
LABELV $260
line 399
;398:
;399:		cg.predictedPlayerState.stats[STAT_HEALTH] += cent->currentState.time2;
ADDRLP4 12
ADDRGP4 cg+107636+184
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDI4
ASGNI4
line 400
;400:		if (cg.predictedPlayerState.stats[STAT_HEALTH] > limit) {
ADDRGP4 cg+107636+184
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $267
line 401
;401:			cg.predictedPlayerState.stats[STAT_HEALTH] = limit;
ADDRGP4 cg+107636+184
ADDRLP4 0
INDIRI4
ASGNI4
line 402
;402:		}
LABELV $267
line 403
;403:	}
LABELV $255
line 406
;404:
;405:	// armor prediction
;406:	if (item->giType == IT_ARMOR && cent->currentState.time2 > 0) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 3
NEI4 $273
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $273
line 407
;407:		CG_AddArmor(item, cent->currentState.time2);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddArmor
CALLV
pop
line 408
;408:		return;
ADDRGP4 $254
JUMPV
LABELV $273
line 412
;409:	}
;410:
;411:	// ammo prediction
;412:	if (item->giType == IT_AMMO && cent->currentState.time2 > 0) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $275
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $275
line 413
;413:		CG_AddAmmo(item->giTag, cent->currentState.time2);
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddAmmo
CALLV
pop
line 414
;414:		return;
ADDRGP4 $254
JUMPV
LABELV $275
line 418
;415:	}
;416:
;417:	// weapon prediction
;418:	if (item->giType == IT_WEAPON && cent->currentState.time2 > 0) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $277
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 0
LEI4 $277
line 419
;419:		CG_AddWeapon(item->giTag, cent->currentState.time2, (cent->currentState.modelindex2 == 1));
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 1
NEI4 $280
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $281
JUMPV
LABELV $280
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $281
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_AddWeapon
CALLV
pop
line 420
;420:		return;
ADDRGP4 $254
JUMPV
LABELV $277
line 424
;421:	}
;422:
;423:	// powerups prediction
;424:	if (item->giType == IT_POWERUP && item->giTag >= PW_QUAD && item->giTag <= PW_FLIGHT) {
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $282
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
LTI4 $282
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
GTI4 $282
line 426
;425:		// round timing to seconds to make multiple powerup timers count in sync
;426:		if (!cg.predictedPlayerState.powerups[item->giTag]) {
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $284
line 427
;427:			cg.predictedPlayerState.powerups[item->giTag] = cg.predictedPlayerState.commandTime - (cg.predictedPlayerState.commandTime % 1000);
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+312
ADDP4
ADDRGP4 cg+107636
INDIRI4
ADDRGP4 cg+107636
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 429
;428:			// this assumption is correct only on transition and implies hardcoded 1.3 coefficient:
;429:			if (item->giTag == PW_HASTE) {
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 3
NEI4 $292
line 430
;430:				cg.predictedPlayerState.speed *= 1.3f;
ADDRLP4 4
ADDRGP4 cg+107636+52
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1067869798
MULF4
CVFI4 4
ASGNI4
line 431
;431:			}
LABELV $292
line 432
;432:		}
LABELV $284
line 433
;433:		cg.predictedPlayerState.powerups[item->giTag] += cent->currentState.time2 * 1000;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+312
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 434
;434:	}
LABELV $282
line 437
;435:
;436:	// holdable prediction
;437:	if (item->giType == IT_HOLDABLE && (item->giTag == HI_TELEPORTER || item->giTag == HI_MEDKIT)) {
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 6
NEI4 $298
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
EQI4 $300
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
NEI4 $298
LABELV $300
line 438
;438:		cg.predictedPlayerState.stats[STAT_HOLDABLE_ITEM] = item - bg_itemlist;
ADDRGP4 cg+107636+184+4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 439
;439:	}
LABELV $298
line 440
;440:}
LABELV $254
endproc CG_PickupPrediction 16 12
proc CG_TouchItem 28 16
line 447
;441:
;442:/*
;443:===================
;444:CG_TouchItem
;445:===================
;446:*/
;447:static void CG_TouchItem(centity_t* cent) {
line 450
;448:	const gitem_t* item;
;449:
;450:	if (cg.allowPickupPrediction && cg.allowPickupPrediction > cg.time) {
ADDRGP4 cg+149076
INDIRI4
CNSTI4 0
EQI4 $305
ADDRGP4 cg+149076
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $305
line 451
;451:		return;
ADDRGP4 $304
JUMPV
LABELV $305
line 454
;452:	}
;453:
;454:	if (!cg_predictItems.integer) {
ADDRGP4 cg_predictItems+12
INDIRI4
CNSTI4 0
NEI4 $310
line 455
;455:		return;
ADDRGP4 $304
JUMPV
LABELV $310
line 458
;456:	}
;457:
;458:	if (!BG_PlayerTouchesItem(&cg.predictedPlayerState, &cent->currentState, cg.time)) {
ADDRGP4 cg+107636
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BG_PlayerTouchesItem
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $313
line 459
;459:		return;
ADDRGP4 $304
JUMPV
LABELV $313
line 463
;460:	}
;461:
;462:	// never pick an item up twice in a prediction
;463:	if (cent->delaySpawn > cg.time) {
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $317
line 464
;464:		return;
ADDRGP4 $304
JUMPV
LABELV $317
line 467
;465:	}
;466:
;467:	if (!BG_CanItemBeGrabbed(cgs.gametype, &cent->currentState, &cg.predictedPlayerState)) {
ADDRGP4 cgs+31480
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cg+107636
ARGP4
ADDRLP4 8
ADDRGP4 BG_CanItemBeGrabbed
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $320
line 468
;468:		return;  // can't hold it
ADDRGP4 $304
JUMPV
LABELV $320
line 471
;469:	}
;470:
;471:	item = &bg_itemlist[cent->currentState.modelindex];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 483
;472:
;473:	// Special case for flags.
;474:	// We don't predict touching our own flag
;475:#ifdef MISSIONPACK
;476:	if (cgs.gametype == GT_1FCTF) {
;477:		if (item->giTag != PW_NEUTRALFLAG) {
;478:			return;
;479:		}
;480:	}
;481:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_HARVESTER) {
;482:#else
;483:	if (cgs.gametype == GT_CTF) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
NEI4 $324
line 485
;484:#endif
;485:		if (cg.predictedPlayerState.persistant[PERS_TEAM] == TEAM_RED && item->giType == IT_TEAM && item->giTag == PW_REDFLAG)
ADDRGP4 cg+107636+248+12
INDIRI4
CNSTI4 1
NEI4 $327
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $327
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $327
line 486
;486:			return;
ADDRGP4 $304
JUMPV
LABELV $327
line 487
;487:		if (cg.predictedPlayerState.persistant[PERS_TEAM] == TEAM_BLUE && item->giType == IT_TEAM && item->giTag == PW_BLUEFLAG)
ADDRGP4 cg+107636+248+12
INDIRI4
CNSTI4 2
NEI4 $332
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $332
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $332
line 488
;488:			return;
ADDRGP4 $304
JUMPV
LABELV $332
line 489
;489:	}
LABELV $324
line 492
;490:
;491:	// grab it
;492:	BG_AddPredictableEventToPlayerstate(EV_ITEM_PICKUP, cent->currentState.modelindex, &cg.predictedPlayerState, cent - cg_entities);
CNSTI4 19
ARGI4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+107636
ARGP4
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRGP4 cg_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 740
DIVI4
ARGI4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 495
;493:
;494:	// perform prediction
;495:	CG_PickupPrediction(cent, item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PickupPrediction
CALLV
pop
line 498
;496:
;497:	// remove it from the frame so it won't be drawn
;498:	cent->currentState.eFlags |= EF_NODRAW;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 501
;499:
;500:	// don't touch it again this prediction
;501:	cent->miscTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 504
;502:
;503:	// delay next potential pickup for some time
;504:	cent->delaySpawn       = cg.time + (cg.meanPing > 0 ? cg.meanPing * 2 + 100 : 333);
ADDRGP4 cg+149068
INDIRI4
CNSTI4 0
LEI4 $343
ADDRLP4 20
ADDRGP4 cg+149068
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 100
ADDI4
ASGNI4
ADDRGP4 $344
JUMPV
LABELV $343
ADDRLP4 20
CNSTI4 333
ASGNI4
LABELV $344
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 505
;505:	cent->delaySpawnPlayed = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTI4 0
ASGNI4
line 508
;506:
;507:	// if it's a weapon, give them some predicted ammo so the autoswitch will work
;508:	if (item->giType == IT_WEAPON) {
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $345
line 509
;509:		cg.predictedPlayerState.stats[STAT_WEAPONS] |= 1 << item->giTag;
ADDRLP4 24
ADDRGP4 cg+107636+184+8
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BORI4
ASGNI4
line 510
;510:		if (!cg.predictedPlayerState.ammo[item->giTag]) {
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
INDIRI4
CNSTI4 0
NEI4 $350
line 511
;511:			cg.predictedPlayerState.ammo[item->giTag] = 1;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+376
ADDP4
CNSTI4 1
ASGNI4
line 512
;512:		}
LABELV $350
line 513
;513:	}
LABELV $345
line 514
;514:}
LABELV $304
endproc CG_TouchItem 28 16
proc CG_TouchTriggerPrediction 84 28
line 523
;515:
;516:/*
;517:=========================
;518:CG_TouchTriggerPrediction
;519:
;520:Predict push triggers and items
;521:=========================
;522:*/
;523:static void CG_TouchTriggerPrediction(void) {
line 532
;524:	int            i;
;525:	trace_t        trace;
;526:	entityState_t* ent;
;527:	clipHandle_t   cmodel;
;528:	centity_t*     cent;
;529:	qboolean       spectator;
;530:
;531:	// dead clients don't activate triggers
;532:	if (cg.predictedPlayerState.stats[STAT_HEALTH] <= 0) {
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $357
line 533
;533:		return;
ADDRGP4 $356
JUMPV
LABELV $357
line 536
;534:	}
;535:
;536:	spectator = (cg.predictedPlayerState.pm_type == PM_SPECTATOR);
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 2
NEI4 $364
ADDRLP4 76
CNSTI4 1
ASGNI4
ADDRGP4 $365
JUMPV
LABELV $364
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $365
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 538
;537:
;538:	if (cg.predictedPlayerState.pm_type != PM_NORMAL && !spectator) {
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 0
EQI4 $366
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $366
line 539
;539:		return;
ADDRGP4 $356
JUMPV
LABELV $366
line 542
;540:	}
;541:
;542:	for (i = 0; i < cg_numTriggerEntities; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $373
JUMPV
LABELV $370
line 543
;543:		cent = cg_triggerEntities[i];
ADDRLP4 12
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_triggerEntities
ADDP4
INDIRP4
ASGNP4
line 544
;544:		ent  = &cent->currentState;
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 546
;545:
;546:		if (ent->eType == ET_ITEM && !spectator) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $374
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $374
line 547
;547:			CG_TouchItem(cent);
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 CG_TouchItem
CALLV
pop
line 548
;548:			continue;
ADDRGP4 $371
JUMPV
LABELV $374
line 551
;549:		}
;550:
;551:		if (ent->solid != SOLID_BMODEL) {
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
EQI4 $376
line 552
;552:			continue;
ADDRGP4 $371
JUMPV
LABELV $376
line 555
;553:		}
;554:
;555:		cmodel = trap_CM_InlineModel(ent->modelindex);
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRLP4 80
ADDRGP4 trap_CM_InlineModel
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 80
INDIRI4
ASGNI4
line 556
;556:		if (!cmodel) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $378
line 557
;557:			continue;
ADDRGP4 $371
JUMPV
LABELV $378
line 560
;558:		}
;559:
;560:		trap_CM_BoxTrace(&trace, cg.predictedPlayerState.origin, cg.predictedPlayerState.origin, cg_pmove.mins, cg_pmove.maxs, cmodel, -1);
ADDRLP4 16
ARGP4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg_pmove+176
ARGP4
ADDRGP4 cg_pmove+188
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 -1
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 562
;561:
;562:		if (!trace.startsolid) {
ADDRLP4 16+4
INDIRI4
CNSTI4 0
NEI4 $386
line 563
;563:			continue;
ADDRGP4 $371
JUMPV
LABELV $386
line 566
;564:		}
;565:
;566:		if (ent->eType == ET_TELEPORT_TRIGGER) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
NEI4 $389
line 567
;567:			cg.hyperspace = qtrue;
ADDRGP4 cg+107632
CNSTI4 1
ASGNI4
line 568
;568:		} else if (ent->eType == ET_PUSH_TRIGGER) {
ADDRGP4 $390
JUMPV
LABELV $389
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
NEI4 $392
line 569
;569:			BG_TouchJumpPad(&cg.predictedPlayerState, ent);
ADDRGP4 cg+107636
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BG_TouchJumpPad
CALLV
pop
line 570
;570:		}
LABELV $392
LABELV $390
line 571
;571:	}
LABELV $371
line 542
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $373
ADDRLP4 4
INDIRI4
ADDRGP4 cg_numTriggerEntities
INDIRI4
LTI4 $370
line 574
;572:
;573:	// if we didn't touch a jump pad this pmove frame
;574:	if (cg.predictedPlayerState.jumppad_frame != cg.predictedPlayerState.pmove_framecount) {
ADDRGP4 cg+107636+460
INDIRI4
ADDRGP4 cg+107636+456
INDIRI4
EQI4 $395
line 575
;575:		cg.predictedPlayerState.jumppad_frame = 0;
ADDRGP4 cg+107636+460
CNSTI4 0
ASGNI4
line 576
;576:		cg.predictedPlayerState.jumppad_ent   = 0;
ADDRGP4 cg+107636+448
CNSTI4 0
ASGNI4
line 577
;577:	}
LABELV $395
line 578
;578:}
LABELV $356
endproc CG_TouchTriggerPrediction 84 28
proc CG_CheckTimers 16 0
line 580
;579:
;580:static void CG_CheckTimers(void) {
line 584
;581:	int i;
;582:
;583:	// no prediction for spectators
;584:	if (cg.predictedPlayerState.pm_type == PM_SPECTATOR) {
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 2
NEI4 $406
line 585
;585:		return;
ADDRGP4 $405
JUMPV
LABELV $406
line 589
;586:	}
;587:
;588:	// no armor/health/powerups prediction for dead bodies
;589:	if (cg.predictedPlayerState.stats[STAT_HEALTH] <= 0)
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $410
line 590
;590:		return;
ADDRGP4 $405
JUMPV
LABELV $410
line 593
;591:
;592:	// periodic tasks
;593:	if (cg.timeResidual && cg.predictedPlayerState.commandTime >= cg.timeResidual && !cg.thisFrameTeleport) {
ADDRGP4 cg+149072
INDIRI4
CNSTI4 0
EQI4 $414
ADDRGP4 cg+107636
INDIRI4
ADDRGP4 cg+149072
INDIRI4
LTI4 $414
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
NEI4 $414
line 594
;594:		cg.timeResidual += 1000;
ADDRLP4 4
ADDRGP4 cg+149072
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 595
;595:		if (cg.predictedPlayerState.powerups[PW_REGEN]) {
ADDRGP4 cg+107636+312+20
INDIRI4
CNSTI4 0
EQI4 $421
line 596
;596:			int maxhealth = cg.predictedPlayerState.stats[STAT_MAX_HEALTH];
ADDRLP4 8
ADDRGP4 cg+107636+184+24
INDIRI4
ASGNI4
line 597
;597:			if (cg.predictedPlayerState.stats[STAT_HEALTH] < maxhealth) {
ADDRGP4 cg+107636+184
INDIRI4
ADDRLP4 8
INDIRI4
GEI4 $429
line 598
;598:				cg.predictedPlayerState.stats[STAT_HEALTH] += 15;
ADDRLP4 12
ADDRGP4 cg+107636+184
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
line 599
;599:				if (cg.predictedPlayerState.stats[STAT_HEALTH] > maxhealth * 1.1) {
ADDRGP4 cg+107636+184
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1066192077
MULF4
LEF4 $422
line 600
;600:					cg.predictedPlayerState.stats[STAT_HEALTH] = maxhealth * 1.1;
ADDRGP4 cg+107636+184
ADDRLP4 8
INDIRI4
CVIF4 4
CNSTF4 1066192077
MULF4
CVFI4 4
ASGNI4
line 601
;601:				}
line 603
;602:				// TODO: add external EV_POWERUP_REGEN
;603:			} else if (cg.predictedPlayerState.stats[STAT_HEALTH] < maxhealth * 2) {
ADDRGP4 $422
JUMPV
LABELV $429
ADDRGP4 cg+107636+184
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
GEI4 $422
line 604
;604:				cg.predictedPlayerState.stats[STAT_HEALTH] += 5;
ADDRLP4 12
ADDRGP4 cg+107636+184
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 605
;605:				if (cg.predictedPlayerState.stats[STAT_HEALTH] > maxhealth * 2) {
ADDRGP4 cg+107636+184
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
LEI4 $422
line 606
;606:					cg.predictedPlayerState.stats[STAT_HEALTH] = maxhealth * 2;
ADDRGP4 cg+107636+184
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 607
;607:				}
line 609
;608:				// TODO: add external EV_POWERUP_REGEN
;609:			}
line 610
;610:		} else {
ADDRGP4 $422
JUMPV
LABELV $421
line 611
;611:			if (cg.predictedPlayerState.stats[STAT_HEALTH] > cg.predictedPlayerState.stats[STAT_MAX_HEALTH]) {
ADDRGP4 cg+107636+184
INDIRI4
ADDRGP4 cg+107636+184+24
INDIRI4
LEI4 $453
line 612
;612:				cg.predictedPlayerState.stats[STAT_HEALTH]--;
ADDRLP4 8
ADDRGP4 cg+107636+184
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 613
;613:			}
LABELV $453
line 614
;614:		}
LABELV $422
line 615
;615:		if (cg.predictedPlayerState.stats[STAT_ARMOR] > cg.predictedPlayerState.stats[STAT_MAX_HEALTH]) {
ADDRGP4 cg+107636+184+12
INDIRI4
ADDRGP4 cg+107636+184+24
INDIRI4
LEI4 $462
line 616
;616:			cg.predictedPlayerState.stats[STAT_ARMOR]--;
ADDRLP4 8
ADDRGP4 cg+107636+184+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 617
;617:		}
LABELV $462
line 618
;618:	}
LABELV $414
line 621
;619:
;620:	// turn off any expired powerups
;621:	for (i = 0; i < MAX_POWERUPS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $473
line 622
;622:		if (!cg.predictedPlayerState.powerups[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+312
ADDP4
INDIRI4
CNSTI4 0
NEI4 $477
line 623
;623:			continue;
ADDRGP4 $474
JUMPV
LABELV $477
line 624
;624:		if (cg.predictedPlayerState.powerups[i] < cg.predictedPlayerState.commandTime) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+312
ADDP4
INDIRI4
ADDRGP4 cg+107636
INDIRI4
GEI4 $481
line 625
;625:			cg.predictedPlayerState.powerups[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+107636+312
ADDP4
CNSTI4 0
ASGNI4
line 626
;626:		}
LABELV $481
line 627
;627:	}
LABELV $474
line 621
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $473
line 628
;628:}
LABELV $405
endproc CG_CheckTimers 16 0
proc CG_IsUnacceptableError 164 36
line 630
;629:
;630:static int CG_IsUnacceptableError(playerState_t* ps, playerState_t* pps, qboolean* forceMove) {
line 634
;631:	vec3_t delta;
;632:	int    i, n, v0, v1;
;633:
;634:	if (pps->pm_time != ps->pm_time || pps->pm_type != ps->pm_type || pps->pm_flags != ps->pm_flags) {
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
NEI4 $492
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $492
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
EQI4 $489
LABELV $492
line 635
;635:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $488
JUMPV
LABELV $489
line 638
;636:	}
;637:
;638:	VectorSubtract(pps->origin, ps->origin, delta);
ADDRLP4 36
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 36
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 639
;639:	if (VectorLengthSquared(delta) > 0.01f * 0.01f) {
ADDRLP4 12
ARGP4
ADDRLP4 44
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 953267991
LEF4 $495
line 640
;640:		if (cg_showmiss.integer > 2) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 2
LEI4 $497
line 641
;641:			CG_Printf("origin delta: %.2f  ", VectorLength(delta));
ADDRLP4 12
ARGP4
ADDRLP4 48
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRGP4 $500
ARGP4
ADDRLP4 48
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 642
;642:		}
LABELV $497
line 643
;643:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $488
JUMPV
LABELV $495
line 646
;644:	}
;645:
;646:	VectorSubtract(pps->velocity, ps->velocity, delta);
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 48
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 48
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 52
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
SUBF4
ASGNF4
line 647
;647:	if (VectorLengthSquared(delta) > 0.01f * 0.01f) {
ADDRLP4 12
ARGP4
ADDRLP4 56
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 56
INDIRF4
CNSTF4 953267991
LEF4 $503
line 648
;648:		if (cg_showmiss.integer > 2) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 2
LEI4 $505
line 649
;649:			CG_Printf("velocity delta: %.2f  ", VectorLength(delta));
ADDRLP4 12
ARGP4
ADDRLP4 60
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRGP4 $508
ARGP4
ADDRLP4 60
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 650
;650:		}
LABELV $505
line 651
;651:		return 3;
CNSTI4 3
RETI4
ADDRGP4 $488
JUMPV
LABELV $503
line 654
;652:	}
;653:
;654:	if (pps->weaponTime != ps->weaponTime || pps->gravity != ps->gravity || pps->speed != ps->speed || pps->delta_angles[0] != ps->delta_angles[0] ||
ADDRLP4 60
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
NEI4 $516
ADDRLP4 60
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
NEI4 $516
ADDRLP4 60
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
NEI4 $516
ADDRLP4 60
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
NEI4 $516
ADDRLP4 60
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
NEI4 $516
ADDRLP4 60
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
NEI4 $516
ADDRLP4 60
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
EQI4 $509
LABELV $516
line 655
;655:	    pps->delta_angles[1] != ps->delta_angles[1] || pps->delta_angles[2] != ps->delta_angles[2] || pps->groundEntityNum != ps->groundEntityNum) {
line 656
;656:		if (cg_showmiss.integer > 1)
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $517
line 657
;657:			CG_Printf(
ADDRGP4 $520
ARGP4
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRLP4 68
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $517
line 661
;658:				"%i %i %i %i => %i %i %i %i", pps->weaponTime, pps->gravity, pps->speed, pps->groundEntityNum, ps->weaponTime, ps->gravity, ps->speed,
;659:				ps->groundEntityNum);
;660:
;661:		return 4;
CNSTI4 4
RETI4
ADDRGP4 $488
JUMPV
LABELV $509
line 665
;662:	}
;663:
;664:	// forward gesture animation
;665:	if (pps->torsoAnim != ps->torsoAnim && (ps->torsoAnim & ~ANIM_TOGGLEBIT) == TORSO_GESTURE) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
EQI4 $521
ADDRLP4 68
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 6
NEI4 $521
line 666
;666:		for (n = 0; n < NUM_SAVED_STATES; n++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $523
line 667
;667:			cg.savedPmoveStates[n].torsoAnim  = ps->torsoAnim;
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+118172+84
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ASGNI4
line 668
;668:			cg.savedPmoveStates[n].torsoTimer = ps->torsoTimer;
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+118172+80
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 669
;669:		}
LABELV $524
line 666
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $523
line 670
;670:	}
LABELV $521
line 672
;671:
;672:	if (pps->legsTimer != ps->legsTimer || pps->legsAnim != ps->legsAnim || pps->torsoTimer != ps->torsoTimer || pps->torsoAnim != ps->torsoAnim ||
ADDRLP4 72
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
NEI4 $536
ADDRLP4 72
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
NEI4 $536
ADDRLP4 72
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
NEI4 $536
ADDRLP4 72
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
NEI4 $536
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
ADDRLP4 76
INDIRP4
CNSTI4 88
ADDP4
INDIRI4
EQI4 $531
LABELV $536
line 673
;673:	    pps->movementDir != ps->movementDir) {
line 674
;674:		return 5;
CNSTI4 5
RETI4
ADDRGP4 $488
JUMPV
LABELV $531
line 677
;675:	}
;676:
;677:	VectorSubtract(pps->grapplePoint, ps->grapplePoint, delta);
ADDRLP4 80
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 80
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 80
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 84
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 678
;678:	if (VectorLengthSquared(delta) > 0.01f * 0.01f)
ADDRLP4 12
ARGP4
ADDRLP4 88
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 88
INDIRF4
CNSTF4 953267991
LEF4 $539
line 679
;679:		return 6;
CNSTI4 6
RETI4
ADDRGP4 $488
JUMPV
LABELV $539
line 682
;680:
;681:	// check/update eFlags if needed
;682:	v0 = pps->eFlags & EF_NOPREDICT;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 784456
BANDI4
ASGNI4
line 683
;683:	v1 = ps->eFlags & EF_NOPREDICT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 784456
BANDI4
ASGNI4
line 684
;684:	if (v0 != v1) {
ADDRLP4 8
INDIRI4
ADDRLP4 24
INDIRI4
EQI4 $541
line 685
;685:		for (i = 0; i < NUM_SAVED_STATES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $543
line 686
;686:			cg.savedPmoveStates[i].eFlags = (cg.savedPmoveStates[i].eFlags & ~EF_NOPREDICT) | v1;
ADDRLP4 0
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+118172+104
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+118172+104
ADDP4
INDIRI4
CNSTI4 -784457
BANDI4
ADDRLP4 24
INDIRI4
BORI4
ASGNI4
line 687
;687:		}
LABELV $544
line 685
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 66
LTI4 $543
line 688
;688:		pps->eFlags = (pps->eFlags & ~EF_NOPREDICT) | v1;
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 -784457
BANDI4
ADDRLP4 24
INDIRI4
BORI4
ASGNI4
line 689
;689:	}
LABELV $541
line 691
;690:
;691:	if (pps->eFlags != ps->eFlags) {
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
EQI4 $551
line 692
;692:		if (cg_showmiss.integer > 1)
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $553
line 693
;693:			CG_Printf("eFlags %i => %i", pps->eFlags, ps->eFlags);
ADDRGP4 $556
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $553
line 694
;694:		return 7;
CNSTI4 7
RETI4
ADDRGP4 $488
JUMPV
LABELV $551
line 697
;695:	}
;696:
;697:	if (pps->eventSequence != ps->eventSequence)
ADDRFP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
EQI4 $557
line 698
;698:		return 8;
CNSTI4 8
RETI4
ADDRGP4 $488
JUMPV
LABELV $557
line 700
;699:
;700:	for (i = 0; i < MAX_PS_EVENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $559
line 701
;701:		if (pps->events[i] != ps->events[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
EQI4 $563
line 702
;702:			if (cg_showmiss.integer > 1) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $565
line 703
;703:				CG_Printf("event[%i] %i => %i\n", i, pps->events[i], ps->events[i]);
ADDRGP4 $568
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 704
;704:			}
LABELV $565
line 705
;705:			return 9;
CNSTI4 9
RETI4
ADDRGP4 $488
JUMPV
LABELV $563
line 707
;706:		}
;707:		if (pps->eventParms[i] != ps->eventParms[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
EQI4 $569
line 708
;708:			if (cg_showmiss.integer > 1) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $571
line 709
;709:				CG_Printf("eventParms[%i] %i => %i\n", i, pps->eventParms[i], ps->eventParms[i]);
ADDRGP4 $574
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 120
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 710
;710:			}
LABELV $571
line 711
;711:			return 9;
CNSTI4 9
RETI4
ADDRGP4 $488
JUMPV
LABELV $569
line 713
;712:		}
;713:	}
LABELV $560
line 700
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $559
line 715
;714:
;715:	if (pps->externalEvent != ps->externalEvent || pps->externalEventParm != ps->externalEventParm || pps->externalEventTime != ps->externalEventTime) {
ADDRLP4 92
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
NEI4 $578
ADDRLP4 92
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
NEI4 $578
ADDRLP4 92
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
ADDRLP4 96
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
EQI4 $575
LABELV $578
line 716
;716:		return 10;
CNSTI4 10
RETI4
ADDRGP4 $488
JUMPV
LABELV $575
line 719
;717:	}
;718:
;719:	if (pps->clientNum != ps->clientNum || pps->weapon != ps->weapon || pps->weaponstate != ps->weaponstate) {
ADDRLP4 100
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ADDRLP4 104
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
NEI4 $582
ADDRLP4 100
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ADDRLP4 104
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
NEI4 $582
ADDRLP4 100
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRLP4 104
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
EQI4 $579
LABELV $582
line 720
;720:		return 11;
CNSTI4 11
RETI4
ADDRGP4 $488
JUMPV
LABELV $579
line 723
;721:	}
;722:
;723:	if (fabs(AngleDelta(ps->viewangles[0], pps->viewangles[0])) > 1.0f || fabs(AngleDelta(ps->viewangles[1], pps->viewangles[1])) > 1.0f ||
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 152
ADDP4
INDIRF4
ARGF4
ADDRLP4 108
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 108
INDIRF4
ARGF4
ADDRLP4 112
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 112
INDIRF4
CNSTF4 1065353216
GTF4 $586
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 156
ADDP4
INDIRF4
ARGF4
ADDRLP4 116
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 116
INDIRF4
ARGF4
ADDRLP4 120
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 120
INDIRF4
CNSTF4 1065353216
GTF4 $586
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ARGF4
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRF4
ARGF4
ADDRLP4 124
ADDRGP4 AngleDelta
CALLF4
ASGNF4
ADDRLP4 124
INDIRF4
ARGF4
ADDRLP4 128
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
CNSTF4 1065353216
LEF4 $583
LABELV $586
line 724
;724:	    fabs(AngleDelta(ps->viewangles[2], pps->viewangles[2])) > 1.0f) {
line 725
;725:		return 12;
CNSTI4 12
RETI4
ADDRGP4 $488
JUMPV
LABELV $583
line 728
;726:	}
;727:
;728:	if (pps->viewheight != ps->viewheight)
ADDRFP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
EQI4 $587
line 729
;729:		return 13;
CNSTI4 13
RETI4
ADDRGP4 $488
JUMPV
LABELV $587
line 731
;730:
;731:	if (pps->damageEvent != ps->damageEvent || pps->damageYaw != ps->damageYaw || pps->damagePitch != ps->damagePitch || pps->damageCount != ps->damageCount) {
ADDRLP4 132
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRLP4 136
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
NEI4 $593
ADDRLP4 132
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ADDRLP4 136
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
NEI4 $593
ADDRLP4 132
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ADDRLP4 136
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
NEI4 $593
ADDRLP4 132
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRLP4 136
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
EQI4 $589
LABELV $593
line 732
;732:		if (cg_showmiss.integer > 1)
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $594
line 733
;733:			CG_Printf(
ADDRGP4 $597
ARGP4
ADDRLP4 140
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 140
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ARGI4
ADDRLP4 144
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $594
line 736
;734:				"dmg %i %i %i %i >= %i %i %i %i\n", pps->damageEvent, pps->damageYaw, pps->damagePitch, pps->damageCount, ps->damageEvent, ps->damageYaw,
;735:				ps->damagePitch, ps->damageCount);
;736:		return 14;
CNSTI4 14
RETI4
ADDRGP4 $488
JUMPV
LABELV $589
line 740
;737:	}
;738:
;739:	// health countdown?
;740:	if (pps->stats[STAT_HEALTH] == ps->stats[STAT_HEALTH] + 1 && ps->stats[STAT_HEALTH] >= ps->stats[STAT_MAX_HEALTH]) {
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 140
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1
ADDI4
NEI4 $598
ADDRLP4 140
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRLP4 140
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LTI4 $598
line 741
;741:		cg.timeResidual = ps->commandTime + 1000;
ADDRGP4 cg+149072
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 742
;742:		for (n = 0; n < NUM_SAVED_STATES; n++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $601
line 743
;743:			cg.savedPmoveStates[n].stats[STAT_HEALTH] = ps->stats[STAT_HEALTH];
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+118172+184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 744
;744:		}
LABELV $602
line 742
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $601
line 745
;745:	}
LABELV $598
line 747
;746:	// armor countdown?
;747:	if (pps->stats[STAT_ARMOR] == ps->stats[STAT_ARMOR] - 1 && ps->stats[STAT_ARMOR] >= ps->stats[STAT_MAX_HEALTH]) {
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 144
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 1
SUBI4
NEI4 $607
ADDRLP4 144
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 144
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LTI4 $607
line 749
;748:		// we may need few frames to sync with client->timeResidual on server side
;749:		cg.timeResidual = ps->commandTime + 1000;
ADDRGP4 cg+149072
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 750
;750:		for (n = 0; n < NUM_SAVED_STATES; n++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $610
line 751
;751:			cg.savedPmoveStates[n].stats[STAT_ARMOR] = ps->stats[STAT_ARMOR];
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+118172+184+12
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 752
;752:		}
LABELV $611
line 750
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $610
line 753
;753:	}
LABELV $607
line 755
;754:
;755:	for (i = 0; i < MAX_STATS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $617
line 757
;756:		// we can't predict some flags
;757:		if (i == STAT_CLIENTS_READY /*|| i == STAT_MAX_HEALTH */) {
ADDRLP4 0
INDIRI4
CNSTI4 5
NEI4 $621
line 758
;758:			for (n = 0; n < NUM_SAVED_STATES; n++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $623
line 759
;759:				cg.savedPmoveStates[n].stats[i] = ps->stats[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+118172+184
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
ASGNI4
line 760
;760:			}
LABELV $624
line 758
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $623
line 761
;761:			continue;
ADDRGP4 $618
JUMPV
LABELV $621
line 763
;762:		}
;763:		if (pps->stats[i] != ps->stats[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
EQI4 $629
line 764
;764:			if (cg_showmiss.integer > 1) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $631
line 765
;765:				CG_Printf("stats[%i] %i => %i ", i, pps->stats[i], ps->stats[i]);
ADDRGP4 $634
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 766
;766:			}
LABELV $631
line 767
;767:			return 15;
CNSTI4 15
RETI4
ADDRGP4 $488
JUMPV
LABELV $629
line 769
;768:		}
;769:	}
LABELV $618
line 755
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $617
line 771
;770:
;771:	for (i = 0; i < MAX_PERSISTANT; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $635
line 772
;772:		if (pps->persistant[i] != ps->persistant[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
EQI4 $639
line 773
;773:			if (i >= PERS_TEAM && i <= PERS_PLAYEREVENTS) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $641
ADDRLP4 0
INDIRI4
CNSTI4 5
GTI4 $641
line 774
;774:				if (cg_showmiss.integer > 1) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $643
line 775
;775:					CG_Printf("persistant[%i] %i => %i ", i, pps->persistant[i], ps->persistant[i]);
ADDRGP4 $646
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 776
;776:				}
LABELV $643
line 777
;777:				return 16;
CNSTI4 16
RETI4
ADDRGP4 $488
JUMPV
LABELV $641
line 779
;778:			}
;779:			v0 = ps->persistant[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ASGNI4
line 780
;780:			for (n = 0; n < NUM_SAVED_STATES; n++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $647
line 781
;781:				cg.savedPmoveStates[n].persistant[i] = v0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+118172+248
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 782
;782:			}
LABELV $648
line 780
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 66
LTI4 $647
line 783
;783:			*forceMove = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 1
ASGNI4
line 784
;784:		}
LABELV $639
line 785
;785:	}
LABELV $636
line 771
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $635
line 787
;786:
;787:	for (i = 0; i < MAX_WEAPONS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $653
line 788
;788:		if (pps->ammo[i] != ps->ammo[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
EQI4 $657
line 789
;789:			if (cg_showmiss.integer > 1) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $659
line 790
;790:				CG_Printf("ammo[%i] %i => %i ", i, pps->ammo[i], ps->ammo[i]);
ADDRGP4 $662
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 791
;791:			}
LABELV $659
line 792
;792:			return 18;
CNSTI4 18
RETI4
ADDRGP4 $488
JUMPV
LABELV $657
line 794
;793:		}
;794:	}
LABELV $654
line 787
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $653
line 796
;795:
;796:	if (pps->generic1 != ps->generic1 || pps->loopSound != ps->loopSound) {
ADDRLP4 148
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ADDRLP4 152
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
NEI4 $665
ADDRLP4 148
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ADDRLP4 152
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
EQI4 $663
LABELV $665
line 797
;797:		return 19;
CNSTI4 19
RETI4
ADDRGP4 $488
JUMPV
LABELV $663
line 800
;798:	}
;799:
;800:	for (i = 0; i < MAX_POWERUPS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $666
line 801
;801:		if (pps->powerups[i] != ps->powerups[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
EQI4 $670
line 802
;802:			if (cg_showmiss.integer > 1)
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $672
line 803
;803:				CG_Printf("powerups[%i] %i => %i ", i, pps->powerups[i], ps->powerups[i]);
ADDRGP4 $675
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
LABELV $672
line 804
;804:			return 20;
CNSTI4 20
RETI4
ADDRGP4 $488
JUMPV
LABELV $670
line 806
;805:		}
;806:	}
LABELV $667
line 800
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $666
line 808
;807:
;808:	return 0;
CNSTI4 0
RETI4
LABELV $488
endproc CG_IsUnacceptableError 164 36
export CG_PredictPlayerState
proc CG_PredictPlayerState 596 28
line 837
;809:}
;810:
;811:/*
;812:=================
;813:CG_PredictPlayerState
;814:
;815:Generates cg.predictedPlayerState for the current cg.time
;816:cg.predictedPlayerState is guaranteed to be valid after exiting.
;817:
;818:For demo playback, this will be an interpolation between two valid
;819:playerState_t.
;820:
;821:For normal gameplay, it will be the result of predicted usercmd_t on
;822:top of the most recent playerState_t received from the server.
;823:
;824:Each new snapshot will usually have one or more new usercmd over the last,
;825:but we simulate all unacknowledged commands each time, not just the new ones.
;826:This means that on an internet connection, quite a few pmoves may be issued
;827:each frame.
;828:
;829:OPTIMIZE: don't re-simulate unless the newly arrived snapshot playerState_t
;830:differs from the predicted one.  Would require saving all intermediate
;831:playerState_t during prediction.
;832:
;833:We detect prediction errors and allow them to be decayed off over several frames
;834:to ease the jerk.
;835:=================
;836:*/
;837:void CG_PredictPlayerState(void) {
line 843
;838:	int           cmdNum, current;
;839:	playerState_t oldPlayerState;
;840:	qboolean      moved;
;841:	usercmd_t     oldestCmd;
;842:	usercmd_t     latestCmd;
;843:	int           stateIndex = 0, predictCmd = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 484
CNSTI4 0
ASGNI4
line 845
;844:
;845:	cg.hyperspace = qfalse;  // will be set if touching a trigger_teleport
ADDRGP4 cg+107632
CNSTI4 0
ASGNI4
line 850
;846:
;847:	// if this is the first frame we must guarantee
;848:	// predictedPlayerState is valid even if there is some
;849:	// other error condition
;850:	if (!cg.validPPS) {
ADDRGP4 cg+108844
INDIRI4
CNSTI4 0
NEI4 $678
line 851
;851:		cg.validPPS             = qtrue;
ADDRGP4 cg+108844
CNSTI4 1
ASGNI4
line 852
;852:		cg.predictedPlayerState = cg.snap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 853
;853:	}
LABELV $678
line 856
;854:
;855:	// demo playback just copies the moves
;856:	if (cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW)) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $688
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $684
LABELV $688
line 857
;857:		CG_InterpolatePlayerState(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
line 858
;858:		return;
ADDRGP4 $676
JUMPV
LABELV $684
line 862
;859:	}
;860:
;861:	// non-predicting local movement will grab the latest angles
;862:	if (cg_nopredict.integer || cgs.synchronousClients) {
ADDRGP4 cg_nopredict+12
INDIRI4
CNSTI4 0
NEI4 $693
ADDRGP4 cgs+149684
INDIRI4
CNSTI4 0
EQI4 $689
LABELV $693
line 863
;863:		CG_InterpolatePlayerState(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 CG_InterpolatePlayerState
CALLV
pop
line 864
;864:		return;
ADDRGP4 $676
JUMPV
LABELV $689
line 868
;865:	}
;866:
;867:	// prepare for pmove
;868:	cg_pmove.ps            = &cg.predictedPlayerState;
ADDRGP4 cg_pmove
ADDRGP4 cg+107636
ASGNP4
line 869
;869:	cg_pmove.trace         = CG_Trace;
ADDRGP4 cg_pmove+220
ADDRGP4 CG_Trace
ASGNP4
line 870
;870:	cg_pmove.pointcontents = CG_PointContents;
ADDRGP4 cg_pmove+224
ADDRGP4 CG_PointContents
ASGNP4
line 871
;871:	if (cg_pmove.ps->pm_type == PM_DEAD) {
ADDRGP4 cg_pmove
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $697
line 872
;872:		cg_pmove.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRGP4 cg_pmove+28
CNSTI4 65537
ASGNI4
line 873
;873:	} else {
ADDRGP4 $698
JUMPV
LABELV $697
line 874
;874:		cg_pmove.tracemask = MASK_PLAYERSOLID;
ADDRGP4 cg_pmove+28
CNSTI4 33619969
ASGNI4
line 875
;875:	}
LABELV $698
line 876
;876:	if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $701
line 877
;877:		cg_pmove.tracemask &= ~CONTENTS_BODY;  // spectators can fly through bodies
ADDRLP4 536
ADDRGP4 cg_pmove+28
ASGNP4
ADDRLP4 536
INDIRP4
ADDRLP4 536
INDIRP4
INDIRI4
CNSTI4 -33554433
BANDI4
ASGNI4
line 878
;878:	}
LABELV $701
line 881
;879:
;880:	// save the state before the pmove so we can detect transitions
;881:	oldPlayerState = cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+107636
INDIRB
ASGNB 468
line 883
;882:
;883:	current = trap_GetCurrentCmdNumber();
ADDRLP4 536
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 476
ADDRLP4 536
INDIRI4
ASGNI4
line 888
;884:
;885:	// if we don't have the commands right after the snapshot, we
;886:	// can't accurately predict a current position, so just freeze at
;887:	// the last good position we had
;888:	cmdNum = current - CMD_BACKUP + 1;
ADDRLP4 0
ADDRLP4 476
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 889
;889:	trap_GetUserCmd(cmdNum, &oldestCmd);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 512
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 890
;890:	if (oldestCmd.serverTime > cg.snap->ps.commandTime && oldestCmd.serverTime < cg.time) {  // special check for map_restart
ADDRLP4 540
ADDRLP4 512
INDIRI4
ASGNI4
ADDRLP4 540
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $706
ADDRLP4 540
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $706
line 891
;891:		if (cg_showmiss.integer) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $676
line 892
;892:			CG_Printf("exceeded PACKET_BACKUP on commands\n");
ADDRGP4 $713
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 893
;893:		}
line 894
;894:		return;
ADDRGP4 $676
JUMPV
LABELV $706
line 898
;895:	}
;896:
;897:	// get the latest command so we can know which commands are from previous map_restarts
;898:	trap_GetUserCmd(current, &latestCmd);
ADDRLP4 476
INDIRI4
ARGI4
ADDRLP4 488
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 904
;899:
;900:	// get the most recent information we have, even if
;901:	// the server time is beyond our current cg.time,
;902:	// because predicted player positions are going to
;903:	// be ahead of everything else anyway
;904:	if (cg.nextSnap && !cg.nextFrameTeleport && !cg.thisFrameTeleport) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $714
ADDRGP4 cg+107596
INDIRI4
CNSTI4 0
NEI4 $714
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
NEI4 $714
line 905
;905:		cg.predictedPlayerState = cg.nextSnap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+40
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 906
;906:		cg.physicsTime          = cg.nextSnap->serverTime;
ADDRGP4 cg+107612
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 907
;907:	} else {
ADDRGP4 $715
JUMPV
LABELV $714
line 908
;908:		cg.predictedPlayerState = cg.snap->ps;
ADDRGP4 cg+107636
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRB
ASGNB 468
line 909
;909:		cg.physicsTime          = cg.snap->serverTime;
ADDRGP4 cg+107612
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 910
;910:	}
LABELV $715
line 912
;911:
;912:	cg_pmove.pmove_fixed = cgs.pmove_fixed;
ADDRGP4 cg_pmove+208
ADDRGP4 cgs+149676
INDIRI4
ASGNI4
line 913
;913:	cg_pmove.pmove_msec  = cgs.pmove_msec;
ADDRGP4 cg_pmove+212
ADDRGP4 cgs+149680
INDIRI4
ASGNI4
line 916
;914:
;915:	// clean event stack
;916:	eventStack = 0;
ADDRGP4 eventStack
CNSTI4 0
ASGNI4
line 919
;917:
;918:	// run cmds
;919:	moved = qfalse;
ADDRLP4 480
CNSTI4 0
ASGNI4
line 921
;920:
;921:	cg_pmove.pmove_fixed = cgs.pmove_fixed;
ADDRGP4 cg_pmove+208
ADDRGP4 cgs+149676
INDIRI4
ASGNI4
line 922
;922:	cg_pmove.pmove_msec  = cgs.pmove_msec;
ADDRGP4 cg_pmove+212
ADDRGP4 cgs+149680
INDIRI4
ASGNI4
line 942
;923:
;924:	// Like the comments described above, a player's state is entirely
;925:	// re-predicted from the last valid snapshot every client frame, which
;926:	// can be really, really, really slow.  Every old command has to be
;927:	// run again.  For every client frame that is *not* directly after a
;928:	// snapshot, this is unnecessary, since we have no new information.
;929:	// For those, we'll play back the predictions from the last frame and
;930:	// predict only the newest commands.  Essentially, we'll be doing
;931:	// an incremental predict instead of a full predict.
;932:	//
;933:	// If we have a new snapshot, we can compare its player state's command
;934:	// time to the command times in the queue to find a match.  If we find
;935:	// a matching state, and the predicted version has not deviated, we can
;936:	// use the predicted state as a base - and also do an incremental predict.
;937:	//
;938:	// With this method, we get incremental predicts on every client frame
;939:	// except a frame following a new snapshot in which there was a prediction
;940:	// error.  This yeilds anywhere from a 15% to 40% performance increase,
;941:	// depending on how much of a bottleneck the CPU is.
;942:	if (1 /* cg_optimizePrediction.integer */) {
line 943
;943:		if (cg.nextFrameTeleport || cg.thisFrameTeleport) {
ADDRGP4 cg+107596
INDIRI4
CNSTI4 0
NEI4 $741
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
EQI4 $737
LABELV $741
line 945
;944:			// do a full predict
;945:			cg.lastPredictedCommand = 0;
ADDRGP4 cg+118164
CNSTI4 0
ASGNI4
line 946
;946:			cg.stateTail            = cg.stateHead;
ADDRGP4 cg+149064
ADDRGP4 cg+149060
INDIRI4
ASGNI4
line 947
;947:			predictCmd              = current - CMD_BACKUP + 1;
ADDRLP4 484
ADDRLP4 476
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 948
;948:		}
ADDRGP4 $738
JUMPV
LABELV $737
line 951
;949:		// cg.physicsTime is the current snapshot's serverTime if it's the same
;950:		// as the last one
;951:		else if (cg.physicsTime == cg.lastServerTime) {
ADDRGP4 cg+107612
INDIRI4
ADDRGP4 cg+118168
INDIRI4
NEI4 $745
line 953
;952:			// we have no new information, so do an incremental predict
;953:			predictCmd = cg.lastPredictedCommand + 1;
ADDRLP4 484
ADDRGP4 cg+118164
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 954
;954:		} else {
ADDRGP4 $746
JUMPV
LABELV $745
line 958
;955:			// we have a new snapshot
;956:			int      i;
;957:			int      errorcode;
;958:			qboolean error = qtrue;
ADDRLP4 552
CNSTI4 1
ASGNI4
line 961
;959:
;960:			// loop through the saved states queue
;961:			for (i = cg.stateHead; i != cg.stateTail; i = (i + 1) % NUM_SAVED_STATES) {
ADDRLP4 544
ADDRGP4 cg+149060
INDIRI4
ASGNI4
ADDRGP4 $753
JUMPV
LABELV $750
line 964
;962:				// if we find a predicted state whose commandTime matches the snapshot
;963:				// player state's commandTime
;964:				if (cg.savedPmoveStates[i].commandTime != cg.predictedPlayerState.commandTime) {
ADDRLP4 544
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+118172
ADDP4
INDIRI4
ADDRGP4 cg+107636
INDIRI4
EQI4 $756
line 965
;965:					continue;
ADDRGP4 $751
JUMPV
LABELV $756
line 968
;966:				}
;967:				// make sure the state differences are acceptable
;968:				errorcode = CG_IsUnacceptableError(&cg.predictedPlayerState, &cg.savedPmoveStates[i], &moved);
ADDRGP4 cg+107636
ARGP4
ADDRLP4 544
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+118172
ADDP4
ARGP4
ADDRLP4 480
ARGP4
ADDRLP4 556
ADDRGP4 CG_IsUnacceptableError
CALLI4
ASGNI4
ADDRLP4 548
ADDRLP4 556
INDIRI4
ASGNI4
line 969
;969:				if (errorcode) {
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $762
line 970
;970:					if (cg_showmiss.integer > 1)
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 1
LEI4 $752
line 971
;971:						CG_Printf("errorcode %d at %d\n", errorcode, cg.time);
ADDRGP4 $767
ARGP4
ADDRLP4 548
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 972
;972:					break;
ADDRGP4 $752
JUMPV
LABELV $762
line 976
;973:				}
;974:
;975:				// this one is almost exact, so we'll copy it in as the starting point
;976:				*cg_pmove.ps = cg.savedPmoveStates[i];
ADDRGP4 cg_pmove
INDIRP4
ADDRLP4 544
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+118172
ADDP4
INDIRB
ASGNB 468
line 978
;977:				// advance the head
;978:				cg.stateHead = (i + 1) % NUM_SAVED_STATES;
ADDRGP4 cg+149060
ADDRLP4 544
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ASGNI4
line 981
;979:
;980:				// set the next command to predict
;981:				predictCmd = cg.lastPredictedCommand + 1;
ADDRLP4 484
ADDRGP4 cg+118164
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 984
;982:
;983:				// a saved state matched, so flag it
;984:				error = qfalse;
ADDRLP4 552
CNSTI4 0
ASGNI4
line 985
;985:				break;
ADDRGP4 $752
JUMPV
LABELV $751
line 961
ADDRLP4 544
ADDRLP4 544
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ASGNI4
LABELV $753
ADDRLP4 544
INDIRI4
ADDRGP4 cg+149064
INDIRI4
NEI4 $750
LABELV $752
line 989
;986:			}
;987:
;988:			// if no saved states matched
;989:			if (error) {
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $772
line 991
;990:				// do a full predict
;991:				cg.lastPredictedCommand = 0;
ADDRGP4 cg+118164
CNSTI4 0
ASGNI4
line 992
;992:				cg.stateTail            = cg.stateHead;
ADDRGP4 cg+149064
ADDRGP4 cg+149060
INDIRI4
ASGNI4
line 993
;993:				predictCmd              = current - CMD_BACKUP + 1;
ADDRLP4 484
ADDRLP4 476
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 994
;994:			}
LABELV $772
line 995
;995:		}
LABELV $746
LABELV $738
line 998
;996:		// keep track of the server time of the last snapshot so we
;997:		// know when we're starting from a new one in future calls
;998:		cg.lastServerTime = cg.physicsTime;
ADDRGP4 cg+118168
ADDRGP4 cg+107612
INDIRI4
ASGNI4
line 999
;999:		stateIndex        = cg.stateHead;
ADDRLP4 4
ADDRGP4 cg+149060
INDIRI4
ASGNI4
line 1000
;1000:	}
LABELV $735
line 1002
;1001:
;1002:	cmdNum = current - CMD_BACKUP + 1;
ADDRLP4 0
ADDRLP4 476
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1003
;1003:	if (cmdNum < 0)  // can happen on first spawn
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $785
line 1004
;1004:		cmdNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1009
;1005:
;1006:	// run cmds
;1007:	// moved = qfalse;
;1008:
;1009:	for (/* cmdNum = current - CMD_BACKUP + 1 */; cmdNum <= current; cmdNum++) {
ADDRGP4 $785
JUMPV
LABELV $782
line 1011
;1010:		// get the command
;1011:		trap_GetUserCmd(cmdNum, &cg_pmove.cmd);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cg_pmove+4
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 1013
;1012:
;1013:		if (cgs.pmove_fixed) {
ADDRGP4 cgs+149676
INDIRI4
CNSTI4 0
EQI4 $787
line 1014
;1014:			PM_UpdateViewAngles(cg_pmove.ps, &cg_pmove.cmd);
ADDRGP4 cg_pmove
INDIRP4
ARGP4
ADDRGP4 cg_pmove+4
ARGP4
ADDRGP4 PM_UpdateViewAngles
CALLV
pop
line 1015
;1015:		}
LABELV $787
line 1018
;1016:
;1017:		// don't do anything if the time is before the snapshot player time
;1018:		if (cg_pmove.cmd.serverTime <= cg.predictedPlayerState.commandTime) {
ADDRGP4 cg_pmove+4
INDIRI4
ADDRGP4 cg+107636
INDIRI4
GTI4 $791
line 1019
;1019:			continue;
ADDRGP4 $783
JUMPV
LABELV $791
line 1023
;1020:		}
;1021:
;1022:		// don't do anything if the command was from a previous map_restart
;1023:		if (cg_pmove.cmd.serverTime > latestCmd.serverTime) {
ADDRGP4 cg_pmove+4
INDIRI4
ADDRLP4 488
INDIRI4
LEI4 $795
line 1024
;1024:			continue;
ADDRGP4 $783
JUMPV
LABELV $795
line 1032
;1025:		}
;1026:
;1027:		// check for a prediction error from last frame
;1028:		// on a lan, this will often be the exact value
;1029:		// from the snapshot, but on a wan we will have
;1030:		// to predict several commands to get to the point
;1031:		// we want to compare
;1032:		if (cg.predictedPlayerState.commandTime == oldPlayerState.commandTime) {
ADDRGP4 cg+107636
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $798
line 1036
;1033:			vec3_t delta;
;1034:			float  len;
;1035:
;1036:			if (cg.thisFrameTeleport) {
ADDRGP4 cg+107592
INDIRI4
CNSTI4 0
EQI4 $801
line 1038
;1037:				// a teleport will not cause an error decay
;1038:				VectorClear(cg.predictedError);
ADDRGP4 cg+108852
CNSTF4 0
ASGNF4
ADDRGP4 cg+108852+4
CNSTF4 0
ASGNF4
ADDRGP4 cg+108852+8
CNSTF4 0
ASGNF4
line 1039
;1039:				if (cg_showmiss.integer) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $809
line 1040
;1040:					CG_Printf("PredictionTeleport\n");
ADDRGP4 $812
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1041
;1041:				}
LABELV $809
line 1042
;1042:				cg.thisFrameTeleport = qfalse;
ADDRGP4 cg+107592
CNSTI4 0
ASGNI4
line 1045
;1043:
;1044:				// delay prediction for some time or until first server event
;1045:				cg.allowPickupPrediction = cg.time + PICKUP_PREDICTION_DELAY;
ADDRGP4 cg+149076
ADDRGP4 cg+107604
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 1046
;1046:			} else {
ADDRGP4 $802
JUMPV
LABELV $801
line 1048
;1047:				vec3_t adjusted, new_angles;
;1048:				CG_AdjustPositionForMover(
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+68
INDIRI4
ARGI4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRGP4 cg+107608
INDIRI4
ARGI4
ADDRLP4 560
ARGP4
ADDRGP4 cg+107636+152
ARGP4
ADDRLP4 572
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 1052
;1049:					cg.predictedPlayerState.origin, cg.predictedPlayerState.groundEntityNum, cg.physicsTime, cg.oldTime, adjusted,
;1050:					cg.predictedPlayerState.viewangles, new_angles);
;1051:
;1052:				if (cg_showmiss.integer) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $824
line 1053
;1053:					if (!VectorCompare(oldPlayerState.origin, adjusted)) {
ADDRLP4 8+20
ARGP4
ADDRLP4 560
ARGP4
ADDRLP4 584
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 584
INDIRI4
CNSTI4 0
NEI4 $827
line 1054
;1054:						CG_Printf("prediction error\n");
ADDRGP4 $830
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1055
;1055:					}
LABELV $827
line 1056
;1056:				}
LABELV $824
line 1057
;1057:				VectorSubtract(oldPlayerState.origin, adjusted, delta);
ADDRLP4 544
ADDRLP4 8+20
INDIRF4
ADDRLP4 560
INDIRF4
SUBF4
ASGNF4
ADDRLP4 544+4
ADDRLP4 8+20+4
INDIRF4
ADDRLP4 560+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 544+8
ADDRLP4 8+20+8
INDIRF4
ADDRLP4 560+8
INDIRF4
SUBF4
ASGNF4
line 1058
;1058:				len = VectorLengthSquared(delta);
ADDRLP4 544
ARGP4
ADDRLP4 584
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 556
ADDRLP4 584
INDIRF4
ASGNF4
line 1059
;1059:				if (len > (0.01f * 0.01f)) {
ADDRLP4 556
INDIRF4
CNSTF4 953267991
LEF4 $840
line 1060
;1060:					if (cg_showmiss.integer) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $842
line 1061
;1061:						CG_Printf("Prediction miss: %f\n", sqrt(len));
ADDRLP4 556
INDIRF4
ARGF4
ADDRLP4 588
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRGP4 $845
ARGP4
ADDRLP4 588
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 1062
;1062:					}
LABELV $842
line 1063
;1063:					if (cg_errorDecay.integer) {
ADDRGP4 cg_errorDecay+12
INDIRI4
CNSTI4 0
EQI4 $846
line 1067
;1064:						int   t;
;1065:						float f;
;1066:
;1067:						t = cg.time - cg.predictedErrorTime;
ADDRLP4 592
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108848
INDIRI4
SUBI4
ASGNI4
line 1068
;1068:						f = (cg_errorDecay.value - t) / cg_errorDecay.value;
ADDRLP4 588
ADDRGP4 cg_errorDecay+8
INDIRF4
ADDRLP4 592
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_errorDecay+8
INDIRF4
DIVF4
ASGNF4
line 1069
;1069:						if (f < 0) {
ADDRLP4 588
INDIRF4
CNSTF4 0
GEF4 $853
line 1070
;1070:							f = 0;
ADDRLP4 588
CNSTF4 0
ASGNF4
line 1071
;1071:						} else if (f > 0 && cg_showmiss.integer) {
ADDRGP4 $854
JUMPV
LABELV $853
ADDRLP4 588
INDIRF4
CNSTF4 0
LEF4 $855
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $855
line 1072
;1072:							CG_Printf("Double prediction decay: %f\n", f);
ADDRGP4 $858
ARGP4
ADDRLP4 588
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 1073
;1073:						}
LABELV $855
LABELV $854
line 1074
;1074:						VectorScale(cg.predictedError, f, cg.predictedError);
ADDRGP4 cg+108852
ADDRGP4 cg+108852
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+108852+4
ADDRGP4 cg+108852+4
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ASGNF4
ADDRGP4 cg+108852+8
ADDRGP4 cg+108852+8
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ASGNF4
line 1075
;1075:					} else {
ADDRGP4 $847
JUMPV
LABELV $846
line 1076
;1076:						VectorClear(cg.predictedError);
ADDRGP4 cg+108852
CNSTF4 0
ASGNF4
ADDRGP4 cg+108852+4
CNSTF4 0
ASGNF4
ADDRGP4 cg+108852+8
CNSTF4 0
ASGNF4
line 1077
;1077:					}
LABELV $847
line 1078
;1078:					VectorAdd(delta, cg.predictedError, cg.predictedError);
ADDRGP4 cg+108852
ADDRLP4 544
INDIRF4
ADDRGP4 cg+108852
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+108852+4
ADDRLP4 544+4
INDIRF4
ADDRGP4 cg+108852+4
INDIRF4
ADDF4
ASGNF4
ADDRGP4 cg+108852+8
ADDRLP4 544+8
INDIRF4
ADDRGP4 cg+108852+8
INDIRF4
ADDF4
ASGNF4
line 1079
;1079:					cg.predictedErrorTime = cg.oldTime;
ADDRGP4 cg+108848
ADDRGP4 cg+107608
INDIRI4
ASGNI4
line 1080
;1080:				}
LABELV $840
line 1081
;1081:			}
LABELV $802
line 1082
;1082:		}
LABELV $798
line 1086
;1083:
;1084:		// don't predict gauntlet firing, which is only supposed to happen
;1085:		// when it actually inflicts damage
;1086:		cg_pmove.gauntletHit = qfalse;
ADDRGP4 cg_pmove+36
CNSTI4 0
ASGNI4
line 1088
;1087:
;1088:		if (cg_pmove.pmove_fixed) {
ADDRGP4 cg_pmove+208
INDIRI4
CNSTI4 0
EQI4 $889
line 1089
;1089:			cg_pmove.cmd.serverTime = ((cg_pmove.cmd.serverTime + cg_pmove.pmove_msec - 1) / cg_pmove.pmove_msec) * cg_pmove.pmove_msec;
ADDRGP4 cg_pmove+4
ADDRGP4 cg_pmove+4
INDIRI4
ADDRGP4 cg_pmove+212
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 cg_pmove+212
INDIRI4
DIVI4
ADDRGP4 cg_pmove+212
INDIRI4
MULI4
ASGNI4
line 1090
;1090:		}
LABELV $889
line 1096
;1091:#if 0
;1092:		if ( !cg_optimizePrediction.integer ) {
;1093:			Pmove (&cg_pmove);
;1094:		} else
;1095:#endif
;1096:		cg_pmove.movetype = phy_movetype.integer;  // Set movetype based on Cvar
ADDRGP4 cg_pmove+216
ADDRGP4 phy_movetype+12
INDIRI4
ASGNI4
line 1097
;1097:		if (/*cg_optimizePrediction.integer && */ (cmdNum >= predictCmd || (stateIndex + 1) % NUM_SAVED_STATES == cg.stateHead)) {
ADDRLP4 0
INDIRI4
ADDRLP4 484
INDIRI4
GEI4 $902
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ADDRGP4 cg+149060
INDIRI4
NEI4 $899
LABELV $902
line 1099
;1098:
;1099:			Pmove(&cg_pmove);
ADDRGP4 cg_pmove
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 1102
;1100:
;1101:			// add push trigger movement effects
;1102:			CG_TouchTriggerPrediction();
ADDRGP4 CG_TouchTriggerPrediction
CALLV
pop
line 1105
;1103:
;1104:			// check for expired powerups etc.
;1105:			CG_CheckTimers();
ADDRGP4 CG_CheckTimers
CALLV
pop
line 1108
;1106:
;1107:			// record the last predicted command
;1108:			cg.lastPredictedCommand = cmdNum;
ADDRGP4 cg+118164
ADDRLP4 0
INDIRI4
ASGNI4
line 1111
;1109:
;1110:			// if we haven't run out of space in the saved states queue
;1111:			if ((stateIndex + 1) % NUM_SAVED_STATES != cg.stateHead) {
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ADDRGP4 cg+149060
INDIRI4
EQI4 $900
line 1114
;1112:				// save the state for the false case ( of cmdNum >= predictCmd )
;1113:				// in later calls to this function
;1114:				cg.savedPmoveStates[stateIndex] = *cg_pmove.ps;
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+118172
ADDP4
ADDRGP4 cg_pmove
INDIRP4
INDIRB
ASGNB 468
line 1115
;1115:				stateIndex                      = (stateIndex + 1) % NUM_SAVED_STATES;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ASGNI4
line 1116
;1116:				cg.stateTail                    = stateIndex;
ADDRGP4 cg+149064
ADDRLP4 4
INDIRI4
ASGNI4
line 1117
;1117:			}
line 1118
;1118:		} else {
ADDRGP4 $900
JUMPV
LABELV $899
line 1119
;1119:			*cg_pmove.ps = cg.savedPmoveStates[stateIndex];
ADDRGP4 cg_pmove
INDIRP4
ADDRLP4 4
INDIRI4
CNSTI4 468
MULI4
ADDRGP4 cg+118172
ADDP4
INDIRB
ASGNB 468
line 1120
;1120:			stateIndex   = (stateIndex + 1) % NUM_SAVED_STATES;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 66
MODI4
ASGNI4
line 1121
;1121:		}
LABELV $900
line 1123
;1122:
;1123:		moved = qtrue;
ADDRLP4 480
CNSTI4 1
ASGNI4
line 1124
;1124:	}
LABELV $783
line 1009
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $785
ADDRLP4 0
INDIRI4
ADDRLP4 476
INDIRI4
LEI4 $782
line 1126
;1125:
;1126:	if (cg_showmiss.integer > 3) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 3
LEI4 $910
line 1127
;1127:		CG_Printf("[%i : %i] ", cg_pmove.cmd.serverTime, cg.time);
ADDRGP4 $913
ARGP4
ADDRGP4 cg_pmove+4
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1128
;1128:	}
LABELV $910
line 1130
;1129:
;1130:	if (!moved) {
ADDRLP4 480
INDIRI4
CNSTI4 0
NEI4 $916
line 1131
;1131:		if (cg_showmiss.integer) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $918
line 1132
;1132:			CG_Printf("not moved\n");
ADDRGP4 $921
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1133
;1133:		}
LABELV $918
line 1135
;1134:		// clean event stack
;1135:		eventStack = 0;
ADDRGP4 eventStack
CNSTI4 0
ASGNI4
line 1136
;1136:		return;
ADDRGP4 $676
JUMPV
LABELV $916
line 1140
;1137:	}
;1138:
;1139:	// adjust for the movement of the groundentity
;1140:	CG_AdjustPositionForMover(
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+68
INDIRI4
ARGI4
ADDRGP4 cg+107612
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRGP4 cg+107636+20
ARGP4
ADDRGP4 cg+107636+152
ARGP4
ADDRGP4 cg+107636+152
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 1144
;1141:		cg.predictedPlayerState.origin, cg.predictedPlayerState.groundEntityNum, cg.physicsTime, cg.time, cg.predictedPlayerState.origin,
;1142:		cg.predictedPlayerState.viewangles, cg.predictedPlayerState.viewangles);
;1143:
;1144:	if (cg_showmiss.integer) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $934
line 1145
;1145:		if (cg.predictedPlayerState.eventSequence > oldPlayerState.eventSequence + MAX_PS_EVENTS) {
ADDRGP4 cg+107636+108
INDIRI4
ADDRLP4 8+108
INDIRI4
CNSTI4 2
ADDI4
LEI4 $937
line 1146
;1146:			CG_Printf("WARNING: dropped event\n");
ADDRGP4 $942
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1147
;1147:		}
LABELV $937
line 1148
;1148:	}
LABELV $934
line 1151
;1149:
;1150:	// fire events and other transition triggered things
;1151:	CG_TransitionPlayerState(&cg.predictedPlayerState, &oldPlayerState);
ADDRGP4 cg+107636
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_TransitionPlayerState
CALLV
pop
line 1153
;1152:
;1153:	if (cg_showmiss.integer) {
ADDRGP4 cg_showmiss+12
INDIRI4
CNSTI4 0
EQI4 $944
line 1154
;1154:		if (cg.eventSequence > cg.predictedPlayerState.eventSequence) {
ADDRGP4 cg+108864
INDIRI4
ADDRGP4 cg+107636+108
INDIRI4
LEI4 $947
line 1155
;1155:			CG_Printf("WARNING: double event\n");
ADDRGP4 $952
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1156
;1156:			cg.eventSequence = cg.predictedPlayerState.eventSequence;
ADDRGP4 cg+108864
ADDRGP4 cg+107636+108
INDIRI4
ASGNI4
line 1157
;1157:		}
LABELV $947
line 1158
;1158:	}
LABELV $944
line 1159
;1159:}
LABELV $676
endproc CG_PredictPlayerState 596 28
bss
export eventParm2
align 4
LABELV eventParm2
skip 64
export eventParms
align 4
LABELV eventParms
skip 64
export events
align 4
LABELV events
skip 64
export eventStack
align 4
LABELV eventStack
skip 4
align 4
LABELV cg_triggerEntities
skip 1024
align 4
LABELV cg_numTriggerEntities
skip 4
align 4
LABELV cg_solidEntities
skip 1024
align 4
LABELV cg_numSolidEntities
skip 4
align 4
LABELV cg_pmove
skip 228
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
import CG_TransitionPlayerState
import CG_Respawn
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
import CG_LoadDeferredPlayers
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
LABELV $952
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $942
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $921
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $913
byte 1 91
byte 1 37
byte 1 105
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 0
align 1
LABELV $858
byte 1 68
byte 1 111
byte 1 117
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $845
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $830
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $812
byte 1 80
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $767
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 99
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $713
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 80
byte 1 65
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 65
byte 1 67
byte 1 75
byte 1 85
byte 1 80
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $675
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $662
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $646
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 97
byte 1 110
byte 1 116
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $634
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $597
byte 1 100
byte 1 109
byte 1 103
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $574
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 115
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $568
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 91
byte 1 37
byte 1 105
byte 1 93
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $556
byte 1 101
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $520
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 61
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $508
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 99
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 116
byte 1 97
byte 1 58
byte 1 32
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $500
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 116
byte 1 97
byte 1 58
byte 1 32
byte 1 37
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $263
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 109
byte 1 101
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $262
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $173
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
