code
proc InGame_RestartAction 0 8
file "../../../../code/q3_ui/ui_ingame.c"
line 51
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:INGAME MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:#define INGAME_FRAME                 "menu/art/addbotframe"
;14://#define INGAME_FRAME					"menu/art/cut_frame"
;15:#define INGAME_MENU_VERTICAL_SPACING 28
;16:
;17:#define ID_TEAM       10
;18:#define ID_ADDBOTS    11
;19:#define ID_REMOVEBOTS 12
;20:#define ID_SETUP      13
;21:#define ID_SERVERINFO 14
;22:#define ID_LEAVEARENA 15
;23:#define ID_RESTART    16
;24:#define ID_QUIT       17
;25:#define ID_RESUME     18
;26:#define ID_TEAMORDERS 19
;27:
;28:typedef struct {
;29:	menuframework_s menu;
;30:
;31:	menubitmap_s    frame;
;32:	menutext_s      team;
;33:	menutext_s      setup;
;34:	menutext_s      server;
;35:	menutext_s      leave;
;36:	menutext_s      restart;
;37:	menutext_s      addbots;
;38:	menutext_s      removebots;
;39:	menutext_s      teamorders;
;40:	menutext_s      quit;
;41:	menutext_s      resume;
;42:} ingamemenu_t;
;43:
;44:static ingamemenu_t s_ingame;
;45:
;46:/*
;47:=================
;48:InGame_RestartAction
;49:=================
;50:*/
;51:static void InGame_RestartAction(qboolean result) {
line 52
;52:	if (!result) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $70
line 53
;53:		return;
ADDRGP4 $69
JUMPV
LABELV $70
line 56
;54:	}
;55:
;56:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 57
;57:	trap_Cmd_ExecuteText(EXEC_APPEND, "map_restart 0\n");
CNSTI4 2
ARGI4
ADDRGP4 $72
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 58
;58:}
LABELV $69
endproc InGame_RestartAction 0 8
proc InGame_QuitAction 0 0
line 65
;59:
;60:/*
;61:=================
;62:InGame_QuitAction
;63:=================
;64:*/
;65:static void InGame_QuitAction(qboolean result) {
line 66
;66:	if (!result) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $74
line 67
;67:		return;
ADDRGP4 $73
JUMPV
LABELV $74
line 69
;68:	}
;69:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 70
;70:	UI_CreditMenu();
ADDRGP4 UI_CreditMenu
CALLV
pop
line 71
;71:}
LABELV $73
endproc InGame_QuitAction 0 0
export InGame_Event
proc InGame_Event 8 12
line 78
;72:
;73:/*
;74:=================
;75:InGame_Event
;76:=================
;77:*/
;78:void InGame_Event(void* ptr, int notification) {
line 79
;79:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $77
line 80
;80:		return;
ADDRGP4 $76
JUMPV
LABELV $77
line 83
;81:	}
;82:
;83:	switch (((menucommon_s*)ptr)->id) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $79
ADDRLP4 0
INDIRI4
CNSTI4 19
GTI4 $79
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $95-40
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $95
address $82
address $91
address $92
address $83
address $90
address $84
address $86
address $88
address $94
address $93
code
LABELV $82
line 85
;84:	case ID_TEAM:
;85:		UI_TeamMainMenu();
ADDRGP4 UI_TeamMainMenu
CALLV
pop
line 86
;86:		break;
ADDRGP4 $80
JUMPV
LABELV $83
line 89
;87:
;88:	case ID_SETUP:
;89:		UI_SetupMenu();
ADDRGP4 UI_SetupMenu
CALLV
pop
line 90
;90:		break;
ADDRGP4 $80
JUMPV
LABELV $84
line 93
;91:
;92:	case ID_LEAVEARENA:
;93:		trap_Cmd_ExecuteText(EXEC_APPEND, "disconnect\n");
CNSTI4 2
ARGI4
ADDRGP4 $85
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 94
;94:		break;
ADDRGP4 $80
JUMPV
LABELV $86
line 97
;95:
;96:	case ID_RESTART:
;97:		UI_ConfirmMenu("RESTART ARENA?", (voidfunc_f)0, InGame_RestartAction);
ADDRGP4 $87
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_RestartAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 98
;98:		break;
ADDRGP4 $80
JUMPV
LABELV $88
line 101
;99:
;100:	case ID_QUIT:
;101:		UI_ConfirmMenu("EXIT GAME?", (voidfunc_f)0, InGame_QuitAction);
ADDRGP4 $89
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 InGame_QuitAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 102
;102:		break;
ADDRGP4 $80
JUMPV
LABELV $90
line 105
;103:
;104:	case ID_SERVERINFO:
;105:		UI_ServerInfoMenu();
ADDRGP4 UI_ServerInfoMenu
CALLV
pop
line 106
;106:		break;
ADDRGP4 $80
JUMPV
LABELV $91
line 109
;107:
;108:	case ID_ADDBOTS:
;109:		UI_AddBotsMenu();
ADDRGP4 UI_AddBotsMenu
CALLV
pop
line 110
;110:		break;
ADDRGP4 $80
JUMPV
LABELV $92
line 113
;111:
;112:	case ID_REMOVEBOTS:
;113:		UI_RemoveBotsMenu();
ADDRGP4 UI_RemoveBotsMenu
CALLV
pop
line 114
;114:		break;
ADDRGP4 $80
JUMPV
LABELV $93
line 117
;115:
;116:	case ID_TEAMORDERS:
;117:		UI_TeamOrdersMenu();
ADDRGP4 UI_TeamOrdersMenu
CALLV
pop
line 118
;118:		break;
ADDRGP4 $80
JUMPV
LABELV $94
line 121
;119:
;120:	case ID_RESUME:
;121:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 122
;122:		break;
LABELV $79
LABELV $80
line 124
;123:	}
;124:}
LABELV $76
endproc InGame_Event 8 12
export InGame_MenuInit
proc InGame_MenuInit 4156 12
line 131
;125:
;126:/*
;127:=================
;128:InGame_MenuInit
;129:=================
;130:*/
;131:void InGame_MenuInit(void) {
line 137
;132:	int             y;
;133:	uiClientState_t cs;
;134:	char            info[MAX_INFO_STRING];
;135:	int             team;
;136:
;137:	memset(&s_ingame, 0, sizeof(ingamemenu_t));
ADDRGP4 s_ingame
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 139
;138:
;139:	InGame_Cache();
ADDRGP4 InGame_Cache
CALLV
pop
line 141
;140:
;141:	s_ingame.menu.wrapAround = qtrue;
ADDRGP4 s_ingame+276
CNSTI4 1
ASGNI4
line 142
;142:	s_ingame.menu.fullscreen = qfalse;
ADDRGP4 s_ingame+280
CNSTI4 0
ASGNI4
line 144
;143:
;144:	s_ingame.frame.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_ingame+288
CNSTI4 6
ASGNI4
line 145
;145:	s_ingame.frame.generic.flags = QMF_INACTIVE;
ADDRGP4 s_ingame+288+44
CNSTU4 16384
ASGNU4
line 146
;146:	s_ingame.frame.generic.name  = INGAME_FRAME;
ADDRGP4 s_ingame+288+4
ADDRGP4 $105
ASGNP4
line 147
;147:	s_ingame.frame.generic.x     = 320 - 233;  // 142;
ADDRGP4 s_ingame+288+12
CNSTI4 87
ASGNI4
line 148
;148:	s_ingame.frame.generic.y     = 240 - 166;  // 118;
ADDRGP4 s_ingame+288+16
CNSTI4 74
ASGNI4
line 149
;149:	s_ingame.frame.width         = 466;        // 359;
ADDRGP4 s_ingame+288+80
CNSTI4 466
ASGNI4
line 150
;150:	s_ingame.frame.height        = 332;        // 256;
ADDRGP4 s_ingame+288+84
CNSTI4 332
ASGNI4
line 153
;151:
;152:	// y = 96;
;153:	y                              = 88;
ADDRLP4 0
CNSTI4 88
ASGNI4
line 154
;154:	s_ingame.team.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_ingame+380
CNSTI4 9
ASGNI4
line 155
;155:	s_ingame.team.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+380+44
CNSTU4 264
ASGNU4
line 156
;156:	s_ingame.team.generic.x        = 320;
ADDRGP4 s_ingame+380+12
CNSTI4 320
ASGNI4
line 157
;157:	s_ingame.team.generic.y        = y;
ADDRGP4 s_ingame+380+16
ADDRLP4 0
INDIRI4
ASGNI4
line 158
;158:	s_ingame.team.generic.id       = ID_TEAM;
ADDRGP4 s_ingame+380+8
CNSTI4 10
ASGNI4
line 159
;159:	s_ingame.team.generic.callback = InGame_Event;
ADDRGP4 s_ingame+380+48
ADDRGP4 InGame_Event
ASGNP4
line 160
;160:	s_ingame.team.string           = "START";
ADDRGP4 s_ingame+380+64
ADDRGP4 $127
ASGNP4
line 161
;161:	s_ingame.team.color            = color_red;
ADDRGP4 s_ingame+380+72
ADDRGP4 color_red
ASGNP4
line 162
;162:	s_ingame.team.style            = UI_CENTER | UI_SMALLFONT;
ADDRGP4 s_ingame+380+68
CNSTI4 17
ASGNI4
line 164
;163:
;164:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 165
;165:	s_ingame.addbots.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_ingame+760
CNSTI4 9
ASGNI4
line 166
;166:	s_ingame.addbots.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+760+44
CNSTU4 264
ASGNU4
line 167
;167:	s_ingame.addbots.generic.x        = 320;
ADDRGP4 s_ingame+760+12
CNSTI4 320
ASGNI4
line 168
;168:	s_ingame.addbots.generic.y        = y;
ADDRGP4 s_ingame+760+16
ADDRLP4 0
INDIRI4
ASGNI4
line 169
;169:	s_ingame.addbots.generic.id       = ID_ADDBOTS;
ADDRGP4 s_ingame+760+8
CNSTI4 11
ASGNI4
line 170
;170:	s_ingame.addbots.generic.callback = InGame_Event;
ADDRGP4 s_ingame+760+48
ADDRGP4 InGame_Event
ASGNP4
line 171
;171:	s_ingame.addbots.string           = "ADD BOTS";
ADDRGP4 s_ingame+760+64
ADDRGP4 $145
ASGNP4
line 172
;172:	s_ingame.addbots.color            = color_red;
ADDRGP4 s_ingame+760+72
ADDRGP4 color_red
ASGNP4
line 173
;173:	s_ingame.addbots.style            = UI_CENTER | UI_SMALLFONT;
ADDRGP4 s_ingame+760+68
CNSTI4 17
ASGNI4
line 175
;174:
;175:	if (!trap_Cvar_VariableValue("sv_running") || !trap_Cvar_VariableValue("bot_enable") || trap_Cvar_VariableValue("ui_gametype") == GT_SINGLE_PLAYER) {
ADDRGP4 $152
ARGP4
ADDRLP4 4116
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4116
INDIRF4
CNSTF4 0
EQF4 $156
ADDRGP4 $153
ARGP4
ADDRLP4 4120
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4120
INDIRF4
CNSTF4 0
EQF4 $156
ADDRGP4 $154
ARGP4
ADDRLP4 4124
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4124
INDIRF4
CNSTF4 1073741824
NEF4 $150
LABELV $156
line 176
;176:		s_ingame.addbots.generic.flags |= QMF_GRAYED;
ADDRLP4 4128
ADDRGP4 s_ingame+760+44
ASGNP4
ADDRLP4 4128
INDIRP4
ADDRLP4 4128
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 177
;177:	}
LABELV $150
line 179
;178:
;179:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 180
;180:	s_ingame.removebots.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_ingame+836
CNSTI4 9
ASGNI4
line 181
;181:	s_ingame.removebots.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+836+44
CNSTU4 264
ASGNU4
line 182
;182:	s_ingame.removebots.generic.x        = 320;
ADDRGP4 s_ingame+836+12
CNSTI4 320
ASGNI4
line 183
;183:	s_ingame.removebots.generic.y        = y;
ADDRGP4 s_ingame+836+16
ADDRLP4 0
INDIRI4
ASGNI4
line 184
;184:	s_ingame.removebots.generic.id       = ID_REMOVEBOTS;
ADDRGP4 s_ingame+836+8
CNSTI4 12
ASGNI4
line 185
;185:	s_ingame.removebots.generic.callback = InGame_Event;
ADDRGP4 s_ingame+836+48
ADDRGP4 InGame_Event
ASGNP4
line 186
;186:	s_ingame.removebots.string           = "REMOVE BOTS";
ADDRGP4 s_ingame+836+64
ADDRGP4 $172
ASGNP4
line 187
;187:	s_ingame.removebots.color            = color_red;
ADDRGP4 s_ingame+836+72
ADDRGP4 color_red
ASGNP4
line 188
;188:	s_ingame.removebots.style            = UI_CENTER | UI_SMALLFONT;
ADDRGP4 s_ingame+836+68
CNSTI4 17
ASGNI4
line 190
;189:
;190:	if (!trap_Cvar_VariableValue("sv_running") || !trap_Cvar_VariableValue("bot_enable") || trap_Cvar_VariableValue("ui_gametype") == GT_SINGLE_PLAYER) {
ADDRGP4 $152
ARGP4
ADDRLP4 4128
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4128
INDIRF4
CNSTF4 0
EQF4 $180
ADDRGP4 $153
ARGP4
ADDRLP4 4132
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4132
INDIRF4
CNSTF4 0
EQF4 $180
ADDRGP4 $154
ARGP4
ADDRLP4 4136
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4136
INDIRF4
CNSTF4 1073741824
NEF4 $177
LABELV $180
line 191
;191:		s_ingame.removebots.generic.flags |= QMF_GRAYED;
ADDRLP4 4140
ADDRGP4 s_ingame+836+44
ASGNP4
ADDRLP4 4140
INDIRP4
ADDRLP4 4140
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 192
;192:	}
LABELV $177
line 194
;193:
;194:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 195
;195:	s_ingame.teamorders.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_ingame+912
CNSTI4 9
ASGNI4
line 196
;196:	s_ingame.teamorders.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+912+44
CNSTU4 264
ASGNU4
line 197
;197:	s_ingame.teamorders.generic.x        = 320;
ADDRGP4 s_ingame+912+12
CNSTI4 320
ASGNI4
line 198
;198:	s_ingame.teamorders.generic.y        = y;
ADDRGP4 s_ingame+912+16
ADDRLP4 0
INDIRI4
ASGNI4
line 199
;199:	s_ingame.teamorders.generic.id       = ID_TEAMORDERS;
ADDRGP4 s_ingame+912+8
CNSTI4 19
ASGNI4
line 200
;200:	s_ingame.teamorders.generic.callback = InGame_Event;
ADDRGP4 s_ingame+912+48
ADDRGP4 InGame_Event
ASGNP4
line 201
;201:	s_ingame.teamorders.string           = "TEAM ORDERS";
ADDRGP4 s_ingame+912+64
ADDRGP4 $196
ASGNP4
line 202
;202:	s_ingame.teamorders.color            = color_red;
ADDRGP4 s_ingame+912+72
ADDRGP4 color_red
ASGNP4
line 203
;203:	s_ingame.teamorders.style            = UI_CENTER | UI_SMALLFONT;
ADDRGP4 s_ingame+912+68
CNSTI4 17
ASGNI4
line 205
;204:
;205:	if (trap_Cvar_VariableValue("ui_gametype") < GT_TEAM) {
ADDRGP4 $154
ARGP4
ADDRLP4 4140
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4140
INDIRF4
CNSTF4 1077936128
GEF4 $201
line 206
;206:		s_ingame.teamorders.generic.flags |= QMF_GRAYED;
ADDRLP4 4144
ADDRGP4 s_ingame+912+44
ASGNP4
ADDRLP4 4144
INDIRP4
ADDRLP4 4144
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 207
;207:	} else {
ADDRGP4 $202
JUMPV
LABELV $201
line 208
;208:		trap_GetClientState(&cs);
ADDRLP4 4
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 209
;209:		trap_GetConfigString(CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING);
ADDRLP4 4+8
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 3088
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 210
;210:		team = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 3088
ARGP4
ADDRGP4 $206
ARGP4
ADDRLP4 4144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4144
INDIRP4
ARGP4
ADDRLP4 4148
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4112
ADDRLP4 4148
INDIRI4
ASGNI4
line 211
;211:		if (team == TEAM_SPECTATOR) {
ADDRLP4 4112
INDIRI4
CNSTI4 3
NEI4 $207
line 212
;212:			s_ingame.teamorders.generic.flags |= QMF_GRAYED;
ADDRLP4 4152
ADDRGP4 s_ingame+912+44
ASGNP4
ADDRLP4 4152
INDIRP4
ADDRLP4 4152
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 213
;213:		}
LABELV $207
line 214
;214:	}
LABELV $202
line 216
;215:
;216:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 217
;217:	s_ingame.setup.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_ingame+456
CNSTI4 9
ASGNI4
line 218
;218:	s_ingame.setup.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+456+44
CNSTU4 264
ASGNU4
line 219
;219:	s_ingame.setup.generic.x        = 320;
ADDRGP4 s_ingame+456+12
CNSTI4 320
ASGNI4
line 220
;220:	s_ingame.setup.generic.y        = y;
ADDRGP4 s_ingame+456+16
ADDRLP4 0
INDIRI4
ASGNI4
line 221
;221:	s_ingame.setup.generic.id       = ID_SETUP;
ADDRGP4 s_ingame+456+8
CNSTI4 13
ASGNI4
line 222
;222:	s_ingame.setup.generic.callback = InGame_Event;
ADDRGP4 s_ingame+456+48
ADDRGP4 InGame_Event
ASGNP4
line 223
;223:	s_ingame.setup.string           = "SETUP";
ADDRGP4 s_ingame+456+64
ADDRGP4 $224
ASGNP4
line 224
;224:	s_ingame.setup.color            = color_red;
ADDRGP4 s_ingame+456+72
ADDRGP4 color_red
ASGNP4
line 225
;225:	s_ingame.setup.style            = UI_CENTER | UI_SMALLFONT;
ADDRGP4 s_ingame+456+68
CNSTI4 17
ASGNI4
line 227
;226:
;227:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 228
;228:	s_ingame.server.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_ingame+532
CNSTI4 9
ASGNI4
line 229
;229:	s_ingame.server.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+532+44
CNSTU4 264
ASGNU4
line 230
;230:	s_ingame.server.generic.x        = 320;
ADDRGP4 s_ingame+532+12
CNSTI4 320
ASGNI4
line 231
;231:	s_ingame.server.generic.y        = y;
ADDRGP4 s_ingame+532+16
ADDRLP4 0
INDIRI4
ASGNI4
line 232
;232:	s_ingame.server.generic.id       = ID_SERVERINFO;
ADDRGP4 s_ingame+532+8
CNSTI4 14
ASGNI4
line 233
;233:	s_ingame.server.generic.callback = InGame_Event;
ADDRGP4 s_ingame+532+48
ADDRGP4 InGame_Event
ASGNP4
line 234
;234:	s_ingame.server.string           = "SERVER INFO";
ADDRGP4 s_ingame+532+64
ADDRGP4 $242
ASGNP4
line 235
;235:	s_ingame.server.color            = color_red;
ADDRGP4 s_ingame+532+72
ADDRGP4 color_red
ASGNP4
line 236
;236:	s_ingame.server.style            = UI_CENTER | UI_SMALLFONT;
ADDRGP4 s_ingame+532+68
CNSTI4 17
ASGNI4
line 238
;237:
;238:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 239
;239:	s_ingame.restart.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_ingame+684
CNSTI4 9
ASGNI4
line 240
;240:	s_ingame.restart.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+684+44
CNSTU4 264
ASGNU4
line 241
;241:	s_ingame.restart.generic.x        = 320;
ADDRGP4 s_ingame+684+12
CNSTI4 320
ASGNI4
line 242
;242:	s_ingame.restart.generic.y        = y;
ADDRGP4 s_ingame+684+16
ADDRLP4 0
INDIRI4
ASGNI4
line 243
;243:	s_ingame.restart.generic.id       = ID_RESTART;
ADDRGP4 s_ingame+684+8
CNSTI4 16
ASGNI4
line 244
;244:	s_ingame.restart.generic.callback = InGame_Event;
ADDRGP4 s_ingame+684+48
ADDRGP4 InGame_Event
ASGNP4
line 245
;245:	s_ingame.restart.string           = "RESTART ARENA";
ADDRGP4 s_ingame+684+64
ADDRGP4 $260
ASGNP4
line 246
;246:	s_ingame.restart.color            = color_red;
ADDRGP4 s_ingame+684+72
ADDRGP4 color_red
ASGNP4
line 247
;247:	s_ingame.restart.style            = UI_CENTER | UI_SMALLFONT;
ADDRGP4 s_ingame+684+68
CNSTI4 17
ASGNI4
line 248
;248:	if (!trap_Cvar_VariableValue("sv_running")) {
ADDRGP4 $152
ARGP4
ADDRLP4 4144
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4144
INDIRF4
CNSTF4 0
NEF4 $265
line 249
;249:		s_ingame.restart.generic.flags |= QMF_GRAYED;
ADDRLP4 4148
ADDRGP4 s_ingame+684+44
ASGNP4
ADDRLP4 4148
INDIRP4
ADDRLP4 4148
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 250
;250:	}
LABELV $265
line 252
;251:
;252:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 253
;253:	s_ingame.resume.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_ingame+1064
CNSTI4 9
ASGNI4
line 254
;254:	s_ingame.resume.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+1064+44
CNSTU4 264
ASGNU4
line 255
;255:	s_ingame.resume.generic.x        = 320;
ADDRGP4 s_ingame+1064+12
CNSTI4 320
ASGNI4
line 256
;256:	s_ingame.resume.generic.y        = y;
ADDRGP4 s_ingame+1064+16
ADDRLP4 0
INDIRI4
ASGNI4
line 257
;257:	s_ingame.resume.generic.id       = ID_RESUME;
ADDRGP4 s_ingame+1064+8
CNSTI4 18
ASGNI4
line 258
;258:	s_ingame.resume.generic.callback = InGame_Event;
ADDRGP4 s_ingame+1064+48
ADDRGP4 InGame_Event
ASGNP4
line 259
;259:	s_ingame.resume.string           = "RESUME GAME";
ADDRGP4 s_ingame+1064+64
ADDRGP4 $282
ASGNP4
line 260
;260:	s_ingame.resume.color            = color_red;
ADDRGP4 s_ingame+1064+72
ADDRGP4 color_red
ASGNP4
line 261
;261:	s_ingame.resume.style            = UI_CENTER | UI_SMALLFONT;
ADDRGP4 s_ingame+1064+68
CNSTI4 17
ASGNI4
line 263
;262:
;263:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 264
;264:	s_ingame.leave.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_ingame+608
CNSTI4 9
ASGNI4
line 265
;265:	s_ingame.leave.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+608+44
CNSTU4 264
ASGNU4
line 266
;266:	s_ingame.leave.generic.x        = 320;
ADDRGP4 s_ingame+608+12
CNSTI4 320
ASGNI4
line 267
;267:	s_ingame.leave.generic.y        = y;
ADDRGP4 s_ingame+608+16
ADDRLP4 0
INDIRI4
ASGNI4
line 268
;268:	s_ingame.leave.generic.id       = ID_LEAVEARENA;
ADDRGP4 s_ingame+608+8
CNSTI4 15
ASGNI4
line 269
;269:	s_ingame.leave.generic.callback = InGame_Event;
ADDRGP4 s_ingame+608+48
ADDRGP4 InGame_Event
ASGNP4
line 270
;270:	s_ingame.leave.string           = "LEAVE ARENA";
ADDRGP4 s_ingame+608+64
ADDRGP4 $300
ASGNP4
line 271
;271:	s_ingame.leave.color            = color_red;
ADDRGP4 s_ingame+608+72
ADDRGP4 color_red
ASGNP4
line 272
;272:	s_ingame.leave.style            = UI_CENTER | UI_SMALLFONT;
ADDRGP4 s_ingame+608+68
CNSTI4 17
ASGNI4
line 274
;273:
;274:	y += INGAME_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 28
ADDI4
ASGNI4
line 275
;275:	s_ingame.quit.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_ingame+988
CNSTI4 9
ASGNI4
line 276
;276:	s_ingame.quit.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_ingame+988+44
CNSTU4 264
ASGNU4
line 277
;277:	s_ingame.quit.generic.x        = 320;
ADDRGP4 s_ingame+988+12
CNSTI4 320
ASGNI4
line 278
;278:	s_ingame.quit.generic.y        = y;
ADDRGP4 s_ingame+988+16
ADDRLP4 0
INDIRI4
ASGNI4
line 279
;279:	s_ingame.quit.generic.id       = ID_QUIT;
ADDRGP4 s_ingame+988+8
CNSTI4 17
ASGNI4
line 280
;280:	s_ingame.quit.generic.callback = InGame_Event;
ADDRGP4 s_ingame+988+48
ADDRGP4 InGame_Event
ASGNP4
line 281
;281:	s_ingame.quit.string           = "EXIT GAME";
ADDRGP4 s_ingame+988+64
ADDRGP4 $318
ASGNP4
line 282
;282:	s_ingame.quit.color            = color_red;
ADDRGP4 s_ingame+988+72
ADDRGP4 color_red
ASGNP4
line 283
;283:	s_ingame.quit.style            = UI_CENTER | UI_SMALLFONT;
ADDRGP4 s_ingame+988+68
CNSTI4 17
ASGNI4
line 285
;284:
;285:	Menu_AddItem(&s_ingame.menu, &s_ingame.frame);
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 286
;286:	Menu_AddItem(&s_ingame.menu, &s_ingame.team);
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+380
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 287
;287:	Menu_AddItem(&s_ingame.menu, &s_ingame.addbots);
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+760
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 288
;288:	Menu_AddItem(&s_ingame.menu, &s_ingame.removebots);
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+836
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 289
;289:	Menu_AddItem(&s_ingame.menu, &s_ingame.teamorders);
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+912
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 290
;290:	Menu_AddItem(&s_ingame.menu, &s_ingame.setup);
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 291
;291:	Menu_AddItem(&s_ingame.menu, &s_ingame.server);
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+532
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 292
;292:	Menu_AddItem(&s_ingame.menu, &s_ingame.restart);
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+684
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 293
;293:	Menu_AddItem(&s_ingame.menu, &s_ingame.resume);
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+1064
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 294
;294:	Menu_AddItem(&s_ingame.menu, &s_ingame.leave);
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+608
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 295
;295:	Menu_AddItem(&s_ingame.menu, &s_ingame.quit);
ADDRGP4 s_ingame
ARGP4
ADDRGP4 s_ingame+988
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 296
;296:}
LABELV $97
endproc InGame_MenuInit 4156 12
export InGame_Cache
proc InGame_Cache 0 4
line 303
;297:
;298:/*
;299:=================
;300:InGame_Cache
;301:=================
;302:*/
;303:void InGame_Cache(void) {
line 304
;304:	trap_R_RegisterShaderNoMip(INGAME_FRAME);
ADDRGP4 $105
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 305
;305:}
LABELV $334
endproc InGame_Cache 0 4
export UI_InGameMenu
proc UI_InGameMenu 0 4
line 312
;306:
;307:/*
;308:=================
;309:UI_InGameMenu
;310:=================
;311:*/
;312:void UI_InGameMenu(void) {
line 314
;313:	// force as top level menu
;314:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 317
;315:
;316:	// set menu cursor to a nice location
;317:	uis.cursorx = 319.0;
ADDRGP4 uis+8
CNSTF4 1134526464
ASGNF4
line 318
;318:	uis.cursory = 80.0;
ADDRGP4 uis+12
CNSTF4 1117782016
ASGNF4
line 320
;319:
;320:	InGame_MenuInit();
ADDRGP4 InGame_MenuInit
CALLV
pop
line 321
;321:	UI_PushMenu(&s_ingame.menu);
ADDRGP4 s_ingame
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 322
;322:}
LABELV $335
endproc UI_InGameMenu 0 4
bss
align 4
LABELV s_ingame
skip 1140
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
LABELV $318
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $300
byte 1 76
byte 1 69
byte 1 65
byte 1 86
byte 1 69
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 0
align 1
LABELV $282
byte 1 82
byte 1 69
byte 1 83
byte 1 85
byte 1 77
byte 1 69
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $260
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 0
align 1
LABELV $242
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 32
byte 1 73
byte 1 78
byte 1 70
byte 1 79
byte 1 0
align 1
LABELV $224
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $206
byte 1 116
byte 1 0
align 1
LABELV $196
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 79
byte 1 82
byte 1 68
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $172
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
LABELV $154
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
LABELV $153
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
LABELV $152
byte 1 115
byte 1 118
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
LABELV $145
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
LABELV $127
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 0
align 1
LABELV $105
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
LABELV $89
byte 1 69
byte 1 88
byte 1 73
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 63
byte 1 0
align 1
LABELV $87
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 65
byte 1 82
byte 1 84
byte 1 32
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 63
byte 1 0
align 1
LABELV $85
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
byte 1 10
byte 1 0
align 1
LABELV $72
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
