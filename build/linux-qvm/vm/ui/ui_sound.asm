data
align 4
LABELV quality_items
address $68
address $69
byte 4 0
code
proc UI_SoundOptionsMenu_Event 8 8
file "../../../../code/q3_ui/ui_sound.c"
line 57
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:SOUND OPTIONS MENU
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
;18:#define ID_GRAPHICS      10
;19:#define ID_DISPLAY       11
;20:#define ID_SOUND         12
;21:#define ID_NETWORK       13
;22:#define ID_EFFECTSVOLUME 14
;23:#define ID_MUSICVOLUME   15
;24:#define ID_QUALITY       16
;25://#define ID_A3D				17
;26:#define ID_BACK          18
;27:
;28:static const char* quality_items[] = {"Low", "High", 0};
;29:
;30:typedef struct {
;31:	menuframework_s menu;
;32:
;33:	menutext_s      banner;
;34:	menubitmap_s    framel;
;35:	menubitmap_s    framer;
;36:
;37:	menutext_s      graphics;
;38:	menutext_s      display;
;39:	menutext_s      sound;
;40:	menutext_s      network;
;41:
;42:	menuslider_s    sfxvolume;
;43:	menuslider_s    musicvolume;
;44:	menulist_s      quality;
;45:	//	menuradiobutton_s	a3d;
;46:
;47:	menubitmap_s back;
;48:} soundOptionsInfo_t;
;49:
;50:static soundOptionsInfo_t soundOptionsInfo;
;51:
;52:/*
;53:=================
;54:UI_SoundOptionsMenu_Event
;55:=================
;56:*/
;57:static void UI_SoundOptionsMenu_Event(void* ptr, int event) {
line 58
;58:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $72
line 59
;59:		return;
ADDRGP4 $71
JUMPV
LABELV $72
line 62
;60:	}
;61:
;62:	switch (((menucommon_s*)ptr)->id) {
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
LTI4 $74
ADDRLP4 0
INDIRI4
CNSTI4 18
GTI4 $74
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $98-40
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $98
address $77
address $78
address $75
address $80
address $81
address $85
address $89
address $74
address $97
code
LABELV $77
line 64
;63:	case ID_GRAPHICS:
;64:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 65
;65:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 66
;66:		break;
ADDRGP4 $75
JUMPV
LABELV $78
line 69
;67:
;68:	case ID_DISPLAY:
;69:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 70
;70:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 71
;71:		break;
ADDRGP4 $75
JUMPV
line 74
;72:
;73:	case ID_SOUND:
;74:		break;
LABELV $80
line 77
;75:
;76:	case ID_NETWORK:
;77:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 78
;78:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 79
;79:		break;
ADDRGP4 $75
JUMPV
LABELV $81
line 82
;80:
;81:	case ID_EFFECTSVOLUME:
;82:		trap_Cvar_SetValue("s_volume", soundOptionsInfo.sfxvolume.curvalue / 10);
ADDRGP4 $82
ARGP4
ADDRGP4 soundOptionsInfo+852+72
INDIRF4
CNSTF4 1036831949
MULF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 83
;83:		break;
ADDRGP4 $75
JUMPV
LABELV $85
line 86
;84:
;85:	case ID_MUSICVOLUME:
;86:		trap_Cvar_SetValue("s_musicvolume", soundOptionsInfo.musicvolume.curvalue / 10);
ADDRGP4 $86
ARGP4
ADDRGP4 soundOptionsInfo+932+72
INDIRF4
CNSTF4 1036831949
MULF4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 87
;87:		break;
ADDRGP4 $75
JUMPV
LABELV $89
line 90
;88:
;89:	case ID_QUALITY:
;90:		if (soundOptionsInfo.quality.curvalue) {
ADDRGP4 soundOptionsInfo+1012+68
INDIRI4
CNSTI4 0
EQI4 $90
line 91
;91:			trap_Cvar_SetValue("s_khz", 22);
ADDRGP4 $94
ARGP4
CNSTF4 1102053376
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 92
;92:			trap_Cvar_SetValue("s_compression", 0);
ADDRGP4 $95
ARGP4
CNSTF4 0
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 93
;93:		} else {
ADDRGP4 $91
JUMPV
LABELV $90
line 94
;94:			trap_Cvar_SetValue("s_khz", 11);
ADDRGP4 $94
ARGP4
CNSTF4 1093664768
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 95
;95:			trap_Cvar_SetValue("s_compression", 1);
ADDRGP4 $95
ARGP4
CNSTF4 1065353216
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 96
;96:		}
LABELV $91
line 97
;97:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 98
;98:		trap_Cmd_ExecuteText(EXEC_APPEND, "snd_restart\n");
CNSTI4 2
ARGI4
ADDRGP4 $96
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 99
;99:		break;
ADDRGP4 $75
JUMPV
LABELV $97
line 112
;100:		/*
;101:		    case ID_A3D:
;102:		        if( soundOptionsInfo.a3d.curvalue ) {
;103:		            trap_Cmd_ExecuteText( EXEC_NOW, "s_enable_a3d\n" );
;104:		        }
;105:		        else {
;106:		            trap_Cmd_ExecuteText( EXEC_NOW, "s_disable_a3d\n" );
;107:		        }
;108:		        soundOptionsInfo.a3d.curvalue = (int)trap_Cvar_VariableValue( "s_usingA3D" );
;109:		        break;
;110:		*/
;111:	case ID_BACK:
;112:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 113
;113:		break;
LABELV $74
LABELV $75
line 115
;114:	}
;115:}
LABELV $71
endproc UI_SoundOptionsMenu_Event 8 8
proc UI_SoundOptionsMenu_Init 20 12
line 122
;116:
;117:/*
;118:===============
;119:UI_SoundOptionsMenu_Init
;120:===============
;121:*/
;122:static void UI_SoundOptionsMenu_Init(void) {
line 125
;123:	int y;
;124:
;125:	memset(&soundOptionsInfo, 0, sizeof(soundOptionsInfo));
ADDRGP4 soundOptionsInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1212
ARGI4
ADDRGP4 memset
CALLP4
pop
line 127
;126:
;127:	UI_SoundOptionsMenu_Cache();
ADDRGP4 UI_SoundOptionsMenu_Cache
CALLV
pop
line 128
;128:	soundOptionsInfo.menu.wrapAround = qtrue;
ADDRGP4 soundOptionsInfo+276
CNSTI4 1
ASGNI4
line 129
;129:	soundOptionsInfo.menu.fullscreen = qtrue;
ADDRGP4 soundOptionsInfo+280
CNSTI4 1
ASGNI4
line 131
;130:
;131:	soundOptionsInfo.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 soundOptionsInfo+288
CNSTI4 10
ASGNI4
line 132
;132:	soundOptionsInfo.banner.generic.flags = QMF_CENTER_JUSTIFY;
ADDRGP4 soundOptionsInfo+288+44
CNSTU4 8
ASGNU4
line 133
;133:	soundOptionsInfo.banner.generic.x     = 320;
ADDRGP4 soundOptionsInfo+288+12
CNSTI4 320
ASGNI4
line 134
;134:	soundOptionsInfo.banner.generic.y     = 16;
ADDRGP4 soundOptionsInfo+288+16
CNSTI4 16
ASGNI4
line 135
;135:	soundOptionsInfo.banner.string        = "SYSTEM SETUP";
ADDRGP4 soundOptionsInfo+288+64
ADDRGP4 $112
ASGNP4
line 136
;136:	soundOptionsInfo.banner.color         = color_white;
ADDRGP4 soundOptionsInfo+288+72
ADDRGP4 color_white
ASGNP4
line 137
;137:	soundOptionsInfo.banner.style         = UI_CENTER;
ADDRGP4 soundOptionsInfo+288+68
CNSTI4 1
ASGNI4
line 139
;138:
;139:	soundOptionsInfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 soundOptionsInfo+364
CNSTI4 6
ASGNI4
line 140
;140:	soundOptionsInfo.framel.generic.name  = ART_FRAMEL;
ADDRGP4 soundOptionsInfo+364+4
ADDRGP4 $120
ASGNP4
line 141
;141:	soundOptionsInfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 soundOptionsInfo+364+44
CNSTU4 16384
ASGNU4
line 142
;142:	soundOptionsInfo.framel.generic.x     = 0;
ADDRGP4 soundOptionsInfo+364+12
CNSTI4 0
ASGNI4
line 143
;143:	soundOptionsInfo.framel.generic.y     = 78;
ADDRGP4 soundOptionsInfo+364+16
CNSTI4 78
ASGNI4
line 144
;144:	soundOptionsInfo.framel.width         = 256;
ADDRGP4 soundOptionsInfo+364+80
CNSTI4 256
ASGNI4
line 145
;145:	soundOptionsInfo.framel.height        = 329;
ADDRGP4 soundOptionsInfo+364+84
CNSTI4 329
ASGNI4
line 147
;146:
;147:	soundOptionsInfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 soundOptionsInfo+456
CNSTI4 6
ASGNI4
line 148
;148:	soundOptionsInfo.framer.generic.name  = ART_FRAMER;
ADDRGP4 soundOptionsInfo+456+4
ADDRGP4 $134
ASGNP4
line 149
;149:	soundOptionsInfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 soundOptionsInfo+456+44
CNSTU4 16384
ASGNU4
line 150
;150:	soundOptionsInfo.framer.generic.x     = 376;
ADDRGP4 soundOptionsInfo+456+12
CNSTI4 376
ASGNI4
line 151
;151:	soundOptionsInfo.framer.generic.y     = 76;
ADDRGP4 soundOptionsInfo+456+16
CNSTI4 76
ASGNI4
line 152
;152:	soundOptionsInfo.framer.width         = 256;
ADDRGP4 soundOptionsInfo+456+80
CNSTI4 256
ASGNI4
line 153
;153:	soundOptionsInfo.framer.height        = 334;
ADDRGP4 soundOptionsInfo+456+84
CNSTI4 334
ASGNI4
line 155
;154:
;155:	soundOptionsInfo.graphics.generic.type     = MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+548
CNSTI4 9
ASGNI4
line 156
;156:	soundOptionsInfo.graphics.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+548+44
CNSTU4 272
ASGNU4
line 157
;157:	soundOptionsInfo.graphics.generic.id       = ID_GRAPHICS;
ADDRGP4 soundOptionsInfo+548+8
CNSTI4 10
ASGNI4
line 158
;158:	soundOptionsInfo.graphics.generic.callback = UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+548+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 159
;159:	soundOptionsInfo.graphics.generic.x        = 216;
ADDRGP4 soundOptionsInfo+548+12
CNSTI4 216
ASGNI4
line 160
;160:	soundOptionsInfo.graphics.generic.y        = 240 - 2 * PROP_HEIGHT;
ADDRGP4 soundOptionsInfo+548+16
CNSTI4 186
ASGNI4
line 161
;161:	soundOptionsInfo.graphics.string           = "GRAPHICS";
ADDRGP4 soundOptionsInfo+548+64
ADDRGP4 $158
ASGNP4
line 162
;162:	soundOptionsInfo.graphics.style            = UI_RIGHT;
ADDRGP4 soundOptionsInfo+548+68
CNSTI4 2
ASGNI4
line 163
;163:	soundOptionsInfo.graphics.color            = color_red;
ADDRGP4 soundOptionsInfo+548+72
ADDRGP4 color_red
ASGNP4
line 165
;164:
;165:	soundOptionsInfo.display.generic.type     = MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+624
CNSTI4 9
ASGNI4
line 166
;166:	soundOptionsInfo.display.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+624+44
CNSTU4 272
ASGNU4
line 167
;167:	soundOptionsInfo.display.generic.id       = ID_DISPLAY;
ADDRGP4 soundOptionsInfo+624+8
CNSTI4 11
ASGNI4
line 168
;168:	soundOptionsInfo.display.generic.callback = UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+624+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 169
;169:	soundOptionsInfo.display.generic.x        = 216;
ADDRGP4 soundOptionsInfo+624+12
CNSTI4 216
ASGNI4
line 170
;170:	soundOptionsInfo.display.generic.y        = 240 - PROP_HEIGHT;
ADDRGP4 soundOptionsInfo+624+16
CNSTI4 213
ASGNI4
line 171
;171:	soundOptionsInfo.display.string           = "DISPLAY";
ADDRGP4 soundOptionsInfo+624+64
ADDRGP4 $176
ASGNP4
line 172
;172:	soundOptionsInfo.display.style            = UI_RIGHT;
ADDRGP4 soundOptionsInfo+624+68
CNSTI4 2
ASGNI4
line 173
;173:	soundOptionsInfo.display.color            = color_red;
ADDRGP4 soundOptionsInfo+624+72
ADDRGP4 color_red
ASGNP4
line 175
;174:
;175:	soundOptionsInfo.sound.generic.type     = MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+700
CNSTI4 9
ASGNI4
line 176
;176:	soundOptionsInfo.sound.generic.flags    = QMF_RIGHT_JUSTIFY;
ADDRGP4 soundOptionsInfo+700+44
CNSTU4 16
ASGNU4
line 177
;177:	soundOptionsInfo.sound.generic.id       = ID_SOUND;
ADDRGP4 soundOptionsInfo+700+8
CNSTI4 12
ASGNI4
line 178
;178:	soundOptionsInfo.sound.generic.callback = UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+700+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 179
;179:	soundOptionsInfo.sound.generic.x        = 216;
ADDRGP4 soundOptionsInfo+700+12
CNSTI4 216
ASGNI4
line 180
;180:	soundOptionsInfo.sound.generic.y        = 240;
ADDRGP4 soundOptionsInfo+700+16
CNSTI4 240
ASGNI4
line 181
;181:	soundOptionsInfo.sound.string           = "SOUND";
ADDRGP4 soundOptionsInfo+700+64
ADDRGP4 $194
ASGNP4
line 182
;182:	soundOptionsInfo.sound.style            = UI_RIGHT;
ADDRGP4 soundOptionsInfo+700+68
CNSTI4 2
ASGNI4
line 183
;183:	soundOptionsInfo.sound.color            = color_red;
ADDRGP4 soundOptionsInfo+700+72
ADDRGP4 color_red
ASGNP4
line 185
;184:
;185:	soundOptionsInfo.network.generic.type     = MTYPE_PTEXT;
ADDRGP4 soundOptionsInfo+776
CNSTI4 9
ASGNI4
line 186
;186:	soundOptionsInfo.network.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+776+44
CNSTU4 272
ASGNU4
line 187
;187:	soundOptionsInfo.network.generic.id       = ID_NETWORK;
ADDRGP4 soundOptionsInfo+776+8
CNSTI4 13
ASGNI4
line 188
;188:	soundOptionsInfo.network.generic.callback = UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+776+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 189
;189:	soundOptionsInfo.network.generic.x        = 216;
ADDRGP4 soundOptionsInfo+776+12
CNSTI4 216
ASGNI4
line 190
;190:	soundOptionsInfo.network.generic.y        = 240 + PROP_HEIGHT;
ADDRGP4 soundOptionsInfo+776+16
CNSTI4 267
ASGNI4
line 191
;191:	soundOptionsInfo.network.string           = "NETWORK";
ADDRGP4 soundOptionsInfo+776+64
ADDRGP4 $212
ASGNP4
line 192
;192:	soundOptionsInfo.network.style            = UI_RIGHT;
ADDRGP4 soundOptionsInfo+776+68
CNSTI4 2
ASGNI4
line 193
;193:	soundOptionsInfo.network.color            = color_red;
ADDRGP4 soundOptionsInfo+776+72
ADDRGP4 color_red
ASGNP4
line 195
;194:
;195:	y                                           = 240 - 1.5 * (BIGCHAR_HEIGHT + 2);
ADDRLP4 0
CNSTI4 213
ASGNI4
line 196
;196:	soundOptionsInfo.sfxvolume.generic.type     = MTYPE_SLIDER;
ADDRGP4 soundOptionsInfo+852
CNSTI4 1
ASGNI4
line 197
;197:	soundOptionsInfo.sfxvolume.generic.name     = "Effects Volume:";
ADDRGP4 soundOptionsInfo+852+4
ADDRGP4 $220
ASGNP4
line 198
;198:	soundOptionsInfo.sfxvolume.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+852+44
CNSTU4 258
ASGNU4
line 199
;199:	soundOptionsInfo.sfxvolume.generic.callback = UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+852+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 200
;200:	soundOptionsInfo.sfxvolume.generic.id       = ID_EFFECTSVOLUME;
ADDRGP4 soundOptionsInfo+852+8
CNSTI4 14
ASGNI4
line 201
;201:	soundOptionsInfo.sfxvolume.generic.x        = 400;
ADDRGP4 soundOptionsInfo+852+12
CNSTI4 400
ASGNI4
line 202
;202:	soundOptionsInfo.sfxvolume.generic.y        = y;
ADDRGP4 soundOptionsInfo+852+16
ADDRLP4 0
INDIRI4
ASGNI4
line 203
;203:	soundOptionsInfo.sfxvolume.minvalue         = 0;
ADDRGP4 soundOptionsInfo+852+64
CNSTF4 0
ASGNF4
line 204
;204:	soundOptionsInfo.sfxvolume.maxvalue         = 10;
ADDRGP4 soundOptionsInfo+852+68
CNSTF4 1092616192
ASGNF4
line 206
;205:
;206:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 207
;207:	soundOptionsInfo.musicvolume.generic.type     = MTYPE_SLIDER;
ADDRGP4 soundOptionsInfo+932
CNSTI4 1
ASGNI4
line 208
;208:	soundOptionsInfo.musicvolume.generic.name     = "Music Volume:";
ADDRGP4 soundOptionsInfo+932+4
ADDRGP4 $238
ASGNP4
line 209
;209:	soundOptionsInfo.musicvolume.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+932+44
CNSTU4 258
ASGNU4
line 210
;210:	soundOptionsInfo.musicvolume.generic.callback = UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+932+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 211
;211:	soundOptionsInfo.musicvolume.generic.id       = ID_MUSICVOLUME;
ADDRGP4 soundOptionsInfo+932+8
CNSTI4 15
ASGNI4
line 212
;212:	soundOptionsInfo.musicvolume.generic.x        = 400;
ADDRGP4 soundOptionsInfo+932+12
CNSTI4 400
ASGNI4
line 213
;213:	soundOptionsInfo.musicvolume.generic.y        = y;
ADDRGP4 soundOptionsInfo+932+16
ADDRLP4 0
INDIRI4
ASGNI4
line 214
;214:	soundOptionsInfo.musicvolume.minvalue         = 0;
ADDRGP4 soundOptionsInfo+932+64
CNSTF4 0
ASGNF4
line 215
;215:	soundOptionsInfo.musicvolume.maxvalue         = 10;
ADDRGP4 soundOptionsInfo+932+68
CNSTF4 1092616192
ASGNF4
line 217
;216:
;217:	y += BIGCHAR_HEIGHT + 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 218
;218:	soundOptionsInfo.quality.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 soundOptionsInfo+1012
CNSTI4 3
ASGNI4
line 219
;219:	soundOptionsInfo.quality.generic.name     = "Sound Quality:";
ADDRGP4 soundOptionsInfo+1012+4
ADDRGP4 $256
ASGNP4
line 220
;220:	soundOptionsInfo.quality.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 soundOptionsInfo+1012+44
CNSTU4 258
ASGNU4
line 221
;221:	soundOptionsInfo.quality.generic.callback = UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1012+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 222
;222:	soundOptionsInfo.quality.generic.id       = ID_QUALITY;
ADDRGP4 soundOptionsInfo+1012+8
CNSTI4 16
ASGNI4
line 223
;223:	soundOptionsInfo.quality.generic.x        = 400;
ADDRGP4 soundOptionsInfo+1012+12
CNSTI4 400
ASGNI4
line 224
;224:	soundOptionsInfo.quality.generic.y        = y;
ADDRGP4 soundOptionsInfo+1012+16
ADDRLP4 0
INDIRI4
ASGNI4
line 225
;225:	soundOptionsInfo.quality.itemnames        = quality_items;
ADDRGP4 soundOptionsInfo+1012+88
ADDRGP4 quality_items
ASGNP4
line 236
;226:	/*
;227:	    y += BIGCHAR_HEIGHT+2;
;228:	    soundOptionsInfo.a3d.generic.type			= MTYPE_RADIOBUTTON;
;229:	    soundOptionsInfo.a3d.generic.name			= "A3D:";
;230:	    soundOptionsInfo.a3d.generic.flags			= QMF_PULSEIFFOCUS|QMF_SMALLFONT;
;231:	    soundOptionsInfo.a3d.generic.callback		= UI_SoundOptionsMenu_Event;
;232:	    soundOptionsInfo.a3d.generic.id				= ID_A3D;
;233:	    soundOptionsInfo.a3d.generic.x				= 400;
;234:	    soundOptionsInfo.a3d.generic.y				= y;
;235:	*/
;236:	soundOptionsInfo.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 soundOptionsInfo+1120
CNSTI4 6
ASGNI4
line 237
;237:	soundOptionsInfo.back.generic.name     = ART_BACK0;
ADDRGP4 soundOptionsInfo+1120+4
ADDRGP4 $272
ASGNP4
line 238
;238:	soundOptionsInfo.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 soundOptionsInfo+1120+44
CNSTU4 260
ASGNU4
line 239
;239:	soundOptionsInfo.back.generic.callback = UI_SoundOptionsMenu_Event;
ADDRGP4 soundOptionsInfo+1120+48
ADDRGP4 UI_SoundOptionsMenu_Event
ASGNP4
line 240
;240:	soundOptionsInfo.back.generic.id       = ID_BACK;
ADDRGP4 soundOptionsInfo+1120+8
CNSTI4 18
ASGNI4
line 241
;241:	soundOptionsInfo.back.generic.x        = 0;
ADDRGP4 soundOptionsInfo+1120+12
CNSTI4 0
ASGNI4
line 242
;242:	soundOptionsInfo.back.generic.y        = 480 - 64;
ADDRGP4 soundOptionsInfo+1120+16
CNSTI4 416
ASGNI4
line 243
;243:	soundOptionsInfo.back.width            = 128;
ADDRGP4 soundOptionsInfo+1120+80
CNSTI4 128
ASGNI4
line 244
;244:	soundOptionsInfo.back.height           = 64;
ADDRGP4 soundOptionsInfo+1120+84
CNSTI4 64
ASGNI4
line 245
;245:	soundOptionsInfo.back.focuspic         = ART_BACK1;
ADDRGP4 soundOptionsInfo+1120+64
ADDRGP4 $289
ASGNP4
line 247
;246:
;247:	Menu_AddItem(&soundOptionsInfo.menu, (void*)&soundOptionsInfo.banner);
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 248
;248:	Menu_AddItem(&soundOptionsInfo.menu, (void*)&soundOptionsInfo.framel);
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 249
;249:	Menu_AddItem(&soundOptionsInfo.menu, (void*)&soundOptionsInfo.framer);
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 250
;250:	Menu_AddItem(&soundOptionsInfo.menu, (void*)&soundOptionsInfo.graphics);
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 251
;251:	Menu_AddItem(&soundOptionsInfo.menu, (void*)&soundOptionsInfo.display);
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+624
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 252
;252:	Menu_AddItem(&soundOptionsInfo.menu, (void*)&soundOptionsInfo.sound);
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+700
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 253
;253:	Menu_AddItem(&soundOptionsInfo.menu, (void*)&soundOptionsInfo.network);
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 254
;254:	Menu_AddItem(&soundOptionsInfo.menu, (void*)&soundOptionsInfo.sfxvolume);
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+852
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 255
;255:	Menu_AddItem(&soundOptionsInfo.menu, (void*)&soundOptionsInfo.musicvolume);
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+932
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 256
;256:	Menu_AddItem(&soundOptionsInfo.menu, (void*)&soundOptionsInfo.quality);
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1012
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 258
;257:	//	Menu_AddItem( &soundOptionsInfo.menu, ( void * ) &soundOptionsInfo.a3d );
;258:	Menu_AddItem(&soundOptionsInfo.menu, (void*)&soundOptionsInfo.back);
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+1120
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 260
;259:
;260:	soundOptionsInfo.sfxvolume.curvalue   = trap_Cvar_VariableValue("s_volume") * 10;
ADDRGP4 $82
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 soundOptionsInfo+852+72
ADDRLP4 4
INDIRF4
CNSTF4 1092616192
MULF4
ASGNF4
line 261
;261:	soundOptionsInfo.musicvolume.curvalue = trap_Cvar_VariableValue("s_musicvolume") * 10;
ADDRGP4 $86
ARGP4
ADDRLP4 8
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 soundOptionsInfo+932+72
ADDRLP4 8
INDIRF4
CNSTF4 1092616192
MULF4
ASGNF4
line 262
;262:	soundOptionsInfo.quality.curvalue     = !trap_Cvar_VariableValue("s_compression");
ADDRGP4 $95
ARGP4
ADDRLP4 16
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $308
ADDRLP4 12
CNSTI4 1
ASGNI4
ADDRGP4 $309
JUMPV
LABELV $308
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $309
ADDRGP4 soundOptionsInfo+1012+68
ADDRLP4 12
INDIRI4
ASGNI4
line 264
;263:	//	soundOptionsInfo.a3d.curvalue = (int)trap_Cvar_VariableValue( "s_usingA3D" );
;264:}
LABELV $100
endproc UI_SoundOptionsMenu_Init 20 12
export UI_SoundOptionsMenu_Cache
proc UI_SoundOptionsMenu_Cache 0 4
line 271
;265:
;266:/*
;267:===============
;268:UI_SoundOptionsMenu_Cache
;269:===============
;270:*/
;271:void UI_SoundOptionsMenu_Cache(void) {
line 272
;272:	trap_R_RegisterShaderNoMip(ART_FRAMEL);
ADDRGP4 $120
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 273
;273:	trap_R_RegisterShaderNoMip(ART_FRAMER);
ADDRGP4 $134
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 274
;274:	trap_R_RegisterShaderNoMip(ART_BACK0);
ADDRGP4 $272
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 275
;275:	trap_R_RegisterShaderNoMip(ART_BACK1);
ADDRGP4 $289
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 276
;276:}
LABELV $310
endproc UI_SoundOptionsMenu_Cache 0 4
export UI_SoundOptionsMenu
proc UI_SoundOptionsMenu 0 8
line 283
;277:
;278:/*
;279:===============
;280:UI_SoundOptionsMenu
;281:===============
;282:*/
;283:void UI_SoundOptionsMenu(void) {
line 284
;284:	UI_SoundOptionsMenu_Init();
ADDRGP4 UI_SoundOptionsMenu_Init
CALLV
pop
line 285
;285:	UI_PushMenu(&soundOptionsInfo.menu);
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 286
;286:	Menu_SetCursorToItem(&soundOptionsInfo.menu, &soundOptionsInfo.sound);
ADDRGP4 soundOptionsInfo
ARGP4
ADDRGP4 soundOptionsInfo+700
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 287
;287:}
LABELV $311
endproc UI_SoundOptionsMenu 0 8
bss
align 4
LABELV soundOptionsInfo
skip 1212
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
LABELV $289
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
LABELV $272
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
LABELV $256
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
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
LABELV $238
byte 1 77
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 32
byte 1 86
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $220
byte 1 69
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 115
byte 1 32
byte 1 86
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $212
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $194
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $176
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $158
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
LABELV $120
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
LABELV $112
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
LABELV $96
byte 1 115
byte 1 110
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
LABELV $95
byte 1 115
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $94
byte 1 115
byte 1 95
byte 1 107
byte 1 104
byte 1 122
byte 1 0
align 1
LABELV $86
byte 1 115
byte 1 95
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $82
byte 1 115
byte 1 95
byte 1 118
byte 1 111
byte 1 108
byte 1 117
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $69
byte 1 72
byte 1 105
byte 1 103
byte 1 104
byte 1 0
align 1
LABELV $68
byte 1 76
byte 1 111
byte 1 119
byte 1 0
