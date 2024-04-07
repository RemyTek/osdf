export BotNumActivePlayers
code
proc BotNumActivePlayers 1044 12
file "../../../../code/game/ai_chat.c"
line 47
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_chat.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_chat.c $
;10: *
;11: *****************************************************************************/
;12:
;13:#include "g_local.h"
;14:#include "botlib.h"
;15:#include "be_aas.h"
;16:#include "be_ea.h"
;17:#include "be_ai_char.h"
;18:#include "be_ai_chat.h"
;19:#include "be_ai_gen.h"
;20:#include "be_ai_goal.h"
;21:#include "be_ai_move.h"
;22:#include "be_ai_weap.h"
;23://
;24:#include "ai_main.h"
;25:#include "ai_dmq3.h"
;26:#include "ai_chat.h"
;27:#include "ai_cmd.h"
;28:#include "ai_dmnet.h"
;29://
;30:#include "chars.h"  //characteristics
;31:#include "inv.h"    //indexes into the inventory
;32:#include "syn.h"    //synonyms
;33:#include "match.h"  //string matching types and vars
;34:
;35:// for the voice chats
;36:#ifdef MISSIONPACK
;37:#include "../../ui/menudef.h"
;38:#endif
;39:
;40:#define TIME_BETWEENCHATTING 25
;41:
;42:/*
;43:==================
;44:BotNumActivePlayers
;45:==================
;46:*/
;47:int BotNumActivePlayers(void) {
line 51
;48:	int  i, num;
;49:	char buf[MAX_INFO_STRING];
;50:
;51:	num = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 52
;52:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $59
JUMPV
LABELV $56
line 53
;53:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
ADDRLP4 1024
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 55
;54:		// if no config string or no name
;55:		if (!buf[0] || !*Info_ValueForKey(buf, "n"))
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $64
ADDRLP4 0
ARGP4
ADDRGP4 $63
ARGP4
ADDRLP4 1032
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1032
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $61
LABELV $64
line 56
;56:			continue;
ADDRGP4 $57
JUMPV
LABELV $61
line 58
;57:		// skip spectators
;58:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR)
ADDRLP4 0
ARGP4
ADDRGP4 $67
ARGP4
ADDRLP4 1036
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 3
NEI4 $65
line 59
;59:			continue;
ADDRGP4 $57
JUMPV
LABELV $65
line 61
;60:		//
;61:		num++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 62
;62:	}
LABELV $57
line 52
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $59
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $56
line 63
;63:	return num;
ADDRLP4 1028
INDIRI4
RETI4
LABELV $55
endproc BotNumActivePlayers 1044 12
export BotIsFirstInRankings
proc BotIsFirstInRankings 1512 12
line 71
;64:}
;65:
;66:/*
;67:==================
;68:BotIsFirstInRankings
;69:==================
;70:*/
;71:int BotIsFirstInRankings(bot_state_t* bs) {
line 76
;72:	int           i, score;
;73:	char          buf[MAX_INFO_STRING];
;74:	playerState_t ps;
;75:
;76:	score = bs->cur_ps.persistant[PERS_SCORE];
ADDRLP4 1496
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
line 77
;77:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $72
JUMPV
LABELV $69
line 78
;78:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
ADDRLP4 1024
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 80
;79:		// if no config string or no name
;80:		if (!buf[0] || !*Info_ValueForKey(buf, "n"))
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $76
ADDRLP4 0
ARGP4
ADDRGP4 $63
ARGP4
ADDRLP4 1500
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1500
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $74
LABELV $76
line 81
;81:			continue;
ADDRGP4 $70
JUMPV
LABELV $74
line 83
;82:		// skip spectators
;83:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR)
ADDRLP4 0
ARGP4
ADDRGP4 $67
ARGP4
ADDRLP4 1504
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1504
INDIRP4
ARGP4
ADDRLP4 1508
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1508
INDIRI4
CNSTI4 3
NEI4 $77
line 84
;84:			continue;
ADDRGP4 $70
JUMPV
LABELV $77
line 86
;85:		//
;86:		BotAI_GetClientState(i, &ps);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 87
;87:		if (score < ps.persistant[PERS_SCORE])
ADDRLP4 1496
INDIRI4
ADDRLP4 1028+248
INDIRI4
GEI4 $79
line 88
;88:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $68
JUMPV
LABELV $79
line 89
;89:	}
LABELV $70
line 77
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $72
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $69
line 90
;90:	return qtrue;
CNSTI4 1
RETI4
LABELV $68
endproc BotIsFirstInRankings 1512 12
export BotIsLastInRankings
proc BotIsLastInRankings 1512 12
line 98
;91:}
;92:
;93:/*
;94:==================
;95:BotIsLastInRankings
;96:==================
;97:*/
;98:int BotIsLastInRankings(bot_state_t* bs) {
line 103
;99:	int           i, score;
;100:	char          buf[MAX_INFO_STRING];
;101:	playerState_t ps;
;102:
;103:	score = bs->cur_ps.persistant[PERS_SCORE];
ADDRLP4 1496
ADDRFP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
line 104
;104:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $86
JUMPV
LABELV $83
line 105
;105:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
ADDRLP4 1024
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 107
;106:		// if no config string or no name
;107:		if (!buf[0] || !*Info_ValueForKey(buf, "n"))
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $90
ADDRLP4 0
ARGP4
ADDRGP4 $63
ARGP4
ADDRLP4 1500
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1500
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $88
LABELV $90
line 108
;108:			continue;
ADDRGP4 $84
JUMPV
LABELV $88
line 110
;109:		// skip spectators
;110:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR)
ADDRLP4 0
ARGP4
ADDRGP4 $67
ARGP4
ADDRLP4 1504
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1504
INDIRP4
ARGP4
ADDRLP4 1508
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1508
INDIRI4
CNSTI4 3
NEI4 $91
line 111
;111:			continue;
ADDRGP4 $84
JUMPV
LABELV $91
line 113
;112:		//
;113:		BotAI_GetClientState(i, &ps);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 114
;114:		if (score > ps.persistant[PERS_SCORE])
ADDRLP4 1496
INDIRI4
ADDRLP4 1028+248
INDIRI4
LEI4 $93
line 115
;115:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $82
JUMPV
LABELV $93
line 116
;116:	}
LABELV $84
line 104
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $86
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $83
line 117
;117:	return qtrue;
CNSTI4 1
RETI4
LABELV $82
endproc BotIsLastInRankings 1512 12
bss
align 1
LABELV $97
skip 32
export BotFirstClientInRankings
code
proc BotFirstClientInRankings 1516 12
line 125
;118:}
;119:
;120:/*
;121:==================
;122:BotFirstClientInRankings
;123:==================
;124:*/
;125:char* BotFirstClientInRankings(void) {
line 131
;126:	int           i, bestscore, bestclient;
;127:	char          buf[MAX_INFO_STRING];
;128:	static char   name[32];
;129:	playerState_t ps;
;130:
;131:	bestscore  = -999999;
ADDRLP4 1496
CNSTI4 -999999
ASGNI4
line 132
;132:	bestclient = 0;
ADDRLP4 1500
CNSTI4 0
ASGNI4
line 133
;133:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $101
JUMPV
LABELV $98
line 134
;134:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
ADDRLP4 1024
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 136
;135:		// if no config string or no name
;136:		if (!buf[0] || !*Info_ValueForKey(buf, "n"))
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $105
ADDRLP4 0
ARGP4
ADDRGP4 $63
ARGP4
ADDRLP4 1504
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1504
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $103
LABELV $105
line 137
;137:			continue;
ADDRGP4 $99
JUMPV
LABELV $103
line 139
;138:		// skip spectators
;139:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR)
ADDRLP4 0
ARGP4
ADDRGP4 $67
ARGP4
ADDRLP4 1508
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1508
INDIRP4
ARGP4
ADDRLP4 1512
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1512
INDIRI4
CNSTI4 3
NEI4 $106
line 140
;140:			continue;
ADDRGP4 $99
JUMPV
LABELV $106
line 142
;141:		//
;142:		BotAI_GetClientState(i, &ps);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 143
;143:		if (ps.persistant[PERS_SCORE] > bestscore) {
ADDRLP4 1028+248
INDIRI4
ADDRLP4 1496
INDIRI4
LEI4 $108
line 144
;144:			bestscore  = ps.persistant[PERS_SCORE];
ADDRLP4 1496
ADDRLP4 1028+248
INDIRI4
ASGNI4
line 145
;145:			bestclient = i;
ADDRLP4 1500
ADDRLP4 1024
INDIRI4
ASGNI4
line 146
;146:		}
LABELV $108
line 147
;147:	}
LABELV $99
line 133
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $101
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $98
line 148
;148:	EasyClientName(bestclient, name, sizeof(name));
ADDRLP4 1500
INDIRI4
ARGI4
ADDRGP4 $97
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 149
;149:	return name;
ADDRGP4 $97
RETP4
LABELV $96
endproc BotFirstClientInRankings 1516 12
bss
align 1
LABELV $113
skip 32
export BotLastClientInRankings
code
proc BotLastClientInRankings 1516 12
line 157
;150:}
;151:
;152:/*
;153:==================
;154:BotLastClientInRankings
;155:==================
;156:*/
;157:char* BotLastClientInRankings(void) {
line 163
;158:	int           i, worstscore, bestclient;
;159:	char          buf[MAX_INFO_STRING];
;160:	static char   name[32];
;161:	playerState_t ps;
;162:
;163:	worstscore = 999999;
ADDRLP4 1496
CNSTI4 999999
ASGNI4
line 164
;164:	bestclient = 0;
ADDRLP4 1500
CNSTI4 0
ASGNI4
line 165
;165:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $114
line 166
;166:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
ADDRLP4 1024
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 168
;167:		// if no config string or no name
;168:		if (!buf[0] || !*Info_ValueForKey(buf, "n"))
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $121
ADDRLP4 0
ARGP4
ADDRGP4 $63
ARGP4
ADDRLP4 1504
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1504
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $119
LABELV $121
line 169
;169:			continue;
ADDRGP4 $115
JUMPV
LABELV $119
line 171
;170:		// skip spectators
;171:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR)
ADDRLP4 0
ARGP4
ADDRGP4 $67
ARGP4
ADDRLP4 1508
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1508
INDIRP4
ARGP4
ADDRLP4 1512
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1512
INDIRI4
CNSTI4 3
NEI4 $122
line 172
;172:			continue;
ADDRGP4 $115
JUMPV
LABELV $122
line 174
;173:		//
;174:		BotAI_GetClientState(i, &ps);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1028
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 175
;175:		if (ps.persistant[PERS_SCORE] < worstscore) {
ADDRLP4 1028+248
INDIRI4
ADDRLP4 1496
INDIRI4
GEI4 $124
line 176
;176:			worstscore = ps.persistant[PERS_SCORE];
ADDRLP4 1496
ADDRLP4 1028+248
INDIRI4
ASGNI4
line 177
;177:			bestclient = i;
ADDRLP4 1500
ADDRLP4 1024
INDIRI4
ASGNI4
line 178
;178:		}
LABELV $124
line 179
;179:	}
LABELV $115
line 165
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $117
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $114
line 180
;180:	EasyClientName(bestclient, name, sizeof(name));
ADDRLP4 1500
INDIRI4
ARGI4
ADDRGP4 $113
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 181
;181:	return name;
ADDRGP4 $113
RETP4
LABELV $112
endproc BotLastClientInRankings 1516 12
bss
align 1
LABELV $129
skip 32
export BotRandomOpponentName
code
proc BotRandomOpponentName 1308 12
line 189
;182:}
;183:
;184:/*
;185:==================
;186:BotRandomOpponentName
;187:==================
;188:*/
;189:char* BotRandomOpponentName(bot_state_t* bs) {
line 195
;190:	int         i, count;
;191:	char        buf[MAX_INFO_STRING];
;192:	int         opponents[MAX_CLIENTS], numopponents;
;193:	static char name[32];
;194:
;195:	numopponents = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 196
;196:	opponents[0] = 0;
ADDRLP4 1036
CNSTI4 0
ASGNI4
line 197
;197:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $133
JUMPV
LABELV $130
line 198
;198:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $135
line 199
;199:			continue;
ADDRGP4 $131
JUMPV
LABELV $135
line 201
;200:		//
;201:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 203
;202:		// if no config string or no name
;203:		if (!buf[0] || !*Info_ValueForKey(buf, "n"))
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $139
ADDRLP4 4
ARGP4
ADDRGP4 $63
ARGP4
ADDRLP4 1292
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1292
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $137
LABELV $139
line 204
;204:			continue;
ADDRGP4 $131
JUMPV
LABELV $137
line 206
;205:		// skip spectators
;206:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR)
ADDRLP4 4
ARGP4
ADDRGP4 $67
ARGP4
ADDRLP4 1296
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1296
INDIRP4
ARGP4
ADDRLP4 1300
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1300
INDIRI4
CNSTI4 3
NEI4 $140
line 207
;207:			continue;
ADDRGP4 $131
JUMPV
LABELV $140
line 209
;208:		// skip team mates
;209:		if (BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 1304
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1304
INDIRI4
CNSTI4 0
EQI4 $142
line 210
;210:			continue;
ADDRGP4 $131
JUMPV
LABELV $142
line 212
;211:		//
;212:		opponents[numopponents] = i;
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1036
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 213
;213:		numopponents++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 214
;214:	}
LABELV $131
line 197
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $133
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $130
line 215
;215:	count = random() * numopponents;
ADDRLP4 1292
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1292
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 1028
INDIRI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 216
;216:	for (i = 0; i < numopponents; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $147
JUMPV
LABELV $144
line 217
;217:		count--;
ADDRLP4 1032
ADDRLP4 1032
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 218
;218:		if (count <= 0) {
ADDRLP4 1032
INDIRI4
CNSTI4 0
GTI4 $148
line 219
;219:			EasyClientName(opponents[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1036
ADDP4
INDIRI4
ARGI4
ADDRGP4 $129
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 220
;220:			return name;
ADDRGP4 $129
RETP4
ADDRGP4 $128
JUMPV
LABELV $148
line 222
;221:		}
;222:	}
LABELV $145
line 216
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $147
ADDRLP4 0
INDIRI4
ADDRLP4 1028
INDIRI4
LTI4 $144
line 223
;223:	EasyClientName(opponents[0], name, sizeof(name));
ADDRLP4 1036
INDIRI4
ARGI4
ADDRGP4 $129
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 224
;224:	return name;
ADDRGP4 $129
RETP4
LABELV $128
endproc BotRandomOpponentName 1308 12
proc BotMapTitle 0 0
line 232
;225:}
;226:
;227:/*
;228:==================
;229:BotMapTitle
;230:==================
;231:*/
;232:static const char* BotMapTitle(void) {
line 233
;233:	return mapname;
ADDRGP4 mapname
RETP4
LABELV $150
endproc BotMapTitle 0 0
export BotWeaponNameForMeansOfDeath
proc BotWeaponNameForMeansOfDeath 4 0
line 241
;234:}
;235:
;236:/*
;237:==================
;238:BotWeaponNameForMeansOfDeath
;239:==================
;240:*/
;241:char* BotWeaponNameForMeansOfDeath(int mod) {
line 242
;242:	switch (mod) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $152
ADDRLP4 0
INDIRI4
CNSTI4 23
GTI4 $152
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $175-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $175
address $154
address $156
address $158
address $160
address $160
address $162
address $162
address $164
address $164
address $166
address $168
address $170
address $170
address $152
address $152
address $152
address $152
address $152
address $152
address $152
address $152
address $152
address $172
code
LABELV $154
line 244
;243:	case MOD_SHOTGUN:
;244:		return "Shotgun";
ADDRGP4 $155
RETP4
ADDRGP4 $151
JUMPV
LABELV $156
line 246
;245:	case MOD_GAUNTLET:
;246:		return "Gauntlet";
ADDRGP4 $157
RETP4
ADDRGP4 $151
JUMPV
LABELV $158
line 248
;247:	case MOD_MACHINEGUN:
;248:		return "Machinegun";
ADDRGP4 $159
RETP4
ADDRGP4 $151
JUMPV
LABELV $160
line 251
;249:	case MOD_GRENADE:
;250:	case MOD_GRENADE_SPLASH:
;251:		return "Grenade Launcher";
ADDRGP4 $161
RETP4
ADDRGP4 $151
JUMPV
LABELV $162
line 254
;252:	case MOD_ROCKET:
;253:	case MOD_ROCKET_SPLASH:
;254:		return "Rocket Launcher";
ADDRGP4 $163
RETP4
ADDRGP4 $151
JUMPV
LABELV $164
line 257
;255:	case MOD_PLASMA:
;256:	case MOD_PLASMA_SPLASH:
;257:		return "Plasmagun";
ADDRGP4 $165
RETP4
ADDRGP4 $151
JUMPV
LABELV $166
line 259
;258:	case MOD_RAILGUN:
;259:		return "Railgun";
ADDRGP4 $167
RETP4
ADDRGP4 $151
JUMPV
LABELV $168
line 261
;260:	case MOD_LIGHTNING:
;261:		return "Lightning Gun";
ADDRGP4 $169
RETP4
ADDRGP4 $151
JUMPV
LABELV $170
line 264
;262:	case MOD_BFG:
;263:	case MOD_BFG_SPLASH:
;264:		return "BFG10K";
ADDRGP4 $171
RETP4
ADDRGP4 $151
JUMPV
LABELV $172
line 278
;265:#ifdef MISSIONPACK
;266:	case MOD_NAIL:
;267:		return "Nailgun";
;268:	case MOD_CHAINGUN:
;269:		return "Chaingun";
;270:	case MOD_PROXIMITY_MINE:
;271:		return "Proximity Launcher";
;272:	case MOD_KAMIKAZE:
;273:		return "Kamikaze";
;274:	case MOD_JUICED:
;275:		return "Prox mine";
;276:#endif
;277:	case MOD_GRAPPLE:
;278:		return "Grapple";
ADDRGP4 $173
RETP4
ADDRGP4 $151
JUMPV
LABELV $152
line 280
;279:	default:
;280:		return "[unknown weapon]";
ADDRGP4 $174
RETP4
LABELV $151
endproc BotWeaponNameForMeansOfDeath 4 0
export BotRandomWeaponName
proc BotRandomWeaponName 12 0
line 289
;281:	}
;282:}
;283:
;284:/*
;285:==================
;286:BotRandomWeaponName
;287:==================
;288:*/
;289:char* BotRandomWeaponName(void) {
line 295
;290:	int rnd;
;291:
;292:#ifdef MISSIONPACK
;293:	rnd = random() * 11.9;
;294:#else
;295:	rnd = random() * 8.9;
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 965633923
MULF4
CVFI4 4
ASGNI4
line 297
;296:#endif
;297:	switch (rnd) {
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $178
ADDRLP4 8
INDIRI4
CNSTI4 7
GTI4 $178
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $188
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $188
address $180
address $181
address $182
address $183
address $184
address $185
address $186
address $187
code
LABELV $180
line 299
;298:	case 0:
;299:		return "Gauntlet";
ADDRGP4 $157
RETP4
ADDRGP4 $177
JUMPV
LABELV $181
line 301
;300:	case 1:
;301:		return "Shotgun";
ADDRGP4 $155
RETP4
ADDRGP4 $177
JUMPV
LABELV $182
line 303
;302:	case 2:
;303:		return "Machinegun";
ADDRGP4 $159
RETP4
ADDRGP4 $177
JUMPV
LABELV $183
line 305
;304:	case 3:
;305:		return "Grenade Launcher";
ADDRGP4 $161
RETP4
ADDRGP4 $177
JUMPV
LABELV $184
line 307
;306:	case 4:
;307:		return "Rocket Launcher";
ADDRGP4 $163
RETP4
ADDRGP4 $177
JUMPV
LABELV $185
line 309
;308:	case 5:
;309:		return "Plasmagun";
ADDRGP4 $165
RETP4
ADDRGP4 $177
JUMPV
LABELV $186
line 311
;310:	case 6:
;311:		return "Railgun";
ADDRGP4 $167
RETP4
ADDRGP4 $177
JUMPV
LABELV $187
line 313
;312:	case 7:
;313:		return "Lightning Gun";
ADDRGP4 $169
RETP4
ADDRGP4 $177
JUMPV
LABELV $178
line 323
;314:#ifdef MISSIONPACK
;315:	case 8:
;316:		return "Nailgun";
;317:	case 9:
;318:		return "Chaingun";
;319:	case 10:
;320:		return "Proximity Launcher";
;321:#endif
;322:	default:
;323:		return "BFG10K";
ADDRGP4 $171
RETP4
LABELV $177
endproc BotRandomWeaponName 12 0
export BotVisibleEnemies
proc BotVisibleEnemies 172 20
line 332
;324:	}
;325:}
;326:
;327:/*
;328:==================
;329:BotVisibleEnemies
;330:==================
;331:*/
;332:int BotVisibleEnemies(bot_state_t* bs) {
line 337
;333:	float            vis;
;334:	int              i;
;335:	aas_entityinfo_t entinfo;
;336:
;337:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $190
line 339
;338:
;339:		if (i == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $194
line 340
;340:			continue;
ADDRGP4 $191
JUMPV
LABELV $194
line 342
;341:		//
;342:		BotEntityInfo(i, &entinfo);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 344
;343:		//
;344:		if (!entinfo.valid)
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $196
line 345
;345:			continue;
ADDRGP4 $191
JUMPV
LABELV $196
line 347
;346:		// if the enemy isn't dead and the enemy isn't the bot self
;347:		if (EntityIsDead(&entinfo) || entinfo.number == bs->entitynum)
ADDRLP4 4
ARGP4
ADDRLP4 148
ADDRGP4 EntityIsDead
CALLI4
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 0
NEI4 $201
ADDRLP4 4+20
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
NEI4 $198
LABELV $201
line 348
;348:			continue;
ADDRGP4 $191
JUMPV
LABELV $198
line 350
;349:		// if the enemy is invisible and not shooting
;350:		if (EntityIsInvisible(&entinfo) && !EntityIsShooting(&entinfo)) {
ADDRLP4 4
ARGP4
ADDRLP4 152
ADDRGP4 EntityIsInvisible
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $202
ADDRLP4 4
ARGP4
ADDRLP4 156
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 0
NEI4 $202
line 351
;351:			continue;
ADDRGP4 $191
JUMPV
LABELV $202
line 354
;352:		}
;353:		// if on the same team
;354:		if (BotSameTeam(bs, i))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 160
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 160
INDIRI4
CNSTI4 0
EQI4 $204
line 355
;355:			continue;
ADDRGP4 $191
JUMPV
LABELV $204
line 357
;356:		// check if the enemy is visible
;357:		vis = BotEntityVisible(bs->entitynum, bs->eye, bs->viewangles, 360, i);
ADDRLP4 164
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 164
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 164
INDIRP4
CNSTI4 4936
ADDP4
ARGP4
ADDRLP4 164
INDIRP4
CNSTI4 6564
ADDP4
ARGP4
CNSTF4 1135869952
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 168
ADDRGP4 BotEntityVisible
CALLF4
ASGNF4
ADDRLP4 144
ADDRLP4 168
INDIRF4
ASGNF4
line 358
;358:		if (vis > 0)
ADDRLP4 144
INDIRF4
CNSTF4 0
LEF4 $206
line 359
;359:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $189
JUMPV
LABELV $206
line 360
;360:	}
LABELV $191
line 337
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $190
line 361
;361:	return qfalse;
CNSTI4 0
RETI4
LABELV $189
endproc BotVisibleEnemies 172 20
export BotValidChatPosition
proc BotValidChatPosition 160 28
line 369
;362:}
;363:
;364:/*
;365:==================
;366:BotValidChatPosition
;367:==================
;368:*/
;369:int BotValidChatPosition(bot_state_t* bs) {
line 374
;370:	vec3_t      point, start, end, mins, maxs;
;371:	bsp_trace_t trace;
;372:
;373:	// if the bot is dead all positions are valid
;374:	if (BotIsDead(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 144
ADDRGP4 BotIsDead
CALLI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 0
EQI4 $209
line 375
;375:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $208
JUMPV
LABELV $209
line 377
;376:	// never start chatting with a powerup
;377:	if (bs->inventory[INVENTORY_QUAD] || bs->inventory[INVENTORY_ENVIRONMENTSUIT] || bs->inventory[INVENTORY_HASTE] || bs->inventory[INVENTORY_INVISIBILITY] ||
ADDRLP4 148
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 148
INDIRP4
CNSTI4 5092
ADDP4
INDIRI4
CNSTI4 0
NEI4 $217
ADDRLP4 148
INDIRP4
CNSTI4 5096
ADDP4
INDIRI4
CNSTI4 0
NEI4 $217
ADDRLP4 148
INDIRP4
CNSTI4 5100
ADDP4
INDIRI4
CNSTI4 0
NEI4 $217
ADDRLP4 148
INDIRP4
CNSTI4 5104
ADDP4
INDIRI4
CNSTI4 0
NEI4 $217
ADDRLP4 148
INDIRP4
CNSTI4 5108
ADDP4
INDIRI4
CNSTI4 0
NEI4 $217
ADDRLP4 148
INDIRP4
CNSTI4 5112
ADDP4
INDIRI4
CNSTI4 0
EQI4 $211
LABELV $217
line 379
;378:	    bs->inventory[INVENTORY_REGEN] || bs->inventory[INVENTORY_FLIGHT])
;379:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $208
JUMPV
LABELV $211
line 383
;380:	// must be on the ground
;381:	// if (bs->cur_ps.groundEntityNum != ENTITYNUM_NONE) return qfalse;
;382:	// do not chat if in lava or slime
;383:	VectorCopy(bs->origin, point);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 384
;384:	point[2] -= 24;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1103101952
SUBF4
ASGNF4
line 385
;385:	if (trap_PointContents(point, bs->entitynum) & (CONTENTS_LAVA | CONTENTS_SLIME))
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 152
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 152
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
EQI4 $219
line 386
;386:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $208
JUMPV
LABELV $219
line 388
;387:	// do not chat if under water
;388:	VectorCopy(bs->origin, point);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 389
;389:	point[2] += 32;
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1107296256
ADDF4
ASGNF4
line 390
;390:	if (trap_PointContents(point, bs->entitynum) & MASK_WATER)
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRLP4 156
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 156
INDIRI4
CNSTI4 56
BANDI4
CNSTI4 0
EQI4 $222
line 391
;391:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $208
JUMPV
LABELV $222
line 393
;392:	// must be standing on the world entity
;393:	VectorCopy(bs->origin, start);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 394
;394:	VectorCopy(bs->origin, end);
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 4908
ADDP4
INDIRB
ASGNB 12
line 395
;395:	start[2] += 1;
ADDRLP4 12+8
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 396
;396:	end[2] -= 10;
ADDRLP4 24+8
ADDRLP4 24+8
INDIRF4
CNSTF4 1092616192
SUBF4
ASGNF4
line 397
;397:	trap_AAS_PresenceTypeBoundingBox(PRESENCE_CROUCH, mins, maxs);
CNSTI4 4
ARGI4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRGP4 trap_AAS_PresenceTypeBoundingBox
CALLV
pop
line 398
;398:	BotAI_Trace(&trace, start, mins, maxs, end, bs->client, MASK_SOLID);
ADDRLP4 60
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 48
ARGP4
ADDRLP4 24
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 BotAI_Trace
CALLV
pop
line 399
;399:	if (trace.ent != ENTITYNUM_WORLD)
ADDRLP4 60+80
INDIRI4
CNSTI4 1022
EQI4 $226
line 400
;400:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $208
JUMPV
LABELV $226
line 402
;401:	// the bot is in a position where it can chat
;402:	return qtrue;
CNSTI4 1
RETI4
LABELV $208
endproc BotValidChatPosition 160 28
export BotChat_EnterGame
proc BotChat_EnterGame 68 32
line 410
;403:}
;404:
;405:/*
;406:==================
;407:BotChat_EnterGame
;408:==================
;409:*/
;410:int BotChat_EnterGame(bot_state_t* bs) {
line 414
;411:	char  name[32];
;412:	float rnd;
;413:
;414:	if (bot_nochat.integer)
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $230
line 415
;415:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $229
JUMPV
LABELV $230
line 416
;416:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING)
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $233
line 417
;417:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $229
JUMPV
LABELV $233
line 419
;418:	// don't chat in teamplay
;419:	if (TeamPlayIsOn())
ADDRLP4 36
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $235
line 420
;420:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $229
JUMPV
LABELV $235
line 422
;421:	// don't chat in tournament mode
;422:	if (gametype == GT_TOURNAMENT)
ADDRGP4 gametype
INDIRI4
CNSTI4 1
NEI4 $237
line 423
;423:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $229
JUMPV
LABELV $237
line 424
;424:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_ENTEREXITGAME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 27
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 40
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 40
INDIRF4
ASGNF4
line 425
;425:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $239
line 426
;426:		if (random() > rnd)
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 0
INDIRF4
LEF4 $242
line 427
;427:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $229
JUMPV
LABELV $242
line 428
;428:	}
LABELV $239
line 429
;429:	if (BotNumActivePlayers() <= 1)
ADDRLP4 44
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
GTI4 $244
line 430
;430:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $229
JUMPV
LABELV $244
line 431
;431:	if (!BotValidChatPosition(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $246
line 432
;432:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $229
JUMPV
LABELV $246
line 433
;433:	BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 52
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 60
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 $249
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 440
;434:		bs, "game_enter", EasyClientName(bs->client, name, 32),  // 0
;435:		BotRandomOpponentName(bs),                               // 1
;436:		"[invalid var]",                                         // 2
;437:		"[invalid var]",                                         // 3
;438:		BotMapTitle(),                                           // 4
;439:		NULL);
;440:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 441
;441:	bs->chatto        = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 442
;442:	return qtrue;
CNSTI4 1
RETI4
LABELV $229
endproc BotChat_EnterGame 68 32
export BotChat_ExitGame
proc BotChat_ExitGame 64 32
line 450
;443:}
;444:
;445:/*
;446:==================
;447:BotChat_ExitGame
;448:==================
;449:*/
;450:int BotChat_ExitGame(bot_state_t* bs) {
line 454
;451:	char  name[32];
;452:	float rnd;
;453:
;454:	if (bot_nochat.integer)
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $251
line 455
;455:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $250
JUMPV
LABELV $251
line 456
;456:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING)
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $254
line 457
;457:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $250
JUMPV
LABELV $254
line 459
;458:	// don't chat in teamplay
;459:	if (TeamPlayIsOn())
ADDRLP4 36
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $256
line 460
;460:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $250
JUMPV
LABELV $256
line 462
;461:	// don't chat in tournament mode
;462:	if (gametype == GT_TOURNAMENT)
ADDRGP4 gametype
INDIRI4
CNSTI4 1
NEI4 $258
line 463
;463:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $250
JUMPV
LABELV $258
line 464
;464:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_ENTEREXITGAME, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 27
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 40
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 40
INDIRF4
ASGNF4
line 465
;465:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $260
line 466
;466:		if (random() > rnd)
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 0
INDIRF4
LEF4 $263
line 467
;467:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $250
JUMPV
LABELV $263
line 468
;468:	}
LABELV $260
line 469
;469:	if (BotNumActivePlayers() <= 1)
ADDRLP4 44
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
GTI4 $265
line 470
;470:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $250
JUMPV
LABELV $265
line 472
;471:	//
;472:	BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 48
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 56
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 $249
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 479
;473:		bs, "game_exit", EasyClientName(bs->client, name, 32),  // 0
;474:		BotRandomOpponentName(bs),                              // 1
;475:		"[invalid var]",                                        // 2
;476:		"[invalid var]",                                        // 3
;477:		BotMapTitle(),                                          // 4
;478:		NULL);
;479:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 480
;480:	bs->chatto        = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 481
;481:	return qtrue;
CNSTI4 1
RETI4
LABELV $250
endproc BotChat_ExitGame 64 32
export BotChat_StartLevel
proc BotChat_StartLevel 56 16
line 489
;482:}
;483:
;484:/*
;485:==================
;486:BotChat_StartLevel
;487:==================
;488:*/
;489:int BotChat_StartLevel(bot_state_t* bs) {
line 493
;490:	char  name[32];
;491:	float rnd;
;492:
;493:	if (bot_nochat.integer)
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $269
line 494
;494:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $268
JUMPV
LABELV $269
line 495
;495:	if (BotIsObserver(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $272
line 496
;496:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $268
JUMPV
LABELV $272
line 497
;497:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING)
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $274
line 498
;498:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $268
JUMPV
LABELV $274
line 500
;499:	// don't chat in teamplay
;500:	if (TeamPlayIsOn()) {
ADDRLP4 40
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $276
line 504
;501:#ifdef MISSIONPACK
;502:		trap_EA_Command(bs->client, "vtaunt");
;503:#endif
;504:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $268
JUMPV
LABELV $276
line 507
;505:	}
;506:	// don't chat in tournament mode
;507:	if (gametype == GT_TOURNAMENT)
ADDRGP4 gametype
INDIRI4
CNSTI4 1
NEI4 $278
line 508
;508:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $268
JUMPV
LABELV $278
line 509
;509:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_STARTENDLEVEL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 26
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 44
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 44
INDIRF4
ASGNF4
line 510
;510:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $280
line 511
;511:		if (random() > rnd)
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 0
INDIRF4
LEF4 $283
line 512
;512:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $268
JUMPV
LABELV $283
line 513
;513:	}
LABELV $280
line 514
;514:	if (BotNumActivePlayers() <= 1)
ADDRLP4 48
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
GTI4 $285
line 515
;515:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $268
JUMPV
LABELV $285
line 516
;516:	BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 52
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $287
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 519
;517:		bs, "level_start", EasyClientName(bs->client, name, 32),  // 0
;518:		NULL);
;519:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 520
;520:	bs->chatto        = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 521
;521:	return qtrue;
CNSTI4 1
RETI4
LABELV $268
endproc BotChat_StartLevel 56 16
export BotChat_EndLevel
proc BotChat_EndLevel 80 32
line 529
;522:}
;523:
;524:/*
;525:==================
;526:BotChat_EndLevel
;527:==================
;528:*/
;529:int BotChat_EndLevel(bot_state_t* bs) {
line 533
;530:	char  name[32];
;531:	float rnd;
;532:
;533:	if (bot_nochat.integer)
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $289
line 534
;534:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $288
JUMPV
LABELV $289
line 535
;535:	if (BotIsObserver(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $292
line 536
;536:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $288
JUMPV
LABELV $292
line 537
;537:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING)
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $294
line 538
;538:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $288
JUMPV
LABELV $294
line 540
;539:	// teamplay
;540:	if (TeamPlayIsOn()) {
ADDRLP4 40
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $296
line 546
;541:#ifdef MISSIONPACK
;542:		if (BotIsFirstInRankings(bs)) {
;543:			trap_EA_Command(bs->client, "vtaunt");
;544:		}
;545:#endif
;546:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $288
JUMPV
LABELV $296
line 549
;547:	}
;548:	// don't chat in tournament mode
;549:	if (gametype == GT_TOURNAMENT)
ADDRGP4 gametype
INDIRI4
CNSTI4 1
NEI4 $298
line 550
;550:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $288
JUMPV
LABELV $298
line 551
;551:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_STARTENDLEVEL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 26
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 44
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 44
INDIRF4
ASGNF4
line 552
;552:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $300
line 553
;553:		if (random() > rnd)
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 0
INDIRF4
LEF4 $303
line 554
;554:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $288
JUMPV
LABELV $303
line 555
;555:	}
LABELV $300
line 556
;556:	if (BotNumActivePlayers() <= 1)
ADDRLP4 48
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 1
GTI4 $305
line 557
;557:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $288
JUMPV
LABELV $305
line 559
;558:	//
;559:	if (BotIsFirstInRankings(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotIsFirstInRankings
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $307
line 560
;560:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 56
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 64
ADDRGP4 BotLastClientInRankings
CALLP4
ASGNP4
ADDRLP4 68
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $309
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 $249
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 567
;561:			bs, "level_end_victory", EasyClientName(bs->client, name, 32),  // 0
;562:			BotRandomOpponentName(bs),                                      // 1
;563:			"[invalid var]",                                                // 2
;564:			BotLastClientInRankings(),                                      // 3
;565:			BotMapTitle(),                                                  // 4
;566:			NULL);
;567:	} else if (BotIsLastInRankings(bs)) {
ADDRGP4 $308
JUMPV
LABELV $307
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 BotIsLastInRankings
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $310
line 568
;568:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 60
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 68
ADDRGP4 BotFirstClientInRankings
CALLP4
ASGNP4
ADDRLP4 72
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $312
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 $249
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 575
;569:			bs, "level_end_lose", EasyClientName(bs->client, name, 32),  // 0
;570:			BotRandomOpponentName(bs),                                   // 1
;571:			BotFirstClientInRankings(),                                  // 2
;572:			"[invalid var]",                                             // 3
;573:			BotMapTitle(),                                               // 4
;574:			NULL);
;575:	} else {
ADDRGP4 $311
JUMPV
LABELV $310
line 576
;576:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 60
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 68
ADDRGP4 BotFirstClientInRankings
CALLP4
ASGNP4
ADDRLP4 72
ADDRGP4 BotLastClientInRankings
CALLP4
ASGNP4
ADDRLP4 76
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $313
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 583
;577:			bs, "level_end", EasyClientName(bs->client, name, 32),  // 0
;578:			BotRandomOpponentName(bs),                              // 1
;579:			BotFirstClientInRankings(),                             // 2
;580:			BotLastClientInRankings(),                              // 3
;581:			BotMapTitle(),                                          // 4
;582:			NULL);
;583:	}
LABELV $311
LABELV $308
line 584
;584:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 585
;585:	bs->chatto        = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 586
;586:	return qtrue;
CNSTI4 1
RETI4
LABELV $288
endproc BotChat_EndLevel 80 32
export BotChat_Death
proc BotChat_Death 108 20
line 594
;587:}
;588:
;589:/*
;590:==================
;591:BotChat_Death
;592:==================
;593:*/
;594:int BotChat_Death(bot_state_t* bs) {
line 598
;595:	char  name[32];
;596:	float rnd;
;597:
;598:	if (bot_nochat.integer)
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $315
line 599
;599:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $314
JUMPV
LABELV $315
line 600
;600:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING)
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $318
line 601
;601:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $314
JUMPV
LABELV $318
line 602
;602:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_DEATH, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 29
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 36
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 36
INDIRF4
ASGNF4
line 604
;603:	// don't chat in tournament mode
;604:	if (gametype == GT_TOURNAMENT)
ADDRGP4 gametype
INDIRI4
CNSTI4 1
NEI4 $320
line 605
;605:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $314
JUMPV
LABELV $320
line 607
;606:	// if fast chatting is off
;607:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $322
line 608
;608:		if (random() > rnd)
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 32
INDIRF4
LEF4 $325
line 609
;609:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $314
JUMPV
LABELV $325
line 610
;610:	}
LABELV $322
line 611
;611:	if (BotNumActivePlayers() <= 1)
ADDRLP4 40
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 1
GTI4 $327
line 612
;612:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $314
JUMPV
LABELV $327
line 614
;613:	//
;614:	if (bs->lastkilledby >= 0 && bs->lastkilledby < MAX_CLIENTS)
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 5996
ADDP4
INDIRI4
CNSTI4 0
LTI4 $329
ADDRLP4 44
INDIRP4
CNSTI4 5996
ADDP4
INDIRI4
CNSTI4 64
GEI4 $329
line 615
;615:		EasyClientName(bs->lastkilledby, name, 32);
ADDRFP4 0
INDIRP4
CNSTI4 5996
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
ADDRGP4 $330
JUMPV
LABELV $329
line 617
;616:	else
;617:		strcpy(name, "[world]");
ADDRLP4 0
ARGP4
ADDRGP4 $331
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $330
line 619
;618:	//
;619:	if (TeamPlayIsOn() && BotSameTeam(bs, bs->lastkilledby)) {
ADDRLP4 48
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $332
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 5996
ADDP4
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $332
line 620
;620:		if (bs->lastkilledby == bs->client)
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 5996
ADDP4
INDIRI4
ADDRLP4 60
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $334
line 621
;621:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $314
JUMPV
LABELV $334
line 622
;622:		BotAI_BotInitialChat(bs, "death_teammate", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $336
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 623
;623:		bs->chatto = CHAT_TEAM;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 1
ASGNI4
line 624
;624:	} else {
ADDRGP4 $333
JUMPV
LABELV $332
line 626
;625:		// teamplay
;626:		if (TeamPlayIsOn()) {
ADDRLP4 60
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $337
line 630
;627:#ifdef MISSIONPACK
;628:			trap_EA_Command(bs->client, "vtaunt");
;629:#endif
;630:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $314
JUMPV
LABELV $337
line 633
;631:		}
;632:		//
;633:		if (bs->botdeathtype == MOD_WATER)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 14
NEI4 $339
line 634
;634:			BotAI_BotInitialChat(bs, "death_drown", BotRandomOpponentName(bs), NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $341
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $340
JUMPV
LABELV $339
line 635
;635:		else if (bs->botdeathtype == MOD_SLIME)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 15
NEI4 $342
line 636
;636:			BotAI_BotInitialChat(bs, "death_slime", BotRandomOpponentName(bs), NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $344
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $343
JUMPV
LABELV $342
line 637
;637:		else if (bs->botdeathtype == MOD_LAVA)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 16
NEI4 $345
line 638
;638:			BotAI_BotInitialChat(bs, "death_lava", BotRandomOpponentName(bs), NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $347
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $346
JUMPV
LABELV $345
line 639
;639:		else if (bs->botdeathtype == MOD_FALLING)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 19
NEI4 $348
line 640
;640:			BotAI_BotInitialChat(bs, "death_cratered", BotRandomOpponentName(bs), NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $349
JUMPV
LABELV $348
line 642
;641:		else if (
;642:			bs->botsuicide ||  // all other suicides by own weapon
ADDRLP4 80
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
INDIRP4
CNSTI4 6008
ADDP4
INDIRI4
CNSTI4 0
NEI4 $357
ADDRLP4 80
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 17
EQI4 $357
ADDRLP4 80
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 20
EQI4 $357
ADDRLP4 80
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 21
EQI4 $357
ADDRLP4 80
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 22
EQI4 $357
ADDRLP4 80
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 0
NEI4 $351
LABELV $357
line 645
;643:			bs->botdeathtype == MOD_CRUSH || bs->botdeathtype == MOD_SUICIDE || bs->botdeathtype == MOD_TARGET_LASER || bs->botdeathtype == MOD_TRIGGER_HURT ||
;644:			bs->botdeathtype == MOD_UNKNOWN)
;645:			BotAI_BotInitialChat(bs, "death_suicide", BotRandomOpponentName(bs), NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $358
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $352
JUMPV
LABELV $351
line 646
;646:		else if (bs->botdeathtype == MOD_TELEFRAG)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 18
NEI4 $359
line 647
;647:			BotAI_BotInitialChat(bs, "death_telefrag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $361
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $360
JUMPV
LABELV $359
line 652
;648:#ifdef MISSIONPACK
;649:		else if (bs->botdeathtype == MOD_KAMIKAZE && trap_BotNumInitialChats(bs->cs, "death_kamikaze"))
;650:			BotAI_BotInitialChat(bs, "death_kamikaze", name, NULL);
;651:#endif
;652:		else {
line 653
;653:			if ((bs->botdeathtype == MOD_GAUNTLET || bs->botdeathtype == MOD_RAILGUN || bs->botdeathtype == MOD_BFG || bs->botdeathtype == MOD_BFG_SPLASH) &&
ADDRLP4 88
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 88
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 2
EQI4 $366
ADDRLP4 88
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 10
EQI4 $366
ADDRLP4 88
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 12
EQI4 $366
ADDRLP4 88
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 13
NEI4 $362
LABELV $366
ADDRLP4 92
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
GEF4 $362
line 654
;654:			    random() < 0.5) {
line 656
;655:
;656:				if (bs->botdeathtype == MOD_GAUNTLET)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 2
NEI4 $367
line 657
;657:					BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $369
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $363
JUMPV
LABELV $367
line 662
;658:						bs, "death_gauntlet",
;659:						name,                                            // 0
;660:						BotWeaponNameForMeansOfDeath(bs->botdeathtype),  // 1
;661:						NULL);
;662:				else if (bs->botdeathtype == MOD_RAILGUN)
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
CNSTI4 10
NEI4 $370
line 663
;663:					BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $372
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
ADDRGP4 $363
JUMPV
LABELV $370
line 669
;664:						bs, "death_rail",
;665:						name,                                            // 0
;666:						BotWeaponNameForMeansOfDeath(bs->botdeathtype),  // 1
;667:						NULL);
;668:				else
;669:					BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $373
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 674
;670:						bs, "death_bfg",
;671:						name,                                            // 0
;672:						BotWeaponNameForMeansOfDeath(bs->botdeathtype),  // 1
;673:						NULL);
;674:			}
ADDRGP4 $363
JUMPV
LABELV $362
line 676
;675:			// choose between insult and praise
;676:			else if (random() < trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_INSULT, 0, 1)) {
ADDRLP4 96
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 24
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 100
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 96
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 100
INDIRF4
GEF4 $374
line 677
;677:				BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 682
;678:					bs, "death_insult",
;679:					name,                                            // 0
;680:					BotWeaponNameForMeansOfDeath(bs->botdeathtype),  // 1
;681:					NULL);
;682:			} else {
ADDRGP4 $375
JUMPV
LABELV $374
line 683
;683:				BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $377
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 688
;684:					bs, "death_praise",
;685:					name,                                            // 0
;686:					BotWeaponNameForMeansOfDeath(bs->botdeathtype),  // 1
;687:					NULL);
;688:			}
LABELV $375
LABELV $363
line 689
;689:		}
LABELV $360
LABELV $352
LABELV $349
LABELV $346
LABELV $343
LABELV $340
line 690
;690:		bs->chatto = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 691
;691:	}
LABELV $333
line 692
;692:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 693
;693:	return qtrue;
CNSTI4 1
RETI4
LABELV $314
endproc BotChat_Death 108 20
export BotChat_Kill
proc BotChat_Kill 80 16
line 701
;694:}
;695:
;696:/*
;697:==================
;698:BotChat_Kill
;699:==================
;700:*/
;701:int BotChat_Kill(bot_state_t* bs) {
line 705
;702:	char  name[32];
;703:	float rnd;
;704:
;705:	if (bot_nochat.integer)
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $379
line 706
;706:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $378
JUMPV
LABELV $379
line 707
;707:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING)
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $382
line 708
;708:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $378
JUMPV
LABELV $382
line 709
;709:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_KILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 28
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 36
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 36
INDIRF4
ASGNF4
line 711
;710:	// don't chat in tournament mode
;711:	if (gametype == GT_TOURNAMENT)
ADDRGP4 gametype
INDIRI4
CNSTI4 1
NEI4 $384
line 712
;712:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $378
JUMPV
LABELV $384
line 714
;713:	// if fast chat is off
;714:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $386
line 715
;715:		if (random() > rnd)
ADDRLP4 40
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 32
INDIRF4
LEF4 $389
line 716
;716:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $378
JUMPV
LABELV $389
line 717
;717:	}
LABELV $386
line 718
;718:	if (bs->lastkilledplayer == bs->client)
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ADDRLP4 40
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $391
line 719
;719:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $378
JUMPV
LABELV $391
line 720
;720:	if (BotNumActivePlayers() <= 1)
ADDRLP4 44
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
GTI4 $393
line 721
;721:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $378
JUMPV
LABELV $393
line 722
;722:	if (!BotValidChatPosition(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $395
line 723
;723:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $378
JUMPV
LABELV $395
line 725
;724:	//
;725:	if (BotVisibleEnemies(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotVisibleEnemies
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $397
line 726
;726:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $378
JUMPV
LABELV $397
line 728
;727:	//
;728:	EasyClientName(bs->lastkilledplayer, name, 32);
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 730
;729:	//
;730:	bs->chatto = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 731
;731:	if (TeamPlayIsOn() && BotSameTeam(bs, bs->lastkilledplayer)) {
ADDRLP4 56
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $399
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $399
line 732
;732:		BotAI_BotInitialChat(bs, "kill_teammate", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $401
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 733
;733:		bs->chatto = CHAT_TEAM;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 1
ASGNI4
line 734
;734:	} else {
ADDRGP4 $400
JUMPV
LABELV $399
line 736
;735:		// don't chat in teamplay
;736:		if (TeamPlayIsOn()) {
ADDRLP4 68
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $402
line 740
;737:#ifdef MISSIONPACK
;738:			trap_EA_Command(bs->client, "vtaunt");
;739:#endif
;740:			return qfalse;  // don't wait
CNSTI4 0
RETI4
ADDRGP4 $378
JUMPV
LABELV $402
line 743
;741:		}
;742:		//
;743:		if (bs->enemydeathtype == MOD_GAUNTLET) {
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
INDIRI4
CNSTI4 2
NEI4 $404
line 744
;744:			BotAI_BotInitialChat(bs, "kill_gauntlet", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $406
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 745
;745:		} else if (bs->enemydeathtype == MOD_RAILGUN) {
ADDRGP4 $405
JUMPV
LABELV $404
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
INDIRI4
CNSTI4 10
NEI4 $407
line 746
;746:			BotAI_BotInitialChat(bs, "kill_rail", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $409
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 747
;747:		} else if (bs->enemydeathtype == MOD_TELEFRAG) {
ADDRGP4 $408
JUMPV
LABELV $407
ADDRFP4 0
INDIRP4
CNSTI4 6004
ADDP4
INDIRI4
CNSTI4 18
NEI4 $410
line 748
;748:			BotAI_BotInitialChat(bs, "kill_telefrag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $412
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 749
;749:		}
ADDRGP4 $411
JUMPV
LABELV $410
line 755
;750:#ifdef MISSIONPACK
;751:		else if (bs->botdeathtype == MOD_KAMIKAZE && trap_BotNumInitialChats(bs->cs, "kill_kamikaze"))
;752:			BotAI_BotInitialChat(bs, "kill_kamikaze", name, NULL);
;753:#endif
;754:		// choose between insult and praise
;755:		else if (random() < trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_INSULT, 0, 1)) {
ADDRLP4 72
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 24
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 76
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 72
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 76
INDIRF4
GEF4 $413
line 756
;756:			BotAI_BotInitialChat(bs, "kill_insult", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $415
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 757
;757:		} else {
ADDRGP4 $414
JUMPV
LABELV $413
line 758
;758:			BotAI_BotInitialChat(bs, "kill_praise", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $416
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 759
;759:		}
LABELV $414
LABELV $411
LABELV $408
LABELV $405
line 760
;760:	}
LABELV $400
line 761
;761:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 762
;762:	return qtrue;
CNSTI4 1
RETI4
LABELV $378
endproc BotChat_Kill 80 16
export BotChat_EnemySuicide
proc BotChat_EnemySuicide 56 16
line 770
;763:}
;764:
;765:/*
;766:==================
;767:BotChat_EnemySuicide
;768:==================
;769:*/
;770:int BotChat_EnemySuicide(bot_state_t* bs) {
line 774
;771:	char  name[32];
;772:	float rnd;
;773:
;774:	if (bot_nochat.integer)
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $418
line 775
;775:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $418
line 776
;776:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING)
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $421
line 777
;777:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $421
line 778
;778:	if (BotNumActivePlayers() <= 1)
ADDRLP4 36
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 1
GTI4 $423
line 779
;779:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $423
line 781
;780:	//
;781:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_ENEMYSUICIDE, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 30
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 40
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 40
INDIRF4
ASGNF4
line 783
;782:	// don't chat in teamplay
;783:	if (TeamPlayIsOn())
ADDRLP4 44
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $425
line 784
;784:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $425
line 786
;785:	// don't chat in tournament mode
;786:	if (gametype == GT_TOURNAMENT)
ADDRGP4 gametype
INDIRI4
CNSTI4 1
NEI4 $427
line 787
;787:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $427
line 789
;788:	// if fast chat is off
;789:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $429
line 790
;790:		if (random() > rnd)
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 32
INDIRF4
LEF4 $432
line 791
;791:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $432
line 792
;792:	}
LABELV $429
line 793
;793:	if (!BotValidChatPosition(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
NEI4 $434
line 794
;794:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $434
line 796
;795:	//
;796:	if (BotVisibleEnemies(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotVisibleEnemies
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $436
line 797
;797:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $417
JUMPV
LABELV $436
line 799
;798:	//
;799:	if (bs->enemy >= 0)
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 0
LTI4 $438
line 800
;800:		EasyClientName(bs->enemy, name, 32);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
ADDRGP4 $439
JUMPV
LABELV $438
line 802
;801:	else
;802:		strcpy(name, "");
ADDRLP4 0
ARGP4
ADDRGP4 $440
ARGP4
ADDRGP4 strcpy
CALLP4
pop
LABELV $439
line 803
;803:	BotAI_BotInitialChat(bs, "enemy_suicide", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $441
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 804
;804:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 805
;805:	bs->chatto        = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 806
;806:	return qtrue;
CNSTI4 1
RETI4
LABELV $417
endproc BotChat_EnemySuicide 56 16
export BotChat_HitTalking
proc BotChat_HitTalking 68 20
line 814
;807:}
;808:
;809:/*
;810:==================
;811:BotChat_HitTalking
;812:==================
;813:*/
;814:int BotChat_HitTalking(bot_state_t* bs) {
line 819
;815:	char  name[32], *weap;
;816:	int   lasthurt_client;
;817:	float rnd;
;818:
;819:	if (bot_nochat.integer)
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $443
line 820
;820:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $442
JUMPV
LABELV $443
line 821
;821:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING)
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $446
line 822
;822:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $442
JUMPV
LABELV $446
line 823
;823:	if (BotNumActivePlayers() <= 1)
ADDRLP4 44
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 1
GTI4 $448
line 824
;824:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $442
JUMPV
LABELV $448
line 825
;825:	lasthurt_client = g_entities[bs->client].client->lasthurt_client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 826
;826:	if (!lasthurt_client)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $451
line 827
;827:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $442
JUMPV
LABELV $451
line 828
;828:	if (lasthurt_client == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $453
line 829
;829:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $442
JUMPV
LABELV $453
line 831
;830:	//
;831:	if (lasthurt_client < 0 || lasthurt_client >= MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $457
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $455
LABELV $457
line 832
;832:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $442
JUMPV
LABELV $455
line 834
;833:	//
;834:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_HITTALKING, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 31
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 52
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 52
INDIRF4
ASGNF4
line 836
;835:	// don't chat in teamplay
;836:	if (TeamPlayIsOn())
ADDRLP4 56
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $458
line 837
;837:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $442
JUMPV
LABELV $458
line 839
;838:	// don't chat in tournament mode
;839:	if (gametype == GT_TOURNAMENT)
ADDRGP4 gametype
INDIRI4
CNSTI4 1
NEI4 $460
line 840
;840:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $442
JUMPV
LABELV $460
line 842
;841:	// if fast chat is off
;842:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $462
line 843
;843:		if (random() > rnd * 0.5)
ADDRLP4 60
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 40
INDIRF4
CNSTF4 1056964608
MULF4
LEF4 $465
line 844
;844:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $442
JUMPV
LABELV $465
line 845
;845:	}
LABELV $462
line 846
;846:	if (!BotValidChatPosition(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $467
line 847
;847:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $442
JUMPV
LABELV $467
line 849
;848:	//
;849:	ClientName(g_entities[bs->client].client->lasthurt_client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 850
;850:	weap = BotWeaponNameForMeansOfDeath(g_entities[bs->client].client->lasthurt_mod);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 64
INDIRP4
ASGNP4
line 852
;851:	//
;852:	BotAI_BotInitialChat(bs, "hit_talking", name, weap, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $471
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 853
;853:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 854
;854:	bs->chatto        = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 855
;855:	return qtrue;
CNSTI4 1
RETI4
LABELV $442
endproc BotChat_HitTalking 68 20
export BotChat_HitNoDeath
proc BotChat_HitNoDeath 216 20
line 863
;856:}
;857:
;858:/*
;859:==================
;860:BotChat_HitNoDeath
;861:==================
;862:*/
;863:int BotChat_HitNoDeath(bot_state_t* bs) {
line 869
;864:	char             name[32], *weap;
;865:	float            rnd;
;866:	int              lasthurt_client;
;867:	aas_entityinfo_t entinfo;
;868:
;869:	lasthurt_client = g_entities[bs->client].client->lasthurt_client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 870
;870:	if (!lasthurt_client)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $474
line 871
;871:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $474
line 872
;872:	if (lasthurt_client == bs->client)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $476
line 873
;873:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $476
line 875
;874:	//
;875:	if (lasthurt_client < 0 || lasthurt_client >= MAX_CLIENTS)
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $480
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $478
LABELV $480
line 876
;876:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $478
line 878
;877:	//
;878:	if (bot_nochat.integer)
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $481
line 879
;879:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $481
line 880
;880:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING)
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $484
line 881
;881:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $484
line 882
;882:	if (BotNumActivePlayers() <= 1)
ADDRLP4 188
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 1
GTI4 $486
line 883
;883:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $486
line 884
;884:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_HITNODEATH, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 32
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 192
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 180
ADDRLP4 192
INDIRF4
ASGNF4
line 886
;885:	// don't chat in teamplay
;886:	if (TeamPlayIsOn())
ADDRLP4 196
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $488
line 887
;887:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $488
line 889
;888:	// don't chat in tournament mode
;889:	if (gametype == GT_TOURNAMENT)
ADDRGP4 gametype
INDIRI4
CNSTI4 1
NEI4 $490
line 890
;890:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $490
line 892
;891:	// if fast chat is off
;892:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $492
line 893
;893:		if (random() > rnd * 0.5)
ADDRLP4 200
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 180
INDIRF4
CNSTF4 1056964608
MULF4
LEF4 $495
line 894
;894:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $495
line 895
;895:	}
LABELV $492
line 896
;896:	if (!BotValidChatPosition(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 200
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
NEI4 $497
line 897
;897:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $497
line 899
;898:	//
;899:	if (BotVisibleEnemies(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 204
ADDRGP4 BotVisibleEnemies
CALLI4
ASGNI4
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $499
line 900
;900:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $499
line 902
;901:	//
;902:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 903
;903:	if (EntityIsShooting(&entinfo))
ADDRLP4 40
ARGP4
ADDRLP4 208
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 208
INDIRI4
CNSTI4 0
EQI4 $501
line 904
;904:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $472
JUMPV
LABELV $501
line 906
;905:	//
;906:	ClientName(lasthurt_client, name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 907
;907:	weap = BotWeaponNameForMeansOfDeath(g_entities[bs->client].client->lasthurt_mod);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
ARGI4
ADDRLP4 212
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRLP4 36
ADDRLP4 212
INDIRP4
ASGNP4
line 909
;908:	//
;909:	BotAI_BotInitialChat(bs, "hit_nodeath", name, weap, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $504
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 36
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 910
;910:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 911
;911:	bs->chatto        = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 912
;912:	return qtrue;
CNSTI4 1
RETI4
LABELV $472
endproc BotChat_HitNoDeath 216 20
export BotChat_HitNoKill
proc BotChat_HitNoKill 208 20
line 920
;913:}
;914:
;915:/*
;916:==================
;917:BotChat_HitNoKill
;918:==================
;919:*/
;920:int BotChat_HitNoKill(bot_state_t* bs) {
line 925
;921:	char             name[32], *weap;
;922:	float            rnd;
;923:	aas_entityinfo_t entinfo;
;924:
;925:	if (bot_nochat.integer)
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $506
line 926
;926:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $505
JUMPV
LABELV $506
line 927
;927:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING)
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $509
line 928
;928:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $505
JUMPV
LABELV $509
line 929
;929:	if (BotNumActivePlayers() <= 1)
ADDRLP4 180
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 180
INDIRI4
CNSTI4 1
GTI4 $511
line 930
;930:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $505
JUMPV
LABELV $511
line 931
;931:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_HITNOKILL, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 33
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 184
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 176
ADDRLP4 184
INDIRF4
ASGNF4
line 933
;932:	// don't chat in teamplay
;933:	if (TeamPlayIsOn())
ADDRLP4 188
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 188
INDIRI4
CNSTI4 0
EQI4 $513
line 934
;934:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $505
JUMPV
LABELV $513
line 936
;935:	// don't chat in tournament mode
;936:	if (gametype == GT_TOURNAMENT)
ADDRGP4 gametype
INDIRI4
CNSTI4 1
NEI4 $515
line 937
;937:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $505
JUMPV
LABELV $515
line 939
;938:	// if fast chat is off
;939:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $517
line 940
;940:		if (random() > rnd * 0.5)
ADDRLP4 192
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 176
INDIRF4
CNSTF4 1056964608
MULF4
LEF4 $520
line 941
;941:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $505
JUMPV
LABELV $520
line 942
;942:	}
LABELV $517
line 943
;943:	if (!BotValidChatPosition(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 192
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 192
INDIRI4
CNSTI4 0
NEI4 $522
line 944
;944:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $505
JUMPV
LABELV $522
line 946
;945:	//
;946:	if (BotVisibleEnemies(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 196
ADDRGP4 BotVisibleEnemies
CALLI4
ASGNI4
ADDRLP4 196
INDIRI4
CNSTI4 0
EQI4 $524
line 947
;947:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $505
JUMPV
LABELV $524
line 949
;948:	//
;949:	BotEntityInfo(bs->enemy, &entinfo);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ARGP4
ADDRGP4 BotEntityInfo
CALLV
pop
line 950
;950:	if (EntityIsShooting(&entinfo))
ADDRLP4 36
ARGP4
ADDRLP4 200
ADDRGP4 EntityIsShooting
CALLI4
ASGNI4
ADDRLP4 200
INDIRI4
CNSTI4 0
EQI4 $526
line 951
;951:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $505
JUMPV
LABELV $526
line 953
;952:	//
;953:	ClientName(bs->enemy, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 954
;954:	weap = BotWeaponNameForMeansOfDeath(g_entities[bs->enemy].client->lasthurt_mod);
ADDRFP4 0
INDIRP4
CNSTI4 6540
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
ARGI4
ADDRLP4 204
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRLP4 32
ADDRLP4 204
INDIRP4
ASGNP4
line 956
;955:	//
;956:	BotAI_BotInitialChat(bs, "hit_nokill", name, weap, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $529
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 32
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 957
;957:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 958
;958:	bs->chatto        = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 959
;959:	return qtrue;
CNSTI4 1
RETI4
LABELV $505
endproc BotChat_HitNoKill 208 20
export BotChat_Random
proc BotChat_Random 96 36
line 967
;960:}
;961:
;962:/*
;963:==================
;964:BotChat_Random
;965:==================
;966:*/
;967:int BotChat_Random(bot_state_t* bs) {
line 971
;968:	float rnd;
;969:	char  name[32];
;970:
;971:	if (bot_nochat.integer)
ADDRGP4 bot_nochat+12
INDIRI4
CNSTI4 0
EQI4 $531
line 972
;972:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $530
JUMPV
LABELV $531
line 973
;973:	if (BotIsObserver(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 BotIsObserver
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $534
line 974
;974:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $530
JUMPV
LABELV $534
line 975
;975:	if (bs->lastchat_time > FloatTime() - TIME_BETWEENCHATTING)
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1103626240
SUBF4
LEF4 $536
line 976
;976:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $530
JUMPV
LABELV $536
line 978
;977:	// don't chat in tournament mode
;978:	if (gametype == GT_TOURNAMENT)
ADDRGP4 gametype
INDIRI4
CNSTI4 1
NEI4 $538
line 979
;979:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $530
JUMPV
LABELV $538
line 981
;980:	// don't chat when doing something important :)
;981:	if (bs->ltgtype == LTG_TEAMHELP || bs->ltgtype == LTG_TEAMACCOMPANY || bs->ltgtype == LTG_RUSHBASE)
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 1
EQI4 $543
ADDRLP4 40
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 2
EQI4 $543
ADDRLP4 40
INDIRP4
CNSTI4 6600
ADDP4
INDIRI4
CNSTI4 5
NEI4 $540
LABELV $543
line 982
;982:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $530
JUMPV
LABELV $540
line 984
;983:	//
;984:	rnd = trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_RANDOM, 0, 1);
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 34
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 44
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 44
INDIRF4
ASGNF4
line 985
;985:	if (random() > bs->thinktime * 0.1)
ADDRLP4 48
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 4904
ADDP4
INDIRF4
CNSTF4 1036831949
MULF4
LEF4 $544
line 986
;986:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $530
JUMPV
LABELV $544
line 987
;987:	if (!bot_fastchat.integer) {
ADDRGP4 bot_fastchat+12
INDIRI4
CNSTI4 0
NEI4 $546
line 988
;988:		if (random() > rnd)
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 32
INDIRF4
LEF4 $549
line 989
;989:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $530
JUMPV
LABELV $549
line 990
;990:		if (random() > 0.25)
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1048576000
LEF4 $551
line 991
;991:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $530
JUMPV
LABELV $551
line 992
;992:	}
LABELV $546
line 993
;993:	if (BotNumActivePlayers() <= 1)
ADDRLP4 52
ADDRGP4 BotNumActivePlayers
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 1
GTI4 $553
line 994
;994:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $530
JUMPV
LABELV $553
line 996
;995:	//
;996:	if (!BotValidChatPosition(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 BotValidChatPosition
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $555
line 997
;997:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $530
JUMPV
LABELV $555
line 999
;998:	//
;999:	if (BotVisibleEnemies(bs))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 BotVisibleEnemies
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $557
line 1000
;1000:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $530
JUMPV
LABELV $557
line 1002
;1001:	//
;1002:	if (bs->lastkilledplayer == bs->client) {
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ADDRLP4 64
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $559
line 1003
;1003:		strcpy(name, BotRandomOpponentName(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1004
;1004:	} else {
ADDRGP4 $560
JUMPV
LABELV $559
line 1005
;1005:		EasyClientName(bs->lastkilledplayer, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1006
;1006:	}
LABELV $560
line 1007
;1007:	if (TeamPlayIsOn()) {
ADDRLP4 68
ADDRGP4 TeamPlayIsOn
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $561
line 1011
;1008:#ifdef MISSIONPACK
;1009:		trap_EA_Command(bs->client, "vtaunt");
;1010:#endif
;1011:		return qfalse;  // don't wait
CNSTI4 0
RETI4
ADDRGP4 $530
JUMPV
LABELV $561
line 1014
;1012:	}
;1013:	//
;1014:	if (random() < trap_Characteristic_BFloat(bs->character, CHARACTERISTIC_CHAT_MISC, 0, 1)) {
ADDRLP4 72
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6520
ADDP4
INDIRI4
ARGI4
CNSTI4 25
ARGI4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 76
ADDRGP4 trap_Characteristic_BFloat
CALLF4
ASGNF4
ADDRLP4 72
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 76
INDIRF4
GEF4 $563
line 1015
;1015:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 84
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRLP4 88
ADDRGP4 BotRandomWeaponName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $565
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 92
ADDRGP4 $249
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1024
;1016:			bs, "random_misc",
;1017:			BotRandomOpponentName(bs),  // 0
;1018:			name,                       // 1
;1019:			"[invalid var]",            // 2
;1020:			"[invalid var]",            // 3
;1021:			BotMapTitle(),              // 4
;1022:			BotRandomWeaponName(),      // 5
;1023:			NULL);
;1024:	} else {
ADDRGP4 $564
JUMPV
LABELV $563
line 1025
;1025:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 80
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 84
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRLP4 88
ADDRGP4 BotRandomWeaponName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $566
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 92
ADDRGP4 $249
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 88
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1034
;1026:			bs, "random_insult",
;1027:			BotRandomOpponentName(bs),  // 0
;1028:			name,                       // 1
;1029:			"[invalid var]",            // 2
;1030:			"[invalid var]",            // 3
;1031:			BotMapTitle(),              // 4
;1032:			BotRandomWeaponName(),      // 5
;1033:			NULL);
;1034:	}
LABELV $564
line 1035
;1035:	bs->lastchat_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6100
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 1036
;1036:	bs->chatto        = CHAT_ALL;
ADDRFP4 0
INDIRP4
CNSTI4 6052
ADDP4
CNSTI4 0
ASGNI4
line 1037
;1037:	return qtrue;
CNSTI4 1
RETI4
LABELV $530
endproc BotChat_Random 96 36
export BotChatTime
proc BotChatTime 0 0
line 1045
;1038:}
;1039:
;1040:/*
;1041:==================
;1042:BotChatTime
;1043:==================
;1044:*/
;1045:float BotChatTime(bot_state_t* bs) {
line 1050
;1046:	// int cpm;
;1047:
;1048:	// cpm = trap_Characteristic_BInteger(bs->character, CHARACTERISTIC_CHAT_CPM, 1, 4000);
;1049:
;1050:	return 2.0;  //(float) trap_BotChatLength(bs->cs) * 30 / cpm;
CNSTF4 1073741824
RETF4
LABELV $567
endproc BotChatTime 0 0
export BotChatTest
proc BotChatTest 180 36
line 1058
;1051:}
;1052:
;1053:/*
;1054:==================
;1055:BotChatTest
;1056:==================
;1057:*/
;1058:void BotChatTest(bot_state_t* bs) {
line 1064
;1059:
;1060:	char  name[32];
;1061:	char* weap;
;1062:	int   num, i;
;1063:
;1064:	num = trap_BotNumInitialChats(bs->cs, "game_enter");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $248
ARGP4
ADDRLP4 44
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 44
INDIRI4
ASGNI4
line 1065
;1065:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $572
JUMPV
LABELV $569
line 1066
;1066:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 48
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 52
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 56
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $248
ARGP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 $249
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1073
;1067:			bs, "game_enter", EasyClientName(bs->client, name, 32),  // 0
;1068:			BotRandomOpponentName(bs),                               // 1
;1069:			"[invalid var]",                                         // 2
;1070:			"[invalid var]",                                         // 3
;1071:			BotMapTitle(),                                           // 4
;1072:			NULL);
;1073:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1074
;1074:	}
LABELV $570
line 1065
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $572
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $569
line 1075
;1075:	num = trap_BotNumInitialChats(bs->cs, "game_exit");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $267
ARGP4
ADDRLP4 48
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 48
INDIRI4
ASGNI4
line 1076
;1076:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $576
JUMPV
LABELV $573
line 1077
;1077:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 52
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 56
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 60
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 $249
ASGNP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1084
;1078:			bs, "game_exit", EasyClientName(bs->client, name, 32),  // 0
;1079:			BotRandomOpponentName(bs),                              // 1
;1080:			"[invalid var]",                                        // 2
;1081:			"[invalid var]",                                        // 3
;1082:			BotMapTitle(),                                          // 4
;1083:			NULL);
;1084:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1085
;1085:	}
LABELV $574
line 1076
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $576
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $573
line 1086
;1086:	num = trap_BotNumInitialChats(bs->cs, "level_start");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $287
ARGP4
ADDRLP4 52
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 52
INDIRI4
ASGNI4
line 1087
;1087:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $580
JUMPV
LABELV $577
line 1088
;1088:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 56
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $287
ARGP4
ADDRLP4 56
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1091
;1089:			bs, "level_start", EasyClientName(bs->client, name, 32),  // 0
;1090:			NULL);
;1091:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1092
;1092:	}
LABELV $578
line 1087
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $580
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $577
line 1093
;1093:	num = trap_BotNumInitialChats(bs->cs, "level_end_victory");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $309
ARGP4
ADDRLP4 56
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 56
INDIRI4
ASGNI4
line 1094
;1094:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $584
JUMPV
LABELV $581
line 1095
;1095:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 60
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 64
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 68
ADDRGP4 BotFirstClientInRankings
CALLP4
ASGNP4
ADDRLP4 72
ADDRGP4 BotLastClientInRankings
CALLP4
ASGNP4
ADDRLP4 76
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $309
ARGP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1102
;1096:			bs, "level_end_victory", EasyClientName(bs->client, name, 32),  // 0
;1097:			BotRandomOpponentName(bs),                                      // 1
;1098:			BotFirstClientInRankings(),                                     // 2
;1099:			BotLastClientInRankings(),                                      // 3
;1100:			BotMapTitle(),                                                  // 4
;1101:			NULL);
;1102:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1103
;1103:	}
LABELV $582
line 1094
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $584
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $581
line 1104
;1104:	num = trap_BotNumInitialChats(bs->cs, "level_end_lose");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $312
ARGP4
ADDRLP4 60
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 60
INDIRI4
ASGNI4
line 1105
;1105:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $588
JUMPV
LABELV $585
line 1106
;1106:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 64
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 72
ADDRGP4 BotFirstClientInRankings
CALLP4
ASGNP4
ADDRLP4 76
ADDRGP4 BotLastClientInRankings
CALLP4
ASGNP4
ADDRLP4 80
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $312
ARGP4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1113
;1107:			bs, "level_end_lose", EasyClientName(bs->client, name, 32),  // 0
;1108:			BotRandomOpponentName(bs),                                   // 1
;1109:			BotFirstClientInRankings(),                                  // 2
;1110:			BotLastClientInRankings(),                                   // 3
;1111:			BotMapTitle(),                                               // 4
;1112:			NULL);
;1113:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1114
;1114:	}
LABELV $586
line 1105
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $588
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $585
line 1115
;1115:	num = trap_BotNumInitialChats(bs->cs, "level_end");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $313
ARGP4
ADDRLP4 64
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 64
INDIRI4
ASGNI4
line 1116
;1116:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $592
JUMPV
LABELV $589
line 1117
;1117:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 68
ADDRGP4 EasyClientName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 76
ADDRGP4 BotFirstClientInRankings
CALLP4
ASGNP4
ADDRLP4 80
ADDRGP4 BotLastClientInRankings
CALLP4
ASGNP4
ADDRLP4 84
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $313
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 76
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1124
;1118:			bs, "level_end", EasyClientName(bs->client, name, 32),  // 0
;1119:			BotRandomOpponentName(bs),                              // 1
;1120:			BotFirstClientInRankings(),                             // 2
;1121:			BotLastClientInRankings(),                              // 3
;1122:			BotMapTitle(),                                          // 4
;1123:			NULL);
;1124:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1125
;1125:	}
LABELV $590
line 1116
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $592
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $589
line 1126
;1126:	EasyClientName(bs->lastkilledby, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 5996
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1127
;1127:	num = trap_BotNumInitialChats(bs->cs, "death_drown");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $341
ARGP4
ADDRLP4 68
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 68
INDIRI4
ASGNI4
line 1128
;1128:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $596
JUMPV
LABELV $593
line 1130
;1129:		//
;1130:		BotAI_BotInitialChat(bs, "death_drown", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $341
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1131
;1131:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1132
;1132:	}
LABELV $594
line 1128
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $596
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $593
line 1133
;1133:	num = trap_BotNumInitialChats(bs->cs, "death_slime");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $344
ARGP4
ADDRLP4 72
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 72
INDIRI4
ASGNI4
line 1134
;1134:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $600
JUMPV
LABELV $597
line 1135
;1135:		BotAI_BotInitialChat(bs, "death_slime", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $344
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1136
;1136:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1137
;1137:	}
LABELV $598
line 1134
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $600
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $597
line 1138
;1138:	num = trap_BotNumInitialChats(bs->cs, "death_lava");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $347
ARGP4
ADDRLP4 76
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 76
INDIRI4
ASGNI4
line 1139
;1139:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $604
JUMPV
LABELV $601
line 1140
;1140:		BotAI_BotInitialChat(bs, "death_lava", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $347
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1141
;1141:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1142
;1142:	}
LABELV $602
line 1139
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $604
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $601
line 1143
;1143:	num = trap_BotNumInitialChats(bs->cs, "death_cratered");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $350
ARGP4
ADDRLP4 80
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 80
INDIRI4
ASGNI4
line 1144
;1144:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $608
JUMPV
LABELV $605
line 1145
;1145:		BotAI_BotInitialChat(bs, "death_cratered", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $350
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1146
;1146:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1147
;1147:	}
LABELV $606
line 1144
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $608
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $605
line 1148
;1148:	num = trap_BotNumInitialChats(bs->cs, "death_suicide");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $358
ARGP4
ADDRLP4 84
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 84
INDIRI4
ASGNI4
line 1149
;1149:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $612
JUMPV
LABELV $609
line 1150
;1150:		BotAI_BotInitialChat(bs, "death_suicide", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $358
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1151
;1151:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1152
;1152:	}
LABELV $610
line 1149
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $612
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $609
line 1153
;1153:	num = trap_BotNumInitialChats(bs->cs, "death_telefrag");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $361
ARGP4
ADDRLP4 88
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 88
INDIRI4
ASGNI4
line 1154
;1154:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $616
JUMPV
LABELV $613
line 1155
;1155:		BotAI_BotInitialChat(bs, "death_telefrag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $361
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1156
;1156:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1157
;1157:	}
LABELV $614
line 1154
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $616
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $613
line 1158
;1158:	num = trap_BotNumInitialChats(bs->cs, "death_gauntlet");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $369
ARGP4
ADDRLP4 92
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 92
INDIRI4
ASGNI4
line 1159
;1159:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $620
JUMPV
LABELV $617
line 1160
;1160:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 96
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $369
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 96
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1165
;1161:			bs, "death_gauntlet",
;1162:			name,                                            // 0
;1163:			BotWeaponNameForMeansOfDeath(bs->botdeathtype),  // 1
;1164:			NULL);
;1165:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1166
;1166:	}
LABELV $618
line 1159
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $620
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $617
line 1167
;1167:	num = trap_BotNumInitialChats(bs->cs, "death_rail");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $372
ARGP4
ADDRLP4 96
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 96
INDIRI4
ASGNI4
line 1168
;1168:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $624
JUMPV
LABELV $621
line 1169
;1169:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 100
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $372
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1174
;1170:			bs, "death_rail",
;1171:			name,                                            // 0
;1172:			BotWeaponNameForMeansOfDeath(bs->botdeathtype),  // 1
;1173:			NULL);
;1174:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1175
;1175:	}
LABELV $622
line 1168
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $624
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $621
line 1176
;1176:	num = trap_BotNumInitialChats(bs->cs, "death_bfg");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $373
ARGP4
ADDRLP4 100
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 100
INDIRI4
ASGNI4
line 1177
;1177:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $628
JUMPV
LABELV $625
line 1178
;1178:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 104
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $373
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1183
;1179:			bs, "death_bfg",
;1180:			name,                                            // 0
;1181:			BotWeaponNameForMeansOfDeath(bs->botdeathtype),  // 1
;1182:			NULL);
;1183:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1184
;1184:	}
LABELV $626
line 1177
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $628
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $625
line 1185
;1185:	num = trap_BotNumInitialChats(bs->cs, "death_insult");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $376
ARGP4
ADDRLP4 104
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 104
INDIRI4
ASGNI4
line 1186
;1186:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $632
JUMPV
LABELV $629
line 1187
;1187:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $376
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 108
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1192
;1188:			bs, "death_insult",
;1189:			name,                                            // 0
;1190:			BotWeaponNameForMeansOfDeath(bs->botdeathtype),  // 1
;1191:			NULL);
;1192:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1193
;1193:	}
LABELV $630
line 1186
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $632
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $629
line 1194
;1194:	num = trap_BotNumInitialChats(bs->cs, "death_praise");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $377
ARGP4
ADDRLP4 108
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 108
INDIRI4
ASGNI4
line 1195
;1195:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $636
JUMPV
LABELV $633
line 1196
;1196:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
CNSTI4 6000
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $377
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1201
;1197:			bs, "death_praise",
;1198:			name,                                            // 0
;1199:			BotWeaponNameForMeansOfDeath(bs->botdeathtype),  // 1
;1200:			NULL);
;1201:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1202
;1202:	}
LABELV $634
line 1195
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $636
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $633
line 1204
;1203:	//
;1204:	EasyClientName(bs->lastkilledplayer, name, 32);
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1206
;1205:	//
;1206:	num = trap_BotNumInitialChats(bs->cs, "kill_gauntlet");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $406
ARGP4
ADDRLP4 112
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 112
INDIRI4
ASGNI4
line 1207
;1207:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $640
JUMPV
LABELV $637
line 1209
;1208:		//
;1209:		BotAI_BotInitialChat(bs, "kill_gauntlet", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $406
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1210
;1210:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1211
;1211:	}
LABELV $638
line 1207
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $640
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $637
line 1212
;1212:	num = trap_BotNumInitialChats(bs->cs, "kill_rail");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $409
ARGP4
ADDRLP4 116
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 116
INDIRI4
ASGNI4
line 1213
;1213:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $644
JUMPV
LABELV $641
line 1214
;1214:		BotAI_BotInitialChat(bs, "kill_rail", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $409
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1215
;1215:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1216
;1216:	}
LABELV $642
line 1213
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $644
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $641
line 1217
;1217:	num = trap_BotNumInitialChats(bs->cs, "kill_telefrag");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $412
ARGP4
ADDRLP4 120
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 120
INDIRI4
ASGNI4
line 1218
;1218:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $648
JUMPV
LABELV $645
line 1219
;1219:		BotAI_BotInitialChat(bs, "kill_telefrag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $412
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1220
;1220:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1221
;1221:	}
LABELV $646
line 1218
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $648
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $645
line 1222
;1222:	num = trap_BotNumInitialChats(bs->cs, "kill_insult");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $415
ARGP4
ADDRLP4 124
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 124
INDIRI4
ASGNI4
line 1223
;1223:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $652
JUMPV
LABELV $649
line 1224
;1224:		BotAI_BotInitialChat(bs, "kill_insult", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $415
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1225
;1225:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1226
;1226:	}
LABELV $650
line 1223
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $652
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $649
line 1227
;1227:	num = trap_BotNumInitialChats(bs->cs, "kill_praise");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $416
ARGP4
ADDRLP4 128
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 128
INDIRI4
ASGNI4
line 1228
;1228:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $656
JUMPV
LABELV $653
line 1229
;1229:		BotAI_BotInitialChat(bs, "kill_praise", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $416
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1230
;1230:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1231
;1231:	}
LABELV $654
line 1228
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $656
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $653
line 1232
;1232:	num = trap_BotNumInitialChats(bs->cs, "enemy_suicide");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $441
ARGP4
ADDRLP4 132
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 132
INDIRI4
ASGNI4
line 1233
;1233:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $660
JUMPV
LABELV $657
line 1234
;1234:		BotAI_BotInitialChat(bs, "enemy_suicide", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $441
ARGP4
ADDRLP4 8
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1235
;1235:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1236
;1236:	}
LABELV $658
line 1233
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $660
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $657
line 1237
;1237:	ClientName(g_entities[bs->client].client->lasthurt_client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 1238
;1238:	weap = BotWeaponNameForMeansOfDeath(g_entities[bs->client].client->lasthurt_client);
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
ADDRLP4 136
ADDRGP4 BotWeaponNameForMeansOfDeath
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 136
INDIRP4
ASGNP4
line 1239
;1239:	num  = trap_BotNumInitialChats(bs->cs, "hit_talking");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $471
ARGP4
ADDRLP4 140
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 140
INDIRI4
ASGNI4
line 1240
;1240:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $666
JUMPV
LABELV $663
line 1241
;1241:		BotAI_BotInitialChat(bs, "hit_talking", name, weap, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $471
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1242
;1242:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1243
;1243:	}
LABELV $664
line 1240
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $666
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $663
line 1244
;1244:	num = trap_BotNumInitialChats(bs->cs, "hit_nodeath");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $504
ARGP4
ADDRLP4 144
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 144
INDIRI4
ASGNI4
line 1245
;1245:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $670
JUMPV
LABELV $667
line 1246
;1246:		BotAI_BotInitialChat(bs, "hit_nodeath", name, weap, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $504
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1247
;1247:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1248
;1248:	}
LABELV $668
line 1245
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $670
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $667
line 1249
;1249:	num = trap_BotNumInitialChats(bs->cs, "hit_nokill");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $529
ARGP4
ADDRLP4 148
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 148
INDIRI4
ASGNI4
line 1250
;1250:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $674
JUMPV
LABELV $671
line 1251
;1251:		BotAI_BotInitialChat(bs, "hit_nokill", name, weap, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $529
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 40
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1252
;1252:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1253
;1253:	}
LABELV $672
line 1250
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $674
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $671
line 1255
;1254:	//
;1255:	if (bs->lastkilledplayer == bs->client) {
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 152
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ADDRLP4 152
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $675
line 1256
;1256:		strcpy(name, BotRandomOpponentName(bs));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 156
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 8
ARGP4
ADDRLP4 156
INDIRP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1257
;1257:	} else {
ADDRGP4 $676
JUMPV
LABELV $675
line 1258
;1258:		EasyClientName(bs->lastkilledplayer, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 5992
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 EasyClientName
CALLP4
pop
line 1259
;1259:	}
LABELV $676
line 1261
;1260:	//
;1261:	num = trap_BotNumInitialChats(bs->cs, "random_misc");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $565
ARGP4
ADDRLP4 156
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 156
INDIRI4
ASGNI4
line 1262
;1262:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $680
JUMPV
LABELV $677
line 1264
;1263:		//
;1264:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 160
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 164
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRLP4 168
ADDRGP4 BotRandomWeaponName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $565
ARGP4
ADDRLP4 160
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 172
ADDRGP4 $249
ASGNP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 168
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1273
;1265:			bs, "random_misc",
;1266:			BotRandomOpponentName(bs),  // 0
;1267:			name,                       // 1
;1268:			"[invalid var]",            // 2
;1269:			"[invalid var]",            // 3
;1270:			BotMapTitle(),              // 4
;1271:			BotRandomWeaponName(),      // 5
;1272:			NULL);
;1273:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1274
;1274:	}
LABELV $678
line 1262
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $680
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $677
line 1275
;1275:	num = trap_BotNumInitialChats(bs->cs, "random_insult");
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRGP4 $566
ARGP4
ADDRLP4 160
ADDRGP4 trap_BotNumInitialChats
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 160
INDIRI4
ASGNI4
line 1276
;1276:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $684
JUMPV
LABELV $681
line 1277
;1277:		BotAI_BotInitialChat(
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 164
ADDRGP4 BotRandomOpponentName
CALLP4
ASGNP4
ADDRLP4 168
ADDRGP4 BotMapTitle
CALLP4
ASGNP4
ADDRLP4 172
ADDRGP4 BotRandomWeaponName
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $566
ARGP4
ADDRLP4 164
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 176
ADDRGP4 $249
ASGNP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRLP4 176
INDIRP4
ARGP4
ADDRLP4 168
INDIRP4
ARGP4
ADDRLP4 172
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 1286
;1278:			bs, "random_insult",
;1279:			BotRandomOpponentName(bs),  // 0
;1280:			name,                       // 1
;1281:			"[invalid var]",            // 2
;1282:			"[invalid var]",            // 3
;1283:			BotMapTitle(),              // 4
;1284:			BotRandomWeaponName(),      // 5
;1285:			NULL);
;1286:		trap_BotEnterChat(bs->cs, 0, CHAT_ALL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 1287
;1287:	}
LABELV $682
line 1276
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $684
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $681
line 1288
;1288:}
LABELV $568
endproc BotChatTest 180 36
import BotDumpNodeSwitches
import BotResetNodeSwitches
import AINode_Battle_NBG
import AINode_Battle_Retreat
import AINode_Battle_Chase
import AINode_Battle_Fight
import AINode_Seek_LTG
import AINode_Seek_NBG
import AINode_Seek_ActivateEntity
import AINode_Stand
import AINode_Respawn
import AINode_Observer
import AINode_Intermission
import AIEnter_Battle_NBG
import AIEnter_Battle_Retreat
import AIEnter_Battle_Chase
import AIEnter_Battle_Fight
import AIEnter_Seek_Camp
import AIEnter_Seek_LTG
import AIEnter_Seek_NBG
import AIEnter_Seek_ActivateEntity
import AIEnter_Stand
import AIEnter_Respawn
import AIEnter_Observer
import AIEnter_Intermission
import BotPrintTeamGoal
import BotMatchMessage
import notleader
import ctf_blueflag
import ctf_redflag
import bot_challenge
import bot_testrchat
import bot_nochat
import bot_fastchat
import bot_rocketjump
import bot_grapple
import mapname
import gametype
import BotMapScripts
import BotPointAreaNum
import ClientOnSameTeamFromName
import ClientFromName
import stristr
import BotFindWayPoint
import BotCreateWayPoint
import BotAlternateRoute
import BotGetAlternateRouteGoal
import BotCTFRetreatGoals
import BotCTFSeekGoals
import BotRememberLastOrderedTask
import BotCTFCarryingFlag
import BotOppositeTeam
import BotTeam
import BotClearActivateGoalStack
import BotPopFromActivateGoalStack
import BotEnableActivateGoalAreas
import BotAIPredictObstacles
import BotAIBlocked
import BotCheckAttack
import BotAimAtEnemy
import BotEntityVisible
import BotRoamGoal
import BotFindEnemy
import InFieldOfVision
import BotVisibleTeamMatesAndEnemies
import BotEnemyFlagCarrierVisible
import BotTeamFlagCarrierVisible
import BotTeamFlagCarrier
import TeamPlayIsOn
import BotSameTeam
import BotAttackMove
import BotWantsToCamp
import BotHasPersistantPowerupAndWeapon
import BotCanAndWantsToRocketJump
import BotWantsToHelp
import BotWantsToChase
import BotWantsToRetreat
import BotFeelingBad
import BotAggression
import BotTeamGoals
import BotSetLastOrderedTask
import BotSynonymContext
import ClientSkin
import EasyClientName
import ClientName
import BotSetTeamStatus
import EntityIsShooting
import EntityIsInvisible
import EntityIsDead
import BotInLavaOrSlime
import BotIntermission
import BotIsObserver
import BotIsDead
import BotBattleUseItems
import BotUpdateBattleInventory
import BotUpdateInventory
import BotSetupForMovement
import BotChooseWeapon
import BotFreeWaypoints
import BotDeathmatchAI
import BotShutdownDeathmatchAI
import BotSetupDeathmatchAI
import BotTeamLeader
import BotAI_GetSnapshotEntity
import BotAI_GetEntityState
import BotAI_GetClientState
import BotAI_Trace
import BotAI_BotInitialChat
import BotAI_Print
import floattime
import BotEntityInfo
import NumBots
import BotResetState
import BotResetWeaponState
import BotFreeWeaponState
import BotAllocWeaponState
import BotLoadWeaponWeights
import BotGetWeaponInfo
import BotChooseBestFightWeapon
import BotShutdownWeaponAI
import BotSetupWeaponAI
import BotShutdownMoveAI
import BotSetupMoveAI
import BotSetBrushModelTypes
import BotAddAvoidSpot
import BotInitMoveState
import BotFreeMoveState
import BotAllocMoveState
import BotPredictVisiblePosition
import BotMovementViewTarget
import BotReachabilityArea
import BotResetLastAvoidReach
import BotResetAvoidReach
import BotMoveInDirection
import BotMoveToGoal
import BotResetMoveState
import BotShutdownGoalAI
import BotSetupGoalAI
import BotFreeGoalState
import BotAllocGoalState
import BotFreeItemWeights
import BotLoadItemWeights
import BotMutateGoalFuzzyLogic
import BotSaveGoalFuzzyLogic
import BotInterbreedGoalFuzzyLogic
import BotUpdateEntityItems
import BotInitLevelItems
import BotSetAvoidGoalTime
import BotAvoidGoalTime
import BotGetMapLocationGoal
import BotGetNextCampSpotGoal
import BotGetLevelItemGoal
import BotItemGoalInVisButNotVisible
import BotTouchingGoal
import BotChooseNBGItem
import BotChooseLTGItem
import BotGetSecondGoal
import BotGetTopGoal
import BotGoalName
import BotDumpGoalStack
import BotDumpAvoidGoals
import BotEmptyGoalStack
import BotPopGoal
import BotPushGoal
import BotRemoveFromAvoidGoals
import BotResetAvoidGoals
import BotResetGoalState
import GeneticParentsAndChildSelection
import BotSetChatName
import BotSetChatGender
import BotLoadChatFile
import BotReplaceSynonyms
import UnifyWhiteSpaces
import BotMatchVariable
import BotFindMatch
import StringContains
import BotGetChatMessage
import BotEnterChat
import BotChatLength
import BotReplyChat
import BotNumInitialChats
import BotInitialChat
import BotNumConsoleMessages
import BotNextConsoleMessage
import BotRemoveConsoleMessage
import BotQueueConsoleMessage
import BotFreeChatState
import BotAllocChatState
import BotShutdownChatAI
import BotSetupChatAI
import BotShutdownCharacters
import Characteristic_String
import Characteristic_BInteger
import Characteristic_Integer
import Characteristic_BFloat
import Characteristic_Float
import BotFreeCharacter
import BotLoadCharacter
import EA_Shutdown
import EA_Setup
import EA_ResetInput
import EA_GetInput
import EA_EndRegular
import EA_View
import EA_Move
import EA_DelayedJump
import EA_Jump
import EA_SelectWeapon
import EA_Use
import EA_Gesture
import EA_Talk
import EA_Respawn
import EA_Attack
import EA_MoveRight
import EA_MoveLeft
import EA_MoveBack
import EA_MoveForward
import EA_MoveDown
import EA_MoveUp
import EA_Walk
import EA_Crouch
import EA_Action
import EA_Command
import EA_SayTeam
import EA_Say
import GetBotLibAPI
import svf_self_portal2
import trap_SnapVector
import trap_GeneticParentsAndChildSelection
import trap_BotResetWeaponState
import trap_BotFreeWeaponState
import trap_BotAllocWeaponState
import trap_BotLoadWeaponWeights
import trap_BotGetWeaponInfo
import trap_BotChooseBestFightWeapon
import trap_BotAddAvoidSpot
import trap_BotInitMoveState
import trap_BotFreeMoveState
import trap_BotAllocMoveState
import trap_BotPredictVisiblePosition
import trap_BotMovementViewTarget
import trap_BotReachabilityArea
import trap_BotResetLastAvoidReach
import trap_BotResetAvoidReach
import trap_BotMoveInDirection
import trap_BotMoveToGoal
import trap_BotResetMoveState
import trap_BotFreeGoalState
import trap_BotAllocGoalState
import trap_BotMutateGoalFuzzyLogic
import trap_BotSaveGoalFuzzyLogic
import trap_BotInterbreedGoalFuzzyLogic
import trap_BotFreeItemWeights
import trap_BotLoadItemWeights
import trap_BotUpdateEntityItems
import trap_BotInitLevelItems
import trap_BotSetAvoidGoalTime
import trap_BotAvoidGoalTime
import trap_BotGetLevelItemGoal
import trap_BotGetMapLocationGoal
import trap_BotGetNextCampSpotGoal
import trap_BotItemGoalInVisButNotVisible
import trap_BotTouchingGoal
import trap_BotChooseNBGItem
import trap_BotChooseLTGItem
import trap_BotGetSecondGoal
import trap_BotGetTopGoal
import trap_BotGoalName
import trap_BotDumpGoalStack
import trap_BotDumpAvoidGoals
import trap_BotEmptyGoalStack
import trap_BotPopGoal
import trap_BotPushGoal
import trap_BotResetAvoidGoals
import trap_BotRemoveFromAvoidGoals
import trap_BotResetGoalState
import trap_BotSetChatName
import trap_BotSetChatGender
import trap_BotLoadChatFile
import trap_BotReplaceSynonyms
import trap_UnifyWhiteSpaces
import trap_BotMatchVariable
import trap_BotFindMatch
import trap_StringContains
import trap_BotGetChatMessage
import trap_BotEnterChat
import trap_BotChatLength
import trap_BotReplyChat
import trap_BotNumInitialChats
import trap_BotInitialChat
import trap_BotNumConsoleMessages
import trap_BotNextConsoleMessage
import trap_BotRemoveConsoleMessage
import trap_BotQueueConsoleMessage
import trap_BotFreeChatState
import trap_BotAllocChatState
import trap_Characteristic_String
import trap_Characteristic_BInteger
import trap_Characteristic_Integer
import trap_Characteristic_BFloat
import trap_Characteristic_Float
import trap_BotFreeCharacter
import trap_BotLoadCharacter
import trap_EA_ResetInput
import trap_EA_GetInput
import trap_EA_EndRegular
import trap_EA_View
import trap_EA_Move
import trap_EA_DelayedJump
import trap_EA_Jump
import trap_EA_SelectWeapon
import trap_EA_MoveRight
import trap_EA_MoveLeft
import trap_EA_MoveBack
import trap_EA_MoveForward
import trap_EA_MoveDown
import trap_EA_MoveUp
import trap_EA_Crouch
import trap_EA_Respawn
import trap_EA_Use
import trap_EA_Attack
import trap_EA_Talk
import trap_EA_Gesture
import trap_EA_Action
import trap_EA_Command
import trap_EA_SayTeam
import trap_EA_Say
import trap_AAS_PredictClientMovement
import trap_AAS_Swimming
import trap_AAS_AlternativeRouteGoals
import trap_AAS_PredictRoute
import trap_AAS_EnableRoutingArea
import trap_AAS_AreaTravelTimeToGoalArea
import trap_AAS_AreaReachability
import trap_AAS_IntForBSPEpairKey
import trap_AAS_FloatForBSPEpairKey
import trap_AAS_VectorForBSPEpairKey
import trap_AAS_ValueForBSPEpairKey
import trap_AAS_NextBSPEntity
import trap_AAS_PointContents
import trap_AAS_TraceAreas
import trap_AAS_PointReachabilityAreaIndex
import trap_AAS_PointAreaNum
import trap_AAS_Time
import trap_AAS_PresenceTypeBoundingBox
import trap_AAS_Initialized
import trap_AAS_EntityInfo
import trap_AAS_AreaInfo
import trap_AAS_BBoxAreas
import trap_BotUserCommand
import trap_BotGetServerCommand
import trap_BotGetSnapshotEntity
import trap_BotLibTest
import trap_BotLibUpdateEntity
import trap_BotLibLoadMap
import trap_BotLibStartFrame
import trap_BotLibDefine
import trap_BotLibVarGet
import trap_BotLibVarSet
import trap_BotLibShutdown
import trap_BotLibSetup
import trap_DebugPolygonDelete
import trap_DebugPolygonCreate
import trap_GetEntityToken
import trap_GetUsercmd
import trap_BotFreeClient
import trap_BotAllocateClient
import trap_EntityContact
import trap_EntitiesInBox
import trap_UnlinkEntity
import trap_LinkEntity
import trap_AreasConnected
import trap_AdjustAreaPortalState
import trap_InPVSIgnorePortals
import trap_InPVS
import trap_PointContents
import trap_TraceCapsule
import trap_Trace
import trap_SetBrushModel
import trap_GetServerinfo
import trap_SetUserinfo
import trap_GetUserinfo
import trap_GetConfigstring
import trap_SetConfigstring
import trap_SendServerCommand
import trap_DropClient
import trap_LocateGameData
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_VariableIntegerValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_RealTime
import trap_Milliseconds
import trap_Error
import trap_Print
import phy_movetype
import g_proxMineTimeout
import g_singlePlayer
import g_enableBreath
import g_enableDust
import g_predictPVS
import g_unlagged
import g_rotation
import pmove_msec
import pmove_fixed
import g_smoothClients
import g_blueteam
import g_redteam
import g_cubeTimeout
import g_obeliskRespawnDelay
import g_obeliskRegenAmount
import g_obeliskRegenPeriod
import g_obeliskHealth
import g_filterBan
import g_banIPs
import g_teamForceBalance
import g_autoJoin
import g_allowVote
import g_blood
import g_warmup
import g_motd
import g_synchronousClients
import g_weaponTeamRespawn
import g_weaponRespawn
import g_debugDamage
import g_debugAlloc
import g_debugMove
import g_inactivity
import g_forcerespawn
import g_quadfactor
import g_knockback
import g_speed
import g_gravity
import g_needpass
import g_password
import g_friendlyFire
import g_capturelimit
import g_timelimit
import g_fraglimit
import g_dmflags
import g_maxGameClients
import g_cheats
import g_dedicated
import sv_fps
import g_mapname
import g_gametype
import g_entities
import level
import AddTeamScore
import Pickup_Team
import CheckTeamStatus
import TeamplayInfoMessage
import Team_GetLocationMsg
import Team_GetLocation
import SelectCTFSpawnPoint
import Team_FreeEntity
import Team_ReturnFlag
import Team_InitGame
import Team_CheckHurtCarrier
import Team_FragBonuses
import Team_DroppedFlagThink
import TeamColorString
import OtherTeamName
import TeamName
import OtherTeam
import G_MapExist
import G_LoadMap
import ParseMapRotation
import BotTestAAS
import BotAIStartFrame
import BotAIShutdownClient
import BotAISetupClient
import BotAILoadMap
import BotAIShutdown
import BotAISetup
import BotInterbreedEndMatch
import Svcmd_BotList_f
import Svcmd_AddBot_f
import G_BotConnect
import G_RemoveQueuedBotBegin
import G_CheckBotSpawn
import G_GetBotInfoByName
import G_GetBotInfoByNumber
import G_InitBots
import G_PredictPlayerMove
import G_UnTimeShiftClient
import G_UndoTimeShiftFor
import G_DoTimeShiftFor
import G_UnTimeShiftAllClients
import G_TimeShiftAllClients
import G_StoreHistory
import G_ResetHistory
import Svcmd_AbortPodium_f
import SpawnModelsOnVictoryPads
import UpdateTournamentInfo
import G_ClearClientSessionData
import G_WriteClientSessionData
import G_ReadClientSessionData
import G_InitSessionData
import G_WriteSessionData
import G_InitWorldSession
import Svcmd_GameMem_f
import G_InitMemory
import G_Alloc
import Team_ResetFlags
import CheckObeliskAttack
import Team_CheckDroppedItem
import OnSameTeam
import G_RunClient
import ClientEndFrame
import ClientThink
import ClientCommand
import ClientBegin
import ClientDisconnect
import ClientUserinfoChanged
import ClientConnect
import G_BroadcastServerCommand
import G_Error
import G_Printf
import G_LogPrintf
import G_RunThink
import CheckTeamLeader
import SetLeader
import FindIntermissionPoint
import MoveClientToIntermission
import DeathmatchScoreboardMessage
import FireWeapon
import G_FilterPacket
import G_ProcessIPBans
import ConsoleCommand
import SpotWouldTelefrag
import CalculateRanks
import AddScore
import player_die
import ClientSpawn
import InitBodyQue
import BeginIntermission
import respawn
import CopyToBodyQue
import SelectSpawnPoint
import SetClientViewAngle
import PickTeam
import TeamLeader
import TeamConnectedCount
import TeamCount
import Weapon_HookThink
import Weapon_HookFree
import CheckGauntletAttack
import SnapVectorTowards
import CalcMuzzlePoint
import LogAccuracyHit
import TeleportPlayer
import trigger_teleporter_touch
import Touch_DoorTrigger
import G_RunMover
import fire_grapple
import fire_bfg
import fire_rocket
import fire_grenade
import fire_plasma
import fire_blaster
import G_RunMissile
import TossClientCubes
import TossClientItems
import body_die
import G_InvulnerabilityEffect
import G_RadiusDamage
import G_Damage
import CanDamage
import BuildShaderStateConfig
import AddRemap
import G_SetOrigin
import G_AddEvent
import G_AddPredictableEvent
import vectoyaw
import vtos
import tv
import G_TouchSolids
import G_TouchTriggers
import G_EntitiesFree
import G_FreeEntity
import G_Sound
import G_TempEntity
import G_Spawn
import G_InitGentity
import G_SetMovedir
import G_UseTargets
import G_PickTarget
import G_Find
import G_KillBox
import G_TeamCommand
import G_SoundIndex
import G_ModelIndex
import SaveRegisteredItems
import RegisterItem
import ClearRegisteredItems
import Touch_Item
import ArmorIndex
import Think_Weapon
import FinishSpawningItem
import G_SpawnItem
import SetRespawn
import LaunchItem
import Drop_Item
import PrecacheItem
import UseHoldableItem
import SpawnTime
import RespawnItem
import G_RunItem
import G_CheckTeamItems
import G_RevertVote
import Cmd_FollowCycle_f
import SetTeam
import BroadcastTeamChange
import StopFollowing
import Cmd_Score_f
import G_NewString
import G_SpawnEntitiesFromString
import G_SpawnVector
import G_SpawnInt
import G_SpawnFloat
import G_SpawnString
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
LABELV $566
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $565
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 95
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 0
align 1
LABELV $529
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 110
byte 1 111
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $504
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 110
byte 1 111
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $471
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $441
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $440
byte 1 0
align 1
LABELV $416
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $415
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $412
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $409
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $406
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $401
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $377
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 112
byte 1 114
byte 1 97
byte 1 105
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $376
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 105
byte 1 110
byte 1 115
byte 1 117
byte 1 108
byte 1 116
byte 1 0
align 1
LABELV $373
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $372
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $369
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $361
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $358
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 115
byte 1 117
byte 1 105
byte 1 99
byte 1 105
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $350
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
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
LABELV $347
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 108
byte 1 97
byte 1 118
byte 1 97
byte 1 0
align 1
LABELV $344
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 115
byte 1 108
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $341
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 100
byte 1 114
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $336
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $331
byte 1 91
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 93
byte 1 0
align 1
LABELV $313
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $312
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 101
byte 1 110
byte 1 100
byte 1 95
byte 1 108
byte 1 111
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $309
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 101
byte 1 110
byte 1 100
byte 1 95
byte 1 118
byte 1 105
byte 1 99
byte 1 116
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $287
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $267
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 101
byte 1 120
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $249
byte 1 91
byte 1 105
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 97
byte 1 114
byte 1 93
byte 1 0
align 1
LABELV $248
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $174
byte 1 91
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 93
byte 1 0
align 1
LABELV $173
byte 1 71
byte 1 114
byte 1 97
byte 1 112
byte 1 112
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $171
byte 1 66
byte 1 70
byte 1 71
byte 1 49
byte 1 48
byte 1 75
byte 1 0
align 1
LABELV $169
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $167
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $165
byte 1 80
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
LABELV $163
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $161
byte 1 71
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 32
byte 1 76
byte 1 97
byte 1 117
byte 1 110
byte 1 99
byte 1 104
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $159
byte 1 77
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $157
byte 1 71
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $155
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $67
byte 1 116
byte 1 0
align 1
LABELV $63
byte 1 110
byte 1 0
