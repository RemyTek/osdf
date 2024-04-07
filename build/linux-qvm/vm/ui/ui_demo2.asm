lit
align 1
LABELV dir
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 0
skip 250
data
align 4
LABELV dirlevel
byte 4 0
align 4
LABELV sorttype
address $70
address $71
address $72
byte 4 0
code
proc Demos_DrawFilter 56 20
file "../../../../code/q3_ui/ui_demo2.c"
line 90
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:DEMOS MENU
;7:
;8:=======================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:#include "../game/q_shared.h"
;13:
;14:#define ART_BACK0       "menu/art/back_0"
;15:#define ART_BACK1       "menu/art/back_1"
;16:#define ART_GO0         "menu/art/play_0"
;17:#define ART_GO1         "menu/art/play_1"
;18:#define ART_ARROWS_VERT "menu/art/arrows_vert_0"
;19:#define ART_ARROWS_UP   "menu/art/arrows_vert_top"
;20:#define ART_ARROWS_DOWN "menu/art/arrows_vert_bot"
;21:
;22:#define UI_DEMO_LENGTH 64
;23:#define UI_MAX_DEMOS   1024
;24:#define UI_MAX_ITEMS   18
;25:#define NAMEBUFSIZE    65536
;26:
;27:#define ID_BACK     10
;28:#define ID_GO       11
;29:#define ID_LIST     12
;30:#define ID_UP       13
;31:#define ID_DOWN     14
;32:#define ID_TIMEDEMO 15
;33:#define ID_SORT     16
;34:#define ID_FILTER   17
;35:
;36:#define ARROWS_WIDTH  48
;37:#define ARROWS_HEIGHT 128
;38:#define ARROWS_TOP    240 + 4.75f
;39:#define ARROWS_LEFT   512 + 64
;40:
;41:typedef struct {
;42:	menuframework_s   menu;
;43:
;44:	menutext_s        banner;
;45:
;46:	menulist_s        list;
;47:	menulist_s        sort;
;48:
;49:	menubitmap_s      arrows;
;50:	menubitmap_s      up;
;51:	menubitmap_s      down;
;52:	menubitmap_s      back;
;53:	menubitmap_s      go;
;54:	menuradiobutton_s timedemo;
;55:
;56:	menufield_s       filter;
;57:
;58:	int               numDemos;
;59:	qboolean          canPlay;
;60:	char*             itemname[UI_MAX_DEMOS];
;61:	char              namefilter[MAX_EDIT_LINE];
;62:} demos_t;
;63:
;64:static demos_t s_demos;
;65:
;66:typedef struct {
;67:	char* file_name;
;68:	int   file_nlen;
;69:	char  file_type;
;70:} demo_entry_t;
;71:
;72:static demo_entry_t  dentry[UI_MAX_DEMOS];  // will be filled by UI_DemosReadDir()
;73:static demo_entry_t* dptr[UI_MAX_DEMOS];    // used for sorting
;74:static int           num_files;
;75:static char          dir[256] = {"demos"};  // current directory
;76:static int           dirlevel = 0;          // directory level
;77:static int           listpos[64][2];        // saved list positions( curvalue, top )
;78:static char          buffer[NAMEBUFSIZE];   // filename buffer
;79:static char          show_names[UI_MAX_DEMOS][UI_DEMO_LENGTH * 3];
;80:
;81:static const char*   sorttype[] = {"No", "Name, asc", "Name, desc", 0};
;82:
;83:static void          UI_DemosFillList(void);
;84:
;85:/*
;86:=================
;87:Demos_DrawFilter
;88:=================
;89:*/
;90:static void Demos_DrawFilter(void* self) {
line 99
;91:	menufield_s* f;
;92:	qboolean     focus;
;93:	int          style;
;94:	char*        txt;
;95:	char         c;
;96:	float*       color;
;97:	int          basex, x, y;
;98:
;99:	f     = (menufield_s*)self;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
line 100
;100:	basex = f->generic.x;
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 101
;101:	y     = f->generic.y;
ADDRLP4 20
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 102
;102:	focus = (f->generic.parent->cursor == f->generic.menuPosition);
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
NEI4 $75
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $76
JUMPV
LABELV $75
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $76
ADDRLP4 32
ADDRLP4 36
INDIRI4
ASGNI4
line 109
;103:#if 0
;104:	UI_FillRect( f->generic.left, f->generic.top, 
;105:		f->generic.right-f->generic.left, 
;106:		f->generic.bottom-f->generic.top, 
;107:		text_color_disabled );
;108:#endif
;109:	style = UI_LEFT | UI_SMALLFONT;
ADDRLP4 12
CNSTI4 16
ASGNI4
line 110
;110:	color = text_color_normal;
ADDRLP4 16
ADDRGP4 text_color_normal
ASGNP4
line 112
;111:
;112:	if (focus) {
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $77
line 113
;113:		style |= UI_PULSE;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 114
;114:		color = text_color_highlight;
ADDRLP4 16
ADDRGP4 text_color_highlight
ASGNP4
line 115
;115:	}
LABELV $77
line 117
;116:
;117:	UI_DrawString(basex, y, "Filter:", style, color);
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 $79
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 119
;118:
;119:	basex += 64;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 121
;120:	// y += PROP_HEIGHT;
;121:	txt   = f->field.buffer;
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
line 122
;122:	color = g_color_table[ColorIndex(COLOR_WHITE)];
ADDRLP4 16
ADDRGP4 g_color_table+112
ASGNP4
line 123
;123:	x     = basex;
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
ADDRGP4 $82
JUMPV
LABELV $81
line 125
;124:
;125:	while ((c = *txt) != 0) {
line 126
;126:		UI_DrawChar(x, y, c, style, color);
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 127
;127:		txt++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 128
;128:		x += SMALLCHAR_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 129
;129:	}
LABELV $82
line 125
ADDRLP4 44
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 4
ADDRLP4 44
INDIRI1
ASGNI1
ADDRLP4 44
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $81
line 131
;130:
;131:	if (strcmp(s_demos.namefilter, f->field.buffer)) {
ADDRGP4 s_demos+5552
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
ARGP4
ADDRLP4 48
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $84
line 132
;132:		strcpy(s_demos.namefilter, f->field.buffer);
ADDRGP4 s_demos+5552
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 133
;133:		UI_DemosFillList();
ADDRGP4 UI_DemosFillList
CALLV
pop
line 134
;134:	}
LABELV $84
line 137
;135:
;136:	// draw cursor if we have focus
;137:	if (focus) {
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $88
line 138
;138:		if (trap_Key_GetOverstrikeMode()) {
ADDRLP4 52
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $90
line 139
;139:			c = 11;
ADDRLP4 4
CNSTI1 11
ASGNI1
line 140
;140:		} else {
ADDRGP4 $91
JUMPV
LABELV $90
line 141
;141:			c = 10;
ADDRLP4 4
CNSTI1 10
ASGNI1
line 142
;142:		}
LABELV $91
line 144
;143:
;144:		style &= ~UI_PULSE;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 145
;145:		style |= UI_BLINK;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 147
;146:
;147:		UI_DrawChar(basex + f->field.cursor * SMALLCHAR_WIDTH, y, c, style, color_white);
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 64
ADDP4
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 color_white
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 148
;148:	}
LABELV $88
line 149
;149:}
LABELV $73
endproc Demos_DrawFilter 56 20
proc UI_DemosSavePosition 0 0
line 151
;150:
;151:static void UI_DemosSavePosition(void) {
line 152
;152:	if (dirlevel < ARRAY_LEN(listpos)) {
ADDRGP4 dirlevel
INDIRI4
CVIU4 4
CNSTU4 64
GEU4 $93
line 153
;153:		listpos[dirlevel][0] = s_demos.list.curvalue;
ADDRGP4 dirlevel
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 listpos
ADDP4
ADDRGP4 s_demos+364+68
INDIRI4
ASGNI4
line 154
;154:		listpos[dirlevel][1] = s_demos.list.top;
ADDRGP4 dirlevel
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 listpos+4
ADDP4
ADDRGP4 s_demos+364+76
INDIRI4
ASGNI4
line 155
;155:	}
LABELV $93
line 156
;156:}
LABELV $92
endproc UI_DemosSavePosition 0 0
proc UI_DemosRestorePosition 0 0
line 158
;157:
;158:static void UI_DemosRestorePosition(void) {
line 159
;159:	if (dirlevel < ARRAY_LEN(listpos)) {
ADDRGP4 dirlevel
INDIRI4
CVIU4 4
CNSTU4 64
GEU4 $101
line 160
;160:		s_demos.list.curvalue = listpos[dirlevel][0];
ADDRGP4 s_demos+364+68
ADDRGP4 dirlevel
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 listpos
ADDP4
INDIRI4
ASGNI4
line 161
;161:		s_demos.list.top      = listpos[dirlevel][1];
ADDRGP4 s_demos+364+76
ADDRGP4 dirlevel
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 listpos+4
ADDP4
INDIRI4
ASGNI4
line 162
;162:	}
LABELV $101
line 163
;163:}
LABELV $100
endproc UI_DemosRestorePosition 0 0
proc UI_DemosReadDir 80 16
line 170
;164:
;165:/*
;166:===============
;167:UI_DemosReadDir
;168:===============
;169:*/
;170:static void UI_DemosReadDir(void) {
line 174
;171:	char extension[32], *s;
;172:	int  i, len, n, c, m;
;173:
;174:	c = 0;  // count of valid entries
ADDRLP4 8
CNSTI4 0
ASGNI4
line 177
;175:
;176:	// reserve room for ".."
;177:	if (dirlevel > 0)
ADDRGP4 dirlevel
INDIRI4
CNSTI4 0
LEI4 $109
line 178
;178:		c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $109
line 181
;179:
;180:	// get directories first
;181:	n = trap_FS_GetFileList(dir, "/", buffer, sizeof(buffer));
ADDRGP4 dir
ARGP4
ADDRGP4 $111
ARGP4
ADDRGP4 buffer
ARGP4
CNSTI4 65536
ARGI4
ADDRLP4 56
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 56
INDIRI4
ASGNI4
line 182
;182:	if (n > UI_MAX_DEMOS)
ADDRLP4 16
INDIRI4
CNSTI4 1024
LEI4 $112
line 183
;183:		n = UI_MAX_DEMOS;
ADDRLP4 16
CNSTI4 1024
ASGNI4
LABELV $112
line 184
;184:	s = buffer;
ADDRLP4 0
ADDRGP4 buffer
ASGNP4
line 186
;185:
;186:	for (i = 0; i < n; i++) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $114
line 187
;187:		len = strlen(s);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
ASGNI4
line 189
;188:		// don't and "." and ".." entries for demo root dir
;189:		if (!s[0] || (s[0] == '.' && !s[1]) || (!strcmp(s, "..") && dirlevel == 0)) {
ADDRLP4 68
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $122
ADDRLP4 68
INDIRI4
CNSTI4 46
NEI4 $123
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $122
LABELV $123
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRLP4 72
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $118
ADDRGP4 dirlevel
INDIRI4
CNSTI4 0
NEI4 $118
LABELV $122
line 190
;190:			s += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 191
;191:			continue;
ADDRGP4 $115
JUMPV
LABELV $118
line 193
;192:		}
;193:		if (!strcmp(s, "..")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRLP4 76
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $124
line 194
;194:			dentry[0].file_type = 2;
ADDRGP4 dentry+8
CNSTI1 2
ASGNI1
line 195
;195:			dentry[0].file_name = s;
ADDRGP4 dentry
ADDRLP4 0
INDIRP4
ASGNP4
line 196
;196:			dentry[0].file_nlen = len;
ADDRGP4 dentry+4
ADDRLP4 4
INDIRI4
ASGNI4
line 197
;197:		} else {
ADDRGP4 $125
JUMPV
LABELV $124
line 198
;198:			dentry[c].file_type = 1;
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry+8
ADDP4
CNSTI1 1
ASGNI1
line 199
;199:			dentry[c].file_name = s;
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 200
;200:			dentry[c].file_nlen = len;
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry+4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 201
;201:			c++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 202
;202:		}
LABELV $125
line 203
;203:		s += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 204
;204:	}
LABELV $115
line 186
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $117
ADDRLP4 12
INDIRI4
ADDRLP4 16
INDIRI4
LTI4 $114
line 205
;205:	num_files = c;
ADDRGP4 num_files
ADDRLP4 8
INDIRI4
ASGNI4
line 206
;206:	len       = sizeof(buffer) - (s - buffer) - 1;
ADDRLP4 4
CNSTU4 65536
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 buffer
CVPU4 4
SUBU4
CVUI4 4
CVIU4 4
SUBU4
CNSTU4 1
SUBU4
CVUI4 4
ASGNI4
line 207
;207:	if (len > 2 && num_files < UI_MAX_DEMOS - 1) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LEI4 $130
ADDRGP4 num_files
INDIRI4
CNSTI4 1023
GEI4 $130
line 209
;208:		// count regular files
;209:		m = trap_FS_GetFileList(dir, "dm_??", s, len);  // try to perform pattern match in first place
ADDRGP4 dir
ARGP4
ADDRGP4 $132
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 60
INDIRI4
ASGNI4
line 210
;210:		if (!m) {
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $133
line 211
;211:			Com_sprintf(extension, sizeof(extension), "dm_%d", (int)trap_Cvar_VariableValue("protocol"));
ADDRGP4 $136
ARGP4
ADDRLP4 64
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 24
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $135
ARGP4
ADDRLP4 64
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 212
;212:			m = trap_FS_GetFileList(dir, extension, s, len);
ADDRGP4 dir
ARGP4
ADDRLP4 24
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 68
INDIRI4
ASGNI4
line 213
;213:		}
LABELV $133
line 214
;214:		if (num_files + m > UI_MAX_DEMOS)
ADDRGP4 num_files
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
CNSTI4 1024
LEI4 $137
line 215
;215:			m = UI_MAX_DEMOS - n;
ADDRLP4 20
CNSTI4 1024
ADDRLP4 16
INDIRI4
SUBI4
ASGNI4
LABELV $137
line 216
;216:		for (i = 0; i < m; i++, c++) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $142
JUMPV
LABELV $139
line 217
;217:			len                 = strlen(s);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 64
INDIRI4
ASGNI4
line 218
;218:			dentry[c].file_name = s;
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 219
;219:			dentry[c].file_nlen = len;
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry+4
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 220
;220:			dentry[c].file_type = 0;
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry+8
ADDP4
CNSTI1 0
ASGNI1
line 221
;221:			s += len + 1;
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRP4
ADDP4
ASGNP4
line 222
;222:		}
LABELV $140
line 216
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $142
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $139
line 223
;223:		num_files += m;
ADDRLP4 64
ADDRGP4 num_files
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
ADDRLP4 20
INDIRI4
ADDI4
ASGNI4
line 224
;224:	}
LABELV $130
line 225
;225:	s_demos.numDemos = num_files;
ADDRGP4 s_demos+1448
ADDRGP4 num_files
INDIRI4
ASGNI4
line 226
;226:}
LABELV $108
endproc UI_DemosReadDir 80 16
proc UI_UpdateDirectory 28 12
line 233
;227:
;228:/*
;229:===============
;230:UI_UpdateDirectory
;231:===============
;232:*/
;233:static qboolean UI_UpdateDirectory(char* name) {
line 236
;234:	char* s;
;235:
;236:	s_demos.namefilter[0]          = '\0';
ADDRGP4 s_demos+5552
CNSTI1 0
ASGNI1
line 237
;237:	s_demos.filter.field.buffer[0] = '\0';
ADDRGP4 s_demos+1108+64+12
CNSTI1 0
ASGNI1
line 238
;238:	s_demos.filter.field.cursor    = 0;
ADDRGP4 s_demos+1108+64
CNSTI4 0
ASGNI4
line 240
;239:
;240:	if (!name || !*name) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $155
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $153
LABELV $155
line 241
;241:		s = Q_strrchr(dir, '/');
ADDRGP4 dir
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 8
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 242
;242:		if (!s || s == dir) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 12
INDIRU4
CNSTU4 0
EQU4 $158
ADDRLP4 12
INDIRU4
ADDRGP4 dir
CVPU4 4
NEU4 $156
LABELV $158
line 243
;243:			dirlevel = 0;
ADDRGP4 dirlevel
CNSTI4 0
ASGNI4
line 244
;244:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $146
JUMPV
LABELV $156
line 245
;245:		} else {
line 246
;246:			*s = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 247
;247:			s  = Q_strrchr(dir, '/');
ADDRGP4 dir
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 16
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 248
;248:			if (dirlevel > 0)
ADDRGP4 dirlevel
INDIRI4
CNSTI4 0
LEI4 $159
line 249
;249:				dirlevel--;
ADDRLP4 20
ADDRGP4 dirlevel
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $159
line 250
;250:			if (!s || s == dir)
ADDRLP4 24
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 24
INDIRU4
CNSTU4 0
EQU4 $163
ADDRLP4 24
INDIRU4
ADDRGP4 dir
CVPU4 4
NEU4 $161
LABELV $163
line 251
;251:				dirlevel = 0;
ADDRGP4 dirlevel
CNSTI4 0
ASGNI4
LABELV $161
line 252
;252:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $146
JUMPV
LABELV $153
line 254
;253:		}
;254:	} else {
line 255
;255:		Q_strcat(dir, sizeof(dir), "/");
ADDRGP4 dir
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $111
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 256
;256:		Q_strcat(dir, sizeof(dir), name);
ADDRGP4 dir
ARGP4
CNSTI4 256
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 257
;257:		UI_DemosSavePosition();
ADDRGP4 UI_DemosSavePosition
CALLV
pop
line 258
;258:		dirlevel++;
ADDRLP4 8
ADDRGP4 dirlevel
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 259
;259:		return qtrue;
CNSTI4 1
RETI4
LABELV $146
endproc UI_UpdateDirectory 28 12
proc UI_DemoClick 20 12
line 268
;260:	}
;261:}
;262:
;263:/*
;264:===============
;265:UI_UpdateDirectory
;266:===============
;267:*/
;268:static void UI_DemoClick(void) {
line 272
;269:	demo_entry_t* d;
;270:	char *        s, *r;
;271:
;272:	if (!s_demos.numDemos || !s_demos.canPlay)
ADDRGP4 s_demos+1448
INDIRI4
CNSTI4 0
EQI4 $169
ADDRGP4 s_demos+1452
INDIRI4
CNSTI4 0
NEI4 $165
LABELV $169
line 273
;273:		return;
ADDRGP4 $164
JUMPV
LABELV $165
line 275
;274:
;275:	d = dptr[s_demos.list.curvalue];
ADDRLP4 0
ADDRGP4 s_demos+364+68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dptr
ADDP4
INDIRP4
ASGNP4
line 276
;276:	if (!d)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $172
line 277
;277:		return;
ADDRGP4 $164
JUMPV
LABELV $172
line 279
;278:
;279:	if (d->file_type > 0) {
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $174
line 280
;280:		if (!strcmp(d->file_name, "..")) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRLP4 12
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $176
line 281
;281:			UI_UpdateDirectory(NULL);
CNSTP4 0
ARGP4
ADDRGP4 UI_UpdateDirectory
CALLI4
pop
line 282
;282:			UI_DemosReadDir();
ADDRGP4 UI_DemosReadDir
CALLV
pop
line 283
;283:			UI_DemosFillList();
ADDRGP4 UI_DemosFillList
CALLV
pop
line 284
;284:			UI_DemosRestorePosition();
ADDRGP4 UI_DemosRestorePosition
CALLV
pop
line 285
;285:		} else {
ADDRGP4 $175
JUMPV
LABELV $176
line 286
;286:			UI_UpdateDirectory(d->file_name);
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 UI_UpdateDirectory
CALLI4
pop
line 287
;287:			UI_DemosReadDir();
ADDRGP4 UI_DemosReadDir
CALLV
pop
line 288
;288:			UI_DemosFillList();
ADDRGP4 UI_DemosFillList
CALLV
pop
line 289
;289:		}
line 290
;290:	} else {
ADDRGP4 $175
JUMPV
LABELV $174
line 291
;291:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 292
;292:		s = strchr(dir, '/');
ADDRGP4 dir
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 12
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 293
;293:		if (s) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $178
line 294
;294:			r = va("demo \"%s/%s\"\n", s + 1, d->file_name);
ADDRGP4 $180
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 295
;295:		} else
ADDRGP4 $179
JUMPV
LABELV $178
line 296
;296:			r = va("demo \"%s\"\n", d->file_name);
ADDRGP4 $181
ARGP4
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
LABELV $179
line 297
;297:		trap_Cmd_ExecuteText(EXEC_APPEND, r);
CNSTI4 2
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 298
;298:	}
LABELV $175
line 299
;299:}
LABELV $164
endproc UI_DemoClick 20 12
proc Demos_MenuEvent 12 8
line 306
;300:
;301:/*
;302:===============
;303:Demos_MenuEvent
;304:===============
;305:*/
;306:static void Demos_MenuEvent(void* ptr, int event) {
line 307
;307:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $183
line 308
;308:		return;
ADDRGP4 $182
JUMPV
LABELV $183
line 311
;309:	}
;310:
;311:	switch (((menucommon_s*)ptr)->id) {
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
LTI4 $185
ADDRLP4 0
INDIRI4
CNSTI4 16
GTI4 $185
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $207-40
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $207
address $189
address $188
address $185
address $190
address $192
address $194
address $202
code
LABELV $188
line 313
;312:	case ID_GO:
;313:		UI_DemoClick();
ADDRGP4 UI_DemoClick
CALLV
pop
line 314
;314:		break;
ADDRGP4 $186
JUMPV
LABELV $189
line 317
;315:
;316:	case ID_BACK:
;317:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 318
;318:		break;
ADDRGP4 $186
JUMPV
LABELV $190
line 321
;319:
;320:	case ID_UP:
;321:		ScrollList_Key(&s_demos.list, K_UPARROW);
ADDRGP4 s_demos+364
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 322
;322:		break;
ADDRGP4 $186
JUMPV
LABELV $192
line 325
;323:
;324:	case ID_DOWN:
;325:		ScrollList_Key(&s_demos.list, K_DOWNARROW);
ADDRGP4 s_demos+364
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 326
;326:		break;
ADDRGP4 $186
JUMPV
LABELV $194
line 329
;327:
;328:	case ID_TIMEDEMO:
;329:		if (s_demos.timedemo.curvalue)
ADDRGP4 s_demos+1040+64
INDIRI4
CNSTI4 0
EQI4 $195
line 330
;330:			trap_Cvar_Set("timedemo", "1");
ADDRGP4 $199
ARGP4
ADDRGP4 $200
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
ADDRGP4 $186
JUMPV
LABELV $195
line 332
;331:		else
;332:			trap_Cvar_Set("timedemo", "0");
ADDRGP4 $199
ARGP4
ADDRGP4 $201
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 333
;333:		break;
ADDRGP4 $186
JUMPV
LABELV $202
line 336
;334:
;335:	case ID_SORT:
;336:		trap_Cvar_Set("ui_demoSort", va("%i", s_demos.sort.curvalue));
ADDRGP4 $204
ARGP4
ADDRGP4 s_demos+472+68
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 $203
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 337
;337:		UI_DemosFillList();
ADDRGP4 UI_DemosFillList
CALLV
pop
line 338
;338:		break;
LABELV $185
LABELV $186
line 340
;339:	}
;340:}
LABELV $182
endproc Demos_MenuEvent 12 8
proc UI_DemosDblclick 0 0
line 342
;341:
;342:static void UI_DemosDblclick(void* ptr) {
line 343
;343:	UI_DemoClick();
ADDRGP4 UI_DemoClick
CALLV
pop
line 344
;344:}
LABELV $209
endproc UI_DemosDblclick 0 0
proc UI_DemosMenu_Key 16 8
line 377
;345:
;346:#if 0
;347:static sfxHandle_t UI_DemosKeydown( void *ptr, int key ) {
;348:/*	
;349:	if ( key == K_ENTER || key == K_KP_ENTER ) {
;350:		UI_DemoClick();
;351:		return menu_move_sound;
;352:	}
;353:	if ( key == K_BACKSPACE ) {
;354:		if ( UI_UpdateDirectory( NULL ) ) {
;355:			UI_DemosReadDir();
;356:			UI_DemosFillList();
;357:			UI_DemosRestorePosition();
;358:		}
;359:		return menu_move_sound;
;360:	}
;361:	if ( key == '/' ) {
;362:		Menu_SetCursorToItem( (menuframework_s *)&s_demos, &s_demos.filter );
;363:		s_demos.filter.field.skipKey = qtrue;
;364:		return menu_null_sound;
;365:	}
;366:*/
;367:	return 0;
;368:
;369:}
;370:#endif
;371:
;372:/*
;373:=================
;374:UI_DemosMenu_Key
;375:=================
;376:*/
;377:static sfxHandle_t UI_DemosMenu_Key(int key) {
line 380
;378:	menucommon_s* item;
;379:
;380:	item = Menu_ItemAtCursor(&s_demos.menu);
ADDRGP4 s_demos
ARGP4
ADDRLP4 4
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 382
;381:
;382:	if (item == (menucommon_s*)&s_demos.list) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 s_demos+364
CVPU4 4
NEU4 $211
line 383
;383:		if (key == K_ENTER || key == K_KP_ENTER) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 13
EQI4 $216
ADDRLP4 8
INDIRI4
CNSTI4 169
NEI4 $214
LABELV $216
line 384
;384:			UI_DemoClick();
ADDRGP4 UI_DemoClick
CALLV
pop
line 385
;385:			return menu_in_sound;
ADDRGP4 menu_in_sound
INDIRI4
RETI4
ADDRGP4 $210
JUMPV
LABELV $214
line 387
;386:		}
;387:		if (key == K_BACKSPACE) {
ADDRFP4 0
INDIRI4
CNSTI4 127
NEI4 $217
line 388
;388:			if (UI_UpdateDirectory(NULL)) {
CNSTP4 0
ARGP4
ADDRLP4 12
ADDRGP4 UI_UpdateDirectory
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $219
line 389
;389:				UI_DemosReadDir();
ADDRGP4 UI_DemosReadDir
CALLV
pop
line 390
;390:				UI_DemosFillList();
ADDRGP4 UI_DemosFillList
CALLV
pop
line 391
;391:				UI_DemosRestorePosition();
ADDRGP4 UI_DemosRestorePosition
CALLV
pop
line 392
;392:			}
LABELV $219
line 393
;393:			return menu_in_sound;
ADDRGP4 menu_in_sound
INDIRI4
RETI4
ADDRGP4 $210
JUMPV
LABELV $217
line 395
;394:		}
;395:		if (key == '/') {
ADDRFP4 0
INDIRI4
CNSTI4 47
NEI4 $221
line 396
;396:			Menu_SetCursorToItem((menuframework_s*)&s_demos, &s_demos.filter);
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1108
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 397
;397:			s_demos.filter.field.skipKey = qtrue;
ADDRGP4 s_demos+1108+64+272
CNSTI4 1
ASGNI4
line 398
;398:			return menu_in_sound;
ADDRGP4 menu_in_sound
INDIRI4
RETI4
ADDRGP4 $210
JUMPV
LABELV $221
line 400
;399:		}
;400:	}
LABELV $211
line 402
;401:
;402:	return Menu_DefaultKey(&s_demos.menu, key);
ADDRGP4 s_demos
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $210
endproc UI_DemosMenu_Key 16 8
export UI_cstrdiff
proc UI_cstrdiff 8 0
line 406
;403:}
;404:
;405:// calculate length difference for color strings
;406:int UI_cstrdiff(char* str) {
line 408
;407:	int diff;
;408:	if (!str)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $228
line 409
;409:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $227
JUMPV
LABELV $228
line 410
;410:	diff = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $230
line 411
;411:	while (*str) {
line 412
;412:		if (*str == Q_COLOR_ESCAPE && str[1] && str[2]) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $233
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $233
ADDRLP4 4
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $233
line 413
;413:			diff += 2;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 414
;414:			str += 2;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 415
;415:		} else
ADDRGP4 $234
JUMPV
LABELV $233
line 416
;416:			str++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $234
line 417
;417:	}
LABELV $231
line 411
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $230
line 418
;418:	return diff;
ADDRLP4 0
INDIRI4
RETI4
LABELV $227
endproc UI_cstrdiff 8 0
export UI_cstricmp
proc UI_cstricmp 32 0
line 421
;419:}
;420:
;421:int UI_cstricmp(const char* src, const char* dst) {
line 422
;422:	int           ret = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 423
;423:	int           c1 = 0, c2 = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $236
line 425
;424:	unsigned char ch1, ch2;
;425:	do {
line 426
;426:		if (*src == '^' && src[1]) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $239
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $239
line 427
;427:			c1 = src[1];
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
line 428
;428:			src += 2;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 429
;429:			continue;
ADDRGP4 $237
JUMPV
LABELV $239
line 432
;430:		}
;431:
;432:		if (*dst == '^' && dst[1]) {
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $241
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $241
line 433
;433:			c2 = dst[1];
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
ASGNI4
line 434
;434:			dst += 2;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 435
;435:			continue;
ADDRGP4 $237
JUMPV
LABELV $241
line 438
;436:		}
;437:
;438:		ch1 = *src;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
line 439
;439:		ch2 = *dst;
ADDRLP4 1
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
line 441
;440:
;441:		if (ch1 >= 'a' && ch1 <= 'z')
ADDRLP4 24
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 97
LTI4 $243
ADDRLP4 24
INDIRI4
CNSTI4 122
GTI4 $243
line 442
;442:			ch1 = ch1 - 'a' + 'A';
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 97
SUBI4
CNSTI4 65
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
LABELV $243
line 443
;443:		if (ch2 >= 'a' && ch2 <= 'z')
ADDRLP4 28
ADDRLP4 1
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 97
LTI4 $245
ADDRLP4 28
INDIRI4
CNSTI4 122
GTI4 $245
line 444
;444:			ch2 = ch2 - 'a' + 'A';
ADDRLP4 1
ADDRLP4 1
INDIRU1
CVUI4 1
CNSTI4 97
SUBI4
CNSTI4 65
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
LABELV $245
line 446
;445:
;446:		ret = ch1 - ch2;
ADDRLP4 4
ADDRLP4 0
INDIRU1
CVUI4 1
ADDRLP4 1
INDIRU1
CVUI4 1
SUBI4
ASGNI4
line 447
;447:		if (!ret)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $247
line 448
;448:			ret = c1 - c2;
ADDRLP4 4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
LABELV $247
line 450
;449:
;450:		dst++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 451
;451:		if (ret || !*dst)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $251
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $249
LABELV $251
line 452
;452:			break;
ADDRGP4 $238
JUMPV
LABELV $249
line 454
;453:
;454:		src++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 456
;455:
;456:	} while (1);
LABELV $237
ADDRGP4 $236
JUMPV
LABELV $238
line 458
;457:
;458:	if (ret < 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $252
line 459
;459:		ret = -1;
ADDRLP4 4
CNSTI4 -1
ASGNI4
ADDRGP4 $253
JUMPV
LABELV $252
line 460
;460:	else if (ret > 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $254
line 461
;461:		ret = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $254
LABELV $253
line 463
;462:
;463:	return (ret);
ADDRLP4 4
INDIRI4
RETI4
LABELV $235
endproc UI_cstricmp 32 0
proc compare_entries 12 8
line 466
;464:}
;465:
;466:static int compare_entries(demo_entry_t* a, demo_entry_t* b, int mode) {
line 468
;467:	int t;
;468:	t = b->file_type - a->file_type;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI1
CVII4 1
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI1
CVII4 1
SUBI4
ASGNI4
line 469
;469:	if (!t)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $257
line 470
;470:		if (mode == 1)
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $259
line 471
;471:			return UI_cstricmp(a->file_name, b->file_name);
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 UI_cstricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $256
JUMPV
LABELV $259
line 473
;472:		else
;473:			return -UI_cstricmp(a->file_name, b->file_name);
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 UI_cstricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
NEGI4
RETI4
ADDRGP4 $256
JUMPV
LABELV $257
line 476
;474:
;475:	else
;476:		return t;
ADDRLP4 0
INDIRI4
RETI4
LABELV $256
endproc compare_entries 12 8
proc UI_demosort 28 12
line 479
;477:}
;478:
;479:static void UI_demosort(demo_entry_t** a, int n, int mode) {
line 481
;480:	demo_entry_t* tmp;
;481:	int           i = 0, j = n;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
line 482
;482:	demo_entry_t* m = a[n >> 1];
ADDRLP4 8
ADDRFP4 4
INDIRI4
CNSTI4 1
RSHI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 483
;483:	do {
ADDRGP4 $266
JUMPV
LABELV $265
line 485
;484:		while (compare_entries(a[i], m, mode) < 0)
;485:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $266
line 484
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 compare_entries
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $265
ADDRGP4 $269
JUMPV
LABELV $268
line 487
;486:		while (compare_entries(a[j], m, mode) > 0)
;487:			j--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $269
line 486
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 compare_entries
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
GTI4 $268
line 489
;488:
;489:		if (i <= j) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GTI4 $271
line 490
;490:			tmp  = a[i];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 491
;491:			a[i] = a[j];
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
ADDP4
INDIRP4
ASGNP4
line 492
;492:			a[j] = tmp;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ADDRLP4 12
INDIRP4
ASGNP4
line 493
;493:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 494
;494:			j--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 495
;495:		}
LABELV $271
line 496
;496:	} while (i <= j);
LABELV $263
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LEI4 $266
line 497
;497:	if (j > 0)
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $273
line 498
;498:		UI_demosort(a, j, mode);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_demosort
CALLV
pop
LABELV $273
line 499
;499:	if (n > i)
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $275
line 500
;500:		UI_demosort(a + i, n - i, mode);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 UI_demosort
CALLV
pop
LABELV $275
line 501
;501:}
LABELV $261
endproc UI_demosort 28 12
proc UI_DemosFillList 288 12
line 503
;502:
;503:static void UI_DemosFillList(void) {
line 509
;504:
;505:	int           i, diff, sort, len;
;506:	char          matchname[256];
;507:	demo_entry_t* d;
;508:
;509:	if (!s_demos.numDemos)
ADDRGP4 s_demos+1448
INDIRI4
CNSTI4 0
NEI4 $278
line 510
;510:		return;
ADDRGP4 $277
JUMPV
LABELV $278
line 512
;511:
;512:	sort = s_demos.sort.curvalue;
ADDRLP4 272
ADDRGP4 s_demos+472+68
INDIRI4
ASGNI4
line 514
;513:
;514:	s_demos.list.numitems = 0;
ADDRGP4 s_demos+364+72
CNSTI4 0
ASGNI4
line 516
;515:
;516:	for (i = 0; i < s_demos.numDemos; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $288
JUMPV
LABELV $285
line 517
;517:		len = dentry[i].file_nlen;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry+4
ADDP4
INDIRI4
ASGNI4
line 519
;518:
;519:		if (s_demos.namefilter[0] && strcmp(dentry[i].file_name, "..")) {
ADDRGP4 s_demos+5552
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $291
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry
ADDP4
INDIRP4
ARGP4
ADDRGP4 $120
ARGP4
ADDRLP4 276
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 276
INDIRI4
CNSTI4 0
EQI4 $291
line 520
;520:			strcpy(matchname, dentry[i].file_name);
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry
ADDP4
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 523
;521:
;522:			// strip extension
;523:			if (!Q_stricmp(matchname + len - 6, ".dm_68"))
ADDRLP4 4
INDIRI4
ADDRLP4 16-6
ADDP4
ARGP4
ADDRGP4 $297
ARGP4
ADDRLP4 280
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $294
line 524
;524:				matchname[len - 6] = '\0';
ADDRLP4 4
INDIRI4
ADDRLP4 16-6
ADDP4
CNSTI1 0
ASGNI1
LABELV $294
line 526
;525:
;526:			BG_StripColor(matchname);
ADDRLP4 16
ARGP4
ADDRGP4 BG_StripColor
CALLP4
pop
line 527
;527:			if (!Q_stristr(matchname, s_demos.namefilter)) {
ADDRLP4 16
ARGP4
ADDRGP4 s_demos+5552
ARGP4
ADDRLP4 284
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRLP4 284
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $299
line 528
;528:				continue;
ADDRGP4 $286
JUMPV
LABELV $299
line 530
;529:			}
;530:		}
LABELV $291
line 531
;531:		dptr[s_demos.list.numitems++] = &dentry[i];
ADDRLP4 284
ADDRGP4 s_demos+364+72
ASGNP4
ADDRLP4 280
ADDRLP4 284
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 284
INDIRP4
ADDRLP4 280
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dptr
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 dentry
ADDP4
ASGNP4
line 532
;532:		if (s_demos.list.numitems >= UI_MAX_DEMOS)
ADDRGP4 s_demos+364+72
INDIRI4
CNSTI4 1024
LTI4 $304
line 533
;533:			break;
ADDRGP4 $287
JUMPV
LABELV $304
line 534
;534:	}
LABELV $286
line 516
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $288
ADDRLP4 0
INDIRI4
ADDRGP4 s_demos+1448
INDIRI4
LTI4 $285
LABELV $287
line 536
;535:
;536:	if (sort && s_demos.list.numitems > 1)
ADDRLP4 272
INDIRI4
CNSTI4 0
EQI4 $308
ADDRGP4 s_demos+364+72
INDIRI4
CNSTI4 1
LEI4 $308
line 537
;537:		UI_demosort(dptr, s_demos.list.numitems - 1, sort);
ADDRGP4 dptr
ARGP4
ADDRGP4 s_demos+364+72
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRLP4 272
INDIRI4
ARGI4
ADDRGP4 UI_demosort
CALLV
pop
LABELV $308
line 539
;538:
;539:	for (i = 0; i < s_demos.list.numitems; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $317
JUMPV
LABELV $314
line 540
;540:		d                         = dptr[i];
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 dptr
ADDP4
INDIRP4
ASGNP4
line 541
;541:		s_demos.list.itemnames[i] = show_names[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_demos+364+88
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ASGNP4
line 543
;542:
;543:		Q_strncpyz(show_names[i], d->file_name, sizeof(show_names[i]));
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
INDIRP4
ARGP4
CNSTI4 192
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 544
;544:		if (d->file_type > 0) {
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
LEI4 $322
line 545
;545:			Q_strcat(show_names[i], sizeof(show_names[0]), "^7/");
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ARGP4
CNSTI4 192
ARGI4
ADDRGP4 $324
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 546
;546:		}
LABELV $322
line 548
;547:
;548:		len = d->file_nlen;
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 550
;549:		// strip extension
;550:		if (!Q_stricmp(show_names[i] + len - 6, ".dm_68")) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ADDP4
CNSTI4 -6
ADDP4
ARGP4
ADDRGP4 $297
ARGP4
ADDRLP4 280
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
NEI4 $325
line 551
;551:			memset(show_names[i] + len - 6, ' ', 6);
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ADDP4
CNSTI4 -6
ADDP4
ARGP4
CNSTI4 32
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 memset
CALLP4
pop
line 552
;552:			len -= 6;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 6
SUBI4
ASGNI4
line 553
;553:		}
LABELV $325
line 555
;554:
;555:		diff = UI_cstrdiff(show_names[i]);
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ARGP4
ADDRLP4 284
ADDRGP4 UI_cstrdiff
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 284
INDIRI4
ASGNI4
line 557
;556:
;557:		show_names[i][s_demos.list.width - 1 + diff] = '\0';
ADDRGP4 s_demos+364+92
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 561
;558:
;559:		// Q_strupr( show_names[i] );
;560:
;561:		if (len - diff > s_demos.list.width - 1) {
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ADDRGP4 s_demos+364+92
INDIRI4
CNSTI4 1
SUBI4
LEI4 $329
line 562
;562:			strcpy(&show_names[i][s_demos.list.width - 1 + diff], "^7>");
ADDRGP4 s_demos+364+92
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRLP4 0
INDIRI4
CNSTI4 192
MULI4
ADDRGP4 show_names
ADDP4
ADDP4
ARGP4
ADDRGP4 $335
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 563
;563:		}
LABELV $329
line 564
;564:	}
LABELV $315
line 539
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $317
ADDRLP4 0
INDIRI4
ADDRGP4 s_demos+364+72
INDIRI4
LTI4 $314
line 566
;565:
;566:	s_demos.list.curvalue = 0;
ADDRGP4 s_demos+364+68
CNSTI4 0
ASGNI4
line 567
;567:	s_demos.list.top      = 0;
ADDRGP4 s_demos+364+76
CNSTI4 0
ASGNI4
line 569
;568:
;569:	if (!s_demos.list.numitems) {
ADDRGP4 s_demos+364+72
INDIRI4
CNSTI4 0
NEI4 $340
line 570
;570:		s_demos.list.itemnames[i] = show_names[0];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 s_demos+364+88
INDIRP4
ADDP4
ADDRGP4 show_names
ASGNP4
line 571
;571:		strcpy(show_names[0], "No files matching your request.");
ADDRGP4 show_names
ARGP4
ADDRGP4 $346
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 572
;572:		s_demos.list.numitems = 1;
ADDRGP4 s_demos+364+72
CNSTI4 1
ASGNI4
line 573
;573:		s_demos.list.curvalue = 1;  // will remove selection
ADDRGP4 s_demos+364+68
CNSTI4 1
ASGNI4
line 574
;574:		s_demos.canPlay       = qfalse;
ADDRGP4 s_demos+1452
CNSTI4 0
ASGNI4
line 576
;575:		// degenerate case, not selectable
;576:		s_demos.list.generic.flags = QMF_INACTIVE;
ADDRGP4 s_demos+364+44
CNSTU4 16384
ASGNU4
line 577
;577:		s_demos.go.generic.flags   = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS | QMF_INACTIVE;
ADDRGP4 s_demos+948+44
CNSTU4 16656
ASGNU4
line 578
;578:	} else {
ADDRGP4 $341
JUMPV
LABELV $340
line 579
;579:		s_demos.canPlay            = qtrue;
ADDRGP4 s_demos+1452
CNSTI4 1
ASGNI4
line 580
;580:		s_demos.list.generic.flags = QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+364+44
CNSTU4 256
ASGNU4
line 581
;581:		s_demos.go.generic.flags   = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+948+44
CNSTU4 272
ASGNU4
line 582
;582:	}
LABELV $341
line 584
;583:
;584:	if (s_demos.list.numitems > 1) {
ADDRGP4 s_demos+364+72
INDIRI4
CNSTI4 1
LEI4 $361
line 585
;585:		s_demos.up.generic.flags   = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS | QMF_MOUSEONLY;
ADDRGP4 s_demos+672+44
CNSTU4 2308
ASGNU4
line 586
;586:		s_demos.down.generic.flags = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS | QMF_MOUSEONLY;
ADDRGP4 s_demos+764+44
CNSTU4 2308
ASGNU4
line 587
;587:	} else {
ADDRGP4 $362
JUMPV
LABELV $361
line 588
;588:		s_demos.up.generic.flags   = QMF_INACTIVE;
ADDRGP4 s_demos+672+44
CNSTU4 16384
ASGNU4
line 589
;589:		s_demos.down.generic.flags = QMF_INACTIVE;
ADDRGP4 s_demos+764+44
CNSTU4 16384
ASGNU4
line 590
;590:	}
LABELV $362
line 591
;591:}
LABELV $277
endproc UI_DemosFillList 288 12
proc Demos_MenuInit 12 12
line 598
;592:
;593:/*
;594:===============
;595:Demos_MenuInit
;596:===============
;597:*/
;598:static void Demos_MenuInit(void) {
line 600
;599:
;600:	memset(&s_demos, 0, sizeof(demos_t));
ADDRGP4 s_demos
ARGP4
CNSTI4 0
ARGI4
CNSTI4 5808
ARGI4
ADDRGP4 memset
CALLP4
pop
line 601
;601:	s_demos.menu.key = UI_DemosMenu_Key;
ADDRGP4 s_demos+272
ADDRGP4 UI_DemosMenu_Key
ASGNP4
line 603
;602:
;603:	Demos_Cache();
ADDRGP4 Demos_Cache
CALLV
pop
line 605
;604:
;605:	s_demos.menu.fullscreen = qtrue;
ADDRGP4 s_demos+280
CNSTI4 1
ASGNI4
line 606
;606:	s_demos.menu.wrapAround = qtrue;
ADDRGP4 s_demos+276
CNSTI4 1
ASGNI4
line 608
;607:
;608:	s_demos.banner.generic.type = MTYPE_TEXT;
ADDRGP4 s_demos+288
CNSTI4 7
ASGNI4
line 609
;609:	s_demos.banner.generic.x    = 320;
ADDRGP4 s_demos+288+12
CNSTI4 320
ASGNI4
line 610
;610:	s_demos.banner.generic.y    = 28;
ADDRGP4 s_demos+288+16
CNSTI4 28
ASGNI4
line 611
;611:	s_demos.banner.string       = dir;
ADDRGP4 s_demos+288+64
ADDRGP4 dir
ASGNP4
line 613
;612:	// s_demos.banner.color			= color_white;
;613:	s_demos.banner.color = text_color_normal;
ADDRGP4 s_demos+288+72
ADDRGP4 text_color_normal
ASGNP4
line 614
;614:	s_demos.banner.style = UI_CENTER;
ADDRGP4 s_demos+288+68
CNSTI4 1
ASGNI4
line 616
;615:
;616:	s_demos.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_demos+580
CNSTI4 6
ASGNI4
line 617
;617:	s_demos.arrows.generic.name  = ART_ARROWS_VERT;
ADDRGP4 s_demos+580+4
ADDRGP4 $391
ASGNP4
line 618
;618:	s_demos.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 s_demos+580+44
CNSTU4 16384
ASGNU4
line 619
;619:	s_demos.arrows.generic.x     = ARROWS_LEFT;
ADDRGP4 s_demos+580+12
CNSTI4 576
ASGNI4
line 620
;620:	s_demos.arrows.generic.y     = ARROWS_TOP - ARROWS_HEIGHT / 2;
ADDRGP4 s_demos+580+16
CNSTI4 180
ASGNI4
line 621
;621:	s_demos.arrows.width         = ARROWS_WIDTH;
ADDRGP4 s_demos+580+80
CNSTI4 48
ASGNI4
line 622
;622:	s_demos.arrows.height        = ARROWS_HEIGHT;
ADDRGP4 s_demos+580+84
CNSTI4 128
ASGNI4
line 624
;623:
;624:	s_demos.up.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_demos+672
CNSTI4 6
ASGNI4
line 625
;625:	s_demos.up.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS | QMF_MOUSEONLY;
ADDRGP4 s_demos+672+44
CNSTU4 2308
ASGNU4
line 626
;626:	s_demos.up.generic.x        = ARROWS_LEFT;
ADDRGP4 s_demos+672+12
CNSTI4 576
ASGNI4
line 627
;627:	s_demos.up.generic.y        = ARROWS_TOP - ARROWS_HEIGHT / 2;
ADDRGP4 s_demos+672+16
CNSTI4 180
ASGNI4
line 628
;628:	s_demos.up.generic.id       = ID_UP;
ADDRGP4 s_demos+672+8
CNSTI4 13
ASGNI4
line 629
;629:	s_demos.up.generic.callback = Demos_MenuEvent;
ADDRGP4 s_demos+672+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 630
;630:	s_demos.up.width            = ARROWS_WIDTH;
ADDRGP4 s_demos+672+80
CNSTI4 48
ASGNI4
line 631
;631:	s_demos.up.height           = ARROWS_HEIGHT / 2;
ADDRGP4 s_demos+672+84
CNSTI4 64
ASGNI4
line 632
;632:	s_demos.up.focuspic         = ART_ARROWS_UP;
ADDRGP4 s_demos+672+64
ADDRGP4 $419
ASGNP4
line 634
;633:
;634:	s_demos.down.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_demos+764
CNSTI4 6
ASGNI4
line 635
;635:	s_demos.down.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS | QMF_MOUSEONLY;
ADDRGP4 s_demos+764+44
CNSTU4 2308
ASGNU4
line 636
;636:	s_demos.down.generic.x        = ARROWS_LEFT;
ADDRGP4 s_demos+764+12
CNSTI4 576
ASGNI4
line 637
;637:	s_demos.down.generic.y        = ARROWS_TOP;
ADDRGP4 s_demos+764+16
CNSTI4 244
ASGNI4
line 638
;638:	s_demos.down.generic.id       = ID_DOWN;
ADDRGP4 s_demos+764+8
CNSTI4 14
ASGNI4
line 639
;639:	s_demos.down.generic.callback = Demos_MenuEvent;
ADDRGP4 s_demos+764+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 640
;640:	s_demos.down.width            = ARROWS_WIDTH;
ADDRGP4 s_demos+764+80
CNSTI4 48
ASGNI4
line 641
;641:	s_demos.down.height           = ARROWS_HEIGHT / 2;
ADDRGP4 s_demos+764+84
CNSTI4 64
ASGNI4
line 642
;642:	s_demos.down.focuspic         = ART_ARROWS_DOWN;
ADDRGP4 s_demos+764+64
ADDRGP4 $437
ASGNP4
line 644
;643:
;644:	s_demos.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_demos+856
CNSTI4 6
ASGNI4
line 645
;645:	s_demos.back.generic.name     = ART_BACK0;
ADDRGP4 s_demos+856+4
ADDRGP4 $441
ASGNP4
line 646
;646:	s_demos.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+856+44
CNSTU4 260
ASGNU4
line 647
;647:	s_demos.back.generic.id       = ID_BACK;
ADDRGP4 s_demos+856+8
CNSTI4 10
ASGNI4
line 648
;648:	s_demos.back.generic.callback = Demos_MenuEvent;
ADDRGP4 s_demos+856+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 649
;649:	s_demos.back.generic.x        = 0;
ADDRGP4 s_demos+856+12
CNSTI4 0
ASGNI4
line 650
;650:	s_demos.back.generic.y        = 480 - 64;
ADDRGP4 s_demos+856+16
CNSTI4 416
ASGNI4
line 651
;651:	s_demos.back.width            = 128;
ADDRGP4 s_demos+856+80
CNSTI4 128
ASGNI4
line 652
;652:	s_demos.back.height           = 64;
ADDRGP4 s_demos+856+84
CNSTI4 64
ASGNI4
line 653
;653:	s_demos.back.focuspic         = ART_BACK1;
ADDRGP4 s_demos+856+64
ADDRGP4 $458
ASGNP4
line 655
;654:
;655:	s_demos.go.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_demos+948
CNSTI4 6
ASGNI4
line 656
;656:	s_demos.go.generic.name     = ART_GO0;
ADDRGP4 s_demos+948+4
ADDRGP4 $462
ASGNP4
line 657
;657:	s_demos.go.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+948+44
CNSTU4 272
ASGNU4
line 658
;658:	s_demos.go.generic.id       = ID_GO;
ADDRGP4 s_demos+948+8
CNSTI4 11
ASGNI4
line 659
;659:	s_demos.go.generic.callback = Demos_MenuEvent;
ADDRGP4 s_demos+948+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 660
;660:	s_demos.go.generic.x        = 640;
ADDRGP4 s_demos+948+12
CNSTI4 640
ASGNI4
line 661
;661:	s_demos.go.generic.y        = 480 - 64;
ADDRGP4 s_demos+948+16
CNSTI4 416
ASGNI4
line 662
;662:	s_demos.go.width            = 128;
ADDRGP4 s_demos+948+80
CNSTI4 128
ASGNI4
line 663
;663:	s_demos.go.height           = 64;
ADDRGP4 s_demos+948+84
CNSTI4 64
ASGNI4
line 664
;664:	s_demos.go.focuspic         = ART_GO1;
ADDRGP4 s_demos+948+64
ADDRGP4 $479
ASGNP4
line 666
;665:
;666:	s_demos.timedemo.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 s_demos+1040
CNSTI4 5
ASGNI4
line 667
;667:	s_demos.timedemo.generic.name     = "Time Demo:";
ADDRGP4 s_demos+1040+4
ADDRGP4 $483
ASGNP4
line 668
;668:	s_demos.timedemo.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_demos+1040+44
CNSTU4 258
ASGNU4
line 669
;669:	s_demos.timedemo.generic.callback = Demos_MenuEvent;
ADDRGP4 s_demos+1040+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 670
;670:	s_demos.timedemo.generic.id       = ID_TIMEDEMO;
ADDRGP4 s_demos+1040+8
CNSTI4 15
ASGNI4
line 671
;671:	s_demos.timedemo.generic.x        = 320 + 24 - 4;
ADDRGP4 s_demos+1040+12
CNSTI4 340
ASGNI4
line 672
;672:	s_demos.timedemo.generic.y        = 480 - 42;
ADDRGP4 s_demos+1040+16
CNSTI4 438
ASGNI4
line 674
;673:
;674:	if ((int)trap_Cvar_VariableValue("timedemo"))
ADDRGP4 $199
ARGP4
ADDRLP4 0
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
INDIRF4
CVFI4 4
CNSTI4 0
EQI4 $494
line 675
;675:		s_demos.timedemo.curvalue = qtrue;
ADDRGP4 s_demos+1040+64
CNSTI4 1
ASGNI4
ADDRGP4 $495
JUMPV
LABELV $494
line 677
;676:	else
;677:		s_demos.timedemo.curvalue = qfalse;
ADDRGP4 s_demos+1040+64
CNSTI4 0
ASGNI4
LABELV $495
line 679
;678:
;679:	s_demos.sort.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 s_demos+472
CNSTI4 3
ASGNI4
line 680
;680:	s_demos.sort.generic.name     = "Sort:";
ADDRGP4 s_demos+472+4
ADDRGP4 $503
ASGNP4
line 681
;681:	s_demos.sort.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_demos+472+44
CNSTU4 258
ASGNU4
line 682
;682:	s_demos.sort.generic.callback = Demos_MenuEvent;
ADDRGP4 s_demos+472+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 683
;683:	s_demos.sort.generic.id       = ID_SORT;
ADDRGP4 s_demos+472+8
CNSTI4 16
ASGNI4
line 686
;684:	// s_demos.sort.generic.x			= 332;
;685:	// s_demos.sort.generic.y			= 406;
;686:	s_demos.sort.generic.x = 485;
ADDRGP4 s_demos+472+12
CNSTI4 485
ASGNI4
line 687
;687:	s_demos.sort.generic.y = 72;
ADDRGP4 s_demos+472+16
CNSTI4 72
ASGNI4
line 688
;688:	s_demos.sort.itemnames = sorttype;
ADDRGP4 s_demos+472+88
ADDRGP4 sorttype
ASGNP4
line 689
;689:	s_demos.sort.curvalue  = (int)trap_Cvar_VariableValue("ui_demoSort");
ADDRGP4 $203
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 s_demos+472+68
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 691
;690:
;691:	if (s_demos.sort.curvalue < 0 || s_demos.sort.curvalue > 2)
ADDRGP4 s_demos+472+68
INDIRI4
CNSTI4 0
LTI4 $524
ADDRGP4 s_demos+472+68
INDIRI4
CNSTI4 2
LEI4 $518
LABELV $524
line 692
;692:		s_demos.sort.curvalue = 0;
ADDRGP4 s_demos+472+68
CNSTI4 0
ASGNI4
LABELV $518
line 694
;693:
;694:	s_demos.filter.generic.type       = MTYPE_FIELD;
ADDRGP4 s_demos+1108
CNSTI4 4
ASGNI4
line 695
;695:	s_demos.filter.generic.flags      = QMF_NODEFAULTINIT;
ADDRGP4 s_demos+1108+44
CNSTU4 32768
ASGNU4
line 696
;696:	s_demos.filter.generic.ownerdraw  = Demos_DrawFilter;
ADDRGP4 s_demos+1108+56
ADDRGP4 Demos_DrawFilter
ASGNP4
line 697
;697:	s_demos.filter.generic.id         = ID_FILTER;
ADDRGP4 s_demos+1108+8
CNSTI4 17
ASGNI4
line 698
;698:	s_demos.filter.field.widthInChars = 37;
ADDRGP4 s_demos+1108+64+8
CNSTI4 37
ASGNI4
line 699
;699:	s_demos.filter.field.maxchars     = 37;
ADDRGP4 s_demos+1108+64+268
CNSTI4 37
ASGNI4
line 700
;700:	s_demos.filter.generic.x          = 62;
ADDRGP4 s_demos+1108+12
CNSTI4 62
ASGNI4
line 701
;701:	s_demos.filter.generic.y          = 72;
ADDRGP4 s_demos+1108+16
CNSTI4 72
ASGNI4
line 702
;702:	s_demos.filter.generic.left       = 62;
ADDRGP4 s_demos+1108+20
CNSTI4 62
ASGNI4
line 704
;703:	// s_demos.filter.generic.right		= 640 - 64;
;704:	s_demos.filter.generic.right  = 430;
ADDRGP4 s_demos+1108+28
CNSTI4 430
ASGNI4
line 705
;705:	s_demos.filter.generic.top    = 66;
ADDRGP4 s_demos+1108+24
CNSTI4 66
ASGNI4
line 706
;706:	s_demos.filter.generic.bottom = 94;
ADDRGP4 s_demos+1108+32
CNSTI4 94
ASGNI4
line 708
;707:
;708:	s_demos.list.generic.type     = MTYPE_SCROLLLIST;
ADDRGP4 s_demos+364
CNSTI4 8
ASGNI4
line 709
;709:	s_demos.list.generic.flags    = QMF_PULSEIFFOCUS;
ADDRGP4 s_demos+364+44
CNSTU4 256
ASGNU4
line 710
;710:	s_demos.list.generic.callback = Demos_MenuEvent;
ADDRGP4 s_demos+364+48
ADDRGP4 Demos_MenuEvent
ASGNP4
line 711
;711:	s_demos.list.generic.id       = ID_LIST;
ADDRGP4 s_demos+364+8
CNSTI4 12
ASGNI4
line 712
;712:	s_demos.list.generic.x        = (640 - UI_DEMO_LENGTH * SMALLCHAR_WIDTH) / 2;
ADDRGP4 s_demos+364+12
CNSTI4 64
ASGNI4
line 713
;713:	s_demos.list.generic.y        = (480 - UI_MAX_ITEMS * SMALLCHAR_HEIGHT) / 2;
ADDRGP4 s_demos+364+16
CNSTI4 96
ASGNI4
line 714
;714:	s_demos.list.width            = UI_DEMO_LENGTH;
ADDRGP4 s_demos+364+92
CNSTI4 64
ASGNI4
line 715
;715:	s_demos.list.height           = UI_MAX_ITEMS;
ADDRGP4 s_demos+364+96
CNSTI4 18
ASGNI4
line 716
;716:	s_demos.list.columns          = 1;
ADDRGP4 s_demos+364+100
CNSTI4 1
ASGNI4
line 717
;717:	s_demos.list.scroll           = s_demos.list.height - 1;
ADDRGP4 s_demos+364+80
ADDRGP4 s_demos+364+96
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 718
;718:	s_demos.list.generic.dblclick = UI_DemosDblclick;
ADDRGP4 s_demos+364+60
ADDRGP4 UI_DemosDblclick
ASGNP4
line 720
;719:
;720:	s_demos.list.itemnames = (const char**)s_demos.itemname;
ADDRGP4 s_demos+364+88
ADDRGP4 s_demos+1456
ASGNP4
line 722
;721:
;722:	UI_DemosReadDir();
ADDRGP4 UI_DemosReadDir
CALLV
pop
line 724
;723:
;724:	if (!s_demos.numDemos && dirlevel == 0) {
ADDRGP4 s_demos+1448
INDIRI4
CNSTI4 0
NEI4 $578
ADDRGP4 dirlevel
INDIRI4
CNSTI4 0
NEI4 $578
line 725
;725:		strcpy(buffer, "No Demos Found.");
ADDRGP4 buffer
ARGP4
ADDRGP4 $581
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 726
;726:		s_demos.list.numitems = 1;
ADDRGP4 s_demos+364+72
CNSTI4 1
ASGNI4
line 729
;727:
;728:		// degenerate case, not selectable
;729:		s_demos.go.generic.flags |= (QMF_INACTIVE | QMF_HIDDEN);
ADDRLP4 8
ADDRGP4 s_demos+948+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 730
;730:		s_demos.up.generic.flags   = QMF_INACTIVE;
ADDRGP4 s_demos+672+44
CNSTU4 16384
ASGNU4
line 731
;731:		s_demos.down.generic.flags = QMF_INACTIVE;
ADDRGP4 s_demos+764+44
CNSTU4 16384
ASGNU4
line 732
;732:	} else {
ADDRGP4 $579
JUMPV
LABELV $578
line 733
;733:		UI_DemosFillList();
ADDRGP4 UI_DemosFillList
CALLV
pop
line 734
;734:	}
LABELV $579
line 736
;735:
;736:	Menu_AddItem(&s_demos.menu, &s_demos.banner);
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 737
;737:	Menu_AddItem(&s_demos.menu, &s_demos.list);
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 738
;738:	Menu_AddItem(&s_demos.menu, &s_demos.arrows);
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+580
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 739
;739:	Menu_AddItem(&s_demos.menu, &s_demos.up);
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+672
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 740
;740:	Menu_AddItem(&s_demos.menu, &s_demos.down);
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+764
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 741
;741:	Menu_AddItem(&s_demos.menu, &s_demos.back);
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+856
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 742
;742:	Menu_AddItem(&s_demos.menu, &s_demos.go);
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+948
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 743
;743:	Menu_AddItem(&s_demos.menu, &s_demos.timedemo);
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1040
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 744
;744:	Menu_AddItem(&s_demos.menu, &s_demos.sort);
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+472
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 745
;745:	Menu_AddItem(&s_demos.menu, &s_demos.filter);
ADDRGP4 s_demos
ARGP4
ADDRGP4 s_demos+1108
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 746
;746:}
LABELV $373
endproc Demos_MenuInit 12 12
export Demos_Cache
proc Demos_Cache 0 4
line 753
;747:
;748:/*
;749:=================
;750:Demos_Cache
;751:=================
;752:*/
;753:void Demos_Cache(void) {
line 754
;754:	trap_R_RegisterShaderNoMip(ART_BACK0);
ADDRGP4 $441
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 755
;755:	trap_R_RegisterShaderNoMip(ART_BACK1);
ADDRGP4 $458
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 756
;756:	trap_R_RegisterShaderNoMip(ART_GO0);
ADDRGP4 $462
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 757
;757:	trap_R_RegisterShaderNoMip(ART_GO1);
ADDRGP4 $479
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 758
;758:	trap_R_RegisterShaderNoMip(ART_ARROWS_VERT);
ADDRGP4 $391
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 759
;759:	trap_R_RegisterShaderNoMip(ART_ARROWS_UP);
ADDRGP4 $419
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 760
;760:	trap_R_RegisterShaderNoMip(ART_ARROWS_DOWN);
ADDRGP4 $437
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 761
;761:}
LABELV $600
endproc Demos_Cache 0 4
export UI_DemosMenu
proc UI_DemosMenu 0 4
line 768
;762:
;763:/*
;764:===============
;765:UI_DemosMenu
;766:===============
;767:*/
;768:void UI_DemosMenu(void) {
line 769
;769:	Demos_MenuInit();
ADDRGP4 Demos_MenuInit
CALLV
pop
line 770
;770:	UI_PushMenu(&s_demos.menu);
ADDRGP4 s_demos
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 771
;771:}
LABELV $601
endproc UI_DemosMenu 0 4
bss
align 1
LABELV show_names
skip 196608
align 1
LABELV buffer
skip 65536
align 4
LABELV listpos
skip 512
align 4
LABELV num_files
skip 4
align 4
LABELV dptr
skip 4096
align 4
LABELV dentry
skip 12288
align 4
LABELV s_demos
skip 5808
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
LABELV $581
byte 1 78
byte 1 111
byte 1 32
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 115
byte 1 32
byte 1 70
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $503
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $483
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 32
byte 1 68
byte 1 101
byte 1 109
byte 1 111
byte 1 58
byte 1 0
align 1
LABELV $479
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $462
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $458
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
LABELV $441
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
LABELV $437
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
LABELV $419
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
LABELV $391
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
LABELV $346
byte 1 78
byte 1 111
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 113
byte 1 117
byte 1 101
byte 1 115
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $335
byte 1 94
byte 1 55
byte 1 62
byte 1 0
align 1
LABELV $324
byte 1 94
byte 1 55
byte 1 47
byte 1 0
align 1
LABELV $297
byte 1 46
byte 1 100
byte 1 109
byte 1 95
byte 1 54
byte 1 56
byte 1 0
align 1
LABELV $204
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $203
byte 1 117
byte 1 105
byte 1 95
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $201
byte 1 48
byte 1 0
align 1
LABELV $200
byte 1 49
byte 1 0
align 1
LABELV $199
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $181
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $180
byte 1 100
byte 1 101
byte 1 109
byte 1 111
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 34
byte 1 10
byte 1 0
align 1
LABELV $136
byte 1 112
byte 1 114
byte 1 111
byte 1 116
byte 1 111
byte 1 99
byte 1 111
byte 1 108
byte 1 0
align 1
LABELV $135
byte 1 100
byte 1 109
byte 1 95
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $132
byte 1 100
byte 1 109
byte 1 95
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $120
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $111
byte 1 47
byte 1 0
align 1
LABELV $79
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 58
byte 1 0
align 1
LABELV $72
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 99
byte 1 0
align 1
LABELV $71
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 44
byte 1 32
byte 1 97
byte 1 115
byte 1 99
byte 1 0
align 1
LABELV $70
byte 1 78
byte 1 111
byte 1 0
