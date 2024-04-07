code
proc PlayerIcon 80 20
file "../../../../code/q3_ui/ui_splevel.c"
line 105
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/*
;4:=============================================================================
;5:
;6:SINGLE PLAYER LEVEL SELECT MENU
;7:
;8:=============================================================================
;9:*/
;10:
;11:#include "ui_local.h"
;12:
;13:#define ART_LEVELFRAME_FOCUS    "menu/art/maps_select"
;14:#define ART_LEVELFRAME_SELECTED "menu/art/maps_selected"
;15:#define ART_ARROW               "menu/art/narrow_0"
;16:#define ART_ARROW_FOCUS         "menu/art/narrow_1"
;17:#define ART_MAP_UNKNOWN         "menu/art/unknownmap"
;18:#define ART_MAP_COMPLETE1       "menu/art/level_complete1"
;19:#define ART_MAP_COMPLETE2       "menu/art/level_complete2"
;20:#define ART_MAP_COMPLETE3       "menu/art/level_complete3"
;21:#define ART_MAP_COMPLETE4       "menu/art/level_complete4"
;22:#define ART_MAP_COMPLETE5       "menu/art/level_complete5"
;23:#define ART_BACK0               "menu/art/back_0"
;24:#define ART_BACK1               "menu/art/back_1"
;25:#define ART_FIGHT0              "menu/art/fight_0"
;26:#define ART_FIGHT1              "menu/art/fight_1"
;27:#define ART_RESET0              "menu/art/reset_0"
;28:#define ART_RESET1              "menu/art/reset_1"
;29:#define ART_CUSTOM0             "menu/art/skirmish_0"
;30:#define ART_CUSTOM1             "menu/art/skirmish_1"
;31:
;32:#define ID_LEFTARROW  10
;33:#define ID_PICTURE0   11
;34:#define ID_PICTURE1   12
;35:#define ID_PICTURE2   13
;36:#define ID_PICTURE3   14
;37:#define ID_RIGHTARROW 15
;38:#define ID_PLAYERPIC  16
;39:#define ID_AWARD1     17
;40:#define ID_AWARD2     18
;41:#define ID_AWARD3     19
;42:#define ID_AWARD4     20
;43:#define ID_AWARD5     21
;44:#define ID_AWARD6     22
;45:#define ID_BACK       23
;46:#define ID_RESET      24
;47:#define ID_CUSTOM     25
;48:#define ID_NEXT       26
;49:
;50:#define PLAYER_Y 314
;51:#define AWARDS_Y (PLAYER_Y + 26)
;52:
;53:typedef struct {
;54:	menuframework_s menu;
;55:	menutext_s      item_banner;
;56:	menubitmap_s    item_leftarrow;
;57:	menubitmap_s    item_maps[4];
;58:	menubitmap_s    item_rightarrow;
;59:	menubitmap_s    item_player;
;60:	menubitmap_s    item_awards[6];
;61:	menubitmap_s    item_back;
;62:	menubitmap_s    item_reset;
;63:	menubitmap_s    item_custom;
;64:	menubitmap_s    item_next;
;65:	menubitmap_s    item_null;
;66:
;67:	qboolean        reinit;
;68:
;69:	const char*     selectedArenaInfo;
;70:	int             numMaps;
;71:	char            levelPicNames[4][MAX_QPATH];
;72:	char            levelNames[4][16];
;73:	int             levelScores[4];
;74:	int             levelScoresSkill[4];
;75:	qhandle_t       levelSelectedPic;
;76:	qhandle_t       levelFocusPic;
;77:	qhandle_t       levelCompletePic[5];
;78:
;79:	char            playerModel[MAX_QPATH];
;80:	char            playerPicName[MAX_QPATH];
;81:	int             awardLevels[6];
;82:	sfxHandle_t     awardSounds[6];
;83:
;84:	int             numBots;
;85:	qhandle_t       botPics[7];
;86:	char            botNames[7][10];
;87:} levelMenuInfo_t;
;88:
;89:static levelMenuInfo_t levelMenuInfo;
;90:
;91:static int             selectedArenaSet;
;92:static int             selectedArena;
;93:static int             currentSet;
;94:static int             currentGame;
;95:static int             trainingTier;
;96:static int             finalTier;
;97:static int             minTier;
;98:static int             maxTier;
;99:
;100:/*
;101:=================
;102:PlayerIcon
;103:=================
;104:*/
;105:static void PlayerIcon(const char* modelAndSkin, char* iconName, int iconNameMaxSize) {
line 109
;106:	char* skin;
;107:	char  model[MAX_QPATH];
;108:
;109:	Q_strncpyz(model, modelAndSkin, sizeof(model));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 110
;110:	skin = Q_strrchr(model, '/');
ADDRLP4 4
ARGP4
CNSTI4 47
ARGI4
ADDRLP4 68
ADDRGP4 Q_strrchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 68
INDIRP4
ASGNP4
line 111
;111:	if (skin) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $70
line 112
;112:		*skin++ = '\0';
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI1 0
ASGNI1
line 113
;113:	} else {
ADDRGP4 $71
JUMPV
LABELV $70
line 114
;114:		skin = "default";
ADDRLP4 0
ADDRGP4 $72
ASGNP4
line 115
;115:	}
LABELV $71
line 117
;116:
;117:	Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_%s.tga", model, skin);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $73
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 119
;118:
;119:	if (!trap_R_RegisterShaderNoMip(iconName) && Q_stricmp(skin, "default") != 0) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $74
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $72
ARGP4
ADDRLP4 76
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
EQI4 $74
line 120
;120:		Com_sprintf(iconName, iconNameMaxSize, "models/players/%s/icon_default.tga", model);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 $76
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 121
;121:	}
LABELV $74
line 122
;122:}
LABELV $69
endproc PlayerIcon 80 20
proc PlayerIconHandle 68 12
line 129
;123:
;124:/*
;125:=================
;126:PlayerIconhandle
;127:=================
;128:*/
;129:static qhandle_t PlayerIconHandle(const char* modelAndSkin) {
line 132
;130:	char iconName[MAX_QPATH];
;131:
;132:	PlayerIcon(modelAndSkin, iconName, sizeof(iconName));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 133
;133:	return trap_R_RegisterShaderNoMip(iconName);
ADDRLP4 0
ARGP4
ADDRLP4 64
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
RETI4
LABELV $77
endproc PlayerIconHandle 68 12
proc UI_SPLevelMenu_SetBots 1060 12
line 141
;134:}
;135:
;136:/*
;137:=================
;138:UI_SPLevelMenu_SetBots
;139:=================
;140:*/
;141:static void UI_SPLevelMenu_SetBots(void) {
line 147
;142:	char* p;
;143:	char* bot;
;144:	char* botInfo;
;145:	char  bots[MAX_INFO_STRING];
;146:
;147:	levelMenuInfo.numBots = 0;
ADDRGP4 levelMenuInfo+2588
CNSTI4 0
ASGNI4
line 148
;148:	if (selectedArenaSet > currentSet) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $80
line 149
;149:		return;
ADDRGP4 $78
JUMPV
LABELV $80
line 152
;150:	}
;151:
;152:	Q_strncpyz(bots, Info_ValueForKey(levelMenuInfo.selectedArenaInfo, "bots"), sizeof(bots));
ADDRGP4 levelMenuInfo+2024
INDIRP4
ARGP4
ADDRGP4 $83
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 12
ARGP4
ADDRLP4 1036
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 154
;153:
;154:	p = &bots[0];
ADDRLP4 0
ADDRLP4 12
ASGNP4
ADDRGP4 $85
JUMPV
line 155
;155:	while (*p && levelMenuInfo.numBots < 7) {
LABELV $88
line 157
;156:		// skip spaces
;157:		while (*p == ' ') {
line 158
;158:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 159
;159:		}
LABELV $89
line 157
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $88
line 160
;160:		if (!*p) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $91
line 161
;161:			break;
ADDRGP4 $86
JUMPV
LABELV $91
line 165
;162:		}
;163:
;164:		// mark start of bot name
;165:		bot = p;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $94
JUMPV
LABELV $93
line 168
;166:
;167:		// skip until space of null
;168:		while (*p && *p != ' ') {
line 169
;169:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 170
;170:		}
LABELV $94
line 168
ADDRLP4 1040
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $96
ADDRLP4 1040
INDIRI4
CNSTI4 32
NEI4 $93
LABELV $96
line 171
;171:		if (*p) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $97
line 172
;172:			*p++ = 0;
ADDRLP4 1044
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 1044
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 1044
INDIRP4
CNSTI1 0
ASGNI1
line 173
;173:		}
LABELV $97
line 175
;174:
;175:		botInfo = UI_GetBotInfoByName(bot);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 UI_GetBotInfoByName
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1044
INDIRP4
ASGNP4
line 176
;176:		if (botInfo) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $99
line 177
;177:			levelMenuInfo.botPics[levelMenuInfo.numBots] = PlayerIconHandle(Info_ValueForKey(botInfo, "model"));
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $103
ARGP4
ADDRLP4 1048
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1048
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 PlayerIconHandle
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2588
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2592
ADDP4
ADDRLP4 1052
INDIRI4
ASGNI4
line 178
;178:			Q_strncpyz(levelMenuInfo.botNames[levelMenuInfo.numBots], Info_ValueForKey(botInfo, "name"), 10);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $106
ARGP4
ADDRLP4 1056
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 levelMenuInfo+2588
INDIRI4
CNSTI4 10
MULI4
ADDRGP4 levelMenuInfo+2620
ADDP4
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 179
;179:		} else {
ADDRGP4 $100
JUMPV
LABELV $99
line 180
;180:			levelMenuInfo.botPics[levelMenuInfo.numBots] = 0;
ADDRGP4 levelMenuInfo+2588
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2592
ADDP4
CNSTI4 0
ASGNI4
line 181
;181:			Q_strncpyz(levelMenuInfo.botNames[levelMenuInfo.numBots], bot, 10);
ADDRGP4 levelMenuInfo+2588
INDIRI4
CNSTI4 10
MULI4
ADDRGP4 levelMenuInfo+2620
ADDP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 182
;182:		}
LABELV $100
line 183
;183:		Q_CleanStr(levelMenuInfo.botNames[levelMenuInfo.numBots]);
ADDRGP4 levelMenuInfo+2588
INDIRI4
CNSTI4 10
MULI4
ADDRGP4 levelMenuInfo+2620
ADDP4
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 184
;184:		levelMenuInfo.numBots++;
ADDRLP4 1048
ADDRGP4 levelMenuInfo+2588
ASGNP4
ADDRLP4 1048
INDIRP4
ADDRLP4 1048
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 185
;185:	}
LABELV $85
line 155
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $114
ADDRGP4 levelMenuInfo+2588
INDIRI4
CNSTI4 7
LTI4 $89
LABELV $114
LABELV $86
line 186
;186:}
LABELV $78
endproc UI_SPLevelMenu_SetBots 1060 12
proc UI_SPLevelMenu_SetMenuArena 80 16
line 193
;187:
;188:/*
;189:=================
;190:UI_SPLevelMenu_SetMenuItems
;191:=================
;192:*/
;193:static void UI_SPLevelMenu_SetMenuArena(int n, int level, const char* arenaInfo) {
line 196
;194:	char map[MAX_QPATH];
;195:
;196:	Q_strncpyz(map, Info_ValueForKey(arenaInfo, "map"), sizeof(map));
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 64
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 198
;197:
;198:	Q_strncpyz(levelMenuInfo.levelNames[n], map, sizeof(levelMenuInfo.levelNames[n]));
ADDRFP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2288
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 199
;199:	Q_strupr(levelMenuInfo.levelNames[n]);
ADDRFP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2288
ADDP4
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 201
;200:
;201:	UI_GetBestScore(level, &levelMenuInfo.levelScores[n], &levelMenuInfo.levelScoresSkill[n]);
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 68
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2352
ADDP4
ARGP4
ADDRLP4 68
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2368
ADDP4
ARGP4
ADDRGP4 UI_GetBestScore
CALLV
pop
line 202
;202:	if (levelMenuInfo.levelScores[n] > 8) {
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2352
ADDP4
INDIRI4
CNSTI4 8
LEI4 $122
line 203
;203:		levelMenuInfo.levelScores[n] = 8;
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2352
ADDP4
CNSTI4 8
ASGNI4
line 204
;204:	}
LABELV $122
line 206
;205:
;206:	Com_sprintf(levelMenuInfo.levelPicNames[n], sizeof(levelMenuInfo.levelPicNames[n]), "levelshots/%s.tga", map);
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+2032
ADDP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $128
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 207
;207:	if (!trap_R_RegisterShaderNoMip(levelMenuInfo.levelPicNames[n])) {
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+2032
ADDP4
ARGP4
ADDRLP4 72
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $129
line 208
;208:		strcpy(levelMenuInfo.levelPicNames[n], ART_MAP_UNKNOWN);
ADDRFP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRGP4 levelMenuInfo+2032
ADDP4
ARGP4
ADDRGP4 $133
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 209
;209:	}
LABELV $129
line 210
;210:	levelMenuInfo.item_maps[n].shader = 0;
ADDRFP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+72
ADDP4
CNSTI4 0
ASGNI4
line 211
;211:	if (selectedArenaSet > currentSet) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $136
line 212
;212:		levelMenuInfo.item_maps[n].generic.flags |= QMF_GRAYED;
ADDRLP4 76
ADDRFP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+44
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTU4 8192
BORU4
ASGNU4
line 213
;213:	} else {
ADDRGP4 $137
JUMPV
LABELV $136
line 214
;214:		levelMenuInfo.item_maps[n].generic.flags &= ~QMF_GRAYED;
ADDRLP4 76
ADDRFP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+44
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTI4 -8193
CVIU4 4
BANDU4
ASGNU4
line 215
;215:	}
LABELV $137
line 217
;216:
;217:	levelMenuInfo.item_maps[n].generic.flags &= ~QMF_INACTIVE;
ADDRLP4 76
ADDRFP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+44
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRU4
CNSTI4 -16385
CVIU4 4
BANDU4
ASGNU4
line 218
;218:}
LABELV $115
endproc UI_SPLevelMenu_SetMenuArena 80 16
proc UI_SPLevelMenu_SetMenuItems 44 12
line 220
;219:
;220:static void UI_SPLevelMenu_SetMenuItems(void) {
line 225
;221:	int         n;
;222:	int         level;
;223:	const char* arenaInfo;
;224:
;225:	if (selectedArenaSet > currentSet) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $145
line 226
;226:		selectedArena = -1;
ADDRGP4 selectedArena
CNSTI4 -1
ASGNI4
line 227
;227:	} else if (selectedArena == -1) {
ADDRGP4 $146
JUMPV
LABELV $145
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $147
line 228
;228:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 229
;229:	}
LABELV $147
LABELV $146
line 231
;230:
;231:	if (selectedArenaSet == trainingTier || selectedArenaSet == finalTier) {
ADDRLP4 12
ADDRGP4 selectedArenaSet
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRGP4 trainingTier
INDIRI4
EQI4 $151
ADDRLP4 12
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $149
LABELV $151
line 232
;232:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 233
;233:	}
LABELV $149
line 235
;234:
;235:	if (selectedArena != -1) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
EQI4 $152
line 236
;236:		trap_Cvar_SetValue("ui_spSelection", selectedArenaSet * ARENAS_PER_TIER + selectedArena);
ADDRGP4 $154
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 237
;237:	}
LABELV $152
line 239
;238:
;239:	if (selectedArenaSet == trainingTier) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 trainingTier
INDIRI4
NEI4 $155
line 240
;240:		arenaInfo = UI_GetSpecialArenaInfo("training");
ADDRGP4 $157
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 241
;241:		level     = atoi(Info_ValueForKey(arenaInfo, "num"));
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $158
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
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 242
;242:		UI_SPLevelMenu_SetMenuArena(0, level, arenaInfo);
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 243
;243:		levelMenuInfo.selectedArenaInfo = arenaInfo;
ADDRGP4 levelMenuInfo+2024
ADDRLP4 8
INDIRP4
ASGNP4
line 245
;244:
;245:		levelMenuInfo.item_maps[0].generic.x = 256;
ADDRGP4 levelMenuInfo+456+12
CNSTI4 256
ASGNI4
line 246
;246:		Bitmap_Init(&levelMenuInfo.item_maps[0]);
ADDRGP4 levelMenuInfo+456
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 247
;247:		levelMenuInfo.item_maps[0].generic.bottom += 32;
ADDRLP4 28
ADDRGP4 levelMenuInfo+456+32
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 248
;248:		levelMenuInfo.numMaps = 1;
ADDRGP4 levelMenuInfo+2028
CNSTI4 1
ASGNI4
line 250
;249:
;250:		levelMenuInfo.item_maps[1].generic.flags |= QMF_INACTIVE;
ADDRLP4 32
ADDRGP4 levelMenuInfo+456+92+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 251
;251:		levelMenuInfo.item_maps[2].generic.flags |= QMF_INACTIVE;
ADDRLP4 36
ADDRGP4 levelMenuInfo+456+184+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 252
;252:		levelMenuInfo.item_maps[3].generic.flags |= QMF_INACTIVE;
ADDRLP4 40
ADDRGP4 levelMenuInfo+456+276+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 253
;253:		levelMenuInfo.levelPicNames[1][0] = 0;
ADDRGP4 levelMenuInfo+2032+64
CNSTI1 0
ASGNI1
line 254
;254:		levelMenuInfo.levelPicNames[2][0] = 0;
ADDRGP4 levelMenuInfo+2032+128
CNSTI1 0
ASGNI1
line 255
;255:		levelMenuInfo.levelPicNames[3][0] = 0;
ADDRGP4 levelMenuInfo+2032+192
CNSTI1 0
ASGNI1
line 256
;256:		levelMenuInfo.item_maps[1].shader = 0;
ADDRGP4 levelMenuInfo+456+92+72
CNSTI4 0
ASGNI4
line 257
;257:		levelMenuInfo.item_maps[2].shader = 0;
ADDRGP4 levelMenuInfo+456+184+72
CNSTI4 0
ASGNI4
line 258
;258:		levelMenuInfo.item_maps[3].shader = 0;
ADDRGP4 levelMenuInfo+456+276+72
CNSTI4 0
ASGNI4
line 259
;259:	} else if (selectedArenaSet == finalTier) {
ADDRGP4 $156
JUMPV
LABELV $155
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $190
line 260
;260:		arenaInfo = UI_GetSpecialArenaInfo("final");
ADDRGP4 $192
ARGP4
ADDRLP4 16
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 261
;261:		level     = atoi(Info_ValueForKey(arenaInfo, "num"));
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $158
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
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
line 262
;262:		UI_SPLevelMenu_SetMenuArena(0, level, arenaInfo);
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 263
;263:		levelMenuInfo.selectedArenaInfo = arenaInfo;
ADDRGP4 levelMenuInfo+2024
ADDRLP4 8
INDIRP4
ASGNP4
line 265
;264:
;265:		levelMenuInfo.item_maps[0].generic.x = 256;
ADDRGP4 levelMenuInfo+456+12
CNSTI4 256
ASGNI4
line 266
;266:		Bitmap_Init(&levelMenuInfo.item_maps[0]);
ADDRGP4 levelMenuInfo+456
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 267
;267:		levelMenuInfo.item_maps[0].generic.bottom += 32;
ADDRLP4 28
ADDRGP4 levelMenuInfo+456+32
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 268
;268:		levelMenuInfo.numMaps = 1;
ADDRGP4 levelMenuInfo+2028
CNSTI4 1
ASGNI4
line 270
;269:
;270:		levelMenuInfo.item_maps[1].generic.flags |= QMF_INACTIVE;
ADDRLP4 32
ADDRGP4 levelMenuInfo+456+92+44
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 271
;271:		levelMenuInfo.item_maps[2].generic.flags |= QMF_INACTIVE;
ADDRLP4 36
ADDRGP4 levelMenuInfo+456+184+44
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 272
;272:		levelMenuInfo.item_maps[3].generic.flags |= QMF_INACTIVE;
ADDRLP4 40
ADDRGP4 levelMenuInfo+456+276+44
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRU4
CNSTU4 16384
BORU4
ASGNU4
line 273
;273:		levelMenuInfo.levelPicNames[1][0] = 0;
ADDRGP4 levelMenuInfo+2032+64
CNSTI1 0
ASGNI1
line 274
;274:		levelMenuInfo.levelPicNames[2][0] = 0;
ADDRGP4 levelMenuInfo+2032+128
CNSTI1 0
ASGNI1
line 275
;275:		levelMenuInfo.levelPicNames[3][0] = 0;
ADDRGP4 levelMenuInfo+2032+192
CNSTI1 0
ASGNI1
line 276
;276:		levelMenuInfo.item_maps[1].shader = 0;
ADDRGP4 levelMenuInfo+456+92+72
CNSTI4 0
ASGNI4
line 277
;277:		levelMenuInfo.item_maps[2].shader = 0;
ADDRGP4 levelMenuInfo+456+184+72
CNSTI4 0
ASGNI4
line 278
;278:		levelMenuInfo.item_maps[3].shader = 0;
ADDRGP4 levelMenuInfo+456+276+72
CNSTI4 0
ASGNI4
line 279
;279:	} else {
ADDRGP4 $191
JUMPV
LABELV $190
line 280
;280:		levelMenuInfo.item_maps[0].generic.x = 46;
ADDRGP4 levelMenuInfo+456+12
CNSTI4 46
ASGNI4
line 281
;281:		Bitmap_Init(&levelMenuInfo.item_maps[0]);
ADDRGP4 levelMenuInfo+456
ARGP4
ADDRGP4 Bitmap_Init
CALLV
pop
line 282
;282:		levelMenuInfo.item_maps[0].generic.bottom += 18;
ADDRLP4 16
ADDRGP4 levelMenuInfo+456+32
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 283
;283:		levelMenuInfo.numMaps = 4;
ADDRGP4 levelMenuInfo+2028
CNSTI4 4
ASGNI4
line 285
;284:
;285:		for (n = 0; n < 4; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $230
line 286
;286:			level     = selectedArenaSet * ARENAS_PER_TIER + n;
ADDRLP4 4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 287
;287:			arenaInfo = UI_GetArenaInfoByNumber(level);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 288
;288:			UI_SPLevelMenu_SetMenuArena(n, level, arenaInfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 UI_SPLevelMenu_SetMenuArena
CALLV
pop
line 289
;289:		}
LABELV $231
line 285
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $230
line 291
;290:
;291:		if (selectedArena != -1) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
EQI4 $234
line 292
;292:			levelMenuInfo.selectedArenaInfo = UI_GetArenaInfoByNumber(selectedArenaSet * ARENAS_PER_TIER + selectedArena);
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
ARGI4
ADDRLP4 20
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRGP4 levelMenuInfo+2024
ADDRLP4 20
INDIRP4
ASGNP4
line 293
;293:		}
LABELV $234
line 294
;294:	}
LABELV $191
LABELV $156
line 297
;295:
;296:	// enable/disable arrows when they are valid/invalid
;297:	if (selectedArenaSet == minTier) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 minTier
INDIRI4
NEI4 $237
line 298
;298:		levelMenuInfo.item_leftarrow.generic.flags |= (QMF_INACTIVE | QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 levelMenuInfo+364+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 299
;299:	} else {
ADDRGP4 $238
JUMPV
LABELV $237
line 300
;300:		levelMenuInfo.item_leftarrow.generic.flags &= ~(QMF_INACTIVE | QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 levelMenuInfo+364+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 301
;301:	}
LABELV $238
line 303
;302:
;303:	if (selectedArenaSet == maxTier) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 maxTier
INDIRI4
NEI4 $243
line 304
;304:		levelMenuInfo.item_rightarrow.generic.flags |= (QMF_INACTIVE | QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 levelMenuInfo+824+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTU4 20480
BORU4
ASGNU4
line 305
;305:	} else {
ADDRGP4 $244
JUMPV
LABELV $243
line 306
;306:		levelMenuInfo.item_rightarrow.generic.flags &= ~(QMF_INACTIVE | QMF_HIDDEN);
ADDRLP4 16
ADDRGP4 levelMenuInfo+824+44
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTI4 -20481
CVIU4 4
BANDU4
ASGNU4
line 307
;307:	}
LABELV $244
line 309
;308:
;309:	UI_SPLevelMenu_SetBots();
ADDRGP4 UI_SPLevelMenu_SetBots
CALLV
pop
line 310
;310:}
LABELV $144
endproc UI_SPLevelMenu_SetMenuItems 44 12
proc UI_SPLevelMenu_ResetDraw 0 20
line 317
;311:
;312:/*
;313:=================
;314:UI_SPLevelMenu_ResetEvent
;315:=================
;316:*/
;317:static void UI_SPLevelMenu_ResetDraw(void) {
line 318
;318:	UI_DrawProportionalString(SCREEN_WIDTH / 2, 356 + PROP_HEIGHT * 0, "WARNING: This resets all of the", UI_CENTER | UI_SMALLFONT, color_yellow);
CNSTI4 320
ARGI4
CNSTI4 356
ARGI4
ADDRGP4 $250
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 319
;319:	UI_DrawProportionalString(SCREEN_WIDTH / 2, 356 + PROP_HEIGHT * 1, "single player game variables.", UI_CENTER | UI_SMALLFONT, color_yellow);
CNSTI4 320
ARGI4
CNSTI4 383
ARGI4
ADDRGP4 $251
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 320
;320:	UI_DrawProportionalString(SCREEN_WIDTH / 2, 356 + PROP_HEIGHT * 2, "Do this only if you want to", UI_CENTER | UI_SMALLFONT, color_yellow);
CNSTI4 320
ARGI4
CNSTI4 410
ARGI4
ADDRGP4 $252
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 321
;321:	UI_DrawProportionalString(SCREEN_WIDTH / 2, 356 + PROP_HEIGHT * 3, "start over from the beginning.", UI_CENTER | UI_SMALLFONT, color_yellow);
CNSTI4 320
ARGI4
CNSTI4 437
ARGI4
ADDRGP4 $253
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 322
;322:}
LABELV $249
endproc UI_SPLevelMenu_ResetDraw 0 20
proc UI_SPLevelMenu_ResetAction 0 8
line 324
;323:
;324:static void UI_SPLevelMenu_ResetAction(qboolean result) {
line 325
;325:	if (!result) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $255
line 326
;326:		return;
ADDRGP4 $254
JUMPV
LABELV $255
line 330
;327:	}
;328:
;329:	// clear game variables
;330:	UI_NewGame();
ADDRGP4 UI_NewGame
CALLV
pop
line 331
;331:	trap_Cvar_SetValue("ui_spSelection", -4);
ADDRGP4 $154
ARGP4
CNSTF4 3229614080
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 334
;332:
;333:	// make the level select menu re-initialize
;334:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 335
;335:	UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 336
;336:}
LABELV $254
endproc UI_SPLevelMenu_ResetAction 0 8
proc UI_SPLevelMenu_ResetEvent 0 12
line 338
;337:
;338:static void UI_SPLevelMenu_ResetEvent(void* ptr, int event) {
line 339
;339:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $258
line 340
;340:		return;
ADDRGP4 $257
JUMPV
LABELV $258
line 343
;341:	}
;342:
;343:	UI_ConfirmMenu("RESET GAME?", UI_SPLevelMenu_ResetDraw, UI_SPLevelMenu_ResetAction);
ADDRGP4 $260
ARGP4
ADDRGP4 UI_SPLevelMenu_ResetDraw
ARGP4
ADDRGP4 UI_SPLevelMenu_ResetAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 344
;344:}
LABELV $257
endproc UI_SPLevelMenu_ResetEvent 0 12
proc UI_SPLevelMenu_LevelEvent 8 8
line 351
;345:
;346:/*
;347:=================
;348:UI_SPLevelMenu_LevelEvent
;349:=================
;350:*/
;351:static void UI_SPLevelMenu_LevelEvent(void* ptr, int notification) {
line 352
;352:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $262
line 353
;353:		return;
ADDRGP4 $261
JUMPV
LABELV $262
line 356
;354:	}
;355:
;356:	if (selectedArenaSet == trainingTier || selectedArenaSet == finalTier) {
ADDRLP4 0
ADDRGP4 selectedArenaSet
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRGP4 trainingTier
INDIRI4
EQI4 $266
ADDRLP4 0
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $264
LABELV $266
line 357
;357:		return;
ADDRGP4 $261
JUMPV
LABELV $264
line 360
;358:	}
;359:
;360:	selectedArena                   = ((menucommon_s*)ptr)->id - ID_PICTURE0;
ADDRGP4 selectedArena
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 11
SUBI4
ASGNI4
line 361
;361:	levelMenuInfo.selectedArenaInfo = UI_GetArenaInfoByNumber(selectedArenaSet * ARENAS_PER_TIER + selectedArena);
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
ARGI4
ADDRLP4 4
ADDRGP4 UI_GetArenaInfoByNumber
CALLP4
ASGNP4
ADDRGP4 levelMenuInfo+2024
ADDRLP4 4
INDIRP4
ASGNP4
line 362
;362:	UI_SPLevelMenu_SetBots();
ADDRGP4 UI_SPLevelMenu_SetBots
CALLV
pop
line 364
;363:
;364:	trap_Cvar_SetValue("ui_spSelection", selectedArenaSet * ARENAS_PER_TIER + selectedArena);
ADDRGP4 $154
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 selectedArena
INDIRI4
ADDI4
CVIF4 4
ARGF4
ADDRGP4 trap_Cvar_SetValue
CALLV
pop
line 365
;365:}
LABELV $261
endproc UI_SPLevelMenu_LevelEvent 8 8
proc UI_SPLevelMenu_LeftArrowEvent 4 0
line 372
;366:
;367:/*
;368:=================
;369:UI_SPLevelMenu_LeftArrowEvent
;370:=================
;371:*/
;372:static void UI_SPLevelMenu_LeftArrowEvent(void* ptr, int notification) {
line 373
;373:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $269
line 374
;374:		return;
ADDRGP4 $268
JUMPV
LABELV $269
line 377
;375:	}
;376:
;377:	if (selectedArenaSet == minTier) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 minTier
INDIRI4
NEI4 $271
line 378
;378:		return;
ADDRGP4 $268
JUMPV
LABELV $271
line 381
;379:	}
;380:
;381:	selectedArenaSet--;
ADDRLP4 0
ADDRGP4 selectedArenaSet
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 382
;382:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 383
;383:}
LABELV $268
endproc UI_SPLevelMenu_LeftArrowEvent 4 0
proc UI_SPLevelMenu_RightArrowEvent 4 0
line 390
;384:
;385:/*
;386:=================
;387:UI_SPLevelMenu_RightArrowEvent
;388:=================
;389:*/
;390:static void UI_SPLevelMenu_RightArrowEvent(void* ptr, int notification) {
line 391
;391:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $274
line 392
;392:		return;
ADDRGP4 $273
JUMPV
LABELV $274
line 395
;393:	}
;394:
;395:	if (selectedArenaSet == maxTier) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 maxTier
INDIRI4
NEI4 $276
line 396
;396:		return;
ADDRGP4 $273
JUMPV
LABELV $276
line 399
;397:	}
;398:
;399:	selectedArenaSet++;
ADDRLP4 0
ADDRGP4 selectedArenaSet
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 400
;400:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 401
;401:}
LABELV $273
endproc UI_SPLevelMenu_RightArrowEvent 4 0
proc UI_SPLevelMenu_PlayerEvent 0 0
line 408
;402:
;403:/*
;404:=================
;405:UI_SPLevelMenu_PlayerEvent
;406:=================
;407:*/
;408:static void UI_SPLevelMenu_PlayerEvent(void* ptr, int notification) {
line 409
;409:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $279
line 410
;410:		return;
ADDRGP4 $278
JUMPV
LABELV $279
line 413
;411:	}
;412:
;413:	UI_PlayerSettingsMenu();
ADDRGP4 UI_PlayerSettingsMenu
CALLV
pop
line 414
;414:}
LABELV $278
endproc UI_SPLevelMenu_PlayerEvent 0 0
proc UI_SPLevelMenu_AwardEvent 4 8
line 421
;415:
;416:/*
;417:=================
;418:UI_SPLevelMenu_AwardEvent
;419:=================
;420:*/
;421:static void UI_SPLevelMenu_AwardEvent(void* ptr, int notification) {
line 424
;422:	int n;
;423:
;424:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $282
line 425
;425:		return;
ADDRGP4 $281
JUMPV
LABELV $282
line 428
;426:	}
;427:
;428:	n = ((menucommon_s*)ptr)->id - ID_AWARD1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 17
SUBI4
ASGNI4
line 429
;429:	trap_S_StartLocalSound(levelMenuInfo.awardSounds[n], CHAN_ANNOUNCER);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2564
ADDP4
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 430
;430:}
LABELV $281
endproc UI_SPLevelMenu_AwardEvent 4 8
proc UI_SPLevelMenu_NextEvent 0 4
line 437
;431:
;432:/*
;433:=================
;434:UI_SPLevelMenu_NextEvent
;435:=================
;436:*/
;437:static void UI_SPLevelMenu_NextEvent(void* ptr, int notification) {
line 438
;438:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $286
line 439
;439:		return;
ADDRGP4 $285
JUMPV
LABELV $286
line 442
;440:	}
;441:
;442:	if (selectedArenaSet > currentSet) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $288
line 443
;443:		return;
ADDRGP4 $285
JUMPV
LABELV $288
line 446
;444:	}
;445:
;446:	if (selectedArena == -1) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $290
line 447
;447:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 448
;448:	}
LABELV $290
line 450
;449:
;450:	UI_SPSkillMenu(levelMenuInfo.selectedArenaInfo);
ADDRGP4 levelMenuInfo+2024
INDIRP4
ARGP4
ADDRGP4 UI_SPSkillMenu
CALLV
pop
line 451
;451:}
LABELV $285
endproc UI_SPLevelMenu_NextEvent 0 4
proc UI_SPLevelMenu_BackEvent 0 0
line 458
;452:
;453:/*
;454:=================
;455:UI_SPLevelMenu_BackEvent
;456:=================
;457:*/
;458:static void UI_SPLevelMenu_BackEvent(void* ptr, int notification) {
line 459
;459:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $294
line 460
;460:		return;
ADDRGP4 $293
JUMPV
LABELV $294
line 463
;461:	}
;462:
;463:	if (selectedArena == -1) {
ADDRGP4 selectedArena
INDIRI4
CNSTI4 -1
NEI4 $296
line 464
;464:		selectedArena = 0;
ADDRGP4 selectedArena
CNSTI4 0
ASGNI4
line 465
;465:	}
LABELV $296
line 467
;466:
;467:	UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 468
;468:}
LABELV $293
endproc UI_SPLevelMenu_BackEvent 0 0
proc UI_SPLevelMenu_CustomEvent 0 4
line 475
;469:
;470:/*
;471:=================
;472:UI_SPLevelMenu_CustomEvent
;473:=================
;474:*/
;475:static void UI_SPLevelMenu_CustomEvent(void* ptr, int notification) {
line 476
;476:	if (notification != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $299
line 477
;477:		return;
ADDRGP4 $298
JUMPV
LABELV $299
line 480
;478:	}
;479:
;480:	UI_StartServerMenu(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 UI_StartServerMenu
CALLV
pop
line 481
;481:}
LABELV $298
endproc UI_SPLevelMenu_CustomEvent 0 4
proc UI_SPLevelMenu_MenuDraw 1116 20
line 490
;482:
;483:/*
;484:=================
;485:UI_SPLevelMenu_MenuDraw
;486:=================
;487:*/
;488:#define LEVEL_DESC_LEFT_MARGIN 332
;489:
;490:static void UI_SPLevelMenu_MenuDraw(void) {
line 500
;491:	int    n, i;
;492:	int    x, y;
;493:	vec4_t color;
;494:	int    level;
;495:	//	int				fraglimit;
;496:	int  pad;
;497:	char buf[MAX_INFO_VALUE];
;498:	char string[MAX_NAME_LENGTH];
;499:
;500:	if (levelMenuInfo.reinit) {
ADDRGP4 levelMenuInfo+2020
INDIRI4
CNSTI4 0
EQI4 $302
line 501
;501:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 502
;502:		UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 503
;503:		return;
ADDRGP4 $301
JUMPV
LABELV $302
line 507
;504:	}
;505:
;506:	// draw player name
;507:	trap_Cvar_VariableStringBuffer("name", string, sizeof(string));
ADDRGP4 $106
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 508
;508:	Q_CleanStr(string);
ADDRLP4 16
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 509
;509:	UI_DrawProportionalString(320, PLAYER_Y, string, UI_CENTER | UI_SMALLFONT, color_orange);
CNSTI4 320
ARGI4
CNSTI4 314
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 512
;510:
;511:	// check for model changes
;512:	trap_Cvar_VariableStringBuffer("model", buf, sizeof(buf));
ADDRGP4 $103
ARGP4
ADDRLP4 72
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 513
;513:	if (Q_stricmp(buf, levelMenuInfo.playerModel) != 0) {
ADDRLP4 72
ARGP4
ADDRGP4 levelMenuInfo+2412
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
EQI4 $305
line 514
;514:		Q_strncpyz(levelMenuInfo.playerModel, buf, sizeof(levelMenuInfo.playerModel));
ADDRGP4 levelMenuInfo+2412
ARGP4
ADDRLP4 72
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 515
;515:		PlayerIcon(levelMenuInfo.playerModel, levelMenuInfo.playerPicName, sizeof(levelMenuInfo.playerPicName));
ADDRGP4 levelMenuInfo+2412
ARGP4
ADDRGP4 levelMenuInfo+2476
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 516
;516:		levelMenuInfo.item_player.shader = 0;
ADDRGP4 levelMenuInfo+916+72
CNSTI4 0
ASGNI4
line 517
;517:	}
LABELV $305
line 520
;518:
;519:	// standard menu drawing
;520:	Menu_Draw(&levelMenuInfo.menu);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
line 523
;521:
;522:	// draw player award levels
;523:	y = AWARDS_Y;
ADDRLP4 8
CNSTI4 340
ASGNI4
line 524
;524:	i = 0;
ADDRLP4 48
CNSTI4 0
ASGNI4
line 525
;525:	for (n = 0; n < 6; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $315
line 526
;526:		level = levelMenuInfo.awardLevels[n];
ADDRLP4 12
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2540
ADDP4
INDIRI4
ASGNI4
line 527
;527:		if (level > 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
LEI4 $320
line 528
;528:			if (i & 1) {
ADDRLP4 48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $322
line 529
;529:				x = 224 - (i - 1) / 2 * (48 + 16);
ADDRLP4 4
CNSTI4 224
ADDRLP4 48
INDIRI4
CNSTI4 1
SUBI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
SUBI4
ASGNI4
line 530
;530:			} else {
ADDRGP4 $323
JUMPV
LABELV $322
line 531
;531:				x = 368 + i / 2 * (48 + 16);
ADDRLP4 4
ADDRLP4 48
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
CNSTI4 368
ADDI4
ASGNI4
line 532
;532:			}
LABELV $323
line 533
;533:			i++;
ADDRLP4 48
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 535
;534:
;535:			if (level == 1) {
ADDRLP4 12
INDIRI4
CNSTI4 1
NEI4 $324
line 536
;536:				continue;
ADDRGP4 $316
JUMPV
LABELV $324
line 539
;537:			}
;538:
;539:			if (level >= 1000000) {
ADDRLP4 12
INDIRI4
CNSTI4 1000000
LTI4 $326
line 540
;540:				Com_sprintf(string, sizeof(string), "%im", level / 1000000);
ADDRLP4 16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $328
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 1000000
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 541
;541:			} else if (level >= 1000) {
ADDRGP4 $327
JUMPV
LABELV $326
ADDRLP4 12
INDIRI4
CNSTI4 1000
LTI4 $329
line 542
;542:				Com_sprintf(string, sizeof(string), "%ik", level / 1000);
ADDRLP4 16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $331
ARGP4
ADDRLP4 12
INDIRI4
CNSTI4 1000
DIVI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 543
;543:			} else {
ADDRGP4 $330
JUMPV
LABELV $329
line 544
;544:				Com_sprintf(string, sizeof(string), "%i", level);
ADDRLP4 16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $332
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 545
;545:			}
LABELV $330
LABELV $327
line 547
;546:
;547:			UI_DrawString(x + 24, y + 48, string, UI_CENTER, color_yellow);
ADDRLP4 4
INDIRI4
CNSTI4 24
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 48
ADDI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 color_yellow
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 548
;548:		}
LABELV $320
line 549
;549:	}
LABELV $316
line 525
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $315
line 551
;550:
;551:	UI_DrawProportionalString(18, 38, va("Tier %i", selectedArenaSet + 1), UI_LEFT | UI_SMALLFONT, color_orange);
ADDRGP4 $333
ARGP4
ADDRGP4 selectedArenaSet
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 1100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 18
ARGI4
CNSTI4 38
ARGI4
ADDRLP4 1100
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 553
;552:
;553:	for (n = 0; n < levelMenuInfo.numMaps; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $337
JUMPV
LABELV $334
line 554
;554:		x = levelMenuInfo.item_maps[n].generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+12
ADDP4
INDIRI4
ASGNI4
line 555
;555:		y = levelMenuInfo.item_maps[n].generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+16
ADDP4
INDIRI4
ASGNI4
line 556
;556:		UI_FillRect(x, y + 96, 128, 18, color_black);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 96
ADDI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1099956224
ARGF4
ADDRGP4 color_black
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 557
;557:	}
LABELV $335
line 553
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $337
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+2028
INDIRI4
LTI4 $334
line 559
;558:
;559:	if (selectedArenaSet > currentSet) {
ADDRGP4 selectedArenaSet
INDIRI4
ADDRGP4 currentSet
INDIRI4
LEI4 $343
line 560
;560:		UI_DrawProportionalString(320, 216, "ACCESS DENIED", UI_CENTER | UI_BIGFONT, color_red);
CNSTI4 320
ARGI4
CNSTI4 216
ARGI4
ADDRGP4 $345
ARGP4
CNSTI4 33
ARGI4
ADDRGP4 color_red
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 561
;561:		return;
ADDRGP4 $301
JUMPV
LABELV $343
line 565
;562:	}
;563:
;564:	// show levelshots for levels of current tier
;565:	Vector4Copy(color_white, color);
ADDRLP4 56
ADDRGP4 color_white
INDIRF4
ASGNF4
ADDRLP4 56+4
ADDRGP4 color_white+4
INDIRF4
ASGNF4
ADDRLP4 56+8
ADDRGP4 color_white+8
INDIRF4
ASGNF4
ADDRLP4 56+12
ADDRGP4 color_white+12
INDIRF4
ASGNF4
line 566
;566:	color[3] = 0.5 + 0.5 * sin((uis.realtime % TMOD_075) / PULSE_DIVISOR);
ADDRGP4 uis+4
INDIRI4
CNSTI4 2292106
MODI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 1104
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 56+12
ADDRLP4 1104
INDIRF4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 567
;567:	for (n = 0; n < levelMenuInfo.numMaps; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $357
JUMPV
LABELV $354
line 568
;568:		x = levelMenuInfo.item_maps[n].generic.x;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+12
ADDP4
INDIRI4
ASGNI4
line 569
;569:		y = levelMenuInfo.item_maps[n].generic.y;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456+16
ADDP4
INDIRI4
ASGNI4
line 571
;570:
;571:		UI_DrawString(x + 64, y + 96, levelMenuInfo.levelNames[n], UI_CENTER | UI_SMALLFONT, color_orange);
ADDRLP4 4
INDIRI4
CNSTI4 64
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 96
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 levelMenuInfo+2288
ADDP4
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 573
;572:
;573:		if (levelMenuInfo.levelScores[n] == 1) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2352
ADDP4
INDIRI4
CNSTI4 1
NEI4 $364
line 574
;574:			UI_DrawHandlePic(x, y, 128, 96, levelMenuInfo.levelCompletePic[levelMenuInfo.levelScoresSkill[n] - 1]);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1124073472
ARGF4
CNSTF4 1119879168
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2368
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2392-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 575
;575:		}
LABELV $364
line 577
;576:
;577:		if (n == selectedArena) {
ADDRLP4 0
INDIRI4
ADDRGP4 selectedArena
INDIRI4
NEI4 $370
line 578
;578:			if (Menu_ItemAtCursor(&levelMenuInfo.menu) == &levelMenuInfo.item_maps[n]) {
ADDRGP4 levelMenuInfo
ARGP4
ADDRLP4 1108
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456
ADDP4
CVPU4 4
ADDRLP4 1108
INDIRP4
CVPU4 4
NEU4 $372
line 579
;579:				trap_R_SetColor(color);
ADDRLP4 56
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 580
;580:			}
LABELV $372
line 581
;581:			UI_DrawHandlePic(x - 1, y - 1, 130, 130 - 14, levelMenuInfo.levelSelectedPic);
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
CVIF4 4
ARGF4
CNSTF4 1124204544
ARGF4
CNSTF4 1122500608
ARGF4
ADDRGP4 levelMenuInfo+2384
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 582
;582:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 583
;583:		} else if (Menu_ItemAtCursor(&levelMenuInfo.menu) == &levelMenuInfo.item_maps[n]) {
ADDRGP4 $371
JUMPV
LABELV $370
ADDRGP4 levelMenuInfo
ARGP4
ADDRLP4 1108
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+456
ADDP4
CVPU4 4
ADDRLP4 1108
INDIRP4
CVPU4 4
NEU4 $376
line 584
;584:			trap_R_SetColor(color);
ADDRLP4 56
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 585
;585:			UI_DrawHandlePic(x - 31, y - 30, 256, 256 - 27, levelMenuInfo.levelFocusPic);
ADDRLP4 4
INDIRI4
CNSTI4 31
SUBI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 30
SUBI4
CVIF4 4
ARGF4
CNSTF4 1132462080
ARGF4
CNSTF4 1130692608
ARGF4
ADDRGP4 levelMenuInfo+2388
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 586
;586:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 587
;587:		}
LABELV $376
LABELV $371
line 588
;588:	}
LABELV $355
line 567
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $357
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+2028
INDIRI4
LTI4 $354
line 591
;589:
;590:	// show map name and long name of selected level
;591:	y = 192;
ADDRLP4 8
CNSTI4 192
ASGNI4
line 592
;592:	Q_strncpyz(buf, Info_ValueForKey(levelMenuInfo.selectedArenaInfo, "map"), 20);
ADDRGP4 levelMenuInfo+2024
INDIRP4
ARGP4
ADDRGP4 $116
ARGP4
ADDRLP4 1108
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 1108
INDIRP4
ARGP4
CNSTI4 20
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 593
;593:	Q_strupr(buf);
ADDRLP4 72
ARGP4
ADDRGP4 Q_strupr
CALLP4
pop
line 594
;594:	Com_sprintf(string, sizeof(string), "%s: %s", buf, Info_ValueForKey(levelMenuInfo.selectedArenaInfo, "longname"));
ADDRGP4 levelMenuInfo+2024
INDIRP4
ARGP4
ADDRGP4 $383
ARGP4
ADDRLP4 1112
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $381
ARGP4
ADDRLP4 72
ARGP4
ADDRLP4 1112
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 595
;595:	UI_DrawProportionalString(320, y, string, UI_CENTER | UI_SMALLFONT, color_orange);
CNSTI4 320
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
CNSTI4 17
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 601
;596:
;597:	//	fraglimit = atoi( Info_ValueForKey( levelMenuInfo.selectedArenaInfo, "fraglimit" ) );
;598:	//	UI_DrawString( 18, 212, va("Frags %i", fraglimit) , UI_LEFT|UI_SMALLFONT, color_orange );
;599:
;600:	// draw bot opponents
;601:	y += 24;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 24
ADDI4
ASGNI4
line 602
;602:	pad = (7 - levelMenuInfo.numBots) * (64 + 26) / 2;
ADDRLP4 52
CNSTI4 7
ADDRGP4 levelMenuInfo+2588
INDIRI4
SUBI4
CNSTI4 90
MULI4
CNSTI4 2
DIVI4
ASGNI4
line 603
;603:	for (n = 0; n < levelMenuInfo.numBots; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $388
JUMPV
LABELV $385
line 604
;604:		x = 18 + pad + (64 + 26) * n;
ADDRLP4 4
ADDRLP4 52
INDIRI4
CNSTI4 18
ADDI4
ADDRLP4 0
INDIRI4
CNSTI4 90
MULI4
ADDI4
ASGNI4
line 605
;605:		if (levelMenuInfo.botPics[n]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2592
ADDP4
INDIRI4
CNSTI4 0
EQI4 $390
line 606
;606:			UI_DrawHandlePic(x, y, 64, 64, levelMenuInfo.botPics[n]);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1115684864
ARGF4
CNSTF4 1115684864
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2592
ADDP4
INDIRI4
ARGI4
ADDRGP4 UI_DrawHandlePic
CALLV
pop
line 607
;607:		} else {
ADDRGP4 $391
JUMPV
LABELV $390
line 608
;608:			UI_FillRect(x, y, 64, 64, color_black);
ADDRLP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1115684864
ARGF4
CNSTF4 1115684864
ARGF4
ADDRGP4 color_black
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 609
;609:			UI_DrawProportionalString(x + 22, y + 18, "?", UI_BIGFONT, color_orange);
ADDRLP4 4
INDIRI4
CNSTI4 22
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRGP4 $394
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 610
;610:		}
LABELV $391
line 611
;611:		UI_DrawString(x, y + 64, levelMenuInfo.botNames[n], UI_SMALLFONT | UI_LEFT, color_orange);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
CNSTI4 64
ADDI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 10
MULI4
ADDRGP4 levelMenuInfo+2620
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 color_orange
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 612
;612:	}
LABELV $386
line 603
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $388
ADDRLP4 0
INDIRI4
ADDRGP4 levelMenuInfo+2588
INDIRI4
LTI4 $385
line 613
;613:}
LABELV $301
endproc UI_SPLevelMenu_MenuDraw 1116 20
export UI_SPLevelMenu_Cache
proc UI_SPLevelMenu_Cache 32 8
line 620
;614:
;615:/*
;616:=================
;617:UI_SPLevelMenu_Cache
;618:=================
;619:*/
;620:void UI_SPLevelMenu_Cache(void) {
line 623
;621:	int n;
;622:
;623:	trap_R_RegisterShaderNoMip(ART_LEVELFRAME_FOCUS);
ADDRGP4 $397
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 624
;624:	trap_R_RegisterShaderNoMip(ART_LEVELFRAME_SELECTED);
ADDRGP4 $398
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 625
;625:	trap_R_RegisterShaderNoMip(ART_ARROW);
ADDRGP4 $399
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 626
;626:	trap_R_RegisterShaderNoMip(ART_ARROW_FOCUS);
ADDRGP4 $400
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 627
;627:	trap_R_RegisterShaderNoMip(ART_MAP_UNKNOWN);
ADDRGP4 $133
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 628
;628:	trap_R_RegisterShaderNoMip(ART_MAP_COMPLETE1);
ADDRGP4 $401
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 629
;629:	trap_R_RegisterShaderNoMip(ART_MAP_COMPLETE2);
ADDRGP4 $402
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 630
;630:	trap_R_RegisterShaderNoMip(ART_MAP_COMPLETE3);
ADDRGP4 $403
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 631
;631:	trap_R_RegisterShaderNoMip(ART_MAP_COMPLETE4);
ADDRGP4 $404
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 632
;632:	trap_R_RegisterShaderNoMip(ART_MAP_COMPLETE5);
ADDRGP4 $405
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 633
;633:	trap_R_RegisterShaderNoMip(ART_BACK0);
ADDRGP4 $406
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 634
;634:	trap_R_RegisterShaderNoMip(ART_BACK1);
ADDRGP4 $407
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 635
;635:	trap_R_RegisterShaderNoMip(ART_FIGHT0);
ADDRGP4 $408
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 636
;636:	trap_R_RegisterShaderNoMip(ART_FIGHT1);
ADDRGP4 $409
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 637
;637:	trap_R_RegisterShaderNoMip(ART_RESET0);
ADDRGP4 $410
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 638
;638:	trap_R_RegisterShaderNoMip(ART_RESET1);
ADDRGP4 $411
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 639
;639:	trap_R_RegisterShaderNoMip(ART_CUSTOM0);
ADDRGP4 $412
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 640
;640:	trap_R_RegisterShaderNoMip(ART_CUSTOM1);
ADDRGP4 $413
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 642
;641:
;642:	for (n = 0; n < 6; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $414
line 643
;643:		trap_R_RegisterShaderNoMip(ui_medalPicNames[n]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 644
;644:		levelMenuInfo.awardSounds[n] = trap_S_RegisterSound(ui_medalSounds[n], qfalse);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalSounds
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2564
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 645
;645:	}
LABELV $415
line 642
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $414
line 647
;646:
;647:	levelMenuInfo.levelSelectedPic    = trap_R_RegisterShaderNoMip(ART_LEVELFRAME_SELECTED);
ADDRGP4 $398
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2384
ADDRLP4 4
INDIRI4
ASGNI4
line 648
;648:	levelMenuInfo.levelFocusPic       = trap_R_RegisterShaderNoMip(ART_LEVELFRAME_FOCUS);
ADDRGP4 $397
ARGP4
ADDRLP4 8
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2388
ADDRLP4 8
INDIRI4
ASGNI4
line 649
;649:	levelMenuInfo.levelCompletePic[0] = trap_R_RegisterShaderNoMip(ART_MAP_COMPLETE1);
ADDRGP4 $401
ARGP4
ADDRLP4 12
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2392
ADDRLP4 12
INDIRI4
ASGNI4
line 650
;650:	levelMenuInfo.levelCompletePic[1] = trap_R_RegisterShaderNoMip(ART_MAP_COMPLETE2);
ADDRGP4 $402
ARGP4
ADDRLP4 16
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2392+4
ADDRLP4 16
INDIRI4
ASGNI4
line 651
;651:	levelMenuInfo.levelCompletePic[2] = trap_R_RegisterShaderNoMip(ART_MAP_COMPLETE3);
ADDRGP4 $403
ARGP4
ADDRLP4 20
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2392+8
ADDRLP4 20
INDIRI4
ASGNI4
line 652
;652:	levelMenuInfo.levelCompletePic[3] = trap_R_RegisterShaderNoMip(ART_MAP_COMPLETE4);
ADDRGP4 $404
ARGP4
ADDRLP4 24
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2392+12
ADDRLP4 24
INDIRI4
ASGNI4
line 653
;653:	levelMenuInfo.levelCompletePic[4] = trap_R_RegisterShaderNoMip(ART_MAP_COMPLETE5);
ADDRGP4 $405
ARGP4
ADDRLP4 28
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 levelMenuInfo+2392+16
ADDRLP4 28
INDIRI4
ASGNI4
line 654
;654:}
LABELV $396
endproc UI_SPLevelMenu_Cache 32 8
proc UI_SPLevelMenu_Init 112 12
line 661
;655:
;656:/*
;657:=================
;658:UI_SPLevelMenu_Init
;659:=================
;660:*/
;661:static void UI_SPLevelMenu_Init(void) {
line 668
;662:	int  skill;
;663:	int  n;
;664:	int  x, y;
;665:	int  count;
;666:	char buf[MAX_QPATH];
;667:
;668:	skill = (int)trap_Cvar_VariableValue("g_spSkill");
ADDRGP4 $431
ARGP4
ADDRLP4 84
ADDRGP4 trap_Cvar_VariableValue
CALLF4
ASGNF4
ADDRLP4 80
ADDRLP4 84
INDIRF4
CVFI4 4
ASGNI4
line 669
;669:	if (skill < 1 || skill > 5) {
ADDRLP4 80
INDIRI4
CNSTI4 1
LTI4 $434
ADDRLP4 80
INDIRI4
CNSTI4 5
LEI4 $432
LABELV $434
line 670
;670:		trap_Cvar_Set("g_spSkill", "2");
ADDRGP4 $431
ARGP4
ADDRGP4 $435
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 671
;671:	}
LABELV $432
line 673
;672:
;673:	memset(&levelMenuInfo, 0, sizeof(levelMenuInfo));
ADDRGP4 levelMenuInfo
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2692
ARGI4
ADDRGP4 memset
CALLP4
pop
line 674
;674:	levelMenuInfo.menu.fullscreen = qtrue;
ADDRGP4 levelMenuInfo+280
CNSTI4 1
ASGNI4
line 675
;675:	levelMenuInfo.menu.wrapAround = qtrue;
ADDRGP4 levelMenuInfo+276
CNSTI4 1
ASGNI4
line 676
;676:	levelMenuInfo.menu.draw       = UI_SPLevelMenu_MenuDraw;
ADDRGP4 levelMenuInfo+268
ADDRGP4 UI_SPLevelMenu_MenuDraw
ASGNP4
line 678
;677:
;678:	UI_SPLevelMenu_Cache();
ADDRGP4 UI_SPLevelMenu_Cache
CALLV
pop
line 680
;679:
;680:	levelMenuInfo.item_banner.generic.type = MTYPE_BTEXT;
ADDRGP4 levelMenuInfo+288
CNSTI4 10
ASGNI4
line 681
;681:	levelMenuInfo.item_banner.generic.x    = 320;
ADDRGP4 levelMenuInfo+288+12
CNSTI4 320
ASGNI4
line 682
;682:	levelMenuInfo.item_banner.generic.y    = 16;
ADDRGP4 levelMenuInfo+288+16
CNSTI4 16
ASGNI4
line 683
;683:	levelMenuInfo.item_banner.string       = "CHOOSE LEVEL";
ADDRGP4 levelMenuInfo+288+64
ADDRGP4 $446
ASGNP4
line 684
;684:	levelMenuInfo.item_banner.color        = color_red;
ADDRGP4 levelMenuInfo+288+72
ADDRGP4 color_red
ASGNP4
line 685
;685:	levelMenuInfo.item_banner.style        = UI_CENTER;
ADDRGP4 levelMenuInfo+288+68
CNSTI4 1
ASGNI4
line 687
;686:
;687:	levelMenuInfo.item_leftarrow.generic.type     = MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+364
CNSTI4 6
ASGNI4
line 688
;688:	levelMenuInfo.item_leftarrow.generic.name     = ART_ARROW;
ADDRGP4 levelMenuInfo+364+4
ADDRGP4 $399
ASGNP4
line 689
;689:	levelMenuInfo.item_leftarrow.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+364+44
CNSTU4 260
ASGNU4
line 690
;690:	levelMenuInfo.item_leftarrow.generic.x        = 18;
ADDRGP4 levelMenuInfo+364+12
CNSTI4 18
ASGNI4
line 691
;691:	levelMenuInfo.item_leftarrow.generic.y        = 64;
ADDRGP4 levelMenuInfo+364+16
CNSTI4 64
ASGNI4
line 692
;692:	levelMenuInfo.item_leftarrow.generic.callback = UI_SPLevelMenu_LeftArrowEvent;
ADDRGP4 levelMenuInfo+364+48
ADDRGP4 UI_SPLevelMenu_LeftArrowEvent
ASGNP4
line 693
;693:	levelMenuInfo.item_leftarrow.generic.id       = ID_LEFTARROW;
ADDRGP4 levelMenuInfo+364+8
CNSTI4 10
ASGNI4
line 694
;694:	levelMenuInfo.item_leftarrow.width            = 16;
ADDRGP4 levelMenuInfo+364+80
CNSTI4 16
ASGNI4
line 695
;695:	levelMenuInfo.item_leftarrow.height           = 114;
ADDRGP4 levelMenuInfo+364+84
CNSTI4 114
ASGNI4
line 696
;696:	levelMenuInfo.item_leftarrow.focuspic         = ART_ARROW_FOCUS;
ADDRGP4 levelMenuInfo+364+64
ADDRGP4 $400
ASGNP4
line 698
;697:
;698:	levelMenuInfo.item_maps[0].generic.type     = MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+456
CNSTI4 6
ASGNI4
line 699
;699:	levelMenuInfo.item_maps[0].generic.name     = levelMenuInfo.levelPicNames[0];
ADDRGP4 levelMenuInfo+456+4
ADDRGP4 levelMenuInfo+2032
ASGNP4
line 700
;700:	levelMenuInfo.item_maps[0].generic.flags    = QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+456+44
CNSTU4 4
ASGNU4
line 701
;701:	levelMenuInfo.item_maps[0].generic.x        = 46;
ADDRGP4 levelMenuInfo+456+12
CNSTI4 46
ASGNI4
line 702
;702:	levelMenuInfo.item_maps[0].generic.y        = 64;
ADDRGP4 levelMenuInfo+456+16
CNSTI4 64
ASGNI4
line 703
;703:	levelMenuInfo.item_maps[0].generic.id       = ID_PICTURE0;
ADDRGP4 levelMenuInfo+456+8
CNSTI4 11
ASGNI4
line 704
;704:	levelMenuInfo.item_maps[0].generic.callback = UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+456+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 705
;705:	levelMenuInfo.item_maps[0].width            = 128;
ADDRGP4 levelMenuInfo+456+80
CNSTI4 128
ASGNI4
line 706
;706:	levelMenuInfo.item_maps[0].height           = 96;
ADDRGP4 levelMenuInfo+456+84
CNSTI4 96
ASGNI4
line 708
;707:
;708:	levelMenuInfo.item_maps[1].generic.type     = MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+456+92
CNSTI4 6
ASGNI4
line 709
;709:	levelMenuInfo.item_maps[1].generic.name     = levelMenuInfo.levelPicNames[1];
ADDRGP4 levelMenuInfo+456+92+4
ADDRGP4 levelMenuInfo+2032+64
ASGNP4
line 710
;710:	levelMenuInfo.item_maps[1].generic.flags    = QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+456+92+44
CNSTU4 4
ASGNU4
line 711
;711:	levelMenuInfo.item_maps[1].generic.x        = 186;
ADDRGP4 levelMenuInfo+456+92+12
CNSTI4 186
ASGNI4
line 712
;712:	levelMenuInfo.item_maps[1].generic.y        = 64;
ADDRGP4 levelMenuInfo+456+92+16
CNSTI4 64
ASGNI4
line 713
;713:	levelMenuInfo.item_maps[1].generic.id       = ID_PICTURE1;
ADDRGP4 levelMenuInfo+456+92+8
CNSTI4 12
ASGNI4
line 714
;714:	levelMenuInfo.item_maps[1].generic.callback = UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+456+92+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 715
;715:	levelMenuInfo.item_maps[1].width            = 128;
ADDRGP4 levelMenuInfo+456+92+80
CNSTI4 128
ASGNI4
line 716
;716:	levelMenuInfo.item_maps[1].height           = 96;
ADDRGP4 levelMenuInfo+456+92+84
CNSTI4 96
ASGNI4
line 718
;717:
;718:	levelMenuInfo.item_maps[2].generic.type     = MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+456+184
CNSTI4 6
ASGNI4
line 719
;719:	levelMenuInfo.item_maps[2].generic.name     = levelMenuInfo.levelPicNames[2];
ADDRGP4 levelMenuInfo+456+184+4
ADDRGP4 levelMenuInfo+2032+128
ASGNP4
line 720
;720:	levelMenuInfo.item_maps[2].generic.flags    = QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+456+184+44
CNSTU4 4
ASGNU4
line 721
;721:	levelMenuInfo.item_maps[2].generic.x        = 326;
ADDRGP4 levelMenuInfo+456+184+12
CNSTI4 326
ASGNI4
line 722
;722:	levelMenuInfo.item_maps[2].generic.y        = 64;
ADDRGP4 levelMenuInfo+456+184+16
CNSTI4 64
ASGNI4
line 723
;723:	levelMenuInfo.item_maps[2].generic.id       = ID_PICTURE2;
ADDRGP4 levelMenuInfo+456+184+8
CNSTI4 13
ASGNI4
line 724
;724:	levelMenuInfo.item_maps[2].generic.callback = UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+456+184+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 725
;725:	levelMenuInfo.item_maps[2].width            = 128;
ADDRGP4 levelMenuInfo+456+184+80
CNSTI4 128
ASGNI4
line 726
;726:	levelMenuInfo.item_maps[2].height           = 96;
ADDRGP4 levelMenuInfo+456+184+84
CNSTI4 96
ASGNI4
line 728
;727:
;728:	levelMenuInfo.item_maps[3].generic.type     = MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+456+276
CNSTI4 6
ASGNI4
line 729
;729:	levelMenuInfo.item_maps[3].generic.name     = levelMenuInfo.levelPicNames[3];
ADDRGP4 levelMenuInfo+456+276+4
ADDRGP4 levelMenuInfo+2032+192
ASGNP4
line 730
;730:	levelMenuInfo.item_maps[3].generic.flags    = QMF_LEFT_JUSTIFY;
ADDRGP4 levelMenuInfo+456+276+44
CNSTU4 4
ASGNU4
line 731
;731:	levelMenuInfo.item_maps[3].generic.x        = 466;
ADDRGP4 levelMenuInfo+456+276+12
CNSTI4 466
ASGNI4
line 732
;732:	levelMenuInfo.item_maps[3].generic.y        = 64;
ADDRGP4 levelMenuInfo+456+276+16
CNSTI4 64
ASGNI4
line 733
;733:	levelMenuInfo.item_maps[3].generic.id       = ID_PICTURE3;
ADDRGP4 levelMenuInfo+456+276+8
CNSTI4 14
ASGNI4
line 734
;734:	levelMenuInfo.item_maps[3].generic.callback = UI_SPLevelMenu_LevelEvent;
ADDRGP4 levelMenuInfo+456+276+48
ADDRGP4 UI_SPLevelMenu_LevelEvent
ASGNP4
line 735
;735:	levelMenuInfo.item_maps[3].width            = 128;
ADDRGP4 levelMenuInfo+456+276+80
CNSTI4 128
ASGNI4
line 736
;736:	levelMenuInfo.item_maps[3].height           = 96;
ADDRGP4 levelMenuInfo+456+276+84
CNSTI4 96
ASGNI4
line 738
;737:
;738:	levelMenuInfo.item_rightarrow.generic.type     = MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+824
CNSTI4 6
ASGNI4
line 739
;739:	levelMenuInfo.item_rightarrow.generic.name     = ART_ARROW;
ADDRGP4 levelMenuInfo+824+4
ADDRGP4 $399
ASGNP4
line 740
;740:	levelMenuInfo.item_rightarrow.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+824+44
CNSTU4 260
ASGNU4
line 741
;741:	levelMenuInfo.item_rightarrow.generic.x        = 606;
ADDRGP4 levelMenuInfo+824+12
CNSTI4 606
ASGNI4
line 742
;742:	levelMenuInfo.item_rightarrow.generic.y        = 64;
ADDRGP4 levelMenuInfo+824+16
CNSTI4 64
ASGNI4
line 743
;743:	levelMenuInfo.item_rightarrow.generic.callback = UI_SPLevelMenu_RightArrowEvent;
ADDRGP4 levelMenuInfo+824+48
ADDRGP4 UI_SPLevelMenu_RightArrowEvent
ASGNP4
line 744
;744:	levelMenuInfo.item_rightarrow.generic.id       = ID_RIGHTARROW;
ADDRGP4 levelMenuInfo+824+8
CNSTI4 15
ASGNI4
line 745
;745:	levelMenuInfo.item_rightarrow.width            = -16;
ADDRGP4 levelMenuInfo+824+80
CNSTI4 -16
ASGNI4
line 746
;746:	levelMenuInfo.item_rightarrow.height           = 114;
ADDRGP4 levelMenuInfo+824+84
CNSTI4 114
ASGNI4
line 747
;747:	levelMenuInfo.item_rightarrow.focuspic         = ART_ARROW_FOCUS;
ADDRGP4 levelMenuInfo+824+64
ADDRGP4 $400
ASGNP4
line 749
;748:
;749:	trap_Cvar_VariableStringBuffer("model", levelMenuInfo.playerModel, sizeof(levelMenuInfo.playerModel));
ADDRGP4 $103
ARGP4
ADDRGP4 levelMenuInfo+2412
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 750
;750:	PlayerIcon(levelMenuInfo.playerModel, levelMenuInfo.playerPicName, sizeof(levelMenuInfo.playerPicName));
ADDRGP4 levelMenuInfo+2412
ARGP4
ADDRGP4 levelMenuInfo+2476
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 PlayerIcon
CALLV
pop
line 751
;751:	levelMenuInfo.item_player.generic.type     = MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+916
CNSTI4 6
ASGNI4
line 752
;752:	levelMenuInfo.item_player.generic.name     = levelMenuInfo.playerPicName;
ADDRGP4 levelMenuInfo+916+4
ADDRGP4 levelMenuInfo+2476
ASGNP4
line 753
;753:	levelMenuInfo.item_player.generic.flags    = QMF_LEFT_JUSTIFY | QMF_MOUSEONLY;
ADDRGP4 levelMenuInfo+916+44
CNSTU4 2052
ASGNU4
line 754
;754:	levelMenuInfo.item_player.generic.x        = 288;
ADDRGP4 levelMenuInfo+916+12
CNSTI4 288
ASGNI4
line 755
;755:	levelMenuInfo.item_player.generic.y        = AWARDS_Y;
ADDRGP4 levelMenuInfo+916+16
CNSTI4 340
ASGNI4
line 756
;756:	levelMenuInfo.item_player.generic.id       = ID_PLAYERPIC;
ADDRGP4 levelMenuInfo+916+8
CNSTI4 16
ASGNI4
line 757
;757:	levelMenuInfo.item_player.generic.callback = UI_SPLevelMenu_PlayerEvent;
ADDRGP4 levelMenuInfo+916+48
ADDRGP4 UI_SPLevelMenu_PlayerEvent
ASGNP4
line 758
;758:	levelMenuInfo.item_player.width            = 64;
ADDRGP4 levelMenuInfo+916+80
CNSTI4 64
ASGNI4
line 759
;759:	levelMenuInfo.item_player.height           = 64;
ADDRGP4 levelMenuInfo+916+84
CNSTI4 64
ASGNI4
line 761
;760:
;761:	for (n = 0; n < 6; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $614
line 762
;762:		levelMenuInfo.awardLevels[n] = UI_GetAwardLevel(n);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 UI_GetAwardLevel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2540
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 763
;763:	}
LABELV $615
line 761
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $614
line 764
;764:	levelMenuInfo.awardLevels[AWARD_FRAGS] = 100 * (levelMenuInfo.awardLevels[AWARD_FRAGS] / 100);
ADDRGP4 levelMenuInfo+2540+16
ADDRGP4 levelMenuInfo+2540+16
INDIRI4
CNSTI4 100
DIVI4
CNSTI4 100
MULI4
ASGNI4
line 766
;765:
;766:	y     = AWARDS_Y;
ADDRLP4 12
CNSTI4 340
ASGNI4
line 767
;767:	count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 768
;768:	for (n = 0; n < 6; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $623
line 769
;769:		if (levelMenuInfo.awardLevels[n]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 levelMenuInfo+2540
ADDP4
INDIRI4
CNSTI4 0
EQI4 $627
line 770
;770:			if (count & 1) {
ADDRLP4 4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $630
line 771
;771:				x = 224 - (count - 1) / 2 * (48 + 16);
ADDRLP4 8
CNSTI4 224
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
SUBI4
ASGNI4
line 772
;772:			} else {
ADDRGP4 $631
JUMPV
LABELV $630
line 773
;773:				x = 368 + count / 2 * (48 + 16);
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
DIVI4
CNSTI4 6
LSHI4
CNSTI4 368
ADDI4
ASGNI4
line 774
;774:			}
LABELV $631
line 776
;775:
;776:			levelMenuInfo.item_awards[count].generic.type     = MTYPE_BITMAP;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008
ADDP4
CNSTI4 6
ASGNI4
line 777
;777:			levelMenuInfo.item_awards[count].generic.name     = ui_medalPicNames[n];
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 ui_medalPicNames
ADDP4
INDIRP4
ASGNP4
line 778
;778:			levelMenuInfo.item_awards[count].generic.flags    = QMF_LEFT_JUSTIFY | QMF_SILENT | QMF_MOUSEONLY;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+44
ADDP4
CNSTU4 1050628
ASGNU4
line 779
;779:			levelMenuInfo.item_awards[count].generic.x        = x;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+12
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 780
;780:			levelMenuInfo.item_awards[count].generic.y        = y;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+16
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 781
;781:			levelMenuInfo.item_awards[count].generic.id       = ID_AWARD1 + n;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 17
ADDI4
ASGNI4
line 782
;782:			levelMenuInfo.item_awards[count].generic.callback = UI_SPLevelMenu_AwardEvent;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+48
ADDP4
ADDRGP4 UI_SPLevelMenu_AwardEvent
ASGNP4
line 783
;783:			levelMenuInfo.item_awards[count].width            = 48;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+80
ADDP4
CNSTI4 48
ASGNI4
line 784
;784:			levelMenuInfo.item_awards[count].height           = 48;
ADDRLP4 4
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008+84
ADDP4
CNSTI4 48
ASGNI4
line 785
;785:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 786
;786:		}
LABELV $627
line 787
;787:	}
LABELV $624
line 768
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 6
LTI4 $623
line 789
;788:
;789:	levelMenuInfo.item_back.generic.type     = MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1560
CNSTI4 6
ASGNI4
line 790
;790:	levelMenuInfo.item_back.generic.name     = ART_BACK0;
ADDRGP4 levelMenuInfo+1560+4
ADDRGP4 $406
ASGNP4
line 791
;791:	levelMenuInfo.item_back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1560+44
CNSTU4 260
ASGNU4
line 792
;792:	levelMenuInfo.item_back.generic.x        = 0;
ADDRGP4 levelMenuInfo+1560+12
CNSTI4 0
ASGNI4
line 793
;793:	levelMenuInfo.item_back.generic.y        = 480 - 64;
ADDRGP4 levelMenuInfo+1560+16
CNSTI4 416
ASGNI4
line 794
;794:	levelMenuInfo.item_back.generic.callback = UI_SPLevelMenu_BackEvent;
ADDRGP4 levelMenuInfo+1560+48
ADDRGP4 UI_SPLevelMenu_BackEvent
ASGNP4
line 795
;795:	levelMenuInfo.item_back.generic.id       = ID_BACK;
ADDRGP4 levelMenuInfo+1560+8
CNSTI4 23
ASGNI4
line 796
;796:	levelMenuInfo.item_back.width            = 128;
ADDRGP4 levelMenuInfo+1560+80
CNSTI4 128
ASGNI4
line 797
;797:	levelMenuInfo.item_back.height           = 64;
ADDRGP4 levelMenuInfo+1560+84
CNSTI4 64
ASGNI4
line 798
;798:	levelMenuInfo.item_back.focuspic         = ART_BACK1;
ADDRGP4 levelMenuInfo+1560+64
ADDRGP4 $407
ASGNP4
line 800
;799:
;800:	levelMenuInfo.item_reset.generic.type     = MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1652
CNSTI4 6
ASGNI4
line 801
;801:	levelMenuInfo.item_reset.generic.name     = ART_RESET0;
ADDRGP4 levelMenuInfo+1652+4
ADDRGP4 $410
ASGNP4
line 802
;802:	levelMenuInfo.item_reset.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1652+44
CNSTU4 260
ASGNU4
line 803
;803:	levelMenuInfo.item_reset.generic.x        = 170;
ADDRGP4 levelMenuInfo+1652+12
CNSTI4 170
ASGNI4
line 804
;804:	levelMenuInfo.item_reset.generic.y        = 480 - 64;
ADDRGP4 levelMenuInfo+1652+16
CNSTI4 416
ASGNI4
line 805
;805:	levelMenuInfo.item_reset.generic.callback = UI_SPLevelMenu_ResetEvent;
ADDRGP4 levelMenuInfo+1652+48
ADDRGP4 UI_SPLevelMenu_ResetEvent
ASGNP4
line 806
;806:	levelMenuInfo.item_reset.generic.id       = ID_RESET;
ADDRGP4 levelMenuInfo+1652+8
CNSTI4 24
ASGNI4
line 807
;807:	levelMenuInfo.item_reset.width            = 128;
ADDRGP4 levelMenuInfo+1652+80
CNSTI4 128
ASGNI4
line 808
;808:	levelMenuInfo.item_reset.height           = 64;
ADDRGP4 levelMenuInfo+1652+84
CNSTI4 64
ASGNI4
line 809
;809:	levelMenuInfo.item_reset.focuspic         = ART_RESET1;
ADDRGP4 levelMenuInfo+1652+64
ADDRGP4 $411
ASGNP4
line 811
;810:
;811:	levelMenuInfo.item_custom.generic.type     = MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1744
CNSTI4 6
ASGNI4
line 812
;812:	levelMenuInfo.item_custom.generic.name     = ART_CUSTOM0;
ADDRGP4 levelMenuInfo+1744+4
ADDRGP4 $412
ASGNP4
line 813
;813:	levelMenuInfo.item_custom.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1744+44
CNSTU4 260
ASGNU4
line 814
;814:	levelMenuInfo.item_custom.generic.x        = 342;
ADDRGP4 levelMenuInfo+1744+12
CNSTI4 342
ASGNI4
line 815
;815:	levelMenuInfo.item_custom.generic.y        = 480 - 64;
ADDRGP4 levelMenuInfo+1744+16
CNSTI4 416
ASGNI4
line 816
;816:	levelMenuInfo.item_custom.generic.callback = UI_SPLevelMenu_CustomEvent;
ADDRGP4 levelMenuInfo+1744+48
ADDRGP4 UI_SPLevelMenu_CustomEvent
ASGNP4
line 817
;817:	levelMenuInfo.item_custom.generic.id       = ID_CUSTOM;
ADDRGP4 levelMenuInfo+1744+8
CNSTI4 25
ASGNI4
line 818
;818:	levelMenuInfo.item_custom.width            = 128;
ADDRGP4 levelMenuInfo+1744+80
CNSTI4 128
ASGNI4
line 819
;819:	levelMenuInfo.item_custom.height           = 64;
ADDRGP4 levelMenuInfo+1744+84
CNSTI4 64
ASGNI4
line 820
;820:	levelMenuInfo.item_custom.focuspic         = ART_CUSTOM1;
ADDRGP4 levelMenuInfo+1744+64
ADDRGP4 $413
ASGNP4
line 822
;821:
;822:	levelMenuInfo.item_next.generic.type     = MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1836
CNSTI4 6
ASGNI4
line 823
;823:	levelMenuInfo.item_next.generic.name     = ART_FIGHT0;
ADDRGP4 levelMenuInfo+1836+4
ADDRGP4 $408
ASGNP4
line 824
;824:	levelMenuInfo.item_next.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 levelMenuInfo+1836+44
CNSTU4 272
ASGNU4
line 825
;825:	levelMenuInfo.item_next.generic.x        = 640;
ADDRGP4 levelMenuInfo+1836+12
CNSTI4 640
ASGNI4
line 826
;826:	levelMenuInfo.item_next.generic.y        = 480 - 64;
ADDRGP4 levelMenuInfo+1836+16
CNSTI4 416
ASGNI4
line 827
;827:	levelMenuInfo.item_next.generic.callback = UI_SPLevelMenu_NextEvent;
ADDRGP4 levelMenuInfo+1836+48
ADDRGP4 UI_SPLevelMenu_NextEvent
ASGNP4
line 828
;828:	levelMenuInfo.item_next.generic.id       = ID_NEXT;
ADDRGP4 levelMenuInfo+1836+8
CNSTI4 26
ASGNI4
line 829
;829:	levelMenuInfo.item_next.width            = 128;
ADDRGP4 levelMenuInfo+1836+80
CNSTI4 128
ASGNI4
line 830
;830:	levelMenuInfo.item_next.height           = 64;
ADDRGP4 levelMenuInfo+1836+84
CNSTI4 64
ASGNI4
line 831
;831:	levelMenuInfo.item_next.focuspic         = ART_FIGHT1;
ADDRGP4 levelMenuInfo+1836+64
ADDRGP4 $409
ASGNP4
line 833
;832:
;833:	levelMenuInfo.item_null.generic.type  = MTYPE_BITMAP;
ADDRGP4 levelMenuInfo+1928
CNSTI4 6
ASGNI4
line 834
;834:	levelMenuInfo.item_null.generic.flags = QMF_LEFT_JUSTIFY | QMF_MOUSEONLY | QMF_SILENT;
ADDRGP4 levelMenuInfo+1928+44
CNSTU4 1050628
ASGNU4
line 835
;835:	levelMenuInfo.item_null.generic.x     = 0;
ADDRGP4 levelMenuInfo+1928+12
CNSTI4 0
ASGNI4
line 836
;836:	levelMenuInfo.item_null.generic.y     = 0;
ADDRGP4 levelMenuInfo+1928+16
CNSTI4 0
ASGNI4
line 837
;837:	levelMenuInfo.item_null.width         = 640;
ADDRGP4 levelMenuInfo+1928+80
CNSTI4 640
ASGNI4
line 838
;838:	levelMenuInfo.item_null.height        = 480;
ADDRGP4 levelMenuInfo+1928+84
CNSTI4 480
ASGNI4
line 840
;839:
;840:	Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_banner);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 842
;841:
;842:	Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_leftarrow);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 843
;843:	Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_maps[0]);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 844
;844:	Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_maps[1]);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+456+92
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 845
;845:	Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_maps[2]);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+456+184
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 846
;846:	Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_maps[3]);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+456+276
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 847
;847:	levelMenuInfo.item_maps[0].generic.bottom += 18;
ADDRLP4 92
ADDRGP4 levelMenuInfo+456+32
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 848
;848:	levelMenuInfo.item_maps[1].generic.bottom += 18;
ADDRLP4 96
ADDRGP4 levelMenuInfo+456+92+32
ASGNP4
ADDRLP4 96
INDIRP4
ADDRLP4 96
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 849
;849:	levelMenuInfo.item_maps[2].generic.bottom += 18;
ADDRLP4 100
ADDRGP4 levelMenuInfo+456+184+32
ASGNP4
ADDRLP4 100
INDIRP4
ADDRLP4 100
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 850
;850:	levelMenuInfo.item_maps[3].generic.bottom += 18;
ADDRLP4 104
ADDRGP4 levelMenuInfo+456+276+32
ASGNP4
ADDRLP4 104
INDIRP4
ADDRLP4 104
INDIRP4
INDIRI4
CNSTI4 18
ADDI4
ASGNI4
line 851
;851:	Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_rightarrow);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+824
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 853
;852:
;853:	Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_player);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+916
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 855
;854:
;855:	for (n = 0; n < count; n++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $761
JUMPV
LABELV $758
line 856
;856:		Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_awards[n]);
ADDRGP4 levelMenuInfo
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 92
MULI4
ADDRGP4 levelMenuInfo+1008
ADDP4
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 857
;857:	}
LABELV $759
line 855
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $761
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $758
line 858
;858:	Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_back);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1560
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 859
;859:	Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_reset);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1652
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 860
;860:	Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_custom);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1744
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 861
;861:	Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_next);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1836
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 862
;862:	Menu_AddItem(&levelMenuInfo.menu, &levelMenuInfo.item_null);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1928
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 864
;863:
;864:	trap_Cvar_VariableStringBuffer("ui_spSelection", buf, sizeof(buf));
ADDRGP4 $154
ARGP4
ADDRLP4 16
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 865
;865:	if (*buf) {
ADDRLP4 16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $768
line 866
;866:		n                = atoi(buf);
ADDRLP4 16
ARGP4
ADDRLP4 108
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 108
INDIRI4
ASGNI4
line 867
;867:		selectedArenaSet = n / ARENAS_PER_TIER;
ADDRGP4 selectedArenaSet
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 868
;868:		selectedArena    = n % ARENAS_PER_TIER;
ADDRGP4 selectedArena
ADDRLP4 0
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 869
;869:	} else {
ADDRGP4 $769
JUMPV
LABELV $768
line 870
;870:		selectedArenaSet = currentSet;
ADDRGP4 selectedArenaSet
ADDRGP4 currentSet
INDIRI4
ASGNI4
line 871
;871:		selectedArena    = currentGame;
ADDRGP4 selectedArena
ADDRGP4 currentGame
INDIRI4
ASGNI4
line 872
;872:	}
LABELV $769
line 874
;873:
;874:	UI_SPLevelMenu_SetMenuItems();
ADDRGP4 UI_SPLevelMenu_SetMenuItems
CALLV
pop
line 875
;875:}
LABELV $430
endproc UI_SPLevelMenu_Init 112 12
export UI_SPLevelMenu
proc UI_SPLevelMenu 32 8
line 882
;876:
;877:/*
;878:=================
;879:UI_SPLevelMenu
;880:=================
;881:*/
;882:void UI_SPLevelMenu(void) {
line 887
;883:	int         level;
;884:	int         trainingLevel;
;885:	const char* arenaInfo;
;886:
;887:	trainingTier = -1;
ADDRGP4 trainingTier
CNSTI4 -1
ASGNI4
line 888
;888:	arenaInfo    = UI_GetSpecialArenaInfo("training");
ADDRGP4 $157
ARGP4
ADDRLP4 12
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 889
;889:	if (arenaInfo) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $771
line 890
;890:		minTier       = trainingTier;
ADDRGP4 minTier
ADDRGP4 trainingTier
INDIRI4
ASGNI4
line 891
;891:		trainingLevel = atoi(Info_ValueForKey(arenaInfo, "num"));
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $158
ARGP4
ADDRLP4 16
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 20
INDIRI4
ASGNI4
line 892
;892:	} else {
ADDRGP4 $772
JUMPV
LABELV $771
line 893
;893:		minTier       = 0;
ADDRGP4 minTier
CNSTI4 0
ASGNI4
line 894
;894:		trainingLevel = -2;
ADDRLP4 8
CNSTI4 -2
ASGNI4
line 895
;895:	}
LABELV $772
line 897
;896:
;897:	finalTier = UI_GetNumSPTiers();
ADDRLP4 16
ADDRGP4 UI_GetNumSPTiers
CALLI4
ASGNI4
ADDRGP4 finalTier
ADDRLP4 16
INDIRI4
ASGNI4
line 898
;898:	arenaInfo = UI_GetSpecialArenaInfo("final");
ADDRGP4 $192
ARGP4
ADDRLP4 20
ADDRGP4 UI_GetSpecialArenaInfo
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 899
;899:	if (arenaInfo) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $773
line 900
;900:		maxTier = finalTier;
ADDRGP4 maxTier
ADDRGP4 finalTier
INDIRI4
ASGNI4
line 901
;901:	} else {
ADDRGP4 $774
JUMPV
LABELV $773
line 902
;902:		maxTier = finalTier - 1;
ADDRGP4 maxTier
ADDRGP4 finalTier
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 903
;903:		if (maxTier < minTier) {
ADDRGP4 maxTier
INDIRI4
ADDRGP4 minTier
INDIRI4
GEI4 $775
line 904
;904:			maxTier = minTier;
ADDRGP4 maxTier
ADDRGP4 minTier
INDIRI4
ASGNI4
line 905
;905:		}
LABELV $775
line 906
;906:	}
LABELV $774
line 908
;907:
;908:	level = UI_GetCurrentGame();
ADDRLP4 24
ADDRGP4 UI_GetCurrentGame
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 909
;909:	if (level == -1) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $777
line 910
;910:		level = UI_GetNumSPArenas() - 1;
ADDRLP4 28
ADDRGP4 UI_GetNumSPArenas
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 911
;911:		if (maxTier == finalTier) {
ADDRGP4 maxTier
INDIRI4
ADDRGP4 finalTier
INDIRI4
NEI4 $779
line 912
;912:			level++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 913
;913:		}
LABELV $779
line 914
;914:	}
LABELV $777
line 916
;915:
;916:	if (level == trainingLevel) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $781
line 917
;917:		currentSet  = -1;
ADDRGP4 currentSet
CNSTI4 -1
ASGNI4
line 918
;918:		currentGame = 0;
ADDRGP4 currentGame
CNSTI4 0
ASGNI4
line 919
;919:	} else {
ADDRGP4 $782
JUMPV
LABELV $781
line 920
;920:		currentSet  = level / ARENAS_PER_TIER;
ADDRGP4 currentSet
ADDRLP4 0
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 921
;921:		currentGame = level % ARENAS_PER_TIER;
ADDRGP4 currentGame
ADDRLP4 0
INDIRI4
CNSTI4 4
MODI4
ASGNI4
line 922
;922:	}
LABELV $782
line 924
;923:
;924:	UI_SPLevelMenu_Init();
ADDRGP4 UI_SPLevelMenu_Init
CALLV
pop
line 925
;925:	UI_PushMenu(&levelMenuInfo.menu);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 926
;926:	Menu_SetCursorToItem(&levelMenuInfo.menu, &levelMenuInfo.item_next);
ADDRGP4 levelMenuInfo
ARGP4
ADDRGP4 levelMenuInfo+1836
ARGP4
ADDRGP4 Menu_SetCursorToItem
CALLV
pop
line 927
;927:}
LABELV $770
endproc UI_SPLevelMenu 32 8
export UI_SPLevelMenu_f
proc UI_SPLevelMenu_f 0 4
line 934
;928:
;929:/*
;930:=================
;931:UI_SPLevelMenu_f
;932:=================
;933:*/
;934:void UI_SPLevelMenu_f(void) {
line 935
;935:	trap_Key_SetCatcher(KEYCATCH_UI);
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 936
;936:	uis.menusp = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 937
;937:	UI_SPLevelMenu();
ADDRGP4 UI_SPLevelMenu
CALLV
pop
line 938
;938:}
LABELV $784
endproc UI_SPLevelMenu_f 0 4
export UI_SPLevelMenu_ReInit
proc UI_SPLevelMenu_ReInit 0 0
line 945
;939:
;940:/*
;941:=================
;942:UI_SPLevelMenu_ReInit
;943:=================
;944:*/
;945:void UI_SPLevelMenu_ReInit(void) {
line 946
;946:	levelMenuInfo.reinit = qtrue;
ADDRGP4 levelMenuInfo+2020
CNSTI4 1
ASGNI4
line 947
;947:}
LABELV $786
endproc UI_SPLevelMenu_ReInit 0 0
bss
align 4
LABELV maxTier
skip 4
align 4
LABELV minTier
skip 4
align 4
LABELV finalTier
skip 4
align 4
LABELV trainingTier
skip 4
align 4
LABELV currentGame
skip 4
align 4
LABELV currentSet
skip 4
align 4
LABELV selectedArena
skip 4
align 4
LABELV selectedArenaSet
skip 4
align 4
LABELV levelMenuInfo
skip 2692
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
LABELV $446
byte 1 67
byte 1 72
byte 1 79
byte 1 79
byte 1 83
byte 1 69
byte 1 32
byte 1 76
byte 1 69
byte 1 86
byte 1 69
byte 1 76
byte 1 0
align 1
LABELV $435
byte 1 50
byte 1 0
align 1
LABELV $431
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $413
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
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $412
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
byte 1 107
byte 1 105
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 104
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $411
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
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $410
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
byte 1 115
byte 1 101
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $409
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
LABELV $408
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
LABELV $407
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
LABELV $406
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
LABELV $405
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 53
byte 1 0
align 1
LABELV $404
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 52
byte 1 0
align 1
LABELV $403
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 51
byte 1 0
align 1
LABELV $402
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $401
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 116
byte 1 101
byte 1 49
byte 1 0
align 1
LABELV $400
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $399
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 110
byte 1 97
byte 1 114
byte 1 114
byte 1 111
byte 1 119
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $398
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
byte 1 97
byte 1 112
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
LABELV $397
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
byte 1 97
byte 1 112
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
LABELV $394
byte 1 63
byte 1 0
align 1
LABELV $383
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $381
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $345
byte 1 65
byte 1 67
byte 1 67
byte 1 69
byte 1 83
byte 1 83
byte 1 32
byte 1 68
byte 1 69
byte 1 78
byte 1 73
byte 1 69
byte 1 68
byte 1 0
align 1
LABELV $333
byte 1 84
byte 1 105
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $332
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $331
byte 1 37
byte 1 105
byte 1 107
byte 1 0
align 1
LABELV $328
byte 1 37
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $260
byte 1 82
byte 1 69
byte 1 83
byte 1 69
byte 1 84
byte 1 32
byte 1 71
byte 1 65
byte 1 77
byte 1 69
byte 1 63
byte 1 0
align 1
LABELV $253
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 0
align 1
LABELV $252
byte 1 68
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 110
byte 1 108
byte 1 121
byte 1 32
byte 1 105
byte 1 102
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 32
byte 1 119
byte 1 97
byte 1 110
byte 1 116
byte 1 32
byte 1 116
byte 1 111
byte 1 0
align 1
LABELV $251
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 105
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 115
byte 1 46
byte 1 0
align 1
LABELV $250
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
byte 1 114
byte 1 101
byte 1 115
byte 1 101
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $192
byte 1 102
byte 1 105
byte 1 110
byte 1 97
byte 1 108
byte 1 0
align 1
LABELV $158
byte 1 110
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $157
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $154
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 112
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $133
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
LABELV $128
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
LABELV $116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $106
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $103
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $83
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $76
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
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $73
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
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 95
byte 1 37
byte 1 115
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $72
byte 1 100
byte 1 101
byte 1 102
byte 1 97
byte 1 117
byte 1 108
byte 1 116
byte 1 0
