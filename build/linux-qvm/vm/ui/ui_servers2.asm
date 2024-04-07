data
align 4
LABELV master_items
address $68
address $69
address $70
byte 4 0
align 4
LABELV servertype_items
address $71
address $72
address $73
address $74
address $75
byte 4 0
align 4
LABELV sortkey_items
address $76
address $77
address $78
address $79
address $80
byte 4 0
align 4
LABELV netnames
address $81
address $82
address $83
byte 4 0
lit
align 1
LABELV quake3worldMessage
byte 1 86
byte 1 105
byte 1 115
byte 1 105
byte 1 116
byte 1 32
byte 1 119
byte 1 119
byte 1 119
byte 1 46
byte 1 113
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 51
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 46
byte 1 99
byte 1 111
byte 1 109
byte 1 32
byte 1 45
byte 1 32
byte 1 78
byte 1 101
byte 1 119
byte 1 115
byte 1 44
byte 1 32
byte 1 67
byte 1 111
byte 1 109
byte 1 109
byte 1 117
byte 1 110
byte 1 105
byte 1 116
byte 1 121
byte 1 44
byte 1 32
byte 1 69
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 44
byte 1 32
byte 1 70
byte 1 105
byte 1 108
byte 1 101
byte 1 115
byte 1 0
data
export punkbuster_items
align 4
LABELV punkbuster_items
address $84
address $85
byte 4 0
export punkbuster_msg
align 4
LABELV punkbuster_msg
address $86
address $87
address $88
address $89
byte 4 0
code
proc ArenaServers_DrawFilter 56 20
file "../../../../code/q3_ui/ui_servers2.c"
line 185
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=======================================================================
;5:
;6:MULTIPLAYER MENU (SERVER BROWSER)
;7:
;8:=======================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:#include "../game/q_shared.h"
;13:
;14:#define REFRESH_DELAY      10     // in ms
;15:#define MAX_RESPONSE_TIME  10000  // in ms
;16:#define MAX_GLOBALSERVERS  MAX_GLOBAL_SERVERS
;17:#define MAX_PINGLISTSIZE   MAX_PINGREQUESTS * 8
;18:#define MAX_ADDRESSLENGTH  64
;19:#define MAX_HOSTNAMELENGTH 26
;20:#define MAX_MAPNAMELENGTH  11
;21:#define MAX_GAMENAMELENGTH 8
;22:#define MAX_LISTBOXITEMS   512
;23:#define MAX_LOCALSERVERS   512
;24:#define MAX_STATUSLENGTH   64
;25:
;26:#define MAX_LISTBOXWIDTH MAX_HOSTNAMELENGTH + 1 + MAX_MAPNAMELENGTH + 1 + 5 /*players/max*/ + 1 + MAX_GAMENAMELENGTH + 1 + 3 /*netname*/ + 1 + 3 /*ping*/
;27:
;28:#define MAX_LISTBOXWIDTH_BUF MAX_LISTBOXWIDTH + 2 /*color ping */ + 1 /*zero termination*/
;29:
;30:#define FILTER_CAPTION_CHARS 13
;31:
;32:#define ART_BACK0       "menu/art/back_0"
;33:#define ART_BACK1       "menu/art/back_1"
;34:#define ART_CREATE0     "menu/art/create_0"
;35:#define ART_CREATE1     "menu/art/create_1"
;36:#define ART_SPECIFY0    "menu/art/specify_0"
;37:#define ART_SPECIFY1    "menu/art/specify_1"
;38:#define ART_REFRESH0    "menu/art/refresh_0"
;39:#define ART_REFRESH1    "menu/art/refresh_1"
;40:#define ART_CONNECT0    "menu/art/fight_0"
;41:#define ART_CONNECT1    "menu/art/fight_1"
;42:#define ART_ARROWS0     "menu/art/arrows_vert_0"
;43:#define ART_ARROWS_UP   "menu/art/arrows_vert_top"
;44:#define ART_ARROWS_DOWN "menu/art/arrows_vert_bot"
;45:#define ART_UNKNOWNMAP  "menu/art/unknownmap"
;46:#define ART_REMOVE0     "menu/art/delete_0"
;47:#define ART_REMOVE1     "menu/art/delete_1"
;48:
;49:#define ID_MASTER      10
;50:#define ID_GAMETYPE    11
;51:#define ID_SORTKEY     12
;52:#define ID_SHOW_FULL   13
;53:#define ID_SHOW_EMPTY  14
;54:#define ID_LIST        15
;55:#define ID_SCROLL_UP   16
;56:#define ID_SCROLL_DOWN 17
;57:#define ID_BACK        18
;58:#define ID_REFRESH     19
;59:#define ID_SPECIFY     20
;60:#define ID_CREATE      21
;61:#define ID_CONNECT     22
;62:#define ID_REMOVE      23
;63:#define ID_FILTER      24
;64:
;65:#define GR_LOGO    30
;66:#define GR_LETTERS 31
;67:
;68:#define SORT_HOST    0
;69:#define SORT_MAP     1
;70:#define SORT_CLIENTS 2
;71:#define SORT_GAME    3
;72:#define SORT_PING    4
;73:
;74:#define GAMES_ALL      0
;75:#define GAMES_FFA      1
;76:#define GAMES_TOURNEY  2
;77:#define GAMES_TEAMPLAY 3
;78:#define GAMES_CTF      4
;79:
;80:static const char* master_items[] = {"Local", "Internet", "Favorites", NULL};
;81:
;82:static const char* servertype_items[] = {"All", "Defrag Run", "Tournament", "Team Deathmatch", "Capture the Flag", NULL};
;83:
;84:static const char* sortkey_items[] = {"Server Name", "Map Name", "Open Player Spots", "Game Type", "Ping Time", NULL};
;85:
;86:static char*       netnames[] = {"???", "UDP", "IPX", NULL};
;87:
;88:static char        quake3worldMessage[] = "Visit www.quake3world.com - News, Community, Events, Files";
;89:
;90:const char*        punkbuster_items[] = {"Disabled", "Enabled", NULL};
;91:
;92:const char*        punkbuster_msg[] = {"PunkBuster will be", "disabled the next time", "Quake III Arena", "is started.", NULL};
;93:
;94:typedef struct {
;95:	char adrstr[MAX_ADDRESSLENGTH];
;96:	int  start;
;97:} pinglist_t;
;98:
;99:typedef struct servernode_s {
;100:	char adrstr[MAX_ADDRESSLENGTH];
;101:	char hostname[MAX_HOSTNAMELENGTH + 1];
;102:	char mapname[MAX_MAPNAMELENGTH + 1];
;103:	int  numclients;
;104:	int  maxclients;
;105:	int  pingtime;
;106:	int  gametype;
;107:	char gamename[MAX_GAMENAMELENGTH + 1];
;108:	int  nettype;
;109:	int  minPing;
;110:	int  maxPing;
;111:} servernode_t;
;112:
;113:typedef struct {
;114:	char          buff[MAX_LISTBOXWIDTH_BUF];
;115:	servernode_t* servernode;
;116:} table_t;
;117:
;118:typedef struct {
;119:	menuframework_s   menu;
;120:
;121:	menutext_s        banner;
;122:
;123:	menulist_s        master;
;124:	menulist_s        gametype;
;125:	menulist_s        sortkey;
;126:	menuradiobutton_s showfull;
;127:	menuradiobutton_s showempty;
;128:
;129:	menulist_s        list;
;130:	menubitmap_s      mappic;
;131:	menubitmap_s      arrows;
;132:	menubitmap_s      up;
;133:	menubitmap_s      down;
;134:	menutext_s        status;
;135:	menutext_s        statusbar;
;136:
;137:	menubitmap_s      remove;
;138:	menubitmap_s      back;
;139:	menubitmap_s      refresh;
;140:	menubitmap_s      specify;
;141:	menubitmap_s      create;
;142:	menubitmap_s      go;
;143:
;144:	menufield_s       filter;
;145:
;146:	pinglist_t        pinglist[MAX_PINGLISTSIZE];
;147:	table_t           table[MAX_LISTBOXITEMS];
;148:	char*             items[MAX_LISTBOXITEMS];
;149:	int               numqueriedservers;
;150:	int*              numservers;
;151:	servernode_t*     serverlist;
;152:	int               currentping;
;153:	qboolean          refreshservers;
;154:	int               nextpingtime;
;155:	int               maxservers;
;156:	int               refreshtime;
;157:	char              favoriteaddresses[MAX_FAVORITESERVERS][MAX_ADDRESSLENGTH];
;158:	int               numfavoriteaddresses;
;159:
;160:	char              serverfilter[MAX_EDIT_LINE];
;161:} arenaservers_t;
;162:
;163:static arenaservers_t g_arenaservers;
;164:
;165:static servernode_t   g_globalserverlist[MAX_GLOBALSERVERS];
;166:static int            g_numglobalservers;
;167:static servernode_t   g_localserverlist[MAX_LOCALSERVERS];
;168:static int            g_numlocalservers;
;169:static servernode_t   g_favoriteserverlist[MAX_FAVORITESERVERS];
;170:static int            g_numfavoriteservers;
;171:static int            g_servertype;
;172:static int            g_gametype;
;173:static int            g_sortkey;
;174:static int            g_emptyservers;
;175:static int            g_fullservers;
;176:
;177:static void           ArenaServers_UpdateList(void);
;178:static void           ArenaServers_UpdatePicture(void);
;179:
;180:/*
;181:=================
;182:ArenaServers_DrawFilter
;183:=================
;184:*/
;185:static void ArenaServers_DrawFilter(void* self) {
line 194
;186:	menufield_s* f;
;187:	qboolean     focus;
;188:	int          style;
;189:	char*        txt;
;190:	char         c;
;191:	float*       color;
;192:	int          basex, x, y;
;193:
;194:	f     = (menufield_s*)self;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
line 195
;195:	basex = f->generic.x;
ADDRLP4 28
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 196
;196:	y     = f->generic.y;
ADDRLP4 20
ADDRLP4 24
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 197
;197:	focus = (f->generic.parent->cursor == f->generic.menuPosition);
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
NEI4 $95
ADDRLP4 36
CNSTI4 1
ASGNI4
ADDRGP4 $96
JUMPV
LABELV $95
ADDRLP4 36
CNSTI4 0
ASGNI4
LABELV $96
ADDRLP4 32
ADDRLP4 36
INDIRI4
ASGNI4
line 199
;198:
;199:	style = UI_LEFT | UI_SMALLFONT;
ADDRLP4 12
CNSTI4 16
ASGNI4
line 200
;200:	color = text_color_normal;
ADDRLP4 16
ADDRGP4 text_color_normal
ASGNP4
line 202
;201:
;202:	if (focus) {
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $97
line 203
;203:		style |= UI_PULSE;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 204
;204:		color = text_color_highlight;
ADDRLP4 16
ADDRGP4 text_color_highlight
ASGNP4
line 205
;205:	}
LABELV $97
line 207
;206:
;207:	UI_DrawString(basex, y, "Filter Name:", style, color);
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ARGI4
ADDRGP4 $99
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
line 209
;208:
;209:	basex += FILTER_CAPTION_CHARS * SMALLCHAR_WIDTH;
ADDRLP4 28
ADDRLP4 28
INDIRI4
CNSTI4 104
ADDI4
ASGNI4
line 211
;210:	// y += PROP_HEIGHT;
;211:	txt = f->field.buffer;
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
ASGNP4
line 212
;212:	x   = basex;
ADDRLP4 8
ADDRLP4 28
INDIRI4
ASGNI4
line 214
;213:
;214:	if (strcmp(g_arenaservers.serverfilter, f->field.buffer)) {
ADDRGP4 g_arenaservers+57676
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $100
line 215
;215:		strcpy(g_arenaservers.serverfilter, f->field.buffer);
ADDRGP4 g_arenaservers+57676
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 216
;216:		ArenaServers_UpdateList();
ADDRGP4 ArenaServers_UpdateList
CALLV
pop
line 217
;217:		ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 218
;218:	}
LABELV $100
line 221
;219:
;220:	// mark input by color depending from filter result
;221:	if (!g_arenaservers.list.numitems && f->field.buffer[0] && *g_arenaservers.numservers)
ADDRGP4 g_arenaservers+824+72
INDIRI4
CNSTI4 0
NEI4 $104
ADDRLP4 24
INDIRP4
CNSTI4 76
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $104
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $104
line 222
;222:		color = g_color_table[ColorIndex(COLOR_RED)];
ADDRLP4 16
ADDRGP4 g_color_table+16
ASGNP4
ADDRGP4 $112
JUMPV
LABELV $104
line 224
;223:	else
;224:		color = g_color_table[ColorIndex(COLOR_WHITE)];
ADDRLP4 16
ADDRGP4 g_color_table+112
ASGNP4
ADDRGP4 $112
JUMPV
LABELV $111
line 226
;225:
;226:	while ((c = *txt) != '\0') {
line 227
;227:		UI_DrawChar(x, y, c, style, color);
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
line 228
;228:		x += SMALLCHAR_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 229
;229:		txt++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 230
;230:	}
LABELV $112
line 226
ADDRLP4 48
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
ADDRLP4 4
ADDRLP4 48
INDIRI1
ASGNI1
ADDRLP4 48
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $111
line 233
;231:
;232:	// draw cursor if we have focus
;233:	if (focus) {
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $114
line 234
;234:		if (trap_Key_GetOverstrikeMode()) {
ADDRLP4 52
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $116
line 235
;235:			c = 11;
ADDRLP4 4
CNSTI1 11
ASGNI1
line 236
;236:		} else {
ADDRGP4 $117
JUMPV
LABELV $116
line 237
;237:			c = 10;
ADDRLP4 4
CNSTI1 10
ASGNI1
line 238
;238:		}
LABELV $117
line 240
;239:
;240:		style &= ~UI_PULSE;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 241
;241:		style |= UI_BLINK;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 243
;242:
;243:		UI_DrawChar(basex + f->field.cursor * SMALLCHAR_WIDTH, y, c, style, color);
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
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 244
;244:	}
LABELV $114
line 245
;245:}
LABELV $93
endproc ArenaServers_DrawFilter 56 20
proc ArenaServers_MaxPing 8 4
line 252
;246:
;247:/*
;248:=================
;249:ArenaServers_MaxPing
;250:=================
;251:*/
;252:static int ArenaServers_MaxPing(void) {
line 255
;253:	int maxPing;
;254:
;255:	maxPing = (int)trap_Cvar_VariableValue("cl_maxPing");
ADDRGP4 $119
ARGP4
ADDRLP4 4
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 256
;256:	if (maxPing < 100) {
ADDRLP4 0
INDIRI4
CNSTI4 100
GEI4 $120
line 257
;257:		maxPing = 100;
ADDRLP4 0
CNSTI4 100
ASGNI4
line 258
;258:	}
LABELV $120
line 259
;259:	return maxPing;
ADDRLP4 0
INDIRI4
RETI4
LABELV $118
endproc ArenaServers_MaxPing 8 4
proc ArenaServers_Compare 44 8
line 267
;260:}
;261:
;262:/*
;263:=================
;264:ArenaServers_Compare
;265:=================
;266:*/
;267:static int QDECL ArenaServers_Compare(const void* arg1, const void* arg2) {
line 274
;268:	float         f1;
;269:	float         f2;
;270:	servernode_t* t1;
;271:	servernode_t* t2;
;272:	int           result;
;273:
;274:	t1 = (servernode_t*)arg1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 275
;275:	t2 = (servernode_t*)arg2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
line 277
;276:
;277:	switch (g_sortkey) {
ADDRLP4 20
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $123
ADDRLP4 20
INDIRI4
CNSTI4 4
GTI4 $123
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $152
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $152
address $125
address $126
address $133
address $142
address $147
code
LABELV $125
line 279
;278:	case SORT_HOST:
;279:		return Q_stricmp(t1->hostname, t2->hostname);
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $122
JUMPV
LABELV $126
line 282
;280:
;281:	case SORT_MAP:
;282:		result = Q_stricmp(t1->mapname, t2->mapname);
ADDRLP4 0
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 28
INDIRI4
ASGNI4
line 283
;283:		if (!result) {
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $127
line 284
;284:			if (t1->pingtime < t2->pingtime) {
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
GEI4 $129
line 285
;285:				return -1;
CNSTI4 -1
RETI4
ADDRGP4 $122
JUMPV
LABELV $129
line 287
;286:			}
;287:			if (t1->pingtime > t2->pingtime) {
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
LEI4 $131
line 288
;288:				return 1;
CNSTI4 1
RETI4
ADDRGP4 $122
JUMPV
LABELV $131
line 290
;289:			}
;290:		}
LABELV $127
line 291
;291:		return result;
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $122
JUMPV
LABELV $133
line 293
;292:	case SORT_CLIENTS:
;293:		f1 = t1->maxclients - t1->numclients;
ADDRLP4 32
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 294
;294:		if (f1 < 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
GEF4 $134
line 295
;295:			f1 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 296
;296:		}
LABELV $134
line 298
;297:
;298:		f2 = t2->maxclients - t2->numclients;
ADDRLP4 36
ADDRLP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 36
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 36
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 299
;299:		if (f2 < 0) {
ADDRLP4 12
INDIRF4
CNSTF4 0
GEF4 $136
line 300
;300:			f2 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 301
;301:		}
LABELV $136
line 303
;302:
;303:		if (f1 < f2) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
GEF4 $138
line 304
;304:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $122
JUMPV
LABELV $138
line 306
;305:		}
;306:		if (f1 == f2) {
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
NEF4 $140
line 307
;307:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $122
JUMPV
LABELV $140
line 309
;308:		}
;309:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $122
JUMPV
LABELV $142
line 312
;310:
;311:	case SORT_GAME:
;312:		if (t1->gametype < t2->gametype) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
GEI4 $143
line 313
;313:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $122
JUMPV
LABELV $143
line 315
;314:		}
;315:		if (t1->gametype == t2->gametype) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
NEI4 $145
line 316
;316:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $122
JUMPV
LABELV $145
line 318
;317:		}
;318:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $122
JUMPV
LABELV $147
line 321
;319:
;320:	case SORT_PING:
;321:		if (t1->pingtime < t2->pingtime) {
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
GEI4 $148
line 322
;322:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $122
JUMPV
LABELV $148
line 324
;323:		}
;324:		if (t1->pingtime > t2->pingtime) {
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
LEI4 $150
line 325
;325:			return 1;
CNSTI4 1
RETI4
ADDRGP4 $122
JUMPV
LABELV $150
line 327
;326:		}
;327:		return Q_stricmp(t1->hostname, t2->hostname);
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
RETI4
ADDRGP4 $122
JUMPV
LABELV $123
line 330
;328:	}
;329:
;330:	return 0;
CNSTI4 0
RETI4
LABELV $122
endproc ArenaServers_Compare 44 8
proc ArenaServers_Go 8 8
line 338
;331:}
;332:
;333:/*
;334:=================
;335:ArenaServers_Go
;336:=================
;337:*/
;338:static void ArenaServers_Go(void) {
line 341
;339:	const servernode_t* servernode;
;340:
;341:	servernode = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
ADDRGP4 g_arenaservers+824+68
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+19752+64
ADDP4
INDIRP4
ASGNP4
line 342
;342:	if (servernode) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $158
line 343
;343:		trap_Cmd_ExecuteText(EXEC_APPEND, va("connect %s\n", servernode->adrstr));
ADDRGP4 $160
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 344
;344:	}
LABELV $158
line 345
;345:}
LABELV $153
endproc ArenaServers_Go 8 8
proc ArenaServers_Dblclick 0 0
line 352
;346:
;347:/*
;348:=================
;349:ArenaServers_Dblclick
;350:=================
;351:*/
;352:static void ArenaServers_Dblclick(void* self) {
line 353
;353:	ArenaServers_Go();
ADDRGP4 ArenaServers_Go
CALLV
pop
line 354
;354:}
LABELV $161
endproc ArenaServers_Dblclick 0 0
bss
align 1
LABELV $163
skip 64
code
proc ArenaServers_UpdatePicture 4 16
line 361
;355:
;356:/*
;357:=================
;358:ArenaServers_UpdatePicture
;359:=================
;360:*/
;361:static void ArenaServers_UpdatePicture(void) {
line 365
;362:	static char         picname[MAX_QPATH];
;363:	const servernode_t* servernodeptr;
;364:
;365:	if (!g_arenaservers.list.numitems) {
ADDRGP4 g_arenaservers+824+72
INDIRI4
CNSTI4 0
NEI4 $164
line 366
;366:		g_arenaservers.mappic.generic.name = NULL;
ADDRGP4 g_arenaservers+932+4
CNSTP4 0
ASGNP4
line 367
;367:	} else {
ADDRGP4 $165
JUMPV
LABELV $164
line 368
;368:		servernodeptr = g_arenaservers.table[g_arenaservers.list.curvalue].servernode;
ADDRLP4 0
ADDRGP4 g_arenaservers+824+68
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+19752+64
ADDP4
INDIRP4
ASGNP4
line 369
;369:		Com_sprintf(picname, sizeof(picname), "levelshots/%s.tga", servernodeptr->mapname);
ADDRGP4 $163
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $174
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 370
;370:		g_arenaservers.mappic.generic.name = picname;
ADDRGP4 g_arenaservers+932+4
ADDRGP4 $163
ASGNP4
line 371
;371:	}
LABELV $165
line 374
;372:
;373:	// force shader update during draw
;374:	g_arenaservers.mappic.shader = 0;
ADDRGP4 g_arenaservers+932+72
CNSTI4 0
ASGNI4
line 375
;375:}
LABELV $162
endproc ArenaServers_UpdatePicture 4 16
proc ArenaServers_UpdateList 48 68
line 382
;376:
;377:/*
;378:=================
;379:ArenaServers_UpdateList
;380:=================
;381:*/
;382:static void ArenaServers_UpdateList(void) {
line 391
;383:	int           i;
;384:	int           j;
;385:	int           count;
;386:	servernode_t* servernodeptr;
;387:	table_t*      tableptr;
;388:	const char*   pingColor;
;389:
;390:	// build list box strings - apply culling filters
;391:	servernodeptr = g_arenaservers.serverlist;
ADDRLP4 0
ADDRGP4 g_arenaservers+56624
INDIRP4
ASGNP4
line 392
;392:	count         = *g_arenaservers.numservers;
ADDRLP4 20
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ASGNI4
line 393
;393:	for (i = 0, j = 0; i < count; i++, servernodeptr++) {
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $185
JUMPV
LABELV $182
line 394
;394:		tableptr             = &g_arenaservers.table[j];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+19752
ADDP4
ASGNP4
line 395
;395:		tableptr->servernode = servernodeptr;
ADDRLP4 4
INDIRP4
CNSTI4 64
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 398
;396:
;397:		// can only cull valid results
;398:		if (!g_emptyservers && !servernodeptr->numclients) {
ADDRGP4 g_emptyservers
INDIRI4
CNSTI4 0
NEI4 $187
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 0
NEI4 $187
line 399
;399:			continue;
ADDRGP4 $183
JUMPV
LABELV $187
line 402
;400:		}
;401:
;402:		if (!g_fullservers && (servernodeptr->numclients == servernodeptr->maxclients)) {
ADDRGP4 g_fullservers
INDIRI4
CNSTI4 0
NEI4 $189
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
NEI4 $189
line 403
;403:			continue;
ADDRGP4 $183
JUMPV
LABELV $189
line 406
;404:		}
;405:
;406:		if (g_arenaservers.serverfilter[0] && !Q_stristr(servernodeptr->hostname, g_arenaservers.serverfilter)) {
ADDRGP4 g_arenaservers+57676
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $191
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 g_arenaservers+57676
ARGP4
ADDRLP4 28
ADDRGP4 Q_stristr
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $191
line 407
;407:			continue;
ADDRGP4 $183
JUMPV
LABELV $191
line 410
;408:		}
;409:
;410:		switch (g_gametype) {
ADDRLP4 32
ADDRGP4 g_gametype
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
LTI4 $195
ADDRLP4 32
INDIRI4
CNSTI4 4
GTI4 $195
ADDRLP4 32
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $210
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $210
address $196
address $198
address $204
address $201
address $207
code
line 412
;411:		case GAMES_ALL:
;412:			break;
LABELV $198
line 415
;413:
;414:		case GAMES_FFA:
;415:			if (servernodeptr->gametype != GT_RUN) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CNSTI4 0
EQI4 $196
line 416
;416:				continue;
ADDRGP4 $183
JUMPV
line 418
;417:			}
;418:			break;
LABELV $201
line 421
;419:
;420:		case GAMES_TEAMPLAY:
;421:			if (servernodeptr->gametype != GT_TEAM) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CNSTI4 3
EQI4 $196
line 422
;422:				continue;
ADDRGP4 $183
JUMPV
line 424
;423:			}
;424:			break;
LABELV $204
line 427
;425:
;426:		case GAMES_TOURNEY:
;427:			if (servernodeptr->gametype != GT_TOURNAMENT) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CNSTI4 1
EQI4 $196
line 428
;428:				continue;
ADDRGP4 $183
JUMPV
line 430
;429:			}
;430:			break;
LABELV $207
line 433
;431:
;432:		case GAMES_CTF:
;433:			if (servernodeptr->gametype != GT_CTF) {
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRI4
CNSTI4 4
EQI4 $196
line 434
;434:				continue;
ADDRGP4 $183
JUMPV
line 436
;435:			}
;436:			break;
LABELV $195
LABELV $196
line 439
;437:		}
;438:
;439:		if (servernodeptr->pingtime < servernodeptr->minPing) {
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
INDIRI4
GEI4 $211
line 440
;440:			pingColor = S_COLOR_BLUE;
ADDRLP4 16
ADDRGP4 $213
ASGNP4
line 441
;441:		} else if (servernodeptr->maxPing && servernodeptr->pingtime > servernodeptr->maxPing) {
ADDRGP4 $212
JUMPV
LABELV $211
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
CNSTI4 0
EQI4 $214
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
LEI4 $214
line 442
;442:			pingColor = S_COLOR_BLUE;
ADDRLP4 16
ADDRGP4 $213
ASGNP4
line 443
;443:		} else if (servernodeptr->pingtime < 200) {
ADDRGP4 $215
JUMPV
LABELV $214
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 200
GEI4 $216
line 444
;444:			pingColor = S_COLOR_GREEN;
ADDRLP4 16
ADDRGP4 $218
ASGNP4
line 445
;445:		} else if (servernodeptr->pingtime < 400) {
ADDRGP4 $217
JUMPV
LABELV $216
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
CNSTI4 400
GEI4 $219
line 446
;446:			pingColor = S_COLOR_YELLOW;
ADDRLP4 16
ADDRGP4 $221
ASGNP4
line 447
;447:		} else {
ADDRGP4 $220
JUMPV
LABELV $219
line 448
;448:			pingColor = S_COLOR_RED;
ADDRLP4 16
ADDRGP4 $222
ASGNP4
line 449
;449:		}
LABELV $220
LABELV $217
LABELV $215
LABELV $212
line 451
;450:
;451:		Com_sprintf(
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $223
ARGP4
CNSTI4 26
ARGI4
CNSTI4 26
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
CNSTI4 11
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ARGI4
CNSTI4 8
ARGI4
CNSTI4 8
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 netnames
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 455
;452:			tableptr->buff, sizeof(tableptr->buff), "%-*.*s %-*.*s %2d/%2d %-*.*s %3s %s%3d", MAX_HOSTNAMELENGTH, MAX_HOSTNAMELENGTH, servernodeptr->hostname,
;453:			MAX_MAPNAMELENGTH, MAX_MAPNAMELENGTH, servernodeptr->mapname, servernodeptr->numclients, servernodeptr->maxclients, MAX_GAMENAMELENGTH,
;454:			MAX_GAMENAMELENGTH, servernodeptr->gamename, netnames[servernodeptr->nettype], pingColor, servernodeptr->pingtime);
;455:		j++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 456
;456:	}
LABELV $183
line 393
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
ASGNP4
LABELV $185
ADDRLP4 12
INDIRI4
ADDRLP4 20
INDIRI4
LTI4 $182
line 458
;457:
;458:	g_arenaservers.list.numitems = j;
ADDRGP4 g_arenaservers+824+72
ADDRLP4 8
INDIRI4
ASGNI4
line 459
;459:	g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+824+68
CNSTI4 0
ASGNI4
line 460
;460:	g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+824+76
CNSTI4 0
ASGNI4
line 461
;461:}
LABELV $179
endproc ArenaServers_UpdateList 48 68
proc ArenaServers_UpdateMenu 32 20
line 468
;462:
;463:/*
;464:=================
;465:ArenaServers_UpdateMenu
;466:=================
;467:*/
;468:static void ArenaServers_UpdateMenu(void) {
line 470
;469:
;470:	if (g_arenaservers.numqueriedservers > 0) {
ADDRGP4 g_arenaservers+56616
INDIRI4
CNSTI4 0
LEI4 $231
line 472
;471:		// servers found
;472:		if (g_arenaservers.refreshservers && (g_arenaservers.currentping <= g_arenaservers.numqueriedservers)) {
ADDRGP4 g_arenaservers+56632
INDIRI4
CNSTI4 0
EQI4 $234
ADDRGP4 g_arenaservers+56628
INDIRI4
ADDRGP4 g_arenaservers+56616
INDIRI4
GTI4 $234
line 474
;473:			// show progress
;474:			Com_sprintf(
ADDRGP4 g_arenaservers+1300+64
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $241
ARGP4
ADDRGP4 g_arenaservers+56628
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+56616
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 476
;475:				g_arenaservers.status.string, MAX_STATUSLENGTH, "%d of %d Arena Servers.", g_arenaservers.currentping, g_arenaservers.numqueriedservers);
;476:			g_arenaservers.statusbar.string = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 $246
ASGNP4
line 477
;477:			qsort(g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof(servernode_t), ArenaServers_Compare);
ADDRGP4 g_arenaservers+56624
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ARGI4
CNSTI4 144
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 478
;478:		} else {
ADDRGP4 $232
JUMPV
LABELV $234
line 484
;479:			// all servers pinged - enable controls
;480:			// g_arenaservers.gametype.generic.flags	&= ~QMF_GRAYED;
;481:			// g_arenaservers.sortkey.generic.flags	&= ~QMF_GRAYED;
;482:			// g_arenaservers.showempty.generic.flags&= ~QMF_GRAYED;
;483:			// g_arenaservers.showfull.generic.flags	&= ~QMF_GRAYED;
;484:			g_arenaservers.list.generic.flags &= ~QMF_GRAYED;
ADDRLP4 0
ADDRGP4 g_arenaservers+824+44
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
line 485
;485:			g_arenaservers.refresh.generic.flags &= ~QMF_GRAYED;
ADDRLP4 4
ADDRGP4 g_arenaservers+1636+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 486
;486:			g_arenaservers.go.generic.flags &= ~QMF_GRAYED;
ADDRLP4 8
ADDRGP4 g_arenaservers+1912+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 490
;487:			// g_arenaservers.punkbuster.generic.flags &= ~QMF_GRAYED;
;488:
;489:			// update status bar
;490:			if (g_servertype == AS_GLOBAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 2
NEI4 $255
line 491
;491:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 quake3worldMessage
ASGNP4
line 492
;492:			} else {
ADDRGP4 $232
JUMPV
LABELV $255
line 493
;493:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 $261
ASGNP4
line 494
;494:			}
line 495
;495:		}
line 496
;496:	} else {
ADDRGP4 $232
JUMPV
LABELV $231
line 498
;497:		// no servers found
;498:		if (g_arenaservers.refreshservers) {
ADDRGP4 g_arenaservers+56632
INDIRI4
CNSTI4 0
EQI4 $262
line 499
;499:			strcpy(g_arenaservers.status.string, "Scanning For Servers.");
ADDRGP4 g_arenaservers+1300+64
INDIRP4
ARGP4
ADDRGP4 $267
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 500
;500:			g_arenaservers.statusbar.string = "Press SPACE to stop";
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 $246
ASGNP4
line 507
;501:
;502:			// disable controls during refresh
;503:			// g_arenaservers.gametype.generic.flags	|= QMF_GRAYED;
;504:			// g_arenaservers.sortkey.generic.flags	|= QMF_GRAYED;
;505:			// g_arenaservers.showempty.generic.flags|= QMF_GRAYED;
;506:			// g_arenaservers.showfull.generic.flags	|= QMF_GRAYED;
;507:			g_arenaservers.list.generic.flags |= QMF_GRAYED;
ADDRLP4 0
ADDRGP4 g_arenaservers+824+44
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 508
;508:			g_arenaservers.refresh.generic.flags |= QMF_GRAYED;
ADDRLP4 4
ADDRGP4 g_arenaservers+1636+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 509
;509:			g_arenaservers.go.generic.flags |= QMF_GRAYED;
ADDRLP4 8
ADDRGP4 g_arenaservers+1912+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 510
;510:		} else {
ADDRGP4 $263
JUMPV
LABELV $262
line 511
;511:			if (g_arenaservers.numqueriedservers < 0) {
ADDRGP4 g_arenaservers+56616
INDIRI4
CNSTI4 0
GEI4 $276
line 512
;512:				strcpy(g_arenaservers.status.string, "No Response From Master Server.");
ADDRGP4 g_arenaservers+1300+64
INDIRP4
ARGP4
ADDRGP4 $281
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 513
;513:			} else {
ADDRGP4 $277
JUMPV
LABELV $276
line 514
;514:				strcpy(g_arenaservers.status.string, "No Servers Found.");
ADDRGP4 g_arenaservers+1300+64
INDIRP4
ARGP4
ADDRGP4 $284
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 515
;515:			}
LABELV $277
line 518
;516:
;517:			// update status bar
;518:			if (g_servertype == AS_GLOBAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 2
NEI4 $285
line 519
;519:				g_arenaservers.statusbar.string = quake3worldMessage;
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 quake3worldMessage
ASGNP4
line 520
;520:			} else {
ADDRGP4 $286
JUMPV
LABELV $285
line 521
;521:				g_arenaservers.statusbar.string = "";
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 $261
ASGNP4
line 522
;522:			}
LABELV $286
line 525
;523:
;524:			// end of refresh - set control state
;525:			g_arenaservers.master.generic.flags &= ~QMF_GRAYED;
ADDRLP4 0
ADDRGP4 g_arenaservers+364+44
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
line 526
;526:			g_arenaservers.gametype.generic.flags &= ~QMF_GRAYED;
ADDRLP4 4
ADDRGP4 g_arenaservers+472+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 527
;527:			g_arenaservers.sortkey.generic.flags &= ~QMF_GRAYED;
ADDRLP4 8
ADDRGP4 g_arenaservers+580+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 528
;528:			g_arenaservers.showempty.generic.flags &= ~QMF_GRAYED;
ADDRLP4 12
ADDRGP4 g_arenaservers+756+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 529
;529:			g_arenaservers.showfull.generic.flags &= ~QMF_GRAYED;
ADDRLP4 16
ADDRGP4 g_arenaservers+688+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 530
;530:			g_arenaservers.list.generic.flags |= QMF_GRAYED;
ADDRLP4 20
ADDRGP4 g_arenaservers+824+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 531
;531:			g_arenaservers.refresh.generic.flags &= ~QMF_GRAYED;
ADDRLP4 24
ADDRGP4 g_arenaservers+1636+44
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 532
;532:			g_arenaservers.go.generic.flags |= QMF_GRAYED;
ADDRLP4 28
ADDRGP4 g_arenaservers+1912+44
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 533
;533:		}
LABELV $263
line 536
;534:
;535:		// zero out list box
;536:		g_arenaservers.list.numitems = 0;
ADDRGP4 g_arenaservers+824+72
CNSTI4 0
ASGNI4
line 537
;537:		g_arenaservers.list.curvalue = 0;
ADDRGP4 g_arenaservers+824+68
CNSTI4 0
ASGNI4
line 538
;538:		g_arenaservers.list.top      = 0;
ADDRGP4 g_arenaservers+824+76
CNSTI4 0
ASGNI4
line 541
;539:
;540:		// update picture
;541:		ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 542
;542:		return;
ADDRGP4 $230
JUMPV
LABELV $232
line 545
;543:	}
;544:
;545:	ArenaServers_UpdateList();
ADDRGP4 ArenaServers_UpdateList
CALLV
pop
line 548
;546:
;547:	// update picture
;548:	ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 549
;549:}
LABELV $230
endproc ArenaServers_UpdateMenu 32 20
proc ArenaServers_Remove 20 12
line 556
;550:
;551:/*
;552:=================
;553:ArenaServers_Remove
;554:=================
;555:*/
;556:static void ArenaServers_Remove(void) {
line 561
;557:	int           i;
;558:	servernode_t* servernodeptr;
;559:	table_t*      tableptr;
;560:
;561:	if (!g_arenaservers.list.numitems)
ADDRGP4 g_arenaservers+824+72
INDIRI4
CNSTI4 0
NEI4 $314
line 562
;562:		return;
ADDRGP4 $313
JUMPV
LABELV $314
line 568
;563:
;564:	// remove selected item from display list
;565:	// items are in scattered order due to sort and cull
;566:	// perform delete on list box contents, resync all lists
;567:
;568:	tableptr      = &g_arenaservers.table[g_arenaservers.list.curvalue];
ADDRLP4 8
ADDRGP4 g_arenaservers+824+68
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+19752
ADDP4
ASGNP4
line 569
;569:	servernodeptr = tableptr->servernode;
ADDRLP4 4
ADDRLP4 8
INDIRP4
CNSTI4 64
ADDP4
INDIRP4
ASGNP4
line 572
;570:
;571:	// find address in master list
;572:	for (i = 0; i < g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $324
JUMPV
LABELV $321
line 573
;573:		if (!Q_stricmp(g_arenaservers.favoriteaddresses[i], servernodeptr->adrstr))
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+56648
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $326
line 574
;574:			break;
ADDRGP4 $323
JUMPV
LABELV $326
LABELV $322
line 572
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $324
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+57672
INDIRI4
LTI4 $321
LABELV $323
line 577
;575:
;576:	// delete address from master list
;577:	if (i <= g_arenaservers.numfavoriteaddresses - 1) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+57672
INDIRI4
CNSTI4 1
SUBI4
GTI4 $329
line 578
;578:		if (i < g_arenaservers.numfavoriteaddresses - 1) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+57672
INDIRI4
CNSTI4 1
SUBI4
GEI4 $332
line 580
;579:			// shift items up
;580:			memcpy(
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+56648
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+56648+64
ADDP4
ARGP4
ADDRGP4 g_arenaservers+57672
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 6
LSHI4
CNSTI4 64
SUBI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 583
;581:				&g_arenaservers.favoriteaddresses[i], &g_arenaservers.favoriteaddresses[i + 1],
;582:				(g_arenaservers.numfavoriteaddresses - i - 1) * MAX_ADDRESSLENGTH);
;583:		}
LABELV $332
line 584
;584:		g_arenaservers.numfavoriteaddresses--;
ADDRLP4 16
ADDRGP4 g_arenaservers+57672
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 585
;585:	}
LABELV $329
line 588
;586:
;587:	// find address in server list
;588:	for (i = 0; i < g_numfavoriteservers; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $343
JUMPV
LABELV $340
line 589
;589:		if (&g_favoriteserverlist[i] == servernodeptr)
ADDRLP4 0
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $344
line 590
;590:			break;
ADDRGP4 $342
JUMPV
LABELV $344
LABELV $341
line 588
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $343
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
LTI4 $340
LABELV $342
line 593
;591:
;592:	// delete address from server list
;593:	if (i <= g_numfavoriteservers - 1) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GTI4 $346
line 594
;594:		if (i < g_numfavoriteservers - 1) {
ADDRLP4 0
INDIRI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 1
SUBI4
GEI4 $348
line 596
;595:			// shift items up
;596:			memcpy(&g_favoriteserverlist[i], &g_favoriteserverlist[i + 1], (g_numfavoriteservers - i - 1) * sizeof(servernode_t));
ADDRLP4 0
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_favoriteserverlist+144
ADDP4
ARGP4
ADDRGP4 g_numfavoriteservers
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
SUBI4
CVIU4 4
CNSTU4 144
MULU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 597
;597:		}
LABELV $348
line 598
;598:		g_numfavoriteservers--;
ADDRLP4 16
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 599
;599:	}
LABELV $346
line 601
;600:
;601:	g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+56616
ADDRGP4 g_arenaservers+57672
INDIRI4
ASGNI4
line 602
;602:	g_arenaservers.currentping       = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+56628
ADDRGP4 g_arenaservers+57672
INDIRI4
ASGNI4
line 603
;603:}
LABELV $313
endproc ArenaServers_Remove 20 12
proc UI_CleanStr 24 0
line 605
;604:
;605:static qboolean UI_CleanStr(char* dst, int size, const char* src) {
line 606
;606:	char*    max = dst + size - 1;
ADDRLP4 8
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 -1
ADDP4
ASGNP4
line 608
;607:	int      c;
;608:	qboolean filtered = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $357
JUMPV
LABELV $356
line 610
;609:
;610:	while ((c = *src) != '\0') {
line 611
;611:		if (c <= ' ') {
ADDRLP4 0
INDIRI4
CNSTI4 32
GTI4 $359
line 612
;612:			filtered = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 613
;613:			src += 1;
ADDRFP4 8
ADDRFP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 614
;614:			continue;
ADDRGP4 $357
JUMPV
LABELV $359
line 616
;615:		}
;616:		if (Q_IsColorString(src) && *(src + 2) <= ' ') {
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $364
ADDRLP4 12
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $364
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $364
ADDRLP4 12
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $364
ADDRLP4 12
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 32
GTI4 $364
line 617
;617:			filtered = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 618
;618:			src += 2;
ADDRFP4 8
ADDRFP4 8
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 619
;619:			continue;
line 621
;620:		}
;621:		break;
LABELV $357
line 610
ADDRLP4 12
ADDRFP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $356
ADDRGP4 $364
JUMPV
LABELV $363
line 624
;622:	}
;623:
;624:	while ((c = *src) != '\0') {
line 625
;625:		if (Q_IsColorString(src)) {
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $366
ADDRLP4 16
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $366
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $366
ADDRLP4 16
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $366
line 626
;626:			filtered = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 627
;627:			src += 2;
ADDRFP4 8
ADDRFP4 8
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 628
;628:			continue;
ADDRGP4 $364
JUMPV
LABELV $366
line 629
;629:		} else if (c >= ' ' && c <= '~') {
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $368
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $368
line 630
;630:			*dst = c;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
CVII1 4
ASGNI1
line 631
;631:			dst++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 632
;632:			if (dst >= max)
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
LTU4 $370
line 633
;633:				break;
ADDRGP4 $365
JUMPV
LABELV $370
line 634
;634:		}
LABELV $368
line 635
;635:		src++;
ADDRFP4 8
ADDRFP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 636
;636:	}
LABELV $364
line 624
ADDRLP4 16
ADDRFP4 8
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $363
LABELV $365
line 638
;637:
;638:	*dst = '\0';
ADDRFP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 640
;639:
;640:	return filtered;
ADDRLP4 4
INDIRI4
RETI4
LABELV $355
endproc UI_CleanStr 24 0
proc ArenaServers_Insert 104 12
line 648
;641:}
;642:
;643:/*
;644:=================
;645:ArenaServers_Insert
;646:=================
;647:*/
;648:static void ArenaServers_Insert(const char* adrstr, const char* info, int pingtime) {
line 653
;649:	servernode_t* servernodeptr;
;650:	char*         s;
;651:	int           i;
;652:
;653:	s = Info_ValueForKey(info, "game");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $373
ARGP4
ADDRLP4 12
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 654
;654:	if (!Q_stricmp(s, "q3ut4")) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $374
line 655
;655:		return;  // filter urbanterror servers
ADDRGP4 $372
JUMPV
LABELV $374
line 658
;656:	}
;657:
;658:	if (atoi(Info_ValueForKey(info, "punkbuster"))) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $379
ARGP4
ADDRLP4 20
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $377
line 659
;659:		return;  // filter PunkBuster servers
ADDRGP4 $372
JUMPV
LABELV $377
line 662
;660:	}
;661:
;662:	if ((pingtime >= ArenaServers_MaxPing()) && (g_servertype != AS_FAVORITES)) {
ADDRLP4 28
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRFP4 8
INDIRI4
ADDRLP4 28
INDIRI4
LTI4 $380
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $380
line 664
;663:		// slow global or local servers do not get entered
;664:		return;
ADDRGP4 $372
JUMPV
LABELV $380
line 667
;665:	}
;666:
;667:	if (pingtime < 0)
ADDRFP4 8
INDIRI4
CNSTI4 0
GEI4 $382
line 668
;668:		pingtime = 0;
ADDRFP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $383
JUMPV
LABELV $382
line 669
;669:	else if (pingtime > 999)
ADDRFP4 8
INDIRI4
CNSTI4 999
LEI4 $384
line 670
;670:		pingtime = 999;
ADDRFP4 8
CNSTI4 999
ASGNI4
LABELV $384
LABELV $383
line 672
;671:
;672:	if (*g_arenaservers.numservers >= g_arenaservers.maxservers) {
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ADDRGP4 g_arenaservers+56640
INDIRI4
LTI4 $386
line 674
;673:		// list full;
;674:		servernodeptr = g_arenaservers.serverlist + (*g_arenaservers.numservers) - 1;
ADDRLP4 0
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_arenaservers+56624
INDIRP4
ADDP4
CNSTI4 -144
ADDP4
ASGNP4
line 675
;675:	} else {
ADDRGP4 $387
JUMPV
LABELV $386
line 677
;676:		// next slot
;677:		servernodeptr = g_arenaservers.serverlist + (*g_arenaservers.numservers);
ADDRLP4 0
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_arenaservers+56624
INDIRP4
ADDP4
ASGNP4
line 678
;678:		(*g_arenaservers.numservers)++;
ADDRLP4 32
ADDRGP4 g_arenaservers+56620
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 679
;679:	}
LABELV $387
line 681
;680:
;681:	Q_strncpyz(servernodeptr->adrstr, adrstr, sizeof(servernodeptr->adrstr));
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 683
;682:
;683:	if (UI_CleanStr(servernodeptr->hostname, sizeof(servernodeptr->hostname), Info_ValueForKey(info, "hostname"))) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $397
ARGP4
ADDRLP4 32
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 UI_CleanStr
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $395
LABELV $398
line 686
;684:		// some servers abusing color sequences - lets filter them until completely cleaned
;685:		while (UI_CleanStr(servernodeptr->hostname, sizeof(servernodeptr->hostname), servernodeptr->hostname))
;686:			;
LABELV $399
line 685
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
CNSTI4 27
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 UI_CleanStr
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $398
line 687
;687:	}
LABELV $395
line 689
;688:
;689:	Q_strncpyz(servernodeptr->mapname, Info_ValueForKey(info, "mapname"), sizeof(servernodeptr->mapname));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $401
ARGP4
ADDRLP4 40
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTI4 12
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 690
;690:	Q_CleanStr(servernodeptr->mapname);
ADDRLP4 0
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 691
;691:	Q_strupr(servernodeptr->mapname);
ADDRLP4 0
INDIRP4
CNSTI4 91
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 693
;692:
;693:	servernodeptr->numclients = abs(atoi(Info_ValueForKey(info, "clients")));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $402
ARGP4
ADDRLP4 44
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 52
INDIRI4
ASGNI4
line 694
;694:	servernodeptr->maxclients = abs(atoi(Info_ValueForKey(info, "sv_maxclients")));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $403
ARGP4
ADDRLP4 56
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 abs
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 695
;695:	servernodeptr->pingtime   = pingtime;
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 696
;696:	servernodeptr->minPing    = atoi(Info_ValueForKey(info, "minPing"));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $404
ARGP4
ADDRLP4 68
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 136
ADDP4
ADDRLP4 72
INDIRI4
ASGNI4
line 697
;697:	servernodeptr->maxPing    = atoi(Info_ValueForKey(info, "maxPing"));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $405
ARGP4
ADDRLP4 76
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 700
;698:
;699:	// avoid potential string overflow
;700:	if (servernodeptr->numclients > 99)
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 99
LEI4 $406
line 701
;701:		servernodeptr->numclients = 99;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
CNSTI4 99
ASGNI4
LABELV $406
line 702
;702:	if (servernodeptr->maxclients > 99)
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 99
LEI4 $408
line 703
;703:		servernodeptr->maxclients = 99;
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
CNSTI4 99
ASGNI4
LABELV $408
line 722
;704:
;705:	/*
;706:	s = Info_ValueForKey( info, "nettype" );
;707:	for (i=0; ;i++)
;708:	{
;709:	    if (!netnames[i])
;710:	    {
;711:	        servernodeptr->nettype = 0;
;712:	        break;
;713:	    }
;714:	    else if (!Q_stricmp( netnames[i], s ))
;715:	    {
;716:	        servernodeptr->nettype = i;
;717:	        break;
;718:	    }
;719:	}
;720:	*/
;721:
;722:	servernodeptr->nettype = atoi(Info_ValueForKey(info, "nettype"));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $410
ARGP4
ADDRLP4 84
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 723
;723:	if ((unsigned)servernodeptr->nettype >= ARRAY_LEN(netnames) - 1) {
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
INDIRI4
CVIU4 4
CNSTU4 3
LTU4 $411
line 724
;724:		servernodeptr->nettype = 0;
ADDRLP4 0
INDIRP4
CNSTI4 132
ADDP4
CNSTI4 0
ASGNI4
line 725
;725:	}
LABELV $411
line 727
;726:
;727:	i = atoi(Info_ValueForKey(info, "gametype"));
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $413
ARGP4
ADDRLP4 92
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 96
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 96
INDIRI4
ASGNI4
line 728
;728:	if ((unsigned)i > GT_MAX_GAME_TYPE - 1) {
ADDRLP4 8
INDIRI4
CVIU4 4
CNSTU4 4
LEU4 $414
line 729
;729:		i = GT_MAX_GAME_TYPE - 1;
ADDRLP4 8
CNSTI4 4
ASGNI4
line 730
;730:	}
LABELV $414
line 731
;731:	servernodeptr->gametype = i;
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 733
;732:
;733:	s = Info_ValueForKey(info, "game");
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $373
ARGP4
ADDRLP4 100
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 100
INDIRP4
ASGNP4
line 734
;734:	if (*s)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $416
line 735
;735:		Q_strncpyz(servernodeptr->gamename, s, sizeof(servernodeptr->gamename));
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
ADDRGP4 $417
JUMPV
LABELV $416
line 737
;736:	else
;737:		Q_strncpyz(servernodeptr->gamename, "unknown", sizeof(servernodeptr->gamename));
ADDRLP4 0
INDIRP4
CNSTI4 120
ADDP4
ARGP4
ADDRGP4 $418
ARGP4
CNSTI4 9
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
LABELV $417
line 738
;738:}
LABELV $372
endproc ArenaServers_Insert 104 12
export ArenaServers_LoadFavorites
proc ArenaServers_LoadFavorites 2400 12
line 747
;739:
;740:/*
;741:=================
;742:ArenaServers_LoadFavorites
;743:
;744:Load cvar address book entries into local lists.
;745:=================
;746:*/
;747:void ArenaServers_LoadFavorites(void) {
line 755
;748:	int          i;
;749:	int          j;
;750:	int          numtempitems;
;751:	char         adrstr[MAX_ADDRESSLENGTH];
;752:	servernode_t templist[MAX_FAVORITESERVERS];
;753:	qboolean     found;
;754:
;755:	found = qfalse;
ADDRLP4 2380
CNSTI4 0
ASGNI4
line 758
;756:
;757:	// copy the old
;758:	memcpy(templist, g_favoriteserverlist, sizeof(servernode_t) * MAX_FAVORITESERVERS);
ADDRLP4 72
ARGP4
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 2304
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 759
;759:	numtempitems = g_numfavoriteservers;
ADDRLP4 68
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 762
;760:
;761:	// clear the current for sync
;762:	memset(g_favoriteserverlist, 0, sizeof(servernode_t) * MAX_FAVORITESERVERS);
ADDRGP4 g_favoriteserverlist
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2304
ARGI4
ADDRGP4 memset
CALLP4
pop
line 763
;763:	g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 766
;764:
;765:	// resync existing results with new or deleted cvars
;766:	for (i = 0; i < MAX_FAVORITESERVERS; i++) {
ADDRLP4 2376
CNSTI4 0
ASGNI4
LABELV $420
line 767
;767:		trap_Cvar_VariableStringBuffer(va("server%d", i + 1), adrstr, MAX_ADDRESSLENGTH);
ADDRGP4 $424
ARGP4
ADDRLP4 2376
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 2384
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 2384
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 768
;768:		if (!adrstr[0])
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $425
line 769
;769:			continue;
ADDRGP4 $421
JUMPV
LABELV $425
line 773
;770:
;771:		// quick sanity check to avoid slow domain name resolving
;772:		// first character must be numeric
;773:		if (adrstr[0] < '0' || adrstr[0] > '9')
ADDRLP4 2388
ADDRLP4 4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2388
INDIRI4
CNSTI4 48
LTI4 $429
ADDRLP4 2388
INDIRI4
CNSTI4 57
LEI4 $427
LABELV $429
line 774
;774:			continue;
ADDRGP4 $421
JUMPV
LABELV $427
line 779
;775:
;776:		// favorite server addresses must be maintained outside refresh list
;777:		// this mimics local and global netadr's stored in client
;778:		// these can be fetched to fill ping list
;779:		strcpy(g_arenaservers.favoriteaddresses[g_numfavoriteservers], adrstr);
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+56648
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 782
;780:
;781:		// find this server in the old list
;782:		for (j = 0; j < numtempitems; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $434
JUMPV
LABELV $431
line 783
;783:			if (!Q_stricmp(templist[j].adrstr, adrstr))
ADDRLP4 0
INDIRI4
CNSTI4 144
MULI4
ADDRLP4 72
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2392
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2392
INDIRI4
CNSTI4 0
NEI4 $435
line 784
;784:				break;
ADDRGP4 $433
JUMPV
LABELV $435
LABELV $432
line 782
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $434
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $431
LABELV $433
line 786
;785:
;786:		if (j < numtempitems) {
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
GEI4 $437
line 788
;787:			// found server - add exisiting results
;788:			memcpy(&g_favoriteserverlist[g_numfavoriteservers], &templist[j], sizeof(servernode_t));
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 144
MULI4
ADDRLP4 72
ADDP4
ARGP4
CNSTI4 144
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 789
;789:			found = qtrue;
ADDRLP4 2380
CNSTI4 1
ASGNI4
line 790
;790:		} else {
ADDRGP4 $438
JUMPV
LABELV $437
line 792
;791:			// add new server
;792:			Q_strncpyz(g_favoriteserverlist[g_numfavoriteservers].adrstr, adrstr, MAX_ADDRESSLENGTH);
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_favoriteserverlist
ADDP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 793
;793:			g_favoriteserverlist[g_numfavoriteservers].pingtime = ArenaServers_MaxPing();
ADDRLP4 2396
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRGP4 g_numfavoriteservers
INDIRI4
CNSTI4 144
MULI4
ADDRGP4 g_favoriteserverlist+112
ADDP4
ADDRLP4 2396
INDIRI4
ASGNI4
line 794
;794:		}
LABELV $438
line 796
;795:
;796:		g_numfavoriteservers++;
ADDRLP4 2396
ADDRGP4 g_numfavoriteservers
ASGNP4
ADDRLP4 2396
INDIRP4
ADDRLP4 2396
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 797
;797:	}
LABELV $421
line 766
ADDRLP4 2376
ADDRLP4 2376
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 2376
INDIRI4
CNSTI4 16
LTI4 $420
line 799
;798:
;799:	g_arenaservers.numfavoriteaddresses = g_numfavoriteservers;
ADDRGP4 g_arenaservers+57672
ADDRGP4 g_numfavoriteservers
INDIRI4
ASGNI4
line 801
;800:
;801:	if (!found) {
ADDRLP4 2380
INDIRI4
CNSTI4 0
NEI4 $441
line 804
;802:		// no results were found, reset server list
;803:		// list will be automatically refreshed when selected
;804:		g_numfavoriteservers = 0;
ADDRGP4 g_numfavoriteservers
CNSTI4 0
ASGNI4
line 805
;805:	}
LABELV $441
line 806
;806:}
LABELV $419
endproc ArenaServers_LoadFavorites 2400 12
proc ArenaServers_StopRefresh 0 16
line 813
;807:
;808:/*
;809:=================
;810:ArenaServers_StopRefresh
;811:=================
;812:*/
;813:static void ArenaServers_StopRefresh(void) {
line 814
;814:	if (!g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+56632
INDIRI4
CNSTI4 0
NEI4 $444
line 816
;815:		// not currently refreshing
;816:		return;
ADDRGP4 $443
JUMPV
LABELV $444
line 818
;817:
;818:	g_arenaservers.refreshservers = qfalse;
ADDRGP4 g_arenaservers+56632
CNSTI4 0
ASGNI4
line 821
;819:
;820:	// final tally
;821:	if (g_arenaservers.numqueriedservers >= 0) {
ADDRGP4 g_arenaservers+56616
INDIRI4
CNSTI4 0
LTI4 $448
line 822
;822:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+56628
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ASGNI4
line 823
;823:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+56616
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ASGNI4
line 824
;824:	}
LABELV $448
line 827
;825:
;826:	// sort
;827:	qsort(g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof(servernode_t), ArenaServers_Compare);
ADDRGP4 g_arenaservers+56624
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ARGI4
CNSTI4 144
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 829
;828:
;829:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 830
;830:}
LABELV $443
endproc ArenaServers_StopRefresh 0 16
proc ArenaServers_DoRefresh 1120 16
line 837
;831:
;832:/*
;833:=================
;834:ArenaServers_DoRefresh
;835:=================
;836:*/
;837:static void ArenaServers_DoRefresh(void) {
line 845
;838:	int  i;
;839:	int  j;
;840:	int  time;
;841:	int  maxPing;
;842:	char adrstr[MAX_ADDRESSLENGTH];
;843:	char info[MAX_INFO_STRING];
;844:
;845:	if (uis.realtime < g_arenaservers.refreshtime) {
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+56644
INDIRI4
GEI4 $458
line 846
;846:		if (g_servertype != AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
EQI4 $459
line 847
;847:			if (g_servertype == AS_LOCAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $464
line 848
;848:				if (!trap_LAN_GetServerCount(g_servertype)) {
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $466
line 849
;849:					return;
ADDRGP4 $457
JUMPV
LABELV $466
line 851
;850:				}
;851:			}
LABELV $464
line 852
;852:			if (trap_LAN_GetServerCount(g_servertype) < 0) {
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
GEI4 $459
line 854
;853:				// still waiting for response
;854:				return;
ADDRGP4 $457
JUMPV
line 856
;855:			}
;856:		}
line 857
;857:	} else if (g_servertype == AS_LOCAL) {
LABELV $458
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $470
line 858
;858:		if (!trap_LAN_GetServerCount(AS_LOCAL)) {
CNSTI4 0
ARGI4
ADDRLP4 1104
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $472
line 860
;859:			// no local servers found, check again
;860:			trap_Cmd_ExecuteText(EXEC_APPEND, "localservers\n");
CNSTI4 2
ARGI4
ADDRGP4 $474
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 861
;861:			g_arenaservers.refreshtime = uis.realtime + 5000;
ADDRGP4 g_arenaservers+56644
ADDRGP4 uis+4
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 862
;862:			return;
ADDRGP4 $457
JUMPV
LABELV $472
line 864
;863:		}
;864:	}
LABELV $470
LABELV $459
line 866
;865:
;866:	if (uis.realtime < g_arenaservers.nextpingtime) {
ADDRGP4 uis+4
INDIRI4
ADDRGP4 g_arenaservers+56636
INDIRI4
GEI4 $477
line 868
;867:		// wait for time trigger
;868:		return;
ADDRGP4 $457
JUMPV
LABELV $477
line 872
;869:	}
;870:
;871:	// trigger after REFRESH_DELAY
;872:	g_arenaservers.nextpingtime = uis.realtime + REFRESH_DELAY;
ADDRGP4 g_arenaservers+56636
ADDRGP4 uis+4
INDIRI4
CNSTI4 10
ADDI4
ASGNI4
line 875
;873:
;874:	// process ping results
;875:	maxPing = ArenaServers_MaxPing();
ADDRLP4 1104
ADDRGP4 ArenaServers_MaxPing
CALLI4
ASGNI4
ADDRLP4 76
ADDRLP4 1104
INDIRI4
ASGNI4
line 876
;876:	for (i = 0; i < MAX_PINGREQUESTS; i++) {
ADDRLP4 68
CNSTI4 0
ASGNI4
LABELV $483
line 877
;877:		trap_LAN_GetPing(i, adrstr, MAX_ADDRESSLENGTH, &time);
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 72
ARGP4
ADDRGP4 trap_LAN_GetPing
CALLV
pop
line 878
;878:		if (!adrstr[0]) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $487
line 880
;879:			// ignore empty or pending pings
;880:			continue;
ADDRGP4 $484
JUMPV
LABELV $487
line 884
;881:		}
;882:
;883:		// find ping result in our local list
;884:		for (j = 0; j < MAX_PINGLISTSIZE; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $489
line 885
;885:			if (!Q_stricmp(adrstr, g_arenaservers.pinglist[j].adrstr))
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344
ADDP4
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $493
line 886
;886:				break;
ADDRGP4 $491
JUMPV
LABELV $493
LABELV $490
line 884
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $489
LABELV $491
line 888
;887:
;888:		if (j < MAX_PINGLISTSIZE) {
ADDRLP4 0
INDIRI4
CNSTI4 256
GEI4 $496
line 890
;889:			// found it
;890:			if (!time) {
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $498
line 891
;891:				time = uis.realtime - g_arenaservers.pinglist[j].start;
ADDRLP4 72
ADDRGP4 uis+4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344+64
ADDP4
INDIRI4
SUBI4
ASGNI4
line 892
;892:				if (time < maxPing) {
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $503
line 894
;893:					// still waiting
;894:					continue;
ADDRGP4 $484
JUMPV
LABELV $503
line 896
;895:				}
;896:			}
LABELV $498
line 898
;897:
;898:			if (time > maxPing) {
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
LEI4 $505
line 900
;899:				// stale it out
;900:				info[0] = '\0';
ADDRLP4 80
CNSTI1 0
ASGNI1
line 901
;901:				time    = maxPing;
ADDRLP4 72
ADDRLP4 76
INDIRI4
ASGNI4
line 904
;902:
;903:				// set hostname for nonresponsive favorite server
;904:				if (g_servertype == AS_LOCAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $506
line 905
;905:					Info_SetValueForKey(info, "hostname", adrstr);
ADDRLP4 80
ARGP4
ADDRGP4 $397
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 906
;906:					Info_SetValueForKey(info, "game", "???");
ADDRLP4 80
ARGP4
ADDRGP4 $373
ARGP4
ADDRGP4 $81
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 907
;907:				}
line 908
;908:			} else {
ADDRGP4 $506
JUMPV
LABELV $505
line 909
;909:				trap_LAN_GetPingInfo(i, info, MAX_INFO_STRING);
ADDRLP4 68
INDIRI4
ARGI4
ADDRLP4 80
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_LAN_GetPingInfo
CALLV
pop
line 910
;910:			}
LABELV $506
line 913
;911:
;912:			// insert ping results
;913:			if (time < maxPing && *g_arenaservers.numservers < MAX_LISTBOXITEMS) {
ADDRLP4 72
INDIRI4
ADDRLP4 76
INDIRI4
GEI4 $509
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
CNSTI4 512
GEI4 $509
line 914
;914:				ArenaServers_Insert(adrstr, info, time);
ADDRLP4 4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Insert
CALLV
pop
line 915
;915:			}
LABELV $509
line 918
;916:
;917:			// clear this query from internal list
;918:			g_arenaservers.pinglist[j].adrstr[0] = '\0';
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344
ADDP4
CNSTI1 0
ASGNI1
line 919
;919:		}
LABELV $496
line 922
;920:
;921:		// clear this query from external list
;922:		trap_LAN_ClearPing(i);
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
line 923
;923:	}
LABELV $484
line 876
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 32
LTI4 $483
line 927
;924:
;925:	// get results of servers query
;926:	// counts can increase as servers respond
;927:	if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $513
line 928
;928:		g_arenaservers.numqueriedservers = g_arenaservers.numfavoriteaddresses;
ADDRGP4 g_arenaservers+56616
ADDRGP4 g_arenaservers+57672
INDIRI4
ASGNI4
line 929
;929:	} else {
ADDRGP4 $514
JUMPV
LABELV $513
line 930
;930:		g_arenaservers.numqueriedservers = trap_LAN_GetServerCount(g_servertype);
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRLP4 1108
ADDRGP4 trap_LAN_GetServerCount
CALLI4
ASGNI4
ADDRGP4 g_arenaservers+56616
ADDRLP4 1108
INDIRI4
ASGNI4
line 931
;931:	}
LABELV $514
line 939
;932:
;933:	//	if (g_arenaservers.numqueriedservers > g_arenaservers.maxservers)
;934:	//		g_arenaservers.numqueriedservers = g_arenaservers.maxservers;
;935:
;936:	// send ping requests in reasonable bursts
;937:	// iterate ping through all found servers
;938:
;939:	for (i = 0; i < MAX_PINGLISTSIZE && g_arenaservers.currentping < g_arenaservers.numqueriedservers; i++) {
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $521
JUMPV
LABELV $518
line 940
;940:		if (trap_LAN_GetPingQueueCount() >= MAX_PINGREQUESTS) {
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 32
LTI4 $524
line 942
;941:			// ping queue is full
;942:			break;
ADDRGP4 $520
JUMPV
LABELV $524
line 946
;943:		}
;944:
;945:		// find empty slot
;946:		for (j = 0; j < MAX_PINGLISTSIZE; j++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $526
line 947
;947:			if (!g_arenaservers.pinglist[j].adrstr[0]) {
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $530
line 948
;948:				break;
ADDRGP4 $528
JUMPV
LABELV $530
LABELV $527
line 946
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $526
LABELV $528
line 951
;949:			}
;950:
;951:		if (j >= MAX_PINGLISTSIZE) {
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $533
line 956
;952:			// no empty slots available yet - wait for timeout
;953:#ifdef _DEBUG
;954:			Com_Printf(S_COLOR_YELLOW "no empty slots in ping list\n");
;955:#endif
;956:			break;
ADDRGP4 $520
JUMPV
LABELV $533
line 961
;957:		}
;958:
;959:		// get an address to ping
;960:
;961:		if (g_servertype == AS_FAVORITES) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $535
line 962
;962:			strcpy(adrstr, g_arenaservers.favoriteaddresses[g_arenaservers.currentping]);
ADDRLP4 4
ARGP4
ADDRGP4 g_arenaservers+56628
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+56648
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 963
;963:		} else {
ADDRGP4 $536
JUMPV
LABELV $535
line 964
;964:			trap_LAN_GetServerAddressString(g_servertype, g_arenaservers.currentping, adrstr, MAX_ADDRESSLENGTH);
ADDRGP4 g_servertype
INDIRI4
ARGI4
ADDRGP4 g_arenaservers+56628
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_LAN_GetServerAddressString
CALLV
pop
line 965
;965:		}
LABELV $536
line 967
;966:
;967:		strcpy(g_arenaservers.pinglist[j].adrstr, adrstr);
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 968
;968:		g_arenaservers.pinglist[j].start = uis.realtime;
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344+64
ADDP4
ADDRGP4 uis+4
INDIRI4
ASGNI4
line 970
;969:
;970:		trap_Cmd_ExecuteText(EXEC_NOW, va("ping %s\n", adrstr));
ADDRGP4 $544
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1112
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 973
;971:
;972:		// advance to next server
;973:		g_arenaservers.currentping++;
ADDRLP4 1116
ADDRGP4 g_arenaservers+56628
ASGNP4
ADDRLP4 1116
INDIRP4
ADDRLP4 1116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 974
;974:	}
LABELV $519
line 939
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $521
ADDRLP4 68
INDIRI4
CNSTI4 256
GEI4 $546
ADDRGP4 g_arenaservers+56628
INDIRI4
ADDRGP4 g_arenaservers+56616
INDIRI4
LTI4 $518
LABELV $546
LABELV $520
line 976
;975:
;976:	if (!trap_LAN_GetPingQueueCount()) {
ADDRLP4 1108
ADDRGP4 trap_LAN_GetPingQueueCount
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $547
line 978
;977:		// all pings completed
;978:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 979
;979:		return;
ADDRGP4 $457
JUMPV
LABELV $547
line 983
;980:	}
;981:
;982:	// update the user interface with ping status
;983:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 984
;984:}
LABELV $457
endproc ArenaServers_DoRefresh 1120 16
proc ArenaServers_StartRefresh 68 12
line 991
;985:
;986:/*
;987:=================
;988:ArenaServers_StartRefresh
;989:=================
;990:*/
;991:static void ArenaServers_StartRefresh(void) {
line 995
;992:	int  i;
;993:	char myargs[32], protocol[24];
;994:
;995:	memset(g_arenaservers.serverlist, 0, g_arenaservers.maxservers * sizeof(table_t));
ADDRGP4 g_arenaservers+56624
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 g_arenaservers+56640
INDIRI4
CVIU4 4
CNSTU4 68
MULU4
CVUI4 4
ARGI4
ADDRGP4 memset
CALLP4
pop
line 997
;996:
;997:	for (i = 0; i < MAX_PINGLISTSIZE; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $552
line 998
;998:		g_arenaservers.pinglist[i].adrstr[0] = '\0';
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+2344
ADDP4
CNSTI1 0
ASGNI1
LABELV $553
line 997
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $552
line 1000
;999:
;1000:	for (i = 0; i < MAX_PINGREQUESTS; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $557
line 1001
;1001:		trap_LAN_ClearPing(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_LAN_ClearPing
CALLV
pop
LABELV $558
line 1000
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $557
line 1003
;1002:
;1003:	g_arenaservers.refreshservers    = qtrue;
ADDRGP4 g_arenaservers+56632
CNSTI4 1
ASGNI4
line 1004
;1004:	g_arenaservers.currentping       = 0;
ADDRGP4 g_arenaservers+56628
CNSTI4 0
ASGNI4
line 1005
;1005:	g_arenaservers.nextpingtime      = 0;
ADDRGP4 g_arenaservers+56636
CNSTI4 0
ASGNI4
line 1006
;1006:	*g_arenaservers.numservers       = 0;
ADDRGP4 g_arenaservers+56620
INDIRP4
CNSTI4 0
ASGNI4
line 1007
;1007:	g_arenaservers.numqueriedservers = 0;
ADDRGP4 g_arenaservers+56616
CNSTI4 0
ASGNI4
line 1010
;1008:
;1009:	// allow max 10 seconds for responses
;1010:	g_arenaservers.refreshtime = uis.realtime + MAX_RESPONSE_TIME;
ADDRGP4 g_arenaservers+56644
ADDRGP4 uis+4
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 1013
;1011:
;1012:	// place menu in zeroed state
;1013:	ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1015
;1014:
;1015:	if (g_servertype == AS_LOCAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 0
NEI4 $568
line 1016
;1016:		trap_Cmd_ExecuteText(EXEC_APPEND, "localservers\n");
CNSTI4 2
ARGI4
ADDRGP4 $474
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1017
;1017:		return;
ADDRGP4 $549
JUMPV
LABELV $568
line 1020
;1018:	}
;1019:
;1020:	if (g_servertype == AS_GLOBAL) {
ADDRGP4 g_servertype
INDIRI4
CNSTI4 2
NEI4 $570
line 1022
;1021:#if 1
;1022:		myargs[0] = '\0';
ADDRLP4 28
CNSTI1 0
ASGNI1
line 1049
;1023:#else
;1024:		switch (g_arenaservers.gametype.curvalue) {
;1025:		default:
;1026:		case GAMES_ALL:
;1027:			myargs[0] = 0;
;1028:			break;
;1029:
;1030:		case GAMES_FFA:
;1031:			strcpy(myargs, " ffa");
;1032:			break;
;1033:
;1034:		case GAMES_TEAMPLAY:
;1035:			strcpy(myargs, " team");
;1036:			break;
;1037:
;1038:		case GAMES_TOURNEY:
;1039:			strcpy(myargs, " tourney");
;1040:			break;
;1041:
;1042:		case GAMES_CTF:
;1043:			strcpy(myargs, " ctf");
;1044:			break;
;1045:		}
;1046:#endif
;1047:
;1048:		// if ( g_emptyservers ) {
;1049:		strcat(myargs, " empty");
ADDRLP4 28
ARGP4
ADDRGP4 $572
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1053
;1050:		//}
;1051:
;1052:		// if ( g_fullservers ) {
;1053:		strcat(myargs, " full");
ADDRLP4 28
ARGP4
ADDRGP4 $573
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 1056
;1054:		//}
;1055:
;1056:		protocol[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1057
;1057:		trap_Cvar_VariableStringBuffer("debug_protocol", protocol, sizeof(protocol));
ADDRGP4 $574
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 24
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1058
;1058:		if (protocol[0]) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $575
line 1059
;1059:			trap_Cmd_ExecuteText(EXEC_APPEND, va("globalservers 0 %s%s\n", protocol, myargs));
ADDRGP4 $577
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 60
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1060
;1060:		} else {
ADDRGP4 $576
JUMPV
LABELV $575
line 1061
;1061:			trap_Cmd_ExecuteText(EXEC_APPEND, va("globalservers 0 %d%s\n", (int)trap_Cvar_VariableValue("protocol"), myargs));
ADDRGP4 $579
ARGP4
ADDRLP4 60
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRGP4 $578
ARGP4
ADDRLP4 60
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 28
ARGP4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 64
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 1062
;1062:		}
LABELV $576
line 1063
;1063:	}
LABELV $570
line 1064
;1064:}
LABELV $549
endproc ArenaServers_StartRefresh 68 12
export ArenaServers_SaveChanges
proc ArenaServers_SaveChanges 12 8
line 1071
;1065:
;1066:/*
;1067:=================
;1068:ArenaServers_SaveChanges
;1069:=================
;1070:*/
;1071:void ArenaServers_SaveChanges(void) {
line 1074
;1072:	int i;
;1073:
;1074:	for (i = 0; i < g_arenaservers.numfavoriteaddresses; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $584
JUMPV
LABELV $581
line 1075
;1075:		trap_Cvar_Set(va("server%d", i + 1), g_arenaservers.favoriteaddresses[i]);
ADDRGP4 $424
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 g_arenaservers+56648
ADDP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $582
line 1074
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $584
ADDRLP4 0
INDIRI4
ADDRGP4 g_arenaservers+57672
INDIRI4
LTI4 $581
line 1077
;1076:
;1077:	for (; i < MAX_FAVORITESERVERS; i++)
ADDRGP4 $590
JUMPV
LABELV $587
line 1078
;1078:		trap_Cvar_Set(va("server%d", i + 1), "");
ADDRGP4 $424
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $261
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
LABELV $588
line 1077
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $590
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $587
line 1079
;1079:}
LABELV $580
endproc ArenaServers_SaveChanges 12 8
export ArenaServers_Sort
proc ArenaServers_Sort 0 16
line 1086
;1080:
;1081:/*
;1082:=================
;1083:ArenaServers_Sort
;1084:=================
;1085:*/
;1086:void ArenaServers_Sort(int type) {
line 1087
;1087:	if (g_sortkey == type) {
ADDRGP4 g_sortkey
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $592
line 1088
;1088:		return;
ADDRGP4 $591
JUMPV
LABELV $592
line 1091
;1089:	}
;1090:
;1091:	g_sortkey = type;
ADDRGP4 g_sortkey
ADDRFP4 0
INDIRI4
ASGNI4
line 1092
;1092:	qsort(g_arenaservers.serverlist, *g_arenaservers.numservers, sizeof(servernode_t), ArenaServers_Compare);
ADDRGP4 g_arenaservers+56624
INDIRP4
ARGP4
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ARGI4
CNSTI4 144
ARGI4
ADDRGP4 ArenaServers_Compare
ARGP4
ADDRGP4 qsort
CALLV
pop
line 1093
;1093:}
LABELV $591
endproc ArenaServers_Sort 0 16
export ArenaServers_SetType
proc ArenaServers_SetType 16 8
line 1100
;1094:
;1095:/*
;1096:=================
;1097:ArenaServers_SetType
;1098:=================
;1099:*/
;1100:void ArenaServers_SetType(int type) {
line 1101
;1101:	if (g_servertype == type)
ADDRGP4 g_servertype
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $597
line 1102
;1102:		return;
ADDRGP4 $596
JUMPV
LABELV $597
line 1104
;1103:
;1104:	ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1106
;1105:
;1106:	g_servertype = type;
ADDRGP4 g_servertype
ADDRFP4 0
INDIRI4
ASGNI4
line 1108
;1107:
;1108:	switch (type) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $599
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $599
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $619
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $619
address $601
address $607
address $607
address $613
code
LABELV $599
LABELV $601
line 1111
;1109:	default:
;1110:	case AS_LOCAL:
;1111:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE | QMF_HIDDEN);
ADDRLP4 4
ADDRGP4 g_arenaservers+1452+44
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1112
;1112:		g_arenaservers.serverlist = g_localserverlist;
ADDRGP4 g_arenaservers+56624
ADDRGP4 g_localserverlist
ASGNP4
line 1113
;1113:		g_arenaservers.numservers = &g_numlocalservers;
ADDRGP4 g_arenaservers+56620
ADDRGP4 g_numlocalservers
ASGNP4
line 1114
;1114:		g_arenaservers.maxservers = MAX_LOCALSERVERS;
ADDRGP4 g_arenaservers+56640
CNSTI4 512
ASGNI4
line 1115
;1115:		break;
ADDRGP4 $600
JUMPV
LABELV $607
line 1119
;1116:
;1117:	case AS_GLOBAL:
;1118:	case AS_MPLAYER:
;1119:		g_arenaservers.remove.generic.flags |= (QMF_INACTIVE | QMF_HIDDEN);
ADDRLP4 8
ADDRGP4 g_arenaservers+1452+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 1120
;1120:		g_arenaservers.serverlist = g_globalserverlist;
ADDRGP4 g_arenaservers+56624
ADDRGP4 g_globalserverlist
ASGNP4
line 1121
;1121:		g_arenaservers.numservers = &g_numglobalservers;
ADDRGP4 g_arenaservers+56620
ADDRGP4 g_numglobalservers
ASGNP4
line 1122
;1122:		g_arenaservers.maxservers = MAX_GLOBALSERVERS;
ADDRGP4 g_arenaservers+56640
CNSTI4 3072
ASGNI4
line 1123
;1123:		break;
ADDRGP4 $600
JUMPV
LABELV $613
line 1126
;1124:
;1125:	case AS_FAVORITES:
;1126:		g_arenaservers.remove.generic.flags &= ~(QMF_INACTIVE | QMF_HIDDEN);
ADDRLP4 12
ADDRGP4 g_arenaservers+1452+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 1127
;1127:		g_arenaservers.serverlist = g_favoriteserverlist;
ADDRGP4 g_arenaservers+56624
ADDRGP4 g_favoriteserverlist
ASGNP4
line 1128
;1128:		g_arenaservers.numservers = &g_numfavoriteservers;
ADDRGP4 g_arenaservers+56620
ADDRGP4 g_numfavoriteservers
ASGNP4
line 1129
;1129:		g_arenaservers.maxservers = MAX_FAVORITESERVERS;
ADDRGP4 g_arenaservers+56640
CNSTI4 16
ASGNI4
line 1130
;1130:		break;
LABELV $600
line 1133
;1131:	}
;1132:
;1133:	if (!*g_arenaservers.numservers) {
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
CNSTI4 0
NEI4 $620
line 1134
;1134:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1135
;1135:	} else {
ADDRGP4 $621
JUMPV
LABELV $620
line 1137
;1136:		// avoid slow operation, use existing results
;1137:		g_arenaservers.currentping       = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+56628
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ASGNI4
line 1138
;1138:		g_arenaservers.numqueriedservers = *g_arenaservers.numservers;
ADDRGP4 g_arenaservers+56616
ADDRGP4 g_arenaservers+56620
INDIRP4
INDIRI4
ASGNI4
line 1139
;1139:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1140
;1140:	}
LABELV $621
line 1141
;1141:	strcpy(g_arenaservers.status.string, "hit refresh to update");
ADDRGP4 g_arenaservers+1300+64
INDIRP4
ARGP4
ADDRGP4 $629
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1142
;1142:}
LABELV $596
endproc ArenaServers_SetType 16 8
proc ArenaServers_Event 16 8
line 1149
;1143:
;1144:/*
;1145:=================
;1146:ArenaServers_Event
;1147:=================
;1148:*/
;1149:static void ArenaServers_Event(void* ptr, int event) {
line 1153
;1150:	int id;
;1151:	int value;
;1152:
;1153:	id = ((menucommon_s*)ptr)->id;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 1155
;1154:
;1155:	if (event != QM_ACTIVATED && id != ID_LIST && id != ID_SHOW_EMPTY && id != ID_SHOW_FULL) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $631
ADDRLP4 0
INDIRI4
CNSTI4 15
EQI4 $631
ADDRLP4 0
INDIRI4
CNSTI4 14
EQI4 $631
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $631
line 1156
;1156:		return;
ADDRGP4 $630
JUMPV
LABELV $631
line 1159
;1157:	}
;1158:
;1159:	switch (id) {
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $633
ADDRLP4 0
INDIRI4
CNSTI4 23
GTI4 $633
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $694-40
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $694
address $635
address $641
address $651
address $661
address $671
address $681
address $684
address $686
address $688
address $689
address $690
address $691
address $692
address $693
code
LABELV $635
line 1161
;1160:	case ID_MASTER:
;1161:		value = g_arenaservers.master.curvalue;
ADDRLP4 4
ADDRGP4 g_arenaservers+364+68
INDIRI4
ASGNI4
line 1162
;1162:		if (value >= 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $638
line 1163
;1163:			value++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1164
;1164:		}
LABELV $638
line 1165
;1165:		trap_Cvar_SetValue("ui_browserMaster", value);
ADDRGP4 $640
ARGP4
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1166
;1166:		ArenaServers_SetType(value);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1167
;1167:		break;
ADDRGP4 $634
JUMPV
LABELV $641
line 1170
;1168:
;1169:	case ID_GAMETYPE:
;1170:		trap_Cvar_SetValue("ui_browserGameType", g_arenaservers.gametype.curvalue);
ADDRGP4 $642
ARGP4
ADDRGP4 g_arenaservers+472+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1171
;1171:		if (g_gametype != g_arenaservers.gametype.curvalue) {
ADDRGP4 g_gametype
INDIRI4
ADDRGP4 g_arenaservers+472+68
INDIRI4
EQI4 $634
line 1172
;1172:			g_gametype = g_arenaservers.gametype.curvalue;
ADDRGP4 g_gametype
ADDRGP4 g_arenaservers+472+68
INDIRI4
ASGNI4
line 1173
;1173:			ArenaServers_UpdateList();
ADDRGP4 ArenaServers_UpdateList
CALLV
pop
line 1174
;1174:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1175
;1175:		}
line 1176
;1176:		break;
ADDRGP4 $634
JUMPV
LABELV $651
line 1179
;1177:
;1178:	case ID_SORTKEY:
;1179:		trap_Cvar_SetValue("ui_browserSortKey", g_arenaservers.sortkey.curvalue);
ADDRGP4 $652
ARGP4
ADDRGP4 g_arenaservers+580+68
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1180
;1180:		if (g_sortkey != g_arenaservers.sortkey.curvalue) {
ADDRGP4 g_sortkey
INDIRI4
ADDRGP4 g_arenaservers+580+68
INDIRI4
EQI4 $634
line 1181
;1181:			ArenaServers_Sort(g_arenaservers.sortkey.curvalue);
ADDRGP4 g_arenaservers+580+68
INDIRI4
ARGI4
ADDRGP4 ArenaServers_Sort
CALLV
pop
line 1182
;1182:			ArenaServers_UpdateList();
ADDRGP4 ArenaServers_UpdateList
CALLV
pop
line 1183
;1183:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1184
;1184:		}
line 1185
;1185:		break;
ADDRGP4 $634
JUMPV
LABELV $661
line 1188
;1186:
;1187:	case ID_SHOW_FULL:
;1188:		trap_Cvar_SetValue("ui_browserShowFull", g_arenaservers.showfull.curvalue);
ADDRGP4 $662
ARGP4
ADDRGP4 g_arenaservers+688+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1189
;1189:		if (g_fullservers != g_arenaservers.showfull.curvalue) {
ADDRGP4 g_fullservers
INDIRI4
ADDRGP4 g_arenaservers+688+64
INDIRI4
EQI4 $634
line 1190
;1190:			g_fullservers = g_arenaservers.showfull.curvalue;
ADDRGP4 g_fullservers
ADDRGP4 g_arenaservers+688+64
INDIRI4
ASGNI4
line 1191
;1191:			ArenaServers_UpdateList();
ADDRGP4 ArenaServers_UpdateList
CALLV
pop
line 1192
;1192:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1193
;1193:		}
line 1194
;1194:		break;
ADDRGP4 $634
JUMPV
LABELV $671
line 1197
;1195:
;1196:	case ID_SHOW_EMPTY:
;1197:		trap_Cvar_SetValue("ui_browserShowEmpty", g_arenaservers.showempty.curvalue);
ADDRGP4 $672
ARGP4
ADDRGP4 g_arenaservers+756+64
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 1198
;1198:		if (g_emptyservers != g_arenaservers.showempty.curvalue) {
ADDRGP4 g_emptyservers
INDIRI4
ADDRGP4 g_arenaservers+756+64
INDIRI4
EQI4 $634
line 1199
;1199:			g_emptyservers = g_arenaservers.showempty.curvalue;
ADDRGP4 g_emptyservers
ADDRGP4 g_arenaservers+756+64
INDIRI4
ASGNI4
line 1200
;1200:			ArenaServers_UpdateList();
ADDRGP4 ArenaServers_UpdateList
CALLV
pop
line 1201
;1201:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1202
;1202:		}
line 1203
;1203:		break;
ADDRGP4 $634
JUMPV
LABELV $681
line 1206
;1204:
;1205:	case ID_LIST:
;1206:		if (event == QM_GOTFOCUS) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $634
line 1207
;1207:			ArenaServers_UpdatePicture();
ADDRGP4 ArenaServers_UpdatePicture
CALLV
pop
line 1208
;1208:		}
line 1209
;1209:		break;
ADDRGP4 $634
JUMPV
LABELV $684
line 1212
;1210:
;1211:	case ID_SCROLL_UP:
;1212:		ScrollList_Key(&g_arenaservers.list, K_UPARROW);
ADDRGP4 g_arenaservers+824
ARGP4
CNSTI4 132
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1213
;1213:		break;
ADDRGP4 $634
JUMPV
LABELV $686
line 1216
;1214:
;1215:	case ID_SCROLL_DOWN:
;1216:		ScrollList_Key(&g_arenaservers.list, K_DOWNARROW);
ADDRGP4 g_arenaservers+824
ARGP4
CNSTI4 133
ARGI4
ADDRGP4 ScrollList_Key
CALLI4
pop
line 1217
;1217:		break;
ADDRGP4 $634
JUMPV
LABELV $688
line 1220
;1218:
;1219:	case ID_BACK:
;1220:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1221
;1221:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1222
;1222:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 1223
;1223:		break;
ADDRGP4 $634
JUMPV
LABELV $689
line 1226
;1224:
;1225:	case ID_REFRESH:
;1226:		ArenaServers_StartRefresh();
ADDRGP4 ArenaServers_StartRefresh
CALLV
pop
line 1227
;1227:		break;
ADDRGP4 $634
JUMPV
LABELV $690
line 1230
;1228:
;1229:	case ID_SPECIFY:
;1230:		UI_SpecifyServerMenu();
ADDRGP4 UI_SpecifyServerMenu
CALLV
pop
line 1231
;1231:		break;
ADDRGP4 $634
JUMPV
LABELV $691
line 1234
;1232:
;1233:	case ID_CREATE:
;1234:		UI_StartServerMenu(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 1235
;1235:		break;
ADDRGP4 $634
JUMPV
LABELV $692
line 1238
;1236:
;1237:	case ID_CONNECT:
;1238:		ArenaServers_Go();
ADDRGP4 ArenaServers_Go
CALLV
pop
line 1239
;1239:		break;
ADDRGP4 $634
JUMPV
LABELV $693
line 1242
;1240:
;1241:	case ID_REMOVE:
;1242:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1243
;1243:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1244
;1244:		break;
LABELV $633
LABELV $634
line 1246
;1245:	}
;1246:}
LABELV $630
endproc ArenaServers_Event 16 8
proc ArenaServers_MenuDraw 0 4
line 1253
;1247:
;1248:/*
;1249:=================
;1250:ArenaServers_MenuDraw
;1251:=================
;1252:*/
;1253:static void ArenaServers_MenuDraw(void) {
line 1254
;1254:	if (g_arenaservers.refreshservers)
ADDRGP4 g_arenaservers+56632
INDIRI4
CNSTI4 0
EQI4 $697
line 1255
;1255:		ArenaServers_DoRefresh();
ADDRGP4 ArenaServers_DoRefresh
CALLV
pop
LABELV $697
line 1257
;1256:
;1257:	Menu_Draw(&g_arenaservers.menu);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 1258
;1258:}
LABELV $696
endproc ArenaServers_MenuDraw 0 4
proc ArenaServers_MenuKey 20 8
line 1265
;1259:
;1260:/*
;1261:=================
;1262:ArenaServers_MenuKey
;1263:=================
;1264:*/
;1265:static sfxHandle_t ArenaServers_MenuKey(int key) {
line 1266
;1266:	if (key == K_SPACE && g_arenaservers.refreshservers) {
ADDRFP4 0
INDIRI4
CNSTI4 32
NEI4 $701
ADDRGP4 g_arenaservers+56632
INDIRI4
CNSTI4 0
EQI4 $701
line 1267
;1267:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1268
;1268:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $700
JUMPV
LABELV $701
line 1271
;1269:	}
;1270:
;1271:	if ((key == K_DEL || key == K_KP_DEL) && (g_servertype == AS_FAVORITES) && (Menu_ItemAtCursor(&g_arenaservers.menu) == &g_arenaservers.list)) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 140
EQI4 $707
ADDRLP4 0
INDIRI4
CNSTI4 171
NEI4 $704
LABELV $707
ADDRGP4 g_servertype
INDIRI4
CNSTI4 3
NEI4 $704
ADDRGP4 g_arenaservers
ARGP4
ADDRLP4 4
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRGP4 g_arenaservers+824
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $704
line 1272
;1272:		ArenaServers_Remove();
ADDRGP4 ArenaServers_Remove
CALLV
pop
line 1273
;1273:		ArenaServers_UpdateMenu();
ADDRGP4 ArenaServers_UpdateMenu
CALLV
pop
line 1274
;1274:		return menu_move_sound;
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $700
JUMPV
LABELV $704
line 1277
;1275:	}
;1276:
;1277:	if (key == K_MOUSE2 || key == K_ESCAPE) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 179
EQI4 $710
ADDRLP4 8
INDIRI4
CNSTI4 27
NEI4 $708
LABELV $710
line 1278
;1278:		ArenaServers_StopRefresh();
ADDRGP4 ArenaServers_StopRefresh
CALLV
pop
line 1279
;1279:		ArenaServers_SaveChanges();
ADDRGP4 ArenaServers_SaveChanges
CALLV
pop
line 1280
;1280:	}
LABELV $708
line 1282
;1281:
;1282:	if (key == '/' && Menu_ItemAtCursor(&g_arenaservers.menu) == (menucommon_s*)&g_arenaservers.list) {
ADDRFP4 0
INDIRI4
CNSTI4 47
NEI4 $711
ADDRGP4 g_arenaservers
ARGP4
ADDRLP4 12
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRGP4 g_arenaservers+824
CVPU4 4
ADDRLP4 12
INDIRP4
CVPU4 4
NEU4 $711
line 1283
;1283:		Menu_SetCursorToItem((menuframework_s*)&g_arenaservers, &g_arenaservers.filter);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2004
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 1284
;1284:		g_arenaservers.filter.field.skipKey = qtrue;
ADDRGP4 g_arenaservers+2004+64+272
CNSTI4 1
ASGNI4
line 1285
;1285:		return menu_in_sound;
ADDRGP4 menu_in_sound
INDIRI4
RETI4
ADDRGP4 $700
JUMPV
LABELV $711
line 1288
;1286:	}
;1287:
;1288:	return Menu_DefaultKey(&g_arenaservers.menu, key);
ADDRGP4 g_arenaservers
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
LABELV $700
endproc ArenaServers_MenuKey 20 8
bss
align 1
LABELV $719
skip 64
code
proc ArenaServers_MenuInit 36 16
line 1296
;1289:}
;1290:
;1291:/*
;1292:=================
;1293:ArenaServers_MenuInit
;1294:=================
;1295:*/
;1296:static void ArenaServers_MenuInit(void) {
line 1304
;1297:	int         i;
;1298:	int         type;
;1299:	int         y;
;1300:	int         value;
;1301:	static char statusbuffer[MAX_STATUSLENGTH];
;1302:
;1303:	// zero set all our globals
;1304:	memset(&g_arenaservers, 0, sizeof(arenaservers_t));
ADDRGP4 g_arenaservers
ARGP4
CNSTI4 0
ARGI4
CNSTI4 57932
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1306
;1305:
;1306:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 1308
;1307:
;1308:	g_arenaservers.menu.fullscreen = qtrue;
ADDRGP4 g_arenaservers+280
CNSTI4 1
ASGNI4
line 1309
;1309:	g_arenaservers.menu.wrapAround = qtrue;
ADDRGP4 g_arenaservers+276
CNSTI4 1
ASGNI4
line 1310
;1310:	g_arenaservers.menu.draw       = ArenaServers_MenuDraw;
ADDRGP4 g_arenaservers+268
ADDRGP4 ArenaServers_MenuDraw
ASGNP4
line 1311
;1311:	g_arenaservers.menu.key        = ArenaServers_MenuKey;
ADDRGP4 g_arenaservers+272
ADDRGP4 ArenaServers_MenuKey
ASGNP4
line 1313
;1312:
;1313:	g_arenaservers.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 g_arenaservers+288
CNSTI4 10
ASGNI4
line 1314
;1314:	g_arenaservers.banner.generic.flags = QMF_CENTER_JUSTIFY;
ADDRGP4 g_arenaservers+288+44
CNSTU4 8
ASGNU4
line 1315
;1315:	g_arenaservers.banner.generic.x     = 320;
ADDRGP4 g_arenaservers+288+12
CNSTI4 320
ASGNI4
line 1316
;1316:	g_arenaservers.banner.generic.y     = 16;
ADDRGP4 g_arenaservers+288+16
CNSTI4 16
ASGNI4
line 1317
;1317:	g_arenaservers.banner.string        = "ARENA SERVERS";
ADDRGP4 g_arenaservers+288+64
ADDRGP4 $733
ASGNP4
line 1318
;1318:	g_arenaservers.banner.style         = UI_CENTER;
ADDRGP4 g_arenaservers+288+68
CNSTI4 1
ASGNI4
line 1319
;1319:	g_arenaservers.banner.color         = color_white;
ADDRGP4 g_arenaservers+288+72
ADDRGP4 color_white
ASGNP4
line 1321
;1320:
;1321:	y                                      = 80;
ADDRLP4 4
CNSTI4 80
ASGNI4
line 1322
;1322:	g_arenaservers.master.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+364
CNSTI4 3
ASGNI4
line 1323
;1323:	g_arenaservers.master.generic.name     = "Servers:";
ADDRGP4 g_arenaservers+364+4
ADDRGP4 $741
ASGNP4
line 1324
;1324:	g_arenaservers.master.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 g_arenaservers+364+44
CNSTU4 258
ASGNU4
line 1325
;1325:	g_arenaservers.master.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+364+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1326
;1326:	g_arenaservers.master.generic.id       = ID_MASTER;
ADDRGP4 g_arenaservers+364+8
CNSTI4 10
ASGNI4
line 1327
;1327:	g_arenaservers.master.generic.x        = 320;
ADDRGP4 g_arenaservers+364+12
CNSTI4 320
ASGNI4
line 1328
;1328:	g_arenaservers.master.generic.y        = y;
ADDRGP4 g_arenaservers+364+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1329
;1329:	g_arenaservers.master.itemnames        = master_items;
ADDRGP4 g_arenaservers+364+88
ADDRGP4 master_items
ASGNP4
line 1331
;1330:
;1331:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1332
;1332:	g_arenaservers.gametype.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+472
CNSTI4 3
ASGNI4
line 1333
;1333:	g_arenaservers.gametype.generic.name     = "Game Type:";
ADDRGP4 g_arenaservers+472+4
ADDRGP4 $757
ASGNP4
line 1334
;1334:	g_arenaservers.gametype.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 g_arenaservers+472+44
CNSTU4 258
ASGNU4
line 1335
;1335:	g_arenaservers.gametype.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+472+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1336
;1336:	g_arenaservers.gametype.generic.id       = ID_GAMETYPE;
ADDRGP4 g_arenaservers+472+8
CNSTI4 11
ASGNI4
line 1337
;1337:	g_arenaservers.gametype.generic.x        = 320;
ADDRGP4 g_arenaservers+472+12
CNSTI4 320
ASGNI4
line 1338
;1338:	g_arenaservers.gametype.generic.y        = y;
ADDRGP4 g_arenaservers+472+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1339
;1339:	g_arenaservers.gametype.itemnames        = servertype_items;
ADDRGP4 g_arenaservers+472+88
ADDRGP4 servertype_items
ASGNP4
line 1341
;1340:
;1341:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1342
;1342:	g_arenaservers.sortkey.generic.type     = MTYPE_SPINCONTROL;
ADDRGP4 g_arenaservers+580
CNSTI4 3
ASGNI4
line 1343
;1343:	g_arenaservers.sortkey.generic.name     = "Sort By:";
ADDRGP4 g_arenaservers+580+4
ADDRGP4 $773
ASGNP4
line 1344
;1344:	g_arenaservers.sortkey.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 g_arenaservers+580+44
CNSTU4 258
ASGNU4
line 1345
;1345:	g_arenaservers.sortkey.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+580+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1346
;1346:	g_arenaservers.sortkey.generic.id       = ID_SORTKEY;
ADDRGP4 g_arenaservers+580+8
CNSTI4 12
ASGNI4
line 1347
;1347:	g_arenaservers.sortkey.generic.x        = 320;
ADDRGP4 g_arenaservers+580+12
CNSTI4 320
ASGNI4
line 1348
;1348:	g_arenaservers.sortkey.generic.y        = y;
ADDRGP4 g_arenaservers+580+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1349
;1349:	g_arenaservers.sortkey.itemnames        = sortkey_items;
ADDRGP4 g_arenaservers+580+88
ADDRGP4 sortkey_items
ASGNP4
line 1351
;1350:
;1351:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1352
;1352:	g_arenaservers.showfull.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+688
CNSTI4 5
ASGNI4
line 1353
;1353:	g_arenaservers.showfull.generic.name     = "Show Full:";
ADDRGP4 g_arenaservers+688+4
ADDRGP4 $789
ASGNP4
line 1354
;1354:	g_arenaservers.showfull.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 g_arenaservers+688+44
CNSTU4 258
ASGNU4
line 1355
;1355:	g_arenaservers.showfull.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+688+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1356
;1356:	g_arenaservers.showfull.generic.id       = ID_SHOW_FULL;
ADDRGP4 g_arenaservers+688+8
CNSTI4 13
ASGNI4
line 1357
;1357:	g_arenaservers.showfull.generic.x        = 320;
ADDRGP4 g_arenaservers+688+12
CNSTI4 320
ASGNI4
line 1358
;1358:	g_arenaservers.showfull.generic.y        = y;
ADDRGP4 g_arenaservers+688+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1360
;1359:
;1360:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1361
;1361:	g_arenaservers.showempty.generic.type     = MTYPE_RADIOBUTTON;
ADDRGP4 g_arenaservers+756
CNSTI4 5
ASGNI4
line 1362
;1362:	g_arenaservers.showempty.generic.name     = "Show Empty:";
ADDRGP4 g_arenaservers+756+4
ADDRGP4 $803
ASGNP4
line 1363
;1363:	g_arenaservers.showempty.generic.flags    = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 g_arenaservers+756+44
CNSTU4 258
ASGNU4
line 1364
;1364:	g_arenaservers.showempty.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+756+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1365
;1365:	g_arenaservers.showempty.generic.id       = ID_SHOW_EMPTY;
ADDRGP4 g_arenaservers+756+8
CNSTI4 14
ASGNI4
line 1366
;1366:	g_arenaservers.showempty.generic.x        = 320;
ADDRGP4 g_arenaservers+756+12
CNSTI4 320
ASGNI4
line 1367
;1367:	g_arenaservers.showempty.generic.y        = y;
ADDRGP4 g_arenaservers+756+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1369
;1368:
;1369:	g_arenaservers.filter.generic.type       = MTYPE_FIELD;
ADDRGP4 g_arenaservers+2004
CNSTI4 4
ASGNI4
line 1370
;1370:	g_arenaservers.filter.generic.flags      = QMF_NODEFAULTINIT;
ADDRGP4 g_arenaservers+2004+44
CNSTU4 32768
ASGNU4
line 1371
;1371:	g_arenaservers.filter.generic.ownerdraw  = ArenaServers_DrawFilter;
ADDRGP4 g_arenaservers+2004+56
ADDRGP4 ArenaServers_DrawFilter
ASGNP4
line 1372
;1372:	g_arenaservers.filter.generic.id         = ID_FILTER;
ADDRGP4 g_arenaservers+2004+8
CNSTI4 24
ASGNI4
line 1373
;1373:	g_arenaservers.filter.field.widthInChars = 36;
ADDRGP4 g_arenaservers+2004+64+8
CNSTI4 36
ASGNI4
line 1374
;1374:	g_arenaservers.filter.field.maxchars     = 36;
ADDRGP4 g_arenaservers+2004+64+268
CNSTI4 36
ASGNI4
line 1375
;1375:	g_arenaservers.filter.generic.x          = 216;
ADDRGP4 g_arenaservers+2004+12
CNSTI4 216
ASGNI4
line 1376
;1376:	g_arenaservers.filter.generic.y          = y + SMALLCHAR_HEIGHT;
ADDRGP4 g_arenaservers+2004+16
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1377
;1377:	g_arenaservers.filter.generic.left       = g_arenaservers.filter.generic.x;
ADDRGP4 g_arenaservers+2004+20
ADDRGP4 g_arenaservers+2004+12
INDIRI4
ASGNI4
line 1378
;1378:	g_arenaservers.filter.generic.right =
ADDRGP4 g_arenaservers+2004+28
ADDRGP4 g_arenaservers+2004+12
INDIRI4
ADDRGP4 g_arenaservers+2004+64+8
INDIRI4
CNSTI4 3
LSHI4
CNSTI4 104
ADDI4
ADDI4
CNSTI4 1
ADDI4
ASGNI4
line 1380
;1379:		g_arenaservers.filter.generic.x + (g_arenaservers.filter.field.widthInChars + FILTER_CAPTION_CHARS) * SMALLCHAR_WIDTH + 1;
;1380:	g_arenaservers.filter.generic.top    = g_arenaservers.filter.generic.y;
ADDRGP4 g_arenaservers+2004+24
ADDRGP4 g_arenaservers+2004+16
INDIRI4
ASGNI4
line 1381
;1381:	g_arenaservers.filter.generic.bottom = g_arenaservers.filter.generic.y + SMALLCHAR_HEIGHT;
ADDRGP4 g_arenaservers+2004+32
ADDRGP4 g_arenaservers+2004+16
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1383
;1382:
;1383:	y += 3 * SMALLCHAR_HEIGHT - 10;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 38
ADDI4
ASGNI4
line 1384
;1384:	g_arenaservers.list.generic.type     = MTYPE_SCROLLLIST;
ADDRGP4 g_arenaservers+824
CNSTI4 8
ASGNI4
line 1385
;1385:	g_arenaservers.list.generic.flags    = QMF_HIGHLIGHT_IF_FOCUS;
ADDRGP4 g_arenaservers+824+44
CNSTU4 128
ASGNU4
line 1386
;1386:	g_arenaservers.list.generic.id       = ID_LIST;
ADDRGP4 g_arenaservers+824+8
CNSTI4 15
ASGNI4
line 1387
;1387:	g_arenaservers.list.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+824+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1388
;1388:	g_arenaservers.list.generic.x        = 72;
ADDRGP4 g_arenaservers+824+12
CNSTI4 72
ASGNI4
line 1389
;1389:	g_arenaservers.list.generic.y        = y;
ADDRGP4 g_arenaservers+824+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1390
;1390:	g_arenaservers.list.width            = MAX_LISTBOXWIDTH;
ADDRGP4 g_arenaservers+824+92
CNSTI4 61
ASGNI4
line 1391
;1391:	g_arenaservers.list.height           = 12;
ADDRGP4 g_arenaservers+824+96
CNSTI4 12
ASGNI4
line 1392
;1392:	g_arenaservers.list.scroll           = 12;
ADDRGP4 g_arenaservers+824+80
CNSTI4 12
ASGNI4
line 1393
;1393:	g_arenaservers.list.generic.dblclick = ArenaServers_Dblclick;
ADDRGP4 g_arenaservers+824+60
ADDRGP4 ArenaServers_Dblclick
ASGNP4
line 1394
;1394:	g_arenaservers.list.itemnames        = (const char**)g_arenaservers.items;
ADDRGP4 g_arenaservers+824+88
ADDRGP4 g_arenaservers+54568
ASGNP4
line 1395
;1395:	for (i = 0; i < MAX_LISTBOXITEMS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $872
line 1396
;1396:		g_arenaservers.items[i] = g_arenaservers.table[i].buff;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 g_arenaservers+54568
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 68
MULI4
ADDRGP4 g_arenaservers+19752
ADDP4
ASGNP4
line 1397
;1397:	}
LABELV $873
line 1395
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 512
LTI4 $872
line 1399
;1398:
;1399:	g_arenaservers.mappic.generic.type  = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+932
CNSTI4 6
ASGNI4
line 1400
;1400:	g_arenaservers.mappic.generic.flags = QMF_LEFT_JUSTIFY | QMF_INACTIVE;
ADDRGP4 g_arenaservers+932+44
CNSTU4 16388
ASGNU4
line 1401
;1401:	g_arenaservers.mappic.generic.x     = 72;
ADDRGP4 g_arenaservers+932+12
CNSTI4 72
ASGNI4
line 1402
;1402:	g_arenaservers.mappic.generic.y     = 80;
ADDRGP4 g_arenaservers+932+16
CNSTI4 80
ASGNI4
line 1403
;1403:	g_arenaservers.mappic.width         = 128;
ADDRGP4 g_arenaservers+932+80
CNSTI4 128
ASGNI4
line 1404
;1404:	g_arenaservers.mappic.height        = 96;
ADDRGP4 g_arenaservers+932+84
CNSTI4 96
ASGNI4
line 1405
;1405:	g_arenaservers.mappic.errorpic      = ART_UNKNOWNMAP;
ADDRGP4 g_arenaservers+932+68
ADDRGP4 $891
ASGNP4
line 1407
;1406:
;1407:	g_arenaservers.arrows.generic.type     = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1024
CNSTI4 6
ASGNI4
line 1408
;1408:	g_arenaservers.arrows.generic.name     = ART_ARROWS0;
ADDRGP4 g_arenaservers+1024+4
ADDRGP4 $895
ASGNP4
line 1409
;1409:	g_arenaservers.arrows.generic.flags    = QMF_LEFT_JUSTIFY | QMF_INACTIVE;
ADDRGP4 g_arenaservers+1024+44
CNSTU4 16388
ASGNU4
line 1410
;1410:	g_arenaservers.arrows.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1024+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1411
;1411:	g_arenaservers.arrows.generic.x        = 512 + 48;
ADDRGP4 g_arenaservers+1024+12
CNSTI4 560
ASGNI4
line 1412
;1412:	g_arenaservers.arrows.generic.y        = 240 - 64 + 32;
ADDRGP4 g_arenaservers+1024+16
CNSTI4 208
ASGNI4
line 1413
;1413:	g_arenaservers.arrows.width            = 64;
ADDRGP4 g_arenaservers+1024+80
CNSTI4 64
ASGNI4
line 1414
;1414:	g_arenaservers.arrows.height           = 128;
ADDRGP4 g_arenaservers+1024+84
CNSTI4 128
ASGNI4
line 1416
;1415:
;1416:	g_arenaservers.up.generic.type     = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1116
CNSTI4 6
ASGNI4
line 1417
;1417:	g_arenaservers.up.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS | QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1116+44
CNSTU4 2308
ASGNU4
line 1418
;1418:	g_arenaservers.up.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1116+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1419
;1419:	g_arenaservers.up.generic.id       = ID_SCROLL_UP;
ADDRGP4 g_arenaservers+1116+8
CNSTI4 16
ASGNI4
line 1420
;1420:	g_arenaservers.up.generic.x        = 512 + 48;
ADDRGP4 g_arenaservers+1116+12
CNSTI4 560
ASGNI4
line 1421
;1421:	g_arenaservers.up.generic.y        = 240 - 64 + 32;
ADDRGP4 g_arenaservers+1116+16
CNSTI4 208
ASGNI4
line 1422
;1422:	g_arenaservers.up.width            = 64;
ADDRGP4 g_arenaservers+1116+80
CNSTI4 64
ASGNI4
line 1423
;1423:	g_arenaservers.up.height           = 64;
ADDRGP4 g_arenaservers+1116+84
CNSTI4 64
ASGNI4
line 1424
;1424:	g_arenaservers.up.focuspic         = ART_ARROWS_UP;
ADDRGP4 g_arenaservers+1116+64
ADDRGP4 $925
ASGNP4
line 1426
;1425:
;1426:	g_arenaservers.down.generic.type     = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1208
CNSTI4 6
ASGNI4
line 1427
;1427:	g_arenaservers.down.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS | QMF_MOUSEONLY;
ADDRGP4 g_arenaservers+1208+44
CNSTU4 2308
ASGNU4
line 1428
;1428:	g_arenaservers.down.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1208+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1429
;1429:	g_arenaservers.down.generic.id       = ID_SCROLL_DOWN;
ADDRGP4 g_arenaservers+1208+8
CNSTI4 17
ASGNI4
line 1430
;1430:	g_arenaservers.down.generic.x        = 512 + 48;
ADDRGP4 g_arenaservers+1208+12
CNSTI4 560
ASGNI4
line 1431
;1431:	g_arenaservers.down.generic.y        = 240 + 32;
ADDRGP4 g_arenaservers+1208+16
CNSTI4 272
ASGNI4
line 1432
;1432:	g_arenaservers.down.width            = 64;
ADDRGP4 g_arenaservers+1208+80
CNSTI4 64
ASGNI4
line 1433
;1433:	g_arenaservers.down.height           = 64;
ADDRGP4 g_arenaservers+1208+84
CNSTI4 64
ASGNI4
line 1434
;1434:	g_arenaservers.down.focuspic         = ART_ARROWS_DOWN;
ADDRGP4 g_arenaservers+1208+64
ADDRGP4 $943
ASGNP4
line 1436
;1435:
;1436:	y                                  = 378;
ADDRLP4 4
CNSTI4 378
ASGNI4
line 1437
;1437:	g_arenaservers.status.generic.type = MTYPE_TEXT;
ADDRGP4 g_arenaservers+1300
CNSTI4 7
ASGNI4
line 1438
;1438:	g_arenaservers.status.generic.x    = 320;
ADDRGP4 g_arenaservers+1300+12
CNSTI4 320
ASGNI4
line 1439
;1439:	g_arenaservers.status.generic.y    = y;
ADDRGP4 g_arenaservers+1300+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1440
;1440:	g_arenaservers.status.string       = statusbuffer;
ADDRGP4 g_arenaservers+1300+64
ADDRGP4 $719
ASGNP4
line 1441
;1441:	g_arenaservers.status.style        = UI_CENTER | UI_SMALLFONT;
ADDRGP4 g_arenaservers+1300+68
CNSTI4 17
ASGNI4
line 1442
;1442:	g_arenaservers.status.color        = menu_text_color;
ADDRGP4 g_arenaservers+1300+72
ADDRGP4 menu_text_color
ASGNP4
line 1444
;1443:
;1444:	y += SMALLCHAR_HEIGHT;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1445
;1445:	g_arenaservers.statusbar.generic.type = MTYPE_TEXT;
ADDRGP4 g_arenaservers+1376
CNSTI4 7
ASGNI4
line 1446
;1446:	g_arenaservers.statusbar.generic.x    = 320;
ADDRGP4 g_arenaservers+1376+12
CNSTI4 320
ASGNI4
line 1447
;1447:	g_arenaservers.statusbar.generic.y    = y;
ADDRGP4 g_arenaservers+1376+16
ADDRLP4 4
INDIRI4
ASGNI4
line 1448
;1448:	g_arenaservers.statusbar.string       = "";
ADDRGP4 g_arenaservers+1376+64
ADDRGP4 $261
ASGNP4
line 1449
;1449:	g_arenaservers.statusbar.style        = UI_CENTER | UI_SMALLFONT;
ADDRGP4 g_arenaservers+1376+68
CNSTI4 17
ASGNI4
line 1450
;1450:	g_arenaservers.statusbar.color        = text_color_normal;
ADDRGP4 g_arenaservers+1376+72
ADDRGP4 text_color_normal
ASGNP4
line 1452
;1451:
;1452:	g_arenaservers.remove.generic.type     = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1452
CNSTI4 6
ASGNI4
line 1453
;1453:	g_arenaservers.remove.generic.name     = ART_REMOVE0;
ADDRGP4 g_arenaservers+1452+4
ADDRGP4 $969
ASGNP4
line 1454
;1454:	g_arenaservers.remove.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1452+44
CNSTU4 260
ASGNU4
line 1455
;1455:	g_arenaservers.remove.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1452+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1456
;1456:	g_arenaservers.remove.generic.id       = ID_REMOVE;
ADDRGP4 g_arenaservers+1452+8
CNSTI4 23
ASGNI4
line 1457
;1457:	g_arenaservers.remove.generic.x        = 450;
ADDRGP4 g_arenaservers+1452+12
CNSTI4 450
ASGNI4
line 1458
;1458:	g_arenaservers.remove.generic.y        = 86;
ADDRGP4 g_arenaservers+1452+16
CNSTI4 86
ASGNI4
line 1459
;1459:	g_arenaservers.remove.width            = 96;
ADDRGP4 g_arenaservers+1452+80
CNSTI4 96
ASGNI4
line 1460
;1460:	g_arenaservers.remove.height           = 48;
ADDRGP4 g_arenaservers+1452+84
CNSTI4 48
ASGNI4
line 1461
;1461:	g_arenaservers.remove.focuspic         = ART_REMOVE1;
ADDRGP4 g_arenaservers+1452+64
ADDRGP4 $986
ASGNP4
line 1463
;1462:
;1463:	g_arenaservers.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1544
CNSTI4 6
ASGNI4
line 1464
;1464:	g_arenaservers.back.generic.name     = ART_BACK0;
ADDRGP4 g_arenaservers+1544+4
ADDRGP4 $990
ASGNP4
line 1465
;1465:	g_arenaservers.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1544+44
CNSTU4 260
ASGNU4
line 1466
;1466:	g_arenaservers.back.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1544+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1467
;1467:	g_arenaservers.back.generic.id       = ID_BACK;
ADDRGP4 g_arenaservers+1544+8
CNSTI4 18
ASGNI4
line 1468
;1468:	g_arenaservers.back.generic.x        = 0;
ADDRGP4 g_arenaservers+1544+12
CNSTI4 0
ASGNI4
line 1469
;1469:	g_arenaservers.back.generic.y        = 480 - 64;
ADDRGP4 g_arenaservers+1544+16
CNSTI4 416
ASGNI4
line 1470
;1470:	g_arenaservers.back.width            = 128;
ADDRGP4 g_arenaservers+1544+80
CNSTI4 128
ASGNI4
line 1471
;1471:	g_arenaservers.back.height           = 64;
ADDRGP4 g_arenaservers+1544+84
CNSTI4 64
ASGNI4
line 1472
;1472:	g_arenaservers.back.focuspic         = ART_BACK1;
ADDRGP4 g_arenaservers+1544+64
ADDRGP4 $1007
ASGNP4
line 1474
;1473:
;1474:	g_arenaservers.specify.generic.type     = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1728
CNSTI4 6
ASGNI4
line 1475
;1475:	g_arenaservers.specify.generic.name     = ART_SPECIFY0;
ADDRGP4 g_arenaservers+1728+4
ADDRGP4 $1011
ASGNP4
line 1476
;1476:	g_arenaservers.specify.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1728+44
CNSTU4 260
ASGNU4
line 1477
;1477:	g_arenaservers.specify.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1728+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1478
;1478:	g_arenaservers.specify.generic.id       = ID_SPECIFY;
ADDRGP4 g_arenaservers+1728+8
CNSTI4 20
ASGNI4
line 1479
;1479:	g_arenaservers.specify.generic.x        = 128;
ADDRGP4 g_arenaservers+1728+12
CNSTI4 128
ASGNI4
line 1480
;1480:	g_arenaservers.specify.generic.y        = 480 - 64;
ADDRGP4 g_arenaservers+1728+16
CNSTI4 416
ASGNI4
line 1481
;1481:	g_arenaservers.specify.width            = 128;
ADDRGP4 g_arenaservers+1728+80
CNSTI4 128
ASGNI4
line 1482
;1482:	g_arenaservers.specify.height           = 64;
ADDRGP4 g_arenaservers+1728+84
CNSTI4 64
ASGNI4
line 1483
;1483:	g_arenaservers.specify.focuspic         = ART_SPECIFY1;
ADDRGP4 g_arenaservers+1728+64
ADDRGP4 $1028
ASGNP4
line 1485
;1484:
;1485:	g_arenaservers.refresh.generic.type     = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1636
CNSTI4 6
ASGNI4
line 1486
;1486:	g_arenaservers.refresh.generic.name     = ART_REFRESH0;
ADDRGP4 g_arenaservers+1636+4
ADDRGP4 $1032
ASGNP4
line 1487
;1487:	g_arenaservers.refresh.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1636+44
CNSTU4 260
ASGNU4
line 1488
;1488:	g_arenaservers.refresh.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1636+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1489
;1489:	g_arenaservers.refresh.generic.id       = ID_REFRESH;
ADDRGP4 g_arenaservers+1636+8
CNSTI4 19
ASGNI4
line 1490
;1490:	g_arenaservers.refresh.generic.x        = 256;
ADDRGP4 g_arenaservers+1636+12
CNSTI4 256
ASGNI4
line 1491
;1491:	g_arenaservers.refresh.generic.y        = 480 - 64;
ADDRGP4 g_arenaservers+1636+16
CNSTI4 416
ASGNI4
line 1492
;1492:	g_arenaservers.refresh.width            = 128;
ADDRGP4 g_arenaservers+1636+80
CNSTI4 128
ASGNI4
line 1493
;1493:	g_arenaservers.refresh.height           = 64;
ADDRGP4 g_arenaservers+1636+84
CNSTI4 64
ASGNI4
line 1494
;1494:	g_arenaservers.refresh.focuspic         = ART_REFRESH1;
ADDRGP4 g_arenaservers+1636+64
ADDRGP4 $1049
ASGNP4
line 1496
;1495:
;1496:	g_arenaservers.create.generic.type     = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1820
CNSTI4 6
ASGNI4
line 1497
;1497:	g_arenaservers.create.generic.name     = ART_CREATE0;
ADDRGP4 g_arenaservers+1820+4
ADDRGP4 $1053
ASGNP4
line 1498
;1498:	g_arenaservers.create.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1820+44
CNSTU4 260
ASGNU4
line 1499
;1499:	g_arenaservers.create.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1820+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1500
;1500:	g_arenaservers.create.generic.id       = ID_CREATE;
ADDRGP4 g_arenaservers+1820+8
CNSTI4 21
ASGNI4
line 1501
;1501:	g_arenaservers.create.generic.x        = 384;
ADDRGP4 g_arenaservers+1820+12
CNSTI4 384
ASGNI4
line 1502
;1502:	g_arenaservers.create.generic.y        = 480 - 64;
ADDRGP4 g_arenaservers+1820+16
CNSTI4 416
ASGNI4
line 1503
;1503:	g_arenaservers.create.width            = 128;
ADDRGP4 g_arenaservers+1820+80
CNSTI4 128
ASGNI4
line 1504
;1504:	g_arenaservers.create.height           = 64;
ADDRGP4 g_arenaservers+1820+84
CNSTI4 64
ASGNI4
line 1505
;1505:	g_arenaservers.create.focuspic         = ART_CREATE1;
ADDRGP4 g_arenaservers+1820+64
ADDRGP4 $1070
ASGNP4
line 1507
;1506:
;1507:	g_arenaservers.go.generic.type     = MTYPE_BITMAP;
ADDRGP4 g_arenaservers+1912
CNSTI4 6
ASGNI4
line 1508
;1508:	g_arenaservers.go.generic.name     = ART_CONNECT0;
ADDRGP4 g_arenaservers+1912+4
ADDRGP4 $1074
ASGNP4
line 1509
;1509:	g_arenaservers.go.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 g_arenaservers+1912+44
CNSTU4 272
ASGNU4
line 1510
;1510:	g_arenaservers.go.generic.callback = ArenaServers_Event;
ADDRGP4 g_arenaservers+1912+48
ADDRGP4 ArenaServers_Event
ASGNP4
line 1511
;1511:	g_arenaservers.go.generic.id       = ID_CONNECT;
ADDRGP4 g_arenaservers+1912+8
CNSTI4 22
ASGNI4
line 1512
;1512:	g_arenaservers.go.generic.x        = 640;
ADDRGP4 g_arenaservers+1912+12
CNSTI4 640
ASGNI4
line 1513
;1513:	g_arenaservers.go.generic.y        = 480 - 64;
ADDRGP4 g_arenaservers+1912+16
CNSTI4 416
ASGNI4
line 1514
;1514:	g_arenaservers.go.width            = 128;
ADDRGP4 g_arenaservers+1912+80
CNSTI4 128
ASGNI4
line 1515
;1515:	g_arenaservers.go.height           = 64;
ADDRGP4 g_arenaservers+1912+84
CNSTI4 64
ASGNI4
line 1516
;1516:	g_arenaservers.go.focuspic         = ART_CONNECT1;
ADDRGP4 g_arenaservers+1912+64
ADDRGP4 $1091
ASGNP4
line 1518
;1517:
;1518:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.banner);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1520
;1519:
;1520:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.master);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1521
;1521:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.gametype);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+472
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1522
;1522:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.sortkey);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+580
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1523
;1523:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.showfull);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+688
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1524
;1524:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.showempty);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+756
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1526
;1525:
;1526:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.filter);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+2004
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1528
;1527:
;1528:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.mappic);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+932
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1529
;1529:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.list);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1530
;1530:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.status);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1300
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1531
;1531:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.statusbar);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1376
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1532
;1532:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.arrows);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1024
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1533
;1533:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.up);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1116
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1534
;1534:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.down);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1208
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1536
;1535:
;1536:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.remove);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1452
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1537
;1537:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.back);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1544
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1538
;1538:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.specify);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1728
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1539
;1539:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.refresh);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1636
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1540
;1540:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.create);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1820
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1541
;1541:	Menu_AddItem(&g_arenaservers.menu, (void*)&g_arenaservers.go);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 g_arenaservers+1912
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 1543
;1542:
;1543:	ArenaServers_LoadFavorites();
ADDRGP4 ArenaServers_LoadFavorites
CALLV
pop
line 1545
;1544:
;1545:	g_servertype = Com_Clamp(0, 3, ui_browserMaster.integer);
CNSTF4 0
ARGF4
CNSTF4 1077936128
ARGF4
ADDRGP4 ui_browserMaster+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_servertype
ADDRLP4 16
INDIRF4
CVFI4 4
ASGNI4
line 1547
;1546:	// hack to get rid of MPlayer stuff
;1547:	value = g_servertype;
ADDRLP4 8
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1548
;1548:	if (value >= 1)
ADDRLP4 8
INDIRI4
CNSTI4 1
LTI4 $1113
line 1549
;1549:		value--;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $1113
line 1550
;1550:	g_arenaservers.master.curvalue = value;
ADDRGP4 g_arenaservers+364+68
ADDRLP4 8
INDIRI4
ASGNI4
line 1552
;1551:
;1552:	g_gametype                       = Com_Clamp(0, GT_MAX_GAME_TYPE - 1, ui_browserGameType.integer);
CNSTF4 0
ARGF4
CNSTF4 1082130432
ARGF4
ADDRGP4 ui_browserGameType+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_gametype
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 1553
;1553:	g_arenaservers.gametype.curvalue = g_gametype;
ADDRGP4 g_arenaservers+472+68
ADDRGP4 g_gametype
INDIRI4
ASGNI4
line 1555
;1554:
;1555:	g_sortkey                       = Com_Clamp(0, 4, ui_browserSortKey.integer);
CNSTF4 0
ARGF4
CNSTF4 1082130432
ARGF4
ADDRGP4 ui_browserSortKey+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 24
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_sortkey
ADDRLP4 24
INDIRF4
CVFI4 4
ASGNI4
line 1556
;1556:	g_arenaservers.sortkey.curvalue = g_sortkey;
ADDRGP4 g_arenaservers+580+68
ADDRGP4 g_sortkey
INDIRI4
ASGNI4
line 1558
;1557:
;1558:	g_fullservers                    = Com_Clamp(0, 1, ui_browserShowFull.integer);
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowFull+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 28
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_fullservers
ADDRLP4 28
INDIRF4
CVFI4 4
ASGNI4
line 1559
;1559:	g_arenaservers.showfull.curvalue = g_fullservers;
ADDRGP4 g_arenaservers+688+64
ADDRGP4 g_fullservers
INDIRI4
ASGNI4
line 1561
;1560:
;1561:	g_emptyservers                    = Com_Clamp(0, 1, ui_browserShowEmpty.integer);
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 ui_browserShowEmpty+12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
ADDRGP4 Com_Clamp
CALLF4
ASGNF4
ADDRGP4 g_emptyservers
ADDRLP4 32
INDIRF4
CVFI4 4
ASGNI4
line 1562
;1562:	g_arenaservers.showempty.curvalue = g_emptyservers;
ADDRGP4 g_arenaservers+756+64
ADDRGP4 g_emptyservers
INDIRI4
ASGNI4
line 1565
;1563:
;1564:	// force to initial state and refresh
;1565:	type         = g_servertype;
ADDRLP4 12
ADDRGP4 g_servertype
INDIRI4
ASGNI4
line 1566
;1566:	g_servertype = -1;
ADDRGP4 g_servertype
CNSTI4 -1
ASGNI4
line 1567
;1567:	ArenaServers_SetType(type);
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ArenaServers_SetType
CALLV
pop
line 1569
;1568:
;1569:	trap_Cvar_Register(NULL, "debug_protocol", "", 0);
CNSTP4 0
ARGP4
ADDRGP4 $574
ARGP4
ADDRGP4 $261
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 1570
;1570:}
LABELV $718
endproc ArenaServers_MenuInit 36 16
export ArenaServers_Cache
proc ArenaServers_Cache 0 4
line 1577
;1571:
;1572:/*
;1573:=================
;1574:ArenaServers_Cache
;1575:=================
;1576:*/
;1577:void ArenaServers_Cache(void) {
line 1578
;1578:	trap_R_RegisterShaderNoMip(ART_BACK0);
ADDRGP4 $990
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1579
;1579:	trap_R_RegisterShaderNoMip(ART_BACK1);
ADDRGP4 $1007
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1580
;1580:	trap_R_RegisterShaderNoMip(ART_CREATE0);
ADDRGP4 $1053
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1581
;1581:	trap_R_RegisterShaderNoMip(ART_CREATE1);
ADDRGP4 $1070
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1582
;1582:	trap_R_RegisterShaderNoMip(ART_SPECIFY0);
ADDRGP4 $1011
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1583
;1583:	trap_R_RegisterShaderNoMip(ART_SPECIFY1);
ADDRGP4 $1028
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1584
;1584:	trap_R_RegisterShaderNoMip(ART_REFRESH0);
ADDRGP4 $1032
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1585
;1585:	trap_R_RegisterShaderNoMip(ART_REFRESH1);
ADDRGP4 $1049
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1586
;1586:	trap_R_RegisterShaderNoMip(ART_CONNECT0);
ADDRGP4 $1074
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1587
;1587:	trap_R_RegisterShaderNoMip(ART_CONNECT1);
ADDRGP4 $1091
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1588
;1588:	trap_R_RegisterShaderNoMip(ART_ARROWS0);
ADDRGP4 $895
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1589
;1589:	trap_R_RegisterShaderNoMip(ART_ARROWS_UP);
ADDRGP4 $925
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1590
;1590:	trap_R_RegisterShaderNoMip(ART_ARROWS_DOWN);
ADDRGP4 $943
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1591
;1591:	trap_R_RegisterShaderNoMip(ART_UNKNOWNMAP);
ADDRGP4 $891
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 1592
;1592:}
LABELV $1129
endproc ArenaServers_Cache 0 4
export UI_ArenaServersMenu
proc UI_ArenaServersMenu 0 4
line 1599
;1593:
;1594:/*
;1595:=================
;1596:UI_ArenaServersMenu
;1597:=================
;1598:*/
;1599:void UI_ArenaServersMenu(void) {
line 1600
;1600:	ArenaServers_MenuInit();
ADDRGP4 ArenaServers_MenuInit
CALLV
pop
line 1601
;1601:	UI_PushMenu(&g_arenaservers.menu);
ADDRGP4 g_arenaservers
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 1602
;1602:}
LABELV $1130
endproc UI_ArenaServersMenu 0 4
bss
align 4
LABELV g_fullservers
skip 4
align 4
LABELV g_emptyservers
skip 4
align 4
LABELV g_sortkey
skip 4
align 4
LABELV g_gametype
skip 4
align 4
LABELV g_servertype
skip 4
align 4
LABELV g_numfavoriteservers
skip 4
align 4
LABELV g_favoriteserverlist
skip 2304
align 4
LABELV g_numlocalservers
skip 4
align 4
LABELV g_localserverlist
skip 73728
align 4
LABELV g_numglobalservers
skip 4
align 4
LABELV g_globalserverlist
skip 442368
align 4
LABELV g_arenaservers
skip 57932
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
LABELV $1091
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1074
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1070
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
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1053
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
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1049
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1032
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 114
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1028
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $1011
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 121
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $1007
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
LABELV $990
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
LABELV $986
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $969
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 100
byte 1 101
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $943
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
LABELV $925
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
LABELV $895
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
LABELV $891
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $803
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $789
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 32
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 58
byte 1 0
align 1
LABELV $773
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 32
byte 1 66
byte 1 121
byte 1 58
byte 1 0
align 1
LABELV $757
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $741
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $733
byte 1 65
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 32
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $672
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 69
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $662
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 104
byte 1 111
byte 1 119
byte 1 70
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $652
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 83
byte 1 111
byte 1 114
byte 1 116
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $642
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $640
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 101
byte 1 114
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $629
byte 1 104
byte 1 105
byte 1 116
byte 1 32
byte 1 114
byte 1 101
byte 1 102
byte 1 114
byte 1 101
byte 1 115
byte 1 104
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 112
byte 1 100
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $579
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
LABELV $578
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 48
byte 1 32
byte 1 37
byte 1 100
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $577
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 32
byte 1 48
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $574
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 95
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
LABELV $573
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $572
byte 1 32
byte 1 101
byte 1 109
byte 1 112
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $544
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $474
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $424
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
LABELV $418
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $413
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
LABELV $410
byte 1 110
byte 1 101
byte 1 116
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $405
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $404
byte 1 109
byte 1 105
byte 1 110
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $403
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
LABELV $402
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $401
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $397
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $379
byte 1 112
byte 1 117
byte 1 110
byte 1 107
byte 1 98
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $376
byte 1 113
byte 1 51
byte 1 117
byte 1 116
byte 1 52
byte 1 0
align 1
LABELV $373
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $284
byte 1 78
byte 1 111
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
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
LABELV $281
byte 1 78
byte 1 111
byte 1 32
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 101
byte 1 32
byte 1 70
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 77
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 0
align 1
LABELV $267
byte 1 83
byte 1 99
byte 1 97
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 70
byte 1 111
byte 1 114
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $261
byte 1 0
align 1
LABELV $246
byte 1 80
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 83
byte 1 80
byte 1 65
byte 1 67
byte 1 69
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 0
align 1
LABELV $241
byte 1 37
byte 1 100
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 100
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 32
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $223
byte 1 37
byte 1 45
byte 1 42
byte 1 46
byte 1 42
byte 1 115
byte 1 32
byte 1 37
byte 1 45
byte 1 42
byte 1 46
byte 1 42
byte 1 115
byte 1 32
byte 1 37
byte 1 50
byte 1 100
byte 1 47
byte 1 37
byte 1 50
byte 1 100
byte 1 32
byte 1 37
byte 1 45
byte 1 42
byte 1 46
byte 1 42
byte 1 115
byte 1 32
byte 1 37
byte 1 51
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 51
byte 1 100
byte 1 0
align 1
LABELV $222
byte 1 94
byte 1 49
byte 1 0
align 1
LABELV $221
byte 1 94
byte 1 51
byte 1 0
align 1
LABELV $218
byte 1 94
byte 1 50
byte 1 0
align 1
LABELV $213
byte 1 94
byte 1 52
byte 1 0
align 1
LABELV $174
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $160
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $119
byte 1 99
byte 1 108
byte 1 95
byte 1 109
byte 1 97
byte 1 120
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $99
byte 1 70
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 0
align 1
LABELV $89
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 101
byte 1 100
byte 1 46
byte 1 0
align 1
LABELV $88
byte 1 81
byte 1 117
byte 1 97
byte 1 107
byte 1 101
byte 1 32
byte 1 73
byte 1 73
byte 1 73
byte 1 32
byte 1 65
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 0
align 1
LABELV $87
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $86
byte 1 80
byte 1 117
byte 1 110
byte 1 107
byte 1 66
byte 1 117
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 108
byte 1 108
byte 1 32
byte 1 98
byte 1 101
byte 1 0
align 1
LABELV $85
byte 1 69
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $84
byte 1 68
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $83
byte 1 73
byte 1 80
byte 1 88
byte 1 0
align 1
LABELV $82
byte 1 85
byte 1 68
byte 1 80
byte 1 0
align 1
LABELV $81
byte 1 63
byte 1 63
byte 1 63
byte 1 0
align 1
LABELV $80
byte 1 80
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $79
byte 1 71
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 84
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $78
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 32
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 83
byte 1 112
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $77
byte 1 77
byte 1 97
byte 1 112
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $76
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $75
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $74
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $73
byte 1 84
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $72
byte 1 68
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 82
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $71
byte 1 65
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $70
byte 1 70
byte 1 97
byte 1 118
byte 1 111
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $69
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 110
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $68
byte 1 76
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 0
