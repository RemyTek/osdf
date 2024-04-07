code
proc UI_AddBotsMenu_FightEvent 16 20
file "../../../../code/q3_ui/ui_addbots.c"
line 63
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:ADD BOTS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:#define ART_BACK0      "menu/art/back_0"
;14:#define ART_BACK1      "menu/art/back_1"
;15:#define ART_FIGHT0     "menu/art/accept_0"
;16:#define ART_FIGHT1     "menu/art/accept_1"
;17:#define ART_BACKGROUND "menu/art/addbotframe"
;18:#define ART_ARROWS     "menu/art/arrows_vert_0"
;19:#define ART_ARROWUP    "menu/art/arrows_vert_top"
;20:#define ART_ARROWDOWN  "menu/art/arrows_vert_bot"
;21:
;22:#define ID_BACK     10
;23:#define ID_GO       11
;24:#define ID_LIST     12
;25:#define ID_UP       13
;26:#define ID_DOWN     14
;27:#define ID_SKILL    15
;28:#define ID_TEAM     16
;29:#define ID_BOTNAME0 20
;30:#define ID_BOTNAME1 21
;31:#define ID_BOTNAME2 22
;32:#define ID_BOTNAME3 23
;33:#define ID_BOTNAME4 24
;34:#define ID_BOTNAME5 25
;35:#define ID_BOTNAME6 26
;36:
;37:typedef struct {
;38:	menuframework_s menu;
;39:	menubitmap_s    arrows;
;40:	menubitmap_s    up;
;41:	menubitmap_s    down;
;42:	menutext_s      bots[7];
;43:	menulist_s      skill;
;44:	menulist_s      team;
;45:	menubitmap_s    go;
;46:	menubitmap_s    back;
;47:
;48:	int             numBots;
;49:	int             delay;
;50:	int             baseBotNum;
;51:	int             selectedBotNum;
;52:	int             sortedBotNums[MAX_BOTS];
;53:	char            botnames[7][32];
;54:} addBotsMenuInfo_t;
;55:
;56:static addBotsMenuInfo_t addBotsMenuInfo;
;57:
;58:/*
;59:=================
;60:UI_AddBotsMenu_FightEvent
;61:=================
;62:*/
;63:static void UI_AddBotsMenu_FightEvent(void* ptr, int event) {
line 67
;64:	const char* team;
;65:	int         skill;
;66:
;67:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $70
line 68
;68:		return;
ADDRGP4 $69
JUMPV
LABELV $70
line 71
;69:	}
;70:
;71:	team  = addBotsMenuInfo.team.itemnames[addBotsMenuInfo.team.curvalue];
ADDRLP4 0
ADDRGP4 addBotsMenuInfo+1204+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 addBotsMenuInfo+1204+88
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 72
;72:	skill = addBotsMenuInfo.skill.curvalue + 1;
ADDRLP4 4
ADDRGP4 addBotsMenuInfo+1096+68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 74
;73:
;74:	trap_Cmd_ExecuteText(EXEC_APPEND, va("addbot %s %i %s %i\n", addBotsMenuInfo.botnames[addBotsMenuInfo.selectedBotNum], skill, team, addBotsMenuInfo.delay));
ADDRGP4 $78
ARGP4
ADDRGP4 addBotsMenuInfo+1508
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 addBotsMenuInfo+5608
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 addBotsMenuInfo+1500
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 76
;75:
;76:	addBotsMenuInfo.delay += 1500;
ADDRLP4 12
ADDRGP4 addBotsMenuInfo+1500
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 77
;77:}
LABELV $69
endproc UI_AddBotsMenu_FightEvent 16 20
proc UI_AddBotsMenu_BotEvent 0 0
line 84
;78:
;79:/*
;80:=================
;81:UI_AddBotsMenu_BotEvent
;82:=================
;83:*/
;84:static void UI_AddBotsMenu_BotEvent(void* ptr, int event) {
line 85
;85:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $84
line 86
;86:		return;
ADDRGP4 $83
JUMPV
LABELV $84
line 89
;87:	}
;88:
;89:	addBotsMenuInfo.bots[addBotsMenuInfo.selectedBotNum].color = color_orange;
ADDRGP4 addBotsMenuInfo+1508
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 addBotsMenuInfo+564+72
ADDP4
ADDRGP4 color_orange
ASGNP4
line 90
;90:	addBotsMenuInfo.selectedBotNum                             = ((menucommon_s*)ptr)->id - ID_BOTNAME0;
ADDRGP4 addBotsMenuInfo+1508
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 20
SUBI4
ASGNI4
line 91
;91:	addBotsMenuInfo.bots[addBotsMenuInfo.selectedBotNum].color = color_white;
ADDRGP4 addBotsMenuInfo+1508
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 addBotsMenuInfo+564+72
ADDP4
ADDRGP4 color_white
ASGNP4
line 92
;92:}
LABELV $83
endproc UI_AddBotsMenu_BotEvent 0 0
proc UI_AddBotsMenu_BackEvent 0 0
line 99
;93:
;94:/*
;95:=================
;96:UI_AddBotsMenu_BackEvent
;97:=================
;98:*/
;99:static void UI_AddBotsMenu_BackEvent(void* ptr, int event) {
line 100
;100:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $94
line 101
;101:		return;
ADDRGP4 $93
JUMPV
LABELV $94
line 103
;102:	}
;103:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 104
;104:}
LABELV $93
endproc UI_AddBotsMenu_BackEvent 0 0
proc UI_AddBotsMenu_SetBotNames 16 12
line 111
;105:
;106:/*
;107:=================
;108:UI_AddBotsMenu_SetBotNames
;109:=================
;110:*/
;111:static void UI_AddBotsMenu_SetBotNames(void) {
line 115
;112:	int         n;
;113:	const char* info;
;114:
;115:	for (n = 0; n < 7; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $97
line 116
;116:		info = UI_GetBotInfoByNumber(addBotsMenuInfo.sortedBotNums[addBotsMenuInfo.baseBotNum + n]);
ADDRGP4 addBotsMenuInfo+1504
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 2
LSHI4
ADDRGP4 addBotsMenuInfo+1512
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 117
;117:		Q_strncpyz(addBotsMenuInfo.botnames[n], Info_ValueForKey(info, "name"), sizeof(addBotsMenuInfo.botnames[n]));
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $104
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 addBotsMenuInfo+5608
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 118
;118:	}
LABELV $98
line 115
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 7
LTI4 $97
line 119
;119:}
LABELV $96
endproc UI_AddBotsMenu_SetBotNames 16 12
proc UI_AddBotsMenu_UpEvent 4 0
line 126
;120:
;121:/*
;122:=================
;123:UI_AddBotsMenu_UpEvent
;124:=================
;125:*/
;126:static void UI_AddBotsMenu_UpEvent(void* ptr, int event) {
line 127
;127:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $107
line 128
;128:		return;
ADDRGP4 $106
JUMPV
LABELV $107
line 131
;129:	}
;130:
;131:	if (addBotsMenuInfo.baseBotNum > 0) {
ADDRGP4 addBotsMenuInfo+1504
INDIRI4
CNSTI4 0
LEI4 $109
line 132
;132:		addBotsMenuInfo.baseBotNum--;
ADDRLP4 0
ADDRGP4 addBotsMenuInfo+1504
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 133
;133:		UI_AddBotsMenu_SetBotNames();
ADDRGP4 UI_AddBotsMenu_SetBotNames
CALLV
pop
line 134
;134:	}
LABELV $109
line 135
;135:}
LABELV $106
endproc UI_AddBotsMenu_UpEvent 4 0
proc UI_AddBotsMenu_DownEvent 4 0
line 142
;136:
;137:/*
;138:=================
;139:UI_AddBotsMenu_DownEvent
;140:=================
;141:*/
;142:static void UI_AddBotsMenu_DownEvent(void* ptr, int event) {
line 143
;143:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $114
line 144
;144:		return;
ADDRGP4 $113
JUMPV
LABELV $114
line 147
;145:	}
;146:
;147:	if (addBotsMenuInfo.baseBotNum + 7 < addBotsMenuInfo.numBots) {
ADDRGP4 addBotsMenuInfo+1504
INDIRI4
CNSTI4 7
ADDI4
ADDRGP4 addBotsMenuInfo+1496
INDIRI4
GEI4 $116
line 148
;148:		addBotsMenuInfo.baseBotNum++;
ADDRLP4 0
ADDRGP4 addBotsMenuInfo+1504
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 149
;149:		UI_AddBotsMenu_SetBotNames();
ADDRGP4 UI_AddBotsMenu_SetBotNames
CALLV
pop
line 150
;150:	}
LABELV $116
line 151
;151:}
LABELV $113
endproc UI_AddBotsMenu_DownEvent 4 0
proc UI_AddBotsMenu_SortCompare 44 8
line 158
;152:
;153:/*
;154:=================
;155:UI_AddBotsMenu_GetSortedBotNums
;156:=================
;157:*/
;158:static int QDECL UI_AddBotsMenu_SortCompare(const void* arg1, const void* arg2) {
line 163
;159:	int         num1, num2;
;160:	const char *info1, *info2;
;161:	const char *name1, *name2;
;162:
;163:	num1 = *(int*)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 164
;164:	num2 = *(int*)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 166
;165:
;166:	info1 = UI_GetBotInfoByNumber(num1);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 167
;167:	info2 = UI_GetBotInfoByNumber(num2);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 UI_GetBotInfoByNumber
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 169
;168:
;169:	name1 = Info_ValueForKey(info1, "name");
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $104
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 170
;170:	name2 = Info_ValueForKey(info2, "name");
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 $104
ARGP4
ADDRLP4 36
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 36
INDIRP4
ASGNP4
line 172
;171:
;172:	return Q_stricmp(name1, name2);
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
LABELV $121
endproc UI_AddBotsMenu_SortCompare 44 8
proc UI_AddBotsMenu_GetSortedBotNums 8 16
line 175
;173:}
;174:
;175:static void UI_AddBotsMenu_GetSortedBotNums(void) {
line 179
;176:	int n;
;177:
;178:	// initialize the array
;179:	for (n = 0; n < addBotsMenuInfo.numBots; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $126
JUMPV
LABELV $123
line 180
;180:		addBotsMenuInfo.sortedBotNums[n] = n;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 addBotsMenuInfo+1512
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 181
;181:	}
LABELV $124
line 179
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $126
ADDRLP4 0
INDIRI4
ADDRGP4 addBotsMenuInfo+1496
INDIRI4
LTI4 $123
line 183
;182:
;183:	qsort(addBotsMenuInfo.sortedBotNums, addBotsMenuInfo.numBots, sizeof(addBotsMenuInfo.sortedBotNums[0]), UI_AddBotsMenu_SortCompare);
ADDRGP4 addBotsMenuInfo+1512
ARGP4
ADDRGP4 addBotsMenuInfo+1496
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 UI_AddBotsMenu_SortCompare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 184
;184:}
LABELV $122
endproc UI_AddBotsMenu_GetSortedBotNums 8 16
proc UI_AddBotsMenu_Draw 0 20
line 191
;185:
;186:/*
;187:=================
;188:UI_AddBotsMenu_Draw
;189:=================
;190:*/
;191:static void UI_AddBotsMenu_Draw(void) {
line 192
;192:	UI_DrawBannerString(320, 16, "ADD BOTS", UI_CENTER, color_white);
CNSTI4 320
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 $133
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawBannerString
CALLV
pop
line 193
;193:	UI_DrawNamedPic(320 - 233, 240 - 166, 466, 332, ART_BACKGROUND);
CNSTF4 1118699520
ARGF4
CNSTF4 1116995584
ARGF4
CNSTF4 1139343360
ARGF4
CNSTF4 1134952448
ARGF4
ADDRGP4 $134
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 196
;194:
;195:	// standard menu drawing
;196:	Menu_Draw(&addBotsMenuInfo.menu);
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 197
;197:}
LABELV $132
endproc UI_AddBotsMenu_Draw 0 20
data
align 4
LABELV skillNames
address $135
address $136
address $137
address $138
address $139
byte 4 0
align 4
LABELV teamNames1
address $140
byte 4 0
align 4
LABELV teamNames2
address $141
address $142
byte 4 0
code
proc UI_AddBotsMenu_Init 36 12
line 210
;198:
;199:/*
;200:=================
;201:UI_AddBotsMenu_Init
;202:=================
;203:*/
;204:static const char* skillNames[] = {"I Can Win", "Bring It On", "Hurt Me Plenty", "Hardcore", "Nightmare!", 0};
;205:
;206:static const char* teamNames1[] = {"Free", 0};
;207:
;208:static const char* teamNames2[] = {"Red", "Blue", 0};
;209:
;210:static void        UI_AddBotsMenu_Init(void) {
line 218
;211:		   int n;
;212:		   int y;
;213:		   int gametype;
;214:		   int count;
;215:
;216:		   // trap_GetConfigString(CS_SERVERINFO, info, MAX_INFO_STRING);
;217:	       // gametype = atoi( Info_ValueForKey( info,"g_gametype" ) );
;218:		   gametype = trap_Cvar_VariableValue("ui_gametype");
ADDRGP4 $144
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 220
;219:
;220:		   memset(&addBotsMenuInfo, 0, sizeof(addBotsMenuInfo));
ADDRGP4 addBotsMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 5832
ARGI4
ADDRGP4 memset
CALLP4
pop
line 221
;221:		   addBotsMenuInfo.menu.draw       = UI_AddBotsMenu_Draw;
ADDRGP4 addBotsMenuInfo+268
ADDRGP4 UI_AddBotsMenu_Draw
ASGNP4
line 222
;222:		   addBotsMenuInfo.menu.fullscreen = qfalse;
ADDRGP4 addBotsMenuInfo+280
CNSTI4 0
ASGNI4
line 223
;223:		   addBotsMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 addBotsMenuInfo+276
CNSTI4 1
ASGNI4
line 224
;224:		   addBotsMenuInfo.delay           = 1000;
ADDRGP4 addBotsMenuInfo+1500
CNSTI4 1000
ASGNI4
line 226
;225:
;226:		   UI_AddBots_Cache();
ADDRGP4 UI_AddBots_Cache
CALLV
pop
line 228
;227:
;228:		   addBotsMenuInfo.numBots = UI_GetNumBots();
ADDRLP4 20
ADDRGP4 UI_GetNumBots
CALLI4
ASGNI4
ADDRGP4 addBotsMenuInfo+1496
ADDRLP4 20
INDIRI4
ASGNI4
line 229
;229:		   count                   = addBotsMenuInfo.numBots < 7 ? addBotsMenuInfo.numBots : 7;
ADDRGP4 addBotsMenuInfo+1496
INDIRI4
CNSTI4 7
GEI4 $153
ADDRLP4 24
ADDRGP4 addBotsMenuInfo+1496
INDIRI4
ASGNI4
ADDRGP4 $154
JUMPV
LABELV $153
ADDRLP4 24
CNSTI4 7
ASGNI4
LABELV $154
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 231
;230:
;231:		   addBotsMenuInfo.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 addBotsMenuInfo+288
CNSTI4 6
ASGNI4
line 232
;232:		   addBotsMenuInfo.arrows.generic.name  = ART_ARROWS;
ADDRGP4 addBotsMenuInfo+288+4
ADDRGP4 $158
ASGNP4
line 233
;233:		   addBotsMenuInfo.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 addBotsMenuInfo+288+44
CNSTU4 16384
ASGNU4
line 234
;234:		   addBotsMenuInfo.arrows.generic.x     = 200;
ADDRGP4 addBotsMenuInfo+288+12
CNSTI4 200
ASGNI4
line 235
;235:		   addBotsMenuInfo.arrows.generic.y     = 128;
ADDRGP4 addBotsMenuInfo+288+16
CNSTI4 128
ASGNI4
line 236
;236:		   addBotsMenuInfo.arrows.width         = 64;
ADDRGP4 addBotsMenuInfo+288+80
CNSTI4 64
ASGNI4
line 237
;237:		   addBotsMenuInfo.arrows.height        = 128;
ADDRGP4 addBotsMenuInfo+288+84
CNSTI4 128
ASGNI4
line 239
;238:
;239:		   addBotsMenuInfo.up.generic.type     = MTYPE_BITMAP;
ADDRGP4 addBotsMenuInfo+380
CNSTI4 6
ASGNI4
line 240
;240:		   addBotsMenuInfo.up.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 addBotsMenuInfo+380+44
CNSTU4 260
ASGNU4
line 241
;241:		   addBotsMenuInfo.up.generic.x        = 200;
ADDRGP4 addBotsMenuInfo+380+12
CNSTI4 200
ASGNI4
line 242
;242:		   addBotsMenuInfo.up.generic.y        = 128;
ADDRGP4 addBotsMenuInfo+380+16
CNSTI4 128
ASGNI4
line 243
;243:		   addBotsMenuInfo.up.generic.id       = ID_UP;
ADDRGP4 addBotsMenuInfo+380+8
CNSTI4 13
ASGNI4
line 244
;244:		   addBotsMenuInfo.up.generic.callback = UI_AddBotsMenu_UpEvent;
ADDRGP4 addBotsMenuInfo+380+48
ADDRGP4 UI_AddBotsMenu_UpEvent
ASGNP4
line 245
;245:		   addBotsMenuInfo.up.width            = 64;
ADDRGP4 addBotsMenuInfo+380+80
CNSTI4 64
ASGNI4
line 246
;246:		   addBotsMenuInfo.up.height           = 64;
ADDRGP4 addBotsMenuInfo+380+84
CNSTI4 64
ASGNI4
line 247
;247:		   addBotsMenuInfo.up.focuspic         = ART_ARROWUP;
ADDRGP4 addBotsMenuInfo+380+64
ADDRGP4 $186
ASGNP4
line 249
;248:
;249:		   addBotsMenuInfo.down.generic.type     = MTYPE_BITMAP;
ADDRGP4 addBotsMenuInfo+472
CNSTI4 6
ASGNI4
line 250
;250:		   addBotsMenuInfo.down.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 addBotsMenuInfo+472+44
CNSTU4 260
ASGNU4
line 251
;251:		   addBotsMenuInfo.down.generic.x        = 200;
ADDRGP4 addBotsMenuInfo+472+12
CNSTI4 200
ASGNI4
line 252
;252:		   addBotsMenuInfo.down.generic.y        = 128 + 64;
ADDRGP4 addBotsMenuInfo+472+16
CNSTI4 192
ASGNI4
line 253
;253:		   addBotsMenuInfo.down.generic.id       = ID_DOWN;
ADDRGP4 addBotsMenuInfo+472+8
CNSTI4 14
ASGNI4
line 254
;254:		   addBotsMenuInfo.down.generic.callback = UI_AddBotsMenu_DownEvent;
ADDRGP4 addBotsMenuInfo+472+48
ADDRGP4 UI_AddBotsMenu_DownEvent
ASGNP4
line 255
;255:		   addBotsMenuInfo.down.width            = 64;
ADDRGP4 addBotsMenuInfo+472+80
CNSTI4 64
ASGNI4
line 256
;256:		   addBotsMenuInfo.down.height           = 64;
ADDRGP4 addBotsMenuInfo+472+84
CNSTI4 64
ASGNI4
line 257
;257:		   addBotsMenuInfo.down.focuspic         = ART_ARROWDOWN;
ADDRGP4 addBotsMenuInfo+472+64
ADDRGP4 $204
ASGNP4
line 259
;258:
;259:		   for (n = 0, y = 120; n < count; n++, y += 20) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
CNSTI4 120
ASGNI4
ADDRGP4 $208
JUMPV
LABELV $205
line 260
;260:			   addBotsMenuInfo.bots[n].generic.type     = MTYPE_PTEXT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 addBotsMenuInfo+564
ADDP4
CNSTI4 9
ASGNI4
line 261
;261:			   addBotsMenuInfo.bots[n].generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 addBotsMenuInfo+564+44
ADDP4
CNSTU4 260
ASGNU4
line 262
;262:			   addBotsMenuInfo.bots[n].generic.id       = ID_BOTNAME0 + n;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 addBotsMenuInfo+564+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
line 263
;263:			   addBotsMenuInfo.bots[n].generic.x        = 320 - 56;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 addBotsMenuInfo+564+12
ADDP4
CNSTI4 264
ASGNI4
line 264
;264:			   addBotsMenuInfo.bots[n].generic.y        = y;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 addBotsMenuInfo+564+16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 265
;265:			   addBotsMenuInfo.bots[n].generic.callback = UI_AddBotsMenu_BotEvent;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 addBotsMenuInfo+564+48
ADDP4
ADDRGP4 UI_AddBotsMenu_BotEvent
ASGNP4
line 266
;266:			   addBotsMenuInfo.bots[n].string           = addBotsMenuInfo.botnames[n];
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 addBotsMenuInfo+564+64
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 5
LSHI4
ADDRGP4 addBotsMenuInfo+5608
ADDP4
ASGNP4
line 267
;267:			   addBotsMenuInfo.bots[n].color            = color_orange;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 addBotsMenuInfo+564+72
ADDP4
ADDRGP4 color_orange
ASGNP4
line 268
;268:			   addBotsMenuInfo.bots[n].style            = UI_LEFT | UI_SMALLFONT;
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 addBotsMenuInfo+564+68
ADDP4
CNSTI4 16
ASGNI4
line 269
;269:    }
LABELV $206
line 259
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 20
ADDI4
ASGNI4
LABELV $208
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $205
line 271
;270:
;271:		   y += 12;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 272
;272:		   addBotsMenuInfo.skill.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 addBotsMenuInfo+1096
CNSTI4 3
ASGNI4
line 273
;273:		   addBotsMenuInfo.skill.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 addBotsMenuInfo+1096+44
CNSTU4 258
ASGNU4
line 274
;274:		   addBotsMenuInfo.skill.generic.x     = 320;
ADDRGP4 addBotsMenuInfo+1096+12
CNSTI4 320
ASGNI4
line 275
;275:		   addBotsMenuInfo.skill.generic.y     = y;
ADDRGP4 addBotsMenuInfo+1096+16
ADDRLP4 4
INDIRI4
ASGNI4
line 276
;276:		   addBotsMenuInfo.skill.generic.name  = "Skill:";
ADDRGP4 addBotsMenuInfo+1096+4
ADDRGP4 $236
ASGNP4
line 277
;277:		   addBotsMenuInfo.skill.generic.id    = ID_SKILL;
ADDRGP4 addBotsMenuInfo+1096+8
CNSTI4 15
ASGNI4
line 278
;278:		   addBotsMenuInfo.skill.itemnames     = skillNames;
ADDRGP4 addBotsMenuInfo+1096+88
ADDRGP4 skillNames
ASGNP4
line 279
;279:		   addBotsMenuInfo.skill.curvalue      = Com_Clamp(0, 4, (int)trap_Cvar_VariableValue("g_spSkill") - 1);
ADDRGP4 $243
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 0
ARGF4
CNSTF4 1082130432
ARGF4
ADDRLP4 28
INDIRF4
CVFI4 4
CNSTI4 1
SUBI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 addBotsMenuInfo+1096+68
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 281
;280:
;281:		   y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 282
;282:		   addBotsMenuInfo.team.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 addBotsMenuInfo+1204
CNSTI4 3
ASGNI4
line 283
;283:		   addBotsMenuInfo.team.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 addBotsMenuInfo+1204+44
CNSTU4 258
ASGNU4
line 284
;284:		   addBotsMenuInfo.team.generic.x     = 320;
ADDRGP4 addBotsMenuInfo+1204+12
CNSTI4 320
ASGNI4
line 285
;285:		   addBotsMenuInfo.team.generic.y     = y;
ADDRGP4 addBotsMenuInfo+1204+16
ADDRLP4 4
INDIRI4
ASGNI4
line 286
;286:		   addBotsMenuInfo.team.generic.name  = "Team: ";
ADDRGP4 addBotsMenuInfo+1204+4
ADDRGP4 $253
ASGNP4
line 287
;287:		   addBotsMenuInfo.team.generic.id    = ID_TEAM;
ADDRGP4 addBotsMenuInfo+1204+8
CNSTI4 16
ASGNI4
line 288
;288:		   if (gametype >= GT_TEAM) {
ADDRLP4 12
INDIRI4
CNSTI4 3
LTI4 $256
line 289
;289:			   addBotsMenuInfo.team.itemnames = teamNames2;
ADDRGP4 addBotsMenuInfo+1204+88
ADDRGP4 teamNames2
ASGNP4
line 290
;290:    } else {
ADDRGP4 $257
JUMPV
LABELV $256
line 291
;291:			   addBotsMenuInfo.team.itemnames     = teamNames1;
ADDRGP4 addBotsMenuInfo+1204+88
ADDRGP4 teamNames1
ASGNP4
line 292
;292:			   addBotsMenuInfo.team.generic.flags = QMF_GRAYED;
ADDRGP4 addBotsMenuInfo+1204+44
CNSTU4 8192
ASGNU4
line 293
;293:    }
LABELV $257
line 295
;294:
;295:		   addBotsMenuInfo.go.generic.type     = MTYPE_BITMAP;
ADDRGP4 addBotsMenuInfo+1312
CNSTI4 6
ASGNI4
line 296
;296:		   addBotsMenuInfo.go.generic.name     = ART_FIGHT0;
ADDRGP4 addBotsMenuInfo+1312+4
ADDRGP4 $267
ASGNP4
line 297
;297:		   addBotsMenuInfo.go.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 addBotsMenuInfo+1312+44
CNSTU4 260
ASGNU4
line 298
;298:		   addBotsMenuInfo.go.generic.id       = ID_GO;
ADDRGP4 addBotsMenuInfo+1312+8
CNSTI4 11
ASGNI4
line 299
;299:		   addBotsMenuInfo.go.generic.callback = UI_AddBotsMenu_FightEvent;
ADDRGP4 addBotsMenuInfo+1312+48
ADDRGP4 UI_AddBotsMenu_FightEvent
ASGNP4
line 300
;300:		   addBotsMenuInfo.go.generic.x        = 320 + 128 - 128;
ADDRGP4 addBotsMenuInfo+1312+12
CNSTI4 320
ASGNI4
line 301
;301:		   addBotsMenuInfo.go.generic.y        = 256 + 128 - 64;
ADDRGP4 addBotsMenuInfo+1312+16
CNSTI4 320
ASGNI4
line 302
;302:		   addBotsMenuInfo.go.width            = 128;
ADDRGP4 addBotsMenuInfo+1312+80
CNSTI4 128
ASGNI4
line 303
;303:		   addBotsMenuInfo.go.height           = 64;
ADDRGP4 addBotsMenuInfo+1312+84
CNSTI4 64
ASGNI4
line 304
;304:		   addBotsMenuInfo.go.focuspic         = ART_FIGHT1;
ADDRGP4 addBotsMenuInfo+1312+64
ADDRGP4 $284
ASGNP4
line 306
;305:
;306:		   addBotsMenuInfo.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 addBotsMenuInfo+1404
CNSTI4 6
ASGNI4
line 307
;307:		   addBotsMenuInfo.back.generic.name     = ART_BACK0;
ADDRGP4 addBotsMenuInfo+1404+4
ADDRGP4 $288
ASGNP4
line 308
;308:		   addBotsMenuInfo.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 addBotsMenuInfo+1404+44
CNSTU4 260
ASGNU4
line 309
;309:		   addBotsMenuInfo.back.generic.id       = ID_BACK;
ADDRGP4 addBotsMenuInfo+1404+8
CNSTI4 10
ASGNI4
line 310
;310:		   addBotsMenuInfo.back.generic.callback = UI_AddBotsMenu_BackEvent;
ADDRGP4 addBotsMenuInfo+1404+48
ADDRGP4 UI_AddBotsMenu_BackEvent
ASGNP4
line 311
;311:		   addBotsMenuInfo.back.generic.x        = 320 - 128;
ADDRGP4 addBotsMenuInfo+1404+12
CNSTI4 192
ASGNI4
line 312
;312:		   addBotsMenuInfo.back.generic.y        = 256 + 128 - 64;
ADDRGP4 addBotsMenuInfo+1404+16
CNSTI4 320
ASGNI4
line 313
;313:		   addBotsMenuInfo.back.width            = 128;
ADDRGP4 addBotsMenuInfo+1404+80
CNSTI4 128
ASGNI4
line 314
;314:		   addBotsMenuInfo.back.height           = 64;
ADDRGP4 addBotsMenuInfo+1404+84
CNSTI4 64
ASGNI4
line 315
;315:		   addBotsMenuInfo.back.focuspic         = ART_BACK1;
ADDRGP4 addBotsMenuInfo+1404+64
ADDRGP4 $305
ASGNP4
line 317
;316:
;317:		   addBotsMenuInfo.baseBotNum     = 0;
ADDRGP4 addBotsMenuInfo+1504
CNSTI4 0
ASGNI4
line 318
;318:		   addBotsMenuInfo.selectedBotNum = 0;
ADDRGP4 addBotsMenuInfo+1508
CNSTI4 0
ASGNI4
line 319
;319:		   addBotsMenuInfo.bots[0].color  = color_white;
ADDRGP4 addBotsMenuInfo+564+72
ADDRGP4 color_white
ASGNP4
line 321
;320:
;321:		   UI_AddBotsMenu_GetSortedBotNums();
ADDRGP4 UI_AddBotsMenu_GetSortedBotNums
CALLV
pop
line 322
;322:		   UI_AddBotsMenu_SetBotNames();
ADDRGP4 UI_AddBotsMenu_SetBotNames
CALLV
pop
line 324
;323:
;324:		   Menu_AddItem(&addBotsMenuInfo.menu, &addBotsMenuInfo.arrows);
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 326
;325:
;326:		   Menu_AddItem(&addBotsMenuInfo.menu, &addBotsMenuInfo.up);
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+380
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 327
;327:		   Menu_AddItem(&addBotsMenuInfo.menu, &addBotsMenuInfo.down);
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+472
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 328
;328:		   for (n = 0; n < count; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $316
JUMPV
LABELV $313
line 329
;329:			   Menu_AddItem(&addBotsMenuInfo.menu, &addBotsMenuInfo.bots[n]);
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 76
MULI4
ADDRGP4 addBotsMenuInfo+564
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 330
;330:    }
LABELV $314
line 328
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $316
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $313
line 331
;331:		   Menu_AddItem(&addBotsMenuInfo.menu, &addBotsMenuInfo.skill);
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+1096
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 332
;332:		   Menu_AddItem(&addBotsMenuInfo.menu, &addBotsMenuInfo.team);
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+1204
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 333
;333:		   Menu_AddItem(&addBotsMenuInfo.menu, &addBotsMenuInfo.go);
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+1312
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 334
;334:		   Menu_AddItem(&addBotsMenuInfo.menu, &addBotsMenuInfo.back);
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 addBotsMenuInfo+1404
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 335
;335:}
LABELV $143
endproc UI_AddBotsMenu_Init 36 12
export UI_AddBots_Cache
proc UI_AddBots_Cache 0 4
line 342
;336:
;337:/*
;338:=================
;339:UI_AddBots_Cache
;340:=================
;341:*/
;342:void UI_AddBots_Cache(void) {
line 343
;343:	trap_R_RegisterShaderNoMip(ART_BACK0);
ADDRGP4 $288
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 344
;344:	trap_R_RegisterShaderNoMip(ART_BACK1);
ADDRGP4 $305
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 345
;345:	trap_R_RegisterShaderNoMip(ART_FIGHT0);
ADDRGP4 $267
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 346
;346:	trap_R_RegisterShaderNoMip(ART_FIGHT1);
ADDRGP4 $284
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 347
;347:	trap_R_RegisterShaderNoMip(ART_BACKGROUND);
ADDRGP4 $134
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 348
;348:	trap_R_RegisterShaderNoMip(ART_ARROWS);
ADDRGP4 $158
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 349
;349:	trap_R_RegisterShaderNoMip(ART_ARROWUP);
ADDRGP4 $186
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 350
;350:	trap_R_RegisterShaderNoMip(ART_ARROWDOWN);
ADDRGP4 $204
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 351
;351:}
LABELV $322
endproc UI_AddBots_Cache 0 4
export UI_AddBotsMenu
proc UI_AddBotsMenu 0 4
line 358
;352:
;353:/*
;354:=================
;355:UI_AddBotsMenu
;356:=================
;357:*/
;358:void UI_AddBotsMenu(void) {
line 359
;359:	UI_AddBotsMenu_Init();
ADDRGP4 UI_AddBotsMenu_Init
CALLV
pop
line 360
;360:	UI_PushMenu(&addBotsMenuInfo.menu);
ADDRGP4 addBotsMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 361
;361:}
LABELV $323
endproc UI_AddBotsMenu 0 4
bss
align 4
LABELV addBotsMenuInfo
skip 5832
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
LABELV $305
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
LABELV $288
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
LABELV $284
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $267
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
byte 1 99
byte 1 99
byte 1 101
byte 1 112
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $253
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
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
LABELV $236
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $204
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
LABELV $186
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
LABELV $158
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
LABELV $144
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
LABELV $142
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $141
byte 1 82
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $140
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $139
byte 1 78
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 114
byte 1 101
byte 1 33
byte 1 0
align 1
LABELV $138
byte 1 72
byte 1 97
byte 1 114
byte 1 100
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $137
byte 1 72
byte 1 117
byte 1 114
byte 1 116
byte 1 32
byte 1 77
byte 1 101
byte 1 32
byte 1 80
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $136
byte 1 66
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 73
byte 1 116
byte 1 32
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $135
byte 1 73
byte 1 32
byte 1 67
byte 1 97
byte 1 110
byte 1 32
byte 1 87
byte 1 105
byte 1 110
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
LABELV $133
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 66
byte 1 79
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $104
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $78
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
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
