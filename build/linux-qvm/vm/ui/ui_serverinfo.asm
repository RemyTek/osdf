data
align 4
LABELV serverinfo_artlist
address $68
address $69
address $70
address $71
byte 4 0
export Favorites_Add
code
proc Favorites_Add 276 12
file "../../../../code/q3_ui/ui_serverinfo.c"
line 41
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:#define SERVERINFO_FRAMEL "menu/art/frame2_l"
;6:#define SERVERINFO_FRAMER "menu/art/frame1_r"
;7:#define SERVERINFO_BACK0  "menu/art/back_0"
;8:#define SERVERINFO_BACK1  "menu/art/back_1"
;9:
;10:static char* serverinfo_artlist[] = {SERVERINFO_FRAMEL, SERVERINFO_FRAMER, SERVERINFO_BACK0, SERVERINFO_BACK1, NULL};
;11:
;12:#define ID_ADD  100
;13:#define ID_BACK 101
;14:
;15:typedef struct {
;16:	menuframework_s menu;
;17:	menutext_s      banner;
;18:	menubitmap_s    framel;
;19:	menubitmap_s    framer;
;20:	menubitmap_s    back;
;21:	menutext_s      add;
;22:	menulist_s      list;
;23:	char            info[MAX_INFO_STRING];
;24:} serverinfo_t;
;25:
;26:static serverinfo_t s_serverinfo;
;27:
;28:#define MAX_INFO_LINES  64
;29:#define INFO_LINE_WIDTH 51
;30:
;31:static char* itemnames[MAX_INFO_LINES];
;32:static char  show_info[MAX_INFO_LINES][INFO_LINE_WIDTH * 3];
;33:
;34:/*
;35:=================
;36:Favorites_Add
;37:
;38:Add current server to favorites
;39:=================
;40:*/
;41:void Favorites_Add(void) {
line 47
;42:	char adrstr[128];
;43:	char serverbuff[128];
;44:	int  i;
;45:	int  best;
;46:
;47:	trap_Cvar_VariableStringBuffer("cl_currentServerAddress", serverbuff, sizeof(serverbuff));
ADDRGP4 $74
ARGP4
ADDRLP4 136
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 48
;48:	if (!serverbuff[0])
ADDRLP4 136
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $75
line 49
;49:		return;
ADDRGP4 $73
JUMPV
LABELV $75
line 51
;50:
;51:	best = 0;
ADDRLP4 132
CNSTI4 0
ASGNI4
line 52
;52:	for (i = 0; i < MAX_FAVORITESERVERS; i++) {
ADDRLP4 128
CNSTI4 0
ASGNI4
LABELV $77
line 53
;53:		trap_Cvar_VariableStringBuffer(va("server%d", i + 1), adrstr, sizeof(adrstr));
ADDRGP4 $81
ARGP4
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 54
;54:		if (!Q_stricmp(serverbuff, adrstr)) {
ADDRLP4 136
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
NEI4 $82
line 56
;55:			// already in list
;56:			return;
ADDRGP4 $73
JUMPV
LABELV $82
line 60
;57:		}
;58:
;59:		// use first empty or non-numeric available slot
;60:		if ((adrstr[0] < '0' || adrstr[0] > '9') && !best)
ADDRLP4 272
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 272
INDIRI4
CNSTI4 48
LTI4 $86
ADDRLP4 272
INDIRI4
CNSTI4 57
LEI4 $84
LABELV $86
ADDRLP4 132
INDIRI4
CNSTI4 0
NEI4 $84
line 61
;61:			best = i + 1;
ADDRLP4 132
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $84
line 62
;62:	}
LABELV $78
line 52
ADDRLP4 128
ADDRLP4 128
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 16
LTI4 $77
line 64
;63:
;64:	if (best)
ADDRLP4 132
INDIRI4
CNSTI4 0
EQI4 $87
line 65
;65:		trap_Cvar_Set(va("server%d", best), serverbuff);
ADDRGP4 $81
ARGP4
ADDRLP4 132
INDIRI4
ARGI4
ADDRLP4 264
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 264
INDIRP4
ARGP4
ADDRLP4 136
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $87
line 66
;66:}
LABELV $73
endproc Favorites_Add 276 12
proc ServerInfo_Event 8 0
line 73
;67:
;68:/*
;69:=================
;70:ServerInfo_Event
;71:=================
;72:*/
;73:static void ServerInfo_Event(void* ptr, int event) {
line 74
;74:	switch (((menucommon_s*)ptr)->id) {
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
EQI4 $93
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $96
ADDRGP4 $90
JUMPV
LABELV $93
line 76
;75:	case ID_ADD:
;76:		if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $94
line 77
;77:			break;
ADDRGP4 $91
JUMPV
LABELV $94
line 79
;78:
;79:		Favorites_Add();
ADDRGP4 Favorites_Add
CALLV
pop
line 80
;80:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 81
;81:		break;
ADDRGP4 $91
JUMPV
LABELV $96
line 84
;82:
;83:	case ID_BACK:
;84:		if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $97
line 85
;85:			break;
ADDRGP4 $91
JUMPV
LABELV $97
line 87
;86:
;87:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 88
;88:		break;
LABELV $90
LABELV $91
line 90
;89:	}
;90:}
LABELV $89
endproc ServerInfo_Event 8 0
proc ServerInfo_MenuKey 4 8
line 97
;91:
;92:/*
;93:=================
;94:ServerInfo_MenuKey
;95:=================
;96:*/
;97:static sfxHandle_t ServerInfo_MenuKey(int key) {
line 98
;98:	return (Menu_DefaultKey(&s_serverinfo.menu, key));
ADDRGP4 s_serverinfo
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $99
endproc ServerInfo_MenuKey 4 8
export ServerInfo_Cache
proc ServerInfo_Cache 4 4
line 106
;99:}
;100:
;101:/*
;102:=================
;103:ServerInfo_Cache
;104:=================
;105:*/
;106:void ServerInfo_Cache(void) {
line 110
;107:	int i;
;108:
;109:	// touch all our pics
;110:	for (i = 0;; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $101
line 111
;111:		if (!serverinfo_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 serverinfo_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $105
line 112
;112:			break;
ADDRGP4 $103
JUMPV
LABELV $105
line 113
;113:		trap_R_RegisterShaderNoMip(serverinfo_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 serverinfo_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 114
;114:	}
LABELV $102
line 110
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $101
JUMPV
LABELV $103
line 115
;115:}
LABELV $100
endproc ServerInfo_Cache 4 4
export UI_ServerInfoMenu
proc UI_ServerInfoMenu 4132 16
line 122
;116:
;117:/*
;118:=================
;119:UI_ServerInfoMenu
;120:=================
;121:*/
;122:void UI_ServerInfoMenu(void) {
line 129
;123:	const char* s;
;124:	char        key[MAX_INFO_KEY], *str;
;125:	char        value[MAX_INFO_VALUE], buf[MAX_INFO_VALUE * 2];
;126:	int         i, len, max;
;127:
;128:	// zero set all our globals
;129:	memset(&s_serverinfo, 0, sizeof(serverinfo_t));
ADDRGP4 s_serverinfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1848
ARGI4
ADDRGP4 memset
CALLP4
pop
line 131
;130:
;131:	ServerInfo_Cache();
ADDRGP4 ServerInfo_Cache
CALLV
pop
line 133
;132:
;133:	s_serverinfo.menu.key        = ServerInfo_MenuKey;
ADDRGP4 s_serverinfo+272
ADDRGP4 ServerInfo_MenuKey
ASGNP4
line 134
;134:	s_serverinfo.menu.wrapAround = qtrue;
ADDRGP4 s_serverinfo+276
CNSTI4 1
ASGNI4
line 135
;135:	s_serverinfo.menu.fullscreen = qtrue;
ADDRGP4 s_serverinfo+280
CNSTI4 1
ASGNI4
line 137
;136:
;137:	s_serverinfo.banner.generic.type = MTYPE_BTEXT;
ADDRGP4 s_serverinfo+288
CNSTI4 10
ASGNI4
line 138
;138:	s_serverinfo.banner.generic.x    = 320;
ADDRGP4 s_serverinfo+288+12
CNSTI4 320
ASGNI4
line 139
;139:	s_serverinfo.banner.generic.y    = 16;
ADDRGP4 s_serverinfo+288+16
CNSTI4 16
ASGNI4
line 140
;140:	s_serverinfo.banner.string       = "SERVER INFO";
ADDRGP4 s_serverinfo+288+64
ADDRGP4 $118
ASGNP4
line 141
;141:	s_serverinfo.banner.color        = color_white;
ADDRGP4 s_serverinfo+288+72
ADDRGP4 color_white
ASGNP4
line 142
;142:	s_serverinfo.banner.style        = UI_CENTER;
ADDRGP4 s_serverinfo+288+68
CNSTI4 1
ASGNI4
line 144
;143:
;144:	s_serverinfo.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+364
CNSTI4 6
ASGNI4
line 145
;145:	s_serverinfo.framel.generic.name  = SERVERINFO_FRAMEL;
ADDRGP4 s_serverinfo+364+4
ADDRGP4 $68
ASGNP4
line 146
;146:	s_serverinfo.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_serverinfo+364+44
CNSTU4 16384
ASGNU4
line 147
;147:	s_serverinfo.framel.generic.x     = 0;
ADDRGP4 s_serverinfo+364+12
CNSTI4 0
ASGNI4
line 148
;148:	s_serverinfo.framel.generic.y     = 78;
ADDRGP4 s_serverinfo+364+16
CNSTI4 78
ASGNI4
line 149
;149:	s_serverinfo.framel.width         = 256;
ADDRGP4 s_serverinfo+364+80
CNSTI4 256
ASGNI4
line 150
;150:	s_serverinfo.framel.height        = 329;
ADDRGP4 s_serverinfo+364+84
CNSTI4 329
ASGNI4
line 152
;151:
;152:	s_serverinfo.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+456
CNSTI4 6
ASGNI4
line 153
;153:	s_serverinfo.framer.generic.name  = SERVERINFO_FRAMER;
ADDRGP4 s_serverinfo+456+4
ADDRGP4 $69
ASGNP4
line 154
;154:	s_serverinfo.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_serverinfo+456+44
CNSTU4 16384
ASGNU4
line 155
;155:	s_serverinfo.framer.generic.x     = 376;
ADDRGP4 s_serverinfo+456+12
CNSTI4 376
ASGNI4
line 156
;156:	s_serverinfo.framer.generic.y     = 76;
ADDRGP4 s_serverinfo+456+16
CNSTI4 76
ASGNI4
line 157
;157:	s_serverinfo.framer.width         = 256;
ADDRGP4 s_serverinfo+456+80
CNSTI4 256
ASGNI4
line 158
;158:	s_serverinfo.framer.height        = 334;
ADDRGP4 s_serverinfo+456+84
CNSTI4 334
ASGNI4
line 160
;159:
;160:	s_serverinfo.add.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_serverinfo+640
CNSTI4 9
ASGNI4
line 161
;161:	s_serverinfo.add.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_serverinfo+640+44
CNSTU4 264
ASGNU4
line 162
;162:	s_serverinfo.add.generic.callback = ServerInfo_Event;
ADDRGP4 s_serverinfo+640+48
ADDRGP4 ServerInfo_Event
ASGNP4
line 163
;163:	s_serverinfo.add.generic.id       = ID_ADD;
ADDRGP4 s_serverinfo+640+8
CNSTI4 100
ASGNI4
line 164
;164:	s_serverinfo.add.generic.x        = 320;
ADDRGP4 s_serverinfo+640+12
CNSTI4 320
ASGNI4
line 165
;165:	s_serverinfo.add.generic.y        = 371;
ADDRGP4 s_serverinfo+640+16
CNSTI4 371
ASGNI4
line 166
;166:	s_serverinfo.add.string           = "ADD TO FAVORITES";
ADDRGP4 s_serverinfo+640+64
ADDRGP4 $162
ASGNP4
line 167
;167:	s_serverinfo.add.style            = UI_CENTER | UI_SMALLFONT;
ADDRGP4 s_serverinfo+640+68
CNSTI4 17
ASGNI4
line 168
;168:	s_serverinfo.add.color            = color_red;
ADDRGP4 s_serverinfo+640+72
ADDRGP4 color_red
ASGNP4
line 169
;169:	if (trap_Cvar_VariableValue("sv_running")) {
ADDRGP4 $169
ARGP4
ADDRLP4 4116
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 4116
INDIRF4
CNSTF4 0
EQF4 $167
line 170
;170:		s_serverinfo.add.generic.flags |= QMF_GRAYED;
ADDRLP4 4120
ADDRGP4 s_serverinfo+640+44
ASGNP4
ADDRLP4 4120
INDIRP4
ADDRLP4 4120
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 171
;171:	}
LABELV $167
line 173
;172:
;173:	s_serverinfo.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_serverinfo+548
CNSTI4 6
ASGNI4
line 174
;174:	s_serverinfo.back.generic.name     = SERVERINFO_BACK0;
ADDRGP4 s_serverinfo+548+4
ADDRGP4 $70
ASGNP4
line 175
;175:	s_serverinfo.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_serverinfo+548+44
CNSTU4 260
ASGNU4
line 176
;176:	s_serverinfo.back.generic.callback = ServerInfo_Event;
ADDRGP4 s_serverinfo+548+48
ADDRGP4 ServerInfo_Event
ASGNP4
line 177
;177:	s_serverinfo.back.generic.id       = ID_BACK;
ADDRGP4 s_serverinfo+548+8
CNSTI4 101
ASGNI4
line 178
;178:	s_serverinfo.back.generic.x        = 0;
ADDRGP4 s_serverinfo+548+12
CNSTI4 0
ASGNI4
line 179
;179:	s_serverinfo.back.generic.y        = 480 - 64;
ADDRGP4 s_serverinfo+548+16
CNSTI4 416
ASGNI4
line 180
;180:	s_serverinfo.back.width            = 128;
ADDRGP4 s_serverinfo+548+80
CNSTI4 128
ASGNI4
line 181
;181:	s_serverinfo.back.height           = 64;
ADDRGP4 s_serverinfo+548+84
CNSTI4 64
ASGNI4
line 182
;182:	s_serverinfo.back.focuspic         = SERVERINFO_BACK1;
ADDRGP4 s_serverinfo+548+64
ADDRGP4 $71
ASGNP4
line 184
;183:
;184:	trap_GetConfigString(CS_SERVERINFO, s_serverinfo.info, MAX_INFO_STRING);
CNSTI4 0
ARGI4
ADDRGP4 s_serverinfo+824
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigString
CALLI4
pop
line 186
;185:
;186:	max = 0;
ADDRLP4 4112
CNSTI4 0
ASGNI4
line 187
;187:	s   = s_serverinfo.info;
ADDRLP4 3080
ADDRGP4 s_serverinfo+824
ASGNP4
LABELV $193
line 188
;188:	do {
line 189
;189:		s = Info_NextPair(s, key, value);
ADDRLP4 3080
INDIRP4
ARGP4
ADDRLP4 2056
ARGP4
ADDRLP4 3088
ARGP4
ADDRLP4 4120
ADDRGP4 Info_NextPair
CALLP4
ASGNP4
ADDRLP4 3080
ADDRLP4 4120
INDIRP4
ASGNP4
line 190
;190:		if (key[0] == '\0') {
ADDRLP4 2056
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $196
line 191
;191:			break;
ADDRGP4 $195
JUMPV
LABELV $196
line 193
;192:		}
;193:		len = strlen(key);
ADDRLP4 2056
ARGP4
ADDRLP4 4124
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4124
INDIRI4
ASGNI4
line 194
;194:		if (len > max)
ADDRLP4 4
INDIRI4
ADDRLP4 4112
INDIRI4
LEI4 $198
line 195
;195:			max = len;
ADDRLP4 4112
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $198
line 196
;196:	} while (*s != '\0');
LABELV $194
ADDRLP4 3080
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $193
LABELV $195
line 198
;197:
;198:	s_serverinfo.list.generic.type  = MTYPE_SCROLLLIST;
ADDRGP4 s_serverinfo+716
CNSTI4 8
ASGNI4
line 199
;199:	s_serverinfo.list.generic.flags = QMF_PULSEIFFOCUS;
ADDRGP4 s_serverinfo+716+44
CNSTU4 256
ASGNU4
line 200
;200:	s_serverinfo.list.generic.id    = 123;
ADDRGP4 s_serverinfo+716+8
CNSTI4 123
ASGNI4
line 201
;201:	s_serverinfo.list.generic.x     = 120;
ADDRGP4 s_serverinfo+716+12
CNSTI4 120
ASGNI4
line 202
;202:	s_serverinfo.list.generic.y     = 132;
ADDRGP4 s_serverinfo+716+16
CNSTI4 132
ASGNI4
line 203
;203:	s_serverinfo.list.width         = INFO_LINE_WIDTH;
ADDRGP4 s_serverinfo+716+92
CNSTI4 51
ASGNI4
line 204
;204:	s_serverinfo.list.height        = 14;
ADDRGP4 s_serverinfo+716+96
CNSTI4 14
ASGNI4
line 205
;205:	s_serverinfo.list.columns       = 1;
ADDRGP4 s_serverinfo+716+100
CNSTI4 1
ASGNI4
line 206
;206:	s_serverinfo.list.scroll        = 1;
ADDRGP4 s_serverinfo+716+80
CNSTI4 1
ASGNI4
line 208
;207:
;208:	s_serverinfo.list.itemnames = (const char**)itemnames;
ADDRGP4 s_serverinfo+716+88
ADDRGP4 itemnames
ASGNP4
line 210
;209:
;210:	s_serverinfo.list.numitems = 0;
ADDRGP4 s_serverinfo+716+72
CNSTI4 0
ASGNI4
line 211
;211:	s                          = s_serverinfo.info;
ADDRLP4 3080
ADDRGP4 s_serverinfo+824
ASGNP4
LABELV $222
line 212
;212:	do {
line 213
;213:		s = Info_NextPair(s, key, value);
ADDRLP4 3080
INDIRP4
ARGP4
ADDRLP4 2056
ARGP4
ADDRLP4 3088
ARGP4
ADDRLP4 4120
ADDRGP4 Info_NextPair
CALLP4
ASGNP4
ADDRLP4 3080
ADDRLP4 4120
INDIRP4
ASGNP4
line 214
;214:		if (key[0] == '\0')
ADDRLP4 2056
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $225
line 215
;215:			break;
ADDRGP4 $224
JUMPV
LABELV $225
line 217
;216:
;217:		str                                                     = show_info[s_serverinfo.list.numitems];
ADDRLP4 3084
ADDRGP4 s_serverinfo+716+72
INDIRI4
CNSTI4 153
MULI4
ADDRGP4 show_info
ADDP4
ASGNP4
line 218
;218:		s_serverinfo.list.itemnames[s_serverinfo.list.numitems] = str;
ADDRGP4 s_serverinfo+716+72
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_serverinfo+716+88
INDIRP4
ADDP4
ADDRLP4 3084
INDIRP4
ASGNP4
line 220
;219:
;220:		len = strlen(key);
ADDRLP4 2056
ARGP4
ADDRLP4 4124
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 4124
INDIRI4
ASGNI4
line 221
;221:		len = max - len;
ADDRLP4 4
ADDRLP4 4112
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 224
;222:
;223:		// align key name
;224:		for (i = 0; i < len; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $236
JUMPV
LABELV $233
line 225
;225:			buf[i] = ' ';
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 32
ASGNI1
LABELV $234
line 224
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $236
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $233
line 226
;226:		BG_sprintf(buf + i, "%s ^3%s", key, value);
ADDRLP4 0
INDIRI4
ADDRLP4 8
ADDP4
ARGP4
ADDRGP4 $237
ARGP4
ADDRLP4 2056
ARGP4
ADDRLP4 3088
ARGP4
ADDRGP4 BG_sprintf
CALLI4
pop
line 229
;227:
;228:		// take care about overflow in destination string
;229:		buf[INFO_LINE_WIDTH * 3 - 1] = '\0';
ADDRLP4 8+152
CNSTI1 0
ASGNI1
line 230
;230:		strcpy(str, buf);
ADDRLP4 3084
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 231
;231:		s_serverinfo.list.numitems++;
ADDRLP4 4128
ADDRGP4 s_serverinfo+716+72
ASGNP4
ADDRLP4 4128
INDIRP4
ADDRLP4 4128
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 232
;232:		if (s_serverinfo.list.numitems >= MAX_INFO_LINES)
ADDRGP4 s_serverinfo+716+72
INDIRI4
CNSTI4 64
LTI4 $241
line 233
;233:			break;
ADDRGP4 $224
JUMPV
LABELV $241
line 234
;234:	} while (*s != '\0');
LABELV $223
ADDRLP4 3080
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $222
LABELV $224
line 236
;235:
;236:	Menu_AddItem(&s_serverinfo.menu, (void*)&s_serverinfo.banner);
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 237
;237:	Menu_AddItem(&s_serverinfo.menu, (void*)&s_serverinfo.framel);
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 238
;238:	Menu_AddItem(&s_serverinfo.menu, (void*)&s_serverinfo.framer);
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 239
;239:	Menu_AddItem(&s_serverinfo.menu, (void*)&s_serverinfo.add);
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+640
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 240
;240:	Menu_AddItem(&s_serverinfo.menu, (void*)&s_serverinfo.back);
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 241
;241:	Menu_AddItem(&s_serverinfo.menu, (void*)&s_serverinfo.list);
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 s_serverinfo+716
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 243
;242:
;243:	UI_PushMenu(&s_serverinfo.menu);
ADDRGP4 s_serverinfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 244
;244:}
LABELV $107
endproc UI_ServerInfoMenu 4132 16
bss
align 1
LABELV show_info
skip 9792
align 4
LABELV itemnames
skip 256
align 4
LABELV s_serverinfo
skip 1848
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
LABELV $237
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 51
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $169
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
LABELV $162
byte 1 65
byte 1 68
byte 1 68
byte 1 32
byte 1 84
byte 1 79
byte 1 32
byte 1 70
byte 1 65
byte 1 86
byte 1 79
byte 1 82
byte 1 73
byte 1 84
byte 1 69
byte 1 83
byte 1 0
align 1
LABELV $118
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
LABELV $81
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $74
byte 1 99
byte 1 108
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 114
byte 1 101
byte 1 110
byte 1 116
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
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
