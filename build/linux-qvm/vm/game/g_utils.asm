data
export remapCount
align 4
LABELV remapCount
byte 4 0
export AddRemap
code
proc AddRemap 8 8
file "../../../../code/game/g_utils.c"
line 18
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_utils.c -- misc utility functions for game module
;4:
;5:#include "g_local.h"
;6:
;7:typedef struct {
;8:	char  oldShader[MAX_QPATH];
;9:	char  newShader[MAX_QPATH];
;10:	float timeOffset;
;11:} shaderRemap_t;
;12:
;13:#define MAX_SHADER_REMAPS 128
;14:
;15:int           remapCount = 0;
;16:shaderRemap_t remappedShaders[MAX_SHADER_REMAPS];
;17:
;18:void          AddRemap(const char* oldShader, const char* newShader, float timeOffset) {
line 21
;19:			 int i;
;20:
;21:			 for (i = 0; i < remapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $59
JUMPV
LABELV $56
line 22
;22:				 if (Q_stricmp(oldShader, remappedShaders[i].oldShader) == 0) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 132
MULI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $60
line 24
;23:					 // found it, just update this one
;24:            strcpy(remappedShaders[i].newShader, newShader);
ADDRLP4 0
INDIRI4
CNSTI4 132
MULI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 25
;25:            remappedShaders[i].timeOffset = timeOffset;
ADDRLP4 0
INDIRI4
CNSTI4 132
MULI4
ADDRGP4 remappedShaders+128
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 26
;26:            return;
ADDRGP4 $55
JUMPV
LABELV $60
line 28
;27:        }
;28:    }
LABELV $57
line 21
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $59
ADDRLP4 0
INDIRI4
ADDRGP4 remapCount
INDIRI4
LTI4 $56
line 29
;29:			 if (remapCount < MAX_SHADER_REMAPS) {
ADDRGP4 remapCount
INDIRI4
CNSTI4 128
GEI4 $64
line 30
;30:				 strcpy(remappedShaders[remapCount].newShader, newShader);
ADDRGP4 remapCount
INDIRI4
CNSTI4 132
MULI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 31
;31:				 strcpy(remappedShaders[remapCount].oldShader, oldShader);
ADDRGP4 remapCount
INDIRI4
CNSTI4 132
MULI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 32
;32:				 remappedShaders[remapCount].timeOffset = timeOffset;
ADDRGP4 remapCount
INDIRI4
CNSTI4 132
MULI4
ADDRGP4 remappedShaders+128
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 33
;33:				 remapCount++;
ADDRLP4 4
ADDRGP4 remapCount
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 34
;34:    }
LABELV $64
line 35
;35:}
LABELV $55
endproc AddRemap 8 8
bss
align 1
LABELV $69
skip 4096
export BuildShaderStateConfig
code
proc BuildShaderStateConfig 144 24
line 37
;36:
;37:const char* BuildShaderStateConfig(void) {
line 42
;38:	static char buff[MAX_STRING_CHARS * 4];
;39:	char        out[(MAX_QPATH * 2) + 5];
;40:	int         i;
;41:
;42:	memset(buff, 0, sizeof(buff));
ADDRGP4 $69
ARGP4
CNSTI4 0
ARGI4
CNSTI4 4096
ARGI4
ADDRGP4 memset
CALLP4
pop
line 43
;43:	for (i = 0; i < remapCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $73
JUMPV
LABELV $70
line 44
;44:		Com_sprintf(out, (MAX_QPATH * 2) + 5, "%s=%s:%5.2f@", remappedShaders[i].oldShader, remappedShaders[i].newShader, remappedShaders[i].timeOffset);
ADDRLP4 4
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 $74
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 132
MULI4
ADDRGP4 remappedShaders
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 132
MULI4
ADDRGP4 remappedShaders+64
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 132
MULI4
ADDRGP4 remappedShaders+128
ADDP4
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLI4
pop
line 45
;45:		Q_strcat(buff, sizeof(buff), out);
ADDRGP4 $69
ARGP4
CNSTI4 4096
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 46
;46:	}
LABELV $71
line 43
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $73
ADDRLP4 0
INDIRI4
ADDRGP4 remapCount
INDIRI4
LTI4 $70
line 47
;47:	return buff;
ADDRGP4 $69
RETP4
LABELV $68
endproc BuildShaderStateConfig 144 24
export G_FindConfigstringIndex
proc G_FindConfigstringIndex 1036 12
line 64
;48:}
;49:
;50:/*
;51:=========================================================================
;52:
;53:model / sound configstring indexes
;54:
;55:=========================================================================
;56:*/
;57:
;58:/*
;59:================
;60:G_FindConfigstringIndex
;61:
;62:================
;63:*/
;64:int G_FindConfigstringIndex(const char* name, int start, int max, qboolean create) {
line 68
;65:	int  i;
;66:	char s[MAX_STRING_CHARS];
;67:
;68:	if (!name || !name[0]) {
ADDRLP4 1028
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $80
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $78
LABELV $80
line 69
;69:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $77
JUMPV
LABELV $78
line 72
;70:	}
;71:
;72:	for (i = 1; i < max; i++) {
ADDRLP4 1024
CNSTI4 1
ASGNI4
ADDRGP4 $84
JUMPV
LABELV $81
line 73
;73:		trap_GetConfigstring(start + i, s, sizeof(s));
ADDRFP4 4
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 74
;74:		if (!s[0]) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $85
line 75
;75:			break;
ADDRGP4 $83
JUMPV
LABELV $85
line 77
;76:		}
;77:		if (!strcmp(s, name)) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $87
line 78
;78:			return i;
ADDRLP4 1024
INDIRI4
RETI4
ADDRGP4 $77
JUMPV
LABELV $87
line 80
;79:		}
;80:	}
LABELV $82
line 72
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $84
ADDRLP4 1024
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $81
LABELV $83
line 82
;81:
;82:	if (!create) {
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $89
line 83
;83:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $77
JUMPV
LABELV $89
line 86
;84:	}
;85:
;86:	if (i == max) {
ADDRLP4 1024
INDIRI4
ADDRFP4 8
INDIRI4
NEI4 $91
line 87
;87:		G_Error("G_FindConfigstringIndex: overflow");
ADDRGP4 $93
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 88
;88:	}
LABELV $91
line 90
;89:
;90:	trap_SetConfigstring(start + i, name);
ADDRFP4 4
INDIRI4
ADDRLP4 1024
INDIRI4
ADDI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 92
;91:
;92:	return i;
ADDRLP4 1024
INDIRI4
RETI4
LABELV $77
endproc G_FindConfigstringIndex 1036 12
export G_ModelIndex
proc G_ModelIndex 4 16
line 95
;93:}
;94:
;95:int G_ModelIndex(const char* name) {
line 96
;96:	return G_FindConfigstringIndex(name, CS_MODELS, MAX_MODELS, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
CNSTI4 256
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $94
endproc G_ModelIndex 4 16
export G_SoundIndex
proc G_SoundIndex 4 16
line 99
;97:}
;98:
;99:int G_SoundIndex(const char* name) {
line 100
;100:	return G_FindConfigstringIndex(name, CS_SOUNDS, MAX_SOUNDS, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 288
ARGI4
CNSTI4 256
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 G_FindConfigstringIndex
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $95
endproc G_SoundIndex 4 16
export G_TeamCommand
proc G_TeamCommand 4 8
line 112
;101:}
;102:
;103://=====================================================================
;104:
;105:/*
;106:================
;107:G_TeamCommand
;108:
;109:Broadcasts a command to only a specific team
;110:================
;111:*/
;112:void G_TeamCommand(team_t team, const char* cmd) {
line 115
;113:	int i;
;114:
;115:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $100
JUMPV
LABELV $97
line 116
;116:		if (level.clients[i].pers.connected == CON_CONNECTED) {
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $102
line 117
;117:			if (level.clients[i].sess.sessionTeam == team) {
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $104
line 118
;118:				trap_SendServerCommand(i, cmd);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 119
;119:			}
LABELV $104
line 120
;120:		}
LABELV $102
line 121
;121:	}
LABELV $98
line 115
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $100
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $97
line 122
;122:}
LABELV $96
endproc G_TeamCommand 4 8
export G_Find
proc G_Find 12 8
line 136
;123:
;124:/*
;125:=============
;126:G_Find
;127:
;128:Searches all active entities for the next one that holds
;129:the matching string at fieldofs (use the FOFS() macro) in the structure.
;130:
;131:Searches beginning at the entity after from, or the beginning if NULL
;132:NULL will be returned if the end of the list is reached.
;133:
;134:=============
;135:*/
;136:gentity_t* G_Find(gentity_t* from, int fieldofs, const char* match) {
line 140
;137:	const gentity_t* to;
;138:	char*            s;
;139:
;140:	if (!from)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $107
line 141
;141:		from = g_entities;
ADDRFP4 0
ADDRGP4 g_entities
ASGNP4
ADDRGP4 $108
JUMPV
LABELV $107
line 143
;142:	else
;143:		from++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ASGNP4
LABELV $108
line 145
;144:
;145:	to = &g_entities[level.num_entities];
ADDRLP4 4
ADDRGP4 level+12
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 147
;146:
;147:	for (; from < to; from++) {
ADDRGP4 $113
JUMPV
LABELV $110
line 148
;148:		if (!from->inuse)
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $114
line 149
;149:			continue;
ADDRGP4 $111
JUMPV
LABELV $114
line 150
;150:		s = *(char**)((byte*)from + fieldofs);
ADDRLP4 0
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 151
;151:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $116
line 152
;152:			continue;
ADDRGP4 $111
JUMPV
LABELV $116
line 153
;153:		if (!Q_stricmp(s, match))
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $118
line 154
;154:			return from;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $106
JUMPV
LABELV $118
line 155
;155:	}
LABELV $111
line 147
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 816
ADDP4
ASGNP4
LABELV $113
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
LTU4 $110
line 157
;156:
;157:	return NULL;
CNSTP4 0
RETP4
LABELV $106
endproc G_Find 12 8
export G_PickTarget
proc G_PickTarget 144 12
line 169
;158:}
;159:
;160:/*
;161:=============
;162:G_PickTarget
;163:
;164:Selects a random entity from among the targets
;165:=============
;166:*/
;167:#define MAXCHOICES 32
;168:
;169:gentity_t* G_PickTarget(const char* targetname) {
line 174
;170:	gentity_t* choice[MAXCHOICES];
;171:	gentity_t* ent;
;172:	int        num_choices;
;173:
;174:	if (!targetname) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $121
line 175
;175:		G_Printf("G_PickTarget called with NULL targetname\n");
ADDRGP4 $123
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 176
;176:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $120
JUMPV
LABELV $121
line 179
;177:	}
;178:
;179:	ent         = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 180
;180:	num_choices = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $125
JUMPV
LABELV $124
line 181
;181:	while (1) {
line 182
;182:		ent = G_Find(ent, FOFS(targetname), targetname);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 652
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 136
INDIRP4
ASGNP4
line 183
;183:		if (!ent)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $127
line 184
;184:			break;
ADDRGP4 $126
JUMPV
LABELV $127
line 185
;185:		choice[num_choices++] = ent;
ADDRLP4 140
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 186
;186:		if (num_choices >= MAXCHOICES)
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $129
line 187
;187:			break;
ADDRGP4 $126
JUMPV
LABELV $129
line 188
;188:	}
LABELV $125
line 181
ADDRGP4 $124
JUMPV
LABELV $126
line 190
;189:
;190:	if (!num_choices) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $131
line 191
;191:		G_Printf("G_PickTarget: target %s not found\n", targetname);
ADDRGP4 $133
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 192
;192:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $120
JUMPV
LABELV $131
line 195
;193:	}
;194:
;195:	return choice[rand() % num_choices];
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
ADDRLP4 4
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
RETP4
LABELV $120
endproc G_PickTarget 144 12
export G_UseTargets
proc G_UseTargets 20 12
line 209
;196:}
;197:
;198:/*
;199:==============================
;200:G_UseTargets
;201:
;202:"activator" should be set to the entity that initiated the firing.
;203:
;204:Search for (string)targetname in all entities that
;205:match (string)self.target and call their .use function
;206:
;207:==============================
;208:*/
;209:void G_UseTargets(gentity_t* ent, gentity_t* activator) {
line 213
;210:	gentity_t* t;
;211:	float      f;
;212:
;213:	if (!ent) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $135
line 214
;214:		return;
ADDRGP4 $134
JUMPV
LABELV $135
line 217
;215:	}
;216:
;217:	if (ent->targetShaderName && ent->targetShaderNewName) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $137
ADDRLP4 8
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $137
line 218
;218:		f = level.time * 0.001;
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ASGNF4
line 219
;219:		AddRemap(ent->targetShaderName, ent->targetShaderNewName, f);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 660
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 664
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRF4
ARGF4
ADDRGP4 AddRemap
CALLV
pop
line 220
;220:		trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
ADDRLP4 16
ADDRGP4 BuildShaderStateConfig
CALLP4
ASGNP4
CNSTI4 24
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 221
;221:	}
LABELV $137
line 223
;222:
;223:	if (!ent->target) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $140
line 224
;224:		return;
ADDRGP4 $134
JUMPV
LABELV $140
line 227
;225:	}
;226:
;227:	t = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
ADDRGP4 $143
JUMPV
LABELV $142
line 228
;228:	while ((t = G_Find(t, FOFS(targetname), ent->target)) != NULL) {
line 229
;229:		if (t == ent) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $145
line 230
;230:			G_Printf("WARNING: Entity used itself.\n");
ADDRGP4 $147
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 231
;231:		} else {
ADDRGP4 $146
JUMPV
LABELV $145
line 232
;232:			if (t->use) {
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $148
line 233
;233:				t->use(t, ent, activator);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CALLV
pop
line 234
;234:			}
LABELV $148
line 235
;235:		}
LABELV $146
line 236
;236:		if (!ent->inuse) {
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $150
line 237
;237:			G_Printf("entity was removed while using targets\n");
ADDRGP4 $152
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 238
;238:			return;
ADDRGP4 $134
JUMPV
LABELV $150
line 240
;239:		}
;240:	}
LABELV $143
line 228
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 652
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $142
line 241
;241:}
LABELV $134
endproc G_UseTargets 20 12
bss
align 4
LABELV $154
skip 4
align 4
LABELV $155
skip 96
export tv
code
proc tv 8 0
line 251
;242:
;243:/*
;244:=============
;245:TempVector
;246:
;247:This is just a convenience function
;248:for making temporary vectors for function calls
;249:=============
;250:*/
;251:float* tv(float x, float y, float z) {
line 258
;252:	static int    index;
;253:	static vec3_t vecs[8];
;254:	float*        v;
;255:
;256:	// use an array so that multiple tempvectors won't collide
;257:	// for a while
;258:	v     = vecs[index];
ADDRLP4 0
ADDRGP4 $154
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 $155
ADDP4
ASGNP4
line 259
;259:	index = (index + 1) & 7;
ADDRLP4 4
ADDRGP4 $154
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 7
BANDI4
ASGNI4
line 261
;260:
;261:	v[0] = x;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRF4
ASGNF4
line 262
;262:	v[1] = y;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 263
;263:	v[2] = z;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRF4
ASGNF4
line 265
;264:
;265:	return v;
ADDRLP4 0
INDIRP4
RETP4
LABELV $153
endproc tv 8 0
bss
align 4
LABELV $157
skip 4
align 1
LABELV $158
skip 256
export vtos
code
proc vtos 12 24
line 276
;266:}
;267:
;268:/*
;269:=============
;270:VectorToString
;271:
;272:This is just a convenience function
;273:for printing vectors
;274:=============
;275:*/
;276:char* vtos(const vec3_t v) {
line 282
;277:	static int  index;
;278:	static char str[8][32];
;279:	char*       s;
;280:
;281:	// use an array so that multiple vtos won't collide
;282:	s     = str[index];
ADDRLP4 0
ADDRGP4 $157
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 $158
ADDP4
ASGNP4
line 283
;283:	index = (index + 1) & 7;
ADDRLP4 4
ADDRGP4 $157
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 7
BANDI4
ASGNI4
line 285
;284:
;285:	Com_sprintf(s, 32, "(%i %i %i)", (int)v[0], (int)v[1], (int)v[2]);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $159
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 287
;286:
;287:	return s;
ADDRLP4 0
INDIRP4
RETP4
LABELV $156
endproc vtos 12 24
data
align 4
LABELV $161
byte 4 0
byte 4 3212836864
byte 4 0
align 4
LABELV $162
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV $163
byte 4 0
byte 4 3221225472
byte 4 0
align 4
LABELV $164
byte 4 0
byte 4 0
byte 4 3212836864
export G_SetMovedir
code
proc G_SetMovedir 8 16
line 300
;288:}
;289:
;290:/*
;291:===============
;292:G_SetMovedir
;293:
;294:The editor only specifies a single value for angles (yaw),
;295:but we have special constants to generate an up or down direction.
;296:Angles will be cleared, because it is being used to represent a direction
;297:instead of an orientation.
;298:===============
;299:*/
;300:void G_SetMovedir(vec3_t angles, vec3_t movedir) {
line 306
;301:	static vec3_t VEC_UP       = {0, -1, 0};
;302:	static vec3_t MOVEDIR_UP   = {0, 0, 1};
;303:	static vec3_t VEC_DOWN     = {0, -2, 0};
;304:	static vec3_t MOVEDIR_DOWN = {0, 0, -1};
;305:
;306:	if (VectorCompare(angles, VEC_UP)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $161
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $165
line 307
;307:		VectorCopy(MOVEDIR_UP, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 $162
INDIRB
ASGNB 12
line 308
;308:	} else if (VectorCompare(angles, VEC_DOWN)) {
ADDRGP4 $166
JUMPV
LABELV $165
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $163
ARGP4
ADDRLP4 4
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $167
line 309
;309:		VectorCopy(MOVEDIR_DOWN, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 $164
INDIRB
ASGNB 12
line 310
;310:	} else {
ADDRGP4 $168
JUMPV
LABELV $167
line 311
;311:		AngleVectors(angles, movedir, NULL, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 312
;312:	}
LABELV $168
LABELV $166
line 313
;313:	VectorClear(angles);
ADDRFP4 0
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 314
;314:}
LABELV $160
endproc G_SetMovedir 8 16
export vectoyaw
proc vectoyaw 16 8
line 316
;315:
;316:float vectoyaw(const vec3_t vec) {
line 319
;317:	float yaw;
;318:
;319:	if (vec[YAW] == 0 && vec[PITCH] == 0) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
NEF4 $170
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 0
NEF4 $170
line 320
;320:		yaw = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 321
;321:	} else {
ADDRGP4 $171
JUMPV
LABELV $170
line 322
;322:		if (vec[PITCH]) {
ADDRFP4 0
INDIRP4
INDIRF4
CNSTF4 0
EQF4 $172
line 323
;323:			yaw = (atan2(vec[YAW], vec[PITCH]) * 180 / M_PI);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 atan2
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
CNSTF4 1113927393
MULF4
ASGNF4
line 324
;324:		} else if (vec[YAW] > 0) {
ADDRGP4 $173
JUMPV
LABELV $172
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 0
LEF4 $174
line 325
;325:			yaw = 90;
ADDRLP4 0
CNSTF4 1119092736
ASGNF4
line 326
;326:		} else {
ADDRGP4 $175
JUMPV
LABELV $174
line 327
;327:			yaw = 270;
ADDRLP4 0
CNSTF4 1132920832
ASGNF4
line 328
;328:		}
LABELV $175
LABELV $173
line 329
;329:		if (yaw < 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $176
line 330
;330:			yaw += 360;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
line 331
;331:		}
LABELV $176
line 332
;332:	}
LABELV $171
line 334
;333:
;334:	return yaw;
ADDRLP4 0
INDIRF4
RETF4
LABELV $169
endproc vectoyaw 16 8
export G_InitGentity
proc G_InitGentity 4 0
line 337
;335:}
;336:
;337:void G_InitGentity(gentity_t* e) {
line 338
;338:	e->inuse      = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 339
;339:	e->classname  = "noclass";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $179
ASGNP4
line 340
;340:	e->s.number   = e - g_entities;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ASGNI4
line 341
;341:	e->r.ownerNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
CNSTI4 1023
ASGNI4
line 342
;342:	e->tag        = TAG_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 0
ASGNI4
line 343
;343:}
LABELV $178
endproc G_InitGentity 4 0
export G_Spawn
proc G_Spawn 16 20
line 360
;344:
;345:/*
;346:=================
;347:G_Spawn
;348:
;349:Either finds a free entity, or allocates a new one.
;350:
;351:  The slots from 0 to MAX_CLIENTS-1 are always reserved for clients, and will
;352:never be used by anything else.
;353:
;354:Try to avoid reusing an entity that was recently freed, because it
;355:can cause the client to think the entity morphed into something else
;356:instead of being removed and recreated, which can cause interpolated
;357:angles and bad trails.
;358:=================
;359:*/
;360:gentity_t* G_Spawn(void) {
line 364
;361:	int        i, timeout;
;362:	gentity_t* e;
;363:
;364:	e = NULL;  // shut up warning
ADDRLP4 0
CNSTP4 0
ASGNP4
line 366
;365:	// try to release oldest items first
;366:	for (timeout = 1000; timeout >= 0; timeout -= 250) {
ADDRLP4 8
CNSTI4 1000
ASGNI4
LABELV $181
line 369
;367:		// if we go through all entities and can't find one to free,
;368:		// override the normal minimum times before use
;369:		e = &g_entities[MAX_CLIENTS];
ADDRLP4 0
ADDRGP4 g_entities+52224
ASGNP4
line 370
;370:		for (i = MAX_CLIENTS; i < level.num_entities; i++, e++) {
ADDRLP4 4
CNSTI4 64
ASGNI4
ADDRGP4 $189
JUMPV
LABELV $186
line 371
;371:			if (e->inuse) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $191
line 372
;372:				continue;
ADDRGP4 $187
JUMPV
LABELV $191
line 377
;373:			}
;374:
;375:			// the first couple seconds of server time can involve a lot of
;376:			// freeing and allocating, so relax the replacement policy
;377:			if (e->freetime > level.startTime + 2000 && level.time - e->freetime < timeout) {
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
ADDRGP4 level+40
INDIRI4
CNSTI4 2000
ADDI4
LEI4 $193
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
SUBI4
ADDRLP4 8
INDIRI4
GEI4 $193
line 378
;378:				continue;
ADDRGP4 $187
JUMPV
LABELV $193
line 382
;379:			}
;380:
;381:			// reuse this slot
;382:			G_InitGentity(e);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 383
;383:			return e;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $180
JUMPV
LABELV $187
line 370
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 816
ADDP4
ASGNP4
LABELV $189
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $186
line 386
;384:		}
;385:
;386:		if (level.num_entities < ENTITYNUM_MAX_NORMAL) {
ADDRGP4 level+12
INDIRI4
CNSTI4 1022
GEI4 $197
line 387
;387:			break;
ADDRGP4 $183
JUMPV
LABELV $197
line 389
;388:		}
;389:	}
LABELV $182
line 366
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 250
SUBI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
GEI4 $181
LABELV $183
line 391
;390:
;391:	if (i == ENTITYNUM_MAX_NORMAL) {
ADDRLP4 4
INDIRI4
CNSTI4 1022
NEI4 $200
line 392
;392:		for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $202
line 393
;393:			G_Printf("%4i: %s\n", i, g_entities[i].classname);
ADDRGP4 $206
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 394
;394:		}
LABELV $203
line 392
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $202
line 395
;395:		G_Error("G_Spawn: no free entities");
ADDRGP4 $208
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 396
;396:	}
LABELV $200
line 399
;397:
;398:	// open up a new slot
;399:	level.num_entities++;
ADDRLP4 12
ADDRGP4 level+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 402
;400:
;401:	// let the server system know that there are more entities
;402:	trap_LocateGameData(level.gentities, level.num_entities, sizeof(gentity_t), &level.clients[0].ps, sizeof(level.clients[0]));
ADDRGP4 level+4
INDIRP4
ARGP4
ADDRGP4 level+12
INDIRI4
ARGI4
CNSTI4 816
ARGI4
ADDRGP4 level
INDIRP4
ARGP4
CNSTI4 1576
ARGI4
ADDRGP4 trap_LocateGameData
CALLV
pop
line 404
;403:
;404:	G_InitGentity(e);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 405
;405:	return e;
ADDRLP4 0
INDIRP4
RETP4
LABELV $180
endproc G_Spawn 16 20
export G_EntitiesFree
proc G_EntitiesFree 8 0
line 413
;406:}
;407:
;408:/*
;409:=================
;410:G_EntitiesFree
;411:=================
;412:*/
;413:qboolean G_EntitiesFree(void) {
line 417
;414:	int        i;
;415:	gentity_t* e;
;416:
;417:	e = &g_entities[MAX_CLIENTS];
ADDRLP4 4
ADDRGP4 g_entities+52224
ASGNP4
line 418
;418:	for (i = MAX_CLIENTS; i < level.num_entities; i++, e++) {
ADDRLP4 0
CNSTI4 64
ASGNI4
ADDRGP4 $217
JUMPV
LABELV $214
line 419
;419:		if (e->inuse) {
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $219
line 420
;420:			continue;
ADDRGP4 $215
JUMPV
LABELV $219
line 423
;421:		}
;422:		// slot available
;423:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $212
JUMPV
LABELV $215
line 418
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 816
ADDP4
ASGNP4
LABELV $217
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $214
line 425
;424:	}
;425:	return qfalse;
CNSTI4 0
RETI4
LABELV $212
endproc G_EntitiesFree 8 0
export G_FreeEntity
proc G_FreeEntity 0 12
line 435
;426:}
;427:
;428:/*
;429:=================
;430:G_FreeEntity
;431:
;432:Marks the entity as free
;433:=================
;434:*/
;435:void G_FreeEntity(gentity_t* ed) {
line 436
;436:	trap_UnlinkEntity(ed);  // unlink from world
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 438
;437:
;438:	if (ed->neverFree) {
ADDRFP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $222
line 439
;439:		return;
ADDRGP4 $221
JUMPV
LABELV $222
line 442
;440:	}
;441:
;442:	memset(ed, 0, sizeof(*ed));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 816
ARGI4
ADDRGP4 memset
CALLP4
pop
line 443
;443:	ed->classname = "freed";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $224
ASGNP4
line 444
;444:	ed->freetime  = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 445
;445:	ed->inuse     = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 446
;446:}
LABELV $221
endproc G_FreeEntity 0 12
export G_TempEntity
proc G_TempEntity 20 8
line 457
;447:
;448:/*
;449:=================
;450:G_TempEntity
;451:
;452:Spawns an event entity that will be auto-removed
;453:The origin will be snapped to save net bandwidth, so care
;454:must be taken if the origin is right on a surface (snap towards start vector first)
;455:=================
;456:*/
;457:gentity_t* G_TempEntity(vec3_t origin, int event) {
line 461
;458:	gentity_t* e;
;459:	vec3_t     snapped;
;460:
;461:	e          = G_Spawn();
ADDRLP4 16
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 462
;462:	e->s.eType = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRI4
CNSTI4 13
ADDI4
ASGNI4
line 464
;463:
;464:	e->classname      = "tempEntity";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $227
ASGNP4
line 465
;465:	e->eventTime      = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 466
;466:	e->freeAfterEvent = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 468
;467:
;468:	VectorCopy(origin, snapped);
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 469
;469:	SnapVector(snapped);  // save network bandwidth
ADDRLP4 4
ADDRLP4 4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 470
;470:	G_SetOrigin(e, snapped);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 473
;471:
;472:	// find cluster for PVS
;473:	trap_LinkEntity(e);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 475
;474:
;475:	return e;
ADDRLP4 0
INDIRP4
RETP4
LABELV $226
endproc G_TempEntity 20 8
export G_KillBox
proc G_KillBox 4156 32
line 494
;476:}
;477:
;478:/*
;479:==============================================================================
;480:
;481:Kill box
;482:
;483:==============================================================================
;484:*/
;485:
;486:/*
;487:=================
;488:G_KillBox
;489:
;490:Kills all entities that would touch the proposed new positioning
;491:of ent.  Ent should be unlinked before calling this!
;492:=================
;493:*/
;494:void G_KillBox(gentity_t* ent) {
line 500
;495:	int        i, num;
;496:	int        touch[MAX_GENTITIES];
;497:	gentity_t* hit;
;498:	vec3_t     mins, maxs;
;499:
;500:	VectorAdd(ent->client->ps.origin, ent->r.mins, mins);
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4132
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4132
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4132
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4132
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108+8
ADDRLP4 4136
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4136
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
line 501
;501:	VectorAdd(ent->client->ps.origin, ent->r.maxs, maxs);
ADDRLP4 4140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4140
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4140
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4140
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4140
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120+8
ADDRLP4 4144
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4144
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
line 502
;502:	num = trap_EntitiesInBox(mins, maxs, touch, MAX_GENTITIES);
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4148
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4148
INDIRI4
ASGNI4
line 504
;503:
;504:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $241
JUMPV
LABELV $238
line 505
;505:		hit = &g_entities[touch[i]];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 506
;506:		if (!hit->client) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $242
line 507
;507:			continue;
ADDRGP4 $239
JUMPV
LABELV $242
line 511
;508:		}
;509:
;510:		// nail it
;511:		G_Damage(hit, ent, ent, NULL, NULL, 100000, DAMAGE_NO_PROTECTION, MOD_TELEFRAG);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4152
INDIRP4
ARGP4
ADDRLP4 4152
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 8
ARGI4
CNSTI4 18
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 512
;512:	}
LABELV $239
line 504
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $241
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $238
line 513
;513:}
LABELV $233
endproc G_KillBox 4156 32
export G_AddPredictableEvent
proc G_AddPredictableEvent 0 16
line 526
;514:
;515://==============================================================================
;516:
;517:/*
;518:===============
;519:G_AddPredictableEvent
;520:
;521:Use for non-pmove events that would also be predicted on the
;522:client side: jumppads and item pickups
;523:Adds an event+parm and twiddles the event counter
;524:===============
;525:*/
;526:void G_AddPredictableEvent(gentity_t* ent, entity_event_t event, int eventParm) {
line 527
;527:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $245
line 528
;528:		return;
ADDRGP4 $244
JUMPV
LABELV $245
line 530
;529:	}
;530:	BG_AddPredictableEventToPlayerstate(event, eventParm, &ent->client->ps, -1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BG_AddPredictableEventToPlayerstate
CALLV
pop
line 531
;531:}
LABELV $244
endproc G_AddPredictableEvent 0 16
export G_AddEvent
proc G_AddEvent 8 8
line 540
;532:
;533:/*
;534:===============
;535:G_AddEvent
;536:
;537:Adds an event+parm and twiddles the event counter
;538:===============
;539:*/
;540:void G_AddEvent(gentity_t* ent, int event, int eventParm) {
line 544
;541:	int        bits;
;542:	gclient_t* client;
;543:
;544:	if (!event) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $248
line 545
;545:		G_Printf("G_AddEvent: zero event added for entity %i\n", ent->s.number);
ADDRGP4 $250
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 546
;546:		return;
ADDRGP4 $247
JUMPV
LABELV $248
line 550
;547:	}
;548:
;549:	// clients need to add the event in playerState_t instead of entityState_t
;550:	if (ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $251
line 551
;551:		client                       = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 552
;552:		bits                         = client->ps.externalEvent & EV_EVENT_BITS;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
CNSTI4 768
BANDI4
ASGNI4
line 553
;553:		bits                         = (bits + EV_EVENT_BIT1) & EV_EVENT_BITS;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
CNSTI4 768
BANDI4
ASGNI4
line 554
;554:		client->ps.externalEvent     = event | bits;
ADDRLP4 4
INDIRP4
CNSTI4 128
ADDP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 555
;555:		client->ps.externalEventParm = eventParm;
ADDRLP4 4
INDIRP4
CNSTI4 132
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 556
;556:		client->ps.externalEventTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 136
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 557
;557:	} else {
ADDRGP4 $252
JUMPV
LABELV $251
line 558
;558:		bits             = ent->s.event & EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 768
BANDI4
ASGNI4
line 559
;559:		bits             = (bits + EV_EVENT_BIT1) & EV_EVENT_BITS;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 256
ADDI4
CNSTI4 768
BANDI4
ASGNI4
line 560
;560:		ent->s.event     = event | bits;
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
BORI4
ASGNI4
line 561
;561:		ent->s.eventParm = eventParm;
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 562
;562:	}
LABELV $252
line 563
;563:	ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 564
;564:}
LABELV $247
endproc G_AddEvent 8 8
export G_Sound
proc G_Sound 8 8
line 571
;565:
;566:/*
;567:=============
;568:G_Sound
;569:=============
;570:*/
;571:void G_Sound(gentity_t* ent, int channel, int soundIndex) {
line 574
;572:	gentity_t* te;
;573:
;574:	te              = G_TempEntity(ent->r.currentOrigin, EV_GENERAL_SOUND);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 575
;575:	te->s.eventParm = soundIndex;
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 576
;576:}
LABELV $255
endproc G_Sound 8 8
export G_SetOrigin
proc G_SetOrigin 0 0
line 587
;577:
;578://==============================================================================
;579:
;580:/*
;581:================
;582:G_SetOrigin
;583:
;584:Sets the pos trajectory for a fixed position
;585:================
;586:*/
;587:void G_SetOrigin(gentity_t* ent, vec3_t origin) {
line 588
;588:	VectorCopy(origin, ent->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 589
;589:	ent->s.pos.trType     = TR_STATIONARY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 590
;590:	ent->s.pos.trTime     = 0;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 0
ASGNI4
line 591
;591:	ent->s.pos.trDuration = 0;
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTI4 0
ASGNI4
line 592
;592:	VectorClear(ent->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 0
ASGNF4
line 594
;593:
;594:	VectorCopy(origin, ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 595
;595:}
LABELV $256
endproc G_SetOrigin 0 0
data
align 4
LABELV $258
byte 4 0
byte 4 0
byte 4 1065353216
export DebugLine
code
proc DebugLine 104 12
line 605
;596:
;597:/*
;598:================
;599:DebugLine
;600:
;601:  debug polygons only work when running a local game
;602:  with r_debugSurface set to 2
;603:================
;604:*/
;605:int DebugLine(vec3_t start, vec3_t end, int color) {
line 606
;606:	vec3_t points[4], dir, cross, up = {0, 0, 1};
ADDRLP4 72
ADDRGP4 $258
INDIRB
ASGNB 12
line 609
;607:	float  dot;
;608:
;609:	VectorCopy(start, points[0]);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 610
;610:	VectorCopy(start, points[1]);
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 612
;611:	// points[1][2] -= 2;
;612:	VectorCopy(end, points[2]);
ADDRLP4 0+24
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 614
;613:	// points[2][2] -= 2;
;614:	VectorCopy(end, points[3]);
ADDRLP4 0+36
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 616
;615:
;616:	VectorSubtract(end, start, dir);
ADDRLP4 88
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
ADDRLP4 88
INDIRP4
INDIRF4
ADDRLP4 92
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60+4
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 60+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 617
;617:	VectorNormalize(dir);
ADDRLP4 60
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 618
;618:	dot = DotProduct(dir, up);
ADDRLP4 84
ADDRLP4 60
INDIRF4
ADDRLP4 72
INDIRF4
MULF4
ADDRLP4 60+4
INDIRF4
ADDRLP4 72+4
INDIRF4
MULF4
ADDF4
ADDRLP4 60+8
INDIRF4
ADDRLP4 72+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 619
;619:	if (dot > 0.99 || dot < -0.99)
ADDRLP4 84
INDIRF4
CNSTF4 1065185444
GTF4 $270
ADDRLP4 84
INDIRF4
CNSTF4 3212669092
GEF4 $268
LABELV $270
line 620
;620:		VectorSet(cross, 1, 0, 0);
ADDRLP4 48
CNSTF4 1065353216
ASGNF4
ADDRLP4 48+4
CNSTF4 0
ASGNF4
ADDRLP4 48+8
CNSTF4 0
ASGNF4
ADDRGP4 $269
JUMPV
LABELV $268
line 622
;621:	else
;622:		CrossProduct(dir, up, cross);
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
LABELV $269
line 624
;623:
;624:	VectorNormalize(cross);
ADDRLP4 48
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 626
;625:
;626:	VectorMA(points[0], 2, cross, points[0]);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 48
INDIRF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 48+4
INDIRF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 48+8
INDIRF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 627
;627:	VectorMA(points[1], -2, cross, points[1]);
ADDRLP4 0+12
ADDRLP4 0+12
INDIRF4
ADDRLP4 48
INDIRF4
CNSTF4 3221225472
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+4
ADDRLP4 0+12+4
INDIRF4
ADDRLP4 48+4
INDIRF4
CNSTF4 3221225472
MULF4
ADDF4
ASGNF4
ADDRLP4 0+12+8
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 48+8
INDIRF4
CNSTF4 3221225472
MULF4
ADDF4
ASGNF4
line 628
;628:	VectorMA(points[2], -2, cross, points[2]);
ADDRLP4 0+24
ADDRLP4 0+24
INDIRF4
ADDRLP4 48
INDIRF4
CNSTF4 3221225472
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 48+4
INDIRF4
CNSTF4 3221225472
MULF4
ADDF4
ASGNF4
ADDRLP4 0+24+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 48+8
INDIRF4
CNSTF4 3221225472
MULF4
ADDF4
ASGNF4
line 629
;629:	VectorMA(points[3], 2, cross, points[3]);
ADDRLP4 0+36
ADDRLP4 0+36
INDIRF4
ADDRLP4 48
INDIRF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
ADDRLP4 0+36+4
ADDRLP4 0+36+4
INDIRF4
ADDRLP4 48+4
INDIRF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
ADDRLP4 0+36+8
ADDRLP4 0+36+8
INDIRF4
ADDRLP4 48+8
INDIRF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 631
;630:
;631:	return trap_DebugPolygonCreate(color, 4, points);
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 100
ADDRGP4 trap_DebugPolygonCreate
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
RETI4
LABELV $257
endproc DebugLine 104 12
bss
export remappedShaders
align 4
LABELV remappedShaders
skip 16896
import svf_self_portal2
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_TraceCapsule
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Print
import phy_movetype
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_predictPVS
import g_unlagged
import g_rotation
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_autoJoin
import g_allowVote
import g_blood
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_maxGameClients
import g_cheats
import g_dedicated
import sv_fps
import g_mapname
import g_gametype
import g_entities
import level
import AddTeamScore
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import G_MapExist
import G_LoadMap
import ParseMapRotation
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_ClearClientSessionData
import G_WriteClientSessionData
import G_ReadClientSessionData
import G_InitSessionData
import G_WriteSessionData
import G_InitWorldSession
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_ResetFlags
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_BroadcastServerCommand
import G_Error
import G_Printf
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import MoveClientToIntermission
import DeathmatchScoreboardMessage
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamConnectedCount
import TeamCount
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import G_TouchSolids
import G_TouchTriggers
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import SpawnTime
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import G_RevertVote
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
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
LABELV $250
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $227
byte 1 116
byte 1 101
byte 1 109
byte 1 112
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $224
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $208
byte 1 71
byte 1 95
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $206
byte 1 37
byte 1 52
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $179
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $159
byte 1 40
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 41
byte 1 0
align 1
LABELV $152
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 104
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $147
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $133
byte 1 71
byte 1 95
byte 1 80
byte 1 105
byte 1 99
byte 1 107
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $123
byte 1 71
byte 1 95
byte 1 80
byte 1 105
byte 1 99
byte 1 107
byte 1 84
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $93
byte 1 71
byte 1 95
byte 1 70
byte 1 105
byte 1 110
byte 1 100
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $74
byte 1 37
byte 1 115
byte 1 61
byte 1 37
byte 1 115
byte 1 58
byte 1 37
byte 1 53
byte 1 46
byte 1 50
byte 1 102
byte 1 64
byte 1 0
