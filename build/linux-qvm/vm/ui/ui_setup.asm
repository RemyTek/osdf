code
proc Setup_ResetDefaults_Action 0 8
file "../../../../code/q3_ui/ui_setup.c"
line 54
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:SETUP MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:#define SETUP_MENU_VERTICAL_SPACING 34
;14:
;15:#define ART_BACK0  "menu/art/back_0"
;16:#define ART_BACK1  "menu/art/back_1"
;17:#define ART_FRAMEL "menu/art/frame2_l"
;18:#define ART_FRAMER "menu/art/frame1_r"
;19:
;20:#define ID_CUSTOMIZEPLAYER   10
;21:#define ID_CUSTOMIZECONTROLS 11
;22:#define ID_SYSTEMCONFIG      12
;23:#define ID_GAME              13
;24:#define ID_CDKEY             14
;25:#define ID_LOAD              15
;26:#define ID_SAVE              16
;27:#define ID_DEFAULTS          17
;28:#define ID_BACK              18
;29:
;30:typedef struct {
;31:	menuframework_s menu;
;32:
;33:	menutext_s      banner;
;34:	menubitmap_s    framel;
;35:	menubitmap_s    framer;
;36:	menutext_s      setupplayer;
;37:	menutext_s      setupcontrols;
;38:	menutext_s      setupsystem;
;39:	menutext_s      game;
;40:	menutext_s      cdkey;
;41:	//	menutext_s		load;
;42:	//	menutext_s		save;
;43:	menutext_s   defaults;
;44:	menubitmap_s back;
;45:} setupMenuInfo_t;
;46:
;47:static setupMenuInfo_t setupMenuInfo;
;48:
;49:/*
;50:=================
;51:Setup_ResetDefaults_Action
;52:=================
;53:*/
;54:static void Setup_ResetDefaults_Action(qboolean result) {
line 55
;55:	if (!result) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $70
line 56
;56:		return;
ADDRGP4 $69
JUMPV
LABELV $70
line 58
;57:	}
;58:	trap_Cmd_ExecuteText(EXEC_APPEND, "exec default.cfg\n");
CNSTI4 2
ARGI4
ADDRGP4 $72
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 59
;59:	trap_Cmd_ExecuteText(EXEC_APPEND, "cvar_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $73
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 60
;60:	trap_Cmd_ExecuteText(EXEC_APPEND, "vid_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $74
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 61
;61:}
LABELV $69
endproc Setup_ResetDefaults_Action 0 8
proc Setup_ResetDefaults_Draw 0 20
line 68
;62:
;63:/*
;64:=================
;65:Setup_ResetDefaults_Draw
;66:=================
;67:*/
;68:static void Setup_ResetDefaults_Draw(void) {
line 69
;69:	UI_DrawProportionalString(SCREEN_WIDTH / 2, 356 + PROP_HEIGHT * 0, "WARNING: This will reset *ALL*", UI_CENTER | UI_SMALLFONT, color_yellow);
CNSTI4 320
ARGI4
CNSTI4 356
ARGI4
ADDRGP4 $76
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 70
;70:	UI_DrawProportionalString(SCREEN_WIDTH / 2, 356 + PROP_HEIGHT * 1, "options to their default values.", UI_CENTER | UI_SMALLFONT, color_yellow);
CNSTI4 320
ARGI4
CNSTI4 383
ARGI4
ADDRGP4 $77
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 71
;71:}
LABELV $75
endproc Setup_ResetDefaults_Draw 0 20
proc UI_SetupMenu_Event 8 12
line 78
;72:
;73:/*
;74:===============
;75:UI_SetupMenu_Event
;76:===============
;77:*/
;78:static void UI_SetupMenu_Event(void* ptr, int event) {
line 79
;79:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $79
line 80
;80:		return;
ADDRGP4 $78
JUMPV
LABELV $79
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
LTI4 $81
ADDRLP4 0
INDIRI4
CNSTI4 18
GTI4 $81
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $92-40
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $92
address $84
address $85
address $86
address $87
address $88
address $81
address $81
address $89
address $91
code
LABELV $84
line 85
;84:	case ID_CUSTOMIZEPLAYER:
;85:		UI_PlayerSettingsMenu();
ADDRGP4 UI_PlayerSettingsMenu
CALLV
pop
line 86
;86:		break;
ADDRGP4 $82
JUMPV
LABELV $85
line 89
;87:
;88:	case ID_CUSTOMIZECONTROLS:
;89:		UI_ControlsMenu();
ADDRGP4 UI_ControlsMenu
CALLV
pop
line 90
;90:		break;
ADDRGP4 $82
JUMPV
LABELV $86
line 93
;91:
;92:	case ID_SYSTEMCONFIG:
;93:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 94
;94:		break;
ADDRGP4 $82
JUMPV
LABELV $87
line 97
;95:
;96:	case ID_GAME:
;97:		UI_PreferencesMenu();
ADDRGP4 UI_PreferencesMenu
CALLV
pop
line 98
;98:		break;
ADDRGP4 $82
JUMPV
LABELV $88
line 101
;99:
;100:	case ID_CDKEY:
;101:		UI_CDKeyMenu();
ADDRGP4 UI_CDKeyMenu
CALLV
pop
line 102
;102:		break;
ADDRGP4 $82
JUMPV
LABELV $89
line 113
;103:
;104:		//	case ID_LOAD:
;105:		//		UI_LoadConfigMenu();
;106:		//		break;
;107:
;108:		//	case ID_SAVE:
;109:		//		UI_SaveConfigMenu();
;110:		//		break;
;111:
;112:	case ID_DEFAULTS:
;113:		UI_ConfirmMenu("SET TO DEFAULTS?", Setup_ResetDefaults_Draw, Setup_ResetDefaults_Action);
ADDRGP4 $90
ARGP4
ADDRGP4 Setup_ResetDefaults_Draw
ARGP4
ADDRGP4 Setup_ResetDefaults_Action
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 114
;114:		break;
ADDRGP4 $82
JUMPV
LABELV $91
line 117
;115:
;116:	case ID_BACK:
;117:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 118
;118:		break;
LABELV $81
LABELV $82
line 120
;119:	}
;120:}
LABELV $78
endproc UI_SetupMenu_Event 8 12
proc UI_SetupMenu_Init 12 12
line 127
;121:
;122:/*
;123:===============
;124:UI_SetupMenu_Init
;125:===============
;126:*/
;127:static void UI_SetupMenu_Init(void) {
line 130
;128:	int y;
;129:
;130:	UI_SetupMenu_Cache();
ADDRGP4 UI_SetupMenu_Cache
CALLV
pop
line 132
;131:
;132:	memset(&setupMenuInfo, 0, sizeof(setupMenuInfo));
ADDRGP4 setupMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1096
ARGI4
ADDRGP4 memset
CALLP4
pop
line 133
;133:	setupMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 setupMenuInfo+276
CNSTI4 1
ASGNI4
line 134
;134:	setupMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 setupMenuInfo+280
CNSTI4 1
ASGNI4
line 136
;135:
;136:	setupMenuInfo.banner.generic.type = MTYPE_BTEXT;
ADDRGP4 setupMenuInfo+288
CNSTI4 10
ASGNI4
line 137
;137:	setupMenuInfo.banner.generic.x    = 320;
ADDRGP4 setupMenuInfo+288+12
CNSTI4 320
ASGNI4
line 138
;138:	setupMenuInfo.banner.generic.y    = 16;
ADDRGP4 setupMenuInfo+288+16
CNSTI4 16
ASGNI4
line 139
;139:	setupMenuInfo.banner.string       = "SETUP";
ADDRGP4 setupMenuInfo+288+64
ADDRGP4 $104
ASGNP4
line 140
;140:	setupMenuInfo.banner.color        = color_white;
ADDRGP4 setupMenuInfo+288+72
ADDRGP4 color_white
ASGNP4
line 141
;141:	setupMenuInfo.banner.style        = UI_CENTER;
ADDRGP4 setupMenuInfo+288+68
CNSTI4 1
ASGNI4
line 143
;142:
;143:	setupMenuInfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 setupMenuInfo+364
CNSTI4 6
ASGNI4
line 144
;144:	setupMenuInfo.framel.generic.name  = ART_FRAMEL;
ADDRGP4 setupMenuInfo+364+4
ADDRGP4 $112
ASGNP4
line 145
;145:	setupMenuInfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 setupMenuInfo+364+44
CNSTU4 16384
ASGNU4
line 146
;146:	setupMenuInfo.framel.generic.x     = 0;
ADDRGP4 setupMenuInfo+364+12
CNSTI4 0
ASGNI4
line 147
;147:	setupMenuInfo.framel.generic.y     = 78;
ADDRGP4 setupMenuInfo+364+16
CNSTI4 78
ASGNI4
line 148
;148:	setupMenuInfo.framel.width         = 256;
ADDRGP4 setupMenuInfo+364+80
CNSTI4 256
ASGNI4
line 149
;149:	setupMenuInfo.framel.height        = 329;
ADDRGP4 setupMenuInfo+364+84
CNSTI4 329
ASGNI4
line 151
;150:
;151:	setupMenuInfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 setupMenuInfo+456
CNSTI4 6
ASGNI4
line 152
;152:	setupMenuInfo.framer.generic.name  = ART_FRAMER;
ADDRGP4 setupMenuInfo+456+4
ADDRGP4 $126
ASGNP4
line 153
;153:	setupMenuInfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 setupMenuInfo+456+44
CNSTU4 16384
ASGNU4
line 154
;154:	setupMenuInfo.framer.generic.x     = 376;
ADDRGP4 setupMenuInfo+456+12
CNSTI4 376
ASGNI4
line 155
;155:	setupMenuInfo.framer.generic.y     = 76;
ADDRGP4 setupMenuInfo+456+16
CNSTI4 76
ASGNI4
line 156
;156:	setupMenuInfo.framer.width         = 256;
ADDRGP4 setupMenuInfo+456+80
CNSTI4 256
ASGNI4
line 157
;157:	setupMenuInfo.framer.height        = 334;
ADDRGP4 setupMenuInfo+456+84
CNSTI4 334
ASGNI4
line 159
;158:
;159:	y                                          = 134;
ADDRLP4 0
CNSTI4 134
ASGNI4
line 160
;160:	setupMenuInfo.setupplayer.generic.type     = MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+548
CNSTI4 9
ASGNI4
line 161
;161:	setupMenuInfo.setupplayer.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+548+44
CNSTU4 264
ASGNU4
line 162
;162:	setupMenuInfo.setupplayer.generic.x        = 320;
ADDRGP4 setupMenuInfo+548+12
CNSTI4 320
ASGNI4
line 163
;163:	setupMenuInfo.setupplayer.generic.y        = y;
ADDRGP4 setupMenuInfo+548+16
ADDRLP4 0
INDIRI4
ASGNI4
line 164
;164:	setupMenuInfo.setupplayer.generic.id       = ID_CUSTOMIZEPLAYER;
ADDRGP4 setupMenuInfo+548+8
CNSTI4 10
ASGNI4
line 165
;165:	setupMenuInfo.setupplayer.generic.callback = UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+548+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 166
;166:	setupMenuInfo.setupplayer.string           = "PLAYER";
ADDRGP4 setupMenuInfo+548+64
ADDRGP4 $150
ASGNP4
line 167
;167:	setupMenuInfo.setupplayer.color            = color_red;
ADDRGP4 setupMenuInfo+548+72
ADDRGP4 color_red
ASGNP4
line 168
;168:	setupMenuInfo.setupplayer.style            = UI_CENTER;
ADDRGP4 setupMenuInfo+548+68
CNSTI4 1
ASGNI4
line 170
;169:
;170:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 171
;171:	setupMenuInfo.setupcontrols.generic.type     = MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+624
CNSTI4 9
ASGNI4
line 172
;172:	setupMenuInfo.setupcontrols.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+624+44
CNSTU4 264
ASGNU4
line 173
;173:	setupMenuInfo.setupcontrols.generic.x        = 320;
ADDRGP4 setupMenuInfo+624+12
CNSTI4 320
ASGNI4
line 174
;174:	setupMenuInfo.setupcontrols.generic.y        = y;
ADDRGP4 setupMenuInfo+624+16
ADDRLP4 0
INDIRI4
ASGNI4
line 175
;175:	setupMenuInfo.setupcontrols.generic.id       = ID_CUSTOMIZECONTROLS;
ADDRGP4 setupMenuInfo+624+8
CNSTI4 11
ASGNI4
line 176
;176:	setupMenuInfo.setupcontrols.generic.callback = UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+624+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 177
;177:	setupMenuInfo.setupcontrols.string           = "CONTROLS";
ADDRGP4 setupMenuInfo+624+64
ADDRGP4 $168
ASGNP4
line 178
;178:	setupMenuInfo.setupcontrols.color            = color_red;
ADDRGP4 setupMenuInfo+624+72
ADDRGP4 color_red
ASGNP4
line 179
;179:	setupMenuInfo.setupcontrols.style            = UI_CENTER;
ADDRGP4 setupMenuInfo+624+68
CNSTI4 1
ASGNI4
line 181
;180:
;181:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 182
;182:	setupMenuInfo.setupsystem.generic.type     = MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+700
CNSTI4 9
ASGNI4
line 183
;183:	setupMenuInfo.setupsystem.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+700+44
CNSTU4 264
ASGNU4
line 184
;184:	setupMenuInfo.setupsystem.generic.x        = 320;
ADDRGP4 setupMenuInfo+700+12
CNSTI4 320
ASGNI4
line 185
;185:	setupMenuInfo.setupsystem.generic.y        = y;
ADDRGP4 setupMenuInfo+700+16
ADDRLP4 0
INDIRI4
ASGNI4
line 186
;186:	setupMenuInfo.setupsystem.generic.id       = ID_SYSTEMCONFIG;
ADDRGP4 setupMenuInfo+700+8
CNSTI4 12
ASGNI4
line 187
;187:	setupMenuInfo.setupsystem.generic.callback = UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+700+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 188
;188:	setupMenuInfo.setupsystem.string           = "SYSTEM";
ADDRGP4 setupMenuInfo+700+64
ADDRGP4 $186
ASGNP4
line 189
;189:	setupMenuInfo.setupsystem.color            = color_red;
ADDRGP4 setupMenuInfo+700+72
ADDRGP4 color_red
ASGNP4
line 190
;190:	setupMenuInfo.setupsystem.style            = UI_CENTER;
ADDRGP4 setupMenuInfo+700+68
CNSTI4 1
ASGNI4
line 192
;191:
;192:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 193
;193:	setupMenuInfo.game.generic.type     = MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+776
CNSTI4 9
ASGNI4
line 194
;194:	setupMenuInfo.game.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+776+44
CNSTU4 264
ASGNU4
line 195
;195:	setupMenuInfo.game.generic.x        = 320;
ADDRGP4 setupMenuInfo+776+12
CNSTI4 320
ASGNI4
line 196
;196:	setupMenuInfo.game.generic.y        = y;
ADDRGP4 setupMenuInfo+776+16
ADDRLP4 0
INDIRI4
ASGNI4
line 197
;197:	setupMenuInfo.game.generic.id       = ID_GAME;
ADDRGP4 setupMenuInfo+776+8
CNSTI4 13
ASGNI4
line 198
;198:	setupMenuInfo.game.generic.callback = UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+776+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 199
;199:	setupMenuInfo.game.string           = "GAME OPTIONS";
ADDRGP4 setupMenuInfo+776+64
ADDRGP4 $204
ASGNP4
line 200
;200:	setupMenuInfo.game.color            = color_red;
ADDRGP4 setupMenuInfo+776+72
ADDRGP4 color_red
ASGNP4
line 201
;201:	setupMenuInfo.game.style            = UI_CENTER;
ADDRGP4 setupMenuInfo+776+68
CNSTI4 1
ASGNI4
line 203
;202:
;203:	y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 204
;204:	setupMenuInfo.cdkey.generic.type     = MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+852
CNSTI4 9
ASGNI4
line 205
;205:	setupMenuInfo.cdkey.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+852+44
CNSTU4 264
ASGNU4
line 206
;206:	setupMenuInfo.cdkey.generic.x        = 320;
ADDRGP4 setupMenuInfo+852+12
CNSTI4 320
ASGNI4
line 207
;207:	setupMenuInfo.cdkey.generic.y        = y;
ADDRGP4 setupMenuInfo+852+16
ADDRLP4 0
INDIRI4
ASGNI4
line 208
;208:	setupMenuInfo.cdkey.generic.id       = ID_CDKEY;
ADDRGP4 setupMenuInfo+852+8
CNSTI4 14
ASGNI4
line 209
;209:	setupMenuInfo.cdkey.generic.callback = UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+852+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 210
;210:	setupMenuInfo.cdkey.string           = "CD Key";
ADDRGP4 setupMenuInfo+852+64
ADDRGP4 $222
ASGNP4
line 211
;211:	setupMenuInfo.cdkey.color            = color_red;
ADDRGP4 setupMenuInfo+852+72
ADDRGP4 color_red
ASGNP4
line 212
;212:	setupMenuInfo.cdkey.style            = UI_CENTER;
ADDRGP4 setupMenuInfo+852+68
CNSTI4 1
ASGNI4
line 214
;213:
;214:	if (!trap_Cvar_VariableValue("cl_paused")) {
ADDRGP4 $229
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $227
line 239
;215:#if 0
;216:		y += SETUP_MENU_VERTICAL_SPACING;
;217:		setupMenuInfo.load.generic.type					= MTYPE_PTEXT;
;218:		setupMenuInfo.load.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;219:		setupMenuInfo.load.generic.x					= 320;
;220:		setupMenuInfo.load.generic.y					= y;
;221:		setupMenuInfo.load.generic.id					= ID_LOAD;
;222:		setupMenuInfo.load.generic.callback				= UI_SetupMenu_Event; 
;223:		setupMenuInfo.load.string						= "LOAD";
;224:		setupMenuInfo.load.color						= color_red;
;225:		setupMenuInfo.load.style						= UI_CENTER;
;226:
;227:		y += SETUP_MENU_VERTICAL_SPACING;
;228:		setupMenuInfo.save.generic.type					= MTYPE_PTEXT;
;229:		setupMenuInfo.save.generic.flags				= QMF_CENTER_JUSTIFY|QMF_PULSEIFFOCUS;
;230:		setupMenuInfo.save.generic.x					= 320;
;231:		setupMenuInfo.save.generic.y					= y;
;232:		setupMenuInfo.save.generic.id					= ID_SAVE;
;233:		setupMenuInfo.save.generic.callback				= UI_SetupMenu_Event; 
;234:		setupMenuInfo.save.string						= "SAVE";
;235:		setupMenuInfo.save.color						= color_red;
;236:		setupMenuInfo.save.style						= UI_CENTER;
;237:#endif
;238:
;239:		y += SETUP_MENU_VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 240
;240:		setupMenuInfo.defaults.generic.type     = MTYPE_PTEXT;
ADDRGP4 setupMenuInfo+928
CNSTI4 9
ASGNI4
line 241
;241:		setupMenuInfo.defaults.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+928+44
CNSTU4 264
ASGNU4
line 242
;242:		setupMenuInfo.defaults.generic.x        = 320;
ADDRGP4 setupMenuInfo+928+12
CNSTI4 320
ASGNI4
line 243
;243:		setupMenuInfo.defaults.generic.y        = y;
ADDRGP4 setupMenuInfo+928+16
ADDRLP4 0
INDIRI4
ASGNI4
line 244
;244:		setupMenuInfo.defaults.generic.id       = ID_DEFAULTS;
ADDRGP4 setupMenuInfo+928+8
CNSTI4 17
ASGNI4
line 245
;245:		setupMenuInfo.defaults.generic.callback = UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+928+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 246
;246:		setupMenuInfo.defaults.string           = "DEFAULTS";
ADDRGP4 setupMenuInfo+928+64
ADDRGP4 $243
ASGNP4
line 247
;247:		setupMenuInfo.defaults.color            = color_red;
ADDRGP4 setupMenuInfo+928+72
ADDRGP4 color_red
ASGNP4
line 248
;248:		setupMenuInfo.defaults.style            = UI_CENTER;
ADDRGP4 setupMenuInfo+928+68
CNSTI4 1
ASGNI4
line 249
;249:	}
LABELV $227
line 251
;250:
;251:	setupMenuInfo.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 setupMenuInfo+1004
CNSTI4 6
ASGNI4
line 252
;252:	setupMenuInfo.back.generic.name     = ART_BACK0;
ADDRGP4 setupMenuInfo+1004+4
ADDRGP4 $251
ASGNP4
line 253
;253:	setupMenuInfo.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 setupMenuInfo+1004+44
CNSTU4 260
ASGNU4
line 254
;254:	setupMenuInfo.back.generic.id       = ID_BACK;
ADDRGP4 setupMenuInfo+1004+8
CNSTI4 18
ASGNI4
line 255
;255:	setupMenuInfo.back.generic.callback = UI_SetupMenu_Event;
ADDRGP4 setupMenuInfo+1004+48
ADDRGP4 UI_SetupMenu_Event
ASGNP4
line 256
;256:	setupMenuInfo.back.generic.x        = 0;
ADDRGP4 setupMenuInfo+1004+12
CNSTI4 0
ASGNI4
line 257
;257:	setupMenuInfo.back.generic.y        = 480 - 64;
ADDRGP4 setupMenuInfo+1004+16
CNSTI4 416
ASGNI4
line 258
;258:	setupMenuInfo.back.width            = 128;
ADDRGP4 setupMenuInfo+1004+80
CNSTI4 128
ASGNI4
line 259
;259:	setupMenuInfo.back.height           = 64;
ADDRGP4 setupMenuInfo+1004+84
CNSTI4 64
ASGNI4
line 260
;260:	setupMenuInfo.back.focuspic         = ART_BACK1;
ADDRGP4 setupMenuInfo+1004+64
ADDRGP4 $268
ASGNP4
line 262
;261:
;262:	Menu_AddItem(&setupMenuInfo.menu, &setupMenuInfo.banner);
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 263
;263:	Menu_AddItem(&setupMenuInfo.menu, &setupMenuInfo.framel);
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 264
;264:	Menu_AddItem(&setupMenuInfo.menu, &setupMenuInfo.framer);
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 265
;265:	Menu_AddItem(&setupMenuInfo.menu, &setupMenuInfo.setupplayer);
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 266
;266:	Menu_AddItem(&setupMenuInfo.menu, &setupMenuInfo.setupcontrols);
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+624
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 267
;267:	Menu_AddItem(&setupMenuInfo.menu, &setupMenuInfo.setupsystem);
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+700
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 268
;268:	Menu_AddItem(&setupMenuInfo.menu, &setupMenuInfo.game);
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 269
;269:	Menu_AddItem(&setupMenuInfo.menu, &setupMenuInfo.cdkey);
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+852
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 272
;270:	//	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.load );
;271:	//	Menu_AddItem( &setupMenuInfo.menu, &setupMenuInfo.save );
;272:	if (!trap_Cvar_VariableValue("cl_paused")) {
ADDRGP4 $229
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $277
line 273
;273:		Menu_AddItem(&setupMenuInfo.menu, &setupMenuInfo.defaults);
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+928
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 274
;274:	}
LABELV $277
line 275
;275:	Menu_AddItem(&setupMenuInfo.menu, &setupMenuInfo.back);
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 setupMenuInfo+1004
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 276
;276:}
LABELV $94
endproc UI_SetupMenu_Init 12 12
export UI_SetupMenu_Cache
proc UI_SetupMenu_Cache 0 4
line 283
;277:
;278:/*
;279:=================
;280:UI_SetupMenu_Cache
;281:=================
;282:*/
;283:void UI_SetupMenu_Cache(void) {
line 284
;284:	trap_R_RegisterShaderNoMip(ART_BACK0);
ADDRGP4 $251
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 285
;285:	trap_R_RegisterShaderNoMip(ART_BACK1);
ADDRGP4 $268
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 286
;286:	trap_R_RegisterShaderNoMip(ART_FRAMEL);
ADDRGP4 $112
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 287
;287:	trap_R_RegisterShaderNoMip(ART_FRAMER);
ADDRGP4 $126
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 288
;288:}
LABELV $281
endproc UI_SetupMenu_Cache 0 4
export UI_SetupMenu
proc UI_SetupMenu 0 4
line 295
;289:
;290:/*
;291:===============
;292:UI_SetupMenu
;293:===============
;294:*/
;295:void UI_SetupMenu(void) {
line 296
;296:	UI_SetupMenu_Init();
ADDRGP4 UI_SetupMenu_Init
CALLV
pop
line 297
;297:	UI_PushMenu(&setupMenuInfo.menu);
ADDRGP4 setupMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 298
;298:}
LABELV $282
endproc UI_SetupMenu 0 4
bss
align 4
LABELV setupMenuInfo
skip 1096
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
LABELV $268
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
LABELV $251
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
LABELV $243
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 83
byte 1 0
align 1
LABELV $229
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $222
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $204
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 32
byte 1 79
byte 1 80
byte 1 84
byte 1 73
byte 1 79
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $186
byte 1 83
byte 1 89
byte 1 83
byte 1 84
byte 1 69
byte 1 77
byte 1 0
align 1
LABELV $168
byte 1 67
byte 1 79
byte 1 78
byte 1 84
byte 1 82
byte 1 79
byte 1 76
byte 1 83
byte 1 0
align 1
LABELV $150
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $126
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $112
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 50
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $104
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $90
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 84
byte 1 79
byte 1 32
byte 1 68
byte 1 69
byte 1 70
byte 1 65
byte 1 85
byte 1 76
byte 1 84
byte 1 83
byte 1 63
byte 1 0
align 1
LABELV $77
byte 1 111
byte 1 112
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 105
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $76
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 32
byte 1 42
byte 1 65
byte 1 76
byte 1 76
byte 1 42
byte 1 0
align 1
LABELV $74
byte 1 118
byte 1 105
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $73
byte 1 99
byte 1 118
byte 1 97
byte 1 114
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $72
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 32
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 10
byte 1 0
