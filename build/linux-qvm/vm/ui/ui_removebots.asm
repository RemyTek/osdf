code
proc UI_RemoveBotsMenu_SetBotNames 1032 12
file "../../../../code/q3_ui/ui_removebots.c"
line 63
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:REMOVE BOTS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:#define ART_BACKGROUND "menu/art/addbotframe"
;14:#define ART_BACK0      "menu/art/back_0"
;15:#define ART_BACK1      "menu/art/back_1"
;16:#define ART_DELETE0    "menu/art/delete_0"
;17:#define ART_DELETE1    "menu/art/delete_1"
;18:#define ART_ARROWS     "menu/art/arrows_vert_0"
;19:#define ART_ARROWUP    "menu/art/arrows_vert_top"
;20:#define ART_ARROWDOWN  "menu/art/arrows_vert_bot"
;21:
;22:#define ID_UP       10
;23:#define ID_DOWN     11
;24:#define ID_DELETE   12
;25:#define ID_BACK     13
;26:#define ID_BOTNAME0 20
;27:#define ID_BOTNAME1 21
;28:#define ID_BOTNAME2 22
;29:#define ID_BOTNAME3 23
;30:#define ID_BOTNAME4 24
;31:#define ID_BOTNAME5 25
;32:#define ID_BOTNAME6 26
;33:
;34:typedef struct {
;35:	menuframework_s menu;
;36:
;37:	menutext_s      banner;
;38:	menubitmap_s    background;
;39:
;40:	menubitmap_s    arrows;
;41:	menubitmap_s    up;
;42:	menubitmap_s    down;
;43:
;44:	menutext_s      bots[7];
;45:
;46:	menubitmap_s delete;
;47:	menubitmap_s back;
;48:
;49:	int          numBots;
;50:	int          baseBotNum;
;51:	int          selectedBotNum;
;52:	char         botnames[7][32];
;53:	int          botClientNums[MAX_BOTS];
;54:} removeBotsMenuInfo_t;
;55:
;56:static removeBotsMenuInfo_t removeBotsMenuInfo;
;57:
;58:/*
;59:=================
;60:UI_RemoveBotsMenu_SetBotNames
;61:=================
;62:*/
;63:static void UI_RemoveBotsMenu_SetBotNames(void) {
line 67
;64:	int  n;
;65:	char info[MAX_INFO_STRING];
;66:
;67:	for (n = 0; (n < 7) && (removeBotsMenuInfo.baseBotNum + n < removeBotsMenuInfo.numBots); n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $73
JUMPV
LABELV $70
line 68
;68:		trap_GetConfigString(CS_PLAYERS + removeBotsMenuInfo.botClientNums[removeBotsMenuInfo.baseBotNum + n], info, MAX_INFO_STRING);
ADDRGP4 removeBotsMenuInfo+1452
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 removeBotsMenuInfo+1684
ADDP4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 69
;69:		Q_strncpyz(removeBotsMenuInfo.botnames[n], Info_ValueForKey(info, "n"), sizeof(removeBotsMenuInfo.botnames[n]));
ADDRLP4 4
ARGP4
ADDRGP4 $79
ARGP4
ADDRLP4 1028
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 removeBotsMenuInfo+1460
ADDP4
ARGP4
ADDRLP4 1028
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 70
;70:		Q_CleanStr(removeBotsMenuInfo.botnames[n]);
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 removeBotsMenuInfo+1460
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 71
;71:	}
LABELV $71
line 67
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $73
ADDRLP4 0
INDIRI4
CNSTI4 7
GEI4 $82
ADDRGP4 removeBotsMenuInfo+1452
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRGP4 removeBotsMenuInfo+1448
INDIRI4
LTI4 $70
LABELV $82
line 72
;72:}
LABELV $69
endproc UI_RemoveBotsMenu_SetBotNames 1032 12
proc UI_RemoveBotsMenu_DeleteEvent 4 8
line 79
;73:
;74:/*
;75:=================
;76:UI_RemoveBotsMenu_DeleteEvent
;77:=================
;78:*/
;79:static void UI_RemoveBotsMenu_DeleteEvent(void* ptr, int event) {
line 80
;80:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $84
line 81
;81:		return;
ADDRGP4 $83
JUMPV
LABELV $84
line 84
;82:	}
;83:
;84:	trap_Cmd_ExecuteText(
ADDRGP4 $86
ARGP4
ADDRGP4 removeBotsMenuInfo+1452
INDIRI4
ADDRGP4 removeBotsMenuInfo+1456
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 removeBotsMenuInfo+1684
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 86
;85:		EXEC_APPEND, va("clientkick %i\n", removeBotsMenuInfo.botClientNums[removeBotsMenuInfo.baseBotNum + removeBotsMenuInfo.selectedBotNum]));
;86:}
LABELV $83
endproc UI_RemoveBotsMenu_DeleteEvent 4 8
proc UI_RemoveBotsMenu_BotEvent 0 0
line 93
;87:
;88:/*
;89:=================
;90:UI_RemoveBotsMenu_BotEvent
;91:=================
;92:*/
;93:static void UI_RemoveBotsMenu_BotEvent(void* ptr, int event) {
line 94
;94:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $91
line 95
;95:		return;
ADDRGP4 $90
JUMPV
LABELV $91
line 98
;96:	}
;97:
;98:	removeBotsMenuInfo.bots[removeBotsMenuInfo.selectedBotNum].color = color_orange;
ADDRGP4 removeBotsMenuInfo+1456
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 removeBotsMenuInfo+732+72
ADDP4
ADDRGP4 color_orange
ASGNP4
line 99
;99:	removeBotsMenuInfo.selectedBotNum                                = ((menucommon_s*)ptr)->id - ID_BOTNAME0;
ADDRGP4 removeBotsMenuInfo+1456
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 20
SUBI4
ASGNI4
line 100
;100:	removeBotsMenuInfo.bots[removeBotsMenuInfo.selectedBotNum].color = color_white;
ADDRGP4 removeBotsMenuInfo+1456
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 removeBotsMenuInfo+732+72
ADDP4
ADDRGP4 color_white
ASGNP4
line 101
;101:}
LABELV $90
endproc UI_RemoveBotsMenu_BotEvent 0 0
proc UI_RemoveBotsMenu_BackEvent 0 0
line 108
;102:
;103:/*
;104:=================
;105:UI_RemoveAddBotsMenu_BackEvent
;106:=================
;107:*/
;108:static void UI_RemoveBotsMenu_BackEvent(void* ptr, int event) {
line 109
;109:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $101
line 110
;110:		return;
ADDRGP4 $100
JUMPV
LABELV $101
line 112
;111:	}
;112:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 113
;113:}
LABELV $100
endproc UI_RemoveBotsMenu_BackEvent 0 0
proc UI_RemoveBotsMenu_UpEvent 4 0
line 120
;114:
;115:/*
;116:=================
;117:UI_RemoveBotsMenu_UpEvent
;118:=================
;119:*/
;120:static void UI_RemoveBotsMenu_UpEvent(void* ptr, int event) {
line 121
;121:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $104
line 122
;122:		return;
ADDRGP4 $103
JUMPV
LABELV $104
line 125
;123:	}
;124:
;125:	if (removeBotsMenuInfo.baseBotNum > 0) {
ADDRGP4 removeBotsMenuInfo+1452
INDIRI4
CNSTI4 0
LEI4 $106
line 126
;126:		removeBotsMenuInfo.baseBotNum--;
ADDRLP4 0
ADDRGP4 removeBotsMenuInfo+1452
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 127
;127:		UI_RemoveBotsMenu_SetBotNames();
ADDRGP4 UI_RemoveBotsMenu_SetBotNames
CALLV
pop
line 128
;128:	}
LABELV $106
line 129
;129:}
LABELV $103
endproc UI_RemoveBotsMenu_UpEvent 4 0
proc UI_RemoveBotsMenu_DownEvent 4 0
line 136
;130:
;131:/*
;132:=================
;133:UI_RemoveBotsMenu_DownEvent
;134:=================
;135:*/
;136:static void UI_RemoveBotsMenu_DownEvent(void* ptr, int event) {
line 137
;137:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $111
line 138
;138:		return;
ADDRGP4 $110
JUMPV
LABELV $111
line 141
;139:	}
;140:
;141:	if (removeBotsMenuInfo.baseBotNum + 7 < removeBotsMenuInfo.numBots) {
ADDRGP4 removeBotsMenuInfo+1452
INDIRI4
CNSTI4 7
ADDI4
ADDRGP4 removeBotsMenuInfo+1448
INDIRI4
GEI4 $113
line 142
;142:		removeBotsMenuInfo.baseBotNum++;
ADDRLP4 0
ADDRGP4 removeBotsMenuInfo+1452
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 143
;143:		UI_RemoveBotsMenu_SetBotNames();
ADDRGP4 UI_RemoveBotsMenu_SetBotNames
CALLV
pop
line 144
;144:	}
LABELV $113
line 145
;145:}
LABELV $110
endproc UI_RemoveBotsMenu_DownEvent 4 0
proc UI_RemoveBotsMenu_GetBots 1056 12
line 152
;146:
;147:/*
;148:=================
;149:UI_RemoveBotsMenu_GetBots
;150:=================
;151:*/
;152:static void UI_RemoveBotsMenu_GetBots(void) {
line 158
;153:	int  numPlayers;
;154:	int  isBot;
;155:	int  n;
;156:	char info[MAX_INFO_STRING];
;157:
;158:	trap_GetConfigString(CS_SERVERINFO, info, sizeof(info));
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 159
;159:	numPlayers                 = atoi(Info_ValueForKey(info, "sv_maxclients"));
ADDRLP4 4
ARGP4
ADDRGP4 $119
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
line 160
;160:	removeBotsMenuInfo.numBots = 0;
ADDRGP4 removeBotsMenuInfo+1448
CNSTI4 0
ASGNI4
line 162
;161:
;162:	for (n = 0; n < numPlayers; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $124
JUMPV
LABELV $121
line 163
;163:		trap_GetConfigString(CS_PLAYERS + n, info, MAX_INFO_STRING);
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 165
;164:
;165:		isBot = atoi(Info_ValueForKey(info, "skill"));
ADDRLP4 4
ARGP4
ADDRGP4 $125
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
ADDRLP4 1028
ADDRLP4 1048
INDIRI4
ASGNI4
line 166
;166:		if (!isBot) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $126
line 167
;167:			continue;
ADDRGP4 $122
JUMPV
LABELV $126
line 170
;168:		}
;169:
;170:		removeBotsMenuInfo.botClientNums[removeBotsMenuInfo.numBots] = n;
ADDRGP4 removeBotsMenuInfo+1448
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 removeBotsMenuInfo+1684
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 171
;171:		removeBotsMenuInfo.numBots++;
ADDRLP4 1052
ADDRGP4 removeBotsMenuInfo+1448
ASGNP4
ADDRLP4 1052
INDIRP4
ADDRLP4 1052
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 172
;172:	}
LABELV $122
line 162
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $124
ADDRLP4 0
INDIRI4
ADDRLP4 1032
INDIRI4
LTI4 $121
line 173
;173:}
LABELV $118
endproc UI_RemoveBotsMenu_GetBots 1056 12
export UI_RemoveBots_Cache
proc UI_RemoveBots_Cache 0 4
line 180
;174:
;175:/*
;176:=================
;177:UI_RemoveBots_Cache
;178:=================
;179:*/
;180:void UI_RemoveBots_Cache(void) {
line 181
;181:	trap_R_RegisterShaderNoMip(ART_BACKGROUND);
ADDRGP4 $132
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 182
;182:	trap_R_RegisterShaderNoMip(ART_BACK0);
ADDRGP4 $133
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 183
;183:	trap_R_RegisterShaderNoMip(ART_BACK1);
ADDRGP4 $134
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 184
;184:	trap_R_RegisterShaderNoMip(ART_DELETE0);
ADDRGP4 $135
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 185
;185:	trap_R_RegisterShaderNoMip(ART_DELETE1);
ADDRGP4 $136
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 186
;186:}
LABELV $131
endproc UI_RemoveBots_Cache 0 4
proc UI_RemoveBotsMenu_Init 24 12
line 193
;187:
;188:/*
;189:=================
;190:UI_RemoveBotsMenu_Init
;191:=================
;192:*/
;193:static void UI_RemoveBotsMenu_Init(void) {
line 198
;194:	int n;
;195:	int count;
;196:	int y;
;197:
;198:	memset(&removeBotsMenuInfo, 0, sizeof(removeBotsMenuInfo));
ADDRGP4 removeBotsMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 5780
ARGI4
ADDRGP4 memset
CALLP4
pop
line 199
;199:	removeBotsMenuInfo.menu.fullscreen = qfalse;
ADDRGP4 removeBotsMenuInfo+280
CNSTI4 0
ASGNI4
line 200
;200:	removeBotsMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 removeBotsMenuInfo+276
CNSTI4 1
ASGNI4
line 202
;201:
;202:	UI_RemoveBots_Cache();
ADDRGP4 UI_RemoveBots_Cache
CALLV
pop
line 204
;203:
;204:	UI_RemoveBotsMenu_GetBots();
ADDRGP4 UI_RemoveBotsMenu_GetBots
CALLV
pop
line 205
;205:	UI_RemoveBotsMenu_SetBotNames();
ADDRGP4 UI_RemoveBotsMenu_SetBotNames
CALLV
pop
line 206
;206:	count = removeBotsMenuInfo.numBots < 7 ? removeBotsMenuInfo.numBots : 7;
ADDRGP4 removeBotsMenuInfo+1448
INDIRI4
CNSTI4 7
GEI4 $143
ADDRLP4 12
ADDRGP4 removeBotsMenuInfo+1448
INDIRI4
ASGNI4
ADDRGP4 $144
JUMPV
LABELV $143
ADDRLP4 12
CNSTI4 7
ASGNI4
LABELV $144
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
line 208
;207:
;208:	removeBotsMenuInfo.banner.generic.type = MTYPE_BTEXT;
ADDRGP4 removeBotsMenuInfo+288
CNSTI4 10
ASGNI4
line 209
;209:	removeBotsMenuInfo.banner.generic.x    = 320;
ADDRGP4 removeBotsMenuInfo+288+12
CNSTI4 320
ASGNI4
line 210
;210:	removeBotsMenuInfo.banner.generic.y    = 16;
ADDRGP4 removeBotsMenuInfo+288+16
CNSTI4 16
ASGNI4
line 211
;211:	removeBotsMenuInfo.banner.string       = "REMOVE BOTS";
ADDRGP4 removeBotsMenuInfo+288+64
ADDRGP4 $152
ASGNP4
line 212
;212:	removeBotsMenuInfo.banner.color        = color_white;
ADDRGP4 removeBotsMenuInfo+288+72
ADDRGP4 color_white
ASGNP4
line 213
;213:	removeBotsMenuInfo.banner.style        = UI_CENTER;
ADDRGP4 removeBotsMenuInfo+288+68
CNSTI4 1
ASGNI4
line 215
;214:
;215:	removeBotsMenuInfo.background.generic.type  = MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+364
CNSTI4 6
ASGNI4
line 216
;216:	removeBotsMenuInfo.background.generic.name  = ART_BACKGROUND;
ADDRGP4 removeBotsMenuInfo+364+4
ADDRGP4 $132
ASGNP4
line 217
;217:	removeBotsMenuInfo.background.generic.flags = QMF_INACTIVE;
ADDRGP4 removeBotsMenuInfo+364+44
CNSTU4 16384
ASGNU4
line 218
;218:	removeBotsMenuInfo.background.generic.x     = 320 - 233;
ADDRGP4 removeBotsMenuInfo+364+12
CNSTI4 87
ASGNI4
line 219
;219:	removeBotsMenuInfo.background.generic.y     = 240 - 166;
ADDRGP4 removeBotsMenuInfo+364+16
CNSTI4 74
ASGNI4
line 220
;220:	removeBotsMenuInfo.background.width         = 466;
ADDRGP4 removeBotsMenuInfo+364+80
CNSTI4 466
ASGNI4
line 221
;221:	removeBotsMenuInfo.background.height        = 332;
ADDRGP4 removeBotsMenuInfo+364+84
CNSTI4 332
ASGNI4
line 223
;222:
;223:	removeBotsMenuInfo.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+456
CNSTI4 6
ASGNI4
line 224
;224:	removeBotsMenuInfo.arrows.generic.name  = ART_ARROWS;
ADDRGP4 removeBotsMenuInfo+456+4
ADDRGP4 $173
ASGNP4
line 225
;225:	removeBotsMenuInfo.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 removeBotsMenuInfo+456+44
CNSTU4 16384
ASGNU4
line 226
;226:	removeBotsMenuInfo.arrows.generic.x     = 200;
ADDRGP4 removeBotsMenuInfo+456+12
CNSTI4 200
ASGNI4
line 227
;227:	removeBotsMenuInfo.arrows.generic.y     = 128;
ADDRGP4 removeBotsMenuInfo+456+16
CNSTI4 128
ASGNI4
line 228
;228:	removeBotsMenuInfo.arrows.width         = 64;
ADDRGP4 removeBotsMenuInfo+456+80
CNSTI4 64
ASGNI4
line 229
;229:	removeBotsMenuInfo.arrows.height        = 128;
ADDRGP4 removeBotsMenuInfo+456+84
CNSTI4 128
ASGNI4
line 231
;230:
;231:	removeBotsMenuInfo.up.generic.type     = MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+548
CNSTI4 6
ASGNI4
line 232
;232:	removeBotsMenuInfo.up.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 removeBotsMenuInfo+548+44
CNSTU4 260
ASGNU4
line 233
;233:	removeBotsMenuInfo.up.generic.x        = 200;
ADDRGP4 removeBotsMenuInfo+548+12
CNSTI4 200
ASGNI4
line 234
;234:	removeBotsMenuInfo.up.generic.y        = 128;
ADDRGP4 removeBotsMenuInfo+548+16
CNSTI4 128
ASGNI4
line 235
;235:	removeBotsMenuInfo.up.generic.id       = ID_UP;
ADDRGP4 removeBotsMenuInfo+548+8
CNSTI4 10
ASGNI4
line 236
;236:	removeBotsMenuInfo.up.generic.callback = UI_RemoveBotsMenu_UpEvent;
ADDRGP4 removeBotsMenuInfo+548+48
ADDRGP4 UI_RemoveBotsMenu_UpEvent
ASGNP4
line 237
;237:	removeBotsMenuInfo.up.width            = 64;
ADDRGP4 removeBotsMenuInfo+548+80
CNSTI4 64
ASGNI4
line 238
;238:	removeBotsMenuInfo.up.height           = 64;
ADDRGP4 removeBotsMenuInfo+548+84
CNSTI4 64
ASGNI4
line 239
;239:	removeBotsMenuInfo.up.focuspic         = ART_ARROWUP;
ADDRGP4 removeBotsMenuInfo+548+64
ADDRGP4 $201
ASGNP4
line 241
;240:
;241:	removeBotsMenuInfo.down.generic.type     = MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+640
CNSTI4 6
ASGNI4
line 242
;242:	removeBotsMenuInfo.down.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 removeBotsMenuInfo+640+44
CNSTU4 260
ASGNU4
line 243
;243:	removeBotsMenuInfo.down.generic.x        = 200;
ADDRGP4 removeBotsMenuInfo+640+12
CNSTI4 200
ASGNI4
line 244
;244:	removeBotsMenuInfo.down.generic.y        = 128 + 64;
ADDRGP4 removeBotsMenuInfo+640+16
CNSTI4 192
ASGNI4
line 245
;245:	removeBotsMenuInfo.down.generic.id       = ID_DOWN;
ADDRGP4 removeBotsMenuInfo+640+8
CNSTI4 11
ASGNI4
line 246
;246:	removeBotsMenuInfo.down.generic.callback = UI_RemoveBotsMenu_DownEvent;
ADDRGP4 removeBotsMenuInfo+640+48
ADDRGP4 UI_RemoveBotsMenu_DownEvent
ASGNP4
line 247
;247:	removeBotsMenuInfo.down.width            = 64;
ADDRGP4 removeBotsMenuInfo+640+80
CNSTI4 64
ASGNI4
line 248
;248:	removeBotsMenuInfo.down.height           = 64;
ADDRGP4 removeBotsMenuInfo+640+84
CNSTI4 64
ASGNI4
line 249
;249:	removeBotsMenuInfo.down.focuspic         = ART_ARROWDOWN;
ADDRGP4 removeBotsMenuInfo+640+64
ADDRGP4 $219
ASGNP4
line 251
;250:
;251:	for (n = 0, y = 120; n < count; n++, y += 20) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 120
ASGNI4
ADDRGP4 $223
JUMPV
LABELV $220
line 252
;252:		removeBotsMenuInfo.bots[n].generic.type     = MTYPE_PTEXT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 removeBotsMenuInfo+732
ADDP4
CNSTI4 9
ASGNI4
line 253
;253:		removeBotsMenuInfo.bots[n].generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 removeBotsMenuInfo+732+44
ADDP4
CNSTU4 260
ASGNU4
line 254
;254:		removeBotsMenuInfo.bots[n].generic.id       = ID_BOTNAME0 + n;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 removeBotsMenuInfo+732+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 255
;255:		removeBotsMenuInfo.bots[n].generic.x        = 320 - 56;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 removeBotsMenuInfo+732+12
ADDP4
CNSTI4 264
ASGNI4
line 256
;256:		removeBotsMenuInfo.bots[n].generic.y        = y;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 removeBotsMenuInfo+732+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 257
;257:		removeBotsMenuInfo.bots[n].generic.callback = UI_RemoveBotsMenu_BotEvent;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 removeBotsMenuInfo+732+48
ADDP4
ADDRGP4 UI_RemoveBotsMenu_BotEvent
ASGNP4
line 258
;258:		removeBotsMenuInfo.bots[n].string           = removeBotsMenuInfo.botnames[n];
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 removeBotsMenuInfo+732+64
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 removeBotsMenuInfo+1460
ADDP4
ASGNP4
line 259
;259:		removeBotsMenuInfo.bots[n].color            = color_orange;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 removeBotsMenuInfo+732+72
ADDP4
ADDRGP4 color_orange
ASGNP4
line 260
;260:		removeBotsMenuInfo.bots[n].style            = UI_LEFT | UI_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 removeBotsMenuInfo+732+68
ADDP4
CNSTI4 16
ASGNI4
line 261
;261:	}
LABELV $221
line 251
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
LABELV $223
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $220
line 263
;262:
;263:	removeBotsMenuInfo.delete.generic.type     = MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+1264
CNSTI4 6
ASGNI4
line 264
;264:	removeBotsMenuInfo.delete.generic.name     = ART_DELETE0;
ADDRGP4 removeBotsMenuInfo+1264+4
ADDRGP4 $135
ASGNP4
line 265
;265:	removeBotsMenuInfo.delete.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 removeBotsMenuInfo+1264+44
CNSTU4 260
ASGNU4
line 266
;266:	removeBotsMenuInfo.delete.generic.id       = ID_DELETE;
ADDRGP4 removeBotsMenuInfo+1264+8
CNSTI4 12
ASGNI4
line 267
;267:	removeBotsMenuInfo.delete.generic.callback = UI_RemoveBotsMenu_DeleteEvent;
ADDRGP4 removeBotsMenuInfo+1264+48
ADDRGP4 UI_RemoveBotsMenu_DeleteEvent
ASGNP4
line 268
;268:	removeBotsMenuInfo.delete.generic.x        = 320 + 128 - 128;
ADDRGP4 removeBotsMenuInfo+1264+12
CNSTI4 320
ASGNI4
line 269
;269:	removeBotsMenuInfo.delete.generic.y        = 256 + 128 - 64;
ADDRGP4 removeBotsMenuInfo+1264+16
CNSTI4 320
ASGNI4
line 270
;270:	removeBotsMenuInfo.delete.width            = 128;
ADDRGP4 removeBotsMenuInfo+1264+80
CNSTI4 128
ASGNI4
line 271
;271:	removeBotsMenuInfo.delete.height           = 64;
ADDRGP4 removeBotsMenuInfo+1264+84
CNSTI4 64
ASGNI4
line 272
;272:	removeBotsMenuInfo.delete.focuspic         = ART_DELETE1;
ADDRGP4 removeBotsMenuInfo+1264+64
ADDRGP4 $136
ASGNP4
line 274
;273:
;274:	removeBotsMenuInfo.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 removeBotsMenuInfo+1356
CNSTI4 6
ASGNI4
line 275
;275:	removeBotsMenuInfo.back.generic.name     = ART_BACK0;
ADDRGP4 removeBotsMenuInfo+1356+4
ADDRGP4 $133
ASGNP4
line 276
;276:	removeBotsMenuInfo.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 removeBotsMenuInfo+1356+44
CNSTU4 260
ASGNU4
line 277
;277:	removeBotsMenuInfo.back.generic.id       = ID_BACK;
ADDRGP4 removeBotsMenuInfo+1356+8
CNSTI4 13
ASGNI4
line 278
;278:	removeBotsMenuInfo.back.generic.callback = UI_RemoveBotsMenu_BackEvent;
ADDRGP4 removeBotsMenuInfo+1356+48
ADDRGP4 UI_RemoveBotsMenu_BackEvent
ASGNP4
line 279
;279:	removeBotsMenuInfo.back.generic.x        = 320 - 128;
ADDRGP4 removeBotsMenuInfo+1356+12
CNSTI4 192
ASGNI4
line 280
;280:	removeBotsMenuInfo.back.generic.y        = 256 + 128 - 64;
ADDRGP4 removeBotsMenuInfo+1356+16
CNSTI4 320
ASGNI4
line 281
;281:	removeBotsMenuInfo.back.width            = 128;
ADDRGP4 removeBotsMenuInfo+1356+80
CNSTI4 128
ASGNI4
line 282
;282:	removeBotsMenuInfo.back.height           = 64;
ADDRGP4 removeBotsMenuInfo+1356+84
CNSTI4 64
ASGNI4
line 283
;283:	removeBotsMenuInfo.back.focuspic         = ART_BACK1;
ADDRGP4 removeBotsMenuInfo+1356+64
ADDRGP4 $134
ASGNP4
line 285
;284:
;285:	Menu_AddItem(&removeBotsMenuInfo.menu, &removeBotsMenuInfo.background);
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 286
;286:	Menu_AddItem(&removeBotsMenuInfo.menu, &removeBotsMenuInfo.banner);
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 287
;287:	Menu_AddItem(&removeBotsMenuInfo.menu, &removeBotsMenuInfo.arrows);
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 288
;288:	Menu_AddItem(&removeBotsMenuInfo.menu, &removeBotsMenuInfo.up);
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 289
;289:	Menu_AddItem(&removeBotsMenuInfo.menu, &removeBotsMenuInfo.down);
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+640
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 290
;290:	for (n = 0; n < count; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $288
JUMPV
LABELV $285
line 291
;291:		Menu_AddItem(&removeBotsMenuInfo.menu, &removeBotsMenuInfo.bots[n]);
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 removeBotsMenuInfo+732
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 292
;292:	}
LABELV $286
line 290
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $288
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $285
line 293
;293:	Menu_AddItem(&removeBotsMenuInfo.menu, &removeBotsMenuInfo.delete);
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+1264
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 294
;294:	Menu_AddItem(&removeBotsMenuInfo.menu, &removeBotsMenuInfo.back);
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 removeBotsMenuInfo+1356
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 296
;295:
;296:	removeBotsMenuInfo.baseBotNum     = 0;
ADDRGP4 removeBotsMenuInfo+1452
CNSTI4 0
ASGNI4
line 297
;297:	removeBotsMenuInfo.selectedBotNum = 0;
ADDRGP4 removeBotsMenuInfo+1456
CNSTI4 0
ASGNI4
line 298
;298:	removeBotsMenuInfo.bots[0].color  = color_white;
ADDRGP4 removeBotsMenuInfo+732+72
ADDRGP4 color_white
ASGNP4
line 299
;299:}
LABELV $137
endproc UI_RemoveBotsMenu_Init 24 12
export UI_RemoveBotsMenu
proc UI_RemoveBotsMenu 0 4
line 306
;300:
;301:/*
;302:=================
;303:UI_RemoveBotsMenu
;304:=================
;305:*/
;306:void UI_RemoveBotsMenu(void) {
line 307
;307:	UI_RemoveBotsMenu_Init();
ADDRGP4 UI_RemoveBotsMenu_Init
CALLV
pop
line 308
;308:	UI_PushMenu(&removeBotsMenuInfo.menu);
ADDRGP4 removeBotsMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 309
;309:}
LABELV $296
endproc UI_RemoveBotsMenu 0 4
bss
align 4
LABELV removeBotsMenuInfo
skip 5780
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
LABELV $219
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $201
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $173
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $152
byte 1 82
byte 1 69
byte 1 77
byte 1 79
byte 1 86
byte 1 69
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $136
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $135
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $134
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $133
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $132
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $125
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $119
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
LABELV $86
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $79
byte 1 110
byte 1 0
