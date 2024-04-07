code
proc CG_ResetEntity 8 4
file "../../../../code/cgame/cg_snapshot.c"
line 13
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_snapshot.c -- things that happen on snapshot transition,
;4:// not necessarily every single rendered frame
;5:
;6:#include "cg_local.h"
;7:
;8:/*
;9:==================
;10:CG_ResetEntity
;11:==================
;12:*/
;13:static void CG_ResetEntity(centity_t* cent) {
line 16
;14:	// if the previous snapshot this entity was updated in is at least
;15:	// an event window back in time then we can reset the previous event
;16:	if (cent->snapShotTime < cg.time - EVENT_VALID_MSEC) {
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 300
SUBI4
GEI4 $73
line 17
;17:		cent->previousEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 0
ASGNI4
line 18
;18:	}
LABELV $73
line 20
;19:
;20:	cent->trailTime = cg.snap->serverTime;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 22
;21:
;22:	VectorCopy(cent->currentState.origin, cent->lerpOrigin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 23
;23:	VectorCopy(cent->currentState.angles, cent->lerpAngles);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 24
;24:	if (cent->currentState.eType == ET_PLAYER) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $77
line 25
;25:		CG_ResetPlayerEntity(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 26
;26:	}
LABELV $77
line 27
;27:}
LABELV $72
endproc CG_ResetEntity 8 4
proc CG_TransitionEntity 4 4
line 36
;28:
;29:/*
;30:===============
;31:CG_TransitionEntity
;32:
;33:cent->nextState is moved to cent->currentState and events are fired
;34:===============
;35:*/
;36:static void CG_TransitionEntity(centity_t* cent) {
line 37
;37:	cent->currentState = cent->nextState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRB
ASGNB 208
line 38
;38:	cent->currentValid = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 1
ASGNI4
line 41
;39:
;40:	// reset if the entity wasn't in the last frame or was teleported
;41:	if (!cent->interpolate) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
NEI4 $80
line 42
;42:		CG_ResetEntity(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetEntity
CALLV
pop
line 43
;43:	}
LABELV $80
line 46
;44:
;45:	// clear the next state.  if will be set by the next CG_SetNextSnap
;46:	cent->interpolate = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 49
;47:
;48:	// check for events
;49:	CG_CheckEvents(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CheckEvents
CALLV
pop
line 50
;50:}
LABELV $79
endproc CG_TransitionEntity 4 4
export CG_SetInitialSnapshot
proc CG_SetInitialSnapshot 16 12
line 63
;51:
;52:/*
;53:==================
;54:CG_SetInitialSnapshot
;55:
;56:This will only happen on the very first snapshot, or
;57:on tourney restarts.  All other times will use
;58:CG_TransitionSnapshot instead.
;59:
;60:FIXME: Also called by map_restart?
;61:==================
;62:*/
;63:void CG_SetInitialSnapshot(snapshot_t* snap) {
line 68
;64:	int            i;
;65:	centity_t*     cent;
;66:	entityState_t* state;
;67:
;68:	cg.snap = snap;
ADDRGP4 cg+36
ADDRFP4 0
INDIRP4
ASGNP4
line 70
;69:
;70:	BG_PlayerStateToEntityState(&snap->ps, &cg_entities[snap->ps.clientNum].currentState, qfalse);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 44
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 73
;71:
;72:	// sort out solid entities
;73:	CG_BuildSolidList();
ADDRGP4 CG_BuildSolidList
CALLV
pop
line 75
;74:
;75:	CG_ExecuteNewServerCommands(snap->serverCommandSequence);
ADDRFP4 0
INDIRP4
CNSTI4 53768
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ExecuteNewServerCommands
CALLV
pop
line 79
;76:
;77:	// set our local weapon selection pointer to
;78:	// what the server has indicated the current weapon is
;79:	CG_Respawn();
ADDRGP4 CG_Respawn
CALLV
pop
line 81
;80:
;81:	for (i = 0; i < cg.snap->numEntities; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $87
JUMPV
LABELV $84
line 82
;82:		state = &cg.snap->entities[i];
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 208
MULI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 516
ADDP4
ADDP4
ASGNP4
line 83
;83:		cent  = &cg_entities[state->number];
ADDRLP4 0
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 85
;84:
;85:		memcpy(&cent->currentState, state, sizeof(entityState_t));
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 208
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 87
;86:		// cent->currentState = *state;
;87:		cent->interpolate  = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 88
;88:		cent->currentValid = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 1
ASGNI4
line 90
;89:
;90:		CG_ResetEntity(cent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ResetEntity
CALLV
pop
line 93
;91:
;92:		// check for events
;93:		CG_CheckEvents(cent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CheckEvents
CALLV
pop
line 94
;94:	}
LABELV $85
line 81
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $87
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $84
line 95
;95:}
LABELV $82
endproc CG_SetInitialSnapshot 16 12
proc CG_TransitionSnapshot 20 12
line 104
;96:
;97:/*
;98:===================
;99:CG_TransitionSnapshot
;100:
;101:The transition point from snap to nextSnap has passed
;102:===================
;103:*/
;104:static void CG_TransitionSnapshot(void) {
line 109
;105:	centity_t*  cent;
;106:	snapshot_t* oldFrame;
;107:	int         i;
;108:
;109:	if (!cg.snap) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $91
line 110
;110:		CG_Error("CG_TransitionSnapshot: NULL cg.snap");
ADDRGP4 $94
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 111
;111:	}
LABELV $91
line 112
;112:	if (!cg.nextSnap) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $95
line 113
;113:		CG_Error("CG_TransitionSnapshot: NULL cg.nextSnap");
ADDRGP4 $98
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 114
;114:	}
LABELV $95
line 117
;115:
;116:	// execute any server string commands before transitioning entities
;117:	CG_ExecuteNewServerCommands(cg.nextSnap->serverCommandSequence);
ADDRGP4 cg+40
INDIRP4
CNSTI4 53768
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ExecuteNewServerCommands
CALLV
pop
line 120
;118:
;119:	// if we had a map_restart, set everthing with initial
;120:	if (!cg.snap) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $100
line 121
;121:		return;
ADDRGP4 $90
JUMPV
LABELV $100
line 125
;122:	}
;123:
;124:	// clear the currentValid flag for all entities in the existing snapshot
;125:	for (i = 0; i < cg.snap->numEntities; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $106
JUMPV
LABELV $103
line 126
;126:		cent               = &cg_entities[cg.snap->entities[i].number];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 208
MULI4
ADDRGP4 cg+36
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
line 127
;127:		cent->currentValid = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 420
ADDP4
CNSTI4 0
ASGNI4
line 128
;128:	}
LABELV $104
line 125
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $106
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $103
line 131
;129:
;130:	// move nextSnap to snap and do the transitions
;131:	oldFrame = cg.snap;
ADDRLP4 8
ADDRGP4 cg+36
INDIRP4
ASGNP4
line 132
;132:	cg.snap  = cg.nextSnap;
ADDRGP4 cg+36
ADDRGP4 cg+40
INDIRP4
ASGNP4
line 134
;133:
;134:	BG_PlayerStateToEntityState(&cg.snap->ps, &cg_entities[cg.snap->ps.clientNum].currentState, qfalse);
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 135
;135:	cg_entities[cg.snap->ps.clientNum].interpolate = qfalse;
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+416
ADDP4
CNSTI4 0
ASGNI4
line 137
;136:
;137:	for (i = 0; i < cg.snap->numEntities; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $119
JUMPV
LABELV $116
line 138
;138:		cent = &cg_entities[cg.snap->entities[i].number];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 208
MULI4
ADDRGP4 cg+36
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
line 139
;139:		CG_TransitionEntity(cent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_TransitionEntity
CALLV
pop
line 142
;140:
;141:		// remember time of snapshot this entity was last updated in
;142:		cent->snapShotTime = cg.snap->serverTime;
ADDRLP4 4
INDIRP4
CNSTI4 456
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 143
;143:	}
LABELV $117
line 137
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $119
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $116
line 145
;144:
;145:	cg.nextSnap = NULL;
ADDRGP4 cg+40
CNSTP4 0
ASGNP4
line 148
;146:
;147:	// check for playerstate transition events
;148:	if (oldFrame) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $124
line 151
;149:		playerState_t *ops, *ps;
;150:
;151:		ops = &oldFrame->ps;
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 152
;152:		ps  = &cg.snap->ps;
ADDRLP4 16
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 154
;153:		// teleporting checks are irrespective of prediction
;154:		if ((ps->eFlags ^ ops->eFlags) & EF_TELEPORT_BIT) {
ADDRLP4 16
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $127
line 155
;155:			cg.thisFrameTeleport = qtrue;  // will be cleared by prediction code
ADDRGP4 cg+107592
CNSTI4 1
ASGNI4
line 156
;156:		}
LABELV $127
line 160
;157:
;158:		// if we are not doing client side movement prediction for any
;159:		// reason, then the client events and view changes will be issued now
;160:		if (cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) || cg_nopredict.integer || cgs.synchronousClients) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $138
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $138
ADDRGP4 cg_nopredict+12
INDIRI4
CNSTI4 0
NEI4 $138
ADDRGP4 cgs+149684
INDIRI4
CNSTI4 0
EQI4 $130
LABELV $138
line 161
;161:			CG_TransitionPlayerState(ps, ops);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 CG_TransitionPlayerState
CALLV
pop
line 162
;162:		}
LABELV $130
line 163
;163:	}
LABELV $124
line 164
;164:}
LABELV $90
endproc CG_TransitionSnapshot 20 12
proc CG_SetNextSnap 36 12
line 173
;165:
;166:/*
;167:===================
;168:CG_SetNextSnap
;169:
;170:A new snapshot has just been read in from the client system.
;171:===================
;172:*/
;173:static void CG_SetNextSnap(snapshot_t* snap) {
line 179
;174:	int            num;
;175:	int            esNum;
;176:	entityState_t* es;
;177:	centity_t*     cent;
;178:
;179:	cg.nextSnap = snap;
ADDRGP4 cg+40
ADDRFP4 0
INDIRP4
ASGNP4
line 181
;180:
;181:	BG_PlayerStateToEntityState(&snap->ps, &cg_entities[snap->ps.clientNum].nextState, qfalse);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 44
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+208
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 182
;182:	cg_entities[cg.snap->ps.clientNum].interpolate = qtrue;
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+416
ADDP4
CNSTI4 1
ASGNI4
line 185
;183:
;184:	// check for extrapolation errors
;185:	for (num = 0; num < snap->numEntities; num++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $147
JUMPV
LABELV $144
line 186
;186:		es   = &snap->entities[num];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 208
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDP4
ASGNP4
line 187
;187:		cent = &cg_entities[es->number];
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 189
;188:
;189:		memcpy(&cent->nextState, es, sizeof(entityState_t));
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 208
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 192
;190:		// cent->nextState = *es;
;191:
;192:		if (cgs.ospEnc && (esNum = cent->nextState.number) <= MAX_CLIENTS - 1) {
ADDRGP4 cgs+149688
INDIRI4
CNSTI4 0
EQI4 $148
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 63
GTI4 $148
line 193
;193:			cent->nextState.pos.trBase[0] += (677 - 7 * esNum);
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTI4 677
ADDRLP4 12
INDIRI4
CNSTI4 7
MULI4
SUBI4
CVIF4 4
ADDF4
ASGNF4
line 194
;194:			cent->nextState.pos.trBase[1] += (411 - 12 * esNum);
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 236
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTI4 411
ADDRLP4 12
INDIRI4
CNSTI4 12
MULI4
SUBI4
CVIF4 4
ADDF4
ASGNF4
line 195
;195:			cent->nextState.pos.trBase[2] += (243 - 2 * esNum);
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 240
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRF4
CNSTI4 243
ADDRLP4 12
INDIRI4
CNSTI4 1
LSHI4
SUBI4
CVIF4 4
ADDF4
ASGNF4
line 196
;196:		}
LABELV $148
line 200
;197:
;198:		// if this frame is a teleport, or the entity wasn't in the
;199:		// previous frame, don't interpolate
;200:		if (!cent->currentValid || ((cent->currentState.eFlags ^ es->eFlags) & EF_TELEPORT_BIT)) {
ADDRLP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 0
EQI4 $153
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $151
LABELV $153
line 201
;201:			cent->interpolate = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 202
;202:		} else {
ADDRGP4 $152
JUMPV
LABELV $151
line 203
;203:			cent->interpolate = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 1
ASGNI4
line 204
;204:		}
LABELV $152
line 205
;205:	}
LABELV $145
line 185
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $147
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $144
line 209
;206:
;207:	// if the next frame is a teleport for the playerstate, we
;208:	// can't interpolate during demos
;209:	if (cg.snap && ((snap->ps.eFlags ^ cg.snap->ps.eFlags) & EF_TELEPORT_BIT)) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $154
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $154
line 210
;210:		cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
line 211
;211:	} else {
ADDRGP4 $155
JUMPV
LABELV $154
line 212
;212:		cg.nextFrameTeleport = qfalse;
ADDRGP4 cg+107596
CNSTI4 0
ASGNI4
line 213
;213:	}
LABELV $155
line 216
;214:
;215:	// if changing follow mode, don't interpolate
;216:	if (cg.nextSnap->ps.clientNum != cg.snap->ps.clientNum) {
ADDRGP4 cg+40
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $160
line 217
;217:		cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
line 218
;218:	}
LABELV $160
line 221
;219:
;220:	// if changing server restarts, don't interpolate
;221:	if ((cg.nextSnap->snapFlags ^ cg.snap->snapFlags) & SNAPFLAG_SERVERCOUNT) {
ADDRGP4 cg+40
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $165
line 222
;222:		cg.nextFrameTeleport = qtrue;
ADDRGP4 cg+107596
CNSTI4 1
ASGNI4
line 223
;223:	}
LABELV $165
line 226
;224:
;225:	// sort out solid entities
;226:	CG_BuildSolidList();
ADDRGP4 CG_BuildSolidList
CALLV
pop
line 227
;227:}
LABELV $139
endproc CG_SetNextSnap 36 12
proc CG_ReadNextSnapshot 16 12
line 239
;228:
;229:/*
;230:========================
;231:CG_ReadNextSnapshot
;232:
;233:This is the only place new snapshots are requested
;234:This may increment cgs.processedSnapshotNum multiple
;235:times if the client system fails to return a
;236:valid snapshot.
;237:========================
;238:*/
;239:static snapshot_t* CG_ReadNextSnapshot(void) {
line 243
;240:	qboolean    r;
;241:	snapshot_t* dest;
;242:
;243:	if (cg.latestSnapshotNum > cgs.processedSnapshotNum + 1000) {
ADDRGP4 cg+28
INDIRI4
ADDRGP4 cgs+31472
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $179
line 244
;244:		CG_Printf("WARNING: CG_ReadNextSnapshot: way out of range, %i > %i\n", cg.latestSnapshotNum, cgs.processedSnapshotNum);
ADDRGP4 $175
ARGP4
ADDRGP4 cg+28
INDIRI4
ARGI4
ADDRGP4 cgs+31472
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 245
;245:	}
ADDRGP4 $179
JUMPV
LABELV $178
line 247
;246:
;247:	while (cgs.processedSnapshotNum < cg.latestSnapshotNum) {
line 249
;248:		// decide which of the two slots to load it into
;249:		if (cg.snap == &cg.activeSnapshots[0]) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
ADDRGP4 cg+44
CVPU4 4
NEU4 $183
line 250
;250:			dest = &cg.activeSnapshots[1];
ADDRLP4 0
ADDRGP4 cg+44+53772
ASGNP4
line 251
;251:		} else {
ADDRGP4 $184
JUMPV
LABELV $183
line 252
;252:			dest = &cg.activeSnapshots[0];
ADDRLP4 0
ADDRGP4 cg+44
ASGNP4
line 253
;253:		}
LABELV $184
line 256
;254:
;255:		// try to read the snapshot from the client system
;256:		cgs.processedSnapshotNum++;
ADDRLP4 8
ADDRGP4 cgs+31472
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 257
;257:		r = trap_GetSnapshot(cgs.processedSnapshotNum, dest);
ADDRGP4 cgs+31472
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_GetSnapshot
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 260
;258:
;259:		// FIXME: why would trap_GetSnapshot return a snapshot with the same server time
;260:		if (cg.snap && r && dest->serverTime == cg.snap->serverTime) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $192
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $192
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $192
line 262
;261:			// continue;
;262:		}
LABELV $192
line 265
;263:
;264:		// if it succeeded, return
;265:		if (r) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $196
line 266
;266:			CG_AddLagometerSnapshotInfo(dest);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_AddLagometerSnapshotInfo
CALLV
pop
line 267
;267:			return dest;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $170
JUMPV
LABELV $196
line 276
;268:		}
;269:
;270:		// a GetSnapshot will return failure if the snapshot
;271:		// never arrived, or  is so old that its entities
;272:		// have been shoved off the end of the circular
;273:		// buffer in the client system.
;274:
;275:		// record as a dropped packet
;276:		if (cg.snap) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $198
line 277
;277:			CG_AddLagometerSnapshotInfo(NULL);
CNSTP4 0
ARGP4
ADDRGP4 CG_AddLagometerSnapshotInfo
CALLV
pop
line 278
;278:		}
LABELV $198
line 282
;279:
;280:		// If there are additional snapshots, continue trying to
;281:		// read them.
;282:	}
LABELV $179
line 247
ADDRGP4 cgs+31472
INDIRI4
ADDRGP4 cg+28
INDIRI4
LTI4 $178
line 285
;283:
;284:	// nothing left to read
;285:	return NULL;
CNSTP4 0
RETP4
LABELV $170
endproc CG_ReadNextSnapshot 16 12
export CG_ProcessSnapshots
proc CG_ProcessSnapshots 12 8
line 307
;286:}
;287:
;288:/*
;289:============
;290:CG_ProcessSnapshots
;291:
;292:We are trying to set up a renderable view, so determine
;293:what the simulated time is, and try to get snapshots
;294:both before and after that time if available.
;295:
;296:If we don't have a valid cg.snap after exiting this function,
;297:then a 3D game view cannot be rendered.  This should only happen
;298:right after the initial connection.  After cg.snap has been valid
;299:once, it will never turn invalid.
;300:
;301:Even if cg.snap is valid, cg.nextSnap may not be, if the snapshot
;302:hasn't arrived yet (it becomes an extrapolating situation instead
;303:of an interpolating one)
;304:
;305:============
;306:*/
;307:void CG_ProcessSnapshots(void) {
line 312
;308:	snapshot_t* snap;
;309:	int         n;
;310:
;311:	// see what the latest snapshot the client system has is
;312:	trap_GetCurrentSnapshotNumber(&n, &cg.latestSnapshotTime);
ADDRLP4 4
ARGP4
ADDRGP4 cg+32
ARGP4
ADDRGP4 trap_GetCurrentSnapshotNumber
CALLV
pop
line 313
;313:	if (n != cg.latestSnapshotNum) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+28
INDIRI4
EQI4 $212
line 314
;314:		if (n < cg.latestSnapshotNum) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+28
INDIRI4
GEI4 $206
line 316
;315:			// this should never happen
;316:			CG_Error("CG_ProcessSnapshots: n < cg.latestSnapshotNum");
ADDRGP4 $209
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 317
;317:		}
LABELV $206
line 318
;318:		cg.latestSnapshotNum = n;
ADDRGP4 cg+28
ADDRLP4 4
INDIRI4
ASGNI4
line 319
;319:	}
ADDRGP4 $212
JUMPV
LABELV $211
line 324
;320:
;321:	// If we have yet to receive a snapshot, check for it.
;322:	// Once we have gotten the first snapshot, cg.snap will
;323:	// always have valid data for the rest of the game
;324:	while (!cg.snap) {
line 325
;325:		snap = CG_ReadNextSnapshot();
ADDRLP4 8
ADDRGP4 CG_ReadNextSnapshot
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 326
;326:		if (!snap) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $215
line 328
;327:			// we can't continue until we get a snapshot
;328:			return;
ADDRGP4 $201
JUMPV
LABELV $215
line 333
;329:		}
;330:
;331:		// set our weapon selection to what
;332:		// the playerstate is currently using
;333:		if (!(snap->snapFlags & SNAPFLAG_NOT_ACTIVE)) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $217
line 334
;334:			CG_SetInitialSnapshot(snap);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetInitialSnapshot
CALLV
pop
line 335
;335:		}
LABELV $217
line 336
;336:	}
LABELV $212
line 324
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $211
LABELV $219
line 341
;337:
;338:	// loop until we either have a valid nextSnap with a serverTime
;339:	// greater than cg.time to interpolate towards, or we run
;340:	// out of available snapshots
;341:	do {
line 343
;342:		// if we don't have a nextframe, try and read a new one in
;343:		if (!cg.nextSnap) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $222
line 344
;344:			snap = CG_ReadNextSnapshot();
ADDRLP4 8
ADDRGP4 CG_ReadNextSnapshot
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 348
;345:
;346:			// if we still don't have a nextframe, we will just have to
;347:			// extrapolate
;348:			if (!snap) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $225
line 349
;349:				break;
ADDRGP4 $221
JUMPV
LABELV $225
line 352
;350:			}
;351:
;352:			CG_SetNextSnap(snap);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetNextSnap
CALLV
pop
line 355
;353:
;354:			// if time went backwards, we have a level restart
;355:			if (cg.nextSnap->serverTime < cg.snap->serverTime) {
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GEI4 $227
line 356
;356:				CG_Error("CG_ProcessSnapshots: Server time went backwards");
ADDRGP4 $231
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 357
;357:			}
LABELV $227
line 358
;358:		}
LABELV $222
line 361
;359:
;360:		// if our time is < nextFrame's, we have a nice interpolating state
;361:		if (cg.time >= cg.snap->serverTime && cg.time < cg.nextSnap->serverTime) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $232
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GEI4 $232
line 362
;362:			break;
ADDRGP4 $221
JUMPV
LABELV $232
line 366
;363:		}
;364:
;365:		// we have passed the transition from nextFrame to frame
;366:		CG_TransitionSnapshot();
ADDRGP4 CG_TransitionSnapshot
CALLV
pop
line 367
;367:	} while (1);
LABELV $220
ADDRGP4 $219
JUMPV
LABELV $221
line 370
;368:
;369:	// assert our valid conditions upon exiting
;370:	if (cg.snap == NULL) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $238
line 371
;371:		CG_Error("CG_ProcessSnapshots: cg.snap == NULL");
ADDRGP4 $241
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 372
;372:	}
LABELV $238
line 373
;373:	if (cg.time < cg.snap->serverTime) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
GEI4 $242
line 375
;374:		// this can happen right after a vid_restart
;375:		cg.time = cg.snap->serverTime;
ADDRGP4 cg+107604
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 376
;376:	}
LABELV $242
line 377
;377:	if (cg.nextSnap != NULL && cg.nextSnap->serverTime <= cg.time) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $248
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GTI4 $248
line 378
;378:		CG_Error("CG_ProcessSnapshots: cg.nextSnap->serverTime <= cg.time");
ADDRGP4 $253
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 379
;379:	}
LABELV $248
line 380
;380:}
LABELV $201
endproc CG_ProcessSnapshots 12 8
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
LABELV $253
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 45
byte 1 62
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 60
byte 1 61
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $241
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 32
byte 1 61
byte 1 61
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $231
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 119
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $209
byte 1 67
byte 1 71
byte 1 95
byte 1 80
byte 1 114
byte 1 111
byte 1 99
byte 1 101
byte 1 115
byte 1 115
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 32
byte 1 60
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 108
byte 1 97
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 78
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $175
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 97
byte 1 100
byte 1 78
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 44
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 62
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $98
byte 1 67
byte 1 71
byte 1 95
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $94
byte 1 67
byte 1 71
byte 1 95
byte 1 84
byte 1 114
byte 1 97
byte 1 110
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 103
byte 1 46
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 0
