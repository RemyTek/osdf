code
proc CG_TargetCommand_f 20 12
file "../../../../code/cgame/cg_consolecmds.c"
line 17
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_consolecmds.c -- text commands typed in at the local console, or
;4:// executed by a key binding
;5:
;6:#include "cg_local.h"
;7:#ifdef MISSIONPACK
;8:#include "../ui/ui_shared.h"
;9:extern menuDef_t* menuScoreboard;
;10:#endif
;11:
;12:/*
;13:=================
;14:CG_TargetCommand_f
;15:=================
;16:*/
;17:static void CG_TargetCommand_f(void) {
line 21
;18:	int  targetNum;
;19:	char cmd[4];
;20:
;21:	targetNum = CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 22
;22:	if (targetNum == -1) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $73
line 23
;23:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 26
;24:	}
;25:
;26:	trap_Argv(1, cmd, sizeof(cmd));
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 27
;27:	trap_SendConsoleCommand(va("gc %i %i", targetNum, atoi(cmd)));
ADDRLP4 4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 $75
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 28
;28:}
LABELV $72
endproc CG_TargetCommand_f 20 12
proc CG_SizeUp_f 4 8
line 37
;29:
;30:/*
;31:=================
;32:CG_SizeUp_f
;33:
;34:Keybinding command
;35:=================
;36:*/
;37:static void CG_SizeUp_f(void) {
line 38
;38:	trap_Cvar_Set("cg_viewsize", va("%i", (int)(cg_viewsize.integer + 10)));
ADDRGP4 $78
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
ADDI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $77
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 39
;39:}
LABELV $76
endproc CG_SizeUp_f 4 8
proc CG_SizeDown_f 4 8
line 48
;40:
;41:/*
;42:=================
;43:CG_SizeDown_f
;44:
;45:Keybinding command
;46:=================
;47:*/
;48:static void CG_SizeDown_f(void) {
line 49
;49:	trap_Cvar_Set("cg_viewsize", va("%i", (int)(cg_viewsize.integer - 10)));
ADDRGP4 $78
ARGP4
ADDRGP4 cg_viewsize+12
INDIRI4
CNSTI4 10
SUBI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $77
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 50
;50:}
LABELV $80
endproc CG_SizeDown_f 4 8
proc CG_Viewpos_f 0 20
line 59
;51:
;52:/*
;53:=============
;54:CG_Viewpos_f
;55:
;56:Debugging command to print the current position
;57:=============
;58:*/
;59:static void CG_Viewpos_f(void) {
line 60
;60:	CG_Printf("(%i %i %i) : %i\n", (int)cg.refdef.vieworg[0], (int)cg.refdef.vieworg[1], (int)cg.refdef.vieworg[2], (int)cg.refdefViewAngles[YAW]);
ADDRGP4 $83
ARGP4
ADDRGP4 cg+109056+24
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109056+24+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109056+24+8
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cg+109424+4
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 61
;61:}
LABELV $82
endproc CG_Viewpos_f 0 20
proc CG_ScoresDown_f 0 4
line 63
;62:
;63:static void CG_ScoresDown_f(void) {
line 68
;64:
;65:#ifdef MISSIONPACK
;66:	CG_BuildSpectatorString();
;67:#endif
;68:	if (cg.scoresRequestTime + 2000 < cg.time && !cg.demoPlayback) {
ADDRGP4 cg+110472
INDIRI4
CNSTI4 2000
ADDI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $95
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $95
line 71
;69:		// the scores are more than two seconds out of data,
;70:		// so request new ones
;71:		cg.scoresRequestTime = cg.time;
ADDRGP4 cg+110472
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 72
;72:		trap_SendClientCommand("score");
ADDRGP4 $102
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 76
;73:
;74:		// leave the current scores up if they were already
;75:		// displayed, but if this is the first hit, clear them out
;76:		if (!cg.showScores) {
ADDRGP4 cg+115356
INDIRI4
CNSTI4 0
NEI4 $96
line 77
;77:			cg.showScores = qtrue;
ADDRGP4 cg+115356
CNSTI4 1
ASGNI4
line 78
;78:			cg.numScores  = 0;
ADDRGP4 cg+110476
CNSTI4 0
ASGNI4
line 79
;79:		}
line 80
;80:	} else {
ADDRGP4 $96
JUMPV
LABELV $95
line 83
;81:		// show the cached contents even if they just pressed if it
;82:		// is within two seconds
;83:		cg.showScores = qtrue;
ADDRGP4 cg+115356
CNSTI4 1
ASGNI4
line 84
;84:	}
LABELV $96
line 86
;85:
;86:	CG_SetScoreCatcher(cg.showScores);
ADDRGP4 cg+115356
INDIRI4
ARGI4
ADDRGP4 CG_SetScoreCatcher
CALLV
pop
line 87
;87:}
LABELV $94
endproc CG_ScoresDown_f 0 4
proc CG_ScoresUp_f 0 4
line 89
;88:
;89:static void CG_ScoresUp_f(void) {
line 91
;90:
;91:	if (cgs.filterKeyUpEvent) {
ADDRGP4 cgs+149696
INDIRI4
CNSTI4 0
EQI4 $111
line 92
;92:		cgs.filterKeyUpEvent = qfalse;
ADDRGP4 cgs+149696
CNSTI4 0
ASGNI4
line 93
;93:		return;
ADDRGP4 $110
JUMPV
LABELV $111
line 96
;94:	}
;95:
;96:	if (cg.showScores) {
ADDRGP4 cg+115356
INDIRI4
CNSTI4 0
EQI4 $115
line 97
;97:		cg.showScores    = qfalse;
ADDRGP4 cg+115356
CNSTI4 0
ASGNI4
line 98
;98:		cg.scoreFadeTime = cg.time;
ADDRGP4 cg+115364
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 99
;99:	}
LABELV $115
line 101
;100:
;101:	CG_SetScoreCatcher(cg.showScores);
ADDRGP4 cg+115356
INDIRI4
ARGI4
ADDRGP4 CG_SetScoreCatcher
CALLV
pop
line 102
;102:}
LABELV $110
endproc CG_ScoresUp_f 0 4
proc CG_TellTarget_f 264 20
line 171
;103:
;104:#ifdef MISSIONPACK
;105:extern menuDef_t* menuScoreboard;
;106:void              Menu_Reset(void);  // FIXME: add to right include file
;107:
;108:static void       CG_LoadHud_f(void) {
;109:		  char        buff[1024];
;110:		  const char* hudSet;
;111:		  memset(buff, 0, sizeof(buff));
;112:
;113:		  String_Init();
;114:		  Menu_Reset();
;115:
;116:		  trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
;117:		  hudSet = buff;
;118:		  if (hudSet[0] == '\0') {
;119:			  hudSet = "ui/hud.txt";
;120:    }
;121:
;122:		  CG_LoadMenus(hudSet);
;123:		  menuScoreboard = NULL;
;124:}
;125:
;126:static void CG_scrollScoresDown_f(void) {
;127:	if (menuScoreboard && cg.scoreBoardShowing) {
;128:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qtrue);
;129:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qtrue);
;130:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qtrue);
;131:	}
;132:}
;133:
;134:static void CG_scrollScoresUp_f(void) {
;135:	if (menuScoreboard && cg.scoreBoardShowing) {
;136:		Menu_ScrollFeeder(menuScoreboard, FEEDER_SCOREBOARD, qfalse);
;137:		Menu_ScrollFeeder(menuScoreboard, FEEDER_REDTEAM_LIST, qfalse);
;138:		Menu_ScrollFeeder(menuScoreboard, FEEDER_BLUETEAM_LIST, qfalse);
;139:	}
;140:}
;141:
;142:static void CG_spWin_f(void) {
;143:	trap_Cvar_Set("cg_cameraOrbit", "2");
;144:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
;145:	trap_Cvar_Set("cg_thirdPerson", "1");
;146:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
;147:	trap_Cvar_Set("cg_thirdPersonRange", "100");
;148:	CG_AddBufferedSound(cgs.media.winnerSound);
;149:	// trap_S_StartLocalSound(cgs.media.winnerSound, CHAN_ANNOUNCER);
;150:	CG_CenterPrint("YOU WIN!", SCREEN_HEIGHT * .30, 0);
;151:}
;152:
;153:static void CG_spLose_f(void) {
;154:	trap_Cvar_Set("cg_cameraOrbit", "2");
;155:	trap_Cvar_Set("cg_cameraOrbitDelay", "35");
;156:	trap_Cvar_Set("cg_thirdPerson", "1");
;157:	trap_Cvar_Set("cg_thirdPersonAngle", "0");
;158:	trap_Cvar_Set("cg_thirdPersonRange", "100");
;159:	CG_AddBufferedSound(cgs.media.loserSound);
;160:	// trap_S_StartLocalSound(cgs.media.loserSound, CHAN_ANNOUNCER);
;161:	CG_CenterPrint("YOU LOSE...", SCREEN_HEIGHT * .30, 0);
;162:}
;163:
;164:#endif
;165:
;166:/*
;167:==================
;168:CG_TellTarget_f
;169:==================
;170:*/
;171:static void CG_TellTarget_f(void) {
line 176
;172:	int  clientNum;
;173:	char command[128];
;174:	char message[128];
;175:
;176:	clientNum = CG_CrosshairPlayer();
ADDRLP4 260
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 177
;177:	if (clientNum == -1) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $123
line 178
;178:		return;
ADDRGP4 $122
JUMPV
LABELV $123
line 181
;179:	}
;180:
;181:	trap_Args(message, sizeof(message));
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 182
;182:	Com_sprintf(command, sizeof(command), "tell %i %s", clientNum, message);
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $125
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 183
;183:	trap_SendClientCommand(command);
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 184
;184:}
LABELV $122
endproc CG_TellTarget_f 264 20
proc CG_TellAttacker_f 264 20
line 191
;185:
;186:/*
;187:==================
;188:CG_TellAttacker_f
;189:==================
;190:*/
;191:static void CG_TellAttacker_f(void) {
line 196
;192:	int  clientNum;
;193:	char command[128];
;194:	char message[128];
;195:
;196:	clientNum = CG_LastAttacker();
ADDRLP4 260
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 260
INDIRI4
ASGNI4
line 197
;197:	if (clientNum == -1) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $127
line 198
;198:		return;
ADDRGP4 $126
JUMPV
LABELV $127
line 201
;199:	}
;200:
;201:	trap_Args(message, sizeof(message));
ADDRLP4 132
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Args
CALLV
pop
line 202
;202:	Com_sprintf(command, sizeof(command), "tell %i %s", clientNum, message);
ADDRLP4 4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $125
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 132
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 203
;203:	trap_SendClientCommand(command);
ADDRLP4 4
ARGP4
ADDRGP4 trap_SendClientCommand
CALLV
pop
line 204
;204:}
LABELV $126
endproc CG_TellAttacker_f 264 20
proc CG_StartOrbit_f 1028 12
line 416
;205:
;206:#ifdef MISSIONPACK
;207:/*
;208:==================
;209:CG_VoiceTellTarget_f
;210:==================
;211:*/
;212:static void CG_VoiceTellTarget_f(void) {
;213:	int  clientNum;
;214:	char command[128];
;215:	char message[128];
;216:
;217:	clientNum = CG_CrosshairPlayer();
;218:	if (clientNum == -1) {
;219:		return;
;220:	}
;221:
;222:	trap_Args(message, sizeof(message));
;223:	Com_sprintf(command, sizeof(command), "vtell %i %s", clientNum, message);
;224:	trap_SendClientCommand(command);
;225:}
;226:
;227:/*
;228:==================
;229:CG_VoiceTellAttacker_f
;230:==================
;231:*/
;232:static void CG_VoiceTellAttacker_f(void) {
;233:	int  clientNum;
;234:	char command[128];
;235:	char message[128];
;236:
;237:	clientNum = CG_LastAttacker();
;238:	if (clientNum == -1) {
;239:		return;
;240:	}
;241:
;242:	trap_Args(message, sizeof(message));
;243:	Com_sprintf(command, sizeof(command), "vtell %i %s", clientNum, message);
;244:	trap_SendClientCommand(command);
;245:}
;246:
;247:static void CG_NextTeamMember_f(void) {
;248:	CG_SelectNextPlayer();
;249:}
;250:
;251:static void CG_PrevTeamMember_f(void) {
;252:	CG_SelectPrevPlayer();
;253:}
;254:
;255:// ASS U ME's enumeration order as far as task specific orders, OFFENSE is zero, CAMP is last
;256://
;257:static void CG_NextOrder_f(void) {
;258:	clientInfo_t* ci = cgs.clientinfo + cg.snap->ps.clientNum;
;259:	if (ci) {
;260:		if (!ci->teamLeader && sortedTeamPlayers[cg_currentSelectedPlayer.integer] != cg.snap->ps.clientNum) {
;261:			return;
;262:		}
;263:	}
;264:	if (cgs.currentOrder < TEAMTASK_CAMP) {
;265:		cgs.currentOrder++;
;266:
;267:		if (cgs.currentOrder == TEAMTASK_RETRIEVE) {
;268:			if (!CG_OtherTeamHasFlag()) {
;269:				cgs.currentOrder++;
;270:			}
;271:		}
;272:
;273:		if (cgs.currentOrder == TEAMTASK_ESCORT) {
;274:			if (!CG_YourTeamHasFlag()) {
;275:				cgs.currentOrder++;
;276:			}
;277:		}
;278:
;279:	} else {
;280:		cgs.currentOrder = TEAMTASK_OFFENSE;
;281:	}
;282:	cgs.orderPending = qtrue;
;283:	cgs.orderTime    = cg.time + 3000;
;284:}
;285:
;286:static void CG_ConfirmOrder_f(void) {
;287:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_YES));
;288:	trap_SendConsoleCommand("+button5; wait; -button5");
;289:	if (cg.time < cgs.acceptOrderTime) {
;290:		trap_SendClientCommand(va("teamtask %d\n", cgs.acceptTask));
;291:		cgs.acceptOrderTime = 0;
;292:	}
;293:}
;294:
;295:static void CG_DenyOrder_f(void) {
;296:	trap_SendConsoleCommand(va("cmd vtell %d %s\n", cgs.acceptLeader, VOICECHAT_NO));
;297:	trap_SendConsoleCommand("+button6; wait; -button6");
;298:	if (cg.time < cgs.acceptOrderTime) {
;299:		cgs.acceptOrderTime = 0;
;300:	}
;301:}
;302:
;303:static void CG_TaskOffense_f(void) {
;304:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF) {
;305:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONGETFLAG));
;306:	} else {
;307:		trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONOFFENSE));
;308:	}
;309:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_OFFENSE));
;310:}
;311:
;312:static void CG_TaskDefense_f(void) {
;313:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONDEFENSE));
;314:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_DEFENSE));
;315:}
;316:
;317:static void CG_TaskPatrol_f(void) {
;318:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONPATROL));
;319:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_PATROL));
;320:}
;321:
;322:static void CG_TaskCamp_f(void) {
;323:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONCAMPING));
;324:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_CAMP));
;325:}
;326:
;327:static void CG_TaskFollow_f(void) {
;328:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOW));
;329:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_FOLLOW));
;330:}
;331:
;332:static void CG_TaskRetrieve_f(void) {
;333:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONRETURNFLAG));
;334:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_RETRIEVE));
;335:}
;336:
;337:static void CG_TaskEscort_f(void) {
;338:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_ONFOLLOWCARRIER));
;339:	trap_SendClientCommand(va("teamtask %d\n", TEAMTASK_ESCORT));
;340:}
;341:
;342:static void CG_TaskOwnFlag_f(void) {
;343:	trap_SendConsoleCommand(va("cmd vsay_team %s\n", VOICECHAT_IHAVEFLAG));
;344:}
;345:
;346:static void CG_TauntKillInsult_f(void) {
;347:	trap_SendConsoleCommand("cmd vsay kill_insult\n");
;348:}
;349:
;350:static void CG_TauntPraise_f(void) {
;351:	trap_SendConsoleCommand("cmd vsay praise\n");
;352:}
;353:
;354:static void CG_TauntTaunt_f(void) {
;355:	trap_SendConsoleCommand("cmd vtaunt\n");
;356:}
;357:
;358:static void CG_TauntDeathInsult_f(void) {
;359:	trap_SendConsoleCommand("cmd vsay death_insult\n");
;360:}
;361:
;362:static void CG_TauntGauntlet_f(void) {
;363:	trap_SendConsoleCommand("cmd vsay kill_gauntlet\n");
;364:}
;365:
;366:static void CG_TaskSuicide_f(void) {
;367:	int  clientNum;
;368:	char command[128];
;369:
;370:	clientNum = CG_CrosshairPlayer();
;371:	if (clientNum == -1) {
;372:		return;
;373:	}
;374:
;375:	Com_sprintf(command, 128, "tell %i suicide", clientNum);
;376:	trap_SendClientCommand(command);
;377:}
;378:
;379:/*
;380:==================
;381:CG_TeamMenu_f
;382:==================
;383:*/
;384:/*
;385:static void CG_TeamMenu_f( void ) {
;386:  if (trap_Key_GetCatcher() & KEYCATCH_CGAME) {
;387:    CG_EventHandling(CGAME_EVENT_NONE);
;388:    trap_Key_SetCatcher(0);
;389:  } else {
;390:    CG_EventHandling(CGAME_EVENT_TEAMMENU);
;391:    //trap_Key_SetCatcher(KEYCATCH_CGAME);
;392:  }
;393:}
;394:*/
;395:
;396:/*
;397:==================
;398:CG_EditHud_f
;399:==================
;400:*/
;401:/*
;402:static void CG_EditHud_f( void ) {
;403:  //cls.keyCatchers ^= KEYCATCH_CGAME;
;404:  //VM_Call (cgvm, CG_EVENT_HANDLING, (cls.keyCatchers & KEYCATCH_CGAME) ? CGAME_EVENT_EDITHUD : CGAME_EVENT_NONE);
;405:}
;406:*/
;407:
;408:#endif
;409:
;410:/*
;411:==================
;412:CG_StartOrbit_f
;413:==================
;414:*/
;415:
;416:static void CG_StartOrbit_f(void) {
line 419
;417:	char var[MAX_TOKEN_CHARS];
;418:
;419:	trap_Cvar_VariableStringBuffer("developer", var, sizeof(var));
ADDRGP4 $130
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 420
;420:	if (!atoi(var)) {
ADDRLP4 0
ARGP4
ADDRLP4 1024
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $131
line 421
;421:		return;
ADDRGP4 $129
JUMPV
LABELV $131
line 423
;422:	}
;423:	if (cg_cameraOrbit.value != 0) {
ADDRGP4 cg_cameraOrbit+8
INDIRF4
CNSTF4 0
EQF4 $133
line 424
;424:		trap_Cvar_Set("cg_cameraOrbit", "0");
ADDRGP4 $136
ARGP4
ADDRGP4 $137
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 425
;425:		trap_Cvar_Set("cg_thirdPerson", "0");
ADDRGP4 $138
ARGP4
ADDRGP4 $137
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 426
;426:	} else {
ADDRGP4 $134
JUMPV
LABELV $133
line 427
;427:		trap_Cvar_Set("cg_cameraOrbit", "5");
ADDRGP4 $136
ARGP4
ADDRGP4 $139
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 428
;428:		trap_Cvar_Set("cg_thirdPerson", "1");
ADDRGP4 $138
ARGP4
ADDRGP4 $140
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 429
;429:		trap_Cvar_Set("cg_thirdPersonAngle", "0");
ADDRGP4 $141
ARGP4
ADDRGP4 $137
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 430
;430:		trap_Cvar_Set("cg_thirdPersonRange", "100");
ADDRGP4 $142
ARGP4
ADDRGP4 $143
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 431
;431:	}
LABELV $134
line 432
;432:}
LABELV $129
endproc CG_StartOrbit_f 1028 12
data
align 4
LABELV commands
address $145
address CG_TestGun_f
address $146
address CG_TestModel_f
address $147
address CG_TestModelNextFrame_f
address $148
address CG_TestModelPrevFrame_f
address $149
address CG_TestModelNextSkin_f
address $150
address CG_TestModelPrevSkin_f
address $151
address CG_Viewpos_f
address $152
address CG_ScoresDown_f
address $153
address CG_ScoresUp_f
address $154
address CG_ZoomDown_f
address $155
address CG_ZoomUp_f
address $156
address CG_SizeUp_f
address $157
address CG_SizeDown_f
address $158
address CG_NextWeapon_f
address $159
address CG_PrevWeapon_f
address $160
address CG_Weapon_f
address $161
address CG_TargetCommand_f
address $162
address CG_TellTarget_f
address $163
address CG_TellAttacker_f
address $164
address CG_StartOrbit_f
address $165
address CG_LoadDeferredPlayers
export CG_ConsoleCommand
code
proc CG_ConsoleCommand 16 8
line 513
;433:
;434:/*
;435:static void CG_Camera_f( void ) {
;436:    char name[1024];
;437:    trap_Argv( 1, name, sizeof(name));
;438:    if (trap_loadCamera(name)) {
;439:        cg.cameraMode = qtrue;
;440:        trap_startCamera(cg.time);
;441:    } else {
;442:        CG_Printf ("Unable to load camera %s\n",name);
;443:    }
;444:}
;445:*/
;446:
;447:typedef struct {
;448:	const char* cmd;
;449:	void (*function)(void);
;450:} consoleCommand_t;
;451:
;452:static consoleCommand_t commands[] = {
;453:	{"testgun",          CG_TestGun_f           },
;454:	{"testmodel",        CG_TestModel_f         },
;455:	{"nextframe",        CG_TestModelNextFrame_f},
;456:	{"prevframe",        CG_TestModelPrevFrame_f},
;457:	{"nextskin",         CG_TestModelNextSkin_f },
;458:	{"prevskin",         CG_TestModelPrevSkin_f },
;459:	{"viewpos",          CG_Viewpos_f           },
;460:	{"+scores",          CG_ScoresDown_f        },
;461:	{"-scores",          CG_ScoresUp_f          },
;462:	{"+zoom",            CG_ZoomDown_f          },
;463:	{"-zoom",            CG_ZoomUp_f            },
;464:	{"sizeup",           CG_SizeUp_f            },
;465:	{"sizedown",         CG_SizeDown_f          },
;466:	{"weapnext",         CG_NextWeapon_f        },
;467:	{"weapprev",         CG_PrevWeapon_f        },
;468:	{"weapon",           CG_Weapon_f            },
;469:	{"tcmd",			 CG_TargetCommand_f     },
;470:	{"tell_target",      CG_TellTarget_f        },
;471:	{"tell_attacker",    CG_TellAttacker_f      },
;472:#ifdef MISSIONPACK
;473:	{"vtell_target",     CG_VoiceTellTarget_f   },
;474:	{"vtell_attacker",   CG_VoiceTellAttacker_f },
;475:	{"loadhud",          CG_LoadHud_f           },
;476:	{"nextTeamMember",   CG_NextTeamMember_f    },
;477:	{"prevTeamMember",   CG_PrevTeamMember_f    },
;478:	{"nextOrder",        CG_NextOrder_f         },
;479:	{"confirmOrder",     CG_ConfirmOrder_f      },
;480:	{"denyOrder",        CG_DenyOrder_f         },
;481:	{"taskOffense",      CG_TaskOffense_f       },
;482:	{"taskDefense",      CG_TaskDefense_f       },
;483:	{"taskPatrol",       CG_TaskPatrol_f        },
;484:	{"taskCamp",         CG_TaskCamp_f          },
;485:	{"taskFollow",       CG_TaskFollow_f        },
;486:	{"taskRetrieve",     CG_TaskRetrieve_f      },
;487:	{"taskEscort",       CG_TaskEscort_f        },
;488:	{"taskSuicide",      CG_TaskSuicide_f       },
;489:	{"taskOwnFlag",      CG_TaskOwnFlag_f       },
;490:	{"tauntKillInsult",  CG_TauntKillInsult_f   },
;491:	{"tauntPraise",      CG_TauntPraise_f       },
;492:	{"tauntTaunt",       CG_TauntTaunt_f        },
;493:	{"tauntDeathInsult", CG_TauntDeathInsult_f  },
;494:	{"tauntGauntlet",    CG_TauntGauntlet_f     },
;495:	{"spWin",            CG_spWin_f             },
;496:	{"spLose",           CG_spLose_f            },
;497:	{"scoresDown",       CG_scrollScoresDown_f  },
;498:	{"scoresUp",         CG_scrollScoresUp_f    },
;499:#endif
;500:	{"startOrbit",       CG_StartOrbit_f        },
;501: //{ "camera", CG_Camera_f },
;502:	{"loaddeferred",     CG_LoadDeferredPlayers }
;503:};
;504:
;505:/*
;506:=================
;507:CG_ConsoleCommand
;508:
;509:The string has been tokenized and can be retrieved with
;510:Cmd_Argc() / Cmd_Argv()
;511:=================
;512:*/
;513:qboolean CG_ConsoleCommand(void) {
line 517
;514:	const char* cmd;
;515:	int         i;
;516:
;517:	cmd = CG_Argv(0);
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 CG_Argv
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 519
;518:
;519:	for (i = 0; i < ARRAY_LEN(commands); i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $170
JUMPV
LABELV $167
line 520
;520:		if (!Q_stricmp(cmd, commands[i].cmd)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $171
line 521
;521:			commands[i].function();
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands+4
ADDP4
INDIRP4
CALLV
pop
line 522
;522:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $166
JUMPV
LABELV $171
line 524
;523:		}
;524:	}
LABELV $168
line 519
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $170
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 21
LTU4 $167
line 526
;525:
;526:	return qfalse;
CNSTI4 0
RETI4
LABELV $166
endproc CG_ConsoleCommand 16 8
export CG_InitConsoleCommands
proc CG_InitConsoleCommands 4 4
line 537
;527:}
;528:
;529:/*
;530:=================
;531:CG_InitConsoleCommands
;532:
;533:Let the client system know about all of our commands
;534:so it can perform tab completion
;535:=================
;536:*/
;537:void CG_InitConsoleCommands(void) {
line 540
;538:	int i;
;539:
;540:	for (i = 0; i < ARRAY_LEN(commands); i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $178
JUMPV
LABELV $175
line 541
;541:		trap_AddCommand(commands[i].cmd);
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 commands
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 542
;542:	}
LABELV $176
line 540
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $178
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 21
LTU4 $175
line 548
;543:
;544:	//
;545:	// the game server will interpret these commands, which will be automatically
;546:	// forwarded to the server after they are not recognized locally
;547:	//
;548:	trap_AddCommand("kill");
ADDRGP4 $179
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 549
;549:	trap_AddCommand("say");
ADDRGP4 $180
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 550
;550:	trap_AddCommand("say_team");
ADDRGP4 $181
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 551
;551:	trap_AddCommand("tell");
ADDRGP4 $182
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 561
;552:#ifdef MISSIONPACK
;553:	trap_AddCommand("vsay");
;554:	trap_AddCommand("vsay_team");
;555:	trap_AddCommand("vtell");
;556:	trap_AddCommand("vtaunt");
;557:	trap_AddCommand("vosay");
;558:	trap_AddCommand("vosay_team");
;559:	trap_AddCommand("votell");
;560:#endif
;561:	trap_AddCommand("give");
ADDRGP4 $183
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 562
;562:	trap_AddCommand("god");
ADDRGP4 $184
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 563
;563:	trap_AddCommand("notarget");
ADDRGP4 $185
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 564
;564:	trap_AddCommand("noclip");
ADDRGP4 $186
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 565
;565:	trap_AddCommand("team");
ADDRGP4 $187
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 566
;566:	trap_AddCommand("follow");
ADDRGP4 $188
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 567
;567:	trap_AddCommand("levelshot");
ADDRGP4 $189
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 568
;568:	trap_AddCommand("addbot");
ADDRGP4 $190
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 569
;569:	trap_AddCommand("setviewpos");
ADDRGP4 $191
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 570
;570:	trap_AddCommand("callvote");
ADDRGP4 $192
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 571
;571:	trap_AddCommand("vote");
ADDRGP4 $193
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 572
;572:	trap_AddCommand("callteamvote");
ADDRGP4 $194
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 573
;573:	trap_AddCommand("teamvote");
ADDRGP4 $195
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 574
;574:	trap_AddCommand("stats");
ADDRGP4 $196
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 575
;575:	trap_AddCommand("teamtask");
ADDRGP4 $197
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 576
;576:	trap_AddCommand("loaddefered");  // spelled wrong, but not changing for demo
ADDRGP4 $198
ARGP4
ADDRGP4 trap_AddCommand
CALLV
pop
line 577
;577:}
LABELV $174
endproc CG_InitConsoleCommands 4 4
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
LABELV $198
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $197
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
LABELV $196
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $195
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $194
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $193
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $192
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $191
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $190
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $189
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $188
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $187
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $186
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $185
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $184
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $183
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $182
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $181
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $180
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $179
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $165
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
byte 1 0
align 1
LABELV $164
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $163
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 97
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $162
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $161
byte 1 116
byte 1 99
byte 1 109
byte 1 100
byte 1 0
align 1
LABELV $160
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $159
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $158
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $157
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $156
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $155
byte 1 45
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $154
byte 1 43
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $153
byte 1 45
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $152
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $151
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $150
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $149
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $148
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $147
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $146
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $145
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $143
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $142
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $141
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $140
byte 1 49
byte 1 0
align 1
LABELV $139
byte 1 53
byte 1 0
align 1
LABELV $138
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $137
byte 1 48
byte 1 0
align 1
LABELV $136
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $130
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
LABELV $125
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $102
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $83
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
byte 1 32
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $78
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $77
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
LABELV $75
byte 1 103
byte 1 99
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
