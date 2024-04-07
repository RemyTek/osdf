data
align 4
LABELV ctfOrders
address $69
address $70
address $71
address $72
address $73
address $74
address $75
byte 4 0
align 4
LABELV ctfMessages
address $76
address $77
address $78
address $79
address $80
address $81
address $82
byte 4 0
align 4
LABELV teamOrders
address $69
address $71
address $83
address $73
address $74
address $75
byte 4 0
align 4
LABELV teamMessages
address $76
address $78
address $84
address $80
address $81
address $82
byte 4 0
code
proc UI_TeamOrdersMenu_BackEvent 0 0
file "../../../../code/q3_ui/ui_teamorders.c"
line 54
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:TEAM ORDERS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:#define ART_FRAME "menu/art/addbotframe"
;14:#define ART_BACK0 "menu/art/back_0"
;15:#define ART_BACK1 "menu/art/back_1"
;16:
;17:#define ID_LIST_BOTS        10
;18:#define ID_LIST_CTF_ORDERS  11
;19:#define ID_LIST_TEAM_ORDERS 12
;20:
;21:typedef struct {
;22:	menuframework_s menu;
;23:
;24:	menutext_s      banner;
;25:	menubitmap_s    frame;
;26:
;27:	menulist_s      list;
;28:
;29:	menubitmap_s    back;
;30:
;31:	int             gametype;
;32:	int             numBots;
;33:	int             selectedBot;
;34:	char*           bots[9];
;35:	char            botNames[9][16];
;36:} teamOrdersMenuInfo_t;
;37:
;38:static teamOrdersMenuInfo_t teamOrdersMenuInfo;
;39:
;40:#define NUM_CTF_ORDERS 7
;41:static const char* ctfOrders[]   = {"I Am the Leader", "Defend the Base", "Follow Me", "Get Enemy Flag", "Camp Here", "Report", "I Relinquish Command", NULL};
;42:static const char* ctfMessages[] = {
;43:	"i am the leader", "%s defend the base", "%s follow me", "%s get enemy flag", "%s camp here", "%s report", "i stop being the leader", NULL};
;44:
;45:#define NUM_TEAM_ORDERS 6
;46:static const char* teamOrders[]   = {"I Am the Leader", "Follow Me", "Roam", "Camp Here", "Report", "I Relinquish Command", NULL};
;47:static const char* teamMessages[] = {"i am the leader", "%s follow me", "%s roam", "%s camp here", "%s report", "i stop being the leader", NULL};
;48:
;49:/*
;50:===============
;51:UI_TeamOrdersMenu_BackEvent
;52:===============
;53:*/
;54:static void UI_TeamOrdersMenu_BackEvent(void* ptr, int event) {
line 55
;55:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $86
line 56
;56:		return;
ADDRGP4 $85
JUMPV
LABELV $86
line 58
;57:	}
;58:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 59
;59:}
LABELV $85
endproc UI_TeamOrdersMenu_BackEvent 0 0
proc UI_TeamOrdersMenu_SetList 4 0
line 66
;60:
;61:/*
;62:===============
;63:UI_TeamOrdersMenu_SetList
;64:===============
;65:*/
;66:static void UI_TeamOrdersMenu_SetList(int id) {
line 67
;67:	switch (id) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
EQI4 $91
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $100
ADDRLP4 0
INDIRI4
CNSTI4 12
EQI4 $107
ADDRGP4 $89
JUMPV
LABELV $89
LABELV $91
line 70
;68:	default:
;69:	case ID_LIST_BOTS:
;70:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+456+8
ADDRFP4 0
INDIRI4
ASGNI4
line 71
;71:		teamOrdersMenuInfo.list.numitems   = teamOrdersMenuInfo.numBots;
ADDRGP4 teamOrdersMenuInfo+456+72
ADDRGP4 teamOrdersMenuInfo+660
INDIRI4
ASGNI4
line 72
;72:		teamOrdersMenuInfo.list.itemnames  = (const char**)teamOrdersMenuInfo.bots;
ADDRGP4 teamOrdersMenuInfo+456+88
ADDRGP4 teamOrdersMenuInfo+668
ASGNP4
line 73
;73:		break;
ADDRGP4 $90
JUMPV
LABELV $100
line 76
;74:
;75:	case ID_LIST_CTF_ORDERS:
;76:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+456+8
ADDRFP4 0
INDIRI4
ASGNI4
line 77
;77:		teamOrdersMenuInfo.list.numitems   = NUM_CTF_ORDERS;
ADDRGP4 teamOrdersMenuInfo+456+72
CNSTI4 7
ASGNI4
line 78
;78:		teamOrdersMenuInfo.list.itemnames  = ctfOrders;
ADDRGP4 teamOrdersMenuInfo+456+88
ADDRGP4 ctfOrders
ASGNP4
line 79
;79:		break;
ADDRGP4 $90
JUMPV
LABELV $107
line 82
;80:
;81:	case ID_LIST_TEAM_ORDERS:
;82:		teamOrdersMenuInfo.list.generic.id = id;
ADDRGP4 teamOrdersMenuInfo+456+8
ADDRFP4 0
INDIRI4
ASGNI4
line 83
;83:		teamOrdersMenuInfo.list.numitems   = NUM_TEAM_ORDERS;
ADDRGP4 teamOrdersMenuInfo+456+72
CNSTI4 6
ASGNI4
line 84
;84:		teamOrdersMenuInfo.list.itemnames  = teamOrders;
ADDRGP4 teamOrdersMenuInfo+456+88
ADDRGP4 teamOrders
ASGNP4
line 85
;85:		break;
LABELV $90
line 88
;86:	}
;87:
;88:	teamOrdersMenuInfo.list.generic.bottom = teamOrdersMenuInfo.list.generic.top + teamOrdersMenuInfo.list.numitems * PROP_HEIGHT;
ADDRGP4 teamOrdersMenuInfo+456+32
ADDRGP4 teamOrdersMenuInfo+456+24
INDIRI4
ADDRGP4 teamOrdersMenuInfo+456+72
INDIRI4
CNSTI4 27
MULI4
ADDI4
ASGNI4
line 89
;89:}
LABELV $88
endproc UI_TeamOrdersMenu_SetList 4 0
export UI_TeamOrdersMenu_Key
proc UI_TeamOrdersMenu_Key 64 16
line 96
;90:
;91:/*
;92:=================
;93:UI_TeamOrdersMenu_Key
;94:=================
;95:*/
;96:sfxHandle_t UI_TeamOrdersMenu_Key(int key) {
line 102
;97:	menulist_s* l;
;98:	int         x;
;99:	int         y;
;100:	int         index;
;101:
;102:	l = (menulist_s*)Menu_ItemAtCursor(&teamOrdersMenuInfo.menu);
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRLP4 16
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 103
;103:	if (l != &teamOrdersMenuInfo.list) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 teamOrdersMenuInfo+456
CVPU4 4
EQU4 $121
line 104
;104:		return Menu_DefaultKey(&teamOrdersMenuInfo.menu, key);
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $120
JUMPV
LABELV $121
line 107
;105:	}
;106:
;107:	switch (key) {
ADDRLP4 20
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 161
EQI4 $132
ADDRLP4 20
INDIRI4
CNSTI4 161
GTI4 $139
LABELV $138
ADDRLP4 24
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 132
EQI4 $132
ADDRLP4 24
INDIRI4
CNSTI4 133
EQI4 $135
ADDRGP4 $124
JUMPV
LABELV $139
ADDRLP4 28
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 167
EQI4 $135
ADDRLP4 28
INDIRI4
CNSTI4 167
LTI4 $124
LABELV $140
ADDRFP4 0
INDIRI4
CNSTI4 178
EQI4 $126
ADDRGP4 $124
JUMPV
LABELV $126
line 109
;108:	case K_MOUSE1:
;109:		x = l->generic.left;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 110
;110:		y = l->generic.top;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 111
;111:		if (UI_CursorInRect(x, y, l->generic.right - x, l->generic.bottom - y)) {
ADDRLP4 32
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 36
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 32
INDIRI4
SUBI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
SUBI4
ARGI4
ADDRLP4 44
ADDRGP4 UI_CursorInRect
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $127
line 112
;112:			index       = (uis.cursory - y) / PROP_HEIGHT;
ADDRLP4 12
ADDRGP4 uis+12
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
CNSTF4 1024963622
MULF4
CVFI4 4
ASGNI4
line 113
;113:			l->oldvalue = l->curvalue;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 114
;114:			l->curvalue = index;
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 116
;115:
;116:			if (l->generic.callback) {
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $130
line 117
;117:				l->generic.callback(l, QM_ACTIVATED);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
CALLV
pop
line 118
;118:				return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $120
JUMPV
LABELV $130
line 120
;119:			}
;120:		}
LABELV $127
line 121
;121:		return menu_null_sound;
ADDRGP4 menu_null_sound
INDIRI4
RETI4
ADDRGP4 $120
JUMPV
LABELV $132
line 125
;122:
;123:	case K_KP_UPARROW:
;124:	case K_UPARROW:
;125:		l->oldvalue = l->curvalue;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 127
;126:
;127:		if (l->curvalue == 0) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 0
NEI4 $133
line 128
;128:			l->curvalue = l->numitems - 1;
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 129
;129:		} else {
ADDRGP4 $134
JUMPV
LABELV $133
line 130
;130:			l->curvalue--;
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 52
INDIRP4
ADDRLP4 52
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 131
;131:		}
LABELV $134
line 132
;132:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $120
JUMPV
LABELV $135
line 136
;133:
;134:	case K_KP_DOWNARROW:
;135:	case K_DOWNARROW:
;136:		l->oldvalue = l->curvalue;
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 138
;137:
;138:		if (l->curvalue == l->numitems - 1) {
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 1
SUBI4
NEI4 $136
line 139
;139:			l->curvalue = 0;
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
CNSTI4 0
ASGNI4
line 140
;140:			;
line 141
;141:		} else {
ADDRGP4 $137
JUMPV
LABELV $136
line 142
;142:			l->curvalue++;
ADDRLP4 60
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
ASGNP4
ADDRLP4 60
INDIRP4
ADDRLP4 60
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 143
;143:		}
LABELV $137
line 144
;144:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $120
JUMPV
LABELV $124
line 147
;145:	}
;146:
;147:	return Menu_DefaultKey(&teamOrdersMenuInfo.menu, key);
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
RETI4
LABELV $120
endproc UI_TeamOrdersMenu_Key 64 16
proc UI_TeamOrdersMenu_ListDraw 36 20
line 155
;148:}
;149:
;150:/*
;151:=================
;152:UI_TeamOrdersMenu_ListDraw
;153:=================
;154:*/
;155:static void UI_TeamOrdersMenu_ListDraw(void* self) {
line 164
;156:	menulist_s* l;
;157:	int         x;
;158:	int         y;
;159:	int         i;
;160:	float*      color;
;161:	qboolean    hasfocus;
;162:	int         style;
;163:
;164:	l = (menulist_s*)self;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 166
;165:
;166:	hasfocus = (l->generic.parent->cursor == l->generic.menuPosition);
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $143
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRGP4 $144
JUMPV
LABELV $143
ADDRLP4 28
CNSTI4 0
ASGNI4
LABELV $144
ADDRLP4 24
ADDRLP4 28
INDIRI4
ASGNI4
line 168
;167:
;168:	x = 320;  // l->generic.x;
ADDRLP4 20
CNSTI4 320
ASGNI4
line 169
;169:	y = l->generic.y;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 170
;170:	for (i = 0; i < l->numitems; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $148
JUMPV
LABELV $145
line 171
;171:		style = UI_LEFT | UI_SMALLFONT | UI_CENTER;
ADDRLP4 8
CNSTI4 17
ASGNI4
line 172
;172:		if (i == l->curvalue) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
NEI4 $149
line 173
;173:			color = color_yellow;
ADDRLP4 16
ADDRGP4 color_yellow
ASGNP4
line 174
;174:			if (hasfocus) {
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $150
line 175
;175:				style |= UI_PULSE;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 176
;176:			}
line 177
;177:		} else {
ADDRGP4 $150
JUMPV
LABELV $149
line 178
;178:			color = color_orange;
ADDRLP4 16
ADDRGP4 color_orange
ASGNP4
line 179
;179:		}
LABELV $150
line 181
;180:
;181:		UI_DrawProportionalString(x, y, l->itemnames[i], style, color);
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 182
;182:		y += PROP_HEIGHT;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 183
;183:	}
LABELV $146
line 170
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $148
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
LTI4 $145
line 184
;184:}
LABELV $141
endproc UI_TeamOrdersMenu_ListDraw 36 20
proc UI_TeamOrdersMenu_ListEvent 268 16
line 191
;185:
;186:/*
;187:===============
;188:UI_TeamOrdersMenu_ListEvent
;189:===============
;190:*/
;191:static void UI_TeamOrdersMenu_ListEvent(void* ptr, int event) {
line 196
;192:	int  id;
;193:	int  selection;
;194:	char message[256];
;195:
;196:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $154
line 197
;197:		return;
ADDRGP4 $153
JUMPV
LABELV $154
line 199
;198:
;199:	id        = ((menulist_s*)ptr)->generic.id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 200
;200:	selection = ((menulist_s*)ptr)->curvalue;
ADDRLP4 260
ADDRFP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
ASGNI4
line 202
;201:
;202:	if (id == ID_LIST_BOTS) {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $156
line 203
;203:		teamOrdersMenuInfo.selectedBot = selection;
ADDRGP4 teamOrdersMenuInfo+664
ADDRLP4 260
INDIRI4
ASGNI4
line 204
;204:		if (teamOrdersMenuInfo.gametype == GT_CTF) {
ADDRGP4 teamOrdersMenuInfo+656
INDIRI4
CNSTI4 4
NEI4 $159
line 205
;205:			UI_TeamOrdersMenu_SetList(ID_LIST_CTF_ORDERS);
CNSTI4 11
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 206
;206:		} else {
ADDRGP4 $153
JUMPV
LABELV $159
line 207
;207:			UI_TeamOrdersMenu_SetList(ID_LIST_TEAM_ORDERS);
CNSTI4 12
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 208
;208:		}
line 209
;209:		return;
ADDRGP4 $153
JUMPV
LABELV $156
line 212
;210:	}
;211:
;212:	if (id == ID_LIST_CTF_ORDERS) {
ADDRLP4 0
INDIRI4
CNSTI4 11
NEI4 $162
line 213
;213:		Com_sprintf(message, sizeof(message), ctfMessages[selection], teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.selectedBot]);
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ctfMessages
ADDP4
INDIRP4
ARGP4
ADDRGP4 teamOrdersMenuInfo+664
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+704
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 214
;214:	} else {
ADDRGP4 $163
JUMPV
LABELV $162
line 215
;215:		Com_sprintf(message, sizeof(message), teamMessages[selection], teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.selectedBot]);
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamMessages
ADDP4
INDIRP4
ARGP4
ADDRGP4 teamOrdersMenuInfo+664
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+704
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 216
;216:	}
LABELV $163
line 218
;217:
;218:	trap_Cmd_ExecuteText(EXEC_APPEND, va("say_team \"%s\"\n", message));
ADDRGP4 $168
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 219
;219:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 220
;220:}
LABELV $153
endproc UI_TeamOrdersMenu_ListEvent 268 16
proc UI_TeamOrdersMenu_BuildBotList 4156 12
line 227
;221:
;222:/*
;223:===============
;224:UI_TeamOrdersMenu_BuildBotList
;225:===============
;226:*/
;227:static void UI_TeamOrdersMenu_BuildBotList(void) {
line 232
;228:	uiClientState_t cs;
;229:	int             numPlayers;
;230:	int             isBot;
;231:	int             n;
;232:	char            playerTeam = '0' + TEAM_SPECTATOR;
ADDRLP4 1033
CNSTI1 51
ASGNI1
line 236
;233:	char            botTeam;
;234:	char            info[MAX_INFO_STRING];
;235:
;236:	for (n = 0; n < 9; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $170
line 237
;237:		teamOrdersMenuInfo.bots[n] = teamOrdersMenuInfo.botNames[n];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 teamOrdersMenuInfo+668
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+704
ADDP4
ASGNP4
line 238
;238:	}
LABELV $171
line 236
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 9
LTI4 $170
line 240
;239:
;240:	trap_GetClientState(&cs);
ADDRLP4 1036
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 242
;241:
;242:	Q_strncpyz(teamOrdersMenuInfo.botNames[0], "Everyone", 16);
ADDRGP4 teamOrdersMenuInfo+704
ARGP4
ADDRGP4 $177
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 243
;243:	teamOrdersMenuInfo.numBots = 1;
ADDRGP4 teamOrdersMenuInfo+660
CNSTI4 1
ASGNI4
line 245
;244:
;245:	trap_GetConfigString(CS_SERVERINFO, info, sizeof(info));
CNSTI4 0
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 246
;246:	numPlayers                  = atoi(Info_ValueForKey(info, "sv_maxclients"));
ADDRLP4 4
ARGP4
ADDRGP4 $179
ARGP4
ADDRLP4 4124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4124
INDIRP4
ARGP4
ADDRLP4 4128
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4120
ADDRLP4 4128
INDIRI4
ASGNI4
line 247
;247:	teamOrdersMenuInfo.gametype = trap_Cvar_VariableValue("ui_gametype");
ADDRGP4 $181
ARGP4
ADDRLP4 4132
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 teamOrdersMenuInfo+656
ADDRLP4 4132
INDIRF4
CVFI4 4
ASGNI4
line 249
;248:
;249:	for (n = 0; n < numPlayers && teamOrdersMenuInfo.numBots < 9; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $185
JUMPV
LABELV $182
line 250
;250:		trap_GetConfigString(CS_PLAYERS + n, info, MAX_INFO_STRING);
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
line 252
;251:
;252:		if (n == cs.clientNum) {
ADDRLP4 0
INDIRI4
ADDRLP4 1036+8
INDIRI4
NEI4 $187
line 253
;253:			playerTeam = *Info_ValueForKey(info, "t");
ADDRLP4 4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 4136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1033
ADDRLP4 4136
INDIRP4
INDIRI1
ASGNI1
line 254
;254:			continue;
ADDRGP4 $183
JUMPV
LABELV $187
line 257
;255:		}
;256:
;257:		isBot = atoi(Info_ValueForKey(info, "skill"));
ADDRLP4 4
ARGP4
ADDRGP4 $191
ARGP4
ADDRLP4 4136
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4136
INDIRP4
ARGP4
ADDRLP4 4140
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 4140
INDIRI4
ASGNI4
line 258
;258:		if (!isBot) {
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $192
line 259
;259:			continue;
ADDRGP4 $183
JUMPV
LABELV $192
line 262
;260:		}
;261:
;262:		botTeam = *Info_ValueForKey(info, "t");
ADDRLP4 4
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 4144
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
ADDRLP4 4144
INDIRP4
INDIRI1
ASGNI1
line 263
;263:		if (botTeam != playerTeam) {
ADDRLP4 1032
INDIRI1
CVII4 1
ADDRLP4 1033
INDIRI1
CVII4 1
EQI4 $194
line 264
;264:			continue;
ADDRGP4 $183
JUMPV
LABELV $194
line 267
;265:		}
;266:
;267:		Q_strncpyz(teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.numBots], Info_ValueForKey(info, "n"), 16);
ADDRLP4 4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 4148
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 teamOrdersMenuInfo+660
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+704
ADDP4
ARGP4
ADDRLP4 4148
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 268
;268:		Q_CleanStr(teamOrdersMenuInfo.botNames[teamOrdersMenuInfo.numBots]);
ADDRGP4 teamOrdersMenuInfo+660
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 teamOrdersMenuInfo+704
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 269
;269:		teamOrdersMenuInfo.numBots++;
ADDRLP4 4152
ADDRGP4 teamOrdersMenuInfo+660
ASGNP4
ADDRLP4 4152
INDIRP4
ADDRLP4 4152
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 270
;270:	}
LABELV $183
line 249
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $185
ADDRLP4 0
INDIRI4
ADDRLP4 4120
INDIRI4
GEI4 $202
ADDRGP4 teamOrdersMenuInfo+660
INDIRI4
CNSTI4 9
LTI4 $182
LABELV $202
line 271
;271:}
LABELV $169
endproc UI_TeamOrdersMenu_BuildBotList 4156 12
proc UI_TeamOrdersMenu_Init 0 12
line 278
;272:
;273:/*
;274:===============
;275:UI_TeamOrdersMenu_Init
;276:===============
;277:*/
;278:static void UI_TeamOrdersMenu_Init(void) {
line 279
;279:	UI_TeamOrdersMenu_Cache();
ADDRGP4 UI_TeamOrdersMenu_Cache
CALLV
pop
line 281
;280:
;281:	memset(&teamOrdersMenuInfo, 0, sizeof(teamOrdersMenuInfo));
ADDRGP4 teamOrdersMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 848
ARGI4
ADDRGP4 memset
CALLP4
pop
line 282
;282:	teamOrdersMenuInfo.menu.fullscreen = qfalse;
ADDRGP4 teamOrdersMenuInfo+280
CNSTI4 0
ASGNI4
line 283
;283:	teamOrdersMenuInfo.menu.key        = UI_TeamOrdersMenu_Key;
ADDRGP4 teamOrdersMenuInfo+272
ADDRGP4 UI_TeamOrdersMenu_Key
ASGNP4
line 285
;284:
;285:	UI_TeamOrdersMenu_BuildBotList();
ADDRGP4 UI_TeamOrdersMenu_BuildBotList
CALLV
pop
line 287
;286:
;287:	teamOrdersMenuInfo.banner.generic.type = MTYPE_BTEXT;
ADDRGP4 teamOrdersMenuInfo+288
CNSTI4 10
ASGNI4
line 288
;288:	teamOrdersMenuInfo.banner.generic.x    = 320;
ADDRGP4 teamOrdersMenuInfo+288+12
CNSTI4 320
ASGNI4
line 289
;289:	teamOrdersMenuInfo.banner.generic.y    = 16;
ADDRGP4 teamOrdersMenuInfo+288+16
CNSTI4 16
ASGNI4
line 290
;290:	teamOrdersMenuInfo.banner.string       = "TEAM ORDERS";
ADDRGP4 teamOrdersMenuInfo+288+64
ADDRGP4 $213
ASGNP4
line 291
;291:	teamOrdersMenuInfo.banner.color        = color_white;
ADDRGP4 teamOrdersMenuInfo+288+72
ADDRGP4 color_white
ASGNP4
line 292
;292:	teamOrdersMenuInfo.banner.style        = UI_CENTER;
ADDRGP4 teamOrdersMenuInfo+288+68
CNSTI4 1
ASGNI4
line 294
;293:
;294:	teamOrdersMenuInfo.frame.generic.type  = MTYPE_BITMAP;
ADDRGP4 teamOrdersMenuInfo+364
CNSTI4 6
ASGNI4
line 295
;295:	teamOrdersMenuInfo.frame.generic.flags = QMF_INACTIVE;
ADDRGP4 teamOrdersMenuInfo+364+44
CNSTU4 16384
ASGNU4
line 296
;296:	teamOrdersMenuInfo.frame.generic.name  = ART_FRAME;
ADDRGP4 teamOrdersMenuInfo+364+4
ADDRGP4 $223
ASGNP4
line 297
;297:	teamOrdersMenuInfo.frame.generic.x     = 320 - 233;
ADDRGP4 teamOrdersMenuInfo+364+12
CNSTI4 87
ASGNI4
line 298
;298:	teamOrdersMenuInfo.frame.generic.y     = 240 - 166;
ADDRGP4 teamOrdersMenuInfo+364+16
CNSTI4 74
ASGNI4
line 299
;299:	teamOrdersMenuInfo.frame.width         = 466;
ADDRGP4 teamOrdersMenuInfo+364+80
CNSTI4 466
ASGNI4
line 300
;300:	teamOrdersMenuInfo.frame.height        = 332;
ADDRGP4 teamOrdersMenuInfo+364+84
CNSTI4 332
ASGNI4
line 302
;301:
;302:	teamOrdersMenuInfo.list.generic.type      = MTYPE_SCROLLLIST;
ADDRGP4 teamOrdersMenuInfo+456
CNSTI4 8
ASGNI4
line 303
;303:	teamOrdersMenuInfo.list.generic.flags     = QMF_PULSEIFFOCUS;
ADDRGP4 teamOrdersMenuInfo+456+44
CNSTU4 256
ASGNU4
line 304
;304:	teamOrdersMenuInfo.list.generic.ownerdraw = UI_TeamOrdersMenu_ListDraw;
ADDRGP4 teamOrdersMenuInfo+456+56
ADDRGP4 UI_TeamOrdersMenu_ListDraw
ASGNP4
line 305
;305:	teamOrdersMenuInfo.list.generic.callback  = UI_TeamOrdersMenu_ListEvent;
ADDRGP4 teamOrdersMenuInfo+456+48
ADDRGP4 UI_TeamOrdersMenu_ListEvent
ASGNP4
line 306
;306:	teamOrdersMenuInfo.list.generic.x         = 320 - 64;
ADDRGP4 teamOrdersMenuInfo+456+12
CNSTI4 256
ASGNI4
line 307
;307:	teamOrdersMenuInfo.list.generic.y         = 120;
ADDRGP4 teamOrdersMenuInfo+456+16
CNSTI4 120
ASGNI4
line 309
;308:
;309:	teamOrdersMenuInfo.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 teamOrdersMenuInfo+564
CNSTI4 6
ASGNI4
line 310
;310:	teamOrdersMenuInfo.back.generic.name     = ART_BACK0;
ADDRGP4 teamOrdersMenuInfo+564+4
ADDRGP4 $246
ASGNP4
line 311
;311:	teamOrdersMenuInfo.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 teamOrdersMenuInfo+564+44
CNSTU4 260
ASGNU4
line 312
;312:	teamOrdersMenuInfo.back.generic.callback = UI_TeamOrdersMenu_BackEvent;
ADDRGP4 teamOrdersMenuInfo+564+48
ADDRGP4 UI_TeamOrdersMenu_BackEvent
ASGNP4
line 313
;313:	teamOrdersMenuInfo.back.generic.x        = 0;
ADDRGP4 teamOrdersMenuInfo+564+12
CNSTI4 0
ASGNI4
line 314
;314:	teamOrdersMenuInfo.back.generic.y        = 480 - 64;
ADDRGP4 teamOrdersMenuInfo+564+16
CNSTI4 416
ASGNI4
line 315
;315:	teamOrdersMenuInfo.back.width            = 128;
ADDRGP4 teamOrdersMenuInfo+564+80
CNSTI4 128
ASGNI4
line 316
;316:	teamOrdersMenuInfo.back.height           = 64;
ADDRGP4 teamOrdersMenuInfo+564+84
CNSTI4 64
ASGNI4
line 317
;317:	teamOrdersMenuInfo.back.focuspic         = ART_BACK1;
ADDRGP4 teamOrdersMenuInfo+564+64
ADDRGP4 $261
ASGNP4
line 319
;318:
;319:	Menu_AddItem(&teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.banner);
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 320
;320:	Menu_AddItem(&teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.frame);
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 321
;321:	Menu_AddItem(&teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.list);
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 322
;322:	Menu_AddItem(&teamOrdersMenuInfo.menu, &teamOrdersMenuInfo.back);
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 teamOrdersMenuInfo+564
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 324
;323:
;324:	teamOrdersMenuInfo.list.generic.left  = 220;
ADDRGP4 teamOrdersMenuInfo+456+20
CNSTI4 220
ASGNI4
line 325
;325:	teamOrdersMenuInfo.list.generic.top   = teamOrdersMenuInfo.list.generic.y;
ADDRGP4 teamOrdersMenuInfo+456+24
ADDRGP4 teamOrdersMenuInfo+456+16
INDIRI4
ASGNI4
line 326
;326:	teamOrdersMenuInfo.list.generic.right = 420;
ADDRGP4 teamOrdersMenuInfo+456+28
CNSTI4 420
ASGNI4
line 327
;327:	UI_TeamOrdersMenu_SetList(ID_LIST_BOTS);
CNSTI4 10
ARGI4
ADDRGP4 UI_TeamOrdersMenu_SetList
CALLV
pop
line 328
;328:}
LABELV $203
endproc UI_TeamOrdersMenu_Init 0 12
export UI_TeamOrdersMenu_Cache
proc UI_TeamOrdersMenu_Cache 0 4
line 335
;329:
;330:/*
;331:=================
;332:UI_TeamOrdersMenu_Cache
;333:=================
;334:*/
;335:void UI_TeamOrdersMenu_Cache(void) {
line 336
;336:	trap_R_RegisterShaderNoMip(ART_FRAME);
ADDRGP4 $223
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 337
;337:	trap_R_RegisterShaderNoMip(ART_BACK0);
ADDRGP4 $246
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 338
;338:	trap_R_RegisterShaderNoMip(ART_BACK1);
ADDRGP4 $261
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 339
;339:}
LABELV $274
endproc UI_TeamOrdersMenu_Cache 0 4
export UI_TeamOrdersMenu
proc UI_TeamOrdersMenu 0 4
line 346
;340:
;341:/*
;342:===============
;343:UI_TeamOrdersMenu
;344:===============
;345:*/
;346:void UI_TeamOrdersMenu(void) {
line 347
;347:	UI_TeamOrdersMenu_Init();
ADDRGP4 UI_TeamOrdersMenu_Init
CALLV
pop
line 348
;348:	UI_PushMenu(&teamOrdersMenuInfo.menu);
ADDRGP4 teamOrdersMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 349
;349:}
LABELV $275
endproc UI_TeamOrdersMenu 0 4
export UI_TeamOrdersMenu_f
proc UI_TeamOrdersMenu_f 4124 12
line 356
;350:
;351:/*
;352:===============
;353:UI_TeamOrdersMenu_f
;354:===============
;355:*/
;356:void UI_TeamOrdersMenu_f(void) {
line 362
;357:	uiClientState_t cs;
;358:	char            info[MAX_INFO_STRING];
;359:	int             team;
;360:
;361:	// make sure it's a team game
;362:	trap_GetConfigString(CS_SERVERINFO, info, sizeof(info));
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 363
;363:	teamOrdersMenuInfo.gametype = trap_Cvar_VariableValue("ui_gametype");
ADDRGP4 $181
ARGP4
ADDRLP4 4112
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 teamOrdersMenuInfo+656
ADDRLP4 4112
INDIRF4
CVFI4 4
ASGNI4
line 364
;364:	if (teamOrdersMenuInfo.gametype < GT_TEAM) {
ADDRGP4 teamOrdersMenuInfo+656
INDIRI4
CNSTI4 3
GEI4 $278
line 365
;365:		return;
ADDRGP4 $276
JUMPV
LABELV $278
line 369
;366:	}
;367:
;368:	// not available to spectators
;369:	trap_GetClientState(&cs);
ADDRLP4 1024
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 370
;370:	trap_GetConfigString(CS_PLAYERS + cs.clientNum, info, MAX_INFO_STRING);
ADDRLP4 1024+8
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 371
;371:	team = atoi(Info_ValueForKey(info, "t"));
ADDRLP4 0
ARGP4
ADDRGP4 $190
ARGP4
ADDRLP4 4116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4116
INDIRP4
ARGP4
ADDRLP4 4120
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4108
ADDRLP4 4120
INDIRI4
ASGNI4
line 372
;372:	if (team == TEAM_SPECTATOR) {
ADDRLP4 4108
INDIRI4
CNSTI4 3
NEI4 $282
line 373
;373:		return;
ADDRGP4 $276
JUMPV
LABELV $282
line 376
;374:	}
;375:
;376:	UI_TeamOrdersMenu();
ADDRGP4 UI_TeamOrdersMenu
CALLV
pop
line 377
;377:}
LABELV $276
endproc UI_TeamOrdersMenu_f 4124 12
bss
align 4
LABELV teamOrdersMenuInfo
skip 848
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
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $246
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
LABELV $223
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
LABELV $213
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
LABELV $198
byte 1 110
byte 1 0
align 1
LABELV $191
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $190
byte 1 116
byte 1 0
align 1
LABELV $181
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
LABELV $179
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
LABELV $177
byte 1 69
byte 1 118
byte 1 101
byte 1 114
byte 1 121
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $168
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $84
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $83
byte 1 82
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $82
byte 1 105
byte 1 32
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 32
byte 1 98
byte 1 101
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $81
byte 1 37
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $80
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $79
byte 1 37
byte 1 115
byte 1 32
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $78
byte 1 37
byte 1 115
byte 1 32
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $77
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $76
byte 1 105
byte 1 32
byte 1 97
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $75
byte 1 73
byte 1 32
byte 1 82
byte 1 101
byte 1 108
byte 1 105
byte 1 110
byte 1 113
byte 1 117
byte 1 105
byte 1 115
byte 1 104
byte 1 32
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $74
byte 1 82
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $73
byte 1 67
byte 1 97
byte 1 109
byte 1 112
byte 1 32
byte 1 72
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $72
byte 1 71
byte 1 101
byte 1 116
byte 1 32
byte 1 69
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $71
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 77
byte 1 101
byte 1 0
align 1
LABELV $70
byte 1 68
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 66
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $69
byte 1 73
byte 1 32
byte 1 65
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 76
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
