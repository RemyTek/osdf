data
align 4
LABELV driverinfo_artlist
address $68
address $69
address $70
address $71
byte 4 0
code
proc DriverInfo_Event 4 0
file "../../../../code/q3_ui/ui_video.c"
line 44
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:void GraphicsOptions_MenuInit(void);
;6:
;7:/*
;8:=======================================================================
;9:
;10:DRIVER INFORMATION MENU
;11:
;12:=======================================================================
;13:*/
;14:
;15:#define DRIVERINFO_FRAMEL "menu/art/frame2_l"
;16:#define DRIVERINFO_FRAMER "menu/art/frame1_r"
;17:#define DRIVERINFO_BACK0  "menu/art/back_0"
;18:#define DRIVERINFO_BACK1  "menu/art/back_1"
;19:
;20:static char* driverinfo_artlist[] = {
;21:	DRIVERINFO_FRAMEL, DRIVERINFO_FRAMER, DRIVERINFO_BACK0, DRIVERINFO_BACK1, NULL,
;22:};
;23:
;24:#define ID_DRIVERINFOBACK 100
;25:
;26:typedef struct {
;27:	menuframework_s menu;
;28:	menutext_s      banner;
;29:	menubitmap_s    back;
;30:	menubitmap_s    framel;
;31:	menubitmap_s    framer;
;32:	char            stringbuff[1024];
;33:	char*           strings[64];
;34:	int             numstrings;
;35:} driverinfo_t;
;36:
;37:static driverinfo_t s_driverinfo;
;38:
;39:/*
;40:=================
;41:DriverInfo_Event
;42:=================
;43:*/
;44:static void DriverInfo_Event(void* ptr, int event) {
line 45
;45:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $74
line 46
;46:		return;
ADDRGP4 $73
JUMPV
LABELV $74
line 48
;47:
;48:	switch (((menucommon_s*)ptr)->id) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 100
EQI4 $79
ADDRGP4 $76
JUMPV
LABELV $79
line 50
;49:	case ID_DRIVERINFOBACK:
;50:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 51
;51:		break;
LABELV $76
LABELV $77
line 53
;52:	}
;53:}
LABELV $73
endproc DriverInfo_Event 4 0
proc DriverInfo_MenuDraw 12 20
line 60
;54:
;55:/*
;56:=================
;57:DriverInfo_MenuDraw
;58:=================
;59:*/
;60:static void DriverInfo_MenuDraw(void) {
line 64
;61:	int i;
;62:	int y;
;63:
;64:	Menu_Draw(&s_driverinfo.menu);
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 66
;65:
;66:	UI_DrawString(320, 80, "VENDOR", UI_CENTER | UI_SMALLFONT, color_red);
CNSTI4 320
ARGI4
CNSTI4 80
ARGI4
ADDRGP4 $81
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 67
;67:	UI_DrawString(320, 152, "PIXELFORMAT", UI_CENTER | UI_SMALLFONT, color_red);
CNSTI4 320
ARGI4
CNSTI4 152
ARGI4
ADDRGP4 $82
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 68
;68:	UI_DrawString(320, 192, "EXTENSIONS", UI_CENTER | UI_SMALLFONT, color_red);
CNSTI4 320
ARGI4
CNSTI4 192
ARGI4
ADDRGP4 $83
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 70
;69:
;70:	UI_DrawString(320, 80 + 16, uis.glconfig.vendor_string, UI_CENTER | UI_SMALLFONT, text_color_normal);
CNSTI4 320
ARGI4
CNSTI4 96
ARGI4
ADDRGP4 uis+56+1024
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 71
;71:	UI_DrawString(320, 96 + 16, uis.glconfig.version_string, UI_CENTER | UI_SMALLFONT, text_color_normal);
CNSTI4 320
ARGI4
CNSTI4 112
ARGI4
ADDRGP4 uis+56+2048
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 72
;72:	UI_DrawString(320, 112 + 16, uis.glconfig.renderer_string, UI_CENTER | UI_SMALLFONT, text_color_normal);
CNSTI4 320
ARGI4
CNSTI4 128
ARGI4
ADDRGP4 uis+56
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 73
;73:	UI_DrawString(
ADDRGP4 $89
ARGP4
ADDRGP4 uis+56+11272
INDIRI4
ARGI4
ADDRGP4 uis+56+11276
INDIRI4
ARGI4
ADDRGP4 uis+56+11280
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 320
ARGI4
CNSTI4 168
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 78
;74:		320, 152 + 16, va("color(%d-bits) Z(%d-bits) stencil(%d-bits)", uis.glconfig.colorBits, uis.glconfig.depthBits, uis.glconfig.stencilBits),
;75:		UI_CENTER | UI_SMALLFONT, text_color_normal);
;76:
;77:	// double column
;78:	y = 192 + 16;
ADDRLP4 4
CNSTI4 208
ASGNI4
line 79
;79:	for (i = 0; i < s_driverinfo.numstrings / 2; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $99
JUMPV
LABELV $96
line 80
;80:		UI_DrawString(320 - 4, y, s_driverinfo.strings[i * 2], UI_RIGHT | UI_SMALLFONT, text_color_normal);
CNSTI4 316
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664
ADDP4
INDIRP4
ARGP4
CNSTI4 18
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 81
;81:		UI_DrawString(320 + 4, y, s_driverinfo.strings[i * 2 + 1], UI_LEFT | UI_SMALLFONT, text_color_normal);
CNSTI4 324
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664+4
ADDP4
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 82
;82:		y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 83
;83:	}
LABELV $97
line 79
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $99
ADDRLP4 0
INDIRI4
ADDRGP4 s_driverinfo+1920
INDIRI4
CNSTI4 2
DIVI4
LTI4 $96
line 85
;84:
;85:	if (s_driverinfo.numstrings & 1)
ADDRGP4 s_driverinfo+1920
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $104
line 86
;86:		UI_DrawString(320, y, s_driverinfo.strings[s_driverinfo.numstrings - 1], UI_CENTER | UI_SMALLFONT, text_color_normal);
CNSTI4 320
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 s_driverinfo+1920
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664-4
ADDP4
INDIRP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 text_color_normal
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
LABELV $104
line 87
;87:}
LABELV $80
endproc DriverInfo_MenuDraw 12 20
export DriverInfo_Cache
proc DriverInfo_Cache 4 4
line 94
;88:
;89:/*
;90:=================
;91:DriverInfo_Cache
;92:=================
;93:*/
;94:void DriverInfo_Cache(void) {
line 98
;95:	int i;
;96:
;97:	// touch all our pics
;98:	for (i = 0;; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $111
line 99
;99:		if (!driverinfo_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 driverinfo_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $115
line 100
;100:			break;
ADDRGP4 $113
JUMPV
LABELV $115
line 101
;101:		trap_R_RegisterShaderNoMip(driverinfo_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 driverinfo_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 102
;102:	}
LABELV $112
line 98
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $111
JUMPV
LABELV $113
line 103
;103:}
LABELV $110
endproc DriverInfo_Cache 4 4
proc UI_DriverInfo_Menu 32 12
line 110
;104:
;105:/*
;106:=================
;107:UI_DriverInfo_Menu
;108:=================
;109:*/
;110:static void UI_DriverInfo_Menu(void) {
line 116
;111:	char* eptr;
;112:	int   i;
;113:	int   len;
;114:
;115:	// zero set all our globals
;116:	memset(&s_driverinfo, 0, sizeof(driverinfo_t));
ADDRGP4 s_driverinfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1924
ARGI4
ADDRGP4 memset
CALLP4
pop
line 118
;117:
;118:	DriverInfo_Cache();
ADDRGP4 DriverInfo_Cache
CALLV
pop
line 120
;119:
;120:	s_driverinfo.menu.fullscreen = qtrue;
ADDRGP4 s_driverinfo+280
CNSTI4 1
ASGNI4
line 121
;121:	s_driverinfo.menu.draw       = DriverInfo_MenuDraw;
ADDRGP4 s_driverinfo+268
ADDRGP4 DriverInfo_MenuDraw
ASGNP4
line 123
;122:
;123:	s_driverinfo.banner.generic.type = MTYPE_BTEXT;
ADDRGP4 s_driverinfo+288
CNSTI4 10
ASGNI4
line 124
;124:	s_driverinfo.banner.generic.x    = 320;
ADDRGP4 s_driverinfo+288+12
CNSTI4 320
ASGNI4
line 125
;125:	s_driverinfo.banner.generic.y    = 16;
ADDRGP4 s_driverinfo+288+16
CNSTI4 16
ASGNI4
line 126
;126:	s_driverinfo.banner.string       = "DRIVER INFO";
ADDRGP4 s_driverinfo+288+64
ADDRGP4 $127
ASGNP4
line 127
;127:	s_driverinfo.banner.color        = color_white;
ADDRGP4 s_driverinfo+288+72
ADDRGP4 color_white
ASGNP4
line 128
;128:	s_driverinfo.banner.style        = UI_CENTER;
ADDRGP4 s_driverinfo+288+68
CNSTI4 1
ASGNI4
line 130
;129:
;130:	s_driverinfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+456
CNSTI4 6
ASGNI4
line 131
;131:	s_driverinfo.framel.generic.name  = DRIVERINFO_FRAMEL;
ADDRGP4 s_driverinfo+456+4
ADDRGP4 $68
ASGNP4
line 132
;132:	s_driverinfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_driverinfo+456+44
CNSTU4 16384
ASGNU4
line 133
;133:	s_driverinfo.framel.generic.x     = 0;
ADDRGP4 s_driverinfo+456+12
CNSTI4 0
ASGNI4
line 134
;134:	s_driverinfo.framel.generic.y     = 78;
ADDRGP4 s_driverinfo+456+16
CNSTI4 78
ASGNI4
line 135
;135:	s_driverinfo.framel.width         = 256;
ADDRGP4 s_driverinfo+456+80
CNSTI4 256
ASGNI4
line 136
;136:	s_driverinfo.framel.height        = 329;
ADDRGP4 s_driverinfo+456+84
CNSTI4 329
ASGNI4
line 138
;137:
;138:	s_driverinfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+548
CNSTI4 6
ASGNI4
line 139
;139:	s_driverinfo.framer.generic.name  = DRIVERINFO_FRAMER;
ADDRGP4 s_driverinfo+548+4
ADDRGP4 $69
ASGNP4
line 140
;140:	s_driverinfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_driverinfo+548+44
CNSTU4 16384
ASGNU4
line 141
;141:	s_driverinfo.framer.generic.x     = 376;
ADDRGP4 s_driverinfo+548+12
CNSTI4 376
ASGNI4
line 142
;142:	s_driverinfo.framer.generic.y     = 76;
ADDRGP4 s_driverinfo+548+16
CNSTI4 76
ASGNI4
line 143
;143:	s_driverinfo.framer.width         = 256;
ADDRGP4 s_driverinfo+548+80
CNSTI4 256
ASGNI4
line 144
;144:	s_driverinfo.framer.height        = 334;
ADDRGP4 s_driverinfo+548+84
CNSTI4 334
ASGNI4
line 146
;145:
;146:	s_driverinfo.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_driverinfo+364
CNSTI4 6
ASGNI4
line 147
;147:	s_driverinfo.back.generic.name     = DRIVERINFO_BACK0;
ADDRGP4 s_driverinfo+364+4
ADDRGP4 $70
ASGNP4
line 148
;148:	s_driverinfo.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_driverinfo+364+44
CNSTU4 260
ASGNU4
line 149
;149:	s_driverinfo.back.generic.callback = DriverInfo_Event;
ADDRGP4 s_driverinfo+364+48
ADDRGP4 DriverInfo_Event
ASGNP4
line 150
;150:	s_driverinfo.back.generic.id       = ID_DRIVERINFOBACK;
ADDRGP4 s_driverinfo+364+8
CNSTI4 100
ASGNI4
line 151
;151:	s_driverinfo.back.generic.x        = 0;
ADDRGP4 s_driverinfo+364+12
CNSTI4 0
ASGNI4
line 152
;152:	s_driverinfo.back.generic.y        = 480 - 64;
ADDRGP4 s_driverinfo+364+16
CNSTI4 416
ASGNI4
line 153
;153:	s_driverinfo.back.width            = 128;
ADDRGP4 s_driverinfo+364+80
CNSTI4 128
ASGNI4
line 154
;154:	s_driverinfo.back.height           = 64;
ADDRGP4 s_driverinfo+364+84
CNSTI4 64
ASGNI4
line 155
;155:	s_driverinfo.back.focuspic         = DRIVERINFO_BACK1;
ADDRGP4 s_driverinfo+364+64
ADDRGP4 $71
ASGNP4
line 161
;156:
;157:	// TTimo: overflow with particularly long GL extensions (such as the gf3)
;158:	// https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=399
;159:	// NOTE: could have pushed the size of stringbuff, but the list is already out of the screen
;160:	// (no matter what your resolution)
;161:	Q_strncpyz(s_driverinfo.stringbuff, uis.glconfig.extensions_string, 1024);
ADDRGP4 s_driverinfo+640
ARGP4
ADDRGP4 uis+56+3072
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 164
;162:
;163:	// build null terminated extension strings
;164:	eptr = s_driverinfo.stringbuff;
ADDRLP4 0
ADDRGP4 s_driverinfo+640
ASGNP4
ADDRGP4 $182
JUMPV
line 165
;165:	while (s_driverinfo.numstrings < 40 && *eptr) {
LABELV $185
line 167
;166:		while (*eptr == ' ')
;167:			*eptr++ = '\0';
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI1 0
ASGNI1
LABELV $186
line 166
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $185
line 170
;168:
;169:		// track start of valid string
;170:		if (*eptr && *eptr != ' ')
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $193
ADDRLP4 16
INDIRI4
CNSTI4 32
EQI4 $193
line 171
;171:			s_driverinfo.strings[s_driverinfo.numstrings++] = eptr;
ADDRLP4 24
ADDRGP4 s_driverinfo+1920
ASGNP4
ADDRLP4 20
ADDRLP4 24
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRP4
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $193
JUMPV
LABELV $192
line 174
;172:
;173:		while (*eptr && *eptr != ' ')
;174:			eptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $193
line 173
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $195
ADDRLP4 28
INDIRI4
CNSTI4 32
NEI4 $192
LABELV $195
line 175
;175:	}
LABELV $182
line 165
ADDRGP4 s_driverinfo+1920
INDIRI4
CNSTI4 40
GEI4 $196
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $186
LABELV $196
line 178
;176:
;177:	// safety length strings for display
;178:	for (i = 0; i < s_driverinfo.numstrings; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $200
JUMPV
LABELV $197
line 179
;179:		len = strlen(s_driverinfo.strings[i]);
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
line 180
;180:		if (len > 32) {
ADDRLP4 8
INDIRI4
CNSTI4 32
LEI4 $203
line 181
;181:			s_driverinfo.strings[i][len - 1] = '>';
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664
ADDP4
INDIRP4
ADDP4
CNSTI1 62
ASGNI1
line 182
;182:			s_driverinfo.strings[i][len]     = '\0';
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_driverinfo+1664
ADDP4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 183
;183:		}
LABELV $203
line 184
;184:	}
LABELV $198
line 178
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $200
ADDRLP4 4
INDIRI4
ADDRGP4 s_driverinfo+1920
INDIRI4
LTI4 $197
line 186
;185:
;186:	Menu_AddItem(&s_driverinfo.menu, &s_driverinfo.banner);
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 187
;187:	Menu_AddItem(&s_driverinfo.menu, &s_driverinfo.framel);
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 188
;188:	Menu_AddItem(&s_driverinfo.menu, &s_driverinfo.framer);
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 189
;189:	Menu_AddItem(&s_driverinfo.menu, &s_driverinfo.back);
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 s_driverinfo+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 191
;190:
;191:	UI_PushMenu(&s_driverinfo.menu);
ADDRGP4 s_driverinfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 192
;192:}
LABELV $117
endproc UI_DriverInfo_Menu 32 12
data
align 4
LABELV s_ivo_templates
byte 4 4
byte 4 1
byte 4 2
byte 4 0
byte 4 2
byte 4 2
byte 4 1
byte 4 1
byte 4 1
byte 4 3
byte 4 1
byte 4 2
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 0
byte 4 1
byte 4 2
byte 4 1
byte 4 1
byte 4 0
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 2
byte 4 1
byte 4 1
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 3
byte 4 1
byte 4 1
byte 4 0
byte 4 0
byte 4 0
byte 4 1
byte 4 0
byte 4 1
code
proc GraphicsOptions_GetInitialVideo 0 0
line 279
;193:
;194:/*
;195:=======================================================================
;196:
;197:GRAPHICS OPTIONS MENU
;198:
;199:=======================================================================
;200:*/
;201:
;202:#define GRAPHICSOPTIONS_FRAMEL  "menu/art/frame2_l"
;203:#define GRAPHICSOPTIONS_FRAMER  "menu/art/frame1_r"
;204:#define GRAPHICSOPTIONS_BACK0   "menu/art/back_0"
;205:#define GRAPHICSOPTIONS_BACK1   "menu/art/back_1"
;206:#define GRAPHICSOPTIONS_ACCEPT0 "menu/art/accept_0"
;207:#define GRAPHICSOPTIONS_ACCEPT1 "menu/art/accept_1"
;208:
;209:#define ID_BACK2      101
;210:#define ID_FULLSCREEN 102
;211:#define ID_LIST       103
;212:#define ID_MODE       104
;213:#define ID_DRIVERINFO 105
;214:#define ID_GRAPHICS   106
;215:#define ID_DISPLAY    107
;216:#define ID_SOUND      108
;217:#define ID_NETWORK    109
;218:
;219:typedef struct {
;220:	menuframework_s menu;
;221:
;222:	menutext_s      banner;
;223:	menubitmap_s    framel;
;224:	menubitmap_s    framer;
;225:
;226:	menutext_s      graphics;
;227:	menutext_s      display;
;228:	menutext_s      sound;
;229:	menutext_s      network;
;230:
;231:	menulist_s      list;
;232:	menulist_s      mode;
;233:	menuslider_s    tq;
;234:	menulist_s      fs;
;235:	menulist_s      lighting;
;236:	menulist_s      allow_extensions;
;237:	menulist_s      texturebits;
;238:	menulist_s      colordepth;
;239:	menulist_s      geometry;
;240:	menulist_s      filter;
;241:	menutext_s      driverinfo;
;242:
;243:	menubitmap_s    apply;
;244:	menubitmap_s    back;
;245:} graphicsoptions_t;
;246:
;247:typedef struct {
;248:	int      mode;
;249:	qboolean fullscreen;
;250:	int      tq;
;251:	int      lighting;
;252:	int      colordepth;
;253:	int      texturebits;
;254:	int      geometry;
;255:	int      filter;
;256:	qboolean extensions;
;257:} InitialVideoOptions_s;
;258:
;259:static InitialVideoOptions_s s_ivo;
;260:static graphicsoptions_t     s_graphicsoptions;
;261:
;262:static InitialVideoOptions_s s_ivo_templates[] = {
;263:	{
;264:     4, qtrue, 2, 0, 2, 2, 1, 1, qtrue  // JDC: this was tq 3
;265:	},
;266:	{3, qtrue, 2, 0, 0, 0, 1, 0, qtrue                       },
;267:	{2, qtrue, 1, 0, 1, 0, 0, 0, qtrue                       },
;268:	{2, qtrue, 1, 1, 1, 0, 0, 0, qtrue                       },
;269:	{3, qtrue, 1, 0, 0, 0, 1, 0, qtrue                       }
;270:};
;271:
;272:#define NUM_IVO_TEMPLATES (ARRAY_LEN(s_ivo_templates))
;273:
;274:/*
;275:=================
;276:GraphicsOptions_GetInitialVideo
;277:=================
;278:*/
;279:static void GraphicsOptions_GetInitialVideo(void) {
line 280
;280:	s_ivo.colordepth  = s_graphicsoptions.colordepth.curvalue;
ADDRGP4 s_ivo+16
ADDRGP4 s_graphicsoptions+1580+68
INDIRI4
ASGNI4
line 281
;281:	s_ivo.mode        = s_graphicsoptions.mode.curvalue;
ADDRGP4 s_ivo
ADDRGP4 s_graphicsoptions+960+68
INDIRI4
ASGNI4
line 282
;282:	s_ivo.fullscreen  = s_graphicsoptions.fs.curvalue;
ADDRGP4 s_ivo+4
ADDRGP4 s_graphicsoptions+1148+68
INDIRI4
ASGNI4
line 283
;283:	s_ivo.extensions  = s_graphicsoptions.allow_extensions.curvalue;
ADDRGP4 s_ivo+32
ADDRGP4 s_graphicsoptions+1364+68
INDIRI4
ASGNI4
line 284
;284:	s_ivo.tq          = s_graphicsoptions.tq.curvalue;
ADDRGP4 s_ivo+8
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
CVFI4 4
ASGNI4
line 285
;285:	s_ivo.lighting    = s_graphicsoptions.lighting.curvalue;
ADDRGP4 s_ivo+12
ADDRGP4 s_graphicsoptions+1256+68
INDIRI4
ASGNI4
line 286
;286:	s_ivo.geometry    = s_graphicsoptions.geometry.curvalue;
ADDRGP4 s_ivo+24
ADDRGP4 s_graphicsoptions+1688+68
INDIRI4
ASGNI4
line 287
;287:	s_ivo.filter      = s_graphicsoptions.filter.curvalue;
ADDRGP4 s_ivo+28
ADDRGP4 s_graphicsoptions+1796+68
INDIRI4
ASGNI4
line 288
;288:	s_ivo.texturebits = s_graphicsoptions.texturebits.curvalue;
ADDRGP4 s_ivo+20
ADDRGP4 s_graphicsoptions+1472+68
INDIRI4
ASGNI4
line 289
;289:}
LABELV $213
endproc GraphicsOptions_GetInitialVideo 0 0
proc GraphicsOptions_CheckConfig 4 0
line 296
;290:
;291:/*
;292:=================
;293:GraphicsOptions_CheckConfig
;294:=================
;295:*/
;296:static void GraphicsOptions_CheckConfig(void) {
line 299
;297:	int i;
;298:
;299:	for (i = 0; i < NUM_IVO_TEMPLATES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $244
JUMPV
LABELV $241
line 300
;300:		if (s_ivo_templates[i].colordepth != s_graphicsoptions.colordepth.curvalue)
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates+16
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1580+68
INDIRI4
EQI4 $245
line 301
;301:			continue;
ADDRGP4 $242
JUMPV
LABELV $245
line 302
;302:		if (s_ivo_templates[i].mode != s_graphicsoptions.mode.curvalue)
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+960+68
INDIRI4
EQI4 $250
line 303
;303:			continue;
ADDRGP4 $242
JUMPV
LABELV $250
line 304
;304:		if (s_ivo_templates[i].fullscreen != s_graphicsoptions.fs.curvalue)
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates+4
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1148+68
INDIRI4
EQI4 $254
line 305
;305:			continue;
ADDRGP4 $242
JUMPV
LABELV $254
line 306
;306:		if (s_ivo_templates[i].tq != s_graphicsoptions.tq.curvalue)
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
EQF4 $259
line 307
;307:			continue;
ADDRGP4 $242
JUMPV
LABELV $259
line 308
;308:		if (s_ivo_templates[i].lighting != s_graphicsoptions.lighting.curvalue)
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates+12
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1256+68
INDIRI4
EQI4 $264
line 309
;309:			continue;
ADDRGP4 $242
JUMPV
LABELV $264
line 310
;310:		if (s_ivo_templates[i].geometry != s_graphicsoptions.geometry.curvalue)
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates+24
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1688+68
INDIRI4
EQI4 $269
line 311
;311:			continue;
ADDRGP4 $242
JUMPV
LABELV $269
line 312
;312:		if (s_ivo_templates[i].filter != s_graphicsoptions.filter.curvalue)
ADDRLP4 0
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates+28
ADDP4
INDIRI4
ADDRGP4 s_graphicsoptions+1796+68
INDIRI4
EQI4 $274
line 313
;313:			continue;
ADDRGP4 $242
JUMPV
LABELV $274
line 316
;314:		//		if ( s_ivo_templates[i].texturebits != s_graphicsoptions.texturebits.curvalue )
;315:		//			continue;
;316:		s_graphicsoptions.list.curvalue = i;
ADDRGP4 s_graphicsoptions+852+68
ADDRLP4 0
INDIRI4
ASGNI4
line 317
;317:		return;
ADDRGP4 $240
JUMPV
LABELV $242
line 299
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $244
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 5
LTU4 $241
line 319
;318:	}
;319:	s_graphicsoptions.list.curvalue = 4;
ADDRGP4 s_graphicsoptions+852+68
CNSTI4 4
ASGNI4
line 320
;320:}
LABELV $240
endproc GraphicsOptions_CheckConfig 4 0
proc GraphicsOptions_UpdateMenuItems 8 0
line 327
;321:
;322:/*
;323:=================
;324:GraphicsOptions_UpdateMenuItems
;325:=================
;326:*/
;327:static void GraphicsOptions_UpdateMenuItems(void) {
line 328
;328:	if (s_graphicsoptions.fs.curvalue == 0) {
ADDRGP4 s_graphicsoptions+1148+68
INDIRI4
CNSTI4 0
NEI4 $284
line 329
;329:		s_graphicsoptions.colordepth.curvalue = 0;
ADDRGP4 s_graphicsoptions+1580+68
CNSTI4 0
ASGNI4
line 330
;330:		s_graphicsoptions.colordepth.generic.flags |= QMF_GRAYED;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1580+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 331
;331:	} else {
ADDRGP4 $285
JUMPV
LABELV $284
line 332
;332:		s_graphicsoptions.colordepth.generic.flags &= ~QMF_GRAYED;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1580+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 333
;333:	}
LABELV $285
line 335
;334:
;335:	if (s_graphicsoptions.allow_extensions.curvalue == 0) {
ADDRGP4 s_graphicsoptions+1364+68
INDIRI4
CNSTI4 0
NEI4 $294
line 336
;336:		if (s_graphicsoptions.texturebits.curvalue == 0) {
ADDRGP4 s_graphicsoptions+1472+68
INDIRI4
CNSTI4 0
NEI4 $298
line 337
;337:			s_graphicsoptions.texturebits.curvalue = 1;
ADDRGP4 s_graphicsoptions+1472+68
CNSTI4 1
ASGNI4
line 338
;338:		}
LABELV $298
line 339
;339:	}
LABELV $294
line 341
;340:
;341:	s_graphicsoptions.apply.generic.flags |= QMF_HIDDEN | QMF_INACTIVE;
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 343
;342:
;343:	if (s_ivo.mode != s_graphicsoptions.mode.curvalue) {
ADDRGP4 s_ivo
INDIRI4
ADDRGP4 s_graphicsoptions+960+68
INDIRI4
EQI4 $306
line 344
;344:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN | QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 345
;345:	}
LABELV $306
line 346
;346:	if (s_ivo.fullscreen != s_graphicsoptions.fs.curvalue) {
ADDRGP4 s_ivo+4
INDIRI4
ADDRGP4 s_graphicsoptions+1148+68
INDIRI4
EQI4 $312
line 347
;347:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN | QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 348
;348:	}
LABELV $312
line 349
;349:	if (s_ivo.extensions != s_graphicsoptions.allow_extensions.curvalue) {
ADDRGP4 s_ivo+32
INDIRI4
ADDRGP4 s_graphicsoptions+1364+68
INDIRI4
EQI4 $319
line 350
;350:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN | QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 351
;351:	}
LABELV $319
line 352
;352:	if (s_ivo.tq != s_graphicsoptions.tq.curvalue) {
ADDRGP4 s_ivo+8
INDIRI4
CVIF4 4
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
EQF4 $326
line 353
;353:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN | QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 354
;354:	}
LABELV $326
line 355
;355:	if (s_ivo.lighting != s_graphicsoptions.lighting.curvalue) {
ADDRGP4 s_ivo+12
INDIRI4
ADDRGP4 s_graphicsoptions+1256+68
INDIRI4
EQI4 $333
line 356
;356:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN | QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 357
;357:	}
LABELV $333
line 358
;358:	if (s_ivo.colordepth != s_graphicsoptions.colordepth.curvalue) {
ADDRGP4 s_ivo+16
INDIRI4
ADDRGP4 s_graphicsoptions+1580+68
INDIRI4
EQI4 $340
line 359
;359:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN | QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 360
;360:	}
LABELV $340
line 361
;361:	if (s_ivo.texturebits != s_graphicsoptions.texturebits.curvalue) {
ADDRGP4 s_ivo+20
INDIRI4
ADDRGP4 s_graphicsoptions+1472+68
INDIRI4
EQI4 $347
line 362
;362:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN | QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 363
;363:	}
LABELV $347
line 364
;364:	if (s_ivo.geometry != s_graphicsoptions.geometry.curvalue) {
ADDRGP4 s_ivo+24
INDIRI4
ADDRGP4 s_graphicsoptions+1688+68
INDIRI4
EQI4 $354
line 365
;365:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN | QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 366
;366:	}
LABELV $354
line 367
;367:	if (s_ivo.filter != s_graphicsoptions.filter.curvalue) {
ADDRGP4 s_ivo+28
INDIRI4
ADDRGP4 s_graphicsoptions+1796+68
INDIRI4
EQI4 $361
line 368
;368:		s_graphicsoptions.apply.generic.flags &= ~(QMF_HIDDEN | QMF_INACTIVE);
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1980+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 369
;369:	}
LABELV $361
line 371
;370:
;371:	GraphicsOptions_CheckConfig();
ADDRGP4 GraphicsOptions_CheckConfig
CALLV
pop
line 372
;372:}
LABELV $283
endproc GraphicsOptions_UpdateMenuItems 8 0
proc GraphicsOptions_ApplyChanges 8 8
line 379
;373:
;374:/*
;375:=================
;376:GraphicsOptions_ApplyChanges
;377:=================
;378:*/
;379:static void GraphicsOptions_ApplyChanges(void* unused, int notification) {
line 380
;380:	if (notification != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $369
line 381
;381:		return;
ADDRGP4 $368
JUMPV
LABELV $369
line 383
;382:
;383:	switch (s_graphicsoptions.texturebits.curvalue) {
ADDRLP4 0
ADDRGP4 s_graphicsoptions+1472+68
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $375
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $377
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $378
ADDRGP4 $371
JUMPV
LABELV $375
line 385
;384:	case 0:
;385:		trap_Cvar_Reset("r_texturebits");
ADDRGP4 $376
ARGP4
ADDRGP4 trap_Cvar_Reset
CALLV
pop
line 386
;386:		break;
ADDRGP4 $372
JUMPV
LABELV $377
line 388
;387:	case 1:
;388:		trap_Cvar_SetValue("r_texturebits", 16);
ADDRGP4 $376
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 389
;389:		break;
ADDRGP4 $372
JUMPV
LABELV $378
line 391
;390:	case 2:
;391:		trap_Cvar_SetValue("r_texturebits", 32);
ADDRGP4 $376
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 392
;392:		break;
LABELV $371
LABELV $372
line 394
;393:	}
;394:	trap_Cvar_SetValue("r_picmip", 3 - s_graphicsoptions.tq.curvalue);
ADDRGP4 $379
ARGP4
CNSTF4 1077936128
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
SUBF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 395
;395:	trap_Cvar_SetValue("r_allowExtensions", s_graphicsoptions.allow_extensions.curvalue);
ADDRGP4 $382
ARGP4
ADDRGP4 s_graphicsoptions+1364+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 396
;396:	trap_Cvar_SetValue("r_mode", s_graphicsoptions.mode.curvalue);
ADDRGP4 $385
ARGP4
ADDRGP4 s_graphicsoptions+960+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 397
;397:	trap_Cvar_SetValue("r_fullscreen", s_graphicsoptions.fs.curvalue);
ADDRGP4 $388
ARGP4
ADDRGP4 s_graphicsoptions+1148+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 399
;398:
;399:	switch (s_graphicsoptions.colordepth.curvalue) {
ADDRLP4 4
ADDRGP4 s_graphicsoptions+1580+68
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $395
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $399
ADDRLP4 4
INDIRI4
CNSTI4 2
EQI4 $400
ADDRGP4 $391
JUMPV
LABELV $395
line 401
;400:	case 0:
;401:		trap_Cvar_Reset("r_colorbits");
ADDRGP4 $396
ARGP4
ADDRGP4 trap_Cvar_Reset
CALLV
pop
line 402
;402:		trap_Cvar_Reset("r_depthbits");
ADDRGP4 $397
ARGP4
ADDRGP4 trap_Cvar_Reset
CALLV
pop
line 403
;403:		trap_Cvar_Reset("r_stencilbits");
ADDRGP4 $398
ARGP4
ADDRGP4 trap_Cvar_Reset
CALLV
pop
line 404
;404:		break;
ADDRGP4 $392
JUMPV
LABELV $399
line 406
;405:	case 1:
;406:		trap_Cvar_SetValue("r_colorbits", 16);
ADDRGP4 $396
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 407
;407:		trap_Cvar_SetValue("r_depthbits", 16);
ADDRGP4 $397
ARGP4
CNSTF4 1098907648
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 408
;408:		trap_Cvar_SetValue("r_stencilbits", 0);
ADDRGP4 $398
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 409
;409:		break;
ADDRGP4 $392
JUMPV
LABELV $400
line 411
;410:	case 2:
;411:		trap_Cvar_SetValue("r_colorbits", 32);
ADDRGP4 $396
ARGP4
CNSTF4 1107296256
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 412
;412:		trap_Cvar_SetValue("r_depthbits", 24);
ADDRGP4 $397
ARGP4
CNSTF4 1103101952
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 413
;413:		break;
LABELV $391
LABELV $392
line 415
;414:	}
;415:	trap_Cvar_SetValue("r_vertexLight", s_graphicsoptions.lighting.curvalue);
ADDRGP4 $401
ARGP4
ADDRGP4 s_graphicsoptions+1256+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 417
;416:
;417:	if (s_graphicsoptions.geometry.curvalue == 2) {
ADDRGP4 s_graphicsoptions+1688+68
INDIRI4
CNSTI4 2
NEI4 $404
line 418
;418:		trap_Cvar_SetValue("r_lodBias", 0);
ADDRGP4 $408
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 419
;419:		trap_Cvar_SetValue("r_subdivisions", 4);
ADDRGP4 $409
ARGP4
CNSTF4 1082130432
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 420
;420:	} else if (s_graphicsoptions.geometry.curvalue == 1) {
ADDRGP4 $405
JUMPV
LABELV $404
ADDRGP4 s_graphicsoptions+1688+68
INDIRI4
CNSTI4 1
NEI4 $410
line 421
;421:		trap_Cvar_SetValue("r_lodBias", 1);
ADDRGP4 $408
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 422
;422:		trap_Cvar_SetValue("r_subdivisions", 12);
ADDRGP4 $409
ARGP4
CNSTF4 1094713344
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 423
;423:	} else {
ADDRGP4 $411
JUMPV
LABELV $410
line 424
;424:		trap_Cvar_SetValue("r_lodBias", 1);
ADDRGP4 $408
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 425
;425:		trap_Cvar_SetValue("r_subdivisions", 20);
ADDRGP4 $409
ARGP4
CNSTF4 1101004800
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 426
;426:	}
LABELV $411
LABELV $405
line 428
;427:
;428:	if (s_graphicsoptions.filter.curvalue) {
ADDRGP4 s_graphicsoptions+1796+68
INDIRI4
CNSTI4 0
EQI4 $414
line 429
;429:		trap_Cvar_Set("r_textureMode", "GL_LINEAR_MIPMAP_LINEAR");
ADDRGP4 $418
ARGP4
ADDRGP4 $419
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 430
;430:	} else {
ADDRGP4 $415
JUMPV
LABELV $414
line 431
;431:		trap_Cvar_Set("r_textureMode", "GL_LINEAR_MIPMAP_NEAREST");
ADDRGP4 $418
ARGP4
ADDRGP4 $420
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 432
;432:	}
LABELV $415
line 434
;433:
;434:	trap_Cmd_ExecuteText(EXEC_APPEND, "vid_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $421
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 435
;435:}
LABELV $368
endproc GraphicsOptions_ApplyChanges 8 8
proc GraphicsOptions_Event 12 0
line 442
;436:
;437:/*
;438:=================
;439:GraphicsOptions_Event
;440:=================
;441:*/
;442:static void GraphicsOptions_Event(void* ptr, int event) {
line 445
;443:	InitialVideoOptions_s* ivo;
;444:
;445:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $423
line 446
;446:		return;
ADDRGP4 $422
JUMPV
LABELV $423
line 449
;447:	}
;448:
;449:	switch (((menucommon_s*)ptr)->id) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 101
LTI4 $425
ADDRLP4 4
INDIRI4
CNSTI4 109
GTI4 $425
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $454-404
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $454
address $449
address $425
address $429
address $426
address $448
address $426
address $451
address $452
address $453
code
line 451
;450:	case ID_MODE:
;451:		break;
LABELV $429
line 454
;452:
;453:	case ID_LIST:
;454:		ivo = &s_ivo_templates[s_graphicsoptions.list.curvalue];
ADDRLP4 0
ADDRGP4 s_graphicsoptions+852+68
INDIRI4
CNSTI4 36
MULI4
ADDRGP4 s_ivo_templates
ADDP4
ASGNP4
line 456
;455:
;456:		s_graphicsoptions.mode.curvalue        = ivo->mode;
ADDRGP4 s_graphicsoptions+960+68
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 457
;457:		s_graphicsoptions.tq.curvalue          = ivo->tq;
ADDRGP4 s_graphicsoptions+1068+72
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 458
;458:		s_graphicsoptions.lighting.curvalue    = ivo->lighting;
ADDRGP4 s_graphicsoptions+1256+68
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 459
;459:		s_graphicsoptions.colordepth.curvalue  = ivo->colordepth;
ADDRGP4 s_graphicsoptions+1580+68
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 460
;460:		s_graphicsoptions.texturebits.curvalue = ivo->texturebits;
ADDRGP4 s_graphicsoptions+1472+68
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
ASGNI4
line 461
;461:		s_graphicsoptions.geometry.curvalue    = ivo->geometry;
ADDRGP4 s_graphicsoptions+1688+68
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
ASGNI4
line 462
;462:		s_graphicsoptions.filter.curvalue      = ivo->filter;
ADDRGP4 s_graphicsoptions+1796+68
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ASGNI4
line 463
;463:		s_graphicsoptions.fs.curvalue          = ivo->fullscreen;
ADDRGP4 s_graphicsoptions+1148+68
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 464
;464:		break;
ADDRGP4 $426
JUMPV
LABELV $448
line 467
;465:
;466:	case ID_DRIVERINFO:
;467:		UI_DriverInfo_Menu();
ADDRGP4 UI_DriverInfo_Menu
CALLV
pop
line 468
;468:		break;
ADDRGP4 $426
JUMPV
LABELV $449
line 471
;469:
;470:	case ID_BACK2:
;471:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 472
;472:		break;
ADDRGP4 $426
JUMPV
line 475
;473:
;474:	case ID_GRAPHICS:
;475:		break;
LABELV $451
line 478
;476:
;477:	case ID_DISPLAY:
;478:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 479
;479:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 480
;480:		break;
ADDRGP4 $426
JUMPV
LABELV $452
line 483
;481:
;482:	case ID_SOUND:
;483:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 484
;484:		UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 485
;485:		break;
ADDRGP4 $426
JUMPV
LABELV $453
line 488
;486:
;487:	case ID_NETWORK:
;488:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 489
;489:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 490
;490:		break;
LABELV $425
LABELV $426
line 492
;491:	}
;492:}
LABELV $422
endproc GraphicsOptions_Event 12 0
proc GraphicsOptions_TQEvent 0 0
line 499
;493:
;494:/*
;495:================
;496:GraphicsOptions_TQEvent
;497:================
;498:*/
;499:static void GraphicsOptions_TQEvent(void* ptr, int event) {
line 500
;500:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $457
line 501
;501:		return;
ADDRGP4 $456
JUMPV
LABELV $457
line 503
;502:	}
;503:	s_graphicsoptions.tq.curvalue = (int)(s_graphicsoptions.tq.curvalue + 0.5);
ADDRGP4 s_graphicsoptions+1068+72
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
CNSTF4 1056964608
ADDF4
CVFI4 4
CVIF4 4
ASGNF4
line 504
;504:}
LABELV $456
endproc GraphicsOptions_TQEvent 0 0
export GraphicsOptions_MenuDraw
proc GraphicsOptions_MenuDraw 0 4
line 511
;505:
;506:/*
;507:================
;508:GraphicsOptions_MenuDraw
;509:================
;510:*/
;511:void GraphicsOptions_MenuDraw(void) {
line 513
;512:	// APSFIX - rework this
;513:	GraphicsOptions_UpdateMenuItems();
ADDRGP4 GraphicsOptions_UpdateMenuItems
CALLV
pop
line 515
;514:
;515:	Menu_Draw(&s_graphicsoptions.menu);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 516
;516:}
LABELV $463
endproc GraphicsOptions_MenuDraw 0 4
proc GraphicsOptions_SetMenuItems 60 8
line 523
;517:
;518:/*
;519:=================
;520:GraphicsOptions_SetMenuItems
;521:=================
;522:*/
;523:static void GraphicsOptions_SetMenuItems(void) {
line 524
;524:	s_graphicsoptions.mode.curvalue = trap_Cvar_VariableValue("r_mode");
ADDRGP4 $385
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+960+68
ADDRLP4 0
INDIRF4
CVFI4 4
ASGNI4
line 525
;525:	if (s_graphicsoptions.mode.curvalue < 0) {
ADDRGP4 s_graphicsoptions+960+68
INDIRI4
CNSTI4 0
GEI4 $467
line 526
;526:		s_graphicsoptions.mode.curvalue = 3;
ADDRGP4 s_graphicsoptions+960+68
CNSTI4 3
ASGNI4
line 527
;527:	}
LABELV $467
line 528
;528:	s_graphicsoptions.fs.curvalue               = trap_Cvar_VariableValue("r_fullscreen");
ADDRGP4 $388
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1148+68
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 529
;529:	s_graphicsoptions.allow_extensions.curvalue = trap_Cvar_VariableValue("r_allowExtensions");
ADDRGP4 $382
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1364+68
ADDRLP4 8
INDIRF4
CVFI4 4
ASGNI4
line 530
;530:	s_graphicsoptions.tq.curvalue               = 3 - trap_Cvar_VariableValue("r_picmip");
ADDRGP4 $379
ARGP4
ADDRLP4 12
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_graphicsoptions+1068+72
CNSTF4 1077936128
ADDRLP4 12
INDIRF4
SUBF4
ASGNF4
line 531
;531:	if (s_graphicsoptions.tq.curvalue < 0) {
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
CNSTF4 0
GEF4 $479
line 532
;532:		s_graphicsoptions.tq.curvalue = 0;
ADDRGP4 s_graphicsoptions+1068+72
CNSTF4 0
ASGNF4
line 533
;533:	} else if (s_graphicsoptions.tq.curvalue > 3) {
ADDRGP4 $480
JUMPV
LABELV $479
ADDRGP4 s_graphicsoptions+1068+72
INDIRF4
CNSTF4 1077936128
LEF4 $485
line 534
;534:		s_graphicsoptions.tq.curvalue = 3;
ADDRGP4 s_graphicsoptions+1068+72
CNSTF4 1077936128
ASGNF4
line 535
;535:	}
LABELV $485
LABELV $480
line 537
;536:
;537:	s_graphicsoptions.lighting.curvalue = trap_Cvar_VariableValue("r_vertexLight") != 0;
ADDRGP4 $401
ARGP4
ADDRLP4 20
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 20
INDIRF4
CNSTF4 0
EQF4 $494
ADDRLP4 16
CNSTI4 1
ASGNI4
ADDRGP4 $495
JUMPV
LABELV $494
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $495
ADDRGP4 s_graphicsoptions+1256+68
ADDRLP4 16
INDIRI4
ASGNI4
line 538
;538:	switch ((int)trap_Cvar_VariableValue("r_texturebits")) {
ADDRGP4 $376
ARGP4
ADDRLP4 28
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 16
EQI4 $502
ADDRLP4 24
INDIRI4
CNSTI4 16
GTI4 $509
LABELV $508
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $499
ADDRGP4 $496
JUMPV
LABELV $509
ADDRLP4 24
INDIRI4
CNSTI4 32
EQI4 $505
ADDRGP4 $496
JUMPV
LABELV $496
LABELV $499
line 541
;539:	default:
;540:	case 0:
;541:		s_graphicsoptions.texturebits.curvalue = 0;
ADDRGP4 s_graphicsoptions+1472+68
CNSTI4 0
ASGNI4
line 542
;542:		break;
ADDRGP4 $497
JUMPV
LABELV $502
line 544
;543:	case 16:
;544:		s_graphicsoptions.texturebits.curvalue = 1;
ADDRGP4 s_graphicsoptions+1472+68
CNSTI4 1
ASGNI4
line 545
;545:		break;
ADDRGP4 $497
JUMPV
LABELV $505
line 547
;546:	case 32:
;547:		s_graphicsoptions.texturebits.curvalue = 2;
ADDRGP4 s_graphicsoptions+1472+68
CNSTI4 2
ASGNI4
line 548
;548:		break;
LABELV $497
line 551
;549:	}
;550:
;551:	if (!Q_stricmp(UI_Cvar_VariableString("r_textureMode"), "GL_LINEAR_MIPMAP_NEAREST")) {
ADDRGP4 $418
ARGP4
ADDRLP4 36
ADDRGP4 UI_Cvar_VariableString
CALLP4
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 $420
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $510
line 552
;552:		s_graphicsoptions.filter.curvalue = 0;
ADDRGP4 s_graphicsoptions+1796+68
CNSTI4 0
ASGNI4
line 553
;553:	} else {
ADDRGP4 $511
JUMPV
LABELV $510
line 554
;554:		s_graphicsoptions.filter.curvalue = 1;
ADDRGP4 s_graphicsoptions+1796+68
CNSTI4 1
ASGNI4
line 555
;555:	}
LABELV $511
line 557
;556:
;557:	if (trap_Cvar_VariableValue("r_lodBias") > 0) {
ADDRGP4 $408
ARGP4
ADDRLP4 44
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 44
INDIRF4
CNSTF4 0
LEF4 $516
line 558
;558:		if (trap_Cvar_VariableValue("r_subdivisions") >= 20) {
ADDRGP4 $409
ARGP4
ADDRLP4 48
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 48
INDIRF4
CNSTF4 1101004800
LTF4 $518
line 559
;559:			s_graphicsoptions.geometry.curvalue = 0;
ADDRGP4 s_graphicsoptions+1688+68
CNSTI4 0
ASGNI4
line 560
;560:		} else {
ADDRGP4 $517
JUMPV
LABELV $518
line 561
;561:			s_graphicsoptions.geometry.curvalue = 1;
ADDRGP4 s_graphicsoptions+1688+68
CNSTI4 1
ASGNI4
line 562
;562:		}
line 563
;563:	} else {
ADDRGP4 $517
JUMPV
LABELV $516
line 564
;564:		s_graphicsoptions.geometry.curvalue = 2;
ADDRGP4 s_graphicsoptions+1688+68
CNSTI4 2
ASGNI4
line 565
;565:	}
LABELV $517
line 567
;566:
;567:	switch ((int)trap_Cvar_VariableValue("r_colorbits")) {
ADDRGP4 $396
ARGP4
ADDRLP4 52
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 48
ADDRLP4 52
INDIRF4
CVFI4 4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 16
EQI4 $532
ADDRLP4 48
INDIRI4
CNSTI4 16
GTI4 $539
LABELV $538
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $529
ADDRGP4 $526
JUMPV
LABELV $539
ADDRLP4 48
INDIRI4
CNSTI4 32
EQI4 $535
ADDRGP4 $526
JUMPV
LABELV $526
LABELV $529
line 570
;568:	default:
;569:	case 0:
;570:		s_graphicsoptions.colordepth.curvalue = 0;
ADDRGP4 s_graphicsoptions+1580+68
CNSTI4 0
ASGNI4
line 571
;571:		break;
ADDRGP4 $527
JUMPV
LABELV $532
line 573
;572:	case 16:
;573:		s_graphicsoptions.colordepth.curvalue = 1;
ADDRGP4 s_graphicsoptions+1580+68
CNSTI4 1
ASGNI4
line 574
;574:		break;
ADDRGP4 $527
JUMPV
LABELV $535
line 576
;575:	case 32:
;576:		s_graphicsoptions.colordepth.curvalue = 2;
ADDRGP4 s_graphicsoptions+1580+68
CNSTI4 2
ASGNI4
line 577
;577:		break;
LABELV $527
line 580
;578:	}
;579:
;580:	if (s_graphicsoptions.fs.curvalue == 0) {
ADDRGP4 s_graphicsoptions+1148+68
INDIRI4
CNSTI4 0
NEI4 $540
line 581
;581:		s_graphicsoptions.colordepth.curvalue = 0;
ADDRGP4 s_graphicsoptions+1580+68
CNSTI4 0
ASGNI4
line 582
;582:	}
LABELV $540
line 583
;583:}
LABELV $464
endproc GraphicsOptions_SetMenuItems 60 8
data
align 4
LABELV $547
address $548
address $549
address $550
byte 4 0
align 4
LABELV $551
address $552
address $553
address $554
address $555
address $556
byte 4 0
align 4
LABELV $557
address $558
address $559
byte 4 0
align 4
LABELV $560
address $548
address $549
address $550
byte 4 0
align 4
LABELV $561
address $562
address $563
address $564
address $565
address $566
address $567
address $568
address $569
address $570
address $571
address $572
address $573
byte 4 0
align 4
LABELV $574
address $575
address $576
byte 4 0
align 4
LABELV $577
address $578
address $579
address $580
byte 4 0
align 4
LABELV $581
address $582
address $583
byte 4 0
export GraphicsOptions_MenuInit
code
proc GraphicsOptions_MenuInit 4 12
line 590
;584:
;585:/*
;586:================
;587:GraphicsOptions_MenuInit
;588:================
;589:*/
;590:void GraphicsOptions_MenuInit(void) {
line 610
;591:
;592:	static const char* tq_names[] = {"Default", "16 bit", "32 bit", NULL};
;593:
;594:	static const char* s_graphics_options_names[] = {"High Quality", "Normal", "Fast", "Fastest", "Custom", 0};
;595:
;596:	static const char* lighting_names[] = {"Lightmap", "Vertex", 0};
;597:
;598:	static const char* colordepth_names[] = {"Default", "16 bit", "32 bit", 0};
;599:
;600:	static const char* resolutions[]   = {"320x240",  "400x300",  "512x384",   "640x480",   "800x600",   "960x720",
;601:	                                      "1024x768", "1152x864", "1280x1024", "1600x1200", "2048x1536", "856x480 wide screen",
;602:	                                      0};
;603:	static const char* filter_names[]  = {"Bilinear", "Trilinear", NULL};
;604:	static const char* quality_names[] = {"Low", "Medium", "High", NULL};
;605:	static const char* enabled_names[] = {"Off", "On", NULL};
;606:
;607:	int                y;
;608:
;609:	// zero set all our globals
;610:	memset(&s_graphicsoptions, 0, sizeof(graphicsoptions_t));
ADDRGP4 s_graphicsoptions
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2164
ARGI4
ADDRGP4 memset
CALLP4
pop
line 612
;611:
;612:	GraphicsOptions_Cache();
ADDRGP4 GraphicsOptions_Cache
CALLV
pop
line 614
;613:
;614:	s_graphicsoptions.menu.wrapAround = qtrue;
ADDRGP4 s_graphicsoptions+276
CNSTI4 1
ASGNI4
line 615
;615:	s_graphicsoptions.menu.fullscreen = qtrue;
ADDRGP4 s_graphicsoptions+280
CNSTI4 1
ASGNI4
line 616
;616:	s_graphicsoptions.menu.draw       = GraphicsOptions_MenuDraw;
ADDRGP4 s_graphicsoptions+268
ADDRGP4 GraphicsOptions_MenuDraw
ASGNP4
line 618
;617:
;618:	s_graphicsoptions.banner.generic.type = MTYPE_BTEXT;
ADDRGP4 s_graphicsoptions+288
CNSTI4 10
ASGNI4
line 619
;619:	s_graphicsoptions.banner.generic.x    = 320;
ADDRGP4 s_graphicsoptions+288+12
CNSTI4 320
ASGNI4
line 620
;620:	s_graphicsoptions.banner.generic.y    = 16;
ADDRGP4 s_graphicsoptions+288+16
CNSTI4 16
ASGNI4
line 621
;621:	s_graphicsoptions.banner.string       = "SYSTEM SETUP";
ADDRGP4 s_graphicsoptions+288+64
ADDRGP4 $594
ASGNP4
line 622
;622:	s_graphicsoptions.banner.color        = color_white;
ADDRGP4 s_graphicsoptions+288+72
ADDRGP4 color_white
ASGNP4
line 623
;623:	s_graphicsoptions.banner.style        = UI_CENTER;
ADDRGP4 s_graphicsoptions+288+68
CNSTI4 1
ASGNI4
line 625
;624:
;625:	s_graphicsoptions.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+364
CNSTI4 6
ASGNI4
line 626
;626:	s_graphicsoptions.framel.generic.name  = GRAPHICSOPTIONS_FRAMEL;
ADDRGP4 s_graphicsoptions+364+4
ADDRGP4 $68
ASGNP4
line 627
;627:	s_graphicsoptions.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+364+44
CNSTU4 16384
ASGNU4
line 628
;628:	s_graphicsoptions.framel.generic.x     = 0;
ADDRGP4 s_graphicsoptions+364+12
CNSTI4 0
ASGNI4
line 629
;629:	s_graphicsoptions.framel.generic.y     = 78;
ADDRGP4 s_graphicsoptions+364+16
CNSTI4 78
ASGNI4
line 630
;630:	s_graphicsoptions.framel.width         = 256;
ADDRGP4 s_graphicsoptions+364+80
CNSTI4 256
ASGNI4
line 631
;631:	s_graphicsoptions.framel.height        = 329;
ADDRGP4 s_graphicsoptions+364+84
CNSTI4 329
ASGNI4
line 633
;632:
;633:	s_graphicsoptions.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+456
CNSTI4 6
ASGNI4
line 634
;634:	s_graphicsoptions.framer.generic.name  = GRAPHICSOPTIONS_FRAMER;
ADDRGP4 s_graphicsoptions+456+4
ADDRGP4 $69
ASGNP4
line 635
;635:	s_graphicsoptions.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+456+44
CNSTU4 16384
ASGNU4
line 636
;636:	s_graphicsoptions.framer.generic.x     = 376;
ADDRGP4 s_graphicsoptions+456+12
CNSTI4 376
ASGNI4
line 637
;637:	s_graphicsoptions.framer.generic.y     = 76;
ADDRGP4 s_graphicsoptions+456+16
CNSTI4 76
ASGNI4
line 638
;638:	s_graphicsoptions.framer.width         = 256;
ADDRGP4 s_graphicsoptions+456+80
CNSTI4 256
ASGNI4
line 639
;639:	s_graphicsoptions.framer.height        = 334;
ADDRGP4 s_graphicsoptions+456+84
CNSTI4 334
ASGNI4
line 641
;640:
;641:	s_graphicsoptions.graphics.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+548
CNSTI4 9
ASGNI4
line 642
;642:	s_graphicsoptions.graphics.generic.flags    = QMF_RIGHT_JUSTIFY;
ADDRGP4 s_graphicsoptions+548+44
CNSTU4 16
ASGNU4
line 643
;643:	s_graphicsoptions.graphics.generic.id       = ID_GRAPHICS;
ADDRGP4 s_graphicsoptions+548+8
CNSTI4 106
ASGNI4
line 644
;644:	s_graphicsoptions.graphics.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+548+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 645
;645:	s_graphicsoptions.graphics.generic.x        = 216;
ADDRGP4 s_graphicsoptions+548+12
CNSTI4 216
ASGNI4
line 646
;646:	s_graphicsoptions.graphics.generic.y        = 240 - 2 * PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+548+16
CNSTI4 186
ASGNI4
line 647
;647:	s_graphicsoptions.graphics.string           = "GRAPHICS";
ADDRGP4 s_graphicsoptions+548+64
ADDRGP4 $638
ASGNP4
line 648
;648:	s_graphicsoptions.graphics.style            = UI_RIGHT;
ADDRGP4 s_graphicsoptions+548+68
CNSTI4 2
ASGNI4
line 649
;649:	s_graphicsoptions.graphics.color            = color_red;
ADDRGP4 s_graphicsoptions+548+72
ADDRGP4 color_red
ASGNP4
line 651
;650:
;651:	s_graphicsoptions.display.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+624
CNSTI4 9
ASGNI4
line 652
;652:	s_graphicsoptions.display.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+624+44
CNSTU4 272
ASGNU4
line 653
;653:	s_graphicsoptions.display.generic.id       = ID_DISPLAY;
ADDRGP4 s_graphicsoptions+624+8
CNSTI4 107
ASGNI4
line 654
;654:	s_graphicsoptions.display.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+624+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 655
;655:	s_graphicsoptions.display.generic.x        = 216;
ADDRGP4 s_graphicsoptions+624+12
CNSTI4 216
ASGNI4
line 656
;656:	s_graphicsoptions.display.generic.y        = 240 - PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+624+16
CNSTI4 213
ASGNI4
line 657
;657:	s_graphicsoptions.display.string           = "DISPLAY";
ADDRGP4 s_graphicsoptions+624+64
ADDRGP4 $656
ASGNP4
line 658
;658:	s_graphicsoptions.display.style            = UI_RIGHT;
ADDRGP4 s_graphicsoptions+624+68
CNSTI4 2
ASGNI4
line 659
;659:	s_graphicsoptions.display.color            = color_red;
ADDRGP4 s_graphicsoptions+624+72
ADDRGP4 color_red
ASGNP4
line 661
;660:
;661:	s_graphicsoptions.sound.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+700
CNSTI4 9
ASGNI4
line 662
;662:	s_graphicsoptions.sound.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+700+44
CNSTU4 272
ASGNU4
line 663
;663:	s_graphicsoptions.sound.generic.id       = ID_SOUND;
ADDRGP4 s_graphicsoptions+700+8
CNSTI4 108
ASGNI4
line 664
;664:	s_graphicsoptions.sound.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+700+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 665
;665:	s_graphicsoptions.sound.generic.x        = 216;
ADDRGP4 s_graphicsoptions+700+12
CNSTI4 216
ASGNI4
line 666
;666:	s_graphicsoptions.sound.generic.y        = 240;
ADDRGP4 s_graphicsoptions+700+16
CNSTI4 240
ASGNI4
line 667
;667:	s_graphicsoptions.sound.string           = "SOUND";
ADDRGP4 s_graphicsoptions+700+64
ADDRGP4 $674
ASGNP4
line 668
;668:	s_graphicsoptions.sound.style            = UI_RIGHT;
ADDRGP4 s_graphicsoptions+700+68
CNSTI4 2
ASGNI4
line 669
;669:	s_graphicsoptions.sound.color            = color_red;
ADDRGP4 s_graphicsoptions+700+72
ADDRGP4 color_red
ASGNP4
line 671
;670:
;671:	s_graphicsoptions.network.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+776
CNSTI4 9
ASGNI4
line 672
;672:	s_graphicsoptions.network.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+776+44
CNSTU4 272
ASGNU4
line 673
;673:	s_graphicsoptions.network.generic.id       = ID_NETWORK;
ADDRGP4 s_graphicsoptions+776+8
CNSTI4 109
ASGNI4
line 674
;674:	s_graphicsoptions.network.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+776+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 675
;675:	s_graphicsoptions.network.generic.x        = 216;
ADDRGP4 s_graphicsoptions+776+12
CNSTI4 216
ASGNI4
line 676
;676:	s_graphicsoptions.network.generic.y        = 240 + PROP_HEIGHT;
ADDRGP4 s_graphicsoptions+776+16
CNSTI4 267
ASGNI4
line 677
;677:	s_graphicsoptions.network.string           = "NETWORK";
ADDRGP4 s_graphicsoptions+776+64
ADDRGP4 $692
ASGNP4
line 678
;678:	s_graphicsoptions.network.style            = UI_RIGHT;
ADDRGP4 s_graphicsoptions+776+68
CNSTI4 2
ASGNI4
line 679
;679:	s_graphicsoptions.network.color            = color_red;
ADDRGP4 s_graphicsoptions+776+72
ADDRGP4 color_red
ASGNP4
line 681
;680:
;681:	y                                       = 240 - 6 * (BIGCHAR_HEIGHT + 2);
ADDRLP4 0
CNSTI4 132
ASGNI4
line 682
;682:	s_graphicsoptions.list.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+852
CNSTI4 3
ASGNI4
line 683
;683:	s_graphicsoptions.list.generic.name     = "Graphics Settings:";
ADDRGP4 s_graphicsoptions+852+4
ADDRGP4 $700
ASGNP4
line 684
;684:	s_graphicsoptions.list.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+852+44
CNSTU4 258
ASGNU4
line 685
;685:	s_graphicsoptions.list.generic.x        = 400;
ADDRGP4 s_graphicsoptions+852+12
CNSTI4 400
ASGNI4
line 686
;686:	s_graphicsoptions.list.generic.y        = y;
ADDRGP4 s_graphicsoptions+852+16
ADDRLP4 0
INDIRI4
ASGNI4
line 687
;687:	s_graphicsoptions.list.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+852+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 688
;688:	s_graphicsoptions.list.generic.id       = ID_LIST;
ADDRGP4 s_graphicsoptions+852+8
CNSTI4 103
ASGNI4
line 689
;689:	s_graphicsoptions.list.itemnames        = s_graphics_options_names;
ADDRGP4 s_graphicsoptions+852+88
ADDRGP4 $551
ASGNP4
line 690
;690:	y += 2 * (BIGCHAR_HEIGHT + 2);
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 36
ADDI4
ASGNI4
line 693
;691:
;692:	// references/modifies "r_allowExtensions"
;693:	s_graphicsoptions.allow_extensions.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1364
CNSTI4 3
ASGNI4
line 694
;694:	s_graphicsoptions.allow_extensions.generic.name  = "GL Extensions:";
ADDRGP4 s_graphicsoptions+1364+4
ADDRGP4 $716
ASGNP4
line 695
;695:	s_graphicsoptions.allow_extensions.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1364+44
CNSTU4 258
ASGNU4
line 696
;696:	s_graphicsoptions.allow_extensions.generic.x     = 400;
ADDRGP4 s_graphicsoptions+1364+12
CNSTI4 400
ASGNI4
line 697
;697:	s_graphicsoptions.allow_extensions.generic.y     = y;
ADDRGP4 s_graphicsoptions+1364+16
ADDRLP4 0
INDIRI4
ASGNI4
line 698
;698:	s_graphicsoptions.allow_extensions.itemnames     = enabled_names;
ADDRGP4 s_graphicsoptions+1364+88
ADDRGP4 $581
ASGNP4
line 699
;699:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 702
;700:
;701:	// references/modifies "r_mode"
;702:	s_graphicsoptions.mode.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+960
CNSTI4 3
ASGNI4
line 703
;703:	s_graphicsoptions.mode.generic.name     = "Video Mode:";
ADDRGP4 s_graphicsoptions+960+4
ADDRGP4 $728
ASGNP4
line 704
;704:	s_graphicsoptions.mode.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+960+44
CNSTU4 258
ASGNU4
line 705
;705:	s_graphicsoptions.mode.generic.x        = 400;
ADDRGP4 s_graphicsoptions+960+12
CNSTI4 400
ASGNI4
line 706
;706:	s_graphicsoptions.mode.generic.y        = y;
ADDRGP4 s_graphicsoptions+960+16
ADDRLP4 0
INDIRI4
ASGNI4
line 707
;707:	s_graphicsoptions.mode.itemnames        = resolutions;
ADDRGP4 s_graphicsoptions+960+88
ADDRGP4 $561
ASGNP4
line 708
;708:	s_graphicsoptions.mode.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+960+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 709
;709:	s_graphicsoptions.mode.generic.id       = ID_MODE;
ADDRGP4 s_graphicsoptions+960+8
CNSTI4 104
ASGNI4
line 710
;710:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 713
;711:
;712:	// references "r_colorbits"
;713:	s_graphicsoptions.colordepth.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1580
CNSTI4 3
ASGNI4
line 714
;714:	s_graphicsoptions.colordepth.generic.name  = "Color Depth:";
ADDRGP4 s_graphicsoptions+1580+4
ADDRGP4 $744
ASGNP4
line 715
;715:	s_graphicsoptions.colordepth.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1580+44
CNSTU4 258
ASGNU4
line 716
;716:	s_graphicsoptions.colordepth.generic.x     = 400;
ADDRGP4 s_graphicsoptions+1580+12
CNSTI4 400
ASGNI4
line 717
;717:	s_graphicsoptions.colordepth.generic.y     = y;
ADDRGP4 s_graphicsoptions+1580+16
ADDRLP4 0
INDIRI4
ASGNI4
line 718
;718:	s_graphicsoptions.colordepth.itemnames     = colordepth_names;
ADDRGP4 s_graphicsoptions+1580+88
ADDRGP4 $560
ASGNP4
line 719
;719:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 722
;720:
;721:	// references/modifies "r_fullscreen"
;722:	s_graphicsoptions.fs.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1148
CNSTI4 3
ASGNI4
line 723
;723:	s_graphicsoptions.fs.generic.name  = "Fullscreen:";
ADDRGP4 s_graphicsoptions+1148+4
ADDRGP4 $756
ASGNP4
line 724
;724:	s_graphicsoptions.fs.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1148+44
CNSTU4 258
ASGNU4
line 725
;725:	s_graphicsoptions.fs.generic.x     = 400;
ADDRGP4 s_graphicsoptions+1148+12
CNSTI4 400
ASGNI4
line 726
;726:	s_graphicsoptions.fs.generic.y     = y;
ADDRGP4 s_graphicsoptions+1148+16
ADDRLP4 0
INDIRI4
ASGNI4
line 727
;727:	s_graphicsoptions.fs.itemnames     = enabled_names;
ADDRGP4 s_graphicsoptions+1148+88
ADDRGP4 $581
ASGNP4
line 728
;728:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 731
;729:
;730:	// references/modifies "r_vertexLight"
;731:	s_graphicsoptions.lighting.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1256
CNSTI4 3
ASGNI4
line 732
;732:	s_graphicsoptions.lighting.generic.name  = "Lighting:";
ADDRGP4 s_graphicsoptions+1256+4
ADDRGP4 $768
ASGNP4
line 733
;733:	s_graphicsoptions.lighting.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1256+44
CNSTU4 258
ASGNU4
line 734
;734:	s_graphicsoptions.lighting.generic.x     = 400;
ADDRGP4 s_graphicsoptions+1256+12
CNSTI4 400
ASGNI4
line 735
;735:	s_graphicsoptions.lighting.generic.y     = y;
ADDRGP4 s_graphicsoptions+1256+16
ADDRLP4 0
INDIRI4
ASGNI4
line 736
;736:	s_graphicsoptions.lighting.itemnames     = lighting_names;
ADDRGP4 s_graphicsoptions+1256+88
ADDRGP4 $557
ASGNP4
line 737
;737:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 740
;738:
;739:	// references/modifies "r_lodBias" & "subdivisions"
;740:	s_graphicsoptions.geometry.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1688
CNSTI4 3
ASGNI4
line 741
;741:	s_graphicsoptions.geometry.generic.name  = "Geometric Detail:";
ADDRGP4 s_graphicsoptions+1688+4
ADDRGP4 $780
ASGNP4
line 742
;742:	s_graphicsoptions.geometry.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1688+44
CNSTU4 258
ASGNU4
line 743
;743:	s_graphicsoptions.geometry.generic.x     = 400;
ADDRGP4 s_graphicsoptions+1688+12
CNSTI4 400
ASGNI4
line 744
;744:	s_graphicsoptions.geometry.generic.y     = y;
ADDRGP4 s_graphicsoptions+1688+16
ADDRLP4 0
INDIRI4
ASGNI4
line 745
;745:	s_graphicsoptions.geometry.itemnames     = quality_names;
ADDRGP4 s_graphicsoptions+1688+88
ADDRGP4 $577
ASGNP4
line 746
;746:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 749
;747:
;748:	// references/modifies "r_picmip"
;749:	s_graphicsoptions.tq.generic.type     = MTYPE_SLIDER;
ADDRGP4 s_graphicsoptions+1068
CNSTI4 1
ASGNI4
line 750
;750:	s_graphicsoptions.tq.generic.name     = "Texture Detail:";
ADDRGP4 s_graphicsoptions+1068+4
ADDRGP4 $792
ASGNP4
line 751
;751:	s_graphicsoptions.tq.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1068+44
CNSTU4 258
ASGNU4
line 752
;752:	s_graphicsoptions.tq.generic.x        = 400;
ADDRGP4 s_graphicsoptions+1068+12
CNSTI4 400
ASGNI4
line 753
;753:	s_graphicsoptions.tq.generic.y        = y;
ADDRGP4 s_graphicsoptions+1068+16
ADDRLP4 0
INDIRI4
ASGNI4
line 754
;754:	s_graphicsoptions.tq.minvalue         = 0;
ADDRGP4 s_graphicsoptions+1068+64
CNSTF4 0
ASGNF4
line 755
;755:	s_graphicsoptions.tq.maxvalue         = 3;
ADDRGP4 s_graphicsoptions+1068+68
CNSTF4 1077936128
ASGNF4
line 756
;756:	s_graphicsoptions.tq.generic.callback = GraphicsOptions_TQEvent;
ADDRGP4 s_graphicsoptions+1068+48
ADDRGP4 GraphicsOptions_TQEvent
ASGNP4
line 757
;757:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 760
;758:
;759:	// references/modifies "r_textureBits"
;760:	s_graphicsoptions.texturebits.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1472
CNSTI4 3
ASGNI4
line 761
;761:	s_graphicsoptions.texturebits.generic.name  = "Texture Quality:";
ADDRGP4 s_graphicsoptions+1472+4
ADDRGP4 $808
ASGNP4
line 762
;762:	s_graphicsoptions.texturebits.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1472+44
CNSTU4 258
ASGNU4
line 763
;763:	s_graphicsoptions.texturebits.generic.x     = 400;
ADDRGP4 s_graphicsoptions+1472+12
CNSTI4 400
ASGNI4
line 764
;764:	s_graphicsoptions.texturebits.generic.y     = y;
ADDRGP4 s_graphicsoptions+1472+16
ADDRLP4 0
INDIRI4
ASGNI4
line 765
;765:	s_graphicsoptions.texturebits.itemnames     = tq_names;
ADDRGP4 s_graphicsoptions+1472+88
ADDRGP4 $547
ASGNP4
line 766
;766:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 769
;767:
;768:	// references/modifies "r_textureMode"
;769:	s_graphicsoptions.filter.generic.type  = MTYPE_SPINCONTROL;
ADDRGP4 s_graphicsoptions+1796
CNSTI4 3
ASGNI4
line 770
;770:	s_graphicsoptions.filter.generic.name  = "Texture Filter:";
ADDRGP4 s_graphicsoptions+1796+4
ADDRGP4 $820
ASGNP4
line 771
;771:	s_graphicsoptions.filter.generic.flags = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_graphicsoptions+1796+44
CNSTU4 258
ASGNU4
line 772
;772:	s_graphicsoptions.filter.generic.x     = 400;
ADDRGP4 s_graphicsoptions+1796+12
CNSTI4 400
ASGNI4
line 773
;773:	s_graphicsoptions.filter.generic.y     = y;
ADDRGP4 s_graphicsoptions+1796+16
ADDRLP4 0
INDIRI4
ASGNI4
line 774
;774:	s_graphicsoptions.filter.itemnames     = filter_names;
ADDRGP4 s_graphicsoptions+1796+88
ADDRGP4 $574
ASGNP4
line 775
;775:	y += 2 * BIGCHAR_HEIGHT;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 777
;776:
;777:	s_graphicsoptions.driverinfo.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_graphicsoptions+1904
CNSTI4 9
ASGNI4
line 778
;778:	s_graphicsoptions.driverinfo.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+1904+44
CNSTU4 264
ASGNU4
line 779
;779:	s_graphicsoptions.driverinfo.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+1904+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 780
;780:	s_graphicsoptions.driverinfo.generic.id       = ID_DRIVERINFO;
ADDRGP4 s_graphicsoptions+1904+8
CNSTI4 105
ASGNI4
line 781
;781:	s_graphicsoptions.driverinfo.generic.x        = 320;
ADDRGP4 s_graphicsoptions+1904+12
CNSTI4 320
ASGNI4
line 782
;782:	s_graphicsoptions.driverinfo.generic.y        = y;
ADDRGP4 s_graphicsoptions+1904+16
ADDRLP4 0
INDIRI4
ASGNI4
line 783
;783:	s_graphicsoptions.driverinfo.string           = "Driver Info";
ADDRGP4 s_graphicsoptions+1904+64
ADDRGP4 $842
ASGNP4
line 784
;784:	s_graphicsoptions.driverinfo.style            = UI_CENTER | UI_SMALLFONT;
ADDRGP4 s_graphicsoptions+1904+68
CNSTI4 17
ASGNI4
line 785
;785:	s_graphicsoptions.driverinfo.color            = color_red;
ADDRGP4 s_graphicsoptions+1904+72
ADDRGP4 color_red
ASGNP4
line 786
;786:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 788
;787:
;788:	s_graphicsoptions.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+2072
CNSTI4 6
ASGNI4
line 789
;789:	s_graphicsoptions.back.generic.name     = GRAPHICSOPTIONS_BACK0;
ADDRGP4 s_graphicsoptions+2072+4
ADDRGP4 $70
ASGNP4
line 790
;790:	s_graphicsoptions.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_graphicsoptions+2072+44
CNSTU4 260
ASGNU4
line 791
;791:	s_graphicsoptions.back.generic.callback = GraphicsOptions_Event;
ADDRGP4 s_graphicsoptions+2072+48
ADDRGP4 GraphicsOptions_Event
ASGNP4
line 792
;792:	s_graphicsoptions.back.generic.id       = ID_BACK2;
ADDRGP4 s_graphicsoptions+2072+8
CNSTI4 101
ASGNI4
line 793
;793:	s_graphicsoptions.back.generic.x        = 0;
ADDRGP4 s_graphicsoptions+2072+12
CNSTI4 0
ASGNI4
line 794
;794:	s_graphicsoptions.back.generic.y        = 480 - 64;
ADDRGP4 s_graphicsoptions+2072+16
CNSTI4 416
ASGNI4
line 795
;795:	s_graphicsoptions.back.width            = 128;
ADDRGP4 s_graphicsoptions+2072+80
CNSTI4 128
ASGNI4
line 796
;796:	s_graphicsoptions.back.height           = 64;
ADDRGP4 s_graphicsoptions+2072+84
CNSTI4 64
ASGNI4
line 797
;797:	s_graphicsoptions.back.focuspic         = GRAPHICSOPTIONS_BACK1;
ADDRGP4 s_graphicsoptions+2072+64
ADDRGP4 $71
ASGNP4
line 799
;798:
;799:	s_graphicsoptions.apply.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_graphicsoptions+1980
CNSTI4 6
ASGNI4
line 800
;800:	s_graphicsoptions.apply.generic.name     = GRAPHICSOPTIONS_ACCEPT0;
ADDRGP4 s_graphicsoptions+1980+4
ADDRGP4 $869
ASGNP4
line 801
;801:	s_graphicsoptions.apply.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS | QMF_HIDDEN | QMF_INACTIVE;
ADDRGP4 s_graphicsoptions+1980+44
CNSTU4 20752
ASGNU4
line 802
;802:	s_graphicsoptions.apply.generic.callback = GraphicsOptions_ApplyChanges;
ADDRGP4 s_graphicsoptions+1980+48
ADDRGP4 GraphicsOptions_ApplyChanges
ASGNP4
line 803
;803:	s_graphicsoptions.apply.generic.x        = 640;
ADDRGP4 s_graphicsoptions+1980+12
CNSTI4 640
ASGNI4
line 804
;804:	s_graphicsoptions.apply.generic.y        = 480 - 64;
ADDRGP4 s_graphicsoptions+1980+16
CNSTI4 416
ASGNI4
line 805
;805:	s_graphicsoptions.apply.width            = 128;
ADDRGP4 s_graphicsoptions+1980+80
CNSTI4 128
ASGNI4
line 806
;806:	s_graphicsoptions.apply.height           = 64;
ADDRGP4 s_graphicsoptions+1980+84
CNSTI4 64
ASGNI4
line 807
;807:	s_graphicsoptions.apply.focuspic         = GRAPHICSOPTIONS_ACCEPT1;
ADDRGP4 s_graphicsoptions+1980+64
ADDRGP4 $884
ASGNP4
line 809
;808:
;809:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.banner);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 810
;810:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.framel);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 811
;811:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.framer);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 813
;812:
;813:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.graphics);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 814
;814:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.display);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+624
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 815
;815:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.sound);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+700
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 816
;816:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.network);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 818
;817:
;818:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.list);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+852
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 819
;819:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.allow_extensions);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 820
;820:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.mode);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+960
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 821
;821:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.colordepth);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1580
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 822
;822:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.fs);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1148
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 823
;823:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.lighting);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1256
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 824
;824:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.geometry);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1688
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 825
;825:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.tq);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1068
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 826
;826:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.texturebits);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1472
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 827
;827:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.filter);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1796
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 828
;828:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.driverinfo);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1904
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 830
;829:
;830:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.back);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+2072
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 831
;831:	Menu_AddItem(&s_graphicsoptions.menu, (void*)&s_graphicsoptions.apply);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+1980
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 833
;832:
;833:	GraphicsOptions_SetMenuItems();
ADDRGP4 GraphicsOptions_SetMenuItems
CALLV
pop
line 834
;834:	GraphicsOptions_GetInitialVideo();
ADDRGP4 GraphicsOptions_GetInitialVideo
CALLV
pop
line 835
;835:}
LABELV $546
endproc GraphicsOptions_MenuInit 4 12
export GraphicsOptions_Cache
proc GraphicsOptions_Cache 0 4
line 842
;836:
;837:/*
;838:=================
;839:GraphicsOptions_Cache
;840:=================
;841:*/
;842:void GraphicsOptions_Cache(void) {
line 843
;843:	trap_R_RegisterShaderNoMip(GRAPHICSOPTIONS_FRAMEL);
ADDRGP4 $68
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 844
;844:	trap_R_RegisterShaderNoMip(GRAPHICSOPTIONS_FRAMER);
ADDRGP4 $69
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 845
;845:	trap_R_RegisterShaderNoMip(GRAPHICSOPTIONS_BACK0);
ADDRGP4 $70
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 846
;846:	trap_R_RegisterShaderNoMip(GRAPHICSOPTIONS_BACK1);
ADDRGP4 $71
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 847
;847:	trap_R_RegisterShaderNoMip(GRAPHICSOPTIONS_ACCEPT0);
ADDRGP4 $869
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 848
;848:	trap_R_RegisterShaderNoMip(GRAPHICSOPTIONS_ACCEPT1);
ADDRGP4 $884
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 849
;849:}
LABELV $905
endproc GraphicsOptions_Cache 0 4
export UI_GraphicsOptionsMenu
proc UI_GraphicsOptionsMenu 0 8
line 856
;850:
;851:/*
;852:=================
;853:UI_GraphicsOptionsMenu
;854:=================
;855:*/
;856:void UI_GraphicsOptionsMenu(void) {
line 857
;857:	GraphicsOptions_MenuInit();
ADDRGP4 GraphicsOptions_MenuInit
CALLV
pop
line 858
;858:	UI_PushMenu(&s_graphicsoptions.menu);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 859
;859:	Menu_SetCursorToItem(&s_graphicsoptions.menu, &s_graphicsoptions.graphics);
ADDRGP4 s_graphicsoptions
ARGP4
ADDRGP4 s_graphicsoptions+548
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 860
;860:}
LABELV $906
endproc UI_GraphicsOptionsMenu 0 8
bss
align 4
LABELV s_graphicsoptions
skip 2164
align 4
LABELV s_ivo
skip 36
align 4
LABELV s_driverinfo
skip 1924
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
LABELV $884
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
LABELV $869
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
LABELV $842
byte 1 68
byte 1 114
byte 1 105
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $820
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $808
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $792
byte 1 84
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $780
byte 1 71
byte 1 101
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 114
byte 1 105
byte 1 99
byte 1 32
byte 1 68
byte 1 101
byte 1 116
byte 1 97
byte 1 105
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $768
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 0
align 1
LABELV $756
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 58
byte 1 0
align 1
LABELV $744
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 32
byte 1 68
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 58
byte 1 0
align 1
LABELV $728
byte 1 86
byte 1 105
byte 1 100
byte 1 101
byte 1 111
byte 1 32
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $716
byte 1 71
byte 1 76
byte 1 32
byte 1 69
byte 1 120
byte 1 116
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $700
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 32
byte 1 83
byte 1 101
byte 1 116
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $692
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $674
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $656
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $638
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 72
byte 1 73
byte 1 67
byte 1 83
byte 1 0
align 1
LABELV $594
byte 1 83
byte 1 89
byte 1 83
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $583
byte 1 79
byte 1 110
byte 1 0
align 1
LABELV $582
byte 1 79
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $580
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $579
byte 1 77
byte 1 101
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $578
byte 1 76
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $576
byte 1 84
byte 1 114
byte 1 105
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $575
byte 1 66
byte 1 105
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 0
align 1
LABELV $573
byte 1 56
byte 1 53
byte 1 54
byte 1 120
byte 1 52
byte 1 56
byte 1 48
byte 1 32
byte 1 119
byte 1 105
byte 1 100
byte 1 101
byte 1 32
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $572
byte 1 50
byte 1 48
byte 1 52
byte 1 56
byte 1 120
byte 1 49
byte 1 53
byte 1 51
byte 1 54
byte 1 0
align 1
LABELV $571
byte 1 49
byte 1 54
byte 1 48
byte 1 48
byte 1 120
byte 1 49
byte 1 50
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $570
byte 1 49
byte 1 50
byte 1 56
byte 1 48
byte 1 120
byte 1 49
byte 1 48
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $569
byte 1 49
byte 1 49
byte 1 53
byte 1 50
byte 1 120
byte 1 56
byte 1 54
byte 1 52
byte 1 0
align 1
LABELV $568
byte 1 49
byte 1 48
byte 1 50
byte 1 52
byte 1 120
byte 1 55
byte 1 54
byte 1 56
byte 1 0
align 1
LABELV $567
byte 1 57
byte 1 54
byte 1 48
byte 1 120
byte 1 55
byte 1 50
byte 1 48
byte 1 0
align 1
LABELV $566
byte 1 56
byte 1 48
byte 1 48
byte 1 120
byte 1 54
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $565
byte 1 54
byte 1 52
byte 1 48
byte 1 120
byte 1 52
byte 1 56
byte 1 48
byte 1 0
align 1
LABELV $564
byte 1 53
byte 1 49
byte 1 50
byte 1 120
byte 1 51
byte 1 56
byte 1 52
byte 1 0
align 1
LABELV $563
byte 1 52
byte 1 48
byte 1 48
byte 1 120
byte 1 51
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $562
byte 1 51
byte 1 50
byte 1 48
byte 1 120
byte 1 50
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $559
byte 1 86
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $558
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $556
byte 1 67
byte 1 117
byte 1 115
byte 1 116
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $555
byte 1 70
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $554
byte 1 70
byte 1 97
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $553
byte 1 78
byte 1 111
byte 1 114
byte 1 109
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $552
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 32
byte 1 81
byte 1 117
byte 1 97
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $550
byte 1 51
byte 1 50
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $549
byte 1 49
byte 1 54
byte 1 32
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $548
byte 1 68
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $421
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
LABELV $420
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 69
byte 1 83
byte 1 84
byte 1 0
align 1
LABELV $419
byte 1 71
byte 1 76
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 95
byte 1 77
byte 1 73
byte 1 80
byte 1 77
byte 1 65
byte 1 80
byte 1 95
byte 1 76
byte 1 73
byte 1 78
byte 1 69
byte 1 65
byte 1 82
byte 1 0
align 1
LABELV $418
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $409
byte 1 114
byte 1 95
byte 1 115
byte 1 117
byte 1 98
byte 1 100
byte 1 105
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $408
byte 1 114
byte 1 95
byte 1 108
byte 1 111
byte 1 100
byte 1 66
byte 1 105
byte 1 97
byte 1 115
byte 1 0
align 1
LABELV $401
byte 1 114
byte 1 95
byte 1 118
byte 1 101
byte 1 114
byte 1 116
byte 1 101
byte 1 120
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $398
byte 1 114
byte 1 95
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $397
byte 1 114
byte 1 95
byte 1 100
byte 1 101
byte 1 112
byte 1 116
byte 1 104
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $396
byte 1 114
byte 1 95
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $388
byte 1 114
byte 1 95
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 115
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $385
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $382
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 69
byte 1 120
byte 1 116
byte 1 101
byte 1 110
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $379
byte 1 114
byte 1 95
byte 1 112
byte 1 105
byte 1 99
byte 1 109
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $376
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 120
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $127
byte 1 68
byte 1 82
byte 1 73
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
LABELV $89
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 90
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 110
byte 1 99
byte 1 105
byte 1 108
byte 1 40
byte 1 37
byte 1 100
byte 1 45
byte 1 98
byte 1 105
byte 1 116
byte 1 115
byte 1 41
byte 1 0
align 1
LABELV $83
byte 1 69
byte 1 88
byte 1 84
byte 1 69
byte 1 78
byte 1 83
byte 1 73
byte 1 79
byte 1 78
byte 1 83
byte 1 0
align 1
LABELV $82
byte 1 80
byte 1 73
byte 1 88
byte 1 69
byte 1 76
byte 1 70
byte 1 79
byte 1 82
byte 1 77
byte 1 65
byte 1 84
byte 1 0
align 1
LABELV $81
byte 1 86
byte 1 69
byte 1 78
byte 1 68
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $71
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
LABELV $70
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
LABELV $69
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
LABELV $68
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
