export UI_Alloc
code
proc UI_Alloc 8 0
file "../../../../code/q3_ui/ui_gameinfo.c"
line 32
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3://
;4:// gameinfo.c
;5://
;6:
;7:#include "ui_local.h"
;8:
;9://
;10:// arena and bot info
;11://
;12:
;13:#define POOLSIZE 128 * 1024
;14:
;15:int          ui_numBots;
;16:static char* ui_botInfos[MAX_BOTS];
;17:
;18:static int   ui_numArenas;
;19:static char* ui_arenaInfos[MAX_ARENAS];
;20:
;21:static int   ui_numSinglePlayerArenas;
;22:static int   ui_numSpecialSinglePlayerArenas;
;23:
;24:static char  memoryPool[POOLSIZE];
;25:static int   allocPoint, outOfMemory;
;26:
;27:/*
;28:===============
;29:UI_Alloc
;30:===============
;31:*/
;32:void* UI_Alloc(int size) {
line 35
;33:	char* p;
;34:
;35:	if (allocPoint + size > POOLSIZE) {
ADDRGP4 allocPoint
INDIRI4
ADDRFP4 0
INDIRI4
ADDI4
CNSTI4 131072
LEI4 $69
line 36
;36:		outOfMemory = qtrue;
ADDRGP4 outOfMemory
CNSTI4 1
ASGNI4
line 37
;37:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $68
JUMPV
LABELV $69
line 40
;38:	}
;39:
;40:	p = &memoryPool[allocPoint];
ADDRLP4 0
ADDRGP4 allocPoint
INDIRI4
ADDRGP4 memoryPool
ADDP4
ASGNP4
line 42
;41:
;42:	allocPoint += (size + 31) & ~31;
ADDRLP4 4
ADDRGP4 allocPoint
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRI4
CNSTI4 31
ADDI4
CNSTI4 -32
BANDI4
ADDI4
ASGNI4
line 44
;43:
;44:	return p;
ADDRLP4 0
INDIRP4
RETP4
LABELV $68
endproc UI_Alloc 8 0
export UI_InitMemory
proc UI_InitMemory 0 0
line 52
;45:}
;46:
;47:/*
;48:===============
;49:UI_InitMemory
;50:===============
;51:*/
;52:void UI_InitMemory(void) {
line 53
;53:	allocPoint  = 0;
ADDRGP4 allocPoint
CNSTI4 0
ASGNI4
line 54
;54:	outOfMemory = qfalse;
ADDRGP4 outOfMemory
CNSTI4 0
ASGNI4
line 55
;55:}
LABELV $71
endproc UI_InitMemory 0 0
export UI_ParseInfos
proc UI_ParseInfos 2084 12
line 62
;56:
;57:/*
;58:===============
;59:UI_ParseInfos
;60:===============
;61:*/
;62:int UI_ParseInfos(char* buf, int max, char* infos[]) {
line 68
;63:	char* token;
;64:	int   count;
;65:	char  key[MAX_TOKEN_CHARS];
;66:	char  info[MAX_INFO_STRING];
;67:
;68:	count = 0;
ADDRLP4 2052
CNSTI4 0
ASGNI4
ADDRGP4 $74
JUMPV
LABELV $73
line 70
;69:
;70:	while (1) {
line 71
;71:		token = COM_Parse(&buf);
ADDRFP4 0
ARGP4
ADDRLP4 2056
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2056
INDIRP4
ASGNP4
line 72
;72:		if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $76
line 73
;73:			break;
ADDRGP4 $75
JUMPV
LABELV $76
line 75
;74:		}
;75:		if (strcmp(token, "{")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $80
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
EQI4 $78
line 76
;76:			Com_Printf("Missing { in info file\n");
ADDRGP4 $81
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 77
;77:			break;
ADDRGP4 $75
JUMPV
LABELV $78
line 80
;78:		}
;79:
;80:		if (count == max) {
ADDRLP4 2052
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $82
line 81
;81:			Com_Printf("Max infos exceeded\n");
ADDRGP4 $84
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 82
;82:			break;
ADDRGP4 $75
JUMPV
LABELV $82
line 85
;83:		}
;84:
;85:		info[0] = '\0';
ADDRLP4 1028
CNSTI1 0
ASGNI1
ADDRGP4 $86
JUMPV
LABELV $85
line 86
;86:		while (1) {
line 87
;87:			token = COM_ParseExt(&buf, qtrue);
ADDRFP4 0
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 2064
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2064
INDIRP4
ASGNP4
line 88
;88:			if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $88
line 89
;89:				Com_Printf("Unexpected end of info file\n");
ADDRGP4 $90
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 90
;90:				break;
ADDRGP4 $87
JUMPV
LABELV $88
line 92
;91:			}
;92:			if (!strcmp(token, "}")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $93
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $91
line 93
;93:				break;
ADDRGP4 $87
JUMPV
LABELV $91
line 95
;94:			}
;95:			Q_strncpyz(key, token, sizeof(key));
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 97
;96:
;97:			token = COM_ParseExt(&buf, qfalse);
ADDRFP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 2072
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 2072
INDIRP4
ASGNP4
line 98
;98:			if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $94
line 99
;99:				strcpy(token, "<NULL>");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $96
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 100
;100:			}
LABELV $94
line 101
;101:			Info_SetValueForKey(info, key, token);
ADDRLP4 1028
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 102
;102:		}
LABELV $86
line 86
ADDRGP4 $85
JUMPV
LABELV $87
line 104
;103:		// NOTE: extra space for arena number
;104:		infos[count] = UI_Alloc(strlen(info) + strlen("\\num\\") + strlen(va("%d", MAX_ARENAS)) + 1);
ADDRLP4 1028
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $97
ARGP4
ADDRLP4 2068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $98
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2072
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2072
INDIRP4
ARGP4
ADDRLP4 2076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 2064
INDIRI4
ADDRLP4 2068
INDIRI4
ADDI4
ADDRLP4 2076
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 2080
ADDRGP4 UI_Alloc
CALLP4
ASGNP4
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 2080
INDIRP4
ASGNP4
line 105
;105:		if (infos[count]) {
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $99
line 106
;106:			strcpy(infos[count], info);
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 107
;107:			count++;
ADDRLP4 2052
ADDRLP4 2052
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 108
;108:		}
LABELV $99
line 109
;109:	}
LABELV $74
line 70
ADDRGP4 $73
JUMPV
LABELV $75
line 110
;110:	return count;
ADDRLP4 2052
INDIRI4
RETI4
LABELV $72
endproc UI_ParseInfos 2084 12
proc UI_LoadArenasFromFile 8216 16
line 118
;111:}
;112:
;113:/*
;114:===============
;115:UI_LoadArenasFromFile
;116:===============
;117:*/
;118:static void UI_LoadArenasFromFile(const char* filename) {
line 123
;119:	int          len;
;120:	fileHandle_t f;
;121:	char         buf[MAX_ARENAS_TEXT];
;122:
;123:	len = trap_FS_FOpenFile(filename, &f, FS_READ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 124
;124:	if (f == FS_INVALID_HANDLE) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $102
line 125
;125:		trap_Print(va(S_COLOR_RED "file not found: %s\n", filename));
ADDRGP4 $104
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 126
;126:		return;
ADDRGP4 $101
JUMPV
LABELV $102
line 128
;127:	}
;128:	if (len >= sizeof(buf)) {
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 8192
LTU4 $105
line 129
;129:		trap_Print(va(S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, sizeof(buf)));
ADDRGP4 $107
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTU4 8192
ARGU4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 130
;130:		trap_FS_FCloseFile(f);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 131
;131:		return;
ADDRGP4 $101
JUMPV
LABELV $105
line 134
;132:	}
;133:
;134:	trap_FS_Read(buf, len, f);
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 135
;135:	buf[len] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 136
;136:	trap_FS_FCloseFile(f);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 138
;137:
;138:	ui_numArenas += UI_ParseInfos(buf, MAX_ARENAS - ui_numArenas, &ui_arenaInfos[ui_numArenas]);
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 ui_numArenas
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
ADDRLP4 8208
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 UI_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 139
;139:}
LABELV $101
endproc UI_LoadArenasFromFile 8216 16
proc UI_LoadArenas 8660 16
line 146
;140:
;141:/*
;142:===============
;143:UI_LoadArenas
;144:===============
;145:*/
;146:static void UI_LoadArenas(void) {
line 158
;147:	int      numdirs;
;148:	vmCvar_t arenasFile;
;149:	char     filename[128];
;150:	char     dirlist[8192];
;151:	char*    dirptr;
;152:	int      i, n;
;153:	int      dirlen;
;154:	char*    type;
;155:	char*    tag;
;156:	int      singlePlayerNum, specialNum, otherNum;
;157:
;158:	ui_numArenas = 0;
ADDRGP4 ui_numArenas
CNSTI4 0
ASGNI4
line 160
;159:
;160:	trap_Cvar_Register(&arenasFile, "g_arenasFile", "", CVAR_INIT | CVAR_ROM);
ADDRLP4 8360
ARGP4
ADDRGP4 $109
ARGP4
ADDRGP4 $110
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 161
;161:	if (*arenasFile.string) {
ADDRLP4 8360+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $111
line 162
;162:		UI_LoadArenasFromFile(arenasFile.string);
ADDRLP4 8360+16
ARGP4
ADDRGP4 UI_LoadArenasFromFile
CALLV
pop
line 163
;163:	} else {
ADDRGP4 $112
JUMPV
LABELV $111
line 164
;164:		UI_LoadArenasFromFile("scripts/arenas.txt");
ADDRGP4 $115
ARGP4
ADDRGP4 UI_LoadArenasFromFile
CALLV
pop
line 165
;165:	}
LABELV $112
line 168
;166:
;167:	// get all arenas from .arena files
;168:	numdirs = trap_FS_GetFileList("scripts", ".arena", dirlist, sizeof(dirlist));
ADDRGP4 $116
ARGP4
ADDRGP4 $117
ARGP4
ADDRLP4 168
ARGP4
CNSTI4 8192
ARGI4
ADDRLP4 8632
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 152
ADDRLP4 8632
INDIRI4
ASGNI4
line 170
;169:
;170:	dirptr = dirlist;
ADDRLP4 8
ADDRLP4 168
ASGNP4
line 171
;171:	for (i = 0; i < numdirs; i++, dirptr += dirlen + 1) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $121
JUMPV
LABELV $118
line 172
;172:		dirlen = strlen(dirptr);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8636
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 8636
INDIRI4
ASGNI4
line 173
;173:		strcpy(filename, "scripts/");
ADDRLP4 12
ARGP4
ADDRGP4 $122
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 174
;174:		strcat(filename, dirptr);
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 175
;175:		UI_LoadArenasFromFile(filename);
ADDRLP4 12
ARGP4
ADDRGP4 UI_LoadArenasFromFile
CALLV
pop
line 176
;176:	}
LABELV $119
line 171
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 8
INDIRP4
ADDP4
ASGNP4
LABELV $121
ADDRLP4 140
INDIRI4
ADDRLP4 152
INDIRI4
LTI4 $118
line 177
;177:	trap_Print(va("%i arenas parsed\n", ui_numArenas));
ADDRGP4 $123
ARGP4
ADDRGP4 ui_numArenas
INDIRI4
ARGI4
ADDRLP4 8636
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8636
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 178
;178:	if (outOfMemory)
ADDRGP4 outOfMemory
INDIRI4
CNSTI4 0
EQI4 $124
line 179
;179:		trap_Print(S_COLOR_YELLOW "WARNING: not anough memory in pool to load all arenas\n");
ADDRGP4 $126
ARGP4
ADDRGP4 trap_Print
CALLV
pop
LABELV $124
line 182
;180:
;181:	// set initial numbers
;182:	for (n = 0; n < ui_numArenas; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $130
JUMPV
LABELV $127
line 183
;183:		Info_SetValueForKey(ui_arenaInfos[n], "num", va("%i", n));
ADDRGP4 $132
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8640
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 8640
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 184
;184:	}
LABELV $128
line 182
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $130
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $127
line 187
;185:
;186:	// go through and count single players levels
;187:	ui_numSinglePlayerArenas        = 0;
ADDRGP4 ui_numSinglePlayerArenas
CNSTI4 0
ASGNI4
line 188
;188:	ui_numSpecialSinglePlayerArenas = 0;
ADDRGP4 ui_numSpecialSinglePlayerArenas
CNSTI4 0
ASGNI4
line 189
;189:	for (n = 0; n < ui_numArenas; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $136
JUMPV
LABELV $133
line 191
;190:		// determine type
;191:		type = Info_ValueForKey(ui_arenaInfos[n], "type");
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $137
ARGP4
ADDRLP4 8640
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8640
INDIRP4
ASGNP4
line 194
;192:
;193:		// if no type specified, it will be treated as "ffa"
;194:		if (!*type) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $138
line 195
;195:			continue;
ADDRGP4 $134
JUMPV
LABELV $138
line 198
;196:		}
;197:
;198:		if (strstr(type, "single")) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 8644
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 8644
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $140
line 200
;199:			// check for special single player arenas (training, final)
;200:			tag = Info_ValueForKey(ui_arenaInfos[n], "special");
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $143
ARGP4
ADDRLP4 8648
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 8648
INDIRP4
ASGNP4
line 201
;201:			if (*tag) {
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $144
line 202
;202:				ui_numSpecialSinglePlayerArenas++;
ADDRLP4 8652
ADDRGP4 ui_numSpecialSinglePlayerArenas
ASGNP4
ADDRLP4 8652
INDIRP4
ADDRLP4 8652
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 203
;203:				continue;
ADDRGP4 $134
JUMPV
LABELV $144
line 206
;204:			}
;205:
;206:			ui_numSinglePlayerArenas++;
ADDRLP4 8652
ADDRGP4 ui_numSinglePlayerArenas
ASGNP4
ADDRLP4 8652
INDIRP4
ADDRLP4 8652
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 207
;207:		}
LABELV $140
line 208
;208:	}
LABELV $134
line 189
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $136
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $133
line 210
;209:
;210:	n = ui_numSinglePlayerArenas % ARENAS_PER_TIER;
ADDRLP4 0
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 211
;211:	if (n != 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $146
line 212
;212:		ui_numSinglePlayerArenas -= n;
ADDRLP4 8640
ADDRGP4 ui_numSinglePlayerArenas
ASGNP4
ADDRLP4 8640
INDIRP4
ADDRLP4 8640
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 213
;213:		trap_Print(va("%i arenas ignored to make count divisible by %i\n", n, ARENAS_PER_TIER));
ADDRGP4 $148
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRLP4 8644
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8644
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 214
;214:	}
LABELV $146
line 217
;215:
;216:	// go through once more and assign number to the levels
;217:	singlePlayerNum = 0;
ADDRLP4 160
CNSTI4 0
ASGNI4
line 218
;218:	specialNum      = singlePlayerNum + ui_numSinglePlayerArenas;
ADDRLP4 164
ADDRLP4 160
INDIRI4
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
ADDI4
ASGNI4
line 219
;219:	otherNum        = specialNum + ui_numSpecialSinglePlayerArenas;
ADDRLP4 156
ADDRLP4 164
INDIRI4
ADDRGP4 ui_numSpecialSinglePlayerArenas
INDIRI4
ADDI4
ASGNI4
line 220
;220:	for (n = 0; n < ui_numArenas; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $152
JUMPV
LABELV $149
line 222
;221:		// determine type
;222:		type = Info_ValueForKey(ui_arenaInfos[n], "type");
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $137
ARGP4
ADDRLP4 8640
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8640
INDIRP4
ASGNP4
line 225
;223:
;224:		// if no type specified, it will be treated as "ffa"
;225:		if (*type) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $153
line 226
;226:			if (strstr(type, "single")) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $142
ARGP4
ADDRLP4 8644
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 8644
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $155
line 228
;227:				// check for special single player arenas (training, final)
;228:				tag = Info_ValueForKey(ui_arenaInfos[n], "special");
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $143
ARGP4
ADDRLP4 8648
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 148
ADDRLP4 8648
INDIRP4
ASGNP4
line 229
;229:				if (*tag) {
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $157
line 230
;230:					Info_SetValueForKey(ui_arenaInfos[n], "num", va("%i", specialNum++));
ADDRGP4 $132
ARGP4
ADDRLP4 8652
ADDRLP4 164
INDIRI4
ASGNI4
ADDRLP4 164
ADDRLP4 8652
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8652
INDIRI4
ARGI4
ADDRLP4 8656
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 8656
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 231
;231:					continue;
ADDRGP4 $150
JUMPV
LABELV $157
line 234
;232:				}
;233:
;234:				Info_SetValueForKey(ui_arenaInfos[n], "num", va("%i", singlePlayerNum++));
ADDRGP4 $132
ARGP4
ADDRLP4 8652
ADDRLP4 160
INDIRI4
ASGNI4
ADDRLP4 160
ADDRLP4 8652
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8652
INDIRI4
ARGI4
ADDRLP4 8656
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 8656
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 235
;235:				continue;
ADDRGP4 $150
JUMPV
LABELV $155
line 237
;236:			}
;237:		}
LABELV $153
line 239
;238:
;239:		Info_SetValueForKey(ui_arenaInfos[n], "num", va("%i", otherNum++));
ADDRGP4 $132
ARGP4
ADDRLP4 8644
ADDRLP4 156
INDIRI4
ASGNI4
ADDRLP4 156
ADDRLP4 8644
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8644
INDIRI4
ARGI4
ADDRLP4 8648
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 8648
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 240
;240:	}
LABELV $150
line 220
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $152
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $149
line 241
;241:}
LABELV $108
endproc UI_LoadArenas 8660 16
export UI_GetArenaInfoByNumber
proc UI_GetArenaInfoByNumber 24 8
line 248
;242:
;243:/*
;244:===============
;245:UI_GetArenaInfoByNumber
;246:===============
;247:*/
;248:const char* UI_GetArenaInfoByNumber(int num) {
line 252
;249:	int   n;
;250:	char* value;
;251:
;252:	if (num < 0 || num >= ui_numArenas) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $162
ADDRLP4 8
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $160
LABELV $162
line 253
;253:		trap_Print(va(S_COLOR_RED "Invalid arena number: %i\n", num));
ADDRGP4 $163
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 254
;254:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $159
JUMPV
LABELV $160
line 257
;255:	}
;256:
;257:	for (n = 0; n < ui_numArenas; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $167
JUMPV
LABELV $164
line 258
;258:		value = Info_ValueForKey(ui_arenaInfos[n], "num");
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 259
;259:		if (*value && atoi(value) == num) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $168
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $168
line 260
;260:			return ui_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $159
JUMPV
LABELV $168
line 262
;261:		}
;262:	}
LABELV $165
line 257
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $167
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $164
line 264
;263:
;264:	return NULL;
CNSTP4 0
RETP4
LABELV $159
endproc UI_GetArenaInfoByNumber 24 8
export UI_GetArenaInfoByMap
proc UI_GetArenaInfoByMap 12 8
line 272
;265:}
;266:
;267:/*
;268:===============
;269:UI_GetArenaInfoByNumber
;270:===============
;271:*/
;272:const char* UI_GetArenaInfoByMap(const char* map) {
line 275
;273:	int n;
;274:
;275:	for (n = 0; n < ui_numArenas; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $174
JUMPV
LABELV $171
line 276
;276:		if (Q_stricmp(Info_ValueForKey(ui_arenaInfos[n], "map"), map) == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $177
ARGP4
ADDRLP4 4
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $175
line 277
;277:			return ui_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $170
JUMPV
LABELV $175
line 279
;278:		}
;279:	}
LABELV $172
line 275
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $174
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $171
line 281
;280:
;281:	return NULL;
CNSTP4 0
RETP4
LABELV $170
endproc UI_GetArenaInfoByMap 12 8
export UI_GetSpecialArenaInfo
proc UI_GetSpecialArenaInfo 12 8
line 289
;282:}
;283:
;284:/*
;285:===============
;286:UI_GetSpecialArenaInfo
;287:===============
;288:*/
;289:const char* UI_GetSpecialArenaInfo(const char* tag) {
line 292
;290:	int n;
;291:
;292:	for (n = 0; n < ui_numArenas; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $182
JUMPV
LABELV $179
line 293
;293:		if (Q_stricmp(Info_ValueForKey(ui_arenaInfos[n], "special"), tag) == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $143
ARGP4
ADDRLP4 4
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $183
line 294
;294:			return ui_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $178
JUMPV
LABELV $183
line 296
;295:		}
;296:	}
LABELV $180
line 292
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $182
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LTI4 $179
line 298
;297:
;298:	return NULL;
CNSTP4 0
RETP4
LABELV $178
endproc UI_GetSpecialArenaInfo 12 8
proc UI_LoadBotsFromFile 8216 16
line 306
;299:}
;300:
;301:/*
;302:===============
;303:UI_LoadBotsFromFile
;304:===============
;305:*/
;306:static void UI_LoadBotsFromFile(const char* filename) {
line 311
;307:	int          len;
;308:	fileHandle_t f;
;309:	char         buf[MAX_BOTS_TEXT];
;310:
;311:	len = trap_FS_FOpenFile(filename, &f, FS_READ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8200
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8200
INDIRI4
ASGNI4
line 312
;312:	if (f == FS_INVALID_HANDLE) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $186
line 313
;313:		trap_Print(va(S_COLOR_RED "file not found: %s\n", filename));
ADDRGP4 $104
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 314
;314:		return;
ADDRGP4 $185
JUMPV
LABELV $186
line 316
;315:	}
;316:	if (len >= MAX_BOTS_TEXT) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $188
line 317
;317:		trap_Print(va(S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_BOTS_TEXT));
ADDRGP4 $107
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 8192
ARGI4
ADDRLP4 8204
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8204
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 318
;318:		trap_FS_FCloseFile(f);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 319
;319:		return;
ADDRGP4 $185
JUMPV
LABELV $188
line 322
;320:	}
;321:
;322:	trap_FS_Read(buf, len, f);
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 323
;323:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 324
;324:	trap_FS_FCloseFile(f);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 326
;325:
;326:	ui_numBots += UI_ParseInfos(buf, MAX_BOTS - ui_numBots, &ui_botInfos[ui_numBots]);
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 ui_numBots
ASGNP4
ADDRLP4 8208
ADDRLP4 8204
INDIRP4
INDIRI4
ASGNI4
CNSTI4 1024
ADDRLP4 8208
INDIRI4
SUBI4
ARGI4
ADDRLP4 8208
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 UI_ParseInfos
CALLI4
ASGNI4
ADDRLP4 8204
INDIRP4
ADDRLP4 8208
INDIRI4
ADDRLP4 8212
INDIRI4
ADDI4
ASGNI4
line 327
;327:	if (outOfMemory)
ADDRGP4 outOfMemory
INDIRI4
CNSTI4 0
EQI4 $190
line 328
;328:		trap_Print(S_COLOR_YELLOW "WARNING: not anough memory in pool to load all bots\n");
ADDRGP4 $192
ARGP4
ADDRGP4 trap_Print
CALLV
pop
LABELV $190
line 329
;329:}
LABELV $185
endproc UI_LoadBotsFromFile 8216 16
proc UI_LoadBots 2476 16
line 336
;330:
;331:/*
;332:===============
;333:UI_LoadBots
;334:===============
;335:*/
;336:static void UI_LoadBots(void) {
line 345
;337:	vmCvar_t botsFile;
;338:	int      numdirs;
;339:	char     filename[128];
;340:	char     dirlist[2048];
;341:	char*    dirptr;
;342:	int      i;
;343:	int      dirlen;
;344:
;345:	ui_numBots = 0;
ADDRGP4 ui_numBots
CNSTI4 0
ASGNI4
line 347
;346:
;347:	trap_Cvar_Register(&botsFile, "g_botsFile", "", CVAR_ARCHIVE | CVAR_LATCH);
ADDRLP4 2192
ARGP4
ADDRGP4 $194
ARGP4
ADDRGP4 $110
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 348
;348:	if (*botsFile.string && trap_Cvar_VariableValue("ui_gametype") != GT_SINGLE_PLAYER) {
ADDRLP4 2192+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $195
ADDRGP4 $198
ARGP4
ADDRLP4 2464
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 2464
INDIRF4
CNSTF4 1073741824
EQF4 $195
line 349
;349:		UI_LoadBotsFromFile(botsFile.string);
ADDRLP4 2192+16
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 350
;350:	} else {
ADDRGP4 $196
JUMPV
LABELV $195
line 351
;351:		UI_LoadBotsFromFile("scripts/bots.txt");
ADDRGP4 $200
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 352
;352:	}
LABELV $196
line 355
;353:
;354:	// get all bots from .bot files
;355:	numdirs = trap_FS_GetFileList("scripts", ".bot", dirlist, sizeof(dirlist));
ADDRGP4 $116
ARGP4
ADDRGP4 $201
ARGP4
ADDRLP4 144
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 2468
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 2468
INDIRI4
ASGNI4
line 356
;356:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 144
ASGNP4
line 357
;357:	for (i = 0; i < numdirs; i++, dirptr += dirlen + 1) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $205
JUMPV
LABELV $202
line 358
;358:		dirlen = strlen(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 2472
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 2472
INDIRI4
ASGNI4
line 359
;359:		strcpy(filename, "scripts/");
ADDRLP4 4
ARGP4
ADDRGP4 $122
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 360
;360:		strcat(filename, dirptr);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 361
;361:		UI_LoadBotsFromFile(filename);
ADDRLP4 4
ARGP4
ADDRGP4 UI_LoadBotsFromFile
CALLV
pop
line 362
;362:	}
LABELV $203
line 357
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
LABELV $205
ADDRLP4 132
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $202
line 363
;363:	trap_Print(va("%i bots parsed\n", ui_numBots));
ADDRGP4 $206
ARGP4
ADDRGP4 ui_numBots
INDIRI4
ARGI4
ADDRLP4 2472
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2472
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 364
;364:}
LABELV $193
endproc UI_LoadBots 2476 16
export UI_GetBotInfoByNumber
proc UI_GetBotInfoByNumber 8 8
line 371
;365:
;366:/*
;367:===============
;368:UI_GetBotInfoByNumber
;369:===============
;370:*/
;371:char* UI_GetBotInfoByNumber(int num) {
line 372
;372:	if (num < 0 || num >= ui_numBots) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $210
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numBots
INDIRI4
LTI4 $208
LABELV $210
line 373
;373:		trap_Print(va(S_COLOR_RED "Invalid bot number: %i\n", num));
ADDRGP4 $211
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 374
;374:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $207
JUMPV
LABELV $208
line 376
;375:	}
;376:	return ui_botInfos[num];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
RETP4
LABELV $207
endproc UI_GetBotInfoByNumber 8 8
export UI_GetBotInfoByName
proc UI_GetBotInfoByName 16 8
line 384
;377:}
;378:
;379:/*
;380:===============
;381:UI_GetBotInfoByName
;382:===============
;383:*/
;384:char* UI_GetBotInfoByName(const char* name) {
line 388
;385:	int   n;
;386:	char* value;
;387:
;388:	for (n = 0; n < ui_numBots; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $216
JUMPV
LABELV $213
line 389
;389:		value = Info_ValueForKey(ui_botInfos[n], "name");
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $217
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 390
;390:		if (!Q_stricmp(value, name)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $218
line 391
;391:			return ui_botInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_botInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $212
JUMPV
LABELV $218
line 393
;392:		}
;393:	}
LABELV $214
line 388
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $216
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numBots
INDIRI4
LTI4 $213
line 395
;394:
;395:	return NULL;
CNSTP4 0
RETP4
LABELV $212
endproc UI_GetBotInfoByName 16 8
export UI_GetBestScore
proc UI_GetBestScore 1080 16
line 409
;396:}
;397:
;398://
;399:// single player game info
;400://
;401:
;402:/*
;403:===============
;404:UI_GetBestScore
;405:
;406:Returns the player's best finish on a given level, 0 if the have not played the level
;407:===============
;408:*/
;409:void UI_GetBestScore(int level, int* score, int* skill) {
line 417
;410:	int  n;
;411:	int  skillScore;
;412:	int  bestScore;
;413:	int  bestScoreSkill;
;414:	char arenaKey[16];
;415:	char scores[MAX_INFO_VALUE];
;416:
;417:	if (!score || !skill) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $223
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $221
LABELV $223
line 418
;418:		return;
ADDRGP4 $220
JUMPV
LABELV $221
line 421
;419:	}
;420:
;421:	if (level < 0 || level > ui_numArenas) {
ADDRLP4 1056
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
LTI4 $226
ADDRLP4 1056
INDIRI4
ADDRGP4 ui_numArenas
INDIRI4
LEI4 $224
LABELV $226
line 422
;422:		return;
ADDRGP4 $220
JUMPV
LABELV $224
line 425
;423:	}
;424:
;425:	bestScore      = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 426
;426:	bestScoreSkill = 0;
ADDRLP4 1052
CNSTI4 0
ASGNI4
line 428
;427:
;428:	for (n = 1; n <= 5; n++) {
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $227
line 429
;429:		trap_Cvar_VariableStringBuffer(va("g_spScores%i", n), scores, MAX_INFO_VALUE);
ADDRGP4 $231
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 431
;430:
;431:		Com_sprintf(arenaKey, sizeof(arenaKey), "l%i", level);
ADDRLP4 8
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $232
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 432
;432:		skillScore = atoi(Info_ValueForKey(scores, arenaKey));
ADDRLP4 28
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1068
INDIRI4
ASGNI4
line 434
;433:
;434:		if (skillScore < 1 || skillScore > 8) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $235
ADDRLP4 0
INDIRI4
CNSTI4 8
LEI4 $233
LABELV $235
line 435
;435:			continue;
ADDRGP4 $228
JUMPV
LABELV $233
line 438
;436:		}
;437:
;438:		if (!bestScore || skillScore <= bestScore) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $238
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
GTI4 $236
LABELV $238
line 439
;439:			bestScore      = skillScore;
ADDRLP4 24
ADDRLP4 0
INDIRI4
ASGNI4
line 440
;440:			bestScoreSkill = n;
ADDRLP4 1052
ADDRLP4 4
INDIRI4
ASGNI4
line 441
;441:		}
LABELV $236
line 442
;442:	}
LABELV $228
line 428
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5
LEI4 $227
line 444
;443:
;444:	*score = bestScore;
ADDRFP4 4
INDIRP4
ADDRLP4 24
INDIRI4
ASGNI4
line 445
;445:	*skill = bestScoreSkill;
ADDRFP4 8
INDIRP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 446
;446:}
LABELV $220
endproc UI_GetBestScore 1080 16
export UI_SetBestScore
proc UI_SetBestScore 1084 16
line 455
;447:
;448:/*
;449:===============
;450:UI_SetBestScore
;451:
;452:Set the player's best finish for a level
;453:===============
;454:*/
;455:void UI_SetBestScore(int level, int score) {
line 462
;456:	int  skill;
;457:	int  oldScore;
;458:	char arenaKey[16];
;459:	char scores[MAX_INFO_VALUE];
;460:
;461:	// validate score
;462:	if (score < 1 || score > 8) {
ADDRLP4 1048
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 1
LTI4 $242
ADDRLP4 1048
INDIRI4
CNSTI4 8
LEI4 $240
LABELV $242
line 463
;463:		return;
ADDRGP4 $239
JUMPV
LABELV $240
line 467
;464:	}
;465:
;466:	// validate skill
;467:	skill = (int)trap_Cvar_VariableValue("g_spSkill");
ADDRGP4 $243
ARGP4
ADDRLP4 1052
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 1052
INDIRF4
CVFI4 4
ASGNI4
line 468
;468:	if (skill < 1 || skill > 5) {
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $246
ADDRLP4 0
INDIRI4
CNSTI4 5
LEI4 $244
LABELV $246
line 469
;469:		return;
ADDRGP4 $239
JUMPV
LABELV $244
line 473
;470:	}
;471:
;472:	// get scores
;473:	trap_Cvar_VariableStringBuffer(va("g_spScores%i", skill), scores, MAX_INFO_VALUE);
ADDRGP4 $231
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 476
;474:
;475:	// see if this is better
;476:	Com_sprintf(arenaKey, sizeof(arenaKey), "l%i", level);
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $232
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 477
;477:	oldScore = atoi(Info_ValueForKey(scores, arenaKey));
ADDRLP4 20
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1064
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
ADDRLP4 1068
INDIRI4
ASGNI4
line 478
;478:	if (oldScore && oldScore <= score) {
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $247
ADDRLP4 1044
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $247
line 479
;479:		return;
ADDRGP4 $239
JUMPV
LABELV $247
line 483
;480:	}
;481:
;482:	// update scores
;483:	Info_SetValueForKey(scores, arenaKey, va("%i", score));
ADDRGP4 $132
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1076
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1076
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 484
;484:	trap_Cvar_Set(va("g_spScores%i", skill), scores);
ADDRGP4 $231
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1080
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1080
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 485
;485:}
LABELV $239
endproc UI_SetBestScore 1084 16
export UI_LogAwardData
proc UI_LogAwardData 1056 16
line 492
;486:
;487:/*
;488:===============
;489:UI_LogAwardData
;490:===============
;491:*/
;492:void UI_LogAwardData(int award, int data) {
line 497
;493:	char key[16];
;494:	char awardData[MAX_INFO_VALUE];
;495:	int  oldValue;
;496:
;497:	if (data == 0) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $250
line 498
;498:		return;
ADDRGP4 $249
JUMPV
LABELV $250
line 501
;499:	}
;500:
;501:	if (award > AWARD_PERFECT) {
ADDRFP4 0
INDIRI4
CNSTI4 5
LEI4 $252
line 502
;502:		trap_Print(va(S_COLOR_RED "Bad award %i in UI_LogAwardData\n", award));
ADDRGP4 $254
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 503
;503:		return;
ADDRGP4 $249
JUMPV
LABELV $252
line 506
;504:	}
;505:
;506:	trap_Cvar_VariableStringBuffer("g_spAwards", awardData, sizeof(awardData));
ADDRGP4 $255
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 508
;507:
;508:	Com_sprintf(key, sizeof(key), "a%i", award);
ADDRLP4 1024
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $256
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 509
;509:	oldValue = atoi(Info_ValueForKey(awardData, key));
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
ADDRLP4 1048
INDIRI4
ASGNI4
line 511
;510:
;511:	Info_SetValueForKey(awardData, key, va("%i", oldValue + data));
ADDRGP4 $132
ARGP4
ADDRLP4 1040
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ARGI4
ADDRLP4 1052
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1052
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 512
;512:	trap_Cvar_Set("g_spAwards", awardData);
ADDRGP4 $255
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 513
;513:}
LABELV $249
endproc UI_LogAwardData 1056 16
export UI_GetAwardLevel
proc UI_GetAwardLevel 1048 16
line 520
;514:
;515:/*
;516:===============
;517:UI_GetAwardLevel
;518:===============
;519:*/
;520:int UI_GetAwardLevel(int award) {
line 524
;521:	char key[16];
;522:	char awardData[MAX_INFO_VALUE];
;523:
;524:	trap_Cvar_VariableStringBuffer("g_spAwards", awardData, sizeof(awardData));
ADDRGP4 $255
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 526
;525:
;526:	Com_sprintf(key, sizeof(key), "a%i", award);
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $256
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 527
;527:	return atoi(Info_ValueForKey(awardData, key));
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
RETI4
LABELV $257
endproc UI_GetAwardLevel 1048 16
export UI_TierCompleted
proc UI_TierCompleted 56 12
line 535
;528:}
;529:
;530:/*
;531:===============
;532:UI_TierCompleted
;533:===============
;534:*/
;535:int UI_TierCompleted(int levelWon) {
line 543
;536:	int         level;
;537:	int         n;
;538:	int         tier;
;539:	int         score;
;540:	int         skill;
;541:	const char* info;
;542:
;543:	tier  = levelWon / ARENAS_PER_TIER;
ADDRLP4 16
ADDRFP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 544
;544:	level = tier * ARENAS_PER_TIER;
ADDRLP4 0
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ASGNI4
line 546
;545:
;546:	if (tier == UI_GetNumSPTiers()) {
ADDRLP4 24
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
NEI4 $259
line 547
;547:		info = UI_GetSpecialArenaInfo("training");
ADDRGP4 $261
ARGP4
ADDRLP4 28
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 28
INDIRP4
ASGNP4
line 548
;548:		if (levelWon == atoi(Info_ValueForKey(info, "num"))) {
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $262
line 549
;549:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $258
JUMPV
LABELV $262
line 551
;550:		}
;551:		info = UI_GetSpecialArenaInfo("final");
ADDRGP4 $264
ARGP4
ADDRLP4 40
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 40
INDIRP4
ASGNP4
line 552
;552:		if (!info || levelWon == atoi(Info_ValueForKey(info, "num"))) {
ADDRLP4 44
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $267
ADDRLP4 44
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 48
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRI4
ADDRLP4 52
INDIRI4
NEI4 $265
LABELV $267
line 553
;553:			return tier + 1;
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
RETI4
ADDRGP4 $258
JUMPV
LABELV $265
line 555
;554:		}
;555:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $258
JUMPV
LABELV $259
line 558
;556:	}
;557:
;558:	for (n = 0; n < ARENAS_PER_TIER; n++, level++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $268
line 559
;559:		UI_GetBestScore(level, &score, &skill);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 560
;560:		if (score != 1) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $272
line 561
;561:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $258
JUMPV
LABELV $272
line 563
;562:		}
;563:	}
LABELV $269
line 558
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $268
line 564
;564:	return tier + 1;
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
RETI4
LABELV $258
endproc UI_TierCompleted 56 12
export UI_ShowTierVideo
proc UI_ShowTierVideo 1052 16
line 572
;565:}
;566:
;567:/*
;568:===============
;569:UI_ShowTierVideo
;570:===============
;571:*/
;572:qboolean UI_ShowTierVideo(int tier) {
line 576
;573:	char key[16];
;574:	char videos[MAX_INFO_VALUE];
;575:
;576:	if (tier <= 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
GTI4 $275
line 577
;577:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $274
JUMPV
LABELV $275
line 580
;578:	}
;579:
;580:	trap_Cvar_VariableStringBuffer("g_spVideos", videos, sizeof(videos));
ADDRGP4 $277
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 582
;581:
;582:	Com_sprintf(key, sizeof(key), "tier%i", tier);
ADDRLP4 1024
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $278
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 583
;583:	if (atoi(Info_ValueForKey(videos, key))) {
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $279
line 584
;584:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $274
JUMPV
LABELV $279
line 587
;585:	}
;586:
;587:	Info_SetValueForKey(videos, key, va("%i", 1));
ADDRGP4 $132
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1024
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 588
;588:	trap_Cvar_Set("g_spVideos", videos);
ADDRGP4 $277
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 590
;589:
;590:	return qtrue;
CNSTI4 1
RETI4
LABELV $274
endproc UI_ShowTierVideo 1052 16
export UI_CanShowTierVideo
proc UI_CanShowTierVideo 1048 16
line 598
;591:}
;592:
;593:/*
;594:===============
;595:UI_CanShowTierVideo
;596:===============
;597:*/
;598:qboolean UI_CanShowTierVideo(int tier) {
line 602
;599:	char key[16];
;600:	char videos[MAX_INFO_VALUE];
;601:
;602:	if (!tier) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $282
line 603
;603:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $281
JUMPV
LABELV $282
line 606
;604:	}
;605:
;606:	if (uis.demoversion && tier != 8) {
ADDRGP4 uis+11468
INDIRI4
CNSTI4 0
EQI4 $284
ADDRFP4 0
INDIRI4
CNSTI4 8
EQI4 $284
line 607
;607:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $281
JUMPV
LABELV $284
line 610
;608:	}
;609:
;610:	trap_Cvar_VariableStringBuffer("g_spVideos", videos, sizeof(videos));
ADDRGP4 $277
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 612
;611:
;612:	Com_sprintf(key, sizeof(key), "tier%i", tier);
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $278
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 613
;613:	if (atoi(Info_ValueForKey(videos, key))) {
ADDRLP4 16
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $287
line 614
;614:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $281
JUMPV
LABELV $287
line 617
;615:	}
;616:
;617:	return qfalse;
CNSTI4 0
RETI4
LABELV $281
endproc UI_CanShowTierVideo 1048 16
export UI_GetCurrentGame
proc UI_GetCurrentGame 32 12
line 627
;618:}
;619:
;620:/*
;621:===============
;622:UI_GetCurrentGame
;623:
;624:Returns the next level the player has not won
;625:===============
;626:*/
;627:int UI_GetCurrentGame(void) {
line 629
;628:	int         level;
;629:	int         rank = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 633
;630:	int         skill;
;631:	const char* info;
;632:
;633:	info = UI_GetSpecialArenaInfo("training");
ADDRGP4 $261
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 634
;634:	if (info) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $290
line 635
;635:		level = atoi(Info_ValueForKey(info, "num"));
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 636
;636:		UI_GetBestScore(level, &rank, &skill);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 637
;637:		if (!rank || rank > 1) {
ADDRLP4 28
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $294
ADDRLP4 28
INDIRI4
CNSTI4 1
LEI4 $292
LABELV $294
line 638
;638:			return level;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $289
JUMPV
LABELV $292
line 640
;639:		}
;640:	}
LABELV $290
line 642
;641:
;642:	for (level = 0; level < ui_numSinglePlayerArenas; level++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $298
JUMPV
LABELV $295
line 643
;643:		UI_GetBestScore(level, &rank, &skill);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 644
;644:		if (!rank || rank > 1) {
ADDRLP4 20
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $301
ADDRLP4 20
INDIRI4
CNSTI4 1
LEI4 $299
LABELV $301
line 645
;645:			return level;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $289
JUMPV
LABELV $299
line 647
;646:		}
;647:	}
LABELV $296
line 642
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $298
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
LTI4 $295
line 649
;648:
;649:	info = UI_GetSpecialArenaInfo("final");
ADDRGP4 $264
ARGP4
ADDRLP4 20
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 650
;650:	if (!info) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $302
line 651
;651:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $289
JUMPV
LABELV $302
line 653
;652:	}
;653:	return atoi(Info_ValueForKey(info, "num"));
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $131
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
RETI4
LABELV $289
endproc UI_GetCurrentGame 32 12
export UI_NewGame
proc UI_NewGame 0 8
line 663
;654:}
;655:
;656:/*
;657:===============
;658:UI_NewGame
;659:
;660:Clears the scores and sets the difficutly level
;661:===============
;662:*/
;663:void UI_NewGame(void) {
line 664
;664:	trap_Cvar_Set("g_spScores1", "");
ADDRGP4 $305
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 665
;665:	trap_Cvar_Set("g_spScores2", "");
ADDRGP4 $306
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 666
;666:	trap_Cvar_Set("g_spScores3", "");
ADDRGP4 $307
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 667
;667:	trap_Cvar_Set("g_spScores4", "");
ADDRGP4 $308
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 668
;668:	trap_Cvar_Set("g_spScores5", "");
ADDRGP4 $309
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 669
;669:	trap_Cvar_Set("g_spAwards", "");
ADDRGP4 $255
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 670
;670:	trap_Cvar_Set("g_spVideos", "");
ADDRGP4 $277
ARGP4
ADDRGP4 $110
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 671
;671:}
LABELV $304
endproc UI_NewGame 0 8
export UI_GetNumArenas
proc UI_GetNumArenas 0 0
line 678
;672:
;673:/*
;674:===============
;675:UI_GetNumArenas
;676:===============
;677:*/
;678:int UI_GetNumArenas(void) {
line 679
;679:	return ui_numArenas;
ADDRGP4 ui_numArenas
INDIRI4
RETI4
LABELV $310
endproc UI_GetNumArenas 0 0
export UI_GetNumSPArenas
proc UI_GetNumSPArenas 0 0
line 687
;680:}
;681:
;682:/*
;683:===============
;684:UI_GetNumSPArenas
;685:===============
;686:*/
;687:int UI_GetNumSPArenas(void) {
line 688
;688:	return ui_numSinglePlayerArenas;
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
RETI4
LABELV $311
endproc UI_GetNumSPArenas 0 0
export UI_GetNumSPTiers
proc UI_GetNumSPTiers 0 0
line 696
;689:}
;690:
;691:/*
;692:===============
;693:UI_GetNumSPTiers
;694:===============
;695:*/
;696:int UI_GetNumSPTiers(void) {
line 697
;697:	return ui_numSinglePlayerArenas / ARENAS_PER_TIER;
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
CNSTI4 4
DIVI4
RETI4
LABELV $312
endproc UI_GetNumSPTiers 0 0
export UI_GetNumBots
proc UI_GetNumBots 0 0
line 705
;698:}
;699:
;700:/*
;701:===============
;702:UI_GetNumBots
;703:===============
;704:*/
;705:int UI_GetNumBots(void) {
line 706
;706:	return ui_numBots;
ADDRGP4 ui_numBots
INDIRI4
RETI4
LABELV $313
endproc UI_GetNumBots 0 0
export UI_SPUnlock_f
proc UI_SPUnlock_f 1048 16
line 714
;707:}
;708:
;709:/*
;710:===============
;711:UI_SPUnlock_f
;712:===============
;713:*/
;714:void UI_SPUnlock_f(void) {
line 721
;715:	char arenaKey[16];
;716:	char scores[MAX_INFO_VALUE];
;717:	int  level;
;718:	int  tier;
;719:
;720:	// get scores for skill 1
;721:	trap_Cvar_VariableStringBuffer("g_spScores1", scores, MAX_INFO_VALUE);
ADDRGP4 $305
ARGP4
ADDRLP4 24
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 724
;722:
;723:	// update scores
;724:	for (level = 0; level < ui_numSinglePlayerArenas + ui_numSpecialSinglePlayerArenas; level++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $318
JUMPV
LABELV $315
line 725
;725:		Com_sprintf(arenaKey, sizeof(arenaKey), "l%i", level);
ADDRLP4 8
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $232
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 726
;726:		Info_SetValueForKey(scores, arenaKey, "1");
ADDRLP4 24
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 $319
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 727
;727:	}
LABELV $316
line 724
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $318
ADDRLP4 0
INDIRI4
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
ADDRGP4 ui_numSpecialSinglePlayerArenas
INDIRI4
ADDI4
LTI4 $315
line 728
;728:	trap_Cvar_Set("g_spScores1", scores);
ADDRGP4 $305
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 731
;729:
;730:	// unlock cinematics
;731:	for (tier = 1; tier <= 8; tier++) {
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $320
line 732
;732:		UI_ShowTierVideo(tier);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_ShowTierVideo
CALLI4
pop
line 733
;733:	}
LABELV $321
line 731
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LEI4 $320
line 735
;734:
;735:	trap_Print("All levels unlocked at skill level 1\n");
ADDRGP4 $324
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 737
;736:
;737:	UI_SPLevelMenu_ReInit();
ADDRGP4 UI_SPLevelMenu_ReInit
CALLV
pop
line 738
;738:}
LABELV $314
endproc UI_SPUnlock_f 1048 16
export UI_SPUnlockMedals_f
proc UI_SPUnlockMedals_f 1044 16
line 745
;739:
;740:/*
;741:===============
;742:UI_SPUnlockMedals_f
;743:===============
;744:*/
;745:void UI_SPUnlockMedals_f(void) {
line 750
;746:	int  n;
;747:	char key[16];
;748:	char awardData[MAX_INFO_VALUE];
;749:
;750:	trap_Cvar_VariableStringBuffer("g_spAwards", awardData, MAX_INFO_VALUE);
ADDRGP4 $255
ARGP4
ADDRLP4 20
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 752
;751:
;752:	for (n = 0; n < 6; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $326
line 753
;753:		Com_sprintf(key, sizeof(key), "a%i", n);
ADDRLP4 4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $256
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 754
;754:		Info_SetValueForKey(awardData, key, "100");
ADDRLP4 20
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 $330
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 755
;755:	}
LABELV $327
line 752
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $326
line 757
;756:
;757:	trap_Cvar_Set("g_spAwards", awardData);
ADDRGP4 $255
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 759
;758:
;759:	trap_Print("All levels unlocked at 100\n");
ADDRGP4 $331
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 760
;760:}
LABELV $325
endproc UI_SPUnlockMedals_f 1044 16
export UI_InitGameinfo
proc UI_InitGameinfo 4 4
line 767
;761:
;762:/*
;763:===============
;764:UI_InitGameinfo
;765:===============
;766:*/
;767:void UI_InitGameinfo(void) {
line 769
;768:
;769:	UI_InitMemory();
ADDRGP4 UI_InitMemory
CALLV
pop
line 770
;770:	UI_LoadArenas();
ADDRGP4 UI_LoadArenas
CALLV
pop
line 771
;771:	UI_LoadBots();
ADDRGP4 UI_LoadBots
CALLV
pop
line 773
;772:
;773:	if ((trap_Cvar_VariableValue("fs_restrict")) || (ui_numSpecialSinglePlayerArenas == 0 && ui_numSinglePlayerArenas == 4)) {
ADDRGP4 $335
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
CNSTF4 0
NEF4 $336
ADDRGP4 ui_numSpecialSinglePlayerArenas
INDIRI4
CNSTI4 0
NEI4 $333
ADDRGP4 ui_numSinglePlayerArenas
INDIRI4
CNSTI4 4
NEI4 $333
LABELV $336
line 774
;774:		uis.demoversion = qtrue;
ADDRGP4 uis+11468
CNSTI4 1
ASGNI4
line 775
;775:	} else {
ADDRGP4 $334
JUMPV
LABELV $333
line 776
;776:		uis.demoversion = qfalse;
ADDRGP4 uis+11468
CNSTI4 0
ASGNI4
line 777
;777:	}
LABELV $334
line 778
;778:}
LABELV $332
endproc UI_InitGameinfo 4 4
bss
align 4
LABELV outOfMemory
skip 4
align 4
LABELV allocPoint
skip 4
align 1
LABELV memoryPool
skip 131072
align 4
LABELV ui_numSpecialSinglePlayerArenas
skip 4
align 4
LABELV ui_numSinglePlayerArenas
skip 4
align 4
LABELV ui_arenaInfos
skip 4096
align 4
LABELV ui_numArenas
skip 4
align 4
LABELV ui_botInfos
skip 4096
export ui_numBots
align 4
LABELV ui_numBots
skip 4
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_LoadCachedServers
import trap_LAN_SaveCachedServers
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyServer_Cache
import UI_SpecifyServerMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import UI_VideoCheck
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import ui_cdkeychecked
import ui_cdkey
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
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
LABELV $335
byte 1 102
byte 1 115
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $331
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 49
byte 1 48
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $330
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $324
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 108
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 32
byte 1 49
byte 1 10
byte 1 0
align 1
LABELV $319
byte 1 49
byte 1 0
align 1
LABELV $309
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 53
byte 1 0
align 1
LABELV $308
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 52
byte 1 0
align 1
LABELV $307
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 51
byte 1 0
align 1
LABELV $306
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 50
byte 1 0
align 1
LABELV $305
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 49
byte 1 0
align 1
LABELV $278
byte 1 116
byte 1 105
byte 1 101
byte 1 114
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $277
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $264
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $261
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $256
byte 1 97
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $255
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $254
byte 1 94
byte 1 49
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 97
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 85
byte 1 73
byte 1 95
byte 1 76
byte 1 111
byte 1 103
byte 1 65
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 68
byte 1 97
byte 1 116
byte 1 97
byte 1 10
byte 1 0
align 1
LABELV $243
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $232
byte 1 108
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $231
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $217
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $211
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
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
byte 1 10
byte 1 0
align 1
LABELV $206
byte 1 37
byte 1 105
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $201
byte 1 46
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $200
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $198
byte 1 117
byte 1 105
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $194
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $192
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 111
byte 1 108
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
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $177
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $163
byte 1 94
byte 1 49
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
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
byte 1 10
byte 1 0
align 1
LABELV $148
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 32
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 32
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $143
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $142
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $137
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $132
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $131
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $126
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 110
byte 1 111
byte 1 117
byte 1 103
byte 1 104
byte 1 32
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 111
byte 1 108
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
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $123
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $122
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $117
byte 1 46
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $116
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $115
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 46
byte 1 116
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $110
byte 1 0
align 1
LABELV $109
byte 1 103
byte 1 95
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 115
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $107
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $104
byte 1 94
byte 1 49
byte 1 102
byte 1 105
byte 1 108
byte 1 101
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
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $98
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $97
byte 1 92
byte 1 110
byte 1 117
byte 1 109
byte 1 92
byte 1 0
align 1
LABELV $96
byte 1 60
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 62
byte 1 0
align 1
LABELV $93
byte 1 125
byte 1 0
align 1
LABELV $90
byte 1 85
byte 1 110
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $84
byte 1 77
byte 1 97
byte 1 120
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $81
byte 1 77
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $80
byte 1 123
byte 1 0
