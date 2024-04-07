code
proc BotSetUserInfo 1024 12
file "../../../../code/game/ai_dmq3.c"
line 96
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_dmq3.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_dmq3.c $
;10: *
;11: *****************************************************************************/
;12:
;13:#include "g_local.h"
;14:#include "botlib.h"
;15:#include "be_aas.h"
;16:#include "be_ea.h"
;17:#include "be_ai_char.h"
;18:#include "be_ai_chat.h"
;19:#include "be_ai_gen.h"
;20:#include "be_ai_goal.h"
;21:#include "be_ai_move.h"
;22:#include "be_ai_weap.h"
;23://
;24:#include "ai_main.h"
;25:#include "ai_dmq3.h"
;26:#include "ai_chat.h"
;27:#include "ai_cmd.h"
;28:#include "ai_dmnet.h"
;29:#include "ai_team.h"
;30://
;31:#include "chars.h"  //characteristics
;32:#include "inv.h"    //indexes into the inventory
;33:#include "syn.h"    //synonyms
;34:#include "match.h"  //string matching types and vars
;35:
;36:// for the voice chats
;37:#ifdef MISSIONPACK
;38:#include "../../ui/menudef.h"  // sos001205 - for q3_ui also
;39:#endif
;40:
;41:// from aasfile.h
;42:#define AREACONTENTS_MOVER         1024
;43:#define AREACONTENTS_MODELNUMSHIFT 24
;44:#define AREACONTENTS_MAXMODELNUM   0xFF
;45:#define AREACONTENTS_MODELNUM      (AREACONTENTS_MAXMODELNUM << AREACONTENTS_MODELNUMSHIFT)
;46:
;47:#define IDEAL_ATTACKDIST 140
;48:
;49:#define MAX_WAYPOINTS 128
;50://
;51:bot_waypoint_t  botai_waypoints[MAX_WAYPOINTS];
;52:bot_waypoint_t* botai_freewaypoints;
;53:
;54:// NOTE: not using a cvars which can be updated because the game should be reloaded anyway
;55:int gametype;  // game type
;56:// int maxclients;	//maximum number of clients
;57:
;58:vmCvar_t        bot_grapple;
;59:vmCvar_t        bot_rocketjump;
;60:vmCvar_t        bot_fastchat;
;61:vmCvar_t        bot_nochat;
;62:vmCvar_t        bot_testrchat;
;63:vmCvar_t        bot_challenge;
;64:vmCvar_t        bot_predictobstacles;
;65:vmCvar_t        g_spSkill;
;66:
;67:extern vmCvar_t bot_developer;
;68:
;69:vec3_t          lastteleport_origin;  // last teleport event origin
;70:float           lastteleport_time;    // last teleport event time
;71:int             max_bspmodelindex;    // maximum BSP model index
;72:
;73:// CTF flag goals
;74:bot_goal_t ctf_redflag;
;75:bot_goal_t ctf_blueflag;
;76:#ifdef MISSIONPACK
;77:bot_goal_t ctf_neutralflag;
;78:bot_goal_t redobelisk;
;79:bot_goal_t blueobelisk;
;80:bot_goal_t neutralobelisk;
;81:#endif
;82:
;83:#define MAX_ALTROUTEGOALS 32
;84:
;85:int                altroutegoals_setup;
;86:aas_altroutegoal_t red_altroutegoals[MAX_ALTROUTEGOALS];
;87:int                red_numaltroutegoals;
;88:aas_altroutegoal_t blue_altroutegoals[MAX_ALTROUTEGOALS];
;89:int                blue_numaltroutegoals;
;90:
;91:/*
;92:==================
;93:BotSetUserInfo
;94:==================
;95:*/
;96:static void BotSetUserInfo(bot_state_t* bs, const char* key, const char* value) {
line 99
;97:	char userinfo[MAX_INFO_STRING];
;98:
;99:	trap_GetUserinfo(bs->client, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 100
;100:	Info_SetValueForKey(userinfo, key, value);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 101
;101:	trap_SetUserinfo(bs->client, userinfo);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 102
;102:	ClientUserinfoChanged(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 103
;103:}
LABELV $55
endproc BotSetUserInfo 1024 12
export BotCTFCarryingFlag
proc BotCTFCarryingFlag 0 0
line 110
;104:
;105:/*
;106:==================
;107:BotCTFCarryingFlag
;108:==================
;109:*/
;110:int BotCTFCarryingFlag(bot_state_t* bs) {
line 111
;111:	if (gametype != GT_CTF)
ADDRGP4 gametype
INDIRI4
CNSTI4 4
EQI4 $57
line 112
;112:		return CTF_FLAG_NONE;
CNSTI4 0
RETI4
ADDRGP4 $56
JUMPV
LABELV $57
line 114
;113:
;114:	if (bs->inventory[INVENTORY_REDFLAG] > 0)
ADDRFP4 0
INDIRP4
CNSTI4 5132
ADDP4
INDIRI4
CNSTI4 0
LEI4 $59
line 115
;115:		return CTF_FLAG_RED;
CNSTI4 1
RETI4
ADDRGP4 $56
JUMPV
LABELV $59
line 116
;116:	else if (bs->inventory[INVENTORY_BLUEFLAG] > 0)
ADDRFP4 0
INDIRP4
CNSTI4 5136
ADDP4
INDIRI4
CNSTI4 0
LEI4 $61
line 117
;117:		return CTF_FLAG_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $56
JUMPV
LABELV $61
line 118
;118:	return CTF_FLAG_NONE;
CNSTI4 0
RETI4
LABELV $56
endproc BotCTFCarryingFlag 0 0
export BotTeam
proc BotTeam 1044 12
line 126
;119:}
;120:
;121:/*
;122:==================
;123:BotTeam
;124:==================
;125:*/
;126:int BotTeam(bot_state_t* bs) {
line 129
;127:	char info[1024];
;128:
;129:	if (bs->client < 0 || bs->client >= MAX_CLIENTS) {
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1024
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
LTI4 $66
ADDRLP4 1024
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 64
LTI4 $64
LABELV $66
line 131
;130:		// BotAI_Print(PRT_ERROR, "BotCTFTeam: client out of range\n");
;131:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $63
JUMPV
LABELV $64
line 133
;132:	}
;133:	trap_GetConfigstring(CS_PLAYERS + bs->client, info, sizeof(info));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 135
;134:	//
;135:	if (atoi(Info_ValueForKey(info, "t")) == TEAM_RED)
ADDRLP4 0
ARGP4
ADDRGP4 $69
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 1
NEI4 $67
line 136
;136:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $63
JUMPV
LABELV $67
line 137
;137:	else if (atoi(Info_ValueForKey(info, "t")) == TEAM_BLUE)
ADDRLP4 0
ARGP4
ADDRGP4 $69
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 2
NEI4 $70
line 138
;138:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $63
JUMPV
LABELV $70
line 139
;139:	return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $63
endproc BotTeam 1044 12
export BotOppositeTeam
proc BotOppositeTeam 12 4
line 147
;140:}
;141:
;142:/*
;143:==================
;144:BotOppositeTeam
;145:==================
;146:*/
;147:int BotOppositeTeam(bot_state_t* bs) {
line 148
;148:	switch (BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $76
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $77
ADDRGP4 $73
JUMPV
LABELV $76
line 150
;149:	case TEAM_RED:
;150:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $72
JUMPV
LABELV $77
line 152
;151:	case TEAM_BLUE:
;152:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $72
JUMPV
LABELV $73
line 154
;153:	default:
;154:		return TEAM_FREE;
CNSTI4 0
RETI4
LABELV $72
endproc BotOppositeTeam 12 4
export BotEnemyFlag
proc BotEnemyFlag 4 4
line 163
;155:	}
;156:}
;157:
;158:/*
;159:==================
;160:BotEnemyFlag
;161:==================
;162:*/
;163:bot_goal_t* BotEnemyFlag(bot_state_t* bs) {
line 164
;164:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $79
line 165
;165:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
ADDRGP4 $78
JUMPV
LABELV $79
line 166
;166:	} else {
line 167
;167:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
LABELV $78
endproc BotEnemyFlag 4 4
export BotTeamFlag
proc BotTeamFlag 4 4
line 176
;168:	}
;169:}
;170:
;171:/*
;172:==================
;173:BotTeamFlag
;174:==================
;175:*/
;176:bot_goal_t* BotTeamFlag(bot_state_t* bs) {
line 177
;177:	if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $82
line 178
;178:		return &ctf_redflag;
ADDRGP4 ctf_redflag
RETP4
ADDRGP4 $81
JUMPV
LABELV $82
line 179
;179:	} else {
line 180
;180:		return &ctf_blueflag;
ADDRGP4 ctf_blueflag
RETP4
LABELV $81
endproc BotTeamFlag 4 4
export EntityIsDead
proc EntityIsDead 472 8
line 189
;181:	}
;182:}
;183:
;184:/*
;185:==================
;186:EntityIsDead
;187:==================
;188:*/
;189:qboolean EntityIsDead(aas_entityinfo_t* entinfo) {
line 192
;190:	playerState_t ps;
;191:
;192:	if (entinfo->number >= 0 && entinfo->number < MAX_CLIENTS) {
ADDRLP4 468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 468
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 0
LTI4 $85
ADDRLP4 468
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 64
GEI4 $85
line 194
;193:		// retrieve the current client state
;194:		BotAI_GetClientState(entinfo->number, &ps);
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 195
;195:		if (ps.pm_type != PM_NORMAL)
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $87
line 196
;196:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $84
JUMPV
LABELV $87
line 197
;197:	}
LABELV $85
line 198
;198:	return qfalse;
CNSTI4 0
RETI4
LABELV $84
endproc EntityIsDead 472 8
export EntityCarriesFlag
proc EntityCarriesFlag 0 0
line 206
;199:}
;200:
;201:/*
;202:==================
;203:EntityCarriesFlag
;204:==================
;205:*/
;206:qboolean EntityCarriesFlag(aas_entityinfo_t* entinfo) {
line 207
;207:	if (entinfo->powerups & (1 << PW_REDFLAG))
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $91
line 208
;208:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $90
JUMPV
LABELV $91
line 209
;209:	if (entinfo->powerups & (1 << PW_BLUEFLAG))
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $93
line 210
;210:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $90
JUMPV
LABELV $93
line 215
;211:#ifdef MISSIONPACK
;212:	if (entinfo->powerups & (1 << PW_NEUTRALFLAG))
;213:		return qtrue;
;214:#endif
;215:	return qfalse;
CNSTI4 0
RETI4
LABELV $90
endproc EntityCarriesFlag 0 0
export EntityIsInvisible
proc EntityIsInvisible 4 4
line 223
;216:}
;217:
;218:/*
;219:==================
;220:EntityIsInvisible
;221:==================
;222:*/
;223:qboolean EntityIsInvisible(aas_entityinfo_t* entinfo) {
line 225
;224:	// the flag is always visible
;225:	if (EntityCarriesFlag(entinfo)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $96
line 226
;226:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $95
JUMPV
LABELV $96
line 228
;227:	}
;228:	if (entinfo->powerups & (1 << PW_INVIS)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $98
line 229
;229:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $95
JUMPV
LABELV $98
line 231
;230:	}
;231:	return qfalse;
CNSTI4 0
RETI4
LABELV $95
endproc EntityIsInvisible 4 4
export EntityIsShooting
proc EntityIsShooting 0 0
line 239
;232:}
;233:
;234:/*
;235:==================
;236:EntityIsShooting
;237:==================
;238:*/
;239:qboolean EntityIsShooting(aas_entityinfo_t* entinfo) {
line 240
;240:	if (entinfo->flags & EF_FIRING) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $101
line 241
;241:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $100
JUMPV
LABELV $101
line 243
;242:	}
;243:	return qfalse;
CNSTI4 0
RETI4
LABELV $100
endproc EntityIsShooting 0 0
export EntityIsChatting
proc EntityIsChatting 0 0
line 251
;244:}
;245:
;246:/*
;247:==================
;248:EntityIsChatting
;249:==================
;250:*/
;251:qboolean EntityIsChatting(aas_entityinfo_t* entinfo) {
line 252
;252:	if (entinfo->flags & EF_TALK) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $104
line 253
;253:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $103
JUMPV
LABELV $104
line 255
;254:	}
;255:	return qfalse;
CNSTI4 0
RETI4
LABELV $103
endproc EntityIsChatting 0 0
export EntityHasQuad
proc EntityHasQuad 0 0
line 263
;256:}
;257:
;258:/*
;259:==================
;260:EntityHasQuad
;261:==================
;262:*/
;263:qboolean EntityHasQuad(aas_entityinfo_t* entinfo) {
line 264
;264:	if (entinfo->powerups & (1 << PW_QUAD)) {
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $107
line 265
;265:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $106
JUMPV
LABELV $107
line 267
;266:	}
;267:	return qfalse;
CNSTI4 0
RETI4
LABELV $106
endproc EntityHasQuad 0 0
export BotRememberLastOrderedTask
proc BotRememberLastOrderedTask 16 12
line 336
;268:}
;269:
;270:#ifdef MISSIONPACK
;271:/*
;272:==================
;273:EntityHasKamikze
;274:==================
;275:*/
;276:qboolean EntityHasKamikaze(aas_entityinfo_t* entinfo) {
;277:	if (entinfo->flags & EF_KAMIKAZE) {
;278:		return qtrue;
;279:	}
;280:	return qfalse;
;281:}
;282:
;283:/*
;284:==================
;285:EntityCarriesCubes
;286:==================
;287:*/
;288:qboolean EntityCarriesCubes(aas_entityinfo_t* entinfo) {
;289:	entityState_t state;
;290:
;291:	if (gametype != GT_HARVESTER)
;292:		return qfalse;
;293:	// FIXME: get this info from the aas_entityinfo_t ?
;294:	BotAI_GetEntityState(entinfo->number, &state);
;295:	if (state.generic1 > 0)
;296:		return qtrue;
;297:	return qfalse;
;298:}
;299:
;300:/*
;301:==================
;302:Bot1FCTFCarryingFlag
;303:==================
;304:*/
;305:int Bot1FCTFCarryingFlag(bot_state_t* bs) {
;306:	if (gametype != GT_1FCTF)
;307:		return qfalse;
;308:
;309:	if (bs->inventory[INVENTORY_NEUTRALFLAG] > 0)
;310:		return qtrue;
;311:	return qfalse;
;312:}
;313:
;314:/*
;315:==================
;316:BotHarvesterCarryingCubes
;317:==================
;318:*/
;319:int BotHarvesterCarryingCubes(bot_state_t* bs) {
;320:	if (gametype != GT_HARVESTER)
;321:		return qfalse;
;322:
;323:	if (bs->inventory[INVENTORY_REDCUBE] > 0)
;324:		return qtrue;
;325:	if (bs->inventory[INVENTORY_BLUECUBE] > 0)
;326:		return qtrue;
;327:	return qfalse;
;328:}
;329:#endif
;330:
;331:/*
;332:==================
;333:BotRememberLastOrderedTask
;334:==================
;335:*/
;336:void BotRememberLastOrderedTask(bot_state_t* bs) {
line 337
;337:	if (!bs->ordered) {
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $110
line 338
;338:		return;
ADDRGP4 $109
JUMPV
LABELV $110
line 340
;339:	}
;340:	bs->lastgoal_decisionmaker = bs->decisionmaker;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6756
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 6608
ADDP4
INDIRI4
ASGNI4
line 341
;341:	bs->lastgoal_ltgtype       = bs->ltgtype;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6760
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
line 342
;342:	memcpy(&bs->lastgoal_teamgoal, &bs->teamgoal, sizeof(bot_goal_t));
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6768
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 343
;343:	bs->lastgoal_teammate = bs->teammate;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6764
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ASGNI4
line 344
;344:}
LABELV $109
endproc BotRememberLastOrderedTask 16 12
export BotSetTeamStatus
proc BotSetTeamStatus 0 0
line 351
;345:
;346:/*
;347:==================
;348:BotSetTeamStatus
;349:==================
;350:*/
;351:void BotSetTeamStatus(bot_state_t* bs) {
line 406
;352:#ifdef MISSIONPACK
;353:	int              teamtask;
;354:	aas_entityinfo_t entinfo;
;355:
;356:	teamtask = TEAMTASK_PATROL;
;357:
;358:	switch (bs->ltgtype) {
;359:	case LTG_TEAMHELP:
;360:		break;
;361:	case LTG_TEAMACCOMPANY:
;362:		BotEntityInfo(bs->teammate, &entinfo);
;363:		if (((gametype == GT_CTF || gametype == GT_1FCTF) && EntityCarriesFlag(&entinfo)) || (gametype == GT_HARVESTER && EntityCarriesCubes(&entinfo))) {
;364:			teamtask = TEAMTASK_ESCORT;
;365:		} else {
;366:			teamtask = TEAMTASK_FOLLOW;
;367:		}
;368:		break;
;369:	case LTG_DEFENDKEYAREA:
;370:		teamtask = TEAMTASK_DEFENSE;
;371:		break;
;372:	case LTG_GETFLAG:
;373:		teamtask = TEAMTASK_OFFENSE;
;374:		break;
;375:	case LTG_RUSHBASE:
;376:		teamtask = TEAMTASK_DEFENSE;
;377:		break;
;378:	case LTG_RETURNFLAG:
;379:		teamtask = TEAMTASK_RETRIEVE;
;380:		break;
;381:	case LTG_CAMP:
;382:	case LTG_CAMPORDER:
;383:		teamtask = TEAMTASK_CAMP;
;384:		break;
;385:	case LTG_PATROL:
;386:		teamtask = TEAMTASK_PATROL;
;387:		break;
;388:	case LTG_GETITEM:
;389:		teamtask = TEAMTASK_PATROL;
;390:		break;
;391:	case LTG_KILL:
;392:		teamtask = TEAMTASK_PATROL;
;393:		break;
;394:	case LTG_HARVEST:
;395:		teamtask = TEAMTASK_OFFENSE;
;396:		break;
;397:	case LTG_ATTACKENEMYBASE:
;398:		teamtask = TEAMTASK_OFFENSE;
;399:		break;
;400:	default:
;401:		teamtask = TEAMTASK_PATROL;
;402:		break;
;403:	}
;404:	BotSetUserInfo(bs, "teamtask", va("%d", teamtask));
;405:#endif
;406:}
LABELV $112
endproc BotSetTeamStatus 0 0
export BotSetLastOrderedTask
proc BotSetLastOrderedTask 60 16
line 413
;407:
;408:/*
;409:==================
;410:BotSetLastOrderedTask
;411:==================
;412:*/
;413:int BotSetLastOrderedTask(bot_state_t* bs) {
line 415
;414:
;415:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $114
line 417
;416:		// don't go back to returning the flag if it's at the base
;417:		if (bs->lastgoal_ltgtype == LTG_RETURNFLAG) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 6
NEI4 $116
line 418
;418:			if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $118
line 419
;419:				if (bs->redflagstatus == 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 0
NEI4 $119
line 420
;420:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 421
;421:				}
line 422
;422:			} else {
ADDRGP4 $119
JUMPV
LABELV $118
line 423
;423:				if (bs->blueflagstatus == 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 0
NEI4 $122
line 424
;424:					bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 425
;425:				}
LABELV $122
line 426
;426:			}
LABELV $119
line 427
;427:		}
LABELV $116
line 428
;428:	}
LABELV $114
line 430
;429:
;430:	if (bs->lastgoal_ltgtype) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $124
line 431
;431:		bs->decisionmaker = bs->lastgoal_decisionmaker;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 6756
ADDP4
INDIRI4
ASGNI4
line 432
;432:		bs->ordered       = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 433
;433:		bs->ltgtype       = bs->lastgoal_ltgtype;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6600
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
ASGNI4
line 434
;434:		memcpy(&bs->teamgoal, &bs->lastgoal_teamgoal, sizeof(bot_goal_t));
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 6768
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 435
;435:		bs->teammate      = bs->lastgoal_teammate;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 6764
ADDP4
INDIRI4
ASGNI4
line 436
;436:		bs->teamgoal_time = FloatTime() + 300;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1133903872
ADDF4
ASGNF4
line 437
;437:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 439
;438:		//
;439:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $126
line 440
;440:			if (bs->ltgtype == LTG_GETFLAG) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $128
line 444
;441:				bot_goal_t *tb, *eb;
;442:				int         tt, et;
;443:
;444:				tb = BotTeamFlag(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 BotTeamFlag
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 445
;445:				eb = BotEnemyFlag(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotEnemyFlag
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 446
;446:				tt = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, tb->areanum, TFL_DEFAULT);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 44
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 44
INDIRI4
ASGNI4
line 447
;447:				et = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, eb->areanum, TFL_DEFAULT);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 52
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 52
INDIRI4
ASGNI4
line 449
;448:				// if the travel time towards the enemy base is larger than towards our base
;449:				if (et > tt) {
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
LEI4 $130
line 451
;450:					// get an alternative route goal towards the enemy base
;451:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 452
;452:				}
LABELV $130
line 453
;453:			}
LABELV $128
line 454
;454:		}
LABELV $126
line 455
;455:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $113
JUMPV
LABELV $124
line 457
;456:	}
;457:	return qfalse;
CNSTI4 0
RETI4
LABELV $113
endproc BotSetLastOrderedTask 60 16
export BotRefuseOrder
proc BotRefuseOrder 4 8
line 465
;458:}
;459:
;460:/*
;461:==================
;462:BotRefuseOrder
;463:==================
;464:*/
;465:void BotRefuseOrder(bot_state_t* bs) {
line 466
;466:	if (!bs->ordered)
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $133
line 467
;467:		return;
ADDRGP4 $132
JUMPV
LABELV $133
line 469
;468:	// if the bot was ordered to do something
;469:	if (bs->order_time && bs->order_time > FloatTime() - 10) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6616
ADDP4
INDIRF4
CNSTF4 0
EQF4 $135
ADDRLP4 0
INDIRP4
CNSTI4 6616
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
SUBF4
LEF4 $135
line 470
;470:		trap_EA_Action(bs->client, ACTION_NEGATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 2097152
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 474
;471:#ifdef MISSIONPACK
;472:		BotVoiceChat(bs, bs->decisionmaker, VOICECHAT_NO);
;473:#endif
;474:		bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
CNSTF4 0
ASGNF4
line 475
;475:	}
LABELV $135
line 476
;476:}
LABELV $132
endproc BotRefuseOrder 4 8
export BotCTFSeekGoals
proc BotCTFSeekGoals 228 12
line 483
;477:
;478:/*
;479:==================
;480:BotCTFSeekGoals
;481:==================
;482:*/
;483:void BotCTFSeekGoals(bot_state_t* bs) {
line 490
;484:	float            rnd, l1, l2;
;485:	int              flagstatus, c;
;486:	vec3_t           dir;
;487:	aas_entityinfo_t entinfo;
;488:
;489:	// when carrying a flag in ctf the bot should rush to the base
;490:	if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 172
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 0
EQI4 $138
line 492
;491:		// if not already rushing to the base
;492:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $140
line 493
;493:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 494
;494:			bs->ltgtype           = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 495
;495:			bs->teamgoal_time     = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 496
;496:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 497
;497:			bs->decisionmaker     = bs->client;
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 176
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 498
;498:			bs->ordered           = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 500
;499:			//
;500:			switch (BotTeam(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 184
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 180
ADDRLP4 184
INDIRI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1
EQI4 $145
ADDRLP4 180
INDIRI4
CNSTI4 2
EQI4 $150
ADDRGP4 $142
JUMPV
LABELV $145
line 502
;501:			case TEAM_RED:
;502:				VectorSubtract(bs->origin, ctf_blueflag.origin, dir);
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
ADDRLP4 192
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 192
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRGP4 ctf_blueflag+8
INDIRF4
SUBF4
ASGNF4
line 503
;503:				break;
ADDRGP4 $143
JUMPV
LABELV $150
line 505
;504:			case TEAM_BLUE:
;505:				VectorSubtract(bs->origin, ctf_redflag.origin, dir);
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
ADDRLP4 196
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRGP4 ctf_redflag
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+4
ADDRLP4 196
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRGP4 ctf_redflag+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 160+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRGP4 ctf_redflag+8
INDIRF4
SUBF4
ASGNF4
line 506
;506:				break;
ADDRGP4 $143
JUMPV
LABELV $142
line 508
;507:			default:
;508:				VectorSet(dir, 999, 999, 999);
ADDRLP4 160
CNSTF4 1148829696
ASGNF4
ADDRLP4 160+4
CNSTF4 1148829696
ASGNF4
ADDRLP4 160+8
CNSTF4 1148829696
ASGNF4
line 509
;509:				break;
LABELV $143
line 512
;510:			}
;511:			// if the bot picked up the flag very close to the enemy base
;512:			if (VectorLength(dir) < 128) {
ADDRLP4 160
ARGP4
ADDRLP4 192
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 192
INDIRF4
CNSTF4 1124073472
GEF4 $157
line 514
;513:				// get an alternative route goal through the enemy base
;514:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 515
;515:			} else {
ADDRGP4 $158
JUMPV
LABELV $157
line 517
;516:				// don't use any alt route goal, just get the hell out of the base
;517:				bs->altroutegoal.areanum = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6692
ADDP4
CNSTI4 0
ASGNI4
line 518
;518:			}
LABELV $158
line 519
;519:			BotSetUserInfo(bs, "teamtask", va("%d", TEAMTASK_OFFENSE));
ADDRGP4 $160
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 196
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $159
ARGP4
ADDRLP4 196
INDIRP4
ARGP4
ADDRGP4 BotSetUserInfo
CALLV
pop
line 523
;520:#ifdef MISSIONPACK
;521:			BotVoiceChat(bs, -1, VOICECHAT_IHAVEFLAG);
;522:#endif
;523:		} else if (bs->rushbaseaway_time > FloatTime()) {
ADDRGP4 $137
JUMPV
LABELV $140
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $137
line 524
;524:			if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 1
NEI4 $163
line 525
;525:				flagstatus = bs->redflagstatus;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $164
JUMPV
LABELV $163
line 527
;526:			else
;527:				flagstatus = bs->blueflagstatus;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
ASGNI4
LABELV $164
line 529
;528:			// if the flag is back
;529:			if (flagstatus == 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $137
line 530
;530:				bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 531
;531:			}
line 532
;532:		}
line 533
;533:		return;
ADDRGP4 $137
JUMPV
LABELV $138
line 536
;534:	}
;535:	// if the bot decided to follow someone
;536:	if (bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered) {
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $167
ADDRLP4 176
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $167
line 538
;537:		// if the team mate being accompanied no longer carries the flag
;538:		BotEntityInfo(bs->teammate, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 539
;539:		if (!EntityCarriesFlag(&entinfo)) {
ADDRLP4 16
ARGP4
ADDRLP4 180
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 0
NEI4 $169
line 540
;540:			bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 541
;541:		}
LABELV $169
line 542
;542:	}
LABELV $167
line 544
;543:	//
;544:	if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 180
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1
NEI4 $171
line 545
;545:		flagstatus = bs->redflagstatus * 2 + bs->blueflagstatus;
ADDRLP4 184
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 184
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 184
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $172
JUMPV
LABELV $171
line 547
;546:	else
;547:		flagstatus = bs->blueflagstatus * 2 + bs->redflagstatus;
ADDRLP4 188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 188
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 188
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $172
line 549
;548:	// if our team has the enemy flag and our flag is at the base
;549:	if (flagstatus == 1) {
ADDRLP4 0
INDIRI4
CNSTI4 1
NEI4 $173
line 551
;550:		//
;551:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $137
line 553
;552:			// if Not defending the base already
;553:			if (!(bs->ltgtype == LTG_DEFENDKEYAREA && (bs->teamgoal.number == ctf_redflag.number || bs->teamgoal.number == ctf_blueflag.number))) {
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
NEI4 $181
ADDRLP4 192
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ADDRGP4 ctf_redflag+44
INDIRI4
EQI4 $137
ADDRLP4 192
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ADDRGP4 ctf_blueflag+44
INDIRI4
EQI4 $137
LABELV $181
line 555
;554:				// if there is a visible team mate flag carrier
;555:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 196
INDIRI4
ASGNI4
line 556
;556:				if (c >= 0 &&
ADDRLP4 200
ADDRLP4 156
INDIRI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
LTI4 $137
ADDRLP4 204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 204
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
NEI4 $184
ADDRLP4 204
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ADDRLP4 200
INDIRI4
EQI4 $137
LABELV $184
line 558
;557:				    // and not already following the team mate flag carrier
;558:				    (bs->ltgtype != LTG_TEAMACCOMPANY || bs->teammate != c)) {
line 560
;559:					//
;560:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 562
;561:					// follow the flag carrier
;562:					bs->decisionmaker = bs->client;
ADDRLP4 208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 208
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 563
;563:					bs->ordered       = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 565
;564:					// the team mate
;565:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 567
;566:					// last time the team mate was visible
;567:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 569
;568:					// no message
;569:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 571
;570:					// no arrive message
;571:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 577
;572:					//
;573:#ifdef MISSIONPACK
;574:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;575:#endif
;576:					// get the team goal time
;577:					bs->teamgoal_time  = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 578
;578:					bs->ltgtype        = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 579
;579:					bs->formation_dist = 3.5 * 32;  // 3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7016
ADDP4
CNSTF4 1121976320
ASGNF4
line 580
;580:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 581
;581:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 582
;582:				}
line 583
;583:			}
line 584
;584:		}
line 585
;585:		return;
ADDRGP4 $137
JUMPV
LABELV $173
line 588
;586:	}
;587:	// if the enemy has our flag
;588:	else if (flagstatus == 2) {
ADDRLP4 0
INDIRI4
CNSTI4 2
NEI4 $185
line 590
;589:		//
;590:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $137
line 592
;591:			// if enemy flag carrier is visible
;592:			c = BotEnemyFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotEnemyFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 192
INDIRI4
ASGNI4
line 593
;593:			if (c >= 0) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $189
line 595
;594:				// FIXME: fight enemy flag carrier
;595:			}
LABELV $189
line 597
;596:			// if not already doing something important
;597:			if (bs->ltgtype != LTG_GETFLAG && bs->ltgtype != LTG_RETURNFLAG && bs->ltgtype != LTG_TEAMHELP && bs->ltgtype != LTG_TEAMACCOMPANY &&
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $137
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
EQI4 $137
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $137
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $137
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $137
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
EQI4 $137
ADDRLP4 196
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 10
EQI4 $137
line 598
;598:			    bs->ltgtype != LTG_CAMPORDER && bs->ltgtype != LTG_PATROL && bs->ltgtype != LTG_GETITEM) {
line 600
;599:
;600:				BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 601
;601:				bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 602
;602:				bs->ordered       = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 604
;603:				//
;604:				if (random() < 0.5) {
ADDRLP4 204
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
GEF4 $193
line 606
;605:					// go for the enemy flag
;606:					bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 607
;607:				} else {
ADDRGP4 $194
JUMPV
LABELV $193
line 608
;608:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 609
;609:				}
LABELV $194
line 611
;610:				// no team message
;611:				bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 613
;612:				// set the time the bot will stop getting the flag
;613:				bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 615
;614:				// get an alternative route goal towards the enemy base
;615:				BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 617
;616:				//
;617:				BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 618
;618:				bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 619
;619:			}
line 620
;620:		}
line 621
;621:		return;
ADDRGP4 $137
JUMPV
LABELV $185
line 624
;622:	}
;623:	// if both flags Not at their bases
;624:	else if (flagstatus == 3) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $195
line 626
;625:		//
;626:		if (bs->owndecision_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
GEF4 $137
line 628
;627:			// if not trying to return the flag and not following the team flag carrier
;628:			if (bs->ltgtype != LTG_RETURNFLAG && bs->ltgtype != LTG_TEAMACCOMPANY) {
ADDRLP4 192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
EQI4 $137
ADDRLP4 192
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $137
line 630
;629:				//
;630:				c = BotTeamFlagCarrierVisible(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotTeamFlagCarrierVisible
CALLI4
ASGNI4
ADDRLP4 156
ADDRLP4 196
INDIRI4
ASGNI4
line 632
;631:				// if there is a visible team mate flag carrier
;632:				if (c >= 0) {
ADDRLP4 156
INDIRI4
CNSTI4 0
LTI4 $201
line 633
;633:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 635
;634:					// follow the flag carrier
;635:					bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 636
;636:					bs->ordered       = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 638
;637:					// the team mate
;638:					bs->teammate = c;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 156
INDIRI4
ASGNI4
line 640
;639:					// last time the team mate was visible
;640:					bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 642
;641:					// no message
;642:					bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 644
;643:					// no arrive message
;644:					bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 650
;645:					//
;646:#ifdef MISSIONPACK
;647:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;648:#endif
;649:					// get the team goal time
;650:					bs->teamgoal_time  = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 651
;651:					bs->ltgtype        = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 652
;652:					bs->formation_dist = 3.5 * 32;  // 3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7016
ADDP4
CNSTF4 1121976320
ASGNF4
line 654
;653:					//
;654:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 655
;655:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 656
;656:				} else {
ADDRGP4 $137
JUMPV
LABELV $201
line 657
;657:					BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 658
;658:					bs->decisionmaker = bs->client;
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 200
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 659
;659:					bs->ordered       = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 661
;660:					// get the enemy flag
;661:					bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 204
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 204
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 663
;662:					// get the flag
;663:					bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 665
;664:					// set the time the bot will stop getting the flag
;665:					bs->teamgoal_time = FloatTime() + CTF_RETURNFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 667
;666:					// get an alternative route goal towards the enemy base
;667:					BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 669
;668:					//
;669:					BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 670
;670:					bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 671
;671:				}
line 672
;672:			}
line 673
;673:		}
line 674
;674:		return;
ADDRGP4 $137
JUMPV
LABELV $195
line 677
;675:	}
;676:	// don't just do something wait for the bot team leader to give orders
;677:	if (BotTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotTeamLeader
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
EQI4 $203
line 678
;678:		return;
ADDRGP4 $137
JUMPV
LABELV $203
line 681
;679:	}
;680:	// if the bot is ordered to do something
;681:	if (bs->lastgoal_ltgtype) {
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $205
line 682
;682:		bs->teamgoal_time += 60;
ADDRLP4 196
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ASGNP4
ADDRLP4 196
INDIRP4
ADDRLP4 196
INDIRP4
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 683
;683:	}
LABELV $205
line 685
;684:	// if the bot decided to do something on it's own and has a last ordered goal
;685:	if (!bs->ordered && bs->lastgoal_ltgtype) {
ADDRLP4 196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 196
INDIRP4
CNSTI4 6612
ADDP4
INDIRI4
CNSTI4 0
NEI4 $207
ADDRLP4 196
INDIRP4
CNSTI4 6760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $207
line 686
;686:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 687
;687:	}
LABELV $207
line 689
;688:	// if already a CTF or team goal
;689:	if (bs->ltgtype == LTG_TEAMHELP || bs->ltgtype == LTG_TEAMACCOMPANY || bs->ltgtype == LTG_DEFENDKEYAREA || bs->ltgtype == LTG_GETFLAG ||
ADDRLP4 200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $220
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $220
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $220
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $220
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $220
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 6
EQI4 $220
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $220
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
EQI4 $220
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 10
EQI4 $220
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 14
EQI4 $220
ADDRLP4 200
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 15
NEI4 $209
LABELV $220
line 691
;690:	    bs->ltgtype == LTG_RUSHBASE || bs->ltgtype == LTG_RETURNFLAG || bs->ltgtype == LTG_CAMPORDER || bs->ltgtype == LTG_PATROL ||
;691:	    bs->ltgtype == LTG_GETITEM || bs->ltgtype == LTG_MAKELOVE_UNDER || bs->ltgtype == LTG_MAKELOVE_ONTOP) {
line 692
;692:		return;
ADDRGP4 $137
JUMPV
LABELV $209
line 695
;693:	}
;694:	//
;695:	if (BotSetLastOrderedTask(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $221
line 696
;696:		return;
ADDRGP4 $137
JUMPV
LABELV $221
line 698
;697:	//
;698:	if (bs->owndecision_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 floattime
INDIRF4
LEF4 $223
line 699
;699:		return;
ADDRGP4 $137
JUMPV
LABELV $223
line 700
;700:	;
line 702
;701:	// if the bot is roaming
;702:	if (bs->ctfroam_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $225
line 703
;703:		return;
ADDRGP4 $137
JUMPV
LABELV $225
line 705
;704:	// if the bot has anough aggression to decide what to do
;705:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 208
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 208
INDIRF4
CNSTF4 1112014848
GEF4 $227
line 706
;706:		return;
ADDRGP4 $137
JUMPV
LABELV $227
line 708
;707:	// set the time to send a message to the team mates
;708:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 212
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 212
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
ASGNF4
line 710
;709:	//
;710:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER | TEAMTP_DEFENDER)) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 0
EQI4 $229
line 711
;711:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
ADDRFP4 0
INDIRP4
CNSTI4 6752
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $231
line 712
;712:			l1 = 0.7f;
ADDRLP4 8
CNSTF4 1060320051
ASGNF4
line 713
;713:		} else {
ADDRGP4 $232
JUMPV
LABELV $231
line 714
;714:			l1 = 0.2f;
ADDRLP4 8
CNSTF4 1045220557
ASGNF4
line 715
;715:		}
LABELV $232
line 716
;716:		l2 = 0.9f;
ADDRLP4 12
CNSTF4 1063675494
ASGNF4
line 717
;717:	} else {
ADDRGP4 $230
JUMPV
LABELV $229
line 718
;718:		l1 = 0.4f;
ADDRLP4 8
CNSTF4 1053609165
ASGNF4
line 719
;719:		l2 = 0.7f;
ADDRLP4 12
CNSTF4 1060320051
ASGNF4
line 720
;720:	}
LABELV $230
line 722
;721:	// get the flag or defend the base
;722:	rnd = random();
ADDRLP4 216
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 216
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ASGNF4
line 723
;723:	if (rnd < l1 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
GEF4 $233
ADDRGP4 ctf_redflag+12
INDIRI4
CNSTI4 0
EQI4 $233
ADDRGP4 ctf_blueflag+12
INDIRI4
CNSTI4 0
EQI4 $233
line 724
;724:		bs->decisionmaker = bs->client;
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 220
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 725
;725:		bs->ordered       = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 726
;726:		bs->ltgtype       = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 728
;727:		// set the time the bot will stop getting the flag
;728:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 730
;729:		// get an alternative route goal towards the enemy base
;730:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 224
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 224
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 731
;731:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 732
;732:	} else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
ADDRGP4 $234
JUMPV
LABELV $233
ADDRLP4 4
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $237
ADDRGP4 ctf_redflag+12
INDIRI4
CNSTI4 0
EQI4 $237
ADDRGP4 ctf_blueflag+12
INDIRI4
CNSTI4 0
EQI4 $237
line 733
;733:		bs->decisionmaker = bs->client;
ADDRLP4 220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 220
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 220
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 734
;734:		bs->ordered       = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 736
;735:		//
;736:		if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 224
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 224
INDIRI4
CNSTI4 1
NEI4 $241
line 737
;737:			memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_redflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
ADDRGP4 $242
JUMPV
LABELV $241
line 739
;738:		else
;739:			memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
LABELV $242
line 741
;740:		// set the ltg type
;741:		bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 743
;742:		// set the time the bot stops defending the base
;743:		bs->teamgoal_time   = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 744
;744:		bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 745
;745:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 746
;746:	} else {
ADDRGP4 $238
JUMPV
LABELV $237
line 747
;747:		bs->ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 749
;748:		// set the time the bot will stop roaming
;749:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6164
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 750
;750:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 751
;751:	}
LABELV $238
LABELV $234
line 752
;752:	bs->owndecision_time = FloatTime() + 5;
ADDRFP4 0
INDIRP4
CNSTI4 6620
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
CVFI4 4
ASGNI4
line 756
;753:#ifdef DEBUG
;754:	BotPrintTeamGoal(bs);
;755:#endif  // DEBUG
;756:}
LABELV $137
endproc BotCTFSeekGoals 228 12
export BotCTFRetreatGoals
proc BotCTFRetreatGoals 8 4
line 763
;757:
;758:/*
;759:==================
;760:BotCTFRetreatGoals
;761:==================
;762:*/
;763:void BotCTFRetreatGoals(bot_state_t* bs) {
line 765
;764:	// when carrying a flag in ctf the bot should rush to the base
;765:	if (BotCTFCarryingFlag(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $244
line 767
;766:		// if not already rushing to the base
;767:		if (bs->ltgtype != LTG_RUSHBASE) {
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $246
line 768
;768:			BotRefuseOrder(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRefuseOrder
CALLV
pop
line 769
;769:			bs->ltgtype           = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 770
;770:			bs->teamgoal_time     = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 771
;771:			bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 772
;772:			bs->decisionmaker     = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 773
;773:			bs->ordered           = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 774
;774:			BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 775
;775:		}
LABELV $246
line 776
;776:	}
LABELV $244
line 777
;777:}
LABELV $243
endproc BotCTFRetreatGoals 8 4
export BotTeamGoals
proc BotTeamGoals 0 4
line 1285
;778:
;779:#ifdef MISSIONPACK
;780:/*
;781:==================
;782:Bot1FCTFSeekGoals
;783:==================
;784:*/
;785:void Bot1FCTFSeekGoals(bot_state_t* bs) {
;786:	aas_entityinfo_t entinfo;
;787:	float            rnd, l1, l2;
;788:	int              c;
;789:
;790:	// when carrying a flag in ctf the bot should rush to the base
;791:	if (Bot1FCTFCarryingFlag(bs)) {
;792:		// if not already rushing to the base
;793:		if (bs->ltgtype != LTG_RUSHBASE) {
;794:			BotRefuseOrder(bs);
;795:			bs->ltgtype           = LTG_RUSHBASE;
;796:			bs->teamgoal_time     = FloatTime() + CTF_RUSHBASE_TIME;
;797:			bs->rushbaseaway_time = 0;
;798:			bs->decisionmaker     = bs->client;
;799:			bs->ordered           = qfalse;
;800:			// get an alternative route goal towards the enemy base
;801:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;802:			//
;803:			BotSetTeamStatus(bs);
;804:#ifdef MISSIONPACK
;805:			BotVoiceChat(bs, -1, VOICECHAT_IHAVEFLAG);
;806:#endif
;807:		}
;808:		return;
;809:	}
;810:	// if the bot decided to follow someone
;811:	if (bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered) {
;812:		// if the team mate being accompanied no longer carries the flag
;813:		BotEntityInfo(bs->teammate, &entinfo);
;814:		if (!EntityCarriesFlag(&entinfo)) {
;815:			bs->ltgtype = 0;
;816:		}
;817:	}
;818:	// our team has the flag
;819:	if (bs->neutralflagstatus == 1) {
;820:		if (bs->owndecision_time < FloatTime()) {
;821:			// if not already following someone
;822:			if (bs->ltgtype != LTG_TEAMACCOMPANY) {
;823:				// if there is a visible team mate flag carrier
;824:				c = BotTeamFlagCarrierVisible(bs);
;825:				if (c >= 0) {
;826:					BotRefuseOrder(bs);
;827:					// follow the flag carrier
;828:					bs->decisionmaker = bs->client;
;829:					bs->ordered       = qfalse;
;830:					// the team mate
;831:					bs->teammate = c;
;832:					// last time the team mate was visible
;833:					bs->teammatevisible_time = FloatTime();
;834:					// no message
;835:					bs->teammessage_time = 0;
;836:					// no arrive message
;837:					bs->arrive_time = 1;
;838:					//
;839:#ifdef MISSIONPACK
;840:					BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;841:#endif
;842:					// get the team goal time
;843:					bs->teamgoal_time  = FloatTime() + TEAM_ACCOMPANY_TIME;
;844:					bs->ltgtype        = LTG_TEAMACCOMPANY;
;845:					bs->formation_dist = 3.5 * 32;  // 3.5 meter
;846:					BotSetTeamStatus(bs);
;847:					bs->owndecision_time = FloatTime() + 5;
;848:					return;
;849:				}
;850:			}
;851:			// if already a CTF or team goal
;852:			if (bs->ltgtype == LTG_TEAMHELP || bs->ltgtype == LTG_TEAMACCOMPANY || bs->ltgtype == LTG_DEFENDKEYAREA || bs->ltgtype == LTG_GETFLAG ||
;853:			    bs->ltgtype == LTG_RUSHBASE || bs->ltgtype == LTG_CAMPORDER || bs->ltgtype == LTG_PATROL || bs->ltgtype == LTG_ATTACKENEMYBASE ||
;854:			    bs->ltgtype == LTG_GETITEM || bs->ltgtype == LTG_MAKELOVE_UNDER || bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;855:				return;
;856:			}
;857:			// if not already attacking the enemy base
;858:			if (bs->ltgtype != LTG_ATTACKENEMYBASE) {
;859:				BotRefuseOrder(bs);
;860:				bs->decisionmaker = bs->client;
;861:				bs->ordered       = qfalse;
;862:				//
;863:				if (BotTeam(bs) == TEAM_RED)
;864:					memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;865:				else
;866:					memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;867:				// set the ltg type
;868:				bs->ltgtype = LTG_ATTACKENEMYBASE;
;869:				// set the time the bot will stop getting the flag
;870:				bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
;871:				BotSetTeamStatus(bs);
;872:				bs->owndecision_time = FloatTime() + 5;
;873:			}
;874:		}
;875:		return;
;876:	}
;877:	// enemy team has the flag
;878:	else if (bs->neutralflagstatus == 2) {
;879:		if (bs->owndecision_time < FloatTime()) {
;880:			c = BotEnemyFlagCarrierVisible(bs);
;881:			if (c >= 0) {
;882:				// FIXME: attack enemy flag carrier
;883:			}
;884:			// if already a CTF or team goal
;885:			if (bs->ltgtype == LTG_TEAMHELP || bs->ltgtype == LTG_TEAMACCOMPANY || bs->ltgtype == LTG_CAMPORDER || bs->ltgtype == LTG_PATROL ||
;886:			    bs->ltgtype == LTG_GETITEM) {
;887:				return;
;888:			}
;889:			// if not already defending the base
;890:			if (bs->ltgtype != LTG_DEFENDKEYAREA) {
;891:				BotRefuseOrder(bs);
;892:				bs->decisionmaker = bs->client;
;893:				bs->ordered       = qfalse;
;894:				//
;895:				if (BotTeam(bs) == TEAM_RED)
;896:					memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;897:				else
;898:					memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;899:				// set the ltg type
;900:				bs->ltgtype = LTG_DEFENDKEYAREA;
;901:				// set the time the bot stops defending the base
;902:				bs->teamgoal_time   = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;903:				bs->defendaway_time = 0;
;904:				BotSetTeamStatus(bs);
;905:				bs->owndecision_time = FloatTime() + 5;
;906:			}
;907:		}
;908:		return;
;909:	}
;910:	// don't just do something wait for the bot team leader to give orders
;911:	if (BotTeamLeader(bs)) {
;912:		return;
;913:	}
;914:	// if the bot is ordered to do something
;915:	if (bs->lastgoal_ltgtype) {
;916:		bs->teamgoal_time += 60;
;917:	}
;918:	// if the bot decided to do something on it's own and has a last ordered goal
;919:	if (!bs->ordered && bs->lastgoal_ltgtype) {
;920:		bs->ltgtype = 0;
;921:	}
;922:	// if already a CTF or team goal
;923:	if (bs->ltgtype == LTG_TEAMHELP || bs->ltgtype == LTG_TEAMACCOMPANY || bs->ltgtype == LTG_DEFENDKEYAREA || bs->ltgtype == LTG_GETFLAG ||
;924:	    bs->ltgtype == LTG_RUSHBASE || bs->ltgtype == LTG_RETURNFLAG || bs->ltgtype == LTG_CAMPORDER || bs->ltgtype == LTG_PATROL ||
;925:	    bs->ltgtype == LTG_ATTACKENEMYBASE || bs->ltgtype == LTG_GETITEM || bs->ltgtype == LTG_MAKELOVE_UNDER || bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;926:		return;
;927:	}
;928:	//
;929:	if (BotSetLastOrderedTask(bs))
;930:		return;
;931:	//
;932:	if (bs->owndecision_time > FloatTime())
;933:		return;
;934:	;
;935:	// if the bot is roaming
;936:	if (bs->ctfroam_time > FloatTime())
;937:		return;
;938:	// if the bot has anough aggression to decide what to do
;939:	if (BotAggression(bs) < 50)
;940:		return;
;941:	// set the time to send a message to the team mates
;942:	bs->teammessage_time = FloatTime() + 2 * random();
;943:	//
;944:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER | TEAMTP_DEFENDER)) {
;945:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;946:			l1 = 0.7f;
;947:		} else {
;948:			l1 = 0.2f;
;949:		}
;950:		l2 = 0.9f;
;951:	} else {
;952:		l1 = 0.4f;
;953:		l2 = 0.7f;
;954:	}
;955:	// get the flag or defend the base
;956:	rnd = random();
;957:	if (rnd < l1 && ctf_neutralflag.areanum) {
;958:		bs->decisionmaker = bs->client;
;959:		bs->ordered       = qfalse;
;960:		bs->ltgtype       = LTG_GETFLAG;
;961:		// set the time the bot will stop getting the flag
;962:		bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
;963:		BotSetTeamStatus(bs);
;964:	} else if (rnd < l2 && ctf_redflag.areanum && ctf_blueflag.areanum) {
;965:		bs->decisionmaker = bs->client;
;966:		bs->ordered       = qfalse;
;967:		//
;968:		if (BotTeam(bs) == TEAM_RED)
;969:			memcpy(&bs->teamgoal, &ctf_redflag, sizeof(bot_goal_t));
;970:		else
;971:			memcpy(&bs->teamgoal, &ctf_blueflag, sizeof(bot_goal_t));
;972:		// set the ltg type
;973:		bs->ltgtype = LTG_DEFENDKEYAREA;
;974:		// set the time the bot stops defending the base
;975:		bs->teamgoal_time   = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;976:		bs->defendaway_time = 0;
;977:		BotSetTeamStatus(bs);
;978:	} else {
;979:		bs->ltgtype = 0;
;980:		// set the time the bot will stop roaming
;981:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;982:		BotSetTeamStatus(bs);
;983:	}
;984:	bs->owndecision_time = FloatTime() + 5;
;985:#ifdef DEBUG
;986:	BotPrintTeamGoal(bs);
;987:#endif  // DEBUG
;988:}
;989:
;990:/*
;991:==================
;992:Bot1FCTFRetreatGoals
;993:==================
;994:*/
;995:void Bot1FCTFRetreatGoals(bot_state_t* bs) {
;996:	// when carrying a flag in ctf the bot should rush to the enemy base
;997:	if (Bot1FCTFCarryingFlag(bs)) {
;998:		// if not already rushing to the base
;999:		if (bs->ltgtype != LTG_RUSHBASE) {
;1000:			BotRefuseOrder(bs);
;1001:			bs->ltgtype           = LTG_RUSHBASE;
;1002:			bs->teamgoal_time     = FloatTime() + CTF_RUSHBASE_TIME;
;1003:			bs->rushbaseaway_time = 0;
;1004:			bs->decisionmaker     = bs->client;
;1005:			bs->ordered           = qfalse;
;1006:			// get an alternative route goal towards the enemy base
;1007:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1008:			BotSetTeamStatus(bs);
;1009:		}
;1010:	}
;1011:}
;1012:
;1013:/*
;1014:==================
;1015:BotObeliskSeekGoals
;1016:==================
;1017:*/
;1018:void BotObeliskSeekGoals(bot_state_t* bs) {
;1019:	float rnd, l1, l2;
;1020:
;1021:	// don't just do something wait for the bot team leader to give orders
;1022:	if (BotTeamLeader(bs)) {
;1023:		return;
;1024:	}
;1025:	// if the bot is ordered to do something
;1026:	if (bs->lastgoal_ltgtype) {
;1027:		bs->teamgoal_time += 60;
;1028:	}
;1029:	// if already a team goal
;1030:	if (bs->ltgtype == LTG_TEAMHELP || bs->ltgtype == LTG_TEAMACCOMPANY || bs->ltgtype == LTG_DEFENDKEYAREA || bs->ltgtype == LTG_GETFLAG ||
;1031:	    bs->ltgtype == LTG_RUSHBASE || bs->ltgtype == LTG_RETURNFLAG || bs->ltgtype == LTG_CAMPORDER || bs->ltgtype == LTG_PATROL ||
;1032:	    bs->ltgtype == LTG_ATTACKENEMYBASE || bs->ltgtype == LTG_GETITEM || bs->ltgtype == LTG_MAKELOVE_UNDER || bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;1033:		return;
;1034:	}
;1035:	//
;1036:	if (BotSetLastOrderedTask(bs))
;1037:		return;
;1038:	// if the bot is roaming
;1039:	if (bs->ctfroam_time > FloatTime())
;1040:		return;
;1041:	// if the bot has anough aggression to decide what to do
;1042:	if (BotAggression(bs) < 50)
;1043:		return;
;1044:	// set the time to send a message to the team mates
;1045:	bs->teammessage_time = FloatTime() + 2 * random();
;1046:	//
;1047:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER | TEAMTP_DEFENDER)) {
;1048:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;1049:			l1 = 0.7f;
;1050:		} else {
;1051:			l1 = 0.2f;
;1052:		}
;1053:		l2 = 0.9f;
;1054:	} else {
;1055:		l1 = 0.4f;
;1056:		l2 = 0.7f;
;1057:	}
;1058:	// get the flag or defend the base
;1059:	rnd = random();
;1060:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
;1061:		bs->decisionmaker = bs->client;
;1062:		bs->ordered       = qfalse;
;1063:		//
;1064:		if (BotTeam(bs) == TEAM_RED)
;1065:			memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1066:		else
;1067:			memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1068:		// set the ltg type
;1069:		bs->ltgtype = LTG_ATTACKENEMYBASE;
;1070:		// set the time the bot will stop attacking the enemy base
;1071:		bs->teamgoal_time = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
;1072:		// get an alternate route goal towards the enemy base
;1073:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1074:		BotSetTeamStatus(bs);
;1075:	} else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
;1076:		bs->decisionmaker = bs->client;
;1077:		bs->ordered       = qfalse;
;1078:		//
;1079:		if (BotTeam(bs) == TEAM_RED)
;1080:			memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1081:		else
;1082:			memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1083:		// set the ltg type
;1084:		bs->ltgtype = LTG_DEFENDKEYAREA;
;1085:		// set the time the bot stops defending the base
;1086:		bs->teamgoal_time   = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;1087:		bs->defendaway_time = 0;
;1088:		BotSetTeamStatus(bs);
;1089:	} else {
;1090:		bs->ltgtype = 0;
;1091:		// set the time the bot will stop roaming
;1092:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;1093:		BotSetTeamStatus(bs);
;1094:	}
;1095:}
;1096:
;1097:/*
;1098:==================
;1099:BotGoHarvest
;1100:==================
;1101:*/
;1102:void BotGoHarvest(bot_state_t* bs) {
;1103:	//
;1104:	if (BotTeam(bs) == TEAM_RED)
;1105:		memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1106:	else
;1107:		memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1108:	// set the ltg type
;1109:	bs->ltgtype = LTG_HARVEST;
;1110:	// set the time the bot will stop harvesting
;1111:	bs->teamgoal_time    = FloatTime() + TEAM_HARVEST_TIME;
;1112:	bs->harvestaway_time = 0;
;1113:	BotSetTeamStatus(bs);
;1114:}
;1115:
;1116:/*
;1117:==================
;1118:BotObeliskRetreatGoals
;1119:==================
;1120:*/
;1121:void BotObeliskRetreatGoals(bot_state_t* bs) {
;1122:	// nothing special
;1123:}
;1124:
;1125:/*
;1126:==================
;1127:BotHarvesterSeekGoals
;1128:==================
;1129:*/
;1130:void BotHarvesterSeekGoals(bot_state_t* bs) {
;1131:	aas_entityinfo_t entinfo;
;1132:	float            rnd, l1, l2;
;1133:	int              c;
;1134:
;1135:	// when carrying cubes in harvester the bot should rush to the base
;1136:	if (BotHarvesterCarryingCubes(bs)) {
;1137:		// if not already rushing to the base
;1138:		if (bs->ltgtype != LTG_RUSHBASE) {
;1139:			BotRefuseOrder(bs);
;1140:			bs->ltgtype           = LTG_RUSHBASE;
;1141:			bs->teamgoal_time     = FloatTime() + CTF_RUSHBASE_TIME;
;1142:			bs->rushbaseaway_time = 0;
;1143:			bs->decisionmaker     = bs->client;
;1144:			bs->ordered           = qfalse;
;1145:			// get an alternative route goal towards the enemy base
;1146:			BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
;1147:			//
;1148:			BotSetTeamStatus(bs);
;1149:		}
;1150:		return;
;1151:	}
;1152:	// don't just do something wait for the bot team leader to give orders
;1153:	if (BotTeamLeader(bs)) {
;1154:		return;
;1155:	}
;1156:	// if the bot decided to follow someone
;1157:	if (bs->ltgtype == LTG_TEAMACCOMPANY && !bs->ordered) {
;1158:		// if the team mate being accompanied no longer carries the flag
;1159:		BotEntityInfo(bs->teammate, &entinfo);
;1160:		if (!EntityCarriesCubes(&entinfo)) {
;1161:			bs->ltgtype = 0;
;1162:		}
;1163:	}
;1164:	// if the bot is ordered to do something
;1165:	if (bs->lastgoal_ltgtype) {
;1166:		bs->teamgoal_time += 60;
;1167:	}
;1168:	// if not yet doing something
;1169:	if (bs->ltgtype == LTG_TEAMHELP || bs->ltgtype == LTG_TEAMACCOMPANY || bs->ltgtype == LTG_DEFENDKEYAREA || bs->ltgtype == LTG_GETFLAG ||
;1170:	    bs->ltgtype == LTG_CAMPORDER || bs->ltgtype == LTG_PATROL || bs->ltgtype == LTG_ATTACKENEMYBASE || bs->ltgtype == LTG_HARVEST ||
;1171:	    bs->ltgtype == LTG_GETITEM || bs->ltgtype == LTG_MAKELOVE_UNDER || bs->ltgtype == LTG_MAKELOVE_ONTOP) {
;1172:		return;
;1173:	}
;1174:	//
;1175:	if (BotSetLastOrderedTask(bs))
;1176:		return;
;1177:	// if the bot is roaming
;1178:	if (bs->ctfroam_time > FloatTime())
;1179:		return;
;1180:	// if the bot has anough aggression to decide what to do
;1181:	if (BotAggression(bs) < 50)
;1182:		return;
;1183:	// set the time to send a message to the team mates
;1184:	bs->teammessage_time = FloatTime() + 2 * random();
;1185:	//
;1186:	c = BotEnemyCubeCarrierVisible(bs);
;1187:	if (c >= 0) {
;1188:		// FIXME: attack enemy cube carrier
;1189:	}
;1190:	if (bs->ltgtype != LTG_TEAMACCOMPANY) {
;1191:		// if there is a visible team mate carrying cubes
;1192:		c = BotTeamCubeCarrierVisible(bs);
;1193:		if (c >= 0) {
;1194:			// follow the team mate carrying cubes
;1195:			bs->decisionmaker = bs->client;
;1196:			bs->ordered       = qfalse;
;1197:			// the team mate
;1198:			bs->teammate = c;
;1199:			// last time the team mate was visible
;1200:			bs->teammatevisible_time = FloatTime();
;1201:			// no message
;1202:			bs->teammessage_time = 0;
;1203:			// no arrive message
;1204:			bs->arrive_time = 1;
;1205:			//
;1206:#ifdef MISSIONPACK
;1207:			BotVoiceChat(bs, bs->teammate, VOICECHAT_ONFOLLOW);
;1208:#endif
;1209:			// get the team goal time
;1210:			bs->teamgoal_time  = FloatTime() + TEAM_ACCOMPANY_TIME;
;1211:			bs->ltgtype        = LTG_TEAMACCOMPANY;
;1212:			bs->formation_dist = 3.5 * 32;  // 3.5 meter
;1213:			BotSetTeamStatus(bs);
;1214:			return;
;1215:		}
;1216:	}
;1217:	//
;1218:	if (bs->teamtaskpreference & (TEAMTP_ATTACKER | TEAMTP_DEFENDER)) {
;1219:		if (bs->teamtaskpreference & TEAMTP_ATTACKER) {
;1220:			l1 = 0.7f;
;1221:		} else {
;1222:			l1 = 0.2f;
;1223:		}
;1224:		l2 = 0.9f;
;1225:	} else {
;1226:		l1 = 0.4f;
;1227:		l2 = 0.7f;
;1228:	}
;1229:	//
;1230:	rnd = random();
;1231:	if (rnd < l1 && redobelisk.areanum && blueobelisk.areanum) {
;1232:		bs->decisionmaker = bs->client;
;1233:		bs->ordered       = qfalse;
;1234:		BotGoHarvest(bs);
;1235:	} else if (rnd < l2 && redobelisk.areanum && blueobelisk.areanum) {
;1236:		bs->decisionmaker = bs->client;
;1237:		bs->ordered       = qfalse;
;1238:		//
;1239:		if (BotTeam(bs) == TEAM_RED)
;1240:			memcpy(&bs->teamgoal, &redobelisk, sizeof(bot_goal_t));
;1241:		else
;1242:			memcpy(&bs->teamgoal, &blueobelisk, sizeof(bot_goal_t));
;1243:		// set the ltg type
;1244:		bs->ltgtype = LTG_DEFENDKEYAREA;
;1245:		// set the time the bot stops defending the base
;1246:		bs->teamgoal_time   = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
;1247:		bs->defendaway_time = 0;
;1248:		BotSetTeamStatus(bs);
;1249:	} else {
;1250:		bs->ltgtype = 0;
;1251:		// set the time the bot will stop roaming
;1252:		bs->ctfroam_time = FloatTime() + CTF_ROAM_TIME;
;1253:		BotSetTeamStatus(bs);
;1254:	}
;1255:}
;1256:
;1257:/*
;1258:==================
;1259:BotHarvesterRetreatGoals
;1260:==================
;1261:*/
;1262:void BotHarvesterRetreatGoals(bot_state_t* bs) {
;1263:	// when carrying cubes in harvester the bot should rush to the base
;1264:	if (BotHarvesterCarryingCubes(bs)) {
;1265:		// if not already rushing to the base
;1266:		if (bs->ltgtype != LTG_RUSHBASE) {
;1267:			BotRefuseOrder(bs);
;1268:			bs->ltgtype           = LTG_RUSHBASE;
;1269:			bs->teamgoal_time     = FloatTime() + CTF_RUSHBASE_TIME;
;1270:			bs->rushbaseaway_time = 0;
;1271:			bs->decisionmaker     = bs->client;
;1272:			bs->ordered           = qfalse;
;1273:			BotSetTeamStatus(bs);
;1274:		}
;1275:		return;
;1276:	}
;1277:}
;1278:#endif
;1279:
;1280:/*
;1281:==================
;1282:BotTeamGoals
;1283:==================
;1284:*/
;1285:void BotTeamGoals(bot_state_t* bs, int retreat) {
line 1287
;1286:
;1287:	if (retreat) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $249
line 1288
;1288:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $250
line 1289
;1289:			BotCTFRetreatGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFRetreatGoals
CALLV
pop
line 1290
;1290:		}
line 1300
;1291:#ifdef MISSIONPACK
;1292:		else if (gametype == GT_1FCTF) {
;1293:			Bot1FCTFRetreatGoals(bs);
;1294:		} else if (gametype == GT_OBELISK) {
;1295:			BotObeliskRetreatGoals(bs);
;1296:		} else if (gametype == GT_HARVESTER) {
;1297:			BotHarvesterRetreatGoals(bs);
;1298:		}
;1299:#endif
;1300:	} else {
ADDRGP4 $250
JUMPV
LABELV $249
line 1301
;1301:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $253
line 1303
;1302:			// decide what to do in CTF mode
;1303:			BotCTFSeekGoals(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFSeekGoals
CALLV
pop
line 1304
;1304:		}
LABELV $253
line 1314
;1305:#ifdef MISSIONPACK
;1306:		else if (gametype == GT_1FCTF) {
;1307:			Bot1FCTFSeekGoals(bs);
;1308:		} else if (gametype == GT_OBELISK) {
;1309:			BotObeliskSeekGoals(bs);
;1310:		} else if (gametype == GT_HARVESTER) {
;1311:			BotHarvesterSeekGoals(bs);
;1312:		}
;1313:#endif
;1314:	}
LABELV $250
line 1317
;1315:	// reset the order time which is used to see if
;1316:	// we decided to refuse an order
;1317:	bs->order_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
CNSTF4 0
ASGNF4
line 1318
;1318:}
LABELV $248
endproc BotTeamGoals 0 4
export BotPointAreaNum
proc BotPointAreaNum 68 20
line 1325
;1319:
;1320:/*
;1321:==================
;1322:BotPointAreaNum
;1323:==================
;1324:*/
;1325:int BotPointAreaNum(vec3_t origin) {
line 1329
;1326:	int    areanum, numareas, areas[10];
;1327:	vec3_t end;
;1328:
;1329:	areanum = trap_AAS_PointAreaNum(origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 trap_AAS_PointAreaNum
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 60
INDIRI4
ASGNI4
line 1330
;1330:	if (areanum)
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $256
line 1331
;1331:		return areanum;
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $255
JUMPV
LABELV $256
line 1332
;1332:	VectorCopy(origin, end);
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 1333
;1333:	end[2] += 10;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
line 1334
;1334:	numareas = trap_AAS_TraceAreas(origin, end, areas, NULL, 10);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 64
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 64
INDIRI4
ASGNI4
line 1335
;1335:	if (numareas > 0)
ADDRLP4 16
INDIRI4
CNSTI4 0
LEI4 $259
line 1336
;1336:		return areas[0];
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $255
JUMPV
LABELV $259
line 1337
;1337:	return 0;
CNSTI4 0
RETI4
LABELV $255
endproc BotPointAreaNum 68 20
export ClientName
proc ClientName 1028 12
line 1345
;1338:}
;1339:
;1340:/*
;1341:==================
;1342:ClientName
;1343:==================
;1344:*/
;1345:char* ClientName(int client, char* name, int size) {
line 1348
;1346:	char buf[MAX_INFO_STRING];
;1347:
;1348:	if ((unsigned)client >= MAX_CLIENTS) {
ADDRFP4 0
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $262
line 1349
;1349:		BotAI_Print(PRT_ERROR, "ClientName: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $264
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1350
;1350:		Q_strncpyz(name, "[client out of range]", size);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $265
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1351
;1351:		return name;
ADDRFP4 4
INDIRP4
RETP4
ADDRGP4 $261
JUMPV
LABELV $262
line 1354
;1352:	}
;1353:
;1354:	trap_GetConfigstring(CS_PLAYERS + client, buf, sizeof(buf));
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1355
;1355:	Q_strncpyz(name, Info_ValueForKey(buf, "n"), size);
ADDRLP4 0
ARGP4
ADDRGP4 $266
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1356
;1356:	Q_CleanStr(name);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1358
;1357:
;1358:	return name;
ADDRFP4 4
INDIRP4
RETP4
LABELV $261
endproc ClientName 1028 12
export ClientSkin
proc ClientSkin 1028 12
line 1366
;1359:}
;1360:
;1361:/*
;1362:==================
;1363:ClientSkin
;1364:==================
;1365:*/
;1366:char* ClientSkin(int client, char* skin, int size) {
line 1369
;1367:	char buf[MAX_INFO_STRING];
;1368:
;1369:	if ((unsigned)client >= MAX_CLIENTS) {
ADDRFP4 0
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $268
line 1370
;1370:		BotAI_Print(PRT_ERROR, "ClientSkin: client out of range\n");
CNSTI4 3
ARGI4
ADDRGP4 $270
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1371
;1371:		return "[client out of range]";
ADDRGP4 $265
RETP4
ADDRGP4 $267
JUMPV
LABELV $268
line 1374
;1372:	}
;1373:
;1374:	trap_GetConfigstring(CS_PLAYERS + client, buf, sizeof(buf));
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1375
;1375:	Q_strncpyz(skin, Info_ValueForKey(buf, "model"), size);
ADDRLP4 0
ARGP4
ADDRGP4 $271
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1377
;1376:
;1377:	return skin;
ADDRFP4 4
INDIRP4
RETP4
LABELV $267
endproc ClientSkin 1028 12
export ClientFromName
proc ClientFromName 1036 12
line 1385
;1378:}
;1379:
;1380:/*
;1381:==================
;1382:ClientFromName
;1383:==================
;1384:*/
;1385:int ClientFromName(const char* name) {
line 1389
;1386:	int  i;
;1387:	char buf[MAX_INFO_STRING];
;1388:
;1389:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $276
JUMPV
LABELV $273
line 1390
;1390:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
ADDRLP4 1024
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 1391
;1391:		Q_CleanStr(buf);
ADDRLP4 0
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1392
;1392:		if (!Q_stricmp(Info_ValueForKey(buf, "n"), name))
ADDRLP4 0
ARGP4
ADDRGP4 $266
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $278
line 1393
;1393:			return i;
ADDRLP4 1024
INDIRI4
RETI4
ADDRGP4 $272
JUMPV
LABELV $278
line 1394
;1394:	}
LABELV $274
line 1389
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $276
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $273
line 1395
;1395:	return -1;
CNSTI4 -1
RETI4
LABELV $272
endproc ClientFromName 1036 12
export ClientOnSameTeamFromName
proc ClientOnSameTeamFromName 1040 12
line 1403
;1396:}
;1397:
;1398:/*
;1399:==================
;1400:ClientOnSameTeamFromName
;1401:==================
;1402:*/
;1403:int ClientOnSameTeamFromName(bot_state_t* bs, const char* name) {
line 1407
;1404:	char buf[MAX_INFO_STRING];
;1405:	int  i;
;1406:
;1407:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $284
JUMPV
LABELV $281
line 1408
;1408:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1028
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $286
line 1409
;1409:			continue;
ADDRGP4 $282
JUMPV
LABELV $286
line 1410
;1410:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
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
line 1411
;1411:		Q_CleanStr(buf);
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1412
;1412:		if (!Q_stricmp(Info_ValueForKey(buf, "n"), name))
ADDRLP4 4
ARGP4
ADDRGP4 $266
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $288
line 1413
;1413:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $280
JUMPV
LABELV $288
line 1414
;1414:	}
LABELV $282
line 1407
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $284
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $281
line 1416
;1415:
;1416:	return -1;
CNSTI4 -1
RETI4
LABELV $280
endproc ClientOnSameTeamFromName 1040 12
export stristr
proc stristr 12 4
line 1424
;1417:}
;1418:
;1419:/*
;1420:==================
;1421:stristr
;1422:==================
;1423:*/
;1424:const char* stristr(const char* str, const char* charset) {
ADDRGP4 $292
JUMPV
LABELV $291
line 1427
;1425:	int i;
;1426:
;1427:	while (*str) {
line 1428
;1428:		for (i = 0; charset[i] && str[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $297
JUMPV
LABELV $294
line 1429
;1429:			if (toupper(charset[i]) != toupper(str[i]))
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 4
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $298
line 1430
;1430:				break;
ADDRGP4 $296
JUMPV
LABELV $298
line 1431
;1431:		}
LABELV $295
line 1428
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $297
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $300
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $294
LABELV $300
LABELV $296
line 1432
;1432:		if (!charset[i])
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $301
line 1433
;1433:			return str;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $290
JUMPV
LABELV $301
line 1434
;1434:		str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1435
;1435:	}
LABELV $292
line 1427
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $291
line 1436
;1436:	return NULL;
CNSTP4 0
RETP4
LABELV $290
endproc stristr 12 4
export EasyClientName
proc EasyClientName 192 12
line 1444
;1437:}
;1438:
;1439:/*
;1440:==================
;1441:EasyClientName
;1442:==================
;1443:*/
;1444:char* EasyClientName(int client, char* buf, int size) {
line 1449
;1445:	int   i;
;1446:	char *str1, *str2, *ptr, c;
;1447:	char  name[128];
;1448:
;1449:	ClientName(client, name, sizeof(name));
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 5
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1450
;1450:	for (i = 0; name[i]; i++)
ADDRLP4 136
CNSTI4 0
ASGNI4
ADDRGP4 $307
JUMPV
LABELV $304
line 1451
;1451:		name[i] &= 127;
ADDRLP4 148
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVII1 4
ASGNI1
LABELV $305
line 1450
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $307
ADDRLP4 136
INDIRI4
ADDRLP4 5
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $304
line 1453
;1452:	// remove all spaces
;1453:	for (ptr = strchr(name, ' '); ptr; ptr = strchr(name, ' ')) {
ADDRLP4 5
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 152
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 152
INDIRP4
ASGNP4
ADDRGP4 $311
JUMPV
LABELV $308
line 1454
;1454:		memmove(ptr, ptr + 1, strlen(ptr + 1) + 1);
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 156
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 156
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1455
;1455:	}
LABELV $309
line 1453
ADDRLP4 5
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 156
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 156
INDIRP4
ASGNP4
LABELV $311
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $308
line 1457
;1456:	// check for [x] and ]x[ clan names
;1457:	str1 = strchr(name, '[');
ADDRLP4 5
ARGP4
CNSTI4 91
ARGI4
ADDRLP4 160
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 140
ADDRLP4 160
INDIRP4
ASGNP4
line 1458
;1458:	str2 = strchr(name, ']');
ADDRLP4 5
ARGP4
CNSTI4 93
ARGI4
ADDRLP4 164
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 144
ADDRLP4 164
INDIRP4
ASGNP4
line 1459
;1459:	if (str1 && str2) {
ADDRLP4 140
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $312
ADDRLP4 144
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $312
line 1460
;1460:		if (str2 > str1)
ADDRLP4 144
INDIRP4
CVPU4 4
ADDRLP4 140
INDIRP4
CVPU4 4
LEU4 $314
line 1461
;1461:			memmove(str1, str2 + 1, strlen(str2 + 1) + 1);
ADDRLP4 144
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 168
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 168
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
ADDRGP4 $315
JUMPV
LABELV $314
line 1463
;1462:		else
;1463:			memmove(str2, str1 + 1, strlen(str1 + 1) + 1);
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 172
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 144
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 172
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
LABELV $315
line 1464
;1464:	}
LABELV $312
line 1466
;1465:	// remove Mr prefix
;1466:	if ((name[0] == 'm' || name[0] == 'M') && (name[1] == 'r' || name[1] == 'R')) {
ADDRLP4 168
ADDRLP4 5
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 109
EQI4 $320
ADDRLP4 168
INDIRI4
CNSTI4 77
NEI4 $316
LABELV $320
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 114
EQI4 $321
ADDRLP4 5+1
INDIRI1
CVII4 1
CNSTI4 82
NEI4 $316
LABELV $321
line 1467
;1467:		memmove(name, name + 2, strlen(name + 2) + 1);
ADDRLP4 5+2
ARGP4
ADDRLP4 172
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 5
ARGP4
ADDRLP4 5+2
ARGP4
ADDRLP4 172
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1468
;1468:	}
LABELV $316
line 1470
;1469:	// only allow lower case alphabet characters
;1470:	ptr = name;
ADDRLP4 0
ADDRLP4 5
ASGNP4
ADDRGP4 $325
JUMPV
LABELV $324
line 1471
;1471:	while (*ptr) {
line 1472
;1472:		c = *ptr;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 1473
;1473:		if ((c >= 'a' && c <= 'z') || (c >= '0' && c <= '9') || c == '_') {
ADDRLP4 172
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 172
INDIRI4
CNSTI4 97
LTI4 $330
ADDRLP4 172
INDIRI4
CNSTI4 122
LEI4 $331
LABELV $330
ADDRLP4 176
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 176
INDIRI4
CNSTI4 48
LTI4 $332
ADDRLP4 176
INDIRI4
CNSTI4 57
LEI4 $331
LABELV $332
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 95
NEI4 $327
LABELV $331
line 1474
;1474:			ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1475
;1475:		} else if (c >= 'A' && c <= 'Z') {
ADDRGP4 $328
JUMPV
LABELV $327
ADDRLP4 180
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 65
LTI4 $333
ADDRLP4 180
INDIRI4
CNSTI4 90
GTI4 $333
line 1476
;1476:			*ptr += 'a' - 'A';
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
ADDI4
CVII1 4
ASGNI1
line 1477
;1477:			ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1478
;1478:		} else {
ADDRGP4 $334
JUMPV
LABELV $333
line 1479
;1479:			memmove(ptr, ptr + 1, strlen(ptr + 1) + 1);
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 184
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 184
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1480
;1480:		}
LABELV $334
LABELV $328
line 1481
;1481:	}
LABELV $325
line 1471
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $324
line 1483
;1482:
;1483:	Q_strncpyz(buf, name, size);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 5
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1485
;1484:
;1485:	return buf;
ADDRFP4 4
INDIRP4
RETP4
LABELV $303
endproc EasyClientName 192 12
export BotSynonymContext
proc BotSynonymContext 8 4
line 1493
;1486:}
;1487:
;1488:/*
;1489:==================
;1490:BotSynonymContext
;1491:==================
;1492:*/
;1493:int BotSynonymContext(bot_state_t* bs) {
line 1496
;1494:	int context;
;1495:
;1496:	context = CONTEXT_NORMAL | CONTEXT_NEARBYITEM | CONTEXT_NAMES;
ADDRLP4 0
CNSTI4 1027
ASGNI4
line 1498
;1497:	//
;1498:	if (gametype == GT_CTF
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $336
line 1502
;1499:#ifdef MISSIONPACK
;1500:	    || gametype == GT_1FCTF
;1501:#endif
;1502:	) {
line 1503
;1503:		if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $338
line 1504
;1504:			context |= CONTEXT_CTFREDTEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 4
BORI4
ASGNI4
ADDRGP4 $339
JUMPV
LABELV $338
line 1506
;1505:		else
;1506:			context |= CONTEXT_CTFBLUETEAM;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
LABELV $339
line 1507
;1507:	}
LABELV $336
line 1521
;1508:#ifdef MISSIONPACK
;1509:	else if (gametype == GT_OBELISK) {
;1510:		if (BotTeam(bs) == TEAM_RED)
;1511:			context |= CONTEXT_OBELISKREDTEAM;
;1512:		else
;1513:			context |= CONTEXT_OBELISKBLUETEAM;
;1514:	} else if (gametype == GT_HARVESTER) {
;1515:		if (BotTeam(bs) == TEAM_RED)
;1516:			context |= CONTEXT_HARVESTERREDTEAM;
;1517:		else
;1518:			context |= CONTEXT_HARVESTERBLUETEAM;
;1519:	}
;1520:#endif
;1521:	return context;
ADDRLP4 0
INDIRI4
RETI4
LABELV $335
endproc BotSynonymContext 8 4
export BotChooseWeapon
proc BotChooseWeapon 20 8
line 1529
;1522:}
;1523:
;1524:/*
;1525:==================
;1526:BotChooseWeapon
;1527:==================
;1528:*/
;1529:void BotChooseWeapon(bot_state_t* bs) {
line 1532
;1530:	int newweaponnum;
;1531:
;1532:	if (bs->cur_ps.weaponstate == WEAPON_RAISING || bs->cur_ps.weaponstate == WEAPON_DROPPING) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 1
EQI4 $343
ADDRLP4 4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 2
NEI4 $341
LABELV $343
line 1533
;1533:		trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1534
;1534:	} else {
ADDRGP4 $342
JUMPV
LABELV $341
line 1535
;1535:		newweaponnum = trap_BotChooseBestFightWeapon(bs->ws, bs->inventory);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 trap_BotChooseBestFightWeapon
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 1536
;1536:		if (bs->weaponnum != newweaponnum)
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $344
line 1537
;1537:			bs->weaponchange_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $344
line 1538
;1538:		bs->weaponnum = newweaponnum;
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1540
;1539:		// BotAI_Print(PRT_MESSAGE, "bs->weaponnum = %d\n", bs->weaponnum);
;1540:		trap_EA_SelectWeapon(bs->client, bs->weaponnum);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_SelectWeapon
CALLV
pop
line 1541
;1541:	}
LABELV $342
line 1542
;1542:}
LABELV $340
endproc BotChooseWeapon 20 8
export BotSetupForMovement
proc BotSetupForMovement 76 12
line 1549
;1543:
;1544:/*
;1545:==================
;1546:BotSetupForMovement
;1547:==================
;1548:*/
;1549:void BotSetupForMovement(bot_state_t* bs) {
line 1552
;1550:	bot_initmove_t initmove;
;1551:
;1552:	memset(&initmove, 0, sizeof(bot_initmove_t));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 68
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1553
;1553:	VectorCopy(bs->cur_ps.origin, initmove.origin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 1554
;1554:	VectorCopy(bs->cur_ps.velocity, initmove.velocity);
ADDRLP4 0+12
ADDRFP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRB
ASGNB 12
line 1555
;1555:	VectorClear(initmove.viewoffset);
ADDRLP4 0+24
CNSTF4 0
ASGNF4
ADDRLP4 0+24+4
CNSTF4 0
ASGNF4
ADDRLP4 0+24+8
CNSTF4 0
ASGNF4
line 1556
;1556:	initmove.viewoffset[2] += bs->cur_ps.viewheight;
ADDRLP4 0+24+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1557
;1557:	initmove.entitynum = bs->entitynum;
ADDRLP4 0+36
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 1558
;1558:	initmove.client    = bs->client;
ADDRLP4 0+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1559
;1559:	initmove.thinktime = bs->thinktime;
ADDRLP4 0+44
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ASGNF4
line 1561
;1560:	// set the onground flag
;1561:	if (bs->cur_ps.groundEntityNum != ENTITYNUM_NONE)
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 1023
EQI4 $358
line 1562
;1562:		initmove.or_moveflags |= MFL_ONGROUND;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $358
line 1564
;1563:	// set the teleported flag
;1564:	if ((bs->cur_ps.pm_flags & PMF_TIME_KNOCKBACK) && (bs->cur_ps.pm_time > 0)) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $361
ADDRLP4 68
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
LEI4 $361
line 1565
;1565:		initmove.or_moveflags |= MFL_TELEPORTED;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 1566
;1566:	}
LABELV $361
line 1568
;1567:	// set the waterjump flag
;1568:	if ((bs->cur_ps.pm_flags & PMF_TIME_WATERJUMP) && (bs->cur_ps.pm_time > 0)) {
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $364
ADDRLP4 72
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
LEI4 $364
line 1569
;1569:		initmove.or_moveflags |= MFL_WATERJUMP;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 1570
;1570:	}
LABELV $364
line 1572
;1571:	// set presence type
;1572:	if (bs->cur_ps.pm_flags & PMF_DUCKED)
ADDRFP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $367
line 1573
;1573:		initmove.presencetype = PRESENCE_CROUCH;
ADDRLP4 0+48
CNSTI4 4
ASGNI4
ADDRGP4 $368
JUMPV
LABELV $367
line 1575
;1574:	else
;1575:		initmove.presencetype = PRESENCE_NORMAL;
ADDRLP4 0+48
CNSTI4 2
ASGNI4
LABELV $368
line 1577
;1576:	//
;1577:	if (bs->walker > 0.5)
ADDRFP4 0
INDIRP4
CNSTI4 6056
ADDP4
INDIRF4
CNSTF4 1056964608
LEF4 $371
line 1578
;1578:		initmove.or_moveflags |= MFL_WALK;
ADDRLP4 0+64
ADDRLP4 0+64
INDIRI4
CNSTI4 512
BORI4
ASGNI4
LABELV $371
line 1580
;1579:	//
;1580:	VectorCopy(bs->viewangles, initmove.viewangles);
ADDRLP4 0+52
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
INDIRB
ASGNB 12
line 1582
;1581:	//
;1582:	trap_BotInitMoveState(bs->ms, &initmove);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotInitMoveState
CALLV
pop
line 1583
;1583:}
LABELV $346
endproc BotSetupForMovement 76 12
export BotCheckItemPickup
proc BotCheckItemPickup 0 0
line 1590
;1584:
;1585:/*
;1586:==================
;1587:BotCheckItemPickup
;1588:==================
;1589:*/
;1590:void BotCheckItemPickup(bot_state_t* bs, int* oldinventory) {
line 1680
;1591:#ifdef MISSIONPACK
;1592:	int offence, leader;
;1593:
;1594:	if (gametype <= GT_TEAM)
;1595:		return;
;1596:
;1597:	offence = -1;
;1598:	// go into offence if picked up the kamikaze or invulnerability
;1599:	if (!oldinventory[INVENTORY_KAMIKAZE] && bs->inventory[INVENTORY_KAMIKAZE] >= 1) {
;1600:		offence = qtrue;
;1601:	}
;1602:	if (!oldinventory[INVENTORY_INVULNERABILITY] && bs->inventory[INVENTORY_INVULNERABILITY] >= 1) {
;1603:		offence = qtrue;
;1604:	}
;1605:	// if not already wearing the kamikaze or invulnerability
;1606:	if (!bs->inventory[INVENTORY_KAMIKAZE] && !bs->inventory[INVENTORY_INVULNERABILITY]) {
;1607:		if (!oldinventory[INVENTORY_SCOUT] && bs->inventory[INVENTORY_SCOUT] >= 1) {
;1608:			offence = qtrue;
;1609:		}
;1610:		if (!oldinventory[INVENTORY_GUARD] && bs->inventory[INVENTORY_GUARD] >= 1) {
;1611:			offence = qtrue;
;1612:		}
;1613:		if (!oldinventory[INVENTORY_DOUBLER] && bs->inventory[INVENTORY_DOUBLER] >= 1) {
;1614:			offence = qfalse;
;1615:		}
;1616:		if (!oldinventory[INVENTORY_AMMOREGEN] && bs->inventory[INVENTORY_AMMOREGEN] >= 1) {
;1617:			offence = qfalse;
;1618:		}
;1619:	}
;1620:
;1621:	if (offence >= 0) {
;1622:		leader = ClientFromName(bs->teamleader);
;1623:		if (offence) {
;1624:			if (!(bs->teamtaskpreference & TEAMTP_ATTACKER)) {
;1625:				// if we have a bot team leader
;1626:				if (BotTeamLeader(bs)) {
;1627:					// tell the leader we want to be on offence
;1628:#ifdef MISSIONPACK
;1629:					BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
;1630:#endif
;1631:					// BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1632:					// trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1633:				} else if (g_spSkill.integer <= 3) {
;1634:					if (bs->ltgtype != LTG_GETFLAG && bs->ltgtype != LTG_ATTACKENEMYBASE && bs->ltgtype != LTG_HARVEST) {
;1635:						//
;1636:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
;1637:						    (gametype != GT_1FCTF || bs->neutralflagstatus == 0)) {
;1638:							// tell the leader we want to be on offence
;1639:#ifdef MISSIONPACK
;1640:							BotVoiceChat(bs, leader, VOICECHAT_WANTONOFFENSE);
;1641:#endif
;1642:							// BotAI_BotInitialChat(bs, "wantoffence", NULL);
;1643:							// trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1644:						}
;1645:					}
;1646:				}
;1647:				bs->teamtaskpreference |= TEAMTP_ATTACKER;
;1648:			}
;1649:			bs->teamtaskpreference &= ~TEAMTP_DEFENDER;
;1650:		} else {
;1651:			if (!(bs->teamtaskpreference & TEAMTP_DEFENDER)) {
;1652:				// if we have a bot team leader
;1653:				if (BotTeamLeader(bs)) {
;1654:					// tell the leader we want to be on defense
;1655:#ifdef MISSIONPACK
;1656:					BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
;1657:#endif
;1658:					// BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1659:					// trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1660:				} else if (g_spSkill.integer <= 3) {
;1661:					if (bs->ltgtype != LTG_DEFENDKEYAREA) {
;1662:						//
;1663:						if ((gametype != GT_CTF || (bs->redflagstatus == 0 && bs->blueflagstatus == 0)) &&
;1664:						    (gametype != GT_1FCTF || bs->neutralflagstatus == 0)) {
;1665:							// tell the leader we want to be on defense
;1666:#ifdef MISSIONPACK
;1667:							BotVoiceChat(bs, -1, VOICECHAT_WANTONDEFENSE);
;1668:#endif
;1669:							// BotAI_BotInitialChat(bs, "wantdefence", NULL);
;1670:							// trap_BotEnterChat(bs->cs, leader, CHAT_TELL);
;1671:						}
;1672:					}
;1673:				}
;1674:				bs->teamtaskpreference |= TEAMTP_DEFENDER;
;1675:			}
;1676:			bs->teamtaskpreference &= ~TEAMTP_ATTACKER;
;1677:		}
;1678:	}
;1679:#endif
;1680:}
LABELV $375
endproc BotCheckItemPickup 0 0
export BotUpdateInventory
proc BotUpdateInventory 1224 12
line 1687
;1681:
;1682:/*
;1683:==================
;1684:BotUpdateInventory
;1685:==================
;1686:*/
;1687:void BotUpdateInventory(bot_state_t* bs) {
line 1690
;1688:	int oldinventory[MAX_ITEMS];
;1689:
;1690:	memcpy(oldinventory, bs->inventory, sizeof(oldinventory));
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4952
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1692
;1691:	// armor
;1692:	bs->inventory[INVENTORY_ARMOR] = bs->cur_ps.stats[STAT_ARMOR];
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1024
INDIRP4
CNSTI4 4956
ADDP4
ADDRLP4 1024
INDIRP4
CNSTI4 212
ADDP4
INDIRI4
ASGNI4
line 1694
;1693:	// weapons
;1694:	bs->inventory[INVENTORY_GAUNTLET]        = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GAUNTLET)) != 0;
ADDRLP4 1032
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1032
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $378
ADDRLP4 1028
CNSTI4 1
ASGNI4
ADDRGP4 $379
JUMPV
LABELV $378
ADDRLP4 1028
CNSTI4 0
ASGNI4
LABELV $379
ADDRLP4 1032
INDIRP4
CNSTI4 4968
ADDP4
ADDRLP4 1028
INDIRI4
ASGNI4
line 1695
;1695:	bs->inventory[INVENTORY_SHOTGUN]         = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_SHOTGUN)) != 0;
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $381
ADDRLP4 1036
CNSTI4 1
ASGNI4
ADDRGP4 $382
JUMPV
LABELV $381
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $382
ADDRLP4 1040
INDIRP4
CNSTI4 4972
ADDP4
ADDRLP4 1036
INDIRI4
ASGNI4
line 1696
;1696:	bs->inventory[INVENTORY_MACHINEGUN]      = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_MACHINEGUN)) != 0;
ADDRLP4 1048
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $384
ADDRLP4 1044
CNSTI4 1
ASGNI4
ADDRGP4 $385
JUMPV
LABELV $384
ADDRLP4 1044
CNSTI4 0
ASGNI4
LABELV $385
ADDRLP4 1048
INDIRP4
CNSTI4 4976
ADDP4
ADDRLP4 1044
INDIRI4
ASGNI4
line 1697
;1697:	bs->inventory[INVENTORY_GRENADELAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRENADE_LAUNCHER)) != 0;
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $387
ADDRLP4 1052
CNSTI4 1
ASGNI4
ADDRGP4 $388
JUMPV
LABELV $387
ADDRLP4 1052
CNSTI4 0
ASGNI4
LABELV $388
ADDRLP4 1056
INDIRP4
CNSTI4 4980
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 1698
;1698:	bs->inventory[INVENTORY_ROCKETLAUNCHER]  = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_ROCKET_LAUNCHER)) != 0;
ADDRLP4 1064
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1064
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $390
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRGP4 $391
JUMPV
LABELV $390
ADDRLP4 1060
CNSTI4 0
ASGNI4
LABELV $391
ADDRLP4 1064
INDIRP4
CNSTI4 4984
ADDP4
ADDRLP4 1060
INDIRI4
ASGNI4
line 1699
;1699:	bs->inventory[INVENTORY_LIGHTNING]       = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_LIGHTNING)) != 0;
ADDRLP4 1072
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1072
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $393
ADDRLP4 1068
CNSTI4 1
ASGNI4
ADDRGP4 $394
JUMPV
LABELV $393
ADDRLP4 1068
CNSTI4 0
ASGNI4
LABELV $394
ADDRLP4 1072
INDIRP4
CNSTI4 4988
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 1700
;1700:	bs->inventory[INVENTORY_RAILGUN]         = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_RAILGUN)) != 0;
ADDRLP4 1080
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1080
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $396
ADDRLP4 1076
CNSTI4 1
ASGNI4
ADDRGP4 $397
JUMPV
LABELV $396
ADDRLP4 1076
CNSTI4 0
ASGNI4
LABELV $397
ADDRLP4 1080
INDIRP4
CNSTI4 4992
ADDP4
ADDRLP4 1076
INDIRI4
ASGNI4
line 1701
;1701:	bs->inventory[INVENTORY_PLASMAGUN]       = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PLASMAGUN)) != 0;
ADDRLP4 1088
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1088
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $399
ADDRLP4 1084
CNSTI4 1
ASGNI4
ADDRGP4 $400
JUMPV
LABELV $399
ADDRLP4 1084
CNSTI4 0
ASGNI4
LABELV $400
ADDRLP4 1088
INDIRP4
CNSTI4 4996
ADDP4
ADDRLP4 1084
INDIRI4
ASGNI4
line 1702
;1702:	bs->inventory[INVENTORY_BFG10K]          = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_BFG)) != 0;
ADDRLP4 1096
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1096
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $402
ADDRLP4 1092
CNSTI4 1
ASGNI4
ADDRGP4 $403
JUMPV
LABELV $402
ADDRLP4 1092
CNSTI4 0
ASGNI4
LABELV $403
ADDRLP4 1096
INDIRP4
CNSTI4 5004
ADDP4
ADDRLP4 1092
INDIRI4
ASGNI4
line 1703
;1703:	bs->inventory[INVENTORY_GRAPPLINGHOOK]   = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_GRAPPLING_HOOK)) != 0;
ADDRLP4 1104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1104
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $405
ADDRLP4 1100
CNSTI4 1
ASGNI4
ADDRGP4 $406
JUMPV
LABELV $405
ADDRLP4 1100
CNSTI4 0
ASGNI4
LABELV $406
ADDRLP4 1104
INDIRP4
CNSTI4 5008
ADDP4
ADDRLP4 1100
INDIRI4
ASGNI4
line 1713
;1704:#ifdef MISSIONPACK
;1705:	bs->inventory[INVENTORY_NAILGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_NAILGUN)) != 0;
;1706:	;
;1707:	bs->inventory[INVENTORY_PROXLAUNCHER] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_PROX_LAUNCHER)) != 0;
;1708:	;
;1709:	bs->inventory[INVENTORY_CHAINGUN] = (bs->cur_ps.stats[STAT_WEAPONS] & (1 << WP_CHAINGUN)) != 0;
;1710:	;
;1711:#endif
;1712:	// ammo
;1713:	bs->inventory[INVENTORY_SHELLS]        = bs->cur_ps.ammo[WP_SHOTGUN];
ADDRLP4 1108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1108
INDIRP4
CNSTI4 5024
ADDP4
ADDRLP4 1108
INDIRP4
CNSTI4 404
ADDP4
INDIRI4
ASGNI4
line 1714
;1714:	bs->inventory[INVENTORY_BULLETS]       = bs->cur_ps.ammo[WP_MACHINEGUN];
ADDRLP4 1112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1112
INDIRP4
CNSTI4 5028
ADDP4
ADDRLP4 1112
INDIRP4
CNSTI4 400
ADDP4
INDIRI4
ASGNI4
line 1715
;1715:	bs->inventory[INVENTORY_GRENADES]      = bs->cur_ps.ammo[WP_GRENADE_LAUNCHER];
ADDRLP4 1116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1116
INDIRP4
CNSTI4 5032
ADDP4
ADDRLP4 1116
INDIRP4
CNSTI4 408
ADDP4
INDIRI4
ASGNI4
line 1716
;1716:	bs->inventory[INVENTORY_CELLS]         = bs->cur_ps.ammo[WP_PLASMAGUN];
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1120
INDIRP4
CNSTI4 5036
ADDP4
ADDRLP4 1120
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 1717
;1717:	bs->inventory[INVENTORY_LIGHTNINGAMMO] = bs->cur_ps.ammo[WP_LIGHTNING];
ADDRLP4 1124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1124
INDIRP4
CNSTI4 5040
ADDP4
ADDRLP4 1124
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 1718
;1718:	bs->inventory[INVENTORY_ROCKETS]       = bs->cur_ps.ammo[WP_ROCKET_LAUNCHER];
ADDRLP4 1128
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1128
INDIRP4
CNSTI4 5044
ADDP4
ADDRLP4 1128
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
ASGNI4
line 1719
;1719:	bs->inventory[INVENTORY_SLUGS]         = bs->cur_ps.ammo[WP_RAILGUN];
ADDRLP4 1132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1132
INDIRP4
CNSTI4 5048
ADDP4
ADDRLP4 1132
INDIRP4
CNSTI4 420
ADDP4
INDIRI4
ASGNI4
line 1720
;1720:	bs->inventory[INVENTORY_BFGAMMO]       = bs->cur_ps.ammo[WP_BFG];
ADDRLP4 1136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1136
INDIRP4
CNSTI4 5052
ADDP4
ADDRLP4 1136
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
ASGNI4
line 1727
;1721:#ifdef MISSIONPACK
;1722:	bs->inventory[INVENTORY_NAILS] = bs->cur_ps.ammo[WP_NAILGUN];
;1723:	bs->inventory[INVENTORY_MINES] = bs->cur_ps.ammo[WP_PROX_LAUNCHER];
;1724:	bs->inventory[INVENTORY_BELT]  = bs->cur_ps.ammo[WP_CHAINGUN];
;1725:#endif
;1726:	// powerups
;1727:	bs->inventory[INVENTORY_HEALTH]     = bs->cur_ps.stats[STAT_HEALTH];
ADDRLP4 1140
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1140
INDIRP4
CNSTI4 5068
ADDP4
ADDRLP4 1140
INDIRP4
CNSTI4 200
ADDP4
INDIRI4
ASGNI4
line 1728
;1728:	bs->inventory[INVENTORY_TELEPORTER] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_TELEPORTER;
ADDRLP4 1148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1148
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 26
NEI4 $408
ADDRLP4 1144
CNSTI4 1
ASGNI4
ADDRGP4 $409
JUMPV
LABELV $408
ADDRLP4 1144
CNSTI4 0
ASGNI4
LABELV $409
ADDRLP4 1148
INDIRP4
CNSTI4 5072
ADDP4
ADDRLP4 1144
INDIRI4
ASGNI4
line 1729
;1729:	bs->inventory[INVENTORY_MEDKIT]     = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_MEDKIT;
ADDRLP4 1156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1156
INDIRP4
CNSTI4 204
ADDP4
INDIRI4
CNSTI4 27
NEI4 $411
ADDRLP4 1152
CNSTI4 1
ASGNI4
ADDRGP4 $412
JUMPV
LABELV $411
ADDRLP4 1152
CNSTI4 0
ASGNI4
LABELV $412
ADDRLP4 1156
INDIRP4
CNSTI4 5076
ADDP4
ADDRLP4 1152
INDIRI4
ASGNI4
line 1735
;1730:#ifdef MISSIONPACK
;1731:	bs->inventory[INVENTORY_KAMIKAZE]        = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_KAMIKAZE;
;1732:	bs->inventory[INVENTORY_PORTAL]          = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_PORTAL;
;1733:	bs->inventory[INVENTORY_INVULNERABILITY] = bs->cur_ps.stats[STAT_HOLDABLE_ITEM] == MODELINDEX_INVULNERABILITY;
;1734:#endif
;1735:	bs->inventory[INVENTORY_QUAD]            = bs->cur_ps.powerups[PW_QUAD] != 0;
ADDRLP4 1164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1164
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $414
ADDRLP4 1160
CNSTI4 1
ASGNI4
ADDRGP4 $415
JUMPV
LABELV $414
ADDRLP4 1160
CNSTI4 0
ASGNI4
LABELV $415
ADDRLP4 1164
INDIRP4
CNSTI4 5092
ADDP4
ADDRLP4 1160
INDIRI4
ASGNI4
line 1736
;1736:	bs->inventory[INVENTORY_ENVIRONMENTSUIT] = bs->cur_ps.powerups[PW_BATTLESUIT] != 0;
ADDRLP4 1172
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1172
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $417
ADDRLP4 1168
CNSTI4 1
ASGNI4
ADDRGP4 $418
JUMPV
LABELV $417
ADDRLP4 1168
CNSTI4 0
ASGNI4
LABELV $418
ADDRLP4 1172
INDIRP4
CNSTI4 5096
ADDP4
ADDRLP4 1168
INDIRI4
ASGNI4
line 1737
;1737:	bs->inventory[INVENTORY_HASTE]           = bs->cur_ps.powerups[PW_HASTE] != 0;
ADDRLP4 1180
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1180
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $420
ADDRLP4 1176
CNSTI4 1
ASGNI4
ADDRGP4 $421
JUMPV
LABELV $420
ADDRLP4 1176
CNSTI4 0
ASGNI4
LABELV $421
ADDRLP4 1180
INDIRP4
CNSTI4 5100
ADDP4
ADDRLP4 1176
INDIRI4
ASGNI4
line 1738
;1738:	bs->inventory[INVENTORY_INVISIBILITY]    = bs->cur_ps.powerups[PW_INVIS] != 0;
ADDRLP4 1188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1188
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $423
ADDRLP4 1184
CNSTI4 1
ASGNI4
ADDRGP4 $424
JUMPV
LABELV $423
ADDRLP4 1184
CNSTI4 0
ASGNI4
LABELV $424
ADDRLP4 1188
INDIRP4
CNSTI4 5104
ADDP4
ADDRLP4 1184
INDIRI4
ASGNI4
line 1739
;1739:	bs->inventory[INVENTORY_REGEN]           = bs->cur_ps.powerups[PW_REGEN] != 0;
ADDRLP4 1196
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1196
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $426
ADDRLP4 1192
CNSTI4 1
ASGNI4
ADDRGP4 $427
JUMPV
LABELV $426
ADDRLP4 1192
CNSTI4 0
ASGNI4
LABELV $427
ADDRLP4 1196
INDIRP4
CNSTI4 5108
ADDP4
ADDRLP4 1192
INDIRI4
ASGNI4
line 1740
;1740:	bs->inventory[INVENTORY_FLIGHT]          = bs->cur_ps.powerups[PW_FLIGHT] != 0;
ADDRLP4 1204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1204
INDIRP4
CNSTI4 352
ADDP4
INDIRI4
CNSTI4 0
EQI4 $429
ADDRLP4 1200
CNSTI4 1
ASGNI4
ADDRGP4 $430
JUMPV
LABELV $429
ADDRLP4 1200
CNSTI4 0
ASGNI4
LABELV $430
ADDRLP4 1204
INDIRP4
CNSTI4 5112
ADDP4
ADDRLP4 1200
INDIRI4
ASGNI4
line 1747
;1741:#ifdef MISSIONPACK
;1742:	bs->inventory[INVENTORY_SCOUT]     = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_SCOUT;
;1743:	bs->inventory[INVENTORY_GUARD]     = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_GUARD;
;1744:	bs->inventory[INVENTORY_DOUBLER]   = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_DOUBLER;
;1745:	bs->inventory[INVENTORY_AMMOREGEN] = bs->cur_ps.stats[STAT_PERSISTANT_POWERUP] == MODELINDEX_AMMOREGEN;
;1746:#endif
;1747:	bs->inventory[INVENTORY_REDFLAG]  = bs->cur_ps.powerups[PW_REDFLAG] != 0;
ADDRLP4 1212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1212
INDIRP4
CNSTI4 356
ADDP4
INDIRI4
CNSTI4 0
EQI4 $432
ADDRLP4 1208
CNSTI4 1
ASGNI4
ADDRGP4 $433
JUMPV
LABELV $432
ADDRLP4 1208
CNSTI4 0
ASGNI4
LABELV $433
ADDRLP4 1212
INDIRP4
CNSTI4 5132
ADDP4
ADDRLP4 1208
INDIRI4
ASGNI4
line 1748
;1748:	bs->inventory[INVENTORY_BLUEFLAG] = bs->cur_ps.powerups[PW_BLUEFLAG] != 0;
ADDRLP4 1220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1220
INDIRP4
CNSTI4 360
ADDP4
INDIRI4
CNSTI4 0
EQI4 $435
ADDRLP4 1216
CNSTI4 1
ASGNI4
ADDRGP4 $436
JUMPV
LABELV $435
ADDRLP4 1216
CNSTI4 0
ASGNI4
LABELV $436
ADDRLP4 1220
INDIRP4
CNSTI4 5136
ADDP4
ADDRLP4 1216
INDIRI4
ASGNI4
line 1759
;1749:#ifdef MISSIONPACK
;1750:	bs->inventory[INVENTORY_NEUTRALFLAG] = bs->cur_ps.powerups[PW_NEUTRALFLAG] != 0;
;1751:	if (BotTeam(bs) == TEAM_RED) {
;1752:		bs->inventory[INVENTORY_REDCUBE]  = bs->cur_ps.generic1;
;1753:		bs->inventory[INVENTORY_BLUECUBE] = 0;
;1754:	} else {
;1755:		bs->inventory[INVENTORY_REDCUBE]  = 0;
;1756:		bs->inventory[INVENTORY_BLUECUBE] = bs->cur_ps.generic1;
;1757:	}
;1758:#endif
;1759:	BotCheckItemPickup(bs, oldinventory);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckItemPickup
CALLV
pop
line 1760
;1760:}
LABELV $376
endproc BotUpdateInventory 1224 12
export BotUpdateBattleInventory
proc BotUpdateBattleInventory 160 8
line 1767
;1761:
;1762:/*
;1763:==================
;1764:BotUpdateBattleInventory
;1765:==================
;1766:*/
;1767:void BotUpdateBattleInventory(bot_state_t* bs, int enemy) {
line 1771
;1768:	vec3_t           dir;
;1769:	aas_entityinfo_t entinfo;
;1770:
;1771:	BotEntityInfo(enemy, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1772
;1772:	VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12+24
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 12+24+4
INDIRF4
ADDRLP4 152
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 12+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1773
;1773:	bs->inventory[ENEMY_HEIGHT]          = (int)dir[2];
ADDRFP4 0
INDIRP4
CNSTI4 5756
ADDP4
ADDRLP4 0+8
INDIRF4
CVFI4 4
ASGNI4
line 1774
;1774:	dir[2]                               = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1775
;1775:	bs->inventory[ENEMY_HORIZONTAL_DIST] = (int)VectorLength(dir);
ADDRLP4 0
ARGP4
ADDRLP4 156
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 5752
ADDP4
ADDRLP4 156
INDIRF4
CVFI4 4
ASGNI4
line 1777
;1776:	// FIXME: add num visible enemies and num visible team mates to the inventory
;1777:}
LABELV $437
endproc BotUpdateBattleInventory 160 8
export BotBattleUseItems
proc BotBattleUseItems 4 4
line 2018
;1778:
;1779:#ifdef MISSIONPACK
;1780:/*
;1781:==================
;1782:BotUseKamikaze
;1783:==================
;1784:*/
;1785:#define KAMIKAZE_DIST 1024
;1786:
;1787:void BotUseKamikaze(bot_state_t* bs) {
;1788:	int              c, teammates, enemies;
;1789:	aas_entityinfo_t entinfo;
;1790:	vec3_t           dir, target;
;1791:	bot_goal_t*      goal;
;1792:	bsp_trace_t      trace;
;1793:
;1794:	// if the bot has no kamikaze
;1795:	if (bs->inventory[INVENTORY_KAMIKAZE] <= 0)
;1796:		return;
;1797:	if (bs->kamikaze_time > FloatTime())
;1798:		return;
;1799:	bs->kamikaze_time = FloatTime() + 0.2;
;1800:	if (gametype == GT_CTF) {
;1801:		// never use kamikaze if the team flag carrier is visible
;1802:		if (BotCTFCarryingFlag(bs))
;1803:			return;
;1804:		c = BotTeamFlagCarrierVisible(bs);
;1805:		if (c >= 0) {
;1806:			BotEntityInfo(c, &entinfo);
;1807:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1808:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1809:				return;
;1810:		}
;1811:		c = BotEnemyFlagCarrierVisible(bs);
;1812:		if (c >= 0) {
;1813:			BotEntityInfo(c, &entinfo);
;1814:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1815:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1816:				trap_EA_Use(bs->client);
;1817:				return;
;1818:			}
;1819:		}
;1820:	} else if (gametype == GT_1FCTF) {
;1821:		// never use kamikaze if the team flag carrier is visible
;1822:		if (Bot1FCTFCarryingFlag(bs))
;1823:			return;
;1824:		c = BotTeamFlagCarrierVisible(bs);
;1825:		if (c >= 0) {
;1826:			BotEntityInfo(c, &entinfo);
;1827:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1828:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1829:				return;
;1830:		}
;1831:		c = BotEnemyFlagCarrierVisible(bs);
;1832:		if (c >= 0) {
;1833:			BotEntityInfo(c, &entinfo);
;1834:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1835:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1836:				trap_EA_Use(bs->client);
;1837:				return;
;1838:			}
;1839:		}
;1840:	} else if (gametype == GT_OBELISK) {
;1841:		switch (BotTeam(bs)) {
;1842:		case TEAM_RED:
;1843:			goal = &blueobelisk;
;1844:			break;
;1845:		default:
;1846:			goal = &redobelisk;
;1847:			break;
;1848:		}
;1849:		// if the obelisk is visible
;1850:		VectorCopy(goal->origin, target);
;1851:		target[2] += 1;
;1852:		VectorSubtract(bs->origin, target, dir);
;1853:		if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST * 0.9)) {
;1854:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1855:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1856:				trap_EA_Use(bs->client);
;1857:				return;
;1858:			}
;1859:		}
;1860:	} else if (gametype == GT_HARVESTER) {
;1861:		//
;1862:		if (BotHarvesterCarryingCubes(bs))
;1863:			return;
;1864:		// never use kamikaze if a team mate carrying cubes is visible
;1865:		c = BotTeamCubeCarrierVisible(bs);
;1866:		if (c >= 0) {
;1867:			BotEntityInfo(c, &entinfo);
;1868:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1869:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST))
;1870:				return;
;1871:		}
;1872:		c = BotEnemyCubeCarrierVisible(bs);
;1873:		if (c >= 0) {
;1874:			BotEntityInfo(c, &entinfo);
;1875:			VectorSubtract(entinfo.origin, bs->origin, dir);
;1876:			if (VectorLengthSquared(dir) < Square(KAMIKAZE_DIST)) {
;1877:				trap_EA_Use(bs->client);
;1878:				return;
;1879:			}
;1880:		}
;1881:	}
;1882:	//
;1883:	BotVisibleTeamMatesAndEnemies(bs, &teammates, &enemies, KAMIKAZE_DIST);
;1884:	//
;1885:	if (enemies > 2 && enemies > teammates + 1) {
;1886:		trap_EA_Use(bs->client);
;1887:		return;
;1888:	}
;1889:}
;1890:
;1891:/*
;1892:==================
;1893:BotUseInvulnerability
;1894:==================
;1895:*/
;1896:void BotUseInvulnerability(bot_state_t* bs) {
;1897:	int         c;
;1898:	vec3_t      dir, target;
;1899:	bot_goal_t* goal;
;1900:	bsp_trace_t trace;
;1901:
;1902:	// if the bot has no invulnerability
;1903:	if (bs->inventory[INVENTORY_INVULNERABILITY] <= 0)
;1904:		return;
;1905:	if (bs->invulnerability_time > FloatTime())
;1906:		return;
;1907:	bs->invulnerability_time = FloatTime() + 0.2;
;1908:	if (gametype == GT_CTF) {
;1909:		// never use kamikaze if the team flag carrier is visible
;1910:		if (BotCTFCarryingFlag(bs))
;1911:			return;
;1912:		c = BotEnemyFlagCarrierVisible(bs);
;1913:		if (c >= 0)
;1914:			return;
;1915:		// if near enemy flag and the flag is visible
;1916:		switch (BotTeam(bs)) {
;1917:		case TEAM_RED:
;1918:			goal = &ctf_blueflag;
;1919:			break;
;1920:		default:
;1921:			goal = &ctf_redflag;
;1922:			break;
;1923:		}
;1924:		// if the obelisk is visible
;1925:		VectorCopy(goal->origin, target);
;1926:		target[2] += 1;
;1927:		VectorSubtract(bs->origin, target, dir);
;1928:		if (VectorLengthSquared(dir) < Square(200)) {
;1929:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1930:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1931:				trap_EA_Use(bs->client);
;1932:				return;
;1933:			}
;1934:		}
;1935:	} else if (gametype == GT_1FCTF) {
;1936:		// never use kamikaze if the team flag carrier is visible
;1937:		if (Bot1FCTFCarryingFlag(bs))
;1938:			return;
;1939:		c = BotEnemyFlagCarrierVisible(bs);
;1940:		if (c >= 0)
;1941:			return;
;1942:		// if near enemy flag and the flag is visible
;1943:		switch (BotTeam(bs)) {
;1944:		case TEAM_RED:
;1945:			goal = &ctf_blueflag;
;1946:			break;
;1947:		default:
;1948:			goal = &ctf_redflag;
;1949:			break;
;1950:		}
;1951:		// if the obelisk is visible
;1952:		VectorCopy(goal->origin, target);
;1953:		target[2] += 1;
;1954:		VectorSubtract(bs->origin, target, dir);
;1955:		if (VectorLengthSquared(dir) < Square(200)) {
;1956:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1957:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1958:				trap_EA_Use(bs->client);
;1959:				return;
;1960:			}
;1961:		}
;1962:	} else if (gametype == GT_OBELISK) {
;1963:		switch (BotTeam(bs)) {
;1964:		case TEAM_RED:
;1965:			goal = &blueobelisk;
;1966:			break;
;1967:		default:
;1968:			goal = &redobelisk;
;1969:			break;
;1970:		}
;1971:		// if the obelisk is visible
;1972:		VectorCopy(goal->origin, target);
;1973:		target[2] += 1;
;1974:		VectorSubtract(bs->origin, target, dir);
;1975:		if (VectorLengthSquared(dir) < Square(300)) {
;1976:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;1977:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;1978:				trap_EA_Use(bs->client);
;1979:				return;
;1980:			}
;1981:		}
;1982:	} else if (gametype == GT_HARVESTER) {
;1983:		//
;1984:		if (BotHarvesterCarryingCubes(bs))
;1985:			return;
;1986:		c = BotEnemyCubeCarrierVisible(bs);
;1987:		if (c >= 0)
;1988:			return;
;1989:		// if near enemy base and enemy base is visible
;1990:		switch (BotTeam(bs)) {
;1991:		case TEAM_RED:
;1992:			goal = &blueobelisk;
;1993:			break;
;1994:		default:
;1995:			goal = &redobelisk;
;1996:			break;
;1997:		}
;1998:		// if the obelisk is visible
;1999:		VectorCopy(goal->origin, target);
;2000:		target[2] += 1;
;2001:		VectorSubtract(bs->origin, target, dir);
;2002:		if (VectorLengthSquared(dir) < Square(200)) {
;2003:			BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;2004:			if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;2005:				trap_EA_Use(bs->client);
;2006:				return;
;2007:			}
;2008:		}
;2009:	}
;2010:}
;2011:#endif
;2012:
;2013:/*
;2014:==================
;2015:BotBattleUseItems
;2016:==================
;2017:*/
;2018:void BotBattleUseItems(bot_state_t* bs) {
line 2019
;2019:	if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 40
GEI4 $448
line 2020
;2020:		if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $450
line 2021
;2021:			if (!BotCTFCarryingFlag(bs)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $452
line 2025
;2022:#ifdef MISSIONPACK
;2023:			    && !Bot1FCTFCarryingFlag(bs) && !BotHarvesterCarryingCubes(bs)
;2024:#endif
;2025:			) {
line 2026
;2026:				trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2027
;2027:			}
LABELV $452
line 2028
;2028:		}
LABELV $450
line 2029
;2029:	}
LABELV $448
line 2030
;2030:	if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $454
line 2031
;2031:		if (bs->inventory[INVENTORY_MEDKIT] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5076
ADDP4
INDIRI4
CNSTI4 0
LEI4 $456
line 2032
;2032:			trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 2033
;2033:		}
LABELV $456
line 2034
;2034:	}
LABELV $454
line 2039
;2035:#ifdef MISSIONPACK
;2036:	BotUseKamikaze(bs);
;2037:	BotUseInvulnerability(bs);
;2038:#endif
;2039:}
LABELV $447
endproc BotBattleUseItems 4 4
export BotSetTeleportTime
proc BotSetTeleportTime 8 0
line 2046
;2040:
;2041:/*
;2042:==================
;2043:BotSetTeleportTime
;2044:==================
;2045:*/
;2046:void BotSetTeleportTime(bot_state_t* bs) {
line 2047
;2047:	if ((bs->cur_ps.eFlags ^ bs->last_eFlags) & EF_TELEPORT_BIT) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 484
ADDP4
INDIRI4
BXORI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $459
line 2048
;2048:		bs->teleport_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2049
;2049:	}
LABELV $459
line 2050
;2050:	bs->last_eFlags = bs->cur_ps.eFlags;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 484
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 120
ADDP4
INDIRI4
ASGNI4
line 2051
;2051:}
LABELV $458
endproc BotSetTeleportTime 8 0
export BotIsDead
proc BotIsDead 4 0
line 2058
;2052:
;2053:/*
;2054:==================
;2055:BotIsDead
;2056:==================
;2057:*/
;2058:qboolean BotIsDead(bot_state_t* bs) {
line 2059
;2059:	return (bs->cur_ps.pm_type == PM_DEAD);
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 3
NEI4 $463
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $464
JUMPV
LABELV $463
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $464
ADDRLP4 0
INDIRI4
RETI4
LABELV $461
endproc BotIsDead 4 0
export BotIsObserver
proc BotIsObserver 1032 12
line 2067
;2060:}
;2061:
;2062:/*
;2063:==================
;2064:BotIsObserver
;2065:==================
;2066:*/
;2067:qboolean BotIsObserver(bot_state_t* bs) {
line 2069
;2068:	char buf[MAX_INFO_STRING];
;2069:	if (bs->cur_ps.pm_type == PM_SPECTATOR)
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 2
NEI4 $466
line 2070
;2070:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $465
JUMPV
LABELV $466
line 2071
;2071:	trap_GetConfigstring(CS_PLAYERS + bs->client, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 2072
;2072:	if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR)
ADDRLP4 0
ARGP4
ADDRGP4 $69
ARGP4
ADDRLP4 1024
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1024
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 3
NEI4 $468
line 2073
;2073:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $465
JUMPV
LABELV $468
line 2074
;2074:	return qfalse;
CNSTI4 0
RETI4
LABELV $465
endproc BotIsObserver 1032 12
export BotIntermission
proc BotIntermission 8 0
line 2082
;2075:}
;2076:
;2077:/*
;2078:==================
;2079:BotIntermission
;2080:==================
;2081:*/
;2082:qboolean BotIntermission(bot_state_t* bs) {
line 2084
;2083:	// NOTE: we shouldn't be looking at the game code...
;2084:	if (level.intermissiontime)
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $471
line 2085
;2085:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $470
JUMPV
LABELV $471
line 2086
;2086:	return (bs->cur_ps.pm_type == PM_FREEZE || bs->cur_ps.pm_type == PM_INTERMISSION);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 4
EQI4 $477
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 5
NEI4 $475
LABELV $477
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $476
JUMPV
LABELV $475
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $476
ADDRLP4 0
INDIRI4
RETI4
LABELV $470
endproc BotIntermission 8 0
export BotInLavaOrSlime
proc BotInLavaOrSlime 16 4
line 2094
;2087:}
;2088:
;2089:/*
;2090:==================
;2091:BotInLavaOrSlime
;2092:==================
;2093:*/
;2094:qboolean BotInLavaOrSlime(bot_state_t* bs) {
line 2097
;2095:	vec3_t feet;
;2096:
;2097:	VectorCopy(bs->origin, feet);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 2098
;2098:	feet[2] -= 23;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1102577664
SUBF4
ASGNF4
line 2099
;2099:	return (trap_AAS_PointContents(feet) & (CONTENTS_LAVA | CONTENTS_SLIME));
ADDRLP4 0
ARGP4
ADDRLP4 12
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 24
BANDI4
RETI4
LABELV $478
endproc BotInLavaOrSlime 16 4
data
align 4
LABELV $481
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $482
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCreateWayPoint
code
proc BotCreateWayPoint 32 12
line 2107
;2100:}
;2101:
;2102:/*
;2103:==================
;2104:BotCreateWayPoint
;2105:==================
;2106:*/
;2107:bot_waypoint_t* BotCreateWayPoint(char* name, vec3_t origin, int areanum) {
line 2109
;2108:	bot_waypoint_t* wp;
;2109:	vec3_t          waypointmins = {-8, -8, -8}, waypointmaxs = {8, 8, 8};
ADDRLP4 4
ADDRGP4 $481
INDIRB
ASGNB 12
ADDRLP4 16
ADDRGP4 $482
INDIRB
ASGNB 12
line 2111
;2110:
;2111:	wp = botai_freewaypoints;
ADDRLP4 0
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2112
;2112:	if (!wp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $483
line 2113
;2113:		BotAI_Print(PRT_WARNING, "BotCreateWayPoint: Out of waypoints\n");
CNSTI4 2
ARGI4
ADDRGP4 $485
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 2114
;2114:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $480
JUMPV
LABELV $483
line 2116
;2115:	}
;2116:	botai_freewaypoints = botai_freewaypoints->next;
ADDRLP4 28
ADDRGP4 botai_freewaypoints
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 2118
;2117:
;2118:	Q_strncpyz(wp->name, name, sizeof(wp->name));
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2119
;2119:	VectorCopy(origin, wp->goal.origin);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2120
;2120:	VectorCopy(waypointmins, wp->goal.mins);
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 2121
;2121:	VectorCopy(waypointmaxs, wp->goal.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 2122
;2122:	wp->goal.areanum = areanum;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 2123
;2123:	wp->next         = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
CNSTP4 0
ASGNP4
line 2124
;2124:	wp->prev         = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
CNSTP4 0
ASGNP4
line 2125
;2125:	return wp;
ADDRLP4 0
INDIRP4
RETP4
LABELV $480
endproc BotCreateWayPoint 32 12
export BotFindWayPoint
proc BotFindWayPoint 8 8
line 2133
;2126:}
;2127:
;2128:/*
;2129:==================
;2130:BotFindWayPoint
;2131:==================
;2132:*/
;2133:bot_waypoint_t* BotFindWayPoint(bot_waypoint_t* waypoints, char* name) {
line 2136
;2134:	bot_waypoint_t* wp;
;2135:
;2136:	for (wp = waypoints; wp; wp = wp->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $490
JUMPV
LABELV $487
line 2137
;2137:		if (!Q_stricmp(wp->name, name))
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $491
line 2138
;2138:			return wp;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $486
JUMPV
LABELV $491
line 2139
;2139:	}
LABELV $488
line 2136
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $490
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $487
line 2140
;2140:	return NULL;
CNSTP4 0
RETP4
LABELV $486
endproc BotFindWayPoint 8 8
export BotFreeWaypoints
proc BotFreeWaypoints 4 0
line 2148
;2141:}
;2142:
;2143:/*
;2144:==================
;2145:BotFreeWaypoints
;2146:==================
;2147:*/
;2148:void BotFreeWaypoints(bot_waypoint_t* wp) {
line 2151
;2149:	bot_waypoint_t* nextwp;
;2150:
;2151:	for (; wp; wp = nextwp) {
ADDRGP4 $497
JUMPV
LABELV $494
line 2152
;2152:		nextwp              = wp->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
line 2153
;2153:		wp->next            = botai_freewaypoints;
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2154
;2154:		botai_freewaypoints = wp;
ADDRGP4 botai_freewaypoints
ADDRFP4 0
INDIRP4
ASGNP4
line 2155
;2155:	}
LABELV $495
line 2151
ADDRFP4 0
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $497
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $494
line 2156
;2156:}
LABELV $493
endproc BotFreeWaypoints 4 0
export BotInitWaypoints
proc BotInitWaypoints 4 0
line 2163
;2157:
;2158:/*
;2159:==================
;2160:BotInitWaypoints
;2161:==================
;2162:*/
;2163:void BotInitWaypoints(void) {
line 2166
;2164:	int i;
;2165:
;2166:	botai_freewaypoints = NULL;
ADDRGP4 botai_freewaypoints
CNSTP4 0
ASGNP4
line 2167
;2167:	for (i = 0; i < MAX_WAYPOINTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $499
line 2168
;2168:		botai_waypoints[i].next = botai_freewaypoints;
ADDRLP4 0
INDIRI4
CNSTI4 100
MULI4
ADDRGP4 botai_waypoints+92
ADDP4
ADDRGP4 botai_freewaypoints
INDIRP4
ASGNP4
line 2169
;2169:		botai_freewaypoints     = &botai_waypoints[i];
ADDRGP4 botai_freewaypoints
ADDRLP4 0
INDIRI4
CNSTI4 100
MULI4
ADDRGP4 botai_waypoints
ADDP4
ASGNP4
line 2170
;2170:	}
LABELV $500
line 2167
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $499
line 2171
;2171:}
LABELV $498
endproc BotInitWaypoints 4 0
export TeamPlayIsOn
proc TeamPlayIsOn 4 0
line 2178
;2172:
;2173:/*
;2174:==================
;2175:TeamPlayIsOn
;2176:==================
;2177:*/
;2178:int TeamPlayIsOn(void) {
line 2179
;2179:	return (gametype >= GT_TEAM);
ADDRGP4 gametype
INDIRI4
CNSTI4 3
LTI4 $506
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $507
JUMPV
LABELV $506
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $507
ADDRLP4 0
INDIRI4
RETI4
LABELV $504
endproc TeamPlayIsOn 4 0
export BotAggression
proc BotAggression 28 0
line 2187
;2180:}
;2181:
;2182:/*
;2183:==================
;2184:BotAggression
;2185:==================
;2186:*/
;2187:float BotAggression(bot_state_t* bs) {
line 2189
;2188:	// if the bot has quad
;2189:	if (bs->inventory[INVENTORY_QUAD]) {
ADDRFP4 0
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $509
line 2191
;2190:		// if the bot is not holding the gauntlet or the enemy is really nearby
;2191:		if (bs->weaponnum != WP_GAUNTLET || bs->inventory[ENEMY_HORIZONTAL_DIST] < 80) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $513
ADDRLP4 0
INDIRP4
CNSTI4 5752
ADDP4
INDIRI4
CNSTI4 80
GEI4 $511
LABELV $513
line 2192
;2192:			return 70;
CNSTF4 1116471296
RETF4
ADDRGP4 $508
JUMPV
LABELV $511
line 2194
;2193:		}
;2194:	}
LABELV $509
line 2196
;2195:	// if the enemy is located way higher than the bot
;2196:	if (bs->inventory[ENEMY_HEIGHT] > 200)
ADDRFP4 0
INDIRP4
CNSTI4 5756
ADDP4
INDIRI4
CNSTI4 200
LEI4 $514
line 2197
;2197:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $508
JUMPV
LABELV $514
line 2199
;2198:	// if the bot is very low on health
;2199:	if (bs->inventory[INVENTORY_HEALTH] < 60)
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $516
line 2200
;2200:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $508
JUMPV
LABELV $516
line 2202
;2201:	// if the bot is low on health
;2202:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $518
line 2204
;2203:		// if the bot has insufficient armor
;2204:		if (bs->inventory[INVENTORY_ARMOR] < 40)
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $520
line 2205
;2205:			return 0;
CNSTF4 0
RETF4
ADDRGP4 $508
JUMPV
LABELV $520
line 2206
;2206:	}
LABELV $518
line 2208
;2207:	// if the bot can use the bfg
;2208:	if (bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 7)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $522
ADDRLP4 0
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $522
line 2209
;2209:		return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $508
JUMPV
LABELV $522
line 2211
;2210:	// if the bot can use the railgun
;2211:	if (bs->inventory[INVENTORY_RAILGUN] > 0 && bs->inventory[INVENTORY_SLUGS] > 5)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $524
ADDRLP4 4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $524
line 2212
;2212:		return 95;
CNSTF4 1119748096
RETF4
ADDRGP4 $508
JUMPV
LABELV $524
line 2214
;2213:	// if the bot can use the lightning gun
;2214:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 && bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50)
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4988
ADDP4
INDIRI4
CNSTI4 0
LEI4 $526
ADDRLP4 8
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $526
line 2215
;2215:		return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $508
JUMPV
LABELV $526
line 2217
;2216:	// if the bot can use the rocketlauncher
;2217:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 5)
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $528
ADDRLP4 12
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $528
line 2218
;2218:		return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $508
JUMPV
LABELV $528
line 2220
;2219:	// if the bot can use the plasmagun
;2220:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 40)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $530
ADDRLP4 16
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 40
LEI4 $530
line 2221
;2221:		return 85;
CNSTF4 1118437376
RETF4
ADDRGP4 $508
JUMPV
LABELV $530
line 2223
;2222:	// if the bot can use the grenade launcher
;2223:	if (bs->inventory[INVENTORY_GRENADELAUNCHER] > 0 && bs->inventory[INVENTORY_GRENADES] > 10)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 4980
ADDP4
INDIRI4
CNSTI4 0
LEI4 $532
ADDRLP4 20
INDIRP4
CNSTI4 5032
ADDP4
INDIRI4
CNSTI4 10
LEI4 $532
line 2224
;2224:		return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $508
JUMPV
LABELV $532
line 2226
;2225:	// if the bot can use the shotgun
;2226:	if (bs->inventory[INVENTORY_SHOTGUN] > 0 && bs->inventory[INVENTORY_SHELLS] > 10)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 4972
ADDP4
INDIRI4
CNSTI4 0
LEI4 $534
ADDRLP4 24
INDIRP4
CNSTI4 5024
ADDP4
INDIRI4
CNSTI4 10
LEI4 $534
line 2227
;2227:		return 50;
CNSTF4 1112014848
RETF4
ADDRGP4 $508
JUMPV
LABELV $534
line 2229
;2228:	// otherwise the bot is not feeling too good
;2229:	return 0;
CNSTF4 0
RETF4
LABELV $508
endproc BotAggression 28 0
export BotFeelingBad
proc BotFeelingBad 0 0
line 2237
;2230:}
;2231:
;2232:/*
;2233:==================
;2234:BotFeelingBad
;2235:==================
;2236:*/
;2237:float BotFeelingBad(bot_state_t* bs) {
line 2238
;2238:	if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $537
line 2239
;2239:		return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $536
JUMPV
LABELV $537
line 2241
;2240:	}
;2241:	if (bs->inventory[INVENTORY_HEALTH] < 40) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 40
GEI4 $539
line 2242
;2242:		return 100;
CNSTF4 1120403456
RETF4
ADDRGP4 $536
JUMPV
LABELV $539
line 2244
;2243:	}
;2244:	if (bs->weaponnum == WP_MACHINEGUN) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 2
NEI4 $541
line 2245
;2245:		return 90;
CNSTF4 1119092736
RETF4
ADDRGP4 $536
JUMPV
LABELV $541
line 2247
;2246:	}
;2247:	if (bs->inventory[INVENTORY_HEALTH] < 60) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $543
line 2248
;2248:		return 80;
CNSTF4 1117782016
RETF4
ADDRGP4 $536
JUMPV
LABELV $543
line 2250
;2249:	}
;2250:	return 0;
CNSTF4 0
RETF4
LABELV $536
endproc BotFeelingBad 0 0
export BotWantsToRetreat
proc BotWantsToRetreat 144 8
line 2258
;2251:}
;2252:
;2253:/*
;2254:==================
;2255:BotWantsToRetreat
;2256:==================
;2257:*/
;2258:int BotWantsToRetreat(bot_state_t* bs) {
line 2261
;2259:	aas_entityinfo_t entinfo;
;2260:
;2261:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $546
line 2263
;2262:		// always retreat when carrying a CTF flag
;2263:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $548
line 2264
;2264:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $545
JUMPV
LABELV $548
line 2265
;2265:	}
LABELV $546
line 2289
;2266:#ifdef MISSIONPACK
;2267:	else if (gametype == GT_1FCTF) {
;2268:		// if carrying the flag then always retreat
;2269:		if (Bot1FCTFCarryingFlag(bs))
;2270:			return qtrue;
;2271:	} else if (gametype == GT_OBELISK) {
;2272:		// the bots should be dedicated to attacking the enemy obelisk
;2273:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
;2274:			if (bs->enemy != redobelisk.entitynum && bs->enemy != blueobelisk.entitynum) {
;2275:				return qtrue;
;2276:			}
;2277:		}
;2278:		if (BotFeelingBad(bs) > 50) {
;2279:			return qtrue;
;2280:		}
;2281:		return qfalse;
;2282:	} else if (gametype == GT_HARVESTER) {
;2283:		// if carrying cubes then always retreat
;2284:		if (BotHarvesterCarryingCubes(bs))
;2285:			return qtrue;
;2286:	}
;2287:#endif
;2288:	//
;2289:	if (bs->enemy >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
LTI4 $550
line 2291
;2290:		// if the enemy is carrying a flag
;2291:		BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2292
;2292:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $552
line 2293
;2293:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $545
JUMPV
LABELV $552
line 2294
;2294:	}
LABELV $550
line 2296
;2295:	// if the bot is getting the flag
;2296:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $554
line 2297
;2297:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $545
JUMPV
LABELV $554
line 2299
;2298:	//
;2299:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
GEF4 $556
line 2300
;2300:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $545
JUMPV
LABELV $556
line 2301
;2301:	return qfalse;
CNSTI4 0
RETI4
LABELV $545
endproc BotWantsToRetreat 144 8
export BotWantsToChase
proc BotWantsToChase 148 8
line 2309
;2302:}
;2303:
;2304:/*
;2305:==================
;2306:BotWantsToChase
;2307:==================
;2308:*/
;2309:int BotWantsToChase(bot_state_t* bs) {
line 2312
;2310:	aas_entityinfo_t entinfo;
;2311:
;2312:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $559
line 2314
;2313:		// never chase when carrying a CTF flag
;2314:		if (BotCTFCarryingFlag(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotCTFCarryingFlag
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $561
line 2315
;2315:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $558
JUMPV
LABELV $561
line 2317
;2316:		// always chase if the enemy is carrying a flag
;2317:		BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2318
;2318:		if (EntityCarriesFlag(&entinfo))
ADDRLP4 0
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $563
line 2319
;2319:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $558
JUMPV
LABELV $563
line 2320
;2320:	}
LABELV $559
line 2344
;2321:#ifdef MISSIONPACK
;2322:	else if (gametype == GT_1FCTF) {
;2323:		// never chase if carrying the flag
;2324:		if (Bot1FCTFCarryingFlag(bs))
;2325:			return qfalse;
;2326:		// always chase if the enemy is carrying a flag
;2327:		BotEntityInfo(bs->enemy, &entinfo);
;2328:		if (EntityCarriesFlag(&entinfo))
;2329:			return qtrue;
;2330:	} else if (gametype == GT_OBELISK) {
;2331:		// the bots should be dedicated to attacking the enemy obelisk
;2332:		if (bs->ltgtype == LTG_ATTACKENEMYBASE) {
;2333:			if (bs->enemy != redobelisk.entitynum && bs->enemy != blueobelisk.entitynum) {
;2334:				return qfalse;
;2335:			}
;2336:		}
;2337:	} else if (gametype == GT_HARVESTER) {
;2338:		// never chase if carrying cubes
;2339:		if (BotHarvesterCarryingCubes(bs))
;2340:			return qfalse;
;2341:	}
;2342:#endif
;2343:	// if the bot is getting the flag
;2344:	if (bs->ltgtype == LTG_GETFLAG)
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
NEI4 $565
line 2345
;2345:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $558
JUMPV
LABELV $565
line 2347
;2346:	//
;2347:	if (BotAggression(bs) > 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
LEF4 $567
line 2348
;2348:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $558
JUMPV
LABELV $567
line 2349
;2349:	return qfalse;
CNSTI4 0
RETI4
LABELV $558
endproc BotWantsToChase 148 8
export BotWantsToHelp
proc BotWantsToHelp 0 0
line 2357
;2350:}
;2351:
;2352:/*
;2353:==================
;2354:BotWantsToHelp
;2355:==================
;2356:*/
;2357:int BotWantsToHelp(bot_state_t* bs) {
line 2358
;2358:	return qtrue;
CNSTI4 1
RETI4
LABELV $569
endproc BotWantsToHelp 0 0
export BotCanAndWantsToRocketJump
proc BotCanAndWantsToRocketJump 8 16
line 2366
;2359:}
;2360:
;2361:/*
;2362:==================
;2363:BotCanAndWantsToRocketJump
;2364:==================
;2365:*/
;2366:int BotCanAndWantsToRocketJump(bot_state_t* bs) {
line 2370
;2367:	float rocketjumper;
;2368:
;2369:	// if rocket jumping is disabled
;2370:	if (!bot_rocketjump.integer)
ADDRGP4 bot_rocketjump+12
INDIRI4
CNSTI4 0
NEI4 $571
line 2371
;2371:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $570
JUMPV
LABELV $571
line 2373
;2372:	// if no rocket launcher
;2373:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
GTI4 $574
line 2374
;2374:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $570
JUMPV
LABELV $574
line 2376
;2375:	// if low on rockets
;2376:	if (bs->inventory[INVENTORY_ROCKETS] < 3)
ADDRFP4 0
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 3
GEI4 $576
line 2377
;2377:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $570
JUMPV
LABELV $576
line 2379
;2378:	// never rocket jump with the Quad
;2379:	if (bs->inventory[INVENTORY_QUAD])
ADDRFP4 0
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
EQI4 $578
line 2380
;2380:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $570
JUMPV
LABELV $578
line 2382
;2381:	// if low on health
;2382:	if (bs->inventory[INVENTORY_HEALTH] < 60)
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $580
line 2383
;2383:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $570
JUMPV
LABELV $580
line 2385
;2384:	// if not full health
;2385:	if (bs->inventory[INVENTORY_HEALTH] < 90) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 90
GEI4 $582
line 2387
;2386:		// if the bot has insufficient armor
;2387:		if (bs->inventory[INVENTORY_ARMOR] < 40)
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $584
line 2388
;2388:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $570
JUMPV
LABELV $584
line 2389
;2389:	}
LABELV $582
line 2390
;2390:	rocketjumper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_WEAPONJUMPING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 38
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 4
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 2391
;2391:	if (rocketjumper < 0.5)
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
GEF4 $586
line 2392
;2392:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $570
JUMPV
LABELV $586
line 2393
;2393:	return qtrue;
CNSTI4 1
RETI4
LABELV $570
endproc BotCanAndWantsToRocketJump 8 16
export BotHasPersistantPowerupAndWeapon
proc BotHasPersistantPowerupAndWeapon 32 0
line 2401
;2394:}
;2395:
;2396:/*
;2397:==================
;2398:BotHasPersistantPowerupAndWeapon
;2399:==================
;2400:*/
;2401:int BotHasPersistantPowerupAndWeapon(bot_state_t* bs) {
line 2409
;2402:#ifdef MISSIONPACK
;2403:	// if the bot does not have a persistant powerup
;2404:	if (!bs->inventory[INVENTORY_SCOUT] && !bs->inventory[INVENTORY_GUARD] && !bs->inventory[INVENTORY_DOUBLER] && !bs->inventory[INVENTORY_AMMOREGEN]) {
;2405:		return qfalse;
;2406:	}
;2407:#endif
;2408:	// if the bot is very low on health
;2409:	if (bs->inventory[INVENTORY_HEALTH] < 60)
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 60
GEI4 $589
line 2410
;2410:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $588
JUMPV
LABELV $589
line 2412
;2411:	// if the bot is low on health
;2412:	if (bs->inventory[INVENTORY_HEALTH] < 80) {
ADDRFP4 0
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
CNSTI4 80
GEI4 $591
line 2414
;2413:		// if the bot has insufficient armor
;2414:		if (bs->inventory[INVENTORY_ARMOR] < 40)
ADDRFP4 0
INDIRP4
CNSTI4 4956
ADDP4
INDIRI4
CNSTI4 40
GEI4 $593
line 2415
;2415:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $588
JUMPV
LABELV $593
line 2416
;2416:	}
LABELV $591
line 2418
;2417:	// if the bot can use the bfg
;2418:	if (bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 7)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $595
ADDRLP4 0
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 7
LEI4 $595
line 2419
;2419:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $588
JUMPV
LABELV $595
line 2421
;2420:	// if the bot can use the railgun
;2421:	if (bs->inventory[INVENTORY_RAILGUN] > 0 && bs->inventory[INVENTORY_SLUGS] > 5)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $597
ADDRLP4 4
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 5
LEI4 $597
line 2422
;2422:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $588
JUMPV
LABELV $597
line 2424
;2423:	// if the bot can use the lightning gun
;2424:	if (bs->inventory[INVENTORY_LIGHTNING] > 0 && bs->inventory[INVENTORY_LIGHTNINGAMMO] > 50)
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4988
ADDP4
INDIRI4
CNSTI4 0
LEI4 $599
ADDRLP4 8
INDIRP4
CNSTI4 5040
ADDP4
INDIRI4
CNSTI4 50
LEI4 $599
line 2425
;2425:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $588
JUMPV
LABELV $599
line 2427
;2426:	// if the bot can use the rocketlauncher
;2427:	if (bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 5)
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $601
ADDRLP4 12
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 5
LEI4 $601
line 2428
;2428:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $588
JUMPV
LABELV $601
line 2430
;2429:	//
;2430:	if (bs->inventory[INVENTORY_NAILGUN] > 0 && bs->inventory[INVENTORY_NAILS] > 5)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 5012
ADDP4
INDIRI4
CNSTI4 0
LEI4 $603
ADDRLP4 16
INDIRP4
CNSTI4 5056
ADDP4
INDIRI4
CNSTI4 5
LEI4 $603
line 2431
;2431:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $588
JUMPV
LABELV $603
line 2433
;2432:	//
;2433:	if (bs->inventory[INVENTORY_PROXLAUNCHER] > 0 && bs->inventory[INVENTORY_MINES] > 5)
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 5016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $605
ADDRLP4 20
INDIRP4
CNSTI4 5060
ADDP4
INDIRI4
CNSTI4 5
LEI4 $605
line 2434
;2434:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $588
JUMPV
LABELV $605
line 2436
;2435:	//
;2436:	if (bs->inventory[INVENTORY_CHAINGUN] > 0 && bs->inventory[INVENTORY_BELT] > 40)
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 5020
ADDP4
INDIRI4
CNSTI4 0
LEI4 $607
ADDRLP4 24
INDIRP4
CNSTI4 5064
ADDP4
INDIRI4
CNSTI4 40
LEI4 $607
line 2437
;2437:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $588
JUMPV
LABELV $607
line 2439
;2438:	// if the bot can use the plasmagun
;2439:	if (bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 20)
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 4996
ADDP4
INDIRI4
CNSTI4 0
LEI4 $609
ADDRLP4 28
INDIRP4
CNSTI4 5036
ADDP4
INDIRI4
CNSTI4 20
LEI4 $609
line 2440
;2440:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $588
JUMPV
LABELV $609
line 2441
;2441:	return qfalse;
CNSTI4 0
RETI4
LABELV $588
endproc BotHasPersistantPowerupAndWeapon 32 0
export BotGoCamp
proc BotGoCamp 16 16
line 2449
;2442:}
;2443:
;2444:/*
;2445:==================
;2446:BotGoCamp
;2447:==================
;2448:*/
;2449:void BotGoCamp(bot_state_t* bs, bot_goal_t* goal) {
line 2452
;2450:	float camper;
;2451:
;2452:	bs->decisionmaker = bs->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 2454
;2453:	// set message time to zero so bot will NOT show any message
;2454:	bs->teammessage_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
CNSTF4 0
ASGNF4
line 2456
;2455:	// set the ltg type
;2456:	bs->ltgtype = LTG_CAMP;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 7
ASGNI4
line 2458
;2457:	// set the team goal
;2458:	memcpy(&bs->teamgoal, goal, sizeof(bot_goal_t));
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2460
;2459:	// get the team goal time
;2460:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 44
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 8
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 2461
;2461:	if (camper > 0.99)
ADDRLP4 0
INDIRF4
CNSTF4 1065185444
LEF4 $612
line 2462
;2462:		bs->teamgoal_time = FloatTime() + 99999;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1203982208
ADDF4
ASGNF4
ADDRGP4 $613
JUMPV
LABELV $612
line 2464
;2463:	else
;2464:		bs->teamgoal_time = FloatTime() + 120 + 180 * camper + random() * 15;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ADDRLP4 0
INDIRF4
CNSTF4 1127481344
MULF4
ADDF4
ADDRLP4 12
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 972030432
MULF4
ADDF4
ASGNF4
LABELV $613
line 2466
;2465:	// set the last time the bot started camping
;2466:	bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2468
;2467:	// the teammate that requested the camping
;2468:	bs->teammate = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
CNSTI4 0
ASGNI4
line 2470
;2469:	// do NOT type arrive message
;2470:	bs->arrive_time = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 1065353216
ASGNF4
line 2471
;2471:}
LABELV $611
endproc BotGoCamp 16 16
export BotWantsToCamp
proc BotWantsToCamp 172 16
line 2478
;2472:
;2473:/*
;2474:==================
;2475:BotWantsToCamp
;2476:==================
;2477:*/
;2478:int BotWantsToCamp(bot_state_t* bs) {
line 2483
;2479:	float      camper;
;2480:	int        cs, traveltime, besttraveltime;
;2481:	bot_goal_t goal, bestgoal;
;2482:
;2483:	camper = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CAMPER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 44
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 128
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 124
ADDRLP4 128
INDIRF4
ASGNF4
line 2484
;2484:	if (camper < 0.1)
ADDRLP4 124
INDIRF4
CNSTF4 1036831949
GEF4 $615
line 2485
;2485:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $614
JUMPV
LABELV $615
line 2487
;2486:	// if the bot has a team goal
;2487:	if (bs->ltgtype == LTG_TEAMHELP || bs->ltgtype == LTG_TEAMACCOMPANY || bs->ltgtype == LTG_DEFENDKEYAREA || bs->ltgtype == LTG_GETFLAG ||
ADDRLP4 132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $625
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $625
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 3
EQI4 $625
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 4
EQI4 $625
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
EQI4 $625
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 7
EQI4 $625
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 8
EQI4 $625
ADDRLP4 132
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 9
NEI4 $617
LABELV $625
line 2488
;2488:	    bs->ltgtype == LTG_RUSHBASE || bs->ltgtype == LTG_CAMP || bs->ltgtype == LTG_CAMPORDER || bs->ltgtype == LTG_PATROL) {
line 2489
;2489:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $614
JUMPV
LABELV $617
line 2492
;2490:	}
;2491:	// if camped recently
;2492:	if (bs->camp_time > FloatTime() - 60 + 300 * (1 - camper))
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
SUBF4
CNSTF4 1065353216
ADDRLP4 124
INDIRF4
SUBF4
CNSTF4 1133903872
MULF4
ADDF4
LEF4 $626
line 2493
;2493:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $614
JUMPV
LABELV $626
line 2495
;2494:	//
;2495:	if (random() > camper) {
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 124
INDIRF4
LEF4 $628
line 2496
;2496:		bs->camp_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6184
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2497
;2497:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $614
JUMPV
LABELV $628
line 2500
;2498:	}
;2499:	// if the bot isn't healthy anough
;2500:	if (BotAggression(bs) < 50)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotAggression
CALLF4
ASGNF4
ADDRLP4 140
INDIRF4
CNSTF4 1112014848
GEF4 $630
line 2501
;2501:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $614
JUMPV
LABELV $630
line 2503
;2502:	// the bot should have at least have the rocket launcher, the railgun or the bfg10k with some ammo
;2503:	if ((bs->inventory[INVENTORY_ROCKETLAUNCHER] <= 0 || bs->inventory[INVENTORY_ROCKETS] < 10) &&
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 4984
ADDP4
INDIRI4
CNSTI4 0
LEI4 $634
ADDRLP4 144
INDIRP4
CNSTI4 5044
ADDP4
INDIRI4
CNSTI4 10
GEI4 $632
LABELV $634
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 4992
ADDP4
INDIRI4
CNSTI4 0
LEI4 $635
ADDRLP4 148
INDIRP4
CNSTI4 5048
ADDP4
INDIRI4
CNSTI4 10
GEI4 $632
LABELV $635
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 5004
ADDP4
INDIRI4
CNSTI4 0
LEI4 $636
ADDRLP4 152
INDIRP4
CNSTI4 5052
ADDP4
INDIRI4
CNSTI4 10
GEI4 $632
LABELV $636
line 2505
;2504:	    (bs->inventory[INVENTORY_RAILGUN] <= 0 || bs->inventory[INVENTORY_SLUGS] < 10) &&
;2505:	    (bs->inventory[INVENTORY_BFG10K] <= 0 || bs->inventory[INVENTORY_BFGAMMO] < 10)) {
line 2506
;2506:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $614
JUMPV
LABELV $632
line 2509
;2507:	}
;2508:	// find the closest camp spot
;2509:	besttraveltime = 99999;
ADDRLP4 64
CNSTI4 99999
ASGNI4
line 2510
;2510:	for (cs = trap_BotGetNextCampSpotGoal(0, &goal); cs; cs = trap_BotGetNextCampSpotGoal(cs, &goal)) {
CNSTI4 0
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 156
ADDRGP4 trap_BotGetNextCampSpotGoal
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 156
INDIRI4
ASGNI4
ADDRGP4 $640
JUMPV
LABELV $637
line 2511
;2511:		traveltime = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, goal.areanum, TFL_DEFAULT);
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 160
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 8+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 164
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 164
INDIRI4
ASGNI4
line 2512
;2512:		if (traveltime && traveltime < besttraveltime) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $642
ADDRLP4 0
INDIRI4
ADDRLP4 64
INDIRI4
GEI4 $642
line 2513
;2513:			besttraveltime = traveltime;
ADDRLP4 64
ADDRLP4 0
INDIRI4
ASGNI4
line 2514
;2514:			memcpy(&bestgoal, &goal, sizeof(bot_goal_t));
ADDRLP4 68
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 2515
;2515:		}
LABELV $642
line 2516
;2516:	}
LABELV $638
line 2510
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRLP4 160
ADDRGP4 trap_BotGetNextCampSpotGoal
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 160
INDIRI4
ASGNI4
LABELV $640
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $637
line 2517
;2517:	if (besttraveltime > 150)
ADDRLP4 64
INDIRI4
CNSTI4 150
LEI4 $644
line 2518
;2518:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $614
JUMPV
LABELV $644
line 2520
;2519:	// ok found a camp spot, go camp there
;2520:	BotGoCamp(bs, &bestgoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 BotGoCamp
CALLV
pop
line 2521
;2521:	bs->ordered = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 0
ASGNI4
line 2523
;2522:	//
;2523:	return qtrue;
CNSTI4 1
RETI4
LABELV $614
endproc BotWantsToCamp 172 16
export BotDontAvoid
proc BotDontAvoid 68 12
line 2531
;2524:}
;2525:
;2526:/*
;2527:==================
;2528:BotDontAvoid
;2529:==================
;2530:*/
;2531:void BotDontAvoid(bot_state_t* bs, char* itemname) {
line 2535
;2532:	bot_goal_t goal;
;2533:	int        num;
;2534:
;2535:	num = trap_BotGetLevelItemGoal(-1, itemname, &goal);
CNSTI4 -1
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 60
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 60
INDIRI4
ASGNI4
ADDRGP4 $648
JUMPV
LABELV $647
line 2536
;2536:	while (num >= 0) {
line 2537
;2537:		trap_BotRemoveFromAvoidGoals(bs->gs, goal.number);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRLP4 4+44
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveFromAvoidGoals
CALLV
pop
line 2538
;2538:		num = trap_BotGetLevelItemGoal(num, itemname, &goal);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 64
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 64
INDIRI4
ASGNI4
line 2539
;2539:	}
LABELV $648
line 2536
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $647
line 2540
;2540:}
LABELV $646
endproc BotDontAvoid 68 12
export BotGoForPowerups
proc BotGoForPowerups 0 8
line 2547
;2541:
;2542:/*
;2543:==================
;2544:BotGoForPowerups
;2545:==================
;2546:*/
;2547:void BotGoForPowerups(bot_state_t* bs) {
line 2550
;2548:
;2549:	// don't avoid any of the powerups anymore
;2550:	BotDontAvoid(bs, "Quad Damage");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $652
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2551
;2551:	BotDontAvoid(bs, "Regeneration");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $653
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2552
;2552:	BotDontAvoid(bs, "Battle Suit");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $654
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2553
;2553:	BotDontAvoid(bs, "Speed");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $655
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2554
;2554:	BotDontAvoid(bs, "Invisibility");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $656
ARGP4
ADDRGP4 BotDontAvoid
CALLV
pop
line 2558
;2555:	// BotDontAvoid(bs, "Flight");
;2556:	// reset the long term goal time so the bot will go for the powerup
;2557:	// NOTE: the long term goal type doesn't change
;2558:	bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
line 2559
;2559:}
LABELV $651
endproc BotGoForPowerups 0 8
export BotRoamGoal
proc BotRoamGoal 168 28
line 2566
;2560:
;2561:/*
;2562:==================
;2563:BotRoamGoal
;2564:==================
;2565:*/
;2566:void BotRoamGoal(bot_state_t* bs, vec3_t goal) {
line 2572
;2567:	int         pc, i;
;2568:	float       len, rnd;
;2569:	vec3_t      dir, bestorg, belowbestorg;
;2570:	bsp_trace_t trace;
;2571:
;2572:	for (i = 0; i < 10; i++) {
ADDRLP4 116
CNSTI4 0
ASGNI4
LABELV $658
line 2574
;2573:		// start at the bot origin
;2574:		VectorCopy(bs->origin, bestorg);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 2575
;2575:		rnd = random();
ADDRLP4 136
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 112
ADDRLP4 136
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ASGNF4
line 2576
;2576:		if (rnd > 0.25) {
ADDRLP4 112
INDIRF4
CNSTF4 1048576000
LEF4 $662
line 2578
;2577:			// add a random value to the x-coordinate
;2578:			if (random() < 0.5)
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
GEF4 $664
line 2579
;2579:				bestorg[0] -= 800 * random() + 100;
ADDRLP4 144
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 144
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1145569280
MULF4
CNSTF4 1120403456
ADDF4
SUBF4
ASGNF4
ADDRGP4 $665
JUMPV
LABELV $664
line 2581
;2580:			else
;2581:				bestorg[0] += 800 * random() + 100;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 148
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1145569280
MULF4
CNSTF4 1120403456
ADDF4
ADDF4
ASGNF4
LABELV $665
line 2582
;2582:		}
LABELV $662
line 2583
;2583:		if (rnd < 0.75) {
ADDRLP4 112
INDIRF4
CNSTF4 1061158912
GEF4 $666
line 2585
;2584:			// add a random value to the y-coordinate
;2585:			if (random() < 0.5)
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
GEF4 $668
line 2586
;2586:				bestorg[1] -= 800 * random() + 100;
ADDRLP4 144
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 144
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1145569280
MULF4
CNSTF4 1120403456
ADDF4
SUBF4
ASGNF4
ADDRGP4 $669
JUMPV
LABELV $668
line 2588
;2587:			else
;2588:				bestorg[1] += 800 * random() + 100;
ADDRLP4 148
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 148
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1145569280
MULF4
CNSTF4 1120403456
ADDF4
ADDF4
ASGNF4
LABELV $669
line 2589
;2589:		}
LABELV $666
line 2591
;2590:		// add a random value to the z-coordinate (NOTE: 48 = maxjump?)
;2591:		bestorg[2] += 2 * 48 * crandom();
ADDRLP4 140
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 140
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
CNSTF4 1119879168
MULF4
ADDF4
ASGNF4
line 2593
;2592:		// trace a line from the origin to the roam target
;2593:		BotAI_Trace(&trace, bs->origin, NULL, NULL, bestorg, bs->entitynum, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 144
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 144
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2595
;2594:		// direction and length towards the roam target
;2595:		VectorSubtract(trace.endpos, bs->origin, dir);
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24+12
INDIRF4
ADDRLP4 148
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 24+12+4
INDIRF4
ADDRLP4 148
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 24+12+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2596
;2596:		len = VectorNormalize(dir);
ADDRLP4 0
ARGP4
ADDRLP4 152
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 108
ADDRLP4 152
INDIRF4
ASGNF4
line 2598
;2597:		// if the roam target is far away anough
;2598:		if (len > 200) {
ADDRLP4 108
INDIRF4
CNSTF4 1128792064
LEF4 $680
line 2600
;2599:			// the roam target is in the given direction before walls
;2600:			VectorScale(dir, len * trace.fraction - 40, dir);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
CNSTF4 1109393408
SUBF4
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
CNSTF4 1109393408
SUBF4
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 108
INDIRF4
ADDRLP4 24+8
INDIRF4
MULF4
CNSTF4 1109393408
SUBF4
MULF4
ASGNF4
line 2601
;2601:			VectorAdd(bs->origin, dir, bestorg);
ADDRLP4 160
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 160
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 160
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
ADDF4
ASGNF4
line 2603
;2602:			// get the coordinates of the floor below the roam target
;2603:			belowbestorg[0] = bestorg[0];
ADDRLP4 120
ADDRLP4 12
INDIRF4
ASGNF4
line 2604
;2604:			belowbestorg[1] = bestorg[1];
ADDRLP4 120+4
ADDRLP4 12+4
INDIRF4
ASGNF4
line 2605
;2605:			belowbestorg[2] = bestorg[2] - 800;
ADDRLP4 120+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1145569280
SUBF4
ASGNF4
line 2606
;2606:			BotAI_Trace(&trace, bestorg, NULL, NULL, belowbestorg, bs->entitynum, MASK_SOLID);
ADDRLP4 24
ARGP4
ADDRLP4 12
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 120
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2608
;2607:			//
;2608:			if (!trace.startsolid) {
ADDRLP4 24+4
INDIRI4
CNSTI4 0
NEI4 $697
line 2609
;2609:				trace.endpos[2]++;
ADDRLP4 24+12+8
ADDRLP4 24+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2610
;2610:				pc = trap_PointContents(trace.endpos, bs->entitynum);
ADDRLP4 24+12
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 164
INDIRI4
ASGNI4
line 2611
;2611:				if (!(pc & (CONTENTS_LAVA | CONTENTS_SLIME))) {
ADDRLP4 132
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
NEI4 $703
line 2612
;2612:					VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2613
;2613:					return;
ADDRGP4 $657
JUMPV
LABELV $703
line 2615
;2614:				}
;2615:			}
LABELV $697
line 2616
;2616:		}
LABELV $680
line 2617
;2617:	}
LABELV $659
line 2572
ADDRLP4 116
ADDRLP4 116
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 10
LTI4 $658
line 2618
;2618:	VectorCopy(bestorg, goal);
ADDRFP4 4
INDIRP4
ADDRLP4 12
INDIRB
ASGNB 12
line 2619
;2619:}
LABELV $657
endproc BotRoamGoal 168 28
data
align 4
LABELV $707
byte 4 0
byte 4 0
byte 4 1065353216
export BotAttackMove
code
proc BotAttackMove 392 16
line 2626
;2620:
;2621:/*
;2622:==================
;2623:BotAttackMove
;2624:==================
;2625:*/
;2626:bot_moveresult_t BotAttackMove(bot_state_t* bs, int tfl) {
line 2630
;2627:	int              movetype, i, attackentity;
;2628:	float            attack_skill, jumper, croucher, dist, strafechange_time;
;2629:	float            attack_dist, attack_range;
;2630:	vec3_t           forward, backward, sideward, hordir, up = {0, 0, 1};
ADDRLP4 56
ADDRGP4 $707
INDIRB
ASGNB 12
line 2635
;2631:	aas_entityinfo_t entinfo;
;2632:	bot_moveresult_t moveresult;
;2633:	bot_goal_t       goal;
;2634:
;2635:	attackentity = bs->enemy;
ADDRLP4 332
ADDRFP4 4
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 2637
;2636:	//
;2637:	if (bs->attackchase_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6124
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $708
line 2639
;2638:		// create the chase goal
;2639:		goal.entitynum = attackentity;
ADDRLP4 136+40
ADDRLP4 332
INDIRI4
ASGNI4
line 2640
;2640:		goal.areanum   = bs->lastenemyareanum;
ADDRLP4 136+12
ADDRFP4 4
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ASGNI4
line 2641
;2641:		VectorCopy(bs->lastenemyorigin, goal.origin);
ADDRLP4 136
ADDRFP4 4
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 2642
;2642:		VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 136+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 136+16+8
CNSTF4 3238002688
ASGNF4
line 2643
;2643:		VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 136+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 136+28+8
CNSTF4 1090519040
ASGNF4
line 2645
;2644:		// initialize the movement state
;2645:		BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2647
;2646:		// move towards the goal
;2647:		trap_BotMoveToGoal(&moveresult, bs->ms, &goal, tfl);
ADDRLP4 80
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveToGoal
CALLV
pop
line 2648
;2648:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $705
JUMPV
LABELV $708
line 2651
;2649:	}
;2650:	//
;2651:	memset(&moveresult, 0, sizeof(bot_moveresult_t));
ADDRLP4 80
ARGP4
CNSTI4 0
ARGI4
CNSTI4 52
ARGI4
ADDRGP4 memset
CALLP4
pop
line 2653
;2652:	//
;2653:	attack_skill = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ATTACK_SKILL, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 348
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 132
ADDRLP4 348
INDIRF4
ASGNF4
line 2654
;2654:	jumper       = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_JUMPER, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 37
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 352
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 340
ADDRLP4 352
INDIRF4
ASGNF4
line 2655
;2655:	croucher     = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CROUCHER, 0, 1);
ADDRFP4 4
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 36
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 356
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 344
ADDRLP4 356
INDIRF4
ASGNF4
line 2657
;2656:	// if the bot is really stupid
;2657:	if (attack_skill < 0.2)
ADDRLP4 132
INDIRF4
CNSTF4 1045220557
GEF4 $722
line 2658
;2658:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $705
JUMPV
LABELV $722
line 2660
;2659:	// initialize the movement state
;2660:	BotSetupForMovement(bs);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotSetupForMovement
CALLV
pop
line 2662
;2661:	// get the enemy entity info
;2662:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 332
INDIRI4
ARGI4
ADDRLP4 192
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2664
;2663:	// direction towards the enemy
;2664:	VectorSubtract(entinfo.origin, bs->origin, forward);
ADDRLP4 360
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 192+24
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 192+24+4
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 192+24+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2666
;2665:	// the distance towards the enemy
;2666:	dist = VectorNormalize(forward);
ADDRLP4 24
ARGP4
ADDRLP4 364
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 68
ADDRLP4 364
INDIRF4
ASGNF4
line 2667
;2667:	VectorNegate(forward, backward);
ADDRLP4 36
ADDRLP4 24
INDIRF4
NEGF4
ASGNF4
ADDRLP4 36+4
ADDRLP4 24+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 36+8
ADDRLP4 24+8
INDIRF4
NEGF4
ASGNF4
line 2669
;2668:	// walk, crouch or jump
;2669:	movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2671
;2670:	//
;2671:	if (bs->attackcrouch_time < FloatTime() - 1) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $735
line 2672
;2672:		if (random() < jumper) {
ADDRLP4 368
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 340
INDIRF4
GEF4 $737
line 2673
;2673:			movetype = MOVE_JUMP;
ADDRLP4 52
CNSTI4 4
ASGNI4
line 2674
;2674:		}
ADDRGP4 $738
JUMPV
LABELV $737
line 2676
;2675:		// wait at least one second before crouching again
;2676:		else if (bs->attackcrouch_time < FloatTime() - 1 && random() < croucher) {
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $739
ADDRLP4 372
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 344
INDIRF4
GEF4 $739
line 2677
;2677:			bs->attackcrouch_time = FloatTime() + croucher * 5;
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 344
INDIRF4
CNSTF4 1084227584
MULF4
ADDF4
ASGNF4
line 2678
;2678:		}
LABELV $739
LABELV $738
line 2679
;2679:	}
LABELV $735
line 2680
;2680:	if (bs->attackcrouch_time > FloatTime())
ADDRFP4 4
INDIRP4
CNSTI4 6120
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $741
line 2681
;2681:		movetype = MOVE_CROUCH;
ADDRLP4 52
CNSTI4 2
ASGNI4
LABELV $741
line 2683
;2682:	// if the bot should jump
;2683:	if (movetype == MOVE_JUMP) {
ADDRLP4 52
INDIRI4
CNSTI4 4
NEI4 $743
line 2685
;2684:		// if jumped last frame
;2685:		if (bs->attackjump_time > FloatTime()) {
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $745
line 2686
;2686:			movetype = MOVE_WALK;
ADDRLP4 52
CNSTI4 1
ASGNI4
line 2687
;2687:		} else {
ADDRGP4 $746
JUMPV
LABELV $745
line 2688
;2688:			bs->attackjump_time = FloatTime() + 1;
ADDRFP4 4
INDIRP4
CNSTI4 6128
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 2689
;2689:		}
LABELV $746
line 2690
;2690:	}
LABELV $743
line 2691
;2691:	if (bs->cur_ps.weapon == WP_GAUNTLET) {
ADDRFP4 4
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
CNSTI4 1
NEI4 $747
line 2692
;2692:		attack_dist  = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 2693
;2693:		attack_range = 0;
ADDRLP4 76
CNSTF4 0
ASGNF4
line 2694
;2694:	} else {
ADDRGP4 $748
JUMPV
LABELV $747
line 2695
;2695:		attack_dist  = IDEAL_ATTACKDIST;
ADDRLP4 72
CNSTF4 1124859904
ASGNF4
line 2696
;2696:		attack_range = 40;
ADDRLP4 76
CNSTF4 1109393408
ASGNF4
line 2697
;2697:	}
LABELV $748
line 2699
;2698:	// if the bot is stupid
;2699:	if (attack_skill <= 0.4) {
ADDRLP4 132
INDIRF4
CNSTF4 1053609165
GTF4 $749
line 2701
;2700:		// just walk to or away from the enemy
;2701:		if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $751
line 2702
;2702:			if (trap_BotMoveInDirection(bs->ms, forward, 400, movetype))
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 368
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $753
line 2703
;2703:				return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $705
JUMPV
LABELV $753
line 2704
;2704:		}
LABELV $751
line 2705
;2705:		if (dist < attack_dist - attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $755
line 2706
;2706:			if (trap_BotMoveInDirection(bs->ms, backward, 400, movetype))
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 368
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $757
line 2707
;2707:				return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $705
JUMPV
LABELV $757
line 2708
;2708:		}
LABELV $755
line 2709
;2709:		return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $705
JUMPV
LABELV $749
line 2712
;2710:	}
;2711:	// increase the strafe time
;2712:	bs->attackstrafe_time += bs->thinktime;
ADDRLP4 368
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 372
ADDRLP4 368
INDIRP4
CNSTI4 6116
ADDP4
ASGNP4
ADDRLP4 372
INDIRP4
ADDRLP4 372
INDIRP4
INDIRF4
ADDRLP4 368
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
ADDF4
ASGNF4
line 2714
;2713:	// get the strafe change time
;2714:	strafechange_time = 0.4 + (1 - attack_skill) * 0.2;
ADDRLP4 336
CNSTF4 1065353216
ADDRLP4 132
INDIRF4
SUBF4
CNSTF4 1045220557
MULF4
CNSTF4 1053609165
ADDF4
ASGNF4
line 2715
;2715:	if (attack_skill > 0.7)
ADDRLP4 132
INDIRF4
CNSTF4 1060320051
LEF4 $759
line 2716
;2716:		strafechange_time += crandom() * 0.2;
ADDRLP4 376
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 336
ADDRLP4 336
INDIRF4
ADDRLP4 376
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1053609165
MULF4
ADDF4
ASGNF4
LABELV $759
line 2718
;2717:	// if the strafe direction should be changed
;2718:	if (bs->attackstrafe_time > strafechange_time) {
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
INDIRF4
ADDRLP4 336
INDIRF4
LEF4 $761
line 2720
;2719:		// some magic number :)
;2720:		if (random() > 0.935) {
ADDRLP4 380
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1064262697
LEF4 $763
line 2722
;2721:			// flip the strafe direction
;2722:			bs->flags ^= BFL_STRAFERIGHT;
ADDRLP4 384
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 384
INDIRP4
ADDRLP4 384
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2723
;2723:			bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2724
;2724:		}
LABELV $763
line 2725
;2725:	}
LABELV $761
line 2727
;2726:	//
;2727:	for (i = 0; i < 2; i++) {
ADDRLP4 48
CNSTI4 0
ASGNI4
LABELV $765
line 2728
;2728:		hordir[0] = forward[0];
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 2729
;2729:		hordir[1] = forward[1];
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ASGNF4
line 2730
;2730:		hordir[2] = 0;
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 2731
;2731:		VectorNormalize(hordir);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 2733
;2732:		// get the sideward vector
;2733:		CrossProduct(hordir, up, sideward);
ADDRLP4 12
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 2735
;2734:		// reverse the vector depending on the strafe direction
;2735:		if (bs->flags & BFL_STRAFERIGHT)
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $772
line 2736
;2736:			VectorNegate(sideward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
NEGF4
ASGNF4
LABELV $772
line 2738
;2737:		// randomly go back a little
;2738:		if (random() > 0.9) {
ADDRLP4 380
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1063675494
LEF4 $778
line 2739
;2739:			VectorAdd(sideward, backward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
ASGNF4
line 2740
;2740:		} else {
ADDRGP4 $779
JUMPV
LABELV $778
line 2742
;2741:			// walk forward or backward to get at the ideal attack distance
;2742:			if (dist > attack_dist + attack_range) {
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
LEF4 $786
line 2743
;2743:				VectorAdd(sideward, forward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 2744
;2744:			} else if (dist < attack_dist - attack_range) {
ADDRGP4 $787
JUMPV
LABELV $786
ADDRLP4 68
INDIRF4
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRF4
SUBF4
GEF4 $794
line 2745
;2745:				VectorAdd(sideward, backward, sideward);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
ASGNF4
line 2746
;2746:			}
LABELV $794
LABELV $787
line 2747
;2747:		}
LABELV $779
line 2749
;2748:		// perform the movement
;2749:		if (trap_BotMoveInDirection(bs->ms, sideward, 400, movetype))
ADDRFP4 4
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 52
INDIRI4
ARGI4
ADDRLP4 384
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
EQI4 $802
line 2750
;2750:			return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
ADDRGP4 $705
JUMPV
LABELV $802
line 2752
;2751:		// movement failed, flip the strafe direction
;2752:		bs->flags ^= BFL_STRAFERIGHT;
ADDRLP4 388
ADDRFP4 4
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 388
INDIRP4
ADDRLP4 388
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2753
;2753:		bs->attackstrafe_time = 0;
ADDRFP4 4
INDIRP4
CNSTI4 6116
ADDP4
CNSTF4 0
ASGNF4
line 2754
;2754:	}
LABELV $766
line 2727
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 2
LTI4 $765
line 2757
;2755:	// bot couldn't do any usefull movement
;2756:	//	bs->attackchase_time = AAS_Time() + 6;
;2757:	return moveresult;
ADDRFP4 0
INDIRP4
ADDRLP4 80
INDIRB
ASGNB 52
LABELV $705
endproc BotAttackMove 392 16
export BotSameTeam
proc BotSameTeam 0 0
line 2765
;2758:}
;2759:
;2760:/*
;2761:==================
;2762:BotSameTeam
;2763:==================
;2764:*/
;2765:int BotSameTeam(bot_state_t* bs, int entnum) {
line 2769
;2766:
;2767:	extern gclient_t g_clients[MAX_CLIENTS];
;2768:
;2769:	if ((unsigned)bs->client >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $805
line 2771
;2770:		// BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2771:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $804
JUMPV
LABELV $805
line 2773
;2772:	}
;2773:	if ((unsigned)entnum >= MAX_CLIENTS) {
ADDRFP4 4
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $807
line 2775
;2774:		// BotAI_Print(PRT_ERROR, "BotSameTeam: client out of range\n");
;2775:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $804
JUMPV
LABELV $807
line 2777
;2776:	}
;2777:	if (gametype >= GT_TEAM) {
ADDRGP4 gametype
INDIRI4
CNSTI4 3
LTI4 $809
line 2778
;2778:		if (g_clients[bs->client].sess.sessionTeam == g_clients[entnum].sess.sessionTeam)
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 g_clients+624
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 g_clients+624
ADDP4
INDIRI4
NEI4 $811
line 2779
;2779:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $804
JUMPV
LABELV $811
line 2780
;2780:	}
LABELV $809
line 2781
;2781:	return qfalse;
CNSTI4 0
RETI4
LABELV $804
endproc BotSameTeam 0 0
export InFieldOfVision
proc InFieldOfVision 28 4
line 2789
;2782:}
;2783:
;2784:/*
;2785:==================
;2786:InFieldOfVision
;2787:==================
;2788:*/
;2789:qboolean InFieldOfVision(vec3_t viewangles, float fov, vec3_t angles) {
line 2793
;2790:	int   i;
;2791:	float diff, angle;
;2792:
;2793:	for (i = 0; i < 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $816
line 2794
;2794:		angle     = AngleMod(viewangles[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 12
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 12
INDIRF4
ASGNF4
line 2795
;2795:		angles[i] = AngleMod(angles[i]);
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRF4
ARGF4
ADDRLP4 24
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 24
INDIRF4
ASGNF4
line 2796
;2796:		diff      = angles[i] - angle;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
SUBF4
ASGNF4
line 2797
;2797:		if (angles[i] > angle) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
ADDRLP4 8
INDIRF4
LEF4 $820
line 2798
;2798:			if (diff > 180.0)
ADDRLP4 4
INDIRF4
CNSTF4 1127481344
LEF4 $821
line 2799
;2799:				diff -= 360.0;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
line 2800
;2800:		} else {
ADDRGP4 $821
JUMPV
LABELV $820
line 2801
;2801:			if (diff < -180.0)
ADDRLP4 4
INDIRF4
CNSTF4 3274964992
GEF4 $824
line 2802
;2802:				diff += 360.0;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1135869952
ADDF4
ASGNF4
LABELV $824
line 2803
;2803:		}
LABELV $821
line 2804
;2804:		if (diff > 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
LEF4 $826
line 2805
;2805:			if (diff > fov * 0.5)
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
CNSTF4 1056964608
MULF4
LEF4 $827
line 2806
;2806:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $815
JUMPV
line 2807
;2807:		} else {
LABELV $826
line 2808
;2808:			if (diff < -fov * 0.5)
ADDRLP4 4
INDIRF4
ADDRFP4 4
INDIRF4
NEGF4
CNSTF4 1056964608
MULF4
GEF4 $830
line 2809
;2809:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $815
JUMPV
LABELV $830
line 2810
;2810:		}
LABELV $827
line 2811
;2811:	}
LABELV $817
line 2793
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LTI4 $816
line 2812
;2812:	return qtrue;
CNSTI4 1
RETI4
LABELV $815
endproc InFieldOfVision 28 4
export BotEntityVisible
proc BotEntityVisible 360 28
line 2822
;2813:}
;2814:
;2815:/*
;2816:==================
;2817:BotEntityVisible
;2818:
;2819:returns visibility in the range [0, 1] taking fog and water surfaces into account
;2820:==================
;2821:*/
;2822:float BotEntityVisible(int viewer, vec3_t eye, vec3_t viewangles, float fov, int ent) {
line 2830
;2823:	int              i, contents_mask, passent, hitent, infog, inwater, otherinfog, pc;
;2824:	float            squaredfogdist, waterfactor, vis, bestvis;
;2825:	bsp_trace_t      trace;
;2826:	aas_entityinfo_t entinfo;
;2827:	vec3_t           dir, entangles, start, end, middle;
;2828:
;2829:	// calculate middle of bounding box
;2830:	BotEntityInfo(ent, &entinfo);
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 148
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2831
;2831:	if (!entinfo.valid)
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $833
line 2832
;2832:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $832
JUMPV
LABELV $833
line 2833
;2833:	VectorAdd(entinfo.mins, entinfo.maxs, middle);
ADDRLP4 84
ADDRLP4 148+72
INDIRF4
ADDRLP4 148+84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 148+72+4
INDIRF4
ADDRLP4 148+84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 148+72+8
INDIRF4
ADDRLP4 148+84+8
INDIRF4
ADDF4
ASGNF4
line 2834
;2834:	VectorScale(middle, 0.5, middle);
ADDRLP4 84
ADDRLP4 84
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 84+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 2835
;2835:	VectorAdd(entinfo.origin, middle, middle);
ADDRLP4 84
ADDRLP4 148+24
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+4
ADDRLP4 148+24+4
INDIRF4
ADDRLP4 84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 84+8
ADDRLP4 148+24+8
INDIRF4
ADDRLP4 84+8
INDIRF4
ADDF4
ASGNF4
line 2837
;2836:	// check if entity is within field of vision
;2837:	VectorSubtract(middle, eye, dir);
ADDRLP4 332
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 84
INDIRF4
ADDRLP4 332
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 332
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 84+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2838
;2838:	vectoangles(dir, entangles);
ADDRLP4 136
ARGP4
ADDRLP4 320
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 2839
;2839:	if (!InFieldOfVision(viewangles, fov, entangles))
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 320
ARGP4
ADDRLP4 336
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
CNSTI4 0
NEI4 $864
line 2840
;2840:		return 0;
CNSTF4 0
RETF4
ADDRGP4 $832
JUMPV
LABELV $864
line 2842
;2841:	//
;2842:	pc      = trap_AAS_PointContents(eye);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 340
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 316
ADDRLP4 340
INDIRI4
ASGNI4
line 2843
;2843:	infog   = (pc & CONTENTS_FOG);
ADDRLP4 312
ADDRLP4 316
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 2844
;2844:	inwater = (pc & (CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_WATER));
ADDRLP4 308
ADDRLP4 316
INDIRI4
CNSTI4 56
BANDI4
ASGNI4
line 2846
;2845:	//
;2846:	bestvis = 0;
ADDRLP4 296
CNSTF4 0
ASGNF4
line 2847
;2847:	for (i = 0; i < 3; i++) {
ADDRLP4 100
CNSTI4 0
ASGNI4
LABELV $866
line 2851
;2848:		// if the point is not in potential visible sight
;2849:		// if (!AAS_inPVS(eye, middle)) continue;
;2850:		//
;2851:		contents_mask = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 96
CNSTI4 65537
ASGNI4
line 2852
;2852:		passent       = viewer;
ADDRLP4 116
ADDRFP4 0
INDIRI4
ASGNI4
line 2853
;2853:		hitent        = ent;
ADDRLP4 132
ADDRFP4 16
INDIRI4
ASGNI4
line 2854
;2854:		VectorCopy(eye, start);
ADDRLP4 120
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2855
;2855:		VectorCopy(middle, end);
ADDRLP4 104
ADDRLP4 84
INDIRB
ASGNB 12
line 2857
;2856:		// if the entity is in water, lava or slime
;2857:		if (trap_AAS_PointContents(middle) & (CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_WATER)) {
ADDRLP4 84
ARGP4
ADDRLP4 344
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 344
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $870
line 2858
;2858:			contents_mask |= (CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BORI4
ASGNI4
line 2859
;2859:		}
LABELV $870
line 2861
;2860:		// if eye is in water, lava or slime
;2861:		if (inwater) {
ADDRLP4 308
INDIRI4
CNSTI4 0
EQI4 $872
line 2862
;2862:			if (!(contents_mask & (CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_WATER))) {
ADDRLP4 96
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
NEI4 $874
line 2863
;2863:				passent = ent;
ADDRLP4 116
ADDRFP4 16
INDIRI4
ASGNI4
line 2864
;2864:				hitent  = viewer;
ADDRLP4 132
ADDRFP4 0
INDIRI4
ASGNI4
line 2865
;2865:				VectorCopy(middle, start);
ADDRLP4 120
ADDRLP4 84
INDIRB
ASGNB 12
line 2866
;2866:				VectorCopy(eye, end);
ADDRLP4 104
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 2867
;2867:			}
LABELV $874
line 2868
;2868:			contents_mask ^= (CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 56
BXORI4
ASGNI4
line 2869
;2869:		}
LABELV $872
line 2871
;2870:		// trace from start to end
;2871:		BotAI_Trace(&trace, start, NULL, NULL, end, passent, contents_mask);
ADDRLP4 0
ARGP4
ADDRLP4 120
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2873
;2872:		// if water was hit
;2873:		waterfactor = 1.0;
ADDRLP4 288
CNSTF4 1065353216
ASGNF4
line 2874
;2874:		if (trace.contents & (CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_WATER)) {
ADDRLP4 0+76
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $876
line 2876
;2875:			// if the water surface is translucent
;2876:			if (1) {
line 2878
;2877:				// trace through the water
;2878:				contents_mask &= ~(CONTENTS_LAVA | CONTENTS_SLIME | CONTENTS_WATER);
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 -57
BANDI4
ASGNI4
line 2879
;2879:				BotAI_Trace(&trace, trace.endpos, NULL, NULL, end, passent, contents_mask);
ADDRLP4 0
ARGP4
ADDRLP4 0+12
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 104
ARGP4
ADDRLP4 116
INDIRI4
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2880
;2880:				waterfactor = 0.5;
ADDRLP4 288
CNSTF4 1056964608
ASGNF4
line 2881
;2881:			}
LABELV $879
line 2882
;2882:		}
LABELV $876
line 2884
;2883:		// if a full trace or the hitent was hit
;2884:		if (trace.fraction >= 1 || trace.ent == hitent) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $886
ADDRLP4 0+80
INDIRI4
ADDRLP4 132
INDIRI4
NEI4 $882
LABELV $886
line 2887
;2885:			// check for fog, assuming there's only one fog brush where
;2886:			// either the viewer or the entity is in or both are in
;2887:			otherinfog = (trap_AAS_PointContents(middle) & CONTENTS_FOG);
ADDRLP4 84
ARGP4
ADDRLP4 348
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 304
ADDRLP4 348
INDIRI4
CNSTI4 64
BANDI4
ASGNI4
line 2888
;2888:			if (infog && otherinfog) {
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $887
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $887
line 2889
;2889:				VectorSubtract(trace.endpos, eye, dir);
ADDRLP4 352
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 0+12
INDIRF4
ADDRLP4 352
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 0+12+4
INDIRF4
ADDRLP4 352
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 0+12+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2890
;2890:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 356
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 356
INDIRF4
ASGNF4
line 2891
;2891:			} else if (infog) {
ADDRGP4 $888
JUMPV
LABELV $887
ADDRLP4 312
INDIRI4
CNSTI4 0
EQI4 $896
line 2892
;2892:				VectorCopy(trace.endpos, start);
ADDRLP4 120
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2893
;2893:				BotAI_Trace(&trace, start, NULL, NULL, eye, viewer, CONTENTS_FOG);
ADDRLP4 0
ARGP4
ADDRLP4 120
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2894
;2894:				VectorSubtract(eye, trace.endpos, dir);
ADDRLP4 352
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 136
ADDRLP4 352
INDIRP4
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 352
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 2895
;2895:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 356
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 356
INDIRF4
ASGNF4
line 2896
;2896:			} else if (otherinfog) {
ADDRGP4 $897
JUMPV
LABELV $896
ADDRLP4 304
INDIRI4
CNSTI4 0
EQI4 $906
line 2897
;2897:				VectorCopy(trace.endpos, end);
ADDRLP4 104
ADDRLP4 0+12
INDIRB
ASGNB 12
line 2898
;2898:				BotAI_Trace(&trace, eye, NULL, NULL, end, viewer, CONTENTS_FOG);
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 104
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 2899
;2899:				VectorSubtract(end, trace.endpos, dir);
ADDRLP4 136
ADDRLP4 104
INDIRF4
ADDRLP4 0+12
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+4
ADDRLP4 104+4
INDIRF4
ADDRLP4 0+12+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 136+8
ADDRLP4 104+8
INDIRF4
ADDRLP4 0+12+8
INDIRF4
SUBF4
ASGNF4
line 2900
;2900:				squaredfogdist = VectorLengthSquared(dir);
ADDRLP4 136
ARGP4
ADDRLP4 352
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 300
ADDRLP4 352
INDIRF4
ASGNF4
line 2901
;2901:			} else {
ADDRGP4 $907
JUMPV
LABELV $906
line 2903
;2902:				// if the entity and the viewer are not in fog assume there's no fog in between
;2903:				squaredfogdist = 0;
ADDRLP4 300
CNSTF4 0
ASGNF4
line 2904
;2904:			}
LABELV $907
LABELV $897
LABELV $888
line 2906
;2905:			// decrease visibility with the view distance through fog
;2906:			vis = 1 / ((squaredfogdist * 0.001) < 1 ? 1 : (squaredfogdist * 0.001));
ADDRLP4 300
INDIRF4
CNSTF4 981668463
MULF4
CNSTF4 1065353216
GEF4 $919
ADDRLP4 352
CNSTF4 1065353216
ASGNF4
ADDRGP4 $920
JUMPV
LABELV $919
ADDRLP4 352
ADDRLP4 300
INDIRF4
CNSTF4 981668463
MULF4
ASGNF4
LABELV $920
ADDRLP4 292
CNSTF4 1065353216
ADDRLP4 352
INDIRF4
DIVF4
ASGNF4
line 2908
;2907:			// if entering water visibility is reduced
;2908:			vis *= waterfactor;
ADDRLP4 292
ADDRLP4 292
INDIRF4
ADDRLP4 288
INDIRF4
MULF4
ASGNF4
line 2910
;2909:			//
;2910:			if (vis > bestvis)
ADDRLP4 292
INDIRF4
ADDRLP4 296
INDIRF4
LEF4 $921
line 2911
;2911:				bestvis = vis;
ADDRLP4 296
ADDRLP4 292
INDIRF4
ASGNF4
LABELV $921
line 2913
;2912:			// if pretty much no fog
;2913:			if (bestvis >= 0.95)
ADDRLP4 296
INDIRF4
CNSTF4 1064514355
LTF4 $923
line 2914
;2914:				return bestvis;
ADDRLP4 296
INDIRF4
RETF4
ADDRGP4 $832
JUMPV
LABELV $923
line 2915
;2915:		}
LABELV $882
line 2917
;2916:		// check bottom and top of bounding box as well
;2917:		if (i == 0)
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $925
line 2918
;2918:			middle[2] += entinfo.mins[2];
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
ADDF4
ASGNF4
ADDRGP4 $926
JUMPV
LABELV $925
line 2919
;2919:		else if (i == 1)
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $930
line 2920
;2920:			middle[2] += entinfo.maxs[2] - entinfo.mins[2];
ADDRLP4 84+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 148+84+8
INDIRF4
ADDRLP4 148+72+8
INDIRF4
SUBF4
ADDF4
ASGNF4
LABELV $930
LABELV $926
line 2921
;2921:	}
LABELV $867
line 2847
ADDRLP4 100
ADDRLP4 100
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 3
LTI4 $866
line 2922
;2922:	return bestvis;
ADDRLP4 296
INDIRF4
RETF4
LABELV $832
endproc BotEntityVisible 360 28
export BotFindEnemy
proc BotFindEnemy 424 20
line 2930
;2923:}
;2924:
;2925:/*
;2926:==================
;2927:BotFindEnemy
;2928:==================
;2929:*/
;2930:int BotFindEnemy(bot_state_t* bs, int curenemy) {
line 2937
;2931:	int              i, healthdecrease;
;2932:	float            f, alertness, easyfragger, vis;
;2933:	float            squaredist, cursquaredist;
;2934:	aas_entityinfo_t entinfo, curenemyinfo;
;2935:	vec3_t           dir, angles;
;2936:
;2937:	alertness   = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_ALERTNESS, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 46
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 336
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 164
ADDRLP4 336
INDIRF4
ASGNF4
line 2938
;2938:	easyfragger = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_EASY_FRAGGER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 45
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 340
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 176
ADDRLP4 340
INDIRF4
ASGNF4
line 2940
;2939:	// check if the health decreased
;2940:	healthdecrease = bs->lasthealth > bs->inventory[INVENTORY_HEALTH];
ADDRLP4 348
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 348
INDIRP4
CNSTI4 5988
ADDP4
INDIRI4
ADDRLP4 348
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
LEI4 $939
ADDRLP4 344
CNSTI4 1
ASGNI4
ADDRGP4 $940
JUMPV
LABELV $939
ADDRLP4 344
CNSTI4 0
ASGNI4
LABELV $940
ADDRLP4 160
ADDRLP4 344
INDIRI4
ASGNI4
line 2942
;2941:	// remember the current health value
;2942:	bs->lasthealth = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 352
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 352
INDIRP4
CNSTI4 5988
ADDP4
ADDRLP4 352
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 2944
;2943:	//
;2944:	if (curenemy >= 0) {
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $941
line 2945
;2945:		BotEntityInfo(curenemy, &curenemyinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 196
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2946
;2946:		if (EntityCarriesFlag(&curenemyinfo))
ADDRLP4 196
ARGP4
ADDRLP4 356
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
EQI4 $943
line 2947
;2947:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $937
JUMPV
LABELV $943
line 2948
;2948:		VectorSubtract(curenemyinfo.origin, bs->origin, dir);
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 196+24
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 196+24+4
INDIRF4
ADDRLP4 360
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 196+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 2949
;2949:		cursquaredist = VectorLengthSquared(dir);
ADDRLP4 144
ARGP4
ADDRLP4 364
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 192
ADDRLP4 364
INDIRF4
ASGNF4
line 2950
;2950:	} else {
ADDRGP4 $942
JUMPV
LABELV $941
line 2951
;2951:		cursquaredist = 0;
ADDRLP4 192
CNSTF4 0
ASGNF4
line 2952
;2952:	}
LABELV $942
line 2981
;2953:#ifdef MISSIONPACK
;2954:	if (gametype == GT_OBELISK) {
;2955:		vec3_t      target;
;2956:		bot_goal_t* goal;
;2957:		bsp_trace_t trace;
;2958:
;2959:		if (BotTeam(bs) == TEAM_RED)
;2960:			goal = &blueobelisk;
;2961:		else
;2962:			goal = &redobelisk;
;2963:		// if the obelisk is visible
;2964:		VectorCopy(goal->origin, target);
;2965:		target[2] += 1;
;2966:		BotAI_Trace(&trace, bs->eye, NULL, NULL, target, bs->client, CONTENTS_SOLID);
;2967:		if (trace.fraction >= 1 || trace.ent == goal->entitynum) {
;2968:			if (goal->entitynum == bs->enemy) {
;2969:				return qfalse;
;2970:			}
;2971:			bs->enemy             = goal->entitynum;
;2972:			bs->enemysight_time   = FloatTime();
;2973:			bs->enemysuicide      = qfalse;
;2974:			bs->enemydeath_time   = 0;
;2975:			bs->enemyvisible_time = FloatTime();
;2976:			return qtrue;
;2977:		}
;2978:	}
;2979:#endif
;2980:	//
;2981:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $955
JUMPV
LABELV $952
line 2983
;2982:
;2983:		if (i == bs->client)
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $957
line 2984
;2984:			continue;
ADDRGP4 $953
JUMPV
LABELV $957
line 2986
;2985:		// if it's the current enemy
;2986:		if (i == curenemy)
ADDRLP4 140
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $959
line 2987
;2987:			continue;
ADDRGP4 $953
JUMPV
LABELV $959
line 2989
;2988:		// if the enemy has targeting disabled
;2989:		if (g_entities[i].flags & FL_NOTARGET)
ADDRLP4 140
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $961
line 2990
;2990:			continue;
ADDRGP4 $953
JUMPV
LABELV $961
line 2992
;2991:		//
;2992:		BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 2994
;2993:		//
;2994:		if (!entinfo.valid)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $964
line 2995
;2995:			continue;
ADDRGP4 $953
JUMPV
LABELV $964
line 2997
;2996:		// if the enemy isn't dead and the enemy isn't the bot self
;2997:		if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum)
ADDRLP4 0
ARGP4
ADDRLP4 356
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 356
INDIRI4
CNSTI4 0
NEI4 $969
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $966
LABELV $969
line 2998
;2998:			continue;
ADDRGP4 $953
JUMPV
LABELV $966
line 3000
;2999:		// if the enemy is invisible and not shooting
;3000:		if (EntityIsInvisible(&entinfo) && !EntityIsShooting(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 360
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 360
INDIRI4
CNSTI4 0
EQI4 $970
ADDRLP4 0
ARGP4
ADDRLP4 364
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 364
INDIRI4
CNSTI4 0
NEI4 $970
line 3001
;3001:			continue;
ADDRGP4 $953
JUMPV
LABELV $970
line 3004
;3002:		}
;3003:		// if not an easy fragger don't shoot at chatting players
;3004:		if (easyfragger < 0.5 && EntityIsChatting(&entinfo))
ADDRLP4 176
INDIRF4
CNSTF4 1056964608
GEF4 $972
ADDRLP4 0
ARGP4
ADDRLP4 368
ADDRGP4 EntityIsChatting
CALLI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $972
line 3005
;3005:			continue;
ADDRGP4 $953
JUMPV
LABELV $972
line 3007
;3006:		//
;3007:		if (lastteleport_time > FloatTime() - 3) {
ADDRGP4 lastteleport_time
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
LEF4 $974
line 3008
;3008:			VectorSubtract(entinfo.origin, lastteleport_origin, dir);
ADDRLP4 144
ADDRLP4 0+24
INDIRF4
ADDRGP4 lastteleport_origin
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 0+24+4
INDIRF4
ADDRGP4 lastteleport_origin+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 0+24+8
INDIRF4
ADDRGP4 lastteleport_origin+8
INDIRF4
SUBF4
ASGNF4
line 3009
;3009:			if (VectorLengthSquared(dir) < Square(70))
ADDRLP4 144
ARGP4
ADDRLP4 372
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 372
INDIRF4
CNSTF4 1167663104
GEF4 $985
line 3010
;3010:				continue;
ADDRGP4 $953
JUMPV
LABELV $985
line 3011
;3011:		}
LABELV $974
line 3013
;3012:		// calculate the distance towards the enemy
;3013:		VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 372
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 0+24
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 372
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3014
;3014:		squaredist = VectorLengthSquared(dir);
ADDRLP4 144
ARGP4
ADDRLP4 376
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 376
INDIRF4
ASGNF4
line 3016
;3015:		// if this entity is not carrying a flag
;3016:		if (!EntityCarriesFlag(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 380
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 380
INDIRI4
CNSTI4 0
NEI4 $994
line 3018
;3017:			// if this enemy is further away than the current one
;3018:			if (curenemy >= 0 && squaredist > cursquaredist)
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $996
ADDRLP4 156
INDIRF4
ADDRLP4 192
INDIRF4
LEF4 $996
line 3019
;3019:				continue;
ADDRGP4 $953
JUMPV
LABELV $996
line 3020
;3020:		}  // end if
LABELV $994
line 3022
;3021:		// if the bot has no
;3022:		if (squaredist > Square(900.0 + alertness * 4000.0))
ADDRLP4 156
INDIRF4
ADDRLP4 164
INDIRF4
CNSTF4 1165623296
MULF4
CNSTF4 1147207680
ADDF4
ADDRLP4 164
INDIRF4
CNSTF4 1165623296
MULF4
CNSTF4 1147207680
ADDF4
MULF4
LEF4 $998
line 3023
;3023:			continue;
ADDRGP4 $953
JUMPV
LABELV $998
line 3025
;3024:		// if on the same team
;3025:		if (BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 388
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 388
INDIRI4
CNSTI4 0
EQI4 $1000
line 3026
;3026:			continue;
ADDRGP4 $953
JUMPV
LABELV $1000
line 3028
;3027:		// if the bot's health decreased or the enemy is shooting
;3028:		if (curenemy < 0 && (healthdecrease || EntityIsShooting(&entinfo)))
ADDRFP4 4
INDIRI4
CNSTI4 0
GEI4 $1002
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1004
ADDRLP4 0
ARGP4
ADDRLP4 392
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 392
INDIRI4
CNSTI4 0
EQI4 $1002
LABELV $1004
line 3029
;3029:			f = 360;
ADDRLP4 168
CNSTF4 1135869952
ASGNF4
ADDRGP4 $1003
JUMPV
LABELV $1002
line 3031
;3030:		else
;3031:			f = 90 + 90 - (90 - (squaredist > Square(810) ? Square(810) : squaredist) / (810 * 9));
ADDRLP4 156
INDIRF4
CNSTF4 1226845760
LEF4 $1006
ADDRLP4 396
CNSTF4 1226845760
ASGNF4
ADDRGP4 $1007
JUMPV
LABELV $1006
ADDRLP4 396
ADDRLP4 156
INDIRF4
ASGNF4
LABELV $1007
ADDRLP4 168
CNSTF4 1127481344
CNSTF4 1119092736
ADDRLP4 396
INDIRF4
CNSTF4 957339244
MULF4
SUBF4
SUBF4
ASGNF4
LABELV $1003
line 3033
;3032:		// check if the enemy is visible
;3033:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, f, i);
ADDRLP4 400
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 400
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 400
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 400
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 168
INDIRF4
ARGF4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 404
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 172
ADDRLP4 404
INDIRF4
ASGNF4
line 3034
;3034:		if (vis <= 0)
ADDRLP4 172
INDIRF4
CNSTF4 0
GTF4 $1008
line 3035
;3035:			continue;
ADDRGP4 $953
JUMPV
LABELV $1008
line 3037
;3036:		// if the enemy is quite far away, not shooting and the bot is not damaged
;3037:		if (curenemy < 0 && squaredist > Square(100) && !healthdecrease && !EntityIsShooting(&entinfo)) {
ADDRFP4 4
INDIRI4
CNSTI4 0
GEI4 $1010
ADDRLP4 156
INDIRF4
CNSTF4 1176256512
LEF4 $1010
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1010
ADDRLP4 0
ARGP4
ADDRLP4 408
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 408
INDIRI4
CNSTI4 0
NEI4 $1010
line 3039
;3038:			// check if we can avoid this enemy
;3039:			VectorSubtract(bs->origin, entinfo.origin, dir);
ADDRLP4 412
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 412
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 0+24
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 412
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 0+24+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 0+24+8
INDIRF4
SUBF4
ASGNF4
line 3040
;3040:			vectoangles(dir, angles);
ADDRLP4 144
ARGP4
ADDRLP4 180
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3042
;3041:			// if the bot isn't in the fov of the enemy
;3042:			if (!InFieldOfVision(entinfo.angles, 90, angles)) {
ADDRLP4 0+36
ARGP4
CNSTF4 1119092736
ARGF4
ADDRLP4 180
ARGP4
ADDRLP4 416
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $1019
line 3044
;3043:				// update some stuff for this enemy
;3044:				BotUpdateBattleInventory(bs, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRGP4 BotUpdateBattleInventory
CALLV
pop
line 3046
;3045:				// if the bot doesn't really want to fight
;3046:				if (BotWantsToRetreat(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 420
ADDRGP4 BotWantsToRetreat
CALLI4
ASGNI4
ADDRLP4 420
INDIRI4
CNSTI4 0
EQI4 $1022
line 3047
;3047:					continue;
ADDRGP4 $953
JUMPV
LABELV $1022
line 3048
;3048:			}
LABELV $1019
line 3049
;3049:		}
LABELV $1010
line 3051
;3050:		// found an enemy
;3051:		bs->enemy = entinfo.number;
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
ADDRLP4 0+20
INDIRI4
ASGNI4
line 3052
;3052:		if (curenemy >= 0)
ADDRFP4 4
INDIRI4
CNSTI4 0
LTI4 $1025
line 3053
;3053:			bs->enemysight_time = FloatTime() - 2;
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
ASGNF4
ADDRGP4 $1026
JUMPV
LABELV $1025
line 3055
;3054:		else
;3055:			bs->enemysight_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
LABELV $1026
line 3056
;3056:		bs->enemysuicide      = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 0
ASGNI4
line 3057
;3057:		bs->enemydeath_time   = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6136
ADDP4
CNSTF4 0
ASGNF4
line 3058
;3058:		bs->enemyvisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6088
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 3059
;3059:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $937
JUMPV
LABELV $953
line 2981
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $955
ADDRLP4 140
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $952
line 3061
;3060:	}
;3061:	return qfalse;
CNSTI4 0
RETI4
LABELV $937
endproc BotFindEnemy 424 20
export BotTeamFlagCarrierVisible
proc BotTeamFlagCarrierVisible 164 20
line 3069
;3062:}
;3063:
;3064:/*
;3065:==================
;3066:BotTeamFlagCarrierVisible
;3067:==================
;3068:*/
;3069:int BotTeamFlagCarrierVisible(bot_state_t* bs) {
line 3074
;3070:	int              i;
;3071:	float            vis;
;3072:	aas_entityinfo_t entinfo;
;3073:
;3074:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1031
JUMPV
LABELV $1028
line 3075
;3075:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1033
line 3076
;3076:			continue;
ADDRGP4 $1029
JUMPV
LABELV $1033
line 3078
;3077:		//
;3078:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3080
;3079:		// if this player is active
;3080:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1035
line 3081
;3081:			continue;
ADDRGP4 $1029
JUMPV
LABELV $1035
line 3083
;3082:		// if this player is carrying a flag
;3083:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1037
line 3084
;3084:			continue;
ADDRGP4 $1029
JUMPV
LABELV $1037
line 3086
;3085:		// if the flag carrier is not on the same team
;3086:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
NEI4 $1039
line 3087
;3087:			continue;
ADDRGP4 $1029
JUMPV
LABELV $1039
line 3089
;3088:		// if the flag carrier is not visible
;3089:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3090
;3090:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1041
line 3091
;3091:			continue;
ADDRGP4 $1029
JUMPV
LABELV $1041
line 3093
;3092:		//
;3093:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1027
JUMPV
LABELV $1029
line 3074
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1031
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1028
line 3095
;3094:	}
;3095:	return -1;
CNSTI4 -1
RETI4
LABELV $1027
endproc BotTeamFlagCarrierVisible 164 20
export BotTeamFlagCarrier
proc BotTeamFlagCarrier 152 8
line 3103
;3096:}
;3097:
;3098:/*
;3099:==================
;3100:BotTeamFlagCarrier
;3101:==================
;3102:*/
;3103:int BotTeamFlagCarrier(bot_state_t* bs) {
line 3107
;3104:	int              i;
;3105:	aas_entityinfo_t entinfo;
;3106:
;3107:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1047
JUMPV
LABELV $1044
line 3108
;3108:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1049
line 3109
;3109:			continue;
ADDRGP4 $1045
JUMPV
LABELV $1049
line 3111
;3110:		//
;3111:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3113
;3112:		// if this player is active
;3113:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1051
line 3114
;3114:			continue;
ADDRGP4 $1045
JUMPV
LABELV $1051
line 3116
;3115:		// if this player is carrying a flag
;3116:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 144
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $1053
line 3117
;3117:			continue;
ADDRGP4 $1045
JUMPV
LABELV $1053
line 3119
;3118:		// if the flag carrier is not on the same team
;3119:		if (!BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 148
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1055
line 3120
;3120:			continue;
ADDRGP4 $1045
JUMPV
LABELV $1055
line 3122
;3121:		//
;3122:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1043
JUMPV
LABELV $1045
line 3107
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1047
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1044
line 3124
;3123:	}
;3124:	return -1;
CNSTI4 -1
RETI4
LABELV $1043
endproc BotTeamFlagCarrier 152 8
export BotEnemyFlagCarrierVisible
proc BotEnemyFlagCarrierVisible 164 20
line 3132
;3125:}
;3126:
;3127:/*
;3128:==================
;3129:BotEnemyFlagCarrierVisible
;3130:==================
;3131:*/
;3132:int BotEnemyFlagCarrierVisible(bot_state_t* bs) {
line 3137
;3133:	int              i;
;3134:	float            vis;
;3135:	aas_entityinfo_t entinfo;
;3136:
;3137:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1061
JUMPV
LABELV $1058
line 3138
;3138:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1063
line 3139
;3139:			continue;
ADDRGP4 $1059
JUMPV
LABELV $1063
line 3141
;3140:		//
;3141:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3143
;3142:		// if this player is active
;3143:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1065
line 3144
;3144:			continue;
ADDRGP4 $1059
JUMPV
LABELV $1065
line 3146
;3145:		// if this player is carrying a flag
;3146:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $1067
line 3147
;3147:			continue;
ADDRGP4 $1059
JUMPV
LABELV $1067
line 3149
;3148:		// if the flag carrier is on the same team
;3149:		if (BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $1069
line 3150
;3150:			continue;
ADDRGP4 $1059
JUMPV
LABELV $1069
line 3152
;3151:		// if the flag carrier is not visible
;3152:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 156
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 156
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 156
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 160
INDIRF4
ASGNF4
line 3153
;3153:		if (vis <= 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
GTF4 $1071
line 3154
;3154:			continue;
ADDRGP4 $1059
JUMPV
LABELV $1071
line 3156
;3155:		//
;3156:		return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1057
JUMPV
LABELV $1059
line 3137
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1061
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1058
line 3158
;3157:	}
;3158:	return -1;
CNSTI4 -1
RETI4
LABELV $1057
endproc BotEnemyFlagCarrierVisible 164 20
export BotVisibleTeamMatesAndEnemies
proc BotVisibleTeamMatesAndEnemies 192 20
line 3166
;3159:}
;3160:
;3161:/*
;3162:==================
;3163:BotVisibleTeamMatesAndEnemies
;3164:==================
;3165:*/
;3166:void BotVisibleTeamMatesAndEnemies(bot_state_t* bs, int* teammates, int* enemies, float range) {
line 3172
;3167:	int              i;
;3168:	float            vis;
;3169:	aas_entityinfo_t entinfo;
;3170:	vec3_t           dir;
;3171:
;3172:	if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1074
line 3173
;3173:		*teammates = 0;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1074
line 3174
;3174:	if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1076
line 3175
;3175:		*enemies = 0;
ADDRFP4 8
INDIRP4
CNSTI4 0
ASGNI4
LABELV $1076
line 3176
;3176:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1081
JUMPV
LABELV $1078
line 3177
;3177:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1083
line 3178
;3178:			continue;
ADDRGP4 $1079
JUMPV
LABELV $1083
line 3180
;3179:		//
;3180:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3182
;3181:		// if this player is active
;3182:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $1085
line 3183
;3183:			continue;
ADDRGP4 $1079
JUMPV
LABELV $1085
line 3185
;3184:		// if this player is carrying a flag
;3185:		if (!EntityCarriesFlag(&entinfo))
ADDRLP4 4
ARGP4
ADDRLP4 160
ADDRGP4 EntityCarriesFlag
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
NEI4 $1087
line 3186
;3186:			continue;
ADDRGP4 $1079
JUMPV
LABELV $1087
line 3188
;3187:		// if not within range
;3188:		VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 144
ADDRLP4 4+24
INDIRF4
ADDRLP4 164
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+4
ADDRLP4 4+24+4
INDIRF4
ADDRLP4 164
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 144+8
ADDRLP4 4+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3189
;3189:		if (VectorLengthSquared(dir) > Square(range))
ADDRLP4 144
ARGP4
ADDRLP4 168
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 172
ADDRFP4 12
INDIRF4
ASGNF4
ADDRLP4 168
INDIRF4
ADDRLP4 172
INDIRF4
ADDRLP4 172
INDIRF4
MULF4
LEF4 $1096
line 3190
;3190:			continue;
ADDRGP4 $1079
JUMPV
LABELV $1096
line 3192
;3191:		// if the flag carrier is not visible
;3192:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 176
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 176
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 176
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 176
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 180
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 180
INDIRF4
ASGNF4
line 3193
;3193:		if (vis <= 0)
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1098
line 3194
;3194:			continue;
ADDRGP4 $1079
JUMPV
LABELV $1098
line 3196
;3195:		// if the flag carrier is on the same team
;3196:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 184
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 184
INDIRI4
CNSTI4 0
EQI4 $1100
line 3197
;3197:			if (teammates)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1101
line 3198
;3198:				(*teammates)++;
ADDRLP4 188
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 3199
;3199:		} else {
ADDRGP4 $1101
JUMPV
LABELV $1100
line 3200
;3200:			if (enemies)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1104
line 3201
;3201:				(*enemies)++;
ADDRLP4 188
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 188
INDIRP4
ADDRLP4 188
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1104
line 3202
;3202:		}
LABELV $1101
line 3203
;3203:	}
LABELV $1079
line 3176
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1081
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1078
line 3204
;3204:}
LABELV $1073
endproc BotVisibleTeamMatesAndEnemies 192 20
data
align 4
LABELV $1107
byte 4 3229614080
byte 4 3229614080
byte 4 3229614080
align 4
LABELV $1108
byte 4 1082130432
byte 4 1082130432
byte 4 1082130432
export BotAimAtEnemy
code
proc BotAimAtEnemy 1128 52
line 3281
;3205:
;3206:#ifdef MISSIONPACK
;3207:/*
;3208:==================
;3209:BotTeamCubeCarrierVisible
;3210:==================
;3211:*/
;3212:int BotTeamCubeCarrierVisible(bot_state_t* bs) {
;3213:	int              i;
;3214:	float            vis;
;3215:	aas_entityinfo_t entinfo;
;3216:
;3217:	for (i = 0; i < maxclients; i++) {
;3218:		if (i == bs->client)
;3219:			continue;
;3220:		//
;3221:		BotEntityInfo(i, &entinfo);
;3222:		// if this player is active
;3223:		if (!entinfo.valid)
;3224:			continue;
;3225:		// if this player is carrying a flag
;3226:		if (!EntityCarriesCubes(&entinfo))
;3227:			continue;
;3228:		// if the flag carrier is not on the same team
;3229:		if (!BotSameTeam(bs, i))
;3230:			continue;
;3231:		// if the flag carrier is not visible
;3232:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
;3233:		if (vis <= 0)
;3234:			continue;
;3235:		//
;3236:		return i;
;3237:	}
;3238:	return -1;
;3239:}
;3240:
;3241:/*
;3242:==================
;3243:BotEnemyCubeCarrierVisible
;3244:==================
;3245:*/
;3246:int BotEnemyCubeCarrierVisible(bot_state_t* bs) {
;3247:	int              i;
;3248:	float            vis;
;3249:	aas_entityinfo_t entinfo;
;3250:
;3251:	for (i = 0; i < maxclients; i++) {
;3252:		if (i == bs->client)
;3253:			continue;
;3254:		//
;3255:		BotEntityInfo(i, &entinfo);
;3256:		// if this player is active
;3257:		if (!entinfo.valid)
;3258:			continue;
;3259:		// if this player is carrying a flag
;3260:		if (!EntityCarriesCubes(&entinfo))
;3261:			continue;
;3262:		// if the flag carrier is on the same team
;3263:		if (BotSameTeam(bs, i))
;3264:			continue;
;3265:		// if the flag carrier is not visible
;3266:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
;3267:		if (vis <= 0)
;3268:			continue;
;3269:		//
;3270:		return i;
;3271:	}
;3272:	return -1;
;3273:}
;3274:#endif
;3275:
;3276:/*
;3277:==================
;3278:BotAimAtEnemy
;3279:==================
;3280:*/
;3281:void BotAimAtEnemy(bot_state_t* bs) {
line 3285
;3282:	int              i, enemyvisible;
;3283:	float            dist, f, aim_skill, aim_accuracy, speed, reactiontime;
;3284:	vec3_t           dir, bestorigin, end, start, groundtarget, cmdmove, enemyvelocity;
;3285:	vec3_t           mins = {-4, -4, -4}, maxs = {4, 4, 4};
ADDRLP4 860
ADDRGP4 $1107
INDIRB
ASGNB 12
ADDRLP4 872
ADDRGP4 $1108
INDIRB
ASGNB 12
line 3293
;3286:	weaponinfo_t     wi;
;3287:	aas_entityinfo_t entinfo;
;3288:	bot_goal_t       goal;
;3289:	bsp_trace_t      trace;
;3290:	vec3_t           target;
;3291:
;3292:	// if the bot has no enemy
;3293:	if (bs->enemy < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
GEI4 $1109
line 3294
;3294:		return;
ADDRGP4 $1106
JUMPV
LABELV $1109
line 3297
;3295:	}
;3296:	// get the enemy entity information
;3297:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3299
;3298:	// if this is not a player (should be an obelisk)
;3299:	if (bs->enemy >= MAX_CLIENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 64
LTI4 $1111
line 3301
;3300:		// if the obelisk is visible
;3301:		VectorCopy(entinfo.origin, target);
ADDRLP4 828
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3309
;3302:#ifdef MISSIONPACK
;3303:		// if attacking an obelisk
;3304:		if (bs->enemy == redobelisk.entitynum || bs->enemy == blueobelisk.entitynum) {
;3305:			target[2] += 32;
;3306:		}
;3307:#endif
;3308:		// aim at the obelisk
;3309:		VectorSubtract(target, bs->eye, dir);
ADDRLP4 984
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 828
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 828+4
INDIRF4
ADDRLP4 984
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 828+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3310
;3310:		vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3312
;3311:		// set the aim target before trying to attack
;3312:		VectorCopy(target, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 828
INDIRB
ASGNB 12
line 3313
;3313:		return;
ADDRGP4 $1106
JUMPV
LABELV $1111
line 3318
;3314:	}
;3315:	//
;3316:	// BotAI_Print(PRT_MESSAGE, "client %d: aiming at client %d\n", bs->entitynum, bs->enemy);
;3317:	//
;3318:	aim_skill    = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 16
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 984
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 984
INDIRF4
ASGNF4
line 3319
;3319:	aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 988
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 988
INDIRF4
ASGNF4
line 3321
;3320:	//
;3321:	if (aim_skill > 0.95) {
ADDRLP4 736
INDIRF4
CNSTF4 1064514355
LEF4 $1118
line 3323
;3322:		// don't aim too early
;3323:		reactiontime = 0.5 * trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 992
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 856
ADDRLP4 992
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3324
;3324:		if (bs->enemysight_time > FloatTime() - reactiontime)
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 856
INDIRF4
SUBF4
LEF4 $1120
line 3325
;3325:			return;
ADDRGP4 $1106
JUMPV
LABELV $1120
line 3326
;3326:		if (bs->teleport_time > FloatTime() - reactiontime)
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 856
INDIRF4
SUBF4
LEF4 $1122
line 3327
;3327:			return;
ADDRGP4 $1106
JUMPV
LABELV $1122
line 3328
;3328:	}
LABELV $1118
line 3331
;3329:
;3330:	// get the weapon information
;3331:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
ADDRLP4 992
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 992
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 992
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRLP4 160
ARGP4
ADDRGP4 trap_BotGetWeaponInfo
CALLV
pop
line 3333
;3332:	// get the weapon specific aim accuracy and or aim skill
;3333:	if (wi.number == WP_MACHINEGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 2
NEI4 $1124
line 3334
;3334:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_MACHINEGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3335
;3335:	} else if (wi.number == WP_SHOTGUN) {
ADDRGP4 $1125
JUMPV
LABELV $1124
ADDRLP4 160+4
INDIRI4
CNSTI4 3
NEI4 $1127
line 3336
;3336:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_SHOTGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 9
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3337
;3337:	} else if (wi.number == WP_GRENADE_LAUNCHER) {
ADDRGP4 $1128
JUMPV
LABELV $1127
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1130
line 3338
;3338:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_GRENADELAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 11
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3339
;3339:		aim_skill    = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_GRENADELAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 18
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3340
;3340:	} else if (wi.number == WP_ROCKET_LAUNCHER) {
ADDRGP4 $1131
JUMPV
LABELV $1130
ADDRLP4 160+4
INDIRI4
CNSTI4 5
NEI4 $1133
line 3341
;3341:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_ROCKETLAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 10
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3342
;3342:		aim_skill    = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_ROCKETLAUNCHER, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 17
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3343
;3343:	} else if (wi.number == WP_LIGHTNING) {
ADDRGP4 $1134
JUMPV
LABELV $1133
ADDRLP4 160+4
INDIRI4
CNSTI4 6
NEI4 $1136
line 3344
;3344:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_LIGHTNING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 12
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3345
;3345:	} else if (wi.number == WP_RAILGUN) {
ADDRGP4 $1137
JUMPV
LABELV $1136
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $1139
line 3346
;3346:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_RAILGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 14
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3347
;3347:	} else if (wi.number == WP_PLASMAGUN) {
ADDRGP4 $1140
JUMPV
LABELV $1139
ADDRLP4 160+4
INDIRI4
CNSTI4 8
NEI4 $1142
line 3348
;3348:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_PLASMAGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 13
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3349
;3349:		aim_skill    = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_PLASMAGUN, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 19
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3350
;3350:	} else if (wi.number == WP_BFG) {
ADDRGP4 $1143
JUMPV
LABELV $1142
ADDRLP4 160+4
INDIRI4
CNSTI4 9
NEI4 $1145
line 3351
;3351:		aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY_BFG10K, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 15
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 996
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 156
ADDRLP4 996
INDIRF4
ASGNF4
line 3352
;3352:		aim_skill    = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_SKILL_BFG10K, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 20
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 1000
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 736
ADDRLP4 1000
INDIRF4
ASGNF4
line 3353
;3353:	}
LABELV $1145
LABELV $1143
LABELV $1140
LABELV $1137
LABELV $1134
LABELV $1131
LABELV $1128
LABELV $1125
line 3355
;3354:	//
;3355:	if (aim_accuracy <= 0)
ADDRLP4 156
INDIRF4
CNSTF4 0
GTF4 $1148
line 3356
;3356:		aim_accuracy = 0.0001f;
ADDRLP4 156
CNSTF4 953267991
ASGNF4
LABELV $1148
line 3358
;3357:	// get the enemy entity information
;3358:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3360
;3359:	// if the enemy is invisible then shoot crappy most of the time
;3360:	if (EntityIsInvisible(&entinfo)) {
ADDRLP4 0
ARGP4
ADDRLP4 996
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
EQI4 $1150
line 3361
;3361:		if (random() > 0.1)
ADDRLP4 1000
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1036831949
LEF4 $1152
line 3362
;3362:			aim_accuracy *= 0.4f;
ADDRLP4 156
ADDRLP4 156
INDIRF4
CNSTF4 1053609165
MULF4
ASGNF4
LABELV $1152
line 3363
;3363:	}
LABELV $1150
line 3365
;3364:	//
;3365:	VectorSubtract(entinfo.origin, entinfo.lastvisorigin, enemyvelocity);
ADDRLP4 712
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 712+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 712+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3366
;3366:	VectorScale(enemyvelocity, 1 / entinfo.update_time, enemyvelocity);
ADDRLP4 712
ADDRLP4 712
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 712+4
ADDRLP4 712+4
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 712+8
ADDRLP4 712+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
line 3368
;3367:	// enemy origin and velocity is remembered every 0.5 seconds
;3368:	if (bs->enemyposition_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1173
line 3370
;3369:		//
;3370:		bs->enemyposition_time = FloatTime() + 0.5;
ADDRFP4 0
INDIRP4
CNSTI4 6140
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 3371
;3371:		VectorCopy(enemyvelocity, bs->enemyvelocity);
ADDRFP4 0
INDIRP4
CNSTI4 6232
ADDP4
ADDRLP4 712
INDIRB
ASGNB 12
line 3372
;3372:		VectorCopy(entinfo.origin, bs->enemyorigin);
ADDRFP4 0
INDIRP4
CNSTI4 6244
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3373
;3373:	}
LABELV $1173
line 3375
;3374:	// if not extremely skilled
;3375:	if (aim_skill < 0.9) {
ADDRLP4 736
INDIRF4
CNSTF4 1063675494
GEF4 $1176
line 3376
;3376:		VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1000
INDIRP4
CNSTI4 6244
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1000
INDIRP4
CNSTI4 6248
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 6252
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3378
;3377:		// if the enemy moved a bit
;3378:		if (VectorLengthSquared(dir) > Square(48)) {
ADDRLP4 140
ARGP4
ADDRLP4 1004
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1004
INDIRF4
CNSTF4 1158676480
LEF4 $1185
line 3380
;3379:			// if the enemy changed direction
;3380:			if (DotProduct(bs->enemyvelocity, enemyvelocity) < 0) {
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 6232
ADDP4
INDIRF4
ADDRLP4 712
INDIRF4
MULF4
ADDRLP4 1008
INDIRP4
CNSTI4 6236
ADDP4
INDIRF4
ADDRLP4 712+4
INDIRF4
MULF4
ADDF4
ADDRLP4 1008
INDIRP4
CNSTI4 6240
ADDP4
INDIRF4
ADDRLP4 712+8
INDIRF4
MULF4
ADDF4
CNSTF4 0
GEF4 $1187
line 3382
;3381:				// aim accuracy should be worse now
;3382:				aim_accuracy *= 0.7f;
ADDRLP4 156
ADDRLP4 156
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 3383
;3383:			}
LABELV $1187
line 3384
;3384:		}
LABELV $1185
line 3385
;3385:	}
LABELV $1176
line 3387
;3386:	// check visibility of enemy
;3387:	enemyvisible = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, bs->enemy);
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1000
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 1000
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 1000
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 1000
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 1004
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 824
ADDRLP4 1004
INDIRF4
CVFI4 4
ASGNI4
line 3389
;3388:	// if the enemy is visible
;3389:	if (enemyvisible) {
ADDRLP4 824
INDIRI4
CNSTI4 0
EQI4 $1191
line 3391
;3390:		//
;3391:		VectorCopy(entinfo.origin, bestorigin);
ADDRLP4 724
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3392
;3392:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3395
;3393:		// get the start point shooting from
;3394:		// NOTE: the x and y projectile start offsets are ignored
;3395:		VectorCopy(bs->origin, start);
ADDRLP4 844
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3396
;3396:		start[2] += bs->cur_ps.viewheight;
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3397
;3397:		start[2] += wi.offset[2];
ADDRLP4 844+8
ADDRLP4 844+8
INDIRF4
ADDRLP4 160+292+8
INDIRF4
ADDF4
ASGNF4
line 3399
;3398:		//
;3399:		BotAI_Trace(&trace, start, mins, maxs, bestorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 844
ARGP4
ADDRLP4 860
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 724
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3401
;3400:		// if the enemy is NOT hit
;3401:		if (trace.fraction <= 1 && trace.ent != entinfo.number) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
GTF4 $1199
ADDRLP4 740+80
INDIRI4
ADDRLP4 0+20
INDIRI4
EQI4 $1199
line 3402
;3402:			bestorigin[2] += 16;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1098907648
ADDF4
ASGNF4
line 3403
;3403:		}
LABELV $1199
line 3405
;3404:		// if it is not an instant hit weapon the bot might want to predict the enemy
;3405:		if (wi.speed) {
ADDRLP4 160+272
INDIRF4
CNSTF4 0
EQF4 $1205
line 3407
;3406:			//
;3407:			VectorSubtract(bestorigin, bs->origin, dir);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 724
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 724+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3408
;3408:			dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1012
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1012
INDIRF4
ASGNF4
line 3409
;3409:			VectorSubtract(entinfo.origin, bs->enemyorigin, dir);
ADDRLP4 1016
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 6244
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 6248
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 6252
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3411
;3410:			// if the enemy is NOT pretty far away and strafing just small steps left and right
;3411:			if (!(dist > 100 && VectorLengthSquared(dir) < Square(32))) {
ADDRLP4 840
INDIRF4
CNSTF4 1120403456
LEF4 $1221
ADDRLP4 140
ARGP4
ADDRLP4 1020
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1020
INDIRF4
CNSTF4 1149239296
LTF4 $1219
LABELV $1221
line 3413
;3412:				// if skilled anough do exact prediction
;3413:				if (aim_skill > 0.8 &&
ADDRLP4 736
INDIRF4
CNSTF4 1061997773
LEF4 $1222
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1222
line 3415
;3414:				    // if the weapon is ready to fire
;3415:				    bs->cur_ps.weaponstate == WEAPON_READY) {
line 3419
;3416:					aas_clientmove_t move;
;3417:					vec3_t           origin;
;3418:
;3419:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 1120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1120
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1120
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3421
;3420:					// distance towards the enemy
;3421:					dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1124
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1124
INDIRF4
ASGNF4
line 3423
;3422:					// direction the enemy is moving in
;3423:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3425
;3424:					//
;3425:					VectorScale(dir, 1 / entinfo.update_time, dir);
ADDRLP4 140
ADDRLP4 140
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 140+4
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 140+8
INDIRF4
CNSTF4 1065353216
ADDRLP4 0+16
INDIRF4
DIVF4
MULF4
ASGNF4
line 3427
;3426:					//
;3427:					VectorCopy(entinfo.origin, origin);
ADDRLP4 1024
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3428
;3428:					origin[2] += 1;
ADDRLP4 1024+8
ADDRLP4 1024+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3430
;3429:					//
;3430:					VectorClear(cmdmove);
ADDRLP4 968
CNSTF4 0
ASGNF4
ADDRLP4 968+4
CNSTF4 0
ASGNF4
ADDRLP4 968+8
CNSTF4 0
ASGNF4
line 3432
;3431:					// AAS_ClearShownDebugLines();
;3432:					trap_AAS_PredictClientMovement(
ADDRLP4 1036
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 1024
ARGP4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 140
ARGP4
ADDRLP4 968
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 840
INDIRF4
CNSTF4 1092616192
MULF4
ADDRLP4 160+272
INDIRF4
DIVF4
CVFI4 4
ARGI4
CNSTF4 1036831949
ARGF4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_AAS_PredictClientMovement
CALLI4
pop
line 3434
;3433:						&move, bs->enemy, origin, PRESENCE_CROUCH, qfalse, dir, cmdmove, 0, dist * 10 / wi.speed, 0.1f, 0, 0, qfalse);
;3434:					VectorCopy(move.endpos, bestorigin);
ADDRLP4 724
ADDRLP4 1036
INDIRB
ASGNB 12
line 3436
;3435:					// BotAI_Print(PRT_MESSAGE, "%1.1f predicted speed = %f, frames = %f\n", FloatTime(), VectorLength(dir), dist * 10 / wi.speed);
;3436:				}
ADDRGP4 $1223
JUMPV
LABELV $1222
line 3438
;3437:				// if not that skilled do linear prediction
;3438:				else if (aim_skill > 0.4) {
ADDRLP4 736
INDIRF4
CNSTF4 1053609165
LEF4 $1255
line 3439
;3439:					VectorSubtract(entinfo.origin, bs->origin, dir);
ADDRLP4 1024
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 1024
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 1024
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3441
;3440:					// distance towards the enemy
;3441:					dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1028
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1028
INDIRF4
ASGNF4
line 3443
;3442:					// direction the enemy is moving in
;3443:					VectorSubtract(entinfo.origin, entinfo.lastvisorigin, dir);
ADDRLP4 140
ADDRLP4 0+24
INDIRF4
ADDRLP4 0+60
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 0+60+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 0+60+8
INDIRF4
SUBF4
ASGNF4
line 3444
;3444:					dir[2] = 0;
ADDRLP4 140+8
CNSTF4 0
ASGNF4
line 3446
;3445:					//
;3446:					speed = VectorNormalize(dir) / entinfo.update_time;
ADDRLP4 140
ARGP4
ADDRLP4 1032
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 980
ADDRLP4 1032
INDIRF4
ADDRLP4 0+16
INDIRF4
DIVF4
ASGNF4
line 3449
;3447:					// botimport.Print(PRT_MESSAGE, "speed = %f, wi->speed = %f\n", speed, wi->speed);
;3448:					// best spot to aim at
;3449:					VectorMA(entinfo.origin, (dist / wi.speed) * speed, dir, bestorigin);
ADDRLP4 1036
ADDRLP4 840
INDIRF4
ASGNF4
ADDRLP4 1040
ADDRLP4 980
INDIRF4
ASGNF4
ADDRLP4 724
ADDRLP4 0+24
INDIRF4
ADDRLP4 140
INDIRF4
ADDRLP4 1036
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 1040
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 724+4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 140+4
INDIRF4
ADDRLP4 1036
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 1040
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 724+8
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 140+8
INDIRF4
ADDRLP4 840
INDIRF4
ADDRLP4 160+272
INDIRF4
DIVF4
ADDRLP4 980
INDIRF4
MULF4
MULF4
ADDF4
ASGNF4
line 3450
;3450:				}
LABELV $1255
LABELV $1223
line 3451
;3451:			}
LABELV $1219
line 3452
;3452:		}
LABELV $1205
line 3454
;3453:		// if the projectile does radial damage
;3454:		if (aim_skill > 0.6 && wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 736
INDIRF4
CNSTF4 1058642330
LEF4 $1290
ADDRLP4 160+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1290
line 3456
;3455:			// if the enemy isn't standing significantly higher than the bot
;3456:			if (entinfo.origin[2] < bs->origin[2] + 16) {
ADDRLP4 0+24+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
CNSTF4 1098907648
ADDF4
GEF4 $1294
line 3458
;3457:				// try to aim at the ground in front of the enemy
;3458:				VectorCopy(entinfo.origin, end);
ADDRLP4 956
ADDRLP4 0+24
INDIRB
ASGNB 12
line 3459
;3459:				end[2] -= 64;
ADDRLP4 956+8
ADDRLP4 956+8
INDIRF4
CNSTF4 1115684864
SUBF4
ASGNF4
line 3460
;3460:				BotAI_Trace(&trace, entinfo.origin, NULL, NULL, end, entinfo.number, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 0+24
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 956
ARGP4
ADDRLP4 0+20
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3462
;3461:				//
;3462:				VectorCopy(bestorigin, groundtarget);
ADDRLP4 944
ADDRLP4 724
INDIRB
ASGNB 12
line 3463
;3463:				if (trace.startsolid)
ADDRLP4 740+4
INDIRI4
CNSTI4 0
EQI4 $1302
line 3464
;3464:					groundtarget[2] = entinfo.origin[2] - 16;
ADDRLP4 944+8
ADDRLP4 0+24+8
INDIRF4
CNSTF4 1098907648
SUBF4
ASGNF4
ADDRGP4 $1303
JUMPV
LABELV $1302
line 3466
;3465:				else
;3466:					groundtarget[2] = trace.endpos[2] - 8;
ADDRLP4 944+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1090519040
SUBF4
ASGNF4
LABELV $1303
line 3468
;3467:				// trace a line from projectile start to ground target
;3468:				BotAI_Trace(&trace, start, NULL, NULL, groundtarget, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 844
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 944
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3470
;3469:				// if hitpoint is not vertically too far from the ground target
;3470:				if (fabs(trace.endpos[2] - groundtarget[2]) < 50) {
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 944+8
INDIRF4
SUBF4
ARGF4
ADDRLP4 1008
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 1008
INDIRF4
CNSTF4 1112014848
GEF4 $1311
line 3471
;3471:					VectorSubtract(trace.endpos, groundtarget, dir);
ADDRLP4 140
ADDRLP4 740+12
INDIRF4
ADDRLP4 944
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 740+12+4
INDIRF4
ADDRLP4 944+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 944+8
INDIRF4
SUBF4
ASGNF4
line 3473
;3472:					// if the hitpoint is near enough the ground target
;3473:					if (VectorLengthSquared(dir) < Square(60)) {
ADDRLP4 140
ARGP4
ADDRLP4 1012
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1012
INDIRF4
CNSTF4 1163984896
GEF4 $1325
line 3474
;3474:						VectorSubtract(trace.endpos, start, dir);
ADDRLP4 140
ADDRLP4 740+12
INDIRF4
ADDRLP4 844
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 740+12+4
INDIRF4
ADDRLP4 844+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 740+12+8
INDIRF4
ADDRLP4 844+8
INDIRF4
SUBF4
ASGNF4
line 3476
;3475:						// if the hitpoint is far enough from the bot
;3476:						if (VectorLengthSquared(dir) > Square(100)) {
ADDRLP4 140
ARGP4
ADDRLP4 1016
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1016
INDIRF4
CNSTF4 1176256512
LEF4 $1336
line 3478
;3477:							// check if the bot is visible from the ground target
;3478:							trace.endpos[2] += 1;
ADDRLP4 740+12+8
ADDRLP4 740+12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 3479
;3479:							BotAI_Trace(&trace, trace.endpos, NULL, NULL, entinfo.origin, entinfo.number, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 740+12
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 0+20
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3480
;3480:							if (trace.fraction >= 1) {
ADDRLP4 740+8
INDIRF4
CNSTF4 1065353216
LTF4 $1343
line 3482
;3481:								// botimport.Print(PRT_MESSAGE, "%1.1f aiming at ground\n", AAS_Time());
;3482:								VectorCopy(groundtarget, bestorigin);
ADDRLP4 724
ADDRLP4 944
INDIRB
ASGNB 12
line 3483
;3483:							}
LABELV $1343
line 3484
;3484:						}
LABELV $1336
line 3485
;3485:					}
LABELV $1325
line 3486
;3486:				}
LABELV $1311
line 3487
;3487:			}
LABELV $1294
line 3488
;3488:		}
LABELV $1290
line 3489
;3489:		bestorigin[0] += 20 * crandom() * (1 - aim_accuracy);
ADDRLP4 1008
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724
ADDRLP4 724
INDIRF4
ADDRLP4 1008
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
CNSTF4 1101004800
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3490
;3490:		bestorigin[1] += 20 * crandom() * (1 - aim_accuracy);
ADDRLP4 1012
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1012
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
CNSTF4 1101004800
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3491
;3491:		bestorigin[2] += 10 * crandom() * (1 - aim_accuracy);
ADDRLP4 1016
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
ADDRLP4 1016
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
CNSTF4 1092616192
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3492
;3492:	} else {
ADDRGP4 $1192
JUMPV
LABELV $1191
line 3494
;3493:		//
;3494:		VectorCopy(bs->lastenemyorigin, bestorigin);
ADDRLP4 724
ADDRFP4 0
INDIRP4
CNSTI4 6548
ADDP4
INDIRB
ASGNB 12
line 3495
;3495:		bestorigin[2] += 8;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 3497
;3496:		// if the bot is skilled enough
;3497:		if (aim_skill > 0.5) {
ADDRLP4 736
INDIRF4
CNSTF4 1056964608
LEF4 $1349
line 3499
;3498:			// do prediction shots around corners
;3499:			if (wi.number == WP_BFG || wi.number == WP_ROCKET_LAUNCHER || wi.number == WP_GRENADE_LAUNCHER) {
ADDRLP4 160+4
INDIRI4
CNSTI4 9
EQI4 $1357
ADDRLP4 160+4
INDIRI4
CNSTI4 5
EQI4 $1357
ADDRLP4 160+4
INDIRI4
CNSTI4 4
NEI4 $1351
LABELV $1357
line 3501
;3500:				// create the chase goal
;3501:				goal.entitynum = bs->client;
ADDRLP4 884+40
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 3502
;3502:				goal.areanum   = bs->areanum;
ADDRLP4 884+12
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3503
;3503:				VectorCopy(bs->eye, goal.origin);
ADDRLP4 884
ADDRFP4 0
INDIRP4
CNSTI4 4936
ADDP4
INDIRB
ASGNB 12
line 3504
;3504:				VectorSet(goal.mins, -8, -8, -8);
ADDRLP4 884+16
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+4
CNSTF4 3238002688
ASGNF4
ADDRLP4 884+16+8
CNSTF4 3238002688
ASGNF4
line 3505
;3505:				VectorSet(goal.maxs, 8, 8, 8);
ADDRLP4 884+28
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+4
CNSTF4 1090519040
ASGNF4
ADDRLP4 884+28+8
CNSTF4 1090519040
ASGNF4
line 3507
;3506:				//
;3507:				if (trap_BotPredictVisiblePosition(bs->lastenemyorigin, bs->lastenemyareanum, &goal, TFL_DEFAULT, target)) {
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 6548
ADDP4
ARGP4
ADDRLP4 1008
INDIRP4
CNSTI4 6544
ADDP4
INDIRI4
ARGI4
ADDRLP4 884
ARGP4
CNSTI4 18616254
ARGI4
ADDRLP4 828
ARGP4
ADDRLP4 1012
ADDRGP4 trap_BotPredictVisiblePosition
CALLI4
ASGNI4
ADDRLP4 1012
INDIRI4
CNSTI4 0
EQI4 $1370
line 3508
;3508:					VectorSubtract(target, bs->eye, dir);
ADDRLP4 1016
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 828
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 828+4
INDIRF4
ADDRLP4 1016
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 828+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3509
;3509:					if (VectorLengthSquared(dir) > Square(80)) {
ADDRLP4 140
ARGP4
ADDRLP4 1020
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 1020
INDIRF4
CNSTF4 1170735104
LEF4 $1376
line 3510
;3510:						VectorCopy(target, bestorigin);
ADDRLP4 724
ADDRLP4 828
INDIRB
ASGNB 12
line 3511
;3511:						bestorigin[2] -= 20;
ADDRLP4 724+8
ADDRLP4 724+8
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 3512
;3512:					}
LABELV $1376
line 3513
;3513:				}
LABELV $1370
line 3514
;3514:				aim_accuracy = 1;
ADDRLP4 156
CNSTF4 1065353216
ASGNF4
line 3515
;3515:			}
LABELV $1351
line 3516
;3516:		}
LABELV $1349
line 3517
;3517:	}
LABELV $1192
line 3519
;3518:	//
;3519:	if (enemyvisible) {
ADDRLP4 824
INDIRI4
CNSTI4 0
EQI4 $1379
line 3520
;3520:		BotAI_Trace(&trace, bs->eye, NULL, NULL, bestorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 740
ARGP4
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 724
ARGP4
ADDRLP4 1008
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3521
;3521:		VectorCopy(trace.endpos, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 740+12
INDIRB
ASGNB 12
line 3522
;3522:	} else {
ADDRGP4 $1380
JUMPV
LABELV $1379
line 3523
;3523:		VectorCopy(bestorigin, bs->aimtarget);
ADDRFP4 0
INDIRP4
CNSTI4 6220
ADDP4
ADDRLP4 724
INDIRB
ASGNB 12
line 3524
;3524:	}
LABELV $1380
line 3526
;3525:	// get aim direction
;3526:	VectorSubtract(bestorigin, bs->eye, dir);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 140
ADDRLP4 724
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+4
ADDRLP4 724+4
INDIRF4
ADDRLP4 1008
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 140+8
ADDRLP4 724+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3528
;3527:	//
;3528:	if (wi.number == WP_MACHINEGUN || wi.number == WP_SHOTGUN || wi.number == WP_LIGHTNING || wi.number == WP_RAILGUN) {
ADDRLP4 160+4
INDIRI4
CNSTI4 2
EQI4 $1394
ADDRLP4 160+4
INDIRI4
CNSTI4 3
EQI4 $1394
ADDRLP4 160+4
INDIRI4
CNSTI4 6
EQI4 $1394
ADDRLP4 160+4
INDIRI4
CNSTI4 7
NEI4 $1386
LABELV $1394
line 3530
;3529:		// distance towards the enemy
;3530:		dist = VectorLength(dir);
ADDRLP4 140
ARGP4
ADDRLP4 1012
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 840
ADDRLP4 1012
INDIRF4
ASGNF4
line 3531
;3531:		if (dist > 150)
ADDRLP4 840
INDIRF4
CNSTF4 1125515264
LEF4 $1395
line 3532
;3532:			dist = 150;
ADDRLP4 840
CNSTF4 1125515264
ASGNF4
LABELV $1395
line 3533
;3533:		f = 0.6 + dist / 150 * 0.4;
ADDRLP4 940
ADDRLP4 840
INDIRF4
CNSTF4 992920382
MULF4
CNSTF4 1058642330
ADDF4
ASGNF4
line 3534
;3534:		aim_accuracy *= f;
ADDRLP4 156
ADDRLP4 156
INDIRF4
ADDRLP4 940
INDIRF4
MULF4
ASGNF4
line 3535
;3535:	}
LABELV $1386
line 3537
;3536:	// add some random stuff to the aim direction depending on the aim accuracy
;3537:	if (aim_accuracy < 0.8) {
ADDRLP4 156
INDIRF4
CNSTF4 1061997773
GEF4 $1397
line 3538
;3538:		VectorNormalize(dir);
ADDRLP4 140
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 3539
;3539:		for (i = 0; i < 3; i++)
ADDRLP4 152
CNSTI4 0
ASGNI4
LABELV $1399
line 3540
;3540:			dir[i] += 0.3 * crandom() * (1 - aim_accuracy);
ADDRLP4 1012
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1016
ADDRLP4 152
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 140
ADDP4
ASGNP4
ADDRLP4 1016
INDIRP4
ADDRLP4 1016
INDIRP4
INDIRF4
ADDRLP4 1012
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
CNSTF4 1050253722
MULF4
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
LABELV $1400
line 3539
ADDRLP4 152
ADDRLP4 152
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 3
LTI4 $1399
line 3541
;3541:	}
LABELV $1397
line 3543
;3542:	// set the ideal view angles
;3543:	vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 140
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3545
;3544:	// take the weapon spread into account for lower skilled bots
;3545:	bs->ideal_viewangles[PITCH] += 6 * wi.vspread * crandom() * (1 - aim_accuracy);
ADDRLP4 1012
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1016
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1016
INDIRP4
ADDRLP4 1016
INDIRP4
INDIRF4
ADDRLP4 160+268
INDIRF4
CNSTF4 1086324736
MULF4
ADDRLP4 1012
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
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3546
;3546:	bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
ADDRLP4 1020
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1020
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
ARGF4
ADDRLP4 1024
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1020
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 1024
INDIRF4
ASGNF4
line 3547
;3547:	bs->ideal_viewangles[YAW] += 6 * wi.hspread * crandom() * (1 - aim_accuracy);
ADDRLP4 1028
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1032
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 1032
INDIRP4
ADDRLP4 1032
INDIRP4
INDIRF4
ADDRLP4 160+264
INDIRF4
CNSTF4 1086324736
MULF4
ADDRLP4 1028
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
CNSTF4 1065353216
ADDRLP4 156
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3548
;3548:	bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
ADDRLP4 1036
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1036
INDIRP4
CNSTI4 6580
ADDP4
INDIRF4
ARGF4
ADDRLP4 1040
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 1036
INDIRP4
CNSTI4 6580
ADDP4
ADDRLP4 1040
INDIRF4
ASGNF4
line 3550
;3549:	// if the bots should be really challenging
;3550:	if (bot_challenge.integer) {
ADDRGP4 bot_challenge+12
INDIRI4
CNSTI4 0
EQI4 $1405
line 3552
;3551:		// if the bot is really accurate and has the enemy in view for some time
;3552:		if (aim_accuracy > 0.9 && bs->enemysight_time < FloatTime() - 1) {
ADDRLP4 156
INDIRF4
CNSTF4 1063675494
LEF4 $1408
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
SUBF4
GEF4 $1408
line 3554
;3553:			// set the view angles directly
;3554:			if (bs->ideal_viewangles[PITCH] > 180)
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
CNSTF4 1127481344
LEF4 $1410
line 3555
;3555:				bs->ideal_viewangles[PITCH] -= 360;
ADDRLP4 1044
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
ADDRLP4 1044
INDIRP4
INDIRF4
CNSTF4 1135869952
SUBF4
ASGNF4
LABELV $1410
line 3556
;3556:			VectorCopy(bs->ideal_viewangles, bs->viewangles);
ADDRLP4 1048
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CNSTI4 6564
ADDP4
ADDRLP4 1048
INDIRP4
CNSTI4 6576
ADDP4
INDIRB
ASGNB 12
line 3557
;3557:			trap_EA_View(bs->client, bs->viewangles);
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1052
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRGP4 trap_EA_View
CALLV
pop
line 3558
;3558:		}
LABELV $1408
line 3559
;3559:	}
LABELV $1405
line 3560
;3560:}
LABELV $1106
endproc BotAimAtEnemy 1128 52
data
align 4
LABELV $1413
byte 4 3238002688
byte 4 3238002688
byte 4 3238002688
align 4
LABELV $1414
byte 4 1090519040
byte 4 1090519040
byte 4 1090519040
export BotCheckAttack
code
proc BotCheckAttack 1024 28
line 3567
;3561:
;3562:/*
;3563:==================
;3564:BotCheckAttack
;3565:==================
;3566:*/
;3567:void BotCheckAttack(bot_state_t* bs) {
line 3577
;3568:	float       points, reactiontime, fov, firethrottle;
;3569:	int         attackentity;
;3570:	bsp_trace_t bsptrace;
;3571:	// float selfpreservation;
;3572:	vec3_t           forward, right, start, end, dir, angles;
;3573:	weaponinfo_t     wi;
;3574:	bsp_trace_t      trace;
;3575:	aas_entityinfo_t entinfo;
;3576:	weapon_t         weapon;
;3577:	vec3_t           mins = {-8, -8, -8}, maxs = {8, 8, 8};
ADDRLP4 812
ADDRGP4 $1413
INDIRB
ASGNB 12
ADDRLP4 824
ADDRGP4 $1414
INDIRB
ASGNB 12
line 3579
;3578:
;3579:	attackentity = bs->enemy;
ADDRLP4 576
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ASGNI4
line 3581
;3580:	//
;3581:	BotEntityInfo(attackentity, &entinfo);
ADDRLP4 576
INDIRI4
ARGI4
ADDRLP4 836
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3583
;3582:	// if not attacking a player
;3583:	if (attackentity >= MAX_CLIENTS) {
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $1415
line 3593
;3584:#ifdef MISSIONPACK
;3585:		// if attacking an obelisk
;3586:		if (entinfo.number == redobelisk.entitynum || entinfo.number == blueobelisk.entitynum) {
;3587:			// if obelisk is respawning return
;3588:			if (g_entities[entinfo.number].activator && g_entities[entinfo.number].activator->s.frame == 2) {
;3589:				return;
;3590:			}
;3591:		}
;3592:#endif
;3593:	}
LABELV $1415
line 3595
;3594:	//
;3595:	reactiontime = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_REACTIONTIME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 6
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 980
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 704
ADDRLP4 980
INDIRF4
ASGNF4
line 3596
;3596:	if (bs->enemysight_time > FloatTime() - reactiontime)
ADDRFP4 0
INDIRP4
CNSTI4 6132
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 704
INDIRF4
SUBF4
LEF4 $1417
line 3597
;3597:		return;
ADDRGP4 $1412
JUMPV
LABELV $1417
line 3598
;3598:	if (bs->teleport_time > FloatTime() - reactiontime)
ADDRFP4 0
INDIRP4
CNSTI4 6180
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 704
INDIRF4
SUBF4
LEF4 $1419
line 3599
;3599:		return;
ADDRGP4 $1412
JUMPV
LABELV $1419
line 3601
;3600:	// if changing weapons
;3601:	if (bs->weaponchange_time > FloatTime() - 0.1)
ADDRFP4 0
INDIRP4
CNSTI4 6192
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1036831949
SUBF4
LEF4 $1421
line 3602
;3602:		return;
ADDRGP4 $1412
JUMPV
LABELV $1421
line 3604
;3603:	// check fire throttle characteristic
;3604:	if (bs->firethrottlewait_time > FloatTime())
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
LEF4 $1423
line 3605
;3605:		return;
ADDRGP4 $1412
JUMPV
LABELV $1423
line 3606
;3606:	firethrottle = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_FIRETHROTTLE, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 47
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 984
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 796
ADDRLP4 984
INDIRF4
ASGNF4
line 3607
;3607:	if (bs->firethrottleshoot_time < FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1425
line 3608
;3608:		if (random() > firethrottle) {
ADDRLP4 988
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 988
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 796
INDIRF4
LEF4 $1427
line 3609
;3609:			bs->firethrottlewait_time  = FloatTime() + firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 796
INDIRF4
ADDF4
ASGNF4
line 3610
;3610:			bs->firethrottleshoot_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
CNSTF4 0
ASGNF4
line 3611
;3611:		} else {
ADDRGP4 $1428
JUMPV
LABELV $1427
line 3612
;3612:			bs->firethrottleshoot_time = FloatTime() + 1 - firethrottle;
ADDRFP4 0
INDIRP4
CNSTI4 6200
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 796
INDIRF4
SUBF4
ASGNF4
line 3613
;3613:			bs->firethrottlewait_time  = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6196
ADDP4
CNSTF4 0
ASGNF4
line 3614
;3614:		}
LABELV $1428
line 3615
;3615:	}
LABELV $1425
line 3618
;3616:	//
;3617:	//
;3618:	VectorSubtract(bs->aimtarget, bs->eye, dir);
ADDRLP4 988
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 580
ADDRLP4 988
INDIRP4
CNSTI4 6220
ADDP4
INDIRF4
ADDRLP4 988
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 580+4
ADDRLP4 988
INDIRP4
CNSTI4 6224
ADDP4
INDIRF4
ADDRLP4 988
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 992
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 580+8
ADDRLP4 992
INDIRP4
CNSTI4 6228
ADDP4
INDIRF4
ADDRLP4 992
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3620
;3619:	//
;3620:	if (bs->weaponnum == WP_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1431
line 3621
;3621:		if (VectorLengthSquared(dir) > Square(60)) {
ADDRLP4 580
ARGP4
ADDRLP4 996
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 996
INDIRF4
CNSTF4 1163984896
LEF4 $1433
line 3622
;3622:			return;
ADDRGP4 $1412
JUMPV
LABELV $1433
line 3624
;3623:		}
;3624:	}
LABELV $1431
line 3625
;3625:	if (VectorLengthSquared(dir) < Square(100))
ADDRLP4 580
ARGP4
ADDRLP4 996
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 996
INDIRF4
CNSTF4 1176256512
GEF4 $1435
line 3626
;3626:		fov = 120;
ADDRLP4 792
CNSTF4 1123024896
ASGNF4
ADDRGP4 $1436
JUMPV
LABELV $1435
line 3628
;3627:	else
;3628:		fov = 50;
ADDRLP4 792
CNSTF4 1112014848
ASGNF4
LABELV $1436
line 3630
;3629:	//
;3630:	vectoangles(dir, angles);
ADDRLP4 580
ARGP4
ADDRLP4 800
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3631
;3631:	if (!InFieldOfVision(bs->viewangles, fov, angles))
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 792
INDIRF4
ARGF4
ADDRLP4 800
ARGP4
ADDRLP4 1000
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 1000
INDIRI4
CNSTI4 0
NEI4 $1437
line 3632
;3632:		return;
ADDRGP4 $1412
JUMPV
LABELV $1437
line 3633
;3633:	BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, bs->aimtarget, bs->client, CONTENTS_SOLID | CONTENTS_PLAYERCLIP);
ADDRLP4 708
ARGP4
ADDRLP4 1004
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1004
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 1004
INDIRP4
CNSTI4 6220
ADDP4
ARGP4
ADDRLP4 1004
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 65537
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3634
;3634:	if (bsptrace.fraction < 1 && bsptrace.ent != attackentity)
ADDRLP4 708+8
INDIRF4
CNSTF4 1065353216
GEF4 $1439
ADDRLP4 708+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $1439
line 3635
;3635:		return;
ADDRGP4 $1412
JUMPV
LABELV $1439
line 3638
;3636:
;3637:	// get the weapon info
;3638:	trap_BotGetWeaponInfo(bs->ws, bs->weaponnum, &wi);
ADDRLP4 1008
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1008
INDIRP4
CNSTI4 6536
ADDP4
INDIRI4
ARGI4
ADDRLP4 1008
INDIRP4
CNSTI4 6560
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 trap_BotGetWeaponInfo
CALLV
pop
line 3640
;3639:	// get the start point shooting from
;3640:	VectorCopy(bs->origin, start);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3641
;3641:	start[2] += bs->cur_ps.viewheight;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 3642
;3642:	AngleVectors(bs->viewangles, forward, right, NULL);
ADDRFP4 0
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 676
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 3643
;3643:	start[0] += forward[0] * wi.offset[0] + right[0] * wi.offset[1];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 3644
;3644:	start[1] += forward[1] * wi.offset[0] + right[1] * wi.offset[1];
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676+4
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 3645
;3645:	start[2] += forward[2] * wi.offset[0] + right[2] * wi.offset[1] + wi.offset[2];
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
ADDRLP4 24+292
INDIRF4
MULF4
ADDRLP4 676+8
INDIRF4
ADDRLP4 24+292+4
INDIRF4
MULF4
ADDF4
ADDRLP4 24+292+8
INDIRF4
ADDF4
ADDF4
ASGNF4
line 3647
;3646:	// end point aiming at
;3647:	VectorMA(start, 1000, forward, end);
ADDRLP4 688
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1148846080
MULF4
ADDF4
ASGNF4
ADDRLP4 688+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
CNSTF4 1148846080
MULF4
ADDF4
ASGNF4
ADDRLP4 688+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 1148846080
MULF4
ADDF4
ASGNF4
line 3649
;3648:	// a little back to make sure not inside a very close enemy
;3649:	VectorMA(start, -12, forward, start);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 3242196992
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 12+4
INDIRF4
CNSTF4 3242196992
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 3242196992
MULF4
ADDF4
ASGNF4
line 3650
;3650:	BotAI_Trace(&trace, start, mins, maxs, end, bs->entitynum, MASK_SHOT);
ADDRLP4 592
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 812
ARGP4
ADDRLP4 824
ARGP4
ADDRLP4 688
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3652
;3651:	// if the entity is a client
;3652:	if (trace.ent >= 0 && trace.ent < MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
CNSTI4 0
LTI4 $1473
ADDRLP4 592+80
INDIRI4
CNSTI4 64
GEI4 $1473
line 3653
;3653:		if (trace.ent != attackentity) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
EQI4 $1477
line 3655
;3654:			// if a teammate is hit
;3655:			if (BotSameTeam(bs, trace.ent))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 592+80
INDIRI4
ARGI4
ADDRLP4 1012
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1012
INDIRI4
CNSTI4 0
EQI4 $1480
line 3656
;3656:				return;
ADDRGP4 $1412
JUMPV
LABELV $1480
line 3657
;3657:		}
LABELV $1477
line 3658
;3658:	}
LABELV $1473
line 3660
;3659:	// if won't hit the enemy or not attacking a player (obelisk)
;3660:	if (trace.ent != attackentity || attackentity >= MAX_CLIENTS) {
ADDRLP4 592+80
INDIRI4
ADDRLP4 576
INDIRI4
NEI4 $1486
ADDRLP4 576
INDIRI4
CNSTI4 64
LTI4 $1483
LABELV $1486
line 3662
;3661:		// if the projectile does radial damage
;3662:		if (wi.proj.damagetype & DAMAGETYPE_RADIAL) {
ADDRLP4 24+344+180
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1487
line 3663
;3663:			if (trace.fraction * 1000 < wi.proj.radius) {
ADDRLP4 592+8
INDIRF4
CNSTF4 1148846080
MULF4
ADDRLP4 24+344+172
INDIRF4
GEF4 $1491
line 3664
;3664:				points = (wi.proj.damage - 0.5 * trace.fraction * 1000) * 0.5;
ADDRLP4 976
ADDRLP4 24+344+168
INDIRI4
CVIF4 4
ADDRLP4 592+8
INDIRF4
CNSTF4 1140457472
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3665
;3665:				if (points > 0) {
ADDRLP4 976
INDIRF4
CNSTF4 0
LEF4 $1499
line 3666
;3666:					return;
ADDRGP4 $1412
JUMPV
LABELV $1499
line 3668
;3667:				}
;3668:			}
LABELV $1491
line 3670
;3669:			// FIXME: check if a teammate gets radial damage
;3670:		}
LABELV $1487
line 3671
;3671:	}
LABELV $1483
line 3673
;3672:
;3673:	weapon = bs->cur_ps.weapon;
ADDRLP4 700
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 3674
;3674:	if (weapon >= WP_MACHINEGUN && weapon <= WP_BFG && !bs->cur_ps.ammo[weapon]) {
ADDRLP4 700
INDIRI4
CNSTI4 2
LTI4 $1501
ADDRLP4 700
INDIRI4
CNSTI4 9
GTI4 $1501
ADDRLP4 700
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 392
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1501
line 3675
;3675:		return;
ADDRGP4 $1412
JUMPV
LABELV $1501
line 3679
;3676:	}
;3677:
;3678:	// if fire has to be release to activate weapon
;3679:	if (wi.flags & WFL_FIRERELEASED) {
ADDRLP4 24+176
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1503
line 3680
;3680:		if (bs->flags & BFL_ATTACKED) {
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $1504
line 3681
;3681:			trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3682
;3682:		}
line 3683
;3683:	} else {
ADDRGP4 $1504
JUMPV
LABELV $1503
line 3684
;3684:		trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3685
;3685:	}
LABELV $1504
line 3686
;3686:	bs->flags ^= BFL_ATTACKED;
ADDRLP4 1020
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 1020
INDIRP4
ADDRLP4 1020
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 3687
;3687:}
LABELV $1412
endproc BotCheckAttack 1024 28
data
align 4
LABELV $1512
byte 4 1143930880
byte 4 1129054208
byte 4 1143472128
align 4
LABELV $1513
byte 4 1148256256
byte 4 1139408896
byte 4 1143603200
align 4
LABELV $1514
byte 4 1134034944
byte 4 1135607808
byte 4 1147535360
export BotMapScripts
code
proc BotMapScripts 264 16
line 3694
;3688:
;3689:/*
;3690:==================
;3691:BotMapScripts
;3692:==================
;3693:*/
;3694:void BotMapScripts(bot_state_t* bs) {
line 3700
;3695:	int              i, shootbutton;
;3696:	float            aim_accuracy;
;3697:	aas_entityinfo_t entinfo;
;3698:	vec3_t           dir;
;3699:
;3700:	if (!Q_stricmp(mapname, "q3tourney6")) {
ADDRGP4 mapname
ARGP4
ADDRGP4 $1511
ARGP4
ADDRLP4 164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $1509
line 3701
;3701:		vec3_t mins = {700, 204, 672}, maxs = {964, 468, 680};
ADDRLP4 168
ADDRGP4 $1512
INDIRB
ASGNB 12
ADDRLP4 180
ADDRGP4 $1513
INDIRB
ASGNB 12
line 3702
;3702:		vec3_t buttonorg = {304, 352, 920};
ADDRLP4 192
ADDRGP4 $1514
INDIRB
ASGNB 12
line 3704
;3703:		// NOTE: NEVER use the func_bobbing in q3tourney6
;3704:		bs->tfl &= ~TFL_FUNCBOB;
ADDRLP4 204
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 204
INDIRP4
ADDRLP4 204
INDIRP4
INDIRI4
CNSTI4 -16777217
BANDI4
ASGNI4
line 3706
;3705:		// if the bot is below the bounding box
;3706:		if (bs->origin[0] > mins[0] && bs->origin[0] < maxs[0]) {
ADDRLP4 208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 208
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 168
INDIRF4
LEF4 $1515
ADDRLP4 208
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
ADDRLP4 180
INDIRF4
GEF4 $1515
line 3707
;3707:			if (bs->origin[1] > mins[1] && bs->origin[1] < maxs[1]) {
ADDRLP4 212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 212
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 168+4
INDIRF4
LEF4 $1517
ADDRLP4 212
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
ADDRLP4 180+4
INDIRF4
GEF4 $1517
line 3708
;3708:				if (bs->origin[2] < mins[2]) {
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
ADDRLP4 168+8
INDIRF4
GEF4 $1521
line 3709
;3709:					return;
ADDRGP4 $1508
JUMPV
LABELV $1521
line 3711
;3710:				}
;3711:			}
LABELV $1517
line 3712
;3712:		}
LABELV $1515
line 3713
;3713:		shootbutton = qfalse;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 3715
;3714:		// if an enemy is below this bounding box then shoot the button
;3715:		for (i = 0; i < level.maxclients; i++) {
ADDRLP4 140
CNSTI4 0
ASGNI4
ADDRGP4 $1527
JUMPV
LABELV $1524
line 3717
;3716:
;3717:			if (i == bs->client)
ADDRLP4 140
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $1529
line 3718
;3718:				continue;
ADDRGP4 $1525
JUMPV
LABELV $1529
line 3720
;3719:			//
;3720:			BotEntityInfo(i, &entinfo);
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 3722
;3721:			//
;3722:			if (!entinfo.valid)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1531
line 3723
;3723:				continue;
ADDRGP4 $1525
JUMPV
LABELV $1531
line 3725
;3724:			// if the enemy isn't dead and the enemy isn't the bot self
;3725:			if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum)
ADDRLP4 0
ARGP4
ADDRLP4 212
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 0
NEI4 $1536
ADDRLP4 0+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $1533
LABELV $1536
line 3726
;3726:				continue;
ADDRGP4 $1525
JUMPV
LABELV $1533
line 3728
;3727:			//
;3728:			if (entinfo.origin[0] > mins[0] && entinfo.origin[0] < maxs[0]) {
ADDRLP4 0+24
INDIRF4
ADDRLP4 168
INDIRF4
LEF4 $1537
ADDRLP4 0+24
INDIRF4
ADDRLP4 180
INDIRF4
GEF4 $1537
line 3729
;3729:				if (entinfo.origin[1] > mins[1] && entinfo.origin[1] < maxs[1]) {
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 168+4
INDIRF4
LEF4 $1541
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 180+4
INDIRF4
GEF4 $1541
line 3730
;3730:					if (entinfo.origin[2] < mins[2]) {
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 168+8
INDIRF4
GEF4 $1549
line 3732
;3731:						// if there's a team mate below the crusher
;3732:						if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 140
INDIRI4
ARGI4
ADDRLP4 216
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 216
INDIRI4
CNSTI4 0
EQI4 $1554
line 3733
;3733:							shootbutton = qfalse;
ADDRLP4 144
CNSTI4 0
ASGNI4
line 3734
;3734:							break;
ADDRGP4 $1526
JUMPV
LABELV $1554
line 3735
;3735:						} else {
line 3736
;3736:							shootbutton = qtrue;
ADDRLP4 144
CNSTI4 1
ASGNI4
line 3737
;3737:						}
line 3738
;3738:					}
LABELV $1549
line 3739
;3739:				}
LABELV $1541
line 3740
;3740:			}
LABELV $1537
line 3741
;3741:		}
LABELV $1525
line 3715
ADDRLP4 140
ADDRLP4 140
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1527
ADDRLP4 140
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $1524
LABELV $1526
line 3742
;3742:		if (shootbutton) {
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $1510
line 3743
;3743:			bs->flags |= BFL_IDEALVIEWSET;
ADDRLP4 212
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 212
INDIRP4
ADDRLP4 212
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 3744
;3744:			VectorSubtract(buttonorg, bs->eye, dir);
ADDRLP4 216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
ADDRLP4 192
INDIRF4
ADDRLP4 216
INDIRP4
CNSTI4 4936
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 148+4
ADDRLP4 192+4
INDIRF4
ADDRLP4 216
INDIRP4
CNSTI4 4940
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 148+8
ADDRLP4 192+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4944
ADDP4
INDIRF4
SUBF4
ASGNF4
line 3745
;3745:			vectoangles(dir, bs->ideal_viewangles);
ADDRLP4 148
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 3746
;3746:			aim_accuracy = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_AIM_ACCURACY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 220
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 160
ADDRLP4 220
INDIRF4
ASGNF4
line 3747
;3747:			bs->ideal_viewangles[PITCH] += 8 * crandom() * (1 - aim_accuracy);
ADDRLP4 224
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 228
ADDRFP4 0
INDIRP4
CNSTI4 6576
ADDP4
ASGNP4
ADDRLP4 228
INDIRP4
ADDRLP4 228
INDIRP4
INDIRF4
ADDRLP4 224
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
CNSTF4 1090519040
MULF4
CNSTF4 1065353216
ADDRLP4 160
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3748
;3748:			bs->ideal_viewangles[PITCH] = AngleMod(bs->ideal_viewangles[PITCH]);
ADDRLP4 232
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 232
INDIRP4
CNSTI4 6576
ADDP4
INDIRF4
ARGF4
ADDRLP4 236
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 232
INDIRP4
CNSTI4 6576
ADDP4
ADDRLP4 236
INDIRF4
ASGNF4
line 3749
;3749:			bs->ideal_viewangles[YAW] += 8 * crandom() * (1 - aim_accuracy);
ADDRLP4 240
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 244
ADDRFP4 0
INDIRP4
CNSTI4 6580
ADDP4
ASGNP4
ADDRLP4 244
INDIRP4
ADDRLP4 244
INDIRP4
INDIRF4
ADDRLP4 240
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
CNSTF4 1090519040
MULF4
CNSTF4 1065353216
ADDRLP4 160
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 3750
;3750:			bs->ideal_viewangles[YAW] = AngleMod(bs->ideal_viewangles[YAW]);
ADDRLP4 248
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 6580
ADDP4
INDIRF4
ARGF4
ADDRLP4 252
ADDRGP4 AngleMod
CALLF4
ASGNF4
ADDRLP4 248
INDIRP4
CNSTI4 6580
ADDP4
ADDRLP4 252
INDIRF4
ASGNF4
line 3752
;3751:			//
;3752:			if (InFieldOfVision(bs->viewangles, 20, bs->ideal_viewangles)) {
ADDRLP4 256
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 256
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1101004800
ARGF4
ADDRLP4 256
INDIRP4
CNSTI4 6576
ADDP4
ARGP4
ADDRLP4 260
ADDRGP4 InFieldOfVision
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
EQI4 $1510
line 3753
;3753:				trap_EA_Attack(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Attack
CALLV
pop
line 3754
;3754:			}
line 3755
;3755:		}
line 3756
;3756:	} else if (!Q_stricmp(mapname, "mpq3tourney6")) {
ADDRGP4 $1510
JUMPV
LABELV $1509
ADDRGP4 mapname
ARGP4
ADDRGP4 $1566
ARGP4
ADDRLP4 168
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 0
NEI4 $1564
line 3758
;3757:		// NOTE: NEVER use the func_bobbing in mpq3tourney6
;3758:		bs->tfl &= ~TFL_FUNCBOB;
ADDRLP4 172
ADDRFP4 0
INDIRP4
CNSTI4 5976
ADDP4
ASGNP4
ADDRLP4 172
INDIRP4
ADDRLP4 172
INDIRP4
INDIRI4
CNSTI4 -16777217
BANDI4
ASGNI4
line 3759
;3759:	}
LABELV $1564
LABELV $1510
line 3760
;3760:}
LABELV $1508
endproc BotMapScripts 264 16
data
align 4
LABELV VEC_UP
byte 4 0
byte 4 3212836864
byte 4 0
align 4
LABELV MOVEDIR_UP
byte 4 0
byte 4 0
byte 4 1065353216
align 4
LABELV VEC_DOWN
byte 4 0
byte 4 3221225472
byte 4 0
align 4
LABELV MOVEDIR_DOWN
byte 4 0
byte 4 0
byte 4 3212836864
export BotSetMovedir
code
proc BotSetMovedir 8 16
line 3773
;3761:
;3762:/*
;3763:==================
;3764:BotSetMovedir
;3765:==================
;3766:*/
;3767:// bk001205 - made these static
;3768:static vec3_t VEC_UP       = {0, -1, 0};
;3769:static vec3_t MOVEDIR_UP   = {0, 0, 1};
;3770:static vec3_t VEC_DOWN     = {0, -2, 0};
;3771:static vec3_t MOVEDIR_DOWN = {0, 0, -1};
;3772:
;3773:void          BotSetMovedir(vec3_t angles, vec3_t movedir) {
line 3774
;3774:			 if (VectorCompare(angles, VEC_UP)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VEC_UP
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $1568
line 3775
;3775:				 VectorCopy(MOVEDIR_UP, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_UP
INDIRB
ASGNB 12
line 3776
;3776:    } else if (VectorCompare(angles, VEC_DOWN)) {
ADDRGP4 $1569
JUMPV
LABELV $1568
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 VEC_DOWN
ARGP4
ADDRLP4 4
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $1570
line 3777
;3777:				 VectorCopy(MOVEDIR_DOWN, movedir);
ADDRFP4 4
INDIRP4
ADDRGP4 MOVEDIR_DOWN
INDIRB
ASGNB 12
line 3778
;3778:    } else {
ADDRGP4 $1571
JUMPV
LABELV $1570
line 3779
;3779:				 AngleVectors(angles, movedir, NULL, NULL);
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
line 3780
;3780:    }
LABELV $1571
LABELV $1569
line 3781
;3781:}
LABELV $1567
endproc BotSetMovedir 8 16
export BotModelMinsMaxs
proc BotModelMinsMaxs 40 0
line 3790
;3782:
;3783:/*
;3784:==================
;3785:BotModelMinsMaxs
;3786:
;3787:this is ugly
;3788:==================
;3789:*/
;3790:int BotModelMinsMaxs(int modelindex, int eType, int contents, vec3_t mins, vec3_t maxs) {
line 3794
;3791:	gentity_t* ent;
;3792:	int        i;
;3793:
;3794:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 3795
;3795:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $1576
JUMPV
LABELV $1573
line 3796
;3796:		if (!ent->inuse) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1578
line 3797
;3797:			continue;
ADDRGP4 $1574
JUMPV
LABELV $1578
line 3799
;3798:		}
;3799:		if (eType && ent->s.eType != eType) {
ADDRLP4 8
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1580
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $1580
line 3800
;3800:			continue;
ADDRGP4 $1574
JUMPV
LABELV $1580
line 3802
;3801:		}
;3802:		if (contents && ent->r.contents != contents) {
ADDRLP4 12
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $1582
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1582
line 3803
;3803:			continue;
ADDRGP4 $1574
JUMPV
LABELV $1582
line 3805
;3804:		}
;3805:		if (ent->s.modelindex == modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $1584
line 3806
;3806:			if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1586
line 3807
;3807:				VectorAdd(ent->r.currentOrigin, ent->r.mins, mins);
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $1586
line 3808
;3808:			if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1588
line 3809
;3809:				VectorAdd(ent->r.currentOrigin, ent->r.maxs, maxs);
ADDRFP4 16
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
LABELV $1588
line 3810
;3810:			return i;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $1572
JUMPV
LABELV $1584
line 3812
;3811:		}
;3812:	}
LABELV $1574
line 3795
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
LABELV $1576
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $1573
line 3813
;3813:	if (mins)
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1590
line 3814
;3814:		VectorClear(mins);
ADDRFP4 12
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
LABELV $1590
line 3815
;3815:	if (maxs)
ADDRFP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1592
line 3816
;3816:		VectorClear(maxs);
ADDRFP4 16
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
LABELV $1592
line 3817
;3817:	return 0;
CNSTI4 0
RETI4
LABELV $1572
endproc BotModelMinsMaxs 40 0
data
align 4
LABELV $1595
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $1596
byte 4 3212836864
byte 4 3212836864
byte 4 3212836864
export BotFuncButtonActivateGoal
code
proc BotFuncButtonActivateGoal 628 28
line 3825
;3818:}
;3819:
;3820:/*
;3821:==================
;3822:BotFuncButtonGoal
;3823:==================
;3824:*/
;3825:int BotFuncButtonActivateGoal(bot_state_t* bs, int bspent, bot_activategoal_t* activategoal) {
line 3831
;3826:	int         i, areas[10], numareas, modelindex, entitynum;
;3827:	char        model[128];
;3828:	float       lip, dist, health, angle;
;3829:	vec3_t      size, start, end, mins, maxs, angles, points[10];
;3830:	vec3_t      movedir, origin, goalorigin, bboxmins, bboxmaxs;
;3831:	vec3_t      extramins = {1, 1, 1}, extramaxs = {-1, -1, -1};
ADDRLP4 304
ADDRGP4 $1595
INDIRB
ASGNB 12
ADDRLP4 316
ADDRGP4 $1596
INDIRB
ASGNB 12
line 3834
;3832:	bsp_trace_t bsptrace;
;3833:
;3834:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 3835
;3835:	VectorClear(activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 84
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 88
ADDP4
CNSTF4 0
ASGNF4
line 3837
;3836:	// create a bot goal towards the button
;3837:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $271
ARGP4
ADDRLP4 160
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3838
;3838:	if (!*model)
ADDRLP4 160
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1597
line 3839
;3839:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1594
JUMPV
LABELV $1597
line 3840
;3840:	modelindex = atoi(model + 1);
ADDRLP4 160+1
ARGP4
ADDRLP4 560
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 288
ADDRLP4 560
INDIRI4
ASGNI4
line 3841
;3841:	if (!modelindex)
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $1600
line 3842
;3842:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1594
JUMPV
LABELV $1600
line 3843
;3843:	VectorClear(angles);
ADDRLP4 96
CNSTF4 0
ASGNF4
ADDRLP4 96+4
CNSTF4 0
ASGNF4
ADDRLP4 96+8
CNSTF4 0
ASGNF4
line 3844
;3844:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
ADDRLP4 288
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 72
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 564
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 344
ADDRLP4 564
INDIRI4
ASGNI4
line 3846
;3845:	// get the lip of the button
;3846:	trap_AAS_FloatForBSPEpairKey(bspent, "lip", &lip);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1604
ARGP4
ADDRLP4 328
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3847
;3847:	if (!lip)
ADDRLP4 328
INDIRF4
CNSTF4 0
NEF4 $1605
line 3848
;3848:		lip = 4;
ADDRLP4 328
CNSTF4 1082130432
ASGNF4
LABELV $1605
line 3850
;3849:	// get the move direction from the angle
;3850:	trap_AAS_FloatForBSPEpairKey(bspent, "angle", &angle);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1607
ARGP4
ADDRLP4 352
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3851
;3851:	VectorSet(angles, 0, angle, 0);
ADDRLP4 96
CNSTF4 0
ASGNF4
ADDRLP4 96+4
ADDRLP4 352
INDIRF4
ASGNF4
ADDRLP4 96+8
CNSTF4 0
ASGNF4
line 3852
;3852:	BotSetMovedir(angles, movedir);
ADDRLP4 96
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 BotSetMovedir
CALLV
pop
line 3854
;3853:	// button size
;3854:	VectorSubtract(maxs, mins, size);
ADDRLP4 112
ADDRLP4 84
INDIRF4
ADDRLP4 72
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 72+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 112+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 72+8
INDIRF4
SUBF4
ASGNF4
line 3856
;3855:	// button origin
;3856:	VectorAdd(mins, maxs, origin);
ADDRLP4 16
ADDRLP4 72
INDIRF4
ADDRLP4 84
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 72+4
INDIRF4
ADDRLP4 84+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 72+8
INDIRF4
ADDRLP4 84+8
INDIRF4
ADDF4
ASGNF4
line 3857
;3857:	VectorScale(origin, 0.5, origin);
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3859
;3858:	// touch distance of the button
;3859:	dist = fabs(movedir[0]) * size[0] + fabs(movedir[1]) * size[1] + fabs(movedir[2]) * size[2];
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 568
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4+4
INDIRF4
ARGF4
ADDRLP4 572
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 4+8
INDIRF4
ARGF4
ADDRLP4 576
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 568
INDIRF4
ADDRLP4 112
INDIRF4
MULF4
ADDRLP4 572
INDIRF4
ADDRLP4 112+4
INDIRF4
MULF4
ADDF4
ADDRLP4 576
INDIRF4
ADDRLP4 112+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 3860
;3860:	dist *= 0.5;
ADDRLP4 28
ADDRLP4 28
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 3862
;3861:	//
;3862:	trap_AAS_FloatForBSPEpairKey(bspent, "health", &health);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $1630
ARGP4
ADDRLP4 348
ARGP4
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
pop
line 3864
;3863:	// if the button is shootable
;3864:	if (health) {
ADDRLP4 348
INDIRF4
CNSTF4 0
EQF4 $1631
line 3866
;3865:		// calculate the shoot target
;3866:		VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 580
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 580
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 580
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3868
;3867:		//
;3868:		VectorCopy(goalorigin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 124
INDIRB
ASGNB 12
line 3869
;3869:		activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 3871
;3870:		//
;3871:		BotAI_Trace(&bsptrace, bs->eye, NULL, NULL, goalorigin, bs->entitynum, MASK_SHOT);
ADDRLP4 356
ARGP4
ADDRLP4 584
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 584
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 124
ARGP4
ADDRLP4 584
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 3873
;3872:		// if the button is visible from the current position
;3873:		if (bsptrace.fraction >= 1.0 || bsptrace.ent == entitynum) {
ADDRLP4 356+8
INDIRF4
CNSTF4 1065353216
GEF4 $1643
ADDRLP4 356+80
INDIRI4
ADDRLP4 344
INDIRI4
NEI4 $1639
LABELV $1643
line 3875
;3874:			//
;3875:			activategoal->goal.entitynum = entitynum;  // NOTE: this is the entity number of the shootable button
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3876
;3876:			activategoal->goal.number    = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3877
;3877:			activategoal->goal.flags     = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3878
;3878:			VectorCopy(bs->origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 3879
;3879:			activategoal->goal.areanum = bs->areanum;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 3880
;3880:			VectorSet(activategoal->goal.mins, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 3238002688
ASGNF4
line 3881
;3881:			VectorSet(activategoal->goal.maxs, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ASGNF4
line 3883
;3882:			//
;3883:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1594
JUMPV
LABELV $1639
line 3884
;3884:		} else {
line 3887
;3885:			// create a goal from where the button is visible and shoot at the button from there
;3886:			// add bounding box size to the dist
;3887:			trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 3888
;3888:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1644
line 3889
;3889:				if (movedir[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1648
line 3890
;3890:					dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 588
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 592
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 588
INDIRF4
ADDRLP4 592
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1649
JUMPV
LABELV $1648
line 3892
;3891:				else
;3892:					dist += fabs(movedir[i]) * fabs(bboxmins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 596
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 600
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 596
INDIRF4
ADDRLP4 600
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1649
line 3893
;3893:			}
LABELV $1645
line 3888
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1644
line 3895
;3894:			// calculate the goal origin
;3895:			VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 588
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 588
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3897
;3896:			//
;3897:			VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 3898
;3898:			start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3899
;3899:			VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 3900
;3900:			end[2] -= 512;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1140850688
SUBF4
ASGNF4
line 3901
;3901:			numareas = trap_AAS_TraceAreas(start, end, areas, points, 10);
ADDRLP4 292
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 440
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 592
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 592
INDIRI4
ASGNI4
line 3903
;3902:			//
;3903:			for (i = numareas - 1; i >= 0; i--) {
ADDRLP4 0
ADDRLP4 108
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $1661
JUMPV
LABELV $1658
line 3904
;3904:				if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 596
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 596
INDIRI4
CNSTI4 0
EQI4 $1662
line 3905
;3905:					break;
ADDRGP4 $1660
JUMPV
LABELV $1662
line 3907
;3906:				}
;3907:			}
LABELV $1659
line 3903
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1661
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1658
LABELV $1660
line 3908
;3908:			if (i < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1664
line 3910
;3909:				// FIXME: trace forward and maybe in other directions to find a valid area
;3910:			}
LABELV $1664
line 3911
;3911:			if (i >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1666
line 3913
;3912:				//
;3913:				VectorCopy(points[i], activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 440
ADDP4
INDIRB
ASGNB 12
line 3914
;3914:				activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ASGNI4
line 3915
;3915:				VectorSet(activategoal->goal.mins, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1090519040
ASGNF4
line 3916
;3916:				VectorSet(activategoal->goal.maxs, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 3238002688
ASGNF4
line 3918
;3917:				//
;3918:				for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1668
line 3919
;3919:					if (movedir[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1672
line 3920
;3920:						activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 600
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 316
ADDP4
INDIRF4
ARGF4
ADDRLP4 604
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 608
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 608
INDIRP4
ADDRLP4 608
INDIRP4
INDIRF4
ADDRLP4 600
INDIRF4
ADDRLP4 604
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1673
JUMPV
LABELV $1672
line 3922
;3921:					else
;3922:						activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 616
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 304
ADDP4
INDIRF4
ARGF4
ADDRLP4 620
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 624
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ASGNP4
ADDRLP4 624
INDIRP4
ADDRLP4 624
INDIRP4
INDIRF4
ADDRLP4 616
INDIRF4
ADDRLP4 620
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1673
line 3923
;3923:				}  // end for
LABELV $1669
line 3918
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1668
line 3925
;3924:				//
;3925:				activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3926
;3926:				activategoal->goal.number    = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3927
;3927:				activategoal->goal.flags     = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3928
;3928:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1594
JUMPV
LABELV $1666
line 3930
;3929:			}
;3930:		}
line 3931
;3931:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1594
JUMPV
LABELV $1631
line 3932
;3932:	} else {
line 3934
;3933:		// add bounding box size to the dist
;3934:		trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, bboxmins, bboxmaxs);
CNSTI4 4
ARGI4
ADDRLP4 136
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 3935
;3935:		for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1674
line 3936
;3936:			if (movedir[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1678
line 3937
;3937:				dist += fabs(movedir[i]) * fabs(bboxmaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 580
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
ADDP4
INDIRF4
ARGF4
ADDRLP4 584
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 580
INDIRF4
ADDRLP4 584
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1679
JUMPV
LABELV $1678
line 3939
;3938:			else
;3939:				dist += fabs(movedir[i]) * fabs(bboxmins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 588
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 136
ADDP4
INDIRF4
ARGF4
ADDRLP4 592
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 28
ADDRLP4 28
INDIRF4
ADDRLP4 588
INDIRF4
ADDRLP4 592
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1679
line 3940
;3940:		}
LABELV $1675
line 3935
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1674
line 3942
;3941:		// calculate the goal origin
;3942:		VectorMA(origin, -dist, movedir, goalorigin);
ADDRLP4 580
ADDRLP4 28
INDIRF4
NEGF4
ASGNF4
ADDRLP4 124
ADDRLP4 16
INDIRF4
ADDRLP4 4
INDIRF4
ADDRLP4 580
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 4+4
INDIRF4
ADDRLP4 580
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 124+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 4+8
INDIRF4
ADDRLP4 28
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 3944
;3943:		//
;3944:		VectorCopy(goalorigin, start);
ADDRLP4 292
ADDRLP4 124
INDIRB
ASGNB 12
line 3945
;3945:		start[2] += 24;
ADDRLP4 292+8
ADDRLP4 292+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 3946
;3946:		VectorCopy(start, end);
ADDRLP4 332
ADDRLP4 292
INDIRB
ASGNB 12
line 3947
;3947:		end[2] -= 100;
ADDRLP4 332+8
ADDRLP4 332+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 3948
;3948:		numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 292
ARGP4
ADDRLP4 332
ARGP4
ADDRLP4 32
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 584
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 108
ADDRLP4 584
INDIRI4
ASGNI4
line 3950
;3949:		//
;3950:		for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1691
JUMPV
LABELV $1688
line 3951
;3951:			if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ARGI4
ADDRLP4 588
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 0
EQI4 $1692
line 3952
;3952:				break;
ADDRGP4 $1690
JUMPV
LABELV $1692
line 3954
;3953:			}
;3954:		}
LABELV $1689
line 3950
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1691
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $1688
LABELV $1690
line 3955
;3955:		if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
GEI4 $1694
line 3957
;3956:			//
;3957:			VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 16
INDIRB
ASGNB 12
line 3958
;3958:			activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 32
ADDP4
INDIRI4
ASGNI4
line 3959
;3959:			VectorSubtract(mins, origin, activategoal->goal.mins);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 72+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 72+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 3960
;3960:			VectorSubtract(maxs, origin, activategoal->goal.maxs);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 84
INDIRF4
ADDRLP4 16
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 84+4
INDIRF4
ADDRLP4 16+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 84+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
ASGNF4
line 3962
;3961:			//
;3962:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1704
line 3963
;3963:				if (movedir[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $1708
line 3964
;3964:					activategoal->goal.maxs[i] += fabs(movedir[i]) * fabs(extramaxs[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 592
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 316
ADDP4
INDIRF4
ARGF4
ADDRLP4 596
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 600
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDP4
ASGNP4
ADDRLP4 600
INDIRP4
ADDRLP4 600
INDIRP4
INDIRF4
ADDRLP4 592
INDIRF4
ADDRLP4 596
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRGP4 $1709
JUMPV
LABELV $1708
line 3966
;3965:				else
;3966:					activategoal->goal.mins[i] += fabs(movedir[i]) * fabs(extramins[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 608
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 304
ADDP4
INDIRF4
ARGF4
ADDRLP4 612
ADDRGP4 fabs
CALLF4
ASGNF4
ADDRLP4 616
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDP4
ASGNP4
ADDRLP4 616
INDIRP4
ADDRLP4 616
INDIRP4
INDIRF4
ADDRLP4 608
INDIRF4
ADDRLP4 612
INDIRF4
MULF4
ADDF4
ASGNF4
LABELV $1709
line 3967
;3967:			}  // end for
LABELV $1705
line 3962
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $1704
line 3969
;3968:			//
;3969:			activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 344
INDIRI4
ASGNI4
line 3970
;3970:			activategoal->goal.number    = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 3971
;3971:			activategoal->goal.flags     = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 3972
;3972:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1594
JUMPV
LABELV $1694
line 3974
;3973:		}
;3974:	}
line 3975
;3975:	return qfalse;
CNSTI4 0
RETI4
LABELV $1594
endproc BotFuncButtonActivateGoal 628 28
export BotFuncDoorActivateGoal
proc BotFuncDoorActivateGoal 1076 20
line 3983
;3976:}
;3977:
;3978:/*
;3979:==================
;3980:BotFuncDoorGoal
;3981:==================
;3982:*/
;3983:int BotFuncDoorActivateGoal(bot_state_t* bs, int bspent, bot_activategoal_t* activategoal) {
line 3990
;3984:	int    modelindex, entitynum;
;3985:	char   model[MAX_INFO_STRING];
;3986:	vec3_t mins, maxs, origin;
;3987:	// vec3_t angles;
;3988:
;3989:	// shoot at the shootable door
;3990:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $271
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 3991
;3991:	if (!*model)
ADDRLP4 12
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1711
line 3992
;3992:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1710
JUMPV
LABELV $1711
line 3993
;3993:	modelindex = atoi(model + 1);
ADDRLP4 12+1
ARGP4
ADDRLP4 1068
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1060
ADDRLP4 1068
INDIRI4
ASGNI4
line 3994
;3994:	if (!modelindex)
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $1714
line 3995
;3995:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1710
JUMPV
LABELV $1714
line 3997
;3996:	// VectorClear(angles);
;3997:	entitynum = BotModelMinsMaxs(modelindex, ET_MOVER, 0, mins, maxs);
ADDRLP4 1060
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1048
ARGP4
ADDRLP4 1072
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1072
INDIRI4
ASGNI4
line 3999
;3998:	// door origin
;3999:	VectorAdd(mins, maxs, origin);
ADDRLP4 0
ADDRLP4 1036
INDIRF4
ADDRLP4 1048
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 1036+4
INDIRF4
ADDRLP4 1048+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 1036+8
INDIRF4
ADDRLP4 1048+8
INDIRF4
ADDF4
ASGNF4
line 4000
;4000:	VectorScale(origin, 0.5, origin);
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 4001
;4001:	VectorCopy(origin, activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
ADDRLP4 0
INDIRB
ASGNB 12
line 4002
;4002:	activategoal->shoot = qtrue;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 1
ASGNI4
line 4004
;4003:	//
;4004:	activategoal->goal.entitynum = entitynum;  // NOTE: this is the entity number of the shootable door
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 1064
INDIRI4
ASGNI4
line 4005
;4005:	activategoal->goal.number    = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4006
;4006:	activategoal->goal.flags     = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4007
;4007:	VectorCopy(bs->origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 4008
;4008:	activategoal->goal.areanum = bs->areanum;
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 4009
;4009:	VectorSet(activategoal->goal.mins, -8, -8, -8);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 3238002688
ASGNF4
line 4010
;4010:	VectorSet(activategoal->goal.maxs, 8, 8, 8);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 1090519040
ASGNF4
line 4011
;4011:	return qtrue;
CNSTI4 1
RETI4
LABELV $1710
endproc BotFuncDoorActivateGoal 1076 20
export BotTriggerMultipleActivateGoal
proc BotTriggerMultipleActivateGoal 272 20
line 4019
;4012:}
;4013:
;4014:/*
;4015:==================
;4016:BotTriggerMultipleGoal
;4017:==================
;4018:*/
;4019:int BotTriggerMultipleActivateGoal(bot_state_t* bs, int bspent, bot_activategoal_t* activategoal) {
line 4026
;4020:	int    i, areas[10], numareas, modelindex, entitynum;
;4021:	char   model[128];
;4022:	vec3_t start, end, mins, maxs;
;4023:	// vec3_t angles;
;4024:	vec3_t origin, goalorigin;
;4025:
;4026:	activategoal->shoot = qfalse;
ADDRFP4 8
INDIRP4
CNSTI4 72
ADDP4
CNSTI4 0
ASGNI4
line 4027
;4027:	VectorClear(activategoal->target);
ADDRFP4 8
INDIRP4
CNSTI4 80
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 84
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 88
ADDP4
CNSTF4 0
ASGNF4
line 4029
;4028:	// create a bot goal towards the trigger
;4029:	trap_AAS_ValueForBSPEpairKey(bspent, "model", model, sizeof(model));
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $271
ARGP4
ADDRLP4 84
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4030
;4030:	if (!*model)
ADDRLP4 84
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1727
line 4031
;4031:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1726
JUMPV
LABELV $1727
line 4032
;4032:	modelindex = atoi(model + 1);
ADDRLP4 84+1
ARGP4
ADDRLP4 256
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 224
ADDRLP4 256
INDIRI4
ASGNI4
line 4033
;4033:	if (!modelindex)
ADDRLP4 224
INDIRI4
CNSTI4 0
NEI4 $1730
line 4034
;4034:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1726
JUMPV
LABELV $1730
line 4036
;4035:	// VectorClear(angles);
;4036:	entitynum = BotModelMinsMaxs(modelindex, 0, CONTENTS_TRIGGER, mins, maxs);
ADDRLP4 224
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1073741824
ARGI4
ADDRLP4 60
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 260
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 252
ADDRLP4 260
INDIRI4
ASGNI4
line 4038
;4037:	// trigger origin
;4038:	VectorAdd(mins, maxs, origin);
ADDRLP4 4
ADDRLP4 60
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 60+4
INDIRF4
ADDRLP4 72+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 60+8
INDIRF4
ADDRLP4 72+8
INDIRF4
ADDF4
ASGNF4
line 4039
;4039:	VectorScale(origin, 0.5, origin);
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 4040
;4040:	VectorCopy(origin, goalorigin);
ADDRLP4 240
ADDRLP4 4
INDIRB
ASGNB 12
line 4042
;4041:	//
;4042:	VectorCopy(goalorigin, start);
ADDRLP4 212
ADDRLP4 240
INDIRB
ASGNB 12
line 4043
;4043:	start[2] += 24;
ADDRLP4 212+8
ADDRLP4 212+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 4044
;4044:	VectorCopy(start, end);
ADDRLP4 228
ADDRLP4 212
INDIRB
ASGNB 12
line 4045
;4045:	end[2] -= 100;
ADDRLP4 228+8
ADDRLP4 228+8
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 4046
;4046:	numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 212
ARGP4
ADDRLP4 228
ARGP4
ADDRLP4 20
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 264
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 264
INDIRI4
ASGNI4
line 4048
;4047:	//
;4048:	for (i = 0; i < numareas; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1747
JUMPV
LABELV $1744
line 4049
;4049:		if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
ARGI4
ADDRLP4 268
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $1748
line 4050
;4050:			break;
ADDRGP4 $1746
JUMPV
LABELV $1748
line 4052
;4051:		}
;4052:	}
LABELV $1745
line 4048
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1747
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $1744
LABELV $1746
line 4053
;4053:	if (i < numareas) {
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRI4
GEI4 $1750
line 4054
;4054:		VectorCopy(origin, activategoal->goal.origin);
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRB
ASGNB 12
line 4055
;4055:		activategoal->goal.areanum = areas[i];
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
ADDP4
INDIRI4
ASGNI4
line 4056
;4056:		VectorSubtract(mins, origin, activategoal->goal.mins);
ADDRFP4 8
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 60
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 60+4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 60+8
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 4057
;4057:		VectorSubtract(maxs, origin, activategoal->goal.maxs);
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 72
INDIRF4
ADDRLP4 4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 72+4
INDIRF4
ADDRLP4 4+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 72+8
INDIRF4
ADDRLP4 4+8
INDIRF4
SUBF4
ASGNF4
line 4059
;4058:		//
;4059:		activategoal->goal.entitynum = entitynum;
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 252
INDIRI4
ASGNI4
line 4060
;4060:		activategoal->goal.number    = 0;
ADDRFP4 8
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 4061
;4061:		activategoal->goal.flags     = 0;
ADDRFP4 8
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 4062
;4062:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1726
JUMPV
LABELV $1750
line 4064
;4063:	}
;4064:	return qfalse;
CNSTI4 0
RETI4
LABELV $1726
endproc BotTriggerMultipleActivateGoal 272 20
export BotPopFromActivateGoalStack
proc BotPopFromActivateGoalStack 4 8
line 4072
;4065:}
;4066:
;4067:/*
;4068:==================
;4069:BotPopFromActivateGoalStack
;4070:==================
;4071:*/
;4072:int BotPopFromActivateGoalStack(bot_state_t* bs) {
line 4073
;4073:	if (!bs->activatestack)
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1761
line 4074
;4074:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1760
JUMPV
LABELV $1761
line 4075
;4075:	BotEnableActivateGoalAreas(bs->activatestack, qtrue);
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4076
;4076:	bs->activatestack->inuse         = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 0
ASGNI4
line 4077
;4077:	bs->activatestack->justused_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 68
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4078
;4078:	bs->activatestack                = bs->activatestack->next;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 7120
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
line 4079
;4079:	return qtrue;
CNSTI4 1
RETI4
LABELV $1760
endproc BotPopFromActivateGoalStack 4 8
export BotPushOntoActivateGoalStack
proc BotPushOntoActivateGoalStack 20 12
line 4087
;4080:}
;4081:
;4082:/*
;4083:==================
;4084:BotPushOntoActivateGoalStack
;4085:==================
;4086:*/
;4087:int BotPushOntoActivateGoalStack(bot_state_t* bs, bot_activategoal_t* activategoal) {
line 4091
;4088:	int   i, best;
;4089:	float besttime;
;4090:
;4091:	best     = -1;
ADDRLP4 8
CNSTI4 -1
ASGNI4
line 4092
;4092:	besttime = FloatTime() + 9999;
ADDRLP4 4
ADDRGP4 floattime
INDIRF4
CNSTF4 1176255488
ADDF4
ASGNF4
line 4094
;4093:	//
;4094:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $1764
line 4095
;4095:		if (!bs->activategoalheap[i].inuse) {
ADDRLP4 0
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1768
line 4096
;4096:			if (bs->activategoalheap[i].justused_time < besttime) {
ADDRLP4 0
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ADDRLP4 4
INDIRF4
GEF4 $1770
line 4097
;4097:				besttime = bs->activategoalheap[i].justused_time;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ASGNF4
line 4098
;4098:				best     = i;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 4099
;4099:			}
LABELV $1770
line 4100
;4100:		}
LABELV $1768
line 4101
;4101:	}
LABELV $1765
line 4094
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 8
LTI4 $1764
line 4102
;4102:	if (best != -1) {
ADDRLP4 8
INDIRI4
CNSTI4 -1
EQI4 $1772
line 4103
;4103:		memcpy(&bs->activategoalheap[best], activategoal, sizeof(bot_activategoal_t));
ADDRLP4 8
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 244
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 4104
;4104:		bs->activategoalheap[best].inuse = qtrue;
ADDRLP4 8
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 1
ASGNI4
line 4105
;4105:		bs->activategoalheap[best].next  = bs->activatestack;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRI4
CNSTI4 244
MULI4
ADDRLP4 12
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 240
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
ASGNP4
line 4106
;4106:		bs->activatestack                = &bs->activategoalheap[best];
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 7120
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 244
MULI4
ADDRLP4 16
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
ASGNP4
line 4107
;4107:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1763
JUMPV
LABELV $1772
line 4109
;4108:	}
;4109:	return qfalse;
CNSTI4 0
RETI4
LABELV $1763
endproc BotPushOntoActivateGoalStack 20 12
export BotClearActivateGoalStack
proc BotClearActivateGoalStack 0 4
line 4117
;4110:}
;4111:
;4112:/*
;4113:==================
;4114:BotClearActivateGoalStack
;4115:==================
;4116:*/
;4117:void BotClearActivateGoalStack(bot_state_t* bs) {
ADDRGP4 $1776
JUMPV
LABELV $1775
line 4119
;4118:	while (bs->activatestack)
;4119:		BotPopFromActivateGoalStack(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotPopFromActivateGoalStack
CALLI4
pop
LABELV $1776
line 4118
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1775
line 4120
;4120:}
LABELV $1774
endproc BotClearActivateGoalStack 0 4
export BotEnableActivateGoalAreas
proc BotEnableActivateGoalAreas 12 8
line 4127
;4121:
;4122:/*
;4123:==================
;4124:BotEnableActivateGoalAreas
;4125:==================
;4126:*/
;4127:void BotEnableActivateGoalAreas(bot_activategoal_t* activategoal, int enable) {
line 4130
;4128:	int i;
;4129:
;4130:	if (activategoal->areasdisabled == !enable)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1782
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $1783
JUMPV
LABELV $1782
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1783
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $1779
line 4131
;4131:		return;
ADDRGP4 $1778
JUMPV
LABELV $1779
line 4132
;4132:	for (i = 0; i < activategoal->numareas; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1787
JUMPV
LABELV $1784
line 4133
;4133:		trap_AAS_EnableRoutingArea(activategoal->areas[i], enable);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 trap_AAS_EnableRoutingArea
CALLI4
pop
LABELV $1785
line 4132
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1787
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
LTI4 $1784
line 4134
;4134:	activategoal->areasdisabled = !enable;
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $1789
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $1790
JUMPV
LABELV $1789
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $1790
ADDRFP4 0
INDIRP4
CNSTI4 236
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 4135
;4135:}
LABELV $1778
endproc BotEnableActivateGoalAreas 12 8
export BotIsGoingToActivateEntity
proc BotIsGoingToActivateEntity 8 0
line 4142
;4136:
;4137:/*
;4138:==================
;4139:BotIsGoingToActivateEntity
;4140:==================
;4141:*/
;4142:int BotIsGoingToActivateEntity(bot_state_t* bs, int entitynum) {
line 4146
;4143:	bot_activategoal_t* a;
;4144:	int                 i;
;4145:
;4146:	for (a = bs->activatestack; a; a = a->next) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $1795
JUMPV
LABELV $1792
line 4147
;4147:		if (a->time < FloatTime())
ADDRLP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $1796
line 4148
;4148:			continue;
ADDRGP4 $1793
JUMPV
LABELV $1796
line 4149
;4149:		if (a->goal.entitynum == entitynum)
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1798
line 4150
;4150:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1791
JUMPV
LABELV $1798
line 4151
;4151:	}
LABELV $1793
line 4146
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 240
ADDP4
INDIRP4
ASGNP4
LABELV $1795
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1792
line 4152
;4152:	for (i = 0; i < MAX_ACTIVATESTACK; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $1800
line 4153
;4153:		if (bs->activategoalheap[i].inuse)
ADDRLP4 4
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1804
line 4154
;4154:			continue;
ADDRGP4 $1801
JUMPV
LABELV $1804
line 4156
;4155:		//
;4156:		if (bs->activategoalheap[i].goal.entitynum == entitynum) {
ADDRLP4 4
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $1806
line 4158
;4157:			// if the bot went for this goal less than 2 seconds ago
;4158:			if (bs->activategoalheap[i].justused_time > FloatTime() - 2)
ADDRLP4 4
INDIRI4
CNSTI4 244
MULI4
ADDRFP4 0
INDIRP4
CNSTI4 7124
ADDP4
ADDP4
CNSTI4 68
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1073741824
SUBF4
LEF4 $1808
line 4159
;4159:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1791
JUMPV
LABELV $1808
line 4160
;4160:		}
LABELV $1806
line 4161
;4161:	}
LABELV $1801
line 4152
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $1800
line 4162
;4162:	return qfalse;
CNSTI4 0
RETI4
LABELV $1791
endproc BotIsGoingToActivateEntity 8 0
export BotGetActivateGoal
proc BotGetActivateGoal 3304 20
line 4175
;4163:}
;4164:
;4165:/*
;4166:==================
;4167:BotGetActivateGoal
;4168:
;4169:  returns the number of the bsp entity to activate
;4170:  goal->entitynum will be set to the game entity to activate
;4171:==================
;4172:*/
;4173://#define OBSTACLEDEBUG
;4174:
;4175:int BotGetActivateGoal(bot_state_t* bs, int entitynum, bot_activategoal_t* activategoal) {
line 4186
;4176:	int              i, ent, cur_entities[10], spawnflags, modelindex, areas[MAX_ACTIVATEAREAS * 2], numareas, t;
;4177:	char             model[MAX_INFO_STRING], tmpmodel[128];
;4178:	char             target[128], classname[128];
;4179:	float            health;
;4180:	char             targetname[10][128];
;4181:	aas_entityinfo_t entinfo;
;4182:	aas_areainfo_t   areainfo;
;4183:	vec3_t           origin, absmins, absmaxs;
;4184:	// vec3_t angles;
;4185:
;4186:	memset(activategoal, 0, sizeof(bot_activategoal_t));
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 244
ARGI4
ADDRGP4 memset
CALLP4
pop
line 4187
;4187:	BotEntityInfo(entitynum, &entinfo);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 3052
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4188
;4188:	Com_sprintf(model, sizeof(model), "*%d", entinfo.modelindex);
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $1811
ARGP4
ADDRLP4 3052+104
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 4189
;4189:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 3240
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3240
INDIRI4
ASGNI4
ADDRGP4 $1816
JUMPV
LABELV $1813
line 4190
;4190:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", tmpmodel, sizeof(tmpmodel)))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $271
ARGP4
ADDRLP4 1584
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3244
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3244
INDIRI4
CNSTI4 0
NEI4 $1817
line 4191
;4191:			continue;
ADDRGP4 $1814
JUMPV
LABELV $1817
line 4192
;4192:		if (!strcmp(model, tmpmodel))
ADDRLP4 1712
ARGP4
ADDRLP4 1584
ARGP4
ADDRLP4 3248
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3248
INDIRI4
CNSTI4 0
NEI4 $1819
line 4193
;4193:			break;
ADDRGP4 $1815
JUMPV
LABELV $1819
line 4194
;4194:	}
LABELV $1814
line 4189
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3244
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3244
INDIRI4
ASGNI4
LABELV $1816
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1813
LABELV $1815
line 4195
;4195:	if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1821
line 4196
;4196:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity found with model %s\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1823
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4197
;4197:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1810
JUMPV
LABELV $1821
line 4199
;4198:	}
;4199:	trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1824
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4200
;4200:	if (!*classname) {
ADDRLP4 1456
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $1825
line 4201
;4201:		BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model %s has no classname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1827
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4202
;4202:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1810
JUMPV
LABELV $1825
line 4205
;4203:	}
;4204:	// if it is a door
;4205:	if (!strcmp(classname, "func_door")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1830
ARGP4
ADDRLP4 3248
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3248
INDIRI4
CNSTI4 0
NEI4 $1828
line 4206
;4206:		if (trap_AAS_FloatForBSPEpairKey(ent, "health", &health)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1630
ARGP4
ADDRLP4 3208
ARGP4
ADDRLP4 3252
ADDRGP4 trap_AAS_FloatForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3252
INDIRI4
CNSTI4 0
EQI4 $1831
line 4208
;4207:			// if the door has health then the door must be shot to open
;4208:			if (health) {
ADDRLP4 3208
INDIRF4
CNSTF4 0
EQF4 $1833
line 4209
;4209:				BotFuncDoorActivateGoal(bs, ent, activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 BotFuncDoorActivateGoal
CALLI4
pop
line 4210
;4210:				return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1810
JUMPV
LABELV $1833
line 4212
;4211:			}
;4212:		}
LABELV $1831
line 4214
;4213:		//
;4214:		trap_AAS_IntForBSPEpairKey(ent, "spawnflags", &spawnflags);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1835
ARGP4
ADDRLP4 3204
ARGP4
ADDRGP4 trap_AAS_IntForBSPEpairKey
CALLI4
pop
line 4216
;4215:		// if the door starts open then just wait for the door to return
;4216:		if (spawnflags & 1)
ADDRLP4 3204
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $1836
line 4217
;4217:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1810
JUMPV
LABELV $1836
line 4219
;4218:		// get the door origin
;4219:		if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin)) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1840
ARGP4
ADDRLP4 3192
ARGP4
ADDRLP4 3256
ADDRGP4 trap_AAS_VectorForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3256
INDIRI4
CNSTI4 0
NEI4 $1838
line 4220
;4220:			VectorClear(origin);
ADDRLP4 3192
CNSTF4 0
ASGNF4
ADDRLP4 3192+4
CNSTF4 0
ASGNF4
ADDRLP4 3192+8
CNSTF4 0
ASGNF4
line 4221
;4221:		}
LABELV $1838
line 4223
;4222:		// if the door is open or opening already
;4223:		if (!VectorCompare(origin, entinfo.origin))
ADDRLP4 3192
ARGP4
ADDRLP4 3052+24
ARGP4
ADDRLP4 3260
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 3260
INDIRI4
CNSTI4 0
NEI4 $1843
line 4224
;4224:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $1810
JUMPV
LABELV $1843
line 4226
;4225:		// store all the areas the door is in
;4226:		trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model));
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $271
ARGP4
ADDRLP4 1712
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4227
;4227:		if (*model) {
ADDRLP4 1712
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $1846
line 4228
;4228:			modelindex = atoi(model + 1);
ADDRLP4 1712+1
ARGP4
ADDRLP4 3264
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 3212
ADDRLP4 3264
INDIRI4
ASGNI4
line 4229
;4229:			if (modelindex) {
ADDRLP4 3212
INDIRI4
CNSTI4 0
EQI4 $1849
line 4231
;4230:				// VectorClear(angles);
;4231:				BotModelMinsMaxs(modelindex, ET_MOVER, 0, absmins, absmaxs);
ADDRLP4 3212
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 3216
ARGP4
ADDRLP4 3228
ARGP4
ADDRGP4 BotModelMinsMaxs
CALLI4
pop
line 4233
;4232:				//
;4233:				numareas = trap_AAS_BBoxAreas(absmins, absmaxs, areas, MAX_ACTIVATEAREAS * 2);
ADDRLP4 3216
ARGP4
ADDRLP4 3228
ARGP4
ADDRLP4 2740
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 3268
ADDRGP4 trap_AAS_BBoxAreas
CALLI4
ASGNI4
ADDRLP4 3048
ADDRLP4 3268
INDIRI4
ASGNI4
line 4235
;4234:				// store the areas with reachabilities first
;4235:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1854
JUMPV
LABELV $1851
line 4236
;4236:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $1855
line 4237
;4237:						break;
ADDRGP4 $1853
JUMPV
LABELV $1855
line 4238
;4238:					if (!trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3272
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
NEI4 $1857
line 4239
;4239:						continue;
ADDRGP4 $1852
JUMPV
LABELV $1857
line 4241
;4240:					}
;4241:					trap_AAS_AreaInfo(areas[i], &areainfo);
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 2996
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 4242
;4242:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1859
line 4243
;4243:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3280
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3276
ADDRLP4 3280
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3280
INDIRP4
ADDRLP4 3276
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4244
;4244:					}
LABELV $1859
line 4245
;4245:				}
LABELV $1852
line 4235
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1854
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $1851
LABELV $1853
line 4247
;4246:				// store any remaining areas
;4247:				for (i = 0; i < numareas; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1864
JUMPV
LABELV $1861
line 4248
;4248:					if (activategoal->numareas >= MAX_ACTIVATEAREAS)
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
CNSTI4 32
LTI4 $1865
line 4249
;4249:						break;
ADDRGP4 $1863
JUMPV
LABELV $1865
line 4250
;4250:					if (trap_AAS_AreaReachability(areas[i])) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 3272
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
EQI4 $1867
line 4251
;4251:						continue;
ADDRGP4 $1862
JUMPV
LABELV $1867
line 4253
;4252:					}
;4253:					trap_AAS_AreaInfo(areas[i], &areainfo);
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ARGI4
ADDRLP4 2996
ARGP4
ADDRGP4 trap_AAS_AreaInfo
CALLI4
pop
line 4254
;4254:					if (areainfo.contents & AREACONTENTS_MOVER) {
ADDRLP4 2996
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $1869
line 4255
;4255:						activategoal->areas[activategoal->numareas++] = areas[i];
ADDRLP4 3280
ADDRFP4 8
INDIRP4
CNSTI4 232
ADDP4
ASGNP4
ADDRLP4 3276
ADDRLP4 3280
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 3280
INDIRP4
ADDRLP4 3276
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
CNSTI4 104
ADDP4
ADDP4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 2740
ADDP4
INDIRI4
ASGNI4
line 4256
;4256:					}
LABELV $1869
line 4257
;4257:				}
LABELV $1862
line 4247
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1864
ADDRLP4 132
INDIRI4
ADDRLP4 3048
INDIRI4
LTI4 $1861
LABELV $1863
line 4258
;4258:			}
LABELV $1849
line 4259
;4259:		}
LABELV $1846
line 4260
;4260:	}
LABELV $1828
line 4262
;4261:	// if the bot is blocked by or standing on top of a button
;4262:	if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1873
ARGP4
ADDRLP4 3252
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3252
INDIRI4
CNSTI4 0
NEI4 $1871
line 4263
;4263:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1810
JUMPV
LABELV $1871
line 4266
;4264:	}
;4265:	// get the targetname so we can find an entity with a matching target
;4266:	if (!trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[0], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1876
ARGP4
ADDRLP4 136
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3256
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3256
INDIRI4
CNSTI4 0
NEI4 $1874
line 4267
;4267:		if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1877
line 4268
;4268:			BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with model \"%s\" has no targetname\n", model);
CNSTI4 3
ARGI4
ADDRGP4 $1880
ARGP4
ADDRLP4 1712
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4269
;4269:		}
LABELV $1877
line 4270
;4270:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $1810
JUMPV
LABELV $1874
line 4273
;4271:	}
;4272:	// allow tree-like activation
;4273:	cur_entities[0] = trap_AAS_NextBSPEntity(0);
CNSTI4 0
ARGI4
ADDRLP4 3260
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 1416
ADDRLP4 3260
INDIRI4
ASGNI4
line 4274
;4274:	for (i = 0; i >= 0 && i < 10;) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $1884
JUMPV
LABELV $1881
line 4275
;4275:		for (ent = cur_entities[i]; ent; ent = trap_AAS_NextBSPEntity(ent)) {
ADDRLP4 0
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $1888
JUMPV
LABELV $1885
line 4276
;4276:			if (!trap_AAS_ValueForBSPEpairKey(ent, "target", target, sizeof(target)))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1891
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3264
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3264
INDIRI4
CNSTI4 0
NEI4 $1889
line 4277
;4277:				continue;
ADDRGP4 $1886
JUMPV
LABELV $1889
line 4278
;4278:			if (!strcmp(targetname[i], target)) {
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 3268
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $1892
line 4279
;4279:				cur_entities[i] = trap_AAS_NextBSPEntity(ent);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3272
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
ADDRLP4 3272
INDIRI4
ASGNI4
line 4280
;4280:				break;
ADDRGP4 $1887
JUMPV
LABELV $1892
line 4282
;4281:			}
;4282:		}
LABELV $1886
line 4275
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 3264
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 3264
INDIRI4
ASGNI4
LABELV $1888
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1885
LABELV $1887
line 4283
;4283:		if (!ent) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1894
line 4284
;4284:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1896
line 4285
;4285:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no entity with target \"%s\"\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $1899
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4286
;4286:			}
LABELV $1896
line 4287
;4287:			i--;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 4288
;4288:			continue;
ADDRGP4 $1882
JUMPV
LABELV $1894
line 4290
;4289:		}
;4290:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", classname, sizeof(classname))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1824
ARGP4
ADDRLP4 1456
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3268
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3268
INDIRI4
CNSTI4 0
NEI4 $1900
line 4291
;4291:			if (bot_developer.integer) {
ADDRGP4 bot_developer+12
INDIRI4
CNSTI4 0
EQI4 $1882
line 4292
;4292:				BotAI_Print(PRT_ERROR, "BotGetActivateGoal: entity with target \"%s\" has no classname\n", targetname[i]);
CNSTI4 3
ARGI4
ADDRGP4 $1905
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136
ADDP4
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4293
;4293:			}
line 4294
;4294:			continue;
ADDRGP4 $1882
JUMPV
LABELV $1900
line 4297
;4295:		}
;4296:		// BSP button model
;4297:		if (!strcmp(classname, "func_button")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1873
ARGP4
ADDRLP4 3272
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3272
INDIRI4
CNSTI4 0
NEI4 $1906
line 4299
;4298:			//
;4299:			if (!BotFuncButtonActivateGoal(bs, ent, activategoal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 3276
ADDRGP4 BotFuncButtonActivateGoal
CALLI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 0
NEI4 $1908
line 4300
;4300:				continue;
ADDRGP4 $1882
JUMPV
LABELV $1908
line 4302
;4301:			// if the bot tries to activate this button already
;4302:			if (bs->activatestack && bs->activatestack->inuse && bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
ADDRLP4 3280
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1910
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1910
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
NEI4 $1910
ADDRLP4 3284
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRLP4 3284
INDIRF4
LEF4 $1910
ADDRLP4 3280
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3284
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $1910
line 4304
;4303:			    bs->activatestack->time > FloatTime() && bs->activatestack->start_time < FloatTime() - 2)
;4304:				continue;
ADDRGP4 $1882
JUMPV
LABELV $1910
line 4306
;4305:			// if the bot is in a reachability area
;4306:			if (trap_AAS_AreaReachability(bs->areanum)) {
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3288
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
EQI4 $1912
line 4308
;4307:				// disable all areas the blocking entity is in
;4308:				BotEnableActivateGoalAreas(activategoal, qfalse);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4310
;4309:				//
;4310:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
ADDRLP4 3292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3292
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3292
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 3292
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 3296
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 2736
ADDRLP4 3296
INDIRI4
ASGNI4
line 4312
;4311:				// if the button is not reachable
;4312:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $1914
line 4313
;4313:					continue;
ADDRGP4 $1882
JUMPV
LABELV $1914
line 4315
;4314:				}
;4315:				activategoal->time = FloatTime() + t * 0.01 + 5;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 2736
INDIRI4
CVIF4 4
CNSTF4 1008981770
MULF4
ADDF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 4316
;4316:			}
LABELV $1912
line 4317
;4317:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1810
JUMPV
LABELV $1906
line 4320
;4318:		}
;4319:		// invisible trigger multiple box
;4320:		else if (!strcmp(classname, "trigger_multiple")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1918
ARGP4
ADDRLP4 3276
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3276
INDIRI4
CNSTI4 0
NEI4 $1916
line 4322
;4321:			//
;4322:			if (!BotTriggerMultipleActivateGoal(bs, ent, activategoal))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 3280
ADDRGP4 BotTriggerMultipleActivateGoal
CALLI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 0
NEI4 $1919
line 4323
;4323:				continue;
ADDRGP4 $1882
JUMPV
LABELV $1919
line 4325
;4324:			// if the bot tries to activate this trigger already
;4325:			if (bs->activatestack && bs->activatestack->inuse && bs->activatestack->goal.entitynum == activategoal->goal.entitynum &&
ADDRLP4 3284
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1921
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $1921
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
NEI4 $1921
ADDRLP4 3288
ADDRGP4 floattime
INDIRF4
ASGNF4
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
ADDRLP4 3288
INDIRF4
LEF4 $1921
ADDRLP4 3284
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CNSTI4 64
ADDP4
INDIRF4
ADDRLP4 3288
INDIRF4
CNSTF4 1073741824
SUBF4
GEF4 $1921
line 4327
;4326:			    bs->activatestack->time > FloatTime() && bs->activatestack->start_time < FloatTime() - 2)
;4327:				continue;
ADDRGP4 $1882
JUMPV
LABELV $1921
line 4329
;4328:			// if the bot is in a reachability area
;4329:			if (trap_AAS_AreaReachability(bs->areanum)) {
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3292
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
EQI4 $1923
line 4331
;4330:				// disable all areas the blocking entity is in
;4331:				BotEnableActivateGoalAreas(activategoal, qfalse);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4333
;4332:				//
;4333:				t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, activategoal->goal.areanum, bs->tfl);
ADDRLP4 3296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 3296
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 3296
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRLP4 3296
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 3300
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 2736
ADDRLP4 3300
INDIRI4
ASGNI4
line 4335
;4334:				// if the trigger is not reachable
;4335:				if (!t) {
ADDRLP4 2736
INDIRI4
CNSTI4 0
NEI4 $1925
line 4336
;4336:					continue;
ADDRGP4 $1882
JUMPV
LABELV $1925
line 4338
;4337:				}
;4338:				activategoal->time = FloatTime() + t * 0.01 + 5;
ADDRFP4 8
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 2736
INDIRI4
CVIF4 4
CNSTF4 1008981770
MULF4
ADDF4
CNSTF4 1084227584
ADDF4
ASGNF4
line 4339
;4339:			}
LABELV $1923
line 4340
;4340:			return ent;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $1810
JUMPV
LABELV $1916
line 4341
;4341:		} else if (!strcmp(classname, "func_timer")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1929
ARGP4
ADDRLP4 3280
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3280
INDIRI4
CNSTI4 0
NEI4 $1927
line 4343
;4342:			// just skip the func_timer
;4343:			continue;
ADDRGP4 $1882
JUMPV
LABELV $1927
line 4346
;4344:		}
;4345:		// the actual button or trigger might be linked through a target_relay or target_delay
;4346:		else if (!strcmp(classname, "target_relay") || !strcmp(classname, "target_delay")) {
ADDRLP4 1456
ARGP4
ADDRGP4 $1932
ARGP4
ADDRLP4 3284
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3284
INDIRI4
CNSTI4 0
EQI4 $1934
ADDRLP4 1456
ARGP4
ADDRGP4 $1933
ARGP4
ADDRLP4 3288
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 3288
INDIRI4
CNSTI4 0
NEI4 $1930
LABELV $1934
line 4347
;4347:			if (trap_AAS_ValueForBSPEpairKey(ent, "targetname", targetname[i + 1], sizeof(targetname[0]))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1876
ARGP4
ADDRLP4 132
INDIRI4
CNSTI4 7
LSHI4
ADDRLP4 136+128
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 3292
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 3292
INDIRI4
CNSTI4 0
EQI4 $1935
line 4348
;4348:				i++;
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4349
;4349:				cur_entities[i] = trap_AAS_NextBSPEntity(0);
CNSTI4 0
ARGI4
ADDRLP4 3296
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1416
ADDP4
ADDRLP4 3296
INDIRI4
ASGNI4
line 4350
;4350:			}
LABELV $1935
line 4351
;4351:		}
LABELV $1930
line 4352
;4352:	}
LABELV $1882
line 4274
LABELV $1884
ADDRLP4 132
INDIRI4
CNSTI4 0
LTI4 $1938
ADDRLP4 132
INDIRI4
CNSTI4 10
LTI4 $1881
LABELV $1938
line 4356
;4353:#ifdef OBSTACLEDEBUG
;4354:	BotAI_Print(PRT_ERROR, "BotGetActivateGoal: no valid activator for entity with target \"%s\"\n", targetname[0]);
;4355:#endif
;4356:	return 0;
CNSTI4 0
RETI4
LABELV $1810
endproc BotGetActivateGoal 3304 20
export BotGoForActivateGoal
proc BotGoForActivateGoal 144 8
line 4364
;4357:}
;4358:
;4359:/*
;4360:==================
;4361:BotGoForActivateGoal
;4362:==================
;4363:*/
;4364:int BotGoForActivateGoal(bot_state_t* bs, bot_activategoal_t* activategoal) {
line 4367
;4365:	aas_entityinfo_t activateinfo;
;4366:
;4367:	activategoal->inuse = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 4368
;4368:	if (!activategoal->time)
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
INDIRF4
CNSTF4 0
NEF4 $1940
line 4369
;4369:		activategoal->time = FloatTime() + 10;
ADDRFP4 4
INDIRP4
CNSTI4 60
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1092616192
ADDF4
ASGNF4
LABELV $1940
line 4370
;4370:	activategoal->start_time = FloatTime();
ADDRFP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4371
;4371:	BotEntityInfo(activategoal->goal.entitynum, &activateinfo);
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4372
;4372:	VectorCopy(activateinfo.origin, activategoal->origin);
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0+24
INDIRB
ASGNB 12
line 4374
;4373:	//
;4374:	if (BotPushOntoActivateGoalStack(bs, activategoal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 BotPushOntoActivateGoalStack
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
EQI4 $1943
line 4376
;4375:		// enter the activate entity AI node
;4376:		AIEnter_Seek_ActivateEntity(bs, "BotGoForActivateGoal");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $1945
ARGP4
ADDRGP4 AIEnter_Seek_ActivateEntity
CALLV
pop
line 4377
;4377:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $1939
JUMPV
LABELV $1943
line 4378
;4378:	} else {
line 4380
;4379:		// enable any routing areas that were disabled
;4380:		BotEnableActivateGoalAreas(activategoal, qtrue);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4381
;4381:		return qfalse;
CNSTI4 0
RETI4
LABELV $1939
endproc BotGoForActivateGoal 144 8
export BotPrintActivateGoalInfo
proc BotPrintActivateGoalInfo 296 36
line 4390
;4382:	}
;4383:}
;4384:
;4385:/*
;4386:==================
;4387:BotPrintActivateGoalInfo
;4388:==================
;4389:*/
;4390:void BotPrintActivateGoalInfo(bot_state_t* bs, bot_activategoal_t* activategoal, int bspent) {
line 4395
;4391:	char netname[MAX_NETNAME];
;4392:	char classname[128];
;4393:	char buf[128];
;4394:
;4395:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 4396
;4396:	trap_AAS_ValueForBSPEpairKey(bspent, "classname", classname, sizeof(classname));
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $1824
ARGP4
ADDRLP4 36
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
pop
line 4397
;4397:	if (activategoal->shoot) {
ADDRFP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1947
line 4398
;4398:		Com_sprintf(
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $1949
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 4401
;4399:			buf, sizeof(buf), "%s: I have to shoot at a %s from %1.1f %1.1f %1.1f in area %d\n", netname, classname, activategoal->goal.origin[0],
;4400:			activategoal->goal.origin[1], activategoal->goal.origin[2], activategoal->goal.areanum);
;4401:	} else {
ADDRGP4 $1948
JUMPV
LABELV $1947
line 4402
;4402:		Com_sprintf(
ADDRLP4 164
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $1950
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 292
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 292
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 4405
;4403:			buf, sizeof(buf), "%s: I have to activate a %s at %1.1f %1.1f %1.1f in area %d\n", netname, classname, activategoal->goal.origin[0],
;4404:			activategoal->goal.origin[1], activategoal->goal.origin[2], activategoal->goal.areanum);
;4405:	}
LABELV $1948
line 4406
;4406:	trap_EA_Say(bs->client, buf);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
ARGP4
ADDRGP4 trap_EA_Say
CALLV
pop
line 4407
;4407:}
LABELV $1946
endproc BotPrintActivateGoalInfo 296 36
export BotRandomMove
proc BotRandomMove 28 16
line 4414
;4408:
;4409:/*
;4410:==================
;4411:BotRandomMove
;4412:==================
;4413:*/
;4414:void BotRandomMove(bot_state_t* bs, bot_moveresult_t* moveresult) {
line 4417
;4415:	vec3_t dir, angles;
;4416:
;4417:	angles[0] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 4418
;4418:	angles[1] = random() * 360;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1010041192
MULF4
ASGNF4
line 4419
;4419:	angles[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4420
;4420:	AngleVectors(angles, dir, NULL, NULL);
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4422
;4421:
;4422:	trap_BotMoveInDirection(bs->ms, dir, 400, MOVE_WALK);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 4424
;4423:
;4424:	moveresult->failure = qfalse;
ADDRFP4 4
INDIRP4
CNSTI4 0
ASGNI4
line 4425
;4425:	VectorCopy(dir, moveresult->movedir);
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 12
INDIRB
ASGNB 12
line 4426
;4426:}
LABELV $1951
endproc BotRandomMove 28 16
data
align 4
LABELV $1955
byte 4 0
byte 4 0
byte 4 1065353216
export BotAIBlocked
code
proc BotAIBlocked 468 16
line 4439
;4427:
;4428:/*
;4429:==================
;4430:BotAIBlocked
;4431:
;4432:Very basic handling of bots being blocked by other entities.
;4433:Check what kind of entity is blocking the bot and try to activate
;4434:it. If that's not an option then try to walk around or over the entity.
;4435:Before the bot ends in this part of the AI it should predict which doors to
;4436:open, which buttons to activate etc.
;4437:==================
;4438:*/
;4439:void BotAIBlocked(bot_state_t* bs, bot_moveresult_t* moveresult, int activate) {
line 4441
;4440:	int                movetype, bspent;
;4441:	vec3_t             hordir, start, /*end, mins, maxs,*/ sideward, angles, up = {0, 0, 1};
ADDRLP4 192
ADDRGP4 $1955
INDIRB
ASGNB 12
line 4446
;4442:	aas_entityinfo_t   entinfo;
;4443:	bot_activategoal_t activategoal;
;4444:
;4445:	// if the bot is not blocked by anything
;4446:	if (!moveresult->blocked) {
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1956
line 4447
;4447:		bs->notblocked_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4448
;4448:		return;
ADDRGP4 $1954
JUMPV
LABELV $1956
line 4451
;4449:	}
;4450:	// if stuck in a solid area
;4451:	if (moveresult->type == RESULTTYPE_INSOLIDAREA) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 8
NEI4 $1958
line 4453
;4452:		// move in a random direction in the hope to get out
;4453:		BotRandomMove(bs, moveresult);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotRandomMove
CALLV
pop
line 4455
;4454:		//
;4455:		return;
ADDRGP4 $1954
JUMPV
LABELV $1958
line 4458
;4456:	}
;4457:	// get info for the entity that is blocking the bot
;4458:	BotEntityInfo(moveresult->blockentity, &entinfo);
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 4464
;4459:#ifdef OBSTACLEDEBUG
;4460:	ClientName(bs->client, netname, sizeof(netname));
;4461:	BotAI_Print(PRT_MESSAGE, "%s: I'm blocked by model %d\n", netname, entinfo.modelindex);
;4462:#endif
;4463:	// if blocked by a bsp model and the bot wants to activate it
;4464:	if (activate && entinfo.modelindex > 0 && entinfo.modelindex <= max_bspmodelindex) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $1960
ADDRLP4 24+104
INDIRI4
CNSTI4 0
LEI4 $1960
ADDRLP4 24+104
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
GTI4 $1960
line 4466
;4465:		// find the bsp entity which should be activated in order to get the blocking entity out of the way
;4466:		bspent = BotGetActivateGoal(bs, entinfo.number, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24+20
INDIRI4
ARGI4
ADDRLP4 204
ARGP4
ADDRLP4 452
ADDRGP4 BotGetActivateGoal
CALLI4
ASGNI4
ADDRLP4 448
ADDRLP4 452
INDIRI4
ASGNI4
line 4467
;4467:		if (bspent) {
ADDRLP4 448
INDIRI4
CNSTI4 0
EQI4 $1965
line 4469
;4468:			//
;4469:			if (bs->activatestack && !bs->activatestack->inuse)
ADDRLP4 456
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 456
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1967
ADDRLP4 456
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $1967
line 4470
;4470:				bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
CNSTP4 0
ASGNP4
LABELV $1967
line 4472
;4471:			// if not already trying to activate this entity
;4472:			if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204+4+40
INDIRI4
ARGI4
ADDRLP4 460
ADDRGP4 BotIsGoingToActivateEntity
CALLI4
ASGNI4
ADDRLP4 460
INDIRI4
CNSTI4 0
NEI4 $1969
line 4474
;4473:				//
;4474:				BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4475
;4475:			}
LABELV $1969
line 4479
;4476:			// if ontop of an obstacle or
;4477:			// if the bot is not in a reachability area it'll still
;4478:			// need some dynamic obstacle avoidance, otherwise return
;4479:			if (!(moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) && trap_AAS_AreaReachability(bs->areanum))
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $1966
ADDRFP4 0
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 464
ADDRGP4 trap_AAS_AreaReachability
CALLI4
ASGNI4
ADDRLP4 464
INDIRI4
CNSTI4 0
EQI4 $1966
line 4480
;4480:				return;
ADDRGP4 $1954
JUMPV
line 4481
;4481:		} else {
LABELV $1965
line 4483
;4482:			// enable any routing areas that were disabled
;4483:			BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 204
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4484
;4484:		}
LABELV $1966
line 4485
;4485:	}
LABELV $1960
line 4487
;4486:	// just some basic dynamic obstacle avoidance code
;4487:	hordir[0] = moveresult->movedir[0];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 4488
;4488:	hordir[1] = moveresult->movedir[1];
ADDRLP4 0+4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ASGNF4
line 4489
;4489:	hordir[2] = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 4491
;4490:	// if no direction just take a random direction
;4491:	if (VectorNormalize(hordir) < 0.1) {
ADDRLP4 0
ARGP4
ADDRLP4 452
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 452
INDIRF4
CNSTF4 1036831949
GEF4 $1977
line 4492
;4492:		VectorSet(angles, 0, 360 * random(), 0);
ADDRLP4 180
CNSTF4 0
ASGNF4
ADDRLP4 456
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 180+4
ADDRLP4 456
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1135869952
MULF4
ASGNF4
ADDRLP4 180+8
CNSTF4 0
ASGNF4
line 4493
;4493:		AngleVectors(angles, hordir, NULL, NULL);
ADDRLP4 180
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 4494
;4494:	}
LABELV $1977
line 4498
;4495:	//
;4496:	// if (moveresult->flags & MOVERESULT_ONTOPOFOBSTACLE) movetype = MOVE_JUMP;
;4497:	// else
;4498:	movetype = MOVE_WALK;
ADDRLP4 164
CNSTI4 1
ASGNI4
line 4501
;4499:	// if there's an obstacle at the bot's feet and head then
;4500:	// the bot might be able to crouch through
;4501:	VectorCopy(bs->origin, start);
ADDRLP4 168
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 4502
;4502:	start[2] += 18;
ADDRLP4 168+8
ADDRLP4 168+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 4510
;4503:	// VectorMA(start, 5, hordir, end);
;4504:	// VectorSet(mins, -16, -16, -24);
;4505:	// VectorSet(maxs, 16, 16, 4);
;4506:	//
;4507:	// bsptrace = AAS_Trace(start, mins, maxs, end, bs->entitynum, MASK_PLAYERSOLID);
;4508:	// if (bsptrace.fraction >= 1) movetype = MOVE_CROUCH;
;4509:	//  get the sideward vector
;4510:	CrossProduct(hordir, up, sideward);
ADDRLP4 0
ARGP4
ADDRLP4 192
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 4512
;4511:	//
;4512:	if (bs->flags & BFL_AVOIDRIGHT)
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1982
line 4513
;4513:		VectorNegate(sideward, sideward);
ADDRLP4 12
ADDRLP4 12
INDIRF4
NEGF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
NEGF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
NEGF4
ASGNF4
LABELV $1982
line 4515
;4514:	// try to crouch straight forward?
;4515:	if (!trap_BotMoveInDirection(bs->ms, hordir, 400, movetype)) {
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 164
INDIRI4
ARGI4
ADDRLP4 456
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 456
INDIRI4
CNSTI4 0
NEI4 $1988
line 4517
;4516:		// perform the movement
;4517:		if (!trap_BotMoveInDirection(bs->ms, sideward, 400, movetype)) {
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 164
INDIRI4
ARGI4
ADDRLP4 460
ADDRGP4 trap_BotMoveInDirection
CALLI4
ASGNI4
ADDRLP4 460
INDIRI4
CNSTI4 0
NEI4 $1990
line 4519
;4518:			// flip the avoid direction flag
;4519:			bs->flags ^= BFL_AVOIDRIGHT;
ADDRLP4 464
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 464
INDIRP4
ADDRLP4 464
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 4522
;4520:			// flip the direction
;4521:			// VectorNegate(sideward, sideward);
;4522:			VectorMA(sideward, -1, hordir, sideward);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 0
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRLP4 0+4
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
ADDRLP4 0+8
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
line 4524
;4523:			// move in the other direction
;4524:			trap_BotMoveInDirection(bs->ms, sideward, 400, movetype);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTF4 1137180672
ARGF4
ADDRLP4 164
INDIRI4
ARGI4
ADDRGP4 trap_BotMoveInDirection
CALLI4
pop
line 4525
;4525:		}
LABELV $1990
line 4526
;4526:	}
LABELV $1988
line 4528
;4527:	//
;4528:	if (bs->notblocked_time < FloatTime() - 0.4) {
ADDRFP4 0
INDIRP4
CNSTI4 6204
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1053609165
SUBF4
GEF4 $1998
line 4531
;4529:		// just reset goals and hope the bot will go into another direction?
;4530:		// is this still needed??
;4531:		if (bs->ainode == AINode_Seek_NBG)
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_NBG
CVPU4 4
NEU4 $2000
line 4532
;4532:			bs->nbg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6072
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $2001
JUMPV
LABELV $2000
line 4533
;4533:		else if (bs->ainode == AINode_Seek_LTG)
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Seek_LTG
CVPU4 4
NEU4 $2002
line 4534
;4534:			bs->ltg_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6068
ADDP4
CNSTF4 0
ASGNF4
LABELV $2002
LABELV $2001
line 4535
;4535:	}
LABELV $1998
line 4536
;4536:}
LABELV $1954
endproc BotAIBlocked 468 16
export BotAIPredictObstacles
proc BotAIPredictObstacles 316 44
line 4548
;4537:
;4538:/*
;4539:==================
;4540:BotAIPredictObstacles
;4541:
;4542:Predict the route towards the goal and check if the bot
;4543:will be blocked by certain obstacles. When the bot has obstacles
;4544:on it's path the bot should figure out if they can be removed
;4545:by activating certain entities.
;4546:==================
;4547:*/
;4548:int BotAIPredictObstacles(bot_state_t* bs, bot_goal_t* goal) {
line 4553
;4549:	int                modelnum, entitynum, bspent;
;4550:	bot_activategoal_t activategoal;
;4551:	aas_predictroute_t route;
;4552:
;4553:	if (!bot_predictobstacles.integer)
ADDRGP4 bot_predictobstacles+12
INDIRI4
CNSTI4 0
NEI4 $2005
line 4554
;4554:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2004
JUMPV
LABELV $2005
line 4557
;4555:
;4556:	// always predict when the goal change or at regular intervals
;4557:	if (bs->predictobstacles_goalareanum == goal->areanum && bs->predictobstacles_time > FloatTime() - 6) {
ADDRLP4 292
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 292
INDIRP4
CNSTI4 6216
ADDP4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $2008
ADDRLP4 292
INDIRP4
CNSTI4 6212
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1086324736
SUBF4
LEF4 $2008
line 4558
;4558:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2004
JUMPV
LABELV $2008
line 4560
;4559:	}
;4560:	bs->predictobstacles_goalareanum = goal->areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6216
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 4561
;4561:	bs->predictobstacles_time        = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6212
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4564
;4562:
;4563:	// predict at most 100 areas or 10 seconds ahead
;4564:	trap_AAS_PredictRoute(
ADDRLP4 0
ARGP4
ADDRLP4 296
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 296
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 296
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
CNSTI4 100
ARGI4
CNSTI4 1000
ARGI4
CNSTI4 6
ARGI4
CNSTI4 1024
ARGI4
CNSTI4 67108864
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_AAS_PredictRoute
CALLI4
pop
line 4567
;4565:		&route, bs->areanum, bs->origin, goal->areanum, bs->tfl, 100, 1000, RSE_USETRAVELTYPE | RSE_ENTERCONTENTS, AREACONTENTS_MOVER, TFL_BRIDGE, 0);
;4566:	// if bot has to travel through an area with a mover
;4567:	if (route.stopevent & RSE_ENTERCONTENTS) {
ADDRLP4 0+16
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $2010
line 4569
;4568:		// if the bot will run into a mover
;4569:		if (route.endcontents & AREACONTENTS_MOVER) {
ADDRLP4 0+20
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $2011
line 4571
;4570:			// NOTE: this only works with bspc 2.1 or higher
;4571:			modelnum = (route.endcontents & AREACONTENTS_MODELNUM) >> AREACONTENTS_MODELNUMSHIFT;
ADDRLP4 36
ADDRLP4 0+20
INDIRI4
CNSTI4 255
CNSTI4 24
LSHI4
BANDI4
CNSTI4 24
RSHI4
ASGNI4
line 4572
;4572:			if (modelnum) {
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $2011
line 4574
;4573:				//
;4574:				entitynum = BotModelMinsMaxs(modelnum, ET_MOVER, 0, NULL, NULL);
ADDRLP4 36
INDIRI4
ARGI4
CNSTI4 4
ARGI4
CNSTI4 0
ARGI4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 300
ADDRGP4 BotModelMinsMaxs
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 300
INDIRI4
ASGNI4
line 4575
;4575:				if (entitynum) {
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $2011
line 4577
;4576:					// NOTE: BotGetActivateGoal already checks if the door is open or not
;4577:					bspent = BotGetActivateGoal(bs, entitynum, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 48
ARGP4
ADDRLP4 304
ADDRGP4 BotGetActivateGoal
CALLI4
ASGNI4
ADDRLP4 44
ADDRLP4 304
INDIRI4
ASGNI4
line 4578
;4578:					if (bspent) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $2011
line 4580
;4579:						//
;4580:						if (bs->activatestack && !bs->activatestack->inuse)
ADDRLP4 308
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 308
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $2023
ADDRLP4 308
INDIRP4
CNSTI4 7120
ADDP4
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2023
line 4581
;4581:							bs->activatestack = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 7120
ADDP4
CNSTP4 0
ASGNP4
LABELV $2023
line 4583
;4582:						// if not already trying to activate this entity
;4583:						if (!BotIsGoingToActivateEntity(bs, activategoal.goal.entitynum)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48+4+40
INDIRI4
ARGI4
ADDRLP4 312
ADDRGP4 BotIsGoingToActivateEntity
CALLI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 0
NEI4 $2025
line 4587
;4584:							//
;4585:							// BotAI_Print(PRT_MESSAGE, "blocked by mover model %d, entity %d ?\n", modelnum, entitynum);
;4586:							//
;4587:							BotGoForActivateGoal(bs, &activategoal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 BotGoForActivateGoal
CALLI4
pop
line 4588
;4588:							return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2004
JUMPV
LABELV $2025
line 4589
;4589:						} else {
line 4591
;4590:							// enable any routing areas that were disabled
;4591:							BotEnableActivateGoalAreas(&activategoal, qtrue);
ADDRLP4 48
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BotEnableActivateGoalAreas
CALLV
pop
line 4592
;4592:						}
line 4593
;4593:					}
line 4594
;4594:				}
line 4595
;4595:			}
line 4596
;4596:		}
line 4597
;4597:	} else if (route.stopevent & RSE_USETRAVELTYPE) {
ADDRGP4 $2011
JUMPV
LABELV $2010
ADDRLP4 0+16
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $2029
line 4598
;4598:		if (route.endtravelflags & TFL_BRIDGE) {
ADDRLP4 0+24
INDIRI4
CNSTI4 67108864
BANDI4
CNSTI4 0
EQI4 $2032
line 4600
;4599:			// FIXME: check if the bridge is available to travel over
;4600:		}
LABELV $2032
line 4601
;4601:	}
LABELV $2029
LABELV $2011
line 4602
;4602:	return qfalse;
CNSTI4 0
RETI4
LABELV $2004
endproc BotAIPredictObstacles 316 44
export BotCheckConsoleMessages
proc BotCheckConsoleMessages 1008 48
line 4610
;4603:}
;4604:
;4605:/*
;4606:==================
;4607:BotCheckConsoleMessages
;4608:==================
;4609:*/
;4610:void BotCheckConsoleMessages(bot_state_t* bs) {
line 4618
;4611:	char                 botname[MAX_NETNAME], message[MAX_MESSAGE_SIZE], netname[MAX_NETNAME], *ptr;
;4612:	float                chat_reply;
;4613:	int                  context, handle;
;4614:	bot_consolemessage_t m;
;4615:	bot_match_t          match;
;4616:
;4617:	// the name of this bot
;4618:	ClientName(bs->client, botname, sizeof(botname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 908
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
ADDRGP4 $2037
JUMPV
LABELV $2036
line 4620
;4619:	//
;4620:	while ((handle = trap_BotNextConsoleMessage(bs->cs, &m)) != 0) {
line 4622
;4621:		// if the chat state is flooded with messages the bot will read them quickly
;4622:		if (trap_BotNumConsoleMessages(bs->cs) < 10) {
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 948
ADDRGP4 trap_BotNumConsoleMessages
CALLI4
ASGNI4
ADDRLP4 948
INDIRI4
CNSTI4 10
GEI4 $2039
line 4624
;4623:			// if it is a chat message the bot needs some time to read it
;4624:			if (m.type == CMS_CHAT && m.time > FloatTime() - (1 + random()))
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2041
ADDRLP4 952
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+4
INDIRF4
ADDRGP4 floattime
INDIRF4
ADDRLP4 952
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1065353216
ADDF4
SUBF4
LEF4 $2041
line 4625
;4625:				break;
ADDRGP4 $2038
JUMPV
LABELV $2041
line 4626
;4626:		}
LABELV $2039
line 4628
;4627:		//
;4628:		ptr = m.message;
ADDRLP4 276
ADDRLP4 0+12
ASGNP4
line 4631
;4629:		// if it is a chat message then don't unify white spaces and don't
;4630:		// replace synonyms in the netname
;4631:		if (m.type == CMS_CHAT) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2046
line 4633
;4632:			//
;4633:			if (trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
ADDRLP4 0+12
ARGP4
ADDRLP4 288
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 952
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 952
INDIRI4
CNSTI4 0
EQI4 $2049
line 4634
;4634:				ptr = m.message + match.variables[MESSAGE].offset;
ADDRLP4 276
ADDRLP4 288+264+16
INDIRI1
CVII4 1
ADDRLP4 0+12
ADDP4
ASGNP4
line 4635
;4635:			}
LABELV $2049
line 4636
;4636:		}
LABELV $2046
line 4638
;4637:		// unify the white spaces in the message
;4638:		trap_UnifyWhiteSpaces(ptr);
ADDRLP4 276
INDIRP4
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4640
;4639:		// replace synonyms in the right context
;4640:		context = BotSynonymContext(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 952
ADDRGP4 BotSynonymContext
CALLI4
ASGNI4
ADDRLP4 284
ADDRLP4 952
INDIRI4
ASGNI4
line 4641
;4641:		trap_BotReplaceSynonyms(ptr, context);
ADDRLP4 276
INDIRP4
ARGP4
ADDRLP4 284
INDIRI4
CVIU4 4
ARGU4
ADDRGP4 trap_BotReplaceSynonyms
CALLV
pop
line 4643
;4642:		// if there's no match
;4643:		if (!BotMatchMessage(bs, m.message)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 956
ADDRGP4 BotMatchMessage
CALLI4
ASGNI4
ADDRLP4 956
INDIRI4
CNSTI4 0
NEI4 $2055
line 4645
;4644:			// if it is a chat message
;4645:			if (m.type == CMS_CHAT && !bot_nochat.integer) {
ADDRLP4 0+8
INDIRI4
CNSTI4 1
NEI4 $2058
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
NEI4 $2058
line 4647
;4646:				//
;4647:				if (!trap_BotFindMatch(m.message, &match, MTCONTEXT_REPLYCHAT)) {
ADDRLP4 0+12
ARGP4
ADDRLP4 288
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 960
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 960
INDIRI4
CNSTI4 0
NEI4 $2062
line 4648
;4648:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4649
;4649:					continue;
ADDRGP4 $2037
JUMPV
LABELV $2062
line 4652
;4650:				}
;4651:				// don't use eliza chats with team messages
;4652:				if (match.subtype & ST_TEAM) {
ADDRLP4 288+260
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $2065
line 4653
;4653:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4654
;4654:					continue;
ADDRGP4 $2037
JUMPV
LABELV $2065
line 4657
;4655:				}
;4656:				//
;4657:				trap_BotMatchVariable(&match, NETNAME, netname, sizeof(netname));
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 872
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 4658
;4658:				trap_BotMatchVariable(&match, MESSAGE, message, sizeof(message));
ADDRLP4 288
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 616
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 4660
;4659:				// if this is a message from the bot self
;4660:				if (bs->client == ClientFromName(netname)) {
ADDRLP4 872
ARGP4
ADDRLP4 964
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRLP4 964
INDIRI4
NEI4 $2068
line 4661
;4661:					trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4662
;4662:					continue;
ADDRGP4 $2037
JUMPV
LABELV $2068
line 4665
;4663:				}
;4664:				// unify the message
;4665:				trap_UnifyWhiteSpaces(message);
ADDRLP4 616
ARGP4
ADDRGP4 trap_UnifyWhiteSpaces
CALLV
pop
line 4667
;4666:				//
;4667:				trap_Cvar_Update(&bot_testrchat);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 4668
;4668:				if (bot_testrchat.integer) {
ADDRGP4 bot_testrchat+12
INDIRI4
CNSTI4 0
EQI4 $2070
line 4670
;4669:					//
;4670:					trap_BotLibVarSet("bot_testrchat", "1");
ADDRGP4 $2073
ARGP4
ADDRGP4 $2074
ARGP4
ADDRGP4 trap_BotLibVarSet
CALLI4
pop
line 4672
;4671:					// if bot replies with a chat message
;4672:					if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY, NULL, NULL, NULL, NULL, NULL, NULL, botname, netname)) {
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
CNSTI4 16
ARGI4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 908
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 968
ADDRGP4 trap_BotReplyChat
CALLI4
ASGNI4
ADDRLP4 968
INDIRI4
CNSTI4 0
EQI4 $2075
line 4673
;4673:						BotAI_Print(PRT_MESSAGE, "------------------------\n");
CNSTI4 1
ARGI4
ADDRGP4 $2077
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4674
;4674:					} else {
ADDRGP4 $2071
JUMPV
LABELV $2075
line 4675
;4675:						BotAI_Print(PRT_MESSAGE, "**** no valid reply ****\n");
CNSTI4 1
ARGI4
ADDRGP4 $2078
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 4676
;4676:					}
line 4677
;4677:				}
ADDRGP4 $2071
JUMPV
LABELV $2070
line 4679
;4678:				// if at a valid chat position and not chatting already and not in teamplay
;4679:				else if (bs->ainode != AINode_Stand && BotValidChatPosition(bs) && !TeamPlayIsOn()) {
ADDRLP4 968
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 968
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 AINode_Stand
CVPU4 4
EQU4 $2079
ADDRLP4 968
INDIRP4
ARGP4
ADDRLP4 972
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 972
INDIRI4
CNSTI4 0
EQI4 $2079
ADDRLP4 976
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 976
INDIRI4
CNSTI4 0
NEI4 $2079
line 4680
;4680:					chat_reply = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_REPLY, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 35
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 980
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 944
ADDRLP4 980
INDIRF4
ASGNF4
line 4681
;4681:					if (random() < 1.5 / (NumBots() + 1) && random() < chat_reply) {
ADDRLP4 984
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 988
ADDRGP4 NumBots
CALLI4
ASGNI4
ADDRLP4 984
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1069547520
ADDRLP4 988
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
DIVF4
GEF4 $2081
ADDRLP4 992
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 992
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 944
INDIRF4
GEF4 $2081
line 4683
;4682:						// if bot replies with a chat message
;4683:						if (trap_BotReplyChat(bs->cs, message, context, CONTEXT_REPLY, NULL, NULL, NULL, NULL, NULL, NULL, botname, netname)) {
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 616
ARGP4
ADDRLP4 284
INDIRI4
ARGI4
CNSTI4 16
ARGI4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 908
ARGP4
ADDRLP4 872
ARGP4
ADDRLP4 996
ADDRGP4 trap_BotReplyChat
CALLI4
ASGNI4
ADDRLP4 996
INDIRI4
CNSTI4 0
EQI4 $2083
line 4685
;4684:							// remove the console message
;4685:							trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4686
;4686:							bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 1000
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1000
INDIRP4
ARGP4
ADDRLP4 1004
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 1000
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1004
INDIRF4
ADDF4
ASGNF4
line 4687
;4687:							AIEnter_Stand(bs, "BotCheckConsoleMessages: reply chat");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2085
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 4689
;4688:							// EA_Say(bs->client, bs->cs.chatmessage);
;4689:							break;
ADDRGP4 $2038
JUMPV
LABELV $2083
line 4691
;4690:						}
;4691:					}
LABELV $2081
line 4692
;4692:				}
LABELV $2079
LABELV $2071
line 4693
;4693:			}
LABELV $2058
line 4694
;4694:		}
LABELV $2055
line 4696
;4695:		// remove the console message
;4696:		trap_BotRemoveConsoleMessage(bs->cs, handle);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 280
INDIRI4
ARGI4
ADDRGP4 trap_BotRemoveConsoleMessage
CALLV
pop
line 4697
;4697:	}
LABELV $2037
line 4620
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 948
ADDRGP4 trap_BotNextConsoleMessage
CALLI4
ASGNI4
ADDRLP4 280
ADDRLP4 948
INDIRI4
ASGNI4
ADDRLP4 948
INDIRI4
CNSTI4 0
NEI4 $2036
LABELV $2038
line 4698
;4698:}
LABELV $2035
endproc BotCheckConsoleMessages 1008 48
export BotCheckForGrenades
proc BotCheckForGrenades 4 16
line 4705
;4699:
;4700:/*
;4701:==================
;4702:BotCheckEvents
;4703:==================
;4704:*/
;4705:void BotCheckForGrenades(bot_state_t* bs, entityState_t* state) {
line 4707
;4706:	// if this is not a grenade
;4707:	if (state->eType != ET_MISSILE || state->weapon != WP_GRENADE_LAUNCHER)
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $2089
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 4
EQI4 $2087
LABELV $2089
line 4708
;4708:		return;
ADDRGP4 $2086
JUMPV
LABELV $2087
line 4710
;4709:	// try to avoid the grenade
;4710:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTF4 1126170624
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 4711
;4711:}
LABELV $2086
endproc BotCheckForGrenades 4 16
export BotCheckEvents
proc BotCheckEvents 164 12
line 4763
;4712:
;4713:#ifdef MISSIONPACK
;4714:/*
;4715:==================
;4716:BotCheckForProxMines
;4717:==================
;4718:*/
;4719:void BotCheckForProxMines(bot_state_t* bs, entityState_t* state) {
;4720:	// if this is not a prox mine
;4721:	if (state->eType != ET_MISSILE || state->weapon != WP_PROX_LAUNCHER)
;4722:		return;
;4723:	// if this prox mine is from someone on our own team
;4724:	if (state->generic1 == BotTeam(bs))
;4725:		return;
;4726:	// if the bot doesn't have a weapon to deactivate the mine
;4727:	if (!(bs->inventory[INVENTORY_PLASMAGUN] > 0 && bs->inventory[INVENTORY_CELLS] > 0) &&
;4728:	    !(bs->inventory[INVENTORY_ROCKETLAUNCHER] > 0 && bs->inventory[INVENTORY_ROCKETS] > 0) &&
;4729:	    !(bs->inventory[INVENTORY_BFG10K] > 0 && bs->inventory[INVENTORY_BFGAMMO] > 0)) {
;4730:		return;
;4731:	}
;4732:	// try to avoid the prox mine
;4733:	trap_BotAddAvoidSpot(bs->ms, state->pos.trBase, 160, AVOID_ALWAYS);
;4734:	//
;4735:	if (bs->numproxmines >= MAX_PROXMINES)
;4736:		return;
;4737:	bs->proxmines[bs->numproxmines] = state->number;
;4738:	bs->numproxmines++;
;4739:}
;4740:
;4741:/*
;4742:==================
;4743:BotCheckForKamikazeBody
;4744:==================
;4745:*/
;4746:void BotCheckForKamikazeBody(bot_state_t* bs, entityState_t* state) {
;4747:	// if this entity is not wearing the kamikaze
;4748:	if (!(state->eFlags & EF_KAMIKAZE))
;4749:		return;
;4750:	// if this entity isn't dead
;4751:	if (!(state->eFlags & EF_DEAD))
;4752:		return;
;4753:	// remember this kamikaze body
;4754:	bs->kamikazebody = state->number;
;4755:}
;4756:#endif
;4757:
;4758:/*
;4759:==================
;4760:BotCheckEvents
;4761:==================
;4762:*/
;4763:void BotCheckEvents(bot_state_t* bs, entityState_t* state) {
line 4772
;4764:	int  event;
;4765:	char buf[128];
;4766:#ifdef MISSIONPACK
;4767:	aas_entityinfo_t entinfo;
;4768:#endif
;4769:
;4770:	// NOTE: this sucks, we're accessing the gentity_t directly
;4771:	// but there's no other fast way to do it right now
;4772:	if (bs->entityeventTime[state->number] == g_entities[state->number].eventTime) {
ADDRLP4 132
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDP4
INDIRI4
ADDRLP4 132
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+552
ADDP4
INDIRI4
NEI4 $2091
line 4773
;4773:		return;
ADDRGP4 $2090
JUMPV
LABELV $2091
line 4775
;4774:	}
;4775:	bs->entityeventTime[state->number] = g_entities[state->number].eventTime;
ADDRLP4 136
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 136
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDP4
ADDRLP4 136
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+552
ADDP4
INDIRI4
ASGNI4
line 4777
;4776:	// if it's an event only entity
;4777:	if (state->eType > ET_EVENTS) {
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
LEI4 $2095
line 4778
;4778:		event = (state->eType - ET_EVENTS) & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
SUBI4
CNSTI4 -769
BANDI4
ASGNI4
line 4779
;4779:	} else {
ADDRGP4 $2096
JUMPV
LABELV $2095
line 4780
;4780:		event = state->event & ~EV_EVENT_BITS;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 4781
;4781:	}
LABELV $2096
line 4783
;4782:	//
;4783:	switch (event) {
ADDRLP4 140
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 1
LTI4 $2097
ADDRLP4 140
INDIRI4
CNSTI4 76
GTI4 $2097
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2146-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $2146
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2098
address $2097
address $2097
address $2131
address $2097
address $2097
address $2132
address $2110
address $2118
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2099
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2097
address $2098
code
LABELV $2099
line 4785
;4784:	// client obituary event
;4785:	case EV_OBITUARY: {
line 4788
;4786:		int target, attacker, mod;
;4787:
;4788:		target   = state->otherEntityNum;
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 4789
;4789:		attacker = state->otherEntityNum2;
ADDRLP4 148
ADDRFP4 4
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 4790
;4790:		mod      = state->eventParm;
ADDRLP4 152
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 4792
;4791:		//
;4792:		if (target == bs->client) {
ADDRLP4 144
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2100
line 4793
;4793:			bs->botdeathtype = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 4794
;4794:			bs->lastkilledby = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 5996
ADDP4
ADDRLP4 148
INDIRI4
ASGNI4
line 4796
;4795:			//
;4796:			if (target == attacker || target == ENTITYNUM_NONE || target == ENTITYNUM_WORLD)
ADDRLP4 156
ADDRLP4 144
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRLP4 148
INDIRI4
EQI4 $2105
ADDRLP4 156
INDIRI4
CNSTI4 1023
EQI4 $2105
ADDRLP4 156
INDIRI4
CNSTI4 1022
NEI4 $2102
LABELV $2105
line 4797
;4797:				bs->botsuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 1
ASGNI4
ADDRGP4 $2103
JUMPV
LABELV $2102
line 4799
;4798:			else
;4799:				bs->botsuicide = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6008
ADDP4
CNSTI4 0
ASGNI4
LABELV $2103
line 4801
;4800:			//
;4801:			bs->num_deaths++;
ADDRLP4 160
ADDRFP4 0
INDIRP4
CNSTI4 6028
ADDP4
ASGNP4
ADDRLP4 160
INDIRP4
ADDRLP4 160
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4802
;4802:		}
ADDRGP4 $2098
JUMPV
LABELV $2100
line 4804
;4803:		// else if this client was killed by the bot
;4804:		else if (attacker == bs->client) {
ADDRLP4 148
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2106
line 4805
;4805:			bs->enemydeathtype   = mod;
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
ADDRLP4 152
INDIRI4
ASGNI4
line 4806
;4806:			bs->lastkilledplayer = target;
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 4807
;4807:			bs->killedenemy_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6168
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4809
;4808:			//
;4809:			bs->num_kills++;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 6032
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 4810
;4810:		} else if (attacker == bs->enemy && target == attacker) {
ADDRGP4 $2098
JUMPV
LABELV $2106
ADDRLP4 156
ADDRLP4 148
INDIRI4
ASGNI4
ADDRLP4 156
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
NEI4 $2098
ADDRLP4 144
INDIRI4
ADDRLP4 156
INDIRI4
NEI4 $2098
line 4811
;4811:			bs->enemysuicide = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6012
ADDP4
CNSTI4 1
ASGNI4
line 4812
;4812:		}
line 4826
;4813:		//
;4814:#ifdef MISSIONPACK
;4815:		if (gametype == GT_1FCTF) {
;4816:			//
;4817:			BotEntityInfo(target, &entinfo);
;4818:			if (entinfo.powerups & (1 << PW_NEUTRALFLAG)) {
;4819:				if (!BotSameTeam(bs, target)) {
;4820:					bs->neutralflagstatus = 3;  // enemy dropped the flag
;4821:					bs->flagstatuschanged = qtrue;
;4822:				}
;4823:			}
;4824:		}
;4825:#endif
;4826:		break;
ADDRGP4 $2098
JUMPV
LABELV $2110
line 4828
;4827:	}
;4828:	case EV_GLOBAL_SOUND: {
line 4829
;4829:		if (state->eventParm < 0 || state->eventParm >= MAX_SOUNDS) {
ADDRLP4 144
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LTI4 $2113
ADDRLP4 144
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 256
LTI4 $2111
LABELV $2113
line 4830
;4830:			BotAI_Print(PRT_ERROR, "EV_GLOBAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2114
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 4831
;4831:			break;
ADDRGP4 $2098
JUMPV
LABELV $2111
line 4833
;4832:		}
;4833:		trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 4852
;4834:		/*
;4835:		if (!strcmp(buf, "sound/teamplay/flagret_red.wav")) {
;4836:		    //red flag is returned
;4837:		    bs->redflagstatus = 0;
;4838:		    bs->flagstatuschanged = qtrue;
;4839:		}
;4840:		else if (!strcmp(buf, "sound/teamplay/flagret_blu.wav")) {
;4841:		    //blue flag is returned
;4842:		    bs->blueflagstatus = 0;
;4843:		    bs->flagstatuschanged = qtrue;
;4844:		}
;4845:		else*/
;4846:#ifdef MISSIONPACK
;4847:		if (!strcmp(buf, "sound/items/kamikazerespawn.wav")) {
;4848:			// the kamikaze respawned so dont avoid it
;4849:			BotDontAvoid(bs, "Kamikaze");
;4850:		} else
;4851:#endif
;4852:			if (!strcmp(buf, "sound/items/poweruprespawn.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2117
ARGP4
ADDRLP4 148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $2098
line 4854
;4853:			// powerup respawned... go get it
;4854:			BotGoForPowerups(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotGoForPowerups
CALLV
pop
line 4855
;4855:		}
line 4856
;4856:		break;
ADDRGP4 $2098
JUMPV
LABELV $2118
line 4858
;4857:	}
;4858:	case EV_GLOBAL_TEAM_SOUND: {
line 4859
;4859:		if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2098
line 4860
;4860:			switch (state->eventParm) {
ADDRLP4 144
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
LTI4 $2098
ADDRLP4 144
INDIRI4
CNSTI4 5
GTI4 $2098
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $2130
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $2130
address $2124
address $2125
address $2126
address $2127
address $2128
address $2129
code
LABELV $2124
line 4862
;4861:			case GTS_RED_CAPTURE:
;4862:				bs->blueflagstatus    = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 4863
;4863:				bs->redflagstatus     = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4864
;4864:				bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4865
;4865:				break;  // see BotMatch_CTF
ADDRGP4 $2098
JUMPV
LABELV $2125
line 4867
;4866:			case GTS_BLUE_CAPTURE:
;4867:				bs->blueflagstatus    = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 4868
;4868:				bs->redflagstatus     = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4869
;4869:				bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4870
;4870:				break;  // see BotMatch_CTF
ADDRGP4 $2098
JUMPV
LABELV $2126
line 4873
;4871:			case GTS_RED_RETURN:
;4872:				// blue flag is returned
;4873:				bs->blueflagstatus    = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 4874
;4874:				bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4875
;4875:				break;
ADDRGP4 $2098
JUMPV
LABELV $2127
line 4878
;4876:			case GTS_BLUE_RETURN:
;4877:				// red flag is returned
;4878:				bs->redflagstatus     = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 4879
;4879:				bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4880
;4880:				break;
ADDRGP4 $2098
JUMPV
LABELV $2128
line 4883
;4881:			case GTS_RED_TAKEN:
;4882:				// blue flag is taken
;4883:				bs->blueflagstatus    = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 1
ASGNI4
line 4884
;4884:				bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4885
;4885:				break;  // see BotMatch_CTF
ADDRGP4 $2098
JUMPV
LABELV $2129
line 4888
;4886:			case GTS_BLUE_TAKEN:
;4887:				// red flag is taken
;4888:				bs->redflagstatus     = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 1
ASGNI4
line 4889
;4889:				bs->flagstatuschanged = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 4890
;4890:				break;  // see BotMatch_CTF
line 4892
;4891:			}
;4892:		}
line 4925
;4893:#ifdef MISSIONPACK
;4894:		else if (gametype == GT_1FCTF) {
;4895:			switch (state->eventParm) {
;4896:			case GTS_RED_CAPTURE:
;4897:				bs->neutralflagstatus = 0;
;4898:				bs->flagstatuschanged = qtrue;
;4899:				break;
;4900:			case GTS_BLUE_CAPTURE:
;4901:				bs->neutralflagstatus = 0;
;4902:				bs->flagstatuschanged = qtrue;
;4903:				break;
;4904:			case GTS_RED_RETURN:
;4905:				// flag has returned
;4906:				bs->neutralflagstatus = 0;
;4907:				bs->flagstatuschanged = qtrue;
;4908:				break;
;4909:			case GTS_BLUE_RETURN:
;4910:				// flag has returned
;4911:				bs->neutralflagstatus = 0;
;4912:				bs->flagstatuschanged = qtrue;
;4913:				break;
;4914:			case GTS_RED_TAKEN:
;4915:				bs->neutralflagstatus = BotTeam(bs) == TEAM_RED ? 2 : 1;  // FIXME: check Team_TakeFlagSound in g_team.c
;4916:				bs->flagstatuschanged = qtrue;
;4917:				break;
;4918:			case GTS_BLUE_TAKEN:
;4919:				bs->neutralflagstatus = BotTeam(bs) == TEAM_BLUE ? 2 : 1;  // FIXME: check Team_TakeFlagSound in g_team.c
;4920:				bs->flagstatuschanged = qtrue;
;4921:				break;
;4922:			}
;4923:		}
;4924:#endif
;4925:		break;
ADDRGP4 $2098
JUMPV
LABELV $2131
line 4927
;4926:	}
;4927:	case EV_PLAYER_TELEPORT_IN: {
line 4928
;4928:		VectorCopy(state->origin, lastteleport_origin);
ADDRGP4 lastteleport_origin
ADDRFP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 4929
;4929:		lastteleport_time = FloatTime();
ADDRGP4 lastteleport_time
ADDRGP4 floattime
INDIRF4
ASGNF4
line 4930
;4930:		break;
ADDRGP4 $2098
JUMPV
LABELV $2132
line 4932
;4931:	}
;4932:	case EV_GENERAL_SOUND: {
line 4934
;4933:		// if this sound is played on the bot
;4934:		if (state->number == bs->client) {
ADDRFP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $2098
line 4935
;4935:			if (state->eventParm < 0 || state->eventParm >= MAX_SOUNDS) {
ADDRLP4 144
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 144
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
LTI4 $2137
ADDRLP4 144
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 256
LTI4 $2135
LABELV $2137
line 4936
;4936:				BotAI_Print(PRT_ERROR, "EV_GENERAL_SOUND: eventParm (%d) out of range\n", state->eventParm);
CNSTI4 3
ARGI4
ADDRGP4 $2138
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 4937
;4937:				break;
ADDRGP4 $2098
JUMPV
LABELV $2135
line 4940
;4938:			}
;4939:			// check out the sound
;4940:			trap_GetConfigstring(CS_SOUNDS + state->eventParm, buf, sizeof(buf));
ADDRFP4 4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 4942
;4941:			// if falling into a death pit
;4942:			if (!strcmp(buf, "*falling1.wav")) {
ADDRLP4 4
ARGP4
ADDRGP4 $2141
ARGP4
ADDRLP4 148
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $2098
line 4944
;4943:				// if the bot has a personal teleporter
;4944:				if (bs->inventory[INVENTORY_TELEPORTER] > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5072
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2098
line 4946
;4945:					// use the holdable item
;4946:					trap_EA_Use(bs->client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_EA_Use
CALLV
pop
line 4947
;4947:				}
line 4948
;4948:			}
line 4949
;4949:		}
line 4950
;4950:		break;
line 4977
;4951:	}
;4952:	case EV_FOOTSTEP:
;4953:	case EV_FOOTSTEP_METAL:
;4954:	case EV_FOOTSPLASH:
;4955:	case EV_FOOTWADE:
;4956:	case EV_SWIM:
;4957:	case EV_FALL_SHORT:
;4958:	case EV_FALL_MEDIUM:
;4959:	case EV_FALL_FAR:
;4960:	case EV_STEP_4:
;4961:	case EV_STEP_8:
;4962:	case EV_STEP_12:
;4963:	case EV_STEP_16:
;4964:	case EV_JUMP_PAD:
;4965:	case EV_JUMP:
;4966:	case EV_TAUNT:
;4967:	case EV_WATER_TOUCH:
;4968:	case EV_WATER_LEAVE:
;4969:	case EV_WATER_UNDER:
;4970:	case EV_WATER_CLEAR:
;4971:	case EV_ITEM_PICKUP:
;4972:	case EV_GLOBAL_ITEM_PICKUP:
;4973:	case EV_NOAMMO:
;4974:	case EV_CHANGE_WEAPON:
;4975:	case EV_FIRE_WEAPON:
;4976:		// FIXME: either add to sound queue or mark player as someone making noise
;4977:		break;
line 4994
;4978:	case EV_USE_ITEM0:
;4979:	case EV_USE_ITEM1:
;4980:	case EV_USE_ITEM2:
;4981:	case EV_USE_ITEM3:
;4982:	case EV_USE_ITEM4:
;4983:	case EV_USE_ITEM5:
;4984:	case EV_USE_ITEM6:
;4985:	case EV_USE_ITEM7:
;4986:	case EV_USE_ITEM8:
;4987:	case EV_USE_ITEM9:
;4988:	case EV_USE_ITEM10:
;4989:	case EV_USE_ITEM11:
;4990:	case EV_USE_ITEM12:
;4991:	case EV_USE_ITEM13:
;4992:	case EV_USE_ITEM14:
;4993:	case EV_USE_ITEM15:
;4994:		break;
LABELV $2097
LABELV $2098
line 4996
;4995:	}
;4996:}
LABELV $2090
endproc BotCheckEvents 164 12
export BotCheckSnapshot
proc BotCheckSnapshot 216 16
line 5003
;4997:
;4998:/*
;4999:==================
;5000:BotCheckSnapshot
;5001:==================
;5002:*/
;5003:void BotCheckSnapshot(bot_state_t* bs) {
line 5008
;5004:	int           ent;
;5005:	entityState_t state;
;5006:
;5007:	// remove all avoid spots
;5008:	trap_BotAddAvoidSpot(bs->ms, vec3_origin, 0, AVOID_CLEAR);
ADDRFP4 0
INDIRP4
CNSTI4 6524
ADDP4
INDIRI4
ARGI4
ADDRGP4 vec3_origin
ARGP4
CNSTF4 0
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotAddAvoidSpot
CALLV
pop
line 5010
;5009:	// reset kamikaze body
;5010:	bs->kamikazebody = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6256
ADDP4
CNSTI4 0
ASGNI4
line 5012
;5011:	// reset number of proxmines
;5012:	bs->numproxmines = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6516
ADDP4
CNSTI4 0
ASGNI4
line 5014
;5013:	//
;5014:	ent = 0;
ADDRLP4 208
CNSTI4 0
ASGNI4
ADDRGP4 $2150
JUMPV
LABELV $2149
line 5015
;5015:	while ((ent = BotAI_GetSnapshotEntity(bs->client, ent, &state)) != -1) {
line 5017
;5016:		// check the entity state for events
;5017:		BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5019
;5018:		// check for grenades the bot should avoid
;5019:		BotCheckForGrenades(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckForGrenades
CALLV
pop
line 5027
;5020:		//
;5021:#ifdef MISSIONPACK
;5022:		// check for proximity mines which the bot should deactivate
;5023:		BotCheckForProxMines(bs, &state);
;5024:		// check for dead bodies with the kamikaze effect which should be gibbed
;5025:		BotCheckForKamikazeBody(bs, &state);
;5026:#endif
;5027:	}
LABELV $2150
line 5015
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 208
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 212
ADDRGP4 BotAI_GetSnapshotEntity
CALLI4
ASGNI4
ADDRLP4 208
ADDRLP4 212
INDIRI4
ASGNI4
ADDRLP4 212
INDIRI4
CNSTI4 -1
NEI4 $2149
line 5029
;5028:	// check the player state for events
;5029:	BotAI_GetEntityState(bs->client, &state);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetEntityState
CALLI4
pop
line 5031
;5030:	// copy the player state events to the entity state
;5031:	state.event     = bs->cur_ps.externalEvent;
ADDRLP4 0+180
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 5032
;5032:	state.eventParm = bs->cur_ps.externalEventParm;
ADDRLP4 0+184
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
ASGNI4
line 5034
;5033:	//
;5034:	BotCheckEvents(bs, &state);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotCheckEvents
CALLV
pop
line 5035
;5035:}
LABELV $2148
endproc BotCheckSnapshot 216 16
export BotCheckAir
proc BotCheckAir 4 4
line 5042
;5036:
;5037:/*
;5038:==================
;5039:BotCheckAir
;5040:==================
;5041:*/
;5042:void BotCheckAir(bot_state_t* bs) {
line 5043
;5043:	if (bs->inventory[INVENTORY_ENVIRONMENTSUIT] <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 5096
ADDP4
INDIRI4
CNSTI4 0
GTI4 $2155
line 5044
;5044:		if (trap_AAS_PointContents(bs->eye) & (CONTENTS_WATER | CONTENTS_SLIME | CONTENTS_LAVA)) {
ADDRFP4 0
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 trap_AAS_PointContents
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $2157
line 5045
;5045:			return;
ADDRGP4 $2154
JUMPV
LABELV $2157
line 5047
;5046:		}
;5047:	}
LABELV $2155
line 5048
;5048:	bs->lastair_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6176
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5049
;5049:}
LABELV $2154
endproc BotCheckAir 4 4
export BotAlternateRoute
proc BotAlternateRoute 16 16
line 5056
;5050:
;5051:/*
;5052:==================
;5053:BotAlternateRoute
;5054:==================
;5055:*/
;5056:bot_goal_t* BotAlternateRoute(bot_state_t* bs, bot_goal_t* goal) {
line 5060
;5057:	int t;
;5058:
;5059:	// if the bot has an alternative route goal
;5060:	if (bs->altroutegoal.areanum) {
ADDRFP4 0
INDIRP4
CNSTI4 6692
ADDP4
INDIRI4
CNSTI4 0
EQI4 $2160
line 5062
;5061:		//
;5062:		if (bs->reachedaltroutegoal_time)
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
INDIRF4
CNSTF4 0
EQF4 $2162
line 5063
;5063:			return goal;
ADDRFP4 4
INDIRP4
RETP4
ADDRGP4 $2159
JUMPV
LABELV $2162
line 5065
;5064:		// travel time towards alternative route goal
;5065:		t = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, bs->altroutegoal.areanum, bs->tfl);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 6692
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 5976
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 5066
;5066:		if (t && t < 20) {
ADDRLP4 12
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $2164
ADDRLP4 12
INDIRI4
CNSTI4 20
GEI4 $2164
line 5068
;5067:			// BotAI_Print(PRT_MESSAGE, "reached alternate route goal\n");
;5068:			bs->reachedaltroutegoal_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 5069
;5069:		}
LABELV $2164
line 5070
;5070:		memcpy(goal, &bs->altroutegoal, sizeof(bot_goal_t));
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 5071
;5071:		return &bs->altroutegoal;
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
RETP4
ADDRGP4 $2159
JUMPV
LABELV $2160
line 5073
;5072:	}
;5073:	return goal;
ADDRFP4 4
INDIRP4
RETP4
LABELV $2159
endproc BotAlternateRoute 16 16
export BotGetAlternateRouteGoal
proc BotGetAlternateRouteGoal 20 0
line 5081
;5074:}
;5075:
;5076:/*
;5077:==================
;5078:BotGetAlternateRouteGoal
;5079:==================
;5080:*/
;5081:int BotGetAlternateRouteGoal(bot_state_t* bs, int base) {
line 5086
;5082:	aas_altroutegoal_t* altroutegoals;
;5083:	bot_goal_t*         goal;
;5084:	int                 numaltroutegoals, rnd;
;5085:
;5086:	if (base == TEAM_RED) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $2167
line 5087
;5087:		altroutegoals    = red_altroutegoals;
ADDRLP4 12
ADDRGP4 red_altroutegoals
ASGNP4
line 5088
;5088:		numaltroutegoals = red_numaltroutegoals;
ADDRLP4 4
ADDRGP4 red_numaltroutegoals
INDIRI4
ASGNI4
line 5089
;5089:	} else {
ADDRGP4 $2168
JUMPV
LABELV $2167
line 5090
;5090:		altroutegoals    = blue_altroutegoals;
ADDRLP4 12
ADDRGP4 blue_altroutegoals
ASGNP4
line 5091
;5091:		numaltroutegoals = blue_numaltroutegoals;
ADDRLP4 4
ADDRGP4 blue_numaltroutegoals
INDIRI4
ASGNI4
line 5092
;5092:	}
LABELV $2168
line 5093
;5093:	if (!numaltroutegoals)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $2169
line 5094
;5094:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2166
JUMPV
LABELV $2169
line 5095
;5095:	rnd = (float)random() * numaltroutegoals;
ADDRLP4 16
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 5096
;5096:	if (rnd >= numaltroutegoals)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $2171
line 5097
;5097:		rnd = numaltroutegoals - 1;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $2171
line 5098
;5098:	goal          = &bs->altroutegoal;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 6680
ADDP4
ASGNP4
line 5099
;5099:	goal->areanum = altroutegoals[rnd].areanum;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 24
MULI4
ADDRLP4 12
INDIRP4
ADDP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 5100
;5100:	VectorCopy(altroutegoals[rnd].origin, goal->origin);
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 24
MULI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRB
ASGNB 12
line 5101
;5101:	VectorSet(goal->mins, -8, -8, -8);
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
CNSTF4 3238002688
ASGNF4
line 5102
;5102:	VectorSet(goal->maxs, 8, 8, 8);
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 1090519040
ASGNF4
line 5103
;5103:	goal->entitynum = 0;
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
CNSTI4 0
ASGNI4
line 5104
;5104:	goal->iteminfo  = 0;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
CNSTI4 0
ASGNI4
line 5105
;5105:	goal->number    = 0;
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
CNSTI4 0
ASGNI4
line 5106
;5106:	goal->flags     = 0;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
CNSTI4 0
ASGNI4
line 5108
;5107:	//
;5108:	bs->reachedaltroutegoal_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6736
ADDP4
CNSTF4 0
ASGNF4
line 5109
;5109:	return qtrue;
CNSTI4 1
RETI4
LABELV $2166
endproc BotGetAlternateRouteGoal 20 0
export BotSetupAlternativeRouteGoals
proc BotSetupAlternativeRouteGoals 0 0
line 5117
;5110:}
;5111:
;5112:/*
;5113:==================
;5114:BotSetupAlternateRouteGoals
;5115:==================
;5116:*/
;5117:void BotSetupAlternativeRouteGoals(void) {
line 5119
;5118:
;5119:	if (altroutegoals_setup)
ADDRGP4 altroutegoals_setup
INDIRI4
CNSTI4 0
EQI4 $2174
line 5120
;5120:		return;
ADDRGP4 $2173
JUMPV
LABELV $2174
line 5162
;5121:#ifdef MISSIONPACK
;5122:	if (gametype == GT_CTF) {
;5123:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
;5124:			BotAI_Print(PRT_WARNING, "no alt routes without Neutral Flag\n");
;5125:		if (ctf_neutralflag.areanum) {
;5126:			//
;5127:			red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5128:				ctf_neutralflag.origin, ctf_neutralflag.areanum, ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT, red_altroutegoals, MAX_ALTROUTEGOALS,
;5129:				ALTROUTEGOAL_CLUSTERPORTALS | ALTROUTEGOAL_VIEWPORTALS);
;5130:			blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5131:				ctf_neutralflag.origin, ctf_neutralflag.areanum, ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT, blue_altroutegoals, MAX_ALTROUTEGOALS,
;5132:				ALTROUTEGOAL_CLUSTERPORTALS | ALTROUTEGOAL_VIEWPORTALS);
;5133:		}
;5134:	} else if (gametype == GT_1FCTF) {
;5135:		//
;5136:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5137:			ctf_neutralflag.origin, ctf_neutralflag.areanum, ctf_redflag.origin, ctf_redflag.areanum, TFL_DEFAULT, red_altroutegoals, MAX_ALTROUTEGOALS,
;5138:			ALTROUTEGOAL_CLUSTERPORTALS | ALTROUTEGOAL_VIEWPORTALS);
;5139:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5140:			ctf_neutralflag.origin, ctf_neutralflag.areanum, ctf_blueflag.origin, ctf_blueflag.areanum, TFL_DEFAULT, blue_altroutegoals, MAX_ALTROUTEGOALS,
;5141:			ALTROUTEGOAL_CLUSTERPORTALS | ALTROUTEGOAL_VIEWPORTALS);
;5142:	} else if (gametype == GT_OBELISK) {
;5143:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
;5144:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
;5145:		//
;5146:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5147:			neutralobelisk.origin, neutralobelisk.areanum, redobelisk.origin, redobelisk.areanum, TFL_DEFAULT, red_altroutegoals, MAX_ALTROUTEGOALS,
;5148:			ALTROUTEGOAL_CLUSTERPORTALS | ALTROUTEGOAL_VIEWPORTALS);
;5149:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5150:			neutralobelisk.origin, neutralobelisk.areanum, blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT, blue_altroutegoals, MAX_ALTROUTEGOALS,
;5151:			ALTROUTEGOAL_CLUSTERPORTALS | ALTROUTEGOAL_VIEWPORTALS);
;5152:	} else if (gametype == GT_HARVESTER) {
;5153:		//
;5154:		red_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5155:			neutralobelisk.origin, neutralobelisk.areanum, redobelisk.origin, redobelisk.areanum, TFL_DEFAULT, red_altroutegoals, MAX_ALTROUTEGOALS,
;5156:			ALTROUTEGOAL_CLUSTERPORTALS | ALTROUTEGOAL_VIEWPORTALS);
;5157:		blue_numaltroutegoals = trap_AAS_AlternativeRouteGoals(
;5158:			neutralobelisk.origin, neutralobelisk.areanum, blueobelisk.origin, blueobelisk.areanum, TFL_DEFAULT, blue_altroutegoals, MAX_ALTROUTEGOALS,
;5159:			ALTROUTEGOAL_CLUSTERPORTALS | ALTROUTEGOAL_VIEWPORTALS);
;5160:	}
;5161:#endif
;5162:	altroutegoals_setup = qtrue;
ADDRGP4 altroutegoals_setup
CNSTI4 1
ASGNI4
line 5163
;5163:}
LABELV $2173
endproc BotSetupAlternativeRouteGoals 0 0
export BotDeathmatchAI
proc BotDeathmatchAI 1492 20
line 5170
;5164:
;5165:/*
;5166:==================
;5167:BotDeathmatchAI
;5168:==================
;5169:*/
;5170:void BotDeathmatchAI(bot_state_t* bs, float thinktime) {
line 5176
;5171:	char gender[144], name[144], buf[144];
;5172:	char userinfo[MAX_INFO_STRING];
;5173:	int  i;
;5174:
;5175:	// if the bot has just been setup
;5176:	if (bs->setupcount > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2177
line 5177
;5177:		bs->setupcount--;
ADDRLP4 1460
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
ADDRLP4 1460
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 5178
;5178:		if (bs->setupcount > 0)
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
INDIRI4
CNSTI4 0
LEI4 $2179
line 5179
;5179:			return;
ADDRGP4 $2176
JUMPV
LABELV $2179
line 5181
;5180:		// get the gender characteristic
;5181:		trap_Characteristic_String(bs->character, CHARACTERISTIC_GENDER, gender, sizeof(gender));
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 148
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 trap_Characteristic_String
CALLV
pop
line 5183
;5182:		// set the bot gender
;5183:		trap_GetUserinfo(bs->client, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 5184
;5184:		Info_SetValueForKey(userinfo, "sex", gender);
ADDRLP4 292
ARGP4
ADDRGP4 $2181
ARGP4
ADDRLP4 148
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 5185
;5185:		trap_SetUserinfo(bs->client, userinfo);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 292
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 5187
;5186:		// set the team
;5187:		if (!bs->map_restart && g_gametype.integer != GT_TOURNAMENT) {
ADDRFP4 0
INDIRP4
CNSTI4 6020
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2182
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $2182
line 5188
;5188:			Com_sprintf(buf, sizeof(buf), "team %s", bs->settings.team);
ADDRLP4 1316
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 $2185
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 4756
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 5189
;5189:			trap_EA_Command(bs->client, buf);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1316
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
line 5190
;5190:		}
LABELV $2182
line 5192
;5191:		// set the chat gender
;5192:		if (gender[0] == 'm')
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 109
NEI4 $2186
line 5193
;5193:			trap_BotSetChatGender(bs->cs, CHAT_GENDERMALE);
ADDRFP4 0
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
ADDRGP4 $2187
JUMPV
LABELV $2186
line 5194
;5194:		else if (gender[0] == 'f')
ADDRLP4 148
INDIRI1
CVII4 1
CNSTI4 102
NEI4 $2188
line 5195
;5195:			trap_BotSetChatGender(bs->cs, CHAT_GENDERFEMALE);
ADDRFP4 0
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
ADDRGP4 $2189
JUMPV
LABELV $2188
line 5197
;5196:		else
;5197:			trap_BotSetChatGender(bs->cs, CHAT_GENDERLESS);
ADDRFP4 0
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
LABELV $2189
LABELV $2187
line 5199
;5198:		// set the chat name
;5199:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 5200
;5200:		trap_BotSetChatName(bs->cs, name, bs->client);
ADDRLP4 1464
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1464
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRLP4 1464
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotSetChatName
CALLV
pop
line 5202
;5201:		//
;5202:		bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 1468
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1468
INDIRP4
CNSTI4 6044
ADDP4
ADDRLP4 1468
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 5203
;5203:		bs->lasthitcount     = bs->cur_ps.persistant[PERS_HITS];
ADDRLP4 1472
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1472
INDIRP4
CNSTI4 6048
ADDP4
ADDRLP4 1472
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
line 5205
;5204:		//
;5205:		bs->setupcount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6016
ADDP4
CNSTI4 0
ASGNI4
line 5207
;5206:		//
;5207:		BotSetupAlternativeRouteGoals();
ADDRGP4 BotSetupAlternativeRouteGoals
CALLV
pop
line 5208
;5208:	}
LABELV $2177
line 5210
;5209:	// no ideal view set
;5210:	bs->flags &= ~BFL_IDEALVIEWSET;
ADDRLP4 1460
ADDRFP4 0
INDIRP4
CNSTI4 5980
ADDP4
ASGNP4
ADDRLP4 1460
INDIRP4
ADDRLP4 1460
INDIRP4
INDIRI4
CNSTI4 -33
BANDI4
ASGNI4
line 5212
;5211:	//
;5212:	if (!BotIntermission(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1464
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 1464
INDIRI4
CNSTI4 0
NEI4 $2190
line 5214
;5213:		// set the teleport time
;5214:		BotSetTeleportTime(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeleportTime
CALLV
pop
line 5216
;5215:		// update some inventory values
;5216:		BotUpdateInventory(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotUpdateInventory
CALLV
pop
line 5218
;5217:		// check out the snapshot
;5218:		BotCheckSnapshot(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckSnapshot
CALLV
pop
line 5220
;5219:		// check for air
;5220:		BotCheckAir(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckAir
CALLV
pop
line 5221
;5221:	}
LABELV $2190
line 5223
;5222:	// check the console messages
;5223:	BotCheckConsoleMessages(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCheckConsoleMessages
CALLV
pop
line 5225
;5224:	// if not in the intermission and not in observer mode
;5225:	if (!BotIntermission(bs) && !BotIsObserver(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1468
ADDRGP4 BotIntermission
CALLI4
ASGNI4
ADDRLP4 1468
INDIRI4
CNSTI4 0
NEI4 $2192
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1472
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 1472
INDIRI4
CNSTI4 0
NEI4 $2192
line 5227
;5226:		// do team AI
;5227:		BotTeamAI(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamAI
CALLV
pop
line 5228
;5228:	}
LABELV $2192
line 5230
;5229:	// if the bot has no ai node
;5230:	if (!bs->ainode) {
ADDRFP4 0
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $2194
line 5231
;5231:		AIEnter_Seek_LTG(bs, "BotDeathmatchAI: no ai node");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2196
ARGP4
ADDRGP4 AIEnter_Seek_LTG
CALLV
pop
line 5232
;5232:	}
LABELV $2194
line 5234
;5233:	// if the bot entered the game less than 8 seconds ago
;5234:	if (!bs->entergamechat && bs->entergame_time > FloatTime() - 8) {
ADDRLP4 1476
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1476
INDIRP4
CNSTI4 6024
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2197
ADDRLP4 1476
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
SUBF4
LEF4 $2197
line 5235
;5235:		if (BotChat_EnterGame(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1480
ADDRGP4 BotChat_EnterGame
CALLI4
ASGNI4
ADDRLP4 1480
INDIRI4
CNSTI4 0
EQI4 $2199
line 5236
;5236:			bs->stand_time = FloatTime() + BotChatTime(bs);
ADDRLP4 1484
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1484
INDIRP4
ARGP4
ADDRLP4 1488
ADDRGP4 BotChatTime
CALLF4
ASGNF4
ADDRLP4 1484
INDIRP4
CNSTI4 6096
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1488
INDIRF4
ADDF4
ASGNF4
line 5237
;5237:			AIEnter_Stand(bs, "BotDeathmatchAI: chat enter game");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $2201
ARGP4
ADDRGP4 AIEnter_Stand
CALLV
pop
line 5238
;5238:		}
LABELV $2199
line 5239
;5239:		bs->entergamechat = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6024
ADDP4
CNSTI4 1
ASGNI4
line 5240
;5240:	}
LABELV $2197
line 5242
;5241:	// reset the node switches from the previous frame
;5242:	BotResetNodeSwitches();
ADDRGP4 BotResetNodeSwitches
CALLV
pop
line 5244
;5243:	// execute AI nodes
;5244:	for (i = 0; i < MAX_NODESWITCHES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $2202
line 5245
;5245:		if (bs->ainode(bs))
ADDRLP4 1480
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1480
INDIRP4
ARGP4
ADDRLP4 1484
ADDRLP4 1480
INDIRP4
CNSTI4 4900
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 1484
INDIRI4
CNSTI4 0
EQI4 $2206
line 5246
;5246:			break;
ADDRGP4 $2204
JUMPV
LABELV $2206
line 5247
;5247:	}
LABELV $2203
line 5244
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2202
LABELV $2204
line 5249
;5248:	// if the bot removed itself :)
;5249:	if (!bs->inuse)
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $2208
line 5250
;5250:		return;
ADDRGP4 $2176
JUMPV
LABELV $2208
line 5252
;5251:	// if the bot executed too many AI nodes
;5252:	if (i >= MAX_NODESWITCHES) {
ADDRLP4 0
INDIRI4
CNSTI4 50
LTI4 $2210
line 5253
;5253:		trap_BotDumpGoalStack(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpGoalStack
CALLV
pop
line 5254
;5254:		trap_BotDumpAvoidGoals(bs->gs);
ADDRFP4 0
INDIRP4
CNSTI4 6528
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_BotDumpAvoidGoals
CALLV
pop
line 5255
;5255:		BotDumpNodeSwitches(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotDumpNodeSwitches
CALLV
pop
line 5256
;5256:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 5257
;5257:		BotAI_Print(PRT_ERROR, "%s at %1.1f switched more than %d AI nodes\n", name, FloatTime(), MAX_NODESWITCHES);
CNSTI4 3
ARGI4
ADDRGP4 $2212
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 floattime
INDIRF4
ARGF4
CNSTI4 50
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 5258
;5258:	}
LABELV $2210
line 5260
;5259:	//
;5260:	bs->lastframe_health = bs->inventory[INVENTORY_HEALTH];
ADDRLP4 1480
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1480
INDIRP4
CNSTI4 6044
ADDP4
ADDRLP4 1480
INDIRP4
CNSTI4 5068
ADDP4
INDIRI4
ASGNI4
line 5261
;5261:	bs->lasthitcount     = bs->cur_ps.persistant[PERS_HITS];
ADDRLP4 1484
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1484
INDIRP4
CNSTI4 6048
ADDP4
ADDRLP4 1484
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
ASGNI4
line 5262
;5262:}
LABELV $2176
endproc BotDeathmatchAI 1492 20
export BotSetEntityNumForGoalWithModel
proc BotSetEntityNumForGoalWithModel 44 4
line 5269
;5263:
;5264:/*
;5265:==================
;5266:BotSetEntityNumForGoalWithModel
;5267:==================
;5268:*/
;5269:void BotSetEntityNumForGoalWithModel(bot_goal_t* goal, int eType, char* modelname) {
line 5274
;5270:	gentity_t* ent;
;5271:	int        i, modelindex;
;5272:	vec3_t     dir;
;5273:
;5274:	modelindex = G_ModelIndex(modelname);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_ModelIndex
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 5275
;5275:	ent        = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5276
;5276:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2217
JUMPV
LABELV $2214
line 5277
;5277:		if (!ent->inuse) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2219
line 5278
;5278:			continue;
ADDRGP4 $2215
JUMPV
LABELV $2219
line 5280
;5279:		}
;5280:		if (eType && ent->s.eType != eType) {
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $2221
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
EQI4 $2221
line 5281
;5281:			continue;
ADDRGP4 $2215
JUMPV
LABELV $2221
line 5283
;5282:		}
;5283:		if (ent->s.modelindex != modelindex) {
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ADDRLP4 20
INDIRI4
EQI4 $2223
line 5284
;5284:			continue;
ADDRGP4 $2215
JUMPV
LABELV $2223
line 5286
;5285:		}
;5286:		VectorSubtract(goal->origin, ent->s.origin, dir);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5287
;5287:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 40
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1120403456
GEF4 $2227
line 5288
;5288:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5289
;5289:			return;
ADDRGP4 $2213
JUMPV
LABELV $2227
line 5291
;5290:		}
;5291:	}
LABELV $2215
line 5276
ADDRLP4 16
ADDRLP4 16
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
LABELV $2217
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2214
line 5292
;5292:}
LABELV $2213
endproc BotSetEntityNumForGoalWithModel 44 4
export BotSetEntityNumForGoal
proc BotSetEntityNumForGoal 36 8
line 5299
;5293:
;5294:/*
;5295:==================
;5296:BotSetEntityNumForGoal
;5297:==================
;5298:*/
;5299:void BotSetEntityNumForGoal(bot_goal_t* goal, char* classname) {
line 5304
;5300:	gentity_t* ent;
;5301:	int        i;
;5302:	vec3_t     dir;
;5303:
;5304:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 5305
;5305:	for (i = 0; i < level.num_entities; i++, ent++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRGP4 $2233
JUMPV
LABELV $2230
line 5306
;5306:		if (!ent->inuse) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $2235
line 5307
;5307:			continue;
ADDRGP4 $2231
JUMPV
LABELV $2235
line 5309
;5308:		}
;5309:		if (!Q_stricmp(ent->classname, classname)) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $2237
line 5310
;5310:			continue;
ADDRGP4 $2231
JUMPV
LABELV $2237
line 5312
;5311:		}
;5312:		VectorSubtract(goal->origin, ent->s.origin, dir);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 5313
;5313:		if (VectorLengthSquared(dir) < Square(10)) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLengthSquared
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1120403456
GEF4 $2241
line 5314
;5314:			goal->entitynum = i;
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 5315
;5315:			return;
ADDRGP4 $2229
JUMPV
LABELV $2241
line 5317
;5316:		}
;5317:	}
LABELV $2231
line 5305
ADDRLP4 16
ADDRLP4 16
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
LABELV $2233
ADDRLP4 16
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $2230
line 5318
;5318:}
LABELV $2229
endproc BotSetEntityNumForGoal 36 8
export BotGoalForBSPEntity
proc BotGoalForBSPEntity 1128 20
line 5325
;5319:
;5320:/*
;5321:==================
;5322:BotGoalForBSPEntity
;5323:==================
;5324:*/
;5325:int BotGoalForBSPEntity(char* classname, bot_goal_t* goal) {
line 5330
;5326:	char   value[MAX_INFO_STRING];
;5327:	vec3_t origin, start, end;
;5328:	int    ent, numareas, areas[10];
;5329:
;5330:	memset(goal, 0, sizeof(bot_goal_t));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 5331
;5331:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 1108
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1108
INDIRI4
ASGNI4
ADDRGP4 $2247
JUMPV
LABELV $2244
line 5332
;5332:		if (!trap_AAS_ValueForBSPEpairKey(ent, "classname", value, sizeof(value)))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1824
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 1112
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $2248
line 5333
;5333:			continue;
ADDRGP4 $2245
JUMPV
LABELV $2248
line 5334
;5334:		if (!strcmp(value, classname)) {
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1116
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $2250
line 5335
;5335:			if (!trap_AAS_VectorForBSPEpairKey(ent, "origin", origin))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $1840
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1120
ADDRGP4 trap_AAS_VectorForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 1120
INDIRI4
CNSTI4 0
NEI4 $2252
line 5336
;5336:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2243
JUMPV
LABELV $2252
line 5337
;5337:			VectorCopy(origin, goal->origin);
ADDRFP4 4
INDIRP4
ADDRLP4 1028
INDIRB
ASGNB 12
line 5338
;5338:			VectorCopy(origin, start);
ADDRLP4 1040
ADDRLP4 1028
INDIRB
ASGNB 12
line 5339
;5339:			start[2] -= 32;
ADDRLP4 1040+8
ADDRLP4 1040+8
INDIRF4
CNSTF4 1107296256
SUBF4
ASGNF4
line 5340
;5340:			VectorCopy(origin, end);
ADDRLP4 1052
ADDRLP4 1028
INDIRB
ASGNB 12
line 5341
;5341:			end[2] += 32;
ADDRLP4 1052+8
ADDRLP4 1052+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 5342
;5342:			numareas = trap_AAS_TraceAreas(start, end, areas, NULL, 10);
ADDRLP4 1040
ARGP4
ADDRLP4 1052
ARGP4
ADDRLP4 1068
ARGP4
CNSTP4 0
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 1124
ADDRGP4 trap_AAS_TraceAreas
CALLI4
ASGNI4
ADDRLP4 1064
ADDRLP4 1124
INDIRI4
ASGNI4
line 5343
;5343:			if (!numareas)
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $2256
line 5344
;5344:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $2243
JUMPV
LABELV $2256
line 5345
;5345:			goal->areanum = areas[0];
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 1068
INDIRI4
ASGNI4
line 5346
;5346:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $2243
JUMPV
LABELV $2250
line 5348
;5347:		}
;5348:	}
LABELV $2245
line 5331
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1112
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1112
INDIRI4
ASGNI4
LABELV $2247
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2244
line 5349
;5349:	return qfalse;
CNSTI4 0
RETI4
LABELV $2243
endproc BotGoalForBSPEntity 1128 20
export BotSetupDeathmatchAI
proc BotSetupDeathmatchAI 152 16
line 5357
;5350:}
;5351:
;5352:/*
;5353:==================
;5354:BotSetupDeathmatchAI
;5355:==================
;5356:*/
;5357:void BotSetupDeathmatchAI(void) {
line 5361
;5358:	int  ent, modelnum;
;5359:	char model[128];
;5360:
;5361:	gametype = trap_Cvar_VariableIntegerValue("g_gametype");
ADDRGP4 $2259
ARGP4
ADDRLP4 136
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRGP4 gametype
ADDRLP4 136
INDIRI4
ASGNI4
line 5363
;5362:
;5363:	trap_Cvar_Register(&bot_rocketjump, "bot_rocketjump", "1", 0);
ADDRGP4 bot_rocketjump
ARGP4
ADDRGP4 $2260
ARGP4
ADDRGP4 $2074
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5364
;5364:	trap_Cvar_Register(&bot_grapple, "bot_grapple", "0", 0);
ADDRGP4 bot_grapple
ARGP4
ADDRGP4 $2261
ARGP4
ADDRGP4 $2262
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5365
;5365:	trap_Cvar_Register(&bot_fastchat, "bot_fastchat", "0", 0);
ADDRGP4 bot_fastchat
ARGP4
ADDRGP4 $2263
ARGP4
ADDRGP4 $2262
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5366
;5366:	trap_Cvar_Register(&bot_nochat, "bot_nochat", "0", 0);
ADDRGP4 bot_nochat
ARGP4
ADDRGP4 $2264
ARGP4
ADDRGP4 $2262
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5367
;5367:	trap_Cvar_Register(&bot_testrchat, "bot_testrchat", "0", 0);
ADDRGP4 bot_testrchat
ARGP4
ADDRGP4 $2073
ARGP4
ADDRGP4 $2262
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5368
;5368:	trap_Cvar_Register(&bot_challenge, "bot_challenge", "0", 0);
ADDRGP4 bot_challenge
ARGP4
ADDRGP4 $2265
ARGP4
ADDRGP4 $2262
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5369
;5369:	trap_Cvar_Register(&bot_predictobstacles, "bot_predictobstacles", "1", 0);
ADDRGP4 bot_predictobstacles
ARGP4
ADDRGP4 $2266
ARGP4
ADDRGP4 $2074
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5370
;5370:	trap_Cvar_Register(&g_spSkill, "g_spSkill", "2", 0);
ADDRGP4 g_spSkill
ARGP4
ADDRGP4 $2267
ARGP4
ADDRGP4 $2268
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 5372
;5371:	//
;5372:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $2269
line 5373
;5373:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2273
ARGP4
ADDRGP4 ctf_redflag
ARGP4
ADDRLP4 140
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 140
INDIRI4
CNSTI4 0
GEI4 $2271
line 5374
;5374:			BotAI_Print(PRT_WARNING, "CTF without Red Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2274
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2271
line 5375
;5375:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
CNSTI4 -1
ARGI4
ADDRGP4 $2277
ARGP4
ADDRGP4 ctf_blueflag
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
GEI4 $2275
line 5376
;5376:			BotAI_Print(PRT_WARNING, "CTF without Blue Flag\n");
CNSTI4 2
ARGI4
ADDRGP4 $2278
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
LABELV $2275
line 5377
;5377:	}
LABELV $2269
line 5406
;5378:#ifdef MISSIONPACK
;5379:	else if (gametype == GT_1FCTF) {
;5380:		if (trap_BotGetLevelItemGoal(-1, "Neutral Flag", &ctf_neutralflag) < 0)
;5381:			BotAI_Print(PRT_WARNING, "One Flag CTF without Neutral Flag\n");
;5382:		if (trap_BotGetLevelItemGoal(-1, "Red Flag", &ctf_redflag) < 0)
;5383:			BotAI_Print(PRT_WARNING, "One Flag CTF without Red Flag\n");
;5384:		if (trap_BotGetLevelItemGoal(-1, "Blue Flag", &ctf_blueflag) < 0)
;5385:			BotAI_Print(PRT_WARNING, "One Flag CTF without Blue Flag\n");
;5386:	} else if (gametype == GT_OBELISK) {
;5387:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
;5388:			BotAI_Print(PRT_WARNING, "Obelisk without red obelisk\n");
;5389:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
;5390:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
;5391:			BotAI_Print(PRT_WARNING, "Obelisk without blue obelisk\n");
;5392:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
;5393:	} else if (gametype == GT_HARVESTER) {
;5394:		if (trap_BotGetLevelItemGoal(-1, "Red Obelisk", &redobelisk) < 0)
;5395:			BotAI_Print(PRT_WARNING, "Harvester without red obelisk\n");
;5396:		BotSetEntityNumForGoal(&redobelisk, "team_redobelisk");
;5397:		if (trap_BotGetLevelItemGoal(-1, "Blue Obelisk", &blueobelisk) < 0)
;5398:			BotAI_Print(PRT_WARNING, "Harvester without blue obelisk\n");
;5399:		BotSetEntityNumForGoal(&blueobelisk, "team_blueobelisk");
;5400:		if (trap_BotGetLevelItemGoal(-1, "Neutral Obelisk", &neutralobelisk) < 0)
;5401:			BotAI_Print(PRT_WARNING, "Harvester without neutral obelisk\n");
;5402:		BotSetEntityNumForGoal(&neutralobelisk, "team_neutralobelisk");
;5403:	}
;5404:#endif
;5405:
;5406:	max_bspmodelindex = 0;
ADDRGP4 max_bspmodelindex
CNSTI4 0
ASGNI4
line 5407
;5407:	for (ent = trap_AAS_NextBSPEntity(0); ent; ent = trap_AAS_NextBSPEntity(ent)) {
CNSTI4 0
ARGI4
ADDRLP4 140
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 140
INDIRI4
ASGNI4
ADDRGP4 $2282
JUMPV
LABELV $2279
line 5408
;5408:		if (!trap_AAS_ValueForBSPEpairKey(ent, "model", model, sizeof(model)))
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 $271
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRLP4 144
ADDRGP4 trap_AAS_ValueForBSPEpairKey
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
NEI4 $2283
line 5409
;5409:			continue;
ADDRGP4 $2280
JUMPV
LABELV $2283
line 5410
;5410:		if (model[0] == '*') {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $2285
line 5411
;5411:			modelnum = atoi(model + 1);
ADDRLP4 4+1
ARGP4
ADDRLP4 148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
ADDRLP4 148
INDIRI4
ASGNI4
line 5412
;5412:			if (modelnum > max_bspmodelindex)
ADDRLP4 132
INDIRI4
ADDRGP4 max_bspmodelindex
INDIRI4
LEI4 $2288
line 5413
;5413:				max_bspmodelindex = modelnum;
ADDRGP4 max_bspmodelindex
ADDRLP4 132
INDIRI4
ASGNI4
LABELV $2288
line 5414
;5414:		}
LABELV $2285
line 5415
;5415:	}
LABELV $2280
line 5407
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 144
ADDRGP4 trap_AAS_NextBSPEntity
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 144
INDIRI4
ASGNI4
LABELV $2282
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $2279
line 5417
;5416:	// initialize the waypoint heap
;5417:	BotInitWaypoints();
ADDRGP4 BotInitWaypoints
CALLV
pop
line 5418
;5418:}
LABELV $2258
endproc BotSetupDeathmatchAI 152 16
export BotShutdownDeathmatchAI
proc BotShutdownDeathmatchAI 0 0
line 5425
;5419:
;5420:/*
;5421:==================
;5422:BotShutdownDeathmatchAI
;5423:==================
;5424:*/
;5425:void BotShutdownDeathmatchAI(void) {
line 5426
;5426:	altroutegoals_setup = qfalse;
ADDRGP4 altroutegoals_setup
CNSTI4 0
ASGNI4
line 5427
;5427:}
LABELV $2290
endproc BotShutdownDeathmatchAI 0 0
import g_clients
bss
export blue_numaltroutegoals
align 4
LABELV blue_numaltroutegoals
skip 4
export blue_altroutegoals
align 4
LABELV blue_altroutegoals
skip 768
export red_numaltroutegoals
align 4
LABELV red_numaltroutegoals
skip 4
export red_altroutegoals
align 4
LABELV red_altroutegoals
skip 768
export altroutegoals_setup
align 4
LABELV altroutegoals_setup
skip 4
export max_bspmodelindex
align 4
LABELV max_bspmodelindex
skip 4
export lastteleport_time
align 4
LABELV lastteleport_time
skip 4
export lastteleport_origin
align 4
LABELV lastteleport_origin
skip 12
import bot_developer
export g_spSkill
align 4
LABELV g_spSkill
skip 272
export bot_predictobstacles
align 4
LABELV bot_predictobstacles
skip 272
export botai_freewaypoints
align 4
LABELV botai_freewaypoints
skip 4
export botai_waypoints
align 4
LABELV botai_waypoints
skip 12800
import BotVoiceChatOnly
import BotVoiceChat
import BotSetTeamMateTaskPreference
import BotGetTeamMateTaskPreference
import BotTeamAI
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
export ctf_blueflag
align 4
LABELV ctf_blueflag
skip 56
export ctf_redflag
align 4
LABELV ctf_redflag
skip 56
export bot_challenge
align 4
LABELV bot_challenge
skip 272
export bot_testrchat
align 4
LABELV bot_testrchat
skip 272
export bot_nochat
align 4
LABELV bot_nochat
skip 272
export bot_fastchat
align 4
LABELV bot_fastchat
skip 272
export bot_rocketjump
align 4
LABELV bot_rocketjump
skip 272
export bot_grapple
align 4
LABELV bot_grapple
skip 272
import mapname
export gametype
align 4
LABELV gametype
skip 4
import BotTeamLeader
import BotAI_GetSnapshotEntity
import BotAI_GetEntityState
import BotAI_GetClientState
import BotAI_Trace
import BotAI_BotInitialChat
import BotAI_Print
import floattime
import BotEntityInfo
import NumBots
import BotResetState
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
LABELV $2278
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2277
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $2274
byte 1 67
byte 1 84
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 10
byte 1 0
align 1
LABELV $2273
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $2268
byte 1 50
byte 1 0
align 1
LABELV $2267
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
LABELV $2266
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 111
byte 1 98
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $2265
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 99
byte 1 104
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $2264
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
LABELV $2263
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 102
byte 1 97
byte 1 115
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2262
byte 1 48
byte 1 0
align 1
LABELV $2261
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $2260
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $2259
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
LABELV $2212
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 65
byte 1 73
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $2201
byte 1 66
byte 1 111
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $2196
byte 1 66
byte 1 111
byte 1 116
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 65
byte 1 73
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 97
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $2185
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $2181
byte 1 115
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $2141
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
LABELV $2138
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 58
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
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
byte 1 10
byte 1 0
align 1
LABELV $2117
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $2114
byte 1 69
byte 1 86
byte 1 95
byte 1 71
byte 1 76
byte 1 79
byte 1 66
byte 1 65
byte 1 76
byte 1 95
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 58
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 80
byte 1 97
byte 1 114
byte 1 109
byte 1 32
byte 1 40
byte 1 37
byte 1 100
byte 1 41
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
byte 1 10
byte 1 0
align 1
LABELV $2085
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 67
byte 1 111
byte 1 110
byte 1 115
byte 1 111
byte 1 108
byte 1 101
byte 1 77
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 121
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $2078
byte 1 42
byte 1 42
byte 1 42
byte 1 42
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
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 121
byte 1 32
byte 1 42
byte 1 42
byte 1 42
byte 1 42
byte 1 10
byte 1 0
align 1
LABELV $2077
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
LABELV $2074
byte 1 49
byte 1 0
align 1
LABELV $2073
byte 1 98
byte 1 111
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $1950
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 73
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1949
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 73
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 97
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $1945
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 111
byte 1 70
byte 1 111
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $1933
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1932
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1929
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $1918
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
LABELV $1905
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1899
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $1891
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $1880
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
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
LABELV $1876
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
byte 1 0
align 1
LABELV $1873
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $1840
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $1835
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $1830
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $1827
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $1824
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $1823
byte 1 66
byte 1 111
byte 1 116
byte 1 71
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 97
byte 1 116
byte 1 101
byte 1 71
byte 1 111
byte 1 97
byte 1 108
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $1811
byte 1 42
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $1630
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $1607
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $1604
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $1566
byte 1 109
byte 1 112
byte 1 113
byte 1 51
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 54
byte 1 0
align 1
LABELV $1511
byte 1 113
byte 1 51
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 121
byte 1 54
byte 1 0
align 1
LABELV $656
byte 1 73
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $655
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $654
byte 1 66
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 32
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $653
byte 1 82
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $652
byte 1 81
byte 1 117
byte 1 97
byte 1 100
byte 1 32
byte 1 68
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $485
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 87
byte 1 97
byte 1 121
byte 1 80
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 79
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 119
byte 1 97
byte 1 121
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $271
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $270
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 107
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
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
byte 1 10
byte 1 0
align 1
LABELV $266
byte 1 110
byte 1 0
align 1
LABELV $265
byte 1 91
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
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
byte 1 93
byte 1 0
align 1
LABELV $264
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
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
byte 1 10
byte 1 0
align 1
LABELV $160
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $159
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $69
byte 1 116
byte 1 0
