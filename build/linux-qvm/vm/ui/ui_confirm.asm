code
proc ConfirmMenu_Event 4 4
file "../../../../code/q3_ui/ui_confirm.c"
line 40
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:CONFIRMATION MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:#define ART_CONFIRM_FRAME "menu/art/cut_frame"
;14:
;15:#define ID_CONFIRM_NO  10
;16:#define ID_CONFIRM_YES 11
;17:
;18:typedef struct {
;19:	menuframework_s menu;
;20:
;21:	menutext_s      no;
;22:	menutext_s      yes;
;23:
;24:	int             slashX;
;25:	const char*     question;
;26:	void (*draw)(void);
;27:	void (*action)(qboolean result);
;28:
;29:	int          style;
;30:	const char** lines;
;31:} confirmMenu_t;
;32:
;33:static confirmMenu_t s_confirm;
;34:
;35:/*
;36:=================
;37:ConfirmMenu_Event
;38:=================
;39:*/
;40:static void ConfirmMenu_Event(void* ptr, int event) {
line 43
;41:	qboolean result;
;42:
;43:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $70
line 44
;44:		return;
ADDRGP4 $69
JUMPV
LABELV $70
line 47
;45:	}
;46:
;47:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 49
;48:
;49:	if (((menucommon_s*)ptr)->id == ID_CONFIRM_NO) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 10
NEI4 $72
line 50
;50:		result = qfalse;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 51
;51:	} else {
ADDRGP4 $73
JUMPV
LABELV $72
line 52
;52:		result = qtrue;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 53
;53:	}
LABELV $73
line 55
;54:
;55:	if (s_confirm.action) {
ADDRGP4 s_confirm+452
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $74
line 56
;56:		s_confirm.action(result);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 s_confirm+452
INDIRP4
CALLV
pop
line 57
;57:	}
LABELV $74
line 58
;58:}
LABELV $69
endproc ConfirmMenu_Event 4 4
proc ConfirmMenu_Key 20 8
line 65
;59:
;60:/*
;61:=================
;62:ConfirmMenu_Key
;63:=================
;64:*/
;65:static sfxHandle_t ConfirmMenu_Key(int key) {
line 66
;66:	switch (key) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 110
EQI4 $82
ADDRLP4 0
INDIRI4
CNSTI4 110
GTI4 $87
LABELV $86
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 78
EQI4 $82
ADDRLP4 4
INDIRI4
CNSTI4 78
LTI4 $79
LABELV $88
ADDRFP4 0
INDIRI4
CNSTI4 89
EQI4 $84
ADDRGP4 $79
JUMPV
LABELV $87
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 134
EQI4 $81
ADDRLP4 8
INDIRI4
CNSTI4 135
EQI4 $81
ADDRLP4 8
INDIRI4
CNSTI4 135
GTI4 $90
LABELV $89
ADDRFP4 0
INDIRI4
CNSTI4 121
EQI4 $84
ADDRGP4 $79
JUMPV
LABELV $90
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 163
EQI4 $81
ADDRLP4 12
INDIRI4
CNSTI4 165
EQI4 $81
ADDRGP4 $79
JUMPV
LABELV $81
line 71
;67:	case K_KP_LEFTARROW:
;68:	case K_LEFTARROW:
;69:	case K_KP_RIGHTARROW:
;70:	case K_RIGHTARROW:
;71:		key = K_TAB;
ADDRFP4 0
CNSTI4 9
ASGNI4
line 72
;72:		break;
ADDRGP4 $80
JUMPV
LABELV $82
line 76
;73:
;74:	case 'n':
;75:	case 'N':
;76:		ConfirmMenu_Event(&s_confirm.no, QM_ACTIVATED);
ADDRGP4 s_confirm+288
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 ConfirmMenu_Event
CALLV
pop
line 77
;77:		break;
ADDRGP4 $80
JUMPV
LABELV $84
line 81
;78:
;79:	case 'y':
;80:	case 'Y':
;81:		ConfirmMenu_Event(&s_confirm.yes, QM_ACTIVATED);
ADDRGP4 s_confirm+364
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 ConfirmMenu_Event
CALLV
pop
line 82
;82:		break;
LABELV $79
LABELV $80
line 85
;83:	}
;84:
;85:	return Menu_DefaultKey(&s_confirm.menu, key);
ADDRGP4 s_confirm
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
LABELV $78
endproc ConfirmMenu_Key 20 8
proc MessageMenu_Draw 8 20
line 93
;86:}
;87:
;88:/*
;89:=================
;90:MessaheMenu_Draw
;91:=================
;92:*/
;93:static void MessageMenu_Draw(void) {
line 96
;94:	int i, y;
;95:
;96:	UI_DrawNamedPic(142, 118, 359, 256, ART_CONFIRM_FRAME);
CNSTF4 1124990976
ARGF4
CNSTF4 1122762752
ARGF4
CNSTF4 1135837184
ARGF4
CNSTF4 1132462080
ARGF4
ADDRGP4 $92
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 98
;97:
;98:	y = 188;
ADDRLP4 4
CNSTI4 188
ASGNI4
line 99
;99:	for (i = 0; s_confirm.lines[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $96
JUMPV
LABELV $93
line 100
;100:		UI_DrawProportionalString(320, y, s_confirm.lines[i], s_confirm.style, color_red);
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_confirm+460
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRGP4 s_confirm+456
INDIRI4
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 101
;101:		y += 18;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 102
;102:	}
LABELV $94
line 99
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $96
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_confirm+460
INDIRP4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $93
line 104
;103:
;104:	Menu_Draw(&s_confirm.menu);
ADDRGP4 s_confirm
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 106
;105:
;106:	if (s_confirm.draw) {
ADDRGP4 s_confirm+448
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $100
line 107
;107:		s_confirm.draw();
ADDRGP4 s_confirm+448
INDIRP4
CALLV
pop
line 108
;108:	}
LABELV $100
line 109
;109:}
LABELV $91
endproc MessageMenu_Draw 8 20
proc ConfirmMenu_Draw 0 20
line 116
;110:
;111:/*
;112:=================
;113:ConfirmMenu_Draw
;114:=================
;115:*/
;116:static void ConfirmMenu_Draw(void) {
line 117
;117:	UI_DrawNamedPic(142, 118, 359, 256, ART_CONFIRM_FRAME);
CNSTF4 1124990976
ARGF4
CNSTF4 1122762752
ARGF4
CNSTF4 1135837184
ARGF4
CNSTF4 1132462080
ARGF4
ADDRGP4 $92
ARGP4
ADDRGP4 UI_DrawNamedPic
CALLV
pop
line 118
;118:	UI_DrawProportionalString(320, 204, s_confirm.question, s_confirm.style, color_red);
CNSTI4 320
ARGI4
CNSTI4 204
ARGI4
ADDRGP4 s_confirm+444
INDIRP4
ARGP4
ADDRGP4 s_confirm+456
INDIRI4
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 119
;119:	UI_DrawProportionalString(s_confirm.slashX, 265, "/", UI_LEFT | UI_INVERSE, color_red);
ADDRGP4 s_confirm+440
INDIRI4
ARGI4
CNSTI4 265
ARGI4
ADDRGP4 $108
ARGP4
CNSTI4 8192
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 121
;120:
;121:	Menu_Draw(&s_confirm.menu);
ADDRGP4 s_confirm
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 123
;122:
;123:	if (s_confirm.draw) {
ADDRGP4 s_confirm+448
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $109
line 124
;124:		s_confirm.draw();
ADDRGP4 s_confirm+448
INDIRP4
CALLV
pop
line 125
;125:	}
LABELV $109
line 126
;126:}
LABELV $104
endproc ConfirmMenu_Draw 0 20
export ConfirmMenu_Cache
proc ConfirmMenu_Cache 0 4
line 133
;127:
;128:/*
;129:=================
;130:ConfirmMenu_Cache
;131:=================
;132:*/
;133:void ConfirmMenu_Cache(void) {
line 134
;134:	trap_R_RegisterShaderNoMip(ART_CONFIRM_FRAME);
ADDRGP4 $92
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 135
;135:}
LABELV $113
endproc ConfirmMenu_Cache 0 4
export UI_ConfirmMenu_Style
proc UI_ConfirmMenu_Style 3120 12
line 142
;136:
;137:/*
;138:=================
;139:UI_ConfirmMenu_Stlye
;140:=================
;141:*/
;142:void UI_ConfirmMenu_Style(const char* question, int style, void (*draw)(void), void (*action)(qboolean result)) {
line 148
;143:	uiClientState_t cstate;
;144:	int             n1, n2, n3;
;145:	int             l1, l2, l3;
;146:
;147:	// zero set all our globals
;148:	memset(&s_confirm, 0, sizeof(s_confirm));
ADDRGP4 s_confirm
ARGP4
CNSTI4 0
ARGI4
CNSTI4 464
ARGI4
ADDRGP4 memset
CALLP4
pop
line 150
;149:
;150:	ConfirmMenu_Cache();
ADDRGP4 ConfirmMenu_Cache
CALLV
pop
line 152
;151:
;152:	n1               = UI_ProportionalStringWidth("YES/NO");
ADDRGP4 $115
ARGP4
ADDRLP4 3108
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3092
ADDRLP4 3108
INDIRI4
ASGNI4
line 153
;153:	n2               = UI_ProportionalStringWidth("YES") + PROP_GAP_WIDTH;
ADDRGP4 $116
ARGP4
ADDRLP4 3112
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3096
ADDRLP4 3112
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 154
;154:	n3               = UI_ProportionalStringWidth("/") + PROP_GAP_WIDTH;
ADDRGP4 $108
ARGP4
ADDRLP4 3116
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3100
ADDRLP4 3116
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 155
;155:	l1               = 320 - (n1 / 2);
ADDRLP4 0
CNSTI4 320
ADDRLP4 3092
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 156
;156:	l2               = l1 + n2;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRLP4 3096
INDIRI4
ADDI4
ASGNI4
line 157
;157:	l3               = l2 + n3;
ADDRLP4 3104
ADDRLP4 4
INDIRI4
ADDRLP4 3100
INDIRI4
ADDI4
ASGNI4
line 158
;158:	s_confirm.slashX = l2;
ADDRGP4 s_confirm+440
ADDRLP4 4
INDIRI4
ASGNI4
line 160
;159:
;160:	s_confirm.question = question;
ADDRGP4 s_confirm+444
ADDRFP4 0
INDIRP4
ASGNP4
line 161
;161:	s_confirm.draw     = draw;
ADDRGP4 s_confirm+448
ADDRFP4 8
INDIRP4
ASGNP4
line 162
;162:	s_confirm.action   = action;
ADDRGP4 s_confirm+452
ADDRFP4 12
INDIRP4
ASGNP4
line 163
;163:	s_confirm.style    = style;
ADDRGP4 s_confirm+456
ADDRFP4 4
INDIRI4
ASGNI4
line 165
;164:
;165:	s_confirm.menu.draw       = ConfirmMenu_Draw;
ADDRGP4 s_confirm+268
ADDRGP4 ConfirmMenu_Draw
ASGNP4
line 166
;166:	s_confirm.menu.key        = ConfirmMenu_Key;
ADDRGP4 s_confirm+272
ADDRGP4 ConfirmMenu_Key
ASGNP4
line 167
;167:	s_confirm.menu.wrapAround = qtrue;
ADDRGP4 s_confirm+276
CNSTI4 1
ASGNI4
line 169
;168:
;169:	trap_GetClientState(&cstate);
ADDRLP4 8
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 170
;170:	if (cstate.connState >= CA_CONNECTED) {
ADDRLP4 8
INDIRI4
CNSTI4 5
LTI4 $125
line 171
;171:		s_confirm.menu.fullscreen = qfalse;
ADDRGP4 s_confirm+280
CNSTI4 0
ASGNI4
line 172
;172:	} else {
ADDRGP4 $126
JUMPV
LABELV $125
line 173
;173:		s_confirm.menu.fullscreen = qtrue;
ADDRGP4 s_confirm+280
CNSTI4 1
ASGNI4
line 174
;174:	}
LABELV $126
line 176
;175:
;176:	s_confirm.yes.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_confirm+364
CNSTI4 9
ASGNI4
line 177
;177:	s_confirm.yes.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_confirm+364+44
CNSTU4 260
ASGNU4
line 178
;178:	s_confirm.yes.generic.callback = ConfirmMenu_Event;
ADDRGP4 s_confirm+364+48
ADDRGP4 ConfirmMenu_Event
ASGNP4
line 179
;179:	s_confirm.yes.generic.id       = ID_CONFIRM_YES;
ADDRGP4 s_confirm+364+8
CNSTI4 11
ASGNI4
line 180
;180:	s_confirm.yes.generic.x        = l1;
ADDRGP4 s_confirm+364+12
ADDRLP4 0
INDIRI4
ASGNI4
line 181
;181:	s_confirm.yes.generic.y        = 264;
ADDRGP4 s_confirm+364+16
CNSTI4 264
ASGNI4
line 182
;182:	s_confirm.yes.string           = "YES";
ADDRGP4 s_confirm+364+64
ADDRGP4 $116
ASGNP4
line 183
;183:	s_confirm.yes.color            = color_red;
ADDRGP4 s_confirm+364+72
ADDRGP4 color_red
ASGNP4
line 184
;184:	s_confirm.yes.style            = UI_LEFT;
ADDRGP4 s_confirm+364+68
CNSTI4 0
ASGNI4
line 186
;185:
;186:	s_confirm.no.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_confirm+288
CNSTI4 9
ASGNI4
line 187
;187:	s_confirm.no.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_confirm+288+44
CNSTU4 260
ASGNU4
line 188
;188:	s_confirm.no.generic.callback = ConfirmMenu_Event;
ADDRGP4 s_confirm+288+48
ADDRGP4 ConfirmMenu_Event
ASGNP4
line 189
;189:	s_confirm.no.generic.id       = ID_CONFIRM_NO;
ADDRGP4 s_confirm+288+8
CNSTI4 10
ASGNI4
line 190
;190:	s_confirm.no.generic.x        = l3;
ADDRGP4 s_confirm+288+12
ADDRLP4 3104
INDIRI4
ASGNI4
line 191
;191:	s_confirm.no.generic.y        = 264;
ADDRGP4 s_confirm+288+16
CNSTI4 264
ASGNI4
line 192
;192:	s_confirm.no.string           = "NO";
ADDRGP4 s_confirm+288+64
ADDRGP4 $159
ASGNP4
line 193
;193:	s_confirm.no.color            = color_red;
ADDRGP4 s_confirm+288+72
ADDRGP4 color_red
ASGNP4
line 194
;194:	s_confirm.no.style            = UI_LEFT;
ADDRGP4 s_confirm+288+68
CNSTI4 0
ASGNI4
line 196
;195:
;196:	Menu_AddItem(&s_confirm.menu, &s_confirm.yes);
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 197
;197:	Menu_AddItem(&s_confirm.menu, &s_confirm.no);
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 199
;198:
;199:	UI_PushMenu(&s_confirm.menu);
ADDRGP4 s_confirm
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 201
;200:
;201:	Menu_SetCursorToItem(&s_confirm.menu, &s_confirm.no);
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+288
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 202
;202:}
LABELV $114
endproc UI_ConfirmMenu_Style 3120 12
export UI_ConfirmMenu
proc UI_ConfirmMenu 0 16
line 209
;203:
;204:/*
;205:=================
;206:UI_ConfirmMenu
;207:=================
;208:*/
;209:void UI_ConfirmMenu(const char* question, void (*draw)(void), void (*action)(qboolean result)) {
line 210
;210:	UI_ConfirmMenu_Style(question, UI_CENTER | UI_INVERSE, draw, action);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 8193
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 UI_ConfirmMenu_Style
CALLV
pop
line 211
;211:}
LABELV $167
endproc UI_ConfirmMenu 0 16
export UI_Message
proc UI_Message 3096 12
line 219
;212:
;213:/*
;214:=================
;215:UI_Message
;216:hacked over from Confirm stuff
;217:=================
;218:*/
;219:void UI_Message(const char** lines) {
line 224
;220:	uiClientState_t cstate;
;221:	int             n1, l1;
;222:
;223:	// zero set all our globals
;224:	memset(&s_confirm, 0, sizeof(s_confirm));
ADDRGP4 s_confirm
ARGP4
CNSTI4 0
ARGI4
CNSTI4 464
ARGI4
ADDRGP4 memset
CALLP4
pop
line 226
;225:
;226:	ConfirmMenu_Cache();
ADDRGP4 ConfirmMenu_Cache
CALLV
pop
line 228
;227:
;228:	n1 = UI_ProportionalStringWidth("OK");
ADDRGP4 $169
ARGP4
ADDRLP4 3092
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 3084
ADDRLP4 3092
INDIRI4
ASGNI4
line 229
;229:	l1 = 320 - (n1 / 2);
ADDRLP4 3088
CNSTI4 320
ADDRLP4 3084
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 231
;230:
;231:	s_confirm.lines = lines;
ADDRGP4 s_confirm+460
ADDRFP4 0
INDIRP4
ASGNP4
line 232
;232:	s_confirm.style = UI_CENTER | UI_INVERSE | UI_SMALLFONT;
ADDRGP4 s_confirm+456
CNSTI4 8209
ASGNI4
line 234
;233:
;234:	s_confirm.menu.draw       = MessageMenu_Draw;
ADDRGP4 s_confirm+268
ADDRGP4 MessageMenu_Draw
ASGNP4
line 235
;235:	s_confirm.menu.key        = ConfirmMenu_Key;
ADDRGP4 s_confirm+272
ADDRGP4 ConfirmMenu_Key
ASGNP4
line 236
;236:	s_confirm.menu.wrapAround = qtrue;
ADDRGP4 s_confirm+276
CNSTI4 1
ASGNI4
line 238
;237:
;238:	trap_GetClientState(&cstate);
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 239
;239:	if (cstate.connState >= CA_CONNECTED) {
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $175
line 240
;240:		s_confirm.menu.fullscreen = qfalse;
ADDRGP4 s_confirm+280
CNSTI4 0
ASGNI4
line 241
;241:	} else {
ADDRGP4 $176
JUMPV
LABELV $175
line 242
;242:		s_confirm.menu.fullscreen = qtrue;
ADDRGP4 s_confirm+280
CNSTI4 1
ASGNI4
line 243
;243:	}
LABELV $176
line 245
;244:
;245:	s_confirm.yes.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_confirm+364
CNSTI4 9
ASGNI4
line 246
;246:	s_confirm.yes.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_confirm+364+44
CNSTU4 260
ASGNU4
line 247
;247:	s_confirm.yes.generic.callback = ConfirmMenu_Event;
ADDRGP4 s_confirm+364+48
ADDRGP4 ConfirmMenu_Event
ASGNP4
line 248
;248:	s_confirm.yes.generic.id       = ID_CONFIRM_YES;
ADDRGP4 s_confirm+364+8
CNSTI4 11
ASGNI4
line 249
;249:	s_confirm.yes.generic.x        = l1;
ADDRGP4 s_confirm+364+12
ADDRLP4 3088
INDIRI4
ASGNI4
line 250
;250:	s_confirm.yes.generic.y        = 280;
ADDRGP4 s_confirm+364+16
CNSTI4 280
ASGNI4
line 251
;251:	s_confirm.yes.string           = "OK";
ADDRGP4 s_confirm+364+64
ADDRGP4 $169
ASGNP4
line 252
;252:	s_confirm.yes.color            = color_red;
ADDRGP4 s_confirm+364+72
ADDRGP4 color_red
ASGNP4
line 253
;253:	s_confirm.yes.style            = UI_LEFT;
ADDRGP4 s_confirm+364+68
CNSTI4 0
ASGNI4
line 255
;254:
;255:	Menu_AddItem(&s_confirm.menu, &s_confirm.yes);
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 257
;256:
;257:	UI_PushMenu(&s_confirm.menu);
ADDRGP4 s_confirm
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 259
;258:
;259:	Menu_SetCursorToItem(&s_confirm.menu, &s_confirm.yes);
ADDRGP4 s_confirm
ARGP4
ADDRGP4 s_confirm+364
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 260
;260:}
LABELV $168
endproc UI_Message 3096 12
bss
align 4
LABELV s_confirm
skip 464
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
LABELV $169
byte 1 79
byte 1 75
byte 1 0
align 1
LABELV $159
byte 1 78
byte 1 79
byte 1 0
align 1
LABELV $116
byte 1 89
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $115
byte 1 89
byte 1 69
byte 1 83
byte 1 47
byte 1 78
byte 1 79
byte 1 0
align 1
LABELV $108
byte 1 47
byte 1 0
align 1
LABELV $92
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 99
byte 1 117
byte 1 116
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 0
