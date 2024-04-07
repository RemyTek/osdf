data
align 4
LABELV handicap_items
address $69
address $70
address $71
address $72
address $73
address $74
address $75
address $76
address $77
address $78
address $79
address $80
address $81
address $82
address $83
address $84
address $85
address $86
address $87
address $88
byte 4 0
code
proc PlayerSettings_DrawName 88 20
file "../../../../code/q3_ui/ui_playersettings.c"
line 61
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:#define ART_FRAMEL    "menu/art/frame2_l"
;6:#define ART_FRAMER    "menu/art/frame1_r"
;7:#define ART_MODEL0    "menu/art/model_0"
;8:#define ART_MODEL1    "menu/art/model_1"
;9:#define ART_BACK0     "menu/art/back_0"
;10:#define ART_BACK1     "menu/art/back_1"
;11:#define ART_FX_BASE   "menu/art/fx_base"
;12:#define ART_FX_BLUE   "menu/art/fx_blue"
;13:#define ART_FX_CYAN   "menu/art/fx_cyan"
;14:#define ART_FX_GREEN  "menu/art/fx_grn"
;15:#define ART_FX_RED    "menu/art/fx_red"
;16:#define ART_FX_TEAL   "menu/art/fx_teal"
;17:#define ART_FX_WHITE  "menu/art/fx_white"
;18:#define ART_FX_YELLOW "menu/art/fx_yel"
;19:
;20:#define ID_NAME     10
;21:#define ID_HANDICAP 11
;22:#define ID_EFFECTS  12
;23:#define ID_BACK     13
;24:#define ID_MODEL    14
;25:
;26:#define MAX_NAMELENGTH 20
;27:
;28:typedef struct {
;29:	menuframework_s menu;
;30:
;31:	menutext_s      banner;
;32:	menubitmap_s    framel;
;33:	menubitmap_s    framer;
;34:	menubitmap_s    player;
;35:
;36:	menufield_s     name;
;37:	menulist_s      handicap;
;38:	menulist_s      effects;
;39:
;40:	menubitmap_s    back;
;41:	menubitmap_s    model;
;42:	menubitmap_s    item_null;
;43:
;44:	qhandle_t       fxBasePic;
;45:	qhandle_t       fxPic;
;46:	playerInfo_t    playerinfo;
;47:	int             current_fx;
;48:	char            playerModel[MAX_QPATH];
;49:} playersettings_t;
;50:
;51:static playersettings_t s_playersettings;
;52:
;53:static const char*      handicap_items[] = {"None", "95", "90", "85", "80", "75", "70", "65", "60", "55", "50",
;54:                                            "45",   "40", "35", "30", "25", "20", "15", "10", "5",  NULL};
;55:
;56:/*
;57:=================
;58:PlayerSettings_DrawName
;59:=================
;60:*/
;61:static void PlayerSettings_DrawName(void* self) {
line 72
;62:	menufield_s* f;
;63:	qboolean     focus;
;64:	int          style;
;65:	char*        txt;
;66:	char         c;
;67:	float*       color;
;68:	int          n;
;69:	int          basex, x, y;
;70:	char         name[32];
;71:
;72:	f     = (menufield_s*)self;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
line 73
;73:	basex = f->generic.x;
ADDRLP4 36
ADDRLP4 32
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 74
;74:	y     = f->generic.y;
ADDRLP4 24
ADDRLP4 32
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 75
;75:	focus = (f->generic.parent->cursor == f->generic.menuPosition);
ADDRLP4 32
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $91
ADDRLP4 72
CNSTI4 1
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $91
ADDRLP4 72
CNSTI4 0
ASGNI4
LABELV $92
ADDRLP4 28
ADDRLP4 72
INDIRI4
ASGNI4
line 77
;76:
;77:	style = UI_LEFT | UI_SMALLFONT;
ADDRLP4 20
CNSTI4 16
ASGNI4
line 78
;78:	color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
line 79
;79:	if (focus) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $93
line 80
;80:		style |= UI_PULSE;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 81
;81:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
line 82
;82:	}
LABELV $93
line 84
;83:
;84:	UI_DrawProportionalString(basex, y, "Name", style, color);
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 $95
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 87
;85:
;86:	// draw the actual name
;87:	basex += 64;
ADDRLP4 36
ADDRLP4 36
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 88
;88:	y += PROP_HEIGHT;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 27
ADDI4
ASGNI4
line 89
;89:	txt   = f->field.buffer;
ADDRLP4 0
ADDRLP4 32
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
line 90
;90:	color = g_color_table[ColorIndex(COLOR_WHITE)];
ADDRLP4 12
ADDRGP4 g_color_table+112
ASGNP4
line 91
;91:	x     = basex;
ADDRLP4 8
ADDRLP4 36
INDIRI4
ASGNI4
ADDRGP4 $98
JUMPV
LABELV $97
line 92
;92:	while ((c = *txt) != 0) {
line 93
;93:		if (!focus && Q_IsColorString(txt)) {
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $100
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $100
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $100
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $100
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $100
line 94
;94:			n = ColorIndex(*(txt + 1));
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
ASGNI4
line 95
;95:			if (n == 0) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $102
line 96
;96:				n = 7;
ADDRLP4 16
CNSTI4 7
ASGNI4
line 97
;97:			}
LABELV $102
line 98
;98:			color = g_color_table[n];
ADDRLP4 12
ADDRLP4 16
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ASGNP4
line 99
;99:			txt += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 100
;100:			continue;
ADDRGP4 $98
JUMPV
LABELV $100
line 102
;101:		}
;102:		UI_DrawChar(x, y, c, style, color);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 103
;103:		txt++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 104
;104:		x += SMALLCHAR_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 105
;105:	}
LABELV $98
line 92
ADDRLP4 80
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 4
ADDRLP4 80
INDIRI1
ASGNI1
ADDRLP4 80
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $97
line 108
;106:
;107:	// draw cursor if we have focus
;108:	if (focus) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $104
line 109
;109:		if (trap_Key_GetOverstrikeMode()) {
ADDRLP4 84
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $106
line 110
;110:			c = 11;
ADDRLP4 4
CNSTI1 11
ASGNI1
line 111
;111:		} else {
ADDRGP4 $107
JUMPV
LABELV $106
line 112
;112:			c = 10;
ADDRLP4 4
CNSTI1 10
ASGNI1
line 113
;113:		}
LABELV $107
line 115
;114:
;115:		style &= ~UI_PULSE;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 116
;116:		style |= UI_BLINK;
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 118
;117:
;118:		UI_DrawChar(basex + f->field.cursor * SMALLCHAR_WIDTH, y, c, style, color_white);
ADDRLP4 36
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ARGI4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 119
;119:	}
LABELV $104
line 122
;120:
;121:	// draw at bottom also using proportional font
;122:	Q_strncpyz(name, f->field.buffer, sizeof(name));
ADDRLP4 40
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 76
ADDP4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 123
;123:	Q_CleanStr(name);
ADDRLP4 40
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 124
;124:	UI_DrawProportionalString(320, 440, name, UI_CENTER | UI_BIGFONT, text_color_normal);
CNSTI4 320
ARGI4
CNSTI4 440
ARGI4
ADDRLP4 40
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 125
;125:}
LABELV $89
endproc PlayerSettings_DrawName 88 20
proc PlayerSettings_DrawHandicap 32 20
line 132
;126:
;127:/*
;128:=================
;129:PlayerSettings_DrawHandicap
;130:=================
;131:*/
;132:static void PlayerSettings_DrawHandicap(void* self) {
line 138
;133:	menulist_s* item;
;134:	qboolean    focus;
;135:	int         style;
;136:	float*      color;
;137:
;138:	item  = (menulist_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 139
;139:	focus = (item->generic.parent->cursor == item->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $110
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $111
JUMPV
LABELV $110
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $111
ADDRLP4 12
ADDRLP4 16
INDIRI4
ASGNI4
line 141
;140:
;141:	style = UI_LEFT | UI_SMALLFONT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 142
;142:	color = text_color_normal;
ADDRLP4 8
ADDRGP4 text_color_normal
ASGNP4
line 143
;143:	if (focus) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $112
line 144
;144:		style |= UI_PULSE;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 145
;145:		color = text_color_highlight;
ADDRLP4 8
ADDRGP4 text_color_highlight
ASGNP4
line 146
;146:	}
LABELV $112
line 148
;147:
;148:	UI_DrawProportionalString(item->generic.x, item->generic.y, "Handicap", style, color);
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 $114
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 149
;149:	UI_DrawProportionalString(item->generic.x + 64, item->generic.y + PROP_HEIGHT, handicap_items[item->curvalue], style, color);
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 27
ADDI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 handicap_items
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 150
;150:}
LABELV $108
endproc PlayerSettings_DrawHandicap 32 20
proc PlayerSettings_DrawEffects 56 20
line 157
;151:
;152:/*
;153:=================
;154:PlayerSettings_DrawEffects
;155:=================
;156:*/
;157:static void PlayerSettings_DrawEffects(void* self) {
line 165
;158:	menulist_s* item;
;159:	qboolean    focus;
;160:	int         style;
;161:	float*      color;
;162:	vec4_t      colors;
;163:	int         c;
;164:
;165:	item  = (menulist_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 166
;166:	focus = (item->generic.parent->cursor == item->generic.menuPosition);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $117
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $118
JUMPV
LABELV $117
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $118
ADDRLP4 32
ADDRLP4 36
INDIRI4
ASGNI4
line 168
;167:
;168:	style = UI_LEFT | UI_SMALLFONT;
ADDRLP4 24
CNSTI4 16
ASGNI4
line 169
;169:	color = text_color_normal;
ADDRLP4 28
ADDRGP4 text_color_normal
ASGNP4
line 170
;170:	if (focus) {
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $119
line 171
;171:		style |= UI_PULSE;
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 172
;172:		color = text_color_highlight;
ADDRLP4 28
ADDRGP4 text_color_highlight
ASGNP4
line 173
;173:	}
LABELV $119
line 175
;174:
;175:	UI_DrawProportionalString(item->generic.x, item->generic.y, "Effects", style, color);
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ARGI4
ADDRGP4 $121
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
ADDRLP4 28
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 177
;176:
;177:	UI_DrawHandlePic(item->generic.x + 64, item->generic.y + PROP_HEIGHT + 8, 128, 8, s_playersettings.fxBasePic);
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 27
ADDI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 s_playersettings+1472
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 178
;178:	c         = item->curvalue + 1;
ADDRLP4 20
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 179
;179:	colors[0] = (c >> 0) & 1;
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 1
BANDI4
CVIF4 4
ASGNF4
line 180
;180:	colors[1] = (c >> 1) & 1;
ADDRLP4 4+4
ADDRLP4 20
INDIRI4
CNSTI4 1
RSHI4
CNSTI4 1
BANDI4
CVIF4 4
ASGNF4
line 181
;181:	colors[2] = (c >> 2) & 1;
ADDRLP4 4+8
ADDRLP4 20
INDIRI4
CNSTI4 2
RSHI4
CNSTI4 1
BANDI4
CVIF4 4
ASGNF4
line 182
;182:	colors[3] = 1.0;
ADDRLP4 4+12
CNSTF4 1065353216
ASGNF4
line 183
;183:	UI_SetColor(colors);
ADDRLP4 4
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 184
;184:	UI_DrawHandlePic(item->generic.x + 64 + item->curvalue * 16 + 8, item->generic.y + PROP_HEIGHT + 6, 16, 12, s_playersettings.fxPic);
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 64
ADDI4
ADDRLP4 0
INDIRP4
CNSTI4 68
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 27
ADDI4
CNSTI4 6
ADDI4
CVIF4 4
ARGF4
CNSTF4 1098907648
ARGF4
CNSTF4 1094713344
ARGF4
ADDRGP4 s_playersettings+1476
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 185
;185:	UI_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 186
;186:}
LABELV $115
endproc PlayerSettings_DrawEffects 56 20
proc PlayerSettings_DrawPlayer 88 28
line 193
;187:
;188:/*
;189:=================
;190:PlayerSettings_DrawPlayer
;191:=================
;192:*/
;193:static void PlayerSettings_DrawPlayer(void* self) {
line 198
;194:	menubitmap_s* b;
;195:	vec3_t        viewangles;
;196:	char          buf[MAX_QPATH];
;197:
;198:	trap_Cvar_VariableStringBuffer("model", buf, sizeof(buf));
ADDRGP4 $128
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 199
;199:	if (strcmp(buf, s_playersettings.playerModel) != 0) {
ADDRLP4 4
ARGP4
ADDRGP4 s_playersettings+2592
ARGP4
ADDRLP4 80
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 0
EQI4 $129
line 200
;200:		UI_PlayerInfo_SetModel(&s_playersettings.playerinfo, buf);
ADDRGP4 s_playersettings+1480
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 201
;201:		strcpy(s_playersettings.playerModel, buf);
ADDRGP4 s_playersettings+2592
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 203
;202:
;203:		viewangles[YAW]   = 180 - 30;
ADDRLP4 68+4
CNSTF4 1125515264
ASGNF4
line 204
;204:		viewangles[PITCH] = 0;
ADDRLP4 68
CNSTF4 0
ASGNF4
line 205
;205:		viewangles[ROLL]  = 0;
ADDRLP4 68+8
CNSTF4 0
ASGNF4
line 206
;206:		UI_PlayerInfo_SetInfo(&s_playersettings.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse);
ADDRGP4 s_playersettings+1480
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 68
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 207
;207:	}
LABELV $129
line 209
;208:
;209:	b = (menubitmap_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 210
;210:	UI_DrawPlayer(b->generic.x, b->generic.y, b->width, b->height, &s_playersettings.playerinfo, uis.realtime / 2);
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 s_playersettings+1480
ARGP4
ADDRGP4 uis+4
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 211
;211:}
LABELV $127
endproc PlayerSettings_DrawPlayer 88 28
proc PlayerSettings_SaveChanges 0 8
line 218
;212:
;213:/*
;214:=================
;215:PlayerSettings_SaveChanges
;216:=================
;217:*/
;218:static void PlayerSettings_SaveChanges(void) {
line 220
;219:	// name
;220:	trap_Cvar_Set("name", s_playersettings.name.field.buffer);
ADDRGP4 $140
ARGP4
ADDRGP4 s_playersettings+640+64+12
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 223
;221:
;222:	// handicap
;223:	trap_Cvar_SetValue("handicap", 100 - s_playersettings.handicap.curvalue * 5);
ADDRGP4 $144
ARGP4
CNSTI4 100
ADDRGP4 s_playersettings+980+68
INDIRI4
CNSTI4 5
MULI4
SUBI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 226
;224:
;225:	// effects color
;226:	trap_Cvar_SetValue("color1", s_playersettings.effects.curvalue + 1);
ADDRGP4 $147
ARGP4
ADDRGP4 s_playersettings+1088+68
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 227
;227:}
LABELV $139
endproc PlayerSettings_SaveChanges 0 8
proc PlayerSettings_MenuKey 8 8
line 234
;228:
;229:/*
;230:=================
;231:PlayerSettings_MenuKey
;232:=================
;233:*/
;234:static sfxHandle_t PlayerSettings_MenuKey(int key) {
line 235
;235:	if (key == K_MOUSE2 || key == K_ESCAPE) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 179
EQI4 $153
ADDRLP4 0
INDIRI4
CNSTI4 27
NEI4 $151
LABELV $153
line 236
;236:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 237
;237:	}
LABELV $151
line 238
;238:	return Menu_DefaultKey(&s_playersettings.menu, key);
ADDRGP4 s_playersettings
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
LABELV $150
endproc PlayerSettings_MenuKey 8 8
proc PlayerSettings_SetMenuItems 44 28
line 246
;239:}
;240:
;241:/*
;242:=================
;243:PlayerSettings_SetMenuItems
;244:=================
;245:*/
;246:static void PlayerSettings_SetMenuItems(void) {
line 252
;247:	vec3_t viewangles;
;248:	int    c;
;249:	int    h;
;250:
;251:	// name
;252:	Q_strncpyz(s_playersettings.name.field.buffer, UI_Cvar_VariableString("name"), sizeof(s_playersettings.name.field.buffer));
ADDRGP4 $140
ARGP4
ADDRLP4 20
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_playersettings+640+64+12
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 255
;253:
;254:	// effects color
;255:	c = trap_Cvar_VariableValue("color1") - 1;
ADDRGP4 $147
ARGP4
ADDRLP4 24
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 24
INDIRF4
CNSTF4 1065353216
SUBF4
CVFI4 4
ASGNI4
line 256
;256:	if (c < 0 || c > 6) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $163
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $161
LABELV $163
line 257
;257:		c = 6;
ADDRLP4 0
CNSTI4 6
ASGNI4
line 258
;258:	}
LABELV $161
line 259
;259:	s_playersettings.effects.curvalue = c;
ADDRGP4 s_playersettings+1088+68
ADDRLP4 0
INDIRI4
ASGNI4
line 262
;260:
;261:	// model/skin
;262:	memset(&s_playersettings.playerinfo, 0, sizeof(playerInfo_t));
ADDRGP4 s_playersettings+1480
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1108
ARGI4
ADDRGP4 memset
CALLP4
pop
line 264
;263:
;264:	viewangles[YAW]   = 180 - 30;
ADDRLP4 4+4
CNSTF4 1125515264
ASGNF4
line 265
;265:	viewangles[PITCH] = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 266
;266:	viewangles[ROLL]  = 0;
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 268
;267:
;268:	UI_PlayerInfo_SetModel(&s_playersettings.playerinfo, UI_Cvar_VariableString("model"));
ADDRGP4 $128
ARGP4
ADDRLP4 32
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRGP4 s_playersettings+1480
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 269
;269:	UI_PlayerInfo_SetInfo(&s_playersettings.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, vec3_origin, WP_MACHINEGUN, qfalse);
ADDRGP4 s_playersettings+1480
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 vec3_origin
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 272
;270:
;271:	// handicap
;272:	h                                  = Com_Clamp(5, 100, trap_Cvar_VariableValue("handicap"));
ADDRGP4 $144
ARGP4
ADDRLP4 36
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
CNSTF4 1084227584
ARGF4
CNSTF4 1120403456
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 40
INDIRF4
CVFI4 4
ASGNI4
line 273
;273:	s_playersettings.handicap.curvalue = 20 - h / 5;
ADDRGP4 s_playersettings+980+68
CNSTI4 20
ADDRLP4 16
INDIRI4
CNSTI4 5
DIVI4
SUBI4
ASGNI4
line 274
;274:}
LABELV $154
endproc PlayerSettings_SetMenuItems 44 28
proc PlayerSettings_MenuEvent 12 8
line 281
;275:
;276:/*
;277:=================
;278:PlayerSettings_MenuEvent
;279:=================
;280:*/
;281:static void PlayerSettings_MenuEvent(void* ptr, int event) {
line 282
;282:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $174
line 283
;283:		return;
ADDRGP4 $173
JUMPV
LABELV $174
line 286
;284:	}
;285:
;286:	switch (((menucommon_s*)ptr)->id) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 11
EQI4 $179
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $184
ADDRLP4 0
INDIRI4
CNSTI4 14
EQI4 $183
ADDRGP4 $176
JUMPV
LABELV $179
line 288
;287:	case ID_HANDICAP:
;288:		trap_Cvar_Set("handicap", va("%i", 100 - 25 * s_playersettings.handicap.curvalue));
ADDRGP4 $180
ARGP4
CNSTI4 100
ADDRGP4 s_playersettings+980+68
INDIRI4
CNSTI4 25
MULI4
SUBI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $144
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 289
;289:		break;
ADDRGP4 $177
JUMPV
LABELV $183
line 292
;290:
;291:	case ID_MODEL:
;292:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 293
;293:		UI_PlayerModelMenu();
ADDRGP4 UI_PlayerModelMenu
CALLV
pop
line 294
;294:		break;
ADDRGP4 $177
JUMPV
LABELV $184
line 297
;295:
;296:	case ID_BACK:
;297:		PlayerSettings_SaveChanges();
ADDRGP4 PlayerSettings_SaveChanges
CALLV
pop
line 298
;298:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 299
;299:		break;
LABELV $176
LABELV $177
line 301
;300:	}
;301:}
LABELV $173
endproc PlayerSettings_MenuEvent 12 8
proc PlayerSettings_MenuInit 4 12
line 308
;302:
;303:/*
;304:=================
;305:PlayerSettings_MenuInit
;306:=================
;307:*/
;308:static void PlayerSettings_MenuInit(void) {
line 311
;309:	int y;
;310:
;311:	memset(&s_playersettings, 0, sizeof(playersettings_t));
ADDRGP4 s_playersettings
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2656
ARGI4
ADDRGP4 memset
CALLP4
pop
line 313
;312:
;313:	PlayerSettings_Cache();
ADDRGP4 PlayerSettings_Cache
CALLV
pop
line 315
;314:
;315:	s_playersettings.menu.key        = PlayerSettings_MenuKey;
ADDRGP4 s_playersettings+272
ADDRGP4 PlayerSettings_MenuKey
ASGNP4
line 316
;316:	s_playersettings.menu.wrapAround = qtrue;
ADDRGP4 s_playersettings+276
CNSTI4 1
ASGNI4
line 317
;317:	s_playersettings.menu.fullscreen = qtrue;
ADDRGP4 s_playersettings+280
CNSTI4 1
ASGNI4
line 319
;318:
;319:	s_playersettings.banner.generic.type = MTYPE_BTEXT;
ADDRGP4 s_playersettings+288
CNSTI4 10
ASGNI4
line 320
;320:	s_playersettings.banner.generic.x    = 320;
ADDRGP4 s_playersettings+288+12
CNSTI4 320
ASGNI4
line 321
;321:	s_playersettings.banner.generic.y    = 16;
ADDRGP4 s_playersettings+288+16
CNSTI4 16
ASGNI4
line 322
;322:	s_playersettings.banner.string       = "PLAYER SETTINGS";
ADDRGP4 s_playersettings+288+64
ADDRGP4 $196
ASGNP4
line 323
;323:	s_playersettings.banner.color        = color_white;
ADDRGP4 s_playersettings+288+72
ADDRGP4 color_white
ASGNP4
line 324
;324:	s_playersettings.banner.style        = UI_CENTER;
ADDRGP4 s_playersettings+288+68
CNSTI4 1
ASGNI4
line 326
;325:
;326:	s_playersettings.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playersettings+364
CNSTI4 6
ASGNI4
line 327
;327:	s_playersettings.framel.generic.name  = ART_FRAMEL;
ADDRGP4 s_playersettings+364+4
ADDRGP4 $204
ASGNP4
line 328
;328:	s_playersettings.framel.generic.flags = QMF_LEFT_JUSTIFY | QMF_INACTIVE;
ADDRGP4 s_playersettings+364+44
CNSTU4 16388
ASGNU4
line 329
;329:	s_playersettings.framel.generic.x     = 0;
ADDRGP4 s_playersettings+364+12
CNSTI4 0
ASGNI4
line 330
;330:	s_playersettings.framel.generic.y     = 78;
ADDRGP4 s_playersettings+364+16
CNSTI4 78
ASGNI4
line 331
;331:	s_playersettings.framel.width         = 256;
ADDRGP4 s_playersettings+364+80
CNSTI4 256
ASGNI4
line 332
;332:	s_playersettings.framel.height        = 329;
ADDRGP4 s_playersettings+364+84
CNSTI4 329
ASGNI4
line 334
;333:
;334:	s_playersettings.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playersettings+456
CNSTI4 6
ASGNI4
line 335
;335:	s_playersettings.framer.generic.name  = ART_FRAMER;
ADDRGP4 s_playersettings+456+4
ADDRGP4 $218
ASGNP4
line 336
;336:	s_playersettings.framer.generic.flags = QMF_LEFT_JUSTIFY | QMF_INACTIVE;
ADDRGP4 s_playersettings+456+44
CNSTU4 16388
ASGNU4
line 337
;337:	s_playersettings.framer.generic.x     = 376;
ADDRGP4 s_playersettings+456+12
CNSTI4 376
ASGNI4
line 338
;338:	s_playersettings.framer.generic.y     = 76;
ADDRGP4 s_playersettings+456+16
CNSTI4 76
ASGNI4
line 339
;339:	s_playersettings.framer.width         = 256;
ADDRGP4 s_playersettings+456+80
CNSTI4 256
ASGNI4
line 340
;340:	s_playersettings.framer.height        = 334;
ADDRGP4 s_playersettings+456+84
CNSTI4 334
ASGNI4
line 342
;341:
;342:	y                                        = 144;
ADDRLP4 0
CNSTI4 144
ASGNI4
line 343
;343:	s_playersettings.name.generic.type       = MTYPE_FIELD;
ADDRGP4 s_playersettings+640
CNSTI4 4
ASGNI4
line 344
;344:	s_playersettings.name.generic.flags      = QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+640+44
CNSTU4 32768
ASGNU4
line 345
;345:	s_playersettings.name.generic.ownerdraw  = PlayerSettings_DrawName;
ADDRGP4 s_playersettings+640+56
ADDRGP4 PlayerSettings_DrawName
ASGNP4
line 346
;346:	s_playersettings.name.field.widthInChars = MAX_NAMELENGTH;
ADDRGP4 s_playersettings+640+64+8
CNSTI4 20
ASGNI4
line 347
;347:	s_playersettings.name.field.maxchars     = MAX_NAMELENGTH;
ADDRGP4 s_playersettings+640+64+268
CNSTI4 20
ASGNI4
line 348
;348:	s_playersettings.name.generic.x          = 192;
ADDRGP4 s_playersettings+640+12
CNSTI4 192
ASGNI4
line 349
;349:	s_playersettings.name.generic.y          = y;
ADDRGP4 s_playersettings+640+16
ADDRLP4 0
INDIRI4
ASGNI4
line 350
;350:	s_playersettings.name.generic.left       = 192 - 8;
ADDRGP4 s_playersettings+640+20
CNSTI4 184
ASGNI4
line 351
;351:	s_playersettings.name.generic.top        = y - 8;
ADDRGP4 s_playersettings+640+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 352
;352:	s_playersettings.name.generic.right      = 192 + 200;
ADDRGP4 s_playersettings+640+28
CNSTI4 392
ASGNI4
line 353
;353:	s_playersettings.name.generic.bottom     = y + 2 * PROP_HEIGHT;
ADDRGP4 s_playersettings+640+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 355
;354:
;355:	y += 3 * PROP_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 81
ADDI4
ASGNI4
line 356
;356:	s_playersettings.handicap.generic.type      = MTYPE_SPINCONTROL;
ADDRGP4 s_playersettings+980
CNSTI4 3
ASGNI4
line 357
;357:	s_playersettings.handicap.generic.flags     = QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+980+44
CNSTU4 32768
ASGNU4
line 358
;358:	s_playersettings.handicap.generic.id        = ID_HANDICAP;
ADDRGP4 s_playersettings+980+8
CNSTI4 11
ASGNI4
line 359
;359:	s_playersettings.handicap.generic.ownerdraw = PlayerSettings_DrawHandicap;
ADDRGP4 s_playersettings+980+56
ADDRGP4 PlayerSettings_DrawHandicap
ASGNP4
line 360
;360:	s_playersettings.handicap.generic.x         = 192;
ADDRGP4 s_playersettings+980+12
CNSTI4 192
ASGNI4
line 361
;361:	s_playersettings.handicap.generic.y         = y;
ADDRGP4 s_playersettings+980+16
ADDRLP4 0
INDIRI4
ASGNI4
line 362
;362:	s_playersettings.handicap.generic.left      = 192 - 8;
ADDRGP4 s_playersettings+980+20
CNSTI4 184
ASGNI4
line 363
;363:	s_playersettings.handicap.generic.top       = y - 8;
ADDRGP4 s_playersettings+980+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 364
;364:	s_playersettings.handicap.generic.right     = 192 + 200;
ADDRGP4 s_playersettings+980+28
CNSTI4 392
ASGNI4
line 365
;365:	s_playersettings.handicap.generic.bottom    = y + 2 * PROP_HEIGHT;
ADDRGP4 s_playersettings+980+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 366
;366:	s_playersettings.handicap.numitems          = 20;
ADDRGP4 s_playersettings+980+72
CNSTI4 20
ASGNI4
line 368
;367:
;368:	y += 3 * PROP_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 81
ADDI4
ASGNI4
line 369
;369:	s_playersettings.effects.generic.type      = MTYPE_SPINCONTROL;
ADDRGP4 s_playersettings+1088
CNSTI4 3
ASGNI4
line 370
;370:	s_playersettings.effects.generic.flags     = QMF_NODEFAULTINIT;
ADDRGP4 s_playersettings+1088+44
CNSTU4 32768
ASGNU4
line 371
;371:	s_playersettings.effects.generic.id        = ID_EFFECTS;
ADDRGP4 s_playersettings+1088+8
CNSTI4 12
ASGNI4
line 372
;372:	s_playersettings.effects.generic.ownerdraw = PlayerSettings_DrawEffects;
ADDRGP4 s_playersettings+1088+56
ADDRGP4 PlayerSettings_DrawEffects
ASGNP4
line 373
;373:	s_playersettings.effects.generic.x         = 192;
ADDRGP4 s_playersettings+1088+12
CNSTI4 192
ASGNI4
line 374
;374:	s_playersettings.effects.generic.y         = y;
ADDRGP4 s_playersettings+1088+16
ADDRLP4 0
INDIRI4
ASGNI4
line 375
;375:	s_playersettings.effects.generic.left      = 192 - 8;
ADDRGP4 s_playersettings+1088+20
CNSTI4 184
ASGNI4
line 376
;376:	s_playersettings.effects.generic.top       = y - 8;
ADDRGP4 s_playersettings+1088+24
ADDRLP4 0
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 377
;377:	s_playersettings.effects.generic.right     = 192 + 200;
ADDRGP4 s_playersettings+1088+28
CNSTI4 392
ASGNI4
line 378
;378:	s_playersettings.effects.generic.bottom    = y + 2 * PROP_HEIGHT;
ADDRGP4 s_playersettings+1088+32
ADDRLP4 0
INDIRI4
CNSTI4 54
ADDI4
ASGNI4
line 379
;379:	s_playersettings.effects.numitems          = 7;
ADDRGP4 s_playersettings+1088+72
CNSTI4 7
ASGNI4
line 381
;380:
;381:	s_playersettings.model.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_playersettings+1288
CNSTI4 6
ASGNI4
line 382
;382:	s_playersettings.model.generic.name     = ART_MODEL0;
ADDRGP4 s_playersettings+1288+4
ADDRGP4 $297
ASGNP4
line 383
;383:	s_playersettings.model.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_playersettings+1288+44
CNSTU4 272
ASGNU4
line 384
;384:	s_playersettings.model.generic.id       = ID_MODEL;
ADDRGP4 s_playersettings+1288+8
CNSTI4 14
ASGNI4
line 385
;385:	s_playersettings.model.generic.callback = PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+1288+48
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 386
;386:	s_playersettings.model.generic.x        = 640;
ADDRGP4 s_playersettings+1288+12
CNSTI4 640
ASGNI4
line 387
;387:	s_playersettings.model.generic.y        = 480 - 64;
ADDRGP4 s_playersettings+1288+16
CNSTI4 416
ASGNI4
line 388
;388:	s_playersettings.model.width            = 128;
ADDRGP4 s_playersettings+1288+80
CNSTI4 128
ASGNI4
line 389
;389:	s_playersettings.model.height           = 64;
ADDRGP4 s_playersettings+1288+84
CNSTI4 64
ASGNI4
line 390
;390:	s_playersettings.model.focuspic         = ART_MODEL1;
ADDRGP4 s_playersettings+1288+64
ADDRGP4 $314
ASGNP4
line 392
;391:
;392:	s_playersettings.player.generic.type      = MTYPE_BITMAP;
ADDRGP4 s_playersettings+548
CNSTI4 6
ASGNI4
line 393
;393:	s_playersettings.player.generic.flags     = QMF_INACTIVE;
ADDRGP4 s_playersettings+548+44
CNSTU4 16384
ASGNU4
line 394
;394:	s_playersettings.player.generic.ownerdraw = PlayerSettings_DrawPlayer;
ADDRGP4 s_playersettings+548+56
ADDRGP4 PlayerSettings_DrawPlayer
ASGNP4
line 395
;395:	s_playersettings.player.generic.x         = 400;
ADDRGP4 s_playersettings+548+12
CNSTI4 400
ASGNI4
line 396
;396:	s_playersettings.player.generic.y         = -40;
ADDRGP4 s_playersettings+548+16
CNSTI4 -40
ASGNI4
line 397
;397:	s_playersettings.player.width             = 32 * 10;
ADDRGP4 s_playersettings+548+80
CNSTI4 320
ASGNI4
line 398
;398:	s_playersettings.player.height            = 56 * 10;
ADDRGP4 s_playersettings+548+84
CNSTI4 560
ASGNI4
line 400
;399:
;400:	s_playersettings.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_playersettings+1196
CNSTI4 6
ASGNI4
line 401
;401:	s_playersettings.back.generic.name     = ART_BACK0;
ADDRGP4 s_playersettings+1196+4
ADDRGP4 $331
ASGNP4
line 402
;402:	s_playersettings.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_playersettings+1196+44
CNSTU4 260
ASGNU4
line 403
;403:	s_playersettings.back.generic.id       = ID_BACK;
ADDRGP4 s_playersettings+1196+8
CNSTI4 13
ASGNI4
line 404
;404:	s_playersettings.back.generic.callback = PlayerSettings_MenuEvent;
ADDRGP4 s_playersettings+1196+48
ADDRGP4 PlayerSettings_MenuEvent
ASGNP4
line 405
;405:	s_playersettings.back.generic.x        = 0;
ADDRGP4 s_playersettings+1196+12
CNSTI4 0
ASGNI4
line 406
;406:	s_playersettings.back.generic.y        = 480 - 64;
ADDRGP4 s_playersettings+1196+16
CNSTI4 416
ASGNI4
line 407
;407:	s_playersettings.back.width            = 128;
ADDRGP4 s_playersettings+1196+80
CNSTI4 128
ASGNI4
line 408
;408:	s_playersettings.back.height           = 64;
ADDRGP4 s_playersettings+1196+84
CNSTI4 64
ASGNI4
line 409
;409:	s_playersettings.back.focuspic         = ART_BACK1;
ADDRGP4 s_playersettings+1196+64
ADDRGP4 $348
ASGNP4
line 411
;410:
;411:	s_playersettings.item_null.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playersettings+1380
CNSTI4 6
ASGNI4
line 412
;412:	s_playersettings.item_null.generic.flags = QMF_LEFT_JUSTIFY | QMF_MOUSEONLY | QMF_SILENT;
ADDRGP4 s_playersettings+1380+44
CNSTU4 1050628
ASGNU4
line 413
;413:	s_playersettings.item_null.generic.x     = 0;
ADDRGP4 s_playersettings+1380+12
CNSTI4 0
ASGNI4
line 414
;414:	s_playersettings.item_null.generic.y     = 0;
ADDRGP4 s_playersettings+1380+16
CNSTI4 0
ASGNI4
line 415
;415:	s_playersettings.item_null.width         = 640;
ADDRGP4 s_playersettings+1380+80
CNSTI4 640
ASGNI4
line 416
;416:	s_playersettings.item_null.height        = 480;
ADDRGP4 s_playersettings+1380+84
CNSTI4 480
ASGNI4
line 418
;417:
;418:	Menu_AddItem(&s_playersettings.menu, &s_playersettings.banner);
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 419
;419:	Menu_AddItem(&s_playersettings.menu, &s_playersettings.framel);
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 420
;420:	Menu_AddItem(&s_playersettings.menu, &s_playersettings.framer);
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 422
;421:
;422:	Menu_AddItem(&s_playersettings.menu, &s_playersettings.name);
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+640
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 423
;423:	Menu_AddItem(&s_playersettings.menu, &s_playersettings.handicap);
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+980
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 424
;424:	Menu_AddItem(&s_playersettings.menu, &s_playersettings.effects);
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1088
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 425
;425:	Menu_AddItem(&s_playersettings.menu, &s_playersettings.model);
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 426
;426:	Menu_AddItem(&s_playersettings.menu, &s_playersettings.back);
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1196
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 428
;427:
;428:	Menu_AddItem(&s_playersettings.menu, &s_playersettings.player);
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 430
;429:
;430:	Menu_AddItem(&s_playersettings.menu, &s_playersettings.item_null);
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 s_playersettings+1380
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 432
;431:
;432:	PlayerSettings_SetMenuItems();
ADDRGP4 PlayerSettings_SetMenuItems
CALLV
pop
line 433
;433:}
LABELV $185
endproc PlayerSettings_MenuInit 4 12
export PlayerSettings_Cache
proc PlayerSettings_Cache 8 4
line 440
;434:
;435:/*
;436:=================
;437:PlayerSettings_Cache
;438:=================
;439:*/
;440:void PlayerSettings_Cache(void) {
line 441
;441:	trap_R_RegisterShaderNoMip(ART_FRAMEL);
ADDRGP4 $204
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 442
;442:	trap_R_RegisterShaderNoMip(ART_FRAMER);
ADDRGP4 $218
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 443
;443:	trap_R_RegisterShaderNoMip(ART_MODEL0);
ADDRGP4 $297
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 444
;444:	trap_R_RegisterShaderNoMip(ART_MODEL1);
ADDRGP4 $314
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 445
;445:	trap_R_RegisterShaderNoMip(ART_BACK0);
ADDRGP4 $331
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 446
;446:	trap_R_RegisterShaderNoMip(ART_BACK1);
ADDRGP4 $348
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 448
;447:
;448:	s_playersettings.fxBasePic = trap_R_RegisterShaderNoMip(ART_FX_BASE);
ADDRGP4 $372
ARGP4
ADDRLP4 0
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1472
ADDRLP4 0
INDIRI4
ASGNI4
line 449
;449:	s_playersettings.fxPic     = trap_R_RegisterShaderNoMip(ART_FX_WHITE);
ADDRGP4 $374
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 s_playersettings+1476
ADDRLP4 4
INDIRI4
ASGNI4
line 450
;450:}
LABELV $370
endproc PlayerSettings_Cache 8 4
export UI_PlayerSettingsMenu
proc UI_PlayerSettingsMenu 0 4
line 457
;451:
;452:/*
;453:=================
;454:UI_PlayerSettingsMenu
;455:=================
;456:*/
;457:void UI_PlayerSettingsMenu(void) {
line 458
;458:	PlayerSettings_MenuInit();
ADDRGP4 PlayerSettings_MenuInit
CALLV
pop
line 459
;459:	UI_PushMenu(&s_playersettings.menu);
ADDRGP4 s_playersettings
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 460
;460:}
LABELV $375
endproc UI_PlayerSettingsMenu 0 4
bss
align 4
LABELV s_playersettings
skip 2656
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
LABELV $374
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
byte 1 120
byte 1 95
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $372
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
byte 1 120
byte 1 95
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $348
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
LABELV $331
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
LABELV $314
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
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $297
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
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $218
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
LABELV $196
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 84
byte 1 73
byte 1 78
byte 1 71
byte 1 83
byte 1 0
align 1
LABELV $180
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $147
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $144
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $140
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $128
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $121
byte 1 69
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $114
byte 1 72
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $95
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $88
byte 1 53
byte 1 0
align 1
LABELV $87
byte 1 49
byte 1 48
byte 1 0
align 1
LABELV $86
byte 1 49
byte 1 53
byte 1 0
align 1
LABELV $85
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $84
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $83
byte 1 51
byte 1 48
byte 1 0
align 1
LABELV $82
byte 1 51
byte 1 53
byte 1 0
align 1
LABELV $81
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $80
byte 1 52
byte 1 53
byte 1 0
align 1
LABELV $79
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $78
byte 1 53
byte 1 53
byte 1 0
align 1
LABELV $77
byte 1 54
byte 1 48
byte 1 0
align 1
LABELV $76
byte 1 54
byte 1 53
byte 1 0
align 1
LABELV $75
byte 1 55
byte 1 48
byte 1 0
align 1
LABELV $74
byte 1 55
byte 1 53
byte 1 0
align 1
LABELV $73
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $72
byte 1 56
byte 1 53
byte 1 0
align 1
LABELV $71
byte 1 57
byte 1 48
byte 1 0
align 1
LABELV $70
byte 1 57
byte 1 53
byte 1 0
align 1
LABELV $69
byte 1 78
byte 1 111
byte 1 110
byte 1 101
byte 1 0
