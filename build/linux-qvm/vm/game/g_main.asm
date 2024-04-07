data
align 4
LABELV gameCvarTable
address g_cheats
address $55
address $56
byte 4 0
byte 4 0
byte 4 0
skip 4
byte 4 0
address $57
address $58
byte 4 68
byte 4 0
byte 4 0
skip 4
byte 4 0
address $59
address $60
byte 4 64
byte 4 0
byte 4 0
skip 4
address g_mapname
address $61
address $56
byte 4 68
byte 4 0
byte 4 0
skip 4
address sv_fps
address $62
address $63
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_gametype
address $64
address $65
byte 4 38
byte 4 0
byte 4 0
skip 4
address g_maxclients
address $66
address $67
byte 4 37
byte 4 0
byte 4 0
skip 4
address g_maxGameClients
address $68
address $65
byte 4 37
byte 4 0
byte 4 0
skip 4
address g_dmflags
address $69
address $65
byte 4 5
byte 4 0
byte 4 1
skip 4
address g_fraglimit
address $70
address $71
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_timelimit
address $72
address $65
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_capturelimit
address $73
address $67
byte 4 1029
byte 4 0
byte 4 1
skip 4
address g_synchronousClients
address $74
address $65
byte 4 8
byte 4 0
byte 4 0
skip 4
address g_friendlyFire
address $75
address $65
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_autoJoin
address $76
address $77
byte 4 1
skip 12
address g_teamForceBalance
address $78
address $65
byte 4 1
skip 12
address g_warmup
address $79
address $71
byte 4 1
byte 4 0
byte 4 1
skip 4
address g_log
address $80
address $81
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_logSync
address $82
address $65
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_password
address $83
address $56
byte 4 2
byte 4 0
byte 4 0
skip 4
address g_banIPs
address $84
address $56
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_filterBan
address $85
address $77
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_needpass
address $86
address $65
byte 4 68
byte 4 0
byte 4 0
skip 4
address g_dedicated
address $87
address $65
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_speed
address $88
address $89
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_gravity
address $90
address $91
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_knockback
address $92
address $93
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_quadfactor
address $94
address $95
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_weaponRespawn
address $96
address $97
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_weaponTeamRespawn
address $98
address $63
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_forcerespawn
address $99
address $71
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_inactivity
address $100
address $65
byte 4 0
byte 4 0
byte 4 1
skip 4
address g_debugMove
address $101
address $65
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_debugDamage
address $102
address $65
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_debugAlloc
address $103
address $65
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_motd
address $104
address $56
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_blood
address $105
address $65
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_podiumDist
address $106
address $107
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_podiumDrop
address $108
address $109
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_allowVote
address $110
address $77
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_listEntity
address $111
address $65
byte 4 0
byte 4 0
byte 4 0
skip 4
address g_unlagged
address $112
address $77
byte 4 5
byte 4 0
byte 4 0
skip 4
address g_predictPVS
address $113
address $65
byte 4 1
byte 4 0
byte 4 0
skip 4
address g_smoothClients
address $114
address $77
byte 4 0
byte 4 0
byte 4 0
skip 4
address pmove_fixed
address $115
address $77
byte 4 8
byte 4 0
byte 4 0
skip 4
address pmove_msec
address $116
address $67
byte 4 8
byte 4 0
byte 4 0
skip 4
address g_rotation
address $117
address $56
byte 4 1
byte 4 0
byte 4 0
skip 4
address phy_movetype
address $118
address $65
byte 4 8
skip 12
export vmMain
code
proc vmMain 16 12
file "../../../../code/game/g_main.c"
line 196
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:level_locals_t level;
;7:
;8:typedef struct {
;9:	vmCvar_t*   vmCvar;
;10:	const char* cvarName;
;11:	const char* defaultString;
;12:	int         cvarFlags;
;13:	int         modificationCount;  // for tracking changes
;14:	qboolean    trackChange;        // track this variable, and announce if changed
;15:	qboolean    teamShader;         // track and if changed, update shader state
;16:} cvarTable_t;
;17:
;18:gentity_t g_entities[MAX_GENTITIES];
;19:gclient_t g_clients[MAX_CLIENTS];
;20:
;21:vmCvar_t  g_gametype;
;22:vmCvar_t  g_dmflags;
;23:vmCvar_t  g_fraglimit;
;24:vmCvar_t  g_timelimit;
;25:vmCvar_t  g_capturelimit;
;26:vmCvar_t  g_friendlyFire;
;27:vmCvar_t  g_password;
;28:vmCvar_t  g_needpass;
;29:vmCvar_t  g_mapname;
;30:vmCvar_t  sv_fps;
;31:vmCvar_t  g_maxclients;
;32:vmCvar_t  g_maxGameClients;
;33:vmCvar_t  g_dedicated;
;34:vmCvar_t  g_speed;
;35:vmCvar_t  g_gravity;
;36:vmCvar_t  g_cheats;
;37:vmCvar_t  g_knockback;
;38:vmCvar_t  g_quadfactor;
;39:vmCvar_t  g_forcerespawn;
;40:vmCvar_t  g_inactivity;
;41:vmCvar_t  g_debugMove;
;42:vmCvar_t  g_debugDamage;
;43:vmCvar_t  g_debugAlloc;
;44:vmCvar_t  g_weaponRespawn;
;45:vmCvar_t  g_weaponTeamRespawn;
;46:vmCvar_t  g_motd;
;47:vmCvar_t  g_synchronousClients;
;48:vmCvar_t  g_warmup;
;49:vmCvar_t  g_predictPVS;
;50:// vmCvar_t	g_restarted;
;51:vmCvar_t g_log;
;52:vmCvar_t g_logSync;
;53:vmCvar_t g_blood;
;54:vmCvar_t g_podiumDist;
;55:vmCvar_t g_podiumDrop;
;56:vmCvar_t g_allowVote;
;57:vmCvar_t g_autoJoin;
;58:vmCvar_t g_teamForceBalance;
;59:vmCvar_t g_banIPs;
;60:vmCvar_t g_filterBan;
;61:vmCvar_t g_smoothClients;
;62:vmCvar_t g_rotation;
;63:vmCvar_t g_unlagged;
;64:vmCvar_t pmove_fixed;
;65:vmCvar_t pmove_msec;
;66:vmCvar_t g_listEntity;
;67:#ifdef MISSIONPACK
;68:vmCvar_t g_obeliskHealth;
;69:vmCvar_t g_obeliskRegenPeriod;
;70:vmCvar_t g_obeliskRegenAmount;
;71:vmCvar_t g_obeliskRespawnDelay;
;72:vmCvar_t g_cubeTimeout;
;73:vmCvar_t g_redteam;
;74:vmCvar_t g_blueteam;
;75:vmCvar_t g_singlePlayer;
;76:vmCvar_t g_enableDust;
;77:vmCvar_t g_enableBreath;
;78:vmCvar_t g_proxMineTimeout;
;79:#endif
;80:vmCvar_t phy_movetype;
;81:
;82:// clang-format off
;83:static cvarTable_t gameCvarTable[] = {
;84:	// don't override the cheat state set by the system
;85:	{&g_cheats, "sv_cheats", "", 0, 0, qfalse},
;86:
;87:	// noset vars
;88:	{NULL, "gamename", GAMEVERSION, CVAR_SERVERINFO | CVAR_ROM, 0, qfalse},
;89:	{NULL, "gamedate", __DATE__, CVAR_ROM, 0, qfalse},
;90:	//{ &g_restarted, "g_restarted", "0", CVAR_ROM, 0, qfalse  },
;91:	{&g_mapname, "mapname", "", CVAR_SERVERINFO | CVAR_ROM, 0, qfalse},
;92:	{&sv_fps, "sv_fps", "30", CVAR_ARCHIVE, 0, qfalse},
;93:
;94:	// latched vars
;95:	{&g_gametype, "g_gametype", "0", CVAR_SERVERINFO | CVAR_USERINFO | CVAR_LATCH, 0, qfalse},
;96:
;97:	{&g_maxclients, "sv_maxclients", "8", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse},
;98:	{&g_maxGameClients, "g_maxGameClients", "0", CVAR_SERVERINFO | CVAR_LATCH | CVAR_ARCHIVE, 0, qfalse},
;99:
;100:	// change anytime vars
;101:	{&g_dmflags, "dmflags", "0", CVAR_SERVERINFO | CVAR_ARCHIVE, 0, qtrue},
;102:	{&g_fraglimit, "fraglimit", "20", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue},
;103:	{&g_timelimit, "timelimit", "0", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue},
;104:	{&g_capturelimit, "capturelimit", "8", CVAR_SERVERINFO | CVAR_ARCHIVE | CVAR_NORESTART, 0, qtrue},
;105:
;106:	{&g_synchronousClients, "g_synchronousClients", "0", CVAR_SYSTEMINFO, 0, qfalse},
;107:
;108:	{&g_friendlyFire, "g_friendlyFire", "0", CVAR_ARCHIVE, 0, qtrue},
;109:
;110:	{&g_autoJoin, "g_autoJoin", "1", CVAR_ARCHIVE},
;111:	{&g_teamForceBalance, "g_teamForceBalance", "0", CVAR_ARCHIVE},
;112:
;113:	{&g_warmup, "g_warmup", "20", CVAR_ARCHIVE, 0, qtrue},
;114:	{&g_log, "g_log", "games.log", CVAR_ARCHIVE, 0, qfalse},
;115:	{&g_logSync, "g_logSync", "0", CVAR_ARCHIVE, 0, qfalse},
;116:
;117:	{&g_password, "g_password", "", CVAR_USERINFO, 0, qfalse},
;118:
;119:	{&g_banIPs, "g_banIPs", "", CVAR_ARCHIVE, 0, qfalse},
;120:	{&g_filterBan, "g_filterBan", "1", CVAR_ARCHIVE, 0, qfalse},
;121:
;122:	{&g_needpass, "g_needpass", "0", CVAR_SERVERINFO | CVAR_ROM, 0, qfalse},
;123:
;124:	{&g_dedicated, "dedicated", "0", 0, 0, qfalse},
;125:
;126:	{&g_speed, "g_speed", "320", 0, 0, qtrue},
;127:	{&g_gravity, "g_gravity", "800", 0, 0, qtrue},
;128:	{&g_knockback, "g_knockback", "1000", 0, 0, qtrue},
;129:	{&g_quadfactor, "g_quadfactor", "3", 0, 0, qtrue},
;130:	{&g_weaponRespawn, "g_weaponrespawn", "5", 0, 0, qtrue},
;131:	{&g_weaponTeamRespawn, "g_weaponTeamRespawn", "30", 0, 0, qtrue},
;132:	{&g_forcerespawn, "g_forcerespawn", "20", 0, 0, qtrue},
;133:	{&g_inactivity, "g_inactivity", "0", 0, 0, qtrue},
;134:	{&g_debugMove, "g_debugMove", "0", 0, 0, qfalse},
;135:	{&g_debugDamage, "g_debugDamage", "0", 0, 0, qfalse},
;136:	{&g_debugAlloc, "g_debugAlloc", "0", 0, 0, qfalse},
;137:	{&g_motd, "g_motd", "", 0, 0, qfalse},
;138:	{&g_blood, "com_blood", "0", 0, 0, qfalse},
;139:
;140:	{&g_podiumDist, "g_podiumDist", "80", 0, 0, qfalse},
;141:	{&g_podiumDrop, "g_podiumDrop", "70", 0, 0, qfalse},
;142:
;143:	{&g_allowVote, "g_allowVote", "1", CVAR_ARCHIVE, 0, qfalse},
;144:	{&g_listEntity, "g_listEntity", "0", 0, 0, qfalse},
;145:
;146:	{&g_unlagged, "g_unlagged", "1", CVAR_SERVERINFO | CVAR_ARCHIVE, 0, qfalse},
;147:	{&g_predictPVS, "g_predictPVS", "0", CVAR_ARCHIVE, 0, qfalse},
;148:
;149:#ifdef MISSIONPACK
;150:	{&g_obeliskHealth, "g_obeliskHealth", "2500", 0, 0, qfalse},
;151:	{&g_obeliskRegenPeriod, "g_obeliskRegenPeriod", "1", 0, 0, qfalse},
;152:	{&g_obeliskRegenAmount, "g_obeliskRegenAmount", "15", 0, 0, qfalse},
;153:	{&g_obeliskRespawnDelay, "g_obeliskRespawnDelay", "10", CVAR_SERVERINFO, 0, qfalse},
;154:
;155:	{&g_cubeTimeout, "g_cubeTimeout", "30", 0, 0, qfalse},
;156:	{&g_redteam, "g_redteam", "Stroggs", CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO, 0, qtrue, qtrue},
;157:	{&g_blueteam, "g_blueteam", "Pagans", CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO, 0, qtrue, qtrue},
;158:	{&g_singlePlayer, "ui_singlePlayerActive", "", 0, 0, qfalse, qfalse},
;159:
;160:	{&g_enableDust, "g_enableDust", "0", CVAR_SERVERINFO, 0, qtrue, qfalse},
;161:	{&g_enableBreath, "g_enableBreath", "0", CVAR_SERVERINFO, 0, qtrue, qfalse},
;162:	{&g_proxMineTimeout, "g_proxMineTimeout", "20000", 0, 0, qfalse},
;163:#endif
;164:	{&g_smoothClients, "g_smoothClients", "1", 0, 0, qfalse},
;165:	{&pmove_fixed, "pmove_fixed", "1", CVAR_SYSTEMINFO, 0, qfalse},
;166:	{&pmove_msec, "pmove_msec", "8", CVAR_SYSTEMINFO, 0, qfalse},
;167:
;168:	{&g_rotation, "g_rotation", "", CVAR_ARCHIVE, 0, qfalse},
;169:
;170:	{&phy_movetype, "phy_movetype", "0", CVAR_SYSTEMINFO},
;171:};  // clang-format on
;172:
;173:static void G_InitGame(int levelTime, int randomSeed, int restart);
;174:static void G_RunFrame(int levelTime);
;175:static void G_ShutdownGame(int restart);
;176:static void CheckExitRules(void);
;177:static void SendScoreboardMessageToAllClients(void);
;178:
;179:// extension interface
;180:#ifdef Q3_VM
;181:qboolean (*trap_GetValue)(char* value, int valueSize, const char* key);
;182:#else
;183:int dll_com_trapGetValue;
;184:#endif
;185:
;186:int svf_self_portal2;
;187:
;188:/*
;189:================
;190:vmMain
;191:
;192:This is the only way control passes into the module.
;193:This must be the very first function compiled into the .q3vm file
;194:================
;195:*/
;196:DLLEXPORT intptr_t vmMain(int command, int arg0, int arg1, int arg2) {
line 197
;197:	switch (command) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $120
ADDRLP4 0
INDIRI4
CNSTI4 10
GTI4 $120
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $133
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $133
address $122
address $123
address $124
address $128
address $126
address $127
address $129
address $125
address $130
address $131
address $132
code
LABELV $122
line 199
;198:	case GAME_INIT:
;199:		G_InitGame(arg0, arg1, arg2);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 G_InitGame
CALLV
pop
line 200
;200:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $119
JUMPV
LABELV $123
line 202
;201:	case GAME_SHUTDOWN:
;202:		G_ShutdownGame(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_ShutdownGame
CALLV
pop
line 203
;203:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $119
JUMPV
LABELV $124
line 205
;204:	case GAME_CLIENT_CONNECT:
;205:		return (intptr_t)ClientConnect(arg0, arg1, arg2);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 ClientConnect
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CVUI4 4
RETI4
ADDRGP4 $119
JUMPV
LABELV $125
line 207
;206:	case GAME_CLIENT_THINK:
;207:		ClientThink(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientThink
CALLV
pop
line 208
;208:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $119
JUMPV
LABELV $126
line 210
;209:	case GAME_CLIENT_USERINFO_CHANGED:
;210:		ClientUserinfoChanged(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 211
;211:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $119
JUMPV
LABELV $127
line 213
;212:	case GAME_CLIENT_DISCONNECT:
;213:		ClientDisconnect(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientDisconnect
CALLV
pop
line 214
;214:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $119
JUMPV
LABELV $128
line 216
;215:	case GAME_CLIENT_BEGIN:
;216:		ClientBegin(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 217
;217:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $119
JUMPV
LABELV $129
line 219
;218:	case GAME_CLIENT_COMMAND:
;219:		ClientCommand(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientCommand
CALLV
pop
line 220
;220:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $119
JUMPV
LABELV $130
line 222
;221:	case GAME_RUN_FRAME:
;222:		G_RunFrame(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_RunFrame
CALLV
pop
line 223
;223:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $119
JUMPV
LABELV $131
line 225
;224:	case GAME_CONSOLE_COMMAND:
;225:		return ConsoleCommand();
ADDRLP4 8
ADDRGP4 ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $119
JUMPV
LABELV $132
line 227
;226:	case BOTAI_START_FRAME:
;227:		return BotAIStartFrame(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 BotAIStartFrame
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $119
JUMPV
LABELV $120
line 230
;228:	}
;229:
;230:	return -1;
CNSTI4 -1
RETI4
LABELV $119
endproc vmMain 16 12
export G_Printf
proc G_Printf 8204 12
line 233
;231:}
;232:
;233:void QDECL G_Printf(const char* fmt, ...) {
line 238
;234:	va_list argptr;
;235:	char    text[BIG_INFO_STRING];
;236:	int     len;
;237:
;238:	va_start(argptr, fmt);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 239
;239:	len = ED_vsprintf(text, fmt, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8200
ADDRGP4 ED_vsprintf
CALLI4
ASGNI4
ADDRLP4 8196
ADDRLP4 8200
INDIRI4
ASGNI4
line 240
;240:	va_end(argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 242
;241:
;242:	text[4095] = '\0';  // truncate to 1.32b/c max print buffer size
ADDRLP4 4+4095
CNSTI1 0
ASGNI1
line 244
;243:
;244:	trap_Print(text);
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 245
;245:}
LABELV $134
endproc G_Printf 8204 12
export G_BroadcastServerCommand
proc G_BroadcastServerCommand 4 8
line 247
;246:
;247:void G_BroadcastServerCommand(int ignoreClient, const char* command) {
line 249
;248:	int i;
;249:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $141
JUMPV
LABELV $138
line 250
;250:		if (i == ignoreClient)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $143
line 251
;251:			continue;
ADDRGP4 $139
JUMPV
LABELV $143
line 252
;252:		if (level.clients[i].pers.connected == CON_CONNECTED) {
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
NEI4 $145
line 253
;253:			trap_SendServerCommand(i, command);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 254
;254:		}
LABELV $145
line 255
;255:	}
LABELV $139
line 249
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $141
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $138
line 256
;256:}
LABELV $137
endproc G_BroadcastServerCommand 4 8
export G_Error
proc G_Error 1028 12
line 258
;257:
;258:void QDECL G_Error(const char* fmt, ...) {
line 262
;259:	va_list argptr;
;260:	char    text[1024];
;261:
;262:	va_start(argptr, fmt);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 263
;263:	ED_vsprintf(text, fmt, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 264
;264:	va_end(argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 266
;265:
;266:	trap_Error(text);
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 267
;267:}
LABELV $147
endproc G_Error 1028 12
export G_FindTeams
proc G_FindTeams 36 12
line 280
;268:
;269:/*
;270:================
;271:G_FindTeams
;272:
;273:Chain together all entities with a matching team field.
;274:Entity teams are used for item groups and multi-entity mover groups.
;275:
;276:All but the first will have the FL_TEAMSLAVE flag set and teammaster field set
;277:All but the last will have the teamchain field set to the next one
;278:================
;279:*/
;280:void G_FindTeams(void) {
line 285
;281:	gentity_t *e, *e2;
;282:	int        i, j;
;283:	int        c, c2;
;284:
;285:	c  = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 286
;286:	c2 = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 287
;287:	for (i = MAX_CLIENTS, e = g_entities + i; i < level.num_entities; i++, e++) {
ADDRLP4 16
CNSTI4 64
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
ADDRGP4 $153
JUMPV
LABELV $150
line 288
;288:		if (!e->inuse)
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $155
line 289
;289:			continue;
ADDRGP4 $151
JUMPV
LABELV $155
line 290
;290:		if (!e->team)
ADDRLP4 4
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $157
line 291
;291:			continue;
ADDRGP4 $151
JUMPV
LABELV $157
line 292
;292:		if (e->flags & FL_TEAMSLAVE)
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $159
line 293
;293:			continue;
ADDRGP4 $151
JUMPV
LABELV $159
line 294
;294:		e->teammaster = e;
ADDRLP4 4
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 295
;295:		c++;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 296
;296:		c2++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 297
;297:		for (j = i + 1, e2 = e + 1; j < level.num_entities; j++, e2++) {
ADDRLP4 8
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 816
ADDP4
ASGNP4
ADDRGP4 $164
JUMPV
LABELV $161
line 298
;298:			if (!e2->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $166
line 299
;299:				continue;
ADDRGP4 $162
JUMPV
LABELV $166
line 300
;300:			if (!e2->team)
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $168
line 301
;301:				continue;
ADDRGP4 $162
JUMPV
LABELV $168
line 302
;302:			if (e2->flags & FL_TEAMSLAVE)
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $170
line 303
;303:				continue;
ADDRGP4 $162
JUMPV
LABELV $170
line 304
;304:			if (!strcmp(e->team, e2->team)) {
ADDRLP4 4
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $172
line 305
;305:				c2++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 306
;306:				e2->teamchain  = e->teamchain;
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
line 307
;307:				e->teamchain   = e2;
ADDRLP4 4
INDIRP4
CNSTI4 776
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 308
;308:				e2->teammaster = e;
ADDRLP4 0
INDIRP4
CNSTI4 780
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 309
;309:				e2->flags |= FL_TEAMSLAVE;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
line 312
;310:
;311:				// make sure that targets only point at the master
;312:				if (e2->targetname) {
ADDRLP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $174
line 313
;313:					e->targetname  = e2->targetname;
ADDRLP4 4
INDIRP4
CNSTI4 652
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
ASGNP4
line 314
;314:					e2->targetname = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 652
ADDP4
CNSTP4 0
ASGNP4
line 315
;315:				}
LABELV $174
line 316
;316:			}
LABELV $172
line 317
;317:		}
LABELV $162
line 297
ADDRLP4 8
ADDRLP4 8
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
LABELV $164
ADDRLP4 8
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $161
line 318
;318:	}
LABELV $151
line 287
ADDRLP4 16
ADDRLP4 16
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
LABELV $153
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $150
line 320
;319:
;320:	G_Printf("%i teams with %i entities\n", c, c2);
ADDRGP4 $176
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 321
;321:}
LABELV $149
endproc G_FindTeams 36 12
export G_RemapTeamShaders
proc G_RemapTeamShaders 0 0
line 323
;322:
;323:void G_RemapTeamShaders(void) {
line 335
;324:#ifdef MISSIONPACK
;325:	char  string[1024];
;326:	float f = level.time * 0.001;
;327:	Com_sprintf(string, sizeof(string), "team_icon/%s_red", g_redteam.string);
;328:	AddRemap("textures/ctf2/redteam01", string, f);
;329:	AddRemap("textures/ctf2/redteam02", string, f);
;330:	Com_sprintf(string, sizeof(string), "team_icon/%s_blue", g_blueteam.string);
;331:	AddRemap("textures/ctf2/blueteam01", string, f);
;332:	AddRemap("textures/ctf2/blueteam02", string, f);
;333:	trap_SetConfigstring(CS_SHADERSTATE, BuildShaderStateConfig());
;334:#endif
;335:}
LABELV $177
endproc G_RemapTeamShaders 0 0
export G_RegisterCvars
proc G_RegisterCvars 20 16
line 342
;336:
;337:/*
;338:=================
;339:G_RegisterCvars
;340:=================
;341:*/
;342:void G_RegisterCvars(void) {
line 343
;343:	qboolean     remapped = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 347
;344:	cvarTable_t* cv;
;345:	int          i;
;346:
;347:	for (i = 0, cv = gameCvarTable; i < ARRAY_LEN(gameCvarTable); i++, cv++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 gameCvarTable
ASGNP4
ADDRGP4 $182
JUMPV
LABELV $179
line 348
;348:		trap_Cvar_Register(cv->vmCvar, cv->cvarName, cv->defaultString, cv->cvarFlags);
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 349
;349:		if (cv->vmCvar)
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $183
line 350
;350:			cv->modificationCount = cv->vmCvar->modificationCount;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
LABELV $183
line 352
;351:
;352:		if (cv->teamShader) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $185
line 353
;353:			remapped = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 354
;354:		}
LABELV $185
line 355
;355:	}
LABELV $180
line 347
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
LABELV $182
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 48
LTU4 $179
line 357
;356:
;357:	if (remapped) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $187
line 358
;358:		G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 359
;359:	}
LABELV $187
line 362
;360:
;361:	// check some things
;362:	if (g_gametype.integer < 0 || g_gametype.integer >= GT_MAX_GAME_TYPE) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $193
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
LTI4 $189
LABELV $193
line 363
;363:		G_Printf("g_gametype %i is out of range, defaulting to 0\n", g_gametype.integer);
ADDRGP4 $194
ARGP4
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 364
;364:		trap_Cvar_Set("g_gametype", "0");
ADDRGP4 $64
ARGP4
ADDRGP4 $65
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 365
;365:		trap_Cvar_Update(&g_gametype);
ADDRGP4 g_gametype
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 366
;366:	}
LABELV $189
line 368
;367:
;368:	level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+356
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 371
;369:
;370:	// force g_doWarmup to 1
;371:	trap_Cvar_Register(NULL, "g_doWarmup", "1", CVAR_ROM);
CNSTP4 0
ARGP4
ADDRGP4 $198
ARGP4
ADDRGP4 $77
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 372
;372:	trap_Cvar_Set("g_doWarmup", "1");
ADDRGP4 $198
ARGP4
ADDRGP4 $77
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 373
;373:}
LABELV $178
endproc G_RegisterCvars 20 16
proc G_UpdateCvars 28 12
line 380
;374:
;375:/*
;376:=================
;377:G_UpdateCvars
;378:=================
;379:*/
;380:static void G_UpdateCvars(void) {
line 383
;381:	int          i;
;382:	cvarTable_t* cv;
;383:	qboolean     remapped = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 385
;384:
;385:	for (i = 0, cv = gameCvarTable; i < ARRAY_LEN(gameCvarTable); i++, cv++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 gameCvarTable
ASGNP4
ADDRGP4 $203
JUMPV
LABELV $200
line 386
;386:		if (cv->vmCvar) {
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $204
line 387
;387:			trap_Cvar_Update(cv->vmCvar);
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 389
;388:
;389:			if (cv->modificationCount != cv->vmCvar->modificationCount) {
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
EQI4 $206
line 390
;390:				cv->modificationCount = cv->vmCvar->modificationCount;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 392
;391:
;392:				if (cv->trackChange) {
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
EQI4 $208
line 393
;393:					G_BroadcastServerCommand(-1, va("print \"Server: %s changed to %s\n\"", cv->cvarName, cv->vmCvar->string));
ADDRGP4 $210
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 394
;394:				}
LABELV $208
line 396
;395:
;396:				if (cv->teamShader) {
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CNSTI4 0
EQI4 $211
line 397
;397:					remapped = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
line 398
;398:				}
LABELV $211
line 399
;399:			}
LABELV $206
line 400
;400:		}
LABELV $204
line 401
;401:	}
LABELV $201
line 385
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ASGNP4
LABELV $203
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 48
LTU4 $200
line 403
;402:
;403:	if (remapped) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $213
line 404
;404:		G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 405
;405:	}
LABELV $213
line 406
;406:}
LABELV $199
endproc G_UpdateCvars 28 12
proc G_LocateSpawnSpots 44 12
line 408
;407:
;408:static void G_LocateSpawnSpots(void) {
line 412
;409:	gentity_t* ent;
;410:	int        i, n;
;411:
;412:	level.spawnSpots[SPAWN_SPOT_INTERMISSION] = NULL;
ADDRGP4 level+7688+4092
CNSTP4 0
ASGNP4
line 415
;413:
;414:	// locate all spawn spots
;415:	n   = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 416
;416:	ent = g_entities + MAX_CLIENTS;
ADDRLP4 0
ADDRGP4 g_entities+52224
ASGNP4
line 417
;417:	for (i = MAX_CLIENTS; i < MAX_GENTITIES; i++, ent++) {
ADDRLP4 8
CNSTI4 64
ASGNI4
LABELV $219
line 419
;418:
;419:		if (!ent->inuse || !ent->classname)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $225
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $223
LABELV $225
line 420
;420:			continue;
ADDRGP4 $220
JUMPV
LABELV $223
line 423
;421:
;422:		// intermission/ffa spots
;423:		if (!Q_stricmpn(ent->classname, "info_player_", 12)) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $228
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 16
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $226
line 424
;424:			if (!Q_stricmp(ent->classname + 12, "intermission")) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 $231
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $229
line 425
;425:				if (level.spawnSpots[SPAWN_SPOT_INTERMISSION] == NULL) {
ADDRGP4 level+7688+4092
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $220
line 426
;426:					level.spawnSpots[SPAWN_SPOT_INTERMISSION] = ent;  // put in the last slot
ADDRGP4 level+7688+4092
ADDRLP4 0
INDIRP4
ASGNP4
line 427
;427:					ent->fteam                                = TEAM_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 0
ASGNI4
line 428
;428:				}
line 429
;429:				continue;
ADDRGP4 $220
JUMPV
LABELV $229
line 431
;430:			}
;431:			if (!Q_stricmp(ent->classname + 12, "deathmatch")) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 $240
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $220
line 432
;432:				level.spawnSpots[n] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 433
;433:				n++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 434
;434:				level.numSpawnSpotsFFA++;
ADDRLP4 28
ADDRGP4 level+11792
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 435
;435:				ent->fteam = TEAM_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 0
ASGNI4
line 436
;436:				ent->count = 1;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 437
;437:				continue;
ADDRGP4 $220
JUMPV
line 439
;438:			}
;439:			continue;
LABELV $226
line 443
;440:		}
;441:
;442:		// team spawn spots
;443:		if (!Q_stricmpn(ent->classname, "team_CTF_", 9)) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $245
ARGP4
CNSTI4 9
ARGI4
ADDRLP4 20
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $243
line 444
;444:			if (!Q_stricmp(ent->classname + 9, "redspawn")) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 9
ADDP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $246
line 445
;445:				level.spawnSpots[n] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 446
;446:				n++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 447
;447:				level.numSpawnSpotsTeam++;
ADDRLP4 28
ADDRGP4 level+11788
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 448
;448:				ent->fteam = TEAM_RED;
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 1
ASGNI4
line 449
;449:				ent->count = 1;  // means its not initial spawn point
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 450
;450:				continue;
ADDRGP4 $220
JUMPV
LABELV $246
line 452
;451:			}
;452:			if (!Q_stricmp(ent->classname + 9, "bluespawn")) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 9
ADDP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $251
line 453
;453:				level.spawnSpots[n] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 454
;454:				n++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 455
;455:				level.numSpawnSpotsTeam++;
ADDRLP4 32
ADDRGP4 level+11788
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 456
;456:				ent->fteam = TEAM_BLUE;
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 2
ASGNI4
line 457
;457:				ent->count = 1;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 458
;458:				continue;
ADDRGP4 $220
JUMPV
LABELV $251
line 461
;459:			}
;460:			// base spawn spots
;461:			if (!Q_stricmp(ent->classname + 9, "redplayer")) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 9
ADDP4
ARGP4
ADDRGP4 $258
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $256
line 462
;462:				level.spawnSpots[n] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 463
;463:				n++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 464
;464:				level.numSpawnSpotsTeam++;
ADDRLP4 36
ADDRGP4 level+11788
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 465
;465:				ent->fteam = TEAM_RED;
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 1
ASGNI4
line 466
;466:				ent->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 467
;467:				continue;
ADDRGP4 $220
JUMPV
LABELV $256
line 469
;468:			}
;469:			if (!Q_stricmp(ent->classname + 9, "blueplayer")) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CNSTI4 9
ADDP4
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $261
line 470
;470:				level.spawnSpots[n] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 471
;471:				n++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 472
;472:				level.numSpawnSpotsTeam++;
ADDRLP4 40
ADDRGP4 level+11788
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 473
;473:				ent->fteam = TEAM_BLUE;
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
CNSTI4 2
ASGNI4
line 474
;474:				ent->count = 0;
ADDRLP4 0
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 0
ASGNI4
line 475
;475:				continue;
LABELV $261
line 477
;476:			}
;477:		}
LABELV $243
line 478
;478:	}
LABELV $220
line 417
ADDRLP4 8
ADDRLP4 8
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
ADDRLP4 8
INDIRI4
CNSTI4 1024
LTI4 $219
line 479
;479:	level.numSpawnSpots = n;
ADDRGP4 level+11784
ADDRLP4 4
INDIRI4
ASGNI4
line 480
;480:}
LABELV $215
endproc G_LocateSpawnSpots 44 12
proc G_InitGame 1288 20
line 488
;481:
;482:/*
;483:============
;484:G_InitGame
;485:
;486:============
;487:*/
;488:static void G_InitGame(int levelTime, int randomSeed, int restart) {
line 492
;489:	char value[MAX_CVAR_VALUE_STRING];
;490:	int  i;
;491:
;492:	G_Printf("------- Game Initialization -------\n");
ADDRGP4 $268
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 493
;493:	G_Printf("gamename: %s\n", GAMEVERSION);
ADDRGP4 $269
ARGP4
ADDRGP4 $58
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 494
;494:	G_Printf("gamedate: %s\n", __DATE__);
ADDRGP4 $270
ARGP4
ADDRGP4 $60
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 497
;495:
;496:	// extension interface
;497:	trap_Cvar_VariableStringBuffer("//trap_GetValue", value, sizeof(value));
ADDRGP4 $271
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 498
;498:	if (value[0]) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $272
line 500
;499:#ifdef Q3_VM
;500:		trap_GetValue = (void*)~atoi(value);
ADDRLP4 4
ARGP4
ADDRLP4 260
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 trap_GetValue
ADDRLP4 260
INDIRI4
BCOMI4
CVIU4 4
CVUP4 4
ASGNP4
line 504
;501:#else
;502:		dll_com_trapGetValue = atoi(value);
;503:#endif
;504:		if (trap_GetValue(value, sizeof(value), "SVF_SELF_PORTAL2_Q3E")) {
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $276
ARGP4
ADDRLP4 264
ADDRGP4 trap_GetValue
INDIRP4
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $274
line 505
;505:			svf_self_portal2 = atoi(value);
ADDRLP4 4
ARGP4
ADDRLP4 268
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 svf_self_portal2
ADDRLP4 268
INDIRI4
ASGNI4
line 506
;506:		} else {
ADDRGP4 $275
JUMPV
LABELV $274
line 507
;507:			svf_self_portal2 = 0;
ADDRGP4 svf_self_portal2
CNSTI4 0
ASGNI4
line 508
;508:		}
LABELV $275
line 509
;509:	}
LABELV $272
line 511
;510:
;511:	srand(randomSeed);
ADDRFP4 4
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 srand
CALLV
pop
line 513
;512:
;513:	G_RegisterCvars();
ADDRGP4 G_RegisterCvars
CALLV
pop
line 515
;514:
;515:	G_ProcessIPBans();
ADDRGP4 G_ProcessIPBans
CALLV
pop
line 517
;516:
;517:	G_InitMemory();
ADDRGP4 G_InitMemory
CALLV
pop
line 520
;518:
;519:	// set some level globals
;520:	memset(&level, 0, sizeof(level));
ADDRGP4 level
ARGP4
CNSTI4 0
ARGI4
CNSTI4 11804
ARGI4
ADDRGP4 memset
CALLP4
pop
line 521
;521:	level.time = levelTime;
ADDRGP4 level+32
ADDRFP4 0
INDIRI4
ASGNI4
line 523
;522:
;523:	level.startTime = levelTime;
ADDRGP4 level+40
ADDRFP4 0
INDIRI4
ASGNI4
line 525
;524:
;525:	level.previousTime = levelTime;
ADDRGP4 level+36
ADDRFP4 0
INDIRI4
ASGNI4
line 526
;526:	level.msec         = FRAMETIME;
ADDRGP4 level+44
CNSTI4 100
ASGNI4
line 528
;527:
;528:	level.snd_fry = G_SoundIndex("sound/player/fry.wav");  // FIXME standing in lava / slime
ADDRGP4 $282
ARGP4
ADDRLP4 260
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRGP4 level+352
ADDRLP4 260
INDIRI4
ASGNI4
line 530
;529:
;530:	if (g_gametype.integer != GT_SINGLE_PLAYER && g_log.string[0]) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $283
ADDRGP4 g_log+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $283
line 531
;531:		if (g_logSync.integer) {
ADDRGP4 g_logSync+12
INDIRI4
CNSTI4 0
EQI4 $287
line 532
;532:			trap_FS_FOpenFile(g_log.string, &level.logFile, FS_APPEND_SYNC);
ADDRGP4 g_log+16
ARGP4
ADDRGP4 level+20
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 533
;533:		} else {
ADDRGP4 $288
JUMPV
LABELV $287
line 534
;534:			trap_FS_FOpenFile(g_log.string, &level.logFile, FS_APPEND);
ADDRGP4 g_log+16
ARGP4
ADDRGP4 level+20
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 535
;535:		}
LABELV $288
line 536
;536:		if (level.logFile == FS_INVALID_HANDLE) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
NEI4 $294
line 537
;537:			G_Printf("WARNING: Couldn't open logfile: %s\n", g_log.string);
ADDRGP4 $297
ARGP4
ADDRGP4 g_log+16
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 538
;538:		} else {
ADDRGP4 $284
JUMPV
LABELV $294
line 541
;539:			char serverinfo[MAX_INFO_STRING];
;540:
;541:			trap_GetServerinfo(serverinfo, sizeof(serverinfo));
ADDRLP4 264
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 543
;542:
;543:			G_LogPrintf("------------------------------------------------------------\n");
ADDRGP4 $299
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 544
;544:			G_LogPrintf("InitGame: %s\n", serverinfo);
ADDRGP4 $300
ARGP4
ADDRLP4 264
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 545
;545:		}
line 546
;546:	} else {
ADDRGP4 $284
JUMPV
LABELV $283
line 547
;547:		G_Printf("Not logging to disk.\n");
ADDRGP4 $301
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 548
;548:	}
LABELV $284
line 550
;549:
;550:	G_InitWorldSession();
ADDRGP4 G_InitWorldSession
CALLV
pop
line 553
;551:
;552:	// initialize all entities for this game
;553:	memset(g_entities, 0, MAX_GENTITIES * sizeof(g_entities[0]));
ADDRGP4 g_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 835584
ARGI4
ADDRGP4 memset
CALLP4
pop
line 554
;554:	level.gentities = g_entities;
ADDRGP4 level+4
ADDRGP4 g_entities
ASGNP4
line 557
;555:
;556:	// initialize all clients for this game
;557:	level.maxclients = g_maxclients.integer;
ADDRGP4 level+24
ADDRGP4 g_maxclients+12
INDIRI4
ASGNI4
line 558
;558:	memset(g_clients, 0, MAX_CLIENTS * sizeof(g_clients[0]));
ADDRGP4 g_clients
ARGP4
CNSTI4 0
ARGI4
CNSTI4 100864
ARGI4
ADDRGP4 memset
CALLP4
pop
line 559
;559:	level.clients = g_clients;
ADDRGP4 level
ADDRGP4 g_clients
ASGNP4
line 562
;560:
;561:	// set client fields on player ents
;562:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $308
JUMPV
LABELV $305
line 563
;563:		g_entities[i].client = level.clients + i;
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 564
;564:	}
LABELV $306
line 562
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $308
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $305
line 569
;565:
;566:	// always leave room for the max number of clients,
;567:	// even if they aren't all used, so numbers inside that
;568:	// range are NEVER anything but clients
;569:	level.num_entities = MAX_CLIENTS;
ADDRGP4 level+12
CNSTI4 64
ASGNI4
line 571
;570:
;571:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $312
line 572
;572:		g_entities[i].classname = "clientslot";
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+524
ADDP4
ADDRGP4 $317
ASGNP4
line 573
;573:	}
LABELV $313
line 571
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $312
line 576
;574:
;575:	// let the server system know where the entites are
;576:	trap_LocateGameData(level.gentities, level.num_entities, sizeof(gentity_t), &level.clients[0].ps, sizeof(level.clients[0]));
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
line 579
;577:
;578:	// reserve some spots for dead player bodies
;579:	InitBodyQue();
ADDRGP4 InitBodyQue
CALLV
pop
line 581
;580:
;581:	ClearRegisteredItems();
ADDRGP4 ClearRegisteredItems
CALLV
pop
line 584
;582:
;583:	// parse the key/value pairs and spawn gentities
;584:	G_SpawnEntitiesFromString();
ADDRGP4 G_SpawnEntitiesFromString
CALLV
pop
line 590
;585:
;586:	//::::::::::::::::
;587:	// Search for trigger_multiple in the map, with wait -1, and hardcode its wait to 0.5
;588:	//   FIXME: This shouldn't exist. Needs to be changed to reset wait time individually per client on ClientRespawn()
;589:	//   Temp Hack until client-based entities are implemented.
;590:	{
line 596
;591:		gentity_t* ent;
;592:		qboolean   isTriggerOnce;
;593:		int			id;
;594:		
;595:		// Loop through all gentities
;596:		for (id = 0; id < MAX_GENTITIES; id++) {
ADDRLP4 268
CNSTI4 0
ASGNI4
LABELV $320
line 597
;597:			ent           = &g_entities[id];
ADDRLP4 264
ADDRLP4 268
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 598
;598:			isTriggerOnce = (!Q_stricmp(ent->classname, "trigger_multiple") && ent->wait < 0) ? qtrue : qfalse;
ADDRLP4 264
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $324
ARGP4
ADDRLP4 280
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $326
ADDRLP4 264
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
GEF4 $326
ADDRLP4 276
CNSTI4 1
ASGNI4
ADDRGP4 $327
JUMPV
LABELV $326
ADDRLP4 276
CNSTI4 0
ASGNI4
LABELV $327
ADDRLP4 272
ADDRLP4 276
INDIRI4
ASGNI4
line 599
;599:			if (isTriggerOnce) {
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $328
line 600
;600:				ent->wait = 0.5;
ADDRLP4 264
INDIRP4
CNSTI4 796
ADDP4
CNSTF4 1056964608
ASGNF4
line 601
;601:			}
LABELV $328
line 602
;602:		}
LABELV $321
line 596
ADDRLP4 268
ADDRLP4 268
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 1024
LTI4 $320
line 603
;603:	}
line 607
;604:	//::::::::::::::::
;605:
;606:	// general initialization
;607:	G_FindTeams();
ADDRGP4 G_FindTeams
CALLV
pop
line 610
;608:
;609:	// make sure we have flags for CTF, etc
;610:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $330
line 611
;611:		G_CheckTeamItems();
ADDRGP4 G_CheckTeamItems
CALLV
pop
line 612
;612:	}
LABELV $330
line 614
;613:
;614:	SaveRegisteredItems();
ADDRGP4 SaveRegisteredItems
CALLV
pop
line 616
;615:
;616:	G_LocateSpawnSpots();
ADDRGP4 G_LocateSpawnSpots
CALLV
pop
line 618
;617:
;618:	G_Printf("-----------------------------------\n");
ADDRGP4 $333
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 620
;619:
;620:	if (g_gametype.integer == GT_SINGLE_PLAYER || trap_Cvar_VariableIntegerValue("com_buildScript")) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $338
ADDRGP4 $337
ARGP4
ADDRLP4 264
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $334
LABELV $338
line 621
;621:		G_ModelIndex(SP_PODIUM_MODEL);
ADDRGP4 $339
ARGP4
ADDRGP4 G_ModelIndex
CALLI4
pop
line 622
;622:	}
LABELV $334
line 624
;623:
;624:	if (trap_Cvar_VariableIntegerValue("bot_enable")) {
ADDRGP4 $342
ARGP4
ADDRLP4 268
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $340
line 625
;625:		BotAISetup(restart);
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotAISetup
CALLI4
pop
line 626
;626:		BotAILoadMap(restart);
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 BotAILoadMap
CALLI4
pop
line 627
;627:		G_InitBots(restart);
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_InitBots
CALLV
pop
line 628
;628:	}
LABELV $340
line 630
;629:
;630:	G_RemapTeamShaders();
ADDRGP4 G_RemapTeamShaders
CALLV
pop
line 633
;631:
;632:	// don't forget to reset times
;633:	trap_SetConfigstring(CS_INTERMISSION, "");
CNSTI4 22
ARGI4
ADDRGP4 $56
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 635
;634:
;635:	if (g_gametype.integer != GT_SINGLE_PLAYER) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $343
line 637
;636:		// launch rotation system on first map load
;637:		if (trap_Cvar_VariableIntegerValue(SV_ROTATION) == 0) {
ADDRGP4 $348
ARGP4
ADDRLP4 272
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $346
line 638
;638:			trap_Cvar_Set(SV_ROTATION, "1");
ADDRGP4 $348
ARGP4
ADDRGP4 $77
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 639
;639:			level.denyMapRestart = qtrue;
ADDRGP4 level+11796
CNSTI4 1
ASGNI4
line 640
;640:			ParseMapRotation();
ADDRGP4 ParseMapRotation
CALLI4
pop
line 641
;641:		}
LABELV $346
line 642
;642:	}
LABELV $343
line 643
;643:}
LABELV $267
endproc G_InitGame 1288 20
proc G_ShutdownGame 4 4
line 650
;644:
;645:/*
;646:=================
;647:G_ShutdownGame
;648:=================
;649:*/
;650:static void G_ShutdownGame(int restart) {
line 651
;651:	G_Printf("==== ShutdownGame ====\n");
ADDRGP4 $351
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 653
;652:
;653:	if (level.logFile != FS_INVALID_HANDLE) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
EQI4 $352
line 654
;654:		G_LogPrintf("ShutdownGame:\n");
ADDRGP4 $355
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 655
;655:		G_LogPrintf("------------------------------------------------------------\n");
ADDRGP4 $299
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 656
;656:		trap_FS_FCloseFile(level.logFile);
ADDRGP4 level+20
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 657
;657:		level.logFile = FS_INVALID_HANDLE;
ADDRGP4 level+20
CNSTI4 0
ASGNI4
line 658
;658:	}
LABELV $352
line 661
;659:
;660:	// write all the client session data so we can get it back
;661:	G_WriteSessionData();
ADDRGP4 G_WriteSessionData
CALLV
pop
line 663
;662:
;663:	if (trap_Cvar_VariableIntegerValue("bot_enable")) {
ADDRGP4 $342
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $358
line 664
;664:		BotAIShutdown(restart);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAIShutdown
CALLI4
pop
line 665
;665:	}
LABELV $358
line 666
;666:}
LABELV $350
endproc G_ShutdownGame 4 4
export Com_Error
proc Com_Error 4100 12
line 673
;667:
;668://===================================================================
;669:
;670:#ifndef GAME_HARD_LINKED
;671:// this is only here so the functions in q_shared.c and bg_*.c can link
;672:
;673:void QDECL Com_Error(int level, const char* fmt, ...) {
line 677
;674:	va_list argptr;
;675:	char    text[4096];
;676:
;677:	va_start(argptr, fmt);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 678
;678:	ED_vsprintf(text, fmt, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 679
;679:	va_end(argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 681
;680:
;681:	trap_Error(text);
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 682
;682:}
LABELV $360
endproc Com_Error 4100 12
export Com_Printf
proc Com_Printf 4100 12
line 684
;683:
;684:void QDECL Com_Printf(const char* fmt, ...) {
line 688
;685:	va_list argptr;
;686:	char    text[4096];
;687:
;688:	va_start(argptr, fmt);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 689
;689:	ED_vsprintf(text, fmt, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 690
;690:	va_end(argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 692
;691:
;692:	trap_Print(text);
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 693
;693:}
LABELV $362
endproc Com_Printf 4100 12
export AddTournamentPlayer
proc AddTournamentPlayer 20 8
line 713
;694:
;695:#endif
;696:
;697:/*
;698:========================================================================
;699:
;700:PLAYER COUNTING / SCORE SORTING
;701:
;702:========================================================================
;703:*/
;704:
;705:/*
;706:=============
;707:AddTournamentPlayer
;708:
;709:If there are less than two tournament players, put a
;710:spectator in the game and restart
;711:=============
;712:*/
;713:void AddTournamentPlayer(void) {
line 718
;714:	int        i;
;715:	gclient_t* client;
;716:	gclient_t* nextInLine;
;717:
;718:	if (level.numPlayingClients >= 2) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
LTI4 $365
line 719
;719:		return;
ADDRGP4 $364
JUMPV
LABELV $365
line 723
;720:	}
;721:
;722:	// never change during intermission
;723:	if (level.intermissiontime) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $368
line 724
;724:		return;
ADDRGP4 $364
JUMPV
LABELV $368
line 727
;725:	}
;726:
;727:	nextInLine = NULL;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 729
;728:
;729:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $374
JUMPV
LABELV $371
line 730
;730:		client = &level.clients[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 731
;731:		if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $376
line 732
;732:			continue;
ADDRGP4 $372
JUMPV
LABELV $376
line 734
;733:		}
;734:		if (client->sess.sessionTeam != TEAM_SPECTATOR) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $378
line 735
;735:			continue;
ADDRGP4 $372
JUMPV
LABELV $378
line 738
;736:		}
;737:		// never select the dedicated follow or scoreboard clients
;738:		if (client->sess.spectatorState == SPECTATOR_SCOREBOARD || client->sess.spectatorClient < 0) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 3
EQI4 $382
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CNSTI4 0
GEI4 $380
LABELV $382
line 739
;739:			continue;
ADDRGP4 $372
JUMPV
LABELV $380
line 742
;740:		}
;741:
;742:		if (!nextInLine || client->sess.spectatorTime > nextInLine->sess.spectatorTime) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $385
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
LEI4 $383
LABELV $385
line 743
;743:			nextInLine = client;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
line 744
;744:		}
LABELV $383
line 745
;745:	}
LABELV $372
line 729
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $374
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $371
line 747
;746:
;747:	if (!nextInLine) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $386
line 748
;748:		return;
ADDRGP4 $364
JUMPV
LABELV $386
line 751
;749:	}
;750:
;751:	level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 754
;752:
;753:	// set them to free-for-all team
;754:	SetTeam(&g_entities[nextInLine - level.clients], "f");
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1576
DIVI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $389
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 755
;755:}
LABELV $364
endproc AddTournamentPlayer 20 8
export RemoveTournamentLoser
proc RemoveTournamentLoser 4 8
line 764
;756:
;757:/*
;758:=======================
;759:RemoveTournamentLoser
;760:
;761:Make the loser a spectator at the back of the line
;762:=======================
;763:*/
;764:void RemoveTournamentLoser(void) {
line 767
;765:	int clientNum;
;766:
;767:	if (level.numPlayingClients != 2) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
EQI4 $391
line 768
;768:		return;
ADDRGP4 $390
JUMPV
LABELV $391
line 771
;769:	}
;770:
;771:	clientNum = level.sortedClients[1];
ADDRLP4 0
ADDRGP4 level+88+4
INDIRI4
ASGNI4
line 773
;772:
;773:	if (level.clients[clientNum].pers.connected != CON_CONNECTED) {
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
EQI4 $396
line 774
;774:		return;
ADDRGP4 $390
JUMPV
LABELV $396
line 778
;775:	}
;776:
;777:	// make them a spectator
;778:	SetTeam(&g_entities[clientNum], "s");
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $398
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 779
;779:}
LABELV $390
endproc RemoveTournamentLoser 4 8
export RemoveTournamentWinner
proc RemoveTournamentWinner 4 8
line 786
;780:
;781:/*
;782:=======================
;783:RemoveTournamentWinner
;784:=======================
;785:*/
;786:void RemoveTournamentWinner(void) {
line 789
;787:	int clientNum;
;788:
;789:	if (level.numPlayingClients != 2) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
EQI4 $400
line 790
;790:		return;
ADDRGP4 $399
JUMPV
LABELV $400
line 793
;791:	}
;792:
;793:	clientNum = level.sortedClients[0];
ADDRLP4 0
ADDRGP4 level+88
INDIRI4
ASGNI4
line 795
;794:
;795:	if (level.clients[clientNum].pers.connected != CON_CONNECTED) {
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
EQI4 $404
line 796
;796:		return;
ADDRGP4 $399
JUMPV
LABELV $404
line 800
;797:	}
;798:
;799:	// make them a spectator
;800:	SetTeam(&g_entities[clientNum], "s");
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 $398
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 801
;801:}
LABELV $399
endproc RemoveTournamentWinner 4 8
export AdjustTournamentScores
proc AdjustTournamentScores 8 4
line 808
;802:
;803:/*
;804:=======================
;805:AdjustTournamentScores
;806:=======================
;807:*/
;808:void AdjustTournamentScores(void) {
line 811
;809:	int clientNum;
;810:
;811:	clientNum = level.sortedClients[0];
ADDRLP4 0
ADDRGP4 level+88
INDIRI4
ASGNI4
line 812
;812:	if (level.clients[clientNum].pers.connected == CON_CONNECTED) {
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
NEI4 $408
line 813
;813:		level.clients[clientNum].sess.wins++;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 640
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 814
;814:		ClientUserinfoChanged(clientNum);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 815
;815:	}
LABELV $408
line 817
;816:
;817:	clientNum = level.sortedClients[1];
ADDRLP4 0
ADDRGP4 level+88+4
INDIRI4
ASGNI4
line 818
;818:	if (level.clients[clientNum].pers.connected == CON_CONNECTED) {
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
NEI4 $412
line 819
;819:		level.clients[clientNum].sess.losses++;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 644
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 820
;820:		ClientUserinfoChanged(clientNum);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 821
;821:	}
LABELV $412
line 822
;822:}
LABELV $406
endproc AdjustTournamentScores 8 4
proc SortRanks 16 0
line 829
;823:
;824:/*
;825:=============
;826:SortRanks
;827:=============
;828:*/
;829:static int QDECL SortRanks(const void* a, const void* b) {
line 832
;830:	gclient_t *ca, *cb;
;831:
;832:	ca = &level.clients[*(int*)a];
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 833
;833:	cb = &level.clients[*(int*)b];
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 836
;834:
;835:	// sort special clients last
;836:	if (ca->sess.spectatorState == SPECTATOR_SCOREBOARD || ca->sess.spectatorClient < 0) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 3
EQI4 $417
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CNSTI4 0
GEI4 $415
LABELV $417
line 837
;837:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $414
JUMPV
LABELV $415
line 839
;838:	}
;839:	if (cb->sess.spectatorState == SPECTATOR_SCOREBOARD || cb->sess.spectatorClient < 0) {
ADDRLP4 4
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 3
EQI4 $420
ADDRLP4 4
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CNSTI4 0
GEI4 $418
LABELV $420
line 840
;840:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $414
JUMPV
LABELV $418
line 844
;841:	}
;842:
;843:	// then connecting clients
;844:	if (ca->pers.connected == CON_CONNECTING) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $421
line 845
;845:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $414
JUMPV
LABELV $421
line 847
;846:	}
;847:	if (cb->pers.connected == CON_CONNECTING) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $423
line 848
;848:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $414
JUMPV
LABELV $423
line 852
;849:	}
;850:
;851:	// then spectators
;852:	if (ca->sess.sessionTeam == TEAM_SPECTATOR && cb->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $425
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $425
line 853
;853:		if (ca->sess.spectatorTime > cb->sess.spectatorTime) {
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
LEI4 $427
line 854
;854:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $414
JUMPV
LABELV $427
line 856
;855:		}
;856:		if (ca->sess.spectatorTime < cb->sess.spectatorTime) {
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 628
ADDP4
INDIRI4
GEI4 $429
line 857
;857:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $414
JUMPV
LABELV $429
line 859
;858:		}
;859:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $414
JUMPV
LABELV $425
line 861
;860:	}
;861:	if (ca->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $431
line 862
;862:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $414
JUMPV
LABELV $431
line 864
;863:	}
;864:	if (cb->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $433
line 865
;865:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $414
JUMPV
LABELV $433
line 869
;866:	}
;867:
;868:	// then sort by score
;869:	if (ca->ps.persistant[PERS_SCORE] > cb->ps.persistant[PERS_SCORE]) {
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
LEI4 $435
line 870
;870:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $414
JUMPV
LABELV $435
line 872
;871:	}
;872:	if (ca->ps.persistant[PERS_SCORE] < cb->ps.persistant[PERS_SCORE]) {
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
GEI4 $437
line 873
;873:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $414
JUMPV
LABELV $437
line 875
;874:	}
;875:	return 0;
CNSTI4 0
RETI4
LABELV $414
endproc SortRanks 16 0
export CalculateRanks
proc CalculateRanks 44 16
line 887
;876:}
;877:
;878:/*
;879:============
;880:CalculateRanks
;881:
;882:Recalculates the score ranks of all players
;883:This will be called on every client connect, begin, disconnect, death,
;884:and team change.
;885:============
;886:*/
;887:void CalculateRanks(void) {
line 894
;888:	int        i;
;889:	int        rank;
;890:	int        score;
;891:	int        newScore;
;892:	gclient_t* cl;
;893:
;894:	if (level.restarted)
ADDRGP4 level+72
INDIRI4
CNSTI4 0
EQI4 $440
line 895
;895:		return;
ADDRGP4 $439
JUMPV
LABELV $440
line 897
;896:
;897:	level.follow1                = -1;
ADDRGP4 level+344
CNSTI4 -1
ASGNI4
line 898
;898:	level.follow2                = -1;
ADDRGP4 level+348
CNSTI4 -1
ASGNI4
line 899
;899:	level.numConnectedClients    = 0;
ADDRGP4 level+76
CNSTI4 0
ASGNI4
line 900
;900:	level.numNonSpectatorClients = 0;
ADDRGP4 level+80
CNSTI4 0
ASGNI4
line 901
;901:	level.numPlayingClients      = 0;
ADDRGP4 level+84
CNSTI4 0
ASGNI4
line 902
;902:	level.numVotingClients       = 0;  // don't count bots
ADDRGP4 level+888
CNSTI4 0
ASGNI4
line 903
;903:	for (i = 0; i < ARRAY_LEN(level.numteamVotingClients); i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $452
JUMPV
LABELV $449
line 904
;904:		level.numteamVotingClients[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2964
ADDP4
CNSTI4 0
ASGNI4
line 905
;905:	}
LABELV $450
line 903
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $452
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 4
LTU4 $449
line 906
;906:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $459
JUMPV
LABELV $456
line 907
;907:		if (level.clients[i].pers.connected != CON_DISCONNECTED) {
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
CNSTI4 0
EQI4 $461
line 908
;908:			level.sortedClients[level.numConnectedClients] = i;
ADDRGP4 level+76
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 909
;909:			level.numConnectedClients++;
ADDRLP4 20
ADDRGP4 level+76
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 911
;910:
;911:			if (level.clients[i].sess.sessionTeam != TEAM_SPECTATOR) {
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
CNSTI4 3
EQI4 $466
line 912
;912:				level.numNonSpectatorClients++;
ADDRLP4 24
ADDRGP4 level+80
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 915
;913:
;914:				// decide if this should be auto-followed
;915:				if (level.clients[i].pers.connected == CON_CONNECTED) {
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
NEI4 $469
line 916
;916:					level.numPlayingClients++;
ADDRLP4 28
ADDRGP4 level+84
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 917
;917:					if (!(g_entities[i].r.svFlags & SVF_BOT)) {
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
NEI4 $472
line 918
;918:						level.numVotingClients++;
ADDRLP4 32
ADDRGP4 level+888
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 919
;919:						if (level.clients[i].sess.sessionTeam == TEAM_RED)
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
CNSTI4 1
NEI4 $477
line 920
;920:							level.numteamVotingClients[0]++;
ADDRLP4 36
ADDRGP4 level+2964
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $478
JUMPV
LABELV $477
line 921
;921:						else if (level.clients[i].sess.sessionTeam == TEAM_BLUE)
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
CNSTI4 2
NEI4 $480
line 922
;922:							level.numteamVotingClients[1]++;
ADDRLP4 40
ADDRGP4 level+2964+4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $480
LABELV $478
line 923
;923:					}
LABELV $472
line 924
;924:					if (level.follow1 == -1) {
ADDRGP4 level+344
INDIRI4
CNSTI4 -1
NEI4 $484
line 925
;925:						level.follow1 = i;
ADDRGP4 level+344
ADDRLP4 0
INDIRI4
ASGNI4
line 926
;926:					} else if (level.follow2 == -1) {
ADDRGP4 $485
JUMPV
LABELV $484
ADDRGP4 level+348
INDIRI4
CNSTI4 -1
NEI4 $488
line 927
;927:						level.follow2 = i;
ADDRGP4 level+348
ADDRLP4 0
INDIRI4
ASGNI4
line 928
;928:					}
LABELV $488
LABELV $485
line 929
;929:				}
LABELV $469
line 930
;930:			}
LABELV $466
line 931
;931:		}
LABELV $461
line 932
;932:	}
LABELV $457
line 906
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $459
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $456
line 934
;933:
;934:	qsort(level.sortedClients, level.numConnectedClients, sizeof(level.sortedClients[0]), SortRanks);
ADDRGP4 level+88
ARGP4
ADDRGP4 level+76
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 SortRanks
ARGP4
ADDRGP4 qsort
CALLV
pop
line 937
;935:
;936:	// set the rank value for all clients that are connected and not spectators
;937:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $495
line 939
;938:		// in team games, rank is just the order of the teams, 0=red, 1=blue, 2=tied
;939:		for (i = 0; i < level.numConnectedClients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $501
JUMPV
LABELV $498
line 940
;940:			cl = &level.clients[level.sortedClients[i]];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 941
;941:			if (level.teamScores[TEAM_RED] == level.teamScores[TEAM_BLUE]) {
ADDRGP4 level+48+4
INDIRI4
ADDRGP4 level+48+8
INDIRI4
NEI4 $504
line 942
;942:				cl->ps.persistant[PERS_RANK] = 2;
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 2
ASGNI4
line 943
;943:			} else if (level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE]) {
ADDRGP4 $505
JUMPV
LABELV $504
ADDRGP4 level+48+4
INDIRI4
ADDRGP4 level+48+8
INDIRI4
LEI4 $510
line 944
;944:				cl->ps.persistant[PERS_RANK] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 0
ASGNI4
line 945
;945:			} else {
ADDRGP4 $511
JUMPV
LABELV $510
line 946
;946:				cl->ps.persistant[PERS_RANK] = 1;
ADDRLP4 4
INDIRP4
CNSTI4 256
ADDP4
CNSTI4 1
ASGNI4
line 947
;947:			}
LABELV $511
LABELV $505
line 948
;948:		}
LABELV $499
line 939
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $501
ADDRLP4 0
INDIRI4
ADDRGP4 level+76
INDIRI4
LTI4 $498
line 949
;949:	} else {
ADDRGP4 $496
JUMPV
LABELV $495
line 950
;950:		rank  = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 951
;951:		score = MAX_QINT;
ADDRLP4 16
CNSTI4 2147483647
ASGNI4
line 952
;952:		for (i = 0; i < level.numPlayingClients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $519
JUMPV
LABELV $516
line 953
;953:			cl       = &level.clients[level.sortedClients[i]];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 954
;954:			newScore = cl->ps.persistant[PERS_SCORE];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 955
;955:			if (i == 0 || newScore != score) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $524
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
EQI4 $522
LABELV $524
line 956
;956:				rank = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 958
;957:				// assume we aren't tied until the next client is checked
;958:				level.clients[level.sortedClients[i]].ps.persistant[PERS_RANK] = rank;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 959
;959:			} else {
ADDRGP4 $523
JUMPV
LABELV $522
line 961
;960:				// we are tied with the previous client
;961:				level.clients[level.sortedClients[i - 1]].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88-4
ADDP4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 962
;962:				level.clients[level.sortedClients[i]].ps.persistant[PERS_RANK]     = rank | RANK_TIED_FLAG;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 963
;963:			}
LABELV $523
line 964
;964:			score = newScore;
ADDRLP4 16
ADDRLP4 8
INDIRI4
ASGNI4
line 965
;965:			if (g_gametype.integer == GT_SINGLE_PLAYER && level.numPlayingClients == 1) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $529
ADDRGP4 level+84
INDIRI4
CNSTI4 1
NEI4 $529
line 966
;966:				level.clients[level.sortedClients[i]].ps.persistant[PERS_RANK] = rank | RANK_TIED_FLAG;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 256
ADDP4
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 967
;967:			}
LABELV $529
line 968
;968:		}
LABELV $517
line 952
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $519
ADDRLP4 0
INDIRI4
ADDRGP4 level+84
INDIRI4
LTI4 $516
line 969
;969:	}
LABELV $496
line 972
;970:
;971:	// set the CS_SCORES1/2 configstrings, which will be visible to everyone
;972:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $534
line 973
;973:		trap_SetConfigstring(CS_SCORES1, va("%i", level.teamScores[TEAM_RED]));
ADDRGP4 $537
ARGP4
ADDRGP4 level+48+4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 974
;974:		trap_SetConfigstring(CS_SCORES2, va("%i", level.teamScores[TEAM_BLUE]));
ADDRGP4 $537
ARGP4
ADDRGP4 level+48+8
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 975
;975:	} else {
ADDRGP4 $535
JUMPV
LABELV $534
line 976
;976:		if (level.numConnectedClients == 0) {
ADDRGP4 level+76
INDIRI4
CNSTI4 0
NEI4 $542
line 977
;977:			trap_SetConfigstring(CS_SCORES1, va("%i", SCORE_NOT_PRESENT));
ADDRGP4 $537
ARGP4
CNSTI4 -9999
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 978
;978:			trap_SetConfigstring(CS_SCORES2, va("%i", SCORE_NOT_PRESENT));
ADDRGP4 $537
ARGP4
CNSTI4 -9999
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 979
;979:		} else if (level.numConnectedClients == 1) {
ADDRGP4 $543
JUMPV
LABELV $542
ADDRGP4 level+76
INDIRI4
CNSTI4 1
NEI4 $545
line 980
;980:			trap_SetConfigstring(CS_SCORES1, va("%i", level.clients[level.sortedClients[0]].ps.persistant[PERS_SCORE]));
ADDRGP4 $537
ARGP4
ADDRGP4 level+88
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 981
;981:			trap_SetConfigstring(CS_SCORES2, va("%i", SCORE_NOT_PRESENT));
ADDRGP4 $537
ARGP4
CNSTI4 -9999
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 982
;982:		} else {
ADDRGP4 $546
JUMPV
LABELV $545
line 983
;983:			trap_SetConfigstring(CS_SCORES1, va("%i", level.clients[level.sortedClients[0]].ps.persistant[PERS_SCORE]));
ADDRGP4 $537
ARGP4
ADDRGP4 level+88
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 6
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 984
;984:			trap_SetConfigstring(CS_SCORES2, va("%i", level.clients[level.sortedClients[1]].ps.persistant[PERS_SCORE]));
ADDRGP4 $537
ARGP4
ADDRGP4 level+88+4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 7
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 985
;985:		}
LABELV $546
LABELV $543
line 986
;986:	}
LABELV $535
line 989
;987:
;988:	// see if it is time to end the level
;989:	CheckExitRules();
ADDRGP4 CheckExitRules
CALLV
pop
line 992
;990:
;991:	// if we are at the intermission, send the new info to everyone
;992:	if (level.intermissiontime) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $552
line 993
;993:		SendScoreboardMessageToAllClients();
ADDRGP4 SendScoreboardMessageToAllClients
CALLV
pop
line 994
;994:	}
LABELV $552
line 995
;995:}
LABELV $439
endproc CalculateRanks 44 16
proc SendScoreboardMessageToAllClients 4 4
line 1013
;996:
;997:/*
;998:========================================================================
;999:
;1000:MAP CHANGING
;1001:
;1002:========================================================================
;1003:*/
;1004:
;1005:/*
;1006:========================
;1007:SendScoreboardMessageToAllClients
;1008:
;1009:Do this at BeginIntermission time and whenever ranks are recalculated
;1010:due to enters/exits/forced team changes
;1011:========================
;1012:*/
;1013:static void SendScoreboardMessageToAllClients(void) {
line 1016
;1014:	int i;
;1015:
;1016:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $559
JUMPV
LABELV $556
line 1017
;1017:		if (level.clients[i].pers.connected == CON_CONNECTED) {
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
NEI4 $561
line 1018
;1018:			DeathmatchScoreboardMessage(g_entities + i);
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 1019
;1019:		}
LABELV $561
line 1020
;1020:	}
LABELV $557
line 1016
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $559
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $556
line 1021
;1021:}
LABELV $555
endproc SendScoreboardMessageToAllClients 4 4
export MoveClientToIntermission
proc MoveClientToIntermission 8 12
line 1031
;1022:
;1023:/*
;1024:========================
;1025:MoveClientToIntermission
;1026:
;1027:When the intermission starts, this will be called for all players.
;1028:If a new client connects, this will be called after the spawn function.
;1029:========================
;1030:*/
;1031:void MoveClientToIntermission(gentity_t* ent) {
line 1035
;1032:
;1033:	gclient_t* client;
;1034:
;1035:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1038
;1036:
;1037:	// take out of follow mode if needed
;1038:	if (client->sess.spectatorState == SPECTATOR_FOLLOW) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $564
line 1039
;1039:		StopFollowing(ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 1040
;1040:	}
LABELV $564
line 1043
;1041:
;1042:	// move to the spot
;1043:	VectorCopy(level.intermission_origin, ent->s.origin);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 1044
;1044:	VectorCopy(level.intermission_origin, client->ps.origin);
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 1045
;1045:	SetClientViewAngle(ent, level.intermission_angle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 level+7628
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1046
;1046:	client->ps.pm_type = PM_INTERMISSION;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 5
ASGNI4
line 1049
;1047:
;1048:	// clean up powerup info
;1049:	memset(client->ps.powerups, 0, sizeof(client->ps.powerups));
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1051
;1050:
;1051:	client->ps.eFlags = (client->ps.eFlags & ~EF_PERSISTANT) | (client->ps.eFlags & EF_PERSISTANT);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 -548865
BANDI4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 548864
BANDI4
BORI4
ASGNI4
line 1053
;1052:
;1053:	ent->s.eFlags     = client->ps.eFlags;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 1054
;1054:	ent->s.eType      = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 1055
;1055:	ent->s.modelindex = 0;
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 1056
;1056:	ent->s.loopSound  = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1057
;1057:	ent->s.event      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 1058
;1058:	ent->r.contents   = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 1060
;1059:
;1060:	ent->s.legsAnim  = LEGS_IDLE;
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 22
ASGNI4
line 1061
;1061:	ent->s.torsoAnim = TORSO_STAND;
ADDRFP4 0
INDIRP4
CNSTI4 200
ADDP4
CNSTI4 11
ASGNI4
line 1062
;1062:}
LABELV $563
endproc MoveClientToIntermission 8 12
export FindIntermissionPoint
proc FindIntermissionPoint 28 16
line 1071
;1063:
;1064:/*
;1065:==================
;1066:FindIntermissionPoint
;1067:
;1068:This is also used for spectator spawns
;1069:==================
;1070:*/
;1071:void FindIntermissionPoint(void) {
line 1075
;1072:	gentity_t *ent, *target;
;1073:	vec3_t     dir;
;1074:
;1075:	if (level.intermission_spot)  // search only once
ADDRGP4 level+7640
INDIRI4
CNSTI4 0
EQI4 $570
line 1076
;1076:		return;
ADDRGP4 $569
JUMPV
LABELV $570
line 1079
;1077:
;1078:	// find the intermission spot
;1079:	ent = level.spawnSpots[SPAWN_SPOT_INTERMISSION];
ADDRLP4 0
ADDRGP4 level+7688+4092
INDIRP4
ASGNP4
line 1081
;1080:
;1081:	if (!ent) {  // the map creator forgot to put in an intermission point...
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $575
line 1082
;1082:		SelectSpawnPoint(NULL, vec3_origin, level.intermission_origin, level.intermission_angle);
CNSTP4 0
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRGP4 level+7616
ARGP4
ADDRGP4 level+7628
ARGP4
ADDRGP4 SelectSpawnPoint
CALLP4
pop
line 1083
;1083:	} else {
ADDRGP4 $576
JUMPV
LABELV $575
line 1084
;1084:		VectorCopy(ent->s.origin, level.intermission_origin);
ADDRGP4 level+7616
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 1085
;1085:		VectorCopy(ent->s.angles, level.intermission_angle);
ADDRGP4 level+7628
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 1087
;1086:		// if it has a target, look towards it
;1087:		if (ent->target) {
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $581
line 1088
;1088:			target = G_PickTarget(ent->target);
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 1089
;1089:			if (target) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $583
line 1090
;1090:				VectorSubtract(target->s.origin, level.intermission_origin, dir);
ADDRLP4 24
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 level+7616
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 24
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 level+7616+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRLP4 4
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 level+7616+8
INDIRF4
SUBF4
ASGNF4
line 1091
;1091:				vectoangles(dir, level.intermission_angle);
ADDRLP4 8
ARGP4
ADDRGP4 level+7628
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 1092
;1092:			}
LABELV $583
line 1093
;1093:		}
LABELV $581
line 1094
;1094:	}
LABELV $576
line 1096
;1095:
;1096:	level.intermission_spot = qtrue;
ADDRGP4 level+7640
CNSTI4 1
ASGNI4
line 1097
;1097:}
LABELV $569
endproc FindIntermissionPoint 28 16
export BeginIntermission
proc BeginIntermission 8 4
line 1104
;1098:
;1099:/*
;1100:==================
;1101:BeginIntermission
;1102:==================
;1103:*/
;1104:void BeginIntermission(void) {
line 1108
;1105:	int        i;
;1106:	gentity_t* client;
;1107:
;1108:	if (level.intermissiontime) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $595
line 1109
;1109:		return;  // already active
ADDRGP4 $594
JUMPV
LABELV $595
line 1113
;1110:	}
;1111:
;1112:	// if in tournement mode, change the wins / losses
;1113:	if (g_gametype.integer == GT_TOURNAMENT) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $598
line 1114
;1114:		AdjustTournamentScores();
ADDRGP4 AdjustTournamentScores
CALLV
pop
line 1115
;1115:	}
LABELV $598
line 1117
;1116:
;1117:	level.intermissiontime = level.time;
ADDRGP4 level+7604
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1118
;1118:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 1121
;1119:
;1120:	// move all clients to the intermission point
;1121:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $606
JUMPV
LABELV $603
line 1122
;1122:		client = g_entities + i;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1123
;1123:		if (!client->inuse)
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $608
line 1124
;1124:			continue;
ADDRGP4 $604
JUMPV
LABELV $608
line 1127
;1125:
;1126:		// respawn if dead
;1127:		if (client->health <= 0) {
ADDRLP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $610
line 1128
;1128:			respawn(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1129
;1129:		}
LABELV $610
line 1131
;1130:
;1131:		MoveClientToIntermission(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1132
;1132:	}
LABELV $604
line 1121
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $606
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $603
line 1141
;1133:
;1134:#ifdef MISSIONPACK
;1135:	if (g_singlePlayer.integer) {
;1136:		trap_Cvar_Set("ui_singlePlayerActive", "0");
;1137:		UpdateTournamentInfo();
;1138:	}
;1139:#else
;1140:	// if single player game
;1141:	if (g_gametype.integer == GT_SINGLE_PLAYER) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $612
line 1142
;1142:		UpdateTournamentInfo();
ADDRGP4 UpdateTournamentInfo
CALLV
pop
line 1143
;1143:		SpawnModelsOnVictoryPads();
ADDRGP4 SpawnModelsOnVictoryPads
CALLV
pop
line 1144
;1144:	}
LABELV $612
line 1148
;1145:#endif
;1146:
;1147:	// send the current scoring to all clients
;1148:	SendScoreboardMessageToAllClients();
ADDRGP4 SendScoreboardMessageToAllClients
CALLV
pop
line 1149
;1149:}
LABELV $594
endproc BeginIntermission 8 4
export ExitLevel
proc ExitLevel 272 12
line 1159
;1150:
;1151:/*
;1152:=============
;1153:ExitLevel
;1154:
;1155:When the intermission has been exited, the server is either killed
;1156:or moved to a new level based on the "nextmap" cvar
;1157:=============
;1158:*/
;1159:void ExitLevel(void) {
line 1164
;1160:	int        i;
;1161:	gclient_t* cl;
;1162:
;1163:	// bot interbreeding
;1164:	BotInterbreedEndMatch();
ADDRGP4 BotInterbreedEndMatch
CALLV
pop
line 1168
;1165:
;1166:	// if we are running a tournement map, kick the loser to spectator status,
;1167:	// which will automatically grab the next spectator and restart
;1168:	if (g_gametype.integer == GT_TOURNAMENT) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $616
line 1169
;1169:		if (!level.restarted) {
ADDRGP4 level+72
INDIRI4
CNSTI4 0
NEI4 $615
line 1170
;1170:			RemoveTournamentLoser();
ADDRGP4 RemoveTournamentLoser
CALLV
pop
line 1171
;1171:			trap_SendConsoleCommand(EXEC_APPEND, "map_restart 0\n");
CNSTI4 2
ARGI4
ADDRGP4 $622
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1172
;1172:			level.restarted        = qtrue;
ADDRGP4 level+72
CNSTI4 1
ASGNI4
line 1173
;1173:			level.intermissiontime = 0;
ADDRGP4 level+7604
CNSTI4 0
ASGNI4
line 1174
;1174:		}
line 1175
;1175:		return;
ADDRGP4 $615
JUMPV
LABELV $616
line 1178
;1176:	}
;1177:
;1178:	level.intermissiontime = 0;
ADDRGP4 level+7604
CNSTI4 0
ASGNI4
line 1181
;1179:
;1180:	// reset all the scores so we don't enter the intermission again
;1181:	level.teamScores[TEAM_RED]  = 0;
ADDRGP4 level+48+4
CNSTI4 0
ASGNI4
line 1182
;1182:	level.teamScores[TEAM_BLUE] = 0;
ADDRGP4 level+48+8
CNSTI4 0
ASGNI4
line 1183
;1183:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $633
JUMPV
LABELV $630
line 1184
;1184:		cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1185
;1185:		if (cl->pers.connected != CON_CONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $635
line 1186
;1186:			continue;
ADDRGP4 $631
JUMPV
LABELV $635
line 1188
;1187:		}
;1188:		cl->ps.persistant[PERS_SCORE] = 0;
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 0
ASGNI4
line 1189
;1189:	}
LABELV $631
line 1183
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $633
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $630
line 1192
;1190:
;1191:	// we need to do this here before changing to CON_CONNECTING
;1192:	G_WriteSessionData();
ADDRGP4 G_WriteSessionData
CALLV
pop
line 1196
;1193:
;1194:	// change all client states to connecting, so the early players into the
;1195:	// next level will know the others aren't done reconnecting
;1196:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $640
JUMPV
LABELV $637
line 1197
;1197:		if (level.clients[i].pers.connected == CON_CONNECTED) {
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
NEI4 $642
line 1198
;1198:			level.clients[i].pers.connected = CON_CONNECTING;
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 1199
;1199:		}
LABELV $642
line 1200
;1200:	}
LABELV $638
line 1196
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $640
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $637
line 1202
;1201:
;1202:	if (!ParseMapRotation()) {
ADDRLP4 8
ADDRGP4 ParseMapRotation
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $644
line 1205
;1203:		char val[MAX_CVAR_VALUE_STRING];
;1204:
;1205:		trap_Cvar_VariableStringBuffer("nextmap", val, sizeof(val));
ADDRGP4 $646
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1207
;1206:
;1207:		if (!val[0] || !Q_stricmpn(val, "map_restart ", 12))
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $650
ADDRLP4 12
ARGP4
ADDRGP4 $649
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 268
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $647
LABELV $650
line 1208
;1208:			G_LoadMap(NULL);
CNSTP4 0
ARGP4
ADDRGP4 G_LoadMap
CALLV
pop
ADDRGP4 $648
JUMPV
LABELV $647
line 1210
;1209:		else
;1210:			trap_SendConsoleCommand(EXEC_APPEND, "vstr nextmap\n");
CNSTI4 2
ARGI4
ADDRGP4 $651
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $648
line 1211
;1211:	}
LABELV $644
line 1212
;1212:}
LABELV $615
endproc ExitLevel 272 12
export G_LogPrintf
proc G_LogPrintf 8224 24
line 1221
;1213:
;1214:/*
;1215:=================
;1216:G_LogPrintf
;1217:
;1218:Print to the logfile with a time stamp if it is open
;1219:=================
;1220:*/
;1221:void QDECL G_LogPrintf(const char* fmt, ...) {
line 1226
;1222:	va_list argptr;
;1223:	char    string[BIG_INFO_STRING];
;1224:	int     min, tsec, sec, len, n;
;1225:
;1226:	tsec = level.time / 100;
ADDRLP4 8192
ADDRGP4 level+32
INDIRI4
CNSTI4 100
DIVI4
ASGNI4
line 1227
;1227:	sec  = tsec / 10;
ADDRLP4 8196
ADDRLP4 8192
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 1228
;1228:	tsec %= 10;
ADDRLP4 8192
ADDRLP4 8192
INDIRI4
CNSTI4 10
MODI4
ASGNI4
line 1229
;1229:	min = sec / 60;
ADDRLP4 8204
ADDRLP4 8196
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 1230
;1230:	sec -= min * 60;
ADDRLP4 8196
ADDRLP4 8196
INDIRI4
ADDRLP4 8204
INDIRI4
CNSTI4 60
MULI4
SUBI4
ASGNI4
line 1232
;1231:
;1232:	len = Com_sprintf(string, sizeof(string), "%3i:%02i.%i ", min, sec, tsec);
ADDRLP4 0
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 $654
ARGP4
ADDRLP4 8204
INDIRI4
ARGI4
ADDRLP4 8196
INDIRI4
ARGI4
ADDRLP4 8192
INDIRI4
ARGI4
ADDRLP4 8216
ADDRGP4 Com_sprintf
CALLI4
ASGNI4
ADDRLP4 8208
ADDRLP4 8216
INDIRI4
ASGNI4
line 1234
;1233:
;1234:	va_start(argptr, fmt);
ADDRLP4 8200
ADDRFP4 0+4
ASGNP4
line 1235
;1235:	ED_vsprintf(string + len, fmt, argptr);
ADDRLP4 8208
INDIRI4
ADDRLP4 0
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8200
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 1236
;1236:	va_end(argptr);
ADDRLP4 8200
CNSTP4 0
ASGNP4
line 1238
;1237:
;1238:	n = (int)strlen(string);
ADDRLP4 0
ARGP4
ADDRLP4 8220
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8212
ADDRLP4 8220
INDIRI4
ASGNI4
line 1240
;1239:
;1240:	if (g_dedicated.integer) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $656
line 1241
;1241:		G_Printf("%s", string + len);
ADDRGP4 $659
ARGP4
ADDRLP4 8208
INDIRI4
ADDRLP4 0
ADDP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 1242
;1242:	}
LABELV $656
line 1244
;1243:
;1244:	if (level.logFile == FS_INVALID_HANDLE) {
ADDRGP4 level+20
INDIRI4
CNSTI4 0
NEI4 $660
line 1245
;1245:		return;
ADDRGP4 $652
JUMPV
LABELV $660
line 1248
;1246:	}
;1247:
;1248:	trap_FS_Write(string, n, level.logFile);
ADDRLP4 0
ARGP4
ADDRLP4 8212
INDIRI4
ARGI4
ADDRGP4 level+20
INDIRI4
ARGI4
ADDRGP4 trap_FS_Write
CALLV
pop
line 1249
;1249:}
LABELV $652
endproc G_LogPrintf 8224 24
export LogExit
proc LogExit 24 20
line 1258
;1250:
;1251:/*
;1252:================
;1253:LogExit
;1254:
;1255:Append information about this game to the log file
;1256:================
;1257:*/
;1258:void LogExit(const char* string) {
line 1264
;1259:	int        i, numSorted;
;1260:	gclient_t* cl;
;1261:#ifdef MISSIONPACK
;1262:	qboolean won = qtrue;
;1263:#endif
;1264:	G_LogPrintf("Exit: %s\n", string);
ADDRGP4 $665
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1266
;1265:
;1266:	level.intermissionQueued = level.time;
ADDRGP4 level+7600
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1270
;1267:
;1268:	// this will keep the clients from playing any voice sounds
;1269:	// that will get cut off when the queued intermission starts
;1270:	trap_SetConfigstring(CS_INTERMISSION, "1");
CNSTI4 22
ARGI4
ADDRGP4 $77
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1273
;1271:
;1272:	// don't send more than 32 scores (FIXME?)
;1273:	numSorted = level.numConnectedClients;
ADDRLP4 8
ADDRGP4 level+76
INDIRI4
ASGNI4
line 1274
;1274:	if (numSorted > 32) {
ADDRLP4 8
INDIRI4
CNSTI4 32
LEI4 $669
line 1275
;1275:		numSorted = 32;
ADDRLP4 8
CNSTI4 32
ASGNI4
line 1276
;1276:	}
LABELV $669
line 1278
;1277:
;1278:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $671
line 1279
;1279:		G_LogPrintf("red:%i  blue:%i\n", level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE]);
ADDRGP4 $674
ARGP4
ADDRGP4 level+48+4
INDIRI4
ARGI4
ADDRGP4 level+48+8
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1280
;1280:	}
LABELV $671
line 1282
;1281:
;1282:	for (i = 0; i < numSorted; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $682
JUMPV
LABELV $679
line 1285
;1283:		int ping;
;1284:
;1285:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1287
;1286:
;1287:		if (cl->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $684
line 1288
;1288:			continue;
ADDRGP4 $680
JUMPV
LABELV $684
line 1290
;1289:		}
;1290:		if (cl->pers.connected == CON_CONNECTING) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $686
line 1291
;1291:			continue;
ADDRGP4 $680
JUMPV
LABELV $686
line 1294
;1292:		}
;1293:
;1294:		ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 999
GEI4 $689
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $690
JUMPV
LABELV $689
ADDRLP4 16
CNSTI4 999
ASGNI4
LABELV $690
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 1296
;1295:
;1296:		G_LogPrintf("score: %i  ping: %i  client: %i %s\n", cl->ps.persistant[PERS_SCORE], ping, level.sortedClients[i], cl->pers.netname);
ADDRGP4 $691
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1304
;1297:#ifdef MISSIONPACK
;1298:		if (g_singlePlayer.integer && g_gametype.integer == GT_TOURNAMENT) {
;1299:			if (g_entities[cl - level.clients].r.svFlags & SVF_BOT && cl->ps.persistant[PERS_RANK] == 0) {
;1300:				won = qfalse;
;1301:			}
;1302:		}
;1303:#endif
;1304:	}
LABELV $680
line 1282
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $682
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $679
line 1314
;1305:
;1306:#ifdef MISSIONPACK
;1307:	if (g_singlePlayer.integer) {
;1308:		if (g_gametype.integer >= GT_CTF) {
;1309:			won = level.teamScores[TEAM_RED] > level.teamScores[TEAM_BLUE];
;1310:		}
;1311:		trap_SendConsoleCommand(EXEC_APPEND, (won) ? "spWin\n" : "spLose\n");
;1312:	}
;1313:#endif
;1314:}
LABELV $664
endproc LogExit 24 20
export CheckIntermissionExit
proc CheckIntermissionExit 20 0
line 1326
;1315:
;1316:/*
;1317:=================
;1318:CheckIntermissionExit
;1319:
;1320:The level will stay at the intermission for a minimum of 5 seconds
;1321:If all players wish to continue, the level will then exit.
;1322:If one or more players have not acknowledged the continue, the game will
;1323:wait 10 seconds before going on.
;1324:=================
;1325:*/
;1326:void CheckIntermissionExit(void) {
line 1332
;1327:	int        ready, notReady;
;1328:	int        i;
;1329:	gclient_t* cl;
;1330:	int        readyMask;
;1331:
;1332:	if (g_gametype.integer == GT_SINGLE_PLAYER)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $694
line 1333
;1333:		return;
ADDRGP4 $693
JUMPV
LABELV $694
line 1336
;1334:
;1335:	// see which players are ready
;1336:	ready     = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1337
;1337:	notReady  = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1338
;1338:	readyMask = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 1339
;1339:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $700
JUMPV
LABELV $697
line 1340
;1340:		cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1341
;1341:		if (cl->pers.connected != CON_CONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $702
line 1342
;1342:			continue;
ADDRGP4 $698
JUMPV
LABELV $702
line 1345
;1343:		}
;1344:
;1345:		if (g_entities[i].r.svFlags & SVF_BOT) {
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
EQI4 $704
line 1346
;1346:			cl->readyToExit = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 1
ASGNI4
line 1347
;1347:		}
LABELV $704
line 1349
;1348:
;1349:		if (cl->readyToExit) {
ADDRLP4 4
INDIRP4
CNSTI4 652
ADDP4
INDIRI4
CNSTI4 0
EQI4 $708
line 1350
;1350:			ready++;
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1351
;1351:			if (i < 16) {
ADDRLP4 0
INDIRI4
CNSTI4 16
GEI4 $709
line 1352
;1352:				readyMask |= 1 << i;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BORI4
ASGNI4
line 1353
;1353:			}
line 1354
;1354:		} else {
ADDRGP4 $709
JUMPV
LABELV $708
line 1355
;1355:			notReady++;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1356
;1356:		}
LABELV $709
line 1357
;1357:	}
LABELV $698
line 1339
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $700
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $697
line 1360
;1358:
;1359:	// vote in progress
;1360:	if (level.voteTime || level.voteExecuteTime) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
NEI4 $716
ADDRGP4 level+876
INDIRI4
CNSTI4 0
EQI4 $712
LABELV $716
line 1361
;1361:		ready    = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 1362
;1362:		notReady = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 1363
;1363:	}
LABELV $712
line 1367
;1364:
;1365:	// copy the readyMask to each player's stats so
;1366:	// it can be displayed on the scoreboard
;1367:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $720
JUMPV
LABELV $717
line 1368
;1368:		cl = level.clients + i;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1369
;1369:		if (cl->pers.connected != CON_CONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $722
line 1370
;1370:			continue;
ADDRGP4 $718
JUMPV
LABELV $722
line 1372
;1371:		}
;1372:		cl->ps.stats[STAT_CLIENTS_READY] = readyMask;
ADDRLP4 4
INDIRP4
CNSTI4 204
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1373
;1373:	}
LABELV $718
line 1367
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $720
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $717
line 1376
;1374:
;1375:	// never exit in less than five seconds
;1376:	if (level.time < level.intermissiontime + 5000) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+7604
INDIRI4
CNSTI4 5000
ADDI4
GEI4 $724
line 1377
;1377:		return;
ADDRGP4 $693
JUMPV
LABELV $724
line 1381
;1378:	}
;1379:
;1380:	// if nobody wants to go, clear timer
;1381:	if (!ready && notReady) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $728
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $728
line 1382
;1382:		level.readyToExit = qfalse;
ADDRGP4 level+7608
CNSTI4 0
ASGNI4
line 1383
;1383:		return;
ADDRGP4 $693
JUMPV
LABELV $728
line 1387
;1384:	}
;1385:
;1386:	// if everyone wants to go, go now
;1387:	if (!notReady) {
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $731
line 1388
;1388:		ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 1389
;1389:		return;
ADDRGP4 $693
JUMPV
LABELV $731
line 1393
;1390:	}
;1391:
;1392:	// the first person to ready starts the ten second timeout
;1393:	if (!level.readyToExit) {
ADDRGP4 level+7608
INDIRI4
CNSTI4 0
NEI4 $733
line 1394
;1394:		level.readyToExit = qtrue;
ADDRGP4 level+7608
CNSTI4 1
ASGNI4
line 1395
;1395:		level.exitTime    = level.time + 10000;
ADDRGP4 level+7612
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1396
;1396:	}
LABELV $733
line 1400
;1397:
;1398:	// if we have waited ten seconds since at least one player
;1399:	// wanted to exit, go ahead
;1400:	if (level.time < level.exitTime) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+7612
INDIRI4
GEI4 $739
line 1401
;1401:		return;
ADDRGP4 $693
JUMPV
LABELV $739
line 1404
;1402:	}
;1403:
;1404:	ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 1405
;1405:}
LABELV $693
endproc CheckIntermissionExit 20 0
proc ScoreIsTied 12 0
line 1412
;1406:
;1407:/*
;1408:=============
;1409:ScoreIsTied
;1410:=============
;1411:*/
;1412:static qboolean ScoreIsTied(void) {
line 1415
;1413:	int a, b;
;1414:
;1415:	if (level.numPlayingClients < 2) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
GEI4 $744
line 1416
;1416:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $743
JUMPV
LABELV $744
line 1419
;1417:	}
;1418:
;1419:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $747
line 1420
;1420:		return level.teamScores[TEAM_RED] == level.teamScores[TEAM_BLUE];
ADDRGP4 level+48+4
INDIRI4
ADDRGP4 level+48+8
INDIRI4
NEI4 $755
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $756
JUMPV
LABELV $755
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $756
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $743
JUMPV
LABELV $747
line 1423
;1421:	}
;1422:
;1423:	a = level.clients[level.sortedClients[0]].ps.persistant[PERS_SCORE];
ADDRLP4 0
ADDRGP4 level+88
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1424
;1424:	b = level.clients[level.sortedClients[1]].ps.persistant[PERS_SCORE];
ADDRLP4 4
ADDRGP4 level+88+4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1426
;1425:
;1426:	return a == b;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $761
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $762
JUMPV
LABELV $761
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $762
ADDRLP4 8
INDIRI4
RETI4
LABELV $743
endproc ScoreIsTied 12 0
proc CheckExitRules 16 8
line 1438
;1427:}
;1428:
;1429:/*
;1430:=================
;1431:CheckExitRules
;1432:
;1433:There will be a delay between the time the exit is qualified for
;1434:and the time everyone is moved to the intermission spot, so you
;1435:can see the last frag.
;1436:=================
;1437:*/
;1438:static void CheckExitRules(void) {
line 1444
;1439:	int        i;
;1440:	gclient_t* cl;
;1441:
;1442:	// if at the intermission, wait for all non-bots to
;1443:	// signal ready, then go to next level
;1444:	if (level.intermissiontime) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $764
line 1445
;1445:		CheckIntermissionExit();
ADDRGP4 CheckIntermissionExit
CALLV
pop
line 1446
;1446:		return;
ADDRGP4 $763
JUMPV
LABELV $764
line 1449
;1447:	}
;1448:
;1449:	if (level.intermissionQueued) {
ADDRGP4 level+7600
INDIRI4
CNSTI4 0
EQI4 $767
line 1457
;1450:#ifdef MISSIONPACK
;1451:		int time = (g_singlePlayer.integer) ? SP_INTERMISSION_DELAY_TIME : INTERMISSION_DELAY_TIME;
;1452:		if (level.time - level.intermissionQueued >= time) {
;1453:			level.intermissionQueued = 0;
;1454:			BeginIntermission();
;1455:		}
;1456:#else
;1457:		if (level.time - level.intermissionQueued >= INTERMISSION_DELAY_TIME) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+7600
INDIRI4
SUBI4
CNSTI4 1000
LTI4 $763
line 1458
;1458:			level.intermissionQueued = 0;
ADDRGP4 level+7600
CNSTI4 0
ASGNI4
line 1459
;1459:			BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 1460
;1460:		}
line 1462
;1461:#endif
;1462:		return;
ADDRGP4 $763
JUMPV
LABELV $767
line 1466
;1463:	}
;1464:
;1465:	// check for sudden death
;1466:	if (ScoreIsTied()) {
ADDRLP4 8
ADDRGP4 ScoreIsTied
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $775
line 1468
;1467:		// always wait for sudden death
;1468:		return;
ADDRGP4 $763
JUMPV
LABELV $775
line 1471
;1469:	}
;1470:
;1471:	if (g_timelimit.integer && !level.warmupTime) {
ADDRGP4 g_timelimit+12
INDIRI4
CNSTI4 0
EQI4 $777
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $777
line 1472
;1472:		if (level.time - level.startTime >= g_timelimit.integer * 60000) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+40
INDIRI4
SUBI4
ADDRGP4 g_timelimit+12
INDIRI4
CNSTI4 60000
MULI4
LTI4 $781
line 1473
;1473:			G_BroadcastServerCommand(-1, "print \"Timelimit hit.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $786
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1474
;1474:			LogExit("Timelimit hit.");
ADDRGP4 $787
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1475
;1475:			return;
ADDRGP4 $763
JUMPV
LABELV $781
line 1477
;1476:		}
;1477:	}
LABELV $777
line 1479
;1478:
;1479:	if (level.numPlayingClients < 2) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
GEI4 $788
line 1480
;1480:		return;
ADDRGP4 $763
JUMPV
LABELV $788
line 1483
;1481:	}
;1482:
;1483:	if (g_gametype.integer < GT_CTF && g_fraglimit.integer) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
GEI4 $791
ADDRGP4 g_fraglimit+12
INDIRI4
CNSTI4 0
EQI4 $791
line 1484
;1484:		if (level.teamScores[TEAM_RED] >= g_fraglimit.integer) {
ADDRGP4 level+48+4
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $795
line 1485
;1485:			G_BroadcastServerCommand(-1, "print \"Red hit the fraglimit.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $800
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1486
;1486:			LogExit("Fraglimit hit.");
ADDRGP4 $801
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1487
;1487:			return;
ADDRGP4 $763
JUMPV
LABELV $795
line 1490
;1488:		}
;1489:
;1490:		if (level.teamScores[TEAM_BLUE] >= g_fraglimit.integer) {
ADDRGP4 level+48+8
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $802
line 1491
;1491:			G_BroadcastServerCommand(-1, "print \"Blue hit the fraglimit.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $807
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1492
;1492:			LogExit("Fraglimit hit.");
ADDRGP4 $801
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1493
;1493:			return;
ADDRGP4 $763
JUMPV
LABELV $802
line 1496
;1494:		}
;1495:
;1496:		for (i = 0; i < level.maxclients; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $811
JUMPV
LABELV $808
line 1497
;1497:			cl = level.clients + i;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1498
;1498:			if (cl->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $813
line 1499
;1499:				continue;
ADDRGP4 $809
JUMPV
LABELV $813
line 1501
;1500:			}
;1501:			if (cl->sess.sessionTeam != TEAM_FREE) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
EQI4 $815
line 1502
;1502:				continue;
ADDRGP4 $809
JUMPV
LABELV $815
line 1505
;1503:			}
;1504:
;1505:			if (cl->ps.persistant[PERS_SCORE] >= g_fraglimit.integer) {
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ADDRGP4 g_fraglimit+12
INDIRI4
LTI4 $817
line 1506
;1506:				LogExit("Fraglimit hit.");
ADDRGP4 $801
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1507
;1507:				G_BroadcastServerCommand(-1, va("print \"%s" S_COLOR_WHITE " hit the fraglimit.\n\"", cl->pers.netname));
ADDRGP4 $820
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1508
;1508:				return;
ADDRGP4 $763
JUMPV
LABELV $817
line 1510
;1509:			}
;1510:		}
LABELV $809
line 1496
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $811
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $808
line 1511
;1511:	}
LABELV $791
line 1513
;1512:
;1513:	if (g_gametype.integer >= GT_CTF && g_capturelimit.integer) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $821
ADDRGP4 g_capturelimit+12
INDIRI4
CNSTI4 0
EQI4 $821
line 1515
;1514:
;1515:		if (level.teamScores[TEAM_RED] >= g_capturelimit.integer) {
ADDRGP4 level+48+4
INDIRI4
ADDRGP4 g_capturelimit+12
INDIRI4
LTI4 $825
line 1516
;1516:			G_BroadcastServerCommand(-1, "print \"Red hit the capturelimit.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $830
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1517
;1517:			LogExit("Capturelimit hit.");
ADDRGP4 $831
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1518
;1518:			return;
ADDRGP4 $763
JUMPV
LABELV $825
line 1521
;1519:		}
;1520:
;1521:		if (level.teamScores[TEAM_BLUE] >= g_capturelimit.integer) {
ADDRGP4 level+48+8
INDIRI4
ADDRGP4 g_capturelimit+12
INDIRI4
LTI4 $832
line 1522
;1522:			G_BroadcastServerCommand(-1, "print \"Blue hit the capturelimit.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $837
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1523
;1523:			LogExit("Capturelimit hit.");
ADDRGP4 $831
ARGP4
ADDRGP4 LogExit
CALLV
pop
line 1524
;1524:			return;
LABELV $832
line 1526
;1525:		}
;1526:	}
LABELV $821
line 1527
;1527:}
LABELV $763
endproc CheckExitRules 16 8
proc ClearBodyQue 12 4
line 1529
;1528:
;1529:static void ClearBodyQue(void) {
line 1533
;1530:	int        i;
;1531:	gentity_t* ent;
;1532:
;1533:	for (i = 0; i < BODY_QUEUE_SIZE; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $839
line 1534
;1534:		ent = level.bodyQue[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7656
ADDP4
INDIRP4
ASGNP4
line 1535
;1535:		if (ent->r.linked || ent->physicsObject) {
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
NEI4 $846
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
CNSTI4 0
EQI4 $844
LABELV $846
line 1536
;1536:			trap_UnlinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1537
;1537:			ent->physicsObject = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 0
ASGNI4
line 1538
;1538:		}
LABELV $844
line 1539
;1539:	}
LABELV $840
line 1533
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $839
line 1540
;1540:}
LABELV $838
endproc ClearBodyQue 12 4
proc G_WarmupEnd 44 12
line 1542
;1541:
;1542:static void G_WarmupEnd(void) {
line 1548
;1543:	gclient_t* client;
;1544:	gentity_t* ent;
;1545:	int        i, t;
;1546:
;1547:	// remove corpses
;1548:	ClearBodyQue();
ADDRGP4 ClearBodyQue
CALLV
pop
line 1551
;1549:
;1550:	// return flags
;1551:	Team_ResetFlags();
ADDRGP4 Team_ResetFlags
CALLV
pop
line 1553
;1552:
;1553:	memset(level.teamScores, 0, sizeof(level.teamScores));
ADDRGP4 level+48
ARGP4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1555
;1554:
;1555:	level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 1556
;1556:	level.startTime  = level.time;
ADDRGP4 level+40
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1558
;1557:
;1558:	trap_SetConfigstring(CS_SCORES1, "0");
CNSTI4 6
ARGI4
ADDRGP4 $65
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1559
;1559:	trap_SetConfigstring(CS_SCORES2, "0");
CNSTI4 7
ARGI4
ADDRGP4 $65
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1560
;1560:	trap_SetConfigstring(CS_WARMUP, "");
CNSTI4 5
ARGI4
ADDRGP4 $56
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1561
;1561:	trap_SetConfigstring(CS_LEVEL_START_TIME, va("%i", level.startTime));
ADDRGP4 $537
ARGP4
ADDRGP4 level+40
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 21
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1563
;1562:
;1563:	client = level.clients;
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
line 1564
;1564:	for (i = 0; i < level.maxclients; i++, client++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $857
JUMPV
LABELV $854
line 1566
;1565:
;1566:		if (client->pers.connected != CON_CONNECTED)
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $859
line 1567
;1567:			continue;
ADDRGP4 $855
JUMPV
LABELV $859
line 1570
;1568:
;1569:		// reset player awards
;1570:		client->ps.persistant[PERS_IMPRESSIVE_COUNT]    = 0;
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
CNSTI4 0
ASGNI4
line 1571
;1571:		client->ps.persistant[PERS_EXCELLENT_COUNT]     = 0;
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
CNSTI4 0
ASGNI4
line 1572
;1572:		client->ps.persistant[PERS_DEFEND_COUNT]        = 0;
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
CNSTI4 0
ASGNI4
line 1573
;1573:		client->ps.persistant[PERS_ASSIST_COUNT]        = 0;
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
CNSTI4 0
ASGNI4
line 1574
;1574:		client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 300
ADDP4
CNSTI4 0
ASGNI4
line 1576
;1575:
;1576:		client->ps.persistant[PERS_SCORE]    = 0;
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 0
ASGNI4
line 1577
;1577:		client->ps.persistant[PERS_CAPTURES] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
CNSTI4 0
ASGNI4
line 1579
;1578:
;1579:		client->ps.persistant[PERS_ATTACKER]       = ENTITYNUM_NONE;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1023
ASGNI4
line 1580
;1580:		client->ps.persistant[PERS_ATTACKEE_ARMOR] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
CNSTI4 0
ASGNI4
line 1581
;1581:		client->damage.enemy = client->damage.team = 0;
ADDRLP4 24
CNSTI4 0
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1560
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1583
;1582:
;1583:		client->ps.stats[STAT_CLIENTS_READY] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 204
ADDP4
CNSTI4 0
ASGNI4
line 1584
;1584:		client->ps.stats[STAT_HOLDABLE_ITEM] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 1586
;1585:
;1586:		memset(&client->ps.powerups, 0, sizeof(client->ps.powerups));
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1588
;1587:
;1588:		ClientUserinfoChanged(i);  // set max.health etc.
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 1590
;1589:
;1590:		if (client->sess.sessionTeam != TEAM_SPECTATOR) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $861
line 1591
;1591:			ClientSpawn(level.gentities + i);
ADDRLP4 8
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 level+4
INDIRP4
ADDP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 1592
;1592:		}
LABELV $861
line 1594
;1593:
;1594:		trap_SendServerCommand(i, "map_restart");
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 $864
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1595
;1595:	}
LABELV $855
line 1564
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1576
ADDP4
ASGNP4
LABELV $857
ADDRLP4 8
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $854
line 1598
;1596:
;1597:	// respawn items, remove projectiles, etc.
;1598:	ent = level.gentities + MAX_CLIENTS;
ADDRLP4 4
ADDRGP4 level+4
INDIRP4
CNSTI4 52224
ADDP4
ASGNP4
line 1599
;1599:	for (i = MAX_CLIENTS; i < level.num_entities; i++, ent++) {
ADDRLP4 8
CNSTI4 64
ASGNI4
ADDRGP4 $869
JUMPV
LABELV $866
line 1601
;1600:
;1601:		if (!ent->inuse || ent->freeAfterEvent)
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $873
ADDRLP4 4
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
CNSTI4 0
EQI4 $871
LABELV $873
line 1602
;1602:			continue;
ADDRGP4 $867
JUMPV
LABELV $871
line 1604
;1603:
;1604:		if (ent->tag == TAG_DONTSPAWN) {
ADDRLP4 4
INDIRP4
CNSTI4 812
ADDP4
INDIRI4
CNSTI4 1
NEI4 $874
line 1605
;1605:			ent->nextthink = 0;
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 1606
;1606:			continue;
ADDRGP4 $867
JUMPV
LABELV $874
line 1609
;1607:		}
;1608:
;1609:		if (ent->s.eType == ET_ITEM && ent->item) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $876
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $876
line 1612
;1610:
;1611:			// already processed in Team_ResetFlags()
;1612:			if (ent->item->giTag == PW_NEUTRALFLAG || ent->item->giTag == PW_REDFLAG || ent->item->giTag == PW_BLUEFLAG)
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 9
EQI4 $881
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 7
EQI4 $881
ADDRLP4 4
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 8
NEI4 $878
LABELV $881
line 1613
;1613:				continue;
ADDRGP4 $867
JUMPV
LABELV $878
line 1616
;1614:
;1615:			// remove dropped items
;1616:			if (ent->flags & FL_DROPPED_ITEM) {
ADDRLP4 4
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $882
line 1617
;1617:				ent->nextthink = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1618
;1618:				continue;
ADDRGP4 $867
JUMPV
LABELV $882
line 1622
;1619:			}
;1620:
;1621:			// respawn picked up items
;1622:			t = SpawnTime(ent, qtrue);
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 32
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 1623
;1623:			if (t != 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $885
line 1625
;1624:				// hide items with defined spawn time
;1625:				ent->s.eFlags |= EF_NODRAW;
ADDRLP4 36
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 1626
;1626:				ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 40
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1627
;1627:				ent->r.contents = 0;
ADDRLP4 4
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 1628
;1628:				ent->activator  = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 772
ADDP4
CNSTP4 0
ASGNP4
line 1629
;1629:				ent->think      = RespawnItem;
ADDRLP4 4
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 1630
;1630:			} else {
ADDRGP4 $886
JUMPV
LABELV $885
line 1631
;1631:				t = FRAMETIME;
ADDRLP4 12
CNSTI4 100
ASGNI4
line 1632
;1632:				if (ent->activator) {
ADDRLP4 4
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $887
line 1633
;1633:					ent->activator = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 772
ADDP4
CNSTP4 0
ASGNP4
line 1634
;1634:					ent->think     = RespawnItem;
ADDRLP4 4
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 1635
;1635:				}
LABELV $887
line 1636
;1636:			}
LABELV $886
line 1637
;1637:			if (ent->random) {
ADDRLP4 4
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
EQF4 $889
line 1638
;1638:				t += (crandom() * ent->random) * 1000;
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 36
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
ADDRLP4 4
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
CNSTF4 1148846080
MULF4
ADDF4
CVFI4 4
ASGNI4
line 1639
;1639:				if (t < FRAMETIME) {
ADDRLP4 12
INDIRI4
CNSTI4 100
GEI4 $891
line 1640
;1640:					t = FRAMETIME;
ADDRLP4 12
CNSTI4 100
ASGNI4
line 1641
;1641:				}
LABELV $891
line 1642
;1642:			}
LABELV $889
line 1643
;1643:			ent->nextthink = level.time + t;
ADDRLP4 4
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 1645
;1644:
;1645:		} else if (ent->s.eType == ET_MISSILE) {
ADDRGP4 $877
JUMPV
LABELV $876
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $894
line 1647
;1646:			// remove all launched missiles
;1647:			G_FreeEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1648
;1648:		}
LABELV $894
LABELV $877
line 1649
;1649:	}
LABELV $867
line 1599
ADDRLP4 8
ADDRLP4 8
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
LABELV $869
ADDRLP4 8
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $866
line 1650
;1650:}
LABELV $847
endproc G_WarmupEnd 44 12
proc CheckTournament 28 8
line 1667
;1651:
;1652:/*
;1653:========================================================================
;1654:
;1655:FUNCTIONS CALLED EVERY FRAME
;1656:
;1657:========================================================================
;1658:*/
;1659:
;1660:/*
;1661:=============
;1662:CheckTournament
;1663:
;1664:Once a frame, check for changes in tournement player state
;1665:=============
;1666:*/
;1667:static void CheckTournament(void) {
line 1671
;1668:
;1669:	// check because we run 3 game frames before calling Connect and/or ClientBegin
;1670:	// for clients on a map_restart
;1671:	if (level.numPlayingClients == 0) {
ADDRGP4 level+84
INDIRI4
CNSTI4 0
NEI4 $897
line 1672
;1672:		return;
ADDRGP4 $896
JUMPV
LABELV $897
line 1675
;1673:	}
;1674:
;1675:	if (g_gametype.integer == GT_TOURNAMENT) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $900
line 1678
;1676:
;1677:		// pull in a spectator if needed
;1678:		if (level.numPlayingClients < 2) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
GEI4 $903
line 1679
;1679:			AddTournamentPlayer();
ADDRGP4 AddTournamentPlayer
CALLV
pop
line 1680
;1680:		}
LABELV $903
line 1683
;1681:
;1682:		// if we don't have two players, go back to "waiting for players"
;1683:		if (level.numPlayingClients != 2) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
EQI4 $906
line 1684
;1684:			if (level.warmupTime != -1) {
ADDRGP4 level+16
INDIRI4
CNSTI4 -1
EQI4 $896
line 1685
;1685:				level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1686
;1686:				trap_SetConfigstring(CS_WARMUP, va("%i", level.warmupTime));
ADDRGP4 $537
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1687
;1687:				G_LogPrintf("Warmup:\n");
ADDRGP4 $914
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1688
;1688:			}
line 1689
;1689:			return;
ADDRGP4 $896
JUMPV
LABELV $906
line 1692
;1690:		}
;1691:
;1692:		if (level.warmupTime == 0) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $915
line 1693
;1693:			return;
ADDRGP4 $896
JUMPV
LABELV $915
line 1697
;1694:		}
;1695:
;1696:		// if the warmup is changed at the console, restart it
;1697:		if (g_warmup.modificationCount != level.warmupModificationCount) {
ADDRGP4 g_warmup+4
INDIRI4
ADDRGP4 level+356
INDIRI4
EQI4 $918
line 1698
;1698:			level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+356
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 1699
;1699:			level.warmupTime              = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1700
;1700:		}
LABELV $918
line 1703
;1701:
;1702:		// if all players have arrived, start the countdown
;1703:		if (level.warmupTime < 0) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
GEI4 $925
line 1704
;1704:			if (level.numPlayingClients == 2) {
ADDRGP4 level+84
INDIRI4
CNSTI4 2
NEI4 $896
line 1705
;1705:				if (g_warmup.integer > 0) {
ADDRGP4 g_warmup+12
INDIRI4
CNSTI4 0
LEI4 $931
line 1706
;1706:					level.warmupTime = level.time + g_warmup.integer * 1000;
ADDRGP4 level+16
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_warmup+12
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 1707
;1707:				} else {
ADDRGP4 $932
JUMPV
LABELV $931
line 1708
;1708:					level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 1709
;1709:				}
LABELV $932
line 1711
;1710:
;1711:				trap_SetConfigstring(CS_WARMUP, va("%i", level.warmupTime));
ADDRGP4 $537
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1712
;1712:			}
line 1713
;1713:			return;
ADDRGP4 $896
JUMPV
LABELV $925
line 1717
;1714:		}
;1715:
;1716:		// if the warmup time has counted down, restart
;1717:		if (level.time > level.warmupTime) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+16
INDIRI4
LEI4 $901
line 1718
;1718:			G_WarmupEnd();
ADDRGP4 G_WarmupEnd
CALLV
pop
line 1719
;1719:			return;
ADDRGP4 $896
JUMPV
line 1721
;1720:		}
;1721:	} else if (g_gametype.integer != GT_SINGLE_PLAYER && level.warmupTime != 0) {
LABELV $900
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
EQI4 $943
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $943
line 1723
;1722:		int      counts[TEAM_NUM_TEAMS];
;1723:		qboolean notEnough = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 1725
;1724:
;1725:		if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $947
line 1726
;1726:			counts[TEAM_BLUE] = TeamConnectedCount(-1, TEAM_BLUE);
CNSTI4 -1
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 20
ADDRGP4 TeamConnectedCount
CALLI4
ASGNI4
ADDRLP4 4+8
ADDRLP4 20
INDIRI4
ASGNI4
line 1727
;1727:			counts[TEAM_RED]  = TeamConnectedCount(-1, TEAM_RED);
CNSTI4 -1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 24
ADDRGP4 TeamConnectedCount
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 24
INDIRI4
ASGNI4
line 1729
;1728:
;1729:			if (counts[TEAM_RED] < 1 || counts[TEAM_BLUE] < 1) {
ADDRLP4 4+4
INDIRI4
CNSTI4 1
LTI4 $956
ADDRLP4 4+8
INDIRI4
CNSTI4 1
GEI4 $948
LABELV $956
line 1730
;1730:				notEnough = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1731
;1731:			}
line 1732
;1732:		} else if (level.numPlayingClients < 2) {
ADDRGP4 $948
JUMPV
LABELV $947
ADDRGP4 level+84
INDIRI4
CNSTI4 2
GEI4 $957
line 1733
;1733:			notEnough = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1734
;1734:		}
LABELV $957
LABELV $948
line 1736
;1735:
;1736:		if (notEnough) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $960
line 1737
;1737:			if (level.warmupTime != -1) {
ADDRGP4 level+16
INDIRI4
CNSTI4 -1
EQI4 $896
line 1738
;1738:				level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1739
;1739:				trap_SetConfigstring(CS_WARMUP, va("%i", level.warmupTime));
ADDRGP4 $537
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1740
;1740:				G_LogPrintf("Warmup:\n");
ADDRGP4 $914
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1741
;1741:			}
line 1742
;1742:			return;  // still waiting for team members
ADDRGP4 $896
JUMPV
LABELV $960
line 1745
;1743:		}
;1744:
;1745:		if (level.warmupTime == 0) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $967
line 1746
;1746:			return;
ADDRGP4 $896
JUMPV
LABELV $967
line 1750
;1747:		}
;1748:
;1749:		// if the warmup is changed at the console, restart it
;1750:		if (g_warmup.modificationCount != level.warmupModificationCount) {
ADDRGP4 g_warmup+4
INDIRI4
ADDRGP4 level+356
INDIRI4
EQI4 $970
line 1751
;1751:			level.warmupModificationCount = g_warmup.modificationCount;
ADDRGP4 level+356
ADDRGP4 g_warmup+4
INDIRI4
ASGNI4
line 1752
;1752:			level.warmupTime              = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 1753
;1753:		}
LABELV $970
line 1756
;1754:
;1755:		// if all players have arrived, start the countdown
;1756:		if (level.warmupTime < 0) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
GEI4 $977
line 1757
;1757:			if (g_warmup.integer > 0) {
ADDRGP4 g_warmup+12
INDIRI4
CNSTI4 0
LEI4 $980
line 1758
;1758:				level.warmupTime = level.time + g_warmup.integer * 1000;
ADDRGP4 level+16
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_warmup+12
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 1759
;1759:			} else {
ADDRGP4 $981
JUMPV
LABELV $980
line 1760
;1760:				level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 1761
;1761:			}
LABELV $981
line 1763
;1762:
;1763:			trap_SetConfigstring(CS_WARMUP, va("%i", level.warmupTime));
ADDRGP4 $537
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1764
;1764:			return;
ADDRGP4 $896
JUMPV
LABELV $977
line 1768
;1765:		}
;1766:
;1767:		// if the warmup time has counted down, restart
;1768:		if (level.time > level.warmupTime) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+16
INDIRI4
LEI4 $988
line 1769
;1769:			G_WarmupEnd();
ADDRGP4 G_WarmupEnd
CALLV
pop
line 1770
;1770:			return;
LABELV $988
line 1772
;1771:		}
;1772:	}
LABELV $943
LABELV $901
line 1773
;1773:}
LABELV $896
endproc CheckTournament 28 8
proc CheckVote 4 8
line 1780
;1774:
;1775:/*
;1776:==================
;1777:CheckVote
;1778:==================
;1779:*/
;1780:static void CheckVote(void) {
line 1782
;1781:
;1782:	if (level.voteExecuteTime) {
ADDRGP4 level+876
INDIRI4
CNSTI4 0
EQI4 $993
line 1783
;1783:		if (level.voteExecuteTime < level.time) {
ADDRGP4 level+876
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $992
line 1784
;1784:			level.voteExecuteTime = 0;
ADDRGP4 level+876
CNSTI4 0
ASGNI4
line 1785
;1785:			trap_SendConsoleCommand(EXEC_APPEND, va("%s\n", level.voteString));
ADDRGP4 $1001
ARGP4
ADDRGP4 level+360
ARGP4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1786
;1786:		}
line 1787
;1787:		return;
ADDRGP4 $992
JUMPV
LABELV $993
line 1790
;1788:	}
;1789:
;1790:	if (!level.voteTime) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
NEI4 $1003
line 1791
;1791:		return;
ADDRGP4 $992
JUMPV
LABELV $1003
line 1794
;1792:	}
;1793:
;1794:	if (level.time - level.voteTime >= VOTE_TIME) {
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+872
INDIRI4
SUBI4
CNSTI4 30000
LTI4 $1006
line 1795
;1795:		G_BroadcastServerCommand(-1, "print \"Vote failed.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $1010
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1796
;1796:	} else {
ADDRGP4 $1007
JUMPV
LABELV $1006
line 1798
;1797:		// ATVI Q3 1.32 Patch #9, WNF
;1798:		if (level.voteYes > level.numVotingClients / 2) {
ADDRGP4 level+880
INDIRI4
ADDRGP4 level+888
INDIRI4
CNSTI4 2
DIVI4
LEI4 $1011
line 1800
;1799:			// execute the command, then remove the vote
;1800:			G_BroadcastServerCommand(-1, "print \"Vote passed.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $1015
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1801
;1801:			level.voteExecuteTime = level.time + 3000;
ADDRGP4 level+876
ADDRGP4 level+32
INDIRI4
CNSTI4 3000
ADDI4
ASGNI4
line 1802
;1802:		} else if (level.voteNo >= level.numVotingClients / 2) {
ADDRGP4 $1012
JUMPV
LABELV $1011
ADDRGP4 level+884
INDIRI4
ADDRGP4 level+888
INDIRI4
CNSTI4 2
DIVI4
LTI4 $992
line 1804
;1803:			// same behavior as a timeout
;1804:			G_BroadcastServerCommand(-1, "print \"Vote failed.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $1010
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1805
;1805:		} else {
line 1807
;1806:			// still waiting for a majority
;1807:			return;
LABELV $1019
LABELV $1012
line 1809
;1808:		}
;1809:	}
LABELV $1007
line 1811
;1810:
;1811:	level.voteTime = 0;
ADDRGP4 level+872
CNSTI4 0
ASGNI4
line 1812
;1812:	trap_SetConfigstring(CS_VOTE_TIME, "");
CNSTI4 8
ARGI4
ADDRGP4 $56
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1813
;1813:}
LABELV $992
endproc CheckVote 4 8
proc PrintTeam 4 8
line 1820
;1814:
;1815:/*
;1816:==================
;1817:PrintTeam
;1818:==================
;1819:*/
;1820:static void PrintTeam(team_t team, const char* message) {
line 1823
;1821:	int i;
;1822:
;1823:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1027
JUMPV
LABELV $1024
line 1824
;1824:		if (level.clients[i].sess.sessionTeam != team)
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
EQI4 $1029
line 1825
;1825:			continue;
ADDRGP4 $1025
JUMPV
LABELV $1029
line 1826
;1826:		if (level.clients[i].pers.connected != CON_CONNECTED)
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
EQI4 $1031
line 1827
;1827:			continue;
ADDRGP4 $1025
JUMPV
LABELV $1031
line 1828
;1828:		trap_SendServerCommand(i, message);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1829
;1829:	}
LABELV $1025
line 1823
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1027
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1024
line 1830
;1830:}
LABELV $1023
endproc PrintTeam 4 8
export SetLeader
proc SetLeader 8 8
line 1837
;1831:
;1832:/*
;1833:==================
;1834:SetLeader
;1835:==================
;1836:*/
;1837:void SetLeader(team_t team, int client) {
line 1840
;1838:	int i;
;1839:
;1840:	if (level.clients[client].pers.connected == CON_DISCONNECTED) {
ADDRFP4 4
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
NEI4 $1034
line 1841
;1841:		PrintTeam(team, va("print \"%s " S_COLOR_STRIP "is not connected\n\"", level.clients[client].pers.netname));
ADDRGP4 $1036
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintTeam
CALLV
pop
line 1842
;1842:		return;
ADDRGP4 $1033
JUMPV
LABELV $1034
line 1844
;1843:	}
;1844:	if (level.clients[client].sess.sessionTeam != team) {
ADDRFP4 4
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
EQI4 $1037
line 1845
;1845:		PrintTeam(team, va("print \"%s " S_COLOR_STRIP "is not on the team anymore\n\"", level.clients[client].pers.netname));
ADDRGP4 $1039
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintTeam
CALLV
pop
line 1846
;1846:		return;
ADDRGP4 $1033
JUMPV
LABELV $1037
line 1848
;1847:	}
;1848:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1043
JUMPV
LABELV $1040
line 1849
;1849:		if (level.clients[i].sess.sessionTeam != team)
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
EQI4 $1045
line 1850
;1850:			continue;
ADDRGP4 $1041
JUMPV
LABELV $1045
line 1851
;1851:		if (level.clients[i].sess.teamLeader) {
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 648
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1047
line 1852
;1852:			level.clients[i].sess.teamLeader = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 648
ADDP4
CNSTI4 0
ASGNI4
line 1853
;1853:			ClientUserinfoChanged(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 1854
;1854:		}
LABELV $1047
line 1855
;1855:	}
LABELV $1041
line 1848
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1043
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1040
line 1856
;1856:	level.clients[client].sess.teamLeader = qtrue;
ADDRFP4 4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 648
ADDP4
CNSTI4 1
ASGNI4
line 1857
;1857:	ClientUserinfoChanged(client);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 1858
;1858:	PrintTeam(team, va("print \"%s is the new team leader\n\"", level.clients[client].pers.netname));
ADDRGP4 $1049
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 PrintTeam
CALLV
pop
line 1859
;1859:}
LABELV $1033
endproc SetLeader 8 8
export CheckTeamLeader
proc CheckTeamLeader 28 8
line 1866
;1860:
;1861:/*
;1862:==================
;1863:CheckTeamLeader
;1864:==================
;1865:*/
;1866:void CheckTeamLeader(team_t team) {
line 1871
;1867:	int i;
;1868:	int max_score, max_id;
;1869:	int max_bot_score, max_bot_id;
;1870:
;1871:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1054
JUMPV
LABELV $1051
line 1873
;1872:
;1873:		if (level.clients[i].sess.sessionTeam != team || level.clients[i].pers.connected == CON_DISCONNECTED)
ADDRLP4 24
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1058
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRLP4 24
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1056
LABELV $1058
line 1874
;1874:			continue;
ADDRGP4 $1052
JUMPV
LABELV $1056
line 1876
;1875:
;1876:		if (level.clients[i].sess.teamLeader)
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 648
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1059
line 1877
;1877:			return;
ADDRGP4 $1050
JUMPV
LABELV $1059
line 1878
;1878:	}
LABELV $1052
line 1871
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1054
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1051
line 1881
;1879:
;1880:	// no leaders? find player with highest score
;1881:	max_score     = SHRT_MIN;
ADDRLP4 4
CNSTI4 -32768
ASGNI4
line 1882
;1882:	max_id        = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 1883
;1883:	max_bot_score = SHRT_MIN;
ADDRLP4 8
CNSTI4 -32768
ASGNI4
line 1884
;1884:	max_bot_id    = -1;
ADDRLP4 16
CNSTI4 -1
ASGNI4
line 1886
;1885:
;1886:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1064
JUMPV
LABELV $1061
line 1888
;1887:
;1888:		if (level.clients[i].sess.sessionTeam != team)
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
EQI4 $1066
line 1889
;1889:			continue;
ADDRGP4 $1062
JUMPV
LABELV $1066
line 1891
;1890:
;1891:		if (g_entities[i].r.svFlags & SVF_BOT) {
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
EQI4 $1068
line 1892
;1892:			if (level.clients[i].ps.persistant[PERS_SCORE] > max_bot_score) {
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
LEI4 $1069
line 1893
;1893:				max_bot_score = level.clients[i].ps.persistant[PERS_SCORE];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1894
;1894:				max_bot_id    = i;
ADDRLP4 16
ADDRLP4 0
INDIRI4
ASGNI4
line 1895
;1895:			}
line 1896
;1896:		} else {
ADDRGP4 $1069
JUMPV
LABELV $1068
line 1897
;1897:			if (level.clients[i].ps.persistant[PERS_SCORE] > max_score) {
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $1074
line 1898
;1898:				max_score = level.clients[i].ps.persistant[PERS_SCORE];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 248
ADDP4
INDIRI4
ASGNI4
line 1899
;1899:				max_id    = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 1900
;1900:			}
LABELV $1074
line 1901
;1901:		}
LABELV $1069
line 1902
;1902:	}
LABELV $1062
line 1886
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1064
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1061
line 1904
;1903:
;1904:	if (max_id != -1) {
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $1076
line 1905
;1905:		SetLeader(team, max_id);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 1906
;1906:		return;
ADDRGP4 $1050
JUMPV
LABELV $1076
line 1909
;1907:	}
;1908:
;1909:	if (max_bot_id != -1) {
ADDRLP4 16
INDIRI4
CNSTI4 -1
EQI4 $1078
line 1910
;1910:		SetLeader(team, max_bot_id);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 1911
;1911:		return;
LABELV $1078
line 1913
;1912:	}
;1913:}
LABELV $1050
endproc CheckTeamLeader 28 8
proc CheckTeamVote 16 12
line 1920
;1914:
;1915:/*
;1916:==================
;1917:CheckTeamVote
;1918:==================
;1919:*/
;1920:static void CheckTeamVote(team_t team) {
line 1923
;1921:	int cs_offset;
;1922:
;1923:	if (team == TEAM_RED)
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $1081
line 1924
;1924:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1082
JUMPV
LABELV $1081
line 1925
;1925:	else if (team == TEAM_BLUE)
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $1080
line 1926
;1926:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 1928
;1927:	else
;1928:		return;
LABELV $1084
LABELV $1082
line 1930
;1929:
;1930:	if (!level.teamVoteTime[cs_offset]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1085
line 1931
;1931:		return;
ADDRGP4 $1080
JUMPV
LABELV $1085
line 1933
;1932:	}
;1933:	if (level.time - level.teamVoteTime[cs_offset] >= VOTE_TIME) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
SUBI4
CNSTI4 30000
LTI4 $1088
line 1934
;1934:		G_BroadcastServerCommand(-1, "print \"Team vote failed.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $1092
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1935
;1935:	} else {
ADDRGP4 $1089
JUMPV
LABELV $1088
line 1936
;1936:		if (level.teamVoteYes[cs_offset] > level.numteamVotingClients[cs_offset] / 2) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2964
ADDP4
INDIRI4
CNSTI4 2
DIVI4
LEI4 $1093
line 1938
;1937:			// execute the command, then remove the vote
;1938:			G_BroadcastServerCommand(-1, "print \"Team vote passed.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $1097
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1940
;1939:			//
;1940:			if (!Q_strncmp("leader", level.teamVoteString[cs_offset], 6)) {
ADDRGP4 $1100
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892
ADDP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 8
ADDRGP4 Q_strncmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $1098
line 1942
;1941:				// set the team leader
;1942:				SetLeader(team, atoi(level.teamVoteString[cs_offset] + 7));
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892+7
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 1943
;1943:			} else {
ADDRGP4 $1094
JUMPV
LABELV $1098
line 1944
;1944:				trap_SendConsoleCommand(EXEC_APPEND, va("%s\n", level.teamVoteString[cs_offset]));
ADDRGP4 $1001
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 1945
;1945:			}
line 1946
;1946:		} else if (level.teamVoteNo[cs_offset] >= level.numteamVotingClients[cs_offset] / 2) {
ADDRGP4 $1094
JUMPV
LABELV $1093
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2964
ADDP4
INDIRI4
CNSTI4 2
DIVI4
LTI4 $1080
line 1948
;1947:			// same behavior as a timeout
;1948:			G_BroadcastServerCommand(-1, "print \"Team vote failed.\n\"");
CNSTI4 -1
ARGI4
ADDRGP4 $1092
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 1949
;1949:		} else {
line 1951
;1950:			// still waiting for a majority
;1951:			return;
LABELV $1106
LABELV $1094
line 1953
;1952:		}
;1953:	}
LABELV $1089
line 1954
;1954:	level.teamVoteTime[cs_offset] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
CNSTI4 0
ASGNI4
line 1955
;1955:	trap_SetConfigstring(CS_TEAMVOTE_TIME + cs_offset, "");
ADDRLP4 0
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRGP4 $56
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1956
;1956:}
LABELV $1080
endproc CheckTeamVote 16 12
data
align 4
LABELV $1111
byte 4 -1
export CheckCvars
code
proc CheckCvars 4 8
line 1963
;1957:
;1958:/*
;1959:==================
;1960:CheckCvars
;1961:==================
;1962:*/
;1963:void CheckCvars(void) {
line 1966
;1964:	static int lastMod = -1;
;1965:
;1966:	if (lastMod != g_password.modificationCount) {
ADDRGP4 $1111
INDIRI4
ADDRGP4 g_password+4
INDIRI4
EQI4 $1112
line 1967
;1967:		lastMod = g_password.modificationCount;
ADDRGP4 $1111
ADDRGP4 g_password+4
INDIRI4
ASGNI4
line 1968
;1968:		if (g_password.string[0] && Q_stricmp(g_password.string, "none") != 0) {
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1116
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $1120
ARGP4
ADDRLP4 0
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1116
line 1969
;1969:			trap_Cvar_Set("g_needpass", "1");
ADDRGP4 $86
ARGP4
ADDRGP4 $77
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1970
;1970:		} else {
ADDRGP4 $1117
JUMPV
LABELV $1116
line 1971
;1971:			trap_Cvar_Set("g_needpass", "0");
ADDRGP4 $86
ARGP4
ADDRGP4 $65
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1972
;1972:		}
LABELV $1117
line 1973
;1973:	}
LABELV $1112
line 1974
;1974:}
LABELV $1110
endproc CheckCvars 4 8
export G_RunThink
proc G_RunThink 8 4
line 1983
;1975:
;1976:/*
;1977:=============
;1978:G_RunThink
;1979:
;1980:Runs thinking code for this frame if necessary
;1981:=============
;1982:*/
;1983:void G_RunThink(gentity_t* ent) {
line 1986
;1984:	int thinktime;
;1985:
;1986:	thinktime = ent->nextthink;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ASGNI4
line 1987
;1987:	if (thinktime <= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $1122
line 1988
;1988:		return;
ADDRGP4 $1121
JUMPV
LABELV $1122
line 1990
;1989:	}
;1990:	if (thinktime > level.time) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $1124
line 1991
;1991:		return;
ADDRGP4 $1121
JUMPV
LABELV $1124
line 1994
;1992:	}
;1993:
;1994:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 1995
;1995:	if (!ent->think) {
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1127
line 1996
;1996:		G_Error("NULL ent->think");
ADDRGP4 $1129
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 1997
;1997:	} else {
ADDRGP4 $1128
JUMPV
LABELV $1127
line 1998
;1998:		ent->think(ent);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 692
ADDP4
INDIRP4
CALLV
pop
line 1999
;1999:	}
LABELV $1128
line 2000
;2000:}
LABELV $1121
endproc G_RunThink 8 4
bss
align 4
LABELV $1131
skip 3840
code
proc G_RunFrame 32 12
line 2009
;2001:
;2002:/*
;2003:================
;2004:G_RunFrame
;2005:
;2006:Advances the non-player objects in the world
;2007:================
;2008:*/
;2009:static void G_RunFrame(int levelTime) {
line 2017
;2010:	int               i;
;2011:	gentity_t*        ent;
;2012:	gclient_t*        client;
;2013:	static gentity_t* missiles[MAX_GENTITIES - MAX_CLIENTS];
;2014:	int               numMissiles;
;2015:
;2016:	// if we are waiting for the level to restart, do nothing
;2017:	if (level.restarted) {
ADDRGP4 level+72
INDIRI4
CNSTI4 0
EQI4 $1132
line 2018
;2018:		return;
ADDRGP4 $1130
JUMPV
LABELV $1132
line 2021
;2019:	}
;2020:
;2021:	level.framenum++;
ADDRLP4 16
ADDRGP4 level+28
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2022
;2022:	level.previousTime = level.time;
ADDRGP4 level+36
ADDRGP4 level+32
INDIRI4
ASGNI4
line 2023
;2023:	level.time         = levelTime;
ADDRGP4 level+32
ADDRFP4 0
INDIRI4
ASGNI4
line 2024
;2024:	level.msec         = level.time - level.previousTime;
ADDRGP4 level+44
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
ASGNI4
line 2027
;2025:
;2026:	// get any cvar changes
;2027:	G_UpdateCvars();
ADDRGP4 G_UpdateCvars
CALLV
pop
line 2029
;2028:
;2029:	numMissiles = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 2034
;2030:
;2031:	//
;2032:	// go through all allocated objects
;2033:	//
;2034:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 2035
;2035:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1145
JUMPV
LABELV $1142
line 2036
;2036:		if (!ent->inuse) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1147
line 2037
;2037:			continue;
ADDRGP4 $1143
JUMPV
LABELV $1147
line 2041
;2038:		}
;2039:
;2040:		// clear events that are too old
;2041:		if (level.time - ent->eventTime > EVENT_VALID_MSEC) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
SUBI4
CNSTI4 300
LEI4 $1149
line 2042
;2042:			if (ent->s.event) {
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1152
line 2043
;2043:				ent->s.event = 0;  // &= EV_EVENT_BITS;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 2044
;2044:				if (ent->client) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1154
line 2045
;2045:					ent->client->ps.externalEvent = 0;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 2049
;2046:					// predicted events should never be set to zero
;2047:					// ent->client->ps.events[0] = 0;
;2048:					// ent->client->ps.events[1] = 0;
;2049:				}
LABELV $1154
line 2050
;2050:			}
LABELV $1152
line 2051
;2051:			if (ent->freeAfterEvent) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1156
line 2053
;2052:				// tempEntities or dropped items completely go away after their event
;2053:				G_FreeEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 2054
;2054:				continue;
ADDRGP4 $1143
JUMPV
LABELV $1156
line 2055
;2055:			} else if (ent->unlinkAfterEvent) {
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1158
line 2057
;2056:				// items that will respawn will hide themselves after their pickup event
;2057:				ent->unlinkAfterEvent = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 0
ASGNI4
line 2058
;2058:				trap_UnlinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 2059
;2059:			}
LABELV $1158
line 2060
;2060:		}
LABELV $1149
line 2063
;2061:
;2062:		// temporary entities don't think
;2063:		if (ent->freeAfterEvent) {
ADDRLP4 0
INDIRP4
CNSTI4 556
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1160
line 2064
;2064:			continue;
ADDRGP4 $1143
JUMPV
LABELV $1160
line 2067
;2065:		}
;2066:
;2067:		if (!ent->r.linked && ent->neverFree) {
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1162
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1162
line 2068
;2068:			continue;
ADDRGP4 $1143
JUMPV
LABELV $1162
line 2071
;2069:		}
;2070:
;2071:		if (ent->s.eType == ET_MISSILE) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1164
line 2073
;2072:			// queue for unlagged pass
;2073:			missiles[numMissiles] = ent;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1131
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 2074
;2074:			numMissiles++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2075
;2075:			continue;
ADDRGP4 $1143
JUMPV
LABELV $1164
line 2078
;2076:		}
;2077:
;2078:		if (ent->s.eType == ET_ITEM || ent->physicsObject) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
EQI4 $1168
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1166
LABELV $1168
line 2079
;2079:			G_RunItem(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunItem
CALLV
pop
line 2080
;2080:			continue;
ADDRGP4 $1143
JUMPV
LABELV $1166
line 2083
;2081:		}
;2082:
;2083:		if (ent->s.eType == ET_MOVER) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 4
NEI4 $1169
line 2084
;2084:			G_RunMover(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunMover
CALLV
pop
line 2085
;2085:			continue;
ADDRGP4 $1143
JUMPV
LABELV $1169
line 2088
;2086:		}
;2087:
;2088:		if (i < MAX_CLIENTS) {
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $1171
line 2089
;2089:			client = ent->client;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 2090
;2090:			client->sess.spectatorTime += level.msec;
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 628
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRGP4 level+44
INDIRI4
ADDI4
ASGNI4
line 2091
;2091:			if (client->pers.connected == CON_CONNECTED)
ADDRLP4 12
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1143
line 2092
;2092:				G_RunClient(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunClient
CALLV
pop
line 2093
;2093:			continue;
ADDRGP4 $1143
JUMPV
LABELV $1171
line 2096
;2094:		}
;2095:
;2096:		G_RunThink(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 2097
;2097:	}
LABELV $1143
line 2035
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
LABELV $1145
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1142
line 2099
;2098:
;2099:	if (numMissiles) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1176
line 2101
;2100:		// unlagged
;2101:		G_TimeShiftAllClients(level.previousTime, NULL);
ADDRGP4 level+36
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 G_TimeShiftAllClients
CALLV
pop
line 2103
;2102:		// run missiles
;2103:		for (i = 0; i < numMissiles; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1182
JUMPV
LABELV $1179
line 2104
;2104:			G_RunMissile(missiles[i]);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1131
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_RunMissile
CALLV
pop
LABELV $1180
line 2103
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1182
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $1179
line 2106
;2105:		// unlagged
;2106:		G_UnTimeShiftAllClients(NULL);
CNSTP4 0
ARGP4
ADDRGP4 G_UnTimeShiftAllClients
CALLV
pop
line 2107
;2107:	}
LABELV $1176
line 2110
;2108:
;2109:	// perform final fixups on the players
;2110:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 2111
;2111:	for (i = 0; i < level.maxclients; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1186
JUMPV
LABELV $1183
line 2112
;2112:		if (ent->inuse) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1188
line 2113
;2113:			ClientEndFrame(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 2114
;2114:		}
LABELV $1188
line 2115
;2115:	}
LABELV $1184
line 2111
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
LABELV $1186
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1183
line 2118
;2116:
;2117:	// see if it is time to do a tournement restart
;2118:	CheckTournament();
ADDRGP4 CheckTournament
CALLV
pop
line 2121
;2119:
;2120:	// see if it is time to end the level
;2121:	CheckExitRules();
ADDRGP4 CheckExitRules
CALLV
pop
line 2124
;2122:
;2123:	// update to team status?
;2124:	CheckTeamStatus();
ADDRGP4 CheckTeamStatus
CALLV
pop
line 2127
;2125:
;2126:	// cancel vote if timed out
;2127:	CheckVote();
ADDRGP4 CheckVote
CALLV
pop
line 2130
;2128:
;2129:	// check team votes
;2130:	CheckTeamVote(TEAM_RED);
CNSTI4 1
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 2131
;2131:	CheckTeamVote(TEAM_BLUE);
CNSTI4 2
ARGI4
ADDRGP4 CheckTeamVote
CALLV
pop
line 2134
;2132:
;2133:	// for tracking changes
;2134:	CheckCvars();
ADDRGP4 CheckCvars
CALLV
pop
line 2136
;2135:
;2136:	if (g_listEntity.integer) {
ADDRGP4 g_listEntity+12
INDIRI4
CNSTI4 0
EQI4 $1190
line 2137
;2137:		for (i = 0; i < MAX_GENTITIES; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1193
line 2138
;2138:			G_Printf("%4i: %s\n", i, g_entities[i].classname);
ADDRGP4 $1197
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
line 2139
;2139:		}
LABELV $1194
line 2137
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1024
LTI4 $1193
line 2140
;2140:		trap_Cvar_Set("g_listEntity", "0");
ADDRGP4 $111
ARGP4
ADDRGP4 $65
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 2141
;2141:	}
LABELV $1190
line 2144
;2142:
;2143:	// unlagged
;2144:	level.frameStartTime = trap_Milliseconds();
ADDRLP4 20
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRGP4 level+11800
ADDRLP4 20
INDIRI4
ASGNI4
line 2145
;2145:}
LABELV $1130
endproc G_RunFrame 32 12
bss
export trap_GetValue
align 4
LABELV trap_GetValue
skip 4
export g_listEntity
align 4
LABELV g_listEntity
skip 272
export g_podiumDrop
align 4
LABELV g_podiumDrop
skip 272
export g_podiumDist
align 4
LABELV g_podiumDist
skip 272
export g_logSync
align 4
LABELV g_logSync
skip 272
export g_log
align 4
LABELV g_log
skip 272
export g_maxclients
align 4
LABELV g_maxclients
skip 272
export g_clients
align 4
LABELV g_clients
skip 100864
export svf_self_portal2
align 4
LABELV svf_self_portal2
skip 4
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
export phy_movetype
align 4
LABELV phy_movetype
skip 272
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
export g_predictPVS
align 4
LABELV g_predictPVS
skip 272
export g_unlagged
align 4
LABELV g_unlagged
skip 272
export g_rotation
align 4
LABELV g_rotation
skip 272
export pmove_msec
align 4
LABELV pmove_msec
skip 272
export pmove_fixed
align 4
LABELV pmove_fixed
skip 272
export g_smoothClients
align 4
LABELV g_smoothClients
skip 272
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
export g_filterBan
align 4
LABELV g_filterBan
skip 272
export g_banIPs
align 4
LABELV g_banIPs
skip 272
export g_teamForceBalance
align 4
LABELV g_teamForceBalance
skip 272
export g_autoJoin
align 4
LABELV g_autoJoin
skip 272
export g_allowVote
align 4
LABELV g_allowVote
skip 272
export g_blood
align 4
LABELV g_blood
skip 272
export g_warmup
align 4
LABELV g_warmup
skip 272
export g_motd
align 4
LABELV g_motd
skip 272
export g_synchronousClients
align 4
LABELV g_synchronousClients
skip 272
export g_weaponTeamRespawn
align 4
LABELV g_weaponTeamRespawn
skip 272
export g_weaponRespawn
align 4
LABELV g_weaponRespawn
skip 272
export g_debugDamage
align 4
LABELV g_debugDamage
skip 272
export g_debugAlloc
align 4
LABELV g_debugAlloc
skip 272
export g_debugMove
align 4
LABELV g_debugMove
skip 272
export g_inactivity
align 4
LABELV g_inactivity
skip 272
export g_forcerespawn
align 4
LABELV g_forcerespawn
skip 272
export g_quadfactor
align 4
LABELV g_quadfactor
skip 272
export g_knockback
align 4
LABELV g_knockback
skip 272
export g_speed
align 4
LABELV g_speed
skip 272
export g_gravity
align 4
LABELV g_gravity
skip 272
export g_needpass
align 4
LABELV g_needpass
skip 272
export g_password
align 4
LABELV g_password
skip 272
export g_friendlyFire
align 4
LABELV g_friendlyFire
skip 272
export g_capturelimit
align 4
LABELV g_capturelimit
skip 272
export g_timelimit
align 4
LABELV g_timelimit
skip 272
export g_fraglimit
align 4
LABELV g_fraglimit
skip 272
export g_dmflags
align 4
LABELV g_dmflags
skip 272
export g_maxGameClients
align 4
LABELV g_maxGameClients
skip 272
export g_cheats
align 4
LABELV g_cheats
skip 272
export g_dedicated
align 4
LABELV g_dedicated
skip 272
export sv_fps
align 4
LABELV sv_fps
skip 272
export g_mapname
align 4
LABELV g_mapname
skip 272
export g_gametype
align 4
LABELV g_gametype
skip 272
export g_entities
align 4
LABELV g_entities
skip 835584
export level
align 4
LABELV level
skip 11804
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
import DeathmatchScoreboardMessage
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
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
LABELV $1197
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
LABELV $1129
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 45
byte 1 62
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 107
byte 1 0
align 1
LABELV $1120
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $1100
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1097
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1092
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1049
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 119
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1039
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 97
byte 1 110
byte 1 121
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1036
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1015
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1010
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $1001
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $914
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $864
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $837
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $831
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $830
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $820
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $807
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $801
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $800
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $787
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $786
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $691
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 32
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $674
byte 1 114
byte 1 101
byte 1 100
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 32
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $665
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $659
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $654
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 46
byte 1 37
byte 1 105
byte 1 32
byte 1 0
align 1
LABELV $651
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $649
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 0
align 1
LABELV $646
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $622
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $537
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $398
byte 1 115
byte 1 0
align 1
LABELV $389
byte 1 102
byte 1 0
align 1
LABELV $355
byte 1 83
byte 1 104
byte 1 117
byte 1 116
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $351
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 32
byte 1 83
byte 1 104
byte 1 117
byte 1 116
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 61
byte 1 61
byte 1 61
byte 1 61
byte 1 10
byte 1 0
align 1
LABELV $348
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 77
byte 1 97
byte 1 112
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $342
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
LABELV $339
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 112
byte 1 111
byte 1 98
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 47
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 52
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $337
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $333
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $324
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $317
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $301
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 103
byte 1 103
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 100
byte 1 105
byte 1 115
byte 1 107
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $300
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $299
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $297
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
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 108
byte 1 111
byte 1 103
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
LABELV $282
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
byte 1 102
byte 1 114
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $276
byte 1 83
byte 1 86
byte 1 70
byte 1 95
byte 1 83
byte 1 69
byte 1 76
byte 1 70
byte 1 95
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 65
byte 1 76
byte 1 50
byte 1 95
byte 1 81
byte 1 51
byte 1 69
byte 1 0
align 1
LABELV $271
byte 1 47
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 71
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $270
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $269
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $268
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 32
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 73
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 45
byte 1 10
byte 1 0
align 1
LABELV $263
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $258
byte 1 114
byte 1 101
byte 1 100
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $253
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $248
byte 1 114
byte 1 101
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $245
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 0
align 1
LABELV $240
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $231
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $228
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 0
align 1
LABELV $210
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $198
byte 1 103
byte 1 95
byte 1 100
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $194
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 115
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
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 48
byte 1 10
byte 1 0
align 1
LABELV $176
byte 1 37
byte 1 105
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $118
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
byte 1 0
align 1
LABELV $117
byte 1 103
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $116
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $115
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 102
byte 1 105
byte 1 120
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $114
byte 1 103
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 111
byte 1 116
byte 1 104
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $113
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 80
byte 1 86
byte 1 83
byte 1 0
align 1
LABELV $112
byte 1 103
byte 1 95
byte 1 117
byte 1 110
byte 1 108
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $111
byte 1 103
byte 1 95
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $110
byte 1 103
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $109
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $108
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 68
byte 1 114
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $107
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $106
byte 1 103
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 68
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $105
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $104
byte 1 103
byte 1 95
byte 1 109
byte 1 111
byte 1 116
byte 1 100
byte 1 0
align 1
LABELV $103
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 65
byte 1 108
byte 1 108
byte 1 111
byte 1 99
byte 1 0
align 1
LABELV $102
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $101
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 77
byte 1 111
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $100
byte 1 103
byte 1 95
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $98
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $97
byte 1 53
byte 1 0
align 1
LABELV $96
byte 1 103
byte 1 95
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $95
byte 1 51
byte 1 0
align 1
LABELV $94
byte 1 103
byte 1 95
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 102
byte 1 97
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $93
byte 1 49
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $92
byte 1 103
byte 1 95
byte 1 107
byte 1 110
byte 1 111
byte 1 99
byte 1 107
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $91
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $90
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $89
byte 1 51
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $88
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $87
byte 1 100
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $86
byte 1 103
byte 1 95
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $85
byte 1 103
byte 1 95
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 66
byte 1 97
byte 1 110
byte 1 0
align 1
LABELV $84
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 0
align 1
LABELV $83
byte 1 103
byte 1 95
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $82
byte 1 103
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 83
byte 1 121
byte 1 110
byte 1 99
byte 1 0
align 1
LABELV $81
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 46
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $80
byte 1 103
byte 1 95
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $79
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $78
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 70
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 66
byte 1 97
byte 1 108
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $77
byte 1 49
byte 1 0
align 1
LABELV $76
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 74
byte 1 111
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $75
byte 1 103
byte 1 95
byte 1 102
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 108
byte 1 121
byte 1 70
byte 1 105
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $74
byte 1 103
byte 1 95
byte 1 115
byte 1 121
byte 1 110
byte 1 99
byte 1 104
byte 1 114
byte 1 111
byte 1 110
byte 1 111
byte 1 117
byte 1 115
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $73
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $72
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
LABELV $71
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $70
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
LABELV $69
byte 1 100
byte 1 109
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $68
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $67
byte 1 56
byte 1 0
align 1
LABELV $66
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
byte 1 0
align 1
LABELV $65
byte 1 48
byte 1 0
align 1
LABELV $64
byte 1 103
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
LABELV $63
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $62
byte 1 115
byte 1 118
byte 1 95
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $61
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $60
byte 1 65
byte 1 112
byte 1 114
byte 1 32
byte 1 32
byte 1 55
byte 1 32
byte 1 50
byte 1 48
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $59
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $58
byte 1 111
byte 1 115
byte 1 100
byte 1 102
byte 1 0
align 1
LABELV $57
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $56
byte 1 0
align 1
LABELV $55
byte 1 115
byte 1 118
byte 1 95
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 0
