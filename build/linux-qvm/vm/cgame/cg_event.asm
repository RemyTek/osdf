bss
align 1
LABELV $73
skip 64
export CG_PlaceString
code
proc CG_PlaceString 12 20
file "../../../../code/cgame/cg_event.c"
line 20
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_event.c -- handle entity events at snapshot or playerstate transitions
;4:
;5:#include "cg_local.h"
;6:
;7:// for the voice chats
;8:#ifdef MISSIONPACK  // bk001205
;9:#include "../../ui/menudef.h"
;10:#endif
;11://==========================================================================
;12:
;13:/*
;14:===================
;15:CG_PlaceString
;16:
;17:Also called by scoreboard drawing
;18:===================
;19:*/
;20:const char* CG_PlaceString(int rank) {
line 24
;21:	static char str[64];
;22:	char *      s, *t;
;23:
;24:	if (rank & RANK_TIED_FLAG) {
ADDRFP4 0
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $74
line 25
;25:		rank &= ~RANK_TIED_FLAG;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 26
;26:		t = "Tied for ";
ADDRLP4 4
ADDRGP4 $76
ASGNP4
line 27
;27:	} else {
ADDRGP4 $75
JUMPV
LABELV $74
line 28
;28:		t = "";
ADDRLP4 4
ADDRGP4 $77
ASGNP4
line 29
;29:	}
LABELV $75
line 31
;30:
;31:	if (rank == 1) {
ADDRFP4 0
INDIRI4
CNSTI4 1
NEI4 $78
line 32
;32:		s = S_COLOR_BLUE "1st" S_COLOR_WHITE;  // draw in blue
ADDRLP4 0
ADDRGP4 $80
ASGNP4
line 33
;33:	} else if (rank == 2) {
ADDRGP4 $79
JUMPV
LABELV $78
ADDRFP4 0
INDIRI4
CNSTI4 2
NEI4 $81
line 34
;34:		s = S_COLOR_RED "2nd" S_COLOR_WHITE;  // draw in red
ADDRLP4 0
ADDRGP4 $83
ASGNP4
line 35
;35:	} else if (rank == 3) {
ADDRGP4 $82
JUMPV
LABELV $81
ADDRFP4 0
INDIRI4
CNSTI4 3
NEI4 $84
line 36
;36:		s = S_COLOR_YELLOW "3rd" S_COLOR_WHITE;  // draw in yellow
ADDRLP4 0
ADDRGP4 $86
ASGNP4
line 37
;37:	} else if (rank == 11) {
ADDRGP4 $85
JUMPV
LABELV $84
ADDRFP4 0
INDIRI4
CNSTI4 11
NEI4 $87
line 38
;38:		s = "11th";
ADDRLP4 0
ADDRGP4 $89
ASGNP4
line 39
;39:	} else if (rank == 12) {
ADDRGP4 $88
JUMPV
LABELV $87
ADDRFP4 0
INDIRI4
CNSTI4 12
NEI4 $90
line 40
;40:		s = "12th";
ADDRLP4 0
ADDRGP4 $92
ASGNP4
line 41
;41:	} else if (rank == 13) {
ADDRGP4 $91
JUMPV
LABELV $90
ADDRFP4 0
INDIRI4
CNSTI4 13
NEI4 $93
line 42
;42:		s = "13th";
ADDRLP4 0
ADDRGP4 $95
ASGNP4
line 43
;43:	} else if (rank % 10 == 1) {
ADDRGP4 $94
JUMPV
LABELV $93
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 1
NEI4 $96
line 44
;44:		s = va("%ist", rank);
ADDRGP4 $98
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 45
;45:	} else if (rank % 10 == 2) {
ADDRGP4 $97
JUMPV
LABELV $96
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
NEI4 $99
line 46
;46:		s = va("%ind", rank);
ADDRGP4 $101
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 47
;47:	} else if (rank % 10 == 3) {
ADDRGP4 $100
JUMPV
LABELV $99
ADDRFP4 0
INDIRI4
CNSTI4 10
MODI4
CNSTI4 3
NEI4 $102
line 48
;48:		s = va("%ird", rank);
ADDRGP4 $104
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 49
;49:	} else {
ADDRGP4 $103
JUMPV
LABELV $102
line 50
;50:		s = va("%ith", rank);
ADDRGP4 $105
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 51
;51:	}
LABELV $103
LABELV $100
LABELV $97
LABELV $94
LABELV $91
LABELV $88
LABELV $85
LABELV $82
LABELV $79
line 53
;52:
;53:	Com_sprintf(str, sizeof(str), "%s%s", t, s);
ADDRGP4 $73
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $106
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 54
;54:	return str;
ADDRGP4 $73
RETP4
LABELV $72
endproc CG_PlaceString 12 20
proc CG_Obituary 136 20
line 62
;55:}
;56:
;57:/*
;58:=============
;59:CG_Obituary
;60:=============
;61:*/
;62:static void CG_Obituary(entityState_t* ent) {
line 75
;63:	int           mod;
;64:	int           target, attacker;
;65:	char*         message;
;66:	char*         message2;
;67:	const char*   targetInfo;
;68:	const char*   attackerInfo;
;69:	char          targetName[32];
;70:	char          attackerName[32];
;71:	gender_t      gender;
;72:	clientInfo_t* ci;
;73:	qboolean      following;
;74:
;75:	target   = ent->otherEntityNum;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 76
;76:	attacker = ent->otherEntityNum2;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
ASGNI4
line 77
;77:	mod      = ent->eventParm;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 79
;78:
;79:	if (target < 0 || target >= MAX_CLIENTS) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $110
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $108
LABELV $110
line 80
;80:		CG_Error("CG_Obituary: target out of range");
ADDRGP4 $111
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 81
;81:	}
LABELV $108
line 82
;82:	ci = &cgs.clientinfo[target];
ADDRLP4 92
ADDRLP4 4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 84
;83:
;84:	if (attacker < 0 || attacker >= MAX_CLIENTS) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $115
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $113
LABELV $115
line 85
;85:		attacker     = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 86
;86:		attackerInfo = NULL;
ADDRLP4 84
CNSTP4 0
ASGNP4
line 87
;87:	} else {
ADDRGP4 $114
JUMPV
LABELV $113
line 88
;88:		attackerInfo = CG_ConfigString(CS_PLAYERS + attacker);
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 112
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 84
ADDRLP4 112
INDIRP4
ASGNP4
line 89
;89:	}
LABELV $114
line 91
;90:
;91:	targetInfo = CG_ConfigString(CS_PLAYERS + target);
ADDRLP4 4
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 112
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 48
ADDRLP4 112
INDIRP4
ASGNP4
line 92
;92:	if (!targetInfo[0]) {
ADDRLP4 48
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $116
line 93
;93:		return;
ADDRGP4 $107
JUMPV
LABELV $116
line 95
;94:	}
;95:	Q_strncpyz(targetName, Info_ValueForKey(targetInfo, "n"), sizeof(targetName) - 2);
ADDRLP4 48
INDIRP4
ARGP4
ADDRGP4 $118
ARGP4
ADDRLP4 116
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 96
;96:	strcat(targetName, S_COLOR_WHITE);
ADDRLP4 8
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 98
;97:
;98:	following = cg.snap->ps.pm_flags & PMF_FOLLOW;
ADDRLP4 96
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
ASGNI4
line 100
;99:
;100:	message2 = "";
ADDRLP4 88
ADDRGP4 $77
ASGNP4
line 104
;101:
;102:	// check for single client messages
;103:
;104:	switch (mod) {
ADDRLP4 40
INDIRI4
CNSTI4 14
LTI4 $121
ADDRLP4 40
INDIRI4
CNSTI4 22
GTI4 $121
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $139-56
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $139
address $129
address $131
address $133
address $127
address $121
address $125
address $123
address $135
address $137
code
LABELV $123
line 106
;105:	case MOD_SUICIDE:
;106:		message = "suicides";
ADDRLP4 44
ADDRGP4 $124
ASGNP4
line 107
;107:		break;
ADDRGP4 $122
JUMPV
LABELV $125
line 109
;108:	case MOD_FALLING:
;109:		message = "cratered";
ADDRLP4 44
ADDRGP4 $126
ASGNP4
line 110
;110:		break;
ADDRGP4 $122
JUMPV
LABELV $127
line 112
;111:	case MOD_CRUSH:
;112:		message = "was squished";
ADDRLP4 44
ADDRGP4 $128
ASGNP4
line 113
;113:		break;
ADDRGP4 $122
JUMPV
LABELV $129
line 115
;114:	case MOD_WATER:
;115:		message = "sank like a rock";
ADDRLP4 44
ADDRGP4 $130
ASGNP4
line 116
;116:		break;
ADDRGP4 $122
JUMPV
LABELV $131
line 118
;117:	case MOD_SLIME:
;118:		message = "melted";
ADDRLP4 44
ADDRGP4 $132
ASGNP4
line 119
;119:		break;
ADDRGP4 $122
JUMPV
LABELV $133
line 121
;120:	case MOD_LAVA:
;121:		message = "does a back flip into the lava";
ADDRLP4 44
ADDRGP4 $134
ASGNP4
line 122
;122:		break;
ADDRGP4 $122
JUMPV
LABELV $135
line 124
;123:	case MOD_TARGET_LASER:
;124:		message = "saw the light";
ADDRLP4 44
ADDRGP4 $136
ASGNP4
line 125
;125:		break;
ADDRGP4 $122
JUMPV
LABELV $137
line 127
;126:	case MOD_TRIGGER_HURT:
;127:		message = "was in the wrong place";
ADDRLP4 44
ADDRGP4 $138
ASGNP4
line 128
;128:		break;
ADDRGP4 $122
JUMPV
LABELV $121
line 130
;129:	default:
;130:		message = NULL;
ADDRLP4 44
CNSTP4 0
ASGNP4
line 131
;131:		break;
LABELV $122
line 134
;132:	}
;133:
;134:	if (attacker == target) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $141
line 135
;135:		gender = ci->gender;
ADDRLP4 100
ADDRLP4 92
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 136
;136:		switch (mod) {
ADDRLP4 40
INDIRI4
CNSTI4 5
EQI4 $145
ADDRLP4 40
INDIRI4
CNSTI4 7
EQI4 $153
ADDRLP4 40
INDIRI4
CNSTI4 9
EQI4 $161
ADDRLP4 40
INDIRI4
CNSTI4 5
LTI4 $143
LABELV $178
ADDRLP4 40
INDIRI4
CNSTI4 13
EQI4 $169
ADDRGP4 $143
JUMPV
LABELV $145
line 143
;137:#ifdef MISSIONPACK
;138:		case MOD_KAMIKAZE:
;139:			message = "goes out with a bang";
;140:			break;
;141:#endif
;142:		case MOD_GRENADE_SPLASH:
;143:			if (gender == GENDER_FEMALE)
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $146
line 144
;144:				message = "tripped on her own grenade";
ADDRLP4 44
ADDRGP4 $148
ASGNP4
ADDRGP4 $144
JUMPV
LABELV $146
line 145
;145:			else if (gender == GENDER_NEUTER)
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $149
line 146
;146:				message = "tripped on its own grenade";
ADDRLP4 44
ADDRGP4 $151
ASGNP4
ADDRGP4 $144
JUMPV
LABELV $149
line 148
;147:			else
;148:				message = "tripped on his own grenade";
ADDRLP4 44
ADDRGP4 $152
ASGNP4
line 149
;149:			break;
ADDRGP4 $144
JUMPV
LABELV $153
line 151
;150:		case MOD_ROCKET_SPLASH:
;151:			if (gender == GENDER_FEMALE)
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $154
line 152
;152:				message = "blew herself up";
ADDRLP4 44
ADDRGP4 $156
ASGNP4
ADDRGP4 $144
JUMPV
LABELV $154
line 153
;153:			else if (gender == GENDER_NEUTER)
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $157
line 154
;154:				message = "blew itself up";
ADDRLP4 44
ADDRGP4 $159
ASGNP4
ADDRGP4 $144
JUMPV
LABELV $157
line 156
;155:			else
;156:				message = "blew himself up";
ADDRLP4 44
ADDRGP4 $160
ASGNP4
line 157
;157:			break;
ADDRGP4 $144
JUMPV
LABELV $161
line 159
;158:		case MOD_PLASMA_SPLASH:
;159:			if (gender == GENDER_FEMALE)
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $162
line 160
;160:				message = "melted herself";
ADDRLP4 44
ADDRGP4 $164
ASGNP4
ADDRGP4 $144
JUMPV
LABELV $162
line 161
;161:			else if (gender == GENDER_NEUTER)
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $165
line 162
;162:				message = "melted itself";
ADDRLP4 44
ADDRGP4 $167
ASGNP4
ADDRGP4 $144
JUMPV
LABELV $165
line 164
;163:			else
;164:				message = "melted himself";
ADDRLP4 44
ADDRGP4 $168
ASGNP4
line 165
;165:			break;
ADDRGP4 $144
JUMPV
LABELV $169
line 167
;166:		case MOD_BFG_SPLASH:
;167:			message = "should have used a smaller gun";
ADDRLP4 44
ADDRGP4 $170
ASGNP4
line 168
;168:			break;
ADDRGP4 $144
JUMPV
LABELV $143
line 181
;169:#ifdef MISSIONPACK
;170:		case MOD_PROXIMITY_MINE:
;171:			if (gender == GENDER_FEMALE) {
;172:				message = "found her prox mine";
;173:			} else if (gender == GENDER_NEUTER) {
;174:				message = "found its prox mine";
;175:			} else {
;176:				message = "found his prox mine";
;177:			}
;178:			break;
;179:#endif
;180:		default:
;181:			if (gender == GENDER_FEMALE)
ADDRLP4 100
INDIRI4
CNSTI4 1
NEI4 $171
line 182
;182:				message = "killed herself";
ADDRLP4 44
ADDRGP4 $173
ASGNP4
ADDRGP4 $144
JUMPV
LABELV $171
line 183
;183:			else if (gender == GENDER_NEUTER)
ADDRLP4 100
INDIRI4
CNSTI4 2
NEI4 $174
line 184
;184:				message = "killed itself";
ADDRLP4 44
ADDRGP4 $176
ASGNP4
ADDRGP4 $144
JUMPV
LABELV $174
line 186
;185:			else
;186:				message = "killed himself";
ADDRLP4 44
ADDRGP4 $177
ASGNP4
line 187
;187:			break;
LABELV $144
line 189
;188:		}
;189:	}
LABELV $141
line 191
;190:
;191:	if (message) {
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $179
line 194
;192:		// CG_Printf("%s %s.\n", targetName, message);
;193:		// switch to first killer if not following anyone
;194:		if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR && cg_followKiller.integer) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $107
ADDRGP4 cg_followKiller+12
INDIRI4
CNSTI4 0
EQI4 $107
line 195
;195:			if (!cg.followTime && attacker != cg.snap->ps.clientNum && attacker < MAX_CLIENTS) {
ADDRGP4 cg+149080
INDIRI4
CNSTI4 0
NEI4 $107
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $107
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $107
line 196
;196:				cg.followClient = attacker;
ADDRGP4 cg+149084
ADDRLP4 0
INDIRI4
ASGNI4
line 197
;197:				cg.followTime   = cg.time;
ADDRGP4 cg+149080
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 198
;198:			}
line 199
;199:		}
line 200
;200:		return;
ADDRGP4 $107
JUMPV
LABELV $179
line 204
;201:	}
;202:
;203:	// check for kill messages from the current clientNum
;204:	if (attacker == cg.snap->ps.clientNum) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $192
line 207
;205:		char* s;
;206:
;207:		if (cgs.gametype < GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
GEI4 $195
line 208
;208:			s = va("You fragged %s\n%s place with %i", targetName, CG_PlaceString(cg.snap->ps.persistant[PERS_RANK] + 1), cg.snap->ps.persistant[PERS_SCORE]);
ADDRGP4 cg+36
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 128
ADDRGP4 CG_PlaceString
CALLP4
ASGNP4
ADDRGP4 $198
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 132
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 124
ADDRLP4 132
INDIRP4
ASGNP4
line 209
;209:		} else {
ADDRGP4 $196
JUMPV
LABELV $195
line 210
;210:			s = va("You fragged %s", targetName);
ADDRGP4 $201
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 128
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 124
ADDRLP4 128
INDIRP4
ASGNP4
line 211
;211:		}
LABELV $196
line 217
;212:#ifdef MISSIONPACK
;213:		if (!(cg_singlePlayerActive.integer && cg_cameraOrbit.integer)) {
;214:			CG_CenterPrint(s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH);
;215:		}
;216:#else
;217:		CG_CenterPrint(s, SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH);
ADDRLP4 124
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 221
;218:#endif
;219:
;220:		// print the text message as well
;221:	}
LABELV $192
line 224
;222:
;223:	// check for double client messages
;224:	if (!attackerInfo) {
ADDRLP4 84
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $202
line 225
;225:		attacker = ENTITYNUM_WORLD;
ADDRLP4 0
CNSTI4 1022
ASGNI4
line 226
;226:		strcpy(attackerName, "noname");
ADDRLP4 52
ARGP4
ADDRGP4 $204
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 227
;227:	} else {
ADDRGP4 $203
JUMPV
LABELV $202
line 228
;228:		Q_strncpyz(attackerName, Info_ValueForKey(attackerInfo, "n"), sizeof(attackerName) - 2);
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 $118
ARGP4
ADDRLP4 124
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 52
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
CNSTI4 30
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 229
;229:		Q_CleanStr(attackerName);
ADDRLP4 52
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 230
;230:		strcat(attackerName, S_COLOR_WHITE);
ADDRLP4 52
ARGP4
ADDRGP4 $119
ARGP4
ADDRGP4 strcat
CALLP4
pop
line 232
;231:		// check for kill messages about the current clientNum
;232:		if (target == cg.snap->ps.clientNum) {
ADDRLP4 4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $205
line 233
;233:			Q_strncpyz(cg.killerName, attackerName, sizeof(cg.killerName));
ADDRGP4 cg+115368
ARGP4
ADDRLP4 52
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 235
;234:			// follow killer
;235:			if (following && cg_followKiller.integer) {
ADDRLP4 96
INDIRI4
CNSTI4 0
EQI4 $210
ADDRGP4 cg_followKiller+12
INDIRI4
CNSTI4 0
EQI4 $210
line 236
;236:				if (!cg.followTime && attacker != cg.snap->ps.clientNum && attacker < MAX_CLIENTS) {
ADDRGP4 cg+149080
INDIRI4
CNSTI4 0
NEI4 $213
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $213
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $213
line 237
;237:					cg.followClient = attacker;
ADDRGP4 cg+149084
ADDRLP4 0
INDIRI4
ASGNI4
line 238
;238:					cg.followTime   = cg.time + 1100;
ADDRGP4 cg+149080
ADDRGP4 cg+107604
INDIRI4
CNSTI4 1100
ADDI4
ASGNI4
line 239
;239:				}
LABELV $213
line 240
;240:			}
LABELV $210
line 241
;241:		}
LABELV $205
line 242
;242:	}
LABELV $203
line 244
;243:
;244:	if (attacker != ENTITYNUM_WORLD) {
ADDRLP4 0
INDIRI4
CNSTI4 1022
EQI4 $220
line 245
;245:		switch (mod) {
ADDRLP4 40
INDIRI4
CNSTI4 1
LTI4 $222
ADDRLP4 40
INDIRI4
CNSTI4 23
GTI4 $222
ADDRLP4 40
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $257-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $257
address $230
address $226
address $228
address $232
address $235
address $238
address $240
address $242
address $245
address $246
address $248
address $250
address $250
address $222
address $222
address $222
address $222
address $253
address $222
address $222
address $222
address $222
address $224
code
LABELV $224
line 247
;246:		case MOD_GRAPPLE:
;247:			message = "was caught by";
ADDRLP4 44
ADDRGP4 $225
ASGNP4
line 248
;248:			break;
ADDRGP4 $223
JUMPV
LABELV $226
line 250
;249:		case MOD_GAUNTLET:
;250:			message = "was pummeled by";
ADDRLP4 44
ADDRGP4 $227
ASGNP4
line 251
;251:			break;
ADDRGP4 $223
JUMPV
LABELV $228
line 253
;252:		case MOD_MACHINEGUN:
;253:			message = "was machinegunned by";
ADDRLP4 44
ADDRGP4 $229
ASGNP4
line 254
;254:			break;
ADDRGP4 $223
JUMPV
LABELV $230
line 256
;255:		case MOD_SHOTGUN:
;256:			message = "was gunned down by";
ADDRLP4 44
ADDRGP4 $231
ASGNP4
line 257
;257:			break;
ADDRGP4 $223
JUMPV
LABELV $232
line 259
;258:		case MOD_GRENADE:
;259:			message  = "ate";
ADDRLP4 44
ADDRGP4 $233
ASGNP4
line 260
;260:			message2 = "'s grenade";
ADDRLP4 88
ADDRGP4 $234
ASGNP4
line 261
;261:			break;
ADDRGP4 $223
JUMPV
LABELV $235
line 263
;262:		case MOD_GRENADE_SPLASH:
;263:			message  = "was shredded by";
ADDRLP4 44
ADDRGP4 $236
ASGNP4
line 264
;264:			message2 = "'s shrapnel";
ADDRLP4 88
ADDRGP4 $237
ASGNP4
line 265
;265:			break;
ADDRGP4 $223
JUMPV
LABELV $238
line 267
;266:		case MOD_ROCKET:
;267:			message  = "ate";
ADDRLP4 44
ADDRGP4 $233
ASGNP4
line 268
;268:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $239
ASGNP4
line 269
;269:			break;
ADDRGP4 $223
JUMPV
LABELV $240
line 271
;270:		case MOD_ROCKET_SPLASH:
;271:			message  = "almost dodged";
ADDRLP4 44
ADDRGP4 $241
ASGNP4
line 272
;272:			message2 = "'s rocket";
ADDRLP4 88
ADDRGP4 $239
ASGNP4
line 273
;273:			break;
ADDRGP4 $223
JUMPV
LABELV $242
line 275
;274:		case MOD_PLASMA:
;275:			message  = "was melted by";
ADDRLP4 44
ADDRGP4 $243
ASGNP4
line 276
;276:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $244
ASGNP4
line 277
;277:			break;
ADDRGP4 $223
JUMPV
LABELV $245
line 279
;278:		case MOD_PLASMA_SPLASH:
;279:			message  = "was melted by";
ADDRLP4 44
ADDRGP4 $243
ASGNP4
line 280
;280:			message2 = "'s plasmagun";
ADDRLP4 88
ADDRGP4 $244
ASGNP4
line 281
;281:			break;
ADDRGP4 $223
JUMPV
LABELV $246
line 283
;282:		case MOD_RAILGUN:
;283:			message = "was railed by";
ADDRLP4 44
ADDRGP4 $247
ASGNP4
line 284
;284:			break;
ADDRGP4 $223
JUMPV
LABELV $248
line 286
;285:		case MOD_LIGHTNING:
;286:			message = "was electrocuted by";
ADDRLP4 44
ADDRGP4 $249
ASGNP4
line 287
;287:			break;
ADDRGP4 $223
JUMPV
LABELV $250
line 290
;288:		case MOD_BFG:
;289:		case MOD_BFG_SPLASH:
;290:			message  = "was blasted by";
ADDRLP4 44
ADDRGP4 $251
ASGNP4
line 291
;291:			message2 = "'s BFG";
ADDRLP4 88
ADDRGP4 $252
ASGNP4
line 292
;292:			break;
ADDRGP4 $223
JUMPV
LABELV $253
line 314
;293:#ifdef MISSIONPACK
;294:		case MOD_NAIL:
;295:			message = "was nailed by";
;296:			break;
;297:		case MOD_CHAINGUN:
;298:			message  = "got lead poisoning from";
;299:			message2 = "'s Chaingun";
;300:			break;
;301:		case MOD_PROXIMITY_MINE:
;302:			message  = "was too close to";
;303:			message2 = "'s Prox Mine";
;304:			break;
;305:		case MOD_KAMIKAZE:
;306:			message  = "falls to";
;307:			message2 = "'s Kamikaze blast";
;308:			break;
;309:		case MOD_JUICED:
;310:			message = "was juiced by";
;311:			break;
;312:#endif
;313:		case MOD_TELEFRAG:
;314:			message  = "tried to invade";
ADDRLP4 44
ADDRGP4 $254
ASGNP4
line 315
;315:			message2 = "'s personal space";
ADDRLP4 88
ADDRGP4 $255
ASGNP4
line 316
;316:			break;
ADDRGP4 $223
JUMPV
LABELV $222
line 318
;317:		default:
;318:			message = "was killed by";
ADDRLP4 44
ADDRGP4 $256
ASGNP4
line 319
;319:			break;
LABELV $223
line 322
;320:		}
;321:
;322:		if (message) {
ADDRLP4 44
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $259
line 323
;323:			CG_Printf("%s %s %s%s\n", targetName, message, attackerName, message2);
ADDRGP4 $261
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 52
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 325
;324:			// switch to first killer if not following anyone
;325:			if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR && cg_followKiller.integer) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $107
ADDRGP4 cg_followKiller+12
INDIRI4
CNSTI4 0
EQI4 $107
line 326
;326:				if (!cg.followTime && attacker != cg.snap->ps.clientNum && attacker < MAX_CLIENTS) {
ADDRGP4 cg+149080
INDIRI4
CNSTI4 0
NEI4 $107
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $107
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $107
line 327
;327:					cg.followClient = attacker;
ADDRGP4 cg+149084
ADDRLP4 0
INDIRI4
ASGNI4
line 328
;328:					cg.followTime   = cg.time;
ADDRGP4 cg+149080
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 329
;329:				}
line 330
;330:			}
line 331
;331:			return;
ADDRGP4 $107
JUMPV
LABELV $259
line 333
;332:		}
;333:	}
LABELV $220
line 336
;334:
;335:	// we don't know what it was
;336:	CG_Printf("%s " S_COLOR_STRIP "died.\n", targetName);
ADDRGP4 $273
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 337
;337:}
LABELV $107
endproc CG_Obituary 136 20
proc CG_UseItem 32 16
line 345
;338://==========================================================================
;339:
;340:/*
;341:===============
;342:CG_UseItem
;343:===============
;344:*/
;345:static void CG_UseItem(centity_t* cent) {
line 351
;346:	clientInfo_t*  ci;
;347:	int            itemNum, clientNum;
;348:	gitem_t*       item;
;349:	entityState_t* es;
;350:
;351:	es = &cent->currentState;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
line 353
;352:
;353:	itemNum = (es->event & ~EV_EVENT_BITS) - EV_USE_ITEM0;
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 24
SUBI4
ASGNI4
line 354
;354:	if (itemNum < 0 || itemNum > HI_NUM_HOLDABLE) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $277
ADDRLP4 0
INDIRI4
CNSTI4 6
LEI4 $275
LABELV $277
line 355
;355:		itemNum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 356
;356:	}
LABELV $275
line 359
;357:
;358:	// print a message if the local player
;359:	if (es->number == cg.snap->ps.clientNum) {
ADDRLP4 4
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $278
line 360
;360:		if (!itemNum) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $281
line 361
;361:			CG_CenterPrint("No item to use", SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH);
ADDRGP4 $283
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 362
;362:		} else {
ADDRGP4 $282
JUMPV
LABELV $281
line 363
;363:			item = BG_FindItemForHoldable(itemNum);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 BG_FindItemForHoldable
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 24
INDIRP4
ASGNP4
line 364
;364:			CG_CenterPrint(va("Use %s", item->pickup_name), SCREEN_HEIGHT * 0.30, BIGCHAR_WIDTH);
ADDRGP4 $284
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 28
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 144
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 365
;365:		}
LABELV $282
line 366
;366:	}
LABELV $278
line 368
;367:
;368:	switch (itemNum) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $287
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $286
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $291
ADDRGP4 $285
JUMPV
LABELV $285
LABELV $287
line 371
;369:	default:
;370:	case HI_NONE:
;371:		trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.useNothingSound);
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+148692+528
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 372
;372:		break;
ADDRGP4 $286
JUMPV
line 375
;373:
;374:	case HI_TELEPORTER:
;375:		break;
LABELV $291
line 378
;376:
;377:	case HI_MEDKIT:
;378:		clientNum = cent->currentState.clientNum;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 379
;379:		if (clientNum >= 0 && clientNum < MAX_CLIENTS) {
ADDRLP4 28
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $292
ADDRLP4 28
INDIRI4
CNSTI4 64
GEI4 $292
line 380
;380:			ci                  = &cgs.clientinfo[clientNum];
ADDRLP4 16
ADDRLP4 12
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 381
;381:			ci->medkitUsageTime = cg.time;
ADDRLP4 16
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 382
;382:		}
LABELV $292
line 383
;383:		trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.medkitSound);
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+148692+828
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 384
;384:		break;
LABELV $286
line 397
;385:
;386:#ifdef MISSIONPACK
;387:	case HI_KAMIKAZE:
;388:		break;
;389:
;390:	case HI_PORTAL:
;391:		break;
;392:	case HI_INVULNERABILITY:
;393:		trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.useInvulnerabilitySound);
;394:		break;
;395:#endif
;396:	}
;397:}
LABELV $274
endproc CG_UseItem 32 16
data
align 4
LABELV $299
byte 4 -1
code
proc CG_ItemPickup 4 0
line 406
;398:
;399:/*
;400:================
;401:CG_ItemPickup
;402:
;403:A new item was picked up this frame
;404:================
;405:*/
;406:static void CG_ItemPickup(int itemNum) {
line 409
;407:	static int oldItem = -1;
;408:
;409:	cg.itemPickup          = itemNum;
ADDRGP4 cg+117832
ADDRFP4 0
INDIRI4
ASGNI4
line 410
;410:	cg.itemPickupTime      = cg.time;
ADDRGP4 cg+117840
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 411
;411:	cg.itemPickupBlendTime = cg.time;
ADDRGP4 cg+117844
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 413
;412:
;413:	if (oldItem != itemNum)
ADDRGP4 $299
INDIRI4
ADDRFP4 0
INDIRI4
EQI4 $305
line 414
;414:		cg.itemPickupCount = 1;
ADDRGP4 cg+117836
CNSTI4 1
ASGNI4
ADDRGP4 $306
JUMPV
LABELV $305
line 416
;415:	else
;416:		cg.itemPickupCount++;
ADDRLP4 0
ADDRGP4 cg+117836
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $306
line 418
;417:
;418:	oldItem = itemNum;
ADDRGP4 $299
ADDRFP4 0
INDIRI4
ASGNI4
line 421
;419:
;420:	// see if it should be the grabbed weapon
;421:	if (bg_itemlist[itemNum].giType == IT_WEAPON) {
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $309
line 423
;422:		// select it immediately
;423:		if (cg_autoswitch.integer && bg_itemlist[itemNum].giTag != WP_MACHINEGUN) {
ADDRGP4 cg_autoswitch+12
INDIRI4
CNSTI4 0
EQI4 $312
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
CNSTI4 2
EQI4 $312
line 424
;424:			cg.weaponSelectTime = cg.time;
ADDRGP4 cg+117848
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 425
;425:			cg.weaponSelect     = bg_itemlist[itemNum].giTag;
ADDRGP4 cg+108956
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+40
ADDP4
INDIRI4
ASGNI4
line 426
;426:		}
LABELV $312
line 427
;427:	}
LABELV $309
line 428
;428:}
LABELV $298
endproc CG_ItemPickup 4 0
export CG_WaterLevel
proc CG_WaterLevel 52 8
line 437
;429:
;430:/*
;431:================
;432:CG_WaterLevel
;433:
;434:Returns waterlevel for entity origin
;435:================
;436:*/
;437:int CG_WaterLevel(centity_t* cent) {
line 442
;438:	vec3_t point;
;439:	int    contents, sample1, sample2, anim, waterlevel;
;440:	int    viewheight;
;441:
;442:	anim = cent->currentState.legsAnim & ~ANIM_TOGGLEBIT;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 444
;443:
;444:	if (anim == LEGS_WALKCR || anim == LEGS_IDLECR) {
ADDRLP4 16
INDIRI4
CNSTI4 13
EQI4 $323
ADDRLP4 16
INDIRI4
CNSTI4 23
NEI4 $321
LABELV $323
line 445
;445:		viewheight = CROUCH_VIEWHEIGHT;
ADDRLP4 24
CNSTI4 12
ASGNI4
line 446
;446:	} else {
ADDRGP4 $322
JUMPV
LABELV $321
line 447
;447:		viewheight = DEFAULT_VIEWHEIGHT;
ADDRLP4 24
CNSTI4 26
ASGNI4
line 448
;448:	}
LABELV $322
line 453
;449:
;450:	//
;451:	// get waterlevel, accounting for ducking
;452:	//
;453:	waterlevel = 0;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 455
;454:
;455:	point[0] = cent->lerpOrigin[0];
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
INDIRF4
ASGNF4
line 456
;456:	point[1] = cent->lerpOrigin[1];
ADDRLP4 0+4
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRF4
ASGNF4
line 457
;457:	point[2] = cent->lerpOrigin[2] + MINS_Z + 1;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 458
;458:	contents = CG_PointContents(point, -1);
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 40
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 460
;459:
;460:	if (contents & MASK_WATER) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $326
line 461
;461:		sample2    = viewheight - MINS_Z;
ADDRLP4 28
ADDRLP4 24
INDIRI4
CNSTI4 -24
SUBI4
ASGNI4
line 462
;462:		sample1    = sample2 / 2;
ADDRLP4 32
ADDRLP4 28
INDIRI4
CNSTI4 2
DIVI4
ASGNI4
line 463
;463:		waterlevel = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 464
;464:		point[2]   = cent->lerpOrigin[2] + MINS_Z + sample1;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 32
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 465
;465:		contents   = CG_PointContents(point, -1);
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 44
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 467
;466:
;467:		if (contents & MASK_WATER) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $329
line 468
;468:			waterlevel = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 469
;469:			point[2]   = cent->lerpOrigin[2] + MINS_Z + sample2;
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRF4
CNSTF4 3250585600
ADDF4
ADDRLP4 28
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 470
;470:			contents   = CG_PointContents(point, -1);
ADDRLP4 0
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 48
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 472
;471:
;472:			if (contents & MASK_WATER) {
ADDRLP4 12
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $332
line 473
;473:				waterlevel = 3;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 474
;474:			}
LABELV $332
line 475
;475:		}
LABELV $329
line 476
;476:	}
LABELV $326
line 478
;477:
;478:	return waterlevel;
ADDRLP4 20
INDIRI4
RETI4
LABELV $320
endproc CG_WaterLevel 52 8
export CG_PainEvent
proc CG_PainEvent 16 16
line 488
;479:}
;480:
;481:/*
;482:================
;483:CG_PainEvent
;484:
;485:Also called by playerstate transition
;486:================
;487:*/
;488:void CG_PainEvent(centity_t* cent, int health) {
line 492
;489:	const char* snd;
;490:
;491:	// don't do more than two pain sounds a second
;492:	if (cg.time - cent->pe.painTime < 500) {
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
SUBI4
CNSTI4 500
GEI4 $335
line 493
;493:		cent->pe.painIgnore = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 494
;494:		return;
ADDRGP4 $334
JUMPV
LABELV $335
line 497
;495:	}
;496:
;497:	if (cent->pe.painIgnore) {
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $338
line 498
;498:		cent->pe.painIgnore = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 499
;499:		return;
ADDRGP4 $334
JUMPV
LABELV $338
line 502
;500:	}
;501:
;502:	if (health < 25) {
ADDRFP4 4
INDIRI4
CNSTI4 25
GEI4 $340
line 503
;503:		snd = "*pain25_1.wav";
ADDRLP4 0
ADDRGP4 $342
ASGNP4
line 504
;504:	} else if (health < 50) {
ADDRGP4 $341
JUMPV
LABELV $340
ADDRFP4 4
INDIRI4
CNSTI4 50
GEI4 $343
line 505
;505:		snd = "*pain50_1.wav";
ADDRLP4 0
ADDRGP4 $345
ASGNP4
line 506
;506:	} else if (health < 75) {
ADDRGP4 $344
JUMPV
LABELV $343
ADDRFP4 4
INDIRI4
CNSTI4 75
GEI4 $346
line 507
;507:		snd = "*pain75_1.wav";
ADDRLP4 0
ADDRGP4 $348
ASGNP4
line 508
;508:	} else {
ADDRGP4 $347
JUMPV
LABELV $346
line 509
;509:		snd = "*pain100_1.wav";
ADDRLP4 0
ADDRGP4 $349
ASGNP4
line 510
;510:	}
LABELV $347
LABELV $344
LABELV $341
line 513
;511:
;512:	// play a gurp sound instead of a normal pain sound
;513:	if (CG_WaterLevel(cent) == 3) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CG_WaterLevel
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $350
line 514
;514:		if (rand() & 1) {
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $352
line 515
;515:			trap_S_StartSound(NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, "sound/player/gurp1.wav"));
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $354
ARGP4
ADDRLP4 12
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 516
;516:		} else {
ADDRGP4 $351
JUMPV
LABELV $352
line 517
;517:			trap_S_StartSound(NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, "sound/player/gurp2.wav"));
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $355
ARGP4
ADDRLP4 12
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 518
;518:		}
line 519
;519:	} else {
ADDRGP4 $351
JUMPV
LABELV $350
line 520
;520:		trap_S_StartSound(NULL, cent->currentState.number, CHAN_VOICE, CG_CustomSound(cent->currentState.number, snd));
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 521
;521:	}
LABELV $351
line 524
;522:
;523:	// save pain time for programitic twitch animation
;524:	cent->pe.painTime = cg.time;
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 525
;525:	cent->pe.painDirection ^= 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 608
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 526
;526:}
LABELV $334
endproc CG_PainEvent 16 16
data
align 4
LABELV $463
byte 4 0
byte 4 0
byte 4 1065353216
export CG_EntityEvent
code
proc CG_EntityEvent 116 48
line 536
;527:
;528:/*
;529:==============
;530:CG_EntityEvent
;531:
;532:An entity has an event value
;533:also called by CG_CheckPlayerstateEvents
;534:==============
;535:*/
;536:void CG_EntityEvent(centity_t* cent, vec3_t position, int entityNum) {
line 547
;537:	entityState_t* es;
;538:	entity_event_t event;
;539:	vec3_t         dir;
;540:	const char*    s;
;541:	int            clientNum;
;542:	clientInfo_t*  ci;
;543:	vec3_t         vec;
;544:	float          fovOffset;
;545:	centity_t*     ce;
;546:
;547:	es    = &cent->currentState;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 548
;548:	event = es->event & ~EV_EVENT_BITS;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
ASGNI4
line 550
;549:
;550:	if ((unsigned)event >= EV_MAX) {
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 83
LTU4 $358
line 551
;551:		CG_Error("Unknown event: %i", event);
ADDRGP4 $360
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 552
;552:		return;
ADDRGP4 $357
JUMPV
LABELV $358
line 555
;553:	}
;554:
;555:	if (cg_debugEvents.integer) {
ADDRGP4 cg_debugEvents+12
INDIRI4
CNSTI4 0
EQI4 $361
line 556
;556:		CG_Printf("ent:%3i  event:%3i %s", es->number, event, eventnames[event]);
ADDRGP4 $364
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 eventnames
ADDP4
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 557
;557:	}
LABELV $361
line 559
;558:
;559:	if (!event) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $365
line 560
;560:		return;
ADDRGP4 $357
JUMPV
LABELV $365
line 563
;561:	}
;562:
;563:	clientNum = es->clientNum;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 564
;564:	if ((unsigned)clientNum >= MAX_CLIENTS) {
ADDRLP4 8
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $367
line 565
;565:		clientNum = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 566
;566:	}
LABELV $367
line 567
;567:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 12
ADDRLP4 8
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 569
;568:
;569:	switch (event) {
ADDRLP4 52
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 1
LTI4 $370
ADDRLP4 52
INDIRI4
CNSTI4 76
GTI4 $370
ADDRLP4 52
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $765-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $765
address $373
address $379
address $386
address $393
address $400
address $436
address $436
address $436
address $436
address $407
address $417
address $426
address $462
address $470
address $476
address $479
address $482
address $485
address $487
address $508
address $525
address $529
address $532
address $533
address $533
address $533
address $533
address $533
address $533
address $533
address $533
address $533
address $533
address $533
address $533
address $533
address $533
address $533
address $533
address $543
address $540
address $534
address $537
address $547
address $622
address $627
address $634
address $620
address $619
address $555
address $556
address $557
address $558
address $621
address $370
address $722
address $726
address $726
address $726
address $731
address $732
address $741
address $750
address $759
address $554
address $371
address $371
address $370
address $370
address $370
address $370
address $370
address $370
address $763
address $762
address $474
code
LABELV $373
line 574
;570:	//
;571:	// movement generated events
;572:	//
;573:	case EV_FOOTSTEP:
;574:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $371
line 575
;575:			trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.footsteps[ci->footsteps][rand() & 3]);
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 60
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 412
ADDP4
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 cgs+148692+536
ADDP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 576
;576:		}
line 577
;577:		break;
ADDRGP4 $371
JUMPV
LABELV $379
line 580
;578:
;579:	case EV_FOOTSTEP_METAL:
;580:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $371
line 581
;581:			trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.footsteps[FOOTSTEP_METAL][rand() & 3]);
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 60
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+536+80
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 582
;582:		}
line 583
;583:		break;
ADDRGP4 $371
JUMPV
LABELV $386
line 586
;584:
;585:	case EV_FOOTSPLASH:
;586:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $371
line 587
;587:			trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.footsteps[FOOTSTEP_SPLASH][rand() & 3]);
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 60
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+536+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 588
;588:		}
line 589
;589:		break;
ADDRGP4 $371
JUMPV
LABELV $393
line 592
;590:
;591:	case EV_FOOTWADE:
;592:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $371
line 593
;593:			trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.footsteps[FOOTSTEP_SPLASH][rand() & 3]);
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 60
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+536+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 594
;594:		}
line 595
;595:		break;
ADDRGP4 $371
JUMPV
LABELV $400
line 598
;596:
;597:	case EV_SWIM:
;598:		if (cg_footsteps.integer) {
ADDRGP4 cg_footsteps+12
INDIRI4
CNSTI4 0
EQI4 $371
line 599
;599:			trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.footsteps[FOOTSTEP_SPLASH][rand() & 3]);
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRLP4 60
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+536+96
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 600
;600:		}
line 601
;601:		break;
ADDRGP4 $371
JUMPV
LABELV $407
line 604
;602:
;603:	case EV_FALL_SHORT:
;604:		trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.landSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+720
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 605
;605:		if (clientNum == cg.predictedPlayerState.clientNum) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $371
line 607
;606:			// smooth landing z changes
;607:			cg.landChange = -8;
ADDRGP4 cg+108948
CNSTF4 3238002688
ASGNF4
line 608
;608:			cg.landTime   = cg.time;
ADDRGP4 cg+108952
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 609
;609:		}
line 610
;610:		break;
ADDRGP4 $371
JUMPV
LABELV $417
line 614
;611:
;612:	case EV_FALL_MEDIUM:
;613:		// use normal pain sound
;614:		trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, "*pain100_1.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $349
ARGP4
ADDRLP4 60
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 60
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 615
;615:		cent->pe.painIgnore = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 616
;616:		cent->pe.painTime   = cg.time;  // don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 617
;617:		if (clientNum == cg.predictedPlayerState.clientNum) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $371
line 619
;618:			// smooth landing z changes
;619:			cg.landChange = -16;
ADDRGP4 cg+108948
CNSTF4 3246391296
ASGNF4
line 620
;620:			cg.landTime   = cg.time;
ADDRGP4 cg+108952
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 621
;621:		}
line 622
;622:		break;
ADDRGP4 $371
JUMPV
LABELV $426
line 625
;623:
;624:	case EV_FALL_FAR:
;625:		trap_S_StartSound(NULL, es->number, CHAN_AUTO, CG_CustomSound(es->number, "*fall1.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $427
ARGP4
ADDRLP4 64
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 64
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 626
;626:		cent->pe.painIgnore = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 627
;627:		cent->pe.painTime   = cg.time;  // don't play a pain sound right after this
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 628
;628:		if (clientNum == cg.predictedPlayerState.clientNum) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
NEI4 $371
line 630
;629:			// smooth landing z changes
;630:			cg.landChange = -24;
ADDRGP4 cg+108948
CNSTF4 3250585600
ASGNF4
line 631
;631:			cg.landTime   = cg.time;
ADDRGP4 cg+108952
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 632
;632:		}
line 633
;633:		break;
ADDRGP4 $371
JUMPV
LABELV $436
line 639
;634:
;635:	case EV_STEP_4:
;636:	case EV_STEP_8:
;637:	case EV_STEP_12:
;638:	case EV_STEP_16:  // smooth out step up transitions
;639:	{
line 644
;640:		float oldStep;
;641:		int   delta;
;642:		int   step;
;643:
;644:		if (clientNum != cg.predictedPlayerState.clientNum) {
ADDRLP4 8
INDIRI4
ADDRGP4 cg+107636+140
INDIRI4
EQI4 $437
line 645
;645:			break;
ADDRGP4 $371
JUMPV
LABELV $437
line 648
;646:		}
;647:		// if we are interpolating, we don't need to smooth steps
;648:		if (cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW) || cg_nopredict.integer || cgs.synchronousClients) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $449
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $449
ADDRGP4 cg_nopredict+12
INDIRI4
CNSTI4 0
NEI4 $449
ADDRGP4 cgs+149684
INDIRI4
CNSTI4 0
EQI4 $441
LABELV $449
line 649
;649:			break;
ADDRGP4 $371
JUMPV
LABELV $441
line 652
;650:		}
;651:		// check for stepping up before a previous step is completed
;652:		delta = cg.time - cg.stepTime;
ADDRLP4 68
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+108936
INDIRI4
SUBI4
ASGNI4
line 653
;653:		if (delta < STEP_TIME) {
ADDRLP4 68
INDIRI4
CNSTI4 200
GEI4 $452
line 654
;654:			oldStep = cg.stepChange * (STEP_TIME - delta) / STEP_TIME;
ADDRLP4 72
ADDRGP4 cg+108932
INDIRF4
CNSTI4 200
ADDRLP4 68
INDIRI4
SUBI4
CVIF4 4
MULF4
CNSTF4 1000593162
MULF4
ASGNF4
line 655
;655:		} else {
ADDRGP4 $453
JUMPV
LABELV $452
line 656
;656:			oldStep = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
line 657
;657:		}
LABELV $453
line 660
;658:
;659:		// add this amount
;660:		step          = 4 * (event - EV_STEP_4 + 1);
ADDRLP4 76
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 24
SUBI4
CNSTI4 4
ADDI4
ASGNI4
line 661
;661:		cg.stepChange = oldStep + step;
ADDRGP4 cg+108932
ADDRLP4 72
INDIRF4
ADDRLP4 76
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 662
;662:		if (cg.stepChange > MAX_STEP_CHANGE) {
ADDRGP4 cg+108932
INDIRF4
CNSTF4 1107296256
LEF4 $456
line 663
;663:			cg.stepChange = MAX_STEP_CHANGE;
ADDRGP4 cg+108932
CNSTF4 1107296256
ASGNF4
line 664
;664:		}
LABELV $456
line 665
;665:		cg.stepTime = cg.time;
ADDRGP4 cg+108936
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 666
;666:		break;
ADDRGP4 $371
JUMPV
LABELV $462
line 671
;667:	}
;668:
;669:	case EV_JUMP_PAD:
;670:		//		CG_Printf( "EV_JUMP_PAD w/effect #%i\n", es->eventParm );
;671:		{
line 672
;672:			vec3_t up = {0, 0, 1};
ADDRLP4 68
ADDRGP4 $463
INDIRB
ASGNB 12
line 674
;673:
;674:			CG_SmokePuff(cent->lerpOrigin, up, 32, 1, 1, 1, 0.33f, 1000, cg.time, 0, LEF_PUFF_DONT_SCALE, cgs.media.smokePuffShader);
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 68
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1051260355
ARGF4
CNSTF4 1148846080
ARGF4
ADDRGP4 cg+107604
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 cgs+148692+276
INDIRI4
ARGI4
ADDRGP4 CG_SmokePuff
CALLP4
pop
line 675
;675:		}
line 678
;676:
;677:		// boing sound at origin, jump sound on player
;678:		trap_S_StartSound(cent->lerpOrigin, -1, CHAN_VOICE, cgs.media.jumpPadSound);
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
CNSTI4 -1
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 cgs+148692+724
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 679
;679:		trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, "*jump1.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $469
ARGP4
ADDRLP4 68
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 680
;680:		break;
ADDRGP4 $371
JUMPV
LABELV $470
line 684
;681:
;682:	case EV_JUMP:
;683:		// pain event with fast sequential jump just creates sound distortion
;684:		if (cg.time - cent->pe.painTime > 50)
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
SUBI4
CNSTI4 50
LEI4 $371
line 685
;685:			trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, "*jump1.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $469
ARGP4
ADDRLP4 72
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 686
;686:		break;
ADDRGP4 $371
JUMPV
LABELV $474
line 689
;687:
;688:	case EV_TAUNT:
;689:		trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, "*taunt.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $475
ARGP4
ADDRLP4 76
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 76
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 690
;690:		break;
ADDRGP4 $371
JUMPV
LABELV $476
line 718
;691:
;692:#ifdef MISSIONPACK
;693:	case EV_TAUNT_YES:
;694:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_YES);
;695:		break;
;696:
;697:	case EV_TAUNT_NO:
;698:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_NO);
;699:		break;
;700:
;701:	case EV_TAUNT_FOLLOWME:
;702:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_FOLLOWME);
;703:		break;
;704:
;705:	case EV_TAUNT_GETFLAG:
;706:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONGETFLAG);
;707:		break;
;708:
;709:	case EV_TAUNT_GUARDBASE:
;710:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONDEFENSE);
;711:		break;
;712:
;713:	case EV_TAUNT_PATROL:
;714:		CG_VoiceChatLocal(SAY_TEAM, qfalse, es->number, COLOR_CYAN, VOICECHAT_ONPATROL);
;715:		break;
;716:#endif
;717:	case EV_WATER_TOUCH:
;718:		trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.watrInSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+812
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 719
;719:		break;
ADDRGP4 $371
JUMPV
LABELV $479
line 722
;720:
;721:	case EV_WATER_LEAVE:
;722:		trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.watrOutSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+816
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 723
;723:		break;
ADDRGP4 $371
JUMPV
LABELV $482
line 726
;724:
;725:	case EV_WATER_UNDER:
;726:		trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.watrUnSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+820
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 727
;727:		break;
ADDRGP4 $371
JUMPV
LABELV $485
line 730
;728:
;729:	case EV_WATER_CLEAR:
;730:		trap_S_StartSound(NULL, es->number, CHAN_AUTO, CG_CustomSound(es->number, "*gasp.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $486
ARGP4
ADDRLP4 80
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 80
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 731
;731:		break;
ADDRGP4 $371
JUMPV
LABELV $487
line 733
;732:
;733:	case EV_ITEM_PICKUP: {
line 737
;734:		gitem_t* item;
;735:		int      index;
;736:
;737:		index = es->eventParm;  // player predicted
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 739
;738:
;739:		if (index < 1 || index >= bg_numItems) {
ADDRLP4 92
ADDRLP4 84
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 1
LTI4 $490
ADDRLP4 92
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $488
LABELV $490
line 740
;740:			break;
ADDRGP4 $371
JUMPV
LABELV $488
line 743
;741:		}
;742:
;743:		if (entityNum >= 0) {
ADDRFP4 8
INDIRI4
CNSTI4 0
LTI4 $491
line 745
;744:			// our predicted entity
;745:			ce = cg_entities + entityNum;
ADDRLP4 40
ADDRFP4 8
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 746
;746:			if (ce->delaySpawn > cg.time && ce->delaySpawnPlayed) {
ADDRLP4 96
ADDRLP4 40
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $492
ADDRLP4 96
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $492
line 747
;747:				break;  // delay item pickup
ADDRGP4 $371
JUMPV
line 749
;748:			}
;749:		} else {
LABELV $491
line 750
;750:			ce = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 751
;751:		}
LABELV $492
line 753
;752:
;753:		item = &bg_itemlist[index];
ADDRLP4 88
ADDRLP4 84
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 757
;754:
;755:		// powerups and team items will have a separate global sound, this one
;756:		// will be played at prediction time
;757:		if (item->giType == IT_POWERUP || item->giType == IT_TEAM) {
ADDRLP4 96
ADDRLP4 88
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
EQI4 $498
ADDRLP4 96
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $496
LABELV $498
line 758
;758:			trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.n_healthSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+948
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 759
;759:		} else if (item->giType == IT_PERSISTANT_POWERUP) {
ADDRGP4 $497
JUMPV
LABELV $496
ADDRLP4 88
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 7
NEI4 $501
line 776
;760:#ifdef MISSIONPACK
;761:			switch (item->giTag) {
;762:			case PW_SCOUT:
;763:				trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.scoutSound);
;764:				break;
;765:			case PW_GUARD:
;766:				trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.guardSound);
;767:				break;
;768:			case PW_DOUBLER:
;769:				trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.doublerSound);
;770:				break;
;771:			case PW_AMMOREGEN:
;772:				trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.ammoregenSound);
;773:				break;
;774:			}
;775:#endif
;776:		} else {
ADDRGP4 $502
JUMPV
LABELV $501
line 777
;777:			trap_S_StartSound(NULL, es->number, CHAN_AUTO, trap_S_RegisterSound(item->pickup_sound, qfalse));
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 100
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 100
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 778
;778:		}
LABELV $502
LABELV $497
line 781
;779:
;780:		// show icon and name on status bar
;781:		if (es->number == cg.snap->ps.clientNum) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $503
line 782
;782:			CG_ItemPickup(index);
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 783
;783:		}
LABELV $503
line 785
;784:
;785:		if (ce) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $371
line 786
;786:			ce->delaySpawnPlayed = qtrue;
ADDRLP4 40
INDIRP4
CNSTI4 452
ADDP4
CNSTI4 1
ASGNI4
line 787
;787:		}
line 788
;788:	} break;
ADDRGP4 $371
JUMPV
LABELV $508
line 790
;789:
;790:	case EV_GLOBAL_ITEM_PICKUP: {
line 794
;791:		gitem_t* item;
;792:		int      index;
;793:
;794:		index = es->eventParm;  // player predicted
ADDRLP4 84
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 796
;795:
;796:		if (index < 1 || index >= bg_numItems) {
ADDRLP4 92
ADDRLP4 84
INDIRI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 1
LTI4 $511
ADDRLP4 92
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $509
LABELV $511
line 797
;797:			break;
ADDRGP4 $371
JUMPV
LABELV $509
line 800
;798:		}
;799:
;800:		if (entityNum >= 0) {
ADDRFP4 8
INDIRI4
CNSTI4 0
LTI4 $512
line 802
;801:			// our predicted entity
;802:			ce = cg_entities + entityNum;
ADDRLP4 40
ADDRFP4 8
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 803
;803:			if (ce->delaySpawn > cg.time && ce->delaySpawnPlayed) {
ADDRLP4 96
ADDRLP4 40
INDIRP4
ASGNP4
ADDRLP4 96
INDIRP4
CNSTI4 448
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $513
ADDRLP4 96
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 0
EQI4 $513
line 804
;804:				break;
ADDRGP4 $371
JUMPV
line 806
;805:			}
;806:		} else {
LABELV $512
line 807
;807:			ce = NULL;
ADDRLP4 40
CNSTP4 0
ASGNP4
line 808
;808:		}
LABELV $513
line 810
;809:
;810:		item = &bg_itemlist[index];
ADDRLP4 88
ADDRLP4 84
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 812
;811:		// powerup pickups are global
;812:		if (item->pickup_sound) {
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $517
line 813
;813:			trap_S_StartSound(NULL, cg.snap->ps.clientNum, CHAN_AUTO, trap_S_RegisterSound(item->pickup_sound, qfalse));
ADDRLP4 88
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 96
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 96
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 814
;814:		}
LABELV $517
line 817
;815:
;816:		// show icon and name on status bar
;817:		if (es->number == cg.snap->ps.clientNum) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $520
line 818
;818:			CG_ItemPickup(index);
ADDRLP4 84
INDIRI4
ARGI4
ADDRGP4 CG_ItemPickup
CALLV
pop
line 819
;819:		}
LABELV $520
line 821
;820:
;821:		if (ce) {
ADDRLP4 40
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $371
line 822
;822:			ce->delaySpawnPlayed = qtrue;
ADDRLP4 40
INDIRP4
CNSTI4 452
ADDP4
CNSTI4 1
ASGNI4
line 823
;823:		}
line 824
;824:	} break;
ADDRGP4 $371
JUMPV
LABELV $525
line 831
;825:
;826:	//
;827:	// weapon events
;828:	//
;829:	case EV_NOAMMO:
;830:		//		trap_S_StartSound (NULL, es->number, CHAN_AUTO, cgs.media.noAmmoSound );
;831:		if (es->number == cg.snap->ps.clientNum) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $371
line 832
;832:			CG_OutOfAmmoChange();
ADDRGP4 CG_OutOfAmmoChange
CALLV
pop
line 833
;833:		}
line 834
;834:		break;
ADDRGP4 $371
JUMPV
LABELV $529
line 837
;835:
;836:	case EV_CHANGE_WEAPON:
;837:		trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.selectSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+524
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 838
;838:		break;
ADDRGP4 $371
JUMPV
LABELV $532
line 841
;839:
;840:	case EV_FIRE_WEAPON:
;841:		CG_FireWeapon(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_FireWeapon
CALLV
pop
line 842
;842:		break;
ADDRGP4 $371
JUMPV
LABELV $533
line 860
;843:
;844:	case EV_USE_ITEM0:
;845:	case EV_USE_ITEM1:
;846:	case EV_USE_ITEM2:
;847:	case EV_USE_ITEM3:
;848:	case EV_USE_ITEM4:
;849:	case EV_USE_ITEM5:
;850:	case EV_USE_ITEM6:
;851:	case EV_USE_ITEM7:
;852:	case EV_USE_ITEM8:
;853:	case EV_USE_ITEM9:
;854:	case EV_USE_ITEM10:
;855:	case EV_USE_ITEM11:
;856:	case EV_USE_ITEM12:
;857:	case EV_USE_ITEM13:
;858:	case EV_USE_ITEM14:
;859:	case EV_USE_ITEM15:
;860:		CG_UseItem(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_UseItem
CALLV
pop
line 861
;861:		break;
ADDRGP4 $371
JUMPV
LABELV $534
line 869
;862:
;863:	//=================================================================
;864:
;865:	//
;866:	// other events
;867:	//
;868:	case EV_PLAYER_TELEPORT_IN:
;869:		trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.teleInSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+700
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 870
;870:		CG_SpawnEffect(position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 871
;871:		break;
ADDRGP4 $371
JUMPV
LABELV $537
line 874
;872:
;873:	case EV_PLAYER_TELEPORT_OUT:
;874:		trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.teleOutSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+704
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 875
;875:		CG_SpawnEffect(position);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_SpawnEffect
CALLV
pop
line 876
;876:		break;
ADDRGP4 $371
JUMPV
LABELV $540
line 879
;877:
;878:	case EV_ITEM_POP:
;879:		trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.respawnSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+712
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 880
;880:		break;
ADDRGP4 $371
JUMPV
LABELV $543
line 883
;881:
;882:	case EV_ITEM_RESPAWN:
;883:		cent->miscTime = cg.time;  // scale up from this
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 884
;884:		trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.respawnSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+712
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 885
;885:		break;
ADDRGP4 $371
JUMPV
LABELV $547
line 888
;886:
;887:	case EV_GRENADE_BOUNCE:
;888:		if (rand() & 1) {
ADDRLP4 84
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $548
line 889
;889:			trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.hgrenb1aSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+952
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 890
;890:		} else {
ADDRGP4 $371
JUMPV
LABELV $548
line 891
;891:			trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.hgrenb2aSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 cgs+148692+956
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 892
;892:		}
line 893
;893:		break;
ADDRGP4 $371
JUMPV
LABELV $554
line 936
;894:
;895:#ifdef MISSIONPACK
;896:	case EV_PROXIMITY_MINE_STICK:
;897:		if (es->eventParm & SURF_FLESH) {
;898:			trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.wstbimplSound);
;899:		} else if (es->eventParm & SURF_METALSTEPS) {
;900:			trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.wstbimpmSound);
;901:		} else {
;902:			trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.wstbimpdSound);
;903:		}
;904:		break;
;905:
;906:	case EV_PROXIMITY_MINE_TRIGGER:
;907:		trap_S_StartSound(NULL, es->number, CHAN_AUTO, cgs.media.wstbactvSound);
;908:		break;
;909:
;910:	case EV_KAMIKAZE:
;911:		CG_KamikazeEffect(cent->lerpOrigin);
;912:		break;
;913:
;914:	case EV_OBELISKEXPLODE:
;915:		CG_ObeliskExplode(cent->lerpOrigin, es->eventParm);
;916:		break;
;917:
;918:	case EV_OBELISKPAIN:
;919:		CG_ObeliskPain(cent->lerpOrigin);
;920:		break;
;921:
;922:	case EV_INVUL_IMPACT:
;923:		CG_InvulnerabilityImpact(cent->lerpOrigin, cent->currentState.angles);
;924:		break;
;925:
;926:	case EV_JUICED:
;927:		CG_InvulnerabilityJuiced(cent->lerpOrigin);
;928:		break;
;929:
;930:	case EV_LIGHTNINGBOLT:
;931:		CG_LightningBoltBeam(es->origin2, es->pos.trBase);
;932:		break;
;933:#endif
;934:
;935:	case EV_SCOREPLUM:
;936:		CG_ScorePlum(cent->currentState.otherEntityNum, cent->lerpOrigin, cent->currentState.time);
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRLP4 88
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_ScorePlum
CALLV
pop
line 937
;937:		break;
ADDRGP4 $371
JUMPV
LABELV $555
line 943
;938:
;939:	//
;940:	// missile impacts
;941:	//
;942:	case EV_MISSILE_HIT:
;943:		ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 944
;944:		CG_MissileHitPlayer(es->weapon, position, dir, es->otherEntityNum);
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_MissileHitPlayer
CALLV
pop
line 945
;945:		break;
ADDRGP4 $371
JUMPV
LABELV $556
line 948
;946:
;947:	case EV_MISSILE_MISS:
;948:		ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 949
;949:		CG_MissileHitWall(es->weapon, 0, position, dir, IMPACTSOUND_DEFAULT);
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 950
;950:		break;
ADDRGP4 $371
JUMPV
LABELV $557
line 953
;951:
;952:	case EV_MISSILE_MISS_METAL:
;953:		ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 954
;954:		CG_MissileHitWall(es->weapon, 0, position, dir, IMPACTSOUND_METAL);
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 955
;955:		break;
ADDRGP4 $371
JUMPV
LABELV $558
line 958
;956:
;957:	case EV_RAILTRAIL:
;958:		cent->currentState.weapon = WP_RAILGUN;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 7
ASGNI4
line 960
;959:
;960:		if (cent->currentState.clientNum == cg.snap->ps.clientNum && !cg_thirdPerson.integer) {
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $559
ADDRGP4 cg_thirdPerson+12
INDIRI4
CNSTI4 0
NEI4 $559
line 961
;961:			VectorCopy(cg.refdef.vieworg, vec);
ADDRLP4 16
ADDRGP4 cg+109056+24
INDIRB
ASGNB 12
line 962
;962:			fovOffset = -0.2f * (cgs.fov - 90.0f);
ADDRLP4 48
ADDRGP4 cgs+149668
INDIRF4
CNSTF4 1119092736
SUBF4
CNSTF4 3192704205
MULF4
ASGNF4
line 965
;963:
;964:			// 13.5, -5.5, -6.0
;965:			VectorMA(vec, cg_gun_x.value + 13.5f, cg.refdef.viewaxis[0], vec);
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRGP4 cg+109056+36
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
CNSTF4 1096286208
ADDF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
ADDRGP4 cg+109056+36+4
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
CNSTF4 1096286208
ADDF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
ADDRGP4 cg+109056+36+8
INDIRF4
ADDRGP4 cg_gun_x+8
INDIRF4
CNSTF4 1096286208
ADDF4
MULF4
ADDF4
ASGNF4
line 966
;966:			VectorMA(vec, cg_gun_y.value - 5.5f, cg.refdef.viewaxis[1], vec);
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRGP4 cg+109056+36+12
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
CNSTF4 1085276160
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
ADDRGP4 cg+109056+36+12+4
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
CNSTF4 1085276160
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
ADDRGP4 cg+109056+36+12+8
INDIRF4
ADDRGP4 cg_gun_y+8
INDIRF4
CNSTF4 1085276160
SUBF4
MULF4
ADDF4
ASGNF4
line 967
;967:			VectorMA(vec, cg_gun_z.value + fovOffset - 6.0f, cg.refdef.viewaxis[2], vec);
ADDRLP4 96
ADDRLP4 48
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 16
INDIRF4
ADDRGP4 cg+109056+36+24
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 96
INDIRF4
ADDF4
CNSTF4 1086324736
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 16+4
INDIRF4
ADDRGP4 cg+109056+36+24+4
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 96
INDIRF4
ADDF4
CNSTF4 1086324736
SUBF4
MULF4
ADDF4
ASGNF4
ADDRLP4 16+8
ADDRLP4 16+8
INDIRF4
ADDRGP4 cg+109056+36+24+8
INDIRF4
ADDRGP4 cg_gun_z+8
INDIRF4
ADDRLP4 48
INDIRF4
ADDF4
CNSTF4 1086324736
SUBF4
MULF4
ADDF4
ASGNF4
line 968
;968:		} else
ADDRGP4 $560
JUMPV
LABELV $559
line 969
;969:			VectorCopy(es->origin2, vec);
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
LABELV $560
line 972
;970:
;971:		// if the end was on a nomark surface, don't make an explosion
;972:		CG_RailTrail(ci, vec, es->pos.trBase);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 CG_RailTrail
CALLV
pop
line 974
;973:
;974:		if (es->eventParm != 255) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 255
EQI4 $371
line 975
;975:			ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 976
;976:			CG_MissileHitWall(es->weapon, es->clientNum, position, dir, IMPACTSOUND_DEFAULT);
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 CG_MissileHitWall
CALLV
pop
line 977
;977:		}
line 978
;978:		break;
ADDRGP4 $371
JUMPV
LABELV $619
line 981
;979:
;980:	case EV_BULLET_HIT_WALL:
;981:		ByteToDir(es->eventParm, dir);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
ADDRGP4 ByteToDir
CALLV
pop
line 982
;982:		CG_Bullet(es->pos.trBase, es->otherEntityNum, dir, qfalse, ENTITYNUM_WORLD);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1022
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 983
;983:		break;
ADDRGP4 $371
JUMPV
LABELV $620
line 986
;984:
;985:	case EV_BULLET_HIT_FLESH:
;986:		CG_Bullet(es->pos.trBase, es->otherEntityNum, dir, qtrue, es->eventParm);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 28
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_Bullet
CALLV
pop
line 987
;987:		break;
ADDRGP4 $371
JUMPV
LABELV $621
line 990
;988:
;989:	case EV_SHOTGUN:
;990:		CG_ShotgunFire(es);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_ShotgunFire
CALLV
pop
line 991
;991:		break;
ADDRGP4 $371
JUMPV
LABELV $622
line 994
;992:
;993:	case EV_GENERAL_SOUND:
;994:		if (cgs.gameSounds[es->eventParm]) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
INDIRI4
CNSTI4 0
EQI4 $623
line 995
;995:			trap_S_StartSound(NULL, es->number, CHAN_VOICE, cgs.gameSounds[es->eventParm]);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 996
;996:		} else {
ADDRGP4 $371
JUMPV
LABELV $623
line 997
;997:			s = CG_ConfigString(CS_SOUNDS + es->eventParm);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 104
INDIRP4
ASGNP4
line 998
;998:			trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, s));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 999
;999:		}
line 1000
;1000:		break;
ADDRGP4 $371
JUMPV
LABELV $627
line 1003
;1001:
;1002:	case EV_GLOBAL_SOUND:  // play from the player's head so it never diminishes
;1003:		if (cgs.gameSounds[es->eventParm]) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
INDIRI4
CNSTI4 0
EQI4 $628
line 1004
;1004:			trap_S_StartSound(NULL, cg.snap->ps.clientNum, CHAN_AUTO, cgs.gameSounds[es->eventParm]);
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1005
;1005:		} else {
ADDRGP4 $371
JUMPV
LABELV $628
line 1006
;1006:			s = CG_ConfigString(CS_SOUNDS + es->eventParm);
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 104
INDIRP4
ASGNP4
line 1007
;1007:			trap_S_StartSound(NULL, cg.snap->ps.clientNum, CHAN_AUTO, CG_CustomSound(es->number, s));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 108
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1008
;1008:		}
line 1009
;1009:		break;
ADDRGP4 $371
JUMPV
LABELV $634
line 1012
;1010:
;1011:	case EV_GLOBAL_TEAM_SOUND:  // play from the player's head so it never diminishes
;1012:	{
line 1013
;1013:		switch (es->eventParm) {
ADDRLP4 104
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
LTI4 $371
ADDRLP4 104
INDIRI4
CNSTI4 12
GTI4 $371
ADDRLP4 104
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $721
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $721
address $638
address $646
address $654
address $664
address $674
address $690
address $371
address $371
address $706
address $709
address $712
address $715
address $718
code
LABELV $638
line 1015
;1014:		case GTS_RED_CAPTURE:  // CTF: red team captured the blue flag, 1FCTF: red team captured the neutral flag
;1015:			if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED)
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $639
line 1016
;1016:				CG_AddBufferedSound(cgs.media.captureYourTeamSound);
ADDRGP4 cgs+148692+856
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $371
JUMPV
LABELV $639
line 1018
;1017:			else
;1018:				CG_AddBufferedSound(cgs.media.captureOpponentSound);
ADDRGP4 cgs+148692+860
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1019
;1019:			break;
ADDRGP4 $371
JUMPV
LABELV $646
line 1021
;1020:		case GTS_BLUE_CAPTURE:  // CTF: blue team captured the red flag, 1FCTF: blue team captured the neutral flag
;1021:			if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE)
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $647
line 1022
;1022:				CG_AddBufferedSound(cgs.media.captureYourTeamSound);
ADDRGP4 cgs+148692+856
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $371
JUMPV
LABELV $647
line 1024
;1023:			else
;1024:				CG_AddBufferedSound(cgs.media.captureOpponentSound);
ADDRGP4 cgs+148692+860
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1025
;1025:			break;
ADDRGP4 $371
JUMPV
LABELV $654
line 1027
;1026:		case GTS_RED_RETURN:  // CTF: blue flag returned, 1FCTF: never used
;1027:			if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED)
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $655
line 1028
;1028:				CG_AddBufferedSound(cgs.media.returnYourTeamSound);
ADDRGP4 cgs+148692+864
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $656
JUMPV
LABELV $655
line 1030
;1029:			else
;1030:				CG_AddBufferedSound(cgs.media.returnOpponentSound);
ADDRGP4 cgs+148692+868
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $656
line 1032
;1031:			//
;1032:			CG_AddBufferedSound(cgs.media.blueFlagReturnedSound);
ADDRGP4 cgs+148692+884
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1033
;1033:			break;
ADDRGP4 $371
JUMPV
LABELV $664
line 1035
;1034:		case GTS_BLUE_RETURN:  // CTF red flag returned, 1FCTF: neutral flag returned
;1035:			if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE)
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $665
line 1036
;1036:				CG_AddBufferedSound(cgs.media.returnYourTeamSound);
ADDRGP4 cgs+148692+864
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
ADDRGP4 $666
JUMPV
LABELV $665
line 1038
;1037:			else
;1038:				CG_AddBufferedSound(cgs.media.returnOpponentSound);
ADDRGP4 cgs+148692+868
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
LABELV $666
line 1040
;1039:			//
;1040:			CG_AddBufferedSound(cgs.media.redFlagReturnedSound);
ADDRGP4 cgs+148692+880
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1041
;1041:			break;
ADDRGP4 $371
JUMPV
LABELV $674
line 1045
;1042:
;1043:		case GTS_RED_TAKEN:  // CTF: red team took blue flag, 1FCTF: blue team took the neutral flag
;1044:			// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1045:			if (cg.snap->ps.powerups[PW_BLUEFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 388
ADDP4
INDIRI4
CNSTI4 0
NEI4 $679
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
CNSTI4 0
EQI4 $675
LABELV $679
line 1046
;1046:			} else {
ADDRGP4 $371
JUMPV
LABELV $675
line 1047
;1047:				if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $680
line 1053
;1048:#ifdef MISSIONPACK
;1049:					if (cgs.gametype == GT_1FCTF)
;1050:						CG_AddBufferedSound(cgs.media.yourTeamTookTheFlagSound);
;1051:					else
;1052:#endif
;1053:						CG_AddBufferedSound(cgs.media.enemyTookYourFlagSound);
ADDRGP4 cgs+148692+888
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1054
;1054:				} else if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
ADDRGP4 $371
JUMPV
LABELV $680
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $371
line 1060
;1055:#ifdef MISSIONPACK
;1056:					if (cgs.gametype == GT_1FCTF)
;1057:						CG_AddBufferedSound(cgs.media.enemyTookTheFlagSound);
;1058:					else
;1059:#endif
;1060:						CG_AddBufferedSound(cgs.media.yourTeamTookEnemyFlagSound);
ADDRGP4 cgs+148692+896
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1061
;1061:				}
line 1062
;1062:			}
line 1063
;1063:			break;
ADDRGP4 $371
JUMPV
LABELV $690
line 1066
;1064:		case GTS_BLUE_TAKEN:  // CTF: blue team took the red flag, 1FCTF red team took the neutral flag
;1065:			// if this player picked up the flag then a sound is played in CG_CheckLocalSounds
;1066:			if (cg.snap->ps.powerups[PW_REDFLAG] || cg.snap->ps.powerups[PW_NEUTRALFLAG]) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
NEI4 $695
ADDRGP4 cg+36
INDIRP4
CNSTI4 392
ADDP4
INDIRI4
CNSTI4 0
EQI4 $691
LABELV $695
line 1067
;1067:			} else {
ADDRGP4 $371
JUMPV
LABELV $691
line 1068
;1068:				if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $696
line 1074
;1069:#ifdef MISSIONPACK
;1070:					if (cgs.gametype == GT_1FCTF)
;1071:						CG_AddBufferedSound(cgs.media.yourTeamTookTheFlagSound);
;1072:					else
;1073:#endif
;1074:						CG_AddBufferedSound(cgs.media.enemyTookYourFlagSound);
ADDRGP4 cgs+148692+888
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1075
;1075:				} else if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
ADDRGP4 $371
JUMPV
LABELV $696
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $371
line 1081
;1076:#ifdef MISSIONPACK
;1077:					if (cgs.gametype == GT_1FCTF)
;1078:						CG_AddBufferedSound(cgs.media.enemyTookTheFlagSound);
;1079:					else
;1080:#endif
;1081:						CG_AddBufferedSound(cgs.media.yourTeamTookEnemyFlagSound);
ADDRGP4 cgs+148692+896
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1082
;1082:				}
line 1083
;1083:			}
line 1084
;1084:			break;
ADDRGP4 $371
JUMPV
LABELV $706
line 1099
;1085:#ifdef MISSIONPACK
;1086:		case GTS_REDOBELISK_ATTACKED:  // Overload: red obelisk is being attacked
;1087:			if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
;1088:				CG_AddBufferedSound(cgs.media.yourBaseIsUnderAttackSound);
;1089:			}
;1090:			break;
;1091:		case GTS_BLUEOBELISK_ATTACKED:  // Overload: blue obelisk is being attacked
;1092:			if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
;1093:				CG_AddBufferedSound(cgs.media.yourBaseIsUnderAttackSound);
;1094:			}
;1095:			break;
;1096:#endif
;1097:
;1098:		case GTS_REDTEAM_SCORED:
;1099:			CG_AddBufferedSound(cgs.media.redScoredSound);
ADDRGP4 cgs+148692+836
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1100
;1100:			break;
ADDRGP4 $371
JUMPV
LABELV $709
line 1102
;1101:		case GTS_BLUETEAM_SCORED:
;1102:			CG_AddBufferedSound(cgs.media.blueScoredSound);
ADDRGP4 cgs+148692+840
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1103
;1103:			break;
ADDRGP4 $371
JUMPV
LABELV $712
line 1105
;1104:		case GTS_REDTEAM_TOOK_LEAD:
;1105:			CG_AddBufferedSound(cgs.media.redLeadsSound);
ADDRGP4 cgs+148692+844
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1106
;1106:			break;
ADDRGP4 $371
JUMPV
LABELV $715
line 1108
;1107:		case GTS_BLUETEAM_TOOK_LEAD:
;1108:			CG_AddBufferedSound(cgs.media.blueLeadsSound);
ADDRGP4 cgs+148692+848
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1109
;1109:			break;
ADDRGP4 $371
JUMPV
LABELV $718
line 1111
;1110:		case GTS_TEAMS_ARE_TIED:
;1111:			CG_AddBufferedSound(cgs.media.teamsTiedSound);
ADDRGP4 cgs+148692+852
INDIRI4
ARGI4
ADDRGP4 CG_AddBufferedSound
CALLV
pop
line 1112
;1112:			break;
line 1119
;1113:#ifdef MISSIONPACK
;1114:		case GTS_KAMIKAZE:
;1115:			trap_S_StartLocalSound(cgs.media.kamikazeFarSound, CHAN_ANNOUNCER);
;1116:			break;
;1117:#endif
;1118:		default:
;1119:			break;
line 1121
;1120:		}
;1121:		break;
ADDRGP4 $371
JUMPV
LABELV $722
line 1127
;1122:	}
;1123:
;1124:	case EV_PAIN:
;1125:		// local player sounds are triggered in CG_CheckLocalSounds,
;1126:		// so ignore events on the player
;1127:		if (cent->currentState.number != cg.snap->ps.clientNum) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $371
line 1128
;1128:			CG_PainEvent(cent, es->eventParm);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_PainEvent
CALLV
pop
line 1129
;1129:		}
line 1130
;1130:		break;
ADDRGP4 $371
JUMPV
LABELV $726
line 1135
;1131:
;1132:	case EV_DEATH1:
;1133:	case EV_DEATH2:
;1134:	case EV_DEATH3:
;1135:		if (CG_WaterLevel(cent) == 3) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 CG_WaterLevel
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 3
NEI4 $727
line 1136
;1136:			trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, "*drown.wav"));
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 $729
ARGP4
ADDRLP4 108
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 108
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1137
;1137:		} else {
ADDRGP4 $371
JUMPV
LABELV $727
line 1138
;1138:			trap_S_StartSound(NULL, es->number, CHAN_VOICE, CG_CustomSound(es->number, va("*death%i.wav", event - EV_DEATH1 + 1)));
ADDRGP4 $730
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 57
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 108
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRLP4 108
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 CG_CustomSound
CALLI4
ASGNI4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 3
ARGI4
ADDRLP4 112
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1139
;1139:		}
line 1141
;1140:
;1141:		break;
ADDRGP4 $371
JUMPV
LABELV $731
line 1144
;1142:
;1143:	case EV_OBITUARY:
;1144:		CG_Obituary(es);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Obituary
CALLV
pop
line 1145
;1145:		break;
ADDRGP4 $371
JUMPV
LABELV $732
line 1151
;1146:
;1147:	//
;1148:	// powerup events
;1149:	//
;1150:	case EV_POWERUP_QUAD:
;1151:		if (es->number == cg.snap->ps.clientNum) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $733
line 1152
;1152:			cg.powerupActive = PW_QUAD;
ADDRGP4 cg+117544
CNSTI4 1
ASGNI4
line 1153
;1153:			cg.powerupTime   = cg.time;
ADDRGP4 cg+117548
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1154
;1154:		}
LABELV $733
line 1155
;1155:		trap_S_StartSound(NULL, es->number, CHAN_ITEM, cgs.media.quadSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+148692+516
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1156
;1156:		break;
ADDRGP4 $371
JUMPV
LABELV $741
line 1159
;1157:
;1158:	case EV_POWERUP_BATTLESUIT:
;1159:		if (es->number == cg.snap->ps.clientNum) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $742
line 1160
;1160:			cg.powerupActive = PW_BATTLESUIT;
ADDRGP4 cg+117544
CNSTI4 2
ASGNI4
line 1161
;1161:			cg.powerupTime   = cg.time;
ADDRGP4 cg+117548
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1162
;1162:		}
LABELV $742
line 1163
;1163:		trap_S_StartSound(NULL, es->number, CHAN_ITEM, cgs.media.protectSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+148692+944
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1164
;1164:		break;
ADDRGP4 $371
JUMPV
LABELV $750
line 1167
;1165:
;1166:	case EV_POWERUP_REGEN:
;1167:		if (es->number == cg.snap->ps.clientNum) {
ADDRLP4 0
INDIRP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $751
line 1168
;1168:			cg.powerupActive = PW_REGEN;
ADDRGP4 cg+117544
CNSTI4 5
ASGNI4
line 1169
;1169:			cg.powerupTime   = cg.time;
ADDRGP4 cg+117548
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1170
;1170:		}
LABELV $751
line 1171
;1171:		trap_S_StartSound(NULL, es->number, CHAN_ITEM, cgs.media.regenSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 cgs+148692+940
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1172
;1172:		break;
ADDRGP4 $371
JUMPV
LABELV $759
line 1183
;1173:
;1174:	case EV_GIB_PLAYER:
;1175:		// don't play gib sound when using the kamikaze because it interferes
;1176:		// with the kamikaze sound, downside is that the gib sound will also
;1177:		// not be played when someone is gibbed while just carrying the kamikaze
;1178:#ifdef MISSIONPACK
;1179:		if (!(es->eFlags & EF_KAMIKAZE)) {
;1180:			trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.gibSound);
;1181:		}
;1182:#else
;1183:		trap_S_StartSound(NULL, es->number, CHAN_BODY, cgs.media.gibSound);
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 cgs+148692+684
INDIRI4
ARGI4
ADDRGP4 trap_S_StartSound
CALLV
pop
line 1185
;1184:#endif
;1185:		CG_GibPlayer(cent->lerpOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 CG_GibPlayer
CALLV
pop
line 1186
;1186:		break;
ADDRGP4 $371
JUMPV
LABELV $762
line 1189
;1187:
;1188:	case EV_STOPLOOPINGSOUND:
;1189:		trap_S_StopLoopingSound(es->number);
ADDRLP4 0
INDIRP4
INDIRI4
ARGI4
ADDRGP4 trap_S_StopLoopingSound
CALLV
pop
line 1190
;1190:		es->loopSound = 0;
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 1191
;1191:		break;
ADDRGP4 $371
JUMPV
LABELV $763
line 1194
;1192:
;1193:	case EV_DEBUG_LINE:
;1194:		CG_Beam(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_Beam
CALLV
pop
line 1195
;1195:		break;
ADDRGP4 $371
JUMPV
line 1199
;1196:
;1197:	case EV_PROXIMITY_MINE_STICK:
;1198:	case EV_PROXIMITY_MINE_TRIGGER:
;1199:		break;
LABELV $370
line 1202
;1200:
;1201:	default:
;1202:		CG_Error("Unknown event: %i", event);
ADDRGP4 $360
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1203
;1203:		break;
LABELV $371
line 1205
;1204:	}
;1205:}
LABELV $357
endproc CG_EntityEvent 116 48
export CG_CheckEvents
proc CG_CheckEvents 8 12
line 1213
;1206:
;1207:/*
;1208:==============
;1209:CG_CheckEvents
;1210:
;1211:==============
;1212:*/
;1213:void CG_CheckEvents(centity_t* cent) {
line 1215
;1214:	// check for event-only entities
;1215:	if (cent->currentState.eType > ET_EVENTS) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
LEI4 $768
line 1216
;1216:		if (cent->previousEvent) {
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
CNSTI4 0
EQI4 $770
line 1217
;1217:			return;  // already fired
ADDRGP4 $767
JUMPV
LABELV $770
line 1220
;1218:		}
;1219:		// if this is a player event set the entity number of the client entity number
;1220:		if (cent->currentState.eFlags & EF_PLAYER_EVENT) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $772
line 1221
;1221:			cent->currentState.number = cent->currentState.otherEntityNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1222
;1222:		}
LABELV $772
line 1224
;1223:
;1224:		cent->previousEvent = 1;
ADDRFP4 0
INDIRP4
CNSTI4 428
ADDP4
CNSTI4 1
ASGNI4
line 1226
;1225:
;1226:		cent->currentState.event = cent->currentState.eType - ET_EVENTS;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 13
SUBI4
ASGNI4
line 1227
;1227:	} else {
ADDRGP4 $769
JUMPV
LABELV $768
line 1229
;1228:		// check for events riding with another entity
;1229:		if (cent->currentState.event == cent->previousEvent) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
INDIRI4
NEI4 $774
line 1230
;1230:			return;
ADDRGP4 $767
JUMPV
LABELV $774
line 1232
;1231:		}
;1232:		cent->previousEvent = cent->currentState.event;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 428
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
ASGNI4
line 1233
;1233:		if ((cent->currentState.event & ~EV_EVENT_BITS) == 0) {
ADDRFP4 0
INDIRP4
CNSTI4 180
ADDP4
INDIRI4
CNSTI4 -769
BANDI4
CNSTI4 0
NEI4 $776
line 1234
;1234:			return;
ADDRGP4 $767
JUMPV
LABELV $776
line 1236
;1235:		}
;1236:	}
LABELV $769
line 1239
;1237:
;1238:	// calculate the position at exactly the frame time
;1239:	BG_EvaluateTrajectory(&cent->currentState.pos, cg.snap->serverTime, cent->lerpOrigin);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1240
;1240:	CG_SetEntitySoundPosition(cent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_SetEntitySoundPosition
CALLV
pop
line 1242
;1241:
;1242:	CG_EntityEvent(cent, cent->lerpOrigin, -1);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 716
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 CG_EntityEvent
CALLV
pop
line 1243
;1243:}
LABELV $767
endproc CG_CheckEvents 8 12
import trap_R_AddLinearLightToScene
import trap_R_AddRefEntityToScene2
import linearLight
import intShaderTime
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_inPVS
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddAdditiveLightToScene
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedCapsuleTrace
import trap_CM_TransformedBoxTrace
import trap_CM_CapsuleTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_RemoveCommand
import trap_AddCommand
import trap_RealTime
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_ShaderStateChanged
import CG_SetConfigValues
import CG_ParseSysteminfo
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_ScoreboardClick
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PlayDroppedEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_TrackClientTeamChange
import CG_ForceModelChange
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_SelectFont
import CG_LoadFonts
import CG_DrawString
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColorTime
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawStringExt
import CG_DrawPic
import CG_FillScreen
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_SetScoreCatcher
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import eventnames
import phy_movetype
import cg_timerBest_y
import cg_timerBest_x
import cg_timerActive_y
import cg_timerActive_x
import cg_timerSkim_y
import cg_timerSkim_x
import cg_speed_y
import cg_speed_x
import cg_followKiller
import cg_fovAdjust
import cg_deadBodyDarken
import cg_teamColors
import cg_teamModel
import cg_enemyColors
import cg_enemyModel
import cg_hitSounds
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import cg_smoothClients
import cg_scorePlum
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_drawSpeed
import cg_drawAttacker
import cg_lagometer
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailRadius
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_drawWeaponSelect
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
LABELV $730
byte 1 42
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $729
byte 1 42
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $486
byte 1 42
byte 1 103
byte 1 97
byte 1 115
byte 1 112
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $475
byte 1 42
byte 1 116
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $469
byte 1 42
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $427
byte 1 42
byte 1 102
byte 1 97
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $364
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $360
byte 1 85
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $355
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
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $354
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
byte 1 103
byte 1 117
byte 1 114
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $349
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 49
byte 1 48
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $348
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 55
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $345
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 53
byte 1 48
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $342
byte 1 42
byte 1 112
byte 1 97
byte 1 105
byte 1 110
byte 1 50
byte 1 53
byte 1 95
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $284
byte 1 85
byte 1 115
byte 1 101
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $283
byte 1 78
byte 1 111
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $273
byte 1 37
byte 1 115
byte 1 32
byte 1 94
byte 1 55
byte 1 100
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $261
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $256
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $255
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 97
byte 1 108
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $254
byte 1 116
byte 1 114
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $252
byte 1 39
byte 1 115
byte 1 32
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $251
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 108
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $249
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $247
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $244
byte 1 39
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $243
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $241
byte 1 97
byte 1 108
byte 1 109
byte 1 111
byte 1 115
byte 1 116
byte 1 32
byte 1 100
byte 1 111
byte 1 100
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $239
byte 1 39
byte 1 115
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $237
byte 1 39
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 97
byte 1 112
byte 1 110
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $236
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 104
byte 1 114
byte 1 101
byte 1 100
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $234
byte 1 39
byte 1 115
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $233
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $231
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $229
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $227
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 112
byte 1 117
byte 1 109
byte 1 109
byte 1 101
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $225
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 117
byte 1 103
byte 1 104
byte 1 116
byte 1 32
byte 1 98
byte 1 121
byte 1 0
align 1
LABELV $204
byte 1 110
byte 1 111
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $201
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $198
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 37
byte 1 115
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $177
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $176
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $173
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $170
byte 1 115
byte 1 104
byte 1 111
byte 1 117
byte 1 108
byte 1 100
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $168
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $167
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $164
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 0
align 1
LABELV $160
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 105
byte 1 109
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $159
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $156
byte 1 98
byte 1 108
byte 1 101
byte 1 119
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 115
byte 1 101
byte 1 108
byte 1 102
byte 1 32
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $152
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $151
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 105
byte 1 116
byte 1 115
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $148
byte 1 116
byte 1 114
byte 1 105
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $138
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 119
byte 1 114
byte 1 111
byte 1 110
byte 1 103
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $136
byte 1 115
byte 1 97
byte 1 119
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $134
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 32
byte 1 97
byte 1 32
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 102
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 105
byte 1 110
byte 1 116
byte 1 111
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 0
align 1
LABELV $132
byte 1 109
byte 1 101
byte 1 108
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $130
byte 1 115
byte 1 97
byte 1 110
byte 1 107
byte 1 32
byte 1 108
byte 1 105
byte 1 107
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $128
byte 1 119
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 113
byte 1 117
byte 1 105
byte 1 115
byte 1 104
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $126
byte 1 99
byte 1 114
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $124
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $119
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $118
byte 1 110
byte 1 0
align 1
LABELV $111
byte 1 67
byte 1 71
byte 1 95
byte 1 79
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 58
byte 1 32
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $106
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $105
byte 1 37
byte 1 105
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $104
byte 1 37
byte 1 105
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $101
byte 1 37
byte 1 105
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $98
byte 1 37
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $95
byte 1 49
byte 1 51
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $92
byte 1 49
byte 1 50
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $89
byte 1 49
byte 1 49
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $86
byte 1 94
byte 1 51
byte 1 51
byte 1 114
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $83
byte 1 94
byte 1 49
byte 1 50
byte 1 110
byte 1 100
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $80
byte 1 94
byte 1 52
byte 1 49
byte 1 115
byte 1 116
byte 1 94
byte 1 55
byte 1 0
align 1
LABELV $77
byte 1 0
align 1
LABELV $76
byte 1 84
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 0
