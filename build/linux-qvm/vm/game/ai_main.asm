export BotAI_Print
code
proc BotAI_Print 2056 12
file "../../../../code/game/ai_main.c"
line 73
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_main.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_main.c $
;10: *
;11: *****************************************************************************/
;12:
;13:#include "g_local.h"
;14:#include "q_shared.h"
;15:#include "botlib.h"  //bot lib interface
;16:#include "be_aas.h"
;17:#include "be_ea.h"
;18:#include "be_ai_char.h"
;19:#include "be_ai_chat.h"
;20:#include "be_ai_gen.h"
;21:#include "be_ai_goal.h"
;22:#include "be_ai_move.h"
;23:#include "be_ai_weap.h"
;24://
;25:#include "ai_main.h"
;26:#include "ai_dmq3.h"
;27:#include "ai_chat.h"
;28:#include "ai_cmd.h"
;29:#include "ai_dmnet.h"
;30:#include "ai_vcmd.h"
;31:
;32://
;33:#include "chars.h"
;34:#include "inv.h"
;35:#include "syn.h"
;36:
;37:#define MAX_PATH 144
;38:
;39:// bot states
;40:bot_state_t* botstates[MAX_CLIENTS];
;41:// number of bots
;42:int numbots;
;43:// floating point time
;44:float floattime;
;45:// time to do a regular update
;46:float regularupdate_time;
;47://
;48:int bot_interbreed;
;49:int bot_interbreedmatchcount;
;50://
;51:vmCvar_t bot_thinktime;
;52:vmCvar_t bot_memorydump;
;53:vmCvar_t bot_saveroutingcache;
;54:vmCvar_t bot_pause;
;55:vmCvar_t bot_report;
;56:vmCvar_t bot_testsolid;
;57:vmCvar_t bot_testclusters;
;58:vmCvar_t bot_developer;
;59:vmCvar_t bot_interbreedchar;
;60:vmCvar_t bot_interbreedbots;
;61:vmCvar_t bot_interbreedcycle;
;62:vmCvar_t bot_interbreedwrite;
;63:
;64:char     mapname[MAX_QPATH];
;65:
;66:void     ExitLevel(void);
;67:
;68:/*
;69:==================
;70:BotAI_Print
;71:==================
;72:*/
;73:void QDECL BotAI_Print(int type, const char* fmt, ...) {
line 77
;74:	char    str[2048];
;75:	va_list ap;
;76:
;77:	va_start(ap, fmt);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 78
;78:	ED_vsprintf(str, fmt, ap);
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
line 79
;79:	va_end(ap);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 81
;80:
;81:	switch (type) {
ADDRLP4 2052
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 1
LTI4 $57
ADDRLP4 2052
INDIRI4
CNSTI4 5
GTI4 $57
ADDRLP4 2052
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $70-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $70
address $59
address $61
address $63
address $65
address $67
code
LABELV $59
line 82
;82:	case PRT_MESSAGE: {
line 83
;83:		G_Printf("%s", str);
ADDRGP4 $60
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 84
;84:		break;
ADDRGP4 $58
JUMPV
LABELV $61
line 86
;85:	}
;86:	case PRT_WARNING: {
line 87
;87:		G_Printf(S_COLOR_YELLOW "Warning: %s", str);
ADDRGP4 $62
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 88
;88:		break;
ADDRGP4 $58
JUMPV
LABELV $63
line 90
;89:	}
;90:	case PRT_ERROR: {
line 91
;91:		G_Printf(S_COLOR_RED "Error: %s", str);
ADDRGP4 $64
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 92
;92:		break;
ADDRGP4 $58
JUMPV
LABELV $65
line 94
;93:	}
;94:	case PRT_FATAL: {
line 95
;95:		G_Printf(S_COLOR_RED "Fatal: %s", str);
ADDRGP4 $66
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 96
;96:		break;
ADDRGP4 $58
JUMPV
LABELV $67
line 98
;97:	}
;98:	case PRT_EXIT: {
line 99
;99:		G_Error(S_COLOR_RED "Exit: %s", str);
ADDRGP4 $68
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 100
;100:		break;
ADDRGP4 $58
JUMPV
LABELV $57
line 102
;101:	}
;102:	default: {
line 103
;103:		G_Printf("unknown print type\n");
ADDRGP4 $69
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 104
;104:		break;
LABELV $58
line 107
;105:	}
;106:	}
;107:}
LABELV $55
endproc BotAI_Print 2056 12
export BotAI_Trace
proc BotAI_Trace 56 28
line 114
;108:
;109:/*
;110:==================
;111:BotAI_Trace
;112:==================
;113:*/
;114:void BotAI_Trace(bsp_trace_t* bsptrace, vec3_t start, vec3_t mins, vec3_t maxs, vec3_t end, int passent, int contentmask) {
line 117
;115:	trace_t trace;
;116:
;117:	trap_Trace(&trace, start, mins, maxs, end, passent, contentmask);
ADDRLP4 0
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
ADDRFP4 16
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 119
;118:	// copy the trace information
;119:	bsptrace->allsolid   = trace.allsolid;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 120
;120:	bsptrace->startsolid = trace.startsolid;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0+4
INDIRI4
ASGNI4
line 121
;121:	bsptrace->fraction   = trace.fraction;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0+8
INDIRF4
ASGNF4
line 122
;122:	VectorCopy(trace.endpos, bsptrace->endpos);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 123
;123:	bsptrace->plane.dist = trace.plane.dist;
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0+24+12
INDIRF4
ASGNF4
line 124
;124:	VectorCopy(trace.plane.normal, bsptrace->plane.normal);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 125
;125:	bsptrace->plane.signbits = trace.plane.signbits;
ADDRFP4 0
INDIRP4
CNSTI4 41
ADDP4
ADDRLP4 0+24+17
INDIRU1
ASGNU1
line 126
;126:	bsptrace->plane.type     = trace.plane.type;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+24+16
INDIRU1
ASGNU1
line 127
;127:	bsptrace->surface.value  = 0;
ADDRFP4 0
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 128
;128:	bsptrace->surface.flags  = trace.surfaceFlags;
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0+44
INDIRI4
ASGNI4
line 129
;129:	bsptrace->ent            = trace.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 130
;130:	bsptrace->exp_dist       = 0;
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTF4 0
ASGNF4
line 131
;131:	bsptrace->sidenum        = 0;
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 132
;132:	bsptrace->contents       = trace.contents;
ADDRFP4 0
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 0+48
INDIRI4
ASGNI4
line 133
;133:}
LABELV $72
endproc BotAI_Trace 56 28
export BotAI_GetClientState
proc BotAI_GetClientState 4 12
line 140
;134:
;135:/*
;136:==================
;137:BotAI_GetClientState
;138:==================
;139:*/
;140:int BotAI_GetClientState(int clientNum, playerState_t* state) {
line 143
;141:	gentity_t* ent;
;142:
;143:	ent = &g_entities[clientNum];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 144
;144:	if (!ent->inuse) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $87
line 145
;145:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $86
JUMPV
LABELV $87
line 147
;146:	}
;147:	if (!ent->client) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $89
line 148
;148:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $86
JUMPV
LABELV $89
line 151
;149:	}
;150:
;151:	memcpy(state, &ent->client->ps, sizeof(playerState_t));
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
CNSTI4 468
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 152
;152:	return qtrue;
CNSTI4 1
RETI4
LABELV $86
endproc BotAI_GetClientState 4 12
export BotAI_GetEntityState
proc BotAI_GetEntityState 8 12
line 160
;153:}
;154:
;155:/*
;156:==================
;157:BotAI_GetEntityState
;158:==================
;159:*/
;160:qboolean BotAI_GetEntityState(int entityNum, entityState_t* state) {
line 163
;161:	const gentity_t* ent;
;162:
;163:	ent = g_entities + entityNum;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 165
;164:
;165:	if (!ent->inuse || !ent->r.linked) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $94
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
NEI4 $92
LABELV $94
line 166
;166:		memset(state, 0, sizeof(entityState_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 208
ARGI4
ADDRGP4 memset
CALLP4
pop
line 167
;167:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $91
JUMPV
LABELV $92
line 170
;168:	}
;169:
;170:	if (ent->r.svFlags & SVF_NOCLIENT) {
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $95
line 171
;171:		memset(state, 0, sizeof(entityState_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 208
ARGI4
ADDRGP4 memset
CALLP4
pop
line 172
;172:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $91
JUMPV
LABELV $95
line 175
;173:	}
;174:
;175:	memcpy(state, &ent->s, sizeof(entityState_t));
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 208
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 176
;176:	return qtrue;
CNSTI4 1
RETI4
LABELV $91
endproc BotAI_GetEntityState 8 12
export BotAI_GetSnapshotEntity
proc BotAI_GetSnapshotEntity 8 12
line 184
;177:}
;178:
;179:/*
;180:==================
;181:BotAI_GetSnapshotEntity
;182:==================
;183:*/
;184:int BotAI_GetSnapshotEntity(int clientNum, int sequence, entityState_t* state) {
line 187
;185:	int entNum;
;186:
;187:	entNum = trap_BotGetSnapshotEntity(clientNum, sequence);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 trap_BotGetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 188
;188:	if (entNum == -1) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $98
line 189
;189:		memset(state, 0, sizeof(entityState_t));
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 208
ARGI4
ADDRGP4 memset
CALLP4
pop
line 190
;190:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $97
JUMPV
LABELV $98
line 193
;191:	}
;192:
;193:	BotAI_GetEntityState(entNum, state);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 195
;194:
;195:	return sequence + 1;
ADDRFP4 4
INDIRI4
CNSTI4 1
ADDI4
RETI4
LABELV $97
endproc BotAI_GetSnapshotEntity 8 12
export BotAI_BotInitialChat
proc BotAI_BotInitialChat 56 44
line 203
;196:}
;197:
;198:/*
;199:==================
;200:BotAI_BotInitialChat
;201:==================
;202:*/
;203:void QDECL BotAI_BotInitialChat(bot_state_t* bs, char* type, ...) {
line 209
;204:	int     i, mcontext;
;205:	va_list ap;
;206:	char*   p;
;207:	char*   vars[MAX_MATCHVARIABLES];
;208:
;209:	memset(vars, 0, sizeof(vars));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 memset
CALLP4
pop
line 210
;210:	va_start(ap, type);
ADDRLP4 40
ADDRFP4 4+4
ASGNP4
line 211
;211:	p = va_arg(ap, char*);
ADDRLP4 48
ADDRLP4 40
INDIRP4
CNSTU4 4
ADDP4
ASGNP4
ADDRLP4 40
ADDRLP4 48
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 48
INDIRP4
CNSTI4 -4
ADDP4
INDIRP4
ASGNP4
line 212
;212:	for (i = 0; i < MAX_MATCHVARIABLES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $102
line 213
;213:		if (!p) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $106
line 214
;214:			break;
ADDRGP4 $104
JUMPV
LABELV $106
line 216
;215:		}
;216:		vars[i] = p;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 217
;217:		p       = va_arg(ap, char*);
ADDRLP4 52
ADDRLP4 40
INDIRP4
CNSTU4 4
ADDP4
ASGNP4
ADDRLP4 40
ADDRLP4 52
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 52
INDIRP4
CNSTI4 -4
ADDP4
INDIRP4
ASGNP4
line 218
;218:	}
LABELV $103
line 212
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $102
LABELV $104
line 219
;219:	va_end(ap);
ADDRLP4 40
CNSTP4 0
ASGNP4
line 221
;220:
;221:	mcontext = BotSynonymContext(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotSynonymContext
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 52
INDIRI4
ASGNI4
line 223
;222:
;223:	trap_BotInitialChat(bs->cs, type, mcontext, vars[0], vars[1], vars[2], vars[3], vars[4], vars[5], vars[6], vars[7]);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8+4
INDIRP4
ARGP4
ADDRLP4 8+8
INDIRP4
ARGP4
ADDRLP4 8+12
INDIRP4
ARGP4
ADDRLP4 8+16
INDIRP4
ARGP4
ADDRLP4 8+20
INDIRP4
ARGP4
ADDRLP4 8+24
INDIRP4
ARGP4
ADDRLP4 8+28
INDIRP4
ARGP4
ADDRGP4 trap_BotInitialChat
CALLV
pop
line 224
;224:}
LABELV $100
endproc BotAI_BotInitialChat 56 44
export BotTestAAS
proc BotTestAAS 64 16
line 231
;225:
;226:/*
;227:==================
;228:BotTestAAS
;229:==================
;230:*/
;231:void BotTestAAS(vec3_t origin) {
line 235
;232:	int            areanum;
;233:	aas_areainfo_t info;
;234:
;235:	trap_Cvar_Update(&bot_testsolid);
ADDRGP4 bot_testsolid
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 236
;236:	trap_Cvar_Update(&bot_testclusters);
ADDRGP4 bot_testclusters
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 237
;237:	if (bot_testsolid.integer) {
ADDRGP4 bot_testsolid+12
INDIRI4
CNSTI4 0
EQI4 $116
line 238
;238:		if (!trap_AAS_Initialized())
ADDRLP4 56
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $119
line 239
;239:			return;
ADDRGP4 $115
JUMPV
LABELV $119
line 240
;240:		areanum = BotPointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
line 241
;241:		if (areanum)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $121
line 242
;242:			BotAI_Print(PRT_MESSAGE, "\rempty area");
CNSTI4 1
ARGI4
ADDRGP4 $123
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
ADDRGP4 $117
JUMPV
LABELV $121
line 244
;243:		else
;244:			BotAI_Print(PRT_MESSAGE, "\r^1SOLID area");
CNSTI4 1
ARGI4
ADDRGP4 $124
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 245
;245:	} else if (bot_testclusters.integer) {
ADDRGP4 $117
JUMPV
LABELV $116
ADDRGP4 bot_testclusters+12
INDIRI4
CNSTI4 0
EQI4 $125
line 246
;246:		if (!trap_AAS_Initialized())
ADDRLP4 56
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $128
line 247
;247:			return;
ADDRGP4 $115
JUMPV
LABELV $128
line 248
;248:		areanum = BotPointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
line 249
;249:		if (!areanum)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $130
line 250
;250:			BotAI_Print(PRT_MESSAGE, "\r^1Solid!                              ");
CNSTI4 1
ARGI4
ADDRGP4 $132
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
ADDRGP4 $131
JUMPV
LABELV $130
line 251
;251:		else {
line 252
;252:			trap_AAS_AreaInfo(areanum, &info);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 253
;253:			BotAI_Print(PRT_MESSAGE, "\rarea %d, cluster %d       ", areanum, info.cluster);
CNSTI4 1
ARGI4
ADDRGP4 $133
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4+12
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 254
;254:		}
LABELV $131
line 255
;255:	}
LABELV $125
LABELV $117
line 256
;256:}
LABELV $115
endproc BotTestAAS 64 16
export BotReportStatus
proc BotReportStatus 560 24
line 263
;257:
;258:/*
;259:==================
;260:BotReportStatus
;261:==================
;262:*/
;263:void BotReportStatus(bot_state_t* bs) {
line 268
;264:	char  goalname[MAX_MESSAGE_SIZE];
;265:	char  netname[MAX_MESSAGE_SIZE];
;266:	char *leader, flagstatus[32];
;267:	//
;268:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 269
;269:	if (Q_stricmp(netname, bs->teamleader) == 0)
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 548
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
NEI4 $136
line 270
;270:		leader = "L";
ADDRLP4 288
ADDRGP4 $138
ASGNP4
ADDRGP4 $137
JUMPV
LABELV $136
line 272
;271:	else
;272:		leader = " ";
ADDRLP4 288
ADDRGP4 $139
ASGNP4
LABELV $137
line 274
;273:
;274:	strcpy(flagstatus, "  ");
ADDRLP4 256
ARGP4
ADDRGP4 $140
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 275
;275:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $141
line 276
;276:		if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 552
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $143
line 277
;277:			if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 556
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 1
NEI4 $145
line 278
;278:				strcpy(flagstatus, S_COLOR_RED "F ");
ADDRLP4 256
ARGP4
ADDRGP4 $147
ARGP4
ADDRGP4 strcpy
CALLP4
pop
ADDRGP4 $146
JUMPV
LABELV $145
line 280
;279:			else
;280:				strcpy(flagstatus, S_COLOR_BLUE "F ");
ADDRLP4 256
ARGP4
ADDRGP4 $148
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $146
line 281
;281:		}
LABELV $143
line 282
;282:	}
LABELV $141
line 301
;283:#ifdef MISSIONPACK
;284:	else if (gametype == GT_1FCTF) {
;285:		if (Bot1FCTFCarryingFlag(bs)) {
;286:			if (BotTeam(bs) == TEAM_RED)
;287:				strcpy(flagstatus, S_COLOR_RED "F ");
;288:			else
;289:				strcpy(flagstatus, S_COLOR_BLUE "F ");
;290:		}
;291:	} else if (gametype == GT_HARVESTER) {
;292:		if (BotHarvesterCarryingCubes(bs)) {
;293:			if (BotTeam(bs) == TEAM_RED)
;294:				Com_sprintf(flagstatus, sizeof(flagstatus), S_COLOR_RED "%2d", bs->inventory[INVENTORY_REDCUBE]);
;295:			else
;296:				Com_sprintf(flagstatus, sizeof(flagstatus), S_COLOR_BLUE "%2d", bs->inventory[INVENTORY_BLUECUBE]);
;297:		}
;298:	}
;299:#endif
;300:
;301:	switch (bs->ltgtype) {
ADDRLP4 552
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 552
INDIRI4
CNSTI4 1
LTI4 $149
ADDRLP4 552
INDIRI4
CNSTI4 13
GTI4 $149
ADDRLP4 552
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $177-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $177
address $152
address $154
address $156
address $166
address $168
address $170
address $162
address $162
address $164
address $158
address $160
address $174
address $172
code
LABELV $152
line 302
;302:	case LTG_TEAMHELP: {
line 303
;303:		EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 304
;304:		BotAI_Print(PRT_MESSAGE, "%-20s%s%s: helping %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $153
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 305
;305:		break;
ADDRGP4 $150
JUMPV
LABELV $154
line 307
;306:	}
;307:	case LTG_TEAMACCOMPANY: {
line 308
;308:		EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 309
;309:		BotAI_Print(PRT_MESSAGE, "%-20s%s%s: accompanying %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $155
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 310
;310:		break;
ADDRGP4 $150
JUMPV
LABELV $156
line 312
;311:	}
;312:	case LTG_DEFENDKEYAREA: {
line 313
;313:		trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 314
;314:		BotAI_Print(PRT_MESSAGE, "%-20s%s%s: defending %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $157
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 315
;315:		break;
ADDRGP4 $150
JUMPV
LABELV $158
line 317
;316:	}
;317:	case LTG_GETITEM: {
line 318
;318:		trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 319
;319:		BotAI_Print(PRT_MESSAGE, "%-20s%s%s: getting item %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $159
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 320
;320:		break;
ADDRGP4 $150
JUMPV
LABELV $160
line 322
;321:	}
;322:	case LTG_KILL: {
line 323
;323:		ClientName(bs->teamgoal.entitynum, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 324
;324:		BotAI_Print(PRT_MESSAGE, "%-20s%s%s: killing %s\n", netname, leader, flagstatus, goalname);
CNSTI4 1
ARGI4
ADDRGP4 $161
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 325
;325:		break;
ADDRGP4 $150
JUMPV
LABELV $162
line 328
;326:	}
;327:	case LTG_CAMP:
;328:	case LTG_CAMPORDER: {
line 329
;329:		BotAI_Print(PRT_MESSAGE, "%-20s%s%s: camping\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $163
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 330
;330:		break;
ADDRGP4 $150
JUMPV
LABELV $164
line 332
;331:	}
;332:	case LTG_PATROL: {
line 333
;333:		BotAI_Print(PRT_MESSAGE, "%-20s%s%s: patrolling\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $165
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 334
;334:		break;
ADDRGP4 $150
JUMPV
LABELV $166
line 336
;335:	}
;336:	case LTG_GETFLAG: {
line 337
;337:		BotAI_Print(PRT_MESSAGE, "%-20s%s%s: capturing flag\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $167
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 338
;338:		break;
ADDRGP4 $150
JUMPV
LABELV $168
line 340
;339:	}
;340:	case LTG_RUSHBASE: {
line 341
;341:		BotAI_Print(PRT_MESSAGE, "%-20s%s%s: rushing base\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $169
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 342
;342:		break;
ADDRGP4 $150
JUMPV
LABELV $170
line 344
;343:	}
;344:	case LTG_RETURNFLAG: {
line 345
;345:		BotAI_Print(PRT_MESSAGE, "%-20s%s%s: returning flag\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $171
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 346
;346:		break;
ADDRGP4 $150
JUMPV
LABELV $172
line 348
;347:	}
;348:	case LTG_ATTACKENEMYBASE: {
line 349
;349:		BotAI_Print(PRT_MESSAGE, "%-20s%s%s: attacking the enemy base\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $173
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 350
;350:		break;
ADDRGP4 $150
JUMPV
LABELV $174
line 352
;351:	}
;352:	case LTG_HARVEST: {
line 353
;353:		BotAI_Print(PRT_MESSAGE, "%-20s%s%s: harvesting\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $175
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 354
;354:		break;
ADDRGP4 $150
JUMPV
LABELV $149
line 356
;355:	}
;356:	default: {
line 357
;357:		BotAI_Print(PRT_MESSAGE, "%-20s%s%s: roaming\n", netname, leader, flagstatus);
CNSTI4 1
ARGI4
ADDRGP4 $176
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 288
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 358
;358:		break;
LABELV $150
line 361
;359:	}
;360:	}
;361:}
LABELV $135
endproc BotReportStatus 560 24
export BotTeamplayReport
proc BotTeamplayReport 1048 12
line 368
;362:
;363:/*
;364:==================
;365:BotTeamplayReport
;366:==================
;367:*/
;368:void BotTeamplayReport(void) {
line 372
;369:	int  i;
;370:	char buf[MAX_INFO_STRING];
;371:
;372:	BotAI_Print(PRT_MESSAGE, S_COLOR_RED "RED\n");
CNSTI4 1
ARGI4
ADDRGP4 $180
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 373
;373:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $184
JUMPV
LABELV $181
line 375
;374:		//
;375:		if (!botstates[i] || !botstates[i]->inuse)
ADDRLP4 1032
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $188
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $186
LABELV $188
line 376
;376:			continue;
ADDRGP4 $182
JUMPV
LABELV $186
line 378
;377:		//
;378:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 380
;379:		// if no config string or no name
;380:		if (!buf[0] || !*Info_ValueForKey(buf, "n"))
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $192
ADDRLP4 4
ARGP4
ADDRGP4 $191
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $189
LABELV $192
line 381
;381:			continue;
ADDRGP4 $182
JUMPV
LABELV $189
line 383
;382:		// skip spectators
;383:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_RED) {
ADDRLP4 4
ARGP4
ADDRGP4 $195
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
CNSTI4 1
NEI4 $193
line 384
;384:			BotReportStatus(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 385
;385:		}
LABELV $193
line 386
;386:	}
LABELV $182
line 373
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $184
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $181
line 387
;387:	BotAI_Print(PRT_MESSAGE, S_COLOR_BLUE "BLUE\n");
CNSTI4 1
ARGI4
ADDRGP4 $196
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 388
;388:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $200
JUMPV
LABELV $197
line 390
;389:		//
;390:		if (!botstates[i] || !botstates[i]->inuse)
ADDRLP4 1032
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $204
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $202
LABELV $204
line 391
;391:			continue;
ADDRGP4 $198
JUMPV
LABELV $202
line 393
;392:		//
;393:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 395
;394:		// if no config string or no name
;395:		if (!buf[0] || !*Info_ValueForKey(buf, "n"))
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $207
ADDRLP4 4
ARGP4
ADDRGP4 $191
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $205
LABELV $207
line 396
;396:			continue;
ADDRGP4 $198
JUMPV
LABELV $205
line 398
;397:		// skip spectators
;398:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_BLUE) {
ADDRLP4 4
ARGP4
ADDRGP4 $195
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
CNSTI4 2
NEI4 $208
line 399
;399:			BotReportStatus(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotReportStatus
CALLV
pop
line 400
;400:		}
LABELV $208
line 401
;401:	}
LABELV $198
line 388
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $200
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $197
line 402
;402:}
LABELV $179
endproc BotTeamplayReport 1048 12
export BotSetInfoConfigString
proc BotSetInfoConfigString 880 16
line 409
;403:
;404:/*
;405:==================
;406:BotSetInfoConfigString
;407:==================
;408:*/
;409:void BotSetInfoConfigString(bot_state_t* bs) {
line 416
;410:	char       goalname[MAX_MESSAGE_SIZE];
;411:	char       netname[MAX_MESSAGE_SIZE];
;412:	char       action[MAX_MESSAGE_SIZE];
;413:	char *     leader, carrying[32], *cs;
;414:	bot_goal_t goal;
;415:	//
;416:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 417
;417:	if (Q_stricmp(netname, bs->teamleader) == 0)
ADDRLP4 256
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 864
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 864
INDIRI4
CNSTI4 0
NEI4 $211
line 418
;418:		leader = "L";
ADDRLP4 544
ADDRGP4 $138
ASGNP4
ADDRGP4 $212
JUMPV
LABELV $211
line 420
;419:	else
;420:		leader = " ";
ADDRLP4 544
ADDRGP4 $139
ASGNP4
LABELV $212
line 422
;421:
;422:	strcpy(carrying, "  ");
ADDRLP4 512
ARGP4
ADDRGP4 $140
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 423
;423:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $213
line 424
;424:		if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 868
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 868
INDIRI4
CNSTI4 0
EQI4 $215
line 425
;425:			strcpy(carrying, "F ");
ADDRLP4 512
ARGP4
ADDRGP4 $217
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 426
;426:		}
LABELV $215
line 427
;427:	}
LABELV $213
line 443
;428:#ifdef MISSIONPACK
;429:	else if (gametype == GT_1FCTF) {
;430:		if (Bot1FCTFCarryingFlag(bs)) {
;431:			strcpy(carrying, "F ");
;432:		}
;433:	} else if (gametype == GT_HARVESTER) {
;434:		if (BotHarvesterCarryingCubes(bs)) {
;435:			if (BotTeam(bs) == TEAM_RED)
;436:				Com_sprintf(carrying, sizeof(carrying), "%2d", bs->inventory[INVENTORY_REDCUBE]);
;437:			else
;438:				Com_sprintf(carrying, sizeof(carrying), "%2d", bs->inventory[INVENTORY_BLUECUBE]);
;439:		}
;440:	}
;441:#endif
;442:
;443:	switch (bs->ltgtype) {
ADDRLP4 868
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 868
INDIRI4
CNSTI4 1
LTI4 $218
ADDRLP4 868
INDIRI4
CNSTI4 13
GTI4 $218
ADDRLP4 868
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $247-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $247
address $221
address $223
address $225
address $235
address $237
address $239
address $231
address $231
address $233
address $227
address $229
address $243
address $241
code
LABELV $221
line 444
;444:	case LTG_TEAMHELP: {
line 445
;445:		EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 446
;446:		Com_sprintf(action, sizeof(action), "helping %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $222
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 447
;447:		break;
ADDRGP4 $219
JUMPV
LABELV $223
line 449
;448:	}
;449:	case LTG_TEAMACCOMPANY: {
line 450
;450:		EasyClientName(bs->teammate, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 451
;451:		Com_sprintf(action, sizeof(action), "accompanying %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $224
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 452
;452:		break;
ADDRGP4 $219
JUMPV
LABELV $225
line 454
;453:	}
;454:	case LTG_DEFENDKEYAREA: {
line 455
;455:		trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 456
;456:		Com_sprintf(action, sizeof(action), "defending %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $226
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 457
;457:		break;
ADDRGP4 $219
JUMPV
LABELV $227
line 459
;458:	}
;459:	case LTG_GETITEM: {
line 460
;460:		trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 461
;461:		Com_sprintf(action, sizeof(action), "getting item %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $228
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 462
;462:		break;
ADDRGP4 $219
JUMPV
LABELV $229
line 464
;463:	}
;464:	case LTG_KILL: {
line 465
;465:		ClientName(bs->teamgoal.entitynum, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 466
;466:		Com_sprintf(action, sizeof(action), "killing %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $230
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 467
;467:		break;
ADDRGP4 $219
JUMPV
LABELV $231
line 470
;468:	}
;469:	case LTG_CAMP:
;470:	case LTG_CAMPORDER: {
line 471
;471:		Com_sprintf(action, sizeof(action), "camping");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $232
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 472
;472:		break;
ADDRGP4 $219
JUMPV
LABELV $233
line 474
;473:	}
;474:	case LTG_PATROL: {
line 475
;475:		Com_sprintf(action, sizeof(action), "patrolling");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $234
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 476
;476:		break;
ADDRGP4 $219
JUMPV
LABELV $235
line 478
;477:	}
;478:	case LTG_GETFLAG: {
line 479
;479:		Com_sprintf(action, sizeof(action), "capturing flag");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $236
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 480
;480:		break;
ADDRGP4 $219
JUMPV
LABELV $237
line 482
;481:	}
;482:	case LTG_RUSHBASE: {
line 483
;483:		Com_sprintf(action, sizeof(action), "rushing base");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $238
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 484
;484:		break;
ADDRGP4 $219
JUMPV
LABELV $239
line 486
;485:	}
;486:	case LTG_RETURNFLAG: {
line 487
;487:		Com_sprintf(action, sizeof(action), "returning flag");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $240
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 488
;488:		break;
ADDRGP4 $219
JUMPV
LABELV $241
line 490
;489:	}
;490:	case LTG_ATTACKENEMYBASE: {
line 491
;491:		Com_sprintf(action, sizeof(action), "attacking the enemy base");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $242
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 492
;492:		break;
ADDRGP4 $219
JUMPV
LABELV $243
line 494
;493:	}
;494:	case LTG_HARVEST: {
line 495
;495:		Com_sprintf(action, sizeof(action), "harvesting");
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $244
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 496
;496:		break;
ADDRGP4 $219
JUMPV
LABELV $218
line 498
;497:	}
;498:	default: {
line 499
;499:		trap_BotGetTopGoal(bs->gs, &goal);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 808
ARGP4
ADDRGP4 trap_BotGetTopGoal
CALLI4
pop
line 500
;500:		trap_BotGoalName(goal.number, goalname, sizeof(goalname));
ADDRLP4 808+44
INDIRI4
ARGI4
ADDRLP4 552
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 501
;501:		Com_sprintf(action, sizeof(action), "roaming %s", goalname);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $246
ARGP4
ADDRLP4 552
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 502
;502:		break;
LABELV $219
line 505
;503:	}
;504:	}
;505:	cs = va("l\\%s\\c\\%s\\a\\%s", leader, carrying, action);
ADDRGP4 $249
ARGP4
ADDRLP4 544
INDIRP4
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 876
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 548
ADDRLP4 876
INDIRP4
ASGNP4
line 506
;506:	trap_SetConfigstring(CS_BOTINFO + bs->client, cs);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ARGI4
ADDRLP4 548
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 507
;507:}
LABELV $210
endproc BotSetInfoConfigString 880 16
export BotUpdateInfoConfigStrings
proc BotUpdateInfoConfigStrings 1040 12
line 514
;508:
;509:/*
;510:==============
;511:BotUpdateInfoConfigStrings
;512:==============
;513:*/
;514:void BotUpdateInfoConfigStrings(void) {
line 518
;515:	int  i;
;516:	char buf[MAX_INFO_STRING];
;517:
;518:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $254
JUMPV
LABELV $251
line 520
;519:		//
;520:		if (!botstates[i] || !botstates[i]->inuse)
ADDRLP4 1032
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $258
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $256
LABELV $258
line 521
;521:			continue;
ADDRGP4 $252
JUMPV
LABELV $256
line 523
;522:		//
;523:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 525
;524:		// if no config string or no name
;525:		if (!buf[0] || !*Info_ValueForKey(buf, "n"))
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $261
ADDRLP4 4
ARGP4
ADDRGP4 $191
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $259
LABELV $261
line 526
;526:			continue;
ADDRGP4 $252
JUMPV
LABELV $259
line 527
;527:		BotSetInfoConfigString(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotSetInfoConfigString
CALLV
pop
line 528
;528:	}
LABELV $252
line 518
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $254
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $251
line 529
;529:}
LABELV $250
endproc BotUpdateInfoConfigStrings 1040 12
export BotInterbreedBots
proc BotInterbreedBots 288 20
line 536
;530:
;531:/*
;532:==============
;533:BotInterbreedBots
;534:==============
;535:*/
;536:void BotInterbreedBots(void) {
line 542
;537:	float ranks[MAX_CLIENTS];
;538:	int   parent1, parent2, child;
;539:	int   i;
;540:
;541:	// get rankings for all the bots
;542:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $263
line 543
;543:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 276
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 276
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $267
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 276
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $267
line 544
;544:			ranks[i] = botstates[i]->num_kills * 2 - botstates[i]->num_deaths;
ADDRLP4 284
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 284
INDIRP4
ADDP4
INDIRP4
CNSTI4 6032
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 284
INDIRP4
ADDP4
INDIRP4
CNSTI4 6028
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 545
;545:		} else {
ADDRGP4 $268
JUMPV
LABELV $267
line 546
;546:			ranks[i] = -1;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
CNSTF4 3212836864
ASGNF4
line 547
;547:		}
LABELV $268
line 548
;548:	}
LABELV $264
line 542
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $263
line 550
;549:
;550:	if (trap_GeneticParentsAndChildSelection(MAX_CLIENTS, ranks, &parent1, &parent2, &child)) {
CNSTI4 64
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 264
ARGP4
ADDRLP4 268
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 272
ADDRGP4 trap_GeneticParentsAndChildSelection
CALLI4
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $269
line 551
;551:		trap_BotInterbreedGoalFuzzyLogic(botstates[parent1]->gs, botstates[parent2]->gs, botstates[child]->gs);
ADDRLP4 276
ADDRGP4 botstates
ASGNP4
ADDRLP4 264
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 276
INDIRP4
ADDP4
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 268
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 276
INDIRP4
ADDP4
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 276
INDIRP4
ADDP4
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotInterbreedGoalFuzzyLogic
CALLV
pop
line 552
;552:		trap_BotMutateGoalFuzzyLogic(botstates[child]->gs, 1);
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_BotMutateGoalFuzzyLogic
CALLV
pop
line 553
;553:	}
LABELV $269
line 555
;554:	// reset the kills and deaths
;555:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $271
line 556
;556:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 280
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 280
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $275
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 280
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $275
line 557
;557:			botstates[i]->num_kills  = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6032
ADDP4
CNSTI4 0
ASGNI4
line 558
;558:			botstates[i]->num_deaths = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6028
ADDP4
CNSTI4 0
ASGNI4
line 559
;559:		}
LABELV $275
line 560
;560:	}
LABELV $272
line 555
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $271
line 561
;561:}
LABELV $262
endproc BotInterbreedBots 288 20
export BotWriteInterbreeded
proc BotWriteInterbreeded 32 8
line 568
;562:
;563:/*
;564:==============
;565:BotWriteInterbreeded
;566:==============
;567:*/
;568:void BotWriteInterbreeded(char* filename) {
line 572
;569:	float rank, bestrank;
;570:	int   i, bestbot;
;571:
;572:	bestrank = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 573
;573:	bestbot  = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 575
;574:	// get the best bot
;575:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $278
line 576
;576:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 20
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $282
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $282
line 577
;577:			rank = botstates[i]->num_kills * 2 - botstates[i]->num_deaths;
ADDRLP4 28
ADDRGP4 botstates
ASGNP4
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
ADDP4
INDIRP4
CNSTI4 6032
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 28
INDIRP4
ADDP4
INDIRP4
CNSTI4 6028
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 578
;578:		} else {
ADDRGP4 $283
JUMPV
LABELV $282
line 579
;579:			rank = -1;
ADDRLP4 4
CNSTF4 3212836864
ASGNF4
line 580
;580:		}
LABELV $283
line 581
;581:		if (rank > bestrank) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $284
line 582
;582:			bestrank = rank;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ASGNF4
line 583
;583:			bestbot  = i;
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
line 584
;584:		}
LABELV $284
line 585
;585:	}
LABELV $279
line 575
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $278
line 586
;586:	if (bestbot >= 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
LTI4 $286
line 588
;587:		// write out the new goal fuzzy logic
;588:		trap_BotSaveGoalFuzzyLogic(botstates[bestbot]->gs, filename);
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_BotSaveGoalFuzzyLogic
CALLV
pop
line 589
;589:	}
LABELV $286
line 590
;590:}
LABELV $277
endproc BotWriteInterbreeded 32 8
export BotInterbreedEndMatch
proc BotInterbreedEndMatch 8 8
line 599
;591:
;592:/*
;593:==============
;594:BotInterbreedEndMatch
;595:
;596:add link back into ExitLevel?
;597:==============
;598:*/
;599:void BotInterbreedEndMatch(void) {
line 601
;600:
;601:	if (!bot_interbreed)
ADDRGP4 bot_interbreed
INDIRI4
CNSTI4 0
NEI4 $289
line 602
;602:		return;
ADDRGP4 $288
JUMPV
LABELV $289
line 603
;603:	bot_interbreedmatchcount++;
ADDRLP4 0
ADDRGP4 bot_interbreedmatchcount
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 604
;604:	if (bot_interbreedmatchcount >= bot_interbreedcycle.integer) {
ADDRGP4 bot_interbreedmatchcount
INDIRI4
ADDRGP4 bot_interbreedcycle+12
INDIRI4
LTI4 $291
line 605
;605:		bot_interbreedmatchcount = 0;
ADDRGP4 bot_interbreedmatchcount
CNSTI4 0
ASGNI4
line 607
;606:		//
;607:		trap_Cvar_Update(&bot_interbreedwrite);
ADDRGP4 bot_interbreedwrite
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 608
;608:		if (strlen(bot_interbreedwrite.string)) {
ADDRGP4 bot_interbreedwrite+16
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $294
line 609
;609:			BotWriteInterbreeded(bot_interbreedwrite.string);
ADDRGP4 bot_interbreedwrite+16
ARGP4
ADDRGP4 BotWriteInterbreeded
CALLV
pop
line 610
;610:			trap_Cvar_Set("bot_interbreedwrite", "");
ADDRGP4 $298
ARGP4
ADDRGP4 $299
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 611
;611:		}
LABELV $294
line 612
;612:		BotInterbreedBots();
ADDRGP4 BotInterbreedBots
CALLV
pop
line 613
;613:	}
LABELV $291
line 614
;614:}
LABELV $288
endproc BotInterbreedEndMatch 8 8
export BotInterbreeding
proc BotInterbreeding 16 20
line 621
;615:
;616:/*
;617:==============
;618:BotInterbreeding
;619:==============
;620:*/
;621:void BotInterbreeding(void) {
line 624
;622:	int i;
;623:
;624:	trap_Cvar_Update(&bot_interbreedchar);
ADDRGP4 bot_interbreedchar
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 625
;625:	if (!strlen(bot_interbreedchar.string))
ADDRGP4 bot_interbreedchar+16
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $301
line 626
;626:		return;
ADDRGP4 $300
JUMPV
LABELV $301
line 628
;627:	// make sure we are in tournament mode
;628:	if (gametype != GT_TOURNAMENT) {
ADDRGP4 gametype
INDIRI4
CNSTI4 1
EQI4 $304
line 629
;629:		trap_Cvar_Set("g_gametype", va("%d", GT_TOURNAMENT));
ADDRGP4 $307
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $306
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 630
;630:		ExitLevel();
ADDRGP4 ExitLevel
CALLV
pop
line 631
;631:		return;
ADDRGP4 $300
JUMPV
LABELV $304
line 634
;632:	}
;633:	// shutdown all the bots
;634:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $311
JUMPV
LABELV $308
line 635
;635:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 12
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $313
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $313
line 636
;636:			BotAIShutdownClient(botstates[i]->client, qfalse);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 637
;637:		}
LABELV $313
line 638
;638:	}
LABELV $309
line 634
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $311
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $308
line 640
;639:	// make sure all item weight configs are reloaded and Not shared
;640:	trap_BotLibVarSet("bot_reloadcharacters", "1");
ADDRGP4 $315
ARGP4
ADDRGP4 $316
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 642
;641:	// add a number of bots using the desired bot character
;642:	for (i = 0; i < bot_interbreedbots.integer; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $320
JUMPV
LABELV $317
line 643
;643:		trap_SendConsoleCommand(EXEC_INSERT, va("addbot %s 4 free %i %s%d\n", bot_interbreedchar.string, i * 50, bot_interbreedchar.string, i));
ADDRGP4 $322
ARGP4
ADDRGP4 bot_interbreedchar+16
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 50
MULI4
ARGI4
ADDRGP4 bot_interbreedchar+16
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 1
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 644
;644:	}
LABELV $318
line 642
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $320
ADDRLP4 0
INDIRI4
ADDRGP4 bot_interbreedbots+12
INDIRI4
LTI4 $317
line 646
;645:	//
;646:	trap_Cvar_Set("bot_interbreedchar", "");
ADDRGP4 $325
ARGP4
ADDRGP4 $299
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 647
;647:	bot_interbreed = qtrue;
ADDRGP4 bot_interbreed
CNSTI4 1
ASGNI4
line 648
;648:}
LABELV $300
endproc BotInterbreeding 16 20
export BotEntityInfo
proc BotEntityInfo 0 8
line 655
;649:
;650:/*
;651:==============
;652:BotEntityInfo
;653:==============
;654:*/
;655:void BotEntityInfo(int entnum, aas_entityinfo_t* info) {
line 656
;656:	trap_AAS_EntityInfo(entnum, info);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 trap_AAS_EntityInfo
CALLV
pop
line 657
;657:}
LABELV $326
endproc BotEntityInfo 0 8
export NumBots
proc NumBots 0 0
line 664
;658:
;659:/*
;660:==============
;661:NumBots
;662:==============
;663:*/
;664:int NumBots(void) {
line 665
;665:	return numbots;
ADDRGP4 numbots
INDIRI4
RETI4
LABELV $327
endproc NumBots 0 0
export BotTeamLeader
proc BotTeamLeader 16 4
line 673
;666:}
;667:
;668:/*
;669:==============
;670:BotTeamLeader
;671:==============
;672:*/
;673:int BotTeamLeader(bot_state_t* bs) {
line 676
;674:	int leader;
;675:
;676:	leader = ClientFromName(bs->teamleader);
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 677
;677:	if (leader < 0)
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $329
line 678
;678:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $329
line 679
;679:	if (!botstates[leader] || !botstates[leader]->inuse)
ADDRLP4 12
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $333
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $331
LABELV $333
line 680
;680:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $328
JUMPV
LABELV $331
line 681
;681:	return qtrue;
CNSTI4 1
RETI4
LABELV $328
endproc BotTeamLeader 16 4
export AngleDifference
proc AngleDifference 4 0
line 689
;682:}
;683:
;684:/*
;685:==============
;686:AngleDifference
;687:==============
;688:*/
;689:float AngleDifference(float ang1, float ang2) {
line 692
;690:	float diff;
;691:
;692:	diff = ang1 - ang2;
ADDRLP4 0
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
SUBF4
ASGNF4
line 693
;693:	if (ang1 > ang2) {
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $335
line 694
;694:		if (diff > 180.0)
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $336
line 695
;695:			diff -= 360.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 696
;696:	} else {
ADDRGP4 $336
JUMPV
LABELV $335
line 697
;697:		if (diff < -180.0)
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $339
line 698
;698:			diff += 360.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $339
line 699
;699:	}
LABELV $336
line 700
;700:	return diff;
ADDRLP4 0
INDIRF4
RETF4
LABELV $334
endproc AngleDifference 4 0
export BotChangeViewAngle
proc BotChangeViewAngle 16 4
line 708
;701:}
;702:
;703:/*
;704:==============
;705:BotChangeViewAngle
;706:==============
;707:*/
;708:float BotChangeViewAngle(float angle, float ideal_angle, float speed) {
line 711
;709:	float move;
;710:
;711:	angle       = AngleMod(angle);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 712
;712:	ideal_angle = AngleMod(ideal_angle);
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRFP4 4
ADDRLP4 8
INDIRF4
ASGNF4
line 713
;713:	if (angle == ideal_angle)
ADDRFP4 0
INDIRF4
ADDRFP4 4
INDIRF4
NEF4 $342
line 714
;714:		return angle;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $341
JUMPV
LABELV $342
line 715
;715:	move = ideal_angle - angle;
ADDRLP4 0
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
SUBF4
ASGNF4
line 716
;716:	if (ideal_angle > angle) {
ADDRFP4 4
INDIRF4
ADDRFP4 0
INDIRF4
LEF4 $344
line 717
;717:		if (move > 180.0)
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
LEF4 $345
line 718
;718:			move -= 360.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 719
;719:	} else {
ADDRGP4 $345
JUMPV
LABELV $344
line 720
;720:		if (move < -180.0)
ADDRLP4 0
INDIRF4
CNSTF4 3274964992
GEF4 $348
line 721
;721:			move += 360.0;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $348
line 722
;722:	}
LABELV $345
line 723
;723:	if (move > 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $350
line 724
;724:		if (move > speed)
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
LEF4 $351
line 725
;725:			move = speed;
ADDRLP4 0
ADDRFP4 8
INDIRF4
ASGNF4
line 726
;726:	} else {
ADDRGP4 $351
JUMPV
LABELV $350
line 727
;727:		if (move < -speed)
ADDRLP4 0
INDIRF4
ADDRFP4 8
INDIRF4
NEGF4
GEF4 $354
line 728
;728:			move = -speed;
ADDRLP4 0
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $354
line 729
;729:	}
LABELV $351
line 730
;730:	return AngleMod(angle + move);
ADDRFP4 0
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 12
INDIRF4
RETF4
LABELV $341
endproc BotChangeViewAngle 16 4
export BotChangeViewAngles
proc BotChangeViewAngles 96 16
line 738
;731:}
;732:
;733:/*
;734:==============
;735:BotChangeViewAngles
;736:==============
;737:*/
;738:void BotChangeViewAngles(bot_state_t* bs, float thinktime) {
line 742
;739:	float diff, factor, maxchange, anglespeed, disired_speed;
;740:	int   i;
;741:
;742:	if (bs->ideal_viewangles[PITCH] > 180)
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $357
line 743
;743:		bs->ideal_viewangles[PITCH] -= 360;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $357
line 745
;744:	//
;745:	if (bs->enemy >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
LTI4 $359
line 746
;746:		factor    = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_VIEW_FACTOR, 0.01f, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTF4 1008981770
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 28
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 28
INDIRF4
ASGNF4
line 747
;747:		maxchange = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_VIEW_MAXCHANGE, 1, 1800);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
CNSTF4 1065353216
ARGF4
CNSTF4 1155596288
ARGF4
ADDRLP4 32
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 32
INDIRF4
ASGNF4
line 748
;748:	} else {
ADDRGP4 $360
JUMPV
LABELV $359
line 749
;749:		factor    = 0.05f;
ADDRLP4 16
CNSTF4 1028443341
ASGNF4
line 750
;750:		maxchange = 360;
ADDRLP4 8
CNSTF4 1135869952
ASGNF4
line 751
;751:	}
LABELV $360
line 752
;752:	if (maxchange < 240)
ADDRLP4 8
INDIRF4
CNSTF4 1131413504
GEF4 $361
line 753
;753:		maxchange = 240;
ADDRLP4 8
CNSTF4 1131413504
ASGNF4
LABELV $361
line 754
;754:	maxchange *= thinktime;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRFP4 4
INDIRF4
MULF4
ASGNF4
line 755
;755:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $363
line 757
;756:		//
;757:		if (bot_challenge.integer) {
ADDRGP4 bot_challenge+12
INDIRI4
CNSTI4 0
EQI4 $367
line 759
;758:			// smooth slowdown view model
;759:			diff       = fabs(AngleDifference(bs->viewangles[i], bs->ideal_viewangles[i]));
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 40
INDIRF4
ASGNF4
line 760
;760:			anglespeed = diff * factor;
ADDRLP4 4
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 761
;761:			if (anglespeed > maxchange)
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $370
line 762
;762:				anglespeed = maxchange;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $370
line 763
;763:			bs->viewangles[i] = BotChangeViewAngle(bs->viewangles[i], bs->ideal_viewangles[i], anglespeed);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 48
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 48
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 BotChangeViewAngle
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 48
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
line 764
;764:		} else {
ADDRGP4 $368
JUMPV
LABELV $367
line 766
;765:			// over reaction view model
;766:			bs->viewangles[i]       = AngleMod(bs->viewangles[i]);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 36
INDIRF4
ASGNF4
line 767
;767:			bs->ideal_viewangles[i] = AngleMod(bs->ideal_viewangles[i]);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
ADDRLP4 48
INDIRF4
ASGNF4
line 768
;768:			diff                    = AngleDifference(bs->viewangles[i], bs->ideal_viewangles[i]);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 56
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 56
INDIRP4
CNSTI4 6576
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 60
ADDRGP4 AngleDifference
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 60
INDIRF4
ASGNF4
line 769
;769:			disired_speed           = diff * factor;
ADDRLP4 20
ADDRLP4 12
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ASGNF4
line 770
;770:			bs->viewanglespeed[i] += (bs->viewanglespeed[i] - disired_speed);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
SUBF4
ADDF4
ASGNF4
line 771
;771:			if (bs->viewanglespeed[i] > 180)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $372
line 772
;772:				bs->viewanglespeed[i] = maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $372
line 773
;773:			if (bs->viewanglespeed[i] < -180)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
INDIRF4
CNSTF4 3274964992
GEF4 $374
line 774
;774:				bs->viewanglespeed[i] = -maxchange;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $374
line 775
;775:			anglespeed = bs->viewanglespeed[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
INDIRF4
ASGNF4
line 776
;776:			if (anglespeed > maxchange)
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $376
line 777
;777:				anglespeed = maxchange;
ADDRLP4 4
ADDRLP4 8
INDIRF4
ASGNF4
LABELV $376
line 778
;778:			if (anglespeed < -maxchange)
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
NEGF4
GEF4 $378
line 779
;779:				anglespeed = -maxchange;
ADDRLP4 4
ADDRLP4 8
INDIRF4
NEGF4
ASGNF4
LABELV $378
line 780
;780:			bs->viewangles[i] += anglespeed;
ADDRLP4 76
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 781
;781:			bs->viewangles[i] = AngleMod(bs->viewangles[i]);
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 88
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 84
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 88
INDIRF4
ASGNF4
line 783
;782:			// demping
;783:			bs->viewanglespeed[i] *= 0.45 * (1 - factor);
ADDRLP4 92
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 6588
ADDP4
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDRLP4 16
INDIRF4
SUBF4
CNSTF4 1055286886
MULF4
MULF4
ASGNF4
line 784
;784:		}
LABELV $368
line 787
;785:		// BotAI_Print(PRT_MESSAGE, "ideal_angles %f %f\n", bs->ideal_viewangles[0], bs->ideal_viewangles[1], bs->ideal_viewangles[2]);`
;786:		// bs->viewangles[i] = bs->ideal_viewangles[i];
;787:	}
LABELV $364
line 755
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $363
line 789
;788:	// bs->viewangles[PITCH] = 0;
;789:	if (bs->viewangles[PITCH] > 180)
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $380
line 790
;790:		bs->viewangles[PITCH] -= 360;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $380
line 792
;791:	// elementary action: view
;792:	trap_EA_View(bs->client, bs->viewangles);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRGP4 trap_EA_View
CALLV
pop
line 793
;793:}
LABELV $356
endproc BotChangeViewAngles 96 16
export BotInputToUserCommand
proc BotInputToUserCommand 136 16
line 800
;794:
;795:/*
;796:==============
;797:BotInputToUserCommand
;798:==============
;799:*/
;800:void BotInputToUserCommand(bot_input_t* bi, usercmd_t* ucmd, int delta_angles[3], int time) {
line 807
;801:	vec3_t angles, forward, right;
;802:	short  temp;
;803:	int    j;
;804:	float  f, r, u, m;
;805:
;806:	// clear the whole structure
;807:	memset(ucmd, 0, sizeof(usercmd_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 24
ARGI4
ADDRGP4 memset
CALLP4
pop
line 811
;808:	//
;809:	// Com_Printf("dir = %f %f %f speed = %f\n", bi->dir[0], bi->dir[1], bi->dir[2], bi->speed);
;810:	// the duration for the user command in milli seconds
;811:	ucmd->serverTime = time;
ADDRFP4 4
INDIRP4
ADDRFP4 12
INDIRI4
ASGNI4
line 813
;812:	//
;813:	if (bi->actionflags & ACTION_DELAYEDJUMP) {
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $383
line 814
;814:		bi->actionflags |= ACTION_JUMP;
ADDRLP4 60
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 815
;815:		bi->actionflags &= ~ACTION_DELAYEDJUMP;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 816
;816:	}
LABELV $383
line 818
;817:	// set the buttons
;818:	if (bi->actionflags & ACTION_RESPAWN)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $385
line 819
;819:		ucmd->buttons = BUTTON_ATTACK;
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 1
ASGNI4
LABELV $385
line 820
;820:	if (bi->actionflags & ACTION_ATTACK)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $387
line 821
;821:		ucmd->buttons |= BUTTON_ATTACK;
ADDRLP4 60
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
LABELV $387
line 822
;822:	if (bi->actionflags & ACTION_TALK)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 65536
BANDI4
CNSTI4 0
EQI4 $389
line 823
;823:		ucmd->buttons |= BUTTON_TALK;
ADDRLP4 64
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $389
line 824
;824:	if (bi->actionflags & ACTION_GESTURE)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 131072
BANDI4
CNSTI4 0
EQI4 $391
line 825
;825:		ucmd->buttons |= BUTTON_GESTURE;
ADDRLP4 68
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $391
line 826
;826:	if (bi->actionflags & ACTION_USE)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $393
line 827
;827:		ucmd->buttons |= BUTTON_USE_HOLDABLE;
ADDRLP4 72
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 4
BORI4
ASGNI4
LABELV $393
line 828
;828:	if (bi->actionflags & ACTION_WALK)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 524288
BANDI4
CNSTI4 0
EQI4 $395
line 829
;829:		ucmd->buttons |= BUTTON_WALKING;
ADDRLP4 76
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
LABELV $395
line 830
;830:	if (bi->actionflags & ACTION_AFFIRMATIVE)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 1048576
BANDI4
CNSTI4 0
EQI4 $397
line 831
;831:		ucmd->buttons |= BUTTON_AFFIRMATIVE;
ADDRLP4 80
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 80
INDIRP4
ADDRLP4 80
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
LABELV $397
line 832
;832:	if (bi->actionflags & ACTION_NEGATIVE)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2097152
BANDI4
CNSTI4 0
EQI4 $399
line 833
;833:		ucmd->buttons |= BUTTON_NEGATIVE;
ADDRLP4 84
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
LABELV $399
line 834
;834:	if (bi->actionflags & ACTION_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8388608
BANDI4
CNSTI4 0
EQI4 $401
line 835
;835:		ucmd->buttons |= BUTTON_GETFLAG;
ADDRLP4 88
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
LABELV $401
line 836
;836:	if (bi->actionflags & ACTION_GUARDBASE)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 16777216
BANDI4
CNSTI4 0
EQI4 $403
line 837
;837:		ucmd->buttons |= BUTTON_GUARDBASE;
ADDRLP4 92
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
LABELV $403
line 838
;838:	if (bi->actionflags & ACTION_PATROL)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 33554432
BANDI4
CNSTI4 0
EQI4 $405
line 839
;839:		ucmd->buttons |= BUTTON_PATROL;
ADDRLP4 96
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $405
line 840
;840:	if (bi->actionflags & ACTION_FOLLOWME)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 134217728
BANDI4
CNSTI4 0
EQI4 $407
line 841
;841:		ucmd->buttons |= BUTTON_FOLLOWME;
ADDRLP4 100
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 1024
BORI4
ASGNI4
LABELV $407
line 843
;842:	//
;843:	ucmd->weapon = bi->weapon;
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 846
;844:	// set the view angles
;845:	// NOTE: the ucmd->angles are the angles WITHOUT the delta angles
;846:	ucmd->angles[PITCH] = ANGLE2SHORT(bi->viewangles[PITCH]);
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 847
;847:	ucmd->angles[YAW]   = ANGLE2SHORT(bi->viewangles[YAW]);
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 848
;848:	ucmd->angles[ROLL]  = ANGLE2SHORT(bi->viewangles[ROLL]);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 850
;849:	// subtract the delta angles
;850:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $409
line 851
;851:		temp = ucmd->angles[j] - delta_angles[j];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRI4
SUBI4
CVII2 4
ASGNI2
line 859
;852:		/*NOTE: disabled because temp should be mod first
;853:		if ( j == PITCH ) {
;854:		    // don't let the player look up or down more than 90 degrees
;855:		    if ( temp > 16000 ) temp = 16000;
;856:		    else if ( temp < -16000 ) temp = -16000;
;857:		}
;858:		*/
;859:		ucmd->angles[j] = temp;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDP4
ADDRLP4 4
INDIRI2
CVII4 2
ASGNI4
line 860
;860:	}
LABELV $410
line 850
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $409
line 864
;861:	// NOTE: movement is relative to the REAL view angles
;862:	// get the horizontal forward and right vector
;863:	// get the pitch in the range [-180, 180]
;864:	if (bi->dir[2])
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 0
EQF4 $413
line 865
;865:		angles[PITCH] = bi->viewangles[PITCH];
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
ADDRGP4 $414
JUMPV
LABELV $413
line 867
;866:	else
;867:		angles[PITCH] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
LABELV $414
line 868
;868:	angles[YAW]  = bi->viewangles[YAW];
ADDRLP4 24+4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ASGNF4
line 869
;869:	angles[ROLL] = 0;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 870
;870:	AngleVectors(angles, forward, right, NULL);
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 872
;871:	// bot input speed is in the range [0, 400]
;872:	bi->speed = bi->speed * 127 / 400;
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 104
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
CNSTF4 1050840924
MULF4
ASGNF4
line 875
;873:
;874:	// set the view independent movement
;875:	f = DotProduct(forward, bi->dir);
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 12
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 876
;876:	r = DotProduct(right, bi->dir);
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
ADDRLP4 36
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 36+4
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 36+8
INDIRF4
ADDRLP4 112
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 877
;877:	u = fabs(forward[2]) * bi->dir[2];
ADDRLP4 12+8
INDIRF4
ARGF4
ADDRLP4 116
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 52
ADDRLP4 116
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
MULF4
ASGNF4
line 878
;878:	m = fabs(f);
ADDRLP4 56
INDIRF4
ARGF4
ADDRLP4 120
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 120
INDIRF4
ASGNF4
line 880
;879:
;880:	if (fabs(r) > m) {
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 124
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 124
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $422
line 881
;881:		m = fabs(r);
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 128
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 128
INDIRF4
ASGNF4
line 882
;882:	}
LABELV $422
line 884
;883:
;884:	if (fabs(u) > m) {
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 128
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 128
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $424
line 885
;885:		m = fabs(u);
ADDRLP4 52
INDIRF4
ARGF4
ADDRLP4 132
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 132
INDIRF4
ASGNF4
line 886
;886:	}
LABELV $424
line 888
;887:
;888:	if (m > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $426
line 889
;889:		f *= bi->speed / m;
ADDRLP4 56
ADDRLP4 56
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
MULF4
ASGNF4
line 890
;890:		r *= bi->speed / m;
ADDRLP4 48
ADDRLP4 48
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
MULF4
ASGNF4
line 891
;891:		u *= bi->speed / m;
ADDRLP4 52
ADDRLP4 52
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
DIVF4
MULF4
ASGNF4
line 892
;892:	}
LABELV $426
line 894
;893:
;894:	ucmd->forwardmove = f;
ADDRFP4 4
INDIRP4
CNSTI4 21
ADDP4
ADDRLP4 56
INDIRF4
CVFI4 4
CVII1 4
ASGNI1
line 895
;895:	ucmd->rightmove   = r;
ADDRFP4 4
INDIRP4
CNSTI4 22
ADDP4
ADDRLP4 48
INDIRF4
CVFI4 4
CVII1 4
ASGNI1
line 896
;896:	ucmd->upmove      = u;
ADDRFP4 4
INDIRP4
CNSTI4 23
ADDP4
ADDRLP4 52
INDIRF4
CVFI4 4
CVII1 4
ASGNI1
line 898
;897:
;898:	if (bi->actionflags & ACTION_MOVEFORWARD)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $428
line 899
;899:		ucmd->forwardmove = 127;
ADDRFP4 4
INDIRP4
CNSTI4 21
ADDP4
CNSTI1 127
ASGNI1
LABELV $428
line 900
;900:	if (bi->actionflags & ACTION_MOVEBACK)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $430
line 901
;901:		ucmd->forwardmove = -127;
ADDRFP4 4
INDIRP4
CNSTI4 21
ADDP4
CNSTI1 -127
ASGNI1
LABELV $430
line 902
;902:	if (bi->actionflags & ACTION_MOVELEFT)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $432
line 903
;903:		ucmd->rightmove = -127;
ADDRFP4 4
INDIRP4
CNSTI4 22
ADDP4
CNSTI1 -127
ASGNI1
LABELV $432
line 904
;904:	if (bi->actionflags & ACTION_MOVERIGHT)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $434
line 905
;905:		ucmd->rightmove = 127;
ADDRFP4 4
INDIRP4
CNSTI4 22
ADDP4
CNSTI1 127
ASGNI1
LABELV $434
line 907
;906:	// jump/moveup
;907:	if (bi->actionflags & ACTION_JUMP)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $436
line 908
;908:		ucmd->upmove = 127;
ADDRFP4 4
INDIRP4
CNSTI4 23
ADDP4
CNSTI1 127
ASGNI1
LABELV $436
line 910
;909:	// crouch/movedown
;910:	if (bi->actionflags & ACTION_CROUCH)
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $438
line 911
;911:		ucmd->upmove = -127;
ADDRFP4 4
INDIRP4
CNSTI4 23
ADDP4
CNSTI1 -127
ASGNI1
LABELV $438
line 912
;912:}
LABELV $382
endproc BotInputToUserCommand 136 16
export BotUpdateInput
proc BotUpdateInput 60 16
line 919
;913:
;914:/*
;915:==============
;916:BotUpdateInput
;917:==============
;918:*/
;919:void BotUpdateInput(bot_state_t* bs, int time, int elapsed_time) {
line 924
;920:	bot_input_t bi;
;921:	int         j;
;922:
;923:	// add the delta angles to the bot's current view angles
;924:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $441
line 925
;925:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 48
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 48
INDIRP4
CNSTI4 72
ADDP4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1001652224
MULF4
ADDF4
ARGF4
ADDRLP4 52
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 48
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 52
INDIRF4
ASGNF4
line 926
;926:	}
LABELV $442
line 924
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $441
line 928
;927:	// change the bot view angles
;928:	BotChangeViewAngles(bs, (float)elapsed_time / 1000);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRGP4 BotChangeViewAngles
CALLV
pop
line 930
;929:	// retrieve the bot input
;930:	trap_EA_GetInput(bs->client, (float)time / 1000, &bi);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRLP4 4
ARGP4
ADDRGP4 trap_EA_GetInput
CALLV
pop
line 932
;931:	// respawn hack
;932:	if (bi.actionflags & ACTION_RESPAWN) {
ADDRLP4 4+32
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $445
line 933
;933:		if (bs->lastucmd.buttons & BUTTON_ATTACK)
ADDRFP4 0
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $448
line 934
;934:			bi.actionflags &= ~(ACTION_RESPAWN | ACTION_ATTACK);
ADDRLP4 4+32
ADDRLP4 4+32
INDIRI4
CNSTI4 -10
BANDI4
ASGNI4
LABELV $448
line 935
;935:	}
LABELV $445
line 937
;936:	// convert the bot input to a usercmd
;937:	BotInputToUserCommand(&bi, &bs->lastucmd, bs->cur_ps.delta_angles, time);
ADDRLP4 4
ARGP4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 44
INDIRP4
CNSTI4 72
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BotInputToUserCommand
CALLV
pop
line 939
;938:	// subtract the delta angles
;939:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $451
line 940
;940:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 52
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 52
INDIRP4
CNSTI4 72
ADDP4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1001652224
MULF4
SUBF4
ARGF4
ADDRLP4 56
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 52
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 56
INDIRF4
ASGNF4
line 941
;941:	}
LABELV $452
line 939
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $451
line 942
;942:}
LABELV $440
endproc BotUpdateInput 60 16
export BotAIRegularUpdate
proc BotAIRegularUpdate 0 0
line 949
;943:
;944:/*
;945:==============
;946:BotAIRegularUpdate
;947:==============
;948:*/
;949:void BotAIRegularUpdate(void) {
line 950
;950:	if (regularupdate_time < FloatTime()) {
ADDRGP4 regularupdate_time
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $456
line 951
;951:		trap_BotUpdateEntityItems();
ADDRGP4 trap_BotUpdateEntityItems
CALLV
pop
line 952
;952:		regularupdate_time = FloatTime() + 0.3;
ADDRGP4 regularupdate_time
ADDRGP4 floattime
INDIRF4
CNSTF4 1050253722
ADDF4
ASGNF4
line 953
;953:	}
LABELV $456
line 954
;954:}
LABELV $455
endproc BotAIRegularUpdate 0 0
export RemoveColorEscapeSequences
proc RemoveColorEscapeSequences 20 0
line 961
;955:
;956:/*
;957:==============
;958:RemoveColorEscapeSequences
;959:==============
;960:*/
;961:void RemoveColorEscapeSequences(char* text) {
line 964
;962:	int i, l;
;963:
;964:	l = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 965
;965:	for (i = 0; text[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $462
JUMPV
LABELV $459
line 966
;966:		if (Q_IsColorString(&text[i])) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $463
ADDRLP4 8
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $463
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $463
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $463
line 967
;967:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 968
;968:			continue;
ADDRGP4 $460
JUMPV
LABELV $463
line 970
;969:		}
;970:		if (text[i] > 0x7E)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 126
LEI4 $465
line 971
;971:			continue;
ADDRGP4 $460
JUMPV
LABELV $465
line 972
;972:		text[l++] = text[i];
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 973
;973:	}
LABELV $460
line 965
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $462
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $459
line 974
;974:	text[l] = '\0';
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 975
;975:}
LABELV $458
endproc RemoveColorEscapeSequences 20 0
export BotAI
proc BotAI 1088 12
line 982
;976:
;977:/*
;978:==============
;979:BotAI
;980:==============
;981:*/
;982:int BotAI(int client, float thinktime) {
line 987
;983:	bot_state_t* bs;
;984:	char         buf[1024], *args;
;985:	int          j;
;986:
;987:	trap_EA_ResetInput(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 trap_EA_ResetInput
CALLV
pop
line 989
;988:	//
;989:	bs = botstates[client];
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 990
;990:	if (!bs || !bs->inuse) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $470
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $468
LABELV $470
line 991
;991:		BotAI_Print(PRT_FATAL, "BotAI: client %d is not setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $471
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 992
;992:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $467
JUMPV
LABELV $468
line 996
;993:	}
;994:
;995:	// retrieve the current client state
;996:	BotAI_GetClientState(client, &bs->cur_ps);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
ADDRGP4 $473
JUMPV
LABELV $472
line 999
;997:
;998:	// retrieve any waiting server commands
;999:	while (trap_BotGetServerCommand(client, buf, sizeof(buf))) {
line 1001
;1000:		// have buf point to the command and args to the command arguments
;1001:		args = strchr(buf, ' ');
ADDRLP4 12
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 1040
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1040
INDIRP4
ASGNP4
line 1002
;1002:		if (!args)
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $475
line 1003
;1003:			continue;
ADDRGP4 $473
JUMPV
LABELV $475
line 1004
;1004:		*args++ = '\0';
ADDRLP4 1044
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 1044
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI1 0
ASGNI1
line 1007
;1005:
;1006:		// remove color espace sequences from the arguments
;1007:		RemoveColorEscapeSequences(args);
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 RemoveColorEscapeSequences
CALLV
pop
line 1009
;1008:
;1009:		if (!Q_stricmp(buf, "cp ")) {       /*CenterPrintf*/
ADDRLP4 12
ARGP4
ADDRGP4 $479
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $477
line 1010
;1010:		} else if (!Q_stricmp(buf, "cs")) { /*ConfigStringModified*/
ADDRGP4 $478
JUMPV
LABELV $477
ADDRLP4 12
ARGP4
ADDRGP4 $482
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $480
line 1011
;1011:		} else if (!Q_stricmp(buf, "print")) {
ADDRGP4 $481
JUMPV
LABELV $480
ADDRLP4 12
ARGP4
ADDRGP4 $485
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $483
line 1013
;1012:			// remove first and last quote from the chat message
;1013:			memmove(args, args + 1, strlen(args));
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1060
INDIRI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1014
;1014:			args[strlen(args) - 1] = '\0';
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1015
;1015:			trap_BotQueueConsoleMessage(bs->cs, CMS_NORMAL, args);
ADDRLP4 4
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 1016
;1016:		} else if (!Q_stricmp(buf, "chat")) {
ADDRGP4 $484
JUMPV
LABELV $483
ADDRLP4 12
ARGP4
ADDRGP4 $488
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $486
line 1018
;1017:			// remove first and last quote from the chat message
;1018:			memmove(args, args + 1, strlen(args));
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1064
INDIRI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1019
;1019:			args[strlen(args) - 1] = '\0';
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1020
;1020:			trap_BotQueueConsoleMessage(bs->cs, CMS_CHAT, args);
ADDRLP4 4
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 1021
;1021:		} else if (!Q_stricmp(buf, "tchat")) {
ADDRGP4 $487
JUMPV
LABELV $486
ADDRLP4 12
ARGP4
ADDRGP4 $491
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $489
line 1023
;1022:			// remove first and last quote from the chat message
;1023:			memmove(args, args + 1, strlen(args));
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1068
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 1068
INDIRI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1024
;1024:			args[strlen(args) - 1] = '\0';
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1076
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 8
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 1025
;1025:			trap_BotQueueConsoleMessage(bs->cs, CMS_CHAT, args);
ADDRLP4 4
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 1026
;1026:		}
ADDRGP4 $490
JUMPV
LABELV $489
line 1036
;1027:#ifdef MISSIONPACK
;1028:		else if (!Q_stricmp(buf, "vchat")) {
;1029:			BotVoiceChatCommand(bs, SAY_ALL, args);
;1030:		} else if (!Q_stricmp(buf, "vtchat")) {
;1031:			BotVoiceChatCommand(bs, SAY_TEAM, args);
;1032:		} else if (!Q_stricmp(buf, "vtell")) {
;1033:			BotVoiceChatCommand(bs, SAY_TELL, args);
;1034:		}
;1035:#endif
;1036:		else if (!Q_stricmp(buf, "scores")) {            /*FIXME: parse scores?*/
ADDRLP4 12
ARGP4
ADDRGP4 $494
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $492
line 1037
;1037:		} else if (!Q_stricmp(buf, "clientLevelShot")) { /*ignore*/
ADDRGP4 $493
JUMPV
LABELV $492
ADDRLP4 12
ARGP4
ADDRGP4 $497
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $495
line 1038
;1038:		}
LABELV $495
LABELV $493
LABELV $490
LABELV $487
LABELV $484
LABELV $481
LABELV $478
line 1039
;1039:	}
LABELV $473
line 999
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1040
ADDRGP4 trap_BotGetServerCommand
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $472
line 1041
;1040:	// add the delta angles to the bot's current view angles
;1041:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $498
line 1042
;1042:		bs->viewangles[j] = AngleMod(bs->viewangles[j] + SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1001652224
MULF4
ADDF4
ARGF4
ADDRLP4 1052
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 1052
INDIRF4
ASGNF4
line 1043
;1043:	}
LABELV $499
line 1041
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $498
line 1045
;1044:	// increase the local time of the bot
;1045:	bs->ltime += thinktime;
ADDRLP4 1044
ADDRLP4 4
INDIRP4
CNSTI4 6060
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRF4
ADDRFP4 4
INDIRF4
ADDF4
ASGNF4
line 1047
;1046:	//
;1047:	bs->thinktime = thinktime;
ADDRLP4 4
INDIRP4
CNSTI4 4904
ADDP4
ADDRFP4 4
INDIRF4
ASGNF4
line 1049
;1048:	// origin of the bot
;1049:	VectorCopy(bs->cur_ps.origin, bs->origin);
ADDRLP4 4
INDIRP4
CNSTI4 4908
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1051
;1050:	// eye coordinates of the bot
;1051:	VectorCopy(bs->cur_ps.origin, bs->eye);
ADDRLP4 4
INDIRP4
CNSTI4 4936
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1052
;1052:	bs->eye[2] += bs->cur_ps.viewheight;
ADDRLP4 1060
ADDRLP4 4
INDIRP4
CNSTI4 4944
ADDP4
ASGNP4
ADDRLP4 1060
INDIRP4
ADDRLP4 1060
INDIRP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1054
;1053:	// get the area the bot is in
;1054:	bs->areanum = BotPointAreaNum(bs->origin);
ADDRLP4 4
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 1068
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 4948
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 1056
;1055:	// the real AI
;1056:	BotDeathmatchAI(bs, thinktime);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 BotDeathmatchAI
CALLV
pop
line 1058
;1057:	// set the weapon selection every AI frame
;1058:	trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1060
;1059:	// subtract the delta angles
;1060:	for (j = 0; j < 3; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $502
line 1061
;1061:		bs->viewangles[j] = AngleMod(bs->viewangles[j] - SHORT2ANGLE(bs->cur_ps.delta_angles[j]));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1001652224
MULF4
SUBF4
ARGF4
ADDRLP4 1084
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 6564
ADDP4
ADDP4
ADDRLP4 1084
INDIRF4
ASGNF4
line 1062
;1062:	}
LABELV $503
line 1060
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $502
line 1064
;1063:	// everything was ok
;1064:	return qtrue;
CNSTI4 1
RETI4
LABELV $467
endproc BotAI 1088 12
export BotScheduleBotThink
proc BotScheduleBotThink 16 0
line 1072
;1065:}
;1066:
;1067:/*
;1068:==================
;1069:BotScheduleBotThink
;1070:==================
;1071:*/
;1072:void BotScheduleBotThink(void) {
line 1075
;1073:	int i, botnum;
;1074:
;1075:	botnum = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 1077
;1076:
;1077:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $507
line 1078
;1078:		if (!botstates[i] || !botstates[i]->inuse) {
ADDRLP4 12
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $513
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $511
LABELV $513
line 1079
;1079:			continue;
ADDRGP4 $508
JUMPV
LABELV $511
line 1082
;1080:		}
;1081:		// initialize the bot think residual time
;1082:		botstates[i]->botthink_residual = bot_thinktime.integer * botnum / numbots;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ADDRGP4 bot_thinktime+12
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ADDRGP4 numbots
INDIRI4
DIVI4
ASGNI4
line 1083
;1083:		botnum++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1084
;1084:	}
LABELV $508
line 1077
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $507
line 1085
;1085:}
LABELV $506
endproc BotScheduleBotThink 16 0
export BotWriteSessionData
proc BotWriteSessionData 20 72
line 1092
;1086:
;1087:/*
;1088:==============
;1089:BotWriteSessionData
;1090:==============
;1091:*/
;1092:void BotWriteSessionData(bot_state_t* bs) {
line 1096
;1093:	const char* s;
;1094:	const char* var;
;1095:
;1096:	s =
ADDRGP4 $516
ARGP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6756
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6764
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6780
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6808
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6816
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6820
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6812
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6768
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6772
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6776
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6784
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6788
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6792
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6796
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6800
ADDP4
INDIRF4
ARGF4
ADDRLP4 8
INDIRP4
CNSTI4 6804
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 1106
;1097:		va("%i %i %i %i %i %i %i %i"
;1098:	       " %f %f %f"
;1099:	       " %f %f %f"
;1100:	       " %f %f %f",
;1101:	       bs->lastgoal_decisionmaker, bs->lastgoal_ltgtype, bs->lastgoal_teammate, bs->lastgoal_teamgoal.areanum, bs->lastgoal_teamgoal.entitynum,
;1102:	       bs->lastgoal_teamgoal.flags, bs->lastgoal_teamgoal.iteminfo, bs->lastgoal_teamgoal.number, bs->lastgoal_teamgoal.origin[0],
;1103:	       bs->lastgoal_teamgoal.origin[1], bs->lastgoal_teamgoal.origin[2], bs->lastgoal_teamgoal.mins[0], bs->lastgoal_teamgoal.mins[1],
;1104:	       bs->lastgoal_teamgoal.mins[2], bs->lastgoal_teamgoal.maxs[0], bs->lastgoal_teamgoal.maxs[1], bs->lastgoal_teamgoal.maxs[2]);
;1105:
;1106:	var = va("botsession%i", bs->client);
ADDRGP4 $517
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 1108
;1107:
;1108:	trap_Cvar_Set(var, s);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1109
;1109:}
LABELV $515
endproc BotWriteSessionData 20 72
export BotReadSessionData
proc BotReadSessionData 1036 76
line 1116
;1110:
;1111:/*
;1112:==============
;1113:BotReadSessionData
;1114:==============
;1115:*/
;1116:void BotReadSessionData(bot_state_t* bs) {
line 1120
;1117:	char        s[MAX_STRING_CHARS];
;1118:	const char* var;
;1119:
;1120:	var = va("botsession%i", bs->client);
ADDRGP4 $517
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1028
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1028
INDIRP4
ASGNP4
line 1121
;1121:	trap_Cvar_VariableStringBuffer(var, s, sizeof(s));
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1123
;1122:
;1123:	Q_sscanf(
ADDRLP4 0
ARGP4
ADDRGP4 $516
ARGP4
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CNSTI4 6756
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6760
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6764
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6780
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6808
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6816
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6820
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6812
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6768
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6772
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6776
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6784
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6788
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6792
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6796
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6800
ADDP4
ARGP4
ADDRLP4 1032
INDIRP4
CNSTI4 6804
ADDP4
ARGP4
ADDRGP4 Q_sscanf
CALLI4
pop
line 1133
;1124:		s,
;1125:		"%i %i %i %i %i %i %i %i"
;1126:		" %f %f %f"
;1127:		" %f %f %f"
;1128:		" %f %f %f",
;1129:		&bs->lastgoal_decisionmaker, &bs->lastgoal_ltgtype, &bs->lastgoal_teammate, &bs->lastgoal_teamgoal.areanum, &bs->lastgoal_teamgoal.entitynum,
;1130:		&bs->lastgoal_teamgoal.flags, &bs->lastgoal_teamgoal.iteminfo, &bs->lastgoal_teamgoal.number, &bs->lastgoal_teamgoal.origin[0],
;1131:		&bs->lastgoal_teamgoal.origin[1], &bs->lastgoal_teamgoal.origin[2], &bs->lastgoal_teamgoal.mins[0], &bs->lastgoal_teamgoal.mins[1],
;1132:		&bs->lastgoal_teamgoal.mins[2], &bs->lastgoal_teamgoal.maxs[0], &bs->lastgoal_teamgoal.maxs[1], &bs->lastgoal_teamgoal.maxs[2]);
;1133:}
LABELV $518
endproc BotReadSessionData 1036 76
export BotAISetupClient
proc BotAISetupClient 512 16
line 1140
;1134:
;1135:/*
;1136:==============
;1137:BotAISetupClient
;1138:==============
;1139:*/
;1140:qboolean BotAISetupClient(int client, struct bot_settings_s* settings, qboolean restart) {
line 1145
;1141:	char         filename[MAX_PATH], name[MAX_PATH], gender[MAX_PATH];
;1142:	bot_state_t* bs;
;1143:	int          errnum;
;1144:
;1145:	if (!botstates[client])
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $520
line 1146
;1146:		botstates[client] = G_Alloc(sizeof(bot_state_t));
CNSTI4 9092
ARGI4
ADDRLP4 440
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
ADDRLP4 440
INDIRP4
ASGNP4
LABELV $520
line 1147
;1147:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1148
;1148:	if (bs == NULL) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $522
line 1149
;1149:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $519
JUMPV
LABELV $522
line 1152
;1150:	}
;1151:
;1152:	if (bs && bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $524
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $524
line 1153
;1153:		BotAI_Print(PRT_FATAL, "BotAISetupClient: client %d already setup\n", client);
CNSTI4 4
ARGI4
ADDRGP4 $526
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 1154
;1154:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $519
JUMPV
LABELV $524
line 1157
;1155:	}
;1156:
;1157:	if (!trap_AAS_Initialized()) {
ADDRLP4 448
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 448
INDIRI4
CNSTI4 0
NEI4 $527
line 1158
;1158:		BotAI_Print(PRT_FATAL, "AAS not initialized\n");
CNSTI4 4
ARGI4
ADDRGP4 $529
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1159
;1159:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $519
JUMPV
LABELV $527
line 1163
;1160:	}
;1161:
;1162:	// load the bot character
;1163:	bs->character = trap_BotLoadCharacter(settings->characterfile, settings->skill);
ADDRLP4 452
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 452
INDIRP4
ARGP4
ADDRLP4 452
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
ARGF4
ADDRLP4 456
ADDRGP4 trap_BotLoadCharacter
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
ADDRLP4 456
INDIRI4
ASGNI4
line 1164
;1164:	if (!bs->character) {
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $530
line 1165
;1165:		BotAI_Print(PRT_FATAL, "couldn't load skill %f from %s\n", settings->skill, settings->characterfile);
CNSTI4 4
ARGI4
ADDRGP4 $532
ARGP4
ADDRLP4 460
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 460
INDIRP4
CNSTI4 144
ADDP4
INDIRF4
ARGF4
ADDRLP4 460
INDIRP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1166
;1166:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $519
JUMPV
LABELV $530
line 1169
;1167:	}
;1168:	// copy the settings
;1169:	memcpy(&bs->settings, settings, sizeof(bot_settings_t));
ADDRLP4 0
INDIRP4
CNSTI4 4608
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1171
;1170:	// allocate a goal state
;1171:	bs->gs = trap_BotAllocGoalState(client);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 460
ADDRGP4 trap_BotAllocGoalState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
ADDRLP4 460
INDIRI4
ASGNI4
line 1173
;1172:	// load the item weights
;1173:	trap_Characteristic_String(bs->character, CHARACTERISTIC_ITEMWEIGHTS, filename, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 40
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1174
;1174:	errnum = trap_BotLoadItemWeights(bs->gs, filename);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 464
ADDRGP4 trap_BotLoadItemWeights
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 464
INDIRI4
ASGNI4
line 1175
;1175:	if (errnum != BLERR_NOERROR) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $533
line 1176
;1176:		trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1177
;1177:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $519
JUMPV
LABELV $533
line 1180
;1178:	}
;1179:	// allocate a weapon state
;1180:	bs->ws = trap_BotAllocWeaponState();
ADDRLP4 468
ADDRGP4 trap_BotAllocWeaponState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
ADDRLP4 468
INDIRI4
ASGNI4
line 1182
;1181:	// load the weapon weights
;1182:	trap_Characteristic_String(bs->character, CHARACTERISTIC_WEAPONWEIGHTS, filename, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1183
;1183:	errnum = trap_BotLoadWeaponWeights(bs->ws, filename);
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 472
ADDRGP4 trap_BotLoadWeaponWeights
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 472
INDIRI4
ASGNI4
line 1184
;1184:	if (errnum != BLERR_NOERROR) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $535
line 1185
;1185:		trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1186
;1186:		trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 1187
;1187:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $519
JUMPV
LABELV $535
line 1190
;1188:	}
;1189:	// allocate a chat state
;1190:	bs->cs = trap_BotAllocChatState();
ADDRLP4 476
ADDRGP4 trap_BotAllocChatState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
ADDRLP4 476
INDIRI4
ASGNI4
line 1192
;1191:	// load the chat file
;1192:	trap_Characteristic_String(bs->character, CHARACTERISTIC_CHAT_FILE, filename, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 21
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1193
;1193:	trap_Characteristic_String(bs->character, CHARACTERISTIC_CHAT_NAME, name, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 22
ARGI4
ADDRLP4 296
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1194
;1194:	errnum = trap_BotLoadChatFile(bs->cs, filename, name);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 296
ARGP4
ADDRLP4 480
ADDRGP4 trap_BotLoadChatFile
CALLI4
ASGNI4
ADDRLP4 148
ADDRLP4 480
INDIRI4
ASGNI4
line 1195
;1195:	if (errnum != BLERR_NOERROR) {
ADDRLP4 148
INDIRI4
CNSTI4 0
EQI4 $537
line 1196
;1196:		trap_BotFreeChatState(bs->cs);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeChatState
CALLV
pop
line 1197
;1197:		trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1198
;1198:		trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 1199
;1199:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $519
JUMPV
LABELV $537
line 1202
;1200:	}
;1201:	// get the gender characteristic
;1202:	trap_Characteristic_String(bs->character, CHARACTERISTIC_GENDER, gender, MAX_PATH);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 152
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 1204
;1203:	// set the chat gender
;1204:	if (*gender == 'f' || *gender == 'F')
ADDRLP4 484
ADDRLP4 152
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 484
INDIRI4
CNSTI4 102
EQI4 $541
ADDRLP4 484
INDIRI4
CNSTI4 70
NEI4 $539
LABELV $541
line 1205
;1205:		trap_BotSetChatGender(bs->cs, CHAT_GENDERFEMALE);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $540
JUMPV
LABELV $539
line 1206
;1206:	else if (*gender == 'm' || *gender == 'M')
ADDRLP4 488
ADDRLP4 152
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 488
INDIRI4
CNSTI4 109
EQI4 $544
ADDRLP4 488
INDIRI4
CNSTI4 77
NEI4 $542
LABELV $544
line 1207
;1207:		trap_BotSetChatGender(bs->cs, CHAT_GENDERMALE);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
ADDRGP4 $543
JUMPV
LABELV $542
line 1209
;1208:	else
;1209:		trap_BotSetChatGender(bs->cs, CHAT_GENDERLESS);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotSetChatGender
CALLV
pop
LABELV $543
LABELV $540
line 1211
;1210:
;1211:	bs->inuse          = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 1
ASGNI4
line 1212
;1212:	bs->client         = client;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1213
;1213:	bs->entitynum      = client;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1214
;1214:	bs->setupcount     = 4;
ADDRLP4 0
INDIRP4
CNSTI4 6016
ADDP4
CNSTI4 4
ASGNI4
line 1215
;1215:	bs->entergame_time = FloatTime();
ADDRLP4 0
INDIRP4
CNSTI4 6064
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1216
;1216:	bs->ms             = trap_BotAllocMoveState();
ADDRLP4 492
ADDRGP4 trap_BotAllocMoveState
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 6524
ADDP4
ADDRLP4 492
INDIRI4
ASGNI4
line 1217
;1217:	bs->walker         = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_WALKER, 0, 1);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 48
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 500
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 6056
ADDP4
ADDRLP4 500
INDIRF4
ASGNF4
line 1218
;1218:	numbots++;
ADDRLP4 504
ADDRGP4 numbots
ASGNP4
ADDRLP4 504
INDIRP4
ADDRLP4 504
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1220
;1219:
;1220:	if (trap_Cvar_VariableIntegerValue("bot_testichat")) {
ADDRGP4 $547
ARGP4
ADDRLP4 508
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 508
INDIRI4
CNSTI4 0
EQI4 $545
line 1221
;1221:		trap_BotLibVarSet("bot_testichat", "1");
ADDRGP4 $547
ARGP4
ADDRGP4 $316
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1222
;1222:		BotChatTest(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotChatTest
CALLV
pop
line 1223
;1223:	}
LABELV $545
line 1225
;1224:	// NOTE: reschedule the bot thinking
;1225:	BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 1227
;1226:	// if interbreeding start with a mutation
;1227:	if (bot_interbreed) {
ADDRGP4 bot_interbreed
INDIRI4
CNSTI4 0
EQI4 $548
line 1228
;1228:		trap_BotMutateGoalFuzzyLogic(bs->gs, 1);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_BotMutateGoalFuzzyLogic
CALLV
pop
line 1229
;1229:	}
LABELV $548
line 1231
;1230:	// if we kept the bot client
;1231:	if (restart) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $550
line 1232
;1232:		BotReadSessionData(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotReadSessionData
CALLV
pop
line 1233
;1233:	}
LABELV $550
line 1235
;1234:	// bot has been setup succesfully
;1235:	return qtrue;
CNSTI4 1
RETI4
LABELV $519
endproc BotAISetupClient 512 16
export BotAIShutdownClient
proc BotAIShutdownClient 16 12
line 1243
;1236:}
;1237:
;1238:/*
;1239:==============
;1240:BotAIShutdownClient
;1241:==============
;1242:*/
;1243:int BotAIShutdownClient(int client, qboolean restart) {
line 1246
;1244:	bot_state_t* bs;
;1245:
;1246:	bs = botstates[client];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ASGNP4
line 1247
;1247:	if (!bs || !bs->inuse) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $555
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $553
LABELV $555
line 1249
;1248:		// BotAI_Print(PRT_ERROR, "BotAIShutdownClient: client %d already shutdown\n", client);
;1249:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $552
JUMPV
LABELV $553
line 1252
;1250:	}
;1251:
;1252:	if (restart) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $556
line 1253
;1253:		BotWriteSessionData(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotWriteSessionData
CALLV
pop
line 1254
;1254:	}
LABELV $556
line 1256
;1255:
;1256:	if (BotChat_ExitGame(bs)) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotChat_ExitGame
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $558
line 1257
;1257:		trap_BotEnterChat(bs->cs, bs->client, CHAT_ALL);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1258
;1258:	}
LABELV $558
line 1260
;1259:
;1260:	trap_BotFreeMoveState(bs->ms);
ADDRLP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeMoveState
CALLV
pop
line 1262
;1261:	// free the goal state
;1262:	trap_BotFreeGoalState(bs->gs);
ADDRLP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeGoalState
CALLV
pop
line 1264
;1263:	// free the chat file
;1264:	trap_BotFreeChatState(bs->cs);
ADDRLP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeChatState
CALLV
pop
line 1266
;1265:	// free the weapon weights
;1266:	trap_BotFreeWeaponState(bs->ws);
ADDRLP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeWeaponState
CALLV
pop
line 1268
;1267:	// free the bot character
;1268:	trap_BotFreeCharacter(bs->character);
ADDRLP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotFreeCharacter
CALLV
pop
line 1270
;1269:	//
;1270:	BotFreeWaypoints(bs->checkpoints);
ADDRLP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1271
;1271:	BotFreeWaypoints(bs->patrolpoints);
ADDRLP4 0
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1273
;1272:	// clear activate goal stack
;1273:	BotClearActivateGoalStack(bs);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 BotClearActivateGoalStack
CALLV
pop
line 1275
;1274:	// clear the bot state
;1275:	memset(bs, 0, sizeof(bot_state_t));
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 9092
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1277
;1276:	// set the inuse flag to qfalse
;1277:	bs->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1279
;1278:	// there's one bot less
;1279:	numbots--;
ADDRLP4 12
ADDRGP4 numbots
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1281
;1280:	// everything went ok
;1281:	return qtrue;
CNSTI4 1
RETI4
LABELV $552
endproc BotAIShutdownClient 16 12
export BotResetState
proc BotResetState 796 12
line 1292
;1282:}
;1283:
;1284:/*
;1285:==============
;1286:BotResetState
;1287:
;1288:called when a bot enters the intermission or observer mode and
;1289:when the level is changed
;1290:==============
;1291:*/
;1292:void BotResetState(bot_state_t* bs) {
line 1301
;1293:	int            client, entitynum, inuse;
;1294:	int            movestate, goalstate, chatstate, weaponstate;
;1295:	bot_settings_t settings;
;1296:	int            character;
;1297:	playerState_t  ps;  // current player state
;1298:	float          entergame_time;
;1299:
;1300:	// save some things that should not be reset here
;1301:	memcpy(&settings, &bs->settings, sizeof(bot_settings_t));
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4608
ADDP4
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1302
;1302:	memcpy(&ps, &bs->cur_ps, sizeof(playerState_t));
ADDRLP4 324
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
CNSTI4 468
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1303
;1303:	inuse          = bs->inuse;
ADDRLP4 8
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1304
;1304:	client         = bs->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1305
;1305:	entitynum      = bs->entitynum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1306
;1306:	character      = bs->character;
ADDRLP4 320
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ASGNI4
line 1307
;1307:	movestate      = bs->ms;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ASGNI4
line 1308
;1308:	goalstate      = bs->gs;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ASGNI4
line 1309
;1309:	chatstate      = bs->cs;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ASGNI4
line 1310
;1310:	weaponstate    = bs->ws;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ASGNI4
line 1311
;1311:	entergame_time = bs->entergame_time;
ADDRLP4 792
ADDRFP4 0
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
ASGNF4
line 1313
;1312:	// free checkpoints and patrol points
;1313:	BotFreeWaypoints(bs->checkpoints);
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1314
;1314:	BotFreeWaypoints(bs->patrolpoints);
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 1316
;1315:	// reset the whole state
;1316:	memset(bs, 0, sizeof(bot_state_t));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 9092
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1318
;1317:	// copy back some state stuff that should not be reset
;1318:	bs->ms = movestate;
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 1319
;1319:	bs->gs = goalstate;
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 1320
;1320:	bs->cs = chatstate;
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 1321
;1321:	bs->ws = weaponstate;
ADDRFP4 0
INDIRP4
CNSTI4 6536
ADDP4
ADDRLP4 24
INDIRI4
ASGNI4
line 1322
;1322:	memcpy(&bs->cur_ps, &ps, sizeof(playerState_t));
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ARGP4
ADDRLP4 324
ARGP4
CNSTI4 468
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1323
;1323:	memcpy(&bs->settings, &settings, sizeof(bot_settings_t));
ADDRFP4 0
INDIRP4
CNSTI4 4608
ADDP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 292
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1324
;1324:	bs->inuse          = inuse;
ADDRFP4 0
INDIRP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1325
;1325:	bs->client         = client;
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1326
;1326:	bs->entitynum      = entitynum;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1327
;1327:	bs->character      = character;
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
ADDRLP4 320
INDIRI4
ASGNI4
line 1328
;1328:	bs->entergame_time = entergame_time;
ADDRFP4 0
INDIRP4
CNSTI4 6064
ADDP4
ADDRLP4 792
INDIRF4
ASGNF4
line 1330
;1329:	// reset several states
;1330:	if (bs->ms)
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $561
line 1331
;1331:		trap_BotResetMoveState(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetMoveState
CALLV
pop
LABELV $561
line 1332
;1332:	if (bs->gs)
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $563
line 1333
;1333:		trap_BotResetGoalState(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetGoalState
CALLV
pop
LABELV $563
line 1334
;1334:	if (bs->ws)
ADDRFP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
CNSTI4 0
EQI4 $565
line 1335
;1335:		trap_BotResetWeaponState(bs->ws);
ADDRFP4 0
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetWeaponState
CALLV
pop
LABELV $565
line 1336
;1336:	if (bs->gs)
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
CNSTI4 0
EQI4 $567
line 1337
;1337:		trap_BotResetAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidGoals
CALLV
pop
LABELV $567
line 1338
;1338:	if (bs->ms)
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
CNSTI4 0
EQI4 $569
line 1339
;1339:		trap_BotResetAvoidReach(bs->ms);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotResetAvoidReach
CALLV
pop
LABELV $569
line 1340
;1340:}
LABELV $560
endproc BotResetState 796 12
export BotAILoadMap
proc BotAILoadMap 1040 12
line 1347
;1341:
;1342:/*
;1343:==============
;1344:BotAILoadMap
;1345:==============
;1346:*/
;1347:int BotAILoadMap(int restart) {
line 1351
;1348:	char serverinfo[MAX_INFO_STRING];
;1349:	int  i;
;1350:
;1351:	trap_GetServerinfo(serverinfo, sizeof(serverinfo));
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetServerinfo
CALLV
pop
line 1352
;1352:	Q_strncpyz(mapname, Info_ValueForKey(serverinfo, "mapname"), sizeof(mapname));
ADDRLP4 4
ARGP4
ADDRGP4 $572
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 mapname
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1354
;1353:
;1354:	if (!restart) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $573
line 1355
;1355:		trap_BotLibLoadMap(mapname);
ADDRGP4 mapname
ARGP4
ADDRGP4 trap_BotLibLoadMap
CALLI4
pop
line 1356
;1356:	}
LABELV $573
line 1358
;1357:
;1358:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $578
JUMPV
LABELV $575
line 1359
;1359:		if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 1036
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1036
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $580
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1036
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $580
line 1360
;1360:			BotResetState(botstates[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotResetState
CALLV
pop
line 1361
;1361:			botstates[i]->setupcount = 4;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 6016
ADDP4
CNSTI4 4
ASGNI4
line 1362
;1362:		}
LABELV $580
line 1363
;1363:	}
LABELV $576
line 1358
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $578
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $575
line 1365
;1364:
;1365:	BotSetupDeathmatchAI();
ADDRGP4 BotSetupDeathmatchAI
CALLV
pop
line 1367
;1366:
;1367:	return qtrue;
CNSTI4 1
RETI4
LABELV $571
endproc BotAILoadMap 1040 12
bss
align 4
LABELV $583
skip 4
align 4
LABELV $584
skip 4
align 4
LABELV $585
skip 4
align 4
LABELV $586
skip 4096
align 4
LABELV $587
skip 4
export BotAIStartFrame
code
proc BotAIStartFrame 156 12
line 1379
;1368:}
;1369:
;1370:#ifdef MISSIONPACK
;1371:void ProximityMine_Trigger(gentity_t* trigger, gentity_t* other, trace_t* trace);
;1372:#endif
;1373:
;1374:/*
;1375:==================
;1376:BotAIStartFrame
;1377:==================
;1378:*/
;1379:int BotAIStartFrame(int time) {
line 1389
;1380:	int               i;
;1381:	gentity_t*        ent;
;1382:	bot_entitystate_t state;
;1383:	int               elapsed_time, thinktime;
;1384:	static int        local_time;
;1385:	static int        botlib_residual;
;1386:	static int        lastbotthink_time;
;1387:	static qboolean   skip[MAX_GENTITIES], *s;
;1388:
;1389:	G_CheckBotSpawn();
ADDRGP4 G_CheckBotSpawn
CALLV
pop
line 1391
;1390:
;1391:	trap_Cvar_Update(&bot_rocketjump);
ADDRGP4 bot_rocketjump
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1392
;1392:	trap_Cvar_Update(&bot_grapple);
ADDRGP4 bot_grapple
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1393
;1393:	trap_Cvar_Update(&bot_fastchat);
ADDRGP4 bot_fastchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1394
;1394:	trap_Cvar_Update(&bot_nochat);
ADDRGP4 bot_nochat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1395
;1395:	trap_Cvar_Update(&bot_testrchat);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1396
;1396:	trap_Cvar_Update(&bot_thinktime);
ADDRGP4 bot_thinktime
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1397
;1397:	trap_Cvar_Update(&bot_memorydump);
ADDRGP4 bot_memorydump
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1398
;1398:	trap_Cvar_Update(&bot_saveroutingcache);
ADDRGP4 bot_saveroutingcache
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1399
;1399:	trap_Cvar_Update(&bot_pause);
ADDRGP4 bot_pause
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1400
;1400:	trap_Cvar_Update(&bot_report);
ADDRGP4 bot_report
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 1402
;1401:
;1402:	if (bot_report.integer) {
ADDRGP4 bot_report+12
INDIRI4
CNSTI4 0
EQI4 $588
line 1405
;1403:		//		BotTeamplayReport();
;1404:		//		trap_Cvar_Set("bot_report", "0");
;1405:		BotUpdateInfoConfigStrings();
ADDRGP4 BotUpdateInfoConfigStrings
CALLV
pop
line 1406
;1406:	}
LABELV $588
line 1408
;1407:
;1408:	if (bot_pause.integer) {
ADDRGP4 bot_pause+12
INDIRI4
CNSTI4 0
EQI4 $591
line 1410
;1409:		// execute bot user commands every frame
;1410:		for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $597
JUMPV
LABELV $594
line 1411
;1411:			if (!botstates[i] || !botstates[i]->inuse) {
ADDRLP4 132
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 132
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $601
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 132
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $599
LABELV $601
line 1412
;1412:				continue;
ADDRGP4 $595
JUMPV
LABELV $599
line 1414
;1413:			}
;1414:			if (g_entities[i].client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $602
line 1415
;1415:				continue;
ADDRGP4 $595
JUMPV
LABELV $602
line 1417
;1416:			}
;1417:			botstates[i]->lastucmd.forwardmove = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 509
ADDP4
CNSTI1 0
ASGNI1
line 1418
;1418:			botstates[i]->lastucmd.rightmove   = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 510
ADDP4
CNSTI1 0
ASGNI1
line 1419
;1419:			botstates[i]->lastucmd.upmove      = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 511
ADDP4
CNSTI1 0
ASGNI1
line 1420
;1420:			botstates[i]->lastucmd.buttons     = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 1421
;1421:			botstates[i]->lastucmd.serverTime  = time;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 1422
;1422:			trap_BotUserCommand(botstates[i]->client, &botstates[i]->lastucmd);
ADDRLP4 140
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 trap_BotUserCommand
CALLV
pop
line 1423
;1423:		}
LABELV $595
line 1410
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $597
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $594
line 1424
;1424:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $582
JUMPV
LABELV $591
line 1427
;1425:	}
;1426:
;1427:	if (bot_memorydump.integer) {
ADDRGP4 bot_memorydump+12
INDIRI4
CNSTI4 0
EQI4 $605
line 1428
;1428:		trap_BotLibVarSet("memorydump", "1");
ADDRGP4 $608
ARGP4
ADDRGP4 $316
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1429
;1429:		trap_Cvar_Set("bot_memorydump", "0");
ADDRGP4 $609
ARGP4
ADDRGP4 $610
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1430
;1430:	}
LABELV $605
line 1431
;1431:	if (bot_saveroutingcache.integer) {
ADDRGP4 bot_saveroutingcache+12
INDIRI4
CNSTI4 0
EQI4 $611
line 1432
;1432:		trap_BotLibVarSet("saveroutingcache", "1");
ADDRGP4 $614
ARGP4
ADDRGP4 $316
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1433
;1433:		trap_Cvar_Set("bot_saveroutingcache", "0");
ADDRGP4 $615
ARGP4
ADDRGP4 $610
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1434
;1434:	}
LABELV $611
line 1436
;1435:	// check if bot interbreeding is activated
;1436:	BotInterbreeding();
ADDRGP4 BotInterbreeding
CALLV
pop
line 1438
;1437:	// cap the bot think time
;1438:	if (bot_thinktime.integer > 200) {
ADDRGP4 bot_thinktime+12
INDIRI4
CNSTI4 200
LEI4 $616
line 1439
;1439:		trap_Cvar_Set("bot_thinktime", "200");
ADDRGP4 $619
ARGP4
ADDRGP4 $620
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 1440
;1440:	}
LABELV $616
line 1442
;1441:	// if the bot think time changed we should reschedule the bots
;1442:	if (bot_thinktime.integer != lastbotthink_time) {
ADDRGP4 bot_thinktime+12
INDIRI4
ADDRGP4 $585
INDIRI4
EQI4 $621
line 1443
;1443:		lastbotthink_time = bot_thinktime.integer;
ADDRGP4 $585
ADDRGP4 bot_thinktime+12
INDIRI4
ASGNI4
line 1444
;1444:		BotScheduleBotThink();
ADDRGP4 BotScheduleBotThink
CALLV
pop
line 1445
;1445:	}
LABELV $621
line 1447
;1446:
;1447:	elapsed_time = time - local_time;
ADDRLP4 120
ADDRFP4 0
INDIRI4
ADDRGP4 $583
INDIRI4
SUBI4
ASGNI4
line 1448
;1448:	local_time   = time;
ADDRGP4 $583
ADDRFP4 0
INDIRI4
ASGNI4
line 1450
;1449:
;1450:	botlib_residual += elapsed_time;
ADDRLP4 128
ADDRGP4 $584
ASGNP4
ADDRLP4 128
INDIRP4
ADDRLP4 128
INDIRP4
INDIRI4
ADDRLP4 120
INDIRI4
ADDI4
ASGNI4
line 1452
;1451:
;1452:	if (elapsed_time > bot_thinktime.integer)
ADDRLP4 120
INDIRI4
ADDRGP4 bot_thinktime+12
INDIRI4
LEI4 $625
line 1453
;1453:		thinktime = elapsed_time;
ADDRLP4 124
ADDRLP4 120
INDIRI4
ASGNI4
ADDRGP4 $626
JUMPV
LABELV $625
line 1455
;1454:	else
;1455:		thinktime = bot_thinktime.integer;
ADDRLP4 124
ADDRGP4 bot_thinktime+12
INDIRI4
ASGNI4
LABELV $626
line 1458
;1456:
;1457:	// update the bot library
;1458:	if (botlib_residual >= thinktime) {
ADDRGP4 $584
INDIRI4
ADDRLP4 124
INDIRI4
LTI4 $629
line 1459
;1459:		botlib_residual -= thinktime;
ADDRLP4 132
ADDRGP4 $584
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
ADDRLP4 124
INDIRI4
SUBI4
ASGNI4
line 1461
;1460:
;1461:		trap_BotLibStartFrame((float)time / 1000);
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRGP4 trap_BotLibStartFrame
CALLI4
pop
line 1463
;1462:
;1463:		if (!trap_AAS_Initialized())
ADDRLP4 136
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 0
NEI4 $631
line 1464
;1464:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $582
JUMPV
LABELV $631
line 1467
;1465:
;1466:		// update entities in the botlib
;1467:		s   = skip;
ADDRGP4 $587
ADDRGP4 $586
ASGNP4
line 1468
;1468:		ent = g_entities;
ADDRLP4 4
ADDRGP4 g_entities
ASGNP4
line 1469
;1469:		for (i = 0; i < level.num_entities; i++, s++, ent++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $636
JUMPV
LABELV $633
line 1470
;1470:			ent = &g_entities[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1471
;1471:			if (!ent->inuse || !ent->r.linked || ent->r.svFlags & SVF_NOCLIENT) {
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $641
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $641
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $638
LABELV $641
line 1472
;1472:				if (*s == qfalse) {
ADDRGP4 $587
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $634
line 1473
;1473:					*s = qtrue;
ADDRGP4 $587
INDIRP4
CNSTI4 1
ASGNI4
line 1474
;1474:					trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1475
;1475:				}
line 1476
;1476:				continue;
ADDRGP4 $634
JUMPV
LABELV $638
line 1479
;1477:			}
;1478:			// do not update missiles
;1479:			if (ent->s.eType == ET_MISSILE && ent->s.weapon != WP_GRAPPLING_HOOK) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $644
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 10
EQI4 $644
line 1480
;1480:				if (*s == qfalse) {
ADDRGP4 $587
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $634
line 1481
;1481:					*s = qtrue;
ADDRGP4 $587
INDIRP4
CNSTI4 1
ASGNI4
line 1482
;1482:					trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1483
;1483:				}
line 1484
;1484:				continue;
ADDRGP4 $634
JUMPV
LABELV $644
line 1487
;1485:			}
;1486:			// do not update event only entities
;1487:			if (ent->s.eType > ET_EVENTS) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
LEI4 $648
line 1488
;1488:				if (*s == qfalse) {
ADDRGP4 $587
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $634
line 1489
;1489:					*s = qtrue;
ADDRGP4 $587
INDIRP4
CNSTI4 1
ASGNI4
line 1490
;1490:					trap_BotLibUpdateEntity(i, NULL);
ADDRLP4 0
INDIRI4
ARGI4
CNSTP4 0
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1491
;1491:				}
line 1492
;1492:				continue;
ADDRGP4 $634
JUMPV
LABELV $648
line 1504
;1493:			}
;1494:#ifdef MISSIONPACK
;1495:			// never link prox mine triggers
;1496:			if (ent->r.contents == CONTENTS_TRIGGER) {
;1497:				if (ent->touch == ProximityMine_Trigger) {
;1498:					trap_BotLibUpdateEntity(i, NULL);
;1499:					continue;
;1500:				}
;1501:			}
;1502:#endif
;1503:			//
;1504:			memset(&state, 0, sizeof(bot_entitystate_t));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 112
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1506
;1505:			//
;1506:			VectorCopy(ent->r.currentOrigin, state.origin);
ADDRLP4 8+8
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 1507
;1507:			if (i < MAX_CLIENTS) {
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $653
line 1508
;1508:				VectorCopy(ent->s.apos.trBase, state.angles);
ADDRLP4 8+20
ADDRLP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 1509
;1509:			} else {
ADDRGP4 $654
JUMPV
LABELV $653
line 1510
;1510:				VectorCopy(ent->r.currentAngles, state.angles);
ADDRLP4 8+20
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRB
ASGNB 12
line 1511
;1511:			}
LABELV $654
line 1512
;1512:			VectorCopy(ent->s.origin2, state.old_origin);
ADDRLP4 8+32
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 1513
;1513:			VectorCopy(ent->r.mins, state.mins);
ADDRLP4 8+44
ADDRLP4 4
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 1514
;1514:			VectorCopy(ent->r.maxs, state.maxs);
ADDRLP4 8+56
ADDRLP4 4
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 1515
;1515:			state.type  = ent->s.eType;
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1516
;1516:			state.flags = ent->s.eFlags;
ADDRLP4 8+4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1517
;1517:			if (ent->r.bmodel)
ADDRLP4 4
INDIRP4
CNSTI4 432
ADDP4
INDIRI4
CNSTI4 0
EQI4 $661
line 1518
;1518:				state.solid = SOLID_BSP;
ADDRLP4 8+72
CNSTI4 3
ASGNI4
ADDRGP4 $662
JUMPV
LABELV $661
line 1520
;1519:			else
;1520:				state.solid = SOLID_BBOX;
ADDRLP4 8+72
CNSTI4 2
ASGNI4
LABELV $662
line 1521
;1521:			state.groundent   = ent->s.groundEntityNum;
ADDRLP4 8+68
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 1522
;1522:			state.modelindex  = ent->s.modelindex;
ADDRLP4 8+76
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 1523
;1523:			state.modelindex2 = ent->s.modelindex2;
ADDRLP4 8+80
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
ASGNI4
line 1524
;1524:			state.frame       = ent->s.frame;
ADDRLP4 8+84
ADDRLP4 4
INDIRP4
CNSTI4 172
ADDP4
INDIRI4
ASGNI4
line 1525
;1525:			state.event       = ent->s.event;
ADDRLP4 8+88
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1526
;1526:			state.eventParm   = ent->s.eventParm;
ADDRLP4 8+92
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 1527
;1527:			state.powerups    = ent->s.powerups;
ADDRLP4 8+96
ADDRLP4 4
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
ASGNI4
line 1528
;1528:			state.legsAnim    = ent->s.legsAnim;
ADDRLP4 8+104
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 1529
;1529:			state.torsoAnim   = ent->s.torsoAnim;
ADDRLP4 8+108
ADDRLP4 4
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 1530
;1530:			state.weapon      = ent->s.weapon;
ADDRLP4 8+100
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 1532
;1531:			//
;1532:			*s = qfalse;
ADDRGP4 $587
INDIRP4
CNSTI4 0
ASGNI4
line 1533
;1533:			trap_BotLibUpdateEntity(i, &state);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 trap_BotLibUpdateEntity
CALLI4
pop
line 1534
;1534:		}
LABELV $634
line 1469
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 140
ADDRGP4 $587
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 816
ADDP4
ASGNP4
LABELV $636
ADDRLP4 0
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $633
line 1536
;1535:
;1536:		BotAIRegularUpdate();
ADDRGP4 BotAIRegularUpdate
CALLV
pop
line 1537
;1537:	}
LABELV $629
line 1539
;1538:
;1539:	floattime = trap_AAS_Time();
ADDRLP4 132
ADDRGP4 trap_AAS_Time
CALLF4
ASGNF4
ADDRGP4 floattime
ADDRLP4 132
INDIRF4
ASGNF4
line 1542
;1540:
;1541:	// execute scheduled bot AI
;1542:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $678
JUMPV
LABELV $675
line 1543
;1543:		if (!botstates[i] || !botstates[i]->inuse) {
ADDRLP4 140
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $682
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $680
LABELV $682
line 1544
;1544:			continue;
ADDRGP4 $676
JUMPV
LABELV $680
line 1547
;1545:		}
;1546:		//
;1547:		botstates[i]->botthink_residual += elapsed_time;
ADDRLP4 144
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
ADDRLP4 120
INDIRI4
ADDI4
ASGNI4
line 1549
;1548:		//
;1549:		if (botstates[i]->botthink_residual >= thinktime) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 124
INDIRI4
LTI4 $683
line 1550
;1550:			botstates[i]->botthink_residual -= thinktime;
ADDRLP4 148
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
ADDRLP4 124
INDIRI4
SUBI4
ASGNI4
line 1552
;1551:
;1552:			if (!trap_AAS_Initialized())
ADDRLP4 152
ADDRGP4 trap_AAS_Initialized
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $685
line 1553
;1553:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $582
JUMPV
LABELV $685
line 1555
;1554:
;1555:			if (g_entities[i].client->pers.connected == CON_CONNECTED) {
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $687
line 1556
;1556:				BotAI(i, (float)thinktime / 1000);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 124
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRGP4 BotAI
CALLI4
pop
line 1557
;1557:			}
LABELV $687
line 1558
;1558:		}
LABELV $683
line 1559
;1559:	}
LABELV $676
line 1542
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $678
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $675
line 1562
;1560:
;1561:	// execute bot user commands every frame
;1562:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $693
JUMPV
LABELV $690
line 1563
;1563:		if (!botstates[i] || !botstates[i]->inuse) {
ADDRLP4 140
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $697
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $695
LABELV $697
line 1564
;1564:			continue;
ADDRGP4 $691
JUMPV
LABELV $695
line 1566
;1565:		}
;1566:		if (g_entities[i].client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $698
line 1567
;1567:			continue;
ADDRGP4 $691
JUMPV
LABELV $698
line 1570
;1568:		}
;1569:
;1570:		BotUpdateInput(botstates[i], time, elapsed_time);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 120
INDIRI4
ARGI4
ADDRGP4 BotUpdateInput
CALLV
pop
line 1571
;1571:		trap_BotUserCommand(botstates[i]->client, &botstates[i]->lastucmd);
ADDRLP4 148
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
ADDP4
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 trap_BotUserCommand
CALLV
pop
line 1572
;1572:	}
LABELV $691
line 1562
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $693
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $690
line 1574
;1573:
;1574:	return qtrue;
CNSTI4 1
RETI4
LABELV $582
endproc BotAIStartFrame 156 12
export BotInitLibrary
proc BotInitLibrary 260 16
line 1582
;1575:}
;1576:
;1577:/*
;1578:==============
;1579:BotInitLibrary
;1580:==============
;1581:*/
;1582:int BotInitLibrary(void) {
line 1586
;1583:	char buf[MAX_CVAR_VALUE_STRING];
;1584:
;1585:	// set the maxclients and maxentities library variables before calling BotSetupLibrary
;1586:	trap_Cvar_VariableStringBuffer("sv_maxclients", buf, sizeof(buf));
ADDRGP4 $702
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1587
;1587:	if (!buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $703
line 1588
;1588:		strcpy(buf, "8");
ADDRLP4 0
ARGP4
ADDRGP4 $705
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $703
line 1589
;1589:	trap_BotLibVarSet("maxclients", buf);
ADDRGP4 $706
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1591
;1590:
;1591:	Com_sprintf(buf, sizeof(buf), "%d", MAX_GENTITIES);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $307
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1592
;1592:	trap_BotLibVarSet("maxentities", buf);
ADDRGP4 $707
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1594
;1593:	// bsp checksum
;1594:	trap_Cvar_VariableStringBuffer("sv_mapChecksum", buf, sizeof(buf));
ADDRGP4 $708
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1595
;1595:	if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $709
line 1596
;1596:		trap_BotLibVarSet("sv_mapChecksum", buf);
ADDRGP4 $708
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $709
line 1599
;1597:
;1598:	// maximum number of aas links
;1599:	trap_Cvar_VariableStringBuffer("max_aaslinks", buf, sizeof(buf));
ADDRGP4 $711
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1600
;1600:	if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $712
line 1601
;1601:		trap_BotLibVarSet("max_aaslinks", buf);
ADDRGP4 $711
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $712
line 1604
;1602:
;1603:	// maximum number of items in a level
;1604:	trap_Cvar_VariableStringBuffer("max_levelitems", buf, sizeof(buf));
ADDRGP4 $714
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1605
;1605:	if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $715
line 1606
;1606:		trap_BotLibVarSet("max_levelitems", buf);
ADDRGP4 $714
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $715
line 1609
;1607:
;1608:	// game type
;1609:	trap_Cvar_VariableStringBuffer("g_gametype", buf, sizeof(buf));
ADDRGP4 $306
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1610
;1610:	if (!buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $717
line 1611
;1611:		strcpy(buf, "0");
ADDRLP4 0
ARGP4
ADDRGP4 $610
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $717
line 1612
;1612:	trap_BotLibVarSet("g_gametype", buf);
ADDRGP4 $306
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1614
;1613:	// bot developer mode and log file
;1614:	trap_BotLibVarSet("bot_developer", bot_developer.string);
ADDRGP4 $719
ARGP4
ADDRGP4 bot_developer+16
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1615
;1615:	trap_BotLibVarSet("log", buf);
ADDRGP4 $721
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1617
;1616:	// no chatting
;1617:	trap_Cvar_VariableStringBuffer("bot_nochat", buf, sizeof(buf));
ADDRGP4 $722
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1618
;1618:	if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $723
line 1619
;1619:		trap_BotLibVarSet("nochat", "0");
ADDRGP4 $725
ARGP4
ADDRGP4 $610
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $723
line 1622
;1620:
;1621:	// visualize jump pads
;1622:	trap_Cvar_VariableStringBuffer("bot_visualizejumppads", buf, sizeof(buf));
ADDRGP4 $726
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1623
;1623:	if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $727
line 1624
;1624:		trap_BotLibVarSet("bot_visualizejumppads", buf);
ADDRGP4 $726
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $727
line 1627
;1625:
;1626:	// forced clustering calculations
;1627:	trap_Cvar_VariableStringBuffer("bot_forceclustering", buf, sizeof(buf));
ADDRGP4 $729
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1628
;1628:	if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $730
line 1629
;1629:		trap_BotLibVarSet("forceclustering", buf);
ADDRGP4 $732
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $730
line 1632
;1630:
;1631:	// forced reachability calculations
;1632:	trap_Cvar_VariableStringBuffer("bot_forcereachability", buf, sizeof(buf));
ADDRGP4 $733
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1633
;1633:	if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $734
line 1634
;1634:		trap_BotLibVarSet("forcereachability", buf);
ADDRGP4 $736
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $734
line 1637
;1635:
;1636:	// force writing of AAS to file
;1637:	trap_Cvar_VariableStringBuffer("bot_forcewrite", buf, sizeof(buf));
ADDRGP4 $737
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1638
;1638:	if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $738
line 1639
;1639:		trap_BotLibVarSet("forcewrite", buf);
ADDRGP4 $740
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $738
line 1642
;1640:
;1641:	// no AAS optimization
;1642:	trap_Cvar_VariableStringBuffer("bot_aasoptimize", buf, sizeof(buf));
ADDRGP4 $741
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1643
;1643:	if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $742
line 1644
;1644:		trap_BotLibVarSet("aasoptimize", buf);
ADDRGP4 $744
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $742
line 1647
;1645:
;1646:	//
;1647:	trap_Cvar_VariableStringBuffer("bot_saveroutingcache", buf, sizeof(buf));
ADDRGP4 $615
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1648
;1648:	if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $745
line 1649
;1649:		trap_BotLibVarSet("saveroutingcache", buf);
ADDRGP4 $614
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $745
line 1652
;1650:
;1651:	// reload instead of cache bot character files
;1652:	trap_Cvar_VariableStringBuffer("bot_reloadcharacters", buf, sizeof(buf));
ADDRGP4 $315
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1653
;1653:	if (!buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $747
line 1654
;1654:		strcpy(buf, "0");
ADDRLP4 0
ARGP4
ADDRGP4 $610
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $747
line 1655
;1655:	trap_BotLibVarSet("bot_reloadcharacters", buf);
ADDRGP4 $315
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 1657
;1656:	// base directory
;1657:	trap_Cvar_VariableStringBuffer("fs_basepath", buf, sizeof(buf));
ADDRGP4 $749
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1658
;1658:	if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $750
line 1659
;1659:		trap_BotLibVarSet("basedir", buf);
ADDRGP4 $752
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $750
line 1662
;1660:
;1661:	// home directory
;1662:	trap_Cvar_VariableStringBuffer("fs_homepath", buf, sizeof(buf));
ADDRGP4 $753
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1663
;1663:	if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $754
line 1664
;1664:		trap_BotLibVarSet("homedir", buf);
ADDRGP4 $756
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $754
line 1667
;1665:
;1666:	// game directory
;1667:	trap_Cvar_VariableStringBuffer("fs_game", buf, sizeof(buf));
ADDRGP4 $757
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1668
;1668:	if (buf[0])
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $758
line 1669
;1669:		trap_BotLibVarSet("gamedir", buf);
ADDRGP4 $760
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
LABELV $758
line 1675
;1670:
;1671:#ifdef MISSIONPACK
;1672:	trap_BotLibDefine("MISSIONPACK");
;1673:#endif
;1674:	// setup the bot library
;1675:	return trap_BotLibSetup();
ADDRLP4 256
ADDRGP4 trap_BotLibSetup
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
RETI4
LABELV $701
endproc BotInitLibrary 260 16
export BotAISetup
proc BotAISetup 8 16
line 1683
;1676:}
;1677:
;1678:/*
;1679:==============
;1680:BotAISetup
;1681:==============
;1682:*/
;1683:int BotAISetup(int restart) {
line 1686
;1684:	int errnum;
;1685:
;1686:	trap_Cvar_Register(&bot_thinktime, "bot_thinktime", "100", CVAR_CHEAT);
ADDRGP4 bot_thinktime
ARGP4
ADDRGP4 $619
ARGP4
ADDRGP4 $762
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1687
;1687:	trap_Cvar_Register(&bot_memorydump, "bot_memorydump", "0", CVAR_CHEAT);
ADDRGP4 bot_memorydump
ARGP4
ADDRGP4 $609
ARGP4
ADDRGP4 $610
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1688
;1688:	trap_Cvar_Register(&bot_saveroutingcache, "bot_saveroutingcache", "0", CVAR_CHEAT);
ADDRGP4 bot_saveroutingcache
ARGP4
ADDRGP4 $615
ARGP4
ADDRGP4 $610
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1689
;1689:	trap_Cvar_Register(&bot_pause, "bot_pause", "0", CVAR_CHEAT);
ADDRGP4 bot_pause
ARGP4
ADDRGP4 $763
ARGP4
ADDRGP4 $610
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1690
;1690:	trap_Cvar_Register(&bot_report, "bot_report", "0", CVAR_CHEAT);
ADDRGP4 bot_report
ARGP4
ADDRGP4 $764
ARGP4
ADDRGP4 $610
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1691
;1691:	trap_Cvar_Register(&bot_testsolid, "bot_testsolid", "0", CVAR_CHEAT);
ADDRGP4 bot_testsolid
ARGP4
ADDRGP4 $765
ARGP4
ADDRGP4 $610
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1692
;1692:	trap_Cvar_Register(&bot_testclusters, "bot_testclusters", "0", CVAR_CHEAT);
ADDRGP4 bot_testclusters
ARGP4
ADDRGP4 $766
ARGP4
ADDRGP4 $610
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1693
;1693:	trap_Cvar_Register(&bot_developer, "bot_developer", "0", CVAR_CHEAT);
ADDRGP4 bot_developer
ARGP4
ADDRGP4 $719
ARGP4
ADDRGP4 $610
ARGP4
CNSTI4 512
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1694
;1694:	trap_Cvar_Register(&bot_interbreedchar, "bot_interbreedchar", "", 0);
ADDRGP4 bot_interbreedchar
ARGP4
ADDRGP4 $325
ARGP4
ADDRGP4 $299
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1695
;1695:	trap_Cvar_Register(&bot_interbreedbots, "bot_interbreedbots", "10", 0);
ADDRGP4 bot_interbreedbots
ARGP4
ADDRGP4 $767
ARGP4
ADDRGP4 $768
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1696
;1696:	trap_Cvar_Register(&bot_interbreedcycle, "bot_interbreedcycle", "20", 0);
ADDRGP4 bot_interbreedcycle
ARGP4
ADDRGP4 $769
ARGP4
ADDRGP4 $770
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1697
;1697:	trap_Cvar_Register(&bot_interbreedwrite, "bot_interbreedwrite", "", 0);
ADDRGP4 bot_interbreedwrite
ARGP4
ADDRGP4 $298
ARGP4
ADDRGP4 $299
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1700
;1698:
;1699:	// if the game is restarted for a tournament
;1700:	if (restart) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $771
line 1701
;1701:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $761
JUMPV
LABELV $771
line 1705
;1702:	}
;1703:
;1704:	// initialize the bot states
;1705:	memset(botstates, 0, sizeof(botstates));
ADDRGP4 botstates
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1707
;1706:
;1707:	errnum = BotInitLibrary();
ADDRLP4 4
ADDRGP4 BotInitLibrary
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1708
;1708:	if (errnum != BLERR_NOERROR)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $773
line 1709
;1709:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $761
JUMPV
LABELV $773
line 1711
;1710:
;1711:	return qtrue;
CNSTI4 1
RETI4
LABELV $761
endproc BotAISetup 8 16
export BotAIShutdown
proc BotAIShutdown 12 8
line 1719
;1712:}
;1713:
;1714:/*
;1715:==============
;1716:BotAIShutdown
;1717:==============
;1718:*/
;1719:int BotAIShutdown(int restart) {
line 1724
;1720:
;1721:	int i;
;1722:
;1723:	// if the game is restarted for a tournament
;1724:	if (restart) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $776
line 1726
;1725:		// shutdown all the bots in the botlib
;1726:		for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $781
JUMPV
LABELV $778
line 1727
;1727:			if (botstates[i] && botstates[i]->inuse) {
ADDRLP4 8
ADDRGP4 botstates
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $783
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $783
line 1728
;1728:				BotAIShutdownClient(botstates[i]->client, restart);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 botstates
ADDP4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 1729
;1729:			}
LABELV $783
line 1730
;1730:		}
LABELV $779
line 1726
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $781
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $778
line 1732
;1731:		// don't shutdown the bot library
;1732:	} else {
ADDRGP4 $777
JUMPV
LABELV $776
line 1733
;1733:		trap_BotLibShutdown();
ADDRGP4 trap_BotLibShutdown
CALLI4
pop
line 1734
;1734:	}
LABELV $777
line 1735
;1735:	return qtrue;
CNSTI4 1
RETI4
LABELV $775
endproc BotAIShutdown 12 8
import ExitLevel
bss
export bot_interbreedwrite
align 4
LABELV bot_interbreedwrite
skip 272
export bot_interbreedcycle
align 4
LABELV bot_interbreedcycle
skip 272
export bot_interbreedbots
align 4
LABELV bot_interbreedbots
skip 272
export bot_interbreedchar
align 4
LABELV bot_interbreedchar
skip 272
export bot_developer
align 4
LABELV bot_developer
skip 272
export bot_testclusters
align 4
LABELV bot_testclusters
skip 272
export bot_testsolid
align 4
LABELV bot_testsolid
skip 272
export bot_report
align 4
LABELV bot_report
skip 272
export bot_pause
align 4
LABELV bot_pause
skip 272
export bot_saveroutingcache
align 4
LABELV bot_saveroutingcache
skip 272
export bot_memorydump
align 4
LABELV bot_memorydump
skip 272
export bot_thinktime
align 4
LABELV bot_thinktime
skip 272
export bot_interbreedmatchcount
align 4
LABELV bot_interbreedmatchcount
skip 4
export bot_interbreed
align 4
LABELV bot_interbreed
skip 4
export regularupdate_time
align 4
LABELV regularupdate_time
skip 4
export numbots
align 4
LABELV numbots
skip 4
export botstates
align 4
LABELV botstates
skip 256
import BotVoiceChat_Defend
import BotVoiceChatCommand
import BotDumpNodeSwitches
import BotResetNodeSwitches
import AINode_Battle_NBG
import AINode_Battle_Retreat
import AINode_Battle_Chase
import AINode_Battle_Fight
import AINode_Seek_LTG
import AINode_Seek_NBG
import AINode_Seek_ActivateEntity
import AINode_Stand
import AINode_Respawn
import AINode_Observer
import AINode_Intermission
import AIEnter_Battle_NBG
import AIEnter_Battle_Retreat
import AIEnter_Battle_Chase
import AIEnter_Battle_Fight
import AIEnter_Seek_Camp
import AIEnter_Seek_LTG
import AIEnter_Seek_NBG
import AIEnter_Seek_ActivateEntity
import AIEnter_Stand
import AIEnter_Respawn
import AIEnter_Observer
import AIEnter_Intermission
import BotPrintTeamGoal
import BotMatchMessage
import notleader
import BotChatTest
import BotValidChatPosition
import BotChatTime
import BotChat_Random
import BotChat_EnemySuicide
import BotChat_Kill
import BotChat_Death
import BotChat_HitNoKill
import BotChat_HitNoDeath
import BotChat_HitTalking
import BotChat_EndLevel
import BotChat_StartLevel
import BotChat_ExitGame
import BotChat_EnterGame
import ctf_blueflag
import ctf_redflag
import bot_challenge
import bot_testrchat
import bot_nochat
import bot_fastchat
import bot_rocketjump
import bot_grapple
export mapname
align 1
LABELV mapname
skip 64
import gametype
import BotMapScripts
import BotPointAreaNum
import ClientOnSameTeamFromName
import ClientFromName
import stristr
import BotFindWayPoint
import BotCreateWayPoint
import BotAlternateRoute
import BotGetAlternateRouteGoal
import BotCTFRetreatGoals
import BotCTFSeekGoals
import BotRememberLastOrderedTask
import BotCTFCarryingFlag
import BotOppositeTeam
import BotTeam
import BotClearActivateGoalStack
import BotPopFromActivateGoalStack
import BotEnableActivateGoalAreas
import BotAIPredictObstacles
import BotAIBlocked
import BotCheckAttack
import BotAimAtEnemy
import BotEntityVisible
import BotRoamGoal
import BotFindEnemy
import InFieldOfVision
import BotVisibleTeamMatesAndEnemies
import BotEnemyFlagCarrierVisible
import BotTeamFlagCarrierVisible
import BotTeamFlagCarrier
import TeamPlayIsOn
import BotSameTeam
import BotAttackMove
import BotWantsToCamp
import BotHasPersistantPowerupAndWeapon
import BotCanAndWantsToRocketJump
import BotWantsToHelp
import BotWantsToChase
import BotWantsToRetreat
import BotFeelingBad
import BotAggression
import BotTeamGoals
import BotSetLastOrderedTask
import BotSynonymContext
import ClientSkin
import EasyClientName
import ClientName
import BotSetTeamStatus
import EntityIsShooting
import EntityIsInvisible
import EntityIsDead
import BotInLavaOrSlime
import BotIntermission
import BotIsObserver
import BotIsDead
import BotBattleUseItems
import BotUpdateBattleInventory
import BotUpdateInventory
import BotSetupForMovement
import BotChooseWeapon
import BotFreeWaypoints
import BotDeathmatchAI
import BotShutdownDeathmatchAI
import BotSetupDeathmatchAI
export floattime
align 4
LABELV floattime
skip 4
import BotResetWeaponState
import BotFreeWeaponState
import BotAllocWeaponState
import BotLoadWeaponWeights
import BotGetWeaponInfo
import BotChooseBestFightWeapon
import BotShutdownWeaponAI
import BotSetupWeaponAI
import BotShutdownMoveAI
import BotSetupMoveAI
import BotSetBrushModelTypes
import BotAddAvoidSpot
import BotInitMoveState
import BotFreeMoveState
import BotAllocMoveState
import BotPredictVisiblePosition
import BotMovementViewTarget
import BotReachabilityArea
import BotResetLastAvoidReach
import BotResetAvoidReach
import BotMoveInDirection
import BotMoveToGoal
import BotResetMoveState
import BotShutdownGoalAI
import BotSetupGoalAI
import BotFreeGoalState
import BotAllocGoalState
import BotFreeItemWeights
import BotLoadItemWeights
import BotMutateGoalFuzzyLogic
import BotSaveGoalFuzzyLogic
import BotInterbreedGoalFuzzyLogic
import BotUpdateEntityItems
import BotInitLevelItems
import BotSetAvoidGoalTime
import BotAvoidGoalTime
import BotGetMapLocationGoal
import BotGetNextCampSpotGoal
import BotGetLevelItemGoal
import BotItemGoalInVisButNotVisible
import BotTouchingGoal
import BotChooseNBGItem
import BotChooseLTGItem
import BotGetSecondGoal
import BotGetTopGoal
import BotGoalName
import BotDumpGoalStack
import BotDumpAvoidGoals
import BotEmptyGoalStack
import BotPopGoal
import BotPushGoal
import BotRemoveFromAvoidGoals
import BotResetAvoidGoals
import BotResetGoalState
import GeneticParentsAndChildSelection
import BotSetChatName
import BotSetChatGender
import BotLoadChatFile
import BotReplaceSynonyms
import UnifyWhiteSpaces
import BotMatchVariable
import BotFindMatch
import StringContains
import BotGetChatMessage
import BotEnterChat
import BotChatLength
import BotReplyChat
import BotNumInitialChats
import BotInitialChat
import BotNumConsoleMessages
import BotNextConsoleMessage
import BotRemoveConsoleMessage
import BotQueueConsoleMessage
import BotFreeChatState
import BotAllocChatState
import BotShutdownChatAI
import BotSetupChatAI
import BotShutdownCharacters
import Characteristic_String
import Characteristic_BInteger
import Characteristic_Integer
import Characteristic_BFloat
import Characteristic_Float
import BotFreeCharacter
import BotLoadCharacter
import EA_Shutdown
import EA_Setup
import EA_ResetInput
import EA_GetInput
import EA_EndRegular
import EA_View
import EA_Move
import EA_DelayedJump
import EA_Jump
import EA_SelectWeapon
import EA_Use
import EA_Gesture
import EA_Talk
import EA_Respawn
import EA_Attack
import EA_MoveRight
import EA_MoveLeft
import EA_MoveBack
import EA_MoveForward
import EA_MoveDown
import EA_MoveUp
import EA_Walk
import EA_Crouch
import EA_Action
import EA_Command
import EA_SayTeam
import EA_Say
import GetBotLibAPI
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
LABELV $770
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $769
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 99
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $768
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $767
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $766
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $765
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $764
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $763
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $762
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $760
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $757
byte 1 102
byte 1 115
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $756
byte 1 104
byte 1 111
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $753
byte 1 102
byte 1 115
byte 1 95
byte 1 104
byte 1 111
byte 1 109
byte 1 101
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $752
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 100
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $749
byte 1 102
byte 1 115
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $744
byte 1 97
byte 1 97
byte 1 115
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $741
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 97
byte 1 97
byte 1 115
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 109
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $740
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $737
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $736
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $733
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 114
byte 1 101
byte 1 97
byte 1 99
byte 1 104
byte 1 97
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $732
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $729
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $726
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 118
byte 1 105
byte 1 115
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $725
byte 1 110
byte 1 111
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $722
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 110
byte 1 111
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $721
byte 1 108
byte 1 111
byte 1 103
byte 1 0
align 1
LABELV $719
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 111
byte 1 112
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $714
byte 1 109
byte 1 97
byte 1 120
byte 1 95
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $711
byte 1 109
byte 1 97
byte 1 120
byte 1 95
byte 1 97
byte 1 97
byte 1 115
byte 1 108
byte 1 105
byte 1 110
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $708
byte 1 115
byte 1 118
byte 1 95
byte 1 109
byte 1 97
byte 1 112
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 115
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $707
byte 1 109
byte 1 97
byte 1 120
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
LABELV $706
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
LABELV $705
byte 1 56
byte 1 0
align 1
LABELV $702
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
LABELV $620
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $619
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 107
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $615
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 111
byte 1 117
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $614
byte 1 115
byte 1 97
byte 1 118
byte 1 101
byte 1 114
byte 1 111
byte 1 117
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $610
byte 1 48
byte 1 0
align 1
LABELV $609
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 100
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $608
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 100
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $572
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $547
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $532
byte 1 99
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 32
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $529
byte 1 65
byte 1 65
byte 1 83
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 105
byte 1 110
byte 1 105
byte 1 116
byte 1 105
byte 1 97
byte 1 108
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $526
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
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $517
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $516
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
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
align 1
LABELV $497
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $494
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $491
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $488
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $485
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $482
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $479
byte 1 99
byte 1 112
byte 1 32
byte 1 0
align 1
LABELV $471
byte 1 66
byte 1 111
byte 1 116
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 117
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $325
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $322
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
byte 1 52
byte 1 32
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $316
byte 1 49
byte 1 0
align 1
LABELV $315
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 111
byte 1 97
byte 1 100
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
byte 1 0
align 1
LABELV $307
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $306
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
LABELV $299
byte 1 0
align 1
LABELV $298
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 98
byte 1 114
byte 1 101
byte 1 101
byte 1 100
byte 1 119
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $249
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 97
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $246
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $244
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $242
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $240
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $238
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $236
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $234
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $232
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $230
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $228
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $226
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $224
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $222
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $217
byte 1 70
byte 1 32
byte 1 0
align 1
LABELV $196
byte 1 94
byte 1 52
byte 1 66
byte 1 76
byte 1 85
byte 1 69
byte 1 10
byte 1 0
align 1
LABELV $195
byte 1 116
byte 1 0
align 1
LABELV $191
byte 1 110
byte 1 0
align 1
LABELV $180
byte 1 94
byte 1 49
byte 1 82
byte 1 69
byte 1 68
byte 1 10
byte 1 0
align 1
LABELV $176
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $175
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $173
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $171
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $169
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $167
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $165
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $163
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $161
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $159
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $157
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $155
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $153
byte 1 37
byte 1 45
byte 1 50
byte 1 48
byte 1 115
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $148
byte 1 94
byte 1 52
byte 1 70
byte 1 32
byte 1 0
align 1
LABELV $147
byte 1 94
byte 1 49
byte 1 70
byte 1 32
byte 1 0
align 1
LABELV $140
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $139
byte 1 32
byte 1 0
align 1
LABELV $138
byte 1 76
byte 1 0
align 1
LABELV $133
byte 1 13
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 44
byte 1 32
byte 1 99
byte 1 108
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $132
byte 1 13
byte 1 94
byte 1 49
byte 1 83
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 33
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
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $124
byte 1 13
byte 1 94
byte 1 49
byte 1 83
byte 1 79
byte 1 76
byte 1 73
byte 1 68
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $123
byte 1 13
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 0
align 1
LABELV $69
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $68
byte 1 94
byte 1 49
byte 1 69
byte 1 120
byte 1 105
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $66
byte 1 94
byte 1 49
byte 1 70
byte 1 97
byte 1 116
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $64
byte 1 94
byte 1 49
byte 1 69
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $62
byte 1 94
byte 1 51
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $60
byte 1 37
byte 1 115
byte 1 0
