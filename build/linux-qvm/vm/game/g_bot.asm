export trap_Cvar_VariableValue
code
proc trap_Cvar_VariableValue 132 12
file "../../../../code/game/g_bot.c"
line 33
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_bot.c
;4:
;5:#include "g_local.h"
;6:
;7:static int   g_numBots;
;8:static char* g_botInfos[MAX_BOTS];
;9:
;10:int          g_numArenas;
;11:static char* g_arenaInfos[MAX_ARENAS];
;12:
;13:#define BOT_BEGIN_DELAY_BASE      2000
;14:#define BOT_BEGIN_DELAY_INCREMENT 1500
;15:
;16:#define BOT_SPAWN_QUEUE_DEPTH 16
;17:
;18:typedef struct {
;19:	int clientNum;
;20:	int spawnTime;
;21:} botSpawnQueue_t;
;22:
;23:static botSpawnQueue_t botSpawnQueue[BOT_SPAWN_QUEUE_DEPTH];
;24:
;25:vmCvar_t               bot_minplayers;
;26:
;27:extern gentity_t*      podium1;
;28:extern gentity_t*      podium2;
;29:extern gentity_t*      podium3;
;30:
;31:extern char            mapname[MAX_QPATH];
;32:
;33:float                  trap_Cvar_VariableValue(const char* var_name) {
line 36
;34:					 char buf[128];
;35:
;36:					 trap_Cvar_VariableStringBuffer(var_name, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 37
;37:					 return atof(buf);
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
RETF4
LABELV $55
endproc trap_Cvar_VariableValue 132 12
export G_ParseInfos
proc G_ParseInfos 2084 12
line 45
;38:}
;39:
;40:/*
;41:===============
;42:G_ParseInfos
;43:===============
;44:*/
;45:int G_ParseInfos(char* buf, int max, char* infos[]) {
line 51
;46:	char* token;
;47:	int   count;
;48:	char  key[MAX_TOKEN_CHARS];
;49:	char  info[MAX_INFO_STRING];
;50:
;51:	count = 0;
ADDRLP4 2052
CNSTI4 0
ASGNI4
ADDRGP4 $58
JUMPV
LABELV $57
line 53
;52:
;53:	while (1) {
line 54
;54:		token = COM_Parse(&buf);
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
line 55
;55:		if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $60
line 56
;56:			break;
ADDRGP4 $59
JUMPV
LABELV $60
line 58
;57:		}
;58:		if (strcmp(token, "{")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $64
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
EQI4 $62
line 59
;59:			Com_Printf("Missing { in info file\n");
ADDRGP4 $65
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 60
;60:			break;
ADDRGP4 $59
JUMPV
LABELV $62
line 63
;61:		}
;62:
;63:		if (count == max) {
ADDRLP4 2052
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $66
line 64
;64:			Com_Printf("Max infos exceeded\n");
ADDRGP4 $68
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 65
;65:			break;
ADDRGP4 $59
JUMPV
LABELV $66
line 68
;66:		}
;67:
;68:		info[0] = '\0';
ADDRLP4 1028
CNSTI1 0
ASGNI1
ADDRGP4 $70
JUMPV
LABELV $69
line 69
;69:		while (1) {
line 70
;70:			token = COM_ParseExt(&buf, qtrue);
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
line 71
;71:			if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $72
line 72
;72:				Com_Printf("Unexpected end of info file\n");
ADDRGP4 $74
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 73
;73:				break;
ADDRGP4 $71
JUMPV
LABELV $72
line 75
;74:			}
;75:			if (!strcmp(token, "}")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $77
ARGP4
ADDRLP4 2068
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2068
INDIRI4
CNSTI4 0
NEI4 $75
line 76
;76:				break;
ADDRGP4 $71
JUMPV
LABELV $75
line 78
;77:			}
;78:			Q_strncpyz(key, token, sizeof(key));
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
line 80
;79:
;80:			token = COM_ParseExt(&buf, qfalse);
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
line 81
;81:			if (!token[0]) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $78
line 82
;82:				strcpy(token, "<NULL>");
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $80
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 83
;83:			}
LABELV $78
line 84
;84:			Info_SetValueForKey(info, key, token);
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
line 85
;85:		}
LABELV $70
line 69
ADDRGP4 $69
JUMPV
LABELV $71
line 87
;86:		// NOTE: extra space for arena number
;87:		infos[count] = G_Alloc(strlen(info) + strlen("\\num\\") + strlen(va("%d", MAX_ARENAS)) + 1);
ADDRLP4 1028
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $81
ARGP4
ADDRLP4 2068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRGP4 $82
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
ADDRGP4 G_Alloc
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
line 88
;88:		if (infos[count]) {
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
EQU4 $83
line 89
;89:			strcpy(infos[count], info);
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
line 90
;90:			count++;
ADDRLP4 2052
ADDRLP4 2052
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 91
;91:		}
LABELV $83
line 92
;92:	}
LABELV $58
line 53
ADDRGP4 $57
JUMPV
LABELV $59
line 93
;93:	return count;
ADDRLP4 2052
INDIRI4
RETI4
LABELV $56
endproc G_ParseInfos 2084 12
proc G_LoadArenasFromFile 8216 16
line 101
;94:}
;95:
;96:/*
;97:===============
;98:G_LoadArenasFromFile
;99:===============
;100:*/
;101:static void G_LoadArenasFromFile(const char* filename) {
line 106
;102:	int          len;
;103:	fileHandle_t f;
;104:	char         buf[MAX_ARENAS_TEXT];
;105:
;106:	len = trap_FS_FOpenFile(filename, &f, FS_READ);
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
line 107
;107:	if (f == FS_INVALID_HANDLE) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $86
line 108
;108:		trap_Print(va(S_COLOR_RED "file not found: %s\n", filename));
ADDRGP4 $88
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
line 109
;109:		return;
ADDRGP4 $85
JUMPV
LABELV $86
line 111
;110:	}
;111:	if (len >= MAX_ARENAS_TEXT) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $89
line 112
;112:		trap_Print(va(S_COLOR_RED "file too large: %s is %i, max allowed is %i", filename, len, MAX_ARENAS_TEXT));
ADDRGP4 $91
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
line 113
;113:		trap_FS_FCloseFile(f);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 114
;114:		return;
ADDRGP4 $85
JUMPV
LABELV $89
line 117
;115:	}
;116:
;117:	trap_FS_Read(buf, len, f);
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
line 118
;118:	buf[len] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 119
;119:	trap_FS_FCloseFile(f);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 121
;120:
;121:	g_numArenas += G_ParseInfos(buf, MAX_ARENAS - g_numArenas, &g_arenaInfos[g_numArenas]);
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 g_numArenas
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
ADDRGP4 g_arenaInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 G_ParseInfos
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
line 122
;122:}
LABELV $85
endproc G_LoadArenasFromFile 8216 16
proc G_LoadArenas 1456 16
line 129
;123:
;124:/*
;125:===============
;126:G_LoadArenas
;127:===============
;128:*/
;129:static void G_LoadArenas(void) {
line 138
;130:	int      numdirs;
;131:	vmCvar_t arenasFile;
;132:	char     filename[128];
;133:	char     dirlist[1024];
;134:	char*    dirptr;
;135:	int      i, n;
;136:	int      dirlen;
;137:
;138:	g_numArenas = 0;
ADDRGP4 g_numArenas
CNSTI4 0
ASGNI4
line 140
;139:
;140:	trap_Cvar_Register(&arenasFile, "g_arenasFile", "", CVAR_INIT | CVAR_ROM);
ADDRLP4 1172
ARGP4
ADDRGP4 $93
ARGP4
ADDRGP4 $94
ARGP4
CNSTI4 80
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 141
;141:	if (*arenasFile.string) {
ADDRLP4 1172+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $95
line 142
;142:		G_LoadArenasFromFile(arenasFile.string);
ADDRLP4 1172+16
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 143
;143:	} else {
ADDRGP4 $96
JUMPV
LABELV $95
line 144
;144:		G_LoadArenasFromFile("scripts/arenas.txt");
ADDRGP4 $99
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 145
;145:	}
LABELV $96
line 148
;146:
;147:	// get all arenas from .arena files
;148:	numdirs = trap_FS_GetFileList("scripts", ".arena", dirlist, sizeof(dirlist));
ADDRGP4 $100
ARGP4
ADDRGP4 $101
ARGP4
ADDRLP4 148
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1444
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 144
ADDRLP4 1444
INDIRI4
ASGNI4
line 149
;149:	dirptr  = dirlist;
ADDRLP4 4
ADDRLP4 148
ASGNP4
line 150
;150:	for (i = 0; i < numdirs; i++, dirptr += dirlen + 1) {
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 $105
JUMPV
LABELV $102
line 151
;151:		dirlen = (int)strlen(dirptr);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 1448
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 1448
INDIRI4
ASGNI4
line 152
;152:		strcpy(filename, "scripts/");
ADDRLP4 8
ARGP4
ADDRGP4 $106
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 153
;153:		strcat(filename, dirptr);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 154
;154:		G_LoadArenasFromFile(filename);
ADDRLP4 8
ARGP4
ADDRGP4 G_LoadArenasFromFile
CALLV
pop
line 155
;155:	}
LABELV $103
line 150
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 4
INDIRP4
ADDP4
ASGNP4
LABELV $105
ADDRLP4 136
INDIRI4
ADDRLP4 144
INDIRI4
LTI4 $102
line 156
;156:	trap_Print(va("%i arenas parsed\n", g_numArenas));
ADDRGP4 $107
ARGP4
ADDRGP4 g_numArenas
INDIRI4
ARGI4
ADDRLP4 1448
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1448
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 158
;157:
;158:	for (n = 0; n < g_numArenas; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $111
JUMPV
LABELV $108
line 159
;159:		Info_SetValueForKey(g_arenaInfos[n], "num", va("%i", n));
ADDRGP4 $113
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1452
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $112
ARGP4
ADDRLP4 1452
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 160
;160:	}
LABELV $109
line 158
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $111
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $108
line 161
;161:}
LABELV $92
endproc G_LoadArenas 1456 16
export G_GetArenaInfoByMap
proc G_GetArenaInfoByMap 12 8
line 168
;162:
;163:/*
;164:===============
;165:G_GetArenaInfoByNumber
;166:===============
;167:*/
;168:const char* G_GetArenaInfoByMap(const char* map) {
line 171
;169:	int n;
;170:
;171:	for (n = 0; n < g_numArenas; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $118
JUMPV
LABELV $115
line 172
;172:		if (Q_stricmp(Info_ValueForKey(g_arenaInfos[n], "map"), map) == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $121
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
NEI4 $119
line 173
;173:			return g_arenaInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $114
JUMPV
LABELV $119
line 175
;174:		}
;175:	}
LABELV $116
line 171
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $118
ADDRLP4 0
INDIRI4
ADDRGP4 g_numArenas
INDIRI4
LTI4 $115
line 177
;176:
;177:	return NULL;
CNSTP4 0
RETP4
LABELV $114
endproc G_GetArenaInfoByMap 12 8
proc PlayerIntroSound 80 12
line 185
;178:}
;179:
;180:/*
;181:=================
;182:PlayerIntroSound
;183:=================
;184:*/
;185:static void PlayerIntroSound(const char* modelAndSkin) {
line 189
;186:	char  model[MAX_QPATH];
;187:	char* skin;
;188:
;189:	Q_strncpyz(model, modelAndSkin, sizeof(model));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 190
;190:	skin = Q_strrchr(model, '/');
ADDRLP4 4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 68
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 191
;191:	if (skin) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $123
line 192
;192:		*skin++ = '\0';
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI1 0
ASGNI1
line 193
;193:	} else {
ADDRGP4 $124
JUMPV
LABELV $123
line 194
;194:		skin = model;
ADDRLP4 0
ADDRLP4 4
ASGNP4
line 195
;195:	}
LABELV $124
line 197
;196:
;197:	if (Q_stricmp(skin, "default") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $127
ARGP4
ADDRLP4 72
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $125
line 198
;198:		skin = model;
ADDRLP4 0
ADDRLP4 4
ASGNP4
line 199
;199:	}
LABELV $125
line 201
;200:
;201:	trap_SendConsoleCommand(EXEC_APPEND, va("play sound/player/announce/%s.wav\n", skin));
ADDRGP4 $128
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 202
;202:}
LABELV $122
endproc PlayerIntroSound 80 12
export G_AddRandomBot
proc G_AddRandomBot 96 16
line 209
;203:
;204:/*
;205:===============
;206:G_AddRandomBot
;207:===============
;208:*/
;209:void G_AddRandomBot(team_t team) {
line 215
;210:	int        i, n, num;
;211:	float      skill;
;212:	char *     value, netname[36], *teamstr, *skillstr;
;213:	gclient_t* cl;
;214:
;215:	num = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 216
;216:	for (n = 0; n < g_numBots; n++) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $133
JUMPV
LABELV $130
line 217
;217:		value = Info_ValueForKey(g_botInfos[n], "name");
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 68
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 68
INDIRP4
ASGNP4
line 219
;218:		//
;219:		for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $138
JUMPV
LABELV $135
line 220
;220:			cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 221
;221:			if (cl->pers.connected != CON_CONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $140
line 222
;222:				continue;
ADDRGP4 $136
JUMPV
LABELV $140
line 224
;223:			}
;224:			if (!(g_entities[i].r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $142
line 225
;225:				continue;
ADDRGP4 $136
JUMPV
LABELV $142
line 227
;226:			}
;227:			if (team >= 0 && cl->sess.sessionTeam != team) {
ADDRLP4 72
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
LTI4 $146
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 72
INDIRI4
EQI4 $146
line 228
;228:				continue;
ADDRGP4 $136
JUMPV
LABELV $146
line 230
;229:			}
;230:			if (!Q_stricmp(value, cl->pers.netname)) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $148
line 231
;231:				break;
ADDRGP4 $137
JUMPV
LABELV $148
line 233
;232:			}
;233:		}
LABELV $136
line 219
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $138
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $135
LABELV $137
line 234
;234:		if (i >= level.maxclients) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $150
line 235
;235:			num++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 236
;236:		}
LABELV $150
line 237
;237:	}
LABELV $131
line 216
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $133
ADDRLP4 12
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $130
line 238
;238:	num = random() * num;
ADDRLP4 68
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 68
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 20
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 239
;239:	for (n = 0; n < g_numBots; n++) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $156
JUMPV
LABELV $153
line 241
;240:
;241:		value = Info_ValueForKey(g_botInfos[n], "name");
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 72
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 72
INDIRP4
ASGNP4
line 243
;242:
;243:		skillstr = Info_ValueForKey(g_botInfos[n], "skill");
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $157
ARGP4
ADDRLP4 76
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 76
INDIRP4
ASGNP4
line 244
;244:		if (*skillstr)
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $158
line 245
;245:			skill = atof(skillstr);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 80
INDIRF4
ASGNF4
ADDRGP4 $159
JUMPV
LABELV $158
line 247
;246:		else
;247:			skill = trap_Cvar_VariableValue("g_spSkill");
ADDRGP4 $160
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 84
INDIRF4
ASGNF4
LABELV $159
line 249
;248:
;249:		for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $164
JUMPV
LABELV $161
line 250
;250:			cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 251
;251:			if (cl->pers.connected != CON_CONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $166
line 252
;252:				continue;
ADDRGP4 $162
JUMPV
LABELV $166
line 254
;253:			}
;254:			if (!(g_entities[i].r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $168
line 255
;255:				continue;
ADDRGP4 $162
JUMPV
LABELV $168
line 257
;256:			}
;257:			if (team >= 0 && cl->sess.sessionTeam != team) {
ADDRLP4 88
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
LTI4 $172
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 88
INDIRI4
EQI4 $172
line 258
;258:				continue;
ADDRGP4 $162
JUMPV
LABELV $172
line 260
;259:			}
;260:			if (!Q_stricmp(value, cl->pers.netname)) {
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $174
line 261
;261:				break;
ADDRGP4 $163
JUMPV
LABELV $174
line 263
;262:			}
;263:		}
LABELV $162
line 249
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $164
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $161
LABELV $163
line 264
;264:		if (i >= level.maxclients) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $176
line 265
;265:			num--;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 266
;266:			if (num <= 0) {
ADDRLP4 20
INDIRI4
CNSTI4 0
GTI4 $179
line 267
;267:				if (team == TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $181
line 268
;268:					teamstr = "red";
ADDRLP4 64
ADDRGP4 $183
ASGNP4
ADDRGP4 $182
JUMPV
LABELV $181
line 269
;269:				else if (team == TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $184
line 270
;270:					teamstr = "blue";
ADDRLP4 64
ADDRGP4 $186
ASGNP4
ADDRGP4 $185
JUMPV
LABELV $184
line 272
;271:				else
;272:					teamstr = "";
ADDRLP4 64
ADDRGP4 $94
ASGNP4
LABELV $185
LABELV $182
line 273
;273:				Q_strncpyz(netname, value, sizeof(netname));
ADDRLP4 28
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 274
;274:				Q_CleanStr(netname);
ADDRLP4 28
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 275
;275:				trap_SendConsoleCommand(EXEC_INSERT, va("addbot %s %1.2f %s 0\n", netname, skill, teamstr));
ADDRGP4 $187
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 276
;276:				return;
ADDRGP4 $129
JUMPV
LABELV $179
line 278
;277:			}
;278:		}
LABELV $176
line 279
;279:	}
LABELV $154
line 239
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $156
ADDRLP4 12
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $153
line 280
;280:}
LABELV $129
endproc G_AddRandomBot 96 16
export G_RemoveRandomBot
proc G_RemoveRandomBot 52 8
line 287
;281:
;282:/*
;283:===============
;284:G_RemoveRandomBot
;285:===============
;286:*/
;287:int G_RemoveRandomBot(int team) {
line 292
;288:	int        i;
;289:	char       netname[36];
;290:	gclient_t* cl;
;291:
;292:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $192
JUMPV
LABELV $189
line 293
;293:		cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 294
;294:		if (cl->pers.connected != CON_CONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $194
line 295
;295:			continue;
ADDRGP4 $190
JUMPV
LABELV $194
line 297
;296:		}
;297:		if (!(g_entities[i].r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $196
line 298
;298:			continue;
ADDRGP4 $190
JUMPV
LABELV $196
line 300
;299:		}
;300:		if (team >= 0 && cl->sess.sessionTeam != team) {
ADDRLP4 44
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
LTI4 $200
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $200
line 301
;301:			continue;
ADDRGP4 $190
JUMPV
LABELV $200
line 303
;302:		}
;303:		strcpy(netname, cl->pers.netname);
ADDRLP4 8
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 304
;304:		Q_CleanStr(netname);
ADDRLP4 8
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 305
;305:		trap_SendConsoleCommand(EXEC_INSERT, va("kick %s\n", netname));
ADDRGP4 $202
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 48
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 306
;306:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $188
JUMPV
LABELV $190
line 292
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $192
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $189
line 308
;307:	}
;308:	return qfalse;
CNSTI4 0
RETI4
LABELV $188
endproc G_RemoveRandomBot 52 8
proc G_CountHumanPlayers 16 0
line 316
;309:}
;310:
;311:/*
;312:===============
;313:G_CountHumanPlayers
;314:===============
;315:*/
;316:static int G_CountHumanPlayers(team_t team) {
line 320
;317:	int        i, num;
;318:	gclient_t* cl;
;319:
;320:	num = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 321
;321:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $207
JUMPV
LABELV $204
line 322
;322:		cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 323
;323:		if (cl->pers.connected != CON_CONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $209
line 324
;324:			continue;
ADDRGP4 $205
JUMPV
LABELV $209
line 326
;325:		}
;326:		if (g_entities[i].r.svFlags & SVF_BOT) {
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $211
line 327
;327:			continue;
ADDRGP4 $205
JUMPV
LABELV $211
line 329
;328:		}
;329:		if (team >= 0 && cl->sess.sessionTeam != team) {
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $215
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $215
line 330
;330:			continue;
ADDRGP4 $205
JUMPV
LABELV $215
line 332
;331:		}
;332:		num++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 333
;333:	}
LABELV $205
line 321
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $207
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $204
line 334
;334:	return num;
ADDRLP4 8
INDIRI4
RETI4
LABELV $203
endproc G_CountHumanPlayers 16 0
proc G_CountBotPlayers 20 0
line 342
;335:}
;336:
;337:/*
;338:===============
;339:G_CountBotPlayers
;340:===============
;341:*/
;342:static int G_CountBotPlayers(team_t team) {
line 346
;343:	int        i, n, num;
;344:	gclient_t* cl;
;345:
;346:	num = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 347
;347:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $221
JUMPV
LABELV $218
line 348
;348:		cl = level.clients + i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 349
;349:		if (cl->pers.connected != CON_CONNECTED) {
ADDRLP4 8
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $223
line 350
;350:			continue;
ADDRGP4 $219
JUMPV
LABELV $223
line 352
;351:		}
;352:		if (!(g_entities[i].r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $225
line 353
;353:			continue;
ADDRGP4 $219
JUMPV
LABELV $225
line 355
;354:		}
;355:		if (team >= 0 && cl->sess.sessionTeam != team) {
ADDRLP4 16
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $229
ADDRLP4 8
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $229
line 356
;356:			continue;
ADDRGP4 $219
JUMPV
LABELV $229
line 358
;357:		}
;358:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 359
;359:	}
LABELV $219
line 347
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $221
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $218
line 360
;360:	for (n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $231
line 361
;361:		if (!botSpawnQueue[n].spawnTime) {
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $235
line 362
;362:			continue;
ADDRGP4 $232
JUMPV
LABELV $235
line 364
;363:		}
;364:		if (botSpawnQueue[n].spawnTime > level.time) {
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $238
line 365
;365:			continue;
ADDRGP4 $232
JUMPV
LABELV $238
line 367
;366:		}
;367:		num++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 368
;368:	}
LABELV $232
line 360
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $231
line 369
;369:	return num;
ADDRLP4 12
INDIRI4
RETI4
LABELV $217
endproc G_CountBotPlayers 20 0
bss
align 4
LABELV $243
skip 4
export G_CheckMinimumPlayers
code
proc G_CheckMinimumPlayers 36 4
line 377
;370:}
;371:
;372:/*
;373:===============
;374:G_CheckMinimumPlayers
;375:===============
;376:*/
;377:void G_CheckMinimumPlayers(void) {
line 382
;378:	int        minplayers;
;379:	int        humanplayers, botplayers;
;380:	static int checkminimumplayers_time;
;381:
;382:	if (level.intermissiontime)
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $244
line 383
;383:		return;
ADDRGP4 $242
JUMPV
LABELV $244
line 386
;384:
;385:	// only check once each 10 seconds
;386:	if (checkminimumplayers_time > level.time - 10000)
ADDRGP4 $243
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $247
line 387
;387:		return;
ADDRGP4 $242
JUMPV
LABELV $247
line 389
;388:
;389:	if (level.time - level.startTime < 2000)
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 2000
GEI4 $250
line 390
;390:		return;
ADDRGP4 $242
JUMPV
LABELV $250
line 392
;391:
;392:	checkminimumplayers_time = level.time;
ADDRGP4 $243
ADDRGP4 level+32
INDIRI4
ASGNI4
line 393
;393:	trap_Cvar_Update(&bot_minplayers);
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 394
;394:	minplayers = bot_minplayers.integer;
ADDRLP4 0
ADDRGP4 bot_minplayers+12
INDIRI4
ASGNI4
line 395
;395:	if (minplayers <= 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $256
line 396
;396:		return;
ADDRGP4 $242
JUMPV
LABELV $256
line 398
;397:
;398:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $258
line 399
;399:		if (minplayers >= level.maxclients / 2) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
CNSTI4 2
DIVI4
LTI4 $261
line 400
;400:			minplayers = (level.maxclients / 2) - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 1
SUBI4
ASGNI4
line 401
;401:		}
LABELV $261
line 403
;402:
;403:		humanplayers = G_CountHumanPlayers(TEAM_RED);
CNSTI4 1
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 404
;404:		botplayers   = G_CountBotPlayers(TEAM_RED);
CNSTI4 1
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 406
;405:		//
;406:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $265
line 407
;407:			G_AddRandomBot(TEAM_RED);
CNSTI4 1
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 408
;408:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $266
JUMPV
LABELV $265
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $267
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $267
line 409
;409:			G_RemoveRandomBot(TEAM_RED);
CNSTI4 1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 410
;410:		}
LABELV $267
LABELV $266
line 412
;411:		//
;412:		humanplayers = G_CountHumanPlayers(TEAM_BLUE);
CNSTI4 2
ARGI4
ADDRLP4 24
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 413
;413:		botplayers   = G_CountBotPlayers(TEAM_BLUE);
CNSTI4 2
ARGI4
ADDRLP4 28
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 28
INDIRI4
ASGNI4
line 415
;414:		//
;415:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $269
line 416
;416:			G_AddRandomBot(TEAM_BLUE);
CNSTI4 2
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 417
;417:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $259
JUMPV
LABELV $269
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $259
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $259
line 418
;418:			G_RemoveRandomBot(TEAM_BLUE);
CNSTI4 2
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 419
;419:		}
line 420
;420:	} else if (g_gametype.integer == GT_TOURNAMENT) {
ADDRGP4 $259
JUMPV
LABELV $258
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $273
line 421
;421:		if (minplayers >= level.maxclients) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $276
line 422
;422:			minplayers = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 423
;423:		}
LABELV $276
line 424
;424:		humanplayers = G_CountHumanPlayers(-1);
CNSTI4 -1
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 425
;425:		botplayers   = G_CountBotPlayers(-1);
CNSTI4 -1
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 427
;426:		//
;427:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $280
line 428
;428:			G_AddRandomBot(TEAM_FREE);
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 429
;429:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $274
JUMPV
LABELV $280
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $274
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $274
line 431
;430:			// try to remove spectators first
;431:			if (!G_RemoveRandomBot(TEAM_SPECTATOR)) {
CNSTI4 3
ARGI4
ADDRLP4 24
ADDRGP4 G_RemoveRandomBot
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $274
line 433
;432:				// just remove the bot that is playing
;433:				G_RemoveRandomBot(-1);
CNSTI4 -1
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 434
;434:			}
line 435
;435:		}
line 436
;436:	} else if (g_gametype.integer == GT_RUN) {
ADDRGP4 $274
JUMPV
LABELV $273
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
NEI4 $286
line 437
;437:		if (minplayers >= level.maxclients) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $289
line 438
;438:			minplayers = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 439
;439:		}
LABELV $289
line 440
;440:		humanplayers = G_CountHumanPlayers(TEAM_FREE);
CNSTI4 0
ARGI4
ADDRLP4 12
ADDRGP4 G_CountHumanPlayers
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 441
;441:		botplayers   = G_CountBotPlayers(TEAM_FREE);
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 G_CountBotPlayers
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 443
;442:		//
;443:		if (humanplayers + botplayers < minplayers) {
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
GEI4 $293
line 444
;444:			G_AddRandomBot(TEAM_FREE);
CNSTI4 0
ARGI4
ADDRGP4 G_AddRandomBot
CALLV
pop
line 445
;445:		} else if (humanplayers + botplayers > minplayers && botplayers) {
ADDRGP4 $294
JUMPV
LABELV $293
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
LEI4 $295
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $295
line 446
;446:			G_RemoveRandomBot(TEAM_FREE);
CNSTI4 0
ARGI4
ADDRGP4 G_RemoveRandomBot
CALLI4
pop
line 447
;447:		}
LABELV $295
LABELV $294
line 448
;448:	}
LABELV $286
LABELV $274
LABELV $259
line 449
;449:}
LABELV $242
endproc G_CheckMinimumPlayers 36 4
export G_CheckBotSpawn
proc G_CheckBotSpawn 1032 12
line 456
;450:
;451:/*
;452:===============
;453:G_CheckBotSpawn
;454:===============
;455:*/
;456:void G_CheckBotSpawn(void) {
line 460
;457:	int  n;
;458:	char userinfo[MAX_INFO_VALUE];
;459:
;460:	G_CheckMinimumPlayers();
ADDRGP4 G_CheckMinimumPlayers
CALLV
pop
line 462
;461:
;462:	for (n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $298
line 463
;463:		if (!botSpawnQueue[n].spawnTime) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $302
line 464
;464:			continue;
ADDRGP4 $299
JUMPV
LABELV $302
line 466
;465:		}
;466:		if (botSpawnQueue[n].spawnTime > level.time) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $305
line 467
;467:			continue;
ADDRGP4 $299
JUMPV
LABELV $305
line 469
;468:		}
;469:		ClientBegin(botSpawnQueue[n].clientNum);
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 470
;470:		botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 472
;471:
;472:		if (g_gametype.integer == GT_SINGLE_PLAYER) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $310
line 473
;473:			trap_GetUserinfo(botSpawnQueue[n].clientNum, userinfo, sizeof(userinfo));
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 474
;474:			PlayerIntroSound(Info_ValueForKey(userinfo, "model"));
ADDRLP4 4
ARGP4
ADDRGP4 $313
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 PlayerIntroSound
CALLV
pop
line 475
;475:		}
LABELV $310
line 476
;476:	}
LABELV $299
line 462
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $298
line 477
;477:}
LABELV $297
endproc G_CheckBotSpawn 1032 12
proc AddBotToSpawnQueue 4 4
line 484
;478:
;479:/*
;480:===============
;481:AddBotToSpawnQueue
;482:===============
;483:*/
;484:static void AddBotToSpawnQueue(int clientNum, int delay) {
line 487
;485:	int n;
;486:
;487:	for (n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $315
line 488
;488:		if (!botSpawnQueue[n].spawnTime) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $319
line 489
;489:			botSpawnQueue[n].spawnTime = level.time + delay;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 490
;490:			botSpawnQueue[n].clientNum = clientNum;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 491
;491:			return;
ADDRGP4 $314
JUMPV
LABELV $319
line 493
;492:		}
;493:	}
LABELV $316
line 487
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $315
line 495
;494:
;495:	G_Printf(S_COLOR_YELLOW "Unable to delay bot spawn\n");
ADDRGP4 $324
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 497
;496:
;497:	ClientBegin(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 498
;498:}
LABELV $314
endproc AddBotToSpawnQueue 4 4
export G_RemoveQueuedBotBegin
proc G_RemoveQueuedBotBegin 4 0
line 508
;499:
;500:/*
;501:===============
;502:G_RemoveQueuedBotBegin
;503:
;504:Called on client disconnect to make sure the delayed spawn
;505:doesn't happen on a freed index
;506:===============
;507:*/
;508:void G_RemoveQueuedBotBegin(int clientNum) {
line 511
;509:	int n;
;510:
;511:	for (n = 0; n < BOT_SPAWN_QUEUE_DEPTH; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $326
line 512
;512:		if (botSpawnQueue[n].clientNum == clientNum) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $330
line 513
;513:			botSpawnQueue[n].spawnTime = 0;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 botSpawnQueue+4
ADDP4
CNSTI4 0
ASGNI4
line 514
;514:			return;
ADDRGP4 $325
JUMPV
LABELV $330
line 516
;515:		}
;516:	}
LABELV $327
line 511
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $326
line 517
;517:}
LABELV $325
endproc G_RemoveQueuedBotBegin 4 0
export G_BotConnect
proc G_BotConnect 1336 12
line 524
;518:
;519:/*
;520:===============
;521:G_BotConnect
;522:===============
;523:*/
;524:qboolean G_BotConnect(int clientNum, qboolean restart) {
line 528
;525:	bot_settings_t settings;
;526:	char           userinfo[MAX_INFO_STRING];
;527:
;528:	trap_GetUserinfo(clientNum, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 530
;529:
;530:	Q_strncpyz(settings.characterfile, Info_ValueForKey(userinfo, "characterfile"), sizeof(settings.characterfile));
ADDRLP4 292
ARGP4
ADDRGP4 $334
ARGP4
ADDRLP4 1316
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1316
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 531
;531:	settings.skill = atof(Info_ValueForKey(userinfo, "skill"));
ADDRLP4 292
ARGP4
ADDRGP4 $157
ARGP4
ADDRLP4 1320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1320
INDIRP4
ARGP4
ADDRLP4 1324
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0+144
ADDRLP4 1324
INDIRF4
ASGNF4
line 532
;532:	Q_strncpyz(settings.team, Info_ValueForKey(userinfo, "team"), sizeof(settings.team));
ADDRLP4 292
ARGP4
ADDRGP4 $337
ARGP4
ADDRLP4 1328
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0+148
ARGP4
ADDRLP4 1328
INDIRP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 534
;533:
;534:	if (!BotAISetupClient(clientNum, &settings, restart)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1332
ADDRGP4 BotAISetupClient
CALLI4
ASGNI4
ADDRLP4 1332
INDIRI4
CNSTI4 0
NEI4 $339
line 535
;535:		trap_DropClient(clientNum, "BotAISetupClient failed");
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $341
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 536
;536:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $333
JUMPV
LABELV $339
line 539
;537:	}
;538:
;539:	return qtrue;
CNSTI4 1
RETI4
LABELV $333
endproc G_BotConnect 1336 12
proc G_AddBot 1388 16
line 547
;540:}
;541:
;542:/*
;543:===============
;544:G_AddBot
;545:===============
;546:*/
;547:static void G_AddBot(const char* name, float skill, const char* team, int delay, const char* altname) {
line 560
;548:	int         clientNum;
;549:	char*       botinfo;
;550:	gentity_t*  bot;
;551:	char*       key;
;552:	char*       s;
;553:	const char* botname;
;554:	const char* model;
;555:	const char* headmodel;
;556:	char        userinfo[MAX_INFO_STRING];
;557:	char        nm[MAX_CVAR_VALUE_STRING];
;558:
;559:	// get the botinfo from bots.txt
;560:	botinfo = G_GetBotInfoByName(name);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1312
ADDRGP4 G_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 1312
INDIRP4
ASGNP4
line 561
;561:	if (!botinfo) {
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $343
line 562
;562:		G_Printf(S_COLOR_RED "Error: Bot '%s' not defined\n", name);
ADDRGP4 $345
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 563
;563:		return;
ADDRGP4 $342
JUMPV
LABELV $343
line 567
;564:	}
;565:
;566:	// create the bot's userinfo
;567:	userinfo[0] = '\0';
ADDRLP4 0
CNSTI1 0
ASGNI1
line 569
;568:
;569:	botname = Info_ValueForKey(botinfo, "funname");
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $346
ARGP4
ADDRLP4 1316
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1316
INDIRP4
ASGNP4
line 570
;570:	if (!botname[0]) {
ADDRLP4 1040
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $347
line 571
;571:		botname = Info_ValueForKey(botinfo, "name");
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 1320
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1040
ADDRLP4 1320
INDIRP4
ASGNP4
line 572
;572:	}
LABELV $347
line 574
;573:	// check for an alternative name
;574:	if (altname && altname[0]) {
ADDRLP4 1320
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1320
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $349
ADDRLP4 1320
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $349
line 575
;575:		botname = altname;
ADDRLP4 1040
ADDRFP4 16
INDIRP4
ASGNP4
line 576
;576:	}
LABELV $349
line 578
;577:
;578:	BG_CleanName(botname, nm, sizeof(nm), "unnamed bot");
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1056
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $351
ARGP4
ADDRGP4 BG_CleanName
CALLV
pop
line 579
;579:	Info_SetValueForKey(userinfo, "name", nm);
ADDRLP4 0
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 1056
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 581
;580:
;581:	Info_SetValueForKey(userinfo, "rate", "25000");
ADDRLP4 0
ARGP4
ADDRGP4 $352
ARGP4
ADDRGP4 $353
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 582
;582:	Info_SetValueForKey(userinfo, "snaps", va("%i", sv_fps.integer));
ADDRGP4 $113
ARGP4
ADDRGP4 sv_fps+12
INDIRI4
ARGI4
ADDRLP4 1324
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 1324
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 583
;583:	Info_SetValueForKey(userinfo, "skill", va("%1.2f", skill));
ADDRGP4 $356
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 1328
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $157
ARGP4
ADDRLP4 1328
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 585
;584:
;585:	if (skill >= 1 && skill < 2) {
ADDRLP4 1332
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1332
INDIRF4
CNSTF4 1065353216
LTF4 $357
ADDRLP4 1332
INDIRF4
CNSTF4 1073741824
GEF4 $357
line 586
;586:		Info_SetValueForKey(userinfo, "handicap", "50");
ADDRLP4 0
ARGP4
ADDRGP4 $359
ARGP4
ADDRGP4 $360
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 587
;587:	} else if (skill >= 2 && skill < 3) {
ADDRGP4 $358
JUMPV
LABELV $357
ADDRLP4 1336
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1336
INDIRF4
CNSTF4 1073741824
LTF4 $361
ADDRLP4 1336
INDIRF4
CNSTF4 1077936128
GEF4 $361
line 588
;588:		Info_SetValueForKey(userinfo, "handicap", "70");
ADDRLP4 0
ARGP4
ADDRGP4 $359
ARGP4
ADDRGP4 $363
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 589
;589:	} else if (skill >= 3 && skill < 4) {
ADDRGP4 $362
JUMPV
LABELV $361
ADDRLP4 1340
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 1340
INDIRF4
CNSTF4 1077936128
LTF4 $364
ADDRLP4 1340
INDIRF4
CNSTF4 1082130432
GEF4 $364
line 590
;590:		Info_SetValueForKey(userinfo, "handicap", "90");
ADDRLP4 0
ARGP4
ADDRGP4 $359
ARGP4
ADDRGP4 $366
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 591
;591:	}
LABELV $364
LABELV $362
LABELV $358
line 593
;592:
;593:	key   = "model";
ADDRLP4 1024
ADDRGP4 $313
ASGNP4
line 594
;594:	model = Info_ValueForKey(botinfo, key);
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1344
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1044
ADDRLP4 1344
INDIRP4
ASGNP4
line 595
;595:	if (!*model) {
ADDRLP4 1044
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $367
line 596
;596:		model = "visor/default";
ADDRLP4 1044
ADDRGP4 $369
ASGNP4
line 597
;597:	}
LABELV $367
line 598
;598:	Info_SetValueForKey(userinfo, key, model);
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1044
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 602
;599:	// key = "team_model";
;600:	// Info_SetValueForKey( userinfo, key, model );
;601:
;602:	key       = "headmodel";
ADDRLP4 1024
ADDRGP4 $370
ASGNP4
line 603
;603:	headmodel = Info_ValueForKey(botinfo, key);
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1348
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
ADDRLP4 1348
INDIRP4
ASGNP4
line 604
;604:	if (!*headmodel) {
ADDRLP4 1048
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $371
line 605
;605:		headmodel = model;
ADDRLP4 1048
ADDRLP4 1044
INDIRP4
ASGNP4
line 606
;606:	}
LABELV $371
line 607
;607:	Info_SetValueForKey(userinfo, key, headmodel);
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 611
;608:	// key = "team_headmodel";
;609:	// Info_SetValueForKey( userinfo, key, headmodel );
;610:
;611:	key = "gender";
ADDRLP4 1024
ADDRGP4 $373
ASGNP4
line 612
;612:	s   = Info_ValueForKey(botinfo, key);
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1352
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1352
INDIRP4
ASGNP4
line 613
;613:	if (!*s) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $374
line 614
;614:		s = "male";
ADDRLP4 1028
ADDRGP4 $376
ASGNP4
line 615
;615:	}
LABELV $374
line 616
;616:	Info_SetValueForKey(userinfo, "sex", s);
ADDRLP4 0
ARGP4
ADDRGP4 $377
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 618
;617:
;618:	key = "color1";
ADDRLP4 1024
ADDRGP4 $378
ASGNP4
line 619
;619:	s   = Info_ValueForKey(botinfo, key);
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1356
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1356
INDIRP4
ASGNP4
line 620
;620:	if (!*s) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $379
line 621
;621:		s = "4";
ADDRLP4 1028
ADDRGP4 $381
ASGNP4
line 622
;622:	}
LABELV $379
line 623
;623:	Info_SetValueForKey(userinfo, key, s);
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 625
;624:
;625:	key = "color2";
ADDRLP4 1024
ADDRGP4 $382
ASGNP4
line 626
;626:	s   = Info_ValueForKey(botinfo, key);
ADDRLP4 1032
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1360
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1360
INDIRP4
ASGNP4
line 627
;627:	if (!*s) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $383
line 628
;628:		s = "5";
ADDRLP4 1028
ADDRGP4 $385
ASGNP4
line 629
;629:	}
LABELV $383
line 630
;630:	Info_SetValueForKey(userinfo, key, s);
ADDRLP4 0
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 632
;631:
;632:	s = Info_ValueForKey(botinfo, "aifile");
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $386
ARGP4
ADDRLP4 1364
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1364
INDIRP4
ASGNP4
line 633
;633:	if (!*s) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $387
line 634
;634:		trap_Print(S_COLOR_RED "Error: bot has no aifile specified\n");
ADDRGP4 $389
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 635
;635:		return;
ADDRGP4 $342
JUMPV
LABELV $387
line 639
;636:	}
;637:
;638:	// have the server allocate a client slot
;639:	clientNum = trap_BotAllocateClient();
ADDRLP4 1368
ADDRGP4 trap_BotAllocateClient
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1368
INDIRI4
ASGNI4
line 640
;640:	if (clientNum == -1) {
ADDRLP4 1036
INDIRI4
CNSTI4 -1
NEI4 $390
line 641
;641:		G_Printf(S_COLOR_RED "Unable to add bot.  All player slots are in use.\n");
ADDRGP4 $392
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 642
;642:		G_Printf(S_COLOR_RED "Start server with more 'open' slots (or check setting of sv_maxclients cvar).\n");
ADDRGP4 $393
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 643
;643:		return;
ADDRGP4 $342
JUMPV
LABELV $390
line 648
;644:	}
;645:
;646:	// cleanup previous data manually
;647:	// because client may silently (re)connect without ClientDisconnect in case of crash for example
;648:	if (level.clients[clientNum].pers.connected != CON_DISCONNECTED) {
ADDRLP4 1036
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $394
line 649
;649:		ClientDisconnect(clientNum);
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 ClientDisconnect
CALLV
pop
line 650
;650:	}
LABELV $394
line 652
;651:
;652:	Info_SetValueForKey(userinfo, "characterfile", Info_ValueForKey(botinfo, "aifile"));
ADDRLP4 1032
INDIRP4
ARGP4
ADDRGP4 $386
ARGP4
ADDRLP4 1372
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $334
ARGP4
ADDRLP4 1372
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 653
;653:	Info_SetValueForKey(userinfo, "skill", va("%1.2f", skill));
ADDRGP4 $356
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 1376
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $157
ARGP4
ADDRLP4 1376
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 654
;654:	Info_SetValueForKey(userinfo, "team", team);
ADDRLP4 0
ARGP4
ADDRGP4 $337
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 656
;655:
;656:	bot = &g_entities[clientNum];
ADDRLP4 1052
ADDRLP4 1036
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 657
;657:	bot->r.svFlags |= SVF_BOT;
ADDRLP4 1380
ADDRLP4 1052
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 1380
INDIRP4
ADDRLP4 1380
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 658
;658:	bot->inuse = qtrue;
ADDRLP4 1052
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 661
;659:
;660:	// register the userinfo
;661:	trap_SetUserinfo(clientNum, userinfo);
ADDRLP4 1036
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 664
;662:
;663:	// have it connect to the game as a normal client
;664:	if (ClientConnect(clientNum, qtrue, qtrue)) {
ADDRLP4 1036
INDIRI4
ARGI4
CNSTI4 1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 1384
ADDRGP4 ClientConnect
CALLP4
ASGNP4
ADDRLP4 1384
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $396
line 665
;665:		return;
ADDRGP4 $342
JUMPV
LABELV $396
line 668
;666:	}
;667:
;668:	if (delay == 0) {
ADDRFP4 12
INDIRI4
CNSTI4 0
NEI4 $398
line 669
;669:		ClientBegin(clientNum);
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 670
;670:		return;
ADDRGP4 $342
JUMPV
LABELV $398
line 673
;671:	}
;672:
;673:	AddBotToSpawnQueue(clientNum, delay);
ADDRLP4 1036
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 AddBotToSpawnQueue
CALLV
pop
line 674
;674:}
LABELV $342
endproc G_AddBot 1388 16
export Svcmd_AddBot_f
proc Svcmd_AddBot_f 4112 20
line 681
;675:
;676:/*
;677:===============
;678:Svcmd_AddBot_f
;679:===============
;680:*/
;681:void Svcmd_AddBot_f(void) {
line 690
;682:	float skill;
;683:	int   delay;
;684:	char  name[MAX_TOKEN_CHARS];
;685:	char  altname[MAX_TOKEN_CHARS];
;686:	char  string[MAX_TOKEN_CHARS];
;687:	char  team[MAX_TOKEN_CHARS];
;688:
;689:	// are bots enabled?
;690:	if (!trap_Cvar_VariableIntegerValue("bot_enable")) {
ADDRGP4 $403
ARGP4
ADDRLP4 4104
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4104
INDIRI4
CNSTI4 0
NEI4 $401
line 691
;691:		return;
ADDRGP4 $400
JUMPV
LABELV $401
line 695
;692:	}
;693:
;694:	// name
;695:	trap_Argv(1, name, sizeof(name));
CNSTI4 1
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 696
;696:	if (!name[0]) {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $404
line 697
;697:		trap_Print("Usage: Addbot <botname> [skill 1-5] [team] [msec delay] [altname]\n");
ADDRGP4 $406
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 698
;698:		return;
ADDRGP4 $400
JUMPV
LABELV $404
line 702
;699:	}
;700:
;701:	// skill
;702:	trap_Argv(2, string, sizeof(string));
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 703
;703:	if (!string[0]) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $407
line 704
;704:		skill = 4;
ADDRLP4 2048
CNSTF4 1082130432
ASGNF4
line 705
;705:	} else {
ADDRGP4 $408
JUMPV
LABELV $407
line 706
;706:		skill = atof(string);
ADDRLP4 0
ARGP4
ADDRLP4 4108
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 2048
ADDRLP4 4108
INDIRF4
ASGNF4
line 707
;707:		if (skill < 1)
ADDRLP4 2048
INDIRF4
CNSTF4 1065353216
GEF4 $409
line 708
;708:			skill = 1;
ADDRLP4 2048
CNSTF4 1065353216
ASGNF4
ADDRGP4 $410
JUMPV
LABELV $409
line 709
;709:		else if (skill > 5)
ADDRLP4 2048
INDIRF4
CNSTF4 1084227584
LEF4 $411
line 710
;710:			skill = 5;
ADDRLP4 2048
CNSTF4 1084227584
ASGNF4
LABELV $411
LABELV $410
line 711
;711:	}
LABELV $408
line 714
;712:
;713:	// team
;714:	trap_Argv(3, team, sizeof(team));
CNSTI4 3
ARGI4
ADDRLP4 3076
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 717
;715:
;716:	// delay
;717:	trap_Argv(4, string, sizeof(string));
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 718
;718:	if (!string[0]) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $413
line 719
;719:		delay = 0;
ADDRLP4 4100
CNSTI4 0
ASGNI4
line 720
;720:	} else {
ADDRGP4 $414
JUMPV
LABELV $413
line 721
;721:		delay = atoi(string);
ADDRLP4 0
ARGP4
ADDRLP4 4108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4100
ADDRLP4 4108
INDIRI4
ASGNI4
line 722
;722:	}
LABELV $414
line 725
;723:
;724:	// alternative name
;725:	trap_Argv(5, altname, sizeof(altname));
CNSTI4 5
ARGI4
ADDRLP4 2052
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 727
;726:
;727:	G_AddBot(name, skill, team, delay, altname);
ADDRLP4 1024
ARGP4
ADDRLP4 2048
INDIRF4
ARGF4
ADDRLP4 3076
ARGP4
ADDRLP4 4100
INDIRI4
ARGI4
ADDRLP4 2052
ARGP4
ADDRGP4 G_AddBot
CALLV
pop
line 731
;728:
;729:	// if this was issued during gameplay and we are playing locally,
;730:	// go ahead and load the bot's media immediately
;731:	if (level.time - level.startTime > 1000 && trap_Cvar_VariableIntegerValue("cl_running")) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
CNSTI4 1000
LEI4 $415
ADDRGP4 $419
ARGP4
ADDRLP4 4108
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 4108
INDIRI4
CNSTI4 0
EQI4 $415
line 732
;732:		trap_SendServerCommand(-1, "loaddeferred\n");  // FIXME: spelled wrong, but not changing for demo
CNSTI4 -1
ARGI4
ADDRGP4 $420
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 733
;733:	}
LABELV $415
line 734
;734:}
LABELV $400
endproc Svcmd_AddBot_f 4112 20
export Svcmd_BotList_f
proc Svcmd_BotList_f 224 20
line 741
;735:
;736:/*
;737:===============
;738:Svcmd_BotList_f
;739:===============
;740:*/
;741:void Svcmd_BotList_f(void) {
line 748
;742:	int  i;
;743:	char name[MAX_NETNAME];
;744:	char funname[MAX_NETNAME];
;745:	char model[MAX_QPATH];
;746:	char aifile[MAX_QPATH];
;747:
;748:	trap_Print(S_COLOR_RED "name             model            aifile              funname\n");
ADDRGP4 $422
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 749
;749:	for (i = 0; i < g_numBots; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $426
JUMPV
LABELV $423
line 750
;750:		Q_strncpyz(name, Info_ValueForKey(g_botInfos[i], "name"), sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 204
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 204
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 751
;751:		if (!*name) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $427
line 752
;752:			strcpy(name, "UnnamedPlayer");
ADDRLP4 4
ARGP4
ADDRGP4 $429
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 753
;753:		}
LABELV $427
line 754
;754:		Q_strncpyz(funname, Info_ValueForKey(g_botInfos[i], "funname"), sizeof(funname));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $346
ARGP4
ADDRLP4 208
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 40
ARGP4
ADDRLP4 208
INDIRP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 755
;755:		if (!*funname) {
ADDRLP4 40
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $430
line 756
;756:			strcpy(funname, "");
ADDRLP4 40
ARGP4
ADDRGP4 $94
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 757
;757:		}
LABELV $430
line 758
;758:		Q_strncpyz(model, Info_ValueForKey(g_botInfos[i], "model"), sizeof(model));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $313
ARGP4
ADDRLP4 212
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 76
ARGP4
ADDRLP4 212
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 759
;759:		if (!*model) {
ADDRLP4 76
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $432
line 760
;760:			strcpy(model, "visor/default");
ADDRLP4 76
ARGP4
ADDRGP4 $369
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 761
;761:		}
LABELV $432
line 762
;762:		Q_strncpyz(aifile, Info_ValueForKey(g_botInfos[i], "aifile"), sizeof(aifile));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $386
ARGP4
ADDRLP4 216
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 140
ARGP4
ADDRLP4 216
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 763
;763:		if (!*aifile) {
ADDRLP4 140
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $434
line 764
;764:			strcpy(aifile, "bots/default_c.c");
ADDRLP4 140
ARGP4
ADDRGP4 $436
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 765
;765:		}
LABELV $434
line 766
;766:		trap_Print(va("%-16s %-16s %-20s %-20s\n", name, model, aifile, funname));
ADDRGP4 $437
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 140
ARGP4
ADDRLP4 40
ARGP4
ADDRLP4 220
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 220
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 767
;767:	}
LABELV $424
line 749
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $426
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $423
line 768
;768:}
LABELV $421
endproc Svcmd_BotList_f 224 20
proc G_SpawnBots 1052 16
line 775
;769:
;770:/*
;771:===============
;772:G_SpawnBots
;773:===============
;774:*/
;775:static void G_SpawnBots(const char* botList, int baseDelay) {
line 782
;776:	char* bot;
;777:	char* p;
;778:	float skill;
;779:	int   delay;
;780:	char  bots[MAX_INFO_VALUE];
;781:
;782:	podium1 = NULL;
ADDRGP4 podium1
CNSTP4 0
ASGNP4
line 783
;783:	podium2 = NULL;
ADDRGP4 podium2
CNSTP4 0
ASGNP4
line 784
;784:	podium3 = NULL;
ADDRGP4 podium3
CNSTP4 0
ASGNP4
line 786
;785:
;786:	skill = trap_Cvar_VariableValue("g_spSkill");
ADDRGP4 $160
ARGP4
ADDRLP4 1040
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 1040
INDIRF4
ASGNF4
line 787
;787:	if (skill < 1) {
ADDRLP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $439
line 788
;788:		trap_Cvar_Set("g_spSkill", "1");
ADDRGP4 $160
ARGP4
ADDRGP4 $441
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 789
;789:		skill = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 790
;790:	} else if (skill > 5) {
ADDRGP4 $440
JUMPV
LABELV $439
ADDRLP4 12
INDIRF4
CNSTF4 1084227584
LEF4 $442
line 791
;791:		trap_Cvar_Set("g_spSkill", "5");
ADDRGP4 $160
ARGP4
ADDRGP4 $385
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 792
;792:		skill = 5;
ADDRLP4 12
CNSTF4 1084227584
ASGNF4
line 793
;793:	}
LABELV $442
LABELV $440
line 795
;794:
;795:	Q_strncpyz(bots, botList, sizeof(bots));
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 796
;796:	p     = &bots[0];
ADDRLP4 0
ADDRLP4 16
ASGNP4
line 797
;797:	delay = baseDelay;
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $445
JUMPV
line 798
;798:	while (*p) {
LABELV $447
line 800
;799:		// skip spaces
;800:		while (*p == ' ') {
line 801
;801:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 802
;802:		}
LABELV $448
line 800
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $447
line 803
;803:		if (!*p) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $450
line 804
;804:			break;
ADDRGP4 $446
JUMPV
LABELV $450
line 808
;805:		}
;806:
;807:		// mark start of bot name
;808:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $453
JUMPV
LABELV $452
line 811
;809:
;810:		// skip until space of null
;811:		while (*p && *p != ' ') {
line 812
;812:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 813
;813:		}
LABELV $453
line 811
ADDRLP4 1044
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $455
ADDRLP4 1044
INDIRI4
CNSTI4 32
NEI4 $452
LABELV $455
line 814
;814:		if (*p) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $456
line 815
;815:			*p++ = '\0';
ADDRLP4 1048
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1048
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI1 0
ASGNI1
line 816
;816:		}
LABELV $456
line 820
;817:
;818:		// we must add the bot this way, calling G_AddBot directly at this stage
;819:		// does "Bad Things"
;820:		trap_SendConsoleCommand(EXEC_INSERT, va("addbot %s %f free %i\n", bot, skill, delay));
ADDRGP4 $458
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 822
;821:
;822:		delay += BOT_BEGIN_DELAY_INCREMENT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 823
;823:	}
LABELV $445
line 798
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $448
LABELV $446
line 824
;824:}
LABELV $438
endproc G_SpawnBots 1052 16
proc G_LoadBotsFromFile 8216 16
line 831
;825:
;826:/*
;827:===============
;828:G_LoadBotsFromFile
;829:===============
;830:*/
;831:static void G_LoadBotsFromFile(const char* filename) {
line 836
;832:	int          len;
;833:	fileHandle_t f;
;834:	char         buf[MAX_BOTS_TEXT];
;835:
;836:	len = trap_FS_FOpenFile(filename, &f, FS_READ);
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
line 837
;837:	if (f == FS_INVALID_HANDLE) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $460
line 838
;838:		trap_Print(va(S_COLOR_RED "file not found: %s\n", filename));
ADDRGP4 $88
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
line 839
;839:		return;
ADDRGP4 $459
JUMPV
LABELV $460
line 841
;840:	}
;841:	if (len >= MAX_BOTS_TEXT) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $462
line 842
;842:		trap_Print(va(S_COLOR_RED "file too large: %s is %i, max allowed is %i\n", filename, len, MAX_BOTS_TEXT));
ADDRGP4 $464
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
line 843
;843:		trap_FS_FCloseFile(f);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 844
;844:		return;
ADDRGP4 $459
JUMPV
LABELV $462
line 847
;845:	}
;846:
;847:	trap_FS_Read(buf, len, f);
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
line 848
;848:	trap_FS_FCloseFile(f);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 849
;849:	buf[len] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 851
;850:
;851:	g_numBots += G_ParseInfos(buf, MAX_BOTS - g_numBots, &g_botInfos[g_numBots]);
ADDRLP4 8
ARGP4
ADDRLP4 8204
ADDRGP4 g_numBots
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
ADDRGP4 g_botInfos
ADDP4
ARGP4
ADDRLP4 8212
ADDRGP4 G_ParseInfos
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
line 852
;852:}
LABELV $459
endproc G_LoadBotsFromFile 8216 16
proc G_LoadBots 1452 16
line 859
;853:
;854:/*
;855:===============
;856:G_LoadBots
;857:===============
;858:*/
;859:static void G_LoadBots(void) {
line 868
;860:	vmCvar_t botsFile;
;861:	int      numdirs;
;862:	char     filename[128];
;863:	char     dirlist[1024];
;864:	char*    dirptr;
;865:	int      i;
;866:	int      dirlen;
;867:
;868:	if (!trap_Cvar_VariableIntegerValue("bot_enable")) {
ADDRGP4 $403
ARGP4
ADDRLP4 1440
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 1440
INDIRI4
CNSTI4 0
NEI4 $466
line 869
;869:		return;
ADDRGP4 $465
JUMPV
LABELV $466
line 872
;870:	}
;871:
;872:	g_numBots = 0;
ADDRGP4 g_numBots
CNSTI4 0
ASGNI4
line 874
;873:
;874:	trap_Cvar_Register(&botsFile, "g_botsFile", "", CVAR_ARCHIVE | CVAR_LATCH);
ADDRLP4 1168
ARGP4
ADDRGP4 $468
ARGP4
ADDRGP4 $94
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 876
;875:
;876:	if (*botsFile.string && g_gametype.integer != GT_SINGLE_PLAYER) {
ADDRLP4 1168+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $469
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $469
line 877
;877:		G_LoadBotsFromFile(botsFile.string);
ADDRLP4 1168+16
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 878
;878:	} else {
ADDRGP4 $470
JUMPV
LABELV $469
line 879
;879:		G_LoadBotsFromFile("scripts/bots.txt");
ADDRGP4 $474
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 880
;880:	}
LABELV $470
line 883
;881:
;882:	// get all bots from .bot files
;883:	numdirs = trap_FS_GetFileList("scripts", ".bot", dirlist, sizeof(dirlist));
ADDRGP4 $100
ARGP4
ADDRGP4 $475
ARGP4
ADDRLP4 144
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1444
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 140
ADDRLP4 1444
INDIRI4
ASGNI4
line 884
;884:	dirptr  = dirlist;
ADDRLP4 0
ADDRLP4 144
ASGNP4
line 885
;885:	for (i = 0; i < numdirs; i++, dirptr += dirlen + 1) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $479
JUMPV
LABELV $476
line 886
;886:		dirlen = (int)strlen(dirptr);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 1448
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 136
ADDRLP4 1448
INDIRI4
ASGNI4
line 887
;887:		strcpy(filename, "scripts/");
ADDRLP4 4
ARGP4
ADDRGP4 $106
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 888
;888:		strcat(filename, dirptr);
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 889
;889:		G_LoadBotsFromFile(filename);
ADDRLP4 4
ARGP4
ADDRGP4 G_LoadBotsFromFile
CALLV
pop
line 890
;890:	}
LABELV $477
line 885
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
LABELV $479
ADDRLP4 132
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $476
line 891
;891:	trap_Print(va("%i bots parsed\n", g_numBots));
ADDRGP4 $480
ARGP4
ADDRGP4 g_numBots
INDIRI4
ARGI4
ADDRLP4 1448
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1448
INDIRP4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 892
;892:}
LABELV $465
endproc G_LoadBots 1452 16
export G_GetBotInfoByNumber
proc G_GetBotInfoByNumber 8 8
line 899
;893:
;894:/*
;895:===============
;896:G_GetBotInfoByNumber
;897:===============
;898:*/
;899:char* G_GetBotInfoByNumber(int num) {
line 900
;900:	if (num < 0 || num >= g_numBots) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $484
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $482
LABELV $484
line 901
;901:		trap_Print(va(S_COLOR_RED "Invalid bot number: %i\n", num));
ADDRGP4 $485
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
line 902
;902:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $481
JUMPV
LABELV $482
line 904
;903:	}
;904:	return g_botInfos[num];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
RETP4
LABELV $481
endproc G_GetBotInfoByNumber 8 8
export G_GetBotInfoByName
proc G_GetBotInfoByName 16 8
line 912
;905:}
;906:
;907:/*
;908:===============
;909:G_GetBotInfoByName
;910:===============
;911:*/
;912:char* G_GetBotInfoByName(const char* name) {
line 916
;913:	int   n;
;914:	char* value;
;915:
;916:	for (n = 0; n < g_numBots; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $490
JUMPV
LABELV $487
line 917
;917:		value = Info_ValueForKey(g_botInfos[n], "name");
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
ARGP4
ADDRGP4 $134
ARGP4
ADDRLP4 8
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 918
;918:		if (!Q_stricmp(value, name)) {
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
NEI4 $491
line 919
;919:			return g_botInfos[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_botInfos
ADDP4
INDIRP4
RETP4
ADDRGP4 $486
JUMPV
LABELV $491
line 921
;920:		}
;921:	}
LABELV $488
line 916
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $490
ADDRLP4 0
INDIRI4
ADDRGP4 g_numBots
INDIRI4
LTI4 $487
line 923
;922:
;923:	return NULL;
CNSTP4 0
RETP4
LABELV $486
endproc G_GetBotInfoByName 16 8
export G_InitBots
proc G_InitBots 52 16
line 931
;924:}
;925:
;926:/*
;927:===============
;928:G_InitBots
;929:===============
;930:*/
;931:void G_InitBots(qboolean restart) {
line 938
;932:	int         fragLimit;
;933:	int         timeLimit;
;934:	const char* arenainfo;
;935:	char*       strValue;
;936:	int         basedelay;
;937:
;938:	G_LoadBots();
ADDRGP4 G_LoadBots
CALLV
pop
line 939
;939:	G_LoadArenas();
ADDRGP4 G_LoadArenas
CALLV
pop
line 941
;940:
;941:	trap_Cvar_Register(&bot_minplayers, "bot_minplayers", "0", CVAR_SERVERINFO);
ADDRGP4 bot_minplayers
ARGP4
ADDRGP4 $494
ARGP4
ADDRGP4 $495
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 943
;942:
;943:	if (g_gametype.integer == GT_SINGLE_PLAYER) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $496
line 944
;944:		arenainfo = G_GetArenaInfoByMap(mapname);
ADDRGP4 mapname
ARGP4
ADDRLP4 20
ADDRGP4 G_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 945
;945:		if (!arenainfo) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $499
line 946
;946:			return;
ADDRGP4 $493
JUMPV
LABELV $499
line 949
;947:		}
;948:
;949:		strValue  = Info_ValueForKey(arenainfo, "fraglimit");
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $501
ARGP4
ADDRLP4 24
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 950
;950:		fragLimit = atoi(strValue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 951
;951:		if (fragLimit) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $502
line 952
;952:			trap_Cvar_Set("fraglimit", strValue);
ADDRGP4 $501
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 953
;953:		} else {
ADDRGP4 $503
JUMPV
LABELV $502
line 954
;954:			trap_Cvar_Set("fraglimit", "0");
ADDRGP4 $501
ARGP4
ADDRGP4 $495
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 955
;955:		}
LABELV $503
line 957
;956:
;957:		strValue  = Info_ValueForKey(arenainfo, "timelimit");
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $504
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 32
INDIRP4
ASGNP4
line 958
;958:		timeLimit = atoi(strValue);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 959
;959:		if (timeLimit) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $505
line 960
;960:			trap_Cvar_Set("timelimit", strValue);
ADDRGP4 $504
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 961
;961:		} else {
ADDRGP4 $506
JUMPV
LABELV $505
line 962
;962:			trap_Cvar_Set("timelimit", "0");
ADDRGP4 $504
ARGP4
ADDRGP4 $495
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 963
;963:		}
LABELV $506
line 965
;964:
;965:		if (!fragLimit && !timeLimit) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $507
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $507
line 966
;966:			trap_Cvar_Set("fraglimit", "10");
ADDRGP4 $501
ARGP4
ADDRGP4 $509
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 967
;967:			trap_Cvar_Set("timelimit", "0");
ADDRGP4 $504
ARGP4
ADDRGP4 $495
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 968
;968:		}
LABELV $507
line 970
;969:
;970:		basedelay = BOT_BEGIN_DELAY_BASE;
ADDRLP4 16
CNSTI4 2000
ASGNI4
line 971
;971:		strValue  = Info_ValueForKey(arenainfo, "special");
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $510
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 40
INDIRP4
ASGNP4
line 972
;972:		if (Q_stricmp(strValue, "training") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $513
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $511
line 973
;973:			basedelay += 10000;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 974
;974:		}
LABELV $511
line 976
;975:
;976:		if (!restart) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $514
line 977
;977:			G_SpawnBots(Info_ValueForKey(arenainfo, "bots"), basedelay);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $516
ARGP4
ADDRLP4 48
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_SpawnBots
CALLV
pop
line 978
;978:		}
LABELV $514
line 979
;979:	}
LABELV $496
line 980
;980:}
LABELV $493
endproc G_InitBots 52 16
import mapname
import podium3
import podium2
import podium1
bss
export bot_minplayers
align 4
LABELV bot_minplayers
skip 272
align 4
LABELV botSpawnQueue
skip 128
align 4
LABELV g_arenaInfos
skip 4096
export g_numArenas
align 4
LABELV g_numArenas
skip 4
align 4
LABELV g_botInfos
skip 4096
align 4
LABELV g_numBots
skip 4
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
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
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
LABELV $516
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $513
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
LABELV $510
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $509
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $504
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $501
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $495
byte 1 48
byte 1 0
align 1
LABELV $494
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $485
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
LABELV $480
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
LABELV $475
byte 1 46
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $474
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
LABELV $468
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
LABELV $464
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
byte 1 10
byte 1 0
align 1
LABELV $458
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $441
byte 1 49
byte 1 0
align 1
LABELV $437
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $436
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 95
byte 1 99
byte 1 46
byte 1 99
byte 1 0
align 1
LABELV $429
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $422
byte 1 94
byte 1 49
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 97
byte 1 105
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $420
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $419
byte 1 99
byte 1 108
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $406
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 65
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 60
byte 1 98
byte 1 111
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 32
byte 1 91
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 49
byte 1 45
byte 1 53
byte 1 93
byte 1 32
byte 1 91
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 93
byte 1 32
byte 1 91
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 93
byte 1 32
byte 1 91
byte 1 97
byte 1 108
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 93
byte 1 10
byte 1 0
align 1
LABELV $403
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $393
byte 1 94
byte 1 49
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 39
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 39
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 40
byte 1 111
byte 1 114
byte 1 32
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 41
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $392
byte 1 94
byte 1 49
byte 1 85
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 46
byte 1 32
byte 1 32
byte 1 65
byte 1 108
byte 1 108
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $389
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 105
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $386
byte 1 97
byte 1 105
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $385
byte 1 53
byte 1 0
align 1
LABELV $382
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $381
byte 1 52
byte 1 0
align 1
LABELV $378
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $377
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $376
byte 1 109
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $373
byte 1 103
byte 1 101
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $370
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $369
byte 1 118
byte 1 105
byte 1 115
byte 1 111
byte 1 114
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $366
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $363
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $360
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $359
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $356
byte 1 37
byte 1 49
byte 1 46
byte 1 50
byte 1 102
byte 1 0
align 1
LABELV $354
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $353
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $352
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $351
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $346
byte 1 102
byte 1 117
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $345
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 66
byte 1 111
byte 1 116
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $341
byte 1 66
byte 1 111
byte 1 116
byte 1 65
byte 1 73
byte 1 83
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $337
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $334
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 97
byte 1 99
byte 1 116
byte 1 101
byte 1 114
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $324
byte 1 94
byte 1 51
byte 1 85
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 32
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $313
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $202
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $187
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 50
byte 1 102
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $186
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $183
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $160
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
LABELV $157
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $134
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $128
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 32
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
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 10
byte 1 0
align 1
LABELV $127
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $121
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $113
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $112
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $107
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
LABELV $106
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
LABELV $101
byte 1 46
byte 1 97
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $99
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
LABELV $94
byte 1 0
align 1
LABELV $93
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
LABELV $91
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
LABELV $88
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
LABELV $82
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $81
byte 1 92
byte 1 110
byte 1 117
byte 1 109
byte 1 92
byte 1 0
align 1
LABELV $80
byte 1 60
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 62
byte 1 0
align 1
LABELV $77
byte 1 125
byte 1 0
align 1
LABELV $74
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
LABELV $68
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
LABELV $65
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
LABELV $64
byte 1 123
byte 1 0
