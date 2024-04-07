export CG_PositionEntityOnTag
code
proc CG_PositionEntityOnTag 80 24
file "../../../../code/cgame/cg_ents.c"
line 15
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_ents.c -- present snapshot entities, happens every single frame
;4:
;5:#include "cg_local.h"
;6:
;7:/*
;8:======================
;9:CG_PositionEntityOnTag
;10:
;11:Modifies the entities position and axis by the given
;12:tag location
;13:======================
;14:*/
;15:void CG_PositionEntityOnTag(refEntity_t* entity, const refEntity_t* parent, qhandle_t parentModel, const char* tagName) {
line 20
;16:	int           i;
;17:	orientation_t lerped;
;18:
;19:	// lerp the tag
;20:	trap_R_LerpTag(&lerped, parentModel, parent->oldframe, parent->frame, 1.0 - parent->backlerp, tagName);
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 52
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 52
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 52
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 23
;21:
;22:	// FIXME: allow origin offsets along tag?
;23:	VectorCopy(parent->origin, entity->origin);
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRB
ASGNB 12
line 24
;24:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $73
line 25
;25:		VectorMA(entity->origin, lerped.origin[i], parent->axis[i], entity->origin);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 26
;26:	}
LABELV $74
line 24
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $73
line 29
;27:
;28:	// had to cast away the const to avoid compiler problems...
;29:	MatrixMultiply(lerped.axis, ((refEntity_t*)parent)->axis, entity->axis);
ADDRLP4 4+12
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 30
;30:	entity->backlerp = parent->backlerp;
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ASGNF4
line 31
;31:}
LABELV $72
endproc CG_PositionEntityOnTag 80 24
export CG_PositionRotatedEntityOnTag
proc CG_PositionRotatedEntityOnTag 116 24
line 41
;32:
;33:/*
;34:======================
;35:CG_PositionRotatedEntityOnTag
;36:
;37:Modifies the entities position and axis by the given
;38:tag location
;39:======================
;40:*/
;41:void CG_PositionRotatedEntityOnTag(refEntity_t* entity, const refEntity_t* parent, qhandle_t parentModel, const char* tagName) {
line 48
;42:	int           i;
;43:	orientation_t lerped;
;44:	vec3_t        tempAxis[3];
;45:
;46:	// AxisClear( entity->axis );
;47:	//  lerp the tag
;48:	trap_R_LerpTag(&lerped, parentModel, parent->oldframe, parent->frame, 1.0 - parent->backlerp, tagName);
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 96
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ADDRLP4 88
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ARGF4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_LerpTag
CALLI4
pop
line 51
;49:
;50:	// FIXME: allow origin offsets along tag?
;51:	VectorCopy(parent->origin, entity->origin);
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRB
ASGNB 12
line 52
;52:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $79
line 53
;53:		VectorMA(entity->origin, lerped.origin[i], parent->axis[i], entity->origin);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 100
INDIRP4
CNSTI4 72
ADDP4
ADDRLP4 100
INDIRP4
CNSTI4 72
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 108
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 108
INDIRP4
CNSTI4 76
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 54
;54:	}
LABELV $80
line 52
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $79
line 57
;55:
;56:	// had to cast away the const to avoid compiler problems...
;57:	MatrixMultiply(entity->axis, lerped.axis, tempAxis);
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 52
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 58
;58:	MatrixMultiply(tempAxis, ((refEntity_t*)parent)->axis, entity->axis);
ADDRLP4 52
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
ARGP4
ADDRGP4 MatrixMultiply
CALLV
pop
line 59
;59:}
LABELV $78
endproc CG_PositionRotatedEntityOnTag 116 24
export CG_SetEntitySoundPosition
proc CG_SetEntitySoundPosition 24 8
line 76
;60:
;61:/*
;62:==========================================================================
;63:
;64:FUNCTIONS CALLED EACH FRAME
;65:
;66:==========================================================================
;67:*/
;68:
;69:/*
;70:======================
;71:CG_SetEntitySoundPosition
;72:
;73:Also called by event processing code
;74:======================
;75:*/
;76:void CG_SetEntitySoundPosition(const centity_t* cent) {
line 77
;77:	if (cent->currentState.solid == SOLID_BMODEL) {
ADDRFP4 0
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $85
line 81
;78:		vec3_t origin;
;79:		float* v;
;80:
;81:		v = cgs.inlineModelMidpoints[cent->currentState.modelindex];
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 cgs+37924
ADDP4
ASGNP4
line 82
;82:		VectorAdd(cent->lerpOrigin, v, origin);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDF4
ASGNF4
line 83
;83:		trap_S_UpdateEntityPosition(cent->currentState.number, origin);
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 84
;84:	} else {
ADDRGP4 $86
JUMPV
LABELV $85
line 85
;85:		trap_S_UpdateEntityPosition(cent->currentState.number, cent->lerpOrigin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 trap_S_UpdateEntityPosition
CALLV
pop
line 86
;86:	}
LABELV $86
line 87
;87:}
LABELV $84
endproc CG_SetEntitySoundPosition 24 8
proc CG_EntityEffects 20 20
line 96
;88:
;89:/*
;90:==================
;91:CG_EntityEffects
;92:
;93:Add continuous entity effects, like local entity emission and lighting
;94:==================
;95:*/
;96:static void CG_EntityEffects(const centity_t* cent) {
line 99
;97:
;98:	// update sound origins
;99:	CG_SetEntitySoundPosition(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 102
;100:
;101:	// add loop sound
;102:	if (cent->currentState.loopSound) {
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 0
EQI4 $91
line 103
;103:		if (cent->currentState.eType != ET_SPEAKER) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 7
EQI4 $93
line 104
;104:			trap_S_AddLoopingSound(cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.gameSounds[cent->currentState.loopSound]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 105
;105:		} else {
ADDRGP4 $94
JUMPV
LABELV $93
line 106
;106:			trap_S_AddRealLoopingSound(cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.gameSounds[cent->currentState.loopSound]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddRealLoopingSound
CALLV
pop
line 107
;107:		}
LABELV $94
line 108
;108:	}
LABELV $91
line 111
;109:
;110:	// constant light glow
;111:	if (cent->currentState.constantLight) {
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
CNSTI4 0
EQI4 $97
line 115
;112:		int   cl;
;113:		float i, r, g, b;
;114:
;115:		cl = cent->currentState.constantLight;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRI4
ASGNI4
line 116
;116:		r  = (float)((cl >> 0) & 255) / 255.0;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 255
BANDI4
CVIF4 4
CNSTF4 998277249
MULF4
ASGNF4
line 117
;117:		g  = (float)((cl >> 8) & 255) / 255.0;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 255
BANDI4
CVIF4 4
CNSTF4 998277249
MULF4
ASGNF4
line 118
;118:		b  = (float)((cl >> 16) & 255) / 255.0;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 16
RSHI4
CNSTI4 255
BANDI4
CVIF4 4
CNSTF4 998277249
MULF4
ASGNF4
line 119
;119:		i  = (float)((cl >> 24) & 255) * 4.0;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 24
RSHI4
CNSTI4 255
BANDI4
CVIF4 4
CNSTF4 1082130432
MULF4
ASGNF4
line 120
;120:		trap_R_AddLightToScene(cent->lerpOrigin, i, r, g, b);
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 121
;121:	}
LABELV $97
line 122
;122:}
LABELV $90
endproc CG_EntityEffects 20 20
proc CG_General 144 12
line 129
;123:
;124:/*
;125:==================
;126:CG_General
;127:==================
;128:*/
;129:static void CG_General(const centity_t* cent) {
line 133
;130:	refEntity_t          ent;
;131:	const entityState_t* s1;
;132:
;133:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 136
;134:
;135:	// if set to invisible, skip
;136:	if (!s1->modelindex) {
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 0
NEI4 $100
line 137
;137:		return;
ADDRGP4 $99
JUMPV
LABELV $100
line 140
;138:	}
;139:
;140:	memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 144
;141:
;142:	// set frame
;143:
;144:	ent.frame    = s1->frame;
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 145
;145:	ent.oldframe = ent.frame;
ADDRLP4 0+96
ADDRLP4 0+80
INDIRI4
ASGNI4
line 146
;146:	ent.backlerp = 0;
ADDRLP4 0+100
CNSTF4 0
ASGNF4
line 148
;147:
;148:	VectorCopy(cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 149
;149:	VectorCopy(cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 151
;150:
;151:	ent.hModel = cgs.gameModels[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34848
ADDP4
INDIRI4
ASGNI4
line 154
;152:
;153:	// player model
;154:	if (s1->number == cg.snap->ps.clientNum) {
ADDRLP4 140
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $110
line 155
;155:		ent.renderfx |= RF_THIRD_PERSON;  // only draw from mirrors
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 156
;156:	}
LABELV $110
line 159
;157:
;158:	// convert angles to axis
;159:	AnglesToAxis(cent->lerpAngles, ent.axis);
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 162
;160:
;161:	// add to refresh list
;162:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 163
;163:}
LABELV $99
endproc CG_General 144 12
proc CG_Speaker 12 16
line 172
;164:
;165:/*
;166:==================
;167:CG_Speaker
;168:
;169:Speaker entities can automatically play sounds
;170:==================
;171:*/
;172:static void CG_Speaker(centity_t* cent) {
line 173
;173:	if (!cent->currentState.clientNum) {  // FIXME: use something other than clientNum...
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 0
NEI4 $116
line 174
;174:		return;                           // not auto triggering
ADDRGP4 $115
JUMPV
LABELV $116
line 177
;175:	}
;176:
;177:	if (cg.time < cent->miscTime) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
GEI4 $118
line 178
;178:		return;
ADDRGP4 $115
JUMPV
LABELV $118
line 181
;179:	}
;180:
;181:	trap_S_StartSound(NULL, cent->currentState.number, CHAN_ITEM, cgs.gameSounds[cent->currentState.eventParm]);
CNSTP4 0
ARGP4
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 185
;182:
;183:	//	ent->s.frame = ent->wait * 10;
;184:	//	ent->s.clientNum = ent->random * 10;
;185:	cent->miscTime = cg.time + cent->currentState.frame * 100 + cent->currentState.clientNum * 100 * crandom();
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
CNSTI4 100
MULI4
ADDI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 100
MULI4
CVIF4 4
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 186
;186:}
LABELV $115
endproc CG_Speaker 12 16
proc CG_Item 232 12
line 193
;187:
;188:/*
;189:==================
;190:CG_Item
;191:==================
;192:*/
;193:static void CG_Item(centity_t* cent) {
line 204
;194:	refEntity_t    ent;
;195:	entityState_t* es;
;196:	const gitem_t* item;
;197:	int            msec;
;198:	float          frac;
;199:	float          scale;
;200:	weaponInfo_t*  wi;
;201:	int            modulus;
;202:	itemInfo_t*    itemInfo;
;203:
;204:	es = &cent->currentState;
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
line 205
;205:	if (es->modelindex >= bg_numItems) {
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $124
line 206
;206:		CG_Error("Bad item index %i on entity", es->modelindex);
ADDRGP4 $126
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 207
;207:	}
LABELV $124
line 210
;208:
;209:	// if set to invisible, skip
;210:	if (!es->modelindex || (es->eFlags & EF_NODRAW) || cent->delaySpawn > cg.time) {
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 0
EQI4 $131
ADDRLP4 144
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
NEI4 $131
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $127
LABELV $131
line 211
;211:		return;
ADDRGP4 $123
JUMPV
LABELV $127
line 214
;212:	}
;213:
;214:	itemInfo = &cg_items[es->modelindex];
ADDRLP4 164
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 28
MULI4
ADDRGP4 cg_items
ADDP4
ASGNP4
line 215
;215:	if (!itemInfo->registered) {
ADDRLP4 164
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $132
line 216
;216:		CG_RegisterItemVisuals(es->modelindex);
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 217
;217:		if (!itemInfo->registered) {
ADDRLP4 164
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $134
line 218
;218:			return;
ADDRGP4 $123
JUMPV
LABELV $134
line 220
;219:		}
;220:	}
LABELV $132
line 222
;221:
;222:	item = &bg_itemlist[es->modelindex];
ADDRLP4 140
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 223
;223:	if (cg_simpleItems.integer && item->giType != IT_TEAM) {
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
EQI4 $136
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
EQI4 $136
line 224
;224:		memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 225
;225:		ent.reType = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 226
;226:		VectorCopy(cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 227
;227:		ent.radius        = 14;
ADDRLP4 0+132
CNSTF4 1096810496
ASGNF4
line 228
;228:		ent.customShader  = cg_items[es->modelindex].icon_df;
ADDRLP4 0+112
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+24
ADDP4
INDIRI4
ASGNI4
line 229
;229:		ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 230
;230:		ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 231
;231:		ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 232
;232:		ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 233
;233:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 234
;234:		return;
ADDRGP4 $123
JUMPV
LABELV $136
line 238
;235:	}
;236:
;237:	// items bob up and down continuously
;238:	scale   = 0.005 + cent->currentState.number * 0.00001;
ADDRLP4 160
ADDRFP4 0
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 925353388
MULF4
CNSTF4 1000593162
ADDF4
ASGNF4
line 239
;239:	modulus = 2 * M_PI * 20228 / scale;
ADDRLP4 168
CNSTF4 1207450659
ADDRLP4 160
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 240
;240:	cent->lerpOrigin[2] += 4 + cos(((cg.time + 1000) % modulus) * scale) * 4;
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1000
ADDI4
ADDRLP4 168
INDIRI4
MODI4
CVIF4 4
ADDRLP4 160
INDIRF4
MULF4
ARGF4
ADDRLP4 176
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 180
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 180
INDIRP4
ADDRLP4 180
INDIRP4
INDIRF4
ADDRLP4 176
INDIRF4
CNSTF4 1082130432
MULF4
CNSTF4 1082130432
ADDF4
ADDF4
ASGNF4
line 242
;241:
;242:	memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 245
;243:
;244:	// autorotate at one of two speeds
;245:	if (item->giType == IT_HEALTH) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 4
NEI4 $151
line 246
;246:		VectorCopy(cg.autoAnglesFast, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 cg+109008
INDIRB
ASGNB 12
line 247
;247:		AxisCopy(cg.autoAxisFast, ent.axis);
ADDRGP4 cg+109020
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 248
;248:	} else {
ADDRGP4 $152
JUMPV
LABELV $151
line 249
;249:		VectorCopy(cg.autoAngles, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRGP4 cg+108960
INDIRB
ASGNB 12
line 250
;250:		AxisCopy(cg.autoAxis, ent.axis);
ADDRGP4 cg+108972
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisCopy
CALLV
pop
line 251
;251:	}
LABELV $152
line 253
;252:
;253:	wi = NULL;
ADDRLP4 152
CNSTP4 0
ASGNP4
line 257
;254:	// the weapons have their origin where they attatch to player
;255:	// models, so we need to offset them or they will rotate
;256:	// eccentricly
;257:	if (item->giType == IT_WEAPON) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $159
line 258
;258:		wi = &cg_weapons[item->giTag];
ADDRLP4 152
ADDRLP4 140
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 259
;259:		cent->lerpOrigin[0] -= wi->weaponMidpoint[0] * ent.axis[0][0] + wi->weaponMidpoint[1] * ent.axis[1][0] + wi->weaponMidpoint[2] * ent.axis[2][0];
ADDRLP4 184
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 184
INDIRP4
ADDRLP4 184
INDIRP4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0+28
INDIRF4
MULF4
ADDRLP4 152
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+28+12
INDIRF4
MULF4
ADDF4
ADDRLP4 152
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+28+24
INDIRF4
MULF4
ADDF4
SUBF4
ASGNF4
line 260
;260:		cent->lerpOrigin[1] -= wi->weaponMidpoint[0] * ent.axis[0][1] + wi->weaponMidpoint[1] * ent.axis[1][1] + wi->weaponMidpoint[2] * ent.axis[2][1];
ADDRLP4 192
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ASGNP4
ADDRLP4 192
INDIRP4
ADDRLP4 192
INDIRP4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0+28+4
INDIRF4
MULF4
ADDRLP4 152
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+28+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 152
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+28+24+4
INDIRF4
MULF4
ADDF4
SUBF4
ASGNF4
line 261
;261:		cent->lerpOrigin[2] -= wi->weaponMidpoint[0] * ent.axis[0][2] + wi->weaponMidpoint[1] * ent.axis[1][2] + wi->weaponMidpoint[2] * ent.axis[2][2];
ADDRLP4 200
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 200
INDIRP4
ADDRLP4 200
INDIRP4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0+28+8
INDIRF4
MULF4
ADDRLP4 152
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0+28+12+8
INDIRF4
MULF4
ADDF4
ADDRLP4 152
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0+28+24+8
INDIRF4
MULF4
ADDF4
SUBF4
ASGNF4
line 263
;262:
;263:		cent->lerpOrigin[2] += 8;  // an extra height boost
ADDRLP4 208
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 208
INDIRP4
ADDRLP4 208
INDIRP4
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 264
;264:	}
LABELV $159
line 266
;265:
;266:	ent.hModel = cg_items[es->modelindex].models[0];
ADDRLP4 0+8
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+4
ADDP4
INDIRI4
ASGNI4
line 268
;267:
;268:	VectorCopy(cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 269
;269:	VectorCopy(cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 271
;270:
;271:	ent.nonNormalizedAxes = qfalse;
ADDRLP4 0+64
CNSTI4 0
ASGNI4
line 274
;272:
;273:	// if just respawned, slowly scale up
;274:	msec = cg.time - cent->miscTime;
ADDRLP4 156
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
SUBI4
ASGNI4
line 275
;275:	if (msec >= 0 && msec < ITEM_SCALEUP_TIME) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $188
ADDRLP4 156
INDIRI4
CNSTI4 1000
GEI4 $188
line 276
;276:		frac = (float)msec / ITEM_SCALEUP_TIME;
ADDRLP4 148
ADDRLP4 156
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ASGNF4
line 277
;277:		VectorScale(ent.axis[0], frac, ent.axis[0]);
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 278
;278:		VectorScale(ent.axis[1], frac, ent.axis[1]);
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 279
;279:		VectorScale(ent.axis[2], frac, ent.axis[2]);
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 280
;280:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 281
;281:	} else {
ADDRGP4 $189
JUMPV
LABELV $188
line 282
;282:		frac = 1.0;
ADDRLP4 148
CNSTF4 1065353216
ASGNF4
line 283
;283:	}
LABELV $189
line 287
;284:
;285:	// items without glow textures need to keep a minimum light value
;286:	// so they are always visible
;287:	if ((item->giType == IT_WEAPON) || (item->giType == IT_ARMOR)) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
EQI4 $235
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 3
NEI4 $233
LABELV $235
line 288
;288:		ent.renderfx |= RF_MINLIGHT;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 289
;289:	}
LABELV $233
line 292
;290:
;291:	// increase the size of the weapons when they are presented as items
;292:	if (item->giType == IT_WEAPON) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $237
line 293
;293:		VectorScale(ent.axis[0], 1.5, ent.axis[0]);
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
CNSTF4 1069547520
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
CNSTF4 1069547520
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
CNSTF4 1069547520
MULF4
ASGNF4
line 294
;294:		VectorScale(ent.axis[1], 1.5, ent.axis[1]);
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
CNSTF4 1069547520
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
CNSTF4 1069547520
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
CNSTF4 1069547520
MULF4
ASGNF4
line 295
;295:		VectorScale(ent.axis[2], 1.5, ent.axis[2]);
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
CNSTF4 1069547520
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
CNSTF4 1069547520
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
CNSTF4 1069547520
MULF4
ASGNF4
line 296
;296:		ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 301
;297:#ifdef MISSIONPACK
;298:		trap_S_AddLoopingSound(cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.weaponHoverSound);
;299:#endif
;300:		// pickup color from spectaror/own client
;301:		if (item->giTag == WP_RAILGUN) {
ADDRLP4 140
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
NEI4 $282
line 302
;302:			const clientInfo_t* ci = cgs.clientinfo + cg.snap->ps.clientNum;
ADDRLP4 192
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 303
;303:			ent.shaderRGBA[0]      = ci->color1[0] * 255.0f;
ADDRLP4 200
ADDRLP4 192
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 204
CNSTF4 1325400064
ASGNF4
ADDRLP4 200
INDIRF4
ADDRLP4 204
INDIRF4
LTF4 $288
ADDRLP4 196
ADDRLP4 200
INDIRF4
ADDRLP4 204
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $289
JUMPV
LABELV $288
ADDRLP4 196
ADDRLP4 200
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $289
ADDRLP4 0+116
ADDRLP4 196
INDIRU4
CVUU1 4
ASGNU1
line 304
;304:			ent.shaderRGBA[1]      = ci->color1[1] * 255.0f;
ADDRLP4 212
ADDRLP4 192
INDIRP4
CNSTI4 48
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 216
CNSTF4 1325400064
ASGNF4
ADDRLP4 212
INDIRF4
ADDRLP4 216
INDIRF4
LTF4 $293
ADDRLP4 208
ADDRLP4 212
INDIRF4
ADDRLP4 216
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $294
JUMPV
LABELV $293
ADDRLP4 208
ADDRLP4 212
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $294
ADDRLP4 0+116+1
ADDRLP4 208
INDIRU4
CVUU1 4
ASGNU1
line 305
;305:			ent.shaderRGBA[2]      = ci->color1[2] * 255.0f;
ADDRLP4 224
ADDRLP4 192
INDIRP4
CNSTI4 52
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 228
CNSTF4 1325400064
ASGNF4
ADDRLP4 224
INDIRF4
ADDRLP4 228
INDIRF4
LTF4 $298
ADDRLP4 220
ADDRLP4 224
INDIRF4
ADDRLP4 228
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $299
JUMPV
LABELV $298
ADDRLP4 220
ADDRLP4 224
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $299
ADDRLP4 0+116+2
ADDRLP4 220
INDIRU4
CVUU1 4
ASGNU1
line 306
;306:			ent.shaderRGBA[3]      = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 307
;307:		}
LABELV $282
line 308
;308:	}
LABELV $237
line 320
;309:
;310:#ifdef MISSIONPACK
;311:	if (item->giType == IT_HOLDABLE && item->giTag == HI_KAMIKAZE) {
;312:		VectorScale(ent.axis[0], 2, ent.axis[0]);
;313:		VectorScale(ent.axis[1], 2, ent.axis[1]);
;314:		VectorScale(ent.axis[2], 2, ent.axis[2]);
;315:		ent.nonNormalizedAxes = qtrue;
;316:	}
;317:#endif
;318:
;319:	// add to refresh list
;320:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 344
;321:
;322:#ifdef MISSIONPACK
;323:	if (item->giType == IT_WEAPON && wi->barrelModel) {
;324:		refEntity_t barrel;
;325:
;326:		memset(&barrel, 0, sizeof(barrel));
;327:
;328:		barrel.hModel = wi->barrelModel;
;329:
;330:		VectorCopy(ent.lightingOrigin, barrel.lightingOrigin);
;331:		barrel.shadowPlane = ent.shadowPlane;
;332:		barrel.renderfx    = ent.renderfx;
;333:
;334:		CG_PositionRotatedEntityOnTag(&barrel, &ent, wi->weaponModel, "tag_barrel");
;335:
;336:		AxisCopy(ent.axis, barrel.axis);
;337:		barrel.nonNormalizedAxes = ent.nonNormalizedAxes;
;338:
;339:		trap_R_AddRefEntityToScene(&barrel);
;340:	}
;341:#endif
;342:
;343:	// accompanying rings / spheres for powerups
;344:	if (!cg_simpleItems.integer) {
ADDRGP4 cg_simpleItems+12
INDIRI4
CNSTI4 0
NEI4 $302
line 347
;345:		vec3_t spinAngles;
;346:
;347:		VectorClear(spinAngles);
ADDRLP4 192
CNSTF4 0
ASGNF4
ADDRLP4 192+4
CNSTF4 0
ASGNF4
ADDRLP4 192+8
CNSTF4 0
ASGNF4
line 349
;348:
;349:		if (item->giType == IT_HEALTH || item->giType == IT_POWERUP) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 4
EQI4 $309
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $307
LABELV $309
line 350
;350:			if ((ent.hModel = cg_items[es->modelindex].models[1]) != 0) {
ADDRLP4 208
ADDRLP4 144
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+4+4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 208
INDIRI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $310
line 351
;351:				if (item->giType == IT_POWERUP) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $315
line 352
;352:					ent.origin[2] += 12;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1094713344
ADDF4
ASGNF4
line 353
;353:					spinAngles[1] = (cg.time & 1023) * 360 / -1024.0f;
ADDRLP4 192+4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1023
BANDI4
CNSTI4 360
MULI4
CVIF4 4
CNSTF4 3128950784
MULF4
ASGNF4
line 354
;354:				}
LABELV $315
line 355
;355:				AnglesToAxis(spinAngles, ent.axis);
ADDRLP4 192
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 358
;356:
;357:				// scale up if respawning
;358:				if (frac != 1.0) {
ADDRLP4 148
INDIRF4
CNSTF4 1065353216
EQF4 $322
line 359
;359:					VectorScale(ent.axis[0], frac, ent.axis[0]);
ADDRLP4 0+28
ADDRLP4 0+28
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+8
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 360
;360:					VectorScale(ent.axis[1], frac, ent.axis[1]);
ADDRLP4 0+28+12
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 361
;361:					VectorScale(ent.axis[2], frac, ent.axis[2]);
ADDRLP4 0+28+24
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
ADDRLP4 0+28+24+8
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 148
INDIRF4
MULF4
ASGNF4
line 362
;362:					ent.nonNormalizedAxes = qtrue;
ADDRLP4 0+64
CNSTI4 1
ASGNI4
line 363
;363:				}
LABELV $322
line 364
;364:				trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 365
;365:			}
LABELV $310
line 366
;366:		}
LABELV $307
line 367
;367:	}
LABELV $302
line 368
;368:}
LABELV $123
endproc CG_Item 232 12
proc CG_Missile 168 20
line 377
;369:
;370://============================================================================
;371:
;372:/*
;373:===============
;374:CG_Missile
;375:===============
;376:*/
;377:static void CG_Missile(centity_t* cent) {
line 384
;378:	refEntity_t         ent;
;379:	entityState_t*      s1;
;380:	const weaponInfo_t* weapon;
;381:	const clientInfo_t* ci;
;382:	//	int	col;
;383:
;384:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 385
;385:	if (s1->weapon >= WP_NUM_WEAPONS) {
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 11
LTI4 $368
line 386
;386:		s1->weapon = WP_NONE;
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 387
;387:	}
LABELV $368
line 388
;388:	weapon = &cg_weapons[s1->weapon];
ADDRLP4 144
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 391
;389:
;390:	// calculate the axis
;391:	VectorCopy(s1->angles, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 140
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 394
;392:
;393:	// add trails
;394:	if (weapon->missileTrailFunc) {
ADDRLP4 144
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $370
line 395
;395:		weapon->missileTrailFunc(cent, weapon);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
CALLV
pop
line 396
;396:	}
LABELV $370
line 415
;397:	/*
;398:	    if ( cent->currentState.modelindex == TEAM_RED ) {
;399:	        col = 1;
;400:	    }
;401:	    else if ( cent->currentState.modelindex == TEAM_BLUE ) {
;402:	        col = 2;
;403:	    }
;404:	    else {
;405:	        col = 0;
;406:	    }
;407:
;408:	    // add dynamic light
;409:	    if ( weapon->missileDlight ) {
;410:	        trap_R_AddLightToScene(cent->lerpOrigin, weapon->missileDlight,
;411:	            weapon->missileDlightColor[col][0], weapon->missileDlightColor[col][1], weapon->missileDlightColor[col][2] );
;412:	    }
;413:	*/
;414:	// add dynamic light
;415:	if (weapon->missileDlight) {
ADDRLP4 144
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
CNSTF4 0
EQF4 $372
line 416
;416:		trap_R_AddLightToScene(
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ARGF4
ADDRLP4 144
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ARGF4
ADDRLP4 144
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ARGF4
ADDRLP4 144
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 418
;417:			cent->lerpOrigin, weapon->missileDlight, weapon->missileDlightColor[0], weapon->missileDlightColor[1], weapon->missileDlightColor[2]);
;418:	}
LABELV $372
line 421
;419:
;420:	// add missile sound
;421:	if (weapon->missileSound) {
ADDRLP4 144
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 0
EQI4 $374
line 424
;422:		vec3_t velocity;
;423:
;424:		BG_EvaluateTrajectoryDelta(&cent->currentState.pos, cg.time, velocity);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 152
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 426
;425:
;426:		trap_S_AddLoopingSound(cent->currentState.number, cent->lerpOrigin, velocity, weapon->missileSound);
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
INDIRI4
ARGI4
ADDRLP4 164
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 427
;427:	}
LABELV $374
line 430
;428:
;429:	// create the render entity
;430:	memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 431
;431:	VectorCopy(cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 432
;432:	VectorCopy(cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 434
;433:
;434:	if (cent->currentState.weapon == WP_PLASMAGUN) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 8
NEI4 $379
line 435
;435:		ent.reType       = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 436
;436:		ent.radius       = 16;
ADDRLP4 0+132
CNSTF4 1098907648
ASGNF4
line 437
;437:		ent.rotation     = 0;
ADDRLP4 0+136
CNSTF4 0
ASGNF4
line 438
;438:		ent.customShader = cgs.media.plasmaBallShader;
ADDRLP4 0+112
ADDRGP4 cgs+148692+288
INDIRI4
ASGNI4
line 439
;439:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 440
;440:		return;
ADDRGP4 $367
JUMPV
LABELV $379
line 444
;441:	}
;442:
;443:	// flicker between two skins
;444:	ent.skinNum  = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 445
;445:	ent.hModel   = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 144
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 446
;446:	ent.renderfx = weapon->missileRenderfx | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 144
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 457
;447:
;448:#ifdef MISSIONPACK
;449:	if (cent->currentState.weapon == WP_PROX_LAUNCHER) {
;450:		if (s1->generic1 == TEAM_BLUE) {
;451:			ent.hModel = cgs.media.blueProxMine;
;452:		}
;453:	}
;454:#endif
;455:
;456:	// convert direction of travel into axis
;457:	if (VectorNormalize2(s1->pos.trDelta, ent.axis[0]) == 0) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 152
ADDRGP4 VectorNormalize2
CALLF4
ASGNF4
ADDRLP4 152
INDIRF4
CNSTF4 0
NEF4 $389
line 458
;458:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 459
;459:	}
LABELV $389
line 462
;460:
;461:	// spin as it moves
;462:	if (s1->pos.trType != TR_STATIONARY) {
ADDRLP4 140
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
EQI4 $394
line 463
;463:		RotateAroundDirection(ent.axis, (cg.time % TMOD_004) / 4.0);
ADDRLP4 0+28
ARGP4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 4272943
MODI4
CVIF4 4
CNSTF4 1048576000
MULF4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 464
;464:	} else {
ADDRGP4 $395
JUMPV
LABELV $394
line 470
;465:#ifdef MISSIONPACK
;466:		if (s1->weapon == WP_PROX_LAUNCHER) {
;467:			AnglesToAxis(cent->lerpAngles, ent.axis);
;468:		} else
;469:#endif
;470:		{
line 471
;471:			RotateAroundDirection(ent.axis, s1->time);
ADDRLP4 0+28
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 RotateAroundDirection
CALLV
pop
line 472
;472:		}
line 473
;473:	}
LABELV $395
line 477
;474:
;475:	// add to refresh list, possibly with quad glow
;476:
;477:	s1->powerups &= ~((1 << PW_INVIS) | (1 << PW_REGEN));
ADDRLP4 156
ADDRLP4 140
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 -49
BANDI4
ASGNI4
line 478
;478:	ci = &cgs.clientinfo[s1->clientNum & MAX_CLIENTS];
ADDRLP4 148
ADDRLP4 140
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 479
;479:	if (ci->infoValid) {
ADDRLP4 148
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $400
line 480
;480:		CG_AddRefEntityWithPowerups(&ent, s1, ci->team);
ADDRLP4 0
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 148
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 481
;481:	} else {
ADDRGP4 $401
JUMPV
LABELV $400
line 482
;482:		CG_AddRefEntityWithPowerups(&ent, s1, TEAM_FREE);
ADDRLP4 0
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 483
;483:	}
LABELV $401
line 484
;484:}
LABELV $367
endproc CG_Missile 168 20
proc CG_Grapple 152 12
line 493
;485:
;486:/*
;487:===============
;488:CG_Grapple
;489:
;490:This is called when the grapple is sitting up against the wall
;491:===============
;492:*/
;493:static void CG_Grapple(centity_t* cent) {
line 498
;494:	refEntity_t         ent;
;495:	entityState_t*      s1;
;496:	const weaponInfo_t* weapon;
;497:
;498:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 499
;499:	if (s1->weapon >= WP_NUM_WEAPONS) {
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 11
LTI4 $403
line 500
;500:		s1->weapon = WP_NONE;
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 501
;501:	}
LABELV $403
line 502
;502:	weapon = &cg_weapons[s1->weapon];
ADDRLP4 144
ADDRLP4 140
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons
ADDP4
ASGNP4
line 505
;503:
;504:	// calculate the axis
;505:	VectorCopy(s1->angles, cent->lerpAngles);
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 140
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 515
;506:
;507:#if 0  // FIXME add grapple pull sound here..?
;508:	// add missile sound
;509:	if ( weapon->missileSound ) {
;510:		trap_S_AddLoopingSound( cent->currentState.number, cent->lerpOrigin, vec3_origin, weapon->missileSound );
;511:	}
;512:#endif
;513:
;514:	// Will draw cable if needed
;515:	CG_GrappleTrail(cent, weapon);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 CG_GrappleTrail
CALLV
pop
line 518
;516:
;517:	// create the render entity
;518:	memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 519
;519:	VectorCopy(cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 520
;520:	VectorCopy(cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 523
;521:
;522:	// flicker between two skins
;523:	ent.skinNum  = cg.clientFrame & 1;
ADDRLP4 0+104
ADDRGP4 cg
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 524
;524:	ent.hModel   = weapon->missileModel;
ADDRLP4 0+8
ADDRLP4 144
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ASGNI4
line 525
;525:	ent.renderfx = weapon->missileRenderfx | RF_NOSHADOW;
ADDRLP4 0+4
ADDRLP4 144
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 528
;526:
;527:	// convert direction of travel into axis
;528:	if (VectorNormalize2(s1->pos.trDelta, ent.axis[0]) == 0) {
ADDRLP4 140
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 148
ADDRGP4 VectorNormalize2
CALLF4
ASGNF4
ADDRLP4 148
INDIRF4
CNSTF4 0
NEF4 $410
line 529
;529:		ent.axis[0][2] = 1;
ADDRLP4 0+28+8
CNSTF4 1065353216
ASGNF4
line 530
;530:	}
LABELV $410
line 532
;531:
;532:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 533
;533:}
LABELV $402
endproc CG_Grapple 152 12
proc CG_Mover 144 12
line 540
;534:
;535:/*
;536:===============
;537:CG_Mover
;538:===============
;539:*/
;540:static void CG_Mover(const centity_t* cent) {
line 544
;541:	refEntity_t          ent;
;542:	const entityState_t* s1;
;543:
;544:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 547
;545:
;546:	// create the render entity
;547:	memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 548
;548:	VectorCopy(cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 549
;549:	VectorCopy(cent->lerpOrigin, ent.oldorigin);
ADDRLP4 0+84
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 550
;550:	AnglesToAxis(cent->lerpAngles, ent.axis);
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 552
;551:
;552:	ent.renderfx = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 555
;553:
;554:	// flicker between two skins (FIXME?)
;555:	ent.skinNum = (cg.time >> 6) & 1;
ADDRLP4 0+104
ADDRGP4 cg+107604
INDIRI4
CNSTI4 6
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 558
;556:
;557:	// get the model, either as a bmodel or a modelindex
;558:	if (s1->solid == SOLID_BMODEL) {
ADDRLP4 140
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
CNSTI4 16777215
NEI4 $422
line 559
;559:		ent.hModel = cgs.inlineDrawModel[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36900
ADDP4
INDIRI4
ASGNI4
line 560
;560:	} else {
ADDRGP4 $423
JUMPV
LABELV $422
line 561
;561:		ent.hModel = cgs.gameModels[s1->modelindex];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34848
ADDP4
INDIRI4
ASGNI4
line 562
;562:	}
LABELV $423
line 565
;563:
;564:	// add to refresh list
;565:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 568
;566:
;567:	// add the secondary model
;568:	if (s1->modelindex2) {
ADDRLP4 140
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
EQI4 $428
line 569
;569:		ent.skinNum = 0;
ADDRLP4 0+104
CNSTI4 0
ASGNI4
line 570
;570:		ent.hModel  = cgs.gameModels[s1->modelindex2 % MAX_MODELS];
ADDRLP4 0+8
ADDRLP4 140
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 256
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34848
ADDP4
INDIRI4
ASGNI4
line 571
;571:		trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 572
;572:	}
LABELV $428
line 573
;573:}
LABELV $415
endproc CG_Mover 144 12
export CG_Beam
proc CG_Beam 144 12
line 582
;574:
;575:/*
;576:===============
;577:CG_Beam
;578:
;579:Also called as an event
;580:===============
;581:*/
;582:void CG_Beam(const centity_t* cent) {
line 586
;583:	refEntity_t          ent;
;584:	const entityState_t* s1;
;585:
;586:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 589
;587:
;588:	// create the render entity
;589:	memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 590
;590:	VectorCopy(s1->pos.trBase, ent.origin);
ADDRLP4 0+68
ADDRLP4 140
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 591
;591:	VectorCopy(s1->origin2, ent.oldorigin);
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 592
;592:	AxisClear(ent.axis);
ADDRLP4 0+28
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 593
;593:	ent.reType = RT_BEAM;
ADDRLP4 0
CNSTI4 3
ASGNI4
line 595
;594:
;595:	ent.renderfx     = RF_NOSHADOW;
ADDRLP4 0+4
CNSTI4 64
ASGNI4
line 596
;596:	ent.customShader = cgs.media.whiteShader;
ADDRLP4 0+112
ADDRGP4 cgs+148692+16
INDIRI4
ASGNI4
line 599
;597:
;598:	// add to refresh list
;599:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 600
;600:}
LABELV $433
endproc CG_Beam 144 12
proc CG_Portal 144 12
line 607
;601:
;602:/*
;603:===============
;604:CG_Portal
;605:===============
;606:*/
;607:static void CG_Portal(const centity_t* cent) {
line 611
;608:	refEntity_t          ent;
;609:	const entityState_t* s1;
;610:
;611:	s1 = &cent->currentState;
ADDRLP4 140
ADDRFP4 0
INDIRP4
ASGNP4
line 614
;612:
;613:	// create the render entity
;614:	memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 615
;615:	VectorCopy(cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 616
;616:	VectorCopy(s1->origin2, ent.oldorigin);
ADDRLP4 0+84
ADDRLP4 140
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 617
;617:	ByteToDir(s1->eventParm, ent.axis[0]);
ADDRLP4 140
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 0+28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 618
;618:	PerpendicularVector(ent.axis[1], ent.axis[0]);
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 622
;619:
;620:	// negating this tends to get the directions like they want
;621:	// we really should have a camera roll value
;622:	VectorSubtract(vec3_origin, ent.axis[1], ent.axis[1]);
ADDRLP4 0+28+12
ADDRGP4 vec3_origin
INDIRF4
ADDRLP4 0+28+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+28+12+4
ADDRGP4 vec3_origin+4
INDIRF4
ADDRLP4 0+28+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+28+12+8
ADDRGP4 vec3_origin+8
INDIRF4
ADDRLP4 0+28+12+8
INDIRF4
SUBF4
ASGNF4
line 624
;623:
;624:	CrossProduct(ent.axis[0], ent.axis[1], ent.axis[2]);
ADDRLP4 0+28
ARGP4
ADDRLP4 0+28+12
ARGP4
ADDRLP4 0+28+24
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 625
;625:	ent.reType   = RT_PORTALSURFACE;
ADDRLP4 0
CNSTI4 7
ASGNI4
line 626
;626:	ent.oldframe = s1->powerups;
ADDRLP4 0+96
ADDRLP4 140
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 627
;627:	ent.frame    = s1->frame;                    // rotation speed
ADDRLP4 0+80
ADDRLP4 140
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 628
;628:	ent.skinNum  = s1->clientNum / 256.0 * 360;  // roll offset
ADDRLP4 0+104
ADDRLP4 140
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1068761088
MULF4
CVFI4 4
ASGNI4
line 631
;629:
;630:	// add to refresh list
;631:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 632
;632:}
LABELV $441
endproc CG_Portal 144 12
export CG_AdjustPositionForMover
proc CG_AdjustPositionForMover 80 12
line 641
;633:
;634:/*
;635:=========================
;636:CG_AdjustPositionForMover
;637:
;638:Also called by client movement prediction code
;639:=========================
;640:*/
;641:void CG_AdjustPositionForMover(const vec3_t in, int moverNum, int fromTime, int toTime, vec3_t out, const vec3_t angles_in, vec3_t angles_out) {
line 646
;642:	centity_t* cent;
;643:	vec3_t     oldOrigin, origin, deltaOrigin;
;644:	vec3_t     oldAngles, angles, deltaAngles;
;645:
;646:	if (moverNum <= 0 || moverNum >= ENTITYNUM_MAX_NORMAL) {
ADDRLP4 76
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
LEI4 $477
ADDRLP4 76
INDIRI4
CNSTI4 1022
LTI4 $475
LABELV $477
line 647
;647:		VectorCopy(in, out);
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 648
;648:		VectorCopy(angles_in, angles_out);
ADDRFP4 24
INDIRP4
ADDRFP4 20
INDIRP4
INDIRB
ASGNB 12
line 649
;649:		return;
ADDRGP4 $474
JUMPV
LABELV $475
line 652
;650:	}
;651:
;652:	cent = &cg_entities[moverNum];
ADDRLP4 0
ADDRFP4 4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 653
;653:	if (cent->currentState.eType != ET_MOVER) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 4
EQI4 $478
line 654
;654:		VectorCopy(in, out);
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 655
;655:		VectorCopy(angles_in, angles_out);
ADDRFP4 24
INDIRP4
ADDRFP4 20
INDIRP4
INDIRB
ASGNB 12
line 656
;656:		return;
ADDRGP4 $474
JUMPV
LABELV $478
line 659
;657:	}
;658:
;659:	BG_EvaluateTrajectory(&cent->currentState.pos, fromTime, oldOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 660
;660:	BG_EvaluateTrajectory(&cent->currentState.apos, fromTime, oldAngles);
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 52
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 662
;661:
;662:	BG_EvaluateTrajectory(&cent->currentState.pos, toTime, origin);
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 663
;663:	BG_EvaluateTrajectory(&cent->currentState.apos, toTime, angles);
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 64
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 665
;664:
;665:	VectorSubtract(origin, oldOrigin, deltaOrigin);
ADDRLP4 4
ADDRLP4 40
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 40+4
INDIRF4
ADDRLP4 28+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 40+8
INDIRF4
ADDRLP4 28+8
INDIRF4
SUBF4
ASGNF4
line 666
;666:	VectorSubtract(angles, oldAngles, deltaAngles);
ADDRLP4 16
ADDRLP4 64
INDIRF4
ADDRLP4 52
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 64+4
INDIRF4
ADDRLP4 52+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 64+8
INDIRF4
ADDRLP4 52+8
INDIRF4
SUBF4
ASGNF4
line 668
;667:
;668:	VectorAdd(in, deltaOrigin, out);
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDF4
ASGNF4
line 669
;669:	VectorAdd(angles_in, deltaAngles, angles_out);
ADDRFP4 24
INDIRP4
ADDRFP4 20
INDIRP4
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
ADDRFP4 24
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 16+4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 24
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 16+8
INDIRF4
ADDF4
ASGNF4
line 671
;670:	// FIXME: origin change when on a rotating object
;671:}
LABELV $474
endproc CG_AdjustPositionForMover 80 12
proc CG_InterpolateEntityPosition 44 12
line 678
;672:
;673:/*
;674:=============================
;675:CG_InterpolateEntityPosition
;676:=============================
;677:*/
;678:static void CG_InterpolateEntityPosition(centity_t* cent) {
line 684
;679:	vec3_t current, next;
;680:	float  f;
;681:
;682:	// it would be an internal error to find an entity that interpolates without
;683:	// a snapshot ahead of the current one
;684:	if (cg.nextSnap == NULL) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $497
line 685
;685:		CG_Error("CG_InterpoateEntityPosition: cg.nextSnap == NULL");
ADDRGP4 $500
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 686
;686:	}
LABELV $497
line 688
;687:
;688:	f = cg.frameInterpolation;
ADDRLP4 24
ADDRGP4 cg+107588
INDIRF4
ASGNF4
line 692
;689:
;690:	// this will linearize a sine or parabolic curve, but it is important
;691:	// to not extrapolate player positions if more recent data is available
;692:	BG_EvaluateTrajectory(&cent->currentState.pos, cg.snap->serverTime, current);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 693
;693:	BG_EvaluateTrajectory(&cent->nextState.pos, cg.nextSnap->serverTime, next);
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
ARGP4
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 695
;694:
;695:	cent->lerpOrigin[0] = current[0] + f * (next[0] - current[0]);
ADDRLP4 28
ADDRLP4 0
INDIRF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 28
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 696
;696:	cent->lerpOrigin[1] = current[1] + f * (next[1] - current[1]);
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 697
;697:	cent->lerpOrigin[2] = current[2] + f * (next[2] - current[2]);
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 699
;698:
;699:	BG_EvaluateTrajectory(&cent->currentState.apos, cg.snap->serverTime, current);
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 700
;700:	BG_EvaluateTrajectory(&cent->nextState.apos, cg.nextSnap->serverTime, next);
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRGP4 cg+40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 702
;701:
;702:	cent->lerpAngles[0] = LerpAngle(current[0], next[0], f);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
ADDRLP4 32
INDIRF4
ASGNF4
line 703
;703:	cent->lerpAngles[1] = LerpAngle(current[1], next[1], f);
ADDRLP4 0+4
INDIRF4
ARGF4
ADDRLP4 12+4
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
line 704
;704:	cent->lerpAngles[2] = LerpAngle(current[2], next[2], f);
ADDRLP4 0+8
INDIRF4
ARGF4
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 LerpAngle
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
ADDRLP4 40
INDIRF4
ASGNF4
line 705
;705:}
LABELV $496
endproc CG_InterpolateEntityPosition 44 12
proc CG_CalcEntityLerpPositions 20 28
line 713
;706:
;707:/*
;708:===============
;709:CG_CalcEntityLerpPositions
;710:
;711:===============
;712:*/
;713:static void CG_CalcEntityLerpPositions(centity_t* cent) {
line 716
;714:
;715:	// if this player does not want to see extrapolated players
;716:	if (!cg_smoothClients.integer) {
ADDRGP4 cg_smoothClients+12
INDIRI4
CNSTI4 0
NEI4 $517
line 718
;717:		// make sure the clients use TR_INTERPOLATE
;718:		if (cent->currentState.number < MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $520
line 719
;719:			cent->currentState.pos.trType = TR_INTERPOLATE;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 1
ASGNI4
line 720
;720:			cent->nextState.pos.trType    = TR_INTERPOLATE;
ADDRFP4 0
INDIRP4
CNSTI4 220
ADDP4
CNSTI4 1
ASGNI4
line 721
;721:		}
LABELV $520
line 722
;722:	}
LABELV $517
line 724
;723:
;724:	if (cent->interpolate && cent->currentState.pos.trType == TR_INTERPOLATE) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $522
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 1
NEI4 $522
line 725
;725:		CG_InterpolateEntityPosition(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 726
;726:		return;
ADDRGP4 $516
JUMPV
LABELV $522
line 731
;727:	}
;728:
;729:	// first see if we can interpolate between two snaps for
;730:	// linear extrapolated clients
;731:	if (cent->interpolate && cent->currentState.pos.trType == TR_LINEAR_STOP && cent->currentState.number < MAX_CLIENTS) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $524
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 3
NEI4 $524
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 64
GEI4 $524
line 732
;732:		CG_InterpolateEntityPosition(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_InterpolateEntityPosition
CALLV
pop
line 733
;733:		return;
ADDRGP4 $516
JUMPV
LABELV $524
line 737
;734:	}
;735:
;736:	// just use the current frame and evaluate as best we can
;737:	BG_EvaluateTrajectory(&cent->currentState.pos, cg.time, cent->lerpOrigin);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 738
;738:	BG_EvaluateTrajectory(&cent->currentState.apos, cg.time, cent->lerpAngles);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 48
ADDP4
ARGP4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 742
;739:
;740:	// adjust for riding a mover if it wasn't rolled into the predicted
;741:	// player state
;742:	if (cent != &cg.predictedPlayerEntity) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cg+108104
CVPU4 4
EQU4 $528
line 743
;743:		CG_AdjustPositionForMover(
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+107604
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 728
ADDP4
ARGP4
ADDRGP4 CG_AdjustPositionForMover
CALLV
pop
line 745
;744:			cent->lerpOrigin, cent->currentState.groundEntityNum, cg.snap->serverTime, cg.time, cent->lerpOrigin, cent->lerpAngles, cent->lerpAngles);
;745:	}
LABELV $528
line 746
;746:}
LABELV $516
endproc CG_CalcEntityLerpPositions 20 28
proc CG_TeamBase 140 12
line 753
;747:
;748:/*
;749:===============
;750:CG_TeamBase
;751:===============
;752:*/
;753:static void CG_TeamBase(const centity_t* cent) {
line 762
;754:	refEntity_t model;
;755:#ifdef MISSIONPACK
;756:	vec3_t angles;
;757:	int    t, h;
;758:	float  c;
;759:
;760:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF) {
;761:#else
;762:	if (cgs.gametype == GT_CTF) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
NEI4 $534
line 765
;763:#endif
;764:		// show the flag base
;765:		memset(&model, 0, sizeof(model));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 766
;766:		model.reType = RT_MODEL;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 767
;767:		VectorCopy(cent->lerpOrigin, model.lightingOrigin);
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 768
;768:		VectorCopy(cent->lerpOrigin, model.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 769
;769:		AnglesToAxis(cent->currentState.angles, model.axis);
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 770
;770:		if (cent->currentState.modelindex == TEAM_RED) {
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $540
line 771
;771:			model.hModel = cgs.media.redFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+148692+108
INDIRI4
ASGNI4
line 772
;772:		} else if (cent->currentState.modelindex == TEAM_BLUE) {
ADDRGP4 $541
JUMPV
LABELV $540
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 2
NEI4 $545
line 773
;773:			model.hModel = cgs.media.blueFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+148692+112
INDIRI4
ASGNI4
line 774
;774:		} else {
ADDRGP4 $546
JUMPV
LABELV $545
line 775
;775:			model.hModel = cgs.media.neutralFlagBaseModel;
ADDRLP4 0+8
ADDRGP4 cgs+148692+116
INDIRI4
ASGNI4
line 776
;776:		}
LABELV $546
LABELV $541
line 777
;777:		trap_R_AddRefEntityToScene(&model);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 778
;778:	}
LABELV $534
line 891
;779:#ifdef MISSIONPACK
;780:	else if (cgs.gametype == GT_OBELISK) {
;781:		// show the obelisk
;782:		memset(&model, 0, sizeof(model));
;783:		model.reType = RT_MODEL;
;784:		VectorCopy(cent->lerpOrigin, model.lightingOrigin);
;785:		VectorCopy(cent->lerpOrigin, model.origin);
;786:		AnglesToAxis(cent->currentState.angles, model.axis);
;787:
;788:		model.hModel = cgs.media.overloadBaseModel;
;789:		trap_R_AddRefEntityToScene(&model);
;790:		// if hit
;791:		if (cent->currentState.frame == 1) {
;792:			// show hit model
;793:			// modelindex2 is the health value of the obelisk
;794:			c                   = cent->currentState.modelindex2;
;795:			model.shaderRGBA[0] = 0xff;
;796:			model.shaderRGBA[1] = c;
;797:			model.shaderRGBA[2] = c;
;798:			model.shaderRGBA[3] = 0xff;
;799:			//
;800:			model.hModel = cgs.media.overloadEnergyModel;
;801:			trap_R_AddRefEntityToScene(&model);
;802:		}
;803:		// if respawning
;804:		if (cent->currentState.frame == 2) {
;805:			if (!cent->miscTime) {
;806:				cent->miscTime = cg.time;
;807:			}
;808:			t = cg.time - cent->miscTime;
;809:			h = (cg_obeliskRespawnDelay.integer - 5) * 1000;
;810:			//
;811:			if (t > h) {
;812:				c = (float)(t - h) / h;
;813:				if (c > 1)
;814:					c = 1;
;815:			} else {
;816:				c = 0;
;817:			}
;818:			// show the lights
;819:			AnglesToAxis(cent->currentState.angles, model.axis);
;820:			//
;821:			model.shaderRGBA[0] = c * 0xff;
;822:			model.shaderRGBA[1] = c * 0xff;
;823:			model.shaderRGBA[2] = c * 0xff;
;824:			model.shaderRGBA[3] = c * 0xff;
;825:
;826:			model.hModel = cgs.media.overloadLightsModel;
;827:			trap_R_AddRefEntityToScene(&model);
;828:			// show the target
;829:			if (t > h) {
;830:				if (!cent->muzzleFlashTime) {
;831:					trap_S_StartSound(cent->lerpOrigin, ENTITYNUM_NONE, CHAN_BODY, cgs.media.obeliskRespawnSound);
;832:					cent->muzzleFlashTime = 1;
;833:				}
;834:				VectorCopy(cent->currentState.angles, angles);
;835:				angles[YAW] += (float)16 * acos(1 - c) * 180 / M_PI;
;836:				AnglesToAxis(angles, model.axis);
;837:
;838:				VectorScale(model.axis[0], c, model.axis[0]);
;839:				VectorScale(model.axis[1], c, model.axis[1]);
;840:				VectorScale(model.axis[2], c, model.axis[2]);
;841:
;842:				model.shaderRGBA[0] = 0xff;
;843:				model.shaderRGBA[1] = 0xff;
;844:				model.shaderRGBA[2] = 0xff;
;845:				model.shaderRGBA[3] = 0xff;
;846:				//
;847:				model.origin[2] += 56;
;848:				model.hModel = cgs.media.overloadTargetModel;
;849:				trap_R_AddRefEntityToScene(&model);
;850:			} else {
;851:				// FIXME: show animated smoke
;852:			}
;853:		} else {
;854:			cent->miscTime        = 0;
;855:			cent->muzzleFlashTime = 0;
;856:			// modelindex2 is the health value of the obelisk
;857:			c                   = cent->currentState.modelindex2;
;858:			model.shaderRGBA[0] = 0xff;
;859:			model.shaderRGBA[1] = c;
;860:			model.shaderRGBA[2] = c;
;861:			model.shaderRGBA[3] = 0xff;
;862:			// show the lights
;863:			model.hModel = cgs.media.overloadLightsModel;
;864:			trap_R_AddRefEntityToScene(&model);
;865:			// show the target
;866:			model.origin[2] += 56;
;867:			model.hModel = cgs.media.overloadTargetModel;
;868:			trap_R_AddRefEntityToScene(&model);
;869:		}
;870:	} else if (cgs.gametype == GT_HARVESTER) {
;871:		// show harvester model
;872:		memset(&model, 0, sizeof(model));
;873:		model.reType = RT_MODEL;
;874:		VectorCopy(cent->lerpOrigin, model.lightingOrigin);
;875:		VectorCopy(cent->lerpOrigin, model.origin);
;876:		AnglesToAxis(cent->currentState.angles, model.axis);
;877:
;878:		if (cent->currentState.modelindex == TEAM_RED) {
;879:			model.hModel     = cgs.media.harvesterModel;
;880:			model.customSkin = cgs.media.harvesterRedSkin;
;881:		} else if (cent->currentState.modelindex == TEAM_BLUE) {
;882:			model.hModel     = cgs.media.harvesterModel;
;883:			model.customSkin = cgs.media.harvesterBlueSkin;
;884:		} else {
;885:			model.hModel     = cgs.media.harvesterNeutralModel;
;886:			model.customSkin = 0;
;887:		}
;888:		trap_R_AddRefEntityToScene(&model);
;889:	}
;890:#endif
;891:}
LABELV $533
endproc CG_TeamBase 140 12
proc CG_AddCEntity 8 8
line 899
;892:
;893:/*
;894:===============
;895:CG_AddCEntity
;896:
;897:===============
;898:*/
;899:static void CG_AddCEntity(centity_t* cent) {
line 901
;900:	// event-only entities will have been dealt with already
;901:	if (cent->currentState.eType >= ET_EVENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
LTI4 $554
line 902
;902:		return;
ADDRGP4 $553
JUMPV
LABELV $554
line 906
;903:	}
;904:
;905:	// calculate the current origin
;906:	CG_CalcEntityLerpPositions(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 909
;907:
;908:	// add automatic effects
;909:	CG_EntityEffects(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_EntityEffects
CALLV
pop
line 911
;910:
;911:	switch (cent->currentState.eType) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $556
ADDRLP4 0
INDIRI4
CNSTI4 12
GTI4 $556
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $571
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $571
address $561
address $562
address $563
address $564
address $565
address $566
address $567
address $568
address $557
address $557
address $557
address $569
address $570
code
LABELV $556
line 913
;912:	default:
;913:		CG_Error("Bad entity type: %i", cent->currentState.eType);
ADDRGP4 $559
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 914
;914:		break;
ADDRGP4 $557
JUMPV
line 918
;915:	case ET_INVISIBLE:
;916:	case ET_PUSH_TRIGGER:
;917:	case ET_TELEPORT_TRIGGER:
;918:		break;
LABELV $561
line 920
;919:	case ET_GENERAL:
;920:		CG_General(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_General
CALLV
pop
line 921
;921:		break;
ADDRGP4 $557
JUMPV
LABELV $562
line 923
;922:	case ET_PLAYER:
;923:		CG_Player(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Player
CALLV
pop
line 924
;924:		break;
ADDRGP4 $557
JUMPV
LABELV $563
line 926
;925:	case ET_ITEM:
;926:		CG_Item(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Item
CALLV
pop
line 927
;927:		break;
ADDRGP4 $557
JUMPV
LABELV $564
line 929
;928:	case ET_MISSILE:
;929:		CG_Missile(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Missile
CALLV
pop
line 930
;930:		break;
ADDRGP4 $557
JUMPV
LABELV $565
line 932
;931:	case ET_MOVER:
;932:		CG_Mover(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Mover
CALLV
pop
line 933
;933:		break;
ADDRGP4 $557
JUMPV
LABELV $566
line 935
;934:	case ET_BEAM:
;935:		CG_Beam(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 936
;936:		break;
ADDRGP4 $557
JUMPV
LABELV $567
line 938
;937:	case ET_PORTAL:
;938:		CG_Portal(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Portal
CALLV
pop
line 939
;939:		break;
ADDRGP4 $557
JUMPV
LABELV $568
line 941
;940:	case ET_SPEAKER:
;941:		CG_Speaker(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Speaker
CALLV
pop
line 942
;942:		break;
ADDRGP4 $557
JUMPV
LABELV $569
line 944
;943:	case ET_GRAPPLE:
;944:		CG_Grapple(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Grapple
CALLV
pop
line 945
;945:		break;
ADDRGP4 $557
JUMPV
LABELV $570
line 947
;946:	case ET_TEAM:
;947:		CG_TeamBase(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_TeamBase
CALLV
pop
line 948
;948:		break;
LABELV $557
line 950
;949:	}
;950:}
LABELV $553
endproc CG_AddCEntity 8 8
export CG_AddPacketEntities
proc CG_AddPacketEntities 16 12
line 958
;951:
;952:/*
;953:===============
;954:CG_AddPacketEntities
;955:
;956:===============
;957:*/
;958:void CG_AddPacketEntities(void) {
line 964
;959:	int            num;
;960:	centity_t*     cent;
;961:	playerState_t* ps;
;962:
;963:	// set cg.frameInterpolation
;964:	if (cg.nextSnap) {
ADDRGP4 cg+40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $573
line 967
;965:		int delta;
;966:
;967:		delta = (cg.nextSnap->serverTime - cg.snap->serverTime);
ADDRLP4 12
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
SUBI4
ASGNI4
line 968
;968:		if (delta == 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $578
line 969
;969:			cg.frameInterpolation = 0;
ADDRGP4 cg+107588
CNSTF4 0
ASGNF4
line 970
;970:		} else {
ADDRGP4 $574
JUMPV
LABELV $578
line 971
;971:			cg.frameInterpolation = (float)(cg.time - cg.snap->serverTime) / delta;
ADDRGP4 cg+107588
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 12
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 972
;972:		}
line 973
;973:	} else {
ADDRGP4 $574
JUMPV
LABELV $573
line 974
;974:		cg.frameInterpolation = 0;  // actually, it should never be used, because
ADDRGP4 cg+107588
CNSTF4 0
ASGNF4
line 976
;975:		                            // no entities should be marked as interpolating
;976:	}
LABELV $574
line 979
;977:
;978:	// the auto-rotating items will all have the same axis
;979:	cg.autoAngles[0] = 0;
ADDRGP4 cg+108960
CNSTF4 0
ASGNF4
line 980
;980:	cg.autoAngles[1] = (cg.time & 2047) * 360 / 2048.0;
ADDRGP4 cg+108960+4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 2047
BANDI4
CNSTI4 360
MULI4
CVIF4 4
CNSTF4 973078528
MULF4
ASGNF4
line 981
;981:	cg.autoAngles[2] = 0;
ADDRGP4 cg+108960+8
CNSTF4 0
ASGNF4
line 983
;982:
;983:	cg.autoAnglesFast[0] = 0;
ADDRGP4 cg+109008
CNSTF4 0
ASGNF4
line 984
;984:	cg.autoAnglesFast[1] = (cg.time & 1023) * 360 / 1024.0f;
ADDRGP4 cg+109008+4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1023
BANDI4
CNSTI4 360
MULI4
CVIF4 4
CNSTF4 981467136
MULF4
ASGNF4
line 985
;985:	cg.autoAnglesFast[2] = 0;
ADDRGP4 cg+109008+8
CNSTF4 0
ASGNF4
line 987
;986:
;987:	AnglesToAxis(cg.autoAngles, cg.autoAxis);
ADDRGP4 cg+108960
ARGP4
ADDRGP4 cg+108972
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 988
;988:	AnglesToAxis(cg.autoAnglesFast, cg.autoAxisFast);
ADDRGP4 cg+109008
ARGP4
ADDRGP4 cg+109020
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 991
;989:
;990:	// generate and add the entity from the playerstate
;991:	ps = &cg.predictedPlayerState;
ADDRLP4 8
ADDRGP4 cg+107636
ASGNP4
line 992
;992:	BG_PlayerStateToEntityState(ps, &cg.predictedPlayerEntity.currentState, qfalse);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 cg+108104
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 993
;993:	CG_AddCEntity(&cg.predictedPlayerEntity);
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 996
;994:
;995:	// lerp the non-predicted value for lightning gun origins
;996:	CG_CalcEntityLerpPositions(&cg_entities[cg.snap->ps.clientNum]);
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
ADDRGP4 CG_CalcEntityLerpPositions
CALLV
pop
line 999
;997:
;998:	// add each entity sent over by the server
;999:	for (num = 0; num < cg.snap->numEntities; num++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $608
JUMPV
LABELV $605
line 1000
;1000:		cent = &cg_entities[cg.snap->entities[num].number];
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
line 1001
;1001:		CG_AddCEntity(cent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 CG_AddCEntity
CALLV
pop
line 1002
;1002:	}
LABELV $606
line 999
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $608
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
LTI4 $605
line 1003
;1003:}
LABELV $572
endproc CG_AddPacketEntities 16 12
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
LABELV $559
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $500
byte 1 67
byte 1 71
byte 1 95
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 112
byte 1 111
byte 1 97
byte 1 116
byte 1 101
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 80
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
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
LABELV $126
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
