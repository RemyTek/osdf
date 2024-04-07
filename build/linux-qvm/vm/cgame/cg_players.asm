data
align 4
LABELV cg_customSoundNames
address $72
address $73
address $74
address $75
address $76
address $77
address $78
address $79
address $80
address $81
address $82
address $83
address $84
skip 76
export CG_CustomSound
code
proc CG_CustomSound 16 8
file "../../../../code/cgame/cg_players.c"
line 18
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_players.c -- handle the media and animation for player entities
;4:#include "cg_local.h"
;5:
;6:#define PM_SKIN "pm"
;7:
;8:static const char* cg_customSoundNames[MAX_CUSTOM_SOUNDS] = {"*death1.wav",   "*death2.wav",   "*death3.wav",    "*jump1.wav",    "*pain25_1.wav",
;9:                                                             "*pain50_1.wav", "*pain75_1.wav", "*pain100_1.wav", "*falling1.wav", "*gasp.wav",
;10:                                                             "*drown.wav",    "*fall1.wav",    "*taunt.wav"};
;11:
;12:/*
;13:================
;14:CG_CustomSound
;15:
;16:================
;17:*/
;18:sfxHandle_t CG_CustomSound(int clientNum, const char* soundName) {
line 22
;19:	clientInfo_t* ci;
;20:	int           i;
;21:
;22:	if (soundName[0] != '*') {
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $86
line 23
;23:		return trap_S_RegisterSound(soundName, qfalse);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $85
JUMPV
LABELV $86
line 26
;24:	}
;25:
;26:	if (clientNum < 0 || clientNum >= MAX_CLIENTS) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $90
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $88
LABELV $90
line 27
;27:		clientNum = 0;
ADDRFP4 0
CNSTI4 0
ASGNI4
line 28
;28:	}
LABELV $88
line 29
;29:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 31
;30:
;31:	for (i = 0; i < MAX_CUSTOM_SOUNDS && cg_customSoundNames[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $95
JUMPV
LABELV $92
line 32
;32:		if (!strcmp(soundName, cg_customSoundNames[i])) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $96
line 33
;33:			return ci->sounds[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
INDIRI4
RETI4
ADDRGP4 $85
JUMPV
LABELV $96
line 35
;34:		}
;35:	}
LABELV $93
line 31
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $95
ADDRLP4 0
INDIRI4
CNSTI4 32
GEI4 $98
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $92
LABELV $98
line 37
;36:
;37:	CG_Error("Unknown custom sound: %s", soundName);
ADDRGP4 $99
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 38
;38:	return 0;
CNSTI4 0
RETI4
LABELV $85
endproc CG_CustomSound 16 8
proc CG_ParseAnimationFile 20076 12
line 57
;39:}
;40:
;41:/*
;42:=============================================================================
;43:
;44:CLIENT INFO
;45:
;46:=============================================================================
;47:*/
;48:
;49:/*
;50:======================
;51:CG_ParseAnimationFile
;52:
;53:Read a configuration file containing animation counts and rates
;54:models/players/visor/animation.cfg, etc
;55:======================
;56:*/
;57:static qboolean CG_ParseAnimationFile(const char* filename, clientInfo_t* ci) {
line 68
;58:	char *       text_p, *prev;
;59:	int          len;
;60:	int          i;
;61:	char*        token;
;62:	float        fps;
;63:	int          skip;
;64:	char         text[20000];
;65:	fileHandle_t f;
;66:	animation_t* animations;
;67:
;68:	animations = ci->animations;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 448
ADDP4
ASGNP4
line 71
;69:
;70:	// load the file
;71:	len = trap_FS_FOpenFile(filename, &f, FS_READ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20036
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 20036
INDIRI4
ASGNI4
line 72
;72:	if (f == FS_INVALID_HANDLE) {
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $101
line 73
;73:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $100
JUMPV
LABELV $101
line 75
;74:	}
;75:	if (len <= 0) {
ADDRLP4 28
INDIRI4
CNSTI4 0
GTI4 $103
line 76
;76:		trap_FS_FCloseFile(f);
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 77
;77:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $100
JUMPV
LABELV $103
line 79
;78:	}
;79:	if (len >= sizeof(text) - 1) {
ADDRLP4 28
INDIRI4
CVIU4 4
CNSTU4 19999
LTU4 $105
line 80
;80:		CG_Printf("File %s too long\n", filename);
ADDRGP4 $107
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 81
;81:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $100
JUMPV
LABELV $105
line 83
;82:	}
;83:	trap_FS_Read(text, len, f);
ADDRLP4 36
ARGP4
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 84
;84:	text[len] = '\0';
ADDRLP4 28
INDIRI4
ADDRLP4 36
ADDP4
CNSTI1 0
ASGNI1
line 85
;85:	trap_FS_FCloseFile(f);
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 88
;86:
;87:	// parse the text
;88:	text_p = text;
ADDRLP4 12
ADDRLP4 36
ASGNP4
line 89
;89:	skip   = 0;  // quite the compiler warning
ADDRLP4 24
CNSTI4 0
ASGNI4
line 91
;90:
;91:	ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 0
ASGNI4
line 92
;92:	VectorClear(ci->headOffset);
ADDRFP4 4
INDIRP4
CNSTI4 400
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 404
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 408
ADDP4
CNSTF4 0
ASGNF4
line 93
;93:	ci->gender     = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 94
;94:	ci->fixedlegs  = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 0
ASGNI4
line 95
;95:	ci->fixedtorso = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $109
JUMPV
LABELV $108
line 98
;96:
;97:	// read optional parameters
;98:	while (1) {
line 99
;99:		prev  = text_p;  // so we can unget
ADDRLP4 20
ADDRLP4 12
INDIRP4
ASGNP4
line 100
;100:		token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20040
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20040
INDIRP4
ASGNP4
line 101
;101:		if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $111
line 102
;102:			break;
ADDRGP4 $110
JUMPV
LABELV $111
line 104
;103:		}
;104:		if (!Q_stricmp(token, "footsteps")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $115
ARGP4
ADDRLP4 20044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20044
INDIRI4
CNSTI4 0
NEI4 $113
line 105
;105:			token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20048
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20048
INDIRP4
ASGNP4
line 106
;106:			if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $116
line 107
;107:				break;
ADDRGP4 $110
JUMPV
LABELV $116
line 109
;108:			}
;109:			if (!Q_stricmp(token, "default") || !Q_stricmp(token, "normal")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRLP4 20052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 0
EQI4 $122
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $121
ARGP4
ADDRLP4 20056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
NEI4 $118
LABELV $122
line 110
;110:				ci->footsteps = FOOTSTEP_NORMAL;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 0
ASGNI4
line 111
;111:			} else if (!Q_stricmp(token, "boot")) {
ADDRGP4 $109
JUMPV
LABELV $118
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $125
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
NEI4 $123
line 112
;112:				ci->footsteps = FOOTSTEP_BOOT;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 1
ASGNI4
line 113
;113:			} else if (!Q_stricmp(token, "flesh")) {
ADDRGP4 $109
JUMPV
LABELV $123
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $128
ARGP4
ADDRLP4 20064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 0
NEI4 $126
line 114
;114:				ci->footsteps = FOOTSTEP_FLESH;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 2
ASGNI4
line 115
;115:			} else if (!Q_stricmp(token, "mech")) {
ADDRGP4 $109
JUMPV
LABELV $126
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 20068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20068
INDIRI4
CNSTI4 0
NEI4 $129
line 116
;116:				ci->footsteps = FOOTSTEP_MECH;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 3
ASGNI4
line 117
;117:			} else if (!Q_stricmp(token, "energy")) {
ADDRGP4 $109
JUMPV
LABELV $129
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 20072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20072
INDIRI4
CNSTI4 0
NEI4 $132
line 118
;118:				ci->footsteps = FOOTSTEP_ENERGY;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
CNSTI4 4
ASGNI4
line 119
;119:			} else {
ADDRGP4 $109
JUMPV
LABELV $132
line 120
;120:				CG_Printf("Bad footsteps parm in %s: %s\n", filename, token);
ADDRGP4 $135
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 121
;121:			}
line 122
;122:			continue;
ADDRGP4 $109
JUMPV
LABELV $113
line 123
;123:		} else if (!Q_stricmp(token, "headoffset")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $138
ARGP4
ADDRLP4 20048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20048
INDIRI4
CNSTI4 0
NEI4 $136
line 124
;124:			for (i = 0; i < 3; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $139
line 125
;125:				token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 126
;126:				if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $143
line 127
;127:					break;
ADDRGP4 $109
JUMPV
LABELV $143
line 129
;128:				}
;129:				ci->headOffset[i] = atof(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20056
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 400
ADDP4
ADDP4
ADDRLP4 20056
INDIRF4
ASGNF4
line 130
;130:			}
LABELV $140
line 124
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
LTI4 $139
line 131
;131:			continue;
ADDRGP4 $109
JUMPV
LABELV $136
line 132
;132:		} else if (!Q_stricmp(token, "sex")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $147
ARGP4
ADDRLP4 20052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20052
INDIRI4
CNSTI4 0
NEI4 $145
line 133
;133:			token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20056
INDIRP4
ASGNP4
line 134
;134:			if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $148
line 135
;135:				break;
ADDRGP4 $110
JUMPV
LABELV $148
line 137
;136:			}
;137:			if (token[0] == 'f' || token[0] == 'F') {
ADDRLP4 20060
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 102
EQI4 $152
ADDRLP4 20060
INDIRI4
CNSTI4 70
NEI4 $150
LABELV $152
line 138
;138:				ci->gender = GENDER_FEMALE;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 1
ASGNI4
line 139
;139:			} else if (token[0] == 'n' || token[0] == 'N') {
ADDRGP4 $109
JUMPV
LABELV $150
ADDRLP4 20064
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 110
EQI4 $155
ADDRLP4 20064
INDIRI4
CNSTI4 78
NEI4 $153
LABELV $155
line 140
;140:				ci->gender = GENDER_NEUTER;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 2
ASGNI4
line 141
;141:			} else {
ADDRGP4 $109
JUMPV
LABELV $153
line 142
;142:				ci->gender = GENDER_MALE;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 0
ASGNI4
line 143
;143:			}
line 144
;144:			continue;
ADDRGP4 $109
JUMPV
LABELV $145
line 145
;145:		} else if (!Q_stricmp(token, "fixedlegs")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRLP4 20056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20056
INDIRI4
CNSTI4 0
NEI4 $156
line 146
;146:			ci->fixedlegs = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 392
ADDP4
CNSTI4 1
ASGNI4
line 147
;147:			continue;
ADDRGP4 $109
JUMPV
LABELV $156
line 148
;148:		} else if (!Q_stricmp(token, "fixedtorso")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $161
ARGP4
ADDRLP4 20060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20060
INDIRI4
CNSTI4 0
NEI4 $159
line 149
;149:			ci->fixedtorso = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 396
ADDP4
CNSTI4 1
ASGNI4
line 150
;150:			continue;
ADDRGP4 $109
JUMPV
LABELV $159
line 154
;151:		}
;152:
;153:		// if it is a number, start parsing animations
;154:		if (token[0] >= '0' && token[0] <= '9') {
ADDRLP4 20064
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20064
INDIRI4
CNSTI4 48
LTI4 $162
ADDRLP4 20064
INDIRI4
CNSTI4 57
GTI4 $162
line 155
;155:			text_p = prev;  // unget the token
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 156
;156:			break;
ADDRGP4 $110
JUMPV
LABELV $162
line 158
;157:		}
;158:		Com_Printf("unknown token '%s' in %s\n", token, filename);
ADDRGP4 $164
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 159
;159:	}
LABELV $109
line 98
ADDRGP4 $108
JUMPV
LABELV $110
line 162
;160:
;161:	// read information for each frame
;162:	for (i = 0; i < MAX_ANIMATIONS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $165
line 164
;163:
;164:		token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20040
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20040
INDIRP4
ASGNP4
line 165
;165:		if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $169
line 166
;166:			if (i >= TORSO_GETFLAG && i <= TORSO_NEGATIVE) {
ADDRLP4 4
INDIRI4
CNSTI4 25
LTI4 $167
ADDRLP4 4
INDIRI4
CNSTI4 30
GTI4 $167
line 167
;167:				animations[i].firstFrame  = animations[TORSO_GESTURE].firstFrame;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 168
;168:				animations[i].frameLerp   = animations[TORSO_GESTURE].frameLerp;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 169
;169:				animations[i].initialLerp = animations[TORSO_GESTURE].initialLerp;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 170
;170:				animations[i].loopFrames  = animations[TORSO_GESTURE].loopFrames;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 176
ADDP4
INDIRI4
ASGNI4
line 171
;171:				animations[i].numFrames   = animations[TORSO_GESTURE].numFrames;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 172
;172:				animations[i].reversed    = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 173
;173:				animations[i].flipflop    = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 174
;174:				continue;
ADDRGP4 $166
JUMPV
line 176
;175:			}
;176:			break;
LABELV $169
line 178
;177:		}
;178:		animations[i].firstFrame = atoi(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ADDRLP4 20044
INDIRI4
ASGNI4
line 180
;179:		// leg only frames are adjusted to not count the upper body only frames
;180:		if (i == LEGS_WALKCR) {
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $173
line 181
;181:			skip = animations[LEGS_WALKCR].firstFrame - animations[TORSO_GESTURE].firstFrame;
ADDRLP4 24
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
SUBI4
ASGNI4
line 182
;182:		}
LABELV $173
line 183
;183:		if (i >= LEGS_WALKCR && i < TORSO_GETFLAG) {
ADDRLP4 4
INDIRI4
CNSTI4 13
LTI4 $175
ADDRLP4 4
INDIRI4
CNSTI4 25
GEI4 $175
line 184
;184:			animations[i].firstFrame -= skip;
ADDRLP4 20052
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
ASGNP4
ADDRLP4 20052
INDIRP4
ADDRLP4 20052
INDIRP4
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 185
;185:		}
LABELV $175
line 187
;186:
;187:		token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20052
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20052
INDIRP4
ASGNP4
line 188
;188:		if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $177
line 189
;189:			break;
ADDRGP4 $167
JUMPV
LABELV $177
line 191
;190:		}
;191:		animations[i].numFrames = atoi(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20056
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20056
INDIRI4
ASGNI4
line 193
;192:
;193:		animations[i].reversed = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 194
;194:		animations[i].flipflop = qfalse;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 24
ADDP4
CNSTI4 0
ASGNI4
line 196
;195:		// if numFrames is negative the animation is reversed
;196:		if (animations[i].numFrames < 0) {
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $179
line 197
;197:			animations[i].numFrames = -animations[i].numFrames;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 4
ADDP4
INDIRI4
NEGI4
ASGNI4
line 198
;198:			animations[i].reversed  = qtrue;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
CNSTI4 1
ASGNI4
line 199
;199:		}
LABELV $179
line 201
;200:
;201:		token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20060
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20060
INDIRP4
ASGNP4
line 202
;202:		if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $181
line 203
;203:			break;
ADDRGP4 $167
JUMPV
LABELV $181
line 205
;204:		}
;205:		animations[i].loopFrames = atoi(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20064
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 20064
INDIRI4
ASGNI4
line 207
;206:
;207:		token = COM_Parse(&text_p);
ADDRLP4 12
ARGP4
ADDRLP4 20068
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20068
INDIRP4
ASGNP4
line 208
;208:		if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $183
line 209
;209:			break;
ADDRGP4 $167
JUMPV
LABELV $183
line 211
;210:		}
;211:		fps = atof(token);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 20072
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 20072
INDIRF4
ASGNF4
line 212
;212:		if (fps == 0) {
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $185
line 213
;213:			fps = 1;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 214
;214:		}
LABELV $185
line 215
;215:		animations[i].frameLerp   = 1000 / fps;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 12
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 216
;216:		animations[i].initialLerp = 1000 / fps;
ADDRLP4 4
INDIRI4
CNSTI4 28
MULI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI4 16
ADDP4
CNSTF4 1148846080
ADDRLP4 16
INDIRF4
DIVF4
CVFI4 4
ASGNI4
line 217
;217:	}
LABELV $166
line 162
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 31
LTI4 $165
LABELV $167
line 219
;218:
;219:	if (i != MAX_ANIMATIONS) {
ADDRLP4 4
INDIRI4
CNSTI4 31
EQI4 $187
line 220
;220:		CG_Printf("Error parsing animation file: %s\n", filename);
ADDRGP4 $189
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 221
;221:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $100
JUMPV
LABELV $187
line 225
;222:	}
;223:
;224:	// crouch backward animation
;225:	memcpy(&animations[LEGS_BACKCR], &animations[LEGS_WALKCR], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 896
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 364
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 226
;226:	animations[LEGS_BACKCR].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 916
ADDP4
CNSTI4 1
ASGNI4
line 228
;227:	// walk backward animation
;228:	memcpy(&animations[LEGS_BACKWALK], &animations[LEGS_WALK], sizeof(animation_t));
ADDRLP4 8
INDIRP4
CNSTI4 924
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 392
ADDP4
ARGP4
CNSTI4 28
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 229
;229:	animations[LEGS_BACKWALK].reversed = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 944
ADDP4
CNSTI4 1
ASGNI4
line 231
;230:	// flag moving fast
;231:	animations[FLAG_RUN].firstFrame  = 0;
ADDRLP4 8
INDIRP4
CNSTI4 952
ADDP4
CNSTI4 0
ASGNI4
line 232
;232:	animations[FLAG_RUN].numFrames   = 16;
ADDRLP4 8
INDIRP4
CNSTI4 956
ADDP4
CNSTI4 16
ASGNI4
line 233
;233:	animations[FLAG_RUN].loopFrames  = 16;
ADDRLP4 8
INDIRP4
CNSTI4 960
ADDP4
CNSTI4 16
ASGNI4
line 234
;234:	animations[FLAG_RUN].frameLerp   = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 964
ADDP4
CNSTI4 66
ASGNI4
line 235
;235:	animations[FLAG_RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 968
ADDP4
CNSTI4 66
ASGNI4
line 236
;236:	animations[FLAG_RUN].reversed    = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 972
ADDP4
CNSTI4 0
ASGNI4
line 238
;237:	// flag not moving or moving slowly
;238:	animations[FLAG_STAND].firstFrame  = 16;
ADDRLP4 8
INDIRP4
CNSTI4 980
ADDP4
CNSTI4 16
ASGNI4
line 239
;239:	animations[FLAG_STAND].numFrames   = 5;
ADDRLP4 8
INDIRP4
CNSTI4 984
ADDP4
CNSTI4 5
ASGNI4
line 240
;240:	animations[FLAG_STAND].loopFrames  = 0;
ADDRLP4 8
INDIRP4
CNSTI4 988
ADDP4
CNSTI4 0
ASGNI4
line 241
;241:	animations[FLAG_STAND].frameLerp   = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 992
ADDP4
CNSTI4 50
ASGNI4
line 242
;242:	animations[FLAG_STAND].initialLerp = 1000 / 20;
ADDRLP4 8
INDIRP4
CNSTI4 996
ADDP4
CNSTI4 50
ASGNI4
line 243
;243:	animations[FLAG_STAND].reversed    = qfalse;
ADDRLP4 8
INDIRP4
CNSTI4 1000
ADDP4
CNSTI4 0
ASGNI4
line 245
;244:	// flag speeding up
;245:	animations[FLAG_STAND2RUN].firstFrame  = 16;
ADDRLP4 8
INDIRP4
CNSTI4 1008
ADDP4
CNSTI4 16
ASGNI4
line 246
;246:	animations[FLAG_STAND2RUN].numFrames   = 5;
ADDRLP4 8
INDIRP4
CNSTI4 1012
ADDP4
CNSTI4 5
ASGNI4
line 247
;247:	animations[FLAG_STAND2RUN].loopFrames  = 1;
ADDRLP4 8
INDIRP4
CNSTI4 1016
ADDP4
CNSTI4 1
ASGNI4
line 248
;248:	animations[FLAG_STAND2RUN].frameLerp   = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1020
ADDP4
CNSTI4 66
ASGNI4
line 249
;249:	animations[FLAG_STAND2RUN].initialLerp = 1000 / 15;
ADDRLP4 8
INDIRP4
CNSTI4 1024
ADDP4
CNSTI4 66
ASGNI4
line 250
;250:	animations[FLAG_STAND2RUN].reversed    = qtrue;
ADDRLP4 8
INDIRP4
CNSTI4 1028
ADDP4
CNSTI4 1
ASGNI4
line 260
;251:	//
;252:	// new anims changes
;253:	//
;254:	//	animations[TORSO_GETFLAG].flipflop = qtrue;
;255:	//	animations[TORSO_GUARDBASE].flipflop = qtrue;
;256:	//	animations[TORSO_PATROL].flipflop = qtrue;
;257:	//	animations[TORSO_AFFIRMATIVE].flipflop = qtrue;
;258:	//	animations[TORSO_NEGATIVE].flipflop = qtrue;
;259:	//
;260:	return qtrue;
CNSTI4 1
RETI4
LABELV $100
endproc CG_ParseAnimationFile 20076 12
proc CG_FileExists 12 12
line 268
;261:}
;262:
;263:/*
;264:==========================
;265:CG_FileExists
;266:==========================
;267:*/
;268:static qboolean CG_FileExists(const char* filename) {
line 272
;269:	int          len;
;270:	fileHandle_t f;
;271:
;272:	len = trap_FS_FOpenFile(filename, &f, FS_READ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 274
;273:
;274:	if (f != FS_INVALID_HANDLE) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $191
line 275
;275:		trap_FS_FCloseFile(f);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 276
;276:	}
LABELV $191
line 278
;277:
;278:	if (len > 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $193
line 279
;279:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $190
JUMPV
LABELV $193
line 282
;280:	}
;281:
;282:	return qfalse;
CNSTI4 0
RETI4
LABELV $190
endproc CG_FileExists 12 12
proc CG_FindClientModelFile 36 40
line 291
;283:}
;284:
;285:/*
;286:==========================
;287:CG_FindClientModelFile
;288:==========================
;289:*/
;290:static qboolean CG_FindClientModelFile(
;291:	char* filename, int length, clientInfo_t* ci, const char* teamName, const char* modelName, const char* skinName, const char* base, const char* ext) {
line 295
;292:	char *team, *charactersFolder;
;293:	int   i;
;294:
;295:	if (cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $196
line 296
;296:		switch (ci->team) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $202
ADDRGP4 $199
JUMPV
LABELV $202
line 297
;297:		case TEAM_BLUE: {
line 298
;298:			team = "blue";
ADDRLP4 8
ADDRGP4 $203
ASGNP4
line 299
;299:			break;
ADDRGP4 $197
JUMPV
LABELV $199
line 301
;300:		}
;301:		default: {
line 302
;302:			team = "red";
ADDRLP4 8
ADDRGP4 $204
ASGNP4
line 303
;303:			break;
line 306
;304:		}
;305:		}
;306:	} else {
ADDRGP4 $197
JUMPV
LABELV $196
line 307
;307:		team = "default";
ADDRLP4 8
ADDRGP4 $120
ASGNP4
line 308
;308:	}
LABELV $197
line 311
;309:
;310:	// colored skins
;311:	if (ci->coloredSkin && !Q_stricmp(ci->skinName, PM_SKIN)) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $205
ADDRLP4 12
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRGP4 $207
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $205
line 312
;312:		team = PM_SKIN;
ADDRLP4 8
ADDRGP4 $207
ASGNP4
line 313
;313:	}
LABELV $205
line 315
;314:
;315:	charactersFolder = "";
ADDRLP4 4
ADDRGP4 $208
ASGNP4
ADDRGP4 $210
JUMPV
LABELV $209
line 316
;316:	while (1) {
line 317
;317:		for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $212
line 318
;318:			if (i == 0 && teamName && *teamName) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $216
ADDRLP4 20
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $216
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $216
line 320
;319:				//								"models/players/characters/james/stroggs/lower_lily_red.skin"
;320:				Com_sprintf(filename, length, "models/players/%s%s/%s%s_%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, team, ext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $218
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 321
;321:			} else {
ADDRGP4 $217
JUMPV
LABELV $216
line 323
;322:				//								"models/players/characters/james/lower_lily_red.skin"
;323:				Com_sprintf(filename, length, "models/players/%s%s/%s_%s_%s.%s", charactersFolder, modelName, base, skinName, team, ext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $219
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 324
;324:			}
LABELV $217
line 325
;325:			if (CG_FileExists(filename)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $220
line 326
;326:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $195
JUMPV
LABELV $220
line 328
;327:			}
;328:			if (cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $222
line 329
;329:				if (i == 0 && teamName && *teamName) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $225
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $225
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $225
line 331
;330:					//								"models/players/characters/james/stroggs/lower_red.skin"
;331:					Com_sprintf(filename, length, "models/players/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, team, ext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $227
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 332
;332:				} else {
ADDRGP4 $223
JUMPV
LABELV $225
line 334
;333:					//								"models/players/characters/james/lower_red.skin"
;334:					Com_sprintf(filename, length, "models/players/%s%s/%s_%s.%s", charactersFolder, modelName, base, team, ext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 335
;335:				}
line 336
;336:			} else {
ADDRGP4 $223
JUMPV
LABELV $222
line 337
;337:				if (i == 0 && teamName && *teamName) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $229
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $229
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $229
line 339
;338:					//								"models/players/characters/james/stroggs/lower_lily.skin"
;339:					Com_sprintf(filename, length, "models/players/%s%s/%s%s_%s.%s", charactersFolder, modelName, teamName, base, skinName, ext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $227
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 340
;340:				} else {
ADDRGP4 $230
JUMPV
LABELV $229
line 342
;341:					//								"models/players/characters/james/lower_lily.skin"
;342:					Com_sprintf(filename, length, "models/players/%s%s/%s_%s.%s", charactersFolder, modelName, base, skinName, ext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 343
;343:				}
LABELV $230
line 344
;344:			}
LABELV $223
line 345
;345:			if (CG_FileExists(filename)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $231
line 346
;346:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $195
JUMPV
LABELV $231
line 348
;347:			}
;348:			if (!teamName || !*teamName) {
ADDRLP4 32
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $235
ADDRLP4 32
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $233
LABELV $235
line 349
;349:				break;
ADDRGP4 $214
JUMPV
LABELV $233
line 351
;350:			}
;351:		}
LABELV $213
line 317
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $212
LABELV $214
line 353
;352:		// if tried the heads folder first
;353:		if (charactersFolder[0]) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $236
line 354
;354:			break;
ADDRGP4 $211
JUMPV
LABELV $236
line 356
;355:		}
;356:		charactersFolder = "characters/";
ADDRLP4 4
ADDRGP4 $238
ASGNP4
line 357
;357:	}
LABELV $210
line 316
ADDRGP4 $209
JUMPV
LABELV $211
line 359
;358:
;359:	return qfalse;
CNSTI4 0
RETI4
LABELV $195
endproc CG_FindClientModelFile 36 40
proc CG_FindClientHeadFile 36 40
line 369
;360:}
;361:
;362:/*
;363:==========================
;364:CG_FindClientHeadFile
;365:==========================
;366:*/
;367:static qboolean CG_FindClientHeadFile(
;368:	char* filename, int length, clientInfo_t* ci, const char* teamName, const char* headModelName, const char* headSkinName, const char* base,
;369:	const char* ext) {
line 373
;370:	char *team, *headsFolder;
;371:	int   i;
;372:
;373:	if (cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $240
line 374
;374:		switch (ci->team) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $246
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $247
ADDRGP4 $243
JUMPV
LABELV $246
line 375
;375:		case TEAM_RED: {
line 376
;376:			team = "red";
ADDRLP4 8
ADDRGP4 $204
ASGNP4
line 377
;377:			break;
ADDRGP4 $241
JUMPV
LABELV $247
line 379
;378:		}
;379:		case TEAM_BLUE: {
line 380
;380:			team = "blue";
ADDRLP4 8
ADDRGP4 $203
ASGNP4
line 381
;381:			break;
ADDRGP4 $241
JUMPV
LABELV $243
line 383
;382:		}
;383:		default: {
line 384
;384:			team = "default";
ADDRLP4 8
ADDRGP4 $120
ASGNP4
line 385
;385:			break;
line 388
;386:		}
;387:		}
;388:	} else {
ADDRGP4 $241
JUMPV
LABELV $240
line 389
;389:		team = "default";
ADDRLP4 8
ADDRGP4 $120
ASGNP4
line 390
;390:	}
LABELV $241
line 393
;391:
;392:	// colored skins
;393:	if (ci->coloredSkin && !Q_stricmp(ci->headSkinName, PM_SKIN)) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $248
ADDRLP4 12
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRGP4 $207
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $248
line 394
;394:		team = PM_SKIN;
ADDRLP4 8
ADDRGP4 $207
ASGNP4
line 395
;395:	}
LABELV $248
line 397
;396:
;397:	if (headModelName[0] == '*') {
ADDRFP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $250
line 398
;398:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $252
ASGNP4
line 399
;399:		headModelName++;
ADDRFP4 16
ADDRFP4 16
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 400
;400:	} else {
ADDRGP4 $254
JUMPV
LABELV $250
line 401
;401:		headsFolder = "";
ADDRLP4 4
ADDRGP4 $208
ASGNP4
line 402
;402:	}
ADDRGP4 $254
JUMPV
LABELV $253
line 403
;403:	while (1) {
line 404
;404:		for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $256
line 405
;405:			if (i == 0 && teamName && *teamName) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $260
ADDRLP4 20
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $260
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $260
line 406
;406:				Com_sprintf(filename, length, "models/players/%s%s/%s/%s%s_%s.%s", headsFolder, headModelName, headSkinName, teamName, base, team, ext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $262
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 407
;407:			} else {
ADDRGP4 $261
JUMPV
LABELV $260
line 408
;408:				Com_sprintf(filename, length, "models/players/%s%s/%s/%s_%s.%s", headsFolder, headModelName, headSkinName, base, team, ext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $263
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 409
;409:			}
LABELV $261
line 410
;410:			if (CG_FileExists(filename)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $264
line 411
;411:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $239
JUMPV
LABELV $264
line 413
;412:			}
;413:			if (cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $266
line 414
;414:				if (i == 0 && teamName && *teamName) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $269
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $269
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $269
line 415
;415:					Com_sprintf(filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, team, ext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $227
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 416
;416:				} else {
ADDRGP4 $267
JUMPV
LABELV $269
line 417
;417:					Com_sprintf(filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, team, ext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 418
;418:				}
line 419
;419:			} else {
ADDRGP4 $267
JUMPV
LABELV $266
line 420
;420:				if (i == 0 && teamName && *teamName) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $271
ADDRLP4 28
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $271
ADDRLP4 28
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $271
line 421
;421:					Com_sprintf(filename, length, "models/players/%s%s/%s%s_%s.%s", headsFolder, headModelName, teamName, base, headSkinName, ext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $227
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 422
;422:				} else {
ADDRGP4 $272
JUMPV
LABELV $271
line 423
;423:					Com_sprintf(filename, length, "models/players/%s%s/%s_%s.%s", headsFolder, headModelName, base, headSkinName, ext);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 24
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 28
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 424
;424:				}
LABELV $272
line 425
;425:			}
LABELV $267
line 426
;426:			if (CG_FileExists(filename)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_FileExists
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $273
line 427
;427:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $239
JUMPV
LABELV $273
line 429
;428:			}
;429:			if (!teamName || !*teamName) {
ADDRLP4 32
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $277
ADDRLP4 32
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $275
LABELV $277
line 430
;430:				break;
ADDRGP4 $258
JUMPV
LABELV $275
line 432
;431:			}
;432:		}
LABELV $257
line 404
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $256
LABELV $258
line 434
;433:		// if tried the heads folder first
;434:		if (headsFolder[0]) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $278
line 435
;435:			break;
ADDRGP4 $255
JUMPV
LABELV $278
line 437
;436:		}
;437:		headsFolder = "heads/";
ADDRLP4 4
ADDRGP4 $252
ASGNP4
line 438
;438:	}
LABELV $254
line 403
ADDRGP4 $253
JUMPV
LABELV $255
line 440
;439:
;440:	return qfalse;
CNSTI4 0
RETI4
LABELV $239
endproc CG_FindClientHeadFile 36 40
proc CG_RegisterClientSkin 80 32
line 449
;441:}
;442:
;443:/*
;444:==========================
;445:CG_RegisterClientSkin
;446:==========================
;447:*/
;448:static qboolean CG_RegisterClientSkin(
;449:	clientInfo_t* ci, const char* teamName, const char* modelName, const char* skinName, const char* headModelName, const char* headSkinName) {
line 474
;450:	char filename[MAX_QPATH];
;451:
;452:	/*
;453:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/%slower_%s.skin", modelName, teamName, skinName );
;454:	ci->legsSkin = trap_R_RegisterSkin( filename );
;455:	if (!ci->legsSkin) {
;456:	    Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%slower_%s.skin", modelName, teamName, skinName );
;457:	    ci->legsSkin = trap_R_RegisterSkin( filename );
;458:	    if (!ci->legsSkin) {
;459:	        Com_Printf( "Leg skin load failure: %s\n", filename );
;460:	    }
;461:	}
;462:
;463:
;464:	Com_sprintf( filename, sizeof( filename ), "models/players/%s/%supper_%s.skin", modelName, teamName, skinName );
;465:	ci->torsoSkin = trap_R_RegisterSkin( filename );
;466:	if (!ci->torsoSkin) {
;467:	    Com_sprintf( filename, sizeof( filename ), "models/players/characters/%s/%supper_%s.skin", modelName, teamName, skinName );
;468:	    ci->torsoSkin = trap_R_RegisterSkin( filename );
;469:	    if (!ci->torsoSkin) {
;470:	        Com_Printf( "Torso skin load failure: %s\n", filename );
;471:	    }
;472:	}
;473:	*/
;474:	if (CG_FindClientModelFile(filename, sizeof(filename), ci, teamName, modelName, skinName, "lower", "skin")) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
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
INDIRP4
ARGP4
ADDRGP4 $283
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 64
ADDRGP4 CG_FindClientModelFile
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $281
line 475
;475:		ci->legsSkin = trap_R_RegisterSkin(filename);
ADDRLP4 0
ARGP4
ADDRLP4 68
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDRLP4 68
INDIRI4
ASGNI4
line 476
;476:	}
LABELV $281
line 477
;477:	if (!ci->legsSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
NEI4 $285
line 478
;478:		Com_Printf("Leg skin load failure: %s\n", filename);
ADDRGP4 $287
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 479
;479:	}
LABELV $285
line 481
;480:
;481:	if (CG_FindClientModelFile(filename, sizeof(filename), ci, teamName, modelName, skinName, "upper", "skin")) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
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
INDIRP4
ARGP4
ADDRGP4 $290
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 68
ADDRGP4 CG_FindClientModelFile
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $288
line 482
;482:		ci->torsoSkin = trap_R_RegisterSkin(filename);
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 483
;483:	}
LABELV $288
line 484
;484:	if (!ci->torsoSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 0
NEI4 $291
line 485
;485:		Com_Printf("Torso skin load failure: %s\n", filename);
ADDRGP4 $293
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 486
;486:	}
LABELV $291
line 488
;487:
;488:	if (CG_FindClientHeadFile(filename, sizeof(filename), ci, teamName, headModelName, headSkinName, "head", "skin")) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 $296
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 72
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $294
line 489
;489:		ci->headSkin = trap_R_RegisterSkin(filename);
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
ADDRLP4 76
INDIRI4
ASGNI4
line 490
;490:	}
LABELV $294
line 491
;491:	if (!ci->headSkin) {
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
NEI4 $297
line 492
;492:		Com_Printf("Head skin load failure: %s\n", filename);
ADDRGP4 $299
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 493
;493:	}
LABELV $297
line 496
;494:
;495:	// if any skins failed to load
;496:	if (!ci->legsSkin || !ci->torsoSkin || !ci->headSkin) {
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 0
EQI4 $303
ADDRLP4 76
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 0
EQI4 $303
ADDRLP4 76
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
NEI4 $300
LABELV $303
line 497
;497:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $280
JUMPV
LABELV $300
line 499
;498:	}
;499:	return qtrue;
CNSTI4 1
RETI4
LABELV $280
endproc CG_RegisterClientSkin 80 32
proc CG_RegisterClientModelname 164 32
line 508
;500:}
;501:
;502:/*
;503:==========================
;504:CG_RegisterClientModelname
;505:==========================
;506:*/
;507:static qboolean CG_RegisterClientModelname(
;508:	clientInfo_t* ci, const char* modelName, const char* skinName, const char* headModelName, const char* headSkinName, const char* teamName) {
line 513
;509:	char        filename[MAX_QPATH];
;510:	const char* headName;
;511:	char        newTeamName[MAX_QPATH];
;512:
;513:	if (headModelName[0] == '\0') {
ADDRFP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $305
line 514
;514:		headName = modelName;
ADDRLP4 64
ADDRFP4 4
INDIRP4
ASGNP4
line 515
;515:	} else {
ADDRGP4 $306
JUMPV
LABELV $305
line 516
;516:		headName = headModelName;
ADDRLP4 64
ADDRFP4 12
INDIRP4
ASGNP4
line 517
;517:	}
LABELV $306
line 518
;518:	Com_sprintf(filename, sizeof(filename), "models/players/%s/lower.md3", modelName);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $307
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 519
;519:	ci->legsModel = trap_R_RegisterModel(filename);
ADDRLP4 0
ARGP4
ADDRLP4 132
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
ADDRLP4 132
INDIRI4
ASGNI4
line 520
;520:	if (!ci->legsModel) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 0
NEI4 $308
line 521
;521:		Com_sprintf(filename, sizeof(filename), "models/players/characters/%s/lower.md3", modelName);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $310
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 522
;522:		ci->legsModel = trap_R_RegisterModel(filename);
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
ADDRLP4 136
INDIRI4
ASGNI4
line 523
;523:		if (!ci->legsModel) {
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
CNSTI4 0
NEI4 $311
line 524
;524:			Com_Printf("Failed to load model file %s\n", filename);
ADDRGP4 $313
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 525
;525:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
LABELV $311
line 527
;526:		}
;527:	}
LABELV $308
line 529
;528:
;529:	Com_sprintf(filename, sizeof(filename), "models/players/%s/upper.md3", modelName);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $314
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 530
;530:	ci->torsoModel = trap_R_RegisterModel(filename);
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRLP4 136
INDIRI4
ASGNI4
line 531
;531:	if (!ci->torsoModel) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $315
line 532
;532:		Com_sprintf(filename, sizeof(filename), "models/players/characters/%s/upper.md3", modelName);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $317
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 533
;533:		ci->torsoModel = trap_R_RegisterModel(filename);
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 534
;534:		if (!ci->torsoModel) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
NEI4 $318
line 535
;535:			Com_Printf("Failed to load model file %s\n", filename);
ADDRGP4 $313
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 536
;536:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
LABELV $318
line 538
;537:		}
;538:	}
LABELV $315
line 540
;539:
;540:	if (headName[0] == '*') {
ADDRLP4 64
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $320
line 541
;541:		Com_sprintf(filename, sizeof(filename), "models/players/heads/%s/%s.md3", &headModelName[1], &headModelName[1]);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $322
ARGP4
ADDRLP4 140
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 542
;542:	} else {
ADDRGP4 $321
JUMPV
LABELV $320
line 543
;543:		Com_sprintf(filename, sizeof(filename), "models/players/%s/head.md3", headName);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $323
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 544
;544:	}
LABELV $321
line 545
;545:	ci->headModel = trap_R_RegisterModel(filename);
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 547
;546:	// if the head model could not be found and we didn't load from the heads folder try to load from there
;547:	if (!ci->headModel && headName[0] != '*') {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
NEI4 $324
ADDRLP4 64
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
EQI4 $324
line 548
;548:		Com_sprintf(filename, sizeof(filename), "models/players/heads/%s/%s.md3", headModelName, headModelName);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $322
ARGP4
ADDRLP4 144
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 549
;549:		ci->headModel = trap_R_RegisterModel(filename);
ADDRLP4 0
ARGP4
ADDRLP4 148
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 550
;550:	}
LABELV $324
line 551
;551:	if (!ci->headModel) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
CNSTI4 0
NEI4 $326
line 552
;552:		Com_Printf("Failed to load model file %s\n", filename);
ADDRGP4 $313
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 553
;553:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
LABELV $326
line 557
;554:	}
;555:
;556:	// if any skins failed to load, return failure
;557:	if (!CG_RegisterClientSkin(ci, teamName, modelName, skinName, headName, headSkinName)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 CG_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $328
line 558
;558:		if (teamName && *teamName) {
ADDRLP4 148
ADDRFP4 20
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $330
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $330
line 559
;559:			Com_Printf("Failed to load skin file: %s : %s : %s, %s : %s\n", teamName, modelName, skinName, headName, headSkinName);
ADDRGP4 $332
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 560
;560:			if (ci->team == TEAM_BLUE) {
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $333
line 561
;561:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_BLUETEAM_NAME);
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $335
ARGP4
ADDRGP4 $336
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 562
;562:			} else {
ADDRGP4 $334
JUMPV
LABELV $333
line 563
;563:				Com_sprintf(newTeamName, sizeof(newTeamName), "%s/", DEFAULT_REDTEAM_NAME);
ADDRLP4 68
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $335
ARGP4
ADDRGP4 $337
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 564
;564:			}
LABELV $334
line 565
;565:			if (!CG_RegisterClientSkin(ci, newTeamName, modelName, skinName, headName, headSkinName)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 CG_RegisterClientSkin
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $331
line 566
;566:				Com_Printf("Failed to load skin file: %s : %s : %s, %s : %s\n", newTeamName, modelName, skinName, headName, headSkinName);
ADDRGP4 $332
ARGP4
ADDRLP4 68
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 567
;567:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
line 569
;568:			}
;569:		} else {
LABELV $330
line 570
;570:			Com_Printf("Failed to load skin file: %s : %s, %s : %s\n", modelName, skinName, headName, headSkinName);
ADDRGP4 $340
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 571
;571:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
LABELV $331
line 573
;572:		}
;573:	}
LABELV $328
line 576
;574:
;575:	// load the animations
;576:	Com_sprintf(filename, sizeof(filename), "models/players/%s/animation.cfg", modelName);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $341
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 577
;577:	if (!CG_ParseAnimationFile(filename, ci)) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 148
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $342
line 578
;578:		Com_sprintf(filename, sizeof(filename), "models/players/characters/%s/animation.cfg", modelName);
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $344
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 579
;579:		if (!CG_ParseAnimationFile(filename, ci)) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 152
ADDRGP4 CG_ParseAnimationFile
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $345
line 580
;580:			Com_Printf("Failed to load animation file %s\n", filename);
ADDRGP4 $347
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 581
;581:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
LABELV $345
line 583
;582:		}
;583:	}
LABELV $342
line 585
;584:
;585:	if (CG_FindClientHeadFile(filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "skin")) {
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 $350
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 152
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $348
line 586
;586:		ci->modelIcon = trap_R_RegisterShaderNoMip(filename);
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 587
;587:	} else if (CG_FindClientHeadFile(filename, sizeof(filename), ci, teamName, headName, headSkinName, "icon", "tga")) {
ADDRGP4 $349
JUMPV
LABELV $348
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 $350
ARGP4
ADDRGP4 $353
ARGP4
ADDRLP4 156
ADDRGP4 CG_FindClientHeadFile
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
EQI4 $351
line 588
;588:		ci->modelIcon = trap_R_RegisterShaderNoMip(filename);
ADDRLP4 0
ARGP4
ADDRLP4 160
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRLP4 160
INDIRI4
ASGNI4
line 589
;589:	}
LABELV $351
LABELV $349
line 591
;590:
;591:	if (!ci->modelIcon) {
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
CNSTI4 0
NEI4 $354
line 592
;592:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $304
JUMPV
LABELV $354
line 595
;593:	}
;594:
;595:	return qtrue;
CNSTI4 1
RETI4
LABELV $304
endproc CG_RegisterClientModelname 164 32
proc CG_IsKnownModel 92 8
line 599
;596:}
;597:
;598:/* advance this function on any new pm skin added */
;599:static qboolean CG_IsKnownModel(const char* modelName) {
line 601
;600:
;601:	if (Q_stricmp(modelName, "anarki") && Q_stricmp(modelName, "biker") && Q_stricmp(modelName, "bitterman") && Q_stricmp(modelName, "bones") &&
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $359
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $360
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $361
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $362
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $363
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $364
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $365
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $366
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $367
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $368
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $369
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $370
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $371
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $372
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $373
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $374
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $377
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $378
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $379
ARGP4
ADDRLP4 80
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $380
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $357
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $381
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $357
line 607
;602:	    Q_stricmp(modelName, "crash") && Q_stricmp(modelName, "doom") && Q_stricmp(modelName, "grunt") && Q_stricmp(modelName, "hunter") &&
;603:	    Q_stricmp(modelName, "keel") && Q_stricmp(modelName, "klesk") && Q_stricmp(modelName, "lucy") && Q_stricmp(modelName, "major") &&
;604:	    Q_stricmp(modelName, "mynx") && Q_stricmp(modelName, "orbb") && Q_stricmp(modelName, "ranger") && Q_stricmp(modelName, "razor") &&
;605:	    Q_stricmp(modelName, "sarge") && Q_stricmp(modelName, "slash") && Q_stricmp(modelName, "sorlag") && Q_stricmp(modelName, "tankjr") &&
;606:	    Q_stricmp(modelName, "uriel") && Q_stricmp(modelName, "visor") && Q_stricmp(modelName, "xaero"))
;607:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $356
JUMPV
LABELV $357
line 609
;608:	else
;609:		return qtrue;
CNSTI4 1
RETI4
LABELV $356
endproc CG_IsKnownModel 92 8
proc CG_ColorFromChar 8 0
ADDRFP4 0
ADDRFP4 0
INDIRI4
CVII1 4
ASGNI1
line 617
;610:}
;611:
;612:/*
;613:====================
;614:CG_ColorFromString
;615:====================
;616:*/
;617:static void CG_ColorFromChar(char v, vec3_t color) {
line 620
;618:	int val;
;619:
;620:	val = v - '0';
ADDRLP4 0
ADDRFP4 0
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
line 622
;621:
;622:	if (val < 1 || val > 7) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $385
ADDRLP4 0
INDIRI4
CNSTI4 7
LEI4 $383
LABELV $385
line 623
;623:		VectorSet(color, 1.0f, 1.0f, 1.0f);
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 624
;624:	} else {
ADDRGP4 $384
JUMPV
LABELV $383
line 625
;625:		VectorClear(color);
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 626
;626:		if (val & 1) {
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $386
line 627
;627:			color[0] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTF4 1065353216
ASGNF4
line 628
;628:		}
LABELV $386
line 629
;629:		if (val & 2) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $388
line 630
;630:			color[1] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 631
;631:		}
LABELV $388
line 632
;632:		if (val & 4) {
ADDRLP4 0
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $390
line 633
;633:			color[2] = 1.0f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 634
;634:		}
LABELV $390
line 635
;635:	}
LABELV $384
line 636
;636:}
LABELV $382
endproc CG_ColorFromChar 8 0
proc CG_SetColorInfo 0 8
line 638
;637:
;638:static void CG_SetColorInfo(const char* color, clientInfo_t* info) {
line 639
;639:	VectorSet(info->headColor, 1.0f, 1.0f, 1.0f);
ADDRFP4 4
INDIRP4
CNSTI4 1616
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1620
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1624
ADDP4
CNSTF4 1065353216
ASGNF4
line 640
;640:	VectorSet(info->bodyColor, 1.0f, 1.0f, 1.0f);
ADDRFP4 4
INDIRP4
CNSTI4 1628
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1632
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1636
ADDP4
CNSTF4 1065353216
ASGNF4
line 641
;641:	VectorSet(info->legsColor, 1.0f, 1.0f, 1.0f);
ADDRFP4 4
INDIRP4
CNSTI4 1640
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1644
ADDP4
CNSTF4 1065353216
ASGNF4
ADDRFP4 4
INDIRP4
CNSTI4 1648
ADDP4
CNSTF4 1065353216
ASGNF4
line 643
;642:
;643:	if (!color[0])
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $393
line 644
;644:		return;
ADDRGP4 $392
JUMPV
LABELV $393
line 645
;645:	CG_ColorFromChar(color[0], info->headColor);
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 1616
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 647
;646:
;647:	if (!color[1])
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $395
line 648
;648:		return;
ADDRGP4 $392
JUMPV
LABELV $395
line 649
;649:	CG_ColorFromChar(color[1], info->bodyColor);
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 1628
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 651
;650:
;651:	if (!color[2])
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $397
line 652
;652:		return;
ADDRGP4 $392
JUMPV
LABELV $397
line 653
;653:	CG_ColorFromChar(color[2], info->legsColor);
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 1640
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 656
;654:
;655:	// override color1/color2 if specified
;656:	if (!color[3])
ADDRFP4 0
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $399
line 657
;657:		return;
ADDRGP4 $392
JUMPV
LABELV $399
line 658
;658:	CG_ColorFromChar(color[3], info->color1);
ADDRFP4 0
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 660
;659:
;660:	if (!color[4])
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $401
line 661
;661:		return;
ADDRGP4 $392
JUMPV
LABELV $401
line 662
;662:	CG_ColorFromChar(color[4], info->color2);
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 56
ADDP4
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 663
;663:}
LABELV $392
endproc CG_SetColorInfo 0 8
bss
align 1
LABELV $404
skip 6
code
proc CG_GetTeamColors 8 12
line 665
;664:
;665:static const char* CG_GetTeamColors(const char* color, team_t team) {
line 668
;666:	static char str[6];
;667:
;668:	Q_strncpyz(str, color, sizeof(str));
ADDRGP4 $404
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 670
;669:
;670:	switch (team) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $410
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $408
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $409
ADDRGP4 $406
JUMPV
LABELV $408
line 672
;671:	case TEAM_RED:
;672:		replace1('?', '1', str);
CNSTI4 63
ARGI4
CNSTI4 49
ARGI4
ADDRGP4 $404
ARGP4
ADDRGP4 replace1
CALLI4
pop
line 673
;673:		break;
ADDRGP4 $406
JUMPV
LABELV $409
line 675
;674:	case TEAM_BLUE:
;675:		replace1('?', '4', str);
CNSTI4 63
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 $404
ARGP4
ADDRGP4 replace1
CALLI4
pop
line 676
;676:		break;
ADDRGP4 $406
JUMPV
LABELV $410
line 678
;677:	case TEAM_FREE:
;678:		replace1('?', '7', str);
CNSTI4 63
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 $404
ARGP4
ADDRGP4 replace1
CALLI4
pop
line 679
;679:		break;
line 681
;680:	default:
;681:		break;
LABELV $406
line 684
;682:	}
;683:
;684:	return str;
ADDRGP4 $404
RETP4
LABELV $403
endproc CG_GetTeamColors 8 12
proc CG_LoadClientInfo 404 24
line 695
;685:}
;686:
;687:/*
;688:===================
;689:CG_LoadClientInfo
;690:
;691:Load it now, taking the disk hits.
;692:This will usually be deferred to a safe time
;693:===================
;694:*/
;695:static void CG_LoadClientInfo(clientInfo_t* ci) {
line 703
;696:	const char* dir;
;697:	int         i, modelloaded;
;698:	const char* s;
;699:	int         clientNum;
;700:	char        teamname[MAX_QPATH];
;701:	char        vertexlit[MAX_CVAR_VALUE_STRING];
;702:
;703:	teamname[0] = '\0';
ADDRLP4 276
CNSTI1 0
ASGNI1
line 706
;704:
;705:	// disable vertexlight for colored skins
;706:	trap_Cvar_VariableStringBuffer("r_vertexlight", vertexlit, sizeof(vertexlit));
ADDRGP4 $412
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 707
;707:	if (vertexlit[0] && vertexlit[0] != '0') {
ADDRLP4 340
ADDRLP4 16
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 340
INDIRI4
CNSTI4 0
EQI4 $413
ADDRLP4 340
INDIRI4
CNSTI4 48
EQI4 $413
line 708
;708:		trap_Cvar_Set("r_vertexlight", "0");
ADDRGP4 $412
ARGP4
ADDRGP4 $415
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 709
;709:	}
LABELV $413
line 723
;710:
;711:#ifdef MISSIONPACK
;712:	if (cgs.gametype >= GT_TEAM) {
;713:		if (ci->team == TEAM_BLUE) {
;714:			Q_strncpyz(teamname, cg_blueTeamName.string, sizeof(teamname));
;715:		} else {
;716:			Q_strncpyz(teamname, cg_redTeamName.string, sizeof(teamname));
;717:		}
;718:	}
;719:	if (teamname[0]) {
;720:		strcat(teamname, "/");
;721:	}
;722:#endif
;723:	modelloaded = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 724
;724:	if (!CG_RegisterClientModelname(ci, ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname)) {
ADDRLP4 344
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 344
INDIRP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 344
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 348
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 348
INDIRI4
CNSTI4 0
NEI4 $416
line 725
;725:		if (cg_buildScript.integer) {
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $418
line 726
;726:			CG_Error("CG_RegisterClientModelname( %s, %s, %s, %s %s ) failed", ci->modelName, ci->skinName, ci->headModelName, ci->headSkinName, teamname);
ADDRGP4 $421
ARGP4
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 727
;727:		}
LABELV $418
line 730
;728:
;729:		// fall back to default team name
;730:		if (cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $422
line 732
;731:			// keep skin name
;732:			if (ci->team == TEAM_BLUE) {
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $425
line 733
;733:				Q_strncpyz(teamname, DEFAULT_BLUETEAM_NAME, sizeof(teamname));
ADDRLP4 276
ARGP4
ADDRGP4 $336
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 734
;734:			} else {
ADDRGP4 $426
JUMPV
LABELV $425
line 735
;735:				Q_strncpyz(teamname, DEFAULT_REDTEAM_NAME, sizeof(teamname));
ADDRLP4 276
ARGP4
ADDRGP4 $337
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 736
;736:			}
LABELV $426
line 737
;737:			if (!CG_RegisterClientModelname(ci, DEFAULT_MODEL, ci->skinName, DEFAULT_MODEL, ci->skinName, teamname)) {
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
ADDRGP4 $429
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 360
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $423
line 738
;738:				CG_Error("DEFAULT_TEAM_MODEL / skin (%s/%s) failed to register", DEFAULT_MODEL, ci->skinName);
ADDRGP4 $430
ARGP4
ADDRGP4 $429
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 739
;739:			}
line 740
;740:		} else {
ADDRGP4 $423
JUMPV
LABELV $422
line 741
;741:			if (!CG_RegisterClientModelname(ci, DEFAULT_MODEL, "default", DEFAULT_MODEL, "default", teamname)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 352
ADDRGP4 $429
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
ADDRGP4 $120
ASGNP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
INDIRP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 360
ADDRGP4 CG_RegisterClientModelname
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $431
line 742
;742:				CG_Error("DEFAULT_MODEL (%s) failed to register", DEFAULT_MODEL);
ADDRGP4 $433
ARGP4
ADDRGP4 $429
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 743
;743:			}
LABELV $431
line 744
;744:		}
LABELV $423
line 745
;745:		modelloaded = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 746
;746:	}
LABELV $416
line 748
;747:
;748:	ci->newAnims = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 0
ASGNI4
line 749
;749:	if (ci->torsoModel) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
EQI4 $434
line 752
;750:		orientation_t tag;
;751:		// if the torso model has the "tag_flag"
;752:		if (trap_R_LerpTag(&tag, ci->torsoModel, 0, 0, 1, "tag_flag")) {
ADDRLP4 352
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 $438
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_LerpTag
CALLI4
ASGNI4
ADDRLP4 400
INDIRI4
CNSTI4 0
EQI4 $436
line 753
;753:			ci->newAnims = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
CNSTI4 1
ASGNI4
line 754
;754:		}
LABELV $436
line 755
;755:	}
LABELV $434
line 758
;756:
;757:	// sounds
;758:	dir = ci->modelName;
ADDRLP4 272
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ASGNP4
line 760
;759:
;760:	for (i = 0; i < MAX_CUSTOM_SOUNDS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $439
line 761
;761:		s = cg_customSoundNames[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg_customSoundNames
ADDP4
INDIRP4
ASGNP4
line 762
;762:		if (!s) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $443
line 763
;763:			break;
ADDRGP4 $441
JUMPV
LABELV $443
line 765
;764:		}
;765:		ci->sounds[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 767
;766:		// if the model didn't load use the sounds of the default model
;767:		if (modelloaded) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $445
line 768
;768:			ci->sounds[i] = trap_S_RegisterSound(va("sound/player/%s/%s", dir, s + 1), qfalse);
ADDRGP4 $447
ARGP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 769
;769:		}
LABELV $445
line 770
;770:		if (!ci->sounds[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $448
line 771
;771:			ci->sounds[i] = trap_S_RegisterSound(va("sound/player/%s/%s", DEFAULT_MODEL, s + 1), qfalse);
ADDRGP4 $447
ARGP4
ADDRGP4 $429
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 772
;772:		}
LABELV $448
line 773
;773:	}
LABELV $440
line 760
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $439
LABELV $441
line 775
;774:
;775:	ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 779
;776:
;777:	// reset any existing players and bodies, because they might be in bad
;778:	// frames for this new model
;779:	clientNum = ci - cgs.clientinfo;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 cgs+40996
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1652
DIVI4
ASGNI4
line 780
;780:	for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $451
line 781
;781:		if (cg_entities[i].currentState.clientNum == clientNum && cg_entities[i].currentState.eType == ET_PLAYER) {
ADDRLP4 0
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+168
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $455
ADDRLP4 0
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+4
ADDP4
INDIRI4
CNSTI4 1
NEI4 $455
line 782
;782:			CG_ResetPlayerEntity(&cg_entities[i]);
ADDRLP4 0
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 783
;783:		}
LABELV $455
line 784
;784:	}
LABELV $452
line 780
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $451
line 787
;785:
;786:	// restore vertexlight mode
;787:	if (vertexlit[0] && vertexlit[0] != '0') {
ADDRLP4 352
ADDRLP4 16
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 0
EQI4 $459
ADDRLP4 352
INDIRI4
CNSTI4 48
EQI4 $459
line 788
;788:		trap_Cvar_Set("r_vertexlight", vertexlit);
ADDRGP4 $412
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 789
;789:	}
LABELV $459
line 790
;790:}
LABELV $411
endproc CG_LoadClientInfo 404 24
proc CG_CopyClientInfoModel 0 12
line 797
;791:
;792:/*
;793:======================
;794:CG_CopyClientInfoModel
;795:======================
;796:*/
;797:static void CG_CopyClientInfoModel(const clientInfo_t* from, clientInfo_t* to) {
line 798
;798:	VectorCopy(from->headOffset, to->headOffset);
ADDRFP4 4
INDIRP4
CNSTI4 400
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 400
ADDP4
INDIRB
ASGNB 12
line 799
;799:	to->footsteps = from->footsteps;
ADDRFP4 4
INDIRP4
CNSTI4 412
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ASGNI4
line 800
;800:	to->gender    = from->gender;
ADDRFP4 4
INDIRP4
CNSTI4 416
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 802
;801:
;802:	to->legsModel  = from->legsModel;
ADDRFP4 4
INDIRP4
CNSTI4 420
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 803
;803:	to->legsSkin   = from->legsSkin;
ADDRFP4 4
INDIRP4
CNSTI4 424
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 804
;804:	to->torsoModel = from->torsoModel;
ADDRFP4 4
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 805
;805:	to->torsoSkin  = from->torsoSkin;
ADDRFP4 4
INDIRP4
CNSTI4 432
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
ASGNI4
line 806
;806:	to->headModel  = from->headModel;
ADDRFP4 4
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 807
;807:	to->headSkin   = from->headSkin;
ADDRFP4 4
INDIRP4
CNSTI4 440
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 808
;808:	to->modelIcon  = from->modelIcon;
ADDRFP4 4
INDIRP4
CNSTI4 444
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ASGNI4
line 810
;809:
;810:	to->newAnims    = from->newAnims;
ADDRFP4 4
INDIRP4
CNSTI4 388
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
ASGNI4
line 811
;811:	to->coloredSkin = from->coloredSkin;
ADDRFP4 4
INDIRP4
CNSTI4 1612
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
INDIRI4
ASGNI4
line 813
;812:
;813:	memcpy(to->animations, from->animations, sizeof(to->animations));
ADDRFP4 4
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ARGP4
CNSTI4 1036
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 814
;814:	memcpy(to->sounds, from->sounds, sizeof(to->sounds));
ADDRFP4 4
INDIRP4
CNSTI4 1484
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 1484
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 815
;815:}
LABELV $461
endproc CG_CopyClientInfoModel 0 12
proc CG_ScanForExistingClientInfo 24 8
line 822
;816:
;817:/*
;818:======================
;819:CG_ScanForExistingClientInfo
;820:======================
;821:*/
;822:static qboolean CG_ScanForExistingClientInfo(clientInfo_t* ci) {
line 826
;823:	int           i;
;824:	clientInfo_t* match;
;825:
;826:	for (i = 0; i < cgs.maxclients; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $466
JUMPV
LABELV $463
line 827
;827:		match = &cgs.clientinfo[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 828
;828:		if (!match->infoValid) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $469
line 829
;829:			continue;
ADDRGP4 $464
JUMPV
LABELV $469
line 831
;830:		}
;831:		if (match->deferred) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $471
line 832
;832:			continue;
ADDRGP4 $464
JUMPV
LABELV $471
line 834
;833:		}
;834:		if (!Q_stricmp(ci->modelName, match->modelName) && !Q_stricmp(ci->skinName, match->skinName) && !Q_stricmp(ci->headModelName, match->headModelName) &&
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $473
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $473
ADDRFP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $473
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $473
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $476
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $473
LABELV $476
line 838
;835:		    !Q_stricmp(ci->headSkinName, match->headSkinName)
;836:		    //&& !Q_stricmp( ci->blueTeam, match->blueTeam )
;837:		    //&& !Q_stricmp( ci->redTeam, match->redTeam )
;838:		    && (cgs.gametype < GT_TEAM || ci->team == match->team)) {
line 841
;839:			// this clientinfo is identical, so use it's handles
;840:
;841:			ci->deferred = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 843
;842:
;843:			CG_CopyClientInfoModel(match, ci);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 845
;844:
;845:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $462
JUMPV
LABELV $473
line 847
;846:		}
;847:	}
LABELV $464
line 826
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $466
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $463
line 850
;848:
;849:	// nothing matches, so defer the load
;850:	return qfalse;
CNSTI4 0
RETI4
LABELV $462
endproc CG_ScanForExistingClientInfo 24 8
proc CG_SetDeferredClientInfo 20 8
line 861
;851:}
;852:
;853:/*
;854:======================
;855:CG_SetDeferredClientInfo
;856:
;857:We aren't going to load it now, so grab some other
;858:client's info to use until we have some spare time.
;859:======================
;860:*/
;861:static void CG_SetDeferredClientInfo(clientInfo_t* ci) {
line 867
;862:	int           i;
;863:	clientInfo_t* match;
;864:
;865:	// if someone else is already the same models and skins we
;866:	// can just load the client info
;867:	for (i = 0; i < cgs.maxclients; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $481
JUMPV
LABELV $478
line 868
;868:		match = &cgs.clientinfo[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 869
;869:		if (!match->infoValid || match->deferred) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $486
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $484
LABELV $486
line 870
;870:			continue;
ADDRGP4 $479
JUMPV
LABELV $484
line 872
;871:		}
;872:		if (Q_stricmp(ci->skinName, match->skinName) || Q_stricmp(ci->modelName, match->modelName) ||
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $491
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 128
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $491
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $487
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
EQI4 $487
LABELV $491
line 875
;873:		    //			 Q_stricmp( ci->headModelName, match->headModelName ) ||
;874:		    //			 Q_stricmp( ci->headSkinName, match->headSkinName ) ||
;875:		    (cgs.gametype >= GT_TEAM && ci->team != match->team)) {
line 876
;876:			continue;
ADDRGP4 $479
JUMPV
LABELV $487
line 879
;877:		}
;878:		// just load the real info cause it uses the same models and skins
;879:		CG_LoadClientInfo(ci);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 880
;880:		return;
ADDRGP4 $477
JUMPV
LABELV $479
line 867
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $481
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $478
line 884
;881:	}
;882:
;883:	// if we are in teamplay, only grab a model if the skin is correct
;884:	if (cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $492
line 885
;885:		for (i = 0; i < cgs.maxclients; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $498
JUMPV
LABELV $495
line 886
;886:			match = &cgs.clientinfo[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 887
;887:			if (!match->infoValid || match->deferred) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $503
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $501
LABELV $503
line 888
;888:				continue;
ADDRGP4 $496
JUMPV
LABELV $501
line 890
;889:			}
;890:			if (Q_stricmp(ci->skinName, match->skinName) || (cgs.gametype >= GT_TEAM && ci->team != match->team)) {
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $507
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $504
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
EQI4 $504
LABELV $507
line 891
;891:				continue;
ADDRGP4 $496
JUMPV
LABELV $504
line 893
;892:			}
;893:			ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 1
ASGNI4
line 894
;894:			CG_CopyClientInfoModel(match, ci);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 895
;895:			return;
ADDRGP4 $477
JUMPV
LABELV $496
line 885
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $498
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $495
line 901
;896:		}
;897:		// load the full model, because we don't ever want to show
;898:		// an improper team skin.  This will cause a hitch for the first
;899:		// player, when the second enters.  Combat shouldn't be going on
;900:		// yet, so it shouldn't matter
;901:		CG_LoadClientInfo(ci);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 902
;902:		return;
ADDRGP4 $477
JUMPV
LABELV $492
line 906
;903:	}
;904:
;905:	// find the first valid clientinfo and grab its stuff
;906:	for (i = 0; i < cgs.maxclients; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $511
JUMPV
LABELV $508
line 907
;907:		match = &cgs.clientinfo[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 908
;908:		if (!match->infoValid) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $514
line 909
;909:			continue;
ADDRGP4 $509
JUMPV
LABELV $514
line 912
;910:		}
;911:
;912:		ci->deferred = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 1
ASGNI4
line 913
;913:		CG_CopyClientInfoModel(match, ci);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_CopyClientInfoModel
CALLV
pop
line 914
;914:		return;
ADDRGP4 $477
JUMPV
LABELV $509
line 906
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $511
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $508
line 918
;915:	}
;916:
;917:	// we should never get here...
;918:	CG_Printf("CG_SetDeferredClientInfo: no valid clients!\n");
ADDRGP4 $516
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 920
;919:
;920:	CG_LoadClientInfo(ci);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 921
;921:}
LABELV $477
endproc CG_SetDeferredClientInfo 20 8
proc CG_SetSkinAndModel 188 12
line 925
;922:
;923:static void CG_SetSkinAndModel(
;924:	clientInfo_t* newInfo, clientInfo_t* curInfo, const char* infomodel, qboolean allowNativeModel, int clientNum, int myClientNum, team_t myTeam,
;925:	qboolean setColor, char* modelName, int modelNameSize, char* skinName, int skinNameSize) {
line 933
;926:	char        modelStr[MAX_QPATH];
;927:	char        newSkin[MAX_QPATH];
;928:	char *      skin, *slash;
;929:	qboolean    pm_model;
;930:	team_t      team;
;931:	const char* colors;
;932:
;933:	team     = newInfo->team;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
line 934
;934:	pm_model = (Q_stricmp(cg_enemyModel.string, PM_SKIN) == 0) ? qtrue : qfalse;
ADDRGP4 cg_enemyModel+16
ARGP4
ADDRGP4 $207
ARGP4
ADDRLP4 152
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $520
ADDRLP4 148
CNSTI4 1
ASGNI4
ADDRGP4 $521
JUMPV
LABELV $520
ADDRLP4 148
CNSTI4 0
ASGNI4
LABELV $521
ADDRLP4 8
ADDRLP4 148
INDIRI4
ASGNI4
line 936
;935:
;936:	if (cg_forceModel.integer || cg_enemyModel.string[0] || cg_teamModel.string[0]) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
NEI4 $528
ADDRGP4 cg_enemyModel+16
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $528
ADDRGP4 cg_teamModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $522
LABELV $528
line 937
;937:		if (cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $529
line 939
;938:			// enemy model
;939:			if (cg_enemyModel.string[0] && team != myTeam && team != TEAM_SPECTATOR) {
ADDRGP4 cg_enemyModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $532
ADDRLP4 156
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRFP4 24
INDIRI4
EQI4 $532
ADDRLP4 156
INDIRI4
CNSTI4 3
EQI4 $532
line 940
;940:				if (pm_model)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $535
line 941
;941:					Q_strncpyz(modelName, infomodel, modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $536
JUMPV
LABELV $535
line 943
;942:				else
;943:					Q_strncpyz(modelName, cg_enemyModel.string, modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 cg_enemyModel+16
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $536
line 945
;944:
;945:				skin = strchr(modelName, '/');
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 160
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 160
INDIRP4
ASGNP4
line 947
;946:				// force skin
;947:				strcpy(newSkin, PM_SKIN);
ADDRLP4 16
ARGP4
ADDRGP4 $207
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 948
;948:				if (skin)
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $538
line 949
;949:					*skin = '\0';
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
LABELV $538
line 951
;950:
;951:				if (pm_model && !CG_IsKnownModel(modelName)) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $540
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 CG_IsKnownModel
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $540
line 953
;952:					// revert to default model if specified skin is not known
;953:					Q_strncpyz(modelName, "sarge", modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 954
;954:				}
LABELV $540
line 955
;955:				Q_strncpyz(skinName, newSkin, skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 957
;956:
;957:				if (setColor) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $523
line 958
;958:					if (cg_enemyColors.string[0] && myTeam != TEAM_SPECTATOR)  // free-fly?
ADDRGP4 cg_enemyColors+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $544
ADDRFP4 24
INDIRI4
CNSTI4 3
EQI4 $544
line 959
;959:						colors = CG_GetTeamColors(cg_enemyColors.string, newInfo->team);
ADDRGP4 cg_enemyColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 168
INDIRP4
ASGNP4
ADDRGP4 $545
JUMPV
LABELV $544
line 961
;960:					else
;961:						colors = CG_GetTeamColors("???", newInfo->team);
ADDRGP4 $548
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 172
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 172
INDIRP4
ASGNP4
LABELV $545
line 963
;962:
;963:					CG_SetColorInfo(colors, newInfo);
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 964
;964:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 965
;965:				}
line 967
;966:
;967:			} else if (cg_teamModel.string[0] && team == myTeam && team != TEAM_SPECTATOR && clientNum != myClientNum) {
ADDRGP4 $523
JUMPV
LABELV $532
ADDRGP4 cg_teamModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $549
ADDRLP4 160
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 160
INDIRI4
ADDRFP4 24
INDIRI4
NEI4 $549
ADDRLP4 160
INDIRI4
CNSTI4 3
EQI4 $549
ADDRFP4 16
INDIRI4
ADDRFP4 20
INDIRI4
EQI4 $549
line 969
;968:				// teammodel
;969:				pm_model = (Q_stricmp(cg_teamModel.string, PM_SKIN) == 0) ? qtrue : qfalse;
ADDRGP4 cg_teamModel+16
ARGP4
ADDRGP4 $207
ARGP4
ADDRLP4 168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $554
ADDRLP4 164
CNSTI4 1
ASGNI4
ADDRGP4 $555
JUMPV
LABELV $554
ADDRLP4 164
CNSTI4 0
ASGNI4
LABELV $555
ADDRLP4 8
ADDRLP4 164
INDIRI4
ASGNI4
line 971
;970:
;971:				if (pm_model)
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $556
line 972
;972:					Q_strncpyz(modelName, infomodel, modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $557
JUMPV
LABELV $556
line 974
;973:				else
;974:					Q_strncpyz(modelName, cg_teamModel.string, modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 cg_teamModel+16
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $557
line 976
;975:
;976:				skin = strchr(modelName, '/');
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 172
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 172
INDIRP4
ASGNP4
line 978
;977:				// force skin
;978:				strcpy(newSkin, PM_SKIN);
ADDRLP4 16
ARGP4
ADDRGP4 $207
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 979
;979:				if (skin)
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $559
line 980
;980:					*skin = '\0';
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
LABELV $559
line 982
;981:
;982:				if (pm_model && !CG_IsKnownModel(modelName)) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $561
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 CG_IsKnownModel
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 0
NEI4 $561
line 984
;983:					// revert to default model if specified skin is not known
;984:					Q_strncpyz(modelName, "sarge", modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 985
;985:				}
LABELV $561
line 986
;986:				Q_strncpyz(skinName, newSkin, skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 988
;987:
;988:				if (setColor) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $523
line 989
;989:					if (cg_teamColors.string[0] && myTeam != TEAM_SPECTATOR)  // free-fly?
ADDRGP4 cg_teamColors+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $565
ADDRFP4 24
INDIRI4
CNSTI4 3
EQI4 $565
line 990
;990:						colors = CG_GetTeamColors(cg_teamColors.string, newInfo->team);
ADDRGP4 cg_teamColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 180
INDIRP4
ASGNP4
ADDRGP4 $566
JUMPV
LABELV $565
line 992
;991:					else
;992:						colors = CG_GetTeamColors("???", newInfo->team);
ADDRGP4 $548
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 184
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 184
INDIRP4
ASGNP4
LABELV $566
line 994
;993:
;994:					CG_SetColorInfo(colors, newInfo);
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 995
;995:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 996
;996:				}
line 998
;997:
;998:			} else {
ADDRGP4 $523
JUMPV
LABELV $549
line 1000
;999:				// forcemodel etc.
;1000:				if (cg_forceModel.integer) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $569
line 1002
;1001:
;1002:					trap_Cvar_VariableStringBuffer("model", modelStr, sizeof(modelStr));
ADDRGP4 $572
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1003
;1003:					if ((skin = strchr(modelStr, '/')) == NULL) {
ADDRLP4 84
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 164
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 164
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $573
line 1004
;1004:						skin = "default";
ADDRLP4 12
ADDRGP4 $120
ASGNP4
line 1005
;1005:					} else {
ADDRGP4 $574
JUMPV
LABELV $573
line 1006
;1006:						*skin++ = '\0';
ADDRLP4 168
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 168
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 168
INDIRP4
CNSTI1 0
ASGNI1
line 1007
;1007:					}
LABELV $574
line 1009
;1008:
;1009:					Q_strncpyz(skinName, skin, skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1010
;1010:					Q_strncpyz(modelName, modelStr, modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1012
;1011:
;1012:				} else {
ADDRGP4 $523
JUMPV
LABELV $569
line 1013
;1013:					Q_strncpyz(modelName, infomodel, modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1014
;1014:					slash = strchr(modelName, '/');
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 164
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 164
INDIRP4
ASGNP4
line 1015
;1015:					if (!slash) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $575
line 1016
;1016:						Q_strncpyz(skinName, "default", skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1017
;1017:					} else {
ADDRGP4 $523
JUMPV
LABELV $575
line 1018
;1018:						Q_strncpyz(skinName, slash + 1, skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1019
;1019:						*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1020
;1020:					}
line 1021
;1021:				}
line 1022
;1022:			}
line 1023
;1023:		} else {  // not team game
ADDRGP4 $523
JUMPV
LABELV $529
line 1025
;1024:
;1025:			if (pm_model && myClientNum != clientNum && cgs.gametype != GT_SINGLE_PLAYER) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $577
ADDRFP4 20
INDIRI4
ADDRFP4 16
INDIRI4
EQI4 $577
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 2
EQI4 $577
line 1026
;1026:				Q_strncpyz(modelName, infomodel, modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1029
;1027:
;1028:				// strip skin name from model name
;1029:				slash = strchr(modelName, '/');
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1030
;1030:				if (!slash) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $580
line 1031
;1031:					Q_strncpyz(skinName, PM_SKIN, skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $207
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1032
;1032:				} else {
ADDRGP4 $581
JUMPV
LABELV $580
line 1033
;1033:					Q_strncpyz(skinName, PM_SKIN, skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $207
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1034
;1034:					*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1035
;1035:				}
LABELV $581
line 1037
;1036:
;1037:				if (!CG_IsKnownModel(modelName))
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 CG_IsKnownModel
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $582
line 1038
;1038:					Q_strncpyz(modelName, "sarge", modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 $375
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $582
line 1040
;1039:
;1040:				if (setColor) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $523
line 1041
;1041:					colors = CG_GetTeamColors(cg_enemyColors.string, newInfo->team);
ADDRGP4 cg_enemyColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 164
INDIRP4
ASGNP4
line 1042
;1042:					CG_SetColorInfo(colors, newInfo);
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1043
;1043:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1044
;1044:				}
line 1046
;1045:
;1046:			} else if (cg_enemyModel.string[0] && myClientNum != clientNum && !allowNativeModel && cgs.gametype != GT_SINGLE_PLAYER) {
ADDRGP4 $523
JUMPV
LABELV $577
ADDRGP4 cg_enemyModel+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $587
ADDRFP4 20
INDIRI4
ADDRFP4 16
INDIRI4
EQI4 $587
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $587
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 2
EQI4 $587
line 1048
;1047:
;1048:				Q_strncpyz(modelName, cg_enemyModel.string, modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRGP4 cg_enemyModel+16
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1050
;1049:
;1050:				slash = strchr(modelName, '/');
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1051
;1051:				if (!slash) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $592
line 1052
;1052:					Q_strncpyz(skinName, PM_SKIN, skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $207
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1053
;1053:				} else {
ADDRGP4 $593
JUMPV
LABELV $592
line 1054
;1054:					Q_strncpyz(skinName, slash + 1, skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1055
;1055:					*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1056
;1056:				}
LABELV $593
line 1058
;1057:
;1058:				if (setColor) {
ADDRFP4 28
INDIRI4
CNSTI4 0
EQI4 $523
line 1059
;1059:					colors = CG_GetTeamColors(cg_enemyColors.string, newInfo->team);
ADDRGP4 cg_enemyColors+16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 80
ADDRLP4 160
INDIRP4
ASGNP4
line 1060
;1060:					CG_SetColorInfo(colors, newInfo);
ADDRLP4 80
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetColorInfo
CALLV
pop
line 1061
;1061:					newInfo->coloredSkin = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 1612
ADDP4
CNSTI4 1
ASGNI4
line 1062
;1062:				}
line 1063
;1063:			} else {  // forcemodel, etc.
ADDRGP4 $523
JUMPV
LABELV $587
line 1064
;1064:				if (cg_forceModel.integer) {
ADDRGP4 cg_forceModel+12
INDIRI4
CNSTI4 0
EQI4 $597
line 1066
;1065:
;1066:					trap_Cvar_VariableStringBuffer("model", modelStr, sizeof(modelStr));
ADDRGP4 $572
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1067
;1067:					if ((skin = strchr(modelStr, '/')) == NULL) {
ADDRLP4 84
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 156
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $600
line 1068
;1068:						skin = "default";
ADDRLP4 12
ADDRGP4 $120
ASGNP4
line 1069
;1069:					} else {
ADDRGP4 $601
JUMPV
LABELV $600
line 1070
;1070:						*skin++ = '\0';
ADDRLP4 160
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 160
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI1 0
ASGNI1
line 1071
;1071:					}
LABELV $601
line 1073
;1072:
;1073:					Q_strncpyz(skinName, skin, skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1074
;1074:					Q_strncpyz(modelName, modelStr, modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1075
;1075:				} else {
ADDRGP4 $523
JUMPV
LABELV $597
line 1076
;1076:					Q_strncpyz(modelName, infomodel, modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1077
;1077:					slash = strchr(modelName, '/');
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1078
;1078:					if (!slash) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $602
line 1080
;1079:						// modelName didn not include a skin name
;1080:						Q_strncpyz(skinName, "default", skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1081
;1081:					} else {
ADDRGP4 $523
JUMPV
LABELV $602
line 1082
;1082:						Q_strncpyz(skinName, slash + 1, skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1084
;1083:						// truncate modelName
;1084:						*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1085
;1085:					}
line 1086
;1086:				}
line 1087
;1087:			}
line 1088
;1088:		}
line 1089
;1089:	} else  // !cg_forcemodel && !cg_enemyModel && !cg_teamModel
ADDRGP4 $523
JUMPV
LABELV $522
line 1090
;1090:	{
line 1091
;1091:		Q_strncpyz(modelName, infomodel, modelNameSize);
ADDRFP4 32
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 36
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1092
;1092:		slash = strchr(modelName, '/');
ADDRFP4 32
INDIRP4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
line 1093
;1093:		if (!slash) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $604
line 1095
;1094:			// modelName didn not include a skin name
;1095:			Q_strncpyz(skinName, "default", skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1096
;1096:		} else {
ADDRGP4 $605
JUMPV
LABELV $604
line 1097
;1097:			Q_strncpyz(skinName, slash + 1, skinNameSize);
ADDRFP4 40
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRFP4 44
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1099
;1098:			// truncate modelName
;1099:			*slash = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1100
;1100:		}
LABELV $605
line 1101
;1101:	}
LABELV $523
line 1102
;1102:}
LABELV $517
endproc CG_SetSkinAndModel 188 12
export CG_NewClientInfo
proc CG_NewClientInfo 1788 48
line 1109
;1103:
;1104:/*
;1105:======================
;1106:CG_NewClientInfo
;1107:======================
;1108:*/
;1109:void CG_NewClientInfo(int clientNum) {
line 1123
;1110:	clientInfo_t* ci;
;1111:	clientInfo_t  newInfo;
;1112:	const char*   configstring;
;1113:	const char*   v;
;1114:
;1115:	// for colored skins
;1116:	qboolean allowNativeModel;
;1117:	int      can_defer;
;1118:	int      myClientNum;
;1119:	team_t   myTeam;
;1120:	team_t   team;
;1121:	int      len;
;1122:
;1123:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 1668
ADDRFP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1125
;1124:
;1125:	configstring = CG_ConfigString(clientNum + CS_PLAYERS);
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1688
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 1656
ADDRLP4 1688
INDIRP4
ASGNP4
line 1126
;1126:	if (!configstring[0]) {
ADDRLP4 1656
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $608
line 1127
;1127:		memset(ci, 0, sizeof(*ci));
ADDRLP4 1668
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1652
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1128
;1128:		return;  // player just left
ADDRGP4 $606
JUMPV
LABELV $608
line 1131
;1129:	}
;1130:
;1131:	if (cg.snap) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $610
line 1132
;1132:		myClientNum = cg.snap->ps.clientNum;
ADDRLP4 1672
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1133
;1133:		myTeam      = cgs.clientinfo[myClientNum].team;
ADDRLP4 1664
ADDRLP4 1672
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
ASGNI4
line 1134
;1134:	} else {
ADDRGP4 $611
JUMPV
LABELV $610
line 1135
;1135:		myClientNum = cg.clientNum;
ADDRLP4 1672
ADDRGP4 cg+4
INDIRI4
ASGNI4
line 1136
;1136:		myTeam      = TEAM_SPECTATOR;
ADDRLP4 1664
CNSTI4 3
ASGNI4
line 1137
;1137:	}
LABELV $611
line 1140
;1138:
;1139:	// "join" team if spectating
;1140:	if (myTeam == TEAM_SPECTATOR && cg.snap) {
ADDRLP4 1664
INDIRI4
CNSTI4 3
NEI4 $617
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $617
line 1141
;1141:		myTeam = cg.snap->ps.persistant[PERS_TEAM];
ADDRLP4 1664
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ASGNI4
line 1142
;1142:	}
LABELV $617
line 1144
;1143:
;1144:	allowNativeModel = qfalse;
ADDRLP4 1676
CNSTI4 0
ASGNI4
line 1145
;1145:	if (cgs.gametype < GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
GEI4 $621
line 1146
;1146:		if (!cg.snap || (cg.snap->ps.persistant[PERS_TEAM] == TEAM_FREE && cg.snap->ps.clientNum == clientNum)) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $629
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 0
NEI4 $624
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $624
LABELV $629
line 1147
;1147:			if (cg.demoPlayback || (cg.snap && cg.snap->ps.pm_flags & PMF_FOLLOW)) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $635
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $630
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $630
LABELV $635
line 1148
;1148:				allowNativeModel = qtrue;
ADDRLP4 1676
CNSTI4 1
ASGNI4
line 1149
;1149:			}
LABELV $630
line 1150
;1150:		}
LABELV $624
line 1151
;1151:	}
LABELV $621
line 1155
;1152:
;1153:	// build into a temp buffer so the defer checks can use
;1154:	// the old value
;1155:	memset(&newInfo, 0, sizeof(newInfo));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1652
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1158
;1156:
;1157:	// isolate the player's name
;1158:	v = Info_ValueForKey(configstring, "n");
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $636
ARGP4
ADDRLP4 1692
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1692
INDIRP4
ASGNP4
line 1159
;1159:	Q_strncpyz(newInfo.name, v, sizeof(newInfo.name));
ADDRLP4 0+4
ARGP4
ADDRLP4 1652
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1162
;1160:
;1161:	// team
;1162:	v    = Info_ValueForKey(configstring, "t");
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $639
ARGP4
ADDRLP4 1696
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1696
INDIRP4
ASGNP4
line 1163
;1163:	team = atoi(v);
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1700
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1660
ADDRLP4 1700
INDIRI4
ASGNI4
line 1164
;1164:	if ((unsigned)team > TEAM_NUM_TEAMS) {
ADDRLP4 1660
INDIRI4
CVIU4 4
CNSTU4 4
LEU4 $640
line 1165
;1165:		team = TEAM_SPECTATOR;
ADDRLP4 1660
CNSTI4 3
ASGNI4
line 1166
;1166:	}
LABELV $640
line 1167
;1167:	newInfo.team = team;
ADDRLP4 0+36
ADDRLP4 1660
INDIRI4
ASGNI4
line 1170
;1168:
;1169:	// colors
;1170:	v = Info_ValueForKey(configstring, "c1");
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $643
ARGP4
ADDRLP4 1704
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1704
INDIRP4
ASGNP4
line 1171
;1171:	CG_ColorFromChar(v[0], newInfo.color1);
ADDRLP4 1652
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+44
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 1173
;1172:
;1173:	v = Info_ValueForKey(configstring, "c2");
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $645
ARGP4
ADDRLP4 1708
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1708
INDIRP4
ASGNP4
line 1174
;1174:	CG_ColorFromChar(v[0], newInfo.color2);
ADDRLP4 1652
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+56
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
line 1176
;1175:
;1176:	VectorSet(newInfo.headColor, 1.0, 1.0, 1.0);
ADDRLP4 0+1616
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1616+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1616+8
CNSTF4 1065353216
ASGNF4
line 1177
;1177:	VectorSet(newInfo.bodyColor, 1.0, 1.0, 1.0);
ADDRLP4 0+1628
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1628+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1628+8
CNSTF4 1065353216
ASGNF4
line 1178
;1178:	VectorSet(newInfo.legsColor, 1.0, 1.0, 1.0);
ADDRLP4 0+1640
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1640+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 0+1640+8
CNSTF4 1065353216
ASGNF4
line 1181
;1179:
;1180:	// bot skill
;1181:	v                = Info_ValueForKey(configstring, "skill");
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $662
ARGP4
ADDRLP4 1712
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1712
INDIRP4
ASGNP4
line 1182
;1182:	newInfo.botSkill = atoi(v);
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1716
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+40
ADDRLP4 1716
INDIRI4
ASGNI4
line 1185
;1183:
;1184:	// handicap
;1185:	v                = Info_ValueForKey(configstring, "hc");
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $664
ARGP4
ADDRLP4 1720
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1720
INDIRP4
ASGNP4
line 1186
;1186:	newInfo.handicap = atoi(v);
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1724
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+88
ADDRLP4 1724
INDIRI4
ASGNI4
line 1189
;1187:
;1188:	// wins
;1189:	v            = Info_ValueForKey(configstring, "w");
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $666
ARGP4
ADDRLP4 1728
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1728
INDIRP4
ASGNP4
line 1190
;1190:	newInfo.wins = atoi(v);
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1732
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+92
ADDRLP4 1732
INDIRI4
ASGNI4
line 1193
;1191:
;1192:	// losses
;1193:	v              = Info_ValueForKey(configstring, "l");
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $668
ARGP4
ADDRLP4 1736
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1736
INDIRP4
ASGNP4
line 1194
;1194:	newInfo.losses = atoi(v);
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1740
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+96
ADDRLP4 1740
INDIRI4
ASGNI4
line 1197
;1195:
;1196:	// always apply team colors [4] and [5] if specified, this will work in non-team games too
;1197:	if (cg_teamColors.string[0] && team != TEAM_SPECTATOR) {
ADDRGP4 cg_teamColors+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $670
ADDRLP4 1660
INDIRI4
CNSTI4 3
EQI4 $670
line 1198
;1198:		if (allowNativeModel || ((team == TEAM_RED || team == TEAM_BLUE) && team == myTeam && (clientNum != myClientNum || cg.demoPlayback))) {
ADDRLP4 1676
INDIRI4
CNSTI4 0
NEI4 $678
ADDRLP4 1660
INDIRI4
CNSTI4 1
EQI4 $677
ADDRLP4 1660
INDIRI4
CNSTI4 2
NEI4 $673
LABELV $677
ADDRLP4 1660
INDIRI4
ADDRLP4 1664
INDIRI4
NEI4 $673
ADDRFP4 0
INDIRI4
ADDRLP4 1672
INDIRI4
NEI4 $678
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
EQI4 $673
LABELV $678
line 1199
;1199:			v   = CG_GetTeamColors(cg_teamColors.string, team);
ADDRGP4 cg_teamColors+16
ARGP4
ADDRLP4 1660
INDIRI4
ARGI4
ADDRLP4 1748
ADDRGP4 CG_GetTeamColors
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1748
INDIRP4
ASGNP4
line 1200
;1200:			len = strlen(v);
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1752
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1684
ADDRLP4 1752
INDIRI4
ASGNI4
line 1201
;1201:			if (len >= 4)
ADDRLP4 1684
INDIRI4
CNSTI4 4
LTI4 $680
line 1202
;1202:				CG_ColorFromChar(v[3], newInfo.color1);
ADDRLP4 1652
INDIRP4
CNSTI4 3
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+44
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
LABELV $680
line 1203
;1203:			if (len >= 5)
ADDRLP4 1684
INDIRI4
CNSTI4 5
LTI4 $683
line 1204
;1204:				CG_ColorFromChar(v[4], newInfo.color2);
ADDRLP4 1652
INDIRP4
CNSTI4 4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0+56
ARGP4
ADDRGP4 CG_ColorFromChar
CALLV
pop
LABELV $683
line 1205
;1205:		}
LABELV $673
line 1206
;1206:	}
LABELV $670
line 1209
;1207:
;1208:	// team task
;1209:	v                = Info_ValueForKey(configstring, "tt");
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $686
ARGP4
ADDRLP4 1744
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1744
INDIRP4
ASGNP4
line 1210
;1210:	newInfo.teamTask = atoi(v);
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1748
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+100
ADDRLP4 1748
INDIRI4
ASGNI4
line 1213
;1211:
;1212:	// team leader
;1213:	v                  = Info_ValueForKey(configstring, "tl");
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $688
ARGP4
ADDRLP4 1752
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1752
INDIRP4
ASGNP4
line 1214
;1214:	newInfo.teamLeader = atoi(v);
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1756
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0+104
ADDRLP4 1756
INDIRI4
ASGNI4
line 1217
;1215:
;1216:	// model
;1217:	v = Info_ValueForKey(configstring, "model");
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $572
ARGP4
ADDRLP4 1760
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1760
INDIRP4
ASGNP4
line 1218
;1218:	CG_SetSkinAndModel(
ADDRLP4 0
ARGP4
ADDRLP4 1668
INDIRP4
ARGP4
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1676
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1672
INDIRI4
ARGI4
ADDRLP4 1664
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0+128
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0+192
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 CG_SetSkinAndModel
CALLV
pop
line 1223
;1219:		&newInfo, ci, v, allowNativeModel, clientNum, myClientNum, myTeam, qtrue, newInfo.modelName, sizeof(newInfo.modelName), newInfo.skinName,
;1220:		sizeof(newInfo.skinName));
;1221:
;1222:	// head model
;1223:	v = Info_ValueForKey(configstring, "hmodel");
ADDRLP4 1656
INDIRP4
ARGP4
ADDRGP4 $694
ARGP4
ADDRLP4 1764
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1652
ADDRLP4 1764
INDIRP4
ASGNP4
line 1224
;1224:	CG_SetSkinAndModel(
ADDRLP4 0
ARGP4
ADDRLP4 1668
INDIRP4
ARGP4
ADDRLP4 1652
INDIRP4
ARGP4
ADDRLP4 1676
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1672
INDIRI4
ARGI4
ADDRLP4 1664
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0+256
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0+320
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 CG_SetSkinAndModel
CALLV
pop
line 1229
;1225:		&newInfo, ci, v, allowNativeModel, clientNum, myClientNum, myTeam, qfalse, newInfo.headModelName, sizeof(newInfo.headModelName), newInfo.headSkinName,
;1226:		sizeof(newInfo.headSkinName));
;1227:
;1228:	// allow deferred load at some conditions
;1229:	can_defer = cg_deferPlayers.integer == 2 || (cg_deferPlayers.integer == 1 && myTeam != TEAM_SPECTATOR && team == TEAM_SPECTATOR);
ADDRGP4 cg_deferPlayers+12
INDIRI4
CNSTI4 2
EQI4 $704
ADDRGP4 cg_deferPlayers+12
INDIRI4
CNSTI4 1
NEI4 $702
ADDRLP4 1664
INDIRI4
CNSTI4 3
EQI4 $702
ADDRLP4 1660
INDIRI4
CNSTI4 3
NEI4 $702
LABELV $704
ADDRLP4 1768
CNSTI4 1
ASGNI4
ADDRGP4 $703
JUMPV
LABELV $702
ADDRLP4 1768
CNSTI4 0
ASGNI4
LABELV $703
ADDRLP4 1680
ADDRLP4 1768
INDIRI4
ASGNI4
line 1233
;1230:
;1231:	// scan for an existing clientinfo that matches this modelname
;1232:	// so we can avoid loading checks if possible
;1233:	if (!CG_ScanForExistingClientInfo(&newInfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 1772
ADDRGP4 CG_ScanForExistingClientInfo
CALLI4
ASGNI4
ADDRLP4 1772
INDIRI4
CNSTI4 0
NEI4 $705
line 1236
;1234:		qboolean forceDefer;
;1235:
;1236:		forceDefer = trap_MemoryRemaining() < 4000000;
ADDRLP4 1784
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 1784
INDIRI4
CNSTI4 4000000
GEI4 $708
ADDRLP4 1780
CNSTI4 1
ASGNI4
ADDRGP4 $709
JUMPV
LABELV $708
ADDRLP4 1780
CNSTI4 0
ASGNI4
LABELV $709
ADDRLP4 1776
ADDRLP4 1780
INDIRI4
ASGNI4
line 1239
;1237:
;1238:		// if we are defering loads, just have it pick the first valid
;1239:		if (forceDefer || (can_defer && !cg_buildScript.integer && !cg.loading)) {
ADDRLP4 1776
INDIRI4
CNSTI4 0
NEI4 $714
ADDRLP4 1680
INDIRI4
CNSTI4 0
EQI4 $710
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
NEI4 $710
ADDRGP4 cg+20
INDIRI4
CNSTI4 0
NEI4 $710
LABELV $714
line 1241
;1240:			// keep whatever they had if it won't violate team skins
;1241:			CG_SetDeferredClientInfo(&newInfo);
ADDRLP4 0
ARGP4
ADDRGP4 CG_SetDeferredClientInfo
CALLV
pop
line 1243
;1242:			// if we are low on memory, leave them with this model
;1243:			if (forceDefer) {
ADDRLP4 1776
INDIRI4
CNSTI4 0
EQI4 $711
line 1244
;1244:				CG_Printf("Memory is low. Using deferred model.\n");
ADDRGP4 $717
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1245
;1245:				newInfo.deferred = qfalse;
ADDRLP4 0+384
CNSTI4 0
ASGNI4
line 1246
;1246:			}
line 1247
;1247:		} else {
ADDRGP4 $711
JUMPV
LABELV $710
line 1248
;1248:			CG_LoadClientInfo(&newInfo);
ADDRLP4 0
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1249
;1249:		}
LABELV $711
line 1250
;1250:	}
LABELV $705
line 1253
;1251:
;1252:	// replace whatever was there with the new one
;1253:	newInfo.infoValid = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1254
;1254:	*ci               = newInfo;
ADDRLP4 1668
INDIRP4
ADDRLP4 0
INDIRB
ASGNB 1652
line 1255
;1255:}
LABELV $606
endproc CG_NewClientInfo 1788 48
export CG_LoadDeferredPlayers
proc CG_LoadDeferredPlayers 16 4
line 1266
;1256:
;1257:/*
;1258:======================
;1259:CG_LoadDeferredPlayers
;1260:
;1261:Called each frame when a player is dead
;1262:and the scoreboard is up
;1263:so deferred players can be loaded
;1264:======================
;1265:*/
;1266:void CG_LoadDeferredPlayers(void) {
line 1271
;1267:	int           i;
;1268:	clientInfo_t* ci;
;1269:
;1270:	// scan for a deferred player to load
;1271:	for (i = 0, ci = cgs.clientinfo; i < cgs.maxclients; i++, ci++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cgs+40996
ASGNP4
ADDRGP4 $723
JUMPV
LABELV $720
line 1272
;1272:		if (ci->infoValid && ci->deferred) {
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $726
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $726
line 1274
;1273:			// if we are low on memory, leave it deferred
;1274:			if (trap_MemoryRemaining() < 4000000) {
ADDRLP4 12
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4000000
GEI4 $728
line 1275
;1275:				CG_Printf("Memory is low.  Using deferred model.\n");
ADDRGP4 $730
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1276
;1276:				ci->deferred = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 0
ASGNI4
line 1277
;1277:				continue;
ADDRGP4 $721
JUMPV
LABELV $728
line 1279
;1278:			}
;1279:			CG_LoadClientInfo(ci);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_LoadClientInfo
CALLV
pop
line 1281
;1280:			//			break;
;1281:		}
LABELV $726
line 1282
;1282:	}
LABELV $721
line 1271
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1652
ADDP4
ASGNP4
LABELV $723
ADDRLP4 4
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $720
line 1283
;1283:}
LABELV $719
endproc CG_LoadDeferredPlayers 16 4
proc CG_SetLerpFrameAnimation 12 8
line 1300
;1284:
;1285:/*
;1286:=============================================================================
;1287:
;1288:PLAYER ANIMATION
;1289:
;1290:=============================================================================
;1291:*/
;1292:
;1293:/*
;1294:===============
;1295:CG_SetLerpFrameAnimation
;1296:
;1297:may include ANIM_TOGGLEBIT
;1298:===============
;1299:*/
;1300:static void CG_SetLerpFrameAnimation(clientInfo_t* ci, lerpFrame_t* lf, int newAnimation) {
line 1303
;1301:	animation_t* anim;
;1302:
;1303:	lf->animationNumber = newAnimation;
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 1304
;1304:	newAnimation &= ~ANIM_TOGGLEBIT;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1306
;1305:
;1306:	if (newAnimation < 0 || newAnimation >= MAX_TOTALANIMATIONS) {
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $734
ADDRLP4 4
INDIRI4
CNSTI4 37
LTI4 $732
LABELV $734
line 1307
;1307:		CG_Error("Bad animation number: %i", newAnimation);
ADDRGP4 $735
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1308
;1308:	}
LABELV $732
line 1310
;1309:
;1310:	anim = &ci->animations[newAnimation];
ADDRLP4 0
ADDRFP4 8
INDIRI4
CNSTI4 28
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDP4
ASGNP4
line 1312
;1311:
;1312:	lf->animation     = anim;
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1313
;1313:	lf->animationTime = lf->frameTime + anim->initialLerp;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1315
;1314:
;1315:	if (cg_debugAnim.integer) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $736
line 1316
;1316:		CG_Printf("Anim: %i\n", newAnimation);
ADDRGP4 $739
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 1317
;1317:	}
LABELV $736
line 1318
;1318:}
LABELV $731
endproc CG_SetLerpFrameAnimation 12 8
proc CG_RunLerpFrame 36 12
line 1328
;1319:
;1320:/*
;1321:===============
;1322:CG_RunLerpFrame
;1323:
;1324:Sets cg.snap, cg.oldFrame, and cg.backlerp
;1325:cg.time should be between oldFrameTime and frameTime after exit
;1326:===============
;1327:*/
;1328:static void CG_RunLerpFrame(clientInfo_t* ci, lerpFrame_t* lf, int newAnimation, float speedScale) {
line 1333
;1329:	int          f, numFrames;
;1330:	animation_t* anim;
;1331:
;1332:	// debugging tool to get no animations
;1333:	if (cg_animSpeed.integer == 0) {
ADDRGP4 cg_animSpeed+12
INDIRI4
CNSTI4 0
NEI4 $741
line 1334
;1334:		lf->oldFrame = lf->frame = lf->backlerp = 0;
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
CNSTF4 0
ASGNF4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 16
INDIRF4
ASGNF4
ADDRLP4 20
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1335
;1335:		return;
ADDRGP4 $740
JUMPV
LABELV $741
line 1339
;1336:	}
;1337:
;1338:	// see if the animation sequence is switching
;1339:	if (newAnimation != lf->animationNumber || !lf->animation) {
ADDRLP4 12
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 8
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
NEI4 $746
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $744
LABELV $746
line 1340
;1340:		CG_SetLerpFrameAnimation(ci, lf, newAnimation);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1341
;1341:	}
LABELV $744
line 1345
;1342:
;1343:	// if we have passed the current frame, move it to
;1344:	// oldFrame and calculate a new frame
;1345:	if (cg.time >= lf->frameTime) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LTI4 $747
line 1346
;1346:		lf->oldFrame     = lf->frame;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1347
;1347:		lf->oldFrameTime = lf->frameTime;
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1350
;1348:
;1349:		// get the next frame based on the animation
;1350:		anim = lf->animation;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
ASGNP4
line 1351
;1351:		if (!anim->frameLerp) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $750
line 1352
;1352:			return;  // shouldn't happen
ADDRGP4 $740
JUMPV
LABELV $750
line 1354
;1353:		}
;1354:		if (cg.time < lf->animationTime) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
GEI4 $752
line 1355
;1355:			lf->frameTime = lf->animationTime;  // initial lerp
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ASGNI4
line 1356
;1356:		} else {
ADDRGP4 $753
JUMPV
LABELV $752
line 1357
;1357:			lf->frameTime = lf->oldFrameTime + anim->frameLerp;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1358
;1358:		}
LABELV $753
line 1359
;1359:		f = (lf->frameTime - lf->animationTime) / anim->frameLerp;
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
SUBI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
DIVI4
ASGNI4
line 1360
;1360:		f *= speedScale;  // adjust for haste, etc
ADDRLP4 4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRFP4 12
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 1362
;1361:
;1362:		numFrames = anim->numFrames;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1363
;1363:		if (anim->flipflop) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $755
line 1364
;1364:			numFrames *= 2;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 1365
;1365:		}
LABELV $755
line 1366
;1366:		if (f >= numFrames) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $757
line 1367
;1367:			f -= numFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1368
;1368:			if (anim->loopFrames) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
EQI4 $759
line 1369
;1369:				f %= anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
MODI4
ASGNI4
line 1370
;1370:				f += anim->numFrames - anim->loopFrames;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
ADDI4
ASGNI4
line 1371
;1371:			} else {
ADDRGP4 $760
JUMPV
LABELV $759
line 1372
;1372:				f = numFrames - 1;
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1375
;1373:				// the animation is stuck at the end, so it
;1374:				// can immediately transition to another sequence
;1375:				lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1376
;1376:			}
LABELV $760
line 1377
;1377:		}
LABELV $757
line 1378
;1378:		if (anim->reversed) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $762
line 1379
;1379:			lf->frame = anim->firstFrame + anim->numFrames - 1 - f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 1380
;1380:		} else if (anim->flipflop && f >= anim->numFrames) {
ADDRGP4 $763
JUMPV
LABELV $762
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $764
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
LTI4 $764
line 1381
;1381:			lf->frame = anim->firstFrame + anim->numFrames - 1 - (f % anim->numFrames);
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
MODI4
SUBI4
ASGNI4
line 1382
;1382:		} else {
ADDRGP4 $765
JUMPV
LABELV $764
line 1383
;1383:			lf->frame = anim->firstFrame + f;
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1384
;1384:		}
LABELV $765
LABELV $763
line 1385
;1385:		if (cg.time > lf->frameTime) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
LEI4 $766
line 1386
;1386:			lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1387
;1387:			if (cg_debugAnim.integer) {
ADDRGP4 cg_debugAnim+12
INDIRI4
CNSTI4 0
EQI4 $770
line 1388
;1388:				CG_Printf("Clamp lf->frameTime\n");
ADDRGP4 $773
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 1389
;1389:			}
LABELV $770
line 1390
;1390:		}
LABELV $766
line 1391
;1391:	}
LABELV $747
line 1393
;1392:
;1393:	if (lf->frameTime > cg.time + 200) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 200
ADDI4
LEI4 $774
line 1394
;1394:		lf->frameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1395
;1395:	}
LABELV $774
line 1397
;1396:
;1397:	if (lf->oldFrameTime > cg.time) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $778
line 1398
;1398:		lf->oldFrameTime = cg.time;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1399
;1399:	}
LABELV $778
line 1401
;1400:	// calculate current lerp value
;1401:	if (lf->frameTime == lf->oldFrameTime) {
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
NEI4 $782
line 1402
;1402:		lf->backlerp = 0;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 0
ASGNF4
line 1403
;1403:	} else {
ADDRGP4 $783
JUMPV
LABELV $782
line 1404
;1404:		lf->backlerp = 1.0 - (float)(cg.time - lf->oldFrameTime) / (lf->frameTime - lf->oldFrameTime);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 1065353216
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
SUBF4
ASGNF4
line 1405
;1405:	}
LABELV $783
line 1406
;1406:}
LABELV $740
endproc CG_RunLerpFrame 36 12
proc CG_ClearLerpFrame 16 12
line 1413
;1407:
;1408:/*
;1409:===============
;1410:CG_ClearLerpFrame
;1411:===============
;1412:*/
;1413:static void CG_ClearLerpFrame(clientInfo_t* ci, lerpFrame_t* lf, int animationNumber) {
line 1414
;1414:	lf->frameTime = lf->oldFrameTime = cg.time;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1415
;1415:	CG_SetLerpFrameAnimation(ci, lf, animationNumber);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_SetLerpFrameAnimation
CALLV
pop
line 1416
;1416:	lf->oldFrame = lf->frame = lf->animation->firstFrame;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
CNSTI4 40
ADDP4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1417
;1417:}
LABELV $785
endproc CG_ClearLerpFrame 16 12
proc CG_PlayerAnimation 20 16
line 1424
;1418:
;1419:/*
;1420:===============
;1421:CG_PlayerAnimation
;1422:===============
;1423:*/
;1424:static void CG_PlayerAnimation(centity_t* cent, int* legsOld, int* legs, float* legsBackLerp, int* torsoOld, int* torso, float* torsoBackLerp) {
line 1429
;1425:	clientInfo_t* ci;
;1426:	int           clientNum;
;1427:	float         speedScale;
;1428:
;1429:	clientNum = cent->currentState.clientNum;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1431
;1430:
;1431:	if (cg_noPlayerAnims.integer) {
ADDRGP4 cg_noPlayerAnims+12
INDIRI4
CNSTI4 0
EQI4 $788
line 1432
;1432:		*legsOld = *legs = *torsoOld = *torso = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRFP4 20
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 16
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1433
;1433:		return;
ADDRGP4 $787
JUMPV
LABELV $788
line 1436
;1434:	}
;1435:
;1436:	if (cent->currentState.powerups & (1 << PW_HASTE)) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $791
line 1437
;1437:		speedScale = 1.5;
ADDRLP4 4
CNSTF4 1069547520
ASGNF4
line 1438
;1438:	} else {
ADDRGP4 $792
JUMPV
LABELV $791
line 1439
;1439:		speedScale = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1440
;1440:	}
LABELV $792
line 1442
;1441:
;1442:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1445
;1443:
;1444:	// do the shuffle turn frames locally
;1445:	if (cent->pe.legs.yawing && (cent->currentState.legsAnim & ~ANIM_TOGGLEBIT) == LEGS_IDLE) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
CNSTI4 0
EQI4 $794
ADDRLP4 12
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $794
line 1446
;1446:		CG_RunLerpFrame(ci, &cent->pe.legs, LEGS_TURN, speedScale);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
CNSTI4 24
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1447
;1447:	} else {
ADDRGP4 $795
JUMPV
LABELV $794
line 1448
;1448:		CG_RunLerpFrame(ci, &cent->pe.legs, cent->currentState.legsAnim, speedScale);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 460
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1449
;1449:	}
LABELV $795
line 1451
;1450:
;1451:	*legsOld      = cent->pe.legs.oldFrame;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ASGNI4
line 1452
;1452:	*legs         = cent->pe.legs.frame;
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
ASGNI4
line 1453
;1453:	*legsBackLerp = cent->pe.legs.backlerp;
ADDRFP4 12
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ASGNF4
line 1455
;1454:
;1455:	CG_RunLerpFrame(ci, &cent->pe.torso, cent->currentState.torsoAnim, speedScale);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1457
;1456:
;1457:	*torsoOld      = cent->pe.torso.oldFrame;
ADDRFP4 16
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
INDIRI4
ASGNI4
line 1458
;1458:	*torso         = cent->pe.torso.frame;
ADDRFP4 20
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRI4
ASGNI4
line 1459
;1459:	*torsoBackLerp = cent->pe.torso.backlerp;
ADDRFP4 24
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRF4
ASGNF4
line 1460
;1460:}
LABELV $787
endproc CG_PlayerAnimation 20 16
proc CG_SwingAngles 28 8
line 1475
;1461:
;1462:/*
;1463:=============================================================================
;1464:
;1465:PLAYER ANGLES
;1466:
;1467:=============================================================================
;1468:*/
;1469:
;1470:/*
;1471:==================
;1472:CG_SwingAngles
;1473:==================
;1474:*/
;1475:static void CG_SwingAngles(float destination, float swingTolerance, float clampTolerance, float speed, float* angle, qboolean* swinging) {
line 1480
;1476:	float swing;
;1477:	float move;
;1478:	float scale;
;1479:
;1480:	if (!*swinging) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $797
line 1482
;1481:		// see if a swing should be started
;1482:		swing = AngleSubtract(*angle, destination);
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1483
;1483:		if (swing > swingTolerance || swing < -swingTolerance) {
ADDRLP4 20
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
GTF4 $801
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRF4
NEGF4
GEF4 $799
LABELV $801
line 1484
;1484:			*swinging = qtrue;
ADDRFP4 20
INDIRP4
CNSTI4 1
ASGNI4
line 1485
;1485:		}
LABELV $799
line 1486
;1486:	}
LABELV $797
line 1488
;1487:
;1488:	if (!*swinging) {
ADDRFP4 20
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $802
line 1489
;1489:		return;
ADDRGP4 $796
JUMPV
LABELV $802
line 1494
;1490:	}
;1491:
;1492:	// modify the speed depending on the delta
;1493:	// so it doesn't seem so linear
;1494:	swing = AngleSubtract(destination, *angle);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
ASGNF4
line 1495
;1495:	scale = fabs(swing);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 16
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 16
INDIRF4
ASGNF4
line 1496
;1496:	if (scale < swingTolerance * 0.5) {
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
CNSTF4 1056964608
MULF4
GEF4 $804
line 1497
;1497:		scale = 0.5;
ADDRLP4 4
CNSTF4 1056964608
ASGNF4
line 1498
;1498:	} else if (scale < swingTolerance) {
ADDRGP4 $805
JUMPV
LABELV $804
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
GEF4 $806
line 1499
;1499:		scale = 1.0;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1500
;1500:	} else {
ADDRGP4 $807
JUMPV
LABELV $806
line 1501
;1501:		scale = 2.0;
ADDRLP4 4
CNSTF4 1073741824
ASGNF4
line 1502
;1502:	}
LABELV $807
LABELV $805
line 1505
;1503:
;1504:	// swing towards the destination angle
;1505:	if (swing >= 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LTF4 $808
line 1506
;1506:		move = cg.frametime * scale * speed;
ADDRLP4 8
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
MULF4
ASGNF4
line 1507
;1507:		if (move >= swing) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
LTF4 $811
line 1508
;1508:			move      = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1509
;1509:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1510
;1510:		}
LABELV $811
line 1511
;1511:		*angle = AngleMod(*angle + move);
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1512
;1512:	} else {
ADDRGP4 $809
JUMPV
LABELV $808
line 1513
;1513:		move = cg.frametime * scale * -speed;
ADDRLP4 8
ADDRGP4 cg+107600
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRF4
MULF4
ADDRFP4 12
INDIRF4
NEGF4
MULF4
ASGNF4
line 1514
;1514:		if (move <= swing) {
ADDRLP4 8
INDIRF4
ADDRLP4 0
INDIRF4
GTF4 $814
line 1515
;1515:			move      = swing;
ADDRLP4 8
ADDRLP4 0
INDIRF4
ASGNF4
line 1516
;1516:			*swinging = qfalse;
ADDRFP4 20
INDIRP4
CNSTI4 0
ASGNI4
line 1517
;1517:		}
LABELV $814
line 1518
;1518:		*angle = AngleMod(*angle + move);
ADDRLP4 20
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 20
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1519
;1519:	}
LABELV $809
line 1522
;1520:
;1521:	// clamp to no more than tolerance
;1522:	swing = AngleSubtract(destination, *angle);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 16
INDIRP4
INDIRF4
ARGF4
ADDRLP4 20
ADDRGP4 AngleSubtract
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 20
INDIRF4
ASGNF4
line 1523
;1523:	if (swing > clampTolerance) {
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $816
line 1524
;1524:		*angle = AngleMod(destination - (clampTolerance - 1));
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
SUBF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1525
;1525:	} else if (swing < -clampTolerance) {
ADDRGP4 $817
JUMPV
LABELV $816
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $818
line 1526
;1526:		*angle = AngleMod(destination + (clampTolerance - 1));
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
SUBF4
ADDF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ADDRLP4 24
INDIRF4
ASGNF4
line 1527
;1527:	}
LABELV $818
LABELV $817
line 1528
;1528:}
LABELV $796
endproc CG_SwingAngles 28 8
proc CG_AddPainTwitch 12 0
line 1535
;1529:
;1530:/*
;1531:=================
;1532:CG_AddPainTwitch
;1533:=================
;1534:*/
;1535:static void CG_AddPainTwitch(centity_t* cent, vec3_t torsoAngles) {
line 1539
;1536:	int   t;
;1537:	float f;
;1538:
;1539:	t = cg.time - cent->pe.painTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1540
;1540:	if (t >= PAIN_TWITCH_TIME) {
ADDRLP4 0
INDIRI4
CNSTI4 200
LTI4 $822
line 1541
;1541:		return;
ADDRGP4 $820
JUMPV
LABELV $822
line 1544
;1542:	}
;1543:
;1544:	f = 1.0 - (float)t / PAIN_TWITCH_TIME;
ADDRLP4 4
CNSTF4 1065353216
ADDRLP4 0
INDIRI4
CVIF4 4
CNSTF4 1000593162
MULF4
SUBF4
ASGNF4
line 1546
;1545:
;1546:	if (cent->pe.painDirection) {
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
INDIRI4
CNSTI4 0
EQI4 $824
line 1547
;1547:		torsoAngles[ROLL] += 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1101004800
MULF4
ADDF4
ASGNF4
line 1548
;1548:	} else {
ADDRGP4 $825
JUMPV
LABELV $824
line 1549
;1549:		torsoAngles[ROLL] -= 20 * f;
ADDRLP4 8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
CNSTF4 1101004800
MULF4
SUBF4
ASGNF4
line 1550
;1550:	}
LABELV $825
line 1551
;1551:}
LABELV $820
endproc CG_AddPainTwitch 12 0
data
align 4
LABELV $827
byte 4 0
byte 4 22
byte 4 45
byte 4 -22
byte 4 0
byte 4 22
byte 4 -45
byte 4 -22
code
proc CG_PlayerAngles 136 24
line 1567
;1552:
;1553:/*
;1554:===============
;1555:CG_PlayerAngles
;1556:
;1557:Handles seperate torso motion
;1558:
;1559:  legs pivot based on direction of movement
;1560:
;1561:  head always looks exactly at cent->lerpAngles
;1562:
;1563:  if motion < 20 degrees, show in head only
;1564:  if < 45 degrees, also show in torso
;1565:===============
;1566:*/
;1567:static void CG_PlayerAngles(centity_t* cent, vec3_t legs[3], vec3_t torso[3], vec3_t head[3]) {
line 1576
;1568:	vec3_t        legsAngles, torsoAngles, headAngles;
;1569:	float         dest;
;1570:	static int    movementOffsets[8] = {0, 22, 45, -22, 0, 22, -45, -22};
;1571:	vec3_t        velocity;
;1572:	float         speed;
;1573:	int           dir, clientNum;
;1574:	clientInfo_t* ci;
;1575:
;1576:	VectorCopy(cent->lerpAngles, headAngles);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 1577
;1577:	headAngles[YAW] = AngleMod(headAngles[YAW]);
ADDRLP4 24+4
INDIRF4
ARGF4
ADDRLP4 68
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 68
INDIRF4
ASGNF4
line 1578
;1578:	VectorClear(legsAngles);
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 12+4
CNSTF4 0
ASGNF4
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1579
;1579:	VectorClear(torsoAngles);
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1584
;1580:
;1581:	// --------- yaw -------------
;1582:
;1583:	// allow yaw to drift a bit
;1584:	if ((cent->currentState.legsAnim & ~ANIM_TOGGLEBIT) != LEGS_IDLE ||
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 22
NEI4 $836
ADDRLP4 72
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 11
EQI4 $834
ADDRLP4 72
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
CNSTI4 12
EQI4 $834
LABELV $836
line 1585
;1585:	    ((cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) != TORSO_STAND && (cent->currentState.torsoAnim & ~ANIM_TOGGLEBIT) != TORSO_STAND2)) {
line 1587
;1586:		// if not standing still, always point all in the same direction
;1587:		cent->pe.torso.yawing   = qtrue;  // always center
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 1
ASGNI4
line 1588
;1588:		cent->pe.torso.pitching = qtrue;  // always center
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 1
ASGNI4
line 1589
;1589:		cent->pe.legs.yawing    = qtrue;  // always center
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 1
ASGNI4
line 1590
;1590:	}
LABELV $834
line 1593
;1591:
;1592:	// adjust legs for movement dir
;1593:	if (cent->currentState.eFlags & EF_DEAD) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $837
line 1595
;1594:		// don't let dead bodies twitch
;1595:		dir = 0;
ADDRLP4 52
CNSTI4 0
ASGNI4
line 1596
;1596:	} else {
ADDRGP4 $838
JUMPV
LABELV $837
line 1597
;1597:		dir = cent->currentState.angles2[YAW];
ADDRLP4 52
ADDRFP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 1598
;1598:		if (dir < 0 || dir > 7) {
ADDRLP4 52
INDIRI4
CNSTI4 0
LTI4 $841
ADDRLP4 52
INDIRI4
CNSTI4 7
LEI4 $839
LABELV $841
line 1599
;1599:			CG_Error("Bad player movement angle");
ADDRGP4 $842
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1600
;1600:		}
LABELV $839
line 1601
;1601:	}
LABELV $838
line 1602
;1602:	legsAngles[YAW]  = headAngles[YAW] + movementOffsets[dir];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $827
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1603
;1603:	torsoAngles[YAW] = headAngles[YAW] + 0.25 * movementOffsets[dir];
ADDRLP4 0+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $827
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1048576000
MULF4
ADDF4
ASGNF4
line 1606
;1604:
;1605:	// torso
;1606:	CG_SwingAngles(torsoAngles[YAW], 25, 90, cg_swingSpeed.value, &cent->pe.torso.yawAngle, &cent->pe.torso.yawing);
ADDRLP4 0+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 528
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 532
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1607
;1607:	CG_SwingAngles(legsAngles[YAW], 40, 90, cg_swingSpeed.value, &cent->pe.legs.yawAngle, &cent->pe.legs.yawing);
ADDRLP4 12+4
INDIRF4
ARGF4
CNSTF4 1109393408
ARGF4
CNSTF4 1119092736
ARGF4
ADDRGP4 cg_swingSpeed+8
INDIRF4
ARGF4
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 480
ADDP4
ARGP4
ADDRLP4 80
INDIRP4
CNSTI4 484
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1609
;1608:
;1609:	torsoAngles[YAW] = cent->pe.torso.yawAngle;
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ASGNF4
line 1610
;1610:	legsAngles[YAW]  = cent->pe.legs.yawAngle;
ADDRLP4 12+4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ASGNF4
line 1615
;1611:
;1612:	// --------- pitch -------------
;1613:
;1614:	// only show a fraction of the pitch angle in the torso
;1615:	if (headAngles[PITCH] > 180) {
ADDRLP4 24
INDIRF4
CNSTF4 1127481344
LEF4 $853
line 1616
;1616:		dest = (-360 + headAngles[PITCH]) * 0.75f;
ADDRLP4 60
ADDRLP4 24
INDIRF4
CNSTF4 3283353600
ADDF4
CNSTF4 1061158912
MULF4
ASGNF4
line 1617
;1617:	} else {
ADDRGP4 $854
JUMPV
LABELV $853
line 1618
;1618:		dest = headAngles[PITCH] * 0.75f;
ADDRLP4 60
ADDRLP4 24
INDIRF4
CNSTF4 1061158912
MULF4
ASGNF4
line 1619
;1619:	}
LABELV $854
line 1620
;1620:	CG_SwingAngles(dest, 15, 30, 0.1f, &cent->pe.torso.pitchAngle, &cent->pe.torso.pitching);
ADDRLP4 60
INDIRF4
ARGF4
CNSTF4 1097859072
ARGF4
CNSTF4 1106247680
ARGF4
CNSTF4 1036831949
ARGF4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 536
ADDP4
ARGP4
ADDRLP4 84
INDIRP4
CNSTI4 540
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1621
;1621:	torsoAngles[PITCH] = cent->pe.torso.pitchAngle;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRF4
ASGNF4
line 1624
;1622:
;1623:	//
;1624:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1625
;1625:	if (clientNum >= 0 && clientNum < MAX_CLIENTS) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $855
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $855
line 1626
;1626:		ci = &cgs.clientinfo[clientNum];
ADDRLP4 64
ADDRLP4 36
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1627
;1627:		if (ci->fixedtorso) {
ADDRLP4 64
INDIRP4
CNSTI4 396
ADDP4
INDIRI4
CNSTI4 0
EQI4 $858
line 1628
;1628:			torsoAngles[PITCH] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1629
;1629:		}
LABELV $858
line 1630
;1630:	}
LABELV $855
line 1635
;1631:
;1632:	// --------- roll -------------
;1633:
;1634:	// lean towards the direction of travel
;1635:	VectorCopy(cent->currentState.pos.trDelta, velocity);
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1636
;1636:	speed = VectorNormalize(velocity);
ADDRLP4 40
ARGP4
ADDRLP4 92
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 56
ADDRLP4 92
INDIRF4
ASGNF4
line 1637
;1637:	if (speed) {
ADDRLP4 56
INDIRF4
CNSTF4 0
EQF4 $860
line 1641
;1638:		vec3_t axis[3];
;1639:		float  side;
;1640:
;1641:		speed *= 0.05f;
ADDRLP4 56
ADDRLP4 56
INDIRF4
CNSTF4 1028443341
MULF4
ASGNF4
line 1643
;1642:
;1643:		AnglesToAxis(legsAngles, axis);
ADDRLP4 12
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1644
;1644:		side = speed * DotProduct(velocity, axis[1]);
ADDRLP4 132
ADDRLP4 56
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 96+12
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 96+12+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 96+12+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1645
;1645:		legsAngles[ROLL] -= side;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 132
INDIRF4
SUBF4
ASGNF4
line 1647
;1646:
;1647:		side = speed * DotProduct(velocity, axis[0]);
ADDRLP4 132
ADDRLP4 56
INDIRF4
ADDRLP4 40
INDIRF4
ADDRLP4 96
INDIRF4
MULF4
ADDRLP4 40+4
INDIRF4
ADDRLP4 96+4
INDIRF4
MULF4
ADDF4
ADDRLP4 40+8
INDIRF4
ADDRLP4 96+8
INDIRF4
MULF4
ADDF4
MULF4
ASGNF4
line 1648
;1648:		legsAngles[PITCH] += side;
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 132
INDIRF4
ADDF4
ASGNF4
line 1649
;1649:	}
LABELV $860
line 1652
;1650:
;1651:	//
;1652:	clientNum = cent->currentState.clientNum;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1653
;1653:	if (clientNum >= 0 && clientNum < MAX_CLIENTS) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $874
ADDRLP4 36
INDIRI4
CNSTI4 64
GEI4 $874
line 1654
;1654:		ci = &cgs.clientinfo[clientNum];
ADDRLP4 64
ADDRLP4 36
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1655
;1655:		if (ci->fixedlegs) {
ADDRLP4 64
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
CNSTI4 0
EQI4 $877
line 1656
;1656:			legsAngles[YAW]   = torsoAngles[YAW];
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ASGNF4
line 1657
;1657:			legsAngles[PITCH] = 0.0f;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1658
;1658:			legsAngles[ROLL]  = 0.0f;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 1659
;1659:		}
LABELV $877
line 1660
;1660:	}
LABELV $874
line 1663
;1661:
;1662:	// pain twitch
;1663:	CG_AddPainTwitch(cent, torsoAngles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_AddPainTwitch
CALLV
pop
line 1666
;1664:
;1665:	// pull the angles back out of the hierarchial chain
;1666:	AnglesSubtract(headAngles, torsoAngles, headAngles);
ADDRLP4 24
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1667
;1667:	AnglesSubtract(torsoAngles, legsAngles, torsoAngles);
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 AnglesSubtract
CALLV
pop
line 1668
;1668:	AnglesToAxis(legsAngles, legs);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1669
;1669:	AnglesToAxis(torsoAngles, torso);
ADDRLP4 0
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1670
;1670:	AnglesToAxis(headAngles, head);
ADDRLP4 24
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1671
;1671:}
LABELV $826
endproc CG_PlayerAngles 136 24
proc CG_HasteTrail 32 48
line 1680
;1672:
;1673://==========================================================================
;1674:
;1675:/*
;1676:===============
;1677:CG_HasteTrail
;1678:===============
;1679:*/
;1680:static void CG_HasteTrail(centity_t* cent) {
line 1685
;1681:	localEntity_t* smoke;
;1682:	vec3_t         origin;
;1683:	int            anim;
;1684:
;1685:	if (cent->trailTime > cg.time) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $883
line 1686
;1686:		return;
ADDRGP4 $882
JUMPV
LABELV $883
line 1688
;1687:	}
;1688:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1689
;1689:	if (anim != LEGS_RUN && anim != LEGS_BACK) {
ADDRLP4 12
INDIRI4
CNSTI4 15
EQI4 $886
ADDRLP4 12
INDIRI4
CNSTI4 16
EQI4 $886
line 1690
;1690:		return;
ADDRGP4 $882
JUMPV
LABELV $886
line 1693
;1691:	}
;1692:
;1693:	cent->trailTime += 100;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 1694
;1694:	if (cent->trailTime < cg.time) {
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $888
line 1695
;1695:		cent->trailTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1696
;1696:	}
LABELV $888
line 1698
;1697:
;1698:	VectorCopy(cent->lerpOrigin, origin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 1699
;1699:	origin[2] -= 16;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
line 1701
;1700:
;1701:	smoke = CG_SmokePuff(origin, vec3_origin, 8, 1, 1, 1, 1, 500, cg.time, 0, 0, cgs.media.hastePuffShader);
ADDRLP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1140457472
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+420
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CG_SmokePuff
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 28
INDIRP4
ASGNP4
line 1704
;1702:
;1703:	// use the optimized local entity add
;1704:	smoke->leType = LE_SCALE_FADE;
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 7
ASGNI4
line 1705
;1705:}
LABELV $882
endproc CG_HasteTrail 32 48
proc CG_TrailItem 188 12
line 1791
;1706:
;1707:#ifdef MISSIONPACK
;1708:/*
;1709:===============
;1710:CG_BreathPuffs
;1711:===============
;1712:*/
;1713:static void CG_BreathPuffs(centity_t* cent, refEntity_t* head) {
;1714:	clientInfo_t* ci;
;1715:	vec3_t        up, origin;
;1716:	int           contents;
;1717:
;1718:	ci = &cgs.clientinfo[cent->currentState.number];
;1719:
;1720:	if (!cg_enableBreath.integer) {
;1721:		return;
;1722:	}
;1723:	if (cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson) {
;1724:		return;
;1725:	}
;1726:	if (cent->currentState.eFlags & EF_DEAD) {
;1727:		return;
;1728:	}
;1729:	contents = CG_PointContents(head->origin, 0);
;1730:	if (contents & (CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA)) {
;1731:		return;
;1732:	}
;1733:	if (ci->breathPuffTime > cg.time) {
;1734:		return;
;1735:	}
;1736:
;1737:	VectorSet(up, 0, 0, 8);
;1738:	VectorMA(head->origin, 8, head->axis[0], origin);
;1739:	VectorMA(origin, -4, head->axis[2], origin);
;1740:	CG_SmokePuff(origin, up, 16, 1, 1, 1, 0.66f, 1500, cg.time, cg.time + 400, LEF_PUFF_DONT_SCALE, cgs.media.shotgunSmokePuffShader);
;1741:	ci->breathPuffTime = cg.time + 2000;
;1742:}
;1743:
;1744:/*
;1745:===============
;1746:CG_DustTrail
;1747:===============
;1748:*/
;1749:static void CG_DustTrail(centity_t* cent) {
;1750:	int     anim;
;1751:	vec3_t  end, vel;
;1752:	trace_t tr;
;1753:
;1754:	if (!cg_enableDust.integer)
;1755:		return;
;1756:
;1757:	if (cent->dustTrailTime > cg.time) {
;1758:		return;
;1759:	}
;1760:
;1761:	anim = cent->pe.legs.animationNumber & ~ANIM_TOGGLEBIT;
;1762:	if (anim != LEGS_LANDB && anim != LEGS_LAND) {
;1763:		return;
;1764:	}
;1765:
;1766:	cent->dustTrailTime += 40;
;1767:	if (cent->dustTrailTime < cg.time) {
;1768:		cent->dustTrailTime = cg.time;
;1769:	}
;1770:
;1771:	VectorCopy(cent->currentState.pos.trBase, end);
;1772:	end[2] -= 64;
;1773:	CG_Trace(&tr, cent->currentState.pos.trBase, NULL, NULL, end, cent->currentState.number, MASK_PLAYERSOLID);
;1774:
;1775:	if (!(tr.surfaceFlags & SURF_DUST))
;1776:		return;
;1777:
;1778:	VectorCopy(cent->currentState.pos.trBase, end);
;1779:	end[2] -= 16;
;1780:
;1781:	VectorSet(vel, 0, 0, -30);
;1782:	CG_SmokePuff(end, vel, 24, .8f, .8f, 0.7f, 0.33f, 500, cg.time, 0, 0, cgs.media.dustPuffShader);
;1783:}
;1784:#endif
;1785:
;1786:/*
;1787:===============
;1788:CG_TrailItem
;1789:===============
;1790:*/
;1791:static void CG_TrailItem(const centity_t* cent, qhandle_t hModel) {
line 1796
;1792:	refEntity_t ent;
;1793:	vec3_t      angles;
;1794:	vec3_t      axis[3];
;1795:
;1796:	VectorCopy(cent->lerpAngles, angles);
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 1797
;1797:	angles[PITCH] = 0;
ADDRLP4 140
CNSTF4 0
ASGNF4
line 1798
;1798:	angles[ROLL]  = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 1799
;1799:	AnglesToAxis(angles, axis);
ADDRLP4 140
ARGP4
ADDRLP4 152
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1801
;1800:
;1801:	memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1802
;1802:	VectorMA(cent->lerpOrigin, -16, axis[0], ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
ADDRLP4 152
INDIRF4
CNSTF4 3246391296
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
ADDRLP4 152+4
INDIRF4
CNSTF4 3246391296
MULF4
ADDF4
ASGNF4
ADDRLP4 0+68+8
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
ADDRLP4 152+8
INDIRF4
CNSTF4 3246391296
MULF4
ADDF4
ASGNF4
line 1803
;1803:	ent.origin[2] += 16;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 1804
;1804:	angles[YAW] += 90;
ADDRLP4 140+4
ADDRLP4 140+4
INDIRF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 1805
;1805:	AnglesToAxis(angles, ent.axis);
ADDRLP4 140
ARGP4
ADDRLP4 0+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1807
;1806:
;1807:	ent.hModel = hModel;
ADDRLP4 0+8
ADDRFP4 4
INDIRI4
ASGNI4
line 1808
;1808:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1809
;1809:}
LABELV $896
endproc CG_TrailItem 188 12
proc CG_PlayerFlag 352 24
line 1816
;1810:
;1811:/*
;1812:===============
;1813:CG_PlayerFlag
;1814:===============
;1815:*/
;1816:static void CG_PlayerFlag(centity_t* cent, qhandle_t hSkin, refEntity_t* torso) {
line 1825
;1817:	clientInfo_t* ci;
;1818:	refEntity_t   pole;
;1819:	refEntity_t   flag;
;1820:	vec3_t        angles, dir;
;1821:	int           legsAnim, flagAnim, updateangles;
;1822:	float         angle, d;
;1823:
;1824:	// show the flag pole model
;1825:	memset(&pole, 0, sizeof(pole));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1826
;1826:	pole.hModel = cgs.media.flagPoleModel;
ADDRLP4 0+8
ADDRGP4 cgs+148692+88
INDIRI4
ASGNI4
line 1827
;1827:	VectorCopy(torso->lightingOrigin, pole.lightingOrigin);
ADDRLP4 0+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1828
;1828:	pole.shadowPlane = torso->shadowPlane;
ADDRLP4 0+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1829
;1829:	pole.renderfx    = torso->renderfx;
ADDRLP4 0+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1830
;1830:	CG_PositionEntityOnTag(&pole, torso, torso->hModel, "tag_flag");
ADDRLP4 0
ARGP4
ADDRLP4 328
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 328
INDIRP4
ARGP4
ADDRLP4 328
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $438
ARGP4
ADDRGP4 CG_PositionEntityOnTag
CALLV
pop
line 1831
;1831:	trap_R_AddRefEntityToScene(&pole);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1834
;1832:
;1833:	// show the flag model
;1834:	memset(&flag, 0, sizeof(flag));
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1835
;1835:	flag.hModel     = cgs.media.flagFlapModel;
ADDRLP4 140+8
ADDRGP4 cgs+148692+92
INDIRI4
ASGNI4
line 1836
;1836:	flag.customSkin = hSkin;
ADDRLP4 140+108
ADDRFP4 4
INDIRI4
ASGNI4
line 1837
;1837:	VectorCopy(torso->lightingOrigin, flag.lightingOrigin);
ADDRLP4 140+12
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 1838
;1838:	flag.shadowPlane = torso->shadowPlane;
ADDRLP4 140+24
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 1839
;1839:	flag.renderfx    = torso->renderfx;
ADDRLP4 140+4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1841
;1840:
;1841:	VectorClear(angles);
ADDRLP4 280
CNSTF4 0
ASGNF4
ADDRLP4 280+4
CNSTF4 0
ASGNF4
ADDRLP4 280+8
CNSTF4 0
ASGNF4
line 1843
;1842:
;1843:	updateangles = qfalse;
ADDRLP4 312
CNSTI4 0
ASGNI4
line 1844
;1844:	legsAnim     = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 304
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 1845
;1845:	if (legsAnim == LEGS_IDLE || legsAnim == LEGS_IDLECR) {
ADDRLP4 304
INDIRI4
CNSTI4 22
EQI4 $928
ADDRLP4 304
INDIRI4
CNSTI4 23
NEI4 $926
LABELV $928
line 1846
;1846:		flagAnim = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 1847
;1847:	} else if (legsAnim == LEGS_WALK || legsAnim == LEGS_WALKCR) {
ADDRGP4 $927
JUMPV
LABELV $926
ADDRLP4 304
INDIRI4
CNSTI4 14
EQI4 $931
ADDRLP4 304
INDIRI4
CNSTI4 13
NEI4 $929
LABELV $931
line 1848
;1848:		flagAnim     = FLAG_STAND;
ADDRLP4 320
CNSTI4 35
ASGNI4
line 1849
;1849:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 1850
;1850:	} else {
ADDRGP4 $930
JUMPV
LABELV $929
line 1851
;1851:		flagAnim     = FLAG_RUN;
ADDRLP4 320
CNSTI4 34
ASGNI4
line 1852
;1852:		updateangles = qtrue;
ADDRLP4 312
CNSTI4 1
ASGNI4
line 1853
;1853:	}
LABELV $930
LABELV $927
line 1855
;1854:
;1855:	if (updateangles) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $932
line 1857
;1856:
;1857:		VectorCopy(cent->currentState.pos.trDelta, dir);
ADDRLP4 292
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1859
;1858:		// add gravity
;1859:		dir[2] += 100;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1120403456
ADDF4
ASGNF4
line 1860
;1860:		VectorNormalize(dir);
ADDRLP4 292
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 1861
;1861:		d = DotProduct(pole.axis[2], dir);
ADDRLP4 308
ADDRLP4 0+28+24
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+24+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+24+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1863
;1862:		// if there is enough movement orthogonal to the flag pole
;1863:		if (fabs(d) < 0.9) {
ADDRLP4 308
INDIRF4
ARGF4
ADDRLP4 340
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 340
INDIRF4
CNSTF4 1063675494
GEF4 $945
line 1865
;1864:			//
;1865:			d = DotProduct(pole.axis[0], dir);
ADDRLP4 308
ADDRLP4 0+28
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1866
;1866:			if (d > 1.0f) {
ADDRLP4 308
INDIRF4
CNSTF4 1065353216
LEF4 $954
line 1867
;1867:				d = 1.0f;
ADDRLP4 308
CNSTF4 1065353216
ASGNF4
line 1868
;1868:			} else if (d < -1.0f) {
ADDRGP4 $955
JUMPV
LABELV $954
ADDRLP4 308
INDIRF4
CNSTF4 3212836864
GEF4 $956
line 1869
;1869:				d = -1.0f;
ADDRLP4 308
CNSTF4 3212836864
ASGNF4
line 1870
;1870:			}
LABELV $956
LABELV $955
line 1871
;1871:			angle = acos(d);
ADDRLP4 308
INDIRF4
ARGF4
ADDRLP4 344
ADDRGP4 acos
CALLF4
ASGNF4
ADDRLP4 324
ADDRLP4 344
INDIRF4
ASGNF4
line 1873
;1872:
;1873:			d = DotProduct(pole.axis[1], dir);
ADDRLP4 308
ADDRLP4 0+28+12
INDIRF4
ADDRLP4 292
INDIRF4
MULF4
ADDRLP4 0+28+12+4
INDIRF4
ADDRLP4 292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+28+12+8
INDIRF4
ADDRLP4 292+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 1874
;1874:			if (d < 0) {
ADDRLP4 308
INDIRF4
CNSTF4 0
GEF4 $968
line 1875
;1875:				angles[YAW] = 360 - angle * 180 / M_PI;
ADDRLP4 280+4
CNSTF4 1135869952
ADDRLP4 324
INDIRF4
CNSTF4 1113927393
MULF4
SUBF4
ASGNF4
line 1876
;1876:			} else {
ADDRGP4 $969
JUMPV
LABELV $968
line 1877
;1877:				angles[YAW] = angle * 180 / M_PI;
ADDRLP4 280+4
ADDRLP4 324
INDIRF4
CNSTF4 1113927393
MULF4
ASGNF4
line 1878
;1878:			}
LABELV $969
line 1879
;1879:			if (angles[YAW] < 0)
ADDRLP4 280+4
INDIRF4
CNSTF4 0
GEF4 $972
line 1880
;1880:				angles[YAW] += 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $972
line 1881
;1881:			if (angles[YAW] > 360)
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
LEF4 $976
line 1882
;1882:				angles[YAW] -= 360;
ADDRLP4 280+4
ADDRLP4 280+4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $976
line 1887
;1883:
;1884:			// vectoangles( cent->currentState.pos.trDelta, tmpangles );
;1885:			// angles[YAW] = tmpangles[YAW] + 45 - cent->pe.torso.yawAngle;
;1886:			//  change the yaw angle
;1887:			CG_SwingAngles(angles[YAW], 25, 90, 0.15f, &cent->pe.flag.yawAngle, &cent->pe.flag.yawing);
ADDRLP4 280+4
INDIRF4
ARGF4
CNSTF4 1103626240
ARGF4
CNSTF4 1119092736
ARGF4
CNSTF4 1041865114
ARGF4
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 576
ADDP4
ARGP4
ADDRLP4 348
INDIRP4
CNSTI4 580
ADDP4
ARGP4
ADDRGP4 CG_SwingAngles
CALLV
pop
line 1888
;1888:		}
LABELV $945
line 1908
;1889:
;1890:		/*
;1891:		d = DotProduct(pole.axis[2], dir);
;1892:		angle = Q_acos(d);
;1893:
;1894:		d = DotProduct(pole.axis[1], dir);
;1895:		if (d < 0) {
;1896:		    angle = 360 - angle * 180 / M_PI;
;1897:		}
;1898:		else {
;1899:		    angle = angle * 180 / M_PI;
;1900:		}
;1901:		if (angle > 340 && angle < 20) {
;1902:		    flagAnim = FLAG_RUNUP;
;1903:		}
;1904:		if (angle > 160 && angle < 200) {
;1905:		    flagAnim = FLAG_RUNDOWN;
;1906:		}
;1907:		*/
;1908:	}
LABELV $932
line 1911
;1909:
;1910:	// set the yaw angle
;1911:	angles[YAW] = cent->pe.flag.yawAngle;
ADDRLP4 280+4
ADDRFP4 0
INDIRP4
CNSTI4 576
ADDP4
INDIRF4
ASGNF4
line 1913
;1912:	// lerp the flag animation frames
;1913:	ci = &cgs.clientinfo[cent->currentState.clientNum];
ADDRLP4 316
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 1914
;1914:	CG_RunLerpFrame(ci, &cent->pe.flag, flagAnim, 1);
ADDRLP4 316
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
ARGP4
ADDRLP4 320
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_RunLerpFrame
CALLV
pop
line 1915
;1915:	flag.oldframe = cent->pe.flag.oldFrame;
ADDRLP4 140+96
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
ASGNI4
line 1916
;1916:	flag.frame    = cent->pe.flag.frame;
ADDRLP4 140+80
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
ASGNI4
line 1917
;1917:	flag.backlerp = cent->pe.flag.backlerp;
ADDRLP4 140+100
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRF4
ASGNF4
line 1919
;1918:
;1919:	AnglesToAxis(angles, flag.axis);
ADDRLP4 280
ARGP4
ADDRLP4 140+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 1920
;1920:	CG_PositionRotatedEntityOnTag(&flag, &pole, pole.hModel, "tag_flag");
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 $438
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 1922
;1921:
;1922:	trap_R_AddRefEntityToScene(&flag);
ADDRLP4 140
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 1923
;1923:}
LABELV $910
endproc CG_PlayerFlag 352 24
proc CG_PlayerPowerups 12 20
line 1997
;1924:
;1925:#ifdef MISSIONPACK  // bk001204
;1926:/*
;1927:===============
;1928:CG_PlayerTokens
;1929:===============
;1930:*/
;1931:static void CG_PlayerTokens(centity_t* cent, int renderfx) {
;1932:	int           tokens, i, j;
;1933:	float         angle;
;1934:	refEntity_t   ent;
;1935:	vec3_t        dir, origin;
;1936:	skulltrail_t* trail;
;1937:	trail  = &cg.skulltrails[cent->currentState.number];
;1938:	tokens = cent->currentState.generic1;
;1939:	if (!tokens) {
;1940:		trail->numpositions = 0;
;1941:		return;
;1942:	}
;1943:
;1944:	if (tokens > MAX_SKULLTRAIL) {
;1945:		tokens = MAX_SKULLTRAIL;
;1946:	}
;1947:
;1948:	// add skulls if there are more than last time
;1949:	for (i = 0; i < tokens - trail->numpositions; i++) {
;1950:		for (j = trail->numpositions; j > 0; j--) {
;1951:			VectorCopy(trail->positions[j - 1], trail->positions[j]);
;1952:		}
;1953:		VectorCopy(cent->lerpOrigin, trail->positions[0]);
;1954:	}
;1955:	trail->numpositions = tokens;
;1956:
;1957:	// move all the skulls along the trail
;1958:	VectorCopy(cent->lerpOrigin, origin);
;1959:	for (i = 0; i < trail->numpositions; i++) {
;1960:		VectorSubtract(trail->positions[i], origin, dir);
;1961:		if (VectorNormalize(dir) > 30) {
;1962:			VectorMA(origin, 30, dir, trail->positions[i]);
;1963:		}
;1964:		VectorCopy(trail->positions[i], origin);
;1965:	}
;1966:
;1967:	memset(&ent, 0, sizeof(ent));
;1968:	if (cgs.clientinfo[cent->currentState.clientNum].team == TEAM_BLUE) {
;1969:		ent.hModel = cgs.media.redCubeModel;
;1970:	} else {
;1971:		ent.hModel = cgs.media.blueCubeModel;
;1972:	}
;1973:	ent.renderfx = renderfx;
;1974:
;1975:	VectorCopy(cent->lerpOrigin, origin);
;1976:	for (i = 0; i < trail->numpositions; i++) {
;1977:		VectorSubtract(origin, trail->positions[i], ent.axis[0]);
;1978:		ent.axis[0][2] = 0;
;1979:		VectorNormalize(ent.axis[0]);
;1980:		VectorSet(ent.axis[2], 0, 0, 1);
;1981:		CrossProduct(ent.axis[0], ent.axis[2], ent.axis[1]);
;1982:
;1983:		VectorCopy(trail->positions[i], ent.origin);
;1984:		angle = (((cg.time + 500 * MAX_SKULLTRAIL - 500 * i) / 16) & 255) * (M_PI * 2) / 255;
;1985:		ent.origin[2] += sin(angle) * 10;
;1986:		trap_R_AddRefEntityToScene(&ent);
;1987:		VectorCopy(trail->positions[i], origin);
;1988:	}
;1989:}
;1990:#endif
;1991:
;1992:/*
;1993:===============
;1994:CG_PlayerPowerups
;1995:===============
;1996:*/
;1997:static void CG_PlayerPowerups(centity_t* cent, refEntity_t* torso) {
line 2001
;1998:	int           powerups;
;1999:	clientInfo_t* ci;
;2000:
;2001:	powerups = cent->currentState.powerups;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 2002
;2002:	if (!powerups) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $989
line 2003
;2003:		return;
ADDRGP4 $988
JUMPV
LABELV $989
line 2007
;2004:	}
;2005:
;2006:	// quad gives a dlight
;2007:	if (powerups & (1 << PW_QUAD)) {
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $991
line 2008
;2008:		if (cgs.clientinfo[cent->currentState.clientNum].team == TEAM_RED) {
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $993
line 2009
;2009:			trap_R_AddLightToScene(cent->lerpOrigin, (POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD)), 1.0f, 0.2f, 0.2f);
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2010
;2010:		} else {
ADDRGP4 $994
JUMPV
LABELV $993
line 2011
;2011:			trap_R_AddLightToScene(cent->lerpOrigin, (POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD)), 0.2f, 0.2f, 1.0f);
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2012
;2012:		}
LABELV $994
line 2013
;2013:	}
LABELV $991
line 2016
;2014:
;2015:	// flight plays a looped sound
;2016:	if (powerups & (1 << PW_FLIGHT)) {
ADDRLP4 0
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $997
line 2017
;2017:		trap_S_AddLoopingSound(cent->currentState.number, cent->lerpOrigin, vec3_origin, cgs.media.flightSound);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 cgs+148692+824
INDIRI4
ARGI4
ADDRGP4 trap_S_AddLoopingSound
CALLV
pop
line 2018
;2018:	}
LABELV $997
line 2020
;2019:
;2020:	ci = &cgs.clientinfo[cent->currentState.clientNum];
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2022
;2021:	// redflag
;2022:	if (powerups & (1 << PW_REDFLAG)) {
ADDRLP4 0
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $1002
line 2023
;2023:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1004
line 2024
;2024:			CG_PlayerFlag(cent, cgs.media.redFlagFlapSkin, torso);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+96
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2025
;2025:		} else {
ADDRGP4 $1005
JUMPV
LABELV $1004
line 2026
;2026:			CG_TrailItem(cent, cgs.media.redFlagModel);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+36
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2027
;2027:		}
LABELV $1005
line 2028
;2028:		trap_R_AddLightToScene(cent->lerpOrigin, (POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD)), 1.0f, 0.2f, 0.2f);
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2029
;2029:	}
LABELV $1002
line 2032
;2030:
;2031:	// blueflag
;2032:	if (powerups & (1 << PW_BLUEFLAG)) {
ADDRLP4 0
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $1010
line 2033
;2033:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1012
line 2034
;2034:			CG_PlayerFlag(cent, cgs.media.blueFlagFlapSkin, torso);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+100
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2035
;2035:		} else {
ADDRGP4 $1013
JUMPV
LABELV $1012
line 2036
;2036:			CG_TrailItem(cent, cgs.media.blueFlagModel);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+40
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2037
;2037:		}
LABELV $1013
line 2038
;2038:		trap_R_AddLightToScene(cent->lerpOrigin, (POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD)), 0.2f, 0.2f, 1.0f);
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1045220557
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2039
;2039:	}
LABELV $1010
line 2042
;2040:
;2041:	// neutralflag
;2042:	if (powerups & (1 << PW_NEUTRALFLAG)) {
ADDRLP4 0
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $1018
line 2043
;2043:		if (ci->newAnims) {
ADDRLP4 4
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1020
line 2044
;2044:			CG_PlayerFlag(cent, cgs.media.neutralFlagFlapSkin, torso);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+104
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_PlayerFlag
CALLV
pop
line 2045
;2045:		} else {
ADDRGP4 $1021
JUMPV
LABELV $1020
line 2046
;2046:			CG_TrailItem(cent, cgs.media.neutralFlagModel);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+44
INDIRI4
ARGI4
ADDRGP4 CG_TrailItem
CALLV
pop
line 2047
;2047:		}
LABELV $1021
line 2048
;2048:		trap_R_AddLightToScene(cent->lerpOrigin, (POWERUP_GLOW_RADIUS + (rand() & POWERUP_GLOW_RADIUS_MOD)), 1.0f, 1.0f, 1.0f);
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 31
BANDI4
CNSTI4 200
ADDI4
CVIF4 4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_R_AddLightToScene
CALLV
pop
line 2049
;2049:	}
LABELV $1018
line 2052
;2050:
;2051:	// haste leaves smoke trails
;2052:	if (powerups & (1 << PW_HASTE)) {
ADDRLP4 0
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1026
line 2053
;2053:		CG_HasteTrail(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_HasteTrail
CALLV
pop
line 2054
;2054:	}
LABELV $1026
line 2055
;2055:}
LABELV $988
endproc CG_PlayerPowerups 12 20
proc CG_PlayerFloatSprite 144 12
line 2064
;2056:
;2057:/*
;2058:===============
;2059:CG_PlayerFloatSprite
;2060:
;2061:Float a sprite over the player's head
;2062:===============
;2063:*/
;2064:static void CG_PlayerFloatSprite(const centity_t* cent, qhandle_t shader) {
line 2068
;2065:	int         rf;
;2066:	refEntity_t ent;
;2067:
;2068:	if (cent->currentState.number == cg.snap->ps.clientNum && !cg.renderingThirdPerson) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1029
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $1029
line 2069
;2069:		rf = RF_THIRD_PERSON;  // only show in mirrors
ADDRLP4 140
CNSTI4 2
ASGNI4
line 2070
;2070:	} else {
ADDRGP4 $1030
JUMPV
LABELV $1029
line 2071
;2071:		rf = 0;
ADDRLP4 140
CNSTI4 0
ASGNI4
line 2072
;2072:	}
LABELV $1030
line 2074
;2073:
;2074:	memset(&ent, 0, sizeof(ent));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2075
;2075:	VectorCopy(cent->lerpOrigin, ent.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2076
;2076:	ent.origin[2] += 48;
ADDRLP4 0+68+8
ADDRLP4 0+68+8
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 2077
;2077:	ent.reType        = RT_SPRITE;
ADDRLP4 0
CNSTI4 2
ASGNI4
line 2078
;2078:	ent.customShader  = shader;
ADDRLP4 0+112
ADDRFP4 4
INDIRI4
ASGNI4
line 2079
;2079:	ent.radius        = 10;
ADDRLP4 0+132
CNSTF4 1092616192
ASGNF4
line 2080
;2080:	ent.renderfx      = rf;
ADDRLP4 0+4
ADDRLP4 140
INDIRI4
ASGNI4
line 2081
;2081:	ent.shaderRGBA[0] = 255;
ADDRLP4 0+116
CNSTU1 255
ASGNU1
line 2082
;2082:	ent.shaderRGBA[1] = 255;
ADDRLP4 0+116+1
CNSTU1 255
ASGNU1
line 2083
;2083:	ent.shaderRGBA[2] = 255;
ADDRLP4 0+116+2
CNSTU1 255
ASGNU1
line 2084
;2084:	ent.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 2085
;2085:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2086
;2086:}
LABELV $1028
endproc CG_PlayerFloatSprite 144 12
proc CG_PlayerSprites 4 8
line 2095
;2087:
;2088:/*
;2089:===============
;2090:CG_PlayerSprites
;2091:
;2092:Float sprites over the player's head
;2093:===============
;2094:*/
;2095:static void CG_PlayerSprites(centity_t* cent) {
line 2098
;2096:	int team;
;2097:
;2098:	if (cent->currentState.eFlags & EF_CONNECTION) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1047
line 2099
;2099:		CG_PlayerFloatSprite(cent, cgs.media.connectionShader);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+208
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2100
;2100:		return;
ADDRGP4 $1046
JUMPV
LABELV $1047
line 2103
;2101:	}
;2102:
;2103:	if (cent->currentState.eFlags & EF_TALK) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1051
line 2104
;2104:		CG_PlayerFloatSprite(cent, cgs.media.balloonShader);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+204
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2105
;2105:		return;
ADDRGP4 $1046
JUMPV
LABELV $1051
line 2108
;2106:	}
;2107:
;2108:	if (cent->currentState.eFlags & EF_AWARD_IMPRESSIVE) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $1055
line 2109
;2109:		CG_PlayerFloatSprite(cent, cgs.media.medalImpressive);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+492
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2110
;2110:		return;
ADDRGP4 $1046
JUMPV
LABELV $1055
line 2113
;2111:	}
;2112:
;2113:	if (cent->currentState.eFlags & EF_AWARD_EXCELLENT) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $1059
line 2114
;2114:		CG_PlayerFloatSprite(cent, cgs.media.medalExcellent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+496
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2115
;2115:		return;
ADDRGP4 $1046
JUMPV
LABELV $1059
line 2118
;2116:	}
;2117:
;2118:	if (cent->currentState.eFlags & EF_AWARD_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1063
line 2119
;2119:		CG_PlayerFloatSprite(cent, cgs.media.medalGauntlet);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+500
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2120
;2120:		return;
ADDRGP4 $1046
JUMPV
LABELV $1063
line 2123
;2121:	}
;2122:
;2123:	if (cent->currentState.eFlags & EF_AWARD_DEFEND) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $1067
line 2124
;2124:		CG_PlayerFloatSprite(cent, cgs.media.medalDefend);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+504
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2125
;2125:		return;
ADDRGP4 $1046
JUMPV
LABELV $1067
line 2128
;2126:	}
;2127:
;2128:	if (cent->currentState.eFlags & EF_AWARD_ASSIST) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $1071
line 2129
;2129:		CG_PlayerFloatSprite(cent, cgs.media.medalAssist);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+508
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2130
;2130:		return;
ADDRGP4 $1046
JUMPV
LABELV $1071
line 2133
;2131:	}
;2132:
;2133:	if (cent->currentState.eFlags & EF_AWARD_CAP) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $1075
line 2134
;2134:		CG_PlayerFloatSprite(cent, cgs.media.medalCapture);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+512
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2135
;2135:		return;
ADDRGP4 $1046
JUMPV
LABELV $1075
line 2138
;2136:	}
;2137:
;2138:	team = cgs.clientinfo[cent->currentState.clientNum].team;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
ASGNI4
line 2139
;2139:	if (!(cent->currentState.eFlags & EF_DEAD) && cg.snap->ps.persistant[PERS_TEAM] == team && cgs.gametype >= GT_TEAM) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1081
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1081
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $1081
line 2140
;2140:		if (cg_drawFriend.integer) {
ADDRGP4 cg_drawFriend+12
INDIRI4
CNSTI4 0
EQI4 $1046
line 2141
;2141:			CG_PlayerFloatSprite(cent, cgs.media.friendShader);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 cgs+148692+200
INDIRI4
ARGI4
ADDRGP4 CG_PlayerFloatSprite
CALLV
pop
line 2142
;2142:		}
line 2143
;2143:		return;
LABELV $1081
line 2145
;2144:	}
;2145:}
LABELV $1046
endproc CG_PlayerSprites 4 8
data
align 4
LABELV $1091
byte 4 3245342720
byte 4 3245342720
byte 4 0
align 4
LABELV $1092
byte 4 1097859072
byte 4 1097859072
byte 4 1073741824
code
proc CG_PlayerShadow 100 44
line 2157
;2146:
;2147:/*
;2148:===============
;2149:CG_PlayerShadow
;2150:
;2151:Returns the Z component of the surface being shadowed
;2152:
;2153:  should it return a full plane instead of a Z?
;2154:===============
;2155:*/
;2156:#define SHADOW_DISTANCE 128
;2157:static qboolean CG_PlayerShadow(centity_t* cent, float* shadowPlane) {
line 2158
;2158:	vec3_t  end, mins = {-15, -15, 0}, maxs = {15, 15, 2};
ADDRLP4 72
ADDRGP4 $1091
INDIRB
ASGNB 12
ADDRLP4 84
ADDRGP4 $1092
INDIRB
ASGNB 12
line 2162
;2159:	trace_t trace;
;2160:	float   alpha;
;2161:
;2162:	*shadowPlane = 0;
ADDRFP4 4
INDIRP4
CNSTF4 0
ASGNF4
line 2164
;2163:
;2164:	if (cg_shadows.integer == 0) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1093
line 2165
;2165:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1090
JUMPV
LABELV $1093
line 2169
;2166:	}
;2167:
;2168:	// no shadows when invisible
;2169:	if (cent->currentState.powerups & (1 << PW_INVIS)) {
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1096
line 2170
;2170:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1090
JUMPV
LABELV $1096
line 2174
;2171:	}
;2172:
;2173:	// send a trace down from the player to the ground
;2174:	VectorCopy(cent->lerpOrigin, end);
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2175
;2175:	end[2] -= SHADOW_DISTANCE;
ADDRLP4 60+8
ADDRLP4 60+8
INDIRF4
CNSTF4 1124073472
SUBF4
ASGNF4
line 2177
;2176:
;2177:	trap_CM_BoxTrace(&trace, cent->lerpOrigin, end, mins, maxs, 0, MASK_PLAYERSOLID);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 0
ARGI4
CNSTI4 33619969
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2180
;2178:
;2179:	// no shadow if too high
;2180:	if (trace.fraction == 1.0 || trace.startsolid || trace.allsolid) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $1104
ADDRLP4 0+4
INDIRI4
CNSTI4 0
NEI4 $1104
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1099
LABELV $1104
line 2181
;2181:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1090
JUMPV
LABELV $1099
line 2184
;2182:	}
;2183:
;2184:	*shadowPlane = trace.endpos[2] + 1;
ADDRFP4 4
INDIRP4
ADDRLP4 0+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2186
;2185:
;2186:	if (cg_shadows.integer != 1) {  // no mark for stencil or projection shadows
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 1
EQI4 $1107
line 2187
;2187:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1090
JUMPV
LABELV $1107
line 2191
;2188:	}
;2189:
;2190:	// fade the shadow out with height
;2191:	alpha = 1.0 - trace.fraction;
ADDRLP4 56
CNSTF4 1065353216
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 2198
;2192:
;2193:	// bk0101022 - hack / FPE - bogus planes?
;2194:	// assert( DotProduct( trace.plane.normal, trace.plane.normal ) != 0.0f )
;2195:
;2196:	// add the mark as a temporary, so it goes directly to the renderer
;2197:	// without taking a spot in the cg_marks array
;2198:	CG_ImpactMark(cgs.media.shadowMarkShader, trace.endpos, trace.plane.normal, cent->pe.legs.yawAngle, alpha, alpha, alpha, 1, qfalse, 24, qtrue);
ADDRGP4 cgs+148692+344
INDIRI4
ARGI4
ADDRLP4 0+12
ARGP4
ADDRLP4 0+24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 56
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTI4 0
ARGI4
CNSTF4 1103101952
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_ImpactMark
CALLV
pop
line 2200
;2199:
;2200:	return qtrue;
CNSTI4 1
RETI4
LABELV $1090
endproc CG_PlayerShadow 100 44
proc CG_PlayerSplash 188 28
line 2210
;2201:}
;2202:
;2203:/*
;2204:===============
;2205:CG_PlayerSplash
;2206:
;2207:Draw a mark at the water surface
;2208:===============
;2209:*/
;2210:static void CG_PlayerSplash(const centity_t* cent) {
line 2216
;2211:	vec3_t     start, end;
;2212:	trace_t    trace;
;2213:	int        contents;
;2214:	polyVert_t verts[4];
;2215:
;2216:	if (!cg_shadows.integer) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 0
NEI4 $1116
line 2217
;2217:		return;
ADDRGP4 $1115
JUMPV
LABELV $1116
line 2220
;2218:	}
;2219:
;2220:	VectorCopy(cent->lerpOrigin, end);
ADDRLP4 164
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2221
;2221:	end[2] -= 24;
ADDRLP4 164+8
ADDRLP4 164+8
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 2225
;2222:
;2223:	// if the feet aren't in liquid, don't make a mark
;2224:	// this won't handle moving water brushes, but they wouldn't draw right anyway...
;2225:	contents = CG_PointContents(end, 0);
ADDRLP4 164
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 180
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 176
ADDRLP4 180
INDIRI4
ASGNI4
line 2226
;2226:	if (!(contents & (CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA))) {
ADDRLP4 176
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $1120
line 2227
;2227:		return;
ADDRGP4 $1115
JUMPV
LABELV $1120
line 2230
;2228:	}
;2229:
;2230:	VectorCopy(cent->lerpOrigin, start);
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2231
;2231:	start[2] += 32;
ADDRLP4 152+8
ADDRLP4 152+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2234
;2232:
;2233:	// if the head isn't out of liquid, don't make a mark
;2234:	contents = CG_PointContents(start, 0);
ADDRLP4 152
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 184
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 176
ADDRLP4 184
INDIRI4
ASGNI4
line 2235
;2235:	if (contents & (CONTENTS_SOLID | CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA)) {
ADDRLP4 176
INDIRI4
CNSTI4 57
BANDI4
CNSTI4 0
EQI4 $1123
line 2236
;2236:		return;
ADDRGP4 $1115
JUMPV
LABELV $1123
line 2240
;2237:	}
;2238:
;2239:	// trace down to find the surface
;2240:	trap_CM_BoxTrace(&trace, start, end, NULL, NULL, 0, (CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA));
ADDRLP4 96
ARGP4
ADDRLP4 152
ARGP4
ADDRLP4 164
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 trap_CM_BoxTrace
CALLV
pop
line 2242
;2241:
;2242:	if (trace.fraction == 1.0) {
ADDRLP4 96+8
INDIRF4
CNSTF4 1065353216
NEF4 $1125
line 2243
;2243:		return;
ADDRGP4 $1115
JUMPV
LABELV $1125
line 2247
;2244:	}
;2245:
;2246:	// create a mark polygon
;2247:	VectorCopy(trace.endpos, verts[0].xyz);
ADDRLP4 0
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2248
;2248:	verts[0].xyz[0] -= 32;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2249
;2249:	verts[0].xyz[1] -= 32;
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2250
;2250:	verts[0].st[0]       = 0;
ADDRLP4 0+12
CNSTF4 0
ASGNF4
line 2251
;2251:	verts[0].st[1]       = 0;
ADDRLP4 0+12+4
CNSTF4 0
ASGNF4
line 2252
;2252:	verts[0].modulate[0] = 255;
ADDRLP4 0+20
CNSTU1 255
ASGNU1
line 2253
;2253:	verts[0].modulate[1] = 255;
ADDRLP4 0+20+1
CNSTU1 255
ASGNU1
line 2254
;2254:	verts[0].modulate[2] = 255;
ADDRLP4 0+20+2
CNSTU1 255
ASGNU1
line 2255
;2255:	verts[0].modulate[3] = 255;
ADDRLP4 0+20+3
CNSTU1 255
ASGNU1
line 2257
;2256:
;2257:	VectorCopy(trace.endpos, verts[1].xyz);
ADDRLP4 0+24
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2258
;2258:	verts[1].xyz[0] -= 32;
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2259
;2259:	verts[1].xyz[1] += 32;
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2260
;2260:	verts[1].st[0]       = 0;
ADDRLP4 0+24+12
CNSTF4 0
ASGNF4
line 2261
;2261:	verts[1].st[1]       = 1;
ADDRLP4 0+24+12+4
CNSTF4 1065353216
ASGNF4
line 2262
;2262:	verts[1].modulate[0] = 255;
ADDRLP4 0+24+20
CNSTU1 255
ASGNU1
line 2263
;2263:	verts[1].modulate[1] = 255;
ADDRLP4 0+24+20+1
CNSTU1 255
ASGNU1
line 2264
;2264:	verts[1].modulate[2] = 255;
ADDRLP4 0+24+20+2
CNSTU1 255
ASGNU1
line 2265
;2265:	verts[1].modulate[3] = 255;
ADDRLP4 0+24+20+3
CNSTU1 255
ASGNU1
line 2267
;2266:
;2267:	VectorCopy(trace.endpos, verts[2].xyz);
ADDRLP4 0+48
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2268
;2268:	verts[2].xyz[0] += 32;
ADDRLP4 0+48
ADDRLP4 0+48
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2269
;2269:	verts[2].xyz[1] += 32;
ADDRLP4 0+48+4
ADDRLP4 0+48+4
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2270
;2270:	verts[2].st[0]       = 1;
ADDRLP4 0+48+12
CNSTF4 1065353216
ASGNF4
line 2271
;2271:	verts[2].st[1]       = 1;
ADDRLP4 0+48+12+4
CNSTF4 1065353216
ASGNF4
line 2272
;2272:	verts[2].modulate[0] = 255;
ADDRLP4 0+48+20
CNSTU1 255
ASGNU1
line 2273
;2273:	verts[2].modulate[1] = 255;
ADDRLP4 0+48+20+1
CNSTU1 255
ASGNU1
line 2274
;2274:	verts[2].modulate[2] = 255;
ADDRLP4 0+48+20+2
CNSTU1 255
ASGNU1
line 2275
;2275:	verts[2].modulate[3] = 255;
ADDRLP4 0+48+20+3
CNSTU1 255
ASGNU1
line 2277
;2276:
;2277:	VectorCopy(trace.endpos, verts[3].xyz);
ADDRLP4 0+72
ADDRLP4 96+12
INDIRB
ASGNB 12
line 2278
;2278:	verts[3].xyz[0] += 32;
ADDRLP4 0+72
ADDRLP4 0+72
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 2279
;2279:	verts[3].xyz[1] -= 32;
ADDRLP4 0+72+4
ADDRLP4 0+72+4
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 2280
;2280:	verts[3].st[0]       = 1;
ADDRLP4 0+72+12
CNSTF4 1065353216
ASGNF4
line 2281
;2281:	verts[3].st[1]       = 0;
ADDRLP4 0+72+12+4
CNSTF4 0
ASGNF4
line 2282
;2282:	verts[3].modulate[0] = 255;
ADDRLP4 0+72+20
CNSTU1 255
ASGNU1
line 2283
;2283:	verts[3].modulate[1] = 255;
ADDRLP4 0+72+20+1
CNSTU1 255
ASGNU1
line 2284
;2284:	verts[3].modulate[2] = 255;
ADDRLP4 0+72+20+2
CNSTU1 255
ASGNU1
line 2285
;2285:	verts[3].modulate[3] = 255;
ADDRLP4 0+72+20+3
CNSTU1 255
ASGNU1
line 2287
;2286:
;2287:	trap_R_AddPolyToScene(cgs.media.wakeMarkShader, 4, verts);
ADDRGP4 cgs+148692+368
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_AddPolyToScene
CALLV
pop
line 2288
;2288:}
LABELV $1115
endproc CG_PlayerSplash 188 28
export CG_AddRefEntityWithPowerups
proc CG_AddRefEntityWithPowerups 0 4
line 2298
;2289:
;2290:/*
;2291:===============
;2292:CG_AddRefEntityWithPowerups
;2293:
;2294:Adds a piece with modifications or duplications for powerups
;2295:Also called by CG_Missile for quad rockets, but nobody can tell...
;2296:===============
;2297:*/
;2298:void CG_AddRefEntityWithPowerups(refEntity_t* ent, entityState_t* state, int team) {
line 2300
;2299:
;2300:	if (state->powerups & (1 << PW_INVIS)) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1206
line 2301
;2301:		ent->customShader = cgs.media.invisShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+404
INDIRI4
ASGNI4
line 2302
;2302:		trap_R_AddRefEntityToScene(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2303
;2303:	} else {
ADDRGP4 $1207
JUMPV
LABELV $1206
line 2313
;2304:		/*
;2305:		if ( state->eFlags & EF_KAMIKAZE ) {
;2306:		    if (team == TEAM_BLUE)
;2307:		        ent->customShader = cgs.media.blueKamikazeShader;
;2308:		    else
;2309:		        ent->customShader = cgs.media.redKamikazeShader;
;2310:		    trap_R_AddRefEntityToScene( ent );
;2311:		}
;2312:		else {*/
;2313:		trap_R_AddRefEntityToScene(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2316
;2314:		//}
;2315:
;2316:		if (state->powerups & (1 << PW_QUAD)) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1210
line 2317
;2317:			if (team == TEAM_RED)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $1212
line 2318
;2318:				ent->customShader = cgs.media.redQuadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+396
INDIRI4
ASGNI4
ADDRGP4 $1213
JUMPV
LABELV $1212
line 2320
;2319:			else
;2320:				ent->customShader = cgs.media.quadShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+392
INDIRI4
ASGNI4
LABELV $1213
line 2321
;2321:			trap_R_AddRefEntityToScene(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2322
;2322:		}
LABELV $1210
line 2323
;2323:		if (state->powerups & (1 << PW_REGEN)) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $1218
line 2324
;2324:			if (((cg.time / 100) % 10) == 1) {
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
DIVI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $1220
line 2325
;2325:				ent->customShader = cgs.media.regenShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+408
INDIRI4
ASGNI4
line 2326
;2326:				trap_R_AddRefEntityToScene(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2327
;2327:			}
LABELV $1220
line 2328
;2328:		}
LABELV $1218
line 2329
;2329:		if (state->powerups & (1 << PW_BATTLESUIT)) {
ADDRFP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $1225
line 2330
;2330:			ent->customShader = cgs.media.battleSuitShader;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cgs+148692+412
INDIRI4
ASGNI4
line 2331
;2331:			trap_R_AddRefEntityToScene(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 2332
;2332:		}
LABELV $1225
line 2333
;2333:	}
LABELV $1207
line 2334
;2334:}
LABELV $1205
endproc CG_AddRefEntityWithPowerups 0 4
export CG_LightVerts
proc CG_LightVerts 88 16
line 2341
;2335:
;2336:/*
;2337:=================
;2338:CG_LightVerts
;2339:=================
;2340:*/
;2341:int CG_LightVerts(vec3_t normal, int numVerts, polyVert_t* verts) {
line 2348
;2342:	int    i, j;
;2343:	float  incoming;
;2344:	vec3_t ambientLight;
;2345:	vec3_t lightDir;
;2346:	vec3_t directedLight;
;2347:
;2348:	trap_R_LightForPoint(verts[0].xyz, ambientLight, directedLight, lightDir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_LightForPoint
CALLI4
pop
line 2350
;2349:
;2350:	for (i = 0; i < numVerts; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1233
JUMPV
LABELV $1230
line 2351
;2351:		incoming = DotProduct(normal, lightDir);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 48
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ADDRLP4 48
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
MULF4
ADDF4
ADDRLP4 48
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 2352
;2352:		if (incoming <= 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GTF4 $1236
line 2353
;2353:			verts[i].modulate[0] = ambientLight[0];
ADDRLP4 56
ADDRLP4 12
INDIRF4
ASGNF4
ADDRLP4 60
CNSTF4 1325400064
ASGNF4
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
LTF4 $1239
ADDRLP4 52
ADDRLP4 56
INDIRF4
ADDRLP4 60
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1240
JUMPV
LABELV $1239
ADDRLP4 52
ADDRLP4 56
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1240
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 52
INDIRU4
CVUU1 4
ASGNU1
line 2354
;2354:			verts[i].modulate[1] = ambientLight[1];
ADDRLP4 68
ADDRLP4 12+4
INDIRF4
ASGNF4
ADDRLP4 72
CNSTF4 1325400064
ASGNF4
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
LTF4 $1243
ADDRLP4 64
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1244
JUMPV
LABELV $1243
ADDRLP4 64
ADDRLP4 68
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1244
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 64
INDIRU4
CVUU1 4
ASGNU1
line 2355
;2355:			verts[i].modulate[2] = ambientLight[2];
ADDRLP4 80
ADDRLP4 12+8
INDIRF4
ASGNF4
ADDRLP4 84
CNSTF4 1325400064
ASGNF4
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
LTF4 $1247
ADDRLP4 76
ADDRLP4 80
INDIRF4
ADDRLP4 84
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1248
JUMPV
LABELV $1247
ADDRLP4 76
ADDRLP4 80
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1248
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 76
INDIRU4
CVUU1 4
ASGNU1
line 2356
;2356:			verts[i].modulate[3] = 255;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 2357
;2357:			continue;
ADDRGP4 $1231
JUMPV
LABELV $1236
line 2359
;2358:		}
;2359:		j = (ambientLight[0] + incoming * directedLight[0]);
ADDRLP4 0
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2360
;2360:		if (j > 255) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1249
line 2361
;2361:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2362
;2362:		}
LABELV $1249
line 2363
;2363:		verts[i].modulate[0] = j;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 20
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2365
;2364:
;2365:		j = (ambientLight[1] + incoming * directedLight[1]);
ADDRLP4 0
ADDRLP4 12+4
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2366
;2366:		if (j > 255) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1253
line 2367
;2367:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2368
;2368:		}
LABELV $1253
line 2369
;2369:		verts[i].modulate[1] = j;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 21
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2371
;2370:
;2371:		j = (ambientLight[2] + incoming * directedLight[2]);
ADDRLP4 0
ADDRLP4 12+8
INDIRF4
ADDRLP4 8
INDIRF4
ADDRLP4 36+8
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 2372
;2372:		if (j > 255) {
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $1257
line 2373
;2373:			j = 255;
ADDRLP4 0
CNSTI4 255
ASGNI4
line 2374
;2374:		}
LABELV $1257
line 2375
;2375:		verts[i].modulate[2] = j;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 22
ADDP4
ADDRLP4 0
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 2377
;2376:
;2377:		verts[i].modulate[3] = 255;
ADDRLP4 4
INDIRI4
CNSTI4 24
MULI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTI4 23
ADDP4
CNSTU1 255
ASGNU1
line 2378
;2378:	}
LABELV $1231
line 2350
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1233
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $1230
line 2379
;2379:	return qtrue;
CNSTI4 1
RETI4
LABELV $1229
endproc CG_LightVerts 88 16
export CG_Player
proc CG_Player 484 28
line 2387
;2380:}
;2381:
;2382:/*
;2383:===============
;2384:CG_Player
;2385:===============
;2386:*/
;2387:void CG_Player(centity_t* cent) {
line 2409
;2388:	clientInfo_t* ci;
;2389:	refEntity_t   legs;
;2390:	refEntity_t   torso;
;2391:	refEntity_t   head;
;2392:	int           clientNum;
;2393:	int           renderfx;
;2394:	qboolean      shadow;
;2395:	float         shadowPlane;
;2396:#ifdef MISSIONPACK
;2397:	refEntity_t skull;
;2398:	refEntity_t powerup;
;2399:	int         t;
;2400:	float       c;
;2401:	float       angle;
;2402:	vec3_t      dir, angles;
;2403:#endif
;2404:	qboolean darken;
;2405:
;2406:	// the client number is stored in clientNum.  It can't be derived
;2407:	// from the entity number, because a single client may have
;2408:	// multiple corpses on the level using the same clientinfo
;2409:	clientNum = cent->currentState.clientNum;
ADDRLP4 436
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 2410
;2410:	if ((unsigned)clientNum >= MAX_CLIENTS) {
ADDRLP4 436
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $1260
line 2411
;2411:		CG_Error("Bad clientNum on player entity");
ADDRGP4 $1262
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 2412
;2412:	}
LABELV $1260
line 2413
;2413:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 280
ADDRLP4 436
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2417
;2414:
;2415:	// it is possible to see corpses from disconnected players that may
;2416:	// not have valid clientinfo
;2417:	if (!ci->infoValid) {
ADDRLP4 280
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1264
line 2418
;2418:		return;
ADDRGP4 $1259
JUMPV
LABELV $1264
line 2422
;2419:	}
;2420:
;2421:	// get the player model information
;2422:	renderfx = 0;
ADDRLP4 424
CNSTI4 0
ASGNI4
line 2423
;2423:	if (cent->currentState.number == cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $1266
line 2424
;2424:		if (!cg.renderingThirdPerson) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
NEI4 $1269
line 2425
;2425:			renderfx = RF_THIRD_PERSON;  // only draw in mirrors
ADDRLP4 424
CNSTI4 2
ASGNI4
line 2426
;2426:		} else {
ADDRGP4 $1270
JUMPV
LABELV $1269
line 2427
;2427:			if (cg_cameraMode.integer) {
ADDRGP4 cg_cameraMode+12
INDIRI4
CNSTI4 0
EQI4 $1272
line 2428
;2428:				return;
ADDRGP4 $1259
JUMPV
LABELV $1272
line 2430
;2429:			}
;2430:		}
LABELV $1270
line 2431
;2431:	}
LABELV $1266
line 2433
;2432:
;2433:	if (cg_deadBodyDarken.integer && cent->currentState.eFlags & EF_DEAD)
ADDRGP4 cg_deadBodyDarken+12
INDIRI4
CNSTI4 0
EQI4 $1275
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1275
line 2434
;2434:		darken = qtrue;
ADDRLP4 432
CNSTI4 1
ASGNI4
ADDRGP4 $1276
JUMPV
LABELV $1275
line 2436
;2435:	else
;2436:		darken = qfalse;
ADDRLP4 432
CNSTI4 0
ASGNI4
LABELV $1276
line 2438
;2437:
;2438:	memset(&legs, 0, sizeof(legs));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2439
;2439:	memset(&torso, 0, sizeof(torso));
ADDRLP4 140
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2440
;2440:	memset(&head, 0, sizeof(head));
ADDRLP4 284
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2443
;2441:
;2442:	// get the rotation information
;2443:	CG_PlayerAngles(cent, legs.axis, torso.axis, head.axis);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+28
ARGP4
ADDRLP4 140+28
ARGP4
ADDRLP4 284+28
ARGP4
ADDRGP4 CG_PlayerAngles
CALLV
pop
line 2446
;2444:
;2445:	// get the animation state (after rotation, to allow feet shuffle)
;2446:	CG_PlayerAnimation(cent, &legs.oldframe, &legs.frame, &legs.backlerp, &torso.oldframe, &torso.frame, &torso.backlerp);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+96
ARGP4
ADDRLP4 0+80
ARGP4
ADDRLP4 0+100
ARGP4
ADDRLP4 140+96
ARGP4
ADDRLP4 140+80
ARGP4
ADDRLP4 140+100
ARGP4
ADDRGP4 CG_PlayerAnimation
CALLV
pop
line 2449
;2447:
;2448:	// add the talk baloon or disconnect icon
;2449:	CG_PlayerSprites(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSprites
CALLV
pop
line 2452
;2450:
;2451:	// add the shadow
;2452:	shadow = CG_PlayerShadow(cent, &shadowPlane);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 428
ARGP4
ADDRLP4 444
ADDRGP4 CG_PlayerShadow
CALLI4
ASGNI4
ADDRLP4 440
ADDRLP4 444
INDIRI4
ASGNI4
line 2455
;2453:
;2454:	// add a water splash if partially in and out of water
;2455:	CG_PlayerSplash(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_PlayerSplash
CALLV
pop
line 2457
;2456:
;2457:	if (cg_shadows.integer == 3 && shadow) {
ADDRGP4 cg_shadows+12
INDIRI4
CNSTI4 3
NEI4 $1287
ADDRLP4 440
INDIRI4
CNSTI4 0
EQI4 $1287
line 2458
;2458:		renderfx |= RF_SHADOW_PLANE;
ADDRLP4 424
ADDRLP4 424
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 2459
;2459:	}
LABELV $1287
line 2460
;2460:	renderfx |= RF_LIGHTING_ORIGIN;  // use the same origin for all
ADDRLP4 424
ADDRLP4 424
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 2469
;2461:#ifdef MISSIONPACK
;2462:	if (cgs.gametype == GT_HARVESTER) {
;2463:		CG_PlayerTokens(cent, renderfx);
;2464:	}
;2465:#endif
;2466:	//
;2467:	// add the legs
;2468:	//
;2469:	legs.hModel     = ci->legsModel;
ADDRLP4 0+8
ADDRLP4 280
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 2470
;2470:	legs.customSkin = ci->legsSkin;
ADDRLP4 0+108
ADDRLP4 280
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 2472
;2471:
;2472:	VectorCopy(cent->lerpOrigin, legs.origin);
ADDRLP4 0+68
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2474
;2473:
;2474:	VectorCopy(cent->lerpOrigin, legs.lightingOrigin);
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2475
;2475:	legs.shadowPlane = shadowPlane;
ADDRLP4 0+24
ADDRLP4 428
INDIRF4
ASGNF4
line 2476
;2476:	legs.renderfx    = renderfx;
ADDRLP4 0+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2477
;2477:	VectorCopy(legs.origin, legs.oldorigin);  // don't positionally lerp at all
ADDRLP4 0+84
ADDRLP4 0+68
INDIRB
ASGNB 12
line 2480
;2478:
;2479:	// colored skin
;2480:	if (darken) {
ADDRLP4 432
INDIRI4
CNSTI4 0
EQI4 $1298
line 2481
;2481:		legs.shaderRGBA[0] = 85;
ADDRLP4 0+116
CNSTU1 85
ASGNU1
line 2482
;2482:		legs.shaderRGBA[1] = 85;
ADDRLP4 0+116+1
CNSTU1 85
ASGNU1
line 2483
;2483:		legs.shaderRGBA[2] = 85;
ADDRLP4 0+116+2
CNSTU1 85
ASGNU1
line 2484
;2484:	} else {
ADDRGP4 $1299
JUMPV
LABELV $1298
line 2485
;2485:		legs.shaderRGBA[0] = ci->legsColor[0] * 255;
ADDRLP4 452
ADDRLP4 280
INDIRP4
CNSTI4 1640
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 456
CNSTF4 1325400064
ASGNF4
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
LTF4 $1307
ADDRLP4 448
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1308
JUMPV
LABELV $1307
ADDRLP4 448
ADDRLP4 452
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1308
ADDRLP4 0+116
ADDRLP4 448
INDIRU4
CVUU1 4
ASGNU1
line 2486
;2486:		legs.shaderRGBA[1] = ci->legsColor[1] * 255;
ADDRLP4 464
ADDRLP4 280
INDIRP4
CNSTI4 1644
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 468
CNSTF4 1325400064
ASGNF4
ADDRLP4 464
INDIRF4
ADDRLP4 468
INDIRF4
LTF4 $1312
ADDRLP4 460
ADDRLP4 464
INDIRF4
ADDRLP4 468
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1313
JUMPV
LABELV $1312
ADDRLP4 460
ADDRLP4 464
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1313
ADDRLP4 0+116+1
ADDRLP4 460
INDIRU4
CVUU1 4
ASGNU1
line 2487
;2487:		legs.shaderRGBA[2] = ci->legsColor[2] * 255;
ADDRLP4 476
ADDRLP4 280
INDIRP4
CNSTI4 1648
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 480
CNSTF4 1325400064
ASGNF4
ADDRLP4 476
INDIRF4
ADDRLP4 480
INDIRF4
LTF4 $1317
ADDRLP4 472
ADDRLP4 476
INDIRF4
ADDRLP4 480
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1318
JUMPV
LABELV $1317
ADDRLP4 472
ADDRLP4 476
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1318
ADDRLP4 0+116+2
ADDRLP4 472
INDIRU4
CVUU1 4
ASGNU1
line 2488
;2488:	}
LABELV $1299
line 2489
;2489:	legs.shaderRGBA[3] = 255;
ADDRLP4 0+116+3
CNSTU1 255
ASGNU1
line 2491
;2490:
;2491:	CG_AddRefEntityWithPowerups(&legs, &cent->currentState, ci->team);
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2494
;2492:
;2493:	// if the model failed, allow the default nullmodel to be displayed
;2494:	if (!legs.hModel) {
ADDRLP4 0+8
INDIRI4
CNSTI4 0
NEI4 $1321
line 2495
;2495:		return;
ADDRGP4 $1259
JUMPV
LABELV $1321
line 2501
;2496:	}
;2497:
;2498:	//
;2499:	// add the torso
;2500:	//
;2501:	torso.hModel = ci->torsoModel;
ADDRLP4 140+8
ADDRLP4 280
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 2502
;2502:	if (!torso.hModel) {
ADDRLP4 140+8
INDIRI4
CNSTI4 0
NEI4 $1325
line 2503
;2503:		return;
ADDRGP4 $1259
JUMPV
LABELV $1325
line 2506
;2504:	}
;2505:
;2506:	torso.customSkin = ci->torsoSkin;
ADDRLP4 140+108
ADDRLP4 280
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
ASGNI4
line 2508
;2507:
;2508:	VectorCopy(cent->lerpOrigin, torso.lightingOrigin);
ADDRLP4 140+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2510
;2509:
;2510:	CG_PositionRotatedEntityOnTag(&torso, &legs, ci->legsModel, "tag_torso");
ADDRLP4 140
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1330
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2512
;2511:
;2512:	torso.shadowPlane = shadowPlane;
ADDRLP4 140+24
ADDRLP4 428
INDIRF4
ASGNF4
line 2513
;2513:	torso.renderfx    = renderfx;
ADDRLP4 140+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2516
;2514:
;2515:	// colored skin
;2516:	if (darken) {
ADDRLP4 432
INDIRI4
CNSTI4 0
EQI4 $1333
line 2517
;2517:		torso.shaderRGBA[0] = 85;
ADDRLP4 140+116
CNSTU1 85
ASGNU1
line 2518
;2518:		torso.shaderRGBA[1] = 85;
ADDRLP4 140+116+1
CNSTU1 85
ASGNU1
line 2519
;2519:		torso.shaderRGBA[2] = 85;
ADDRLP4 140+116+2
CNSTU1 85
ASGNU1
line 2520
;2520:	} else {
ADDRGP4 $1334
JUMPV
LABELV $1333
line 2521
;2521:		torso.shaderRGBA[0] = ci->bodyColor[0] * 255;
ADDRLP4 452
ADDRLP4 280
INDIRP4
CNSTI4 1628
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 456
CNSTF4 1325400064
ASGNF4
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
LTF4 $1342
ADDRLP4 448
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1343
JUMPV
LABELV $1342
ADDRLP4 448
ADDRLP4 452
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1343
ADDRLP4 140+116
ADDRLP4 448
INDIRU4
CVUU1 4
ASGNU1
line 2522
;2522:		torso.shaderRGBA[1] = ci->bodyColor[1] * 255;
ADDRLP4 464
ADDRLP4 280
INDIRP4
CNSTI4 1632
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 468
CNSTF4 1325400064
ASGNF4
ADDRLP4 464
INDIRF4
ADDRLP4 468
INDIRF4
LTF4 $1347
ADDRLP4 460
ADDRLP4 464
INDIRF4
ADDRLP4 468
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1348
JUMPV
LABELV $1347
ADDRLP4 460
ADDRLP4 464
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1348
ADDRLP4 140+116+1
ADDRLP4 460
INDIRU4
CVUU1 4
ASGNU1
line 2523
;2523:		torso.shaderRGBA[2] = ci->bodyColor[2] * 255;
ADDRLP4 476
ADDRLP4 280
INDIRP4
CNSTI4 1636
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 480
CNSTF4 1325400064
ASGNF4
ADDRLP4 476
INDIRF4
ADDRLP4 480
INDIRF4
LTF4 $1352
ADDRLP4 472
ADDRLP4 476
INDIRF4
ADDRLP4 480
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1353
JUMPV
LABELV $1352
ADDRLP4 472
ADDRLP4 476
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1353
ADDRLP4 140+116+2
ADDRLP4 472
INDIRU4
CVUU1 4
ASGNU1
line 2524
;2524:	}
LABELV $1334
line 2525
;2525:	torso.shaderRGBA[3] = 255;
ADDRLP4 140+116+3
CNSTU1 255
ASGNU1
line 2527
;2526:
;2527:	CG_AddRefEntityWithPowerups(&torso, &cent->currentState, ci->team);
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2730
;2528:
;2529:#ifdef MISSIONPACK
;2530:	if (cent->currentState.eFlags & EF_KAMIKAZE) {
;2531:
;2532:		memset(&skull, 0, sizeof(skull));
;2533:
;2534:		VectorCopy(cent->lerpOrigin, skull.lightingOrigin);
;2535:		skull.shadowPlane = shadowPlane;
;2536:		skull.renderfx    = renderfx;
;2537:
;2538:		if (cent->currentState.eFlags & EF_DEAD) {
;2539:			// one skull bobbing above the dead body
;2540:			angle = ((cg.time / 7) & 255) * (M_PI * 2) / 255;
;2541:			if (angle > M_PI * 2)
;2542:				angle -= (float)M_PI * 2;
;2543:			dir[0] = sin(angle) * 20;
;2544:			dir[1] = cos(angle) * 20;
;2545:			angle  = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
;2546:			dir[2] = 15 + sin(angle) * 8;
;2547:			VectorAdd(torso.origin, dir, skull.origin);
;2548:
;2549:			dir[2] = 0;
;2550:			VectorCopy(dir, skull.axis[1]);
;2551:			VectorNormalize(skull.axis[1]);
;2552:			VectorSet(skull.axis[2], 0, 0, 1);
;2553:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2554:
;2555:			skull.hModel = cgs.media.kamikazeHeadModel;
;2556:			trap_R_AddRefEntityToScene(&skull);
;2557:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2558:			trap_R_AddRefEntityToScene(&skull);
;2559:		} else {
;2560:			// three skulls spinning around the player
;2561:			angle  = ((cg.time / 4) & 255) * (M_PI * 2) / 255;
;2562:			dir[0] = cos(angle) * 20;
;2563:			dir[1] = sin(angle) * 20;
;2564:			dir[2] = cos(angle) * 20;
;2565:			VectorAdd(torso.origin, dir, skull.origin);
;2566:
;2567:			angles[0] = sin(angle) * 30;
;2568:			angles[1] = (angle * 180 / M_PI) + 90;
;2569:			if (angles[1] > 360)
;2570:				angles[1] -= 360;
;2571:			angles[2] = 0;
;2572:			AnglesToAxis(angles, skull.axis);
;2573:
;2574:			/*
;2575:			dir[2] = 0;
;2576:			VectorInverse(dir);
;2577:			VectorCopy(dir, skull.axis[1]);
;2578:			VectorNormalize(skull.axis[1]);
;2579:			VectorSet(skull.axis[2], 0, 0, 1);
;2580:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2581:			*/
;2582:
;2583:			skull.hModel = cgs.media.kamikazeHeadModel;
;2584:			trap_R_AddRefEntityToScene(&skull);
;2585:			// flip the trail because this skull is spinning in the other direction
;2586:			VectorInverse(skull.axis[1]);
;2587:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2588:			trap_R_AddRefEntityToScene(&skull);
;2589:
;2590:			angle = ((cg.time / 4) & 255) * (M_PI * 2) / 255 + M_PI;
;2591:			if (angle > M_PI * 2)
;2592:				angle -= (float)M_PI * 2;
;2593:			dir[0] = sin(angle) * 20;
;2594:			dir[1] = cos(angle) * 20;
;2595:			dir[2] = cos(angle) * 20;
;2596:			VectorAdd(torso.origin, dir, skull.origin);
;2597:
;2598:			angles[0] = cos(angle - 0.5 * M_PI) * 30;
;2599:			angles[1] = 360 - (angle * 180 / M_PI);
;2600:			if (angles[1] > 360)
;2601:				angles[1] -= 360;
;2602:			angles[2] = 0;
;2603:			AnglesToAxis(angles, skull.axis);
;2604:
;2605:			/*
;2606:			dir[2] = 0;
;2607:			VectorCopy(dir, skull.axis[1]);
;2608:			VectorNormalize(skull.axis[1]);
;2609:			VectorSet(skull.axis[2], 0, 0, 1);
;2610:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2611:			*/
;2612:
;2613:			skull.hModel = cgs.media.kamikazeHeadModel;
;2614:			trap_R_AddRefEntityToScene(&skull);
;2615:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2616:			trap_R_AddRefEntityToScene(&skull);
;2617:
;2618:			angle = ((cg.time / 3) & 255) * (M_PI * 2) / 255 + 0.5 * M_PI;
;2619:			if (angle > M_PI * 2)
;2620:				angle -= (float)M_PI * 2;
;2621:			dir[0] = sin(angle) * 20;
;2622:			dir[1] = cos(angle) * 20;
;2623:			dir[2] = 0;
;2624:			VectorAdd(torso.origin, dir, skull.origin);
;2625:
;2626:			VectorCopy(dir, skull.axis[1]);
;2627:			VectorNormalize(skull.axis[1]);
;2628:			VectorSet(skull.axis[2], 0, 0, 1);
;2629:			CrossProduct(skull.axis[1], skull.axis[2], skull.axis[0]);
;2630:
;2631:			skull.hModel = cgs.media.kamikazeHeadModel;
;2632:			trap_R_AddRefEntityToScene(&skull);
;2633:			skull.hModel = cgs.media.kamikazeHeadTrail;
;2634:			trap_R_AddRefEntityToScene(&skull);
;2635:		}
;2636:	}
;2637:
;2638:	if (cent->currentState.powerups & (1 << PW_GUARD)) {
;2639:		memcpy(&powerup, &torso, sizeof(torso));
;2640:		powerup.hModel     = cgs.media.guardPowerupModel;
;2641:		powerup.frame      = 0;
;2642:		powerup.oldframe   = 0;
;2643:		powerup.customSkin = 0;
;2644:		trap_R_AddRefEntityToScene(&powerup);
;2645:	}
;2646:	if (cent->currentState.powerups & (1 << PW_SCOUT)) {
;2647:		memcpy(&powerup, &torso, sizeof(torso));
;2648:		powerup.hModel     = cgs.media.scoutPowerupModel;
;2649:		powerup.frame      = 0;
;2650:		powerup.oldframe   = 0;
;2651:		powerup.customSkin = 0;
;2652:		trap_R_AddRefEntityToScene(&powerup);
;2653:	}
;2654:	if (cent->currentState.powerups & (1 << PW_DOUBLER)) {
;2655:		memcpy(&powerup, &torso, sizeof(torso));
;2656:		powerup.hModel     = cgs.media.doublerPowerupModel;
;2657:		powerup.frame      = 0;
;2658:		powerup.oldframe   = 0;
;2659:		powerup.customSkin = 0;
;2660:		trap_R_AddRefEntityToScene(&powerup);
;2661:	}
;2662:	if (cent->currentState.powerups & (1 << PW_AMMOREGEN)) {
;2663:		memcpy(&powerup, &torso, sizeof(torso));
;2664:		powerup.hModel     = cgs.media.ammoRegenPowerupModel;
;2665:		powerup.frame      = 0;
;2666:		powerup.oldframe   = 0;
;2667:		powerup.customSkin = 0;
;2668:		trap_R_AddRefEntityToScene(&powerup);
;2669:	}
;2670:	if (cent->currentState.powerups & (1 << PW_INVULNERABILITY)) {
;2671:		if (!ci->invulnerabilityStartTime) {
;2672:			ci->invulnerabilityStartTime = cg.time;
;2673:		}
;2674:		ci->invulnerabilityStopTime = cg.time;
;2675:	} else {
;2676:		ci->invulnerabilityStartTime = 0;
;2677:	}
;2678:	if ((cent->currentState.powerups & (1 << PW_INVULNERABILITY)) || cg.time - ci->invulnerabilityStopTime < 250) {
;2679:
;2680:		memcpy(&powerup, &torso, sizeof(torso));
;2681:		powerup.hModel     = cgs.media.invulnerabilityPowerupModel;
;2682:		powerup.customSkin = 0;
;2683:		// always draw
;2684:		powerup.renderfx &= ~RF_THIRD_PERSON;
;2685:		VectorCopy(cent->lerpOrigin, powerup.origin);
;2686:
;2687:		if (cg.time - ci->invulnerabilityStartTime < 250) {
;2688:			c = (float)(cg.time - ci->invulnerabilityStartTime) / 250;
;2689:		} else if (cg.time - ci->invulnerabilityStopTime < 250) {
;2690:			c = (float)(250 - (cg.time - ci->invulnerabilityStopTime)) / 250;
;2691:		} else {
;2692:			c = 1;
;2693:		}
;2694:		VectorSet(powerup.axis[0], c, 0, 0);
;2695:		VectorSet(powerup.axis[1], 0, c, 0);
;2696:		VectorSet(powerup.axis[2], 0, 0, c);
;2697:		trap_R_AddRefEntityToScene(&powerup);
;2698:	}
;2699:
;2700:	t = cg.time - ci->medkitUsageTime;
;2701:	if (ci->medkitUsageTime && t < 500) {
;2702:		memcpy(&powerup, &torso, sizeof(torso));
;2703:		powerup.hModel     = cgs.media.medkitUsageModel;
;2704:		powerup.customSkin = 0;
;2705:		// always draw
;2706:		powerup.renderfx &= ~RF_THIRD_PERSON;
;2707:		VectorClear(angles);
;2708:		AnglesToAxis(angles, powerup.axis);
;2709:		VectorCopy(cent->lerpOrigin, powerup.origin);
;2710:		powerup.origin[2] += -24 + (float)t * 80 / 500;
;2711:		if (t > 400) {
;2712:			c                     = (float)(t - 1000) * 0xff / 100;
;2713:			powerup.shaderRGBA[0] = 0xff - c;
;2714:			powerup.shaderRGBA[1] = 0xff - c;
;2715:			powerup.shaderRGBA[2] = 0xff - c;
;2716:			powerup.shaderRGBA[3] = 0xff - c;
;2717:		} else {
;2718:			powerup.shaderRGBA[0] = 0xff;
;2719:			powerup.shaderRGBA[1] = 0xff;
;2720:			powerup.shaderRGBA[2] = 0xff;
;2721:			powerup.shaderRGBA[3] = 0xff;
;2722:		}
;2723:		trap_R_AddRefEntityToScene(&powerup);
;2724:	}
;2725:#endif  // MISSIONPACK
;2726:
;2727:	//
;2728:	// add the head
;2729:	//
;2730:	head.hModel = ci->headModel;
ADDRLP4 284+8
ADDRLP4 280
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 2731
;2731:	if (!head.hModel) {
ADDRLP4 284+8
INDIRI4
CNSTI4 0
NEI4 $1357
line 2732
;2732:		return;
ADDRGP4 $1259
JUMPV
LABELV $1357
line 2734
;2733:	}
;2734:	head.customSkin = ci->headSkin;
ADDRLP4 284+108
ADDRLP4 280
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ASGNI4
line 2736
;2735:
;2736:	VectorCopy(cent->lerpOrigin, head.lightingOrigin);
ADDRLP4 284+12
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2738
;2737:
;2738:	CG_PositionRotatedEntityOnTag(&head, &torso, ci->torsoModel, "tag_head");
ADDRLP4 284
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ARGI4
ADDRGP4 $1362
ARGP4
ADDRGP4 CG_PositionRotatedEntityOnTag
CALLV
pop
line 2740
;2739:
;2740:	head.shadowPlane = shadowPlane;
ADDRLP4 284+24
ADDRLP4 428
INDIRF4
ASGNF4
line 2741
;2741:	head.renderfx    = renderfx;
ADDRLP4 284+4
ADDRLP4 424
INDIRI4
ASGNI4
line 2744
;2742:
;2743:	// colored skin
;2744:	if (darken) {
ADDRLP4 432
INDIRI4
CNSTI4 0
EQI4 $1365
line 2745
;2745:		head.shaderRGBA[0] = 85;
ADDRLP4 284+116
CNSTU1 85
ASGNU1
line 2746
;2746:		head.shaderRGBA[1] = 85;
ADDRLP4 284+116+1
CNSTU1 85
ASGNU1
line 2747
;2747:		head.shaderRGBA[2] = 85;
ADDRLP4 284+116+2
CNSTU1 85
ASGNU1
line 2748
;2748:	} else {
ADDRGP4 $1366
JUMPV
LABELV $1365
line 2749
;2749:		head.shaderRGBA[0] = ci->headColor[0] * 255;
ADDRLP4 452
ADDRLP4 280
INDIRP4
CNSTI4 1616
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 456
CNSTF4 1325400064
ASGNF4
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
LTF4 $1374
ADDRLP4 448
ADDRLP4 452
INDIRF4
ADDRLP4 456
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1375
JUMPV
LABELV $1374
ADDRLP4 448
ADDRLP4 452
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1375
ADDRLP4 284+116
ADDRLP4 448
INDIRU4
CVUU1 4
ASGNU1
line 2750
;2750:		head.shaderRGBA[1] = ci->headColor[1] * 255;
ADDRLP4 464
ADDRLP4 280
INDIRP4
CNSTI4 1620
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 468
CNSTF4 1325400064
ASGNF4
ADDRLP4 464
INDIRF4
ADDRLP4 468
INDIRF4
LTF4 $1379
ADDRLP4 460
ADDRLP4 464
INDIRF4
ADDRLP4 468
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1380
JUMPV
LABELV $1379
ADDRLP4 460
ADDRLP4 464
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1380
ADDRLP4 284+116+1
ADDRLP4 460
INDIRU4
CVUU1 4
ASGNU1
line 2751
;2751:		head.shaderRGBA[2] = ci->headColor[2] * 255;
ADDRLP4 476
ADDRLP4 280
INDIRP4
CNSTI4 1624
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 480
CNSTF4 1325400064
ASGNF4
ADDRLP4 476
INDIRF4
ADDRLP4 480
INDIRF4
LTF4 $1384
ADDRLP4 472
ADDRLP4 476
INDIRF4
ADDRLP4 480
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $1385
JUMPV
LABELV $1384
ADDRLP4 472
ADDRLP4 476
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $1385
ADDRLP4 284+116+2
ADDRLP4 472
INDIRU4
CVUU1 4
ASGNU1
line 2752
;2752:	}
LABELV $1366
line 2753
;2753:	head.shaderRGBA[3] = 255;
ADDRLP4 284+116+3
CNSTU1 255
ASGNU1
line 2755
;2754:
;2755:	CG_AddRefEntityWithPowerups(&head, &cent->currentState, ci->team);
ADDRLP4 284
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddRefEntityWithPowerups
CALLV
pop
line 2766
;2756:
;2757:#ifdef MISSIONPACK
;2758:	CG_BreathPuffs(cent, &head);
;2759:
;2760:	CG_DustTrail(cent);
;2761:#endif
;2762:
;2763:	//
;2764:	// add the gun / barrel / flash
;2765:	//
;2766:	CG_AddPlayerWeapon(&torso, NULL, cent, ci->team);
ADDRLP4 140
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_AddPlayerWeapon
CALLV
pop
line 2769
;2767:
;2768:	// add powerups floating behind the player
;2769:	CG_PlayerPowerups(cent, &torso);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ARGP4
ADDRGP4 CG_PlayerPowerups
CALLV
pop
line 2770
;2770:}
LABELV $1259
endproc CG_Player 484 28
export CG_ResetPlayerEntity
proc CG_ResetPlayerEntity 40 12
line 2781
;2771:
;2772://=====================================================================
;2773:
;2774:/*
;2775:===============
;2776:CG_ResetPlayerEntity
;2777:
;2778:A player just came into view or teleported, so reset all animation info
;2779:===============
;2780:*/
;2781:void CG_ResetPlayerEntity(centity_t* cent) {
line 2782
;2782:	cent->errorTime    = -99999;  // guarantee no error decay added
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 -99999
ASGNI4
line 2783
;2783:	cent->extrapolated = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 676
ADDP4
CNSTI4 0
ASGNI4
line 2785
;2784:
;2785:	CG_ClearLerpFrame(&cgs.clientinfo[cent->currentState.clientNum], &cent->pe.legs, cent->currentState.legsAnim);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 2786
;2786:	CG_ClearLerpFrame(&cgs.clientinfo[cent->currentState.clientNum], &cent->pe.torso, cent->currentState.torsoAnim);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ClearLerpFrame
CALLV
pop
line 2788
;2787:
;2788:	BG_EvaluateTrajectory(&cent->currentState.pos, cg.time, cent->lerpOrigin);
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
line 2789
;2789:	BG_EvaluateTrajectory(&cent->currentState.apos, cg.time, cent->lerpAngles);
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
line 2791
;2790:
;2791:	VectorCopy(cent->lerpOrigin, cent->rawOrigin);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 680
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 716
ADDP4
INDIRB
ASGNB 12
line 2792
;2792:	VectorCopy(cent->lerpAngles, cent->rawAngles);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 692
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 728
ADDP4
INDIRB
ASGNB 12
line 2794
;2793:
;2794:	memset(&cent->pe.legs, 0, sizeof(cent->pe.legs));
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2795
;2795:	cent->pe.legs.yawAngle   = cent->rawAngles[YAW];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 480
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ASGNF4
line 2796
;2796:	cent->pe.legs.yawing     = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 484
ADDP4
CNSTI4 0
ASGNI4
line 2797
;2797:	cent->pe.legs.pitchAngle = 0;
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
CNSTF4 0
ASGNF4
line 2798
;2798:	cent->pe.legs.pitching   = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 492
ADDP4
CNSTI4 0
ASGNI4
line 2800
;2799:
;2800:	memset(&cent->pe.torso, 0, sizeof(cent->pe.torso));
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 48
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2801
;2801:	cent->pe.torso.yawAngle   = cent->rawAngles[YAW];
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 528
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 696
ADDP4
INDIRF4
ASGNF4
line 2802
;2802:	cent->pe.torso.yawing     = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 0
ASGNI4
line 2803
;2803:	cent->pe.torso.pitchAngle = cent->rawAngles[PITCH];
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 536
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 692
ADDP4
INDIRF4
ASGNF4
line 2804
;2804:	cent->pe.torso.pitching   = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 540
ADDP4
CNSTI4 0
ASGNI4
line 2806
;2805:
;2806:	if (cg_debugPosition.integer) {
ADDRGP4 cg_debugPosition+12
INDIRI4
CNSTI4 0
EQI4 $1393
line 2807
;2807:		CG_Printf("%i ResetPlayerEntity yaw=%f\n", cent->currentState.number, cent->pe.torso.yawAngle);
ADDRGP4 $1396
ARGP4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRI4
ARGI4
ADDRLP4 36
INDIRP4
CNSTI4 528
ADDP4
INDIRF4
ARGF4
ADDRGP4 CG_Printf
CALLV
pop
line 2808
;2808:	}
LABELV $1393
line 2809
;2809:}
LABELV $1388
endproc CG_ResetPlayerEntity 40 12
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
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
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
LABELV $1396
byte 1 37
byte 1 105
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 61
byte 1 37
byte 1 102
byte 1 10
byte 1 0
align 1
LABELV $1362
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $1330
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $1262
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 117
byte 1 109
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $842
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $773
byte 1 67
byte 1 108
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 108
byte 1 102
byte 1 45
byte 1 62
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $739
byte 1 65
byte 1 110
byte 1 105
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $735
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $730
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 46
byte 1 32
byte 1 32
byte 1 85
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $717
byte 1 77
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 108
byte 1 111
byte 1 119
byte 1 46
byte 1 32
byte 1 85
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $694
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $688
byte 1 116
byte 1 108
byte 1 0
align 1
LABELV $686
byte 1 116
byte 1 116
byte 1 0
align 1
LABELV $668
byte 1 108
byte 1 0
align 1
LABELV $666
byte 1 119
byte 1 0
align 1
LABELV $664
byte 1 104
byte 1 99
byte 1 0
align 1
LABELV $662
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $645
byte 1 99
byte 1 50
byte 1 0
align 1
LABELV $643
byte 1 99
byte 1 49
byte 1 0
align 1
LABELV $639
byte 1 116
byte 1 0
align 1
LABELV $636
byte 1 110
byte 1 0
align 1
LABELV $572
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $548
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $516
byte 1 67
byte 1 71
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 33
byte 1 10
byte 1 0
align 1
LABELV $447
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $438
byte 1 116
byte 1 97
byte 1 103
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $433
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $430
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 95
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 95
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 32
byte 1 47
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $429
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 47
byte 1 112
byte 1 109
byte 1 0
align 1
LABELV $421
byte 1 67
byte 1 71
byte 1 95
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 40
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 41
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $415
byte 1 48
byte 1 0
align 1
LABELV $412
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $381
byte 1 120
byte 1 97
byte 1 101
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $380
byte 1 118
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $379
byte 1 117
byte 1 114
byte 1 105
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $378
byte 1 116
byte 1 97
byte 1 110
byte 1 107
byte 1 106
byte 1 114
byte 1 0
align 1
LABELV $377
byte 1 115
byte 1 111
byte 1 114
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $376
byte 1 115
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $375
byte 1 115
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $374
byte 1 114
byte 1 97
byte 1 122
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $373
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $372
byte 1 111
byte 1 114
byte 1 98
byte 1 98
byte 1 0
align 1
LABELV $371
byte 1 109
byte 1 121
byte 1 110
byte 1 120
byte 1 0
align 1
LABELV $370
byte 1 109
byte 1 97
byte 1 106
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $369
byte 1 108
byte 1 117
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $368
byte 1 107
byte 1 108
byte 1 101
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $367
byte 1 107
byte 1 101
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $366
byte 1 104
byte 1 117
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $365
byte 1 103
byte 1 114
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $364
byte 1 100
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $363
byte 1 99
byte 1 114
byte 1 97
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $362
byte 1 98
byte 1 111
byte 1 110
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $361
byte 1 98
byte 1 105
byte 1 116
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $360
byte 1 98
byte 1 105
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $359
byte 1 97
byte 1 110
byte 1 97
byte 1 114
byte 1 107
byte 1 105
byte 1 0
align 1
LABELV $353
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $350
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $347
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $344
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $341
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $340
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $337
byte 1 83
byte 1 116
byte 1 114
byte 1 111
byte 1 103
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $336
byte 1 80
byte 1 97
byte 1 103
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $335
byte 1 37
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $332
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $323
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $322
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $317
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $314
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $313
byte 1 70
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $310
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $307
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $299
byte 1 72
byte 1 101
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $296
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $293
byte 1 84
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $290
byte 1 117
byte 1 112
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $287
byte 1 76
byte 1 101
byte 1 103
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 117
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $284
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $283
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $263
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $262
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $252
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $238
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $228
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $227
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $219
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $218
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $208
byte 1 0
align 1
LABELV $207
byte 1 112
byte 1 109
byte 1 0
align 1
LABELV $204
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $203
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $189
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $164
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $161
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 111
byte 1 0
align 1
LABELV $158
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $147
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $138
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $135
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $134
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 0
align 1
LABELV $131
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $128
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $125
byte 1 98
byte 1 111
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $121
byte 1 110
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $120
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $115
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $107
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $99
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 32
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $84
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $83
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $82
byte 1 42
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $81
byte 1 42
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $80
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $79
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $78
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $77
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $76
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $75
byte 1 42
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $74
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $73
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $72
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
