code
proc UI_DisplayOptionsMenu_Event 8 8
file "../../../../code/q3_ui/ui_display.c"
line 51
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:DISPLAY OPTIONS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:#define ART_FRAMEL "menu/art/frame2_l"
;14:#define ART_FRAMER "menu/art/frame1_r"
;15:#define ART_BACK0  "menu/art/back_0"
;16:#define ART_BACK1  "menu/art/back_1"
;17:
;18:#define ID_GRAPHICS   10
;19:#define ID_DISPLAY    11
;20:#define ID_SOUND      12
;21:#define ID_NETWORK    13
;22:#define ID_BRIGHTNESS 14
;23:#define ID_SCREENSIZE 15
;24:#define ID_BACK       16
;25:
;26:typedef struct {
;27:	menuframework_s menu;
;28:
;29:	menutext_s      banner;
;30:	menubitmap_s    framel;
;31:	menubitmap_s    framer;
;32:
;33:	menutext_s      graphics;
;34:	menutext_s      display;
;35:	menutext_s      sound;
;36:	menutext_s      network;
;37:
;38:	menuslider_s    brightness;
;39:	menuslider_s    screensize;
;40:
;41:	menubitmap_s    back;
;42:} displayOptionsInfo_t;
;43:
;44:static displayOptionsInfo_t displayOptionsInfo;
;45:
;46:/*
;47:=================
;48:UI_DisplayOptionsMenu_Event
;49:=================
;50:*/
;51:static void UI_DisplayOptionsMenu_Event(void* ptr, int event) {
line 52
;52:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $70
line 53
;53:		return;
ADDRGP4 $69
JUMPV
LABELV $70
line 56
;54:	}
;55:
;56:	switch (((menucommon_s*)ptr)->id) {
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
LTI4 $72
ADDRLP4 0
INDIRI4
CNSTI4 16
GTI4 $72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $88-40
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $88
address $75
address $73
address $77
address $78
address $79
address $83
address $87
code
LABELV $75
line 58
;57:	case ID_GRAPHICS:
;58:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 59
;59:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 60
;60:		break;
ADDRGP4 $73
JUMPV
line 63
;61:
;62:	case ID_DISPLAY:
;63:		break;
LABELV $77
line 66
;64:
;65:	case ID_SOUND:
;66:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 67
;67:		UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 68
;68:		break;
ADDRGP4 $73
JUMPV
LABELV $78
line 71
;69:
;70:	case ID_NETWORK:
;71:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 72
;72:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 73
;73:		break;
ADDRGP4 $73
JUMPV
LABELV $79
line 76
;74:
;75:	case ID_BRIGHTNESS:
;76:		trap_Cvar_SetValue("r_gamma", displayOptionsInfo.brightness.curvalue / 10.0f);
ADDRGP4 $80
ARGP4
ADDRGP4 displayOptionsInfo+852+72
INDIRF4
CNSTF4 1036831949
MULF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 77
;77:		break;
ADDRGP4 $73
JUMPV
LABELV $83
line 80
;78:
;79:	case ID_SCREENSIZE:
;80:		trap_Cvar_SetValue("cg_viewsize", displayOptionsInfo.screensize.curvalue * 10);
ADDRGP4 $84
ARGP4
ADDRGP4 displayOptionsInfo+932+72
INDIRF4
CNSTF4 1092616192
MULF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 81
;81:		break;
ADDRGP4 $73
JUMPV
LABELV $87
line 84
;82:
;83:	case ID_BACK:
;84:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 85
;85:		break;
LABELV $72
LABELV $73
line 87
;86:	}
;87:}
LABELV $69
endproc UI_DisplayOptionsMenu_Event 8 8
proc UI_DisplayOptionsMenu_Init 12 12
line 94
;88:
;89:/*
;90:===============
;91:UI_DisplayOptionsMenu_Init
;92:===============
;93:*/
;94:static void UI_DisplayOptionsMenu_Init(void) {
line 97
;95:	int y;
;96:
;97:	memset(&displayOptionsInfo, 0, sizeof(displayOptionsInfo));
ADDRGP4 displayOptionsInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1104
ARGI4
ADDRGP4 memset
CALLP4
pop
line 99
;98:
;99:	UI_DisplayOptionsMenu_Cache();
ADDRGP4 UI_DisplayOptionsMenu_Cache
CALLV
pop
line 100
;100:	displayOptionsInfo.menu.wrapAround = qtrue;
ADDRGP4 displayOptionsInfo+276
CNSTI4 1
ASGNI4
line 101
;101:	displayOptionsInfo.menu.fullscreen = qtrue;
ADDRGP4 displayOptionsInfo+280
CNSTI4 1
ASGNI4
line 103
;102:
;103:	displayOptionsInfo.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 displayOptionsInfo+288
CNSTI4 10
ASGNI4
line 104
;104:	displayOptionsInfo.banner.generic.flags = QMF_CENTER_JUSTIFY;
ADDRGP4 displayOptionsInfo+288+44
CNSTU4 8
ASGNU4
line 105
;105:	displayOptionsInfo.banner.generic.x     = 320;
ADDRGP4 displayOptionsInfo+288+12
CNSTI4 320
ASGNI4
line 106
;106:	displayOptionsInfo.banner.generic.y     = 16;
ADDRGP4 displayOptionsInfo+288+16
CNSTI4 16
ASGNI4
line 107
;107:	displayOptionsInfo.banner.string        = "SYSTEM SETUP";
ADDRGP4 displayOptionsInfo+288+64
ADDRGP4 $102
ASGNP4
line 108
;108:	displayOptionsInfo.banner.color         = color_white;
ADDRGP4 displayOptionsInfo+288+72
ADDRGP4 color_white
ASGNP4
line 109
;109:	displayOptionsInfo.banner.style         = UI_CENTER;
ADDRGP4 displayOptionsInfo+288+68
CNSTI4 1
ASGNI4
line 111
;110:
;111:	displayOptionsInfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 displayOptionsInfo+364
CNSTI4 6
ASGNI4
line 112
;112:	displayOptionsInfo.framel.generic.name  = ART_FRAMEL;
ADDRGP4 displayOptionsInfo+364+4
ADDRGP4 $110
ASGNP4
line 113
;113:	displayOptionsInfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 displayOptionsInfo+364+44
CNSTU4 16384
ASGNU4
line 114
;114:	displayOptionsInfo.framel.generic.x     = 0;
ADDRGP4 displayOptionsInfo+364+12
CNSTI4 0
ASGNI4
line 115
;115:	displayOptionsInfo.framel.generic.y     = 78;
ADDRGP4 displayOptionsInfo+364+16
CNSTI4 78
ASGNI4
line 116
;116:	displayOptionsInfo.framel.width         = 256;
ADDRGP4 displayOptionsInfo+364+80
CNSTI4 256
ASGNI4
line 117
;117:	displayOptionsInfo.framel.height        = 329;
ADDRGP4 displayOptionsInfo+364+84
CNSTI4 329
ASGNI4
line 119
;118:
;119:	displayOptionsInfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 displayOptionsInfo+456
CNSTI4 6
ASGNI4
line 120
;120:	displayOptionsInfo.framer.generic.name  = ART_FRAMER;
ADDRGP4 displayOptionsInfo+456+4
ADDRGP4 $124
ASGNP4
line 121
;121:	displayOptionsInfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 displayOptionsInfo+456+44
CNSTU4 16384
ASGNU4
line 122
;122:	displayOptionsInfo.framer.generic.x     = 376;
ADDRGP4 displayOptionsInfo+456+12
CNSTI4 376
ASGNI4
line 123
;123:	displayOptionsInfo.framer.generic.y     = 76;
ADDRGP4 displayOptionsInfo+456+16
CNSTI4 76
ASGNI4
line 124
;124:	displayOptionsInfo.framer.width         = 256;
ADDRGP4 displayOptionsInfo+456+80
CNSTI4 256
ASGNI4
line 125
;125:	displayOptionsInfo.framer.height        = 334;
ADDRGP4 displayOptionsInfo+456+84
CNSTI4 334
ASGNI4
line 127
;126:
;127:	displayOptionsInfo.graphics.generic.type     = MTYPE_PTEXT;
ADDRGP4 displayOptionsInfo+548
CNSTI4 9
ASGNI4
line 128
;128:	displayOptionsInfo.graphics.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 displayOptionsInfo+548+44
CNSTU4 272
ASGNU4
line 129
;129:	displayOptionsInfo.graphics.generic.id       = ID_GRAPHICS;
ADDRGP4 displayOptionsInfo+548+8
CNSTI4 10
ASGNI4
line 130
;130:	displayOptionsInfo.graphics.generic.callback = UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+548+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 131
;131:	displayOptionsInfo.graphics.generic.x        = 216;
ADDRGP4 displayOptionsInfo+548+12
CNSTI4 216
ASGNI4
line 132
;132:	displayOptionsInfo.graphics.generic.y        = 240 - 2 * PROP_HEIGHT;
ADDRGP4 displayOptionsInfo+548+16
CNSTI4 186
ASGNI4
line 133
;133:	displayOptionsInfo.graphics.string           = "GRAPHICS";
ADDRGP4 displayOptionsInfo+548+64
ADDRGP4 $148
ASGNP4
line 134
;134:	displayOptionsInfo.graphics.style            = UI_RIGHT;
ADDRGP4 displayOptionsInfo+548+68
CNSTI4 2
ASGNI4
line 135
;135:	displayOptionsInfo.graphics.color            = color_red;
ADDRGP4 displayOptionsInfo+548+72
ADDRGP4 color_red
ASGNP4
line 137
;136:
;137:	displayOptionsInfo.display.generic.type     = MTYPE_PTEXT;
ADDRGP4 displayOptionsInfo+624
CNSTI4 9
ASGNI4
line 138
;138:	displayOptionsInfo.display.generic.flags    = QMF_RIGHT_JUSTIFY;
ADDRGP4 displayOptionsInfo+624+44
CNSTU4 16
ASGNU4
line 139
;139:	displayOptionsInfo.display.generic.id       = ID_DISPLAY;
ADDRGP4 displayOptionsInfo+624+8
CNSTI4 11
ASGNI4
line 140
;140:	displayOptionsInfo.display.generic.callback = UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+624+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 141
;141:	displayOptionsInfo.display.generic.x        = 216;
ADDRGP4 displayOptionsInfo+624+12
CNSTI4 216
ASGNI4
line 142
;142:	displayOptionsInfo.display.generic.y        = 240 - PROP_HEIGHT;
ADDRGP4 displayOptionsInfo+624+16
CNSTI4 213
ASGNI4
line 143
;143:	displayOptionsInfo.display.string           = "DISPLAY";
ADDRGP4 displayOptionsInfo+624+64
ADDRGP4 $166
ASGNP4
line 144
;144:	displayOptionsInfo.display.style            = UI_RIGHT;
ADDRGP4 displayOptionsInfo+624+68
CNSTI4 2
ASGNI4
line 145
;145:	displayOptionsInfo.display.color            = color_red;
ADDRGP4 displayOptionsInfo+624+72
ADDRGP4 color_red
ASGNP4
line 147
;146:
;147:	displayOptionsInfo.sound.generic.type     = MTYPE_PTEXT;
ADDRGP4 displayOptionsInfo+700
CNSTI4 9
ASGNI4
line 148
;148:	displayOptionsInfo.sound.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 displayOptionsInfo+700+44
CNSTU4 272
ASGNU4
line 149
;149:	displayOptionsInfo.sound.generic.id       = ID_SOUND;
ADDRGP4 displayOptionsInfo+700+8
CNSTI4 12
ASGNI4
line 150
;150:	displayOptionsInfo.sound.generic.callback = UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+700+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 151
;151:	displayOptionsInfo.sound.generic.x        = 216;
ADDRGP4 displayOptionsInfo+700+12
CNSTI4 216
ASGNI4
line 152
;152:	displayOptionsInfo.sound.generic.y        = 240;
ADDRGP4 displayOptionsInfo+700+16
CNSTI4 240
ASGNI4
line 153
;153:	displayOptionsInfo.sound.string           = "SOUND";
ADDRGP4 displayOptionsInfo+700+64
ADDRGP4 $184
ASGNP4
line 154
;154:	displayOptionsInfo.sound.style            = UI_RIGHT;
ADDRGP4 displayOptionsInfo+700+68
CNSTI4 2
ASGNI4
line 155
;155:	displayOptionsInfo.sound.color            = color_red;
ADDRGP4 displayOptionsInfo+700+72
ADDRGP4 color_red
ASGNP4
line 157
;156:
;157:	displayOptionsInfo.network.generic.type     = MTYPE_PTEXT;
ADDRGP4 displayOptionsInfo+776
CNSTI4 9
ASGNI4
line 158
;158:	displayOptionsInfo.network.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 displayOptionsInfo+776+44
CNSTU4 272
ASGNU4
line 159
;159:	displayOptionsInfo.network.generic.id       = ID_NETWORK;
ADDRGP4 displayOptionsInfo+776+8
CNSTI4 13
ASGNI4
line 160
;160:	displayOptionsInfo.network.generic.callback = UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+776+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 161
;161:	displayOptionsInfo.network.generic.x        = 216;
ADDRGP4 displayOptionsInfo+776+12
CNSTI4 216
ASGNI4
line 162
;162:	displayOptionsInfo.network.generic.y        = 240 + PROP_HEIGHT;
ADDRGP4 displayOptionsInfo+776+16
CNSTI4 267
ASGNI4
line 163
;163:	displayOptionsInfo.network.string           = "NETWORK";
ADDRGP4 displayOptionsInfo+776+64
ADDRGP4 $202
ASGNP4
line 164
;164:	displayOptionsInfo.network.style            = UI_RIGHT;
ADDRGP4 displayOptionsInfo+776+68
CNSTI4 2
ASGNI4
line 165
;165:	displayOptionsInfo.network.color            = color_red;
ADDRGP4 displayOptionsInfo+776+72
ADDRGP4 color_red
ASGNP4
line 167
;166:
;167:	y                                              = 240 - 1 * (BIGCHAR_HEIGHT + 2);
ADDRLP4 0
CNSTI4 222
ASGNI4
line 168
;168:	displayOptionsInfo.brightness.generic.type     = MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+852
CNSTI4 1
ASGNI4
line 169
;169:	displayOptionsInfo.brightness.generic.name     = "Brightness:";
ADDRGP4 displayOptionsInfo+852+4
ADDRGP4 $210
ASGNP4
line 170
;170:	displayOptionsInfo.brightness.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+852+44
CNSTU4 258
ASGNU4
line 171
;171:	displayOptionsInfo.brightness.generic.callback = UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+852+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 172
;172:	displayOptionsInfo.brightness.generic.id       = ID_BRIGHTNESS;
ADDRGP4 displayOptionsInfo+852+8
CNSTI4 14
ASGNI4
line 173
;173:	displayOptionsInfo.brightness.generic.x        = 400;
ADDRGP4 displayOptionsInfo+852+12
CNSTI4 400
ASGNI4
line 174
;174:	displayOptionsInfo.brightness.generic.y        = y;
ADDRGP4 displayOptionsInfo+852+16
ADDRLP4 0
INDIRI4
ASGNI4
line 175
;175:	displayOptionsInfo.brightness.minvalue         = 5;
ADDRGP4 displayOptionsInfo+852+64
CNSTF4 1084227584
ASGNF4
line 176
;176:	displayOptionsInfo.brightness.maxvalue         = 20;
ADDRGP4 displayOptionsInfo+852+68
CNSTF4 1101004800
ASGNF4
line 177
;177:	if (!uis.glconfig.deviceSupportsGamma) {
ADDRGP4 uis+56+11292
INDIRI4
CNSTI4 0
NEI4 $225
line 178
;178:		displayOptionsInfo.brightness.generic.flags |= QMF_GRAYED;
ADDRLP4 4
ADDRGP4 displayOptionsInfo+852+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 179
;179:	}
LABELV $225
line 181
;180:
;181:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 182
;182:	displayOptionsInfo.screensize.generic.type     = MTYPE_SLIDER;
ADDRGP4 displayOptionsInfo+932
CNSTI4 1
ASGNI4
line 183
;183:	displayOptionsInfo.screensize.generic.name     = "Screen Size:";
ADDRGP4 displayOptionsInfo+932+4
ADDRGP4 $234
ASGNP4
line 184
;184:	displayOptionsInfo.screensize.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 displayOptionsInfo+932+44
CNSTU4 258
ASGNU4
line 185
;185:	displayOptionsInfo.screensize.generic.callback = UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+932+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 186
;186:	displayOptionsInfo.screensize.generic.id       = ID_SCREENSIZE;
ADDRGP4 displayOptionsInfo+932+8
CNSTI4 15
ASGNI4
line 187
;187:	displayOptionsInfo.screensize.generic.x        = 400;
ADDRGP4 displayOptionsInfo+932+12
CNSTI4 400
ASGNI4
line 188
;188:	displayOptionsInfo.screensize.generic.y        = y;
ADDRGP4 displayOptionsInfo+932+16
ADDRLP4 0
INDIRI4
ASGNI4
line 189
;189:	displayOptionsInfo.screensize.minvalue         = 3;
ADDRGP4 displayOptionsInfo+932+64
CNSTF4 1077936128
ASGNF4
line 190
;190:	displayOptionsInfo.screensize.maxvalue         = 10;
ADDRGP4 displayOptionsInfo+932+68
CNSTF4 1092616192
ASGNF4
line 192
;191:
;192:	displayOptionsInfo.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 displayOptionsInfo+1012
CNSTI4 6
ASGNI4
line 193
;193:	displayOptionsInfo.back.generic.name     = ART_BACK0;
ADDRGP4 displayOptionsInfo+1012+4
ADDRGP4 $252
ASGNP4
line 194
;194:	displayOptionsInfo.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 displayOptionsInfo+1012+44
CNSTU4 260
ASGNU4
line 195
;195:	displayOptionsInfo.back.generic.callback = UI_DisplayOptionsMenu_Event;
ADDRGP4 displayOptionsInfo+1012+48
ADDRGP4 UI_DisplayOptionsMenu_Event
ASGNP4
line 196
;196:	displayOptionsInfo.back.generic.id       = ID_BACK;
ADDRGP4 displayOptionsInfo+1012+8
CNSTI4 16
ASGNI4
line 197
;197:	displayOptionsInfo.back.generic.x        = 0;
ADDRGP4 displayOptionsInfo+1012+12
CNSTI4 0
ASGNI4
line 198
;198:	displayOptionsInfo.back.generic.y        = 480 - 64;
ADDRGP4 displayOptionsInfo+1012+16
CNSTI4 416
ASGNI4
line 199
;199:	displayOptionsInfo.back.width            = 128;
ADDRGP4 displayOptionsInfo+1012+80
CNSTI4 128
ASGNI4
line 200
;200:	displayOptionsInfo.back.height           = 64;
ADDRGP4 displayOptionsInfo+1012+84
CNSTI4 64
ASGNI4
line 201
;201:	displayOptionsInfo.back.focuspic         = ART_BACK1;
ADDRGP4 displayOptionsInfo+1012+64
ADDRGP4 $269
ASGNP4
line 203
;202:
;203:	Menu_AddItem(&displayOptionsInfo.menu, (void*)&displayOptionsInfo.banner);
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 204
;204:	Menu_AddItem(&displayOptionsInfo.menu, (void*)&displayOptionsInfo.framel);
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 205
;205:	Menu_AddItem(&displayOptionsInfo.menu, (void*)&displayOptionsInfo.framer);
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 206
;206:	Menu_AddItem(&displayOptionsInfo.menu, (void*)&displayOptionsInfo.graphics);
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 207
;207:	Menu_AddItem(&displayOptionsInfo.menu, (void*)&displayOptionsInfo.display);
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+624
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 208
;208:	Menu_AddItem(&displayOptionsInfo.menu, (void*)&displayOptionsInfo.sound);
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+700
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 209
;209:	Menu_AddItem(&displayOptionsInfo.menu, (void*)&displayOptionsInfo.network);
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 210
;210:	Menu_AddItem(&displayOptionsInfo.menu, (void*)&displayOptionsInfo.brightness);
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+852
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 211
;211:	Menu_AddItem(&displayOptionsInfo.menu, (void*)&displayOptionsInfo.screensize);
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+932
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 212
;212:	Menu_AddItem(&displayOptionsInfo.menu, (void*)&displayOptionsInfo.back);
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+1012
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 214
;213:
;214:	displayOptionsInfo.brightness.curvalue = trap_Cvar_VariableValue("r_gamma") * 10;
ADDRGP4 $80
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+852+72
ADDRLP4 4
INDIRF4
CNSTF4 1092616192
MULF4
ASGNF4
line 215
;215:	displayOptionsInfo.screensize.curvalue = trap_Cvar_VariableValue("cg_viewsize") / 10;
ADDRGP4 $84
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 displayOptionsInfo+932+72
ADDRLP4 8
INDIRF4
CNSTF4 1036831949
MULF4
ASGNF4
line 216
;216:}
LABELV $90
endproc UI_DisplayOptionsMenu_Init 12 12
export UI_DisplayOptionsMenu_Cache
proc UI_DisplayOptionsMenu_Cache 0 4
line 223
;217:
;218:/*
;219:===============
;220:UI_DisplayOptionsMenu_Cache
;221:===============
;222:*/
;223:void UI_DisplayOptionsMenu_Cache(void) {
line 224
;224:	trap_R_RegisterShaderNoMip(ART_FRAMEL);
ADDRGP4 $110
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 225
;225:	trap_R_RegisterShaderNoMip(ART_FRAMER);
ADDRGP4 $124
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 226
;226:	trap_R_RegisterShaderNoMip(ART_BACK0);
ADDRGP4 $252
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 227
;227:	trap_R_RegisterShaderNoMip(ART_BACK1);
ADDRGP4 $269
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 228
;228:}
LABELV $284
endproc UI_DisplayOptionsMenu_Cache 0 4
export UI_DisplayOptionsMenu
proc UI_DisplayOptionsMenu 0 8
line 235
;229:
;230:/*
;231:===============
;232:UI_DisplayOptionsMenu
;233:===============
;234:*/
;235:void UI_DisplayOptionsMenu(void) {
line 236
;236:	UI_DisplayOptionsMenu_Init();
ADDRGP4 UI_DisplayOptionsMenu_Init
CALLV
pop
line 237
;237:	UI_PushMenu(&displayOptionsInfo.menu);
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 238
;238:	Menu_SetCursorToItem(&displayOptionsInfo.menu, &displayOptionsInfo.display);
ADDRGP4 displayOptionsInfo
ARGP4
ADDRGP4 displayOptionsInfo+624
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 239
;239:}
LABELV $285
endproc UI_DisplayOptionsMenu 0 8
bss
align 4
LABELV displayOptionsInfo
skip 1104
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
LABELV $269
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
LABELV $252
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
LABELV $234
byte 1 83
byte 1 99
byte 1 114
byte 1 101
byte 1 101
byte 1 110
byte 1 32
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $210
byte 1 66
byte 1 114
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 101
byte 1 115
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $202
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $184
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $166
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $148
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
LABELV $124
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
LABELV $110
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
LABELV $102
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
LABELV $84
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
LABELV $80
byte 1 114
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 0
