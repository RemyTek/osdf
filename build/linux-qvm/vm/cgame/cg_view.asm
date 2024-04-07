export CG_TestModel_f
code
proc CG_TestModel_f 36 12
file "../../../../code/cgame/cg_view.c"
line 50
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_view.c -- setup all the parameters (position, angle, etc)
;4:// for a 3D rendering
;5:#include "cg_local.h"
;6:
;7:/*
;8:=============================================================================
;9:
;10:  MODEL TESTING
;11:
;12:The viewthing and gun positioning tools from Q2 have been integrated and
;13:enhanced into a single model testing facility.
;14:
;15:Model viewing can begin with either "testmodel <modelname>" or "testgun <modelname>".
;16:
;17:The names must be the full pathname after the basedir, like
;18:"models/weapons/v_launch/tris.md3" or "players/male/tris.md3"
;19:
;20:Testmodel will create a fake entity 100 units in front of the current view
;21:position, directly facing the viewer.  It will remain immobile, so you can
;22:move around it to view it from different angles.
;23:
;24:Testgun will cause the model to follow the player around and supress the real
;25:view weapon model.  The default frame 0 of most guns is completely off screen,
;26:so you will probably have to cycle a couple frames to see it.
;27:
;28:"nextframe", "prevframe", "nextskin", and "prevskin" commands will change the
;29:frame or skin of the testmodel.  These are bound to F5, F6, F7, and F8 in
;30:q3default.cfg.
;31:
;32:If a gun is being tested, the "gun_x", "gun_y", and "gun_z" variables will let
;33:you adjust the positioning.
;34:
;35:Note that none of the model testing features update while the game is paused, so
;36:it may be convenient to test with deathmatch set to 1 so that bringing down the
;37:console doesn't pause the game.
;38:
;39:=============================================================================
;40:*/
;41:
;42:/*
;43:=================
;44:CG_TestModel_f
;45:
;46:Creates an entity in front of the current position, which
;47:can then be moved around
;48:=================
;49:*/
;50:void CG_TestModel_f(void) {
line 53
;51:	vec3_t angles;
;52:
;53:	memset(&cg.testModelEntity, 0, sizeof(cg.testModelEntity));
ADDRGP4 cg+117956
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 54
;54:	if (trap_Argc() < 2) {
ADDRLP4 12
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
GEI4 $75
line 55
;55:		return;
ADDRGP4 $72
JUMPV
LABELV $75
line 58
;56:	}
;57:
;58:	Q_strncpyz(cg.testModelName, CG_Argv(1), MAX_QPATH);
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRGP4 cg+118096
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 59
;59:	cg.testModelEntity.hModel = trap_R_RegisterModel(cg.testModelName);
ADDRGP4 cg+118096
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+117956+8
ADDRLP4 20
INDIRI4
ASGNI4
line 61
;60:
;61:	if (trap_Argc() == 3) {
ADDRLP4 24
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 3
NEI4 $81
line 62
;62:		cg.testModelEntity.backlerp = atof(CG_Argv(2));
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 atof
CALLF4
ASGNF4
ADDRGP4 cg+117956+100
ADDRLP4 32
INDIRF4
ASGNF4
line 63
;63:		cg.testModelEntity.frame    = 1;
ADDRGP4 cg+117956+80
CNSTI4 1
ASGNI4
line 64
;64:		cg.testModelEntity.oldframe = 0;
ADDRGP4 cg+117956+96
CNSTI4 0
ASGNI4
line 65
;65:	}
LABELV $81
line 67
;66:
;67:	if (!cg.testModelEntity.hModel) {
ADDRGP4 cg+117956+8
INDIRI4
CNSTI4 0
NEI4 $89
line 68
;68:		CG_Printf("Can't register model '%s'.\n", cg.testModelName);
ADDRGP4 $93
ARGP4
ADDRGP4 cg+118096
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 69
;69:		return;
ADDRGP4 $72
JUMPV
LABELV $89
line 72
;70:	}
;71:
;72:	VectorMA(cg.refdef.vieworg, 100, cg.refdef.viewaxis[0], cg.testModelEntity.origin);
ADDRGP4 cg+117956+68
ADDRGP4 cg+109056+24
INDIRF4
ADDRGP4 cg+109056+36
INDIRF4
CNSTF4 1120403456
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+117956+68+4
ADDRGP4 cg+109056+24+4
INDIRF4
ADDRGP4 cg+109056+36+4
INDIRF4
CNSTF4 1120403456
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+117956+68+8
ADDRGP4 cg+109056+24+8
INDIRF4
ADDRGP4 cg+109056+36+8
INDIRF4
CNSTF4 1120403456
MULF4
ADDF4
ASGNF4
line 74
;73:
;74:	angles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 75
;75:	angles[YAW]   = 180 + cg.refdefViewAngles[1];
ADDRLP4 0+4
ADDRGP4 cg+109424+4
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 76
;76:	angles[ROLL]  = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 78
;77:
;78:	AnglesToAxis(angles, cg.testModelEntity.axis);
ADDRLP4 0
ARGP4
ADDRGP4 cg+117956+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 79
;79:	cg.testGun = qfalse;
ADDRGP4 cg+118160
CNSTI4 0
ASGNI4
line 80
;80:}
LABELV $72
endproc CG_TestModel_f 36 12
export CG_TestGun_f
proc CG_TestGun_f 0 0
line 89
;81:
;82:/*
;83:=================
;84:CG_TestGun_f
;85:
;86:Replaces the current view weapon with the given model
;87:=================
;88:*/
;89:void CG_TestGun_f(void) {
line 90
;90:	CG_TestModel_f();
ADDRGP4 CG_TestModel_f
CALLV
pop
line 91
;91:	cg.testGun                  = qtrue;
ADDRGP4 cg+118160
CNSTI4 1
ASGNI4
line 92
;92:	cg.testModelEntity.renderfx = RF_MINLIGHT | RF_DEPTHHACK | RF_FIRST_PERSON;
ADDRGP4 cg+117956+4
CNSTI4 13
ASGNI4
line 93
;93:}
LABELV $126
endproc CG_TestGun_f 0 0
export CG_TestModelNextFrame_f
proc CG_TestModelNextFrame_f 4 8
line 95
;94:
;95:void CG_TestModelNextFrame_f(void) {
line 96
;96:	cg.testModelEntity.frame++;
ADDRLP4 0
ADDRGP4 cg+117956+80
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 97
;97:	CG_Printf("frame %i\n", cg.testModelEntity.frame);
ADDRGP4 $133
ARGP4
ADDRGP4 cg+117956+80
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 98
;98:}
LABELV $130
endproc CG_TestModelNextFrame_f 4 8
export CG_TestModelPrevFrame_f
proc CG_TestModelPrevFrame_f 4 8
line 100
;99:
;100:void CG_TestModelPrevFrame_f(void) {
line 101
;101:	cg.testModelEntity.frame--;
ADDRLP4 0
ADDRGP4 cg+117956+80
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 102
;102:	if (cg.testModelEntity.frame < 0) {
ADDRGP4 cg+117956+80
INDIRI4
CNSTI4 0
GEI4 $139
line 103
;103:		cg.testModelEntity.frame = 0;
ADDRGP4 cg+117956+80
CNSTI4 0
ASGNI4
line 104
;104:	}
LABELV $139
line 105
;105:	CG_Printf("frame %i\n", cg.testModelEntity.frame);
ADDRGP4 $133
ARGP4
ADDRGP4 cg+117956+80
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 106
;106:}
LABELV $136
endproc CG_TestModelPrevFrame_f 4 8
export CG_TestModelNextSkin_f
proc CG_TestModelNextSkin_f 4 8
line 108
;107:
;108:void CG_TestModelNextSkin_f(void) {
line 109
;109:	cg.testModelEntity.skinNum++;
ADDRLP4 0
ADDRGP4 cg+117956+104
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 110
;110:	CG_Printf("skin %i\n", cg.testModelEntity.skinNum);
ADDRGP4 $150
ARGP4
ADDRGP4 cg+117956+104
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 111
;111:}
LABELV $147
endproc CG_TestModelNextSkin_f 4 8
export CG_TestModelPrevSkin_f
proc CG_TestModelPrevSkin_f 4 8
line 113
;112:
;113:void CG_TestModelPrevSkin_f(void) {
line 114
;114:	cg.testModelEntity.skinNum--;
ADDRLP4 0
ADDRGP4 cg+117956+104
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 115
;115:	if (cg.testModelEntity.skinNum < 0) {
ADDRGP4 cg+117956+104
INDIRI4
CNSTI4 0
GEI4 $156
line 116
;116:		cg.testModelEntity.skinNum = 0;
ADDRGP4 cg+117956+104
CNSTI4 0
ASGNI4
line 117
;117:	}
LABELV $156
line 118
;118:	CG_Printf("skin %i\n", cg.testModelEntity.skinNum);
ADDRGP4 $150
ARGP4
ADDRGP4 cg+117956+104
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 119
;119:}
LABELV $153
endproc CG_TestModelPrevSkin_f 4 8
proc CG_AddTestModel 32 4
line 121
;120:
;121:static void CG_AddTestModel(void) {
line 125
;122:	int i;
;123:
;124:	// re-register the model, because the level may have changed
;125:	cg.testModelEntity.hModel = trap_R_RegisterModel(cg.testModelName);
ADDRGP4 cg+118096
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cg+117956+8
ADDRLP4 4
INDIRI4
ASGNI4
line 126
;126:	if (!cg.testModelEntity.hModel) {
ADDRGP4 cg+117956+8
INDIRI4
CNSTI4 0
NEI4 $168
line 127
;127:		CG_Printf("Can't register model\n");
ADDRGP4 $172
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 128
;128:		return;
ADDRGP4 $164
JUMPV
LABELV $168
line 132
;129:	}
;130:
;131:	// if testing a gun, set the origin relative to the view origin
;132:	if (cg.testGun) {
ADDRGP4 cg+118160
INDIRI4
CNSTI4 0
EQI4 $173
line 133
;133:		VectorCopy(cg.refdef.vieworg, cg.testModelEntity.origin);
ADDRGP4 cg+117956+68
ADDRGP4 cg+109056+24
INDIRB
ASGNB 12
line 134
;134:		VectorCopy(cg.refdef.viewaxis[0], cg.testModelEntity.axis[0]);
ADDRGP4 cg+117956+28
ADDRGP4 cg+109056+36
INDIRB
ASGNB 12
line 135
;135:		VectorCopy(cg.refdef.viewaxis[1], cg.testModelEntity.axis[1]);
ADDRGP4 cg+117956+28+12
ADDRGP4 cg+109056+36+12
INDIRB
ASGNB 12
line 136
;136:		VectorCopy(cg.refdef.viewaxis[2], cg.testModelEntity.axis[2]);
ADDRGP4 cg+117956+28+24
ADDRGP4 cg+109056+36+24
INDIRB
ASGNB 12
line 139
;137:
;138:		// allow the position to be adjusted
;139:		for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $196
line 140
;140:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[0][i] * cg_gun_x.value;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117956+68
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+109056+36
ADDP4
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 141
;141:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[1][i] * cg_gun_y.value;
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117956+68
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+109056+36+12
ADDP4
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 142
;142:			cg.testModelEntity.origin[i] += cg.refdef.viewaxis[2][i] * cg_gun_z.value;
ADDRLP4 28
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117956+68
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+109056+36+24
ADDP4
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 143
;143:		}
LABELV $197
line 139
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
line 144
;144:	}
LABELV $173
line 146
;145:
;146:	trap_R_AddRefEntityToScene(&cg.testModelEntity);
ADDRGP4 cg+117956
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 147
;147:}
LABELV $164
endproc CG_AddTestModel 32 4
proc CG_CalcVrect 12 8
line 158
;148:
;149://============================================================================
;150:
;151:/*
;152:=================
;153:CG_CalcVrect
;154:
;155:Sets the coordinates of the rendered window
;156:=================
;157:*/
;158:static void CG_CalcVrect(void) {
line 162
;159:	int size;
;160:
;161:	// the intermission should allways be full screen
;162:	if (cg.snap->ps.pm_type == PM_INTERMISSION) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $219
line 163
;163:		size = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 164
;164:	} else {
ADDRGP4 $220
JUMPV
LABELV $219
line 166
;165:		// bound normal viewsize
;166:		if (cg_viewsize.integer < 30) {
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 30
GEI4 $222
line 167
;167:			trap_Cvar_Set("cg_viewsize", "30");
ADDRGP4 $225
ARGP4
ADDRGP4 $226
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 168
;168:			size = 30;
ADDRLP4 0
CNSTI4 30
ASGNI4
line 169
;169:		} else if (cg_viewsize.integer > 100) {
ADDRGP4 $223
JUMPV
LABELV $222
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 100
LEI4 $227
line 170
;170:			trap_Cvar_Set("cg_viewsize", "100");
ADDRGP4 $225
ARGP4
ADDRGP4 $230
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 171
;171:			size = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 172
;172:		} else {
ADDRGP4 $228
JUMPV
LABELV $227
line 173
;173:			size = cg_viewsize.integer;
ADDRLP4 0
ADDRGP4 cg_viewsize+12
INDIRI4
ASGNI4
line 174
;174:		}
LABELV $228
LABELV $223
line 175
;175:	}
LABELV $220
line 176
;176:	cg.refdef.width = cgs.glconfig.vidWidth * size / 100;
ADDRGP4 cg+109056+8
ADDRGP4 cgs+20100+11304
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 177
;177:	cg.refdef.width &= ~1;
ADDRLP4 4
ADDRGP4 cg+109056+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 179
;178:
;179:	cg.refdef.height = cgs.glconfig.vidHeight * size / 100;
ADDRGP4 cg+109056+12
ADDRGP4 cgs+20100+11308
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 180
;180:	cg.refdef.height &= ~1;
ADDRLP4 8
ADDRGP4 cg+109056+12
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 182
;181:
;182:	cg.refdef.x = (cgs.glconfig.vidWidth - cg.refdef.width) / 2;
ADDRGP4 cg+109056
ADDRGP4 cgs+20100+11304
INDIRI4
ADDRGP4 cg+109056+8
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 183
;183:	cg.refdef.y = (cgs.glconfig.vidHeight - cg.refdef.height) / 2;
ADDRGP4 cg+109056+4
ADDRGP4 cgs+20100+11308
INDIRI4
ADDRGP4 cg+109056+12
INDIRI4
SUBI4
CNSTI4 2
DIVI4
ASGNI4
line 184
;184:}
LABELV $218
endproc CG_CalcVrect 12 8
data
align 4
LABELV $256
byte 4 3229614080
byte 4 3229614080
byte 4 3229614080
align 4
LABELV $257
byte 4 1082130432
byte 4 1082130432
byte 4 1082130432
code
proc CG_OffsetThirdPersonView 180 28
line 195
;185:
;186://==============================================================================
;187:
;188:/*
;189:===============
;190:CG_OffsetThirdPersonView
;191:
;192:===============
;193:*/
;194:#define FOCUS_DISTANCE 512
;195:static void CG_OffsetThirdPersonView(void) {
line 206
;196:	vec3_t        forward, right, up;
;197:	vec3_t        view;
;198:	vec3_t        focusAngles;
;199:	trace_t       trace;
;200:	static vec3_t mins = {-4, -4, -4};
;201:	static vec3_t maxs = {4, 4, 4};
;202:	vec3_t        focusPoint;
;203:	float         focusDist;
;204:	float         forwardScale, sideScale;
;205:
;206:	cg.refdef.vieworg[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 140
ADDRGP4 cg+109056+24+8
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRF4
ADDRGP4 cg+107636+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 208
;207:
;208:	VectorCopy(cg.refdefViewAngles, focusAngles);
ADDRLP4 48
ADDRGP4 cg+109424
INDIRB
ASGNB 12
line 211
;209:
;210:	// if dead, look at killer
;211:	if (cg.predictedPlayerState.stats[STAT_HEALTH] <= 0) {
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $264
line 212
;212:		focusAngles[YAW]         = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
ADDRLP4 48+4
ADDRGP4 cg+107636+184+16
INDIRI4
CVIF4 4
ASGNF4
line 213
;213:		cg.refdefViewAngles[YAW] = cg.predictedPlayerState.stats[STAT_DEAD_YAW];
ADDRGP4 cg+109424+4
ADDRGP4 cg+107636+184+16
INDIRI4
CVIF4 4
ASGNF4
line 214
;214:	}
LABELV $264
line 216
;215:
;216:	if (focusAngles[PITCH] > 45) {
ADDRLP4 48
INDIRF4
CNSTF4 1110704128
LEF4 $277
line 217
;217:		focusAngles[PITCH] = 45;  // don't go too far overhead
ADDRLP4 48
CNSTF4 1110704128
ASGNF4
line 218
;218:	}
LABELV $277
line 219
;219:	AngleVectors(focusAngles, forward, NULL, NULL);
ADDRLP4 48
ARGP4
ADDRLP4 24
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 221
;220:
;221:	VectorMA(cg.refdef.vieworg, FOCUS_DISTANCE, forward, focusPoint);
ADDRLP4 12
ADDRGP4 cg+109056+24
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1140850688
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRGP4 cg+109056+24+4
INDIRF4
ADDRLP4 24+4
INDIRF4
CNSTF4 1140850688
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRGP4 cg+109056+24+8
INDIRF4
ADDRLP4 24+8
INDIRF4
CNSTF4 1140850688
MULF4
ADDF4
ASGNF4
line 223
;222:
;223:	VectorCopy(cg.refdef.vieworg, view);
ADDRLP4 0
ADDRGP4 cg+109056+24
INDIRB
ASGNB 12
line 225
;224:
;225:	view[2] += 8;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 227
;226:
;227:	cg.refdefViewAngles[PITCH] *= 0.5;
ADDRLP4 144
ADDRGP4 cg+109424
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 229
;228:
;229:	AngleVectors(cg.refdefViewAngles, forward, right, up);
ADDRGP4 cg+109424
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 231
;230:
;231:	forwardScale = cos(cg_thirdPersonAngle.value / 180 * M_PI);
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
CNSTF4 1016003125
MULF4
ARGF4
ADDRLP4 148
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 60
ADDRLP4 148
INDIRF4
ASGNF4
line 232
;232:	sideScale    = sin(cg_thirdPersonAngle.value / 180 * M_PI);
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
CNSTF4 1016003125
MULF4
ARGF4
ADDRLP4 152
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 64
ADDRLP4 152
INDIRF4
ASGNF4
line 233
;233:	VectorMA(view, -cg_thirdPersonRange.value * forwardScale, forward, view);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 60
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 60
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 60
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 234
;234:	VectorMA(view, -cg_thirdPersonRange.value * sideScale, right, view);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 64
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 64
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDRGP4 cg_thirdPersonRange+8
INDIRF4
NEGF4
ADDRLP4 64
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 239
;235:
;236:	// trace a ray from the origin to the viewpoint to make sure the view isn't
;237:	// in a solid block.  Use an 8 by 8 block to prevent the view from near clipping anything
;238:
;239:	if (!cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
NEI4 $316
line 240
;240:		CG_Trace(&trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID);
ADDRLP4 72
ARGP4
ADDRGP4 cg+109056+24
ARGP4
ADDRGP4 $256
ARGP4
ADDRGP4 $257
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+107636+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 242
;241:
;242:		if (trace.fraction != 1.0) {
ADDRLP4 72+8
INDIRF4
CNSTF4 1065353216
EQF4 $323
line 243
;243:			VectorCopy(trace.endpos, view);
ADDRLP4 0
ADDRLP4 72+12
INDIRB
ASGNB 12
line 244
;244:			view[2] += (1.0 - trace.fraction) * 32;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 72+8
INDIRF4
SUBF4
CNSTF4 1107296256
MULF4
ADDF4
ASGNF4
line 248
;245:			// try another trace to this position, because a tunnel may have the ceiling
;246:			// close enough that this is poking out
;247:
;248:			CG_Trace(&trace, cg.refdef.vieworg, mins, maxs, view, cg.predictedPlayerState.clientNum, MASK_SOLID);
ADDRLP4 72
ARGP4
ADDRGP4 cg+109056+24
ARGP4
ADDRGP4 $256
ARGP4
ADDRGP4 $257
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 cg+107636+140
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 249
;249:			VectorCopy(trace.endpos, view);
ADDRLP4 0
ADDRLP4 72+12
INDIRB
ASGNB 12
line 250
;250:		}
LABELV $323
line 251
;251:	}
LABELV $316
line 253
;252:
;253:	VectorCopy(view, cg.refdef.vieworg);
ADDRGP4 cg+109056+24
ADDRLP4 0
INDIRB
ASGNB 12
line 256
;254:
;255:	// select pitch to look at focus point from vieword
;256:	VectorSubtract(focusPoint, cg.refdef.vieworg, focusPoint);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRGP4 cg+109056+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+109056+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+109056+24+8
INDIRF4
SUBF4
ASGNF4
line 257
;257:	focusDist = sqrt(focusPoint[0] * focusPoint[0] + focusPoint[1] * focusPoint[1]);
ADDRLP4 164
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 164
INDIRF4
ADDRLP4 164
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 12+4
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 168
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 168
INDIRF4
ASGNF4
line 258
;258:	if (focusDist < 1) {
ADDRLP4 68
INDIRF4
CNSTF4 1065353216
GEF4 $350
line 259
;259:		focusDist = 1;  // should never happen
ADDRLP4 68
CNSTF4 1065353216
ASGNF4
line 260
;260:	}
LABELV $350
line 261
;261:	cg.refdefViewAngles[PITCH] = -180 / M_PI * atan2(focusPoint[2], focusDist);
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 68
INDIRF4
ARGF4
ADDRLP4 172
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRGP4 cg+109424
ADDRLP4 172
INDIRF4
CNSTF4 3261411041
MULF4
ASGNF4
line 262
;262:	cg.refdefViewAngles[YAW] -= cg_thirdPersonAngle.value;
ADDRLP4 176
ADDRGP4 cg+109424+4
ASGNP4
ADDRLP4 176
INDIRP4
ADDRLP4 176
INDIRP4
INDIRF4
ADDRGP4 cg_thirdPersonAngle+8
INDIRF4
SUBF4
ASGNF4
line 263
;263:}
LABELV $255
endproc CG_OffsetThirdPersonView 180 28
proc CG_StepOffset 8 0
line 266
;264:
;265:// this causes a compiler bug on mac MrC compiler
;266:static void CG_StepOffset(void) {
line 270
;267:	int timeDelta;
;268:
;269:	// smooth out stair climbing
;270:	timeDelta = cg.time - cg.stepTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108936
INDIRI4
SUBI4
ASGNI4
line 271
;271:	if (timeDelta < STEP_TIME) {
ADDRLP4 0
INDIRI4
CNSTI4 200
GEI4 $360
line 272
;272:		cg.refdef.vieworg[2] -= cg.stepChange * (STEP_TIME - timeDelta) / STEP_TIME;
ADDRLP4 4
ADDRGP4 cg+109056+24+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cg+108932
INDIRF4
CNSTI4 200
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1000593162
MULF4
SUBF4
ASGNF4
line 273
;273:	}
LABELV $360
line 274
;274:}
LABELV $357
endproc CG_StepOffset 8 0
proc CG_OffsetFirstPersonView 96 0
line 282
;275:
;276:/*
;277:===============
;278:CG_OffsetFirstPersonView
;279:
;280:===============
;281:*/
;282:static void CG_OffsetFirstPersonView(void) {
line 293
;283:	float* origin;
;284:	float* angles;
;285:	float  bob;
;286:	float  ratio;
;287:	float  delta;
;288:	float  speed;
;289:	float  f;
;290:	vec3_t predictedVelocity;
;291:	int    timeDelta;
;292:
;293:	if (cg.snap->ps.pm_type == PM_INTERMISSION) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $367
line 294
;294:		return;
ADDRGP4 $366
JUMPV
LABELV $367
line 297
;295:	}
;296:
;297:	origin = cg.refdef.vieworg;
ADDRLP4 8
ADDRGP4 cg+109056+24
ASGNP4
line 298
;298:	angles = cg.refdefViewAngles;
ADDRLP4 4
ADDRGP4 cg+109424
ASGNP4
line 301
;299:
;300:	// if dead, fix the angle and don't add any kick
;301:	if (cg.snap->ps.stats[STAT_HEALTH] <= 0) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $373
line 302
;302:		angles[ROLL]  = 40;
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1109393408
ASGNF4
line 303
;303:		angles[PITCH] = -15;
ADDRLP4 4
INDIRP4
CNSTF4 3245342720
ASGNF4
line 304
;304:		angles[YAW]   = cg.snap->ps.stats[STAT_DEAD_YAW];
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 244
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 305
;305:		origin[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 44
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRF4
ADDRGP4 cg+107636+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 306
;306:		return;
ADDRGP4 $366
JUMPV
LABELV $373
line 310
;307:	}
;308:
;309:	// add angles based on weapon kick
;310:	VectorAdd(angles, cg.kick_angles, angles);
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cg+117916
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 cg+117916+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 cg+117916+8
INDIRF4
ADDF4
ASGNF4
line 313
;311:
;312:	// add angles based on damage kick
;313:	if (cg.damageTime) {
ADDRGP4 cg+117860
INDIRI4
CNSTI4 0
EQI4 $384
line 314
;314:		ratio = cg.time - cg.damageTime;
ADDRLP4 32
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117860
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 315
;315:		if (ratio < DAMAGE_DEFLECT_TIME) {
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
GEF4 $389
line 316
;316:			ratio /= DAMAGE_DEFLECT_TIME;
ADDRLP4 32
ADDRLP4 32
INDIRF4
CNSTF4 1008981770
MULF4
ASGNF4
line 317
;317:			angles[PITCH] += ratio * cg.v_dmg_pitch;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+117908
INDIRF4
MULF4
ADDF4
ASGNF4
line 318
;318:			angles[ROLL] += ratio * cg.v_dmg_roll;
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+117912
INDIRF4
MULF4
ADDF4
ASGNF4
line 319
;319:		} else {
ADDRGP4 $390
JUMPV
LABELV $389
line 320
;320:			ratio = 1.0 - (ratio - DAMAGE_DEFLECT_TIME) / DAMAGE_RETURN_TIME;
ADDRLP4 32
CNSTF4 1065353216
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
SUBF4
CNSTF4 992204554
MULF4
SUBF4
ASGNF4
line 321
;321:			if (ratio > 0) {
ADDRLP4 32
INDIRF4
CNSTF4 0
LEF4 $393
line 322
;322:				angles[PITCH] += ratio * cg.v_dmg_pitch;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+117908
INDIRF4
MULF4
ADDF4
ASGNF4
line 323
;323:				angles[ROLL] += ratio * cg.v_dmg_roll;
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 32
INDIRF4
ADDRGP4 cg+117912
INDIRF4
MULF4
ADDF4
ASGNF4
line 324
;324:			}
LABELV $393
line 325
;325:		}
LABELV $390
line 326
;326:	}
LABELV $384
line 337
;327:
;328:	// add pitch based on fall kick
;329:#if 0
;330:	ratio = ( cg.time - cg.landTime) / FALL_TIME;
;331:	if (ratio < 0)
;332:		ratio = 0;
;333:	angles[PITCH] += ratio * cg.fall_value;
;334:#endif
;335:
;336:	// add angles based on velocity
;337:	VectorCopy(cg.predictedPlayerState.velocity, predictedVelocity);
ADDRLP4 12
ADDRGP4 cg+107636+32
INDIRB
ASGNB 12
line 339
;338:
;339:	delta = DotProduct(predictedVelocity, cg.refdef.viewaxis[0]);
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRGP4 cg+109056+36
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+109056+36+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+109056+36+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 340
;340:	angles[PITCH] += delta * cg_runpitch.value;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDRGP4 cg_runpitch+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 342
;341:
;342:	delta = DotProduct(predictedVelocity, cg.refdef.viewaxis[1]);
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRGP4 cg+109056+36+12
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRGP4 cg+109056+36+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRGP4 cg+109056+36+12+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 343
;343:	angles[ROLL] -= delta * cg_runroll.value;
ADDRLP4 60
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDRGP4 cg_runroll+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 348
;344:
;345:	// add angles based on bob
;346:
;347:	// make sure the bob is visible even at low speeds
;348:	speed = cg.xyspeed > 200 ? cg.xyspeed : 200;
ADDRGP4 cg+117948
INDIRF4
CNSTF4 1128792064
LEF4 $427
ADDRLP4 64
ADDRGP4 cg+117948
INDIRF4
ASGNF4
ADDRGP4 $428
JUMPV
LABELV $427
ADDRLP4 64
CNSTF4 1128792064
ASGNF4
LABELV $428
ADDRLP4 28
ADDRLP4 64
INDIRF4
ASGNF4
line 350
;349:
;350:	delta = cg.bobfracsin * cg_bobpitch.value * speed;
ADDRLP4 0
ADDRGP4 cg+117940
INDIRF4
ADDRGP4 cg_bobpitch+8
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 351
;351:	if (cg.predictedPlayerState.pm_flags & PMF_DUCKED)
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $431
line 352
;352:		delta *= 3;  // crouching
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1077936128
MULF4
ASGNF4
LABELV $431
line 353
;353:	angles[PITCH] += delta;
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
line 354
;354:	delta = cg.bobfracsin * cg_bobroll.value * speed;
ADDRLP4 0
ADDRGP4 cg+117940
INDIRF4
ADDRGP4 cg_bobroll+8
INDIRF4
MULF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 355
;355:	if (cg.predictedPlayerState.pm_flags & PMF_DUCKED)
ADDRGP4 cg+107636+12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $437
line 356
;356:		delta *= 3;  // crouching accentuates roll
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1077936128
MULF4
ASGNF4
LABELV $437
line 357
;357:	if (cg.bobcycle & 1)
ADDRGP4 cg+117944
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $441
line 358
;358:		delta = -delta;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
LABELV $441
line 359
;359:	angles[ROLL] += delta;
ADDRLP4 72
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
line 364
;360:
;361:	//===================================
;362:
;363:	// add view height
;364:	origin[2] += cg.predictedPlayerState.viewheight;
ADDRLP4 76
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRGP4 cg+107636+164
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 367
;365:
;366:	// smooth out duck height changes
;367:	timeDelta = cg.time - cg.duckTime;
ADDRLP4 36
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108944
INDIRI4
SUBI4
ASGNI4
line 368
;368:	if (timeDelta < DUCK_TIME) {
ADDRLP4 36
INDIRI4
CNSTI4 100
GEI4 $448
line 369
;369:		cg.refdef.vieworg[2] -= cg.duckChange * (DUCK_TIME - timeDelta) / DUCK_TIME;
ADDRLP4 80
ADDRGP4 cg+109056+24+8
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRGP4 cg+108940
INDIRF4
CNSTI4 100
ADDRLP4 36
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1008981770
MULF4
SUBF4
ASGNF4
line 370
;370:	}
LABELV $448
line 373
;371:
;372:	// add bob height
;373:	bob = cg.bobfracsin * cg.xyspeed * cg_bobup.value;
ADDRLP4 24
ADDRGP4 cg+117940
INDIRF4
ADDRGP4 cg+117948
INDIRF4
MULF4
ADDRGP4 cg_bobup+8
INDIRF4
MULF4
ASGNF4
line 374
;374:	if (bob > 6) {
ADDRLP4 24
INDIRF4
CNSTF4 1086324736
LEF4 $457
line 375
;375:		bob = 6;
ADDRLP4 24
CNSTF4 1086324736
ASGNF4
line 376
;376:	}
LABELV $457
line 378
;377:
;378:	origin[2] += bob;
ADDRLP4 80
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
line 381
;379:
;380:	// add fall height
;381:	delta = cg.time - cg.landTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108952
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 382
;382:	if (delta < LAND_DEFLECT_TIME) {
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
GEF4 $461
line 383
;383:		f = delta / LAND_DEFLECT_TIME;
ADDRLP4 40
ADDRLP4 0
INDIRF4
CNSTF4 1004172302
MULF4
ASGNF4
line 384
;384:		cg.refdef.vieworg[2] += cg.landChange * f;
ADDRLP4 84
ADDRGP4 cg+109056+24+8
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRGP4 cg+108948
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
line 385
;385:	} else if (delta < LAND_DEFLECT_TIME + LAND_RETURN_TIME) {
ADDRGP4 $462
JUMPV
LABELV $461
ADDRLP4 0
INDIRF4
CNSTF4 1138819072
GEF4 $467
line 386
;386:		delta -= LAND_DEFLECT_TIME;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
SUBF4
ASGNF4
line 387
;387:		f = 1.0 - (delta / LAND_RETURN_TIME);
ADDRLP4 40
CNSTF4 1065353216
ADDRLP4 0
INDIRF4
CNSTF4 995783694
MULF4
SUBF4
ASGNF4
line 388
;388:		cg.refdef.vieworg[2] += cg.landChange * f;
ADDRLP4 84
ADDRGP4 cg+109056+24+8
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRF4
ADDRGP4 cg+108948
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
ADDF4
ASGNF4
line 389
;389:	}
LABELV $467
LABELV $462
line 392
;390:
;391:	// add step offset
;392:	CG_StepOffset();
ADDRGP4 CG_StepOffset
CALLV
pop
line 396
;393:
;394:	// add kick offset
;395:
;396:	VectorAdd(origin, cg.kick_origin, origin);
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 cg+117928
INDIRF4
ADDF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRGP4 cg+117928+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 cg+117928+8
INDIRF4
ADDF4
ASGNF4
line 410
;397:
;398:	// pivot the eye based on a neck length
;399:#if 0
;400:	{
;401:#define NECK_LENGTH 8
;402:	vec3_t			forward, up;
;403: 
;404:	cg.refdef.vieworg[2] -= NECK_LENGTH;
;405:	AngleVectors( cg.refdefViewAngles, forward, NULL, up );
;406:	VectorMA( cg.refdef.vieworg, 3, forward, cg.refdef.vieworg );
;407:	VectorMA( cg.refdef.vieworg, NECK_LENGTH, up, cg.refdef.vieworg );
;408:	}
;409:#endif
;410:}
LABELV $366
endproc CG_OffsetFirstPersonView 96 0
export CG_ZoomDown_f
proc CG_ZoomDown_f 0 0
line 414
;411:
;412://======================================================================
;413:
;414:void CG_ZoomDown_f(void) {
line 415
;415:	if (cg.zoomed) {
ADDRGP4 cg+109436
INDIRI4
CNSTI4 0
EQI4 $479
line 416
;416:		return;
ADDRGP4 $478
JUMPV
LABELV $479
line 418
;417:	}
;418:	cg.zoomed   = qtrue;
ADDRGP4 cg+109436
CNSTI4 1
ASGNI4
line 419
;419:	cg.zoomTime = cg.time;
ADDRGP4 cg+109440
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 420
;420:}
LABELV $478
endproc CG_ZoomDown_f 0 0
export CG_ZoomUp_f
proc CG_ZoomUp_f 0 0
line 422
;421:
;422:void CG_ZoomUp_f(void) {
line 423
;423:	if (!cg.zoomed) {
ADDRGP4 cg+109436
INDIRI4
CNSTI4 0
NEI4 $486
line 424
;424:		return;
ADDRGP4 $485
JUMPV
LABELV $486
line 426
;425:	}
;426:	cg.zoomed   = qfalse;
ADDRGP4 cg+109436
CNSTI4 0
ASGNI4
line 427
;427:	cg.zoomTime = cg.time;
ADDRGP4 cg+109440
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 428
;428:}
LABELV $485
endproc CG_ZoomUp_f 0 0
proc CG_CalcFov 52 8
line 440
;429:
;430:/*
;431:====================
;432:CG_CalcFov
;433:
;434:Fixed fov at intermissions, otherwise account for fov variable and zooms.
;435:====================
;436:*/
;437:#define WAVE_AMPLITUDE 1
;438:#define WAVE_FREQUENCY 0.4
;439:
;440:static int CG_CalcFov(void) {
line 450
;441:	float x;
;442:	// float	phase;
;443:	float v;
;444:	int   contents;
;445:	float fov_x, fov_y;
;446:	float zoomFov;
;447:	float f;
;448:	int   inwater;
;449:
;450:	cgs.fov = cg_fov.value;
ADDRGP4 cgs+149668
ADDRGP4 cg_fov+8
INDIRF4
ASGNF4
line 451
;451:	if (cgs.fov < 1.0)
ADDRGP4 cgs+149668
INDIRF4
CNSTF4 1065353216
GEF4 $495
line 452
;452:		cgs.fov = 1.0;
ADDRGP4 cgs+149668
CNSTF4 1065353216
ASGNF4
ADDRGP4 $496
JUMPV
LABELV $495
line 453
;453:	else if (cgs.fov > 160.0)
ADDRGP4 cgs+149668
INDIRF4
CNSTF4 1126170624
LEF4 $499
line 454
;454:		cgs.fov = 160.0;
ADDRGP4 cgs+149668
CNSTF4 1126170624
ASGNF4
LABELV $499
LABELV $496
line 456
;455:
;456:	cgs.zoomFov = cg_zoomFov.value;
ADDRGP4 cgs+149672
ADDRGP4 cg_zoomFov+8
INDIRF4
ASGNF4
line 457
;457:	if (cgs.zoomFov < 1.0)
ADDRGP4 cgs+149672
INDIRF4
CNSTF4 1065353216
GEF4 $505
line 458
;458:		cgs.zoomFov = 1.0;
ADDRGP4 cgs+149672
CNSTF4 1065353216
ASGNF4
ADDRGP4 $506
JUMPV
LABELV $505
line 459
;459:	else if (cgs.zoomFov > 160.0)
ADDRGP4 cgs+149672
INDIRF4
CNSTF4 1126170624
LEF4 $509
line 460
;460:		cgs.zoomFov = 160.0;
ADDRGP4 cgs+149672
CNSTF4 1126170624
ASGNF4
LABELV $509
LABELV $506
line 462
;461:
;462:	if (cg.predictedPlayerState.pm_type == PM_INTERMISSION) {
ADDRGP4 cg+107636+4
INDIRI4
CNSTI4 5
NEI4 $513
line 464
;463:		// if in intermission, use a fixed value
;464:		fov_x = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 465
;465:	} else {
ADDRGP4 $514
JUMPV
LABELV $513
line 467
;466:		// user selectable
;467:		fov_x = cgs.fov;
ADDRLP4 0
ADDRGP4 cgs+149668
INDIRF4
ASGNF4
line 470
;468:
;469:		// account for zooms
;470:		zoomFov = cgs.zoomFov;
ADDRLP4 28
ADDRGP4 cgs+149672
INDIRF4
ASGNF4
line 472
;471:
;472:		if (cg.zoomed) {
ADDRGP4 cg+109436
INDIRI4
CNSTI4 0
EQI4 $519
line 473
;473:			f = (cg.time - cg.zoomTime) / (float)ZOOM_TIME;
ADDRLP4 24
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+109440
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1004172302
MULF4
ASGNF4
line 474
;474:			if (f > 1.0) {
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
LEF4 $524
line 475
;475:				fov_x = zoomFov;
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 476
;476:			} else {
ADDRGP4 $520
JUMPV
LABELV $524
line 477
;477:				fov_x = fov_x + f * (zoomFov - fov_x);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 28
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 478
;478:			}
line 479
;479:		} else {
ADDRGP4 $520
JUMPV
LABELV $519
line 480
;480:			f = (cg.time - cg.zoomTime) / (float)ZOOM_TIME;
ADDRLP4 24
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+109440
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1004172302
MULF4
ASGNF4
line 481
;481:			if (f > 1.0) {
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
LEF4 $528
line 483
;482:				// fov_x = fov_x;
;483:			} else {
ADDRGP4 $529
JUMPV
LABELV $528
line 484
;484:				fov_x = zoomFov + f * (fov_x - zoomFov);
ADDRLP4 32
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 32
INDIRF4
ADDRLP4 24
INDIRF4
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 485
;485:			}
LABELV $529
line 486
;486:		}
LABELV $520
line 487
;487:	}
LABELV $514
line 489
;488:
;489:	if (cg_fovAdjust.integer) {
ADDRGP4 cg_fovAdjust+12
INDIRI4
CNSTI4 0
EQI4 $530
line 492
;490:		// Based on LordHavoc's code for Darkplaces
;491:		// http://www.quakeworld.nu/forum/topic/53/what-does-your-qw-look-like/page/30
;492:		const float baseAspect = 0.75f;  // 3/4
ADDRLP4 32
CNSTF4 1061158912
ASGNF4
line 493
;493:		const float aspect     = (float)cg.refdef.width / (float)cg.refdef.height;
ADDRLP4 36
ADDRGP4 cg+109056+8
INDIRI4
CVIF4 4
ADDRGP4 cg+109056+12
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 494
;494:		const float desiredFov = fov_x;
ADDRLP4 40
ADDRLP4 0
INDIRF4
ASGNF4
line 496
;495:
;496:		fov_x = atan2(tan(desiredFov * M_PI / 360.0f) * baseAspect * aspect, 1) * 360.0f / M_PI;
ADDRLP4 40
INDIRF4
CNSTF4 1007614517
MULF4
ARGF4
ADDRLP4 44
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
ADDRLP4 32
INDIRF4
MULF4
ADDRLP4 36
INDIRF4
MULF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 48
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 48
INDIRF4
CNSTF4 1122316001
MULF4
ASGNF4
line 497
;497:	}
LABELV $530
line 499
;498:
;499:	x     = cg.refdef.width / tan(fov_x / 360 * M_PI);
ADDRLP4 0
INDIRF4
CNSTF4 1007614517
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 tan
CALLF4
ASGNF4
ADDRLP4 8
ADDRGP4 cg+109056+8
INDIRI4
CVIF4 4
ADDRLP4 32
INDIRF4
DIVF4
ASGNF4
line 500
;500:	fov_y = atan2(cg.refdef.height, x);
ADDRGP4 cg+109056+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 36
INDIRF4
ASGNF4
line 501
;501:	fov_y = fov_y * 360 / M_PI;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1122316001
MULF4
ASGNF4
line 504
;502:
;503:	// warp if underwater
;504:	contents = CG_PointContents(cg.refdef.vieworg, -1);
ADDRGP4 cg+109056+24
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 40
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 505
;505:	if (contents & (CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA)) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $543
line 508
;506:		// phase = cg.time / 1000.0 * WAVE_FREQUENCY * M_PI * 2;
;507:		// v = WAVE_AMPLITUDE * sin( phase );
;508:		v = WAVE_AMPLITUDE * sin((cg.time % 16419587) / 397.87735f);  // result is very close to original
ADDRGP4 cg+107604
INDIRI4
CNSTI4 16419587
MODI4
CVIF4 4
CNSTF4 992261838
MULF4
ARGF4
ADDRLP4 44
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 44
INDIRF4
CNSTF4 1065353216
MULF4
ASGNF4
line 509
;509:		fov_x += v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
ASGNF4
line 510
;510:		fov_y -= v;
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ASGNF4
line 511
;511:		inwater = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 512
;512:	} else {
ADDRGP4 $544
JUMPV
LABELV $543
line 513
;513:		inwater = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 514
;514:	}
LABELV $544
line 517
;515:
;516:	// set it
;517:	cg.refdef.fov_x = fov_x;
ADDRGP4 cg+109056+16
ADDRLP4 0
INDIRF4
ASGNF4
line 518
;518:	cg.refdef.fov_y = fov_y;
ADDRGP4 cg+109056+20
ADDRLP4 4
INDIRF4
ASGNF4
line 520
;519:
;520:	if (!cg.zoomed) {
ADDRGP4 cg+109436
INDIRI4
CNSTI4 0
NEI4 $550
line 521
;521:		cg.zoomSensitivity = 1;
ADDRGP4 cg+109444
CNSTF4 1065353216
ASGNF4
line 522
;522:	} else {
ADDRGP4 $551
JUMPV
LABELV $550
line 523
;523:		cg.zoomSensitivity = cg.refdef.fov_y / 75.0;
ADDRGP4 cg+109444
ADDRGP4 cg+109056+20
INDIRF4
CNSTF4 1012560910
MULF4
ASGNF4
line 524
;524:	}
LABELV $551
line 526
;525:
;526:	return inwater;
ADDRLP4 16
INDIRI4
RETI4
LABELV $492
endproc CG_CalcFov 52 8
proc CG_DamageBlendBlob 164 12
line 535
;527:}
;528:
;529:/*
;530:===============
;531:CG_DamageBlendBlob
;532:
;533:===============
;534:*/
;535:static void CG_DamageBlendBlob(void) {
line 540
;536:	int         t;
;537:	int         maxTime;
;538:	refEntity_t ent;
;539:
;540:	if (!cg_blood.integer) {
ADDRGP4 cg_blood+12
INDIRI4
CNSTI4 0
NEI4 $558
line 541
;541:		return;
ADDRGP4 $557
JUMPV
LABELV $558
line 544
;542:	}
;543:
;544:	if (!cg.damageValue) {
ADDRGP4 cg+117872
INDIRF4
CNSTF4 0
NEF4 $561
line 545
;545:		return;
ADDRGP4 $557
JUMPV
LABELV $561
line 553
;546:	}
;547:
;548:	// if (cg.cameraMode) {
;549:	//	return;
;550:	// }
;551:
;552:	// ragePro systems can't fade blends, so don't obscure the screen
;553:	if (cgs.glconfig.hardwareType == GLHW_RAGEPRO) {
ADDRGP4 cgs+20100+11288
INDIRI4
CNSTI4 3
NEI4 $564
line 554
;554:		return;
ADDRGP4 $557
JUMPV
LABELV $564
line 557
;555:	}
;556:
;557:	maxTime = DAMAGE_TIME;
ADDRLP4 144
CNSTI4 500
ASGNI4
line 558
;558:	t       = cg.time - cg.damageTime;
ADDRLP4 140
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117860
INDIRI4
SUBI4
ASGNI4
line 559
;559:	if (t <= 0 || t >= maxTime) {
ADDRLP4 140
INDIRI4
CNSTI4 0
LEI4 $572
ADDRLP4 140
INDIRI4
ADDRLP4 144
INDIRI4
LTI4 $570
LABELV $572
line 560
;560:		return;
ADDRGP4 $557
JUMPV
LABELV $570
line 563
;561:	}
;562:
;563:	memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 564
;564:	ent.reType   = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 565
;565:	ent.renderfx = RF_FIRST_PERSON;
ADDRLP4 0+4
CNSTI4 4
ASGNI4
line 567
;566:
;567:	VectorMA(cg.refdef.vieworg, 8, cg.refdef.viewaxis[0], ent.origin);
ADDRLP4 0+68
ADDRGP4 cg+109056+24
INDIRF4
ADDRGP4 cg+109056+36
INDIRF4
CNSTF4 1090519040
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRGP4 cg+109056+24+4
INDIRF4
ADDRGP4 cg+109056+36+4
INDIRF4
CNSTF4 1090519040
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRGP4 cg+109056+24+8
INDIRF4
ADDRGP4 cg+109056+36+8
INDIRF4
CNSTF4 1090519040
MULF4
ADDF4
ASGNF4
line 568
;568:	VectorMA(ent.origin, cg.damageX * -8, cg.refdef.viewaxis[1], ent.origin);
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRGP4 cg+109056+36+12
INDIRF4
ADDRGP4 cg+117864
INDIRF4
CNSTF4 3238002688
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRGP4 cg+109056+36+12+4
INDIRF4
ADDRGP4 cg+117864
INDIRF4
CNSTF4 3238002688
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+109056+36+12+8
INDIRF4
ADDRGP4 cg+117864
INDIRF4
CNSTF4 3238002688
MULF4
MULF4
ADDF4
ASGNF4
line 569
;569:	VectorMA(ent.origin, cg.damageY * 8, cg.refdef.viewaxis[2], ent.origin);
ADDRLP4 0+68
ADDRLP4 0+68
INDIRF4
ADDRGP4 cg+109056+36+24
INDIRF4
ADDRGP4 cg+117868
INDIRF4
CNSTF4 1090519040
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRLP4 0+68+4
INDIRF4
ADDRGP4 cg+109056+36+24+4
INDIRF4
ADDRGP4 cg+117868
INDIRF4
CNSTF4 1090519040
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
ADDRGP4 cg+109056+36+24+8
INDIRF4
ADDRGP4 cg+117868
INDIRF4
CNSTF4 1090519040
MULF4
MULF4
ADDF4
ASGNF4
line 571
;570:
;571:	ent.radius        = cg.damageValue * 3;
ADDRLP4 0+132
ADDRGP4 cg+117872
INDIRF4
CNSTF4 1077936128
MULF4
ASGNF4
line 572
;572:	ent.customShader  = cgs.media.viewBloodShader;
ADDRLP4 0+112
ADDRGP4 cgs+148692+216
INDIRI4
ASGNI4
line 573
;573:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 574
;574:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 575
;575:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 576
;576:	ent.shaderRGBA[3] = 200 * (1.0 - ((float)t / maxTime));
ADDRLP4 156
CNSTF4 1065353216
ADDRLP4 140
INDIRI4
CVIF4 4
ADDRLP4 144
INDIRI4
CVIF4 4
DIVF4
SUBF4
CNSTF4 1128792064
MULF4
ASGNF4
ADDRLP4 160
CNSTF4 1325400064
ASGNF4
ADDRLP4 156
INDIRF4
ADDRLP4 160
INDIRF4
LTF4 $656
ADDRLP4 152
ADDRLP4 156
INDIRF4
ADDRLP4 160
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $657
JUMPV
LABELV $656
ADDRLP4 152
ADDRLP4 156
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $657
ADDRLP4 0+116+3
ADDRLP4 152
INDIRU4
CVUU1 4
ASGNU1
line 577
;577:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 578
;578:}
LABELV $557
endproc CG_DamageBlendBlob 164 12
proc CG_CalcViewValues 32 12
line 587
;579:
;580:/*
;581:===============
;582:CG_CalcViewValues
;583:
;584:Sets cg.refdef view values
;585:===============
;586:*/
;587:static int CG_CalcViewValues(void) {
line 590
;588:	playerState_t* ps;
;589:
;590:	memset(&cg.refdef, 0, sizeof(cg.refdef));
ADDRGP4 cg+109056
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 597
;591:
;592:	// strings for in game rendering
;593:	// Q_strncpyz( cg.refdef.text[0], "Park Ranger", sizeof(cg.refdef.text[0]) );
;594:	// Q_strncpyz( cg.refdef.text[1], "19", sizeof(cg.refdef.text[1]) );
;595:
;596:	// calculate size of 3D view
;597:	CG_CalcVrect();
ADDRGP4 CG_CalcVrect
CALLV
pop
line 599
;598:
;599:	ps = &cg.predictedPlayerState;
ADDRLP4 0
ADDRGP4 cg+107636
ASGNP4
line 615
;600:	/*
;601:	    if (cg.cameraMode) {
;602:	        vec3_t origin, angles;
;603:	        if (trap_getCameraInfo(cg.time, &origin, &angles)) {
;604:	            VectorCopy(origin, cg.refdef.vieworg);
;605:	            angles[ROLL] = 0;
;606:	            VectorCopy(angles, cg.refdefViewAngles);
;607:	            AnglesToAxis( cg.refdefViewAngles, cg.refdef.viewaxis );
;608:	            return CG_CalcFov();
;609:	        } else {
;610:	            cg.cameraMode = qfalse;
;611:	        }
;612:	    }
;613:	*/
;614:	// intermission view
;615:	if (ps->pm_type == PM_INTERMISSION) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 5
NEI4 $662
line 616
;616:		VectorCopy(ps->origin, cg.refdef.vieworg);
ADDRGP4 cg+109056+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 617
;617:		VectorCopy(ps->viewangles, cg.refdefViewAngles);
ADDRGP4 cg+109424
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 618
;618:		AnglesToAxis(cg.refdefViewAngles, cg.refdef.viewaxis);
ADDRGP4 cg+109424
ARGP4
ADDRGP4 cg+109056+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 619
;619:		return CG_CalcFov();
ADDRLP4 4
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $658
JUMPV
LABELV $662
line 622
;620:	}
;621:
;622:	cg.bobcycle   = (ps->bobCycle & 128) >> 7;
ADDRGP4 cg+117944
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 7
RSHI4
ASGNI4
line 623
;623:	cg.bobfracsin = fabs(sin((ps->bobCycle & 127) / 127.0 * M_PI));
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 127
BANDI4
CVIF4 4
CNSTF4 1019913509
MULF4
ARGF4
ADDRLP4 4
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRGP4 cg+117940
ADDRLP4 8
INDIRF4
ASGNF4
line 624
;624:	cg.xyspeed    = sqrt(ps->velocity[0] * ps->velocity[0] + ps->velocity[1] * ps->velocity[1]);
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ARGF4
ADDRLP4 16
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRGP4 cg+117948
ADDRLP4 16
INDIRF4
ASGNF4
line 626
;625:
;626:	VectorCopy(ps->origin, cg.refdef.vieworg);
ADDRGP4 cg+109056+24
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 627
;627:	VectorCopy(ps->viewangles, cg.refdefViewAngles);
ADDRGP4 cg+109424
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
INDIRB
ASGNB 12
line 629
;628:
;629:	if (cg_cameraOrbit.integer) {
ADDRGP4 cg_cameraOrbit+12
INDIRI4
CNSTI4 0
EQI4 $676
line 630
;630:		if (cg.time > cg.nextOrbitTime) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117952
INDIRI4
LEI4 $679
line 631
;631:			cg.nextOrbitTime = cg.time + cg_cameraOrbitDelay.integer;
ADDRGP4 cg+117952
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg_cameraOrbitDelay+12
INDIRI4
ADDI4
ASGNI4
line 632
;632:			cg_thirdPersonAngle.value += cg_cameraOrbit.value;
ADDRLP4 20
ADDRGP4 cg_thirdPersonAngle+8
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRGP4 cg_cameraOrbit+8
INDIRF4
ADDF4
ASGNF4
line 633
;633:		}
LABELV $679
line 634
;634:	}
LABELV $676
line 636
;635:	// add error decay
;636:	if (cg_errorDecay.value > 0) {
ADDRGP4 cg_errorDecay+8
INDIRF4
CNSTF4 0
LEF4 $688
line 640
;637:		int   t;
;638:		float f;
;639:
;640:		t = cg.time - cg.predictedErrorTime;
ADDRLP4 24
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108848
INDIRI4
SUBI4
ASGNI4
line 641
;641:		f = (cg_errorDecay.value - t) / cg_errorDecay.value;
ADDRLP4 20
ADDRGP4 cg_errorDecay+8
INDIRF4
ADDRLP4 24
INDIRI4
CVIF4 4
SUBF4
ADDRGP4 cg_errorDecay+8
INDIRF4
DIVF4
ASGNF4
line 642
;642:		if (f > 0 && f < 1) {
ADDRLP4 28
ADDRLP4 20
INDIRF4
ASGNF4
ADDRLP4 28
INDIRF4
CNSTF4 0
LEF4 $695
ADDRLP4 28
INDIRF4
CNSTF4 1065353216
GEF4 $695
line 643
;643:			VectorMA(cg.refdef.vieworg, f, cg.predictedError, cg.refdef.vieworg);
ADDRGP4 cg+109056+24
ADDRGP4 cg+109056+24
INDIRF4
ADDRGP4 cg+108852
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+109056+24+4
ADDRGP4 cg+109056+24+4
INDIRF4
ADDRGP4 cg+108852+4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 cg+109056+24+8
ADDRGP4 cg+109056+24+8
INDIRF4
ADDRGP4 cg+108852+8
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 644
;644:		} else {
ADDRGP4 $696
JUMPV
LABELV $695
line 645
;645:			cg.predictedErrorTime = 0;
ADDRGP4 cg+108848
CNSTI4 0
ASGNI4
line 646
;646:		}
LABELV $696
line 647
;647:	}
LABELV $688
line 649
;648:
;649:	if (cg.renderingThirdPerson) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
EQI4 $719
line 651
;650:		// back away from character
;651:		CG_OffsetThirdPersonView();
ADDRGP4 CG_OffsetThirdPersonView
CALLV
pop
line 652
;652:	} else {
ADDRGP4 $720
JUMPV
LABELV $719
line 654
;653:		// offset for local bobbing and kicks
;654:		CG_OffsetFirstPersonView();
ADDRGP4 CG_OffsetFirstPersonView
CALLV
pop
line 655
;655:	}
LABELV $720
line 658
;656:
;657:	// position eye relative to origin
;658:	AnglesToAxis(cg.refdefViewAngles, cg.refdef.viewaxis);
ADDRGP4 cg+109424
ARGP4
ADDRGP4 cg+109056+36
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 660
;659:
;660:	if (cg.hyperspace) {
ADDRGP4 cg+107632
INDIRI4
CNSTI4 0
EQI4 $725
line 661
;661:		cg.refdef.rdflags |= RDF_NOWORLDMODEL | RDF_HYPERSPACE;
ADDRLP4 20
ADDRGP4 cg+109056+76
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 5
BORI4
ASGNI4
line 662
;662:	}
LABELV $725
line 665
;663:
;664:	// field of view
;665:	return CG_CalcFov();
ADDRLP4 20
ADDRGP4 CG_CalcFov
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
LABELV $658
endproc CG_CalcViewValues 32 12
proc CG_PowerupTimerSounds 12 16
line 673
;666:}
;667:
;668:/*
;669:=====================
;670:CG_PowerupTimerSounds
;671:=====================
;672:*/
;673:static void CG_PowerupTimerSounds(void) {
line 678
;674:	int i;
;675:	int t;
;676:
;677:	// powerup timers going away
;678:	for (i = 0; i < MAX_POWERUPS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $731
line 679
;679:		t = cg.snap->ps.powerups[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 356
ADDP4
ADDP4
INDIRI4
ASGNI4
line 680
;680:		if (t <= cg.time) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GTI4 $736
line 681
;681:			continue;
ADDRGP4 $732
JUMPV
LABELV $736
line 683
;682:		}
;683:		if (t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $739
line 684
;684:			continue;
ADDRGP4 $732
JUMPV
LABELV $739
line 686
;685:		}
;686:		if ((t - cg.time) / POWERUP_BLINK_TIME != (t - cg.oldTime) / POWERUP_BLINK_TIME) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+107608
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
EQI4 $742
line 687
;687:			trap_S_StartSound(NULL, cg.snap->ps.clientNum, CHAN_ITEM, cgs.media.wearOffSound);
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+148692+532
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 688
;688:		}
LABELV $742
line 689
;689:	}
LABELV $732
line 678
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $731
line 690
;690:}
LABELV $730
endproc CG_PowerupTimerSounds 12 16
export CG_AddBufferedSound
proc CG_AddBufferedSound 0 12
line 697
;691:
;692:/*
;693:=====================
;694:CG_AddBufferedSound
;695:=====================
;696:*/
;697:void CG_AddBufferedSound(sfxHandle_t sfx) {
line 698
;698:	if (!sfx)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $750
line 699
;699:		return;
ADDRGP4 $749
JUMPV
LABELV $750
line 702
;700:
;701:	// clear all buffered sounds
;702:	if (sfx == -1) {
ADDRFP4 0
INDIRI4
CNSTI4 -1
NEI4 $752
line 703
;703:		cg.soundBufferIn  = 0;
ADDRGP4 cg+117724
CNSTI4 0
ASGNI4
line 704
;704:		cg.soundBufferOut = 0;
ADDRGP4 cg+117728
CNSTI4 0
ASGNI4
line 705
;705:		memset(cg.soundBuffer, 0, sizeof(cg.soundBuffer));
ADDRGP4 cg+117736
ARGP4
CNSTI4 0
ARGI4
CNSTI4 80
ARGI4
ADDRGP4 memset
CALLP4
pop
line 706
;706:		return;
ADDRGP4 $749
JUMPV
LABELV $752
line 709
;707:	}
;708:
;709:	cg.soundBuffer[cg.soundBufferIn] = sfx;
ADDRGP4 cg+117724
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117736
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 710
;710:	cg.soundBufferIn                 = (cg.soundBufferIn + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+117724
ADDRGP4 cg+117724
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 711
;711:	if (cg.soundBufferIn == cg.soundBufferOut) {
ADDRGP4 cg+117724
INDIRI4
ADDRGP4 cg+117728
INDIRI4
NEI4 $762
line 713
;712:		// cg.soundBufferOut++;
;713:		cg.soundBufferOut = (cg.soundBufferOut + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+117728
ADDRGP4 cg+117728
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 714
;714:	}
LABELV $762
line 715
;715:}
LABELV $749
endproc CG_AddBufferedSound 0 12
proc CG_PlayBufferedSounds 0 8
line 722
;716:
;717:/*
;718:=====================
;719:CG_PlayBufferedSounds
;720:=====================
;721:*/
;722:static void CG_PlayBufferedSounds(void) {
line 723
;723:	if (cg.soundTime < cg.time) {
ADDRGP4 cg+117732
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $769
line 724
;724:		if (cg.soundBufferOut != cg.soundBufferIn && cg.soundBuffer[cg.soundBufferOut]) {
ADDRGP4 cg+117728
INDIRI4
ADDRGP4 cg+117724
INDIRI4
EQI4 $773
ADDRGP4 cg+117728
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $773
line 725
;725:			cg.soundPlaying = cg.soundBuffer[cg.soundBufferOut];
ADDRGP4 cg+117816
ADDRGP4 cg+117728
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117736
ADDP4
INDIRI4
ASGNI4
line 726
;726:			trap_S_StartLocalSound(cg.soundPlaying, CHAN_ANNOUNCER);
ADDRGP4 cg+117816
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 727
;727:			cg.soundBuffer[cg.soundBufferOut] = 0;
ADDRGP4 cg+117728
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117736
ADDP4
CNSTI4 0
ASGNI4
line 728
;728:			cg.soundBufferOut                 = (cg.soundBufferOut + 1) % MAX_SOUNDBUFFER;
ADDRGP4 cg+117728
ADDRGP4 cg+117728
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 20
MODI4
ASGNI4
line 729
;729:			cg.soundTime                      = cg.time + 750;
ADDRGP4 cg+117732
ADDRGP4 cg+107604
INDIRI4
CNSTI4 750
ADDI4
ASGNI4
line 730
;730:		} else {
ADDRGP4 $774
JUMPV
LABELV $773
line 731
;731:			cg.soundPlaying = 0;
ADDRGP4 cg+117816
CNSTI4 0
ASGNI4
line 732
;732:		}
LABELV $774
line 733
;733:	}
LABELV $769
line 734
;734:}
LABELV $768
endproc CG_PlayBufferedSounds 0 8
proc CG_FirstFrame 28 12
line 745
;735:
;736://=========================================================================
;737:
;738:/*
;739:=================
;740:CG_FirstFrame
;741:
;742:Called once on first rendered frame
;743:=================
;744:*/
;745:static void CG_FirstFrame(void) {
line 746
;746:	CG_SetConfigValues();
ADDRGP4 CG_SetConfigValues
CALLV
pop
line 748
;747:
;748:	cgs.voteTime = atoi(CG_ConfigString(CS_VOTE_TIME));
CNSTI4 8
ARGI4
ADDRLP4 0
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+31700
ADDRLP4 4
INDIRI4
ASGNI4
line 749
;749:	cgs.voteYes  = atoi(CG_ConfigString(CS_VOTE_YES));
CNSTI4 10
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+31704
ADDRLP4 12
INDIRI4
ASGNI4
line 750
;750:	cgs.voteNo   = atoi(CG_ConfigString(CS_VOTE_NO));
CNSTI4 11
ARGI4
ADDRLP4 16
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+31708
ADDRLP4 20
INDIRI4
ASGNI4
line 751
;751:	Q_strncpyz(cgs.voteString, CG_ConfigString(CS_VOTE_STRING), sizeof(cgs.voteString));
CNSTI4 9
ARGI4
ADDRLP4 24
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRGP4 cgs+31716
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 753
;752:
;753:	if (cgs.voteTime)
ADDRGP4 cgs+31700
INDIRI4
CNSTI4 0
EQI4 $796
line 754
;754:		cgs.voteModified = qtrue;
ADDRGP4 cgs+31712
CNSTI4 1
ASGNI4
ADDRGP4 $797
JUMPV
LABELV $796
line 756
;755:	else
;756:		cgs.voteModified = qfalse;
ADDRGP4 cgs+31712
CNSTI4 0
ASGNI4
LABELV $797
line 757
;757:}
LABELV $790
endproc CG_FirstFrame 28 12
export CG_DrawActiveFrame
proc CG_DrawActiveFrame 16 16
line 766
;758:
;759:/*
;760:=================
;761:CG_DrawActiveFrame
;762:
;763:Generates and draws a game scene and status information at the given time.
;764:=================
;765:*/
;766:void CG_DrawActiveFrame(int serverTime, stereoFrame_t stereoView, qboolean demoPlayback) {
line 769
;767:	int inwater;
;768:
;769:	cg.time         = serverTime;
ADDRGP4 cg+107604
ADDRFP4 0
INDIRI4
ASGNI4
line 770
;770:	cg.demoPlayback = demoPlayback;
ADDRGP4 cg+8
ADDRFP4 8
INDIRI4
ASGNI4
line 773
;771:
;772:	// update cvars
;773:	CG_UpdateCvars();
ADDRGP4 CG_UpdateCvars
CALLV
pop
line 777
;774:
;775:	// if we are only updating the screen as a loading
;776:	// pacifier, don't even try to read snapshots
;777:	if (cg.infoScreenText[0] != 0) {
ADDRGP4 cg+109448
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $804
line 778
;778:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 779
;779:		return;
ADDRGP4 $801
JUMPV
LABELV $804
line 784
;780:	}
;781:
;782:	// any looped sounds will be respecified as entities
;783:	// are added to the render list
;784:	trap_S_ClearLoopingSounds(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 787
;785:
;786:	// clear all the render lists
;787:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 790
;788:
;789:	// set up cg.snap and possibly cg.nextSnap
;790:	CG_ProcessSnapshots();
ADDRGP4 CG_ProcessSnapshots
CALLV
pop
line 794
;791:
;792:	// if we haven't received any snapshots yet, all
;793:	// we can draw is the information screen
;794:	if (!cg.snap || (cg.snap->snapFlags & SNAPFLAG_NOT_ACTIVE)) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $811
ADDRGP4 cg+36
INDIRP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $807
LABELV $811
line 795
;795:		CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 796
;796:		return;
ADDRGP4 $801
JUMPV
LABELV $807
line 800
;797:	}
;798:
;799:	// let the client system know what our weapon and zoom settings are
;800:	trap_SetUserCmdValue(cg.weaponSelect, cg.zoomSensitivity);
ADDRGP4 cg+108956
INDIRI4
ARGI4
ADDRGP4 cg+109444
INDIRF4
ARGF4
ADDRGP4 trap_SetUserCmdValue
CALLV
pop
line 802
;801:
;802:	if (cg.clientFrame == 0)
ADDRGP4 cg
INDIRI4
CNSTI4 0
NEI4 $814
line 803
;803:		CG_FirstFrame();
ADDRGP4 CG_FirstFrame
CALLV
pop
LABELV $814
line 806
;804:
;805:	// update cg.predictedPlayerState
;806:	CG_PredictPlayerState();
ADDRGP4 CG_PredictPlayerState
CALLV
pop
line 809
;807:
;808:	// decide on third person view
;809:	cg.renderingThirdPerson = cg_thirdPerson.integer || (cg.snap->ps.stats[STAT_HEALTH] <= 0);
ADDRGP4 cg_thirdPerson+12
INDIRI4
CNSTI4 0
NEI4 $822
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $820
LABELV $822
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $821
JUMPV
LABELV $820
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $821
ADDRGP4 cg+107628
ADDRLP4 4
INDIRI4
ASGNI4
line 811
;810:
;811:	CG_TrackClientTeamChange();
ADDRGP4 CG_TrackClientTeamChange
CALLV
pop
line 814
;812:
;813:	// follow killer
;814:	if (cg.followTime && cg.followTime < cg.time) {
ADDRGP4 cg+149080
INDIRI4
CNSTI4 0
EQI4 $823
ADDRGP4 cg+149080
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $823
line 815
;815:		cg.followTime = 0;
ADDRGP4 cg+149080
CNSTI4 0
ASGNI4
line 816
;816:		if (!cg.demoPlayback) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $829
line 817
;817:			trap_SendConsoleCommand(va("follow %i\n", cg.followClient));
ADDRGP4 $832
ARGP4
ADDRGP4 cg+149084
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 818
;818:		}
LABELV $829
line 819
;819:	}
LABELV $823
line 822
;820:
;821:	// build cg.refdef
;822:	inwater = CG_CalcViewValues();
ADDRLP4 8
ADDRGP4 CG_CalcViewValues
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 825
;823:
;824:	// first person blend blobs, done after AnglesToAxis
;825:	if (!cg.renderingThirdPerson) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $834
line 826
;826:		CG_DamageBlendBlob();
ADDRGP4 CG_DamageBlendBlob
CALLV
pop
line 827
;827:	}
LABELV $834
line 830
;828:
;829:	// build the render lists
;830:	if (!cg.hyperspace) {
ADDRGP4 cg+107632
INDIRI4
CNSTI4 0
NEI4 $837
line 831
;831:		CG_AddPacketEntities();  // alter calcViewValues, so predicted player state is correct
ADDRGP4 CG_AddPacketEntities
CALLV
pop
line 832
;832:		CG_AddMarks();
ADDRGP4 CG_AddMarks
CALLV
pop
line 833
;833:		CG_AddParticles();
ADDRGP4 CG_AddParticles
CALLV
pop
line 834
;834:		CG_AddLocalEntities();
ADDRGP4 CG_AddLocalEntities
CALLV
pop
line 835
;835:	}
LABELV $837
line 836
;836:	CG_AddViewWeapon(&cg.predictedPlayerState);
ADDRGP4 cg+107636
ARGP4
ADDRGP4 CG_AddViewWeapon
CALLV
pop
line 839
;837:
;838:	// add buffered sounds
;839:	CG_PlayBufferedSounds();
ADDRGP4 CG_PlayBufferedSounds
CALLV
pop
line 847
;840:
;841:#ifdef MISSIONPACK
;842:	// play buffered voice chats
;843:	CG_PlayBufferedVoiceChats();
;844:#endif
;845:
;846:	// finish up the rest of the refdef
;847:	if (cg.testModelEntity.hModel) {
ADDRGP4 cg+117956+8
INDIRI4
CNSTI4 0
EQI4 $841
line 848
;848:		CG_AddTestModel();
ADDRGP4 CG_AddTestModel
CALLV
pop
line 849
;849:	}
LABELV $841
line 850
;850:	cg.refdef.time = cg.time;
ADDRGP4 cg+109056+72
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 851
;851:	memcpy(cg.refdef.areamask, cg.snap->areamask, sizeof(cg.refdef.areamask));
ADDRGP4 cg+109056+80
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 12
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 854
;852:
;853:	// warning sounds when powerup is wearing off
;854:	CG_PowerupTimerSounds();
ADDRGP4 CG_PowerupTimerSounds
CALLV
pop
line 857
;855:
;856:	// update audio positions
;857:	trap_S_Respatialize(cg.snap->ps.clientNum, cg.refdef.vieworg, cg.refdef.viewaxis, inwater);
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+109056+24
ARGP4
ADDRGP4 cg+109056+36
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_S_Respatialize
CALLV
pop
line 860
;858:
;859:	// make sure the lagometerSample and frame timing isn't done twice when in stereo
;860:	if (stereoView != STEREO_RIGHT) {
ADDRFP4 4
INDIRI4
CNSTI4 2
EQI4 $858
line 861
;861:		cg.frametime = cg.time - cg.oldTime;
ADDRGP4 cg+107600
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+107608
INDIRI4
SUBI4
ASGNI4
line 862
;862:		if (cg.frametime < 0) {
ADDRGP4 cg+107600
INDIRI4
CNSTI4 0
GEI4 $863
line 863
;863:			cg.frametime = 0;
ADDRGP4 cg+107600
CNSTI4 0
ASGNI4
line 864
;864:		}
LABELV $863
line 865
;865:		cg.oldTime = cg.time;
ADDRGP4 cg+107608
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 866
;866:		CG_AddLagometerFrameInfo();
ADDRGP4 CG_AddLagometerFrameInfo
CALLV
pop
line 867
;867:	}
LABELV $858
line 868
;868:	if (cg_timescale.value != cg_timescaleFadeEnd.value) {
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
EQF4 $869
line 869
;869:		if (cg_timescale.value < cg_timescaleFadeEnd.value) {
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $873
line 870
;870:			cg_timescale.value += cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
ADDRLP4 12
ADDRGP4 cg_timescale+8
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
MULF4
CNSTF4 981668463
MULF4
ADDF4
ASGNF4
line 871
;871:			if (cg_timescale.value > cg_timescaleFadeEnd.value)
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
LEF4 $874
line 872
;872:				cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
line 873
;873:		} else {
ADDRGP4 $874
JUMPV
LABELV $873
line 874
;874:			cg_timescale.value -= cg_timescaleFadeSpeed.value * ((float)cg.frametime) / 1000;
ADDRLP4 12
ADDRGP4 cg_timescale+8
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
MULF4
CNSTF4 981668463
MULF4
SUBF4
ASGNF4
line 875
;875:			if (cg_timescale.value < cg_timescaleFadeEnd.value)
ADDRGP4 cg_timescale+8
INDIRF4
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
GEF4 $889
line 876
;876:				cg_timescale.value = cg_timescaleFadeEnd.value;
ADDRGP4 cg_timescale+8
ADDRGP4 cg_timescaleFadeEnd+8
INDIRF4
ASGNF4
LABELV $889
line 877
;877:		}
LABELV $874
line 878
;878:		if (cg_timescaleFadeSpeed.value) {
ADDRGP4 cg_timescaleFadeSpeed+8
INDIRF4
CNSTF4 0
EQF4 $895
line 879
;879:			trap_Cvar_Set("timescale", va("%f", cg_timescale.value));
ADDRGP4 $899
ARGP4
ADDRGP4 cg_timescale+8
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $898
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 880
;880:		}
LABELV $895
line 881
;881:	}
LABELV $869
line 884
;882:
;883:	// actually issue the rendering calls
;884:	CG_DrawActive(stereoView);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_DrawActive
CALLV
pop
line 887
;885:
;886:	// this counter will be bumped for every valid scene we generate
;887:	cg.clientFrame++;
ADDRLP4 12
ADDRGP4 cg
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 889
;888:
;889:	if (cg_stats.integer) {
ADDRGP4 cg_stats+12
INDIRI4
CNSTI4 0
EQI4 $901
line 890
;890:		CG_Printf("cg.clientFrame:%i\n", cg.clientFrame);
ADDRGP4 $904
ARGP4
ADDRGP4 cg
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 891
;891:	}
LABELV $901
line 892
;892:}
LABELV $801
endproc CG_DrawActiveFrame 16 16
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
LABELV $904
byte 1 99
byte 1 103
byte 1 46
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 70
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $899
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $898
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $832
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $230
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $226
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $225
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $172
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $150
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $133
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $93
byte 1 67
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 46
byte 1 10
byte 1 0
