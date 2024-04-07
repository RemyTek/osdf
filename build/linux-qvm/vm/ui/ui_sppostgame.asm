data
export ui_medalNames
align 4
LABELV ui_medalNames
address $69
address $70
address $71
address $72
address $73
address $74
export ui_medalPicNames
align 4
LABELV ui_medalPicNames
address $75
address $76
address $77
address $78
address $79
address $80
export ui_medalSounds
align 4
LABELV ui_medalSounds
address $81
address $82
address $83
address $84
address $85
address $86
code
proc UI_SPPostgameMenu_AgainEvent 0 8
file "../../../../code/q3_ui/ui_sppostgame.c"
line 71
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:SINGLE PLAYER POSTGAME MENU
;7:
;8:=============================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:#define MAX_SCOREBOARD_CLIENTS 8
;14:
;15:#define AWARD_PRESENTATION_TIME 2000
;16:
;17:#define ART_MENU0   "menu/art/menu_0"
;18:#define ART_MENU1   "menu/art/menu_1"
;19:#define ART_REPLAY0 "menu/art/replay_0"
;20:#define ART_REPLAY1 "menu/art/replay_1"
;21:#define ART_NEXT0   "menu/art/next_0"
;22:#define ART_NEXT1   "menu/art/next_1"
;23:
;24:#define ID_AGAIN 10
;25:#define ID_NEXT  11
;26:#define ID_MENU  12
;27:
;28:typedef struct {
;29:	menuframework_s menu;
;30:	menubitmap_s    item_again;
;31:	menubitmap_s    item_next;
;32:	menubitmap_s    item_menu;
;33:
;34:	int             phase;
;35:	int             ignoreKeysTime;
;36:	int             starttime;
;37:	int             scoreboardtime;
;38:	int             serverId;
;39:
;40:	int             clientNums[MAX_SCOREBOARD_CLIENTS];
;41:	int             ranks[MAX_SCOREBOARD_CLIENTS];
;42:	int             scores[MAX_SCOREBOARD_CLIENTS];
;43:
;44:	char            placeNames[3][64];
;45:
;46:	int             level;
;47:	int             numClients;
;48:	int             won;
;49:	int             numAwards;
;50:	int             awardsEarned[6];
;51:	int             awardsLevels[6];
;52:	qboolean        playedSound[6];
;53:	int             lastTier;
;54:	sfxHandle_t     winnerSound;
;55:} postgameMenuInfo_t;
;56:
;57:static postgameMenuInfo_t postgameMenuInfo;
;58:static char               arenainfo[MAX_INFO_VALUE];
;59:
;60:char*                     ui_medalNames[]    = {"Accuracy", "Impressive", "Excellent", "Gauntlet", "Frags", "Perfect"};
;61:char*                     ui_medalPicNames[] = {"menu/medals/medal_accuracy", "menu/medals/medal_impressive", "menu/medals/medal_excellent",
;62:                                                "menu/medals/medal_gauntlet", "menu/medals/medal_frags",      "menu/medals/medal_victory"};
;63:char*                     ui_medalSounds[]   = {"sound/feedback/accuracy.wav", "sound/feedback/impressive_a.wav", "sound/feedback/excellent_a.wav",
;64:                                                "sound/feedback/gauntlet.wav", "sound/feedback/frags.wav",        "sound/feedback/perfect.wav"};
;65:
;66:/*
;67:=================
;68:UI_SPPostgameMenu_AgainEvent
;69:=================
;70:*/
;71:static void UI_SPPostgameMenu_AgainEvent(void* ptr, int event) {
line 72
;72:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $88
line 73
;73:		return;
ADDRGP4 $87
JUMPV
LABELV $88
line 75
;74:	}
;75:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 76
;76:	trap_Cmd_ExecuteText(EXEC_APPEND, "map_restart 0\n");
CNSTI4 2
ARGI4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 77
;77:}
LABELV $87
endproc UI_SPPostgameMenu_AgainEvent 0 8
proc UI_SPPostgameMenu_NextEvent 36 4
line 84
;78:
;79:/*
;80:=================
;81:UI_SPPostgameMenu_NextEvent
;82:=================
;83:*/
;84:static void UI_SPPostgameMenu_NextEvent(void* ptr, int event) {
line 91
;85:	int         currentSet;
;86:	int         levelSet;
;87:	int         level;
;88:	int         currentLevel;
;89:	const char* arenaInfo;
;90:
;91:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $92
line 92
;92:		return;
ADDRGP4 $91
JUMPV
LABELV $92
line 94
;93:	}
;94:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 97
;95:
;96:	// handle specially if we just won the training map
;97:	if (postgameMenuInfo.won == 0) {
ADDRGP4 postgameMenuInfo+880
INDIRI4
CNSTI4 0
NEI4 $94
line 98
;98:		level = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 99
;99:	} else {
ADDRGP4 $95
JUMPV
LABELV $94
line 100
;100:		level = postgameMenuInfo.level + 1;
ADDRLP4 4
ADDRGP4 postgameMenuInfo+872
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 101
;101:	}
LABELV $95
line 102
;102:	levelSet = level / ARENAS_PER_TIER;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 104
;103:
;104:	currentLevel = UI_GetCurrentGame();
ADDRLP4 20
ADDRGP4 UI_GetCurrentGame
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 105
;105:	if (currentLevel == -1) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $98
line 106
;106:		currentLevel = postgameMenuInfo.level;
ADDRLP4 0
ADDRGP4 postgameMenuInfo+872
INDIRI4
ASGNI4
line 107
;107:	}
LABELV $98
line 108
;108:	currentSet = currentLevel / ARENAS_PER_TIER;
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 110
;109:
;110:	if (levelSet > currentSet || levelSet == UI_GetNumSPTiers()) {
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
GTI4 $103
ADDRLP4 28
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $101
LABELV $103
line 111
;111:		level = currentLevel;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 112
;112:	}
LABELV $101
line 114
;113:
;114:	arenaInfo = UI_GetArenaInfoByNumber(level);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 32
INDIRP4
ASGNP4
line 115
;115:	if (!arenaInfo) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $104
line 116
;116:		return;
ADDRGP4 $91
JUMPV
LABELV $104
line 119
;117:	}
;118:
;119:	UI_SPArena_Start(arenaInfo);
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_SPArena_Start
CALLV
pop
line 120
;120:}
LABELV $91
endproc UI_SPPostgameMenu_NextEvent 36 4
proc UI_SPPostgameMenu_MenuEvent 0 8
line 127
;121:
;122:/*
;123:=================
;124:UI_SPPostgameMenu_MenuEvent
;125:=================
;126:*/
;127:static void UI_SPPostgameMenu_MenuEvent(void* ptr, int event) {
line 128
;128:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $107
line 129
;129:		return;
ADDRGP4 $106
JUMPV
LABELV $107
line 131
;130:	}
;131:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 132
;132:	trap_Cmd_ExecuteText(EXEC_APPEND, "disconnect; levelselect\n");
CNSTI4 2
ARGI4
ADDRGP4 $109
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 133
;133:}
LABELV $106
endproc UI_SPPostgameMenu_MenuEvent 0 8
proc UI_SPPostgameMenu_MenuKey 8 8
line 140
;134:
;135:/*
;136:=================
;137:UI_SPPostgameMenu_MenuKey
;138:=================
;139:*/
;140:static sfxHandle_t UI_SPPostgameMenu_MenuKey(int key) {
line 141
;141:	if (uis.realtime < postgameMenuInfo.ignoreKeysTime) {
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+568
INDIRI4
GEI4 $111
line 142
;142:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $110
JUMPV
LABELV $111
line 145
;143:	}
;144:
;145:	if (postgameMenuInfo.phase == 1) {
ADDRGP4 postgameMenuInfo+564
INDIRI4
CNSTI4 1
NEI4 $115
line 146
;146:		trap_Cmd_ExecuteText(EXEC_APPEND, "abort_podium\n");
CNSTI4 2
ARGI4
ADDRGP4 $118
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 147
;147:		postgameMenuInfo.phase          = 2;
ADDRGP4 postgameMenuInfo+564
CNSTI4 2
ASGNI4
line 148
;148:		postgameMenuInfo.starttime      = uis.realtime;
ADDRGP4 postgameMenuInfo+572
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 149
;149:		postgameMenuInfo.ignoreKeysTime = uis.realtime + 250;
ADDRGP4 postgameMenuInfo+568
ADDRGP4 uis+4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 150
;150:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $110
JUMPV
LABELV $115
line 153
;151:	}
;152:
;153:	if (postgameMenuInfo.phase == 2) {
ADDRGP4 postgameMenuInfo+564
INDIRI4
CNSTI4 2
NEI4 $124
line 154
;154:		postgameMenuInfo.phase          = 3;
ADDRGP4 postgameMenuInfo+564
CNSTI4 3
ASGNI4
line 155
;155:		postgameMenuInfo.starttime      = uis.realtime;
ADDRGP4 postgameMenuInfo+572
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 156
;156:		postgameMenuInfo.ignoreKeysTime = uis.realtime + 250;
ADDRGP4 postgameMenuInfo+568
ADDRGP4 uis+4
INDIRI4
CNSTI4 250
ADDI4
ASGNI4
line 157
;157:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $110
JUMPV
LABELV $124
line 160
;158:	}
;159:
;160:	if (key == K_ESCAPE || key == K_MOUSE2) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 27
EQI4 $134
ADDRLP4 0
INDIRI4
CNSTI4 179
NEI4 $132
LABELV $134
line 161
;161:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $110
JUMPV
LABELV $132
line 164
;162:	}
;163:
;164:	return Menu_DefaultKey(&postgameMenuInfo.menu, key);
ADDRGP4 postgameMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $110
endproc UI_SPPostgameMenu_MenuKey 8 8
data
align 4
LABELV medalLocations
byte 4 144
byte 4 448
byte 4 88
byte 4 504
byte 4 32
byte 4 560
code
proc UI_SPPostgameMenu_DrawAwardsMedals 36 20
line 169
;165:}
;166:
;167:static int  medalLocations[6] = {144, 448, 88, 504, 32, 560};
;168:
;169:static void UI_SPPostgameMenu_DrawAwardsMedals(int max) {
line 176
;170:	int  n;
;171:	int  medal;
;172:	int  amount;
;173:	int  x, y;
;174:	char buf[16];
;175:
;176:	for (n = 0; n < max; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $136
line 177
;177:		x      = medalLocations[n];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 medalLocations
ADDP4
INDIRI4
ASGNI4
line 178
;178:		y      = 64;
ADDRLP4 12
CNSTI4 64
ASGNI4
line 179
;179:		medal  = postgameMenuInfo.awardsEarned[n];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+888
ADDP4
INDIRI4
ASGNI4
line 180
;180:		amount = postgameMenuInfo.awardsLevels[n];
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+912
ADDP4
INDIRI4
ASGNI4
line 182
;181:
;182:		UI_DrawNamedPic(x, y, 48, 48, ui_medalPicNames[medal]);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 184
;183:
;184:		if (medal == AWARD_ACCURACY) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $142
line 185
;185:			Com_sprintf(buf, sizeof(buf), "%i%%", amount);
ADDRLP4 16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $144
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 186
;186:		} else {
ADDRGP4 $143
JUMPV
LABELV $142
line 187
;187:			if (amount == 1) {
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $145
line 188
;188:				continue;
ADDRGP4 $137
JUMPV
LABELV $145
line 190
;189:			}
;190:			Com_sprintf(buf, sizeof(buf), "%i", amount);
ADDRLP4 16
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $147
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 191
;191:		}
LABELV $143
line 193
;192:
;193:		UI_DrawString(x + 24, y + 52, buf, UI_CENTER, color_yellow);
ADDRLP4 8
INDIRI4
CNSTI4 24
ADDI4
ARGI4
ADDRLP4 12
INDIRI4
CNSTI4 52
ADDI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 194
;194:	}
LABELV $137
line 176
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $139
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
LTI4 $136
line 195
;195:}
LABELV $135
endproc UI_SPPostgameMenu_DrawAwardsMedals 36 20
proc UI_SPPostgameMenu_DrawAwardsPresentation 32 20
line 197
;196:
;197:static void UI_SPPostgameMenu_DrawAwardsPresentation(int timer) {
line 202
;198:	int    awardNum;
;199:	int    atimer;
;200:	vec4_t color;
;201:
;202:	awardNum = timer / AWARD_PRESENTATION_TIME;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 2000
DIVI4
ASGNI4
line 203
;203:	atimer   = timer % AWARD_PRESENTATION_TIME;
ADDRLP4 20
ADDRFP4 0
INDIRI4
CNSTI4 2000
MODI4
ASGNI4
line 205
;204:
;205:	color[0] = color[1] = color[2] = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
ADDRLP4 4+8
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 24
INDIRF4
ASGNF4
line 206
;206:	color[3]                       = (float)(AWARD_PRESENTATION_TIME - atimer) / (float)AWARD_PRESENTATION_TIME;
ADDRLP4 4+12
CNSTI4 2000
ADDRLP4 20
INDIRI4
SUBI4
CVIF4 4
CNSTF4 973279855
MULF4
ASGNF4
line 207
;207:	UI_DrawProportionalString(320, 64, ui_medalNames[postgameMenuInfo.awardsEarned[awardNum]], UI_CENTER, color);
CNSTI4 320
ARGI4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+888
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalNames
ADDP4
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 209
;208:
;209:	UI_SPPostgameMenu_DrawAwardsMedals(awardNum + 1);
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsMedals
CALLV
pop
line 211
;210:
;211:	if (!postgameMenuInfo.playedSound[awardNum]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+936
ADDP4
INDIRI4
CNSTI4 0
NEI4 $153
line 212
;212:		postgameMenuInfo.playedSound[awardNum] = qtrue;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+936
ADDP4
CNSTI4 1
ASGNI4
line 213
;213:		trap_S_StartLocalSound(trap_S_RegisterSound(ui_medalSounds[postgameMenuInfo.awardsEarned[awardNum]], qfalse), CHAN_ANNOUNCER);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+888
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 28
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 214
;214:	}
LABELV $153
line 215
;215:}
LABELV $148
endproc UI_SPPostgameMenu_DrawAwardsPresentation 32 20
proc UI_SPPostgameMenu_MenuDrawScoreLine 1100 20
line 222
;216:
;217:/*
;218:=================
;219:UI_SPPostgameMenu_MenuDrawScoreLine
;220:=================
;221:*/
;222:static void UI_SPPostgameMenu_MenuDrawScoreLine(int n, int y) {
line 227
;223:	int  rank;
;224:	char name[64];
;225:	char info[MAX_INFO_STRING];
;226:
;227:	if (n > (postgameMenuInfo.numClients + 1)) {
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+876
INDIRI4
CNSTI4 1
ADDI4
LEI4 $159
line 228
;228:		n -= (postgameMenuInfo.numClients + 2);
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+876
INDIRI4
CNSTI4 2
ADDI4
SUBI4
ASGNI4
line 229
;229:	}
LABELV $159
line 231
;230:
;231:	if (n >= postgameMenuInfo.numClients) {
ADDRFP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+876
INDIRI4
LTI4 $163
line 232
;232:		return;
ADDRGP4 $158
JUMPV
LABELV $163
line 235
;233:	}
;234:
;235:	rank = postgameMenuInfo.ranks[n];
ADDRLP4 64
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+616
ADDP4
INDIRI4
ASGNI4
line 236
;236:	if (rank & RANK_TIED_FLAG) {
ADDRLP4 64
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $167
line 237
;237:		UI_DrawString(640 - 31 * SMALLCHAR_WIDTH, y, "(tie)", UI_LEFT | UI_SMALLFONT, color_white);
CNSTI4 392
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $169
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 238
;238:		rank &= ~RANK_TIED_FLAG;
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 239
;239:	}
LABELV $167
line 240
;240:	trap_GetConfigString(CS_PLAYERS + postgameMenuInfo.clientNums[n], info, MAX_INFO_STRING);
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+584
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 241
;241:	Q_strncpyz(name, Info_ValueForKey(info, "n"), sizeof(name));
ADDRLP4 68
ARGP4
ADDRGP4 $171
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 242
;242:	Q_CleanStr(name);
ADDRLP4 0
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 244
;243:
;244:	UI_DrawString(640 - 25 * SMALLCHAR_WIDTH, y, va("#%i: %-16s %2i", rank + 1, name, postgameMenuInfo.scores[n]), UI_LEFT | UI_SMALLFONT, color_white);
ADDRGP4 $172
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+648
ADDP4
INDIRI4
ARGI4
ADDRLP4 1096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 440
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 1096
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 245
;245:}
LABELV $158
endproc UI_SPPostgameMenu_MenuDrawScoreLine 1100 20
proc UI_SPPostgameMenu_MenuDraw 1060 20
line 252
;246:
;247:/*
;248:=================
;249:UI_SPPostgameMenu_MenuDraw
;250:=================
;251:*/
;252:static void UI_SPPostgameMenu_MenuDraw(void) {
line 258
;253:	int  timer;
;254:	int  serverId;
;255:	int  n;
;256:	char info[MAX_INFO_STRING];
;257:
;258:	trap_GetConfigString(CS_SYSTEMINFO, info, sizeof(info));
CNSTI4 1
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 259
;259:	serverId = atoi(Info_ValueForKey(info, "sv_serverid"));
ADDRLP4 8
ARGP4
ADDRGP4 $175
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
ADDRLP4 1032
ADDRLP4 1040
INDIRI4
ASGNI4
line 260
;260:	if (serverId != postgameMenuInfo.serverId) {
ADDRLP4 1032
INDIRI4
ADDRGP4 postgameMenuInfo+580
INDIRI4
EQI4 $176
line 261
;261:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 262
;262:		return;
ADDRGP4 $174
JUMPV
LABELV $176
line 266
;263:	}
;264:
;265:	// phase 1
;266:	if (postgameMenuInfo.numClients > 2) {
ADDRGP4 postgameMenuInfo+876
INDIRI4
CNSTI4 2
LEI4 $179
line 267
;267:		UI_DrawProportionalString(510, 480 - 64 - PROP_HEIGHT, postgameMenuInfo.placeNames[2], UI_CENTER, color_white);
CNSTI4 510
ARGI4
CNSTI4 389
ARGI4
ADDRGP4 postgameMenuInfo+680+128
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 268
;268:	}
LABELV $179
line 269
;269:	UI_DrawProportionalString(130, 480 - 64 - PROP_HEIGHT, postgameMenuInfo.placeNames[1], UI_CENTER, color_white);
CNSTI4 130
ARGI4
CNSTI4 389
ARGI4
ADDRGP4 postgameMenuInfo+680+64
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 270
;270:	UI_DrawProportionalString(320, 480 - 64 - 2 * PROP_HEIGHT, postgameMenuInfo.placeNames[0], UI_CENTER, color_white);
CNSTI4 320
ARGI4
CNSTI4 362
ARGI4
ADDRGP4 postgameMenuInfo+680
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 272
;271:
;272:	if (postgameMenuInfo.phase == 1) {
ADDRGP4 postgameMenuInfo+564
INDIRI4
CNSTI4 1
NEI4 $187
line 273
;273:		timer = uis.realtime - postgameMenuInfo.starttime;
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+572
INDIRI4
SUBI4
ASGNI4
line 275
;274:
;275:		if (timer >= 1000 && postgameMenuInfo.winnerSound) {
ADDRLP4 0
INDIRI4
CNSTI4 1000
LTI4 $192
ADDRGP4 postgameMenuInfo+964
INDIRI4
CNSTI4 0
EQI4 $192
line 276
;276:			trap_S_StartLocalSound(postgameMenuInfo.winnerSound, CHAN_ANNOUNCER);
ADDRGP4 postgameMenuInfo+964
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 277
;277:			postgameMenuInfo.winnerSound = 0;
ADDRGP4 postgameMenuInfo+964
CNSTI4 0
ASGNI4
line 278
;278:		}
LABELV $192
line 280
;279:
;280:		if (timer < 5000) {
ADDRLP4 0
INDIRI4
CNSTI4 5000
GEI4 $197
line 281
;281:			return;
ADDRGP4 $174
JUMPV
LABELV $197
line 283
;282:		}
;283:		postgameMenuInfo.phase     = 2;
ADDRGP4 postgameMenuInfo+564
CNSTI4 2
ASGNI4
line 284
;284:		postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+572
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 285
;285:	}
LABELV $187
line 288
;286:
;287:	// phase 2
;288:	if (postgameMenuInfo.phase == 2) {
ADDRGP4 postgameMenuInfo+564
INDIRI4
CNSTI4 2
NEI4 $202
line 289
;289:		timer = uis.realtime - postgameMenuInfo.starttime;
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+572
INDIRI4
SUBI4
ASGNI4
line 290
;290:		if (timer >= (postgameMenuInfo.numAwards * AWARD_PRESENTATION_TIME)) {
ADDRLP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+884
INDIRI4
CNSTI4 2000
MULI4
LTI4 $207
line 292
;291:
;292:			if (timer < 5000) {
ADDRLP4 0
INDIRI4
CNSTI4 5000
GEI4 $210
line 293
;293:				return;
ADDRGP4 $174
JUMPV
LABELV $210
line 296
;294:			}
;295:
;296:			postgameMenuInfo.phase     = 3;
ADDRGP4 postgameMenuInfo+564
CNSTI4 3
ASGNI4
line 297
;297:			postgameMenuInfo.starttime = uis.realtime;
ADDRGP4 postgameMenuInfo+572
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 298
;298:		} else {
ADDRGP4 $208
JUMPV
LABELV $207
line 299
;299:			UI_SPPostgameMenu_DrawAwardsPresentation(timer);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsPresentation
CALLV
pop
line 300
;300:		}
LABELV $208
line 301
;301:	}
LABELV $202
line 304
;302:
;303:	// phase 3
;304:	if (postgameMenuInfo.phase == 3) {
ADDRGP4 postgameMenuInfo+564
INDIRI4
CNSTI4 3
NEI4 $215
line 305
;305:		if (uis.demoversion) {
ADDRGP4 uis+11468
INDIRI4
CNSTI4 0
EQI4 $218
line 306
;306:			if (postgameMenuInfo.won == 1 && UI_ShowTierVideo(8)) {
ADDRGP4 postgameMenuInfo+880
INDIRI4
CNSTI4 1
NEI4 $219
CNSTI4 8
ARGI4
ADDRLP4 1044
ADDRGP4 UI_ShowTierVideo
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $219
line 307
;307:				trap_Cvar_Set("nextmap", "");
ADDRGP4 $224
ARGP4
ADDRGP4 $225
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 308
;308:				trap_Cmd_ExecuteText(EXEC_APPEND, "disconnect; cinematic demoEnd.RoQ\n");
CNSTI4 2
ARGI4
ADDRGP4 $226
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 309
;309:				return;
ADDRGP4 $174
JUMPV
line 311
;310:			}
;311:		} else if (postgameMenuInfo.won > -1 && UI_ShowTierVideo(postgameMenuInfo.won + 1)) {
LABELV $218
ADDRGP4 postgameMenuInfo+880
INDIRI4
CNSTI4 -1
LEI4 $227
ADDRGP4 postgameMenuInfo+880
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1044
ADDRGP4 UI_ShowTierVideo
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $227
line 312
;312:			if (postgameMenuInfo.won == postgameMenuInfo.lastTier) {
ADDRGP4 postgameMenuInfo+880
INDIRI4
ADDRGP4 postgameMenuInfo+960
INDIRI4
NEI4 $231
line 313
;313:				trap_Cvar_Set("nextmap", "");
ADDRGP4 $224
ARGP4
ADDRGP4 $225
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 314
;314:				trap_Cmd_ExecuteText(EXEC_APPEND, "disconnect; cinematic end.RoQ\n");
CNSTI4 2
ARGI4
ADDRGP4 $235
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 315
;315:				return;
ADDRGP4 $174
JUMPV
LABELV $231
line 318
;316:			}
;317:
;318:			trap_Cvar_SetValue("ui_spSelection", postgameMenuInfo.won * ARENAS_PER_TIER);
ADDRGP4 $236
ARGP4
ADDRGP4 postgameMenuInfo+880
INDIRI4
CNSTI4 2
LSHI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 319
;319:			trap_Cvar_Set("nextmap", "levelselect");
ADDRGP4 $224
ARGP4
ADDRGP4 $238
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 320
;320:			trap_Cmd_ExecuteText(EXEC_APPEND, va("disconnect; cinematic tier%i.RoQ\n", postgameMenuInfo.won + 1));
ADDRGP4 $239
ARGP4
ADDRGP4 postgameMenuInfo+880
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1048
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 321
;321:			return;
ADDRGP4 $174
JUMPV
LABELV $227
LABELV $219
line 324
;322:		}
;323:
;324:		postgameMenuInfo.item_again.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 1048
ADDRGP4 postgameMenuInfo+288+44
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 325
;325:		postgameMenuInfo.item_next.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 1052
ADDRGP4 postgameMenuInfo+380+44
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 326
;326:		postgameMenuInfo.item_menu.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 1056
ADDRGP4 postgameMenuInfo+472+44
ASGNP4
ADDRLP4 1056
INDIRP4
ADDRLP4 1056
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 328
;327:
;328:		UI_SPPostgameMenu_DrawAwardsMedals(postgameMenuInfo.numAwards);
ADDRGP4 postgameMenuInfo+884
INDIRI4
ARGI4
ADDRGP4 UI_SPPostgameMenu_DrawAwardsMedals
CALLV
pop
line 330
;329:
;330:		Menu_Draw(&postgameMenuInfo.menu);
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 331
;331:	}
LABELV $215
line 334
;332:
;333:	// draw the scoreboard
;334:	if (!trap_Cvar_VariableValue("ui_spScoreboard")) {
ADDRGP4 $250
ARGP4
ADDRLP4 1044
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 1044
INDIRF4
CNSTF4 0
NEF4 $248
line 335
;335:		return;
ADDRGP4 $174
JUMPV
LABELV $248
line 338
;336:	}
;337:
;338:	timer = uis.realtime - postgameMenuInfo.scoreboardtime;
ADDRLP4 0
ADDRGP4 uis+4
INDIRI4
ADDRGP4 postgameMenuInfo+576
INDIRI4
SUBI4
ASGNI4
line 339
;339:	if (postgameMenuInfo.numClients <= 3) {
ADDRGP4 postgameMenuInfo+876
INDIRI4
CNSTI4 3
GTI4 $253
line 340
;340:		n = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 341
;341:	} else {
ADDRGP4 $254
JUMPV
LABELV $253
line 342
;342:		n = timer / 1500 % (postgameMenuInfo.numClients + 2);
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1500
DIVI4
ADDRGP4 postgameMenuInfo+876
INDIRI4
CNSTI4 2
ADDI4
MODI4
ASGNI4
line 343
;343:	}
LABELV $254
line 344
;344:	UI_SPPostgameMenu_MenuDrawScoreLine(n, 0);
ADDRLP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
line 345
;345:	UI_SPPostgameMenu_MenuDrawScoreLine(n + 1, 0 + SMALLCHAR_HEIGHT);
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
line 346
;346:	UI_SPPostgameMenu_MenuDrawScoreLine(n + 2, 0 + 2 * SMALLCHAR_HEIGHT);
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
CNSTI4 32
ARGI4
ADDRGP4 UI_SPPostgameMenu_MenuDrawScoreLine
CALLV
pop
line 347
;347:}
LABELV $174
endproc UI_SPPostgameMenu_MenuDraw 1060 20
export UI_SPPostgameMenu_Cache
proc UI_SPPostgameMenu_Cache 12 8
line 354
;348:
;349:/*
;350:=================
;351:UI_SPPostgameMenu_Cache
;352:=================
;353:*/
;354:void UI_SPPostgameMenu_Cache(void) {
line 358
;355:	int      n;
;356:	qboolean buildscript;
;357:
;358:	buildscript = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $258
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 360
;359:
;360:	trap_R_RegisterShaderNoMip(ART_MENU0);
ADDRGP4 $259
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 361
;361:	trap_R_RegisterShaderNoMip(ART_MENU1);
ADDRGP4 $260
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 362
;362:	trap_R_RegisterShaderNoMip(ART_REPLAY0);
ADDRGP4 $261
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 363
;363:	trap_R_RegisterShaderNoMip(ART_REPLAY1);
ADDRGP4 $262
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 364
;364:	trap_R_RegisterShaderNoMip(ART_NEXT0);
ADDRGP4 $263
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 365
;365:	trap_R_RegisterShaderNoMip(ART_NEXT1);
ADDRGP4 $264
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 366
;366:	for (n = 0; n < 6; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $265
line 367
;367:		trap_R_RegisterShaderNoMip(ui_medalPicNames[n]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 368
;368:		trap_S_RegisterSound(ui_medalSounds[n], qfalse);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 369
;369:	}
LABELV $266
line 366
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $265
line 371
;370:
;371:	if (buildscript) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $269
line 372
;372:		trap_S_RegisterSound("music/loss.wav", qfalse);
ADDRGP4 $271
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 373
;373:		trap_S_RegisterSound("music/win.wav", qfalse);
ADDRGP4 $272
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 374
;374:		trap_S_RegisterSound("sound/player/announce/youwin.wav", qfalse);
ADDRGP4 $273
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 375
;375:	}
LABELV $269
line 376
;376:}
LABELV $257
endproc UI_SPPostgameMenu_Cache 12 8
proc UI_SPPostgameMenu_Init 0 8
line 383
;377:
;378:/*
;379:=================
;380:UI_SPPostgameMenu_Init
;381:=================
;382:*/
;383:static void UI_SPPostgameMenu_Init(void) {
line 384
;384:	postgameMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 postgameMenuInfo+276
CNSTI4 1
ASGNI4
line 385
;385:	postgameMenuInfo.menu.key        = UI_SPPostgameMenu_MenuKey;
ADDRGP4 postgameMenuInfo+272
ADDRGP4 UI_SPPostgameMenu_MenuKey
ASGNP4
line 386
;386:	postgameMenuInfo.menu.draw       = UI_SPPostgameMenu_MenuDraw;
ADDRGP4 postgameMenuInfo+268
ADDRGP4 UI_SPPostgameMenu_MenuDraw
ASGNP4
line 387
;387:	postgameMenuInfo.ignoreKeysTime  = uis.realtime + 1500;
ADDRGP4 postgameMenuInfo+568
ADDRGP4 uis+4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 389
;388:
;389:	UI_SPPostgameMenu_Cache();
ADDRGP4 UI_SPPostgameMenu_Cache
CALLV
pop
line 391
;390:
;391:	postgameMenuInfo.item_menu.generic.type     = MTYPE_BITMAP;
ADDRGP4 postgameMenuInfo+472
CNSTI4 6
ASGNI4
line 392
;392:	postgameMenuInfo.item_menu.generic.name     = ART_MENU0;
ADDRGP4 postgameMenuInfo+472+4
ADDRGP4 $259
ASGNP4
line 393
;393:	postgameMenuInfo.item_menu.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS | QMF_INACTIVE;
ADDRGP4 postgameMenuInfo+472+44
CNSTU4 16644
ASGNU4
line 394
;394:	postgameMenuInfo.item_menu.generic.x        = 0;
ADDRGP4 postgameMenuInfo+472+12
CNSTI4 0
ASGNI4
line 395
;395:	postgameMenuInfo.item_menu.generic.y        = 480 - 64;
ADDRGP4 postgameMenuInfo+472+16
CNSTI4 416
ASGNI4
line 396
;396:	postgameMenuInfo.item_menu.generic.callback = UI_SPPostgameMenu_MenuEvent;
ADDRGP4 postgameMenuInfo+472+48
ADDRGP4 UI_SPPostgameMenu_MenuEvent
ASGNP4
line 397
;397:	postgameMenuInfo.item_menu.generic.id       = ID_MENU;
ADDRGP4 postgameMenuInfo+472+8
CNSTI4 12
ASGNI4
line 398
;398:	postgameMenuInfo.item_menu.width            = 128;
ADDRGP4 postgameMenuInfo+472+80
CNSTI4 128
ASGNI4
line 399
;399:	postgameMenuInfo.item_menu.height           = 64;
ADDRGP4 postgameMenuInfo+472+84
CNSTI4 64
ASGNI4
line 400
;400:	postgameMenuInfo.item_menu.focuspic         = ART_MENU1;
ADDRGP4 postgameMenuInfo+472+64
ADDRGP4 $260
ASGNP4
line 402
;401:
;402:	postgameMenuInfo.item_again.generic.type     = MTYPE_BITMAP;
ADDRGP4 postgameMenuInfo+288
CNSTI4 6
ASGNI4
line 403
;403:	postgameMenuInfo.item_again.generic.name     = ART_REPLAY0;
ADDRGP4 postgameMenuInfo+288+4
ADDRGP4 $261
ASGNP4
line 404
;404:	postgameMenuInfo.item_again.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS | QMF_INACTIVE;
ADDRGP4 postgameMenuInfo+288+44
CNSTU4 16648
ASGNU4
line 405
;405:	postgameMenuInfo.item_again.generic.x        = 320;
ADDRGP4 postgameMenuInfo+288+12
CNSTI4 320
ASGNI4
line 406
;406:	postgameMenuInfo.item_again.generic.y        = 480 - 64;
ADDRGP4 postgameMenuInfo+288+16
CNSTI4 416
ASGNI4
line 407
;407:	postgameMenuInfo.item_again.generic.callback = UI_SPPostgameMenu_AgainEvent;
ADDRGP4 postgameMenuInfo+288+48
ADDRGP4 UI_SPPostgameMenu_AgainEvent
ASGNP4
line 408
;408:	postgameMenuInfo.item_again.generic.id       = ID_AGAIN;
ADDRGP4 postgameMenuInfo+288+8
CNSTI4 10
ASGNI4
line 409
;409:	postgameMenuInfo.item_again.width            = 128;
ADDRGP4 postgameMenuInfo+288+80
CNSTI4 128
ASGNI4
line 410
;410:	postgameMenuInfo.item_again.height           = 64;
ADDRGP4 postgameMenuInfo+288+84
CNSTI4 64
ASGNI4
line 411
;411:	postgameMenuInfo.item_again.focuspic         = ART_REPLAY1;
ADDRGP4 postgameMenuInfo+288+64
ADDRGP4 $262
ASGNP4
line 413
;412:
;413:	postgameMenuInfo.item_next.generic.type     = MTYPE_BITMAP;
ADDRGP4 postgameMenuInfo+380
CNSTI4 6
ASGNI4
line 414
;414:	postgameMenuInfo.item_next.generic.name     = ART_NEXT0;
ADDRGP4 postgameMenuInfo+380+4
ADDRGP4 $263
ASGNP4
line 415
;415:	postgameMenuInfo.item_next.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS | QMF_INACTIVE;
ADDRGP4 postgameMenuInfo+380+44
CNSTU4 16656
ASGNU4
line 416
;416:	postgameMenuInfo.item_next.generic.x        = 640;
ADDRGP4 postgameMenuInfo+380+12
CNSTI4 640
ASGNI4
line 417
;417:	postgameMenuInfo.item_next.generic.y        = 480 - 64;
ADDRGP4 postgameMenuInfo+380+16
CNSTI4 416
ASGNI4
line 418
;418:	postgameMenuInfo.item_next.generic.callback = UI_SPPostgameMenu_NextEvent;
ADDRGP4 postgameMenuInfo+380+48
ADDRGP4 UI_SPPostgameMenu_NextEvent
ASGNP4
line 419
;419:	postgameMenuInfo.item_next.generic.id       = ID_NEXT;
ADDRGP4 postgameMenuInfo+380+8
CNSTI4 11
ASGNI4
line 420
;420:	postgameMenuInfo.item_next.width            = 128;
ADDRGP4 postgameMenuInfo+380+80
CNSTI4 128
ASGNI4
line 421
;421:	postgameMenuInfo.item_next.height           = 64;
ADDRGP4 postgameMenuInfo+380+84
CNSTI4 64
ASGNI4
line 422
;422:	postgameMenuInfo.item_next.focuspic         = ART_NEXT1;
ADDRGP4 postgameMenuInfo+380+64
ADDRGP4 $264
ASGNP4
line 424
;423:
;424:	Menu_AddItem(&postgameMenuInfo.menu, (void*)&postgameMenuInfo.item_menu);
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+472
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 425
;425:	Menu_AddItem(&postgameMenuInfo.menu, (void*)&postgameMenuInfo.item_again);
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 426
;426:	Menu_AddItem(&postgameMenuInfo.menu, (void*)&postgameMenuInfo.item_next);
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+380
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 427
;427:}
LABELV $274
endproc UI_SPPostgameMenu_Init 0 8
proc Prepname 1104 12
line 429
;428:
;429:static void Prepname(int index) {
line 434
;430:	int  len;
;431:	char name[64];
;432:	char info[MAX_INFO_STRING];
;433:
;434:	trap_GetConfigString(CS_PLAYERS + postgameMenuInfo.clientNums[index], info, MAX_INFO_STRING);
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+584
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 68
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 435
;435:	Q_strncpyz(name, Info_ValueForKey(info, "n"), sizeof(name));
ADDRLP4 68
ARGP4
ADDRGP4 $171
ARGP4
ADDRLP4 1092
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 1092
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 436
;436:	Q_CleanStr(name);
ADDRLP4 4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 437
;437:	len = strlen(name);
ADDRLP4 4
ARGP4
ADDRLP4 1096
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1096
INDIRI4
ASGNI4
ADDRGP4 $343
JUMPV
LABELV $342
line 439
;438:
;439:	while (len && UI_ProportionalStringWidth(name) > 256) {
line 440
;440:		len--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 441
;441:		name[len] = '\0';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 442
;442:	}
LABELV $343
line 439
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $345
ADDRLP4 4
ARGP4
ADDRLP4 1100
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 256
GTI4 $342
LABELV $345
line 444
;443:
;444:	Q_strncpyz(postgameMenuInfo.placeNames[index], name, sizeof(postgameMenuInfo.placeNames[index]));
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 postgameMenuInfo+680
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 445
;445:}
LABELV $340
endproc Prepname 1104 12
export UI_SPPostgameMenu_f
proc UI_SPPostgameMenu_f 1244 12
line 452
;446:
;447:/*
;448:=================
;449:UI_SPPostgameMenu_f
;450:=================
;451:*/
;452:void UI_SPPostgameMenu_f(void) {
line 462
;453:	int         playerGameRank;
;454:	int         playerClientNum;
;455:	int         n;
;456:	int         oldFrags, newFrags;
;457:	const char* arena;
;458:	int         awardValues[6];
;459:	char        map[MAX_QPATH];
;460:	char        info[MAX_INFO_STRING];
;461:
;462:	memset(&postgameMenuInfo, 0, sizeof(postgameMenuInfo));
ADDRGP4 postgameMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 968
ARGI4
ADDRGP4 memset
CALLP4
pop
line 464
;463:
;464:	trap_GetConfigString(CS_SYSTEMINFO, info, sizeof(info));
CNSTI4 1
ARGI4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 465
;465:	postgameMenuInfo.serverId = atoi(Info_ValueForKey(info, "sv_serverid"));
ADDRLP4 36
ARGP4
ADDRGP4 $175
ARGP4
ADDRLP4 1136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1136
INDIRP4
ARGP4
ADDRLP4 1140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+580
ADDRLP4 1140
INDIRI4
ASGNI4
line 467
;466:
;467:	trap_GetConfigString(CS_SERVERINFO, info, sizeof(info));
CNSTI4 0
ARGI4
ADDRLP4 36
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 468
;468:	Q_strncpyz(map, Info_ValueForKey(info, "mapname"), sizeof(map));
ADDRLP4 36
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 1144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1064
ARGP4
ADDRLP4 1144
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 469
;469:	arena = UI_GetArenaInfoByMap(map);
ADDRLP4 1064
ARGP4
ADDRLP4 1148
ADDRGP4 UI_GetArenaInfoByMap
CALLP4
ASGNP4
ADDRLP4 1060
ADDRLP4 1148
INDIRP4
ASGNP4
line 470
;470:	if (!arena) {
ADDRLP4 1060
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $351
line 471
;471:		return;
ADDRGP4 $348
JUMPV
LABELV $351
line 473
;472:	}
;473:	Q_strncpyz(arenainfo, arena, sizeof(arenainfo));
ADDRGP4 arenainfo
ARGP4
ADDRLP4 1060
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 475
;474:
;475:	postgameMenuInfo.level = atoi(Info_ValueForKey(arenainfo, "num"));
ADDRGP4 arenainfo
ARGP4
ADDRGP4 $354
ARGP4
ADDRLP4 1152
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1152
INDIRP4
ARGP4
ADDRLP4 1156
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+872
ADDRLP4 1156
INDIRI4
ASGNI4
line 477
;476:
;477:	postgameMenuInfo.numClients = atoi(UI_Argv(1));
CNSTI4 1
ARGI4
ADDRLP4 1160
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1160
INDIRP4
ARGP4
ADDRLP4 1164
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+876
ADDRLP4 1164
INDIRI4
ASGNI4
line 478
;478:	playerClientNum             = atoi(UI_Argv(2));
CNSTI4 2
ARGI4
ADDRLP4 1168
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1168
INDIRP4
ARGP4
ADDRLP4 1172
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 28
ADDRLP4 1172
INDIRI4
ASGNI4
line 479
;479:	playerGameRank              = 8;  // in case they ended game as a spectator
ADDRLP4 32
CNSTI4 8
ASGNI4
line 481
;480:
;481:	if (postgameMenuInfo.numClients > MAX_SCOREBOARD_CLIENTS) {
ADDRGP4 postgameMenuInfo+876
INDIRI4
CNSTI4 8
LEI4 $356
line 482
;482:		postgameMenuInfo.numClients = MAX_SCOREBOARD_CLIENTS;
ADDRGP4 postgameMenuInfo+876
CNSTI4 8
ASGNI4
line 483
;483:	}
LABELV $356
line 485
;484:
;485:	for (n = 0; n < postgameMenuInfo.numClients; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $363
JUMPV
LABELV $360
line 486
;486:		postgameMenuInfo.clientNums[n] = atoi(UI_Argv(8 + n * 3 + 1));
ADDRLP4 0
INDIRI4
CNSTI4 3
MULI4
CNSTI4 8
ADDI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1180
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1180
INDIRP4
ARGP4
ADDRLP4 1184
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+584
ADDP4
ADDRLP4 1184
INDIRI4
ASGNI4
line 487
;487:		postgameMenuInfo.ranks[n]      = atoi(UI_Argv(8 + n * 3 + 2));
ADDRLP4 0
INDIRI4
CNSTI4 3
MULI4
CNSTI4 8
ADDI4
CNSTI4 2
ADDI4
ARGI4
ADDRLP4 1192
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1196
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+616
ADDP4
ADDRLP4 1196
INDIRI4
ASGNI4
line 488
;488:		postgameMenuInfo.scores[n]     = atoi(UI_Argv(8 + n * 3 + 3));
ADDRLP4 0
INDIRI4
CNSTI4 3
MULI4
CNSTI4 8
ADDI4
CNSTI4 3
ADDI4
ARGI4
ADDRLP4 1204
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1204
INDIRP4
ARGP4
ADDRLP4 1208
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+648
ADDP4
ADDRLP4 1208
INDIRI4
ASGNI4
line 490
;489:
;490:		if (postgameMenuInfo.clientNums[n] == playerClientNum) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+584
ADDP4
INDIRI4
ADDRLP4 28
INDIRI4
NEI4 $368
line 491
;491:			playerGameRank = (postgameMenuInfo.ranks[n] & ~RANK_TIED_FLAG) + 1;
ADDRLP4 32
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+616
ADDP4
INDIRI4
CNSTI4 -16385
BANDI4
CNSTI4 1
ADDI4
ASGNI4
line 492
;492:		}
LABELV $368
line 493
;493:	}
LABELV $361
line 485
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $363
ADDRLP4 0
INDIRI4
ADDRGP4 postgameMenuInfo+876
INDIRI4
LTI4 $360
line 495
;494:
;495:	UI_SetBestScore(postgameMenuInfo.level, playerGameRank);
ADDRGP4 postgameMenuInfo+872
INDIRI4
ARGI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRGP4 UI_SetBestScore
CALLV
pop
line 498
;496:
;497:	// process award stats and prepare presentation data
;498:	awardValues[AWARD_ACCURACY]   = atoi(UI_Argv(3));
CNSTI4 3
ARGI4
ADDRLP4 1176
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1176
INDIRP4
ARGP4
ADDRLP4 1180
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1180
INDIRI4
ASGNI4
line 499
;499:	awardValues[AWARD_IMPRESSIVE] = atoi(UI_Argv(4));
CNSTI4 4
ARGI4
ADDRLP4 1184
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1184
INDIRP4
ARGP4
ADDRLP4 1188
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+4
ADDRLP4 1188
INDIRI4
ASGNI4
line 500
;500:	awardValues[AWARD_EXCELLENT]  = atoi(UI_Argv(5));
CNSTI4 5
ARGI4
ADDRLP4 1192
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1192
INDIRP4
ARGP4
ADDRLP4 1196
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+8
ADDRLP4 1196
INDIRI4
ASGNI4
line 501
;501:	awardValues[AWARD_GAUNTLET]   = atoi(UI_Argv(6));
CNSTI4 6
ARGI4
ADDRLP4 1200
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1200
INDIRP4
ARGP4
ADDRLP4 1204
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+12
ADDRLP4 1204
INDIRI4
ASGNI4
line 502
;502:	awardValues[AWARD_FRAGS]      = atoi(UI_Argv(7));
CNSTI4 7
ARGI4
ADDRLP4 1208
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1208
INDIRP4
ARGP4
ADDRLP4 1212
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+16
ADDRLP4 1212
INDIRI4
ASGNI4
line 503
;503:	awardValues[AWARD_PERFECT]    = atoi(UI_Argv(8));
CNSTI4 8
ARGI4
ADDRLP4 1216
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 1216
INDIRP4
ARGP4
ADDRLP4 1220
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4+20
ADDRLP4 1220
INDIRI4
ASGNI4
line 505
;504:
;505:	postgameMenuInfo.numAwards = 0;
ADDRGP4 postgameMenuInfo+884
CNSTI4 0
ASGNI4
line 507
;506:
;507:	if (awardValues[AWARD_ACCURACY] >= 50) {
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $379
line 508
;508:		UI_LogAwardData(AWARD_ACCURACY, 1);
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 509
;509:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_ACCURACY;
ADDRGP4 postgameMenuInfo+884
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+888
ADDP4
CNSTI4 0
ASGNI4
line 510
;510:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_ACCURACY];
ADDRGP4 postgameMenuInfo+884
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+912
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 511
;511:		postgameMenuInfo.numAwards++;
ADDRLP4 1224
ADDRGP4 postgameMenuInfo+884
ASGNP4
ADDRLP4 1224
INDIRP4
ADDRLP4 1224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 512
;512:	}
LABELV $379
line 514
;513:
;514:	if (awardValues[AWARD_IMPRESSIVE]) {
ADDRLP4 4+4
INDIRI4
CNSTI4 0
EQI4 $386
line 515
;515:		UI_LogAwardData(AWARD_IMPRESSIVE, awardValues[AWARD_IMPRESSIVE]);
CNSTI4 1
ARGI4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 516
;516:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_IMPRESSIVE;
ADDRGP4 postgameMenuInfo+884
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+888
ADDP4
CNSTI4 1
ASGNI4
line 517
;517:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_IMPRESSIVE];
ADDRGP4 postgameMenuInfo+884
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+912
ADDP4
ADDRLP4 4+4
INDIRI4
ASGNI4
line 518
;518:		postgameMenuInfo.numAwards++;
ADDRLP4 1224
ADDRGP4 postgameMenuInfo+884
ASGNP4
ADDRLP4 1224
INDIRP4
ADDRLP4 1224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 519
;519:	}
LABELV $386
line 521
;520:
;521:	if (awardValues[AWARD_EXCELLENT]) {
ADDRLP4 4+8
INDIRI4
CNSTI4 0
EQI4 $396
line 522
;522:		UI_LogAwardData(AWARD_EXCELLENT, awardValues[AWARD_EXCELLENT]);
CNSTI4 2
ARGI4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 523
;523:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_EXCELLENT;
ADDRGP4 postgameMenuInfo+884
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+888
ADDP4
CNSTI4 2
ASGNI4
line 524
;524:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_EXCELLENT];
ADDRGP4 postgameMenuInfo+884
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+912
ADDP4
ADDRLP4 4+8
INDIRI4
ASGNI4
line 525
;525:		postgameMenuInfo.numAwards++;
ADDRLP4 1224
ADDRGP4 postgameMenuInfo+884
ASGNP4
ADDRLP4 1224
INDIRP4
ADDRLP4 1224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 526
;526:	}
LABELV $396
line 528
;527:
;528:	if (awardValues[AWARD_GAUNTLET]) {
ADDRLP4 4+12
INDIRI4
CNSTI4 0
EQI4 $406
line 529
;529:		UI_LogAwardData(AWARD_GAUNTLET, awardValues[AWARD_GAUNTLET]);
CNSTI4 3
ARGI4
ADDRLP4 4+12
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 530
;530:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_GAUNTLET;
ADDRGP4 postgameMenuInfo+884
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+888
ADDP4
CNSTI4 3
ASGNI4
line 531
;531:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = awardValues[AWARD_GAUNTLET];
ADDRGP4 postgameMenuInfo+884
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+912
ADDP4
ADDRLP4 4+12
INDIRI4
ASGNI4
line 532
;532:		postgameMenuInfo.numAwards++;
ADDRLP4 1224
ADDRGP4 postgameMenuInfo+884
ASGNP4
ADDRLP4 1224
INDIRP4
ADDRLP4 1224
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 533
;533:	}
LABELV $406
line 535
;534:
;535:	oldFrags = UI_GetAwardLevel(AWARD_FRAGS) / 100;
CNSTI4 4
ARGI4
ADDRLP4 1224
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 1132
ADDRLP4 1224
INDIRI4
CNSTI4 100
DIVI4
ASGNI4
line 536
;536:	UI_LogAwardData(AWARD_FRAGS, awardValues[AWARD_FRAGS]);
CNSTI4 4
ARGI4
ADDRLP4 4+16
INDIRI4
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 537
;537:	newFrags = UI_GetAwardLevel(AWARD_FRAGS) / 100;
CNSTI4 4
ARGI4
ADDRLP4 1228
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 1128
ADDRLP4 1228
INDIRI4
CNSTI4 100
DIVI4
ASGNI4
line 538
;538:	if (newFrags > oldFrags) {
ADDRLP4 1128
INDIRI4
ADDRLP4 1132
INDIRI4
LEI4 $417
line 539
;539:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_FRAGS;
ADDRGP4 postgameMenuInfo+884
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+888
ADDP4
CNSTI4 4
ASGNI4
line 540
;540:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = newFrags * 100;
ADDRGP4 postgameMenuInfo+884
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+912
ADDP4
ADDRLP4 1128
INDIRI4
CNSTI4 100
MULI4
ASGNI4
line 541
;541:		postgameMenuInfo.numAwards++;
ADDRLP4 1232
ADDRGP4 postgameMenuInfo+884
ASGNP4
ADDRLP4 1232
INDIRP4
ADDRLP4 1232
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 542
;542:	}
LABELV $417
line 544
;543:
;544:	if (awardValues[AWARD_PERFECT]) {
ADDRLP4 4+20
INDIRI4
CNSTI4 0
EQI4 $424
line 545
;545:		UI_LogAwardData(AWARD_PERFECT, 1);
CNSTI4 5
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 UI_LogAwardData
CALLV
pop
line 546
;546:		postgameMenuInfo.awardsEarned[postgameMenuInfo.numAwards] = AWARD_PERFECT;
ADDRGP4 postgameMenuInfo+884
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+888
ADDP4
CNSTI4 5
ASGNI4
line 547
;547:		postgameMenuInfo.awardsLevels[postgameMenuInfo.numAwards] = 1;
ADDRGP4 postgameMenuInfo+884
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 postgameMenuInfo+912
ADDP4
CNSTI4 1
ASGNI4
line 548
;548:		postgameMenuInfo.numAwards++;
ADDRLP4 1232
ADDRGP4 postgameMenuInfo+884
ASGNP4
ADDRLP4 1232
INDIRP4
ADDRLP4 1232
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 549
;549:	}
LABELV $424
line 551
;550:
;551:	if (playerGameRank == 1) {
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $432
line 552
;552:		postgameMenuInfo.won = UI_TierCompleted(postgameMenuInfo.level);
ADDRGP4 postgameMenuInfo+872
INDIRI4
ARGI4
ADDRLP4 1232
ADDRGP4 UI_TierCompleted
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+880
ADDRLP4 1232
INDIRI4
ASGNI4
line 553
;553:	} else {
ADDRGP4 $433
JUMPV
LABELV $432
line 554
;554:		postgameMenuInfo.won = -1;
ADDRGP4 postgameMenuInfo+880
CNSTI4 -1
ASGNI4
line 555
;555:	}
LABELV $433
line 557
;556:
;557:	postgameMenuInfo.starttime      = uis.realtime;
ADDRGP4 postgameMenuInfo+572
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 558
;558:	postgameMenuInfo.scoreboardtime = uis.realtime;
ADDRGP4 postgameMenuInfo+576
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 560
;559:
;560:	trap_Key_SetCatcher(KEYCATCH_UI);
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 561
;561:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 563
;562:
;563:	UI_SPPostgameMenu_Init();
ADDRGP4 UI_SPPostgameMenu_Init
CALLV
pop
line 564
;564:	UI_PushMenu(&postgameMenuInfo.menu);
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 566
;565:
;566:	if (playerGameRank == 1) {
ADDRLP4 32
INDIRI4
CNSTI4 1
NEI4 $442
line 567
;567:		Menu_SetCursorToItem(&postgameMenuInfo.menu, &postgameMenuInfo.item_next);
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+380
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 568
;568:	} else {
ADDRGP4 $443
JUMPV
LABELV $442
line 569
;569:		Menu_SetCursorToItem(&postgameMenuInfo.menu, &postgameMenuInfo.item_again);
ADDRGP4 postgameMenuInfo
ARGP4
ADDRGP4 postgameMenuInfo+288
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 570
;570:	}
LABELV $443
line 572
;571:
;572:	Prepname(0);
CNSTI4 0
ARGI4
ADDRGP4 Prepname
CALLV
pop
line 573
;573:	Prepname(1);
CNSTI4 1
ARGI4
ADDRGP4 Prepname
CALLV
pop
line 574
;574:	Prepname(2);
CNSTI4 2
ARGI4
ADDRGP4 Prepname
CALLV
pop
line 576
;575:
;576:	if (playerGameRank != 1) {
ADDRLP4 32
INDIRI4
CNSTI4 1
EQI4 $446
line 577
;577:		postgameMenuInfo.winnerSound = trap_S_RegisterSound(va("sound/player/announce/%s_wins.wav", postgameMenuInfo.placeNames[0]), qfalse);
ADDRGP4 $449
ARGP4
ADDRGP4 postgameMenuInfo+680
ARGP4
ADDRLP4 1232
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1232
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1236
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+964
ADDRLP4 1236
INDIRI4
ASGNI4
line 578
;578:		trap_Cmd_ExecuteText(EXEC_APPEND, "music music/loss\n");
CNSTI4 2
ARGI4
ADDRGP4 $451
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 579
;579:	} else {
ADDRGP4 $447
JUMPV
LABELV $446
line 580
;580:		postgameMenuInfo.winnerSound = trap_S_RegisterSound("sound/player/announce/youwin.wav", qfalse);
ADDRGP4 $273
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 1232
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+964
ADDRLP4 1232
INDIRI4
ASGNI4
line 581
;581:		trap_Cmd_ExecuteText(EXEC_APPEND, "music music/win\n");
CNSTI4 2
ARGI4
ADDRGP4 $453
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 582
;582:	}
LABELV $447
line 584
;583:
;584:	postgameMenuInfo.phase = 1;
ADDRGP4 postgameMenuInfo+564
CNSTI4 1
ASGNI4
line 586
;585:
;586:	postgameMenuInfo.lastTier = UI_GetNumSPTiers();
ADDRLP4 1232
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRGP4 postgameMenuInfo+960
ADDRLP4 1232
INDIRI4
ASGNI4
line 587
;587:	if (UI_GetSpecialArenaInfo("final")) {
ADDRGP4 $458
ARGP4
ADDRLP4 1236
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 1236
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $456
line 588
;588:		postgameMenuInfo.lastTier++;
ADDRLP4 1240
ADDRGP4 postgameMenuInfo+960
ASGNP4
ADDRLP4 1240
INDIRP4
ADDRLP4 1240
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 589
;589:	}
LABELV $456
line 590
;590:}
LABELV $348
endproc UI_SPPostgameMenu_f 1244 12
bss
align 1
LABELV arenainfo
skip 1024
align 4
LABELV postgameMenuInfo
skip 968
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
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
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
LABELV $458
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $453
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $451
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $449
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
byte 1 95
byte 1 119
byte 1 105
byte 1 110
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $354
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $350
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $273
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
byte 1 121
byte 1 111
byte 1 117
byte 1 119
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $272
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $271
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $264
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $263
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $262
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $261
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $260
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $259
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $258
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $250
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $239
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 59
byte 1 32
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 116
byte 1 105
byte 1 101
byte 1 114
byte 1 37
byte 1 105
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $238
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $236
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $235
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 59
byte 1 32
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 101
byte 1 110
byte 1 100
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $226
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 59
byte 1 32
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 69
byte 1 110
byte 1 100
byte 1 46
byte 1 82
byte 1 111
byte 1 81
byte 1 10
byte 1 0
align 1
LABELV $225
byte 1 0
align 1
LABELV $224
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $175
byte 1 115
byte 1 118
byte 1 95
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 105
byte 1 100
byte 1 0
align 1
LABELV $172
byte 1 35
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 45
byte 1 49
byte 1 54
byte 1 115
byte 1 32
byte 1 37
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $171
byte 1 110
byte 1 0
align 1
LABELV $169
byte 1 40
byte 1 116
byte 1 105
byte 1 101
byte 1 41
byte 1 0
align 1
LABELV $147
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $144
byte 1 37
byte 1 105
byte 1 37
byte 1 37
byte 1 0
align 1
LABELV $118
byte 1 97
byte 1 98
byte 1 111
byte 1 114
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 10
byte 1 0
align 1
LABELV $109
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 59
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $90
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
LABELV $86
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 112
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $85
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $84
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $83
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 95
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $82
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $81
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $80
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $79
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $78
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $77
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $76
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $75
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
align 1
LABELV $74
byte 1 80
byte 1 101
byte 1 114
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $73
byte 1 70
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $72
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $71
byte 1 69
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $70
byte 1 73
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $69
byte 1 65
byte 1 99
byte 1 99
byte 1 117
byte 1 114
byte 1 97
byte 1 99
byte 1 121
byte 1 0
