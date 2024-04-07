data
align 4
LABELV playermodel_artlist
address $68
address $69
address $70
address $71
address $72
address $73
address $74
address $75
address $76
address $77
byte 4 0
code
proc PlayerModel_UpdateGrid 24 0
file "../../../../code/q3_ui/ui_playermodel.c"
line 79
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:#define MODEL_BACK0    "menu/art/back_0"
;6:#define MODEL_BACK1    "menu/art/back_1"
;7:#define MODEL_SELECT   "menu/art/opponents_select"
;8:#define MODEL_SELECTED "menu/art/opponents_selected"
;9:#define MODEL_FRAMEL   "menu/art/frame1_l"
;10:#define MODEL_FRAMER   "menu/art/frame1_r"
;11:#define MODEL_PORTS    "menu/art/player_models_ports"
;12:#define MODEL_ARROWS   "menu/art/gs_arrows_0"
;13:#define MODEL_ARROWSL  "menu/art/gs_arrows_l"
;14:#define MODEL_ARROWSR  "menu/art/gs_arrows_r"
;15:
;16:#define LOW_MEMORY (5 * 1024 * 1024)
;17:
;18:static char* playermodel_artlist[] = {MODEL_BACK0, MODEL_BACK1,  MODEL_SELECT,  MODEL_SELECTED, MODEL_FRAMEL, MODEL_FRAMER,
;19:                                      MODEL_PORTS, MODEL_ARROWS, MODEL_ARROWSL, MODEL_ARROWSR,  NULL};
;20:
;21:#define PLAYERGRID_COLS   4
;22:#define PLAYERGRID_ROWS   4
;23:#define MAX_MODELSPERPAGE (PLAYERGRID_ROWS * PLAYERGRID_COLS)
;24:
;25:#define MAX_PLAYERMODELS 256
;26:
;27:#define ID_PLAYERPIC0  0
;28:#define ID_PLAYERPIC1  1
;29:#define ID_PLAYERPIC2  2
;30:#define ID_PLAYERPIC3  3
;31:#define ID_PLAYERPIC4  4
;32:#define ID_PLAYERPIC5  5
;33:#define ID_PLAYERPIC6  6
;34:#define ID_PLAYERPIC7  7
;35:#define ID_PLAYERPIC8  8
;36:#define ID_PLAYERPIC9  9
;37:#define ID_PLAYERPIC10 10
;38:#define ID_PLAYERPIC11 11
;39:#define ID_PLAYERPIC12 12
;40:#define ID_PLAYERPIC13 13
;41:#define ID_PLAYERPIC14 14
;42:#define ID_PLAYERPIC15 15
;43:#define ID_PREVPAGE    100
;44:#define ID_NEXTPAGE    101
;45:#define ID_BACK        102
;46:
;47:typedef struct {
;48:	menuframework_s menu;
;49:	menubitmap_s    pics[MAX_MODELSPERPAGE];
;50:	menubitmap_s    picbuttons[MAX_MODELSPERPAGE];
;51:	menubitmap_s    framel;
;52:	menubitmap_s    framer;
;53:	menubitmap_s    ports;
;54:	menutext_s      banner;
;55:	menubitmap_s    back;
;56:	menubitmap_s    player;
;57:	menubitmap_s    arrows;
;58:	menubitmap_s    left;
;59:	menubitmap_s    right;
;60:	menutext_s      modelname;
;61:	menutext_s      skinname;
;62:	menutext_s      playername;
;63:	playerInfo_t    playerinfo;
;64:	int             nummodels;
;65:	char            modelnames[MAX_PLAYERMODELS][128];
;66:	int             modelpage;
;67:	int             numpages;
;68:	char            modelskin[64];
;69:	int             selectedmodel;
;70:} playermodel_t;
;71:
;72:static playermodel_t s_playermodel;
;73:
;74:/*
;75:=================
;76:PlayerModel_UpdateGrid
;77:=================
;78:*/
;79:static void PlayerModel_UpdateGrid(void) {
line 83
;80:	int i;
;81:	int j;
;82:
;83:	j = s_playermodel.modelpage * MAX_MODELSPERPAGE;
ADDRLP4 4
ADDRGP4 s_playermodel+38152
INDIRI4
CNSTI4 4
LSHI4
ASGNI4
line 84
;84:	for (i = 0; i < PLAYERGRID_ROWS * PLAYERGRID_COLS; i++, j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $81
line 85
;85:		if (j < s_playermodel.nummodels) {
ADDRLP4 4
INDIRI4
ADDRGP4 s_playermodel+5380
INDIRI4
GEI4 $85
line 87
;86:			// model/skin portrait
;87:			s_playermodel.pics[i].generic.name = s_playermodel.modelnames[j];
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5384
ADDP4
ASGNP4
line 88
;88:			s_playermodel.picbuttons[i].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 89
;89:		} else {
ADDRGP4 $86
JUMPV
LABELV $85
line 91
;90:			// dead slot
;91:			s_playermodel.pics[i].generic.name = NULL;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+4
ADDP4
CNSTP4 0
ASGNP4
line 92
;92:			s_playermodel.picbuttons[i].generic.flags |= QMF_INACTIVE;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 93
;93:		}
LABELV $86
line 95
;94:
;95:		s_playermodel.pics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTI4 -65
CVIU4 4
BANDU4
ASGNU4
line 96
;96:		s_playermodel.pics[i].shader = 0;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+72
ADDP4
CNSTI4 0
ASGNI4
line 97
;97:		s_playermodel.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 98
;98:	}
LABELV $82
line 84
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $81
line 100
;99:
;100:	if (s_playermodel.selectedmodel / MAX_MODELSPERPAGE == s_playermodel.modelpage) {
ADDRGP4 s_playermodel+38224
INDIRI4
CNSTI4 16
DIVI4
ADDRGP4 s_playermodel+38152
INDIRI4
NEI4 $103
line 102
;101:		// set selected model
;102:		i = s_playermodel.selectedmodel % MAX_MODELSPERPAGE;
ADDRLP4 0
ADDRGP4 s_playermodel+38224
INDIRI4
CNSTI4 16
MODI4
ASGNI4
line 104
;103:
;104:		s_playermodel.pics[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+44
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 105
;105:		s_playermodel.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+44
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTI4 -257
CVIU4 4
BANDU4
ASGNU4
line 106
;106:	}
LABELV $103
line 108
;107:
;108:	if (s_playermodel.numpages > 1) {
ADDRGP4 s_playermodel+38156
INDIRI4
CNSTI4 1
LEI4 $112
line 109
;109:		if (s_playermodel.modelpage > 0)
ADDRGP4 s_playermodel+38152
INDIRI4
CNSTI4 0
LEI4 $115
line 110
;110:			s_playermodel.left.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_playermodel+3860+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
ADDRGP4 $116
JUMPV
LABELV $115
line 112
;111:		else
;112:			s_playermodel.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 12
ADDRGP4 s_playermodel+3860+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
LABELV $116
line 114
;113:
;114:		if (s_playermodel.modelpage < s_playermodel.numpages - 1)
ADDRGP4 s_playermodel+38152
INDIRI4
ADDRGP4 s_playermodel+38156
INDIRI4
CNSTI4 1
SUBI4
GEI4 $122
line 115
;115:			s_playermodel.right.generic.flags &= ~QMF_INACTIVE;
ADDRLP4 16
ADDRGP4 s_playermodel+3952+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
ADDRGP4 $113
JUMPV
LABELV $122
line 117
;116:		else
;117:			s_playermodel.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 20
ADDRGP4 s_playermodel+3952+44
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 118
;118:	} else {
ADDRGP4 $113
JUMPV
LABELV $112
line 120
;119:		// hide left/right markers
;120:		s_playermodel.left.generic.flags |= QMF_INACTIVE;
ADDRLP4 8
ADDRGP4 s_playermodel+3860+44
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 121
;121:		s_playermodel.right.generic.flags |= QMF_INACTIVE;
ADDRLP4 12
ADDRGP4 s_playermodel+3952+44
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 122
;122:	}
LABELV $113
line 123
;123:}
LABELV $79
endproc PlayerModel_UpdateGrid 24 0
proc PlayerModel_UpdateModel 24 28
line 130
;124:
;125:/*
;126:=================
;127:PlayerModel_UpdateModel
;128:=================
;129:*/
;130:static void PlayerModel_UpdateModel(void) {
line 134
;131:	vec3_t viewangles;
;132:	vec3_t moveangles;
;133:
;134:	memset(&s_playermodel.playerinfo, 0, sizeof(playerInfo_t));
ADDRGP4 s_playermodel+4272
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1108
ARGI4
ADDRGP4 memset
CALLP4
pop
line 136
;135:
;136:	viewangles[YAW]   = 180 - 30;
ADDRLP4 0+4
CNSTF4 1125515264
ASGNF4
line 137
;137:	viewangles[PITCH] = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 138
;138:	viewangles[ROLL]  = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 139
;139:	VectorClear(moveangles);
ADDRLP4 12
CNSTF4 0
ASGNF4
ADDRLP4 12+4
CNSTF4 0
ASGNF4
ADDRLP4 12+8
CNSTF4 0
ASGNF4
line 141
;140:
;141:	UI_PlayerInfo_SetModel(&s_playermodel.playerinfo, s_playermodel.modelskin);
ADDRGP4 s_playermodel+4272
ARGP4
ADDRGP4 s_playermodel+38160
ARGP4
ADDRGP4 UI_PlayerInfo_SetModel
CALLV
pop
line 142
;142:	UI_PlayerInfo_SetInfo(&s_playermodel.playerinfo, LEGS_IDLE, TORSO_STAND, viewangles, moveangles, WP_MACHINEGUN, qfalse);
ADDRGP4 s_playermodel+4272
ARGP4
CNSTI4 22
ARGI4
CNSTI4 11
ARGI4
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 2
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_PlayerInfo_SetInfo
CALLV
pop
line 143
;143:}
LABELV $134
endproc PlayerModel_UpdateModel 24 28
proc PlayerModel_SaveChanges 0 8
line 150
;144:
;145:/*
;146:=================
;147:PlayerModel_SaveChanges
;148:=================
;149:*/
;150:static void PlayerModel_SaveChanges(void) {
line 151
;151:	trap_Cvar_Set("model", s_playermodel.modelskin);
ADDRGP4 $144
ARGP4
ADDRGP4 s_playermodel+38160
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 152
;152:	trap_Cvar_Set("headmodel", s_playermodel.modelskin);
ADDRGP4 $146
ARGP4
ADDRGP4 s_playermodel+38160
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 153
;153:}
LABELV $143
endproc PlayerModel_SaveChanges 0 8
proc PlayerModel_MenuEvent 12 0
line 160
;154:
;155:/*
;156:=================
;157:PlayerModel_MenuEvent
;158:=================
;159:*/
;160:static void PlayerModel_MenuEvent(void* ptr, int event) {
line 161
;161:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $149
line 162
;162:		return;
ADDRGP4 $148
JUMPV
LABELV $149
line 164
;163:
;164:	switch (((menucommon_s*)ptr)->id) {
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
EQI4 $154
ADDRLP4 0
INDIRI4
CNSTI4 101
EQI4 $159
ADDRLP4 0
INDIRI4
CNSTI4 102
EQI4 $165
ADDRGP4 $151
JUMPV
LABELV $154
line 166
;165:	case ID_PREVPAGE:
;166:		if (s_playermodel.modelpage > 0) {
ADDRGP4 s_playermodel+38152
INDIRI4
CNSTI4 0
LEI4 $152
line 167
;167:			s_playermodel.modelpage--;
ADDRLP4 8
ADDRGP4 s_playermodel+38152
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 168
;168:			PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 169
;169:		}
line 170
;170:		break;
ADDRGP4 $152
JUMPV
LABELV $159
line 173
;171:
;172:	case ID_NEXTPAGE:
;173:		if (s_playermodel.modelpage < s_playermodel.numpages - 1) {
ADDRGP4 s_playermodel+38152
INDIRI4
ADDRGP4 s_playermodel+38156
INDIRI4
CNSTI4 1
SUBI4
GEI4 $152
line 174
;174:			s_playermodel.modelpage++;
ADDRLP4 8
ADDRGP4 s_playermodel+38152
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 175
;175:			PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 176
;176:		}
line 177
;177:		break;
ADDRGP4 $152
JUMPV
LABELV $165
line 180
;178:
;179:	case ID_BACK:
;180:		PlayerModel_SaveChanges();
ADDRGP4 PlayerModel_SaveChanges
CALLV
pop
line 181
;181:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 182
;182:		break;
LABELV $151
LABELV $152
line 184
;183:	}
;184:}
LABELV $148
endproc PlayerModel_MenuEvent 12 0
proc PlayerModel_MenuKey 44 8
line 191
;185:
;186:/*
;187:=================
;188:PlayerModel_MenuKey
;189:=================
;190:*/
;191:static sfxHandle_t PlayerModel_MenuKey(int key) {
line 195
;192:	menucommon_s* m;
;193:	int           picnum;
;194:
;195:	switch (key) {
ADDRLP4 8
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 134
EQI4 $169
ADDRLP4 8
INDIRI4
CNSTI4 135
EQI4 $178
ADDRLP4 8
INDIRI4
CNSTI4 135
GTI4 $192
LABELV $191
ADDRFP4 0
INDIRI4
CNSTI4 27
EQI4 $190
ADDRGP4 $167
JUMPV
LABELV $192
ADDRLP4 12
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 163
EQI4 $169
ADDRLP4 12
INDIRI4
CNSTI4 165
EQI4 $178
ADDRLP4 12
INDIRI4
CNSTI4 163
LTI4 $167
LABELV $193
ADDRFP4 0
INDIRI4
CNSTI4 179
EQI4 $190
ADDRGP4 $167
JUMPV
LABELV $169
line 198
;196:	case K_KP_LEFTARROW:
;197:	case K_LEFTARROW:
;198:		m      = Menu_ItemAtCursor(&s_playermodel.menu);
ADDRGP4 s_playermodel
ARGP4
ADDRLP4 16
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
ASGNP4
line 199
;199:		picnum = m->id - ID_PLAYERPIC0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 200
;200:		if (picnum >= 0 && picnum <= 15) {
ADDRLP4 20
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $168
ADDRLP4 20
INDIRI4
CNSTI4 15
GTI4 $168
line 201
;201:			if (picnum > 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $172
line 202
;202:				Menu_SetCursor(&s_playermodel.menu, s_playermodel.menu.cursor - 1);
ADDRLP4 24
ADDRGP4 s_playermodel
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 203
;203:				return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $166
JUMPV
LABELV $172
line 205
;204:
;205:			} else if (s_playermodel.modelpage > 0) {
ADDRGP4 s_playermodel+38152
INDIRI4
CNSTI4 0
LEI4 $174
line 206
;206:				s_playermodel.modelpage--;
ADDRLP4 24
ADDRGP4 s_playermodel+38152
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 207
;207:				Menu_SetCursor(&s_playermodel.menu, s_playermodel.menu.cursor + 15);
ADDRLP4 28
ADDRGP4 s_playermodel
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 15
ADDI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 208
;208:				PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 209
;209:				return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $166
JUMPV
LABELV $174
line 211
;210:			} else
;211:				return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $166
JUMPV
line 213
;212:		}
;213:		break;
LABELV $178
line 217
;214:
;215:	case K_KP_RIGHTARROW:
;216:	case K_RIGHTARROW:
;217:		m      = Menu_ItemAtCursor(&s_playermodel.menu);
ADDRGP4 s_playermodel
ARGP4
ADDRLP4 24
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
ASGNP4
line 218
;218:		picnum = m->id - ID_PLAYERPIC0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 219
;219:		if (picnum >= 0 && picnum <= 15) {
ADDRLP4 28
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $168
ADDRLP4 28
INDIRI4
CNSTI4 15
GTI4 $168
line 220
;220:			if ((picnum < 15) && (s_playermodel.modelpage * MAX_MODELSPERPAGE + picnum + 1 < s_playermodel.nummodels)) {
ADDRLP4 32
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 15
GEI4 $181
ADDRGP4 s_playermodel+38152
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 32
INDIRI4
ADDI4
CNSTI4 1
ADDI4
ADDRGP4 s_playermodel+5380
INDIRI4
GEI4 $181
line 221
;221:				Menu_SetCursor(&s_playermodel.menu, s_playermodel.menu.cursor + 1);
ADDRLP4 36
ADDRGP4 s_playermodel
ASGNP4
ADDRLP4 36
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 222
;222:				return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $166
JUMPV
LABELV $181
line 223
;223:			} else if ((picnum == 15) && (s_playermodel.modelpage < s_playermodel.numpages - 1)) {
ADDRLP4 0
INDIRI4
CNSTI4 15
NEI4 $185
ADDRGP4 s_playermodel+38152
INDIRI4
ADDRGP4 s_playermodel+38156
INDIRI4
CNSTI4 1
SUBI4
GEI4 $185
line 224
;224:				s_playermodel.modelpage++;
ADDRLP4 36
ADDRGP4 s_playermodel+38152
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 225
;225:				Menu_SetCursor(&s_playermodel.menu, s_playermodel.menu.cursor - 15);
ADDRLP4 40
ADDRGP4 s_playermodel
ASGNP4
ADDRLP4 40
INDIRP4
ARGP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 15
SUBI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 226
;226:				PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 227
;227:				return (menu_move_sound);
ADDRGP4 menu_move_sound
INDIRI4
RETI4
ADDRGP4 $166
JUMPV
LABELV $185
line 229
;228:			} else
;229:				return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $166
JUMPV
line 231
;230:		}
;231:		break;
LABELV $190
line 235
;232:
;233:	case K_MOUSE2:
;234:	case K_ESCAPE:
;235:		PlayerModel_SaveChanges();
ADDRGP4 PlayerModel_SaveChanges
CALLV
pop
line 236
;236:		break;
LABELV $167
LABELV $168
line 239
;237:	}
;238:
;239:	return (Menu_DefaultKey(&s_playermodel.menu, key));
ADDRGP4 s_playermodel
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
LABELV $166
endproc PlayerModel_MenuKey 44 8
proc PlayerModel_PicEvent 48 12
line 247
;240:}
;241:
;242:/*
;243:=================
;244:PlayerModel_PicEvent
;245:=================
;246:*/
;247:static void PlayerModel_PicEvent(void* ptr, int event) {
line 254
;248:	int   modelnum;
;249:	int   maxlen;
;250:	char* buffptr;
;251:	char* pdest;
;252:	int   i;
;253:
;254:	if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $195
line 255
;255:		return;
ADDRGP4 $194
JUMPV
LABELV $195
line 257
;256:
;257:	for (i = 0; i < PLAYERGRID_ROWS * PLAYERGRID_COLS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $197
line 259
;258:		// reset
;259:		s_playermodel.pics[i].generic.flags &= ~QMF_HIGHLIGHT;
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTI4 -65
CVIU4 4
BANDU4
ASGNU4
line 260
;260:		s_playermodel.picbuttons[i].generic.flags |= QMF_PULSEIFFOCUS;
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTU4 256
BORU4
ASGNU4
line 261
;261:	}
LABELV $198
line 257
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $197
line 264
;262:
;263:	// set selected
;264:	i = ((menucommon_s*)ptr)->id - ID_PLAYERPIC0;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 265
;265:	s_playermodel.pics[i].generic.flags |= QMF_HIGHLIGHT;
ADDRLP4 20
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 64
BORU4
ASGNU4
line 266
;266:	s_playermodel.picbuttons[i].generic.flags &= ~QMF_PULSEIFFOCUS;
ADDRLP4 24
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+44
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRU4
CNSTI4 -257
CVIU4 4
BANDU4
ASGNU4
line 269
;267:
;268:	// get model and strip icon_
;269:	modelnum = s_playermodel.modelpage * MAX_MODELSPERPAGE + i;
ADDRLP4 16
ADDRGP4 s_playermodel+38152
INDIRI4
CNSTI4 4
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 270
;270:	buffptr  = s_playermodel.modelnames[modelnum] + strlen("models/players/");
ADDRGP4 $211
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 28
INDIRI4
ADDRLP4 16
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5384
ADDP4
ADDP4
ASGNP4
line 271
;271:	pdest    = strstr(buffptr, "icon_");
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 32
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 272
;272:	if (pdest) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $213
line 274
;273:		// track the whole model/skin name
;274:		Q_strncpyz(s_playermodel.modelskin, buffptr, pdest - buffptr + 1);
ADDRGP4 s_playermodel+38160
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 275
;275:		strcat(s_playermodel.modelskin, pdest + 5);
ADDRGP4 s_playermodel+38160
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 278
;276:
;277:		// seperate the model name
;278:		maxlen = pdest - buffptr;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 279
;279:		if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $217
line 280
;280:			maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $217
line 281
;281:		Q_strncpyz(s_playermodel.modelname.string, buffptr, maxlen);
ADDRGP4 s_playermodel+4044+64
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 282
;282:		Q_strupr(s_playermodel.modelname.string);
ADDRGP4 s_playermodel+4044+64
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 285
;283:
;284:		// seperate the skin name
;285:		maxlen = strlen(pdest + 5) + 1;
ADDRLP4 4
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRLP4 40
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 286
;286:		if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $223
line 287
;287:			maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $223
line 288
;288:		Q_strncpyz(s_playermodel.skinname.string, pdest + 5, maxlen);
ADDRGP4 s_playermodel+4120+64
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 289
;289:		Q_strupr(s_playermodel.skinname.string);
ADDRGP4 s_playermodel+4120+64
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 291
;290:
;291:		s_playermodel.selectedmodel = modelnum;
ADDRGP4 s_playermodel+38224
ADDRLP4 16
INDIRI4
ASGNI4
line 293
;292:
;293:		if (trap_MemoryRemaining() > LOW_MEMORY) {
ADDRLP4 44
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 5242880
LEI4 $230
line 294
;294:			PlayerModel_UpdateModel();
ADDRGP4 PlayerModel_UpdateModel
CALLV
pop
line 295
;295:		}
LABELV $230
line 296
;296:	}
LABELV $213
line 297
;297:}
LABELV $194
endproc PlayerModel_PicEvent 48 12
proc PlayerModel_DrawPlayer 12 24
line 304
;298:
;299:/*
;300:=================
;301:PlayerModel_DrawPlayer
;302:=================
;303:*/
;304:static void PlayerModel_DrawPlayer(void* self) {
line 307
;305:	menubitmap_s* b;
;306:
;307:	b = (menubitmap_s*)self;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 309
;308:
;309:	if (trap_MemoryRemaining() <= LOW_MEMORY) {
ADDRLP4 4
ADDRGP4 trap_MemoryRemaining
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 5242880
GTI4 $233
line 310
;310:		UI_DrawProportionalString(b->generic.x, b->generic.y + b->height / 2, "LOW MEMORY", UI_LEFT, color_red);
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
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 2
DIVI4
ADDI4
ARGI4
ADDRGP4 $235
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 311
;311:		return;
ADDRGP4 $232
JUMPV
LABELV $233
line 314
;312:	}
;313:
;314:	UI_DrawPlayer(b->generic.x, b->generic.y, b->width, b->height, &s_playermodel.playerinfo, uis.realtime / 2);
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
ADDRGP4 s_playermodel+4272
ARGP4
ADDRGP4 uis+4
INDIRI4
CNSTI4 2
DIVI4
ARGI4
ADDRGP4 UI_DrawPlayer
CALLV
pop
line 315
;315:}
LABELV $232
endproc PlayerModel_DrawPlayer 12 24
proc PlayerModel_BuildList 4244 20
line 322
;316:
;317:/*
;318:=================
;319:PlayerModel_BuildList
;320:=================
;321:*/
;322:static void PlayerModel_BuildList(void) {
line 336
;323:	int      numdirs;
;324:	int      numfiles;
;325:	char     dirlist[2048];
;326:	char     filelist[2048];
;327:	char     skinname[MAX_QPATH];
;328:	char*    dirptr;
;329:	char*    fileptr;
;330:	int      i;
;331:	int      j;
;332:	int      dirlen;
;333:	int      filelen;
;334:	qboolean precache;
;335:
;336:	precache = trap_Cvar_VariableValue("com_buildscript");
ADDRGP4 $239
ARGP4
ADDRLP4 4196
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 84
ADDRLP4 4196
INDIRF4
CVFI4 4
ASGNI4
line 338
;337:
;338:	s_playermodel.modelpage = 0;
ADDRGP4 s_playermodel+38152
CNSTI4 0
ASGNI4
line 339
;339:	s_playermodel.nummodels = 0;
ADDRGP4 s_playermodel+5380
CNSTI4 0
ASGNI4
line 342
;340:
;341:	// iterate directory of all player models
;342:	numdirs = trap_FS_GetFileList("models/players", "/", dirlist, 2048);
ADDRGP4 $242
ARGP4
ADDRGP4 $243
ARGP4
ADDRLP4 2148
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4200
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 2144
ADDRLP4 4200
INDIRI4
ASGNI4
line 343
;343:	dirptr  = dirlist;
ADDRLP4 76
ADDRLP4 2148
ASGNP4
line 344
;344:	for (i = 0; i < numdirs && s_playermodel.nummodels < MAX_PLAYERMODELS; i++, dirptr += dirlen + 1) {
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 $247
JUMPV
LABELV $244
line 345
;345:		dirlen = strlen(dirptr);
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4204
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 4204
INDIRI4
ASGNI4
line 347
;346:
;347:		if (dirlen && dirptr[dirlen - 1] == '/')
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $249
ADDRLP4 88
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $249
line 348
;348:			dirptr[dirlen - 1] = '\0';
ADDRLP4 88
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 76
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $249
line 350
;349:
;350:		if (!strcmp(dirptr, ".") || !strcmp(dirptr, ".."))
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $253
ARGP4
ADDRLP4 4212
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4212
INDIRI4
CNSTI4 0
EQI4 $255
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 $254
ARGP4
ADDRLP4 4216
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 4216
INDIRI4
CNSTI4 0
NEI4 $251
LABELV $255
line 351
;351:			continue;
ADDRGP4 $245
JUMPV
LABELV $251
line 354
;352:
;353:		// iterate all skin files in directory
;354:		numfiles = trap_FS_GetFileList(va("models/players/%s", dirptr), "tga", filelist, 2048);
ADDRGP4 $256
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 4220
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4220
INDIRP4
ARGP4
ADDRGP4 $257
ARGP4
ADDRLP4 96
ARGP4
CNSTI4 2048
ARGI4
ADDRLP4 4224
ADDRGP4 trap_FS_GetFileList
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 4224
INDIRI4
ASGNI4
line 355
;355:		fileptr  = filelist;
ADDRLP4 64
ADDRLP4 96
ASGNP4
line 356
;356:		for (j = 0; j < numfiles && s_playermodel.nummodels < MAX_PLAYERMODELS; j++, fileptr += filelen + 1) {
ADDRLP4 68
CNSTI4 0
ASGNI4
ADDRGP4 $261
JUMPV
LABELV $258
line 357
;357:			filelen = strlen(fileptr);
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 4228
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 72
ADDRLP4 4228
INDIRI4
ASGNI4
line 359
;358:
;359:			COM_StripExtension(fileptr, skinname, sizeof(skinname));
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 COM_StripExtension
CALLV
pop
line 362
;360:
;361:			// look for icon_????
;362:			if (!Q_stricmpn(skinname, "icon_", 5)) {
ADDRLP4 0
ARGP4
ADDRGP4 $212
ARGP4
CNSTI4 5
ARGI4
ADDRLP4 4232
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 4232
INDIRI4
CNSTI4 0
NEI4 $263
line 363
;363:				Com_sprintf(
ADDRLP4 4240
ADDRGP4 s_playermodel+5380
ASGNP4
ADDRLP4 4236
ADDRLP4 4240
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 4240
INDIRP4
ADDRLP4 4236
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4236
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5384
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $269
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 368
;364:					s_playermodel.modelnames[s_playermodel.nummodels++], sizeof(s_playermodel.modelnames[s_playermodel.nummodels]), "models/players/%s/%s",
;365:					dirptr, skinname);
;366:				// if (s_playermodel.nummodels >= MAX_PLAYERMODELS)
;367:				//	return;
;368:			}
LABELV $263
line 370
;369:
;370:			if (precache) {
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $270
line 371
;371:				trap_S_RegisterSound(va("sound/player/announce/%s_wins.wav", skinname), qfalse);
ADDRGP4 $272
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4236
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4236
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 372
;372:			}
LABELV $270
line 373
;373:		}
LABELV $259
line 356
ADDRLP4 68
ADDRLP4 68
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 64
ADDRLP4 72
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 64
INDIRP4
ADDP4
ASGNP4
LABELV $261
ADDRLP4 68
INDIRI4
ADDRLP4 80
INDIRI4
GEI4 $273
ADDRGP4 s_playermodel+5380
INDIRI4
CNSTI4 256
LTI4 $258
LABELV $273
line 374
;374:	}
LABELV $245
line 344
ADDRLP4 92
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 76
INDIRP4
ADDP4
ASGNP4
LABELV $247
ADDRLP4 92
INDIRI4
ADDRLP4 2144
INDIRI4
GEI4 $274
ADDRGP4 s_playermodel+5380
INDIRI4
CNSTI4 256
LTI4 $244
LABELV $274
line 378
;375:
;376:	// APSFIXME - Degenerate no models case
;377:
;378:	s_playermodel.numpages = s_playermodel.nummodels / MAX_MODELSPERPAGE;
ADDRGP4 s_playermodel+38156
ADDRGP4 s_playermodel+5380
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 379
;379:	if (s_playermodel.nummodels % MAX_MODELSPERPAGE)
ADDRGP4 s_playermodel+5380
INDIRI4
CNSTI4 16
MODI4
CNSTI4 0
EQI4 $277
line 380
;380:		s_playermodel.numpages++;
ADDRLP4 4204
ADDRGP4 s_playermodel+38156
ASGNP4
ADDRLP4 4204
INDIRP4
ADDRLP4 4204
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $277
line 381
;381:}
LABELV $238
endproc PlayerModel_BuildList 4244 20
proc PlayerModel_SetMenuItems 96 12
line 388
;382:
;383:/*
;384:=================
;385:PlayerModel_SetMenuItems
;386:=================
;387:*/
;388:static void PlayerModel_SetMenuItems(void) {
line 396
;389:	int   i;
;390:	int   maxlen;
;391:	char  modelskin[64];
;392:	char* buffptr;
;393:	char* pdest;
;394:
;395:	// name
;396:	trap_Cvar_VariableStringBuffer("name", s_playermodel.playername.string, 16);
ADDRGP4 $282
ARGP4
ADDRGP4 s_playermodel+4196+64
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 397
;397:	Q_CleanStr(s_playermodel.playername.string);
ADDRGP4 s_playermodel+4196+64
INDIRP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 400
;398:
;399:	// model
;400:	trap_Cvar_VariableStringBuffer("model", s_playermodel.modelskin, 64);
ADDRGP4 $144
ARGP4
ADDRGP4 s_playermodel+38160
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 403
;401:
;402:	// find model in our list
;403:	for (i = 0; i < s_playermodel.nummodels; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $291
JUMPV
LABELV $288
line 405
;404:		// strip icon_
;405:		buffptr = s_playermodel.modelnames[i] + strlen("models/players/");
ADDRGP4 $211
ARGP4
ADDRLP4 80
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 80
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5384
ADDP4
ADDP4
ASGNP4
line 406
;406:		pdest   = strstr(buffptr, "icon_");
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $212
ARGP4
ADDRLP4 84
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 84
INDIRP4
ASGNP4
line 407
;407:		if (pdest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $289
line 408
;408:			Q_strncpyz(modelskin, buffptr, pdest - buffptr + 1);
ADDRLP4 16
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 409
;409:			strcat(modelskin, pdest + 5);
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 410
;410:		} else
line 411
;411:			continue;
LABELV $295
line 413
;412:
;413:		if (!Q_stricmp(s_playermodel.modelskin, modelskin)) {
ADDRGP4 s_playermodel+38160
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $296
line 415
;414:			// found pic, set selection here
;415:			s_playermodel.selectedmodel = i;
ADDRGP4 s_playermodel+38224
ADDRLP4 4
INDIRI4
ASGNI4
line 416
;416:			s_playermodel.modelpage     = i / MAX_MODELSPERPAGE;
ADDRGP4 s_playermodel+38152
ADDRLP4 4
INDIRI4
CNSTI4 16
DIVI4
ASGNI4
line 419
;417:
;418:			// seperate the model name
;419:			maxlen = pdest - buffptr;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 420
;420:			if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $301
line 421
;421:				maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $301
line 422
;422:			Q_strncpyz(s_playermodel.modelname.string, buffptr, maxlen);
ADDRGP4 s_playermodel+4044+64
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 423
;423:			Q_strupr(s_playermodel.modelname.string);
ADDRGP4 s_playermodel+4044+64
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 426
;424:
;425:			// seperate the skin name
;426:			maxlen = strlen(pdest + 5) + 1;
ADDRLP4 0
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRLP4 92
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 427
;427:			if (maxlen > 16)
ADDRLP4 12
INDIRI4
CNSTI4 16
LEI4 $307
line 428
;428:				maxlen = 16;
ADDRLP4 12
CNSTI4 16
ASGNI4
LABELV $307
line 429
;429:			Q_strncpyz(s_playermodel.skinname.string, pdest + 5, maxlen);
ADDRGP4 s_playermodel+4120+64
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 5
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 430
;430:			Q_strupr(s_playermodel.skinname.string);
ADDRGP4 s_playermodel+4120+64
INDIRP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 431
;431:			break;
ADDRGP4 $290
JUMPV
LABELV $296
line 433
;432:		}
;433:	}
LABELV $289
line 403
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $291
ADDRLP4 4
INDIRI4
ADDRGP4 s_playermodel+5380
INDIRI4
LTI4 $288
LABELV $290
line 434
;434:}
LABELV $281
endproc PlayerModel_SetMenuItems 96 12
bss
align 1
LABELV $314
skip 32
align 1
LABELV $315
skip 32
align 1
LABELV $316
skip 32
code
proc PlayerModel_MenuInit 24 12
line 441
;435:
;436:/*
;437:=================
;438:PlayerModel_MenuInit
;439:=================
;440:*/
;441:static void PlayerModel_MenuInit(void) {
line 452
;442:	int         i;
;443:	int         j;
;444:	int         k;
;445:	int         x;
;446:	int         y;
;447:	static char playername[32];
;448:	static char modelname[32];
;449:	static char skinname[32];
;450:
;451:	// zero set all our globals
;452:	memset(&s_playermodel, 0, sizeof(playermodel_t));
ADDRGP4 s_playermodel
ARGP4
CNSTI4 0
ARGI4
CNSTI4 38228
ARGI4
ADDRGP4 memset
CALLP4
pop
line 454
;453:
;454:	PlayerModel_Cache();
ADDRGP4 PlayerModel_Cache
CALLV
pop
line 456
;455:
;456:	s_playermodel.menu.key        = PlayerModel_MenuKey;
ADDRGP4 s_playermodel+272
ADDRGP4 PlayerModel_MenuKey
ASGNP4
line 457
;457:	s_playermodel.menu.wrapAround = qtrue;
ADDRGP4 s_playermodel+276
CNSTI4 1
ASGNI4
line 458
;458:	s_playermodel.menu.fullscreen = qtrue;
ADDRGP4 s_playermodel+280
CNSTI4 1
ASGNI4
line 460
;459:
;460:	s_playermodel.banner.generic.type = MTYPE_BTEXT;
ADDRGP4 s_playermodel+3508
CNSTI4 10
ASGNI4
line 461
;461:	s_playermodel.banner.generic.x    = 320;
ADDRGP4 s_playermodel+3508+12
CNSTI4 320
ASGNI4
line 462
;462:	s_playermodel.banner.generic.y    = 16;
ADDRGP4 s_playermodel+3508+16
CNSTI4 16
ASGNI4
line 463
;463:	s_playermodel.banner.string       = "PLAYER MODEL";
ADDRGP4 s_playermodel+3508+64
ADDRGP4 $327
ASGNP4
line 464
;464:	s_playermodel.banner.color        = color_white;
ADDRGP4 s_playermodel+3508+72
ADDRGP4 color_white
ASGNP4
line 465
;465:	s_playermodel.banner.style        = UI_CENTER;
ADDRGP4 s_playermodel+3508+68
CNSTI4 1
ASGNI4
line 467
;466:
;467:	s_playermodel.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3232
CNSTI4 6
ASGNI4
line 468
;468:	s_playermodel.framel.generic.name  = MODEL_FRAMEL;
ADDRGP4 s_playermodel+3232+4
ADDRGP4 $72
ASGNP4
line 469
;469:	s_playermodel.framel.generic.flags = QMF_LEFT_JUSTIFY | QMF_INACTIVE;
ADDRGP4 s_playermodel+3232+44
CNSTU4 16388
ASGNU4
line 470
;470:	s_playermodel.framel.generic.x     = 0;
ADDRGP4 s_playermodel+3232+12
CNSTI4 0
ASGNI4
line 471
;471:	s_playermodel.framel.generic.y     = 78;
ADDRGP4 s_playermodel+3232+16
CNSTI4 78
ASGNI4
line 472
;472:	s_playermodel.framel.width         = 256;
ADDRGP4 s_playermodel+3232+80
CNSTI4 256
ASGNI4
line 473
;473:	s_playermodel.framel.height        = 329;
ADDRGP4 s_playermodel+3232+84
CNSTI4 329
ASGNI4
line 475
;474:
;475:	s_playermodel.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3324
CNSTI4 6
ASGNI4
line 476
;476:	s_playermodel.framer.generic.name  = MODEL_FRAMER;
ADDRGP4 s_playermodel+3324+4
ADDRGP4 $73
ASGNP4
line 477
;477:	s_playermodel.framer.generic.flags = QMF_LEFT_JUSTIFY | QMF_INACTIVE;
ADDRGP4 s_playermodel+3324+44
CNSTU4 16388
ASGNU4
line 478
;478:	s_playermodel.framer.generic.x     = 376;
ADDRGP4 s_playermodel+3324+12
CNSTI4 376
ASGNI4
line 479
;479:	s_playermodel.framer.generic.y     = 76;
ADDRGP4 s_playermodel+3324+16
CNSTI4 76
ASGNI4
line 480
;480:	s_playermodel.framer.width         = 256;
ADDRGP4 s_playermodel+3324+80
CNSTI4 256
ASGNI4
line 481
;481:	s_playermodel.framer.height        = 334;
ADDRGP4 s_playermodel+3324+84
CNSTI4 334
ASGNI4
line 483
;482:
;483:	s_playermodel.ports.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3416
CNSTI4 6
ASGNI4
line 484
;484:	s_playermodel.ports.generic.name  = MODEL_PORTS;
ADDRGP4 s_playermodel+3416+4
ADDRGP4 $74
ASGNP4
line 485
;485:	s_playermodel.ports.generic.flags = QMF_LEFT_JUSTIFY | QMF_INACTIVE;
ADDRGP4 s_playermodel+3416+44
CNSTU4 16388
ASGNU4
line 486
;486:	s_playermodel.ports.generic.x     = 50;
ADDRGP4 s_playermodel+3416+12
CNSTI4 50
ASGNI4
line 487
;487:	s_playermodel.ports.generic.y     = 59;
ADDRGP4 s_playermodel+3416+16
CNSTI4 59
ASGNI4
line 488
;488:	s_playermodel.ports.width         = 274;
ADDRGP4 s_playermodel+3416+80
CNSTI4 274
ASGNI4
line 489
;489:	s_playermodel.ports.height        = 274;
ADDRGP4 s_playermodel+3416+84
CNSTI4 274
ASGNI4
line 491
;490:
;491:	y = 59;
ADDRLP4 8
CNSTI4 59
ASGNI4
line 492
;492:	for (i = 0, k = 0; i < PLAYERGRID_ROWS; i++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $374
JUMPV
LABELV $371
line 493
;493:		x = 50;
ADDRLP4 4
CNSTI4 50
ASGNI4
line 494
;494:		for (j = 0; j < PLAYERGRID_COLS; j++, k++) {
ADDRLP4 12
CNSTI4 0
ASGNI4
LABELV $375
line 495
;495:			s_playermodel.pics[k].generic.type  = MTYPE_BITMAP;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288
ADDP4
CNSTI4 6
ASGNI4
line 496
;496:			s_playermodel.pics[k].generic.flags = QMF_LEFT_JUSTIFY | QMF_INACTIVE;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+44
ADDP4
CNSTU4 16388
ASGNU4
line 497
;497:			s_playermodel.pics[k].generic.x     = x;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+12
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 498
;498:			s_playermodel.pics[k].generic.y     = y;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+16
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 499
;499:			s_playermodel.pics[k].width         = 64;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+80
ADDP4
CNSTI4 64
ASGNI4
line 500
;500:			s_playermodel.pics[k].height        = 64;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+84
ADDP4
CNSTI4 64
ASGNI4
line 501
;501:			s_playermodel.pics[k].focuspic      = MODEL_SELECTED;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+64
ADDP4
ADDRGP4 $71
ASGNP4
line 502
;502:			s_playermodel.pics[k].focuscolor    = colorRed;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288+88
ADDP4
ADDRGP4 colorRed
ASGNP4
line 504
;503:
;504:			s_playermodel.picbuttons[k].generic.type     = MTYPE_BITMAP;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760
ADDP4
CNSTI4 6
ASGNI4
line 505
;505:			s_playermodel.picbuttons[k].generic.flags    = QMF_LEFT_JUSTIFY | QMF_NODEFAULTINIT | QMF_PULSEIFFOCUS;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+44
ADDP4
CNSTU4 33028
ASGNU4
line 506
;506:			s_playermodel.picbuttons[k].generic.id       = ID_PLAYERPIC0 + k;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+8
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 507
;507:			s_playermodel.picbuttons[k].generic.callback = PlayerModel_PicEvent;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+48
ADDP4
ADDRGP4 PlayerModel_PicEvent
ASGNP4
line 508
;508:			s_playermodel.picbuttons[k].generic.x        = x - 16;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+12
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 509
;509:			s_playermodel.picbuttons[k].generic.y        = y - 16;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+16
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 16
SUBI4
ASGNI4
line 510
;510:			s_playermodel.picbuttons[k].generic.left     = x;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+20
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 511
;511:			s_playermodel.picbuttons[k].generic.top      = y;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+24
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 512
;512:			s_playermodel.picbuttons[k].generic.right    = x + 64;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+28
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 513
;513:			s_playermodel.picbuttons[k].generic.bottom   = y + 64;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+32
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ASGNI4
line 514
;514:			s_playermodel.picbuttons[k].width            = 128;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+80
ADDP4
CNSTI4 128
ASGNI4
line 515
;515:			s_playermodel.picbuttons[k].height           = 128;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+84
ADDP4
CNSTI4 128
ASGNI4
line 516
;516:			s_playermodel.picbuttons[k].focuspic         = MODEL_SELECT;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+64
ADDP4
ADDRGP4 $70
ASGNP4
line 517
;517:			s_playermodel.picbuttons[k].focuscolor       = colorRed;
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760+88
ADDP4
ADDRGP4 colorRed
ASGNP4
line 519
;518:
;519:			x += 64 + 6;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 520
;520:		}
LABELV $376
line 494
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 4
LTI4 $375
line 521
;521:		y += 64 + 6;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 70
ADDI4
ASGNI4
line 522
;522:	}
LABELV $372
line 492
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $374
ADDRLP4 16
INDIRI4
CNSTI4 4
LTI4 $371
line 524
;523:
;524:	s_playermodel.playername.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_playermodel+4196
CNSTI4 9
ASGNI4
line 525
;525:	s_playermodel.playername.generic.flags = QMF_CENTER_JUSTIFY | QMF_INACTIVE;
ADDRGP4 s_playermodel+4196+44
CNSTU4 16392
ASGNU4
line 526
;526:	s_playermodel.playername.generic.x     = 320;
ADDRGP4 s_playermodel+4196+12
CNSTI4 320
ASGNI4
line 527
;527:	s_playermodel.playername.generic.y     = 440;
ADDRGP4 s_playermodel+4196+16
CNSTI4 440
ASGNI4
line 528
;528:	s_playermodel.playername.string        = playername;
ADDRGP4 s_playermodel+4196+64
ADDRGP4 $314
ASGNP4
line 529
;529:	s_playermodel.playername.style         = UI_CENTER;
ADDRGP4 s_playermodel+4196+68
CNSTI4 1
ASGNI4
line 530
;530:	s_playermodel.playername.color         = text_color_normal;
ADDRGP4 s_playermodel+4196+72
ADDRGP4 text_color_normal
ASGNP4
line 532
;531:
;532:	s_playermodel.modelname.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_playermodel+4044
CNSTI4 9
ASGNI4
line 533
;533:	s_playermodel.modelname.generic.flags = QMF_CENTER_JUSTIFY | QMF_INACTIVE;
ADDRGP4 s_playermodel+4044+44
CNSTU4 16392
ASGNU4
line 534
;534:	s_playermodel.modelname.generic.x     = 497;
ADDRGP4 s_playermodel+4044+12
CNSTI4 497
ASGNI4
line 535
;535:	s_playermodel.modelname.generic.y     = 54;
ADDRGP4 s_playermodel+4044+16
CNSTI4 54
ASGNI4
line 536
;536:	s_playermodel.modelname.string        = modelname;
ADDRGP4 s_playermodel+4044+64
ADDRGP4 $315
ASGNP4
line 537
;537:	s_playermodel.modelname.style         = UI_CENTER;
ADDRGP4 s_playermodel+4044+68
CNSTI4 1
ASGNI4
line 538
;538:	s_playermodel.modelname.color         = text_color_normal;
ADDRGP4 s_playermodel+4044+72
ADDRGP4 text_color_normal
ASGNP4
line 540
;539:
;540:	s_playermodel.skinname.generic.type  = MTYPE_PTEXT;
ADDRGP4 s_playermodel+4120
CNSTI4 9
ASGNI4
line 541
;541:	s_playermodel.skinname.generic.flags = QMF_CENTER_JUSTIFY | QMF_INACTIVE;
ADDRGP4 s_playermodel+4120+44
CNSTU4 16392
ASGNU4
line 542
;542:	s_playermodel.skinname.generic.x     = 497;
ADDRGP4 s_playermodel+4120+12
CNSTI4 497
ASGNI4
line 543
;543:	s_playermodel.skinname.generic.y     = 394;
ADDRGP4 s_playermodel+4120+16
CNSTI4 394
ASGNI4
line 544
;544:	s_playermodel.skinname.string        = skinname;
ADDRGP4 s_playermodel+4120+64
ADDRGP4 $316
ASGNP4
line 545
;545:	s_playermodel.skinname.style         = UI_CENTER;
ADDRGP4 s_playermodel+4120+68
CNSTI4 1
ASGNI4
line 546
;546:	s_playermodel.skinname.color         = text_color_normal;
ADDRGP4 s_playermodel+4120+72
ADDRGP4 text_color_normal
ASGNP4
line 548
;547:
;548:	s_playermodel.player.generic.type      = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3676
CNSTI4 6
ASGNI4
line 549
;549:	s_playermodel.player.generic.flags     = QMF_INACTIVE;
ADDRGP4 s_playermodel+3676+44
CNSTU4 16384
ASGNU4
line 550
;550:	s_playermodel.player.generic.ownerdraw = PlayerModel_DrawPlayer;
ADDRGP4 s_playermodel+3676+56
ADDRGP4 PlayerModel_DrawPlayer
ASGNP4
line 551
;551:	s_playermodel.player.generic.x         = 400;
ADDRGP4 s_playermodel+3676+12
CNSTI4 400
ASGNI4
line 552
;552:	s_playermodel.player.generic.y         = -40;
ADDRGP4 s_playermodel+3676+16
CNSTI4 -40
ASGNI4
line 553
;553:	s_playermodel.player.width             = 32 * 10;
ADDRGP4 s_playermodel+3676+80
CNSTI4 320
ASGNI4
line 554
;554:	s_playermodel.player.height            = 56 * 10;
ADDRGP4 s_playermodel+3676+84
CNSTI4 560
ASGNI4
line 556
;555:
;556:	s_playermodel.arrows.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3768
CNSTI4 6
ASGNI4
line 557
;557:	s_playermodel.arrows.generic.name  = MODEL_ARROWS;
ADDRGP4 s_playermodel+3768+4
ADDRGP4 $75
ASGNP4
line 558
;558:	s_playermodel.arrows.generic.flags = QMF_INACTIVE;
ADDRGP4 s_playermodel+3768+44
CNSTU4 16384
ASGNU4
line 559
;559:	s_playermodel.arrows.generic.x     = 125;
ADDRGP4 s_playermodel+3768+12
CNSTI4 125
ASGNI4
line 560
;560:	s_playermodel.arrows.generic.y     = 340;
ADDRGP4 s_playermodel+3768+16
CNSTI4 340
ASGNI4
line 561
;561:	s_playermodel.arrows.width         = 128;
ADDRGP4 s_playermodel+3768+80
CNSTI4 128
ASGNI4
line 562
;562:	s_playermodel.arrows.height        = 32;
ADDRGP4 s_playermodel+3768+84
CNSTI4 32
ASGNI4
line 564
;563:
;564:	s_playermodel.left.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3860
CNSTI4 6
ASGNI4
line 565
;565:	s_playermodel.left.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_playermodel+3860+44
CNSTU4 260
ASGNU4
line 566
;566:	s_playermodel.left.generic.callback = PlayerModel_MenuEvent;
ADDRGP4 s_playermodel+3860+48
ADDRGP4 PlayerModel_MenuEvent
ASGNP4
line 567
;567:	s_playermodel.left.generic.id       = ID_PREVPAGE;
ADDRGP4 s_playermodel+3860+8
CNSTI4 100
ASGNI4
line 568
;568:	s_playermodel.left.generic.x        = 125;
ADDRGP4 s_playermodel+3860+12
CNSTI4 125
ASGNI4
line 569
;569:	s_playermodel.left.generic.y        = 340;
ADDRGP4 s_playermodel+3860+16
CNSTI4 340
ASGNI4
line 570
;570:	s_playermodel.left.width            = 64;
ADDRGP4 s_playermodel+3860+80
CNSTI4 64
ASGNI4
line 571
;571:	s_playermodel.left.height           = 32;
ADDRGP4 s_playermodel+3860+84
CNSTI4 32
ASGNI4
line 572
;572:	s_playermodel.left.focuspic         = MODEL_ARROWSL;
ADDRGP4 s_playermodel+3860+64
ADDRGP4 $76
ASGNP4
line 574
;573:
;574:	s_playermodel.right.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3952
CNSTI4 6
ASGNI4
line 575
;575:	s_playermodel.right.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_playermodel+3952+44
CNSTU4 260
ASGNU4
line 576
;576:	s_playermodel.right.generic.callback = PlayerModel_MenuEvent;
ADDRGP4 s_playermodel+3952+48
ADDRGP4 PlayerModel_MenuEvent
ASGNP4
line 577
;577:	s_playermodel.right.generic.id       = ID_NEXTPAGE;
ADDRGP4 s_playermodel+3952+8
CNSTI4 101
ASGNI4
line 578
;578:	s_playermodel.right.generic.x        = 125 + 61;
ADDRGP4 s_playermodel+3952+12
CNSTI4 186
ASGNI4
line 579
;579:	s_playermodel.right.generic.y        = 340;
ADDRGP4 s_playermodel+3952+16
CNSTI4 340
ASGNI4
line 580
;580:	s_playermodel.right.width            = 64;
ADDRGP4 s_playermodel+3952+80
CNSTI4 64
ASGNI4
line 581
;581:	s_playermodel.right.height           = 32;
ADDRGP4 s_playermodel+3952+84
CNSTI4 32
ASGNI4
line 582
;582:	s_playermodel.right.focuspic         = MODEL_ARROWSR;
ADDRGP4 s_playermodel+3952+64
ADDRGP4 $77
ASGNP4
line 584
;583:
;584:	s_playermodel.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_playermodel+3584
CNSTI4 6
ASGNI4
line 585
;585:	s_playermodel.back.generic.name     = MODEL_BACK0;
ADDRGP4 s_playermodel+3584+4
ADDRGP4 $68
ASGNP4
line 586
;586:	s_playermodel.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_playermodel+3584+44
CNSTU4 260
ASGNU4
line 587
;587:	s_playermodel.back.generic.callback = PlayerModel_MenuEvent;
ADDRGP4 s_playermodel+3584+48
ADDRGP4 PlayerModel_MenuEvent
ASGNP4
line 588
;588:	s_playermodel.back.generic.id       = ID_BACK;
ADDRGP4 s_playermodel+3584+8
CNSTI4 102
ASGNI4
line 589
;589:	s_playermodel.back.generic.x        = 0;
ADDRGP4 s_playermodel+3584+12
CNSTI4 0
ASGNI4
line 590
;590:	s_playermodel.back.generic.y        = 480 - 64;
ADDRGP4 s_playermodel+3584+16
CNSTI4 416
ASGNI4
line 591
;591:	s_playermodel.back.width            = 128;
ADDRGP4 s_playermodel+3584+80
CNSTI4 128
ASGNI4
line 592
;592:	s_playermodel.back.height           = 64;
ADDRGP4 s_playermodel+3584+84
CNSTI4 64
ASGNI4
line 593
;593:	s_playermodel.back.focuspic         = MODEL_BACK1;
ADDRGP4 s_playermodel+3584+64
ADDRGP4 $69
ASGNP4
line 595
;594:
;595:	Menu_AddItem(&s_playermodel.menu, &s_playermodel.banner);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3508
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 596
;596:	Menu_AddItem(&s_playermodel.menu, &s_playermodel.framel);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3232
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 597
;597:	Menu_AddItem(&s_playermodel.menu, &s_playermodel.framer);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3324
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 598
;598:	Menu_AddItem(&s_playermodel.menu, &s_playermodel.ports);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3416
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 599
;599:	Menu_AddItem(&s_playermodel.menu, &s_playermodel.playername);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+4196
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 600
;600:	Menu_AddItem(&s_playermodel.menu, &s_playermodel.modelname);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+4044
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 601
;601:	Menu_AddItem(&s_playermodel.menu, &s_playermodel.skinname);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+4120
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 603
;602:
;603:	for (i = 0; i < MAX_MODELSPERPAGE; i++) {
ADDRLP4 16
CNSTI4 0
ASGNI4
LABELV $546
line 604
;604:		Menu_AddItem(&s_playermodel.menu, &s_playermodel.pics[i]);
ADDRGP4 s_playermodel
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 605
;605:		Menu_AddItem(&s_playermodel.menu, &s_playermodel.picbuttons[i]);
ADDRGP4 s_playermodel
ARGP4
ADDRLP4 16
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+1760
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 606
;606:	}
LABELV $547
line 603
ADDRLP4 16
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 16
LTI4 $546
line 608
;607:
;608:	Menu_AddItem(&s_playermodel.menu, &s_playermodel.player);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3676
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 609
;609:	Menu_AddItem(&s_playermodel.menu, &s_playermodel.arrows);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3768
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 610
;610:	Menu_AddItem(&s_playermodel.menu, &s_playermodel.left);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3860
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 611
;611:	Menu_AddItem(&s_playermodel.menu, &s_playermodel.right);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3952
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 612
;612:	Menu_AddItem(&s_playermodel.menu, &s_playermodel.back);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+3584
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 618
;613:
;614:	// find all available models
;615:	//	PlayerModel_BuildList();
;616:
;617:	// set initial states
;618:	PlayerModel_SetMenuItems();
ADDRGP4 PlayerModel_SetMenuItems
CALLV
pop
line 621
;619:
;620:	// update user interface
;621:	PlayerModel_UpdateGrid();
ADDRGP4 PlayerModel_UpdateGrid
CALLV
pop
line 622
;622:	PlayerModel_UpdateModel();
ADDRGP4 PlayerModel_UpdateModel
CALLV
pop
line 623
;623:}
LABELV $313
endproc PlayerModel_MenuInit 24 12
export PlayerModel_Cache
proc PlayerModel_Cache 4 4
line 630
;624:
;625:/*
;626:=================
;627:PlayerModel_Cache
;628:=================
;629:*/
;630:void PlayerModel_Cache(void) {
line 633
;631:	int i;
;632:
;633:	for (i = 0; playermodel_artlist[i]; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $561
JUMPV
LABELV $558
line 634
;634:		trap_R_RegisterShaderNoMip(playermodel_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playermodel_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 635
;635:	}
LABELV $559
line 633
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $561
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 playermodel_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $558
line 637
;636:
;637:	PlayerModel_BuildList();
ADDRGP4 PlayerModel_BuildList
CALLV
pop
line 638
;638:	for (i = 0; i < s_playermodel.nummodels; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $565
JUMPV
LABELV $562
line 639
;639:		trap_R_RegisterShaderNoMip(s_playermodel.modelnames[i]);
ADDRLP4 0
INDIRI4
CNSTI4 7
LSHI4
ADDRGP4 s_playermodel+5384
ADDP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 640
;640:	}
LABELV $563
line 638
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $565
ADDRLP4 0
INDIRI4
ADDRGP4 s_playermodel+5380
INDIRI4
LTI4 $562
line 641
;641:}
LABELV $557
endproc PlayerModel_Cache 4 4
export UI_PlayerModelMenu
proc UI_PlayerModelMenu 0 8
line 643
;642:
;643:void UI_PlayerModelMenu(void) {
line 644
;644:	PlayerModel_MenuInit();
ADDRGP4 PlayerModel_MenuInit
CALLV
pop
line 646
;645:
;646:	UI_PushMenu(&s_playermodel.menu);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 648
;647:
;648:	Menu_SetCursorToItem(&s_playermodel.menu, &s_playermodel.pics[s_playermodel.selectedmodel % MAX_MODELSPERPAGE]);
ADDRGP4 s_playermodel
ARGP4
ADDRGP4 s_playermodel+38224
INDIRI4
CNSTI4 16
MODI4
CNSTI4 92
MULI4
ADDRGP4 s_playermodel+288
ADDP4
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 649
;649:}
LABELV $568
endproc UI_PlayerModelMenu 0 8
bss
align 4
LABELV s_playermodel
skip 38228
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
LABELV $327
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 32
byte 1 77
byte 1 79
byte 1 68
byte 1 69
byte 1 76
byte 1 0
align 1
LABELV $282
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $272
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 97
byte 1 110
byte 1 110
byte 1 111
byte 1 117
byte 1 110
byte 1 99
byte 1 101
byte 1 47
byte 1 37
byte 1 115
byte 1 95
byte 1 119
byte 1 105
byte 1 110
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $269
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $257
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $256
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $254
byte 1 46
byte 1 46
byte 1 0
align 1
LABELV $253
byte 1 46
byte 1 0
align 1
LABELV $243
byte 1 47
byte 1 0
align 1
LABELV $242
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $239
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 115
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $235
byte 1 76
byte 1 79
byte 1 87
byte 1 32
byte 1 77
byte 1 69
byte 1 77
byte 1 79
byte 1 82
byte 1 89
byte 1 0
align 1
LABELV $212
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 0
align 1
LABELV $211
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 0
align 1
LABELV $146
byte 1 104
byte 1 101
byte 1 97
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $144
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $77
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $76
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 108
byte 1 0
align 1
LABELV $75
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 103
byte 1 115
byte 1 95
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 115
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $74
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
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $73
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
LABELV $72
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
byte 1 108
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
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
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
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 95
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
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
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
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
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
