export BotGetItemTeamGoal
code
proc BotGetItemTeamGoal 12 12
file "../../../../code/game/ai_cmd.c"
line 127
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_cmd.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_cmd.c $
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
;38:#include "../../ui/menudef.h"
;39:#endif
;40:
;41:int notleader[MAX_CLIENTS];
;42:
;43:#ifdef DEBUG
;44:/*
;45:==================
;46:BotPrintTeamGoal
;47:==================
;48:*/
;49:void BotPrintTeamGoal(bot_state_t* bs) {
;50:	char  netname[MAX_NETNAME];
;51:	float t;
;52:
;53:	ClientName(bs->client, netname, sizeof(netname));
;54:	t = bs->teamgoal_time - FloatTime();
;55:	switch (bs->ltgtype) {
;56:	case LTG_TEAMHELP: {
;57:		BotAI_Print(PRT_MESSAGE, "%s: I'm gonna help a team mate for %1.0f secs\n", netname, t);
;58:		break;
;59:	}
;60:	case LTG_TEAMACCOMPANY: {
;61:		BotAI_Print(PRT_MESSAGE, "%s: I'm gonna accompany a team mate for %1.0f secs\n", netname, t);
;62:		break;
;63:	}
;64:	case LTG_GETFLAG: {
;65:		BotAI_Print(PRT_MESSAGE, "%s: I'm gonna get the flag for %1.0f secs\n", netname, t);
;66:		break;
;67:	}
;68:	case LTG_RUSHBASE: {
;69:		BotAI_Print(PRT_MESSAGE, "%s: I'm gonna rush to the base for %1.0f secs\n", netname, t);
;70:		break;
;71:	}
;72:	case LTG_RETURNFLAG: {
;73:		BotAI_Print(PRT_MESSAGE, "%s: I'm gonna try to return the flag for %1.0f secs\n", netname, t);
;74:		break;
;75:	}
;76:#ifdef MISSIONPACK
;77:	case LTG_ATTACKENEMYBASE: {
;78:		BotAI_Print(PRT_MESSAGE, "%s: I'm gonna attack the enemy base for %1.0f secs\n", netname, t);
;79:		break;
;80:	}
;81:	case LTG_HARVEST: {
;82:		BotAI_Print(PRT_MESSAGE, "%s: I'm gonna harvest for %1.0f secs\n", netname, t);
;83:		break;
;84:	}
;85:#endif
;86:	case LTG_DEFENDKEYAREA: {
;87:		BotAI_Print(PRT_MESSAGE, "%s: I'm gonna defend a key area for %1.0f secs\n", netname, t);
;88:		break;
;89:	}
;90:	case LTG_GETITEM: {
;91:		BotAI_Print(PRT_MESSAGE, "%s: I'm gonna get an item for %1.0f secs\n", netname, t);
;92:		break;
;93:	}
;94:	case LTG_KILL: {
;95:		BotAI_Print(PRT_MESSAGE, "%s: I'm gonna kill someone for %1.0f secs\n", netname, t);
;96:		break;
;97:	}
;98:	case LTG_CAMP:
;99:	case LTG_CAMPORDER: {
;100:		BotAI_Print(PRT_MESSAGE, "%s: I'm gonna camp for %1.0f secs\n", netname, t);
;101:		break;
;102:	}
;103:	case LTG_PATROL: {
;104:		BotAI_Print(PRT_MESSAGE, "%s: I'm gonna patrol for %1.0f secs\n", netname, t);
;105:		break;
;106:	}
;107:	default: {
;108:		if (bs->ctfroam_time > FloatTime()) {
;109:			t = bs->ctfroam_time - FloatTime();
;110:			BotAI_Print(PRT_MESSAGE, "%s: I'm gonna roam for %1.0f secs\n", netname, t);
;111:		} else {
;112:			BotAI_Print(PRT_MESSAGE, "%s: I've got a regular goal\n", netname);
;113:		}
;114:	}
;115:	}
;116:}
;117:#endif  // DEBUG
;118:
;119:/*
;120:==================
;121:BotGetItemTeamGoal
;122:
;123:FIXME: add stuff like "upper rocket launcher"
;124:"the rl near the railgun", "lower grenade launcher" etc.
;125:==================
;126:*/
;127:int BotGetItemTeamGoal(char* goalname, bot_goal_t* goal) {
line 130
;128:	int i;
;129:
;130:	if (!strlen(goalname))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $56
line 131
;131:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $55
JUMPV
LABELV $56
line 132
;132:	i = -1;
ADDRLP4 0
CNSTI4 -1
ASGNI4
LABELV $58
line 133
;133:	do {
line 134
;134:		i = trap_BotGetLevelItemGoal(i, goalname, goal);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 135
;135:		if (i > 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $61
line 137
;136:			// do NOT defend dropped items
;137:			if (goal->flags & GFL_DROPPED)
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $63
line 138
;138:				continue;
ADDRGP4 $59
JUMPV
LABELV $63
line 139
;139:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $55
JUMPV
LABELV $61
line 141
;140:		}
;141:	} while (i > 0);
LABELV $59
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $58
line 142
;142:	return qfalse;
CNSTI4 0
RETI4
LABELV $55
endproc BotGetItemTeamGoal 12 12
export BotGetMessageTeamGoal
proc BotGetMessageTeamGoal 12 12
line 150
;143:}
;144:
;145:/*
;146:==================
;147:BotGetMessageTeamGoal
;148:==================
;149:*/
;150:int BotGetMessageTeamGoal(bot_state_t* bs, char* goalname, bot_goal_t* goal) {
line 153
;151:	bot_waypoint_t* cp;
;152:
;153:	if (BotGetItemTeamGoal(goalname, goal))
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotGetItemTeamGoal
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $66
line 154
;154:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $65
JUMPV
LABELV $66
line 156
;155:
;156:	cp = BotFindWayPoint(bs->checkpoints, goalname);
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotFindWayPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 157
;157:	if (cp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $68
line 158
;158:		memcpy(goal, &cp->goal, sizeof(bot_goal_t));
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 159
;159:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $65
JUMPV
LABELV $68
line 161
;160:	}
;161:	return qfalse;
CNSTI4 0
RETI4
LABELV $65
endproc BotGetMessageTeamGoal 12 12
export BotGetTime
proc BotGetTime 600 16
line 169
;162:}
;163:
;164:/*
;165:==================
;166:BotGetTime
;167:==================
;168:*/
;169:float BotGetTime(bot_match_t* match) {
line 175
;170:	bot_match_t timematch;
;171:	char        timestring[MAX_MESSAGE_SIZE];
;172:	float       t;
;173:
;174:	// if the matched string has a time
;175:	if (match->subtype & ST_TIME) {
ADDRFP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $71
line 177
;176:		// get the time string
;177:		trap_BotMatchVariable(match, TIME, timestring, MAX_MESSAGE_SIZE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 179
;178:		// match it to find out if the time is in seconds or minutes
;179:		if (trap_BotFindMatch(timestring, &timematch, MTCONTEXT_TIME)) {
ADDRLP4 0
ARGP4
ADDRLP4 256
ARGP4
CNSTU4 8
ARGU4
ADDRLP4 588
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 588
INDIRI4
CNSTI4 0
EQI4 $73
line 180
;180:			if (timematch.type == MSG_FOREVER) {
ADDRLP4 256+256
INDIRI4
CNSTI4 107
NEI4 $75
line 181
;181:				t = 99999999.0f;
ADDRLP4 584
CNSTF4 1287568416
ASGNF4
line 182
;182:			} else if (timematch.type == MSG_FORAWHILE) {
ADDRGP4 $76
JUMPV
LABELV $75
ADDRLP4 256+256
INDIRI4
CNSTI4 109
NEI4 $78
line 183
;183:				t = 10 * 60;  // 10 minutes
ADDRLP4 584
CNSTF4 1142292480
ASGNF4
line 184
;184:			} else if (timematch.type == MSG_FORALONGTIME) {
ADDRGP4 $79
JUMPV
LABELV $78
ADDRLP4 256+256
INDIRI4
CNSTI4 108
NEI4 $81
line 185
;185:				t = 30 * 60;  // 30 minutes
ADDRLP4 584
CNSTF4 1155596288
ASGNF4
line 186
;186:			} else {
ADDRGP4 $82
JUMPV
LABELV $81
line 187
;187:				trap_BotMatchVariable(&timematch, TIME, timestring, MAX_MESSAGE_SIZE);
ADDRLP4 256
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 188
;188:				if (timematch.type == MSG_MINUTES)
ADDRLP4 256+256
INDIRI4
CNSTI4 105
NEI4 $84
line 189
;189:					t = atof(timestring) * 60;
ADDRLP4 0
ARGP4
ADDRLP4 592
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 584
ADDRLP4 592
INDIRF4
CNSTF4 1114636288
MULF4
ASGNF4
ADDRGP4 $85
JUMPV
LABELV $84
line 190
;190:				else if (timematch.type == MSG_SECONDS)
ADDRLP4 256+256
INDIRI4
CNSTI4 106
NEI4 $87
line 191
;191:					t = atof(timestring);
ADDRLP4 0
ARGP4
ADDRLP4 596
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 584
ADDRLP4 596
INDIRF4
ASGNF4
ADDRGP4 $88
JUMPV
LABELV $87
line 193
;192:				else
;193:					t = 0;
ADDRLP4 584
CNSTF4 0
ASGNF4
LABELV $88
LABELV $85
line 194
;194:			}
LABELV $82
LABELV $79
LABELV $76
line 196
;195:			// if there's a valid time
;196:			if (t > 0)
ADDRLP4 584
INDIRF4
CNSTF4 0
LEF4 $90
line 197
;197:				return FloatTime() + t;
ADDRGP4 floattime
INDIRF4
ADDRLP4 584
INDIRF4
ADDF4
RETF4
ADDRGP4 $70
JUMPV
LABELV $90
line 198
;198:		}
LABELV $73
line 199
;199:	}
LABELV $71
line 200
;200:	return 0;
CNSTF4 0
RETF4
LABELV $70
endproc BotGetTime 600 16
export FindClientByName
proc FindClientByName 1032 12
line 208
;201:}
;202:
;203:/*
;204:==================
;205:FindClientByName
;206:==================
;207:*/
;208:int FindClientByName(const char* name) {
line 212
;209:	char buf[MAX_INFO_STRING];
;210:	int  i;
;211:
;212:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $96
JUMPV
LABELV $93
line 213
;213:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 214
;214:		if (!Q_stricmp(buf, name))
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $98
line 215
;215:			return i;  // exact match
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $92
JUMPV
LABELV $98
line 216
;216:	}
LABELV $94
line 212
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $96
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $93
line 218
;217:
;218:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $100
line 219
;219:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 220
;220:		if (stristr(buf, name))
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1028
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $105
line 221
;221:			return i;  // partial match
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $92
JUMPV
LABELV $105
line 222
;222:	}
LABELV $101
line 218
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $103
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $100
line 224
;223:
;224:	return -1;
CNSTI4 -1
RETI4
LABELV $92
endproc FindClientByName 1032 12
export FindEnemyByName
proc FindEnemyByName 1036 12
line 232
;225:}
;226:
;227:/*
;228:==================
;229:FindEnemyByName
;230:==================
;231:*/
;232:int FindEnemyByName(bot_state_t* bs, const char* name) {
line 236
;233:	char buf[MAX_INFO_STRING];
;234:	int  i;
;235:
;236:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $111
JUMPV
LABELV $108
line 237
;237:		if (BotSameTeam(bs, i))
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
EQI4 $113
line 238
;238:			continue;
ADDRGP4 $109
JUMPV
LABELV $113
line 239
;239:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 240
;240:		if (!Q_stricmp(buf, name))
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $115
line 241
;241:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $107
JUMPV
LABELV $115
line 242
;242:	}
LABELV $109
line 236
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $111
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $108
line 244
;243:
;244:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $120
JUMPV
LABELV $117
line 245
;245:		if (BotSameTeam(bs, i))
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
EQI4 $122
line 246
;246:			continue;
ADDRGP4 $118
JUMPV
LABELV $122
line 247
;247:		ClientName(i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 248
;248:		if (stristr(buf, name))
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $124
line 249
;249:			return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $107
JUMPV
LABELV $124
line 250
;250:	}
LABELV $118
line 244
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $120
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $117
line 252
;251:
;252:	return -1;
CNSTI4 -1
RETI4
LABELV $107
endproc FindEnemyByName 1036 12
export NumPlayersOnSameTeam
proc NumPlayersOnSameTeam 1036 12
line 260
;253:}
;254:
;255:/*
;256:==================
;257:NumPlayersOnSameTeam
;258:==================
;259:*/
;260:int NumPlayersOnSameTeam(bot_state_t* bs) {
line 264
;261:	int  i, num;
;262:	char buf[MAX_INFO_STRING];
;263:
;264:	num = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 265
;265:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $130
JUMPV
LABELV $127
line 266
;266:		trap_GetConfigstring(CS_PLAYERS + i, buf, MAX_INFO_STRING);
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
line 267
;267:		if (buf[0]) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $132
line 268
;268:			if (BotSameTeam(bs, i + 1))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1032
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
EQI4 $134
line 269
;269:				num++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $134
line 270
;270:		}
LABELV $132
line 271
;271:	}
LABELV $128
line 265
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $130
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $127
line 272
;272:	return num;
ADDRLP4 1028
INDIRI4
RETI4
LABELV $126
endproc NumPlayersOnSameTeam 1036 12
export BotGetPatrolWaypoints
proc BotGetPatrolWaypoints 672 16
line 280
;273:}
;274:
;275:/*
;276:==================
;277:TeamPlayIsOn
;278:==================
;279:*/
;280:int BotGetPatrolWaypoints(bot_state_t* bs, bot_match_t* match) {
line 287
;281:	char            keyarea[MAX_MESSAGE_SIZE];
;282:	int             patrolflags;
;283:	bot_waypoint_t *wp, *newwp, *newpatrolpoints;
;284:	bot_match_t     keyareamatch;
;285:	bot_goal_t      goal;
;286:
;287:	newpatrolpoints = NULL;
ADDRLP4 592
CNSTP4 0
ASGNP4
line 288
;288:	patrolflags     = 0;
ADDRLP4 652
CNSTI4 0
ASGNI4
line 290
;289:	//
;290:	trap_BotMatchVariable(match, KEYAREA, keyarea, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
ADDRGP4 $138
JUMPV
LABELV $137
line 292
;291:	//
;292:	while (1) {
line 293
;293:		if (!trap_BotFindMatch(keyarea, &keyareamatch, MTCONTEXT_PATROLKEYAREA)) {
ADDRLP4 8
ARGP4
ADDRLP4 264
ARGP4
CNSTU4 64
ARGU4
ADDRLP4 656
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 656
INDIRI4
CNSTI4 0
NEI4 $140
line 294
;294:			trap_EA_SayTeam(bs->client, "what do you say?");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $142
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 295
;295:			BotFreeWaypoints(newpatrolpoints);
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 296
;296:			bs->patrolpoints = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
CNSTP4 0
ASGNP4
line 297
;297:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $136
JUMPV
LABELV $140
line 299
;298:		}
;299:		trap_BotMatchVariable(&keyareamatch, KEYAREA, keyarea, MAX_MESSAGE_SIZE);
ADDRLP4 264
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 300
;300:		if (!BotGetMessageTeamGoal(bs, keyarea, &goal)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 596
ARGP4
ADDRLP4 660
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 0
NEI4 $143
line 303
;301:			// BotAI_BotInitialChat(bs, "cannotfind", keyarea, NULL);
;302:			// trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
;303:			BotFreeWaypoints(newpatrolpoints);
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 304
;304:			bs->patrolpoints = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
CNSTP4 0
ASGNP4
line 305
;305:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $136
JUMPV
LABELV $143
line 308
;306:		}
;307:		// create a new waypoint
;308:		newwp = BotCreateWayPoint(keyarea, goal.origin, goal.areanum);
ADDRLP4 8
ARGP4
ADDRLP4 596
ARGP4
ADDRLP4 596+12
INDIRI4
ARGI4
ADDRLP4 664
ADDRGP4 BotCreateWayPoint
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 664
INDIRP4
ASGNP4
line 309
;309:		if (!newwp)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $146
line 310
;310:			break;
ADDRGP4 $139
JUMPV
LABELV $146
line 312
;311:		// add the waypoint to the patrol points
;312:		newwp->next = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
CNSTP4 0
ASGNP4
line 313
;313:		for (wp = newpatrolpoints; wp && wp->next; wp = wp->next)
ADDRLP4 0
ADDRLP4 592
INDIRP4
ASGNP4
ADDRGP4 $151
JUMPV
LABELV $148
line 314
;314:			;
LABELV $149
line 313
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $151
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $152
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $148
LABELV $152
line 315
;315:		if (!wp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $153
line 316
;316:			newpatrolpoints = newwp;
ADDRLP4 592
ADDRLP4 4
INDIRP4
ASGNP4
line 317
;317:			newwp->prev     = NULL;
ADDRLP4 4
INDIRP4
CNSTI4 96
ADDP4
CNSTP4 0
ASGNP4
line 318
;318:		} else {
ADDRGP4 $154
JUMPV
LABELV $153
line 319
;319:			wp->next    = newwp;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 320
;320:			newwp->prev = wp;
ADDRLP4 4
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 321
;321:		}
LABELV $154
line 323
;322:		//
;323:		if (keyareamatch.subtype & ST_BACK) {
ADDRLP4 264+260
INDIRI4
CNSTI4 512
BANDI4
CNSTI4 0
EQI4 $155
line 324
;324:			patrolflags = PATROL_LOOP;
ADDRLP4 652
CNSTI4 1
ASGNI4
line 325
;325:			break;
ADDRGP4 $139
JUMPV
LABELV $155
line 326
;326:		} else if (keyareamatch.subtype & ST_REVERSE) {
ADDRLP4 264+260
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $158
line 327
;327:			patrolflags = PATROL_REVERSE;
ADDRLP4 652
CNSTI4 2
ASGNI4
line 328
;328:			break;
ADDRGP4 $139
JUMPV
LABELV $158
line 329
;329:		} else if (keyareamatch.subtype & ST_MORE) {
ADDRLP4 264+260
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
EQI4 $139
line 330
;330:			trap_BotMatchVariable(&keyareamatch, MORE, keyarea, MAX_MESSAGE_SIZE);
ADDRLP4 264
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 331
;331:		} else {
line 332
;332:			break;
LABELV $162
line 334
;333:		}
;334:	}
LABELV $138
line 292
ADDRGP4 $137
JUMPV
LABELV $139
line 336
;335:	//
;336:	if (!newpatrolpoints || !newpatrolpoints->next) {
ADDRLP4 592
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $166
ADDRLP4 592
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $164
LABELV $166
line 337
;337:		trap_EA_SayTeam(bs->client, "I need more key points to patrol\n");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $167
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 338
;338:		BotFreeWaypoints(newpatrolpoints);
ADDRLP4 592
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 339
;339:		newpatrolpoints = NULL;
ADDRLP4 592
CNSTP4 0
ASGNP4
line 340
;340:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $136
JUMPV
LABELV $164
line 343
;341:	}
;342:	//
;343:	BotFreeWaypoints(bs->patrolpoints);
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
ARGP4
ADDRGP4 BotFreeWaypoints
CALLV
pop
line 344
;344:	bs->patrolpoints = newpatrolpoints;
ADDRFP4 0
INDIRP4
CNSTI4 9080
ADDP4
ADDRLP4 592
INDIRP4
ASGNP4
line 346
;345:	//
;346:	bs->curpatrolpoint = bs->patrolpoints;
ADDRLP4 660
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 660
INDIRP4
CNSTI4 9084
ADDP4
ADDRLP4 660
INDIRP4
CNSTI4 9080
ADDP4
INDIRP4
ASGNP4
line 347
;347:	bs->patrolflags    = patrolflags;
ADDRFP4 0
INDIRP4
CNSTI4 9088
ADDP4
ADDRLP4 652
INDIRI4
ASGNI4
line 349
;348:	//
;349:	return qtrue;
CNSTI4 1
RETI4
LABELV $136
endproc BotGetPatrolWaypoints 672 16
export BotAddressedToBot
proc BotAddressedToBot 1572 16
line 357
;350:}
;351:
;352:/*
;353:==================
;354:BotAddressedToBot
;355:==================
;356:*/
;357:int BotAddressedToBot(bot_state_t* bs, bot_match_t* match) {
line 365
;358:	char        addressedto[MAX_MESSAGE_SIZE];
;359:	char        netname[MAX_MESSAGE_SIZE];
;360:	char        name[MAX_MESSAGE_SIZE];
;361:	char        botname[128];
;362:	int         client;
;363:	bot_match_t addresseematch;
;364:
;365:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 840
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 366
;366:	client = ClientOnSameTeamFromName(bs, netname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 840
ARGP4
ADDRLP4 1228
ADDRGP4 ClientOnSameTeamFromName
CALLI4
ASGNI4
ADDRLP4 1096
ADDRLP4 1228
INDIRI4
ASGNI4
line 367
;367:	if (client < 0)
ADDRLP4 1096
INDIRI4
CNSTI4 0
GEI4 $169
line 368
;368:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $168
JUMPV
LABELV $169
line 370
;369:	// if the message is addressed to someone
;370:	if (match->subtype & ST_ADDRESSED) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $171
line 371
;371:		trap_BotMatchVariable(match, ADDRESSEE, addressedto, sizeof(addressedto));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 584
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 373
;372:		// the name of this bot
;373:		ClientName(bs->client, botname, 128);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 1100
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 ClientName
CALLP4
pop
ADDRGP4 $174
JUMPV
LABELV $173
line 375
;374:		//
;375:		while (trap_BotFindMatch(addressedto, &addresseematch, MTCONTEXT_ADDRESSEE)) {
line 376
;376:			if (addresseematch.type == MSG_EVERYONE) {
ADDRLP4 0+256
INDIRI4
CNSTI4 101
NEI4 $176
line 377
;377:				return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $168
JUMPV
LABELV $176
line 378
;378:			} else if (addresseematch.type == MSG_MULTIPLENAMES) {
ADDRLP4 0+256
INDIRI4
CNSTI4 102
NEI4 $179
line 379
;379:				trap_BotMatchVariable(&addresseematch, TEAMMATE, name, sizeof(name));
ADDRLP4 0
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 328
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 380
;380:				if (strlen(name)) {
ADDRLP4 328
ARGP4
ADDRLP4 1232
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
EQI4 $182
line 381
;381:					if (stristr(botname, name))
ADDRLP4 1100
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1236
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $184
line 382
;382:						return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $168
JUMPV
LABELV $184
line 383
;383:					if (stristr(bs->subteam, name))
ADDRFP4 0
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1240
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1240
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $186
line 384
;384:						return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $168
JUMPV
LABELV $186
line 385
;385:				}
LABELV $182
line 386
;386:				trap_BotMatchVariable(&addresseematch, MORE, addressedto, MAX_MESSAGE_SIZE);
ADDRLP4 0
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 584
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 387
;387:			} else {
ADDRGP4 $180
JUMPV
LABELV $179
line 388
;388:				trap_BotMatchVariable(&addresseematch, TEAMMATE, name, MAX_MESSAGE_SIZE);
ADDRLP4 0
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 328
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 389
;389:				if (strlen(name)) {
ADDRLP4 328
ARGP4
ADDRLP4 1232
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
EQI4 $175
line 390
;390:					if (stristr(botname, name))
ADDRLP4 1100
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1236
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $190
line 391
;391:						return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $168
JUMPV
LABELV $190
line 392
;392:					if (stristr(bs->subteam, name))
ADDRFP4 0
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
ADDRLP4 328
ARGP4
ADDRLP4 1240
ADDRGP4 stristr
CALLP4
ASGNP4
ADDRLP4 1240
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $175
line 393
;393:						return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $168
JUMPV
line 394
;394:				}
line 395
;395:				break;
LABELV $180
line 397
;396:			}
;397:		}
LABELV $174
line 375
ADDRLP4 584
ARGP4
ADDRLP4 0
ARGP4
CNSTU4 32
ARGU4
ADDRLP4 1232
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 1232
INDIRI4
CNSTI4 0
NEI4 $173
LABELV $175
line 400
;398:		// Com_sprintf(buf, sizeof(buf), "not addressed to me but %s", addressedto);
;399:		// trap_EA_Say(bs->client, buf);
;400:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $168
JUMPV
LABELV $171
line 401
;401:	} else {
line 404
;402:		bot_match_t tellmatch;
;403:
;404:		tellmatch.type = 0;
ADDRLP4 1232+256
CNSTI4 0
ASGNI4
line 406
;405:		// if this message wasn't directed solely to this bot
;406:		if (!trap_BotFindMatch(match->string, &tellmatch, MTCONTEXT_REPLYCHAT) || tellmatch.type != MSG_CHATTELL) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1232
ARGP4
CNSTU4 128
ARGU4
ADDRLP4 1560
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 1560
INDIRI4
CNSTI4 0
EQI4 $198
ADDRLP4 1232+256
INDIRI4
CNSTI4 202
EQI4 $195
LABELV $198
line 408
;407:			// make sure not everyone reacts to this message
;408:			if (random() > (float)1.0 / (NumPlayersOnSameTeam(bs) - 1))
ADDRLP4 1564
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1568
ADDRGP4 NumPlayersOnSameTeam
CALLI4
ASGNI4
ADDRLP4 1564
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1065353216
ADDRLP4 1568
INDIRI4
CNSTI4 1
SUBI4
CVIF4 4
DIVF4
LEF4 $199
line 409
;409:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $168
JUMPV
LABELV $199
line 410
;410:		}
LABELV $195
line 411
;411:	}
line 412
;412:	return qtrue;
CNSTI4 1
RETI4
LABELV $168
endproc BotAddressedToBot 1572 16
export BotGPSToPosition
proc BotGPSToPosition 20 12
line 420
;413:}
;414:
;415:/*
;416:==================
;417:BotGPSToPosition
;418:==================
;419:*/
;420:int BotGPSToPosition(char* buf, vec3_t position) {
line 421
;421:	int i, j = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 424
;422:	int num, sign;
;423:
;424:	for (i = 0; i < 3; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $202
line 425
;425:		num = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $207
JUMPV
LABELV $206
line 427
;426:		while (buf[j] == ' ')
;427:			j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $207
line 426
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $206
line 428
;428:		if (buf[j] == '-') {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $209
line 429
;429:			j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 430
;430:			sign = -1;
ADDRLP4 12
CNSTI4 -1
ASGNI4
line 431
;431:		} else {
ADDRGP4 $212
JUMPV
LABELV $209
line 432
;432:			sign = 1;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 433
;433:		}
ADDRGP4 $212
JUMPV
LABELV $211
line 434
;434:		while (buf[j]) {
line 435
;435:			if (buf[j] >= '0' && buf[j] <= '9') {
ADDRLP4 16
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $214
ADDRLP4 16
INDIRI4
CNSTI4 57
GTI4 $214
line 436
;436:				num = num * 10 + buf[j] - '0';
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 10
MULI4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ADDI4
CNSTI4 48
SUBI4
ASGNI4
line 437
;437:				j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 438
;438:			} else {
ADDRGP4 $215
JUMPV
LABELV $214
line 439
;439:				j++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 440
;440:				break;
ADDRGP4 $213
JUMPV
LABELV $215
line 442
;441:			}
;442:		}
LABELV $212
line 434
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $211
LABELV $213
line 443
;443:		BotAI_Print(PRT_MESSAGE, "%d\n", sign * num);
CNSTI4 1
ARGI4
ADDRGP4 $216
ARGP4
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
ARGI4
ADDRGP4 BotAI_Print
CALLV
pop
line 444
;444:		position[i] = (float)sign * num;
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 12
INDIRI4
CVIF4 4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 445
;445:	}
LABELV $203
line 424
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 3
LTI4 $202
line 446
;446:	return qtrue;
CNSTI4 1
RETI4
LABELV $201
endproc BotGPSToPosition 20 12
export BotMatch_HelpAccompany
proc BotMatch_HelpAccompany 1272 16
line 454
;447:}
;448:
;449:/*
;450:==================
;451:BotMatch_HelpAccompany
;452:==================
;453:*/
;454:void BotMatch_HelpAccompany(bot_state_t* bs, bot_match_t* match) {
line 462
;455:	int              client, other, areanum;
;456:	char             teammate[MAX_MESSAGE_SIZE];
;457:	char             netname[MAX_MESSAGE_SIZE];
;458:	char             itemname[MAX_MESSAGE_SIZE];
;459:	bot_match_t      teammatematch;
;460:	aas_entityinfo_t entinfo;
;461:
;462:	if (!TeamPlayIsOn())
ADDRLP4 1248
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 1248
INDIRI4
CNSTI4 0
NEI4 $218
line 463
;463:		return;
ADDRGP4 $217
JUMPV
LABELV $218
line 465
;464:	// if not addressed to this bot
;465:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1252
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 0
NEI4 $220
line 466
;466:		return;
ADDRGP4 $217
JUMPV
LABELV $220
line 468
;467:	// get the team mate name
;468:	trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 470
;469:	// get the client to help
;470:	if (trap_BotFindMatch(teammate, &teammatematch, MTCONTEXT_TEAMMATE) &&
ADDRLP4 260
ARGP4
ADDRLP4 656
ARGP4
CNSTU4 16
ARGU4
ADDRLP4 1256
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 1256
INDIRI4
CNSTI4 0
EQI4 $222
ADDRLP4 656+256
INDIRI4
CNSTI4 100
NEI4 $222
line 472
;471:	    // if someone asks for him or herself
;472:	    teammatematch.type == MSG_ME) {
line 474
;473:		// get the netname
;474:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 475
;475:		client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 476
;476:		other  = qfalse;
ADDRLP4 984
CNSTI4 0
ASGNI4
line 477
;477:	} else {
ADDRGP4 $223
JUMPV
LABELV $222
line 479
;478:		// asked for someone else
;479:		client = FindClientByName(teammate);
ADDRLP4 260
ARGP4
ADDRLP4 1260
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 481
;480:		// if this is the bot self
;481:		if (client == bs->client) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $225
line 482
;482:			other = qfalse;
ADDRLP4 984
CNSTI4 0
ASGNI4
line 483
;483:		} else if (!BotSameTeam(bs, client)) {
ADDRGP4 $226
JUMPV
LABELV $225
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1264
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 0
NEI4 $227
line 485
;484:			// FIXME: say "I don't help the enemy"
;485:			return;
ADDRGP4 $217
JUMPV
LABELV $227
line 486
;486:		} else {
line 487
;487:			other = qtrue;
ADDRLP4 984
CNSTI4 1
ASGNI4
line 488
;488:		}
LABELV $226
line 489
;489:	}
LABELV $223
line 491
;490:	// if the bot doesn't know who to help (FindClientByName returned -1)
;491:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $229
line 492
;492:		if (other)
ADDRLP4 984
INDIRI4
CNSTI4 0
EQI4 $231
line 493
;493:			BotAI_BotInitialChat(bs, "whois", teammate, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $233
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $232
JUMPV
LABELV $231
line 495
;494:		else
;495:			BotAI_BotInitialChat(bs, "whois", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $233
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $232
line 496
;496:		client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 497
;497:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 498
;498:		return;
ADDRGP4 $217
JUMPV
LABELV $229
line 501
;499:	}
;500:	// don't help or accompany yourself
;501:	if (client == bs->client) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $234
line 502
;502:		return;
ADDRGP4 $217
JUMPV
LABELV $234
line 505
;503:	}
;504:	//
;505:	bs->teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
CNSTI4 -1
ASGNI4
line 506
;506:	BotEntityInfo(client, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 516
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 508
;507:	// if info is valid (in PVS)
;508:	if (entinfo.valid) {
ADDRLP4 516
INDIRI4
CNSTI4 0
EQI4 $236
line 509
;509:		areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 516+24
ARGP4
ADDRLP4 1260
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 988
ADDRLP4 1260
INDIRI4
ASGNI4
line 510
;510:		if (areanum) {  // && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 988
INDIRI4
CNSTI4 0
EQI4 $239
line 511
;511:			bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 512
;512:			bs->teamgoal.areanum   = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 988
INDIRI4
ASGNI4
line 513
;513:			VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 516+24
INDIRB
ASGNB 12
line 514
;514:			VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6640
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6644
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6648
ADDP4
CNSTF4 3238002688
ASGNF4
line 515
;515:			VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6652
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6656
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6660
ADDP4
CNSTF4 1090519040
ASGNF4
line 516
;516:		}
LABELV $239
line 517
;517:	}
LABELV $236
line 519
;518:	// if no teamgoal yet
;519:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $242
line 521
;520:		// if near an item
;521:		if (match->subtype & ST_NEARITEM) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $244
line 523
;522:			// get the match variable
;523:			trap_BotMatchVariable(match, ITEM, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 992
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 525
;524:			//
;525:			if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 1260
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1260
INDIRP4
ARGP4
ADDRLP4 992
ARGP4
ADDRLP4 1260
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 1264
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 1264
INDIRI4
CNSTI4 0
NEI4 $246
line 528
;526:				// BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;527:				// trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;528:				return;
ADDRGP4 $217
JUMPV
LABELV $246
line 530
;529:			}
;530:		}
LABELV $244
line 531
;531:	}
LABELV $242
line 533
;532:	//
;533:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $248
line 534
;534:		if (other)
ADDRLP4 984
INDIRI4
CNSTI4 0
EQI4 $250
line 535
;535:			BotAI_BotInitialChat(bs, "whereis", teammate, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $252
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $251
JUMPV
LABELV $250
line 537
;536:		else
;537:			BotAI_BotInitialChat(bs, "whereareyou", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $251
line 538
;538:		client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 539
;539:		trap_BotEnterChat(bs->cs, client, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 540
;540:		return;
ADDRGP4 $217
JUMPV
LABELV $248
line 543
;541:	}
;542:	// the team mate
;543:	bs->teammate = client;
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 545
;544:	//
;545:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 547
;546:	//
;547:	client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 1260
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1260
INDIRI4
ASGNI4
line 549
;548:	// the team mate who ordered
;549:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 550
;550:	bs->ordered       = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 551
;551:	bs->order_time    = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 553
;552:	// last time the team mate was assumed visible
;553:	bs->teammatevisible_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6748
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 555
;554:	// set the time to send a message to the team mates
;555:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 1264
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 1264
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
line 557
;556:	// get the team goal time
;557:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1268
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRLP4 1268
INDIRF4
ASGNF4
line 559
;558:	// set the ltg type
;559:	if (match->type == MSG_HELP) {
ADDRFP4 4
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 3
NEI4 $254
line 560
;560:		bs->ltgtype = LTG_TEAMHELP;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 1
ASGNI4
line 561
;561:		if (!bs->teamgoal_time)
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $255
line 562
;562:			bs->teamgoal_time = FloatTime() + TEAM_HELP_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 563
;563:	} else {
ADDRGP4 $255
JUMPV
LABELV $254
line 564
;564:		bs->ltgtype = LTG_TEAMACCOMPANY;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 2
ASGNI4
line 565
;565:		if (!bs->teamgoal_time)
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $258
line 566
;566:			bs->teamgoal_time = FloatTime() + TEAM_ACCOMPANY_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $258
line 567
;567:		bs->formation_dist = 3.5 * 32;  // 3.5 meter
ADDRFP4 0
INDIRP4
CNSTI4 7016
ADDP4
CNSTF4 1121976320
ASGNF4
line 568
;568:		bs->arrive_time    = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 0
ASGNF4
line 570
;569:		//
;570:		BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 572
;571:		// remember last ordered task
;572:		BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 573
;573:	}
LABELV $255
line 577
;574:#ifdef DEBUG
;575:	BotPrintTeamGoal(bs);
;576:#endif  // DEBUG
;577:}
LABELV $217
endproc BotMatch_HelpAccompany 1272 16
export BotMatch_DefendKeyArea
proc BotMatch_DefendKeyArea 544 16
line 584
;578:
;579:/*
;580:==================
;581:BotMatch_DefendKeyArea
;582:==================
;583:*/
;584:void BotMatch_DefendKeyArea(bot_state_t* bs, bot_match_t* match) {
line 589
;585:	char itemname[MAX_MESSAGE_SIZE];
;586:	char netname[MAX_MESSAGE_SIZE];
;587:	int  client;
;588:
;589:	if (!TeamPlayIsOn())
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $261
line 590
;590:		return;
ADDRGP4 $260
JUMPV
LABELV $261
line 592
;591:	// if not addressed to this bot
;592:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $263
line 593
;593:		return;
ADDRGP4 $260
JUMPV
LABELV $263
line 595
;594:	// get the match variable
;595:	trap_BotMatchVariable(match, KEYAREA, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 597
;596:	//
;597:	if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 524
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 524
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 528
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 528
INDIRI4
CNSTI4 0
NEI4 $265
line 600
;598:		// BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;599:		// trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;600:		return;
ADDRGP4 $260
JUMPV
LABELV $265
line 603
;601:	}
;602:	//
;603:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 605
;604:	//
;605:	client = ClientFromName(netname);
ADDRLP4 256
ARGP4
ADDRLP4 532
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 512
ADDRLP4 532
INDIRI4
ASGNI4
line 607
;606:	// the team mate who ordered
;607:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 608
;608:	bs->ordered       = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 609
;609:	bs->order_time    = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 611
;610:	// set the time to send a message to the team mates
;611:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 536
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 536
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
line 613
;612:	// set the ltg type
;613:	bs->ltgtype = LTG_DEFENDKEYAREA;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 3
ASGNI4
line 615
;614:	// get the team goal time
;615:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 540
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRLP4 540
INDIRF4
ASGNF4
line 617
;616:	// set the team goal time
;617:	if (!bs->teamgoal_time)
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $267
line 618
;618:		bs->teamgoal_time = FloatTime() + TEAM_DEFENDKEYAREA_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $267
line 620
;619:	// away from defending
;620:	bs->defendaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6144
ADDP4
CNSTF4 0
ASGNF4
line 622
;621:	//
;622:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 624
;623:	// remember last ordered task
;624:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 628
;625:#ifdef DEBUG
;626:	BotPrintTeamGoal(bs);
;627:#endif  // DEBUG
;628:}
LABELV $260
endproc BotMatch_DefendKeyArea 544 16
export BotMatch_GetItem
proc BotMatch_GetItem 540 16
line 635
;629:
;630:/*
;631:==================
;632:BotMatch_GetItem
;633:==================
;634:*/
;635:void BotMatch_GetItem(bot_state_t* bs, bot_match_t* match) {
line 640
;636:	char itemname[MAX_MESSAGE_SIZE];
;637:	char netname[MAX_MESSAGE_SIZE];
;638:	int  client;
;639:
;640:	if (!TeamPlayIsOn())
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $270
line 641
;641:		return;
ADDRGP4 $269
JUMPV
LABELV $270
line 643
;642:	// if not addressed to this bot
;643:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $272
line 644
;644:		return;
ADDRGP4 $269
JUMPV
LABELV $272
line 646
;645:	// get the match variable
;646:	trap_BotMatchVariable(match, ITEM, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 648
;647:	//
;648:	if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
ADDRLP4 524
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 524
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 524
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 528
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 528
INDIRI4
CNSTI4 0
NEI4 $274
line 651
;649:		// BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;650:		// trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
;651:		return;
ADDRGP4 $269
JUMPV
LABELV $274
line 653
;652:	}
;653:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 654
;654:	client = ClientOnSameTeamFromName(bs, netname);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
ARGP4
ADDRLP4 532
ADDRGP4 ClientOnSameTeamFromName
CALLI4
ASGNI4
ADDRLP4 512
ADDRLP4 532
INDIRI4
ASGNI4
line 656
;655:	//
;656:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 657
;657:	bs->ordered       = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 658
;658:	bs->order_time    = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 660
;659:	// set the time to send a message to the team mates
;660:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 536
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 536
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
line 662
;661:	// set the ltg type
;662:	bs->ltgtype = LTG_GETITEM;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 10
ASGNI4
line 664
;663:	// set the team goal time
;664:	bs->teamgoal_time = FloatTime() + TEAM_GETITEM_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1114636288
ADDF4
ASGNF4
line 666
;665:	//
;666:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 670
;667:#ifdef DEBUG
;668:	BotPrintTeamGoal(bs);
;669:#endif  // DEBUG
;670:}
LABELV $269
endproc BotMatch_GetItem 540 16
export BotMatch_Camp
proc BotMatch_Camp 688 16
line 677
;671:
;672:/*
;673:==================
;674:BotMatch_Camp
;675:==================
;676:*/
;677:void BotMatch_Camp(bot_state_t* bs, bot_match_t* match) {
line 683
;678:	int              client, areanum;
;679:	char             netname[MAX_MESSAGE_SIZE];
;680:	char             itemname[MAX_MESSAGE_SIZE];
;681:	aas_entityinfo_t entinfo;
;682:
;683:	if (!TeamPlayIsOn())
ADDRLP4 660
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 660
INDIRI4
CNSTI4 0
NEI4 $277
line 684
;684:		return;
ADDRGP4 $276
JUMPV
LABELV $277
line 686
;685:	// if not addressed to this bot
;686:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 664
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 664
INDIRI4
CNSTI4 0
NEI4 $279
line 687
;687:		return;
ADDRGP4 $276
JUMPV
LABELV $279
line 689
;688:	//
;689:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 691
;690:	// asked for someone else
;691:	client = FindClientByName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 668
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 668
INDIRI4
ASGNI4
line 693
;692:	// if there's no valid client with this name
;693:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $281
line 694
;694:		BotAI_BotInitialChat(bs, "whois", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $233
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 695
;695:		trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 672
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 696
;696:		return;
ADDRGP4 $276
JUMPV
LABELV $281
line 699
;697:	}
;698:	// get the match variable
;699:	trap_BotMatchVariable(match, KEYAREA, itemname, sizeof(itemname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 701
;700:	// in CTF it could be the base
;701:	if (match->subtype & ST_THERE) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $283
line 703
;702:		// camp at the spot the bot is currently standing
;703:		bs->teamgoal.entitynum = bs->entitynum;
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 672
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 704
;704:		bs->teamgoal.areanum   = bs->areanum;
ADDRLP4 676
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 676
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 676
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ASGNI4
line 705
;705:		VectorCopy(bs->origin, bs->teamgoal.origin);
ADDRLP4 680
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 680
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 680
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 706
;706:		VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6640
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6644
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6648
ADDP4
CNSTF4 3238002688
ASGNF4
line 707
;707:		VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6652
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6656
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6660
ADDP4
CNSTF4 1090519040
ASGNF4
line 708
;708:	} else if (match->subtype & ST_HERE) {
ADDRGP4 $284
JUMPV
LABELV $283
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $285
line 710
;709:		// if this is the bot self
;710:		if (client == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $287
line 711
;711:			return;
ADDRGP4 $276
JUMPV
LABELV $287
line 713
;712:		//
;713:		bs->teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
CNSTI4 -1
ASGNI4
line 714
;714:		BotEntityInfo(client, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 516
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 716
;715:		// if info is valid (in PVS)
;716:		if (entinfo.valid) {
ADDRLP4 516
INDIRI4
CNSTI4 0
EQI4 $289
line 717
;717:			areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 516+24
ARGP4
ADDRLP4 672
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 656
ADDRLP4 672
INDIRI4
ASGNI4
line 718
;718:			if (areanum) {  // && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $292
line 721
;719:				            // NOTE: just assume the bot knows where the person is
;720:				// if (BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, client)) {
;721:				bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 722
;722:				bs->teamgoal.areanum   = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6636
ADDP4
ADDRLP4 656
INDIRI4
ASGNI4
line 723
;723:				VectorCopy(entinfo.origin, bs->teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6624
ADDP4
ADDRLP4 516+24
INDIRB
ASGNB 12
line 724
;724:				VectorSet(bs->teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6640
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6644
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6648
ADDP4
CNSTF4 3238002688
ASGNF4
line 725
;725:				VectorSet(bs->teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6652
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6656
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6660
ADDP4
CNSTF4 1090519040
ASGNF4
line 727
;726:				//}
;727:			}
LABELV $292
line 728
;728:		}
LABELV $289
line 730
;729:		// if the other is not visible
;730:		if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $286
line 731
;731:			BotAI_BotInitialChat(bs, "whereareyou", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 732
;732:			client = ClientFromName(netname);
ADDRLP4 4
ARGP4
ADDRLP4 672
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 672
INDIRI4
ASGNI4
line 733
;733:			trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 734
;734:			return;
ADDRGP4 $276
JUMPV
line 736
;735:		}
;736:	} else if (!BotGetMessageTeamGoal(bs, itemname, &bs->teamgoal)) {
LABELV $285
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 672
INDIRP4
CNSTI4 6624
ADDP4
ARGP4
ADDRLP4 676
ADDRGP4 BotGetMessageTeamGoal
CALLI4
ASGNI4
ADDRLP4 676
INDIRI4
CNSTI4 0
NEI4 $297
line 740
;737:		// BotAI_BotInitialChat(bs, "cannotfind", itemname, NULL);
;738:		// client = ClientFromName(netname);
;739:		// trap_BotEnterChat(bs->cs, client, CHAT_TELL);
;740:		return;
ADDRGP4 $276
JUMPV
LABELV $297
LABELV $286
LABELV $284
line 743
;741:	}
;742:	//
;743:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 744
;744:	bs->ordered       = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 745
;745:	bs->order_time    = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 747
;746:	// set the time to send a message to the team mates
;747:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 680
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 680
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
line 749
;748:	// set the ltg type
;749:	bs->ltgtype = LTG_CAMPORDER;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 8
ASGNI4
line 751
;750:	// get the team goal time
;751:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 684
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRLP4 684
INDIRF4
ASGNF4
line 753
;752:	// set the team goal time
;753:	if (!bs->teamgoal_time)
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $299
line 754
;754:		bs->teamgoal_time = FloatTime() + TEAM_CAMP_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $299
line 756
;755:	// not arrived yet
;756:	bs->arrive_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6172
ADDP4
CNSTF4 0
ASGNF4
line 758
;757:	//
;758:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 760
;759:	// remember last ordered task
;760:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 764
;761:#ifdef DEBUG
;762:	BotPrintTeamGoal(bs);
;763:#endif  // DEBUG
;764:}
LABELV $276
endproc BotMatch_Camp 688 16
export BotMatch_Patrol
proc BotMatch_Patrol 284 16
line 771
;765:
;766:/*
;767:==================
;768:BotMatch_Patrol
;769:==================
;770:*/
;771:void BotMatch_Patrol(bot_state_t* bs, bot_match_t* match) {
line 775
;772:	char netname[MAX_MESSAGE_SIZE];
;773:	int  client;
;774:
;775:	if (!TeamPlayIsOn())
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $302
line 776
;776:		return;
ADDRGP4 $301
JUMPV
LABELV $302
line 778
;777:	// if not addressed to this bot
;778:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $304
line 779
;779:		return;
ADDRGP4 $301
JUMPV
LABELV $304
line 781
;780:	// get the patrol waypoints
;781:	if (!BotGetPatrolWaypoints(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 BotGetPatrolWaypoints
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $306
line 782
;782:		return;
ADDRGP4 $301
JUMPV
LABELV $306
line 784
;783:	//
;784:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 786
;785:	//
;786:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 272
INDIRI4
ASGNI4
line 788
;787:	//
;788:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 789
;789:	bs->ordered       = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 790
;790:	bs->order_time    = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 792
;791:	// set the time to send a message to the team mates
;792:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 276
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 276
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
line 794
;793:	// set the ltg type
;794:	bs->ltgtype = LTG_PATROL;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 9
ASGNI4
line 796
;795:	// get the team goal time
;796:	bs->teamgoal_time = BotGetTime(match);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 280
ADDRGP4 BotGetTime
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRLP4 280
INDIRF4
ASGNF4
line 798
;797:	// set the team goal time if not set already
;798:	if (!bs->teamgoal_time)
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
INDIRF4
CNSTF4 0
NEF4 $308
line 799
;799:		bs->teamgoal_time = FloatTime() + TEAM_PATROL_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
LABELV $308
line 801
;800:	//
;801:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 803
;802:	// remember last ordered task
;803:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 807
;804:#ifdef DEBUG
;805:	BotPrintTeamGoal(bs);
;806:#endif  // DEBUG
;807:}
LABELV $301
endproc BotMatch_Patrol 284 16
export BotMatch_GetFlag
proc BotMatch_GetFlag 276 16
line 814
;808:
;809:/*
;810:==================
;811:BotMatch_GetFlag
;812:==================
;813:*/
;814:void BotMatch_GetFlag(bot_state_t* bs, bot_match_t* match) {
line 818
;815:	char netname[MAX_MESSAGE_SIZE];
;816:	int  client;
;817:
;818:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $310
line 819
;819:		if (!ctf_redflag.areanum || !ctf_blueflag.areanum)
ADDRGP4 ctf_redflag+12
INDIRI4
CNSTI4 0
EQI4 $317
ADDRGP4 ctf_blueflag+12
INDIRI4
CNSTI4 0
NEI4 $312
LABELV $317
line 820
;820:			return;
ADDRGP4 $310
JUMPV
line 821
;821:	}
line 828
;822:#ifdef MISSIONPACK
;823:	else if (gametype == GT_1FCTF) {
;824:		if (!ctf_neutralflag.areanum || !ctf_redflag.areanum || !ctf_blueflag.areanum)
;825:			return;
;826:	}
;827:#endif
;828:	else {
line 829
;829:		return;
LABELV $312
line 832
;830:	}
;831:	// if not addressed to this bot
;832:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $318
line 833
;833:		return;
ADDRGP4 $310
JUMPV
LABELV $318
line 835
;834:	//
;835:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 837
;836:	//
;837:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 264
INDIRI4
ASGNI4
line 839
;838:	//
;839:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 840
;840:	bs->ordered       = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 841
;841:	bs->order_time    = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 843
;842:	// set the time to send a message to the team mates
;843:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 268
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 268
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
line 845
;844:	// set the ltg type
;845:	bs->ltgtype = LTG_GETFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 4
ASGNI4
line 847
;846:	// set the team goal time
;847:	bs->teamgoal_time = FloatTime() + CTF_GETFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 849
;848:	// get an alternate route in ctf
;849:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $320
line 851
;850:		// get an alternative route goal towards the enemy base
;851:		BotGetAlternateRouteGoal(bs, BotOppositeTeam(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
ADDRGP4 BotOppositeTeam
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
INDIRI4
ARGI4
ADDRGP4 BotGetAlternateRouteGoal
CALLI4
pop
line 852
;852:	}
LABELV $320
line 854
;853:	//
;854:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 856
;855:	// remember last ordered task
;856:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 860
;857:#ifdef DEBUG
;858:	BotPrintTeamGoal(bs);
;859:#endif  // DEBUG
;860:}
LABELV $310
endproc BotMatch_GetFlag 276 16
export BotMatch_AttackEnemyBase
proc BotMatch_AttackEnemyBase 272 16
line 867
;861:
;862:/*
;863:==================
;864:BotMatch_AttackEnemyBase
;865:==================
;866:*/
;867:void BotMatch_AttackEnemyBase(bot_state_t* bs, bot_match_t* match) {
line 871
;868:	char netname[MAX_MESSAGE_SIZE];
;869:	int  client;
;870:
;871:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $322
line 872
;872:		BotMatch_GetFlag(bs, match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 BotMatch_GetFlag
CALLV
pop
line 873
;873:	}
line 880
;874:#ifdef MISSIONPACK
;875:	else if (gametype == GT_1FCTF || gametype == GT_OBELISK || gametype == GT_HARVESTER) {
;876:		if (!redobelisk.areanum || !blueobelisk.areanum)
;877:			return;
;878:	}
;879:#endif
;880:	else {
line 881
;881:		return;
LABELV $324
line 884
;882:	}
;883:	// if not addressed to this bot
;884:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $325
line 885
;885:		return;
ADDRGP4 $322
JUMPV
LABELV $325
line 887
;886:	//
;887:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 889
;888:	//
;889:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 264
INDIRI4
ASGNI4
line 891
;890:	//
;891:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 892
;892:	bs->ordered       = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 893
;893:	bs->order_time    = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 895
;894:	// set the time to send a message to the team mates
;895:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 268
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 268
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
line 897
;896:	// set the ltg type
;897:	bs->ltgtype = LTG_ATTACKENEMYBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 13
ASGNI4
line 899
;898:	// set the team goal time
;899:	bs->teamgoal_time   = FloatTime() + TEAM_ATTACKENEMYBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 900
;900:	bs->attackaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6156
ADDP4
CNSTF4 0
ASGNF4
line 902
;901:	//
;902:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 904
;903:	// remember last ordered task
;904:	BotRememberLastOrderedTask(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotRememberLastOrderedTask
CALLV
pop
line 908
;905:#ifdef DEBUG
;906:	BotPrintTeamGoal(bs);
;907:#endif  // DEBUG
;908:}
LABELV $322
endproc BotMatch_AttackEnemyBase 272 16
export BotMatch_RushBase
proc BotMatch_RushBase 272 16
line 959
;909:
;910:#ifdef MISSIONPACK
;911:/*
;912:==================
;913:BotMatch_Harvest
;914:==================
;915:*/
;916:void BotMatch_Harvest(bot_state_t* bs, bot_match_t* match) {
;917:	char netname[MAX_MESSAGE_SIZE];
;918:	int  client;
;919:
;920:	if (gametype == GT_HARVESTER) {
;921:		if (!neutralobelisk.areanum || !redobelisk.areanum || !blueobelisk.areanum)
;922:			return;
;923:	} else {
;924:		return;
;925:	}
;926:	// if not addressed to this bot
;927:	if (!BotAddressedToBot(bs, match))
;928:		return;
;929:	//
;930:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
;931:	//
;932:	client = FindClientByName(netname);
;933:	//
;934:	bs->decisionmaker = client;
;935:	bs->ordered       = qtrue;
;936:	bs->order_time    = FloatTime();
;937:	// set the time to send a message to the team mates
;938:	bs->teammessage_time = FloatTime() + 2 * random();
;939:	// set the ltg type
;940:	bs->ltgtype = LTG_HARVEST;
;941:	// set the team goal time
;942:	bs->teamgoal_time    = FloatTime() + TEAM_HARVEST_TIME;
;943:	bs->harvestaway_time = 0;
;944:	//
;945:	BotSetTeamStatus(bs);
;946:	// remember last ordered task
;947:	BotRememberLastOrderedTask(bs);
;948:#ifdef DEBUG
;949:	BotPrintTeamGoal(bs);
;950:#endif  // DEBUG
;951:}
;952:#endif
;953:
;954:/*
;955:==================
;956:BotMatch_RushBase
;957:==================
;958:*/
;959:void BotMatch_RushBase(bot_state_t* bs, bot_match_t* match) {
line 963
;960:	char netname[MAX_MESSAGE_SIZE];
;961:	int  client;
;962:
;963:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $327
line 964
;964:		if (!ctf_redflag.areanum || !ctf_blueflag.areanum)
ADDRGP4 ctf_redflag+12
INDIRI4
CNSTI4 0
EQI4 $334
ADDRGP4 ctf_blueflag+12
INDIRI4
CNSTI4 0
NEI4 $329
LABELV $334
line 965
;965:			return;
ADDRGP4 $327
JUMPV
line 966
;966:	}
line 973
;967:#ifdef MISSIONPACK
;968:	else if (gametype == GT_1FCTF || gametype == GT_HARVESTER) {
;969:		if (!redobelisk.areanum || !blueobelisk.areanum)
;970:			return;
;971:	}
;972:#endif
;973:	else {
line 974
;974:		return;
LABELV $329
line 977
;975:	}
;976:	// if not addressed to this bot
;977:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $335
line 978
;978:		return;
ADDRGP4 $327
JUMPV
LABELV $335
line 980
;979:	//
;980:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 982
;981:	//
;982:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 264
INDIRI4
ASGNI4
line 984
;983:	//
;984:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 985
;985:	bs->ordered       = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 986
;986:	bs->order_time    = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 988
;987:	// set the time to send a message to the team mates
;988:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 268
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 268
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
line 990
;989:	// set the ltg type
;990:	bs->ltgtype = LTG_RUSHBASE;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 5
ASGNI4
line 992
;991:	// set the team goal time
;992:	bs->teamgoal_time     = FloatTime() + CTF_RUSHBASE_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 993
;993:	bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 995
;994:	//
;995:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 999
;996:#ifdef DEBUG
;997:	BotPrintTeamGoal(bs);
;998:#endif  // DEBUG
;999:}
LABELV $327
endproc BotMatch_RushBase 272 16
export BotMatch_TaskPreference
proc BotMatch_TaskPreference 320 16
line 1006
;1000:
;1001:/*
;1002:==================
;1003:BotMatch_TaskPreference
;1004:==================
;1005:*/
;1006:void BotMatch_TaskPreference(bot_state_t* bs, bot_match_t* match) {
line 1011
;1007:	char netname[MAX_NETNAME];
;1008:	char teammatename[MAX_MESSAGE_SIZE];
;1009:	int  teammate, preference;
;1010:
;1011:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1012
;1012:	if (Q_stricmp(netname, bs->teamleader) != 0)
ADDRLP4 260
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 300
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
EQI4 $338
line 1013
;1013:		return;
ADDRGP4 $337
JUMPV
LABELV $338
line 1015
;1014:
;1015:	trap_BotMatchVariable(match, NETNAME, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1016
;1016:	teammate = ClientFromName(teammatename);
ADDRLP4 0
ARGP4
ADDRLP4 304
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 304
INDIRI4
ASGNI4
line 1017
;1017:	if (teammate < 0)
ADDRLP4 256
INDIRI4
CNSTI4 0
GEI4 $340
line 1018
;1018:		return;
ADDRGP4 $337
JUMPV
LABELV $340
line 1020
;1019:
;1020:	preference = BotGetTeamMateTaskPreference(bs, teammate);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
ARGI4
ADDRLP4 308
ADDRGP4 BotGetTeamMateTaskPreference
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 1021
;1021:	switch (match->subtype) {
ADDRLP4 312
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 1
EQI4 $345
ADDRLP4 312
INDIRI4
CNSTI4 2
EQI4 $346
ADDRLP4 312
INDIRI4
CNSTI4 4
EQI4 $347
ADDRGP4 $342
JUMPV
LABELV $345
line 1022
;1022:	case ST_DEFENDER: {
line 1023
;1023:		preference &= ~TEAMTP_ATTACKER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 -3
BANDI4
ASGNI4
line 1024
;1024:		preference |= TEAMTP_DEFENDER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 1025
;1025:		break;
ADDRGP4 $343
JUMPV
LABELV $346
line 1027
;1026:	}
;1027:	case ST_ATTACKER: {
line 1028
;1028:		preference &= ~TEAMTP_DEFENDER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 1029
;1029:		preference |= TEAMTP_ATTACKER;
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1030
;1030:		break;
ADDRGP4 $343
JUMPV
LABELV $347
line 1032
;1031:	}
;1032:	case ST_ROAMER: {
line 1033
;1033:		preference &= ~(TEAMTP_ATTACKER | TEAMTP_DEFENDER);
ADDRLP4 296
ADDRLP4 296
INDIRI4
CNSTI4 -4
BANDI4
ASGNI4
line 1034
;1034:		break;
LABELV $342
LABELV $343
line 1037
;1035:	}
;1036:	}
;1037:	BotSetTeamMateTaskPreference(bs, teammate, preference);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
ARGI4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSetTeamMateTaskPreference
CALLV
pop
line 1039
;1038:	//
;1039:	EasyClientName(teammate, teammatename, sizeof(teammatename));
ADDRLP4 256
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1040
;1040:	BotAI_BotInitialChat(bs, "keepinmind", teammatename, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $348
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1041
;1041:	trap_BotEnterChat(bs->cs, teammate, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1045
;1042:#ifdef MISSIONPACK
;1043:	BotVoiceChatOnly(bs, teammate, VOICECHAT_YES);
;1044:#endif
;1045:	trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 1046
;1046:}
LABELV $337
endproc BotMatch_TaskPreference 320 16
export BotMatch_ReturnFlag
proc BotMatch_ReturnFlag 272 16
line 1053
;1047:
;1048:/*
;1049:==================
;1050:BotMatch_ReturnFlag
;1051:==================
;1052:*/
;1053:void BotMatch_ReturnFlag(bot_state_t* bs, bot_match_t* match) {
line 1058
;1054:	char netname[MAX_MESSAGE_SIZE];
;1055:	int  client;
;1056:
;1057:	// if not in CTF mode
;1058:	if (gametype != GT_CTF
ADDRGP4 gametype
INDIRI4
CNSTI4 4
EQI4 $350
line 1063
;1059:#ifdef MISSIONPACK
;1060:	    && gametype != GT_1FCTF
;1061:#endif
;1062:	)
;1063:		return;
ADDRGP4 $349
JUMPV
LABELV $350
line 1065
;1064:	// if not addressed to this bot
;1065:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $352
line 1066
;1066:		return;
ADDRGP4 $349
JUMPV
LABELV $352
line 1068
;1067:	//
;1068:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1070
;1069:	//
;1070:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 264
INDIRI4
ASGNI4
line 1072
;1071:	//
;1072:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 1073
;1073:	bs->ordered       = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6612
ADDP4
CNSTI4 1
ASGNI4
line 1074
;1074:	bs->order_time    = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6616
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1076
;1075:	// set the time to send a message to the team mates
;1076:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 268
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 268
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
line 1078
;1077:	// set the ltg type
;1078:	bs->ltgtype = LTG_RETURNFLAG;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 6
ASGNI4
line 1080
;1079:	// set the team goal time
;1080:	bs->teamgoal_time     = FloatTime() + CTF_RETURNFLAG_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 1081
;1081:	bs->rushbaseaway_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6152
ADDP4
CNSTF4 0
ASGNF4
line 1083
;1082:	//
;1083:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1087
;1084:#ifdef DEBUG
;1085:	BotPrintTeamGoal(bs);
;1086:#endif  // DEBUG
;1087:}
LABELV $349
endproc BotMatch_ReturnFlag 272 16
export BotMatch_JoinSubteam
proc BotMatch_JoinSubteam 528 16
line 1094
;1088:
;1089:/*
;1090:==================
;1091:BotMatch_JoinSubteam
;1092:==================
;1093:*/
;1094:void BotMatch_JoinSubteam(bot_state_t* bs, bot_match_t* match) {
line 1099
;1095:	char teammate[MAX_MESSAGE_SIZE];
;1096:	char netname[MAX_MESSAGE_SIZE];
;1097:	int  client;
;1098:
;1099:	if (!TeamPlayIsOn())
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $355
line 1100
;1100:		return;
ADDRGP4 $354
JUMPV
LABELV $355
line 1102
;1101:	// if not addressed to this bot
;1102:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $357
line 1103
;1103:		return;
ADDRGP4 $354
JUMPV
LABELV $357
line 1105
;1104:	// get the sub team name
;1105:	trap_BotMatchVariable(match, TEAMNAME, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1107
;1106:	// set the sub team name
;1107:	Q_strncpyz(bs->subteam, teammate, sizeof(bs->subteam));
ADDRFP4 0
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1109
;1108:	//
;1109:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1110
;1110:	BotAI_BotInitialChat(bs, "joinedteam", teammate, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $359
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1111
;1111:	client = ClientFromName(netname);
ADDRLP4 256
ARGP4
ADDRLP4 524
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 512
ADDRLP4 524
INDIRI4
ASGNI4
line 1112
;1112:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1113
;1113:}
LABELV $354
endproc BotMatch_JoinSubteam 528 16
export BotMatch_LeaveSubteam
proc BotMatch_LeaveSubteam 280 16
line 1120
;1114:
;1115:/*
;1116:==================
;1117:BotMatch_LeaveSubteam
;1118:==================
;1119:*/
;1120:void BotMatch_LeaveSubteam(bot_state_t* bs, bot_match_t* match) {
line 1124
;1121:	char netname[MAX_MESSAGE_SIZE];
;1122:	int  client;
;1123:
;1124:	if (!TeamPlayIsOn())
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $361
line 1125
;1125:		return;
ADDRGP4 $360
JUMPV
LABELV $361
line 1127
;1126:	// if not addressed to this bot
;1127:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $363
line 1128
;1128:		return;
ADDRGP4 $360
JUMPV
LABELV $363
line 1130
;1129:	//
;1130:	if (strlen(bs->subteam)) {
ADDRFP4 0
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
ADDRLP4 268
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $365
line 1131
;1131:		BotAI_BotInitialChat(bs, "leftteam", bs->subteam, NULL);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
ARGP4
ADDRGP4 $367
ARGP4
ADDRLP4 272
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1132
;1132:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1133
;1133:		client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 276
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 276
INDIRI4
ASGNI4
line 1134
;1134:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1135
;1135:	}  // end if
LABELV $365
line 1136
;1136:	strcpy(bs->subteam, "");
ADDRFP4 0
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
ADDRGP4 $368
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1137
;1137:}
LABELV $360
endproc BotMatch_LeaveSubteam 280 16
export BotMatch_WhichTeam
proc BotMatch_WhichTeam 16 16
line 1144
;1138:
;1139:/*
;1140:==================
;1141:BotMatch_LeaveSubteam
;1142:==================
;1143:*/
;1144:void BotMatch_WhichTeam(bot_state_t* bs, bot_match_t* match) {
line 1145
;1145:	if (!TeamPlayIsOn())
ADDRLP4 0
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $370
line 1146
;1146:		return;
ADDRGP4 $369
JUMPV
LABELV $370
line 1148
;1147:	// if not addressed to this bot
;1148:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $372
line 1149
;1149:		return;
ADDRGP4 $369
JUMPV
LABELV $372
line 1151
;1150:	//
;1151:	if (strlen(bs->subteam)) {
ADDRFP4 0
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $374
line 1152
;1152:		BotAI_BotInitialChat(bs, "inteam", bs->subteam, NULL);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 6984
ADDP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1153
;1153:	} else {
ADDRGP4 $375
JUMPV
LABELV $374
line 1154
;1154:		BotAI_BotInitialChat(bs, "noteam", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $377
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1155
;1155:	}
LABELV $375
line 1156
;1156:	trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1157
;1157:}
LABELV $369
endproc BotMatch_WhichTeam 16 16
export BotMatch_CheckPoint
proc BotMatch_CheckPoint 564 24
line 1164
;1158:
;1159:/*
;1160:==================
;1161:BotMatch_CheckPoint
;1162:==================
;1163:*/
;1164:void BotMatch_CheckPoint(bot_state_t* bs, bot_match_t* match) {
line 1171
;1165:	int             areanum, client;
;1166:	char            buf[MAX_MESSAGE_SIZE];
;1167:	char            netname[MAX_MESSAGE_SIZE];
;1168:	vec3_t          position;
;1169:	bot_waypoint_t* cp;
;1170:
;1171:	if (!TeamPlayIsOn())
ADDRLP4 536
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 536
INDIRI4
CNSTI4 0
NEI4 $379
line 1172
;1172:		return;
ADDRGP4 $378
JUMPV
LABELV $379
line 1174
;1173:	//
;1174:	trap_BotMatchVariable(match, POSITION, buf, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1175
;1175:	VectorClear(position);
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4+4
CNSTF4 0
ASGNF4
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 1177
;1176:	//
;1177:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 276
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1178
;1178:	client = ClientFromName(netname);
ADDRLP4 276
ARGP4
ADDRLP4 540
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 532
ADDRLP4 540
INDIRI4
ASGNI4
line 1180
;1179:	// BotGPSToPosition(buf, position);
;1180:	Q_sscanf(buf, "%f %f %f", &position[0], &position[1], &position[2]);
ADDRLP4 16
ARGP4
ADDRGP4 $383
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 4+4
ARGP4
ADDRLP4 4+8
ARGP4
ADDRGP4 Q_sscanf
CALLI4
pop
line 1181
;1181:	position[2] += 0.5;
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 1182
;1182:	areanum = BotPointAreaNum(position);
ADDRLP4 4
ARGP4
ADDRLP4 544
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 272
ADDRLP4 544
INDIRI4
ASGNI4
line 1183
;1183:	if (!areanum) {
ADDRLP4 272
INDIRI4
CNSTI4 0
NEI4 $387
line 1184
;1184:		if (BotAddressedToBot(bs, match)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 548
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $378
line 1185
;1185:			BotAI_BotInitialChat(bs, "checkpoint_invalid", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $391
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1186
;1186:			trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 532
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1187
;1187:		}
line 1188
;1188:		return;
ADDRGP4 $378
JUMPV
LABELV $387
line 1191
;1189:	}
;1190:	//
;1191:	trap_BotMatchVariable(match, NAME, buf, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 6
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1193
;1192:	// check if there already exists a checkpoint with this name
;1193:	cp = BotFindWayPoint(bs->checkpoints, buf);
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 548
ADDRGP4 BotFindWayPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 548
INDIRP4
ASGNP4
line 1194
;1194:	if (cp) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $392
line 1195
;1195:		if (cp->next)
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $394
line 1196
;1196:			cp->next->prev = cp->prev;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
ASGNP4
LABELV $394
line 1197
;1197:		if (cp->prev)
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $396
line 1198
;1198:			cp->prev->next = cp->next;
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
ADDRGP4 $397
JUMPV
LABELV $396
line 1200
;1199:		else
;1200:			bs->checkpoints = cp->next;
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRP4
ASGNP4
LABELV $397
line 1201
;1201:		cp->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 1202
;1202:	}
LABELV $392
line 1204
;1203:	// create a new check point
;1204:	cp = BotCreateWayPoint(buf, position, areanum);
ADDRLP4 16
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 552
ADDRGP4 BotCreateWayPoint
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 552
INDIRP4
ASGNP4
line 1206
;1205:	// add the check point to the bot's known chech points
;1206:	cp->next = bs->checkpoints;
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
ASGNP4
line 1207
;1207:	if (bs->checkpoints)
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $398
line 1208
;1208:		bs->checkpoints->prev = cp;
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
INDIRP4
CNSTI4 96
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $398
line 1209
;1209:	bs->checkpoints = cp;
ADDRFP4 0
INDIRP4
CNSTI4 9076
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 1211
;1210:	//
;1211:	if (BotAddressedToBot(bs, match)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 556
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 556
INDIRI4
CNSTI4 0
EQI4 $400
line 1212
;1212:		Com_sprintf(buf, sizeof(buf), "%1.0f %1.0f %1.0f", cp->goal.origin[0], cp->goal.origin[1], cp->goal.origin[2]);
ADDRLP4 16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $402
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ARGF4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1214
;1213:
;1214:		BotAI_BotInitialChat(bs, "checkpoint_confirm", cp->name, buf, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $403
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1215
;1215:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 532
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1216
;1216:	}
LABELV $400
line 1217
;1217:}
LABELV $378
endproc BotMatch_CheckPoint 564 24
export BotMatch_FormationSpace
proc BotMatch_FormationSpace 280 16
line 1224
;1218:
;1219:/*
;1220:==================
;1221:BotMatch_FormationSpace
;1222:==================
;1223:*/
;1224:void BotMatch_FormationSpace(bot_state_t* bs, bot_match_t* match) {
line 1228
;1225:	char  buf[MAX_MESSAGE_SIZE];
;1226:	float space;
;1227:
;1228:	if (!TeamPlayIsOn())
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $405
line 1229
;1229:		return;
ADDRGP4 $404
JUMPV
LABELV $405
line 1231
;1230:	// if not addressed to this bot
;1231:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $407
line 1232
;1232:		return;
ADDRGP4 $404
JUMPV
LABELV $407
line 1234
;1233:	//
;1234:	trap_BotMatchVariable(match, NUMBER, buf, MAX_MESSAGE_SIZE);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1236
;1235:	// if it's the distance in feet
;1236:	if (match->subtype & ST_FEET)
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $409
line 1237
;1237:		space = 0.3048 * 32 * atof(buf);
ADDRLP4 4
ARGP4
ADDRLP4 268
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 268
INDIRF4
CNSTF4 1092357823
MULF4
ASGNF4
ADDRGP4 $410
JUMPV
LABELV $409
line 1240
;1238:	// else it's in meters
;1239:	else
;1240:		space = 32 * atof(buf);
ADDRLP4 4
ARGP4
ADDRLP4 272
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 272
INDIRF4
CNSTF4 1107296256
MULF4
ASGNF4
LABELV $410
line 1242
;1241:	// check if the formation intervening space is valid
;1242:	if (space < 48 || space > 500)
ADDRLP4 0
INDIRF4
CNSTF4 1111490560
LTF4 $413
ADDRLP4 0
INDIRF4
CNSTF4 1140457472
LEF4 $411
LABELV $413
line 1243
;1243:		space = 100;
ADDRLP4 0
CNSTF4 1120403456
ASGNF4
LABELV $411
line 1244
;1244:	bs->formation_dist = space;
ADDRFP4 0
INDIRP4
CNSTI4 7016
ADDP4
ADDRLP4 0
INDIRF4
ASGNF4
line 1245
;1245:}
LABELV $404
endproc BotMatch_FormationSpace 280 16
export BotMatch_Dismiss
proc BotMatch_Dismiss 272 16
line 1252
;1246:
;1247:/*
;1248:==================
;1249:BotMatch_Dismiss
;1250:==================
;1251:*/
;1252:void BotMatch_Dismiss(bot_state_t* bs, bot_match_t* match) {
line 1256
;1253:	char netname[MAX_MESSAGE_SIZE];
;1254:	int  client;
;1255:
;1256:	if (!TeamPlayIsOn())
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $415
line 1257
;1257:		return;
ADDRGP4 $414
JUMPV
LABELV $415
line 1259
;1258:	// if not addressed to this bot
;1259:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
NEI4 $417
line 1260
;1260:		return;
ADDRGP4 $414
JUMPV
LABELV $417
line 1261
;1261:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1262
;1262:	client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 268
INDIRI4
ASGNI4
line 1264
;1263:	//
;1264:	bs->decisionmaker = client;
ADDRFP4 0
INDIRP4
CNSTI4 6608
ADDP4
ADDRLP4 256
INDIRI4
ASGNI4
line 1266
;1265:	//
;1266:	bs->ltgtype          = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 0
ASGNI4
line 1267
;1267:	bs->lead_time        = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6884
ADDP4
CNSTF4 0
ASGNF4
line 1268
;1268:	bs->lastgoal_ltgtype = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6760
ADDP4
CNSTI4 0
ASGNI4
line 1270
;1269:	//
;1270:	BotAI_BotInitialChat(bs, "dismissed", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $419
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1271
;1271:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1272
;1272:}
LABELV $414
endproc BotMatch_Dismiss 272 16
export BotMatch_Suicide
proc BotMatch_Suicide 264 16
line 1279
;1273:
;1274:/*
;1275:==================
;1276:BotMatch_Suicide
;1277:==================
;1278:*/
;1279:void BotMatch_Suicide(bot_state_t* bs, bot_match_t* match) {
line 1284
;1280:	char netname[MAX_MESSAGE_SIZE];
;1281:#ifdef MISSIONPACK
;1282:	int client;
;1283:#endif
;1284:	if (!TeamPlayIsOn())
ADDRLP4 256
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $421
line 1285
;1285:		return;
ADDRGP4 $420
JUMPV
LABELV $421
line 1287
;1286:	// if not addressed to this bot
;1287:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 260
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $423
line 1288
;1288:		return;
ADDRGP4 $420
JUMPV
LABELV $423
line 1290
;1289:	//
;1290:	trap_EA_Command(bs->client, "kill");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $425
ARGP4
ADDRGP4 trap_EA_Command
CALLV
pop
line 1292
;1291:	//
;1292:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1298
;1293:	//
;1294:#ifdef MISSIONPACK
;1295:	client = ClientFromName(netname);
;1296:	BotVoiceChat(bs, client, VOICECHAT_TAUNT);
;1297:#endif
;1298:	trap_EA_Action(bs->client, ACTION_AFFIRMATIVE);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1048576
ARGI4
ADDRGP4 trap_EA_Action
CALLV
pop
line 1299
;1299:}
LABELV $420
endproc BotMatch_Suicide 264 16
export BotMatch_StartTeamLeaderShip
proc BotMatch_StartTeamLeaderShip 268 16
line 1306
;1300:
;1301:/*
;1302:==================
;1303:BotMatch_StartTeamLeaderShip
;1304:==================
;1305:*/
;1306:void BotMatch_StartTeamLeaderShip(bot_state_t* bs, bot_match_t* match) {
line 1310
;1307:	int  client;
;1308:	char teammate[MAX_MESSAGE_SIZE];
;1309:
;1310:	if (!TeamPlayIsOn())
ADDRLP4 260
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $427
line 1311
;1311:		return;
ADDRGP4 $426
JUMPV
LABELV $427
line 1313
;1312:	// if chats for him or herself
;1313:	if (match->subtype & ST_I) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $429
line 1315
;1314:		// get the team mate that will be the team leader
;1315:		trap_BotMatchVariable(match, NETNAME, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1316
;1316:		Q_strncpyz(bs->teamleader, teammate, sizeof(bs->teamleader));
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1317
;1317:	}
ADDRGP4 $430
JUMPV
LABELV $429
line 1319
;1318:	// chats for someone else
;1319:	else {
line 1321
;1320:		// get the team mate that will be the team leader
;1321:		trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1322
;1322:		client = FindClientByName(teammate);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 264
INDIRI4
ASGNI4
line 1323
;1323:		if (client >= 0)
ADDRLP4 256
INDIRI4
CNSTI4 0
LTI4 $431
line 1324
;1324:			ClientName(client, bs->teamleader, sizeof(bs->teamleader));
ADDRLP4 256
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
LABELV $431
line 1325
;1325:	}
LABELV $430
line 1326
;1326:}
LABELV $426
endproc BotMatch_StartTeamLeaderShip 268 16
export BotMatch_StopTeamLeaderShip
proc BotMatch_StopTeamLeaderShip 528 16
line 1333
;1327:
;1328:/*
;1329:==================
;1330:BotMatch_StopTeamLeaderShip
;1331:==================
;1332:*/
;1333:void BotMatch_StopTeamLeaderShip(bot_state_t* bs, bot_match_t* match) {
line 1338
;1334:	int  client;
;1335:	char teammate[MAX_MESSAGE_SIZE];
;1336:	char netname[MAX_MESSAGE_SIZE];
;1337:
;1338:	if (!TeamPlayIsOn())
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $434
line 1339
;1339:		return;
ADDRGP4 $433
JUMPV
LABELV $434
line 1341
;1340:	// get the team mate that stops being the team leader
;1341:	trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1343
;1342:	// if chats for him or herself
;1343:	if (match->subtype & ST_I) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 0
EQI4 $436
line 1344
;1344:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1345
;1345:		client = FindClientByName(netname);
ADDRLP4 260
ARGP4
ADDRLP4 520
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
line 1346
;1346:	}
ADDRGP4 $437
JUMPV
LABELV $436
line 1348
;1347:	// chats for someone else
;1348:	else {
line 1349
;1349:		client = FindClientByName(teammate);
ADDRLP4 4
ARGP4
ADDRLP4 520
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
line 1350
;1350:	}  // end else
LABELV $437
line 1351
;1351:	if (client >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $438
line 1352
;1352:		if (!Q_stricmp(bs->teamleader, ClientName(client, netname, sizeof(netname)))) {
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 520
ADDRGP4 ClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 520
INDIRP4
ARGP4
ADDRLP4 524
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 524
INDIRI4
CNSTI4 0
NEI4 $440
line 1353
;1353:			bs->teamleader[0] = '\0';
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
CNSTI1 0
ASGNI1
line 1354
;1354:			notleader[client] = qtrue;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
CNSTI4 1
ASGNI4
line 1355
;1355:		}
LABELV $440
line 1356
;1356:	}
LABELV $438
line 1357
;1357:}
LABELV $433
endproc BotMatch_StopTeamLeaderShip 528 16
export BotMatch_WhoIsTeamLeader
proc BotMatch_WhoIsTeamLeader 264 12
line 1364
;1358:
;1359:/*
;1360:==================
;1361:BotMatch_WhoIsTeamLeader
;1362:==================
;1363:*/
;1364:void BotMatch_WhoIsTeamLeader(bot_state_t* bs, bot_match_t* match) {
line 1367
;1365:	char netname[MAX_MESSAGE_SIZE];
;1366:
;1367:	if (!TeamPlayIsOn())
ADDRLP4 256
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 0
NEI4 $443
line 1368
;1368:		return;
ADDRGP4 $442
JUMPV
LABELV $443
line 1370
;1369:
;1370:	ClientName(bs->client, netname, sizeof(netname));
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
line 1372
;1371:	// if this bot IS the team leader
;1372:	if (!Q_stricmp(netname, bs->teamleader)) {
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 260
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 260
INDIRI4
CNSTI4 0
NEI4 $445
line 1373
;1373:		trap_EA_SayTeam(bs->client, "I'm the team leader\n");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $447
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 1374
;1374:	}
LABELV $445
line 1375
;1375:}
LABELV $442
endproc BotMatch_WhoIsTeamLeader 264 12
export BotMatch_WhatAreYouDoing
proc BotMatch_WhatAreYouDoing 532 16
line 1382
;1376:
;1377:/*
;1378:==================
;1379:BotMatch_WhatAreYouDoing
;1380:==================
;1381:*/
;1382:void BotMatch_WhatAreYouDoing(bot_state_t* bs, bot_match_t* match) {
line 1388
;1383:	char netname[MAX_MESSAGE_SIZE];
;1384:	char goalname[MAX_MESSAGE_SIZE];
;1385:	int  client;
;1386:
;1387:	// if not addressed to this bot
;1388:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 516
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $449
line 1389
;1389:		return;
ADDRGP4 $448
JUMPV
LABELV $449
line 1391
;1390:	//
;1391:	switch (bs->ltgtype) {
ADDRLP4 520
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 1
LTI4 $451
ADDRLP4 520
INDIRI4
CNSTI4 11
GTI4 $451
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $475-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $475
address $454
address $456
address $458
address $468
address $470
address $472
address $464
address $464
address $466
address $460
address $462
code
LABELV $454
line 1392
;1392:	case LTG_TEAMHELP: {
line 1393
;1393:		EasyClientName(bs->teammate, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1394
;1394:		BotAI_BotInitialChat(bs, "helping", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $455
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1395
;1395:		break;
ADDRGP4 $452
JUMPV
LABELV $456
line 1397
;1396:	}
;1397:	case LTG_TEAMACCOMPANY: {
line 1398
;1398:		EasyClientName(bs->teammate, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 6604
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1399
;1399:		BotAI_BotInitialChat(bs, "accompanying", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $457
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1400
;1400:		break;
ADDRGP4 $452
JUMPV
LABELV $458
line 1402
;1401:	}
;1402:	case LTG_DEFENDKEYAREA: {
line 1403
;1403:		trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1404
;1404:		BotAI_BotInitialChat(bs, "defending", goalname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $459
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1405
;1405:		break;
ADDRGP4 $452
JUMPV
LABELV $460
line 1407
;1406:	}
;1407:	case LTG_GETITEM: {
line 1408
;1408:		trap_BotGoalName(bs->teamgoal.number, goalname, sizeof(goalname));
ADDRFP4 0
INDIRP4
CNSTI4 6668
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1409
;1409:		BotAI_BotInitialChat(bs, "gettingitem", goalname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $461
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1410
;1410:		break;
ADDRGP4 $452
JUMPV
LABELV $462
line 1412
;1411:	}
;1412:	case LTG_KILL: {
line 1413
;1413:		ClientName(bs->teamgoal.entitynum, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 6664
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
line 1414
;1414:		BotAI_BotInitialChat(bs, "killing", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $463
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1415
;1415:		break;
ADDRGP4 $452
JUMPV
LABELV $464
line 1418
;1416:	}
;1417:	case LTG_CAMP:
;1418:	case LTG_CAMPORDER: {
line 1419
;1419:		BotAI_BotInitialChat(bs, "camping", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $465
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1420
;1420:		break;
ADDRGP4 $452
JUMPV
LABELV $466
line 1422
;1421:	}
;1422:	case LTG_PATROL: {
line 1423
;1423:		BotAI_BotInitialChat(bs, "patrolling", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $467
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1424
;1424:		break;
ADDRGP4 $452
JUMPV
LABELV $468
line 1426
;1425:	}
;1426:	case LTG_GETFLAG: {
line 1427
;1427:		BotAI_BotInitialChat(bs, "capturingflag", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $469
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1428
;1428:		break;
ADDRGP4 $452
JUMPV
LABELV $470
line 1430
;1429:	}
;1430:	case LTG_RUSHBASE: {
line 1431
;1431:		BotAI_BotInitialChat(bs, "rushingbase", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $471
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1432
;1432:		break;
ADDRGP4 $452
JUMPV
LABELV $472
line 1434
;1433:	}
;1434:	case LTG_RETURNFLAG: {
line 1435
;1435:		BotAI_BotInitialChat(bs, "returningflag", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $473
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1436
;1436:		break;
ADDRGP4 $452
JUMPV
LABELV $451
line 1448
;1437:	}
;1438:#ifdef MISSIONPACK
;1439:	case LTG_ATTACKENEMYBASE: {
;1440:		BotAI_BotInitialChat(bs, "attackingenemybase", NULL);
;1441:		break;
;1442:	}
;1443:	case LTG_HARVEST: {
;1444:		BotAI_BotInitialChat(bs, "harvesting", NULL);
;1445:		break;
;1446:	}
;1447:#endif
;1448:	default: {
line 1449
;1449:		BotAI_BotInitialChat(bs, "roaming", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $474
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1450
;1450:		break;
LABELV $452
line 1454
;1451:	}
;1452:	}
;1453:	// chat what the bot is doing
;1454:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1455
;1455:	client = ClientFromName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 528
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 256
ADDRLP4 528
INDIRI4
ASGNI4
line 1456
;1456:	trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1457
;1457:}
LABELV $448
endproc BotMatch_WhatAreYouDoing 532 16
export BotMatch_WhatIsMyCommand
proc BotMatch_WhatIsMyCommand 40 12
line 1464
;1458:
;1459:/*
;1460:==================
;1461:BotMatch_WhatIsMyCommand
;1462:==================
;1463:*/
;1464:void BotMatch_WhatIsMyCommand(bot_state_t* bs, bot_match_t* match) {
line 1467
;1465:	char netname[MAX_NETNAME];
;1466:
;1467:	ClientName(bs->client, netname, sizeof(netname));
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
line 1468
;1468:	if (Q_stricmp(netname, bs->teamleader) != 0)
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $478
line 1469
;1469:		return;
ADDRGP4 $477
JUMPV
LABELV $478
line 1470
;1470:	bs->forceorders = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
CNSTI4 1
ASGNI4
line 1471
;1471:}
LABELV $477
endproc BotMatch_WhatIsMyCommand 40 12
export BotNearestVisibleItem
proc BotNearestVisibleItem 248 28
line 1478
;1472:
;1473:/*
;1474:==================
;1475:BotNearestVisibleItem
;1476:==================
;1477:*/
;1478:float BotNearestVisibleItem(bot_state_t* bs, char* itemname, bot_goal_t* goal) {
line 1486
;1479:	int         i;
;1480:	char        name[64];
;1481:	bot_goal_t  tmpgoal;
;1482:	float       dist, bestdist;
;1483:	vec3_t      dir;
;1484:	bsp_trace_t trace;
;1485:
;1486:	bestdist = 999999;
ADDRLP4 140
CNSTF4 1232348144
ASGNF4
line 1487
;1487:	i        = -1;
ADDRLP4 68
CNSTI4 -1
ASGNI4
LABELV $481
line 1488
;1488:	do {
line 1489
;1489:		i = trap_BotGetLevelItemGoal(i, itemname, &tmpgoal);
ADDRLP4 68
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 228
ADDRGP4 trap_BotGetLevelItemGoal
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 228
INDIRI4
ASGNI4
line 1490
;1490:		trap_BotGoalName(tmpgoal.number, name, sizeof(name));
ADDRLP4 0+44
INDIRI4
ARGI4
ADDRLP4 72
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_BotGoalName
CALLV
pop
line 1491
;1491:		if (Q_stricmp(itemname, name) != 0)
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 232
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 232
INDIRI4
CNSTI4 0
EQI4 $485
line 1492
;1492:			continue;
ADDRGP4 $482
JUMPV
LABELV $485
line 1493
;1493:		VectorSubtract(tmpgoal.origin, bs->origin, dir);
ADDRLP4 236
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 0
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 4908
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 4912
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 56+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 4916
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1494
;1494:		dist = VectorLength(dir);
ADDRLP4 56
ARGP4
ADDRLP4 240
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 136
ADDRLP4 240
INDIRF4
ASGNF4
line 1495
;1495:		if (dist < bestdist) {
ADDRLP4 136
INDIRF4
ADDRLP4 140
INDIRF4
GEF4 $491
line 1497
;1496:			// trace from start to end
;1497:			BotAI_Trace(&trace, bs->eye, NULL, NULL, tmpgoal.origin, bs->client, CONTENTS_SOLID | CONTENTS_PLAYERCLIP);
ADDRLP4 144
ARGP4
ADDRLP4 244
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 244
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 244
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
line 1498
;1498:			if (trace.fraction >= 1.0) {
ADDRLP4 144+8
INDIRF4
CNSTF4 1065353216
LTF4 $493
line 1499
;1499:				bestdist = dist;
ADDRLP4 140
ADDRLP4 136
INDIRF4
ASGNF4
line 1500
;1500:				memcpy(goal, &tmpgoal, sizeof(bot_goal_t));
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 56
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 1501
;1501:			}
LABELV $493
line 1502
;1502:		}
LABELV $491
line 1503
;1503:	} while (i > 0);
LABELV $482
ADDRLP4 68
INDIRI4
CNSTI4 0
GTI4 $481
line 1504
;1504:	return bestdist;
ADDRLP4 140
INDIRF4
RETF4
LABELV $480
endproc BotNearestVisibleItem 248 28
data
align 4
LABELV $497
address $498
address $499
address $500
address $501
address $502
address $503
address $504
address $505
address $506
address $507
address $508
address $509
address $510
address $511
address $512
address $513
address $514
byte 4 0
export BotMatch_WhereAreYou
code
proc BotMatch_WhereAreYou 444 20
line 1512
;1505:}
;1506:
;1507:/*
;1508:==================
;1509:BotMatch_WhereAreYou
;1510:==================
;1511:*/
;1512:void BotMatch_WhereAreYou(bot_state_t* bs, bot_match_t* match) {
line 1517
;1513:	float      dist, bestdist;
;1514:	int        i, bestitem, redtt, bluett, client;
;1515:	bot_goal_t goal;
;1516:	char       netname[MAX_MESSAGE_SIZE];
;1517:	char*      nearbyitems[] = {
ADDRLP4 8
ADDRGP4 $497
INDIRB
ASGNB 72
line 1550
;1518:			 "Shotgun",
;1519:			 "Grenade Launcher",
;1520:			 "Rocket Launcher",
;1521:			 "Plasmagun",
;1522:			 "Railgun",
;1523:			 "Lightning Gun",
;1524:			 "BFG10K",
;1525:			 "Quad Damage",
;1526:			 "Regeneration",
;1527:			 "Battle Suit",
;1528:			 "Speed",
;1529:			 "Invisibility",
;1530:			 "Flight",
;1531:			 "Armor",
;1532:			 "Heavy Armor",
;1533:			 "Red Flag",
;1534:			 "Blue Flag",
;1535:#ifdef MISSIONPACK
;1536:		"Nailgun",
;1537:		"Prox Launcher",
;1538:		"Chaingun",
;1539:		"Scout",
;1540:		"Guard",
;1541:		"Doubler",
;1542:		"Ammo Regen",
;1543:		"Neutral Flag",
;1544:		"Red Obelisk",
;1545:		"Blue Obelisk",
;1546:		"Neutral Obelisk",
;1547:#endif
;1548:		NULL};
;1549:	//
;1550:	if (!TeamPlayIsOn())
ADDRLP4 412
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 412
INDIRI4
CNSTI4 0
NEI4 $515
line 1551
;1551:		return;
ADDRGP4 $496
JUMPV
LABELV $515
line 1553
;1552:	// if not addressed to this bot
;1553:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 416
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 416
INDIRI4
CNSTI4 0
NEI4 $517
line 1554
;1554:		return;
ADDRGP4 $496
JUMPV
LABELV $517
line 1556
;1555:
;1556:	bestitem = -1;
ADDRLP4 140
CNSTI4 -1
ASGNI4
line 1557
;1557:	bestdist = 999999;
ADDRLP4 80
CNSTF4 1232348144
ASGNF4
line 1558
;1558:	for (i = 0; nearbyitems[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $522
JUMPV
LABELV $519
line 1559
;1559:		dist = BotNearestVisibleItem(bs, nearbyitems[i], &goal);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 84
ARGP4
ADDRLP4 420
ADDRGP4 BotNearestVisibleItem
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 420
INDIRF4
ASGNF4
line 1560
;1560:		if (dist < bestdist) {
ADDRLP4 4
INDIRF4
ADDRLP4 80
INDIRF4
GEF4 $523
line 1561
;1561:			bestdist = dist;
ADDRLP4 80
ADDRLP4 4
INDIRF4
ASGNF4
line 1562
;1562:			bestitem = i;
ADDRLP4 140
ADDRLP4 0
INDIRI4
ASGNI4
line 1563
;1563:		}
LABELV $523
line 1564
;1564:	}
LABELV $520
line 1558
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $522
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $519
line 1565
;1565:	if (bestitem != -1) {
ADDRLP4 140
INDIRI4
CNSTI4 -1
EQI4 $525
line 1566
;1566:		if (gametype == GT_CTF
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $527
line 1570
;1567:#ifdef MISSIONPACK
;1568:		    || gametype == GT_1FCTF
;1569:#endif
;1570:		) {
line 1571
;1571:			redtt  = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, ctf_redflag.areanum, TFL_DEFAULT);
ADDRLP4 420
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 420
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 420
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRGP4 ctf_redflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 424
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 404
ADDRLP4 424
INDIRI4
ASGNI4
line 1572
;1572:			bluett = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, ctf_blueflag.areanum, TFL_DEFAULT);
ADDRLP4 428
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 428
INDIRP4
CNSTI4 4948
ADDP4
INDIRI4
ARGI4
ADDRLP4 428
INDIRP4
CNSTI4 4908
ADDP4
ARGP4
ADDRGP4 ctf_blueflag+12
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 432
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 408
ADDRLP4 432
INDIRI4
ASGNI4
line 1573
;1573:			if (redtt < (redtt + bluett) * 0.4) {
ADDRLP4 436
ADDRLP4 404
INDIRI4
ASGNI4
ADDRLP4 436
INDIRI4
CVIF4 4
ADDRLP4 436
INDIRI4
ADDRLP4 408
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1053609165
MULF4
GEF4 $531
line 1574
;1574:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "red", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $533
ARGP4
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $534
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1575
;1575:			} else if (bluett < (redtt + bluett) * 0.4) {
ADDRGP4 $528
JUMPV
LABELV $531
ADDRLP4 440
ADDRLP4 408
INDIRI4
ASGNI4
ADDRLP4 440
INDIRI4
CVIF4 4
ADDRLP4 404
INDIRI4
ADDRLP4 440
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1053609165
MULF4
GEF4 $535
line 1576
;1576:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "blue", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $533
ARGP4
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
ADDRGP4 $537
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1577
;1577:			} else {
ADDRGP4 $528
JUMPV
LABELV $535
line 1578
;1578:				BotAI_BotInitialChat(bs, "location", nearbyitems[bestitem], NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $538
ARGP4
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1579
;1579:			}
line 1580
;1580:		}
ADDRGP4 $528
JUMPV
LABELV $527
line 1594
;1581:#ifdef MISSIONPACK
;1582:		else if (gametype == GT_OBELISK || gametype == GT_HARVESTER) {
;1583:			redtt  = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, redobelisk.areanum, TFL_DEFAULT);
;1584:			bluett = trap_AAS_AreaTravelTimeToGoalArea(bs->areanum, bs->origin, blueobelisk.areanum, TFL_DEFAULT);
;1585:			if (redtt < (redtt + bluett) * 0.4) {
;1586:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "red", NULL);
;1587:			} else if (bluett < (redtt + bluett) * 0.4) {
;1588:				BotAI_BotInitialChat(bs, "teamlocation", nearbyitems[bestitem], "blue", NULL);
;1589:			} else {
;1590:				BotAI_BotInitialChat(bs, "location", nearbyitems[bestitem], NULL);
;1591:			}
;1592:		}
;1593:#endif
;1594:		else {
line 1595
;1595:			BotAI_BotInitialChat(bs, "location", nearbyitems[bestitem], NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $538
ARGP4
ADDRLP4 140
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1596
;1596:		}
LABELV $528
line 1597
;1597:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 144
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1598
;1598:		client = ClientFromName(netname);
ADDRLP4 144
ARGP4
ADDRLP4 420
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 400
ADDRLP4 420
INDIRI4
ASGNI4
line 1599
;1599:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 400
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1600
;1600:	}
LABELV $525
line 1601
;1601:}
LABELV $496
endproc BotMatch_WhereAreYou 444 20
export BotMatch_LeadTheWay
proc BotMatch_LeadTheWay 680 16
line 1608
;1602:
;1603:/*
;1604:==================
;1605:BotMatch_LeadTheWay
;1606:==================
;1607:*/
;1608:void BotMatch_LeadTheWay(bot_state_t* bs, bot_match_t* match) {
line 1613
;1609:	aas_entityinfo_t entinfo;
;1610:	char             netname[MAX_MESSAGE_SIZE], teammate[MAX_MESSAGE_SIZE];
;1611:	int              client, areanum, other;
;1612:
;1613:	if (!TeamPlayIsOn())
ADDRLP4 664
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 664
INDIRI4
CNSTI4 0
NEI4 $540
line 1614
;1614:		return;
ADDRGP4 $539
JUMPV
LABELV $540
line 1616
;1615:	// if not addressed to this bot
;1616:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 668
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 668
INDIRI4
CNSTI4 0
NEI4 $542
line 1617
;1617:		return;
ADDRGP4 $539
JUMPV
LABELV $542
line 1619
;1618:	// if someone asks for someone else
;1619:	if (match->subtype & ST_SOMEONE) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $544
line 1621
;1620:		// get the team mate name
;1621:		trap_BotMatchVariable(match, TEAMMATE, teammate, sizeof(teammate));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 400
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1622
;1622:		client = FindClientByName(teammate);
ADDRLP4 400
ARGP4
ADDRLP4 672
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 672
INDIRI4
ASGNI4
line 1624
;1623:		// if this is the bot self
;1624:		if (client == bs->client) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $546
line 1625
;1625:			other = qfalse;
ADDRLP4 656
CNSTI4 0
ASGNI4
line 1626
;1626:		} else if (!BotSameTeam(bs, client)) {
ADDRGP4 $545
JUMPV
LABELV $546
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 676
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 676
INDIRI4
CNSTI4 0
NEI4 $548
line 1628
;1627:			// FIXME: say "I don't help the enemy"
;1628:			return;
ADDRGP4 $539
JUMPV
LABELV $548
line 1629
;1629:		} else {
line 1630
;1630:			other = qtrue;
ADDRLP4 656
CNSTI4 1
ASGNI4
line 1631
;1631:		}
line 1632
;1632:	} else {
ADDRGP4 $545
JUMPV
LABELV $544
line 1634
;1633:		// get the netname
;1634:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 144
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1635
;1635:		client = ClientFromName(netname);
ADDRLP4 144
ARGP4
ADDRLP4 672
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 672
INDIRI4
ASGNI4
line 1636
;1636:		other  = qfalse;
ADDRLP4 656
CNSTI4 0
ASGNI4
line 1637
;1637:	}
LABELV $545
line 1639
;1638:	// if the bot doesn't know who to help (FindClientByName returned -1)
;1639:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $550
line 1640
;1640:		BotAI_BotInitialChat(bs, "whois", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $233
ARGP4
ADDRLP4 144
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1641
;1641:		trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 672
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1642
;1642:		return;
ADDRGP4 $539
JUMPV
LABELV $550
line 1645
;1643:	}
;1644:	//
;1645:	bs->lead_teamgoal.entitynum = -1;
ADDRFP4 0
INDIRP4
CNSTI4 6868
ADDP4
CNSTI4 -1
ASGNI4
line 1646
;1646:	BotEntityInfo(client, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 1648
;1647:	// if info is valid (in PVS)
;1648:	if (entinfo.valid) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $552
line 1649
;1649:		areanum = BotPointAreaNum(entinfo.origin);
ADDRLP4 4+24
ARGP4
ADDRLP4 672
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 660
ADDRLP4 672
INDIRI4
ASGNI4
line 1650
;1650:		if (areanum) {  // && trap_AAS_AreaReachability(areanum)) {
ADDRLP4 660
INDIRI4
CNSTI4 0
EQI4 $555
line 1651
;1651:			bs->lead_teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 6868
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1652
;1652:			bs->lead_teamgoal.areanum   = areanum;
ADDRFP4 0
INDIRP4
CNSTI4 6840
ADDP4
ADDRLP4 660
INDIRI4
ASGNI4
line 1653
;1653:			VectorCopy(entinfo.origin, bs->lead_teamgoal.origin);
ADDRFP4 0
INDIRP4
CNSTI4 6828
ADDP4
ADDRLP4 4+24
INDIRB
ASGNB 12
line 1654
;1654:			VectorSet(bs->lead_teamgoal.mins, -8, -8, -8);
ADDRFP4 0
INDIRP4
CNSTI4 6844
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6848
ADDP4
CNSTF4 3238002688
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6852
ADDP4
CNSTF4 3238002688
ASGNF4
line 1655
;1655:			VectorSet(bs->lead_teamgoal.maxs, 8, 8, 8);
ADDRFP4 0
INDIRP4
CNSTI4 6856
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6860
ADDP4
CNSTF4 1090519040
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 6864
ADDP4
CNSTF4 1090519040
ASGNF4
line 1656
;1656:		}
LABELV $555
line 1657
;1657:	}
LABELV $552
line 1659
;1658:
;1659:	if (bs->teamgoal.entitynum < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
INDIRI4
CNSTI4 0
GEI4 $558
line 1660
;1660:		if (other)
ADDRLP4 656
INDIRI4
CNSTI4 0
EQI4 $560
line 1661
;1661:			BotAI_BotInitialChat(bs, "whereis", teammate, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $252
ARGP4
ADDRLP4 400
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $561
JUMPV
LABELV $560
line 1663
;1662:		else
;1663:			BotAI_BotInitialChat(bs, "whereareyou", netname, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRLP4 144
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
LABELV $561
line 1664
;1664:		trap_BotEnterChat(bs->cs, bs->client, CHAT_TEAM);
ADDRLP4 672
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 672
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 672
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1665
;1665:		return;
ADDRGP4 $539
JUMPV
LABELV $558
line 1667
;1666:	}
;1667:	bs->lead_teammate    = client;
ADDRFP4 0
INDIRP4
CNSTI4 6824
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1668
;1668:	bs->lead_time        = FloatTime() + TEAM_LEAD_TIME;
ADDRFP4 0
INDIRP4
CNSTI4 6884
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1142292480
ADDF4
ASGNF4
line 1669
;1669:	bs->leadvisible_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6888
ADDP4
CNSTF4 0
ASGNF4
line 1670
;1670:	bs->leadmessage_time = -(FloatTime() + 2 * random());
ADDRLP4 672
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6892
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 672
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1073741824
MULF4
ADDF4
NEGF4
ASGNF4
line 1671
;1671:}
LABELV $539
endproc BotMatch_LeadTheWay 680 16
export BotMatch_Kill
proc BotMatch_Kill 532 16
line 1678
;1672:
;1673:/*
;1674:==================
;1675:BotMatch_Kill
;1676:==================
;1677:*/
;1678:void BotMatch_Kill(bot_state_t* bs, bot_match_t* match) {
line 1683
;1679:	char enemy[MAX_MESSAGE_SIZE];
;1680:	char netname[MAX_MESSAGE_SIZE];
;1681:	int  client;
;1682:
;1683:	if (!TeamPlayIsOn())
ADDRLP4 516
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 516
INDIRI4
CNSTI4 0
NEI4 $563
line 1684
;1684:		return;
ADDRGP4 $562
JUMPV
LABELV $563
line 1686
;1685:	// if not addressed to this bot
;1686:	if (!BotAddressedToBot(bs, match))
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 520
ADDRGP4 BotAddressedToBot
CALLI4
ASGNI4
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $565
line 1687
;1687:		return;
ADDRGP4 $562
JUMPV
LABELV $565
line 1689
;1688:
;1689:	trap_BotMatchVariable(match, ENEMY, enemy, sizeof(enemy));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1691
;1690:	//
;1691:	client = FindEnemyByName(bs, enemy);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 524
ADDRGP4 FindEnemyByName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 524
INDIRI4
ASGNI4
line 1692
;1692:	if (client < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $567
line 1693
;1693:		BotAI_BotInitialChat(bs, "whois", enemy, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $233
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1694
;1694:		trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1695
;1695:		client = ClientFromName(netname);
ADDRLP4 260
ARGP4
ADDRLP4 528
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 528
INDIRI4
ASGNI4
line 1696
;1696:		trap_BotEnterChat(bs->cs, client, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1697
;1697:		return;
ADDRGP4 $562
JUMPV
LABELV $567
line 1699
;1698:	}
;1699:	bs->teamgoal.entitynum = client;
ADDRFP4 0
INDIRP4
CNSTI4 6664
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1701
;1700:	// set the time to send a message to the team mates
;1701:	bs->teammessage_time = FloatTime() + 2 * random();
ADDRLP4 528
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6740
ADDP4
ADDRGP4 floattime
INDIRF4
ADDRLP4 528
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
line 1703
;1702:	// set the ltg type
;1703:	bs->ltgtype = LTG_KILL;
ADDRFP4 0
INDIRP4
CNSTI4 6600
ADDP4
CNSTI4 11
ASGNI4
line 1705
;1704:	// set the team goal time
;1705:	bs->teamgoal_time = FloatTime() + TEAM_KILL_SOMEONE;
ADDRFP4 0
INDIRP4
CNSTI4 6744
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 1707
;1706:	//
;1707:	BotSetTeamStatus(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotSetTeamStatus
CALLV
pop
line 1711
;1708:#ifdef DEBUG
;1709:	BotPrintTeamGoal(bs);
;1710:#endif  // DEBUG
;1711:}
LABELV $562
endproc BotMatch_Kill 532 16
export BotMatch_CTF
proc BotMatch_CTF 176 16
line 1718
;1712:
;1713:/*
;1714:==================
;1715:BotMatch_CTF
;1716:==================
;1717:*/
;1718:void BotMatch_CTF(bot_state_t* bs, bot_match_t* match) {
line 1722
;1719:
;1720:	char flag[128], netname[MAX_NETNAME];
;1721:
;1722:	if (gametype == GT_CTF) {
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $570
line 1723
;1723:		trap_BotMatchVariable(match, FLAG, flag, sizeof(flag));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1724
;1724:		if (match->subtype & ST_GOTFLAG) {
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $572
line 1725
;1725:			if (!Q_stricmp(flag, "red")) {
ADDRLP4 0
ARGP4
ADDRGP4 $534
ARGP4
ADDRLP4 164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $574
line 1726
;1726:				bs->redflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 1
ASGNI4
line 1727
;1727:				if (BotTeam(bs) == TEAM_BLUE) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 168
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 2
NEI4 $575
line 1728
;1728:					trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1729
;1729:					bs->flagcarrier = ClientFromName(netname);
ADDRLP4 128
ARGP4
ADDRLP4 172
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
ADDRLP4 172
INDIRI4
ASGNI4
line 1730
;1730:				}
line 1731
;1731:			} else {
ADDRGP4 $575
JUMPV
LABELV $574
line 1732
;1732:				bs->blueflagstatus = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 1
ASGNI4
line 1733
;1733:				if (BotTeam(bs) == TEAM_RED) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 168
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 168
INDIRI4
CNSTI4 1
NEI4 $578
line 1734
;1734:					trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 128
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1735
;1735:					bs->flagcarrier = ClientFromName(netname);
ADDRLP4 128
ARGP4
ADDRLP4 172
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
ADDRLP4 172
INDIRI4
ASGNI4
line 1736
;1736:				}
LABELV $578
line 1737
;1737:			}
LABELV $575
line 1738
;1738:			bs->flagstatuschanged    = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 1739
;1739:			bs->lastflagcapture_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1740
;1740:		} else if (match->subtype & ST_CAPTUREDFLAG) {
ADDRGP4 $573
JUMPV
LABELV $572
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $580
line 1741
;1741:			bs->redflagstatus     = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
line 1742
;1742:			bs->blueflagstatus    = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
line 1743
;1743:			bs->flagcarrier       = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
CNSTI4 0
ASGNI4
line 1744
;1744:			bs->flagstatuschanged = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 1745
;1745:		} else if (match->subtype & ST_RETURNEDFLAG) {
ADDRGP4 $581
JUMPV
LABELV $580
ADDRFP4 4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $582
line 1746
;1746:			if (!Q_stricmp(flag, "red"))
ADDRLP4 0
ARGP4
ADDRGP4 $534
ARGP4
ADDRLP4 164
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 164
INDIRI4
CNSTI4 0
NEI4 $584
line 1747
;1747:				bs->redflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6956
ADDP4
CNSTI4 0
ASGNI4
ADDRGP4 $585
JUMPV
LABELV $584
line 1749
;1748:			else
;1749:				bs->blueflagstatus = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6960
ADDP4
CNSTI4 0
ASGNI4
LABELV $585
line 1750
;1750:			bs->flagstatuschanged = 1;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 1
ASGNI4
line 1751
;1751:		}
LABELV $582
LABELV $581
LABELV $573
line 1752
;1752:	}
LABELV $570
line 1761
;1753:#ifdef MISSIONPACK
;1754:	else if (gametype == GT_1FCTF) {
;1755:		if (match->subtype & ST_1FCTFGOTFLAG) {
;1756:			trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
;1757:			bs->flagcarrier = ClientFromName(netname);
;1758:		}
;1759:	}
;1760:#endif
;1761:}
LABELV $569
endproc BotMatch_CTF 176 16
export BotMatch_EnterGame
proc BotMatch_EnterGame 44 16
line 1763
;1762:
;1763:void BotMatch_EnterGame(bot_state_t* bs, bot_match_t* match) {
line 1767
;1764:	int  client;
;1765:	char netname[MAX_NETNAME];
;1766:
;1767:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1768
;1768:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
line 1769
;1769:	if (client >= 0) {
ADDRLP4 36
INDIRI4
CNSTI4 0
LTI4 $587
line 1770
;1770:		notleader[client] = qfalse;
ADDRLP4 36
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
CNSTI4 0
ASGNI4
line 1771
;1771:	}
LABELV $587
line 1775
;1772:	// NOTE: eliza chats will catch this
;1773:	// Com_sprintf(buf, sizeof(buf), "heya %s", netname);
;1774:	// EA_Say(bs->client, buf);
;1775:}
LABELV $586
endproc BotMatch_EnterGame 44 16
export BotMatch_NewLeader
proc BotMatch_NewLeader 48 16
line 1777
;1776:
;1777:void BotMatch_NewLeader(bot_state_t* bs, bot_match_t* match) {
line 1781
;1778:	int  client;
;1779:	char netname[MAX_NETNAME];
;1780:
;1781:	trap_BotMatchVariable(match, NETNAME, netname, sizeof(netname));
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 trap_BotMatchVariable
CALLV
pop
line 1782
;1782:	client = FindClientByName(netname);
ADDRLP4 0
ARGP4
ADDRLP4 40
ADDRGP4 FindClientByName
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 40
INDIRI4
ASGNI4
line 1783
;1783:	if (!BotSameTeam(bs, client))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $590
line 1784
;1784:		return;
ADDRGP4 $589
JUMPV
LABELV $590
line 1785
;1785:	Q_strncpyz(bs->teamleader, netname, sizeof(bs->teamleader));
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1786
;1786:}
LABELV $589
endproc BotMatch_NewLeader 48 16
export BotMatchMessage
proc BotMatchMessage 336 12
line 1793
;1787:
;1788:/*
;1789:==================
;1790:BotMatchMessage
;1791:==================
;1792:*/
;1793:int BotMatchMessage(bot_state_t* bs, char* message) {
line 1796
;1794:	bot_match_t match;
;1795:
;1796:	match.type = 0;
ADDRLP4 0+256
CNSTI4 0
ASGNI4
line 1798
;1797:	// if it is an unknown message
;1798:	if (!trap_BotFindMatch(message, &match, MTCONTEXT_MISC | MTCONTEXT_INITIALTEAMCHAT | MTCONTEXT_CTF)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTU4 262
ARGU4
ADDRLP4 328
ADDRGP4 trap_BotFindMatch
CALLI4
ASGNI4
ADDRLP4 328
INDIRI4
CNSTI4 0
NEI4 $594
line 1799
;1799:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $592
JUMPV
LABELV $594
line 1802
;1800:	}
;1801:	// react to the found message
;1802:	switch (match.type) {
ADDRLP4 332
ADDRLP4 0+256
INDIRI4
ASGNI4
ADDRLP4 332
INDIRI4
CNSTI4 1
LTI4 $596
ADDRLP4 332
INDIRI4
CNSTI4 33
GTI4 $632
ADDRLP4 332
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $633-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $633
address $628
address $627
address $599
address $599
address $600
address $604
address $603
address $619
address $620
address $621
address $597
address $622
address $609
address $610
address $613
address $615
address $616
address $597
address $618
address $601
address $612
address $602
address $625
address $608
address $626
address $624
address $605
address $623
address $611
address $606
address $596
address $596
address $630
code
LABELV $632
ADDRLP4 0+256
INDIRI4
CNSTI4 300
EQI4 $607
ADDRGP4 $596
JUMPV
LABELV $599
line 1805
;1803:	case MSG_HELP:       // someone calling for help
;1804:	case MSG_ACCOMPANY:  // someone calling for company
;1805:	{
line 1806
;1806:		BotMatch_HelpAccompany(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_HelpAccompany
CALLV
pop
line 1807
;1807:		break;
ADDRGP4 $597
JUMPV
LABELV $600
line 1810
;1808:	}
;1809:	case MSG_DEFENDKEYAREA:  // teamplay defend a key area
;1810:	{
line 1811
;1811:		BotMatch_DefendKeyArea(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_DefendKeyArea
CALLV
pop
line 1812
;1812:		break;
ADDRGP4 $597
JUMPV
LABELV $601
line 1815
;1813:	}
;1814:	case MSG_CAMP:  // camp somewhere
;1815:	{
line 1816
;1816:		BotMatch_Camp(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Camp
CALLV
pop
line 1817
;1817:		break;
ADDRGP4 $597
JUMPV
LABELV $602
line 1820
;1818:	}
;1819:	case MSG_PATROL:  // patrol between several key areas
;1820:	{
line 1821
;1821:		BotMatch_Patrol(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Patrol
CALLV
pop
line 1822
;1822:		break;
ADDRGP4 $597
JUMPV
LABELV $603
line 1826
;1823:	}
;1824:	// CTF & 1FCTF
;1825:	case MSG_GETFLAG:  // ctf get the enemy flag
;1826:	{
line 1827
;1827:		BotMatch_GetFlag(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_GetFlag
CALLV
pop
line 1828
;1828:		break;
ADDRGP4 $597
JUMPV
LABELV $604
line 1844
;1829:	}
;1830:#ifdef MISSIONPACK
;1831:	// CTF & 1FCTF & Obelisk & Harvester
;1832:	case MSG_ATTACKENEMYBASE: {
;1833:		BotMatch_AttackEnemyBase(bs, &match);
;1834:		break;
;1835:	}
;1836:	// Harvester
;1837:	case MSG_HARVEST: {
;1838:		BotMatch_Harvest(bs, &match);
;1839:		break;
;1840:	}
;1841:#endif
;1842:	// CTF & 1FCTF & Harvester
;1843:	case MSG_RUSHBASE:  // ctf rush to the base
;1844:	{
line 1845
;1845:		BotMatch_RushBase(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_RushBase
CALLV
pop
line 1846
;1846:		break;
ADDRGP4 $597
JUMPV
LABELV $605
line 1849
;1847:	}
;1848:	// CTF & 1FCTF
;1849:	case MSG_RETURNFLAG: {
line 1850
;1850:		BotMatch_ReturnFlag(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_ReturnFlag
CALLV
pop
line 1851
;1851:		break;
ADDRGP4 $597
JUMPV
LABELV $606
line 1854
;1852:	}
;1853:	// CTF & 1FCTF & Obelisk & Harvester
;1854:	case MSG_TASKPREFERENCE: {
line 1855
;1855:		BotMatch_TaskPreference(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_TaskPreference
CALLV
pop
line 1856
;1856:		break;
ADDRGP4 $597
JUMPV
LABELV $607
line 1859
;1857:	}
;1858:	// CTF & 1FCTF
;1859:	case MSG_CTF: {
line 1860
;1860:		BotMatch_CTF(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_CTF
CALLV
pop
line 1861
;1861:		break;
ADDRGP4 $597
JUMPV
LABELV $608
line 1863
;1862:	}
;1863:	case MSG_GETITEM: {
line 1864
;1864:		BotMatch_GetItem(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_GetItem
CALLV
pop
line 1865
;1865:		break;
ADDRGP4 $597
JUMPV
LABELV $609
line 1868
;1866:	}
;1867:	case MSG_JOINSUBTEAM:  // join a sub team
;1868:	{
line 1869
;1869:		BotMatch_JoinSubteam(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_JoinSubteam
CALLV
pop
line 1870
;1870:		break;
ADDRGP4 $597
JUMPV
LABELV $610
line 1873
;1871:	}
;1872:	case MSG_LEAVESUBTEAM:  // leave a sub team
;1873:	{
line 1874
;1874:		BotMatch_LeaveSubteam(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_LeaveSubteam
CALLV
pop
line 1875
;1875:		break;
ADDRGP4 $597
JUMPV
LABELV $611
line 1877
;1876:	}
;1877:	case MSG_WHICHTEAM: {
line 1878
;1878:		BotMatch_WhichTeam(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhichTeam
CALLV
pop
line 1879
;1879:		break;
ADDRGP4 $597
JUMPV
LABELV $612
line 1882
;1880:	}
;1881:	case MSG_CHECKPOINT:  // remember a check point
;1882:	{
line 1883
;1883:		BotMatch_CheckPoint(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_CheckPoint
CALLV
pop
line 1884
;1884:		break;
ADDRGP4 $597
JUMPV
LABELV $613
line 1887
;1885:	}
;1886:	case MSG_CREATENEWFORMATION:  // start the creation of a new formation
;1887:	{
line 1888
;1888:		trap_EA_SayTeam(bs->client, "the part of my brain to create formations has been damaged");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $614
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 1889
;1889:		break;
ADDRGP4 $597
JUMPV
LABELV $615
line 1892
;1890:	}
;1891:	case MSG_FORMATIONPOSITION:  // tell someone his/her position in the formation
;1892:	{
line 1893
;1893:		trap_EA_SayTeam(bs->client, "the part of my brain to create formations has been damaged");
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 $614
ARGP4
ADDRGP4 trap_EA_SayTeam
CALLV
pop
line 1894
;1894:		break;
ADDRGP4 $597
JUMPV
LABELV $616
line 1897
;1895:	}
;1896:	case MSG_FORMATIONSPACE:  // set the formation space
;1897:	{
line 1898
;1898:		BotMatch_FormationSpace(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_FormationSpace
CALLV
pop
line 1899
;1899:		break;
ADDRGP4 $597
JUMPV
line 1902
;1900:	}
;1901:	case MSG_DOFORMATION:  // form a certain formation
;1902:	{
line 1903
;1903:		break;
LABELV $618
line 1906
;1904:	}
;1905:	case MSG_DISMISS:  // dismiss someone
;1906:	{
line 1907
;1907:		BotMatch_Dismiss(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Dismiss
CALLV
pop
line 1908
;1908:		break;
ADDRGP4 $597
JUMPV
LABELV $619
line 1911
;1909:	}
;1910:	case MSG_STARTTEAMLEADERSHIP:  // someone will become the team leader
;1911:	{
line 1912
;1912:		BotMatch_StartTeamLeaderShip(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_StartTeamLeaderShip
CALLV
pop
line 1913
;1913:		break;
ADDRGP4 $597
JUMPV
LABELV $620
line 1916
;1914:	}
;1915:	case MSG_STOPTEAMLEADERSHIP:  // someone will stop being the team leader
;1916:	{
line 1917
;1917:		BotMatch_StopTeamLeaderShip(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_StopTeamLeaderShip
CALLV
pop
line 1918
;1918:		break;
ADDRGP4 $597
JUMPV
LABELV $621
line 1920
;1919:	}
;1920:	case MSG_WHOISTEAMLAEDER: {
line 1921
;1921:		BotMatch_WhoIsTeamLeader(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhoIsTeamLeader
CALLV
pop
line 1922
;1922:		break;
ADDRGP4 $597
JUMPV
LABELV $622
line 1925
;1923:	}
;1924:	case MSG_WHATAREYOUDOING:  // ask a bot what he/she is doing
;1925:	{
line 1926
;1926:		BotMatch_WhatAreYouDoing(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhatAreYouDoing
CALLV
pop
line 1927
;1927:		break;
ADDRGP4 $597
JUMPV
LABELV $623
line 1929
;1928:	}
;1929:	case MSG_WHATISMYCOMMAND: {
line 1930
;1930:		BotMatch_WhatIsMyCommand(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhatIsMyCommand
CALLV
pop
line 1931
;1931:		break;
ADDRGP4 $597
JUMPV
LABELV $624
line 1933
;1932:	}
;1933:	case MSG_WHEREAREYOU: {
line 1934
;1934:		BotMatch_WhereAreYou(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_WhereAreYou
CALLV
pop
line 1935
;1935:		break;
ADDRGP4 $597
JUMPV
LABELV $625
line 1937
;1936:	}
;1937:	case MSG_LEADTHEWAY: {
line 1938
;1938:		BotMatch_LeadTheWay(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_LeadTheWay
CALLV
pop
line 1939
;1939:		break;
ADDRGP4 $597
JUMPV
LABELV $626
line 1941
;1940:	}
;1941:	case MSG_KILL: {
line 1942
;1942:		BotMatch_Kill(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Kill
CALLV
pop
line 1943
;1943:		break;
ADDRGP4 $597
JUMPV
LABELV $627
line 1946
;1944:	}
;1945:	case MSG_ENTERGAME:  // someone entered the game
;1946:	{
line 1947
;1947:		BotMatch_EnterGame(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_EnterGame
CALLV
pop
line 1948
;1948:		break;
ADDRGP4 $597
JUMPV
LABELV $628
line 1950
;1949:	}
;1950:	case MSG_NEWLEADER: {
line 1951
;1951:		BotMatch_NewLeader(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_NewLeader
CALLV
pop
line 1952
;1952:		break;
ADDRGP4 $597
JUMPV
line 1954
;1953:	}
;1954:	case MSG_WAIT: {
line 1955
;1955:		break;
LABELV $630
line 1957
;1956:	}
;1957:	case MSG_SUICIDE: {
line 1958
;1958:		BotMatch_Suicide(bs, &match);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 BotMatch_Suicide
CALLV
pop
line 1959
;1959:		break;
ADDRGP4 $597
JUMPV
LABELV $596
line 1961
;1960:	}
;1961:	default: {
line 1962
;1962:		BotAI_Print(PRT_MESSAGE, "unknown match type\n");
CNSTI4 1
ARGI4
ADDRGP4 $631
ARGP4
ADDRGP4 BotAI_Print
CALLV
pop
line 1963
;1963:		break;
LABELV $597
line 1966
;1964:	}
;1965:	}
;1966:	return qtrue;
CNSTI4 1
RETI4
LABELV $592
endproc BotMatchMessage 336 12
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
bss
export notleader
align 4
LABELV notleader
skip 256
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
import mapname
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
LABELV $631
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $614
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 109
byte 1 121
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $538
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $537
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $534
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $533
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $514
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
LABELV $513
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
LABELV $512
byte 1 72
byte 1 101
byte 1 97
byte 1 118
byte 1 121
byte 1 32
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $511
byte 1 65
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $510
byte 1 70
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $509
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
LABELV $508
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $507
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
LABELV $506
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
LABELV $505
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
LABELV $504
byte 1 66
byte 1 70
byte 1 71
byte 1 49
byte 1 48
byte 1 75
byte 1 0
align 1
LABELV $503
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $502
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $501
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $500
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $499
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $498
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $474
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $473
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $471
byte 1 114
byte 1 117
byte 1 115
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $469
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $467
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
LABELV $465
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $463
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $461
byte 1 103
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 0
align 1
LABELV $459
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $457
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
byte 1 0
align 1
LABELV $455
byte 1 104
byte 1 101
byte 1 108
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $447
byte 1 73
byte 1 39
byte 1 109
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
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 10
byte 1 0
align 1
LABELV $425
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $419
byte 1 100
byte 1 105
byte 1 115
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $403
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 95
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 114
byte 1 109
byte 1 0
align 1
LABELV $402
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 32
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 0
align 1
LABELV $391
byte 1 99
byte 1 104
byte 1 101
byte 1 99
byte 1 107
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 95
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $383
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
LABELV $377
byte 1 110
byte 1 111
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $376
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $368
byte 1 0
align 1
LABELV $367
byte 1 108
byte 1 101
byte 1 102
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $359
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $348
byte 1 107
byte 1 101
byte 1 101
byte 1 112
byte 1 105
byte 1 110
byte 1 109
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $253
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 97
byte 1 114
byte 1 101
byte 1 121
byte 1 111
byte 1 117
byte 1 0
align 1
LABELV $252
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $233
byte 1 119
byte 1 104
byte 1 111
byte 1 105
byte 1 115
byte 1 0
align 1
LABELV $216
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $167
byte 1 73
byte 1 32
byte 1 110
byte 1 101
byte 1 101
byte 1 100
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 97
byte 1 116
byte 1 114
byte 1 111
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $142
byte 1 119
byte 1 104
byte 1 97
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 115
byte 1 97
byte 1 121
byte 1 63
byte 1 0
