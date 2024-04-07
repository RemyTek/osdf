export BotValidTeamLeader
code
proc BotValidTeamLeader 8 4
file "../../../../code/game/ai_team.c"
line 52
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:/*****************************************************************************
;5: * name:		ai_team.c
;6: *
;7: * desc:		Quake3 bot AI
;8: *
;9: * $Archive: /MissionPack/code/game/ai_team.c $
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
;29:#include "ai_team.h"
;30:#include "ai_vcmd.h"
;31:
;32:#include "match.h"
;33:
;34:// for the voice chats
;35:#ifdef MISSIONPACK
;36:#include "../../ui/menudef.h"
;37:#endif
;38:
;39:// ctf task preferences for a client
;40:typedef struct bot_ctftaskpreference_s {
;41:	char name[36];
;42:	int  preference;
;43:} bot_ctftaskpreference_t;
;44:
;45:bot_ctftaskpreference_t ctftaskpreferences[MAX_CLIENTS];
;46:
;47:/*
;48:==================
;49:BotValidTeamLeader
;50:==================
;51:*/
;52:int BotValidTeamLeader(bot_state_t* bs) {
line 53
;53:	if (!strlen(bs->teamleader))
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $56
line 54
;54:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $55
JUMPV
LABELV $56
line 55
;55:	if (ClientFromName(bs->teamleader) == -1)
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 ClientFromName
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $58
line 56
;56:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $55
JUMPV
LABELV $58
line 57
;57:	return qtrue;
CNSTI4 1
RETI4
LABELV $55
endproc BotValidTeamLeader 8 4
export BotNumTeamMates
proc BotNumTeamMates 1048 12
line 65
;58:}
;59:
;60:/*
;61:==================
;62:BotNumTeamMates
;63:==================
;64:*/
;65:int BotNumTeamMates(bot_state_t* bs) {
line 69
;66:	int  i, numplayers;
;67:	char buf[MAX_INFO_STRING];
;68:
;69:	numplayers = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 70
;70:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $64
JUMPV
LABELV $61
line 71
;71:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
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
line 73
;72:		// if no config string or no name
;73:		if (!buf[0] || !*Info_ValueForKey(buf, "n"))
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $69
ADDRLP4 0
ARGP4
ADDRGP4 $68
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
NEI4 $66
LABELV $69
line 74
;74:			continue;
ADDRGP4 $62
JUMPV
LABELV $66
line 76
;75:		// skip spectators
;76:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR)
ADDRLP4 0
ARGP4
ADDRGP4 $72
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
NEI4 $70
line 77
;77:			continue;
ADDRGP4 $62
JUMPV
LABELV $70
line 79
;78:		//
;79:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1044
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $73
line 80
;80:			numplayers++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 81
;81:		}
LABELV $73
line 82
;82:	}
LABELV $62
line 70
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $64
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $61
line 83
;83:	return numplayers;
ADDRLP4 1028
INDIRI4
RETI4
LABELV $60
endproc BotNumTeamMates 1048 12
export BotClientTravelTimeToGoal
proc BotClientTravelTimeToGoal 480 16
line 91
;84:}
;85:
;86:/*
;87:==================
;88:BotClientTravelTimeToGoal
;89:==================
;90:*/
;91:int BotClientTravelTimeToGoal(int client, bot_goal_t* goal) {
line 95
;92:	playerState_t ps;
;93:	int           areanum;
;94:
;95:	BotAI_GetClientState(client, &ps);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BotAI_GetClientState
CALLI4
pop
line 96
;96:	areanum = BotPointAreaNum(ps.origin);
ADDRLP4 0+20
ARGP4
ADDRLP4 472
ADDRGP4 BotPointAreaNum
CALLI4
ASGNI4
ADDRLP4 468
ADDRLP4 472
INDIRI4
ASGNI4
line 97
;97:	if (!areanum)
ADDRLP4 468
INDIRI4
CNSTI4 0
NEI4 $77
line 98
;98:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $75
JUMPV
LABELV $77
line 99
;99:	return trap_AAS_AreaTravelTimeToGoalArea(areanum, ps.origin, goal->areanum, TFL_DEFAULT);
ADDRLP4 468
INDIRI4
ARGI4
ADDRLP4 0+20
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
CNSTI4 18616254
ARGI4
ADDRLP4 476
ADDRGP4 trap_AAS_AreaTravelTimeToGoalArea
CALLI4
ASGNI4
ADDRLP4 476
INDIRI4
RETI4
LABELV $75
endproc BotClientTravelTimeToGoal 480 16
export BotSortTeamMatesByBaseTravelTime
proc BotSortTeamMatesByBaseTravelTime 1336 12
line 107
;100:}
;101:
;102:/*
;103:==================
;104:BotSortTeamMatesByBaseTravelTime
;105:==================
;106:*/
;107:int BotSortTeamMatesByBaseTravelTime(bot_state_t* bs, int* teammates, int maxteammates) {
line 112
;108:
;109:	int         i, j, k, numteammates, traveltime;
;110:	char        buf[MAX_INFO_STRING];
;111:	int         traveltimes[MAX_CLIENTS];
;112:	bot_goal_t* goal = NULL;
ADDRLP4 1300
CNSTP4 0
ASGNP4
line 117
;113:
;114:#ifdef MISSIONPACK
;115:	if (gametype == GT_CTF || gametype == GT_1FCTF)
;116:#else
;117:	if (gametype == GT_CTF)
ADDRGP4 gametype
INDIRI4
CNSTI4 4
NEI4 $81
line 119
;118:#endif
;119:	{
line 120
;120:		if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1304
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 1304
INDIRI4
CNSTI4 1
NEI4 $83
line 121
;121:			goal = &ctf_redflag;
ADDRLP4 1300
ADDRGP4 ctf_redflag
ASGNP4
ADDRGP4 $84
JUMPV
LABELV $83
line 123
;122:		else
;123:			goal = &ctf_blueflag;
ADDRLP4 1300
ADDRGP4 ctf_blueflag
ASGNP4
LABELV $84
line 124
;124:	}
LABELV $81
line 134
;125:#ifdef MISSIONPACK
;126:	else {
;127:		if (BotTeam(bs) == TEAM_RED)
;128:			goal = &redobelisk;
;129:		else
;130:			goal = &blueobelisk;
;131:	}
;132:#endif
;133:
;134:	numteammates = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 135
;135:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 272
CNSTI4 0
ASGNI4
ADDRGP4 $88
JUMPV
LABELV $85
line 136
;136:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
ADDRLP4 272
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 276
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetConfigstring
CALLV
pop
line 138
;137:		// if no config string or no name
;138:		if (!buf[0] || !*Info_ValueForKey(buf, "n"))
ADDRLP4 276
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $92
ADDRLP4 276
ARGP4
ADDRGP4 $68
ARGP4
ADDRLP4 1304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1304
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $90
LABELV $92
line 139
;139:			continue;
ADDRGP4 $86
JUMPV
LABELV $90
line 141
;140:		// skip spectators
;141:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR)
ADDRLP4 276
ARGP4
ADDRGP4 $72
ARGP4
ADDRLP4 1308
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1308
INDIRP4
ARGP4
ADDRLP4 1312
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1312
INDIRI4
CNSTI4 3
NEI4 $93
line 142
;142:			continue;
ADDRGP4 $86
JUMPV
LABELV $93
line 144
;143:		//
;144:		if (BotSameTeam(bs, i) && goal) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 1316
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1316
INDIRI4
CNSTI4 0
EQI4 $95
ADDRLP4 1300
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $95
line 146
;145:			//
;146:			traveltime = BotClientTravelTimeToGoal(i, goal);
ADDRLP4 272
INDIRI4
ARGI4
ADDRLP4 1300
INDIRP4
ARGP4
ADDRLP4 1320
ADDRGP4 BotClientTravelTimeToGoal
CALLI4
ASGNI4
ADDRLP4 268
ADDRLP4 1320
INDIRI4
ASGNI4
line 148
;147:			//
;148:			for (j = 0; j < numteammates; j++) {
ADDRLP4 260
CNSTI4 0
ASGNI4
ADDRGP4 $100
JUMPV
LABELV $97
line 149
;149:				if (traveltime < traveltimes[j]) {
ADDRLP4 268
INDIRI4
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
GEI4 $101
line 150
;150:					for (k = numteammates; k > j; k--) {
ADDRLP4 0
ADDRLP4 264
INDIRI4
ASGNI4
ADDRGP4 $106
JUMPV
LABELV $103
line 151
;151:						traveltimes[k] = traveltimes[k - 1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ASGNI4
line 152
;152:						teammates[k]   = teammates[k - 1];
ADDRLP4 1332
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1332
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
CNSTI4 4
SUBI4
ADDRLP4 1332
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 153
;153:					}
LABELV $104
line 150
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $106
ADDRLP4 0
INDIRI4
ADDRLP4 260
INDIRI4
GTI4 $103
line 154
;154:					break;
ADDRGP4 $99
JUMPV
LABELV $101
line 156
;155:				}
;156:			}
LABELV $98
line 148
ADDRLP4 260
ADDRLP4 260
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $100
ADDRLP4 260
INDIRI4
ADDRLP4 264
INDIRI4
LTI4 $97
LABELV $99
line 157
;157:			traveltimes[j] = traveltime;
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 158
;158:			teammates[j]   = i;
ADDRLP4 260
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ADDRLP4 272
INDIRI4
ASGNI4
line 159
;159:			numteammates++;
ADDRLP4 264
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 160
;160:			if (numteammates >= maxteammates)
ADDRLP4 264
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $108
line 161
;161:				break;
ADDRGP4 $87
JUMPV
LABELV $108
line 162
;162:		}
LABELV $95
line 163
;163:	}
LABELV $86
line 135
ADDRLP4 272
ADDRLP4 272
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $88
ADDRLP4 272
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $85
LABELV $87
line 164
;164:	return numteammates;
ADDRLP4 264
INDIRI4
RETI4
LABELV $80
endproc BotSortTeamMatesByBaseTravelTime 1336 12
export BotSetTeamMateTaskPreference
proc BotSetTeamMateTaskPreference 36 12
line 172
;165:}
;166:
;167:/*
;168:==================
;169:BotSetTeamMateTaskPreference
;170:==================
;171:*/
;172:void BotSetTeamMateTaskPreference(bot_state_t* bs, int teammate, int preference) {
line 175
;173:	char teammatename[MAX_NETNAME];
;174:
;175:	ctftaskpreferences[teammate].preference = preference;
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 176
;176:	ClientName(teammate, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 177
;177:	strcpy(ctftaskpreferences[teammate].name, teammatename);
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 178
;178:}
LABELV $110
endproc BotSetTeamMateTaskPreference 36 12
export BotGetTeamMateTaskPreference
proc BotGetTeamMateTaskPreference 40 12
line 185
;179:
;180:/*
;181:==================
;182:BotGetTeamMateTaskPreference
;183:==================
;184:*/
;185:int BotGetTeamMateTaskPreference(bot_state_t* bs, int teammate) {
line 188
;186:	char teammatename[MAX_NETNAME];
;187:
;188:	if (!ctftaskpreferences[teammate].preference)
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $113
line 189
;189:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $112
JUMPV
LABELV $113
line 190
;190:	ClientName(teammate, teammatename, sizeof(teammatename));
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 191
;191:	if (Q_stricmp(teammatename, ctftaskpreferences[teammate].name))
ADDRLP4 0
ARGP4
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $116
line 192
;192:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $112
JUMPV
LABELV $116
line 193
;193:	return ctftaskpreferences[teammate].preference;
ADDRFP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRGP4 ctftaskpreferences+36
ADDP4
INDIRI4
RETI4
LABELV $112
endproc BotGetTeamMateTaskPreference 40 12
export BotSortTeamMatesByTaskPreference
proc BotSortTeamMatesByTaskPreference 800 12
line 201
;194:}
;195:
;196:/*
;197:==================
;198:BotSortTeamMatesByTaskPreference
;199:==================
;200:*/
;201:int BotSortTeamMatesByTaskPreference(bot_state_t* bs, int* teammates, int numteammates) {
line 207
;202:	int defenders[MAX_CLIENTS], numdefenders;
;203:	int attackers[MAX_CLIENTS], numattackers;
;204:	int roamers[MAX_CLIENTS], numroamers;
;205:	int i, preference;
;206:
;207:	numdefenders = numattackers = numroamers = 0;
ADDRLP4 788
CNSTI4 0
ASGNI4
ADDRLP4 272
ADDRLP4 788
INDIRI4
ASGNI4
ADDRLP4 268
ADDRLP4 788
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 788
INDIRI4
ASGNI4
line 208
;208:	for (i = 0; i < numteammates; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $123
JUMPV
LABELV $120
line 209
;209:		preference = BotGetTeamMateTaskPreference(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 792
ADDRGP4 BotGetTeamMateTaskPreference
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 792
INDIRI4
ASGNI4
line 210
;210:		if (preference & TEAMTP_DEFENDER) {
ADDRLP4 4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $124
line 211
;211:			defenders[numdefenders++] = teammates[i];
ADDRLP4 796
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 796
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 796
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 212
;212:		} else if (preference & TEAMTP_ATTACKER) {
ADDRGP4 $125
JUMPV
LABELV $124
ADDRLP4 4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $126
line 213
;213:			attackers[numattackers++] = teammates[i];
ADDRLP4 796
ADDRLP4 268
INDIRI4
ASGNI4
ADDRLP4 268
ADDRLP4 796
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 796
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 276
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 214
;214:		} else {
ADDRGP4 $127
JUMPV
LABELV $126
line 215
;215:			roamers[numroamers++] = teammates[i];
ADDRLP4 796
ADDRLP4 272
INDIRI4
ASGNI4
ADDRLP4 272
ADDRLP4 796
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 796
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 532
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ASGNI4
line 216
;216:		}
LABELV $127
LABELV $125
line 217
;217:	}
LABELV $121
line 208
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $123
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $120
line 218
;218:	numteammates = 0;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 220
;219:	// defenders at the front of the list
;220:	memcpy(&teammates[numteammates], defenders, numdefenders * sizeof(int));
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
CVIU4 4
CNSTI4 2
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 221
;221:	numteammates += numdefenders;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 223
;222:	// roamers in the middle
;223:	memcpy(&teammates[numteammates], roamers, numroamers * sizeof(int));
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 532
ARGP4
ADDRLP4 272
INDIRI4
CVIU4 4
CNSTI4 2
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 224
;224:	numteammates += numroamers;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 272
INDIRI4
ADDI4
ASGNI4
line 226
;225:	// attacker in the back of the list
;226:	memcpy(&teammates[numteammates], attackers, numattackers * sizeof(int));
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ARGP4
ADDRLP4 276
ARGP4
ADDRLP4 268
INDIRI4
CVIU4 4
CNSTI4 2
LSHU4
CVUI4 4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 227
;227:	numteammates += numattackers;
ADDRFP4 8
ADDRFP4 8
INDIRI4
ADDRLP4 268
INDIRI4
ADDI4
ASGNI4
line 229
;228:
;229:	return numteammates;
ADDRFP4 8
INDIRI4
RETI4
LABELV $119
endproc BotSortTeamMatesByTaskPreference 800 12
export BotSayTeamOrderAlways
proc BotSayTeamOrderAlways 548 20
line 237
;230:}
;231:
;232:/*
;233:==================
;234:BotSayTeamOrders
;235:==================
;236:*/
;237:void BotSayTeamOrderAlways(bot_state_t* bs, int toclient) {
line 243
;238:	char teamchat[MAX_MESSAGE_SIZE];
;239:	char buf[MAX_MESSAGE_SIZE];
;240:	char name[MAX_NETNAME];
;241:
;242:	// if the bot is talking to itself
;243:	if (bs->client == toclient) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
NEI4 $129
line 245
;244:		// don't show the message just put it in the console message queue
;245:		trap_BotGetChatMessage(bs->cs, buf, sizeof(buf));
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRLP4 256
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_BotGetChatMessage
CALLV
pop
line 246
;246:		ClientName(bs->client, name, sizeof(name));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 512
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 247
;247:		Com_sprintf(teamchat, sizeof(teamchat), EC "(%s" EC ")" EC ": %s", name, buf);
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $131
ARGP4
ADDRLP4 512
ARGP4
ADDRLP4 256
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 248
;248:		trap_BotQueueConsoleMessage(bs->cs, CMS_CHAT, teamchat);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_BotQueueConsoleMessage
CALLV
pop
line 249
;249:	} else {
ADDRGP4 $130
JUMPV
LABELV $129
line 250
;250:		trap_BotEnterChat(bs->cs, toclient, CHAT_TELL);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 251
;251:	}
LABELV $130
line 252
;252:}
LABELV $128
endproc BotSayTeamOrderAlways 548 20
export BotSayTeamOrder
proc BotSayTeamOrder 0 8
line 259
;253:
;254:/*
;255:==================
;256:BotSayTeamOrders
;257:==================
;258:*/
;259:void BotSayTeamOrder(bot_state_t* bs, int toclient) {
line 266
;260:#ifdef MISSIONPACK
;261:	// voice chats only
;262:	char buf[MAX_MESSAGE_SIZE];
;263:
;264:	trap_BotGetChatMessage(bs->cs, buf, sizeof(buf));
;265:#else
;266:	BotSayTeamOrderAlways(bs, toclient);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrderAlways
CALLV
pop
line 268
;267:#endif
;268:}
LABELV $132
endproc BotSayTeamOrder 0 8
export BotVoiceChat
proc BotVoiceChat 0 0
line 275
;269:
;270:/*
;271:==================
;272:BotVoiceChat
;273:==================
;274:*/
;275:void BotVoiceChat(bot_state_t* bs, int toclient, char* voicechat) {
line 284
;276:#ifdef MISSIONPACK
;277:	if (toclient == -1)
;278:		// voice only say team
;279:		trap_EA_Command(bs->client, va("vsay_team %s", voicechat));
;280:	else
;281:		// voice only tell single player
;282:		trap_EA_Command(bs->client, va("vtell %d %s", toclient, voicechat));
;283:#endif
;284:}
LABELV $133
endproc BotVoiceChat 0 0
export BotVoiceChatOnly
proc BotVoiceChatOnly 0 0
line 291
;285:
;286:/*
;287:==================
;288:BotVoiceChatOnly
;289:==================
;290:*/
;291:void BotVoiceChatOnly(bot_state_t* bs, int toclient, char* voicechat) {
line 300
;292:#ifdef MISSIONPACK
;293:	if (toclient == -1)
;294:		// voice only say team
;295:		trap_EA_Command(bs->client, va("vosay_team %s", voicechat));
;296:	else
;297:		// voice only tell single player
;298:		trap_EA_Command(bs->client, va("votell %d %s", toclient, voicechat));
;299:#endif
;300:}
LABELV $134
endproc BotVoiceChatOnly 0 0
export BotSayVoiceTeamOrder
proc BotSayVoiceTeamOrder 0 0
line 307
;301:
;302:/*
;303:==================
;304:BotSayVoiceTeamOrder
;305:==================
;306:*/
;307:void BotSayVoiceTeamOrder(bot_state_t* bs, int toclient, char* voicechat) {
line 311
;308:#ifdef MISSIONPACK
;309:	BotVoiceChat(bs, toclient, voicechat);
;310:#endif
;311:}
LABELV $135
endproc BotSayVoiceTeamOrder 0 0
export BotCTFOrders_BothFlagsNotAtBase
proc BotCTFOrders_BothFlagsNotAtBase 364 20
line 318
;312:
;313:/*
;314:==================
;315:BotCTFOrders
;316:==================
;317:*/
;318:void BotCTFOrders_BothFlagsNotAtBase(bot_state_t* bs) {
line 323
;319:	int  numteammates, defenders, attackers, i, other;
;320:	int  teammates[MAX_CLIENTS];
;321:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;322:
;323:	memset(teammates, 0, sizeof(teammates));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 324
;324:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 348
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 348
INDIRI4
ASGNI4
line 325
;325:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 327
;326:	// different orders based on the number of team mates
;327:	switch (bs->numteammates) {
ADDRLP4 352
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ASGNI4
ADDRLP4 352
INDIRI4
CNSTI4 1
EQI4 $138
ADDRLP4 352
INDIRI4
CNSTI4 2
EQI4 $141
ADDRLP4 352
INDIRI4
CNSTI4 3
EQI4 $146
ADDRGP4 $137
JUMPV
line 329
;328:	case 1:
;329:		break;
LABELV $141
line 330
;330:	case 2: {
line 332
;331:		// tell the one not carrying the flag to attack the enemy base
;332:		if (teammates[0] != bs->flagcarrier)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $142
line 333
;333:			other = teammates[0];
ADDRLP4 308
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $142
line 335
;334:		else
;335:			other = teammates[1];
ADDRLP4 308
ADDRLP4 0+4
INDIRI4
ASGNI4
LABELV $143
line 336
;336:		ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 337
;337:		BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 338
;338:		BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 342
;339:#ifdef MISSIONPACK
;340:		BotSayVoiceTeamOrder(bs, other, VOICECHAT_GETFLAG);
;341:#endif
;342:		break;
ADDRGP4 $138
JUMPV
LABELV $146
line 344
;343:	}
;344:	case 3: {
line 346
;345:		// tell the one closest to the base not carrying the flag to accompany the flag carrier
;346:		if (teammates[0] != bs->flagcarrier)
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $147
line 347
;347:			other = teammates[0];
ADDRLP4 308
ADDRLP4 0
INDIRI4
ASGNI4
ADDRGP4 $148
JUMPV
LABELV $147
line 349
;348:		else
;349:			other = teammates[1];
ADDRLP4 308
ADDRLP4 0+4
INDIRI4
ASGNI4
LABELV $148
line 350
;350:		ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 351
;351:		if (bs->flagcarrier != -1) {
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $150
line 352
;352:			ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 353
;353:			if (bs->flagcarrier == bs->client) {
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ADDRLP4 360
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $152
line 354
;354:				BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 358
;355:#ifdef MISSIONPACK
;356:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWME);
;357:#endif
;358:			} else {
ADDRGP4 $151
JUMPV
LABELV $152
line 359
;359:				BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 363
;360:#ifdef MISSIONPACK
;361:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWFLAGCARRIER);
;362:#endif
;363:			}
line 364
;364:		} else {
ADDRGP4 $151
JUMPV
LABELV $150
line 366
;365:			//
;366:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 370
;367:#ifdef MISSIONPACK
;368:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_GETFLAG);
;369:#endif
;370:		}
LABELV $151
line 371
;371:		BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 373
;372:		// tell the one furthest from the the base not carrying the flag to get the enemy flag
;373:		if (teammates[2] != bs->flagcarrier)
ADDRLP4 0+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $156
line 374
;374:			other = teammates[2];
ADDRLP4 308
ADDRLP4 0+8
INDIRI4
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $156
line 376
;375:		else
;376:			other = teammates[1];
ADDRLP4 308
ADDRLP4 0+4
INDIRI4
ASGNI4
LABELV $157
line 377
;377:		ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 378
;378:		BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 379
;379:		BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 383
;380:#ifdef MISSIONPACK
;381:		BotSayVoiceTeamOrder(bs, other, VOICECHAT_RETURNFLAG);
;382:#endif
;383:		break;
ADDRGP4 $138
JUMPV
LABELV $137
line 385
;384:	}
;385:	default: {
line 386
;386:		defenders = (int)(float)numteammates * 0.4 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1053609165
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 387
;387:		if (defenders > 4)
ADDRLP4 300
INDIRI4
CNSTI4 4
LEI4 $161
line 388
;388:			defenders = 4;
ADDRLP4 300
CNSTI4 4
ASGNI4
LABELV $161
line 389
;389:		attackers = (int)(float)numteammates * 0.5 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 390
;390:		if (attackers > 5)
ADDRLP4 304
INDIRI4
CNSTI4 5
LEI4 $163
line 391
;391:			attackers = 5;
ADDRLP4 304
CNSTI4 5
ASGNI4
LABELV $163
line 392
;392:		if (bs->flagcarrier != -1) {
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $165
line 393
;393:			ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 394
;394:			for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $170
JUMPV
LABELV $167
line 396
;395:				//
;396:				if (teammates[i] == bs->flagcarrier) {
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $171
line 397
;397:					continue;
ADDRGP4 $168
JUMPV
LABELV $171
line 400
;398:				}
;399:				//
;400:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 401
;401:				if (bs->flagcarrier == bs->client) {
ADDRLP4 360
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 360
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ADDRLP4 360
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $173
line 402
;402:					BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 406
;403:#ifdef MISSIONPACK
;404:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_FOLLOWME);
;405:#endif
;406:				} else {
ADDRGP4 $174
JUMPV
LABELV $173
line 407
;407:					BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 411
;408:#ifdef MISSIONPACK
;409:					BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_FOLLOWFLAGCARRIER);
;410:#endif
;411:				}
LABELV $174
line 412
;412:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 413
;413:			}
LABELV $168
line 394
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $170
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $167
line 414
;414:		} else {
ADDRGP4 $166
JUMPV
LABELV $165
line 415
;415:			for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $178
JUMPV
LABELV $175
line 417
;416:				//
;417:				if (teammates[i] == bs->flagcarrier) {
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $179
line 418
;418:					continue;
ADDRGP4 $176
JUMPV
LABELV $179
line 421
;419:				}
;420:				//
;421:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 422
;422:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 426
;423:#ifdef MISSIONPACK
;424:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_GETFLAG);
;425:#endif
;426:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 427
;427:			}
LABELV $176
line 415
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $178
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $175
line 428
;428:		}
LABELV $166
line 429
;429:		for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $184
JUMPV
LABELV $181
line 431
;430:			//
;431:			if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $185
line 432
;432:				continue;
ADDRGP4 $182
JUMPV
LABELV $185
line 435
;433:			}
;434:			//
;435:			ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 436
;436:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 437
;437:			BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 441
;438:#ifdef MISSIONPACK
;439:			BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_RETURNFLAG);
;440:#endif
;441:		}
LABELV $182
line 429
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $184
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $181
line 443
;442:		//
;443:		break;
LABELV $138
line 446
;444:	}
;445:	}
;446:}
LABELV $136
endproc BotCTFOrders_BothFlagsNotAtBase 364 20
export BotCTFOrders_FlagNotAtBase
proc BotCTFOrders_FlagNotAtBase 320 16
line 453
;447:
;448:/*
;449:==================
;450:BotCTFOrders
;451:==================
;452:*/
;453:void BotCTFOrders_FlagNotAtBase(bot_state_t* bs) {
line 458
;454:	int  numteammates, defenders, attackers, i;
;455:	int  teammates[MAX_CLIENTS];
;456:	char name[MAX_NETNAME];
;457:
;458:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 308
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 459
;459:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 461
;460:	// passive strategy
;461:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $191
line 463
;462:		// different orders based on the number of team mates
;463:		switch (bs->numteammates) {
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 1
EQI4 $192
ADDRLP4 312
INDIRI4
CNSTI4 2
EQI4 $197
ADDRLP4 312
INDIRI4
CNSTI4 3
EQI4 $201
ADDRGP4 $193
JUMPV
line 465
;464:		case 1:
;465:			break;
LABELV $197
line 466
;466:		case 2: {
line 468
;467:			// both will go for the enemy flag
;468:			ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 469
;469:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 470
;470:			BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 475
;471:#ifdef MISSIONPACK
;472:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
;473:#endif
;474:			//
;475:			ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 476
;476:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 477
;477:			BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 481
;478:#ifdef MISSIONPACK
;479:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;480:#endif
;481:			break;
ADDRGP4 $192
JUMPV
LABELV $201
line 483
;482:		}
;483:		case 3: {
line 485
;484:			// keep one near the base for when the flag is returned
;485:			ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 486
;486:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 487
;487:			BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 492
;488:#ifdef MISSIONPACK
;489:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;490:#endif
;491:			// the other two get the flag
;492:			ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 493
;493:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 494
;494:			BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 499
;495:#ifdef MISSIONPACK
;496:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;497:#endif
;498:			//
;499:			ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 500
;500:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 501
;501:			BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 505
;502:#ifdef MISSIONPACK
;503:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;504:#endif
;505:			break;
ADDRGP4 $192
JUMPV
LABELV $193
line 507
;506:		}
;507:		default: {
line 509
;508:			// keep some people near the base for when the flag is returned
;509:			defenders = (int)(float)numteammates * 0.3 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1050253722
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 510
;510:			if (defenders > 3)
ADDRLP4 300
INDIRI4
CNSTI4 3
LEI4 $206
line 511
;511:				defenders = 3;
ADDRLP4 300
CNSTI4 3
ASGNI4
LABELV $206
line 512
;512:			attackers = (int)(float)numteammates * 0.7 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1060320051
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 513
;513:			if (attackers > 6)
ADDRLP4 304
INDIRI4
CNSTI4 6
LEI4 $208
line 514
;514:				attackers = 6;
ADDRLP4 304
CNSTI4 6
ASGNI4
LABELV $208
line 515
;515:			for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $213
JUMPV
LABELV $210
line 517
;516:				//
;517:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 518
;518:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 519
;519:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 523
;520:#ifdef MISSIONPACK
;521:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;522:#endif
;523:			}
LABELV $211
line 515
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $213
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $210
line 524
;524:			for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $217
JUMPV
LABELV $214
line 526
;525:				//
;526:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 527
;527:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 528
;528:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 532
;529:#ifdef MISSIONPACK
;530:				BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
;531:#endif
;532:			}
LABELV $215
line 524
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $217
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $214
line 534
;533:			//
;534:			break;
line 537
;535:		}
;536:		}
;537:	} else {
ADDRGP4 $192
JUMPV
LABELV $191
line 539
;538:		// different orders based on the number of team mates
;539:		switch (bs->numteammates) {
ADDRLP4 312
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ASGNI4
ADDRLP4 312
INDIRI4
CNSTI4 1
EQI4 $221
ADDRLP4 312
INDIRI4
CNSTI4 2
EQI4 $224
ADDRLP4 312
INDIRI4
CNSTI4 3
EQI4 $227
ADDRGP4 $220
JUMPV
line 541
;540:		case 1:
;541:			break;
LABELV $224
line 542
;542:		case 2: {
line 544
;543:			// both will go for the enemy flag
;544:			ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 545
;545:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 546
;546:			BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 551
;547:#ifdef MISSIONPACK
;548:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
;549:#endif
;550:			//
;551:			ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 552
;552:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 553
;553:			BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 557
;554:#ifdef MISSIONPACK
;555:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;556:#endif
;557:			break;
ADDRGP4 $221
JUMPV
LABELV $227
line 559
;558:		}
;559:		case 3: {
line 561
;560:			// everyone go for the flag
;561:			ClientName(teammates[0], name, sizeof(name));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 562
;562:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 563
;563:			BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 568
;564:#ifdef MISSIONPACK
;565:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_GETFLAG);
;566:#endif
;567:			//
;568:			ClientName(teammates[1], name, sizeof(name));
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 569
;569:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 570
;570:			BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 575
;571:#ifdef MISSIONPACK
;572:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;573:#endif
;574:			//
;575:			ClientName(teammates[2], name, sizeof(name));
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 576
;576:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 577
;577:			BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 581
;578:#ifdef MISSIONPACK
;579:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;580:#endif
;581:			break;
ADDRGP4 $221
JUMPV
LABELV $220
line 583
;582:		}
;583:		default: {
line 585
;584:			// keep some people near the base for when the flag is returned
;585:			defenders = (int)(float)numteammates * 0.2 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1045220557
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 586
;586:			if (defenders > 2)
ADDRLP4 300
INDIRI4
CNSTI4 2
LEI4 $232
line 587
;587:				defenders = 2;
ADDRLP4 300
CNSTI4 2
ASGNI4
LABELV $232
line 588
;588:			attackers = (int)(float)numteammates * 0.7 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1060320051
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 589
;589:			if (attackers > 7)
ADDRLP4 304
INDIRI4
CNSTI4 7
LEI4 $234
line 590
;590:				attackers = 7;
ADDRLP4 304
CNSTI4 7
ASGNI4
LABELV $234
line 591
;591:			for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $239
JUMPV
LABELV $236
line 593
;592:				//
;593:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 594
;594:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 595
;595:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 599
;596:#ifdef MISSIONPACK
;597:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;598:#endif
;599:			}
LABELV $237
line 591
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $239
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $236
line 600
;600:			for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $243
JUMPV
LABELV $240
line 602
;601:				//
;602:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 603
;603:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 604
;604:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 608
;605:#ifdef MISSIONPACK
;606:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;607:#endif
;608:			}
LABELV $241
line 600
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $243
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $240
line 610
;609:			//
;610:			break;
LABELV $221
line 613
;611:		}
;612:		}
;613:	}
LABELV $192
line 614
;614:}
LABELV $190
endproc BotCTFOrders_FlagNotAtBase 320 16
export BotCTFOrders_EnemyFlagNotAtBase
proc BotCTFOrders_EnemyFlagNotAtBase 360 20
line 621
;615:
;616:/*
;617:==================
;618:BotCTFOrders
;619:==================
;620:*/
;621:void BotCTFOrders_EnemyFlagNotAtBase(bot_state_t* bs) {
line 626
;622:	int  numteammates, defenders, attackers, i, other;
;623:	int  teammates[MAX_CLIENTS];
;624:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;625:
;626:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 348
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 348
INDIRI4
ASGNI4
line 627
;627:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 629
;628:	// different orders based on the number of team mates
;629:	switch (numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $248
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $250
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $254
ADDRGP4 $247
JUMPV
line 631
;630:	case 1:
;631:		break;
LABELV $250
line 632
;632:	case 2: {
line 634
;633:		// tell the one not carrying the flag to defend the base
;634:		if (teammates[0] == bs->flagcarrier)
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $251
line 635
;635:			other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
ADDRGP4 $252
JUMPV
LABELV $251
line 637
;636:		else
;637:			other = teammates[0];
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $252
line 638
;638:		ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 639
;639:		BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 640
;640:		BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 644
;641:#ifdef MISSIONPACK
;642:		BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;643:#endif
;644:		break;
ADDRGP4 $248
JUMPV
LABELV $254
line 646
;645:	}
;646:	case 3: {
line 648
;647:		// tell the one closest to the base not carrying the flag to defend the base
;648:		if (teammates[0] != bs->flagcarrier)
ADDRLP4 4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $255
line 649
;649:			other = teammates[0];
ADDRLP4 308
ADDRLP4 4
INDIRI4
ASGNI4
ADDRGP4 $256
JUMPV
LABELV $255
line 651
;650:		else
;651:			other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $256
line 652
;652:		ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 653
;653:		BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 654
;654:		BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 659
;655:#ifdef MISSIONPACK
;656:		BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;657:#endif
;658:		// tell the other also to defend the base
;659:		if (teammates[2] != bs->flagcarrier)
ADDRLP4 4+8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
EQI4 $258
line 660
;660:			other = teammates[2];
ADDRLP4 308
ADDRLP4 4+8
INDIRI4
ASGNI4
ADDRGP4 $259
JUMPV
LABELV $258
line 662
;661:		else
;662:			other = teammates[1];
ADDRLP4 308
ADDRLP4 4+4
INDIRI4
ASGNI4
LABELV $259
line 663
;663:		ClientName(other, name, sizeof(name));
ADDRLP4 308
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 664
;664:		BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 665
;665:		BotSayTeamOrder(bs, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 308
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 669
;666:#ifdef MISSIONPACK
;667:		BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;668:#endif
;669:		break;
ADDRGP4 $248
JUMPV
LABELV $247
line 671
;670:	}
;671:	default: {
line 673
;672:		// 60% will defend the base
;673:		defenders = (int)(float)numteammates * 0.6 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1058642330
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 674
;674:		if (defenders > 6)
ADDRLP4 300
INDIRI4
CNSTI4 6
LEI4 $263
line 675
;675:			defenders = 6;
ADDRLP4 300
CNSTI4 6
ASGNI4
LABELV $263
line 677
;676:		// 30% accompanies the flag carrier
;677:		attackers = (int)(float)numteammates * 0.3 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1050253722
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 678
;678:		if (attackers > 3)
ADDRLP4 304
INDIRI4
CNSTI4 3
LEI4 $265
line 679
;679:			attackers = 3;
ADDRLP4 304
CNSTI4 3
ASGNI4
LABELV $265
line 680
;680:		for (i = 0; i < defenders; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $270
JUMPV
LABELV $267
line 682
;681:			//
;682:			if (teammates[i] == bs->flagcarrier) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $271
line 683
;683:				continue;
ADDRGP4 $268
JUMPV
LABELV $271
line 685
;684:			}
;685:			ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 686
;686:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 687
;687:			BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 691
;688:#ifdef MISSIONPACK
;689:			BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;690:#endif
;691:		}
LABELV $268
line 680
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $270
ADDRLP4 0
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $267
line 693
;692:		// if we have a flag carrier
;693:		if (bs->flagcarrier != -1) {
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $273
line 694
;694:			ClientName(bs->flagcarrier, carriername, sizeof(carriername));
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ARGI4
ADDRLP4 312
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 695
;695:			for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $275
line 697
;696:				//
;697:				if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $279
line 698
;698:					continue;
ADDRGP4 $276
JUMPV
LABELV $279
line 701
;699:				}
;700:				//
;701:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 702
;702:				if (bs->flagcarrier == bs->client) {
ADDRLP4 356
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 356
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
ADDRLP4 356
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $283
line 703
;703:					BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 707
;704:#ifdef MISSIONPACK
;705:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWME);
;706:#endif
;707:				} else {
ADDRGP4 $284
JUMPV
LABELV $283
line 708
;708:					BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 260
ARGP4
ADDRLP4 312
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 712
;709:#ifdef MISSIONPACK
;710:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWFLAGCARRIER);
;711:#endif
;712:				}
LABELV $284
line 713
;713:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 714
;714:			}
LABELV $276
line 695
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $278
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $275
line 715
;715:		} else {
ADDRGP4 $248
JUMPV
LABELV $273
line 716
;716:			for (i = 0; i < attackers; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $289
JUMPV
LABELV $286
line 718
;717:				//
;718:				if (teammates[numteammates - i - 1] == bs->flagcarrier) {
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 6976
ADDP4
INDIRI4
NEI4 $290
line 719
;719:					continue;
ADDRGP4 $287
JUMPV
LABELV $290
line 722
;720:				}
;721:				//
;722:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 723
;723:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 727
;724:#ifdef MISSIONPACK
;725:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;726:#endif
;727:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 728
;728:			}
LABELV $287
line 716
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $289
ADDRLP4 0
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $286
line 729
;729:		}
line 731
;730:		//
;731:		break;
LABELV $248
line 734
;732:	}
;733:	}
;734:}
LABELV $246
endproc BotCTFOrders_EnemyFlagNotAtBase 360 20
export BotCTFOrders_BothFlagsAtBase
proc BotCTFOrders_BothFlagsAtBase 316 16
line 741
;735:
;736:/*
;737:==================
;738:BotCTFOrders
;739:==================
;740:*/
;741:void BotCTFOrders_BothFlagsAtBase(bot_state_t* bs) {
line 746
;742:	int  numteammates, defenders, attackers, i;
;743:	int  teammates[MAX_CLIENTS];
;744:	char name[MAX_NETNAME];
;745:
;746:	memset(teammates, 0, sizeof(teammates));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 256
ARGI4
ADDRGP4 memset
CALLP4
pop
line 748
;747:	// sort team mates by travel time to base
;748:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 308
ADDRGP4 BotSortTeamMatesByBaseTravelTime
CALLI4
ASGNI4
ADDRLP4 296
ADDRLP4 308
INDIRI4
ASGNI4
line 750
;749:	// sort team mates by CTF preference
;750:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 296
INDIRI4
ARGI4
ADDRGP4 BotSortTeamMatesByTaskPreference
CALLI4
pop
line 752
;751:	// passive strategy
;752:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $296
line 754
;753:		// different orders based on the number of team mates
;754:		switch (numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $297
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $301
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $304
ADDRGP4 $298
JUMPV
line 756
;755:		case 1:
;756:			break;
LABELV $301
line 757
;757:		case 2: {
line 759
;758:			// the one closest to the base will defend the base
;759:			ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 760
;760:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 761
;761:			BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 766
;762:#ifdef MISSIONPACK
;763:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;764:#endif
;765:			// the other will get the flag
;766:			ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 767
;767:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 768
;768:			BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 772
;769:#ifdef MISSIONPACK
;770:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;771:#endif
;772:			break;
ADDRGP4 $297
JUMPV
LABELV $304
line 774
;773:		}
;774:		case 3: {
line 776
;775:			// the one closest to the base will defend the base
;776:			ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 777
;777:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 778
;778:			BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 783
;779:#ifdef MISSIONPACK
;780:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;781:#endif
;782:			// the second one closest to the base will defend the base
;783:			ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 784
;784:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 785
;785:			BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 790
;786:#ifdef MISSIONPACK
;787:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;788:#endif
;789:			// the other will get the flag
;790:			ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 791
;791:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 792
;792:			BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 796
;793:#ifdef MISSIONPACK
;794:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;795:#endif
;796:			break;
ADDRGP4 $297
JUMPV
LABELV $298
line 798
;797:		}
;798:		default: {
line 799
;799:			defenders = (int)(float)numteammates * 0.5 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 800
;800:			if (defenders > 5)
ADDRLP4 300
INDIRI4
CNSTI4 5
LEI4 $309
line 801
;801:				defenders = 5;
ADDRLP4 300
CNSTI4 5
ASGNI4
LABELV $309
line 802
;802:			attackers = (int)(float)numteammates * 0.4 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1053609165
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 803
;803:			if (attackers > 4)
ADDRLP4 304
INDIRI4
CNSTI4 4
LEI4 $311
line 804
;804:				attackers = 4;
ADDRLP4 304
CNSTI4 4
ASGNI4
LABELV $311
line 805
;805:			for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $316
JUMPV
LABELV $313
line 807
;806:				//
;807:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 808
;808:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 809
;809:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 813
;810:#ifdef MISSIONPACK
;811:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;812:#endif
;813:			}
LABELV $314
line 805
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $316
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $313
line 814
;814:			for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $320
JUMPV
LABELV $317
line 816
;815:				//
;816:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 817
;817:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 818
;818:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 822
;819:#ifdef MISSIONPACK
;820:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;821:#endif
;822:			}
LABELV $318
line 814
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $320
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $317
line 824
;823:			//
;824:			break;
line 827
;825:		}
;826:		}
;827:	} else {
ADDRGP4 $297
JUMPV
LABELV $296
line 829
;828:		// different orders based on the number of team mates
;829:		switch (numteammates) {
ADDRLP4 296
INDIRI4
CNSTI4 1
EQI4 $324
ADDRLP4 296
INDIRI4
CNSTI4 2
EQI4 $326
ADDRLP4 296
INDIRI4
CNSTI4 3
EQI4 $329
ADDRGP4 $323
JUMPV
line 831
;830:		case 1:
;831:			break;
LABELV $326
line 832
;832:		case 2: {
line 834
;833:			// the one closest to the base will defend the base
;834:			ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 835
;835:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 836
;836:			BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 841
;837:#ifdef MISSIONPACK
;838:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;839:#endif
;840:			// the other will get the flag
;841:			ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 842
;842:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 843
;843:			BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 847
;844:#ifdef MISSIONPACK
;845:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;846:#endif
;847:			break;
ADDRGP4 $324
JUMPV
LABELV $329
line 849
;848:		}
;849:		case 3: {
line 851
;850:			// the one closest to the base will defend the base
;851:			ClientName(teammates[0], name, sizeof(name));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 852
;852:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 853
;853:			BotSayTeamOrder(bs, teammates[0]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 858
;854:#ifdef MISSIONPACK
;855:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;856:#endif
;857:			// the others should go for the enemy flag
;858:			ClientName(teammates[1], name, sizeof(name));
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 859
;859:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 860
;860:			BotSayTeamOrder(bs, teammates[1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 865
;861:#ifdef MISSIONPACK
;862:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;863:#endif
;864:			//
;865:			ClientName(teammates[2], name, sizeof(name));
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 866
;866:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 867
;867:			BotSayTeamOrder(bs, teammates[2]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+8
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 871
;868:#ifdef MISSIONPACK
;869:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;870:#endif
;871:			break;
ADDRGP4 $324
JUMPV
LABELV $323
line 873
;872:		}
;873:		default: {
line 874
;874:			defenders = (int)(float)numteammates * 0.4 + 0.5;
ADDRLP4 300
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1053609165
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 875
;875:			if (defenders > 4)
ADDRLP4 300
INDIRI4
CNSTI4 4
LEI4 $334
line 876
;876:				defenders = 4;
ADDRLP4 300
CNSTI4 4
ASGNI4
LABELV $334
line 877
;877:			attackers = (int)(float)numteammates * 0.5 + 0.5;
ADDRLP4 304
ADDRLP4 296
INDIRI4
CVIF4 4
CVFI4 4
CVIF4 4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
CVFI4 4
ASGNI4
line 878
;878:			if (attackers > 5)
ADDRLP4 304
INDIRI4
CNSTI4 5
LEI4 $336
line 879
;879:				attackers = 5;
ADDRLP4 304
CNSTI4 5
ASGNI4
LABELV $336
line 880
;880:			for (i = 0; i < defenders; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $341
JUMPV
LABELV $338
line 882
;881:				//
;882:				ClientName(teammates[i], name, sizeof(name));
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 883
;883:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $198
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 884
;884:				BotSayTeamOrder(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 256
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 888
;885:#ifdef MISSIONPACK
;886:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;887:#endif
;888:			}
LABELV $339
line 880
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $341
ADDRLP4 256
INDIRI4
ADDRLP4 300
INDIRI4
LTI4 $338
line 889
;889:			for (i = 0; i < attackers; i++) {
ADDRLP4 256
CNSTI4 0
ASGNI4
ADDRGP4 $345
JUMPV
LABELV $342
line 891
;890:				//
;891:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRLP4 260
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 892
;892:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $145
ARGP4
ADDRLP4 260
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 893
;893:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 296
INDIRI4
ADDRLP4 256
INDIRI4
SUBI4
CNSTI4 2
LSHI4
ADDRLP4 0-4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrder
CALLV
pop
line 897
;894:#ifdef MISSIONPACK
;895:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;896:#endif
;897:			}
LABELV $343
line 889
ADDRLP4 256
ADDRLP4 256
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $345
ADDRLP4 256
INDIRI4
ADDRLP4 304
INDIRI4
LTI4 $342
line 899
;898:			//
;899:			break;
LABELV $324
line 902
;900:		}
;901:		}
;902:	}
LABELV $297
line 903
;903:}
LABELV $295
endproc BotCTFOrders_BothFlagsAtBase 316 16
export BotCTFOrders
proc BotCTFOrders 20 4
line 910
;904:
;905:/*
;906:==================
;907:BotCTFOrders
;908:==================
;909:*/
;910:void BotCTFOrders(bot_state_t* bs) {
line 914
;911:	int flagstatus;
;912:
;913:	//
;914:	if (BotTeam(bs) == TEAM_RED)
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 BotTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
NEI4 $349
line 915
;915:		flagstatus = bs->redflagstatus * 2 + bs->blueflagstatus;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $350
JUMPV
LABELV $349
line 917
;916:	else
;917:		flagstatus = bs->blueflagstatus * 2 + bs->redflagstatus;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
CNSTI4 6960
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ADDRLP4 12
INDIRP4
CNSTI4 6956
ADDP4
INDIRI4
ADDI4
ASGNI4
LABELV $350
line 919
;918:	//
;919:	switch (flagstatus) {
ADDRLP4 16
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $351
ADDRLP4 16
INDIRI4
CNSTI4 3
GTI4 $351
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $357
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $357
address $353
address $354
address $355
address $356
code
LABELV $353
line 921
;920:	case 0:
;921:		BotCTFOrders_BothFlagsAtBase(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_BothFlagsAtBase
CALLV
pop
line 922
;922:		break;
ADDRGP4 $352
JUMPV
LABELV $354
line 924
;923:	case 1:
;924:		BotCTFOrders_EnemyFlagNotAtBase(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_EnemyFlagNotAtBase
CALLV
pop
line 925
;925:		break;
ADDRGP4 $352
JUMPV
LABELV $355
line 927
;926:	case 2:
;927:		BotCTFOrders_FlagNotAtBase(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_FlagNotAtBase
CALLV
pop
line 928
;928:		break;
ADDRGP4 $352
JUMPV
LABELV $356
line 930
;929:	case 3:
;930:		BotCTFOrders_BothFlagsNotAtBase(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders_BothFlagsNotAtBase
CALLV
pop
line 931
;931:		break;
LABELV $351
LABELV $352
line 933
;932:	}
;933:}
LABELV $348
endproc BotCTFOrders 20 4
export BotCreateGroup
proc BotCreateGroup 76 20
line 940
;934:
;935:/*
;936:==================
;937:BotCreateGroup
;938:==================
;939:*/
;940:void BotCreateGroup(bot_state_t* bs, int* teammates, int groupsize) {
line 945
;941:	char name[MAX_NETNAME], leadername[MAX_NETNAME];
;942:	int  i;
;943:
;944:	// the others in the group will follow the teammates[0]
;945:	ClientName(teammates[0], leadername, sizeof(leadername));
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 40
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 946
;946:	for (i = 1; i < groupsize; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $362
JUMPV
LABELV $359
line 947
;947:		ClientName(teammates[i], name, sizeof(name));
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 948
;948:		if (teammates[0] == bs->client) {
ADDRFP4 4
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
NEI4 $363
line 949
;949:			BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $154
ARGP4
ADDRLP4 4
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 950
;950:		} else {
ADDRGP4 $364
JUMPV
LABELV $363
line 951
;951:			BotAI_BotInitialChat(bs, "cmd_accompany", name, leadername, NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 40
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 952
;952:		}
LABELV $364
line 953
;953:		BotSayTeamOrderAlways(bs, teammates[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI4
ARGI4
ADDRGP4 BotSayTeamOrderAlways
CALLV
pop
line 954
;954:	}
LABELV $360
line 946
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $362
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $359
line 955
;955:}
LABELV $358
endproc BotCreateGroup 76 20
export BotTeamOrders
proc BotTeamOrders 1304 12
line 964
;956:
;957:/*
;958:==================
;959:BotTeamOrders
;960:
;961:  FIXME: defend key areas?
;962:==================
;963:*/
;964:void BotTeamOrders(bot_state_t* bs) {
line 969
;965:	int  teammates[MAX_CLIENTS];
;966:	int  numteammates, i;
;967:	char buf[MAX_INFO_STRING];
;968:
;969:	numteammates = 0;
ADDRLP4 1028
CNSTI4 0
ASGNI4
line 970
;970:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $369
JUMPV
LABELV $366
line 971
;971:		trap_GetConfigstring(CS_PLAYERS + i, buf, sizeof(buf));
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
line 973
;972:		// if no config string or no name
;973:		if (!buf[0] || !*Info_ValueForKey(buf, "n"))
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $373
ADDRLP4 0
ARGP4
ADDRGP4 $68
ARGP4
ADDRLP4 1288
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1288
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $371
LABELV $373
line 974
;974:			continue;
ADDRGP4 $367
JUMPV
LABELV $371
line 976
;975:		// skip spectators
;976:		if (atoi(Info_ValueForKey(buf, "t")) == TEAM_SPECTATOR)
ADDRLP4 0
ARGP4
ADDRGP4 $72
ARGP4
ADDRLP4 1292
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1292
INDIRP4
ARGP4
ADDRLP4 1296
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1296
INDIRI4
CNSTI4 3
NEI4 $374
line 977
;977:			continue;
ADDRGP4 $367
JUMPV
LABELV $374
line 979
;978:		//
;979:		if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 1300
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 1300
INDIRI4
CNSTI4 0
EQI4 $376
line 980
;980:			teammates[numteammates] = i;
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
ADDRLP4 1024
INDIRI4
ASGNI4
line 981
;981:			numteammates++;
ADDRLP4 1028
ADDRLP4 1028
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 982
;982:		}
LABELV $376
line 983
;983:	}
LABELV $367
line 970
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $369
ADDRLP4 1024
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $366
line 985
;984:	//
;985:	switch (numteammates) {
ADDRLP4 1028
INDIRI4
CNSTI4 1
LTI4 $378
ADDRLP4 1028
INDIRI4
CNSTI4 5
GTI4 $378
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $393-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $393
address $379
address $379
address $382
address $383
address $385
code
line 987
;986:	case 1:
;987:		break;
line 988
;988:	case 2: {
line 990
;989:		// nothing special
;990:		break;
LABELV $382
line 992
;991:	}
;992:	case 3: {
line 994
;993:		// have one follow another and one free roaming
;994:		BotCreateGroup(bs, teammates, 2);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 995
;995:		break;
ADDRGP4 $379
JUMPV
LABELV $383
line 997
;996:	}
;997:	case 4: {
line 998
;998:		BotCreateGroup(bs, teammates, 2);      // a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 999
;999:		BotCreateGroup(bs, &teammates[2], 2);  // a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032+8
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 1000
;1000:		break;
ADDRGP4 $379
JUMPV
LABELV $385
line 1002
;1001:	}
;1002:	case 5: {
line 1003
;1003:		BotCreateGroup(bs, teammates, 2);      // a group of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 1004
;1004:		BotCreateGroup(bs, &teammates[2], 3);  // a group of 3
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1032+8
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 1005
;1005:		break;
ADDRGP4 $379
JUMPV
LABELV $378
line 1007
;1006:	}
;1007:	default: {
line 1008
;1008:		if (numteammates <= 10) {
ADDRLP4 1028
INDIRI4
CNSTI4 10
GTI4 $379
line 1009
;1009:			for (i = 0; i < numteammates / 2; i++) {
ADDRLP4 1024
CNSTI4 0
ASGNI4
ADDRGP4 $392
JUMPV
LABELV $389
line 1010
;1010:				BotCreateGroup(bs, &teammates[i * 2], 2);  // groups of 2
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1024
INDIRI4
CNSTI4 1
LSHI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRGP4 BotCreateGroup
CALLV
pop
line 1011
;1011:			}
LABELV $390
line 1009
ADDRLP4 1024
ADDRLP4 1024
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $392
ADDRLP4 1024
INDIRI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
DIVI4
LTI4 $389
line 1012
;1012:		}
line 1013
;1013:		break;
LABELV $379
line 1016
;1014:	}
;1015:	}
;1016:}
LABELV $365
endproc BotTeamOrders 1304 12
export FindHumanTeamLeader
proc FindHumanTeamLeader 12 12
line 1987
;1017:
;1018:#ifdef MISSIONPACK
;1019:
;1020:/*
;1021:==================
;1022:Bot1FCTFOrders_FlagAtCenter
;1023:
;1024:  X% defend the base, Y% get the flag
;1025:==================
;1026:*/
;1027:void Bot1FCTFOrders_FlagAtCenter(bot_state_t* bs) {
;1028:	int  numteammates, defenders, attackers, i;
;1029:	int  teammates[MAX_CLIENTS];
;1030:	char name[MAX_NETNAME];
;1031:
;1032:	// sort team mates by travel time to base
;1033:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1034:	// sort team mates by CTF preference
;1035:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1036:	// passive strategy
;1037:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1038:		// different orders based on the number of team mates
;1039:		switch (numteammates) {
;1040:		case 1:
;1041:			break;
;1042:		case 2: {
;1043:			// the one closest to the base will defend the base
;1044:			ClientName(teammates[0], name, sizeof(name));
;1045:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1046:			BotSayTeamOrder(bs, teammates[0]);
;1047:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1048:			// the other will get the flag
;1049:			ClientName(teammates[1], name, sizeof(name));
;1050:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1051:			BotSayTeamOrder(bs, teammates[1]);
;1052:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1053:			break;
;1054:		}
;1055:		case 3: {
;1056:			// the one closest to the base will defend the base
;1057:			ClientName(teammates[0], name, sizeof(name));
;1058:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1059:			BotSayTeamOrder(bs, teammates[0]);
;1060:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1061:			// the second one closest to the base will defend the base
;1062:			ClientName(teammates[1], name, sizeof(name));
;1063:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1064:			BotSayTeamOrder(bs, teammates[1]);
;1065:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1066:			// the other will get the flag
;1067:			ClientName(teammates[2], name, sizeof(name));
;1068:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1069:			BotSayTeamOrder(bs, teammates[2]);
;1070:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1071:			break;
;1072:		}
;1073:		default: {
;1074:			// 50% defend the base
;1075:			defenders = (int)(float)numteammates * 0.5 + 0.5;
;1076:			if (defenders > 5)
;1077:				defenders = 5;
;1078:			// 40% get the flag
;1079:			attackers = (int)(float)numteammates * 0.4 + 0.5;
;1080:			if (attackers > 4)
;1081:				attackers = 4;
;1082:			for (i = 0; i < defenders; i++) {
;1083:				//
;1084:				ClientName(teammates[i], name, sizeof(name));
;1085:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1086:				BotSayTeamOrder(bs, teammates[i]);
;1087:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1088:			}
;1089:			for (i = 0; i < attackers; i++) {
;1090:				//
;1091:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1092:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1093:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1094:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1095:			}
;1096:			//
;1097:			break;
;1098:		}
;1099:		}
;1100:	} else {  // agressive
;1101:		// different orders based on the number of team mates
;1102:		switch (numteammates) {
;1103:		case 1:
;1104:			break;
;1105:		case 2: {
;1106:			// the one closest to the base will defend the base
;1107:			ClientName(teammates[0], name, sizeof(name));
;1108:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1109:			BotSayTeamOrder(bs, teammates[0]);
;1110:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1111:			// the other will get the flag
;1112:			ClientName(teammates[1], name, sizeof(name));
;1113:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1114:			BotSayTeamOrder(bs, teammates[1]);
;1115:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1116:			break;
;1117:		}
;1118:		case 3: {
;1119:			// the one closest to the base will defend the base
;1120:			ClientName(teammates[0], name, sizeof(name));
;1121:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1122:			BotSayTeamOrder(bs, teammates[0]);
;1123:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1124:			// the others should go for the enemy flag
;1125:			ClientName(teammates[1], name, sizeof(name));
;1126:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1127:			BotSayTeamOrder(bs, teammates[1]);
;1128:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1129:			//
;1130:			ClientName(teammates[2], name, sizeof(name));
;1131:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1132:			BotSayTeamOrder(bs, teammates[2]);
;1133:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1134:			break;
;1135:		}
;1136:		default: {
;1137:			// 30% defend the base
;1138:			defenders = (int)(float)numteammates * 0.3 + 0.5;
;1139:			if (defenders > 3)
;1140:				defenders = 3;
;1141:			// 60% get the flag
;1142:			attackers = (int)(float)numteammates * 0.6 + 0.5;
;1143:			if (attackers > 6)
;1144:				attackers = 6;
;1145:			for (i = 0; i < defenders; i++) {
;1146:				//
;1147:				ClientName(teammates[i], name, sizeof(name));
;1148:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1149:				BotSayTeamOrder(bs, teammates[i]);
;1150:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1151:			}
;1152:			for (i = 0; i < attackers; i++) {
;1153:				//
;1154:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1155:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1156:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1157:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1158:			}
;1159:			//
;1160:			break;
;1161:		}
;1162:		}
;1163:	}
;1164:}
;1165:
;1166:/*
;1167:==================
;1168:Bot1FCTFOrders_TeamHasFlag
;1169:
;1170:  X% towards neutral flag, Y% go towards enemy base and accompany flag carrier if visible
;1171:==================
;1172:*/
;1173:void Bot1FCTFOrders_TeamHasFlag(bot_state_t* bs) {
;1174:	int  numteammates, defenders, attackers, i, other;
;1175:	int  teammates[MAX_CLIENTS];
;1176:	char name[MAX_NETNAME], carriername[MAX_NETNAME];
;1177:
;1178:	// sort team mates by travel time to base
;1179:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1180:	// sort team mates by CTF preference
;1181:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1182:	// passive strategy
;1183:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1184:		// different orders based on the number of team mates
;1185:		switch (numteammates) {
;1186:		case 1:
;1187:			break;
;1188:		case 2: {
;1189:			// tell the one not carrying the flag to attack the enemy base
;1190:			if (teammates[0] == bs->flagcarrier)
;1191:				other = teammates[1];
;1192:			else
;1193:				other = teammates[0];
;1194:			ClientName(other, name, sizeof(name));
;1195:			BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1196:			BotSayTeamOrder(bs, other);
;1197:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_OFFENSE);
;1198:			break;
;1199:		}
;1200:		case 3: {
;1201:			// tell the one closest to the base not carrying the flag to defend the base
;1202:			if (teammates[0] != bs->flagcarrier)
;1203:				other = teammates[0];
;1204:			else
;1205:				other = teammates[1];
;1206:			ClientName(other, name, sizeof(name));
;1207:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1208:			BotSayTeamOrder(bs, other);
;1209:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;1210:			// tell the one furthest from the base not carrying the flag to accompany the flag carrier
;1211:			if (teammates[2] != bs->flagcarrier)
;1212:				other = teammates[2];
;1213:			else
;1214:				other = teammates[1];
;1215:			ClientName(other, name, sizeof(name));
;1216:			if (bs->flagcarrier != -1) {
;1217:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
;1218:				if (bs->flagcarrier == bs->client) {
;1219:					BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
;1220:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWME);
;1221:				} else {
;1222:					BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
;1223:					BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWFLAGCARRIER);
;1224:				}
;1225:			} else {
;1226:				//
;1227:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1228:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_GETFLAG);
;1229:			}
;1230:			BotSayTeamOrder(bs, other);
;1231:			break;
;1232:		}
;1233:		default: {
;1234:			// 30% will defend the base
;1235:			defenders = (int)(float)numteammates * 0.3 + 0.5;
;1236:			if (defenders > 3)
;1237:				defenders = 3;
;1238:			// 70% accompanies the flag carrier
;1239:			attackers = (int)(float)numteammates * 0.7 + 0.5;
;1240:			if (attackers > 7)
;1241:				attackers = 7;
;1242:			for (i = 0; i < defenders; i++) {
;1243:				//
;1244:				if (teammates[i] == bs->flagcarrier) {
;1245:					continue;
;1246:				}
;1247:				ClientName(teammates[i], name, sizeof(name));
;1248:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1249:				BotSayTeamOrder(bs, teammates[i]);
;1250:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1251:			}
;1252:			if (bs->flagcarrier != -1) {
;1253:				ClientName(bs->flagcarrier, carriername, sizeof(carriername));
;1254:				for (i = 0; i < attackers; i++) {
;1255:					//
;1256:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
;1257:						continue;
;1258:					}
;1259:					//
;1260:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1261:					if (bs->flagcarrier == bs->client) {
;1262:						BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
;1263:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWME);
;1264:					} else {
;1265:						BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
;1266:						BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWFLAGCARRIER);
;1267:					}
;1268:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1269:				}
;1270:			} else {
;1271:				for (i = 0; i < attackers; i++) {
;1272:					//
;1273:					if (teammates[numteammates - i - 1] == bs->flagcarrier) {
;1274:						continue;
;1275:					}
;1276:					//
;1277:					ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1278:					BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1279:					BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1280:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1281:				}
;1282:			}
;1283:			//
;1284:			break;
;1285:		}
;1286:		}
;1287:	} else {  // agressive
;1288:		// different orders based on the number of team mates
;1289:		switch (numteammates) {
;1290:		case 1:
;1291:			break;
;1292:		case 2: {
;1293:			// tell the one not carrying the flag to defend the base
;1294:			if (teammates[0] == bs->flagcarrier)
;1295:				other = teammates[1];
;1296:			else
;1297:				other = teammates[0];
;1298:			ClientName(other, name, sizeof(name));
;1299:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1300:			BotSayTeamOrder(bs, other);
;1301:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;1302:			break;
;1303:		}
;1304:		case 3: {
;1305:			// tell the one closest to the base not carrying the flag to defend the base
;1306:			if (teammates[0] != bs->flagcarrier)
;1307:				other = teammates[0];
;1308:			else
;1309:				other = teammates[1];
;1310:			ClientName(other, name, sizeof(name));
;1311:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1312:			BotSayTeamOrder(bs, other);
;1313:			BotSayVoiceTeamOrder(bs, other, VOICECHAT_DEFEND);
;1314:			// tell the one furthest from the base not carrying the flag to accompany the flag carrier
;1315:			if (teammates[2] != bs->flagcarrier)
;1316:				other = teammates[2];
;1317:			else
;1318:				other = teammates[1];
;1319:			ClientName(other, name, sizeof(name));
;1320:			ClientName(bs->flagcarrier, carriername, sizeof(carriername));
;1321:			if (bs->flagcarrier == bs->client) {
;1322:				BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
;1323:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWME);
;1324:			} else {
;1325:				BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
;1326:				BotSayVoiceTeamOrder(bs, other, VOICECHAT_FOLLOWFLAGCARRIER);
;1327:			}
;1328:			BotSayTeamOrder(bs, other);
;1329:			break;
;1330:		}
;1331:		default: {
;1332:			// 20% will defend the base
;1333:			defenders = (int)(float)numteammates * 0.2 + 0.5;
;1334:			if (defenders > 2)
;1335:				defenders = 2;
;1336:			// 80% accompanies the flag carrier
;1337:			attackers = (int)(float)numteammates * 0.8 + 0.5;
;1338:			if (attackers > 8)
;1339:				attackers = 8;
;1340:			for (i = 0; i < defenders; i++) {
;1341:				//
;1342:				if (teammates[i] == bs->flagcarrier) {
;1343:					continue;
;1344:				}
;1345:				ClientName(teammates[i], name, sizeof(name));
;1346:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1347:				BotSayTeamOrder(bs, teammates[i]);
;1348:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1349:			}
;1350:			ClientName(bs->flagcarrier, carriername, sizeof(carriername));
;1351:			for (i = 0; i < attackers; i++) {
;1352:				//
;1353:				if (teammates[numteammates - i - 1] == bs->flagcarrier) {
;1354:					continue;
;1355:				}
;1356:				//
;1357:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1358:				if (bs->flagcarrier == bs->client) {
;1359:					BotAI_BotInitialChat(bs, "cmd_accompanyme", name, NULL);
;1360:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWME);
;1361:				} else {
;1362:					BotAI_BotInitialChat(bs, "cmd_accompany", name, carriername, NULL);
;1363:					BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_FOLLOWFLAGCARRIER);
;1364:				}
;1365:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1366:			}
;1367:			//
;1368:			break;
;1369:		}
;1370:		}
;1371:	}
;1372:}
;1373:
;1374:/*
;1375:==================
;1376:Bot1FCTFOrders_EnemyHasFlag
;1377:
;1378:  X% defend the base, Y% towards neutral flag
;1379:==================
;1380:*/
;1381:void Bot1FCTFOrders_EnemyHasFlag(bot_state_t* bs) {
;1382:	int  numteammates, defenders, attackers, i;
;1383:	int  teammates[MAX_CLIENTS];
;1384:	char name[MAX_NETNAME];
;1385:
;1386:	// sort team mates by travel time to base
;1387:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1388:	// sort team mates by CTF preference
;1389:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1390:	// passive strategy
;1391:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1392:		// different orders based on the number of team mates
;1393:		switch (numteammates) {
;1394:		case 1:
;1395:			break;
;1396:		case 2: {
;1397:			// both defend the base
;1398:			ClientName(teammates[0], name, sizeof(name));
;1399:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1400:			BotSayTeamOrder(bs, teammates[0]);
;1401:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1402:			//
;1403:			ClientName(teammates[1], name, sizeof(name));
;1404:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1405:			BotSayTeamOrder(bs, teammates[1]);
;1406:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1407:			break;
;1408:		}
;1409:		case 3: {
;1410:			// the one closest to the base will defend the base
;1411:			ClientName(teammates[0], name, sizeof(name));
;1412:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1413:			BotSayTeamOrder(bs, teammates[0]);
;1414:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1415:			// the second one closest to the base will defend the base
;1416:			ClientName(teammates[1], name, sizeof(name));
;1417:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1418:			BotSayTeamOrder(bs, teammates[1]);
;1419:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1420:			// the other will also defend the base
;1421:			ClientName(teammates[2], name, sizeof(name));
;1422:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1423:			BotSayTeamOrder(bs, teammates[2]);
;1424:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_DEFEND);
;1425:			break;
;1426:		}
;1427:		default: {
;1428:			// 80% will defend the base
;1429:			defenders = (int)(float)numteammates * 0.8 + 0.5;
;1430:			if (defenders > 8)
;1431:				defenders = 8;
;1432:			// 10% will try to return the flag
;1433:			attackers = (int)(float)numteammates * 0.1 + 0.5;
;1434:			if (attackers > 1)
;1435:				attackers = 1;
;1436:			for (i = 0; i < defenders; i++) {
;1437:				//
;1438:				ClientName(teammates[i], name, sizeof(name));
;1439:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1440:				BotSayTeamOrder(bs, teammates[i]);
;1441:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1442:			}
;1443:			for (i = 0; i < attackers; i++) {
;1444:				//
;1445:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1446:				BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
;1447:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1448:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1449:			}
;1450:			//
;1451:			break;
;1452:		}
;1453:		}
;1454:	} else {  // agressive
;1455:		// different orders based on the number of team mates
;1456:		switch (numteammates) {
;1457:		case 1:
;1458:			break;
;1459:		case 2: {
;1460:			// the one closest to the base will defend the base
;1461:			ClientName(teammates[0], name, sizeof(name));
;1462:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1463:			BotSayTeamOrder(bs, teammates[0]);
;1464:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1465:			// the other will get the flag
;1466:			ClientName(teammates[1], name, sizeof(name));
;1467:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1468:			BotSayTeamOrder(bs, teammates[1]);
;1469:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1470:			break;
;1471:		}
;1472:		case 3: {
;1473:			// the one closest to the base will defend the base
;1474:			ClientName(teammates[0], name, sizeof(name));
;1475:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1476:			BotSayTeamOrder(bs, teammates[0]);
;1477:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1478:			// the others should go for the enemy flag
;1479:			ClientName(teammates[1], name, sizeof(name));
;1480:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1481:			BotSayTeamOrder(bs, teammates[1]);
;1482:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1483:			//
;1484:			ClientName(teammates[2], name, sizeof(name));
;1485:			BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
;1486:			BotSayTeamOrder(bs, teammates[2]);
;1487:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1488:			break;
;1489:		}
;1490:		default: {
;1491:			// 70% defend the base
;1492:			defenders = (int)(float)numteammates * 0.7 + 0.5;
;1493:			if (defenders > 7)
;1494:				defenders = 7;
;1495:			// 20% try to return the flag
;1496:			attackers = (int)(float)numteammates * 0.2 + 0.5;
;1497:			if (attackers > 2)
;1498:				attackers = 2;
;1499:			for (i = 0; i < defenders; i++) {
;1500:				//
;1501:				ClientName(teammates[i], name, sizeof(name));
;1502:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1503:				BotSayTeamOrder(bs, teammates[i]);
;1504:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1505:			}
;1506:			for (i = 0; i < attackers; i++) {
;1507:				//
;1508:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1509:				BotAI_BotInitialChat(bs, "cmd_returnflag", name, NULL);
;1510:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1511:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1512:			}
;1513:			//
;1514:			break;
;1515:		}
;1516:		}
;1517:	}
;1518:}
;1519:
;1520:/*
;1521:==================
;1522:Bot1FCTFOrders_EnemyDroppedFlag
;1523:
;1524:  X% defend the base, Y% get the flag
;1525:==================
;1526:*/
;1527:void Bot1FCTFOrders_EnemyDroppedFlag(bot_state_t* bs) {
;1528:	int  numteammates, defenders, attackers, i;
;1529:	int  teammates[MAX_CLIENTS];
;1530:	char name[MAX_NETNAME];
;1531:
;1532:	// sort team mates by travel time to base
;1533:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1534:	// sort team mates by CTF preference
;1535:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1536:	// passive strategy
;1537:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1538:		// different orders based on the number of team mates
;1539:		switch (numteammates) {
;1540:		case 1:
;1541:			break;
;1542:		case 2: {
;1543:			// the one closest to the base will defend the base
;1544:			ClientName(teammates[0], name, sizeof(name));
;1545:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1546:			BotSayTeamOrder(bs, teammates[0]);
;1547:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1548:			// the other will get the flag
;1549:			ClientName(teammates[1], name, sizeof(name));
;1550:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1551:			BotSayTeamOrder(bs, teammates[1]);
;1552:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1553:			break;
;1554:		}
;1555:		case 3: {
;1556:			// the one closest to the base will defend the base
;1557:			ClientName(teammates[0], name, sizeof(name));
;1558:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1559:			BotSayTeamOrder(bs, teammates[0]);
;1560:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1561:			// the second one closest to the base will defend the base
;1562:			ClientName(teammates[1], name, sizeof(name));
;1563:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1564:			BotSayTeamOrder(bs, teammates[1]);
;1565:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1566:			// the other will get the flag
;1567:			ClientName(teammates[2], name, sizeof(name));
;1568:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1569:			BotSayTeamOrder(bs, teammates[2]);
;1570:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1571:			break;
;1572:		}
;1573:		default: {
;1574:			// 50% defend the base
;1575:			defenders = (int)(float)numteammates * 0.5 + 0.5;
;1576:			if (defenders > 5)
;1577:				defenders = 5;
;1578:			// 40% get the flag
;1579:			attackers = (int)(float)numteammates * 0.4 + 0.5;
;1580:			if (attackers > 4)
;1581:				attackers = 4;
;1582:			for (i = 0; i < defenders; i++) {
;1583:				//
;1584:				ClientName(teammates[i], name, sizeof(name));
;1585:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1586:				BotSayTeamOrder(bs, teammates[i]);
;1587:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1588:			}
;1589:			for (i = 0; i < attackers; i++) {
;1590:				//
;1591:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1592:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1593:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1594:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1595:			}
;1596:			//
;1597:			break;
;1598:		}
;1599:		}
;1600:	} else {  // agressive
;1601:		// different orders based on the number of team mates
;1602:		switch (numteammates) {
;1603:		case 1:
;1604:			break;
;1605:		case 2: {
;1606:			// the one closest to the base will defend the base
;1607:			ClientName(teammates[0], name, sizeof(name));
;1608:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1609:			BotSayTeamOrder(bs, teammates[0]);
;1610:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1611:			// the other will get the flag
;1612:			ClientName(teammates[1], name, sizeof(name));
;1613:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1614:			BotSayTeamOrder(bs, teammates[1]);
;1615:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1616:			break;
;1617:		}
;1618:		case 3: {
;1619:			// the one closest to the base will defend the base
;1620:			ClientName(teammates[0], name, sizeof(name));
;1621:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1622:			BotSayTeamOrder(bs, teammates[0]);
;1623:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1624:			// the others should go for the enemy flag
;1625:			ClientName(teammates[1], name, sizeof(name));
;1626:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1627:			BotSayTeamOrder(bs, teammates[1]);
;1628:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_GETFLAG);
;1629:			//
;1630:			ClientName(teammates[2], name, sizeof(name));
;1631:			BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1632:			BotSayTeamOrder(bs, teammates[2]);
;1633:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_GETFLAG);
;1634:			break;
;1635:		}
;1636:		default: {
;1637:			// 30% defend the base
;1638:			defenders = (int)(float)numteammates * 0.3 + 0.5;
;1639:			if (defenders > 3)
;1640:				defenders = 3;
;1641:			// 60% get the flag
;1642:			attackers = (int)(float)numteammates * 0.6 + 0.5;
;1643:			if (attackers > 6)
;1644:				attackers = 6;
;1645:			for (i = 0; i < defenders; i++) {
;1646:				//
;1647:				ClientName(teammates[i], name, sizeof(name));
;1648:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1649:				BotSayTeamOrder(bs, teammates[i]);
;1650:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1651:			}
;1652:			for (i = 0; i < attackers; i++) {
;1653:				//
;1654:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1655:				BotAI_BotInitialChat(bs, "cmd_getflag", name, NULL);
;1656:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1657:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_GETFLAG);
;1658:			}
;1659:			//
;1660:			break;
;1661:		}
;1662:		}
;1663:	}
;1664:}
;1665:
;1666:/*
;1667:==================
;1668:Bot1FCTFOrders
;1669:==================
;1670:*/
;1671:void Bot1FCTFOrders(bot_state_t* bs) {
;1672:	switch (bs->neutralflagstatus) {
;1673:	case 0:
;1674:		Bot1FCTFOrders_FlagAtCenter(bs);
;1675:		break;
;1676:	case 1:
;1677:		Bot1FCTFOrders_TeamHasFlag(bs);
;1678:		break;
;1679:	case 2:
;1680:		Bot1FCTFOrders_EnemyHasFlag(bs);
;1681:		break;
;1682:	case 3:
;1683:		Bot1FCTFOrders_EnemyDroppedFlag(bs);
;1684:		break;
;1685:	}
;1686:}
;1687:
;1688:/*
;1689:==================
;1690:BotObeliskOrders
;1691:
;1692:  X% in defence Y% in offence
;1693:==================
;1694:*/
;1695:void BotObeliskOrders(bot_state_t* bs) {
;1696:	int  numteammates, defenders, attackers, i;
;1697:	int  teammates[MAX_CLIENTS];
;1698:	char name[MAX_NETNAME];
;1699:
;1700:	// sort team mates by travel time to base
;1701:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1702:	// sort team mates by CTF preference
;1703:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1704:	// passive strategy
;1705:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1706:		// different orders based on the number of team mates
;1707:		switch (numteammates) {
;1708:		case 1:
;1709:			break;
;1710:		case 2: {
;1711:			// the one closest to the base will defend the base
;1712:			ClientName(teammates[0], name, sizeof(name));
;1713:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1714:			BotSayTeamOrder(bs, teammates[0]);
;1715:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1716:			// the other will attack the enemy base
;1717:			ClientName(teammates[1], name, sizeof(name));
;1718:			BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1719:			BotSayTeamOrder(bs, teammates[1]);
;1720:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1721:			break;
;1722:		}
;1723:		case 3: {
;1724:			// the one closest to the base will defend the base
;1725:			ClientName(teammates[0], name, sizeof(name));
;1726:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1727:			BotSayTeamOrder(bs, teammates[0]);
;1728:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1729:			// the one second closest to the base also defends the base
;1730:			ClientName(teammates[1], name, sizeof(name));
;1731:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1732:			BotSayTeamOrder(bs, teammates[1]);
;1733:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1734:			// the other one attacks the enemy base
;1735:			ClientName(teammates[2], name, sizeof(name));
;1736:			BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1737:			BotSayTeamOrder(bs, teammates[2]);
;1738:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
;1739:			break;
;1740:		}
;1741:		default: {
;1742:			// 50% defend the base
;1743:			defenders = (int)(float)numteammates * 0.5 + 0.5;
;1744:			if (defenders > 5)
;1745:				defenders = 5;
;1746:			// 40% attack the enemy base
;1747:			attackers = (int)(float)numteammates * 0.4 + 0.5;
;1748:			if (attackers > 4)
;1749:				attackers = 4;
;1750:			for (i = 0; i < defenders; i++) {
;1751:				//
;1752:				ClientName(teammates[i], name, sizeof(name));
;1753:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1754:				BotSayTeamOrder(bs, teammates[i]);
;1755:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1756:			}
;1757:			for (i = 0; i < attackers; i++) {
;1758:				//
;1759:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1760:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1761:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1762:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
;1763:			}
;1764:			//
;1765:			break;
;1766:		}
;1767:		}
;1768:	} else {
;1769:		// different orders based on the number of team mates
;1770:		switch (numteammates) {
;1771:		case 1:
;1772:			break;
;1773:		case 2: {
;1774:			// the one closest to the base will defend the base
;1775:			ClientName(teammates[0], name, sizeof(name));
;1776:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1777:			BotSayTeamOrder(bs, teammates[0]);
;1778:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1779:			// the other will attack the enemy base
;1780:			ClientName(teammates[1], name, sizeof(name));
;1781:			BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1782:			BotSayTeamOrder(bs, teammates[1]);
;1783:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1784:			break;
;1785:		}
;1786:		case 3: {
;1787:			// the one closest to the base will defend the base
;1788:			ClientName(teammates[0], name, sizeof(name));
;1789:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1790:			BotSayTeamOrder(bs, teammates[0]);
;1791:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1792:			// the others attack the enemy base
;1793:			ClientName(teammates[1], name, sizeof(name));
;1794:			BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1795:			BotSayTeamOrder(bs, teammates[1]);
;1796:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1797:			//
;1798:			ClientName(teammates[2], name, sizeof(name));
;1799:			BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1800:			BotSayTeamOrder(bs, teammates[2]);
;1801:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
;1802:			break;
;1803:		}
;1804:		default: {
;1805:			// 30% defend the base
;1806:			defenders = (int)(float)numteammates * 0.3 + 0.5;
;1807:			if (defenders > 3)
;1808:				defenders = 3;
;1809:			// 70% attack the enemy base
;1810:			attackers = (int)(float)numteammates * 0.7 + 0.5;
;1811:			if (attackers > 7)
;1812:				attackers = 7;
;1813:			for (i = 0; i < defenders; i++) {
;1814:				//
;1815:				ClientName(teammates[i], name, sizeof(name));
;1816:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1817:				BotSayTeamOrder(bs, teammates[i]);
;1818:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1819:			}
;1820:			for (i = 0; i < attackers; i++) {
;1821:				//
;1822:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1823:				BotAI_BotInitialChat(bs, "cmd_attackenemybase", name, NULL);
;1824:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1825:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
;1826:			}
;1827:			//
;1828:			break;
;1829:		}
;1830:		}
;1831:	}
;1832:}
;1833:
;1834:/*
;1835:==================
;1836:BotHarvesterOrders
;1837:
;1838:  X% defend the base, Y% harvest
;1839:==================
;1840:*/
;1841:void BotHarvesterOrders(bot_state_t* bs) {
;1842:	int  numteammates, defenders, attackers, i;
;1843:	int  teammates[MAX_CLIENTS];
;1844:	char name[MAX_NETNAME];
;1845:
;1846:	memset(teammates, 0, sizeof(teammates));
;1847:	// sort team mates by travel time to base
;1848:	numteammates = BotSortTeamMatesByBaseTravelTime(bs, teammates, sizeof(teammates));
;1849:	// sort team mates by CTF preference
;1850:	BotSortTeamMatesByTaskPreference(bs, teammates, numteammates);
;1851:	// passive strategy
;1852:	if (!(bs->ctfstrategy & CTFS_AGRESSIVE)) {
;1853:		// different orders based on the number of team mates
;1854:		switch (numteammates) {
;1855:		case 1:
;1856:			break;
;1857:		case 2: {
;1858:			// the one closest to the base will defend the base
;1859:			ClientName(teammates[0], name, sizeof(name));
;1860:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1861:			BotSayTeamOrder(bs, teammates[0]);
;1862:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1863:			// the other will harvest
;1864:			ClientName(teammates[1], name, sizeof(name));
;1865:			BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1866:			BotSayTeamOrder(bs, teammates[1]);
;1867:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1868:			break;
;1869:		}
;1870:		case 3: {
;1871:			// the one closest to the base will defend the base
;1872:			ClientName(teammates[0], name, sizeof(name));
;1873:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1874:			BotSayTeamOrder(bs, teammates[0]);
;1875:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1876:			// the one second closest to the base also defends the base
;1877:			ClientName(teammates[1], name, sizeof(name));
;1878:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1879:			BotSayTeamOrder(bs, teammates[1]);
;1880:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_DEFEND);
;1881:			// the other one goes harvesting
;1882:			ClientName(teammates[2], name, sizeof(name));
;1883:			BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1884:			BotSayTeamOrder(bs, teammates[2]);
;1885:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
;1886:			break;
;1887:		}
;1888:		default: {
;1889:			// 50% defend the base
;1890:			defenders = (int)(float)numteammates * 0.5 + 0.5;
;1891:			if (defenders > 5)
;1892:				defenders = 5;
;1893:			// 40% goes harvesting
;1894:			attackers = (int)(float)numteammates * 0.4 + 0.5;
;1895:			if (attackers > 4)
;1896:				attackers = 4;
;1897:			for (i = 0; i < defenders; i++) {
;1898:				//
;1899:				ClientName(teammates[i], name, sizeof(name));
;1900:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1901:				BotSayTeamOrder(bs, teammates[i]);
;1902:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1903:			}
;1904:			for (i = 0; i < attackers; i++) {
;1905:				//
;1906:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1907:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1908:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1909:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
;1910:			}
;1911:			//
;1912:			break;
;1913:		}
;1914:		}
;1915:	} else {
;1916:		// different orders based on the number of team mates
;1917:		switch (numteammates) {
;1918:		case 1:
;1919:			break;
;1920:		case 2: {
;1921:			// the one closest to the base will defend the base
;1922:			ClientName(teammates[0], name, sizeof(name));
;1923:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1924:			BotSayTeamOrder(bs, teammates[0]);
;1925:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1926:			// the other will harvest
;1927:			ClientName(teammates[1], name, sizeof(name));
;1928:			BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1929:			BotSayTeamOrder(bs, teammates[1]);
;1930:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1931:			break;
;1932:		}
;1933:		case 3: {
;1934:			// the one closest to the base will defend the base
;1935:			ClientName(teammates[0], name, sizeof(name));
;1936:			BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1937:			BotSayTeamOrder(bs, teammates[0]);
;1938:			BotSayVoiceTeamOrder(bs, teammates[0], VOICECHAT_DEFEND);
;1939:			// the others go harvesting
;1940:			ClientName(teammates[1], name, sizeof(name));
;1941:			BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1942:			BotSayTeamOrder(bs, teammates[1]);
;1943:			BotSayVoiceTeamOrder(bs, teammates[1], VOICECHAT_OFFENSE);
;1944:			//
;1945:			ClientName(teammates[2], name, sizeof(name));
;1946:			BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1947:			BotSayTeamOrder(bs, teammates[2]);
;1948:			BotSayVoiceTeamOrder(bs, teammates[2], VOICECHAT_OFFENSE);
;1949:			break;
;1950:		}
;1951:		default: {
;1952:			// 30% defend the base
;1953:			defenders = (int)(float)numteammates * 0.3 + 0.5;
;1954:			if (defenders > 3)
;1955:				defenders = 3;
;1956:			// 70% go harvesting
;1957:			attackers = (int)(float)numteammates * 0.7 + 0.5;
;1958:			if (attackers > 7)
;1959:				attackers = 7;
;1960:			for (i = 0; i < defenders; i++) {
;1961:				//
;1962:				ClientName(teammates[i], name, sizeof(name));
;1963:				BotAI_BotInitialChat(bs, "cmd_defendbase", name, NULL);
;1964:				BotSayTeamOrder(bs, teammates[i]);
;1965:				BotSayVoiceTeamOrder(bs, teammates[i], VOICECHAT_DEFEND);
;1966:			}
;1967:			for (i = 0; i < attackers; i++) {
;1968:				//
;1969:				ClientName(teammates[numteammates - i - 1], name, sizeof(name));
;1970:				BotAI_BotInitialChat(bs, "cmd_harvest", name, NULL);
;1971:				BotSayTeamOrder(bs, teammates[numteammates - i - 1]);
;1972:				BotSayVoiceTeamOrder(bs, teammates[numteammates - i - 1], VOICECHAT_OFFENSE);
;1973:			}
;1974:			//
;1975:			break;
;1976:		}
;1977:		}
;1978:	}
;1979:}
;1980:#endif
;1981:
;1982:/*
;1983:==================
;1984:FindHumanTeamLeader
;1985:==================
;1986:*/
;1987:int FindHumanTeamLeader(bot_state_t* bs) {
line 1990
;1988:	int i;
;1989:
;1990:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $396
line 1991
;1991:		if (g_entities[i].inuse) {
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $400
line 1993
;1992:			// if this player is not a bot
;1993:			if (!(g_entities[i].r.svFlags & SVF_BOT)) {
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $403
line 1995
;1994:				// if this player is ok with being the leader
;1995:				if (!notleader[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 notleader
ADDP4
INDIRI4
CNSTI4 0
NEI4 $407
line 1997
;1996:					// if this player is on the same team
;1997:					if (BotSameTeam(bs, i)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 BotSameTeam
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $409
line 1998
;1998:						ClientName(i, bs->teamleader, sizeof(bs->teamleader));
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2000
;1999:						// if not yet ordered to do anything
;2000:						if (!BotSetLastOrderedTask(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BotSetLastOrderedTask
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $411
line 2002
;2001:							// go on defense by default
;2002:							BotVoiceChat_Defend(bs, i, SAY_TELL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 BotVoiceChat_Defend
CALLV
pop
line 2003
;2003:						}
LABELV $411
line 2004
;2004:						return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $395
JUMPV
LABELV $409
line 2006
;2005:					}
;2006:				}
LABELV $407
line 2007
;2007:			}
LABELV $403
line 2008
;2008:		}
LABELV $400
line 2009
;2009:	}
LABELV $397
line 1990
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $396
line 2010
;2010:	return qfalse;
CNSTI4 0
RETI4
LABELV $395
endproc FindHumanTeamLeader 12 12
export BotTeamAI
proc BotTeamAI 68 12
line 2018
;2011:}
;2012:
;2013:/*
;2014:==================
;2015:BotTeamAI
;2016:==================
;2017:*/
;2018:void BotTeamAI(bot_state_t* bs) {
line 2023
;2019:	int  numteammates;
;2020:	char netname[MAX_NETNAME];
;2021:
;2022:	//
;2023:	if (gametype < GT_TEAM)
ADDRGP4 gametype
INDIRI4
CNSTI4 3
GEI4 $414
line 2024
;2024:		return;
ADDRGP4 $413
JUMPV
LABELV $414
line 2026
;2025:	// make sure we've got a valid team leader
;2026:	if (!BotValidTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 BotValidTeamLeader
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $416
line 2028
;2027:		//
;2028:		if (!FindHumanTeamLeader(bs)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 FindHumanTeamLeader
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $418
line 2030
;2029:			//
;2030:			if (!bs->askteamleader_time && !bs->becometeamleader_time) {
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 6936
ADDP4
INDIRF4
CNSTF4 0
NEF4 $420
ADDRLP4 48
INDIRP4
CNSTI4 6940
ADDP4
INDIRF4
CNSTF4 0
NEF4 $420
line 2031
;2031:				if (bs->entergame_time + 10 > FloatTime()) {
ADDRFP4 0
INDIRP4
CNSTI4 6064
ADDP4
INDIRF4
CNSTF4 1092616192
ADDF4
ADDRGP4 floattime
INDIRF4
LEF4 $422
line 2032
;2032:					bs->askteamleader_time = FloatTime() + 5 + random() * 10;
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 966787392
MULF4
ADDF4
ASGNF4
line 2033
;2033:				} else {
ADDRGP4 $423
JUMPV
LABELV $422
line 2034
;2034:					bs->becometeamleader_time = FloatTime() + 5 + random() * 10;
ADDRLP4 52
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
ADDF4
ADDRLP4 52
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 966787392
MULF4
ADDF4
ASGNF4
line 2035
;2035:				}
LABELV $423
line 2036
;2036:			}
LABELV $420
line 2037
;2037:			if (bs->askteamleader_time && bs->askteamleader_time < FloatTime()) {
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 6936
ADDP4
INDIRF4
CNSTF4 0
EQF4 $424
ADDRLP4 52
INDIRP4
CNSTI4 6936
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $424
line 2039
;2038:				// if asked for a team leader and no response
;2039:				BotAI_BotInitialChat(bs, "whoisteamleader", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $426
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2040
;2040:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 2041
;2041:				bs->askteamleader_time    = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
CNSTF4 0
ASGNF4
line 2042
;2042:				bs->becometeamleader_time = FloatTime() + 8 + random() * 10;
ADDRLP4 56
ADDRGP4 rand
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1090519040
ADDF4
ADDRLP4 56
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 966787392
MULF4
ADDF4
ASGNF4
line 2043
;2043:			}
LABELV $424
line 2044
;2044:			if (bs->becometeamleader_time && bs->becometeamleader_time < FloatTime()) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6940
ADDP4
INDIRF4
CNSTF4 0
EQF4 $413
ADDRLP4 56
INDIRP4
CNSTI4 6940
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
GEF4 $413
line 2045
;2045:				BotAI_BotInitialChat(bs, "iamteamleader", NULL);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $429
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 BotAI_BotInitialChat
CALLV
pop
line 2046
;2046:				trap_BotEnterChat(bs->cs, 0, CHAT_TEAM);
ADDRFP4 0
INDIRP4
CNSTI4 6532
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_BotEnterChat
CALLV
pop
line 2050
;2047:#ifdef MISSIONPACK
;2048:				BotSayVoiceTeamOrder(bs, -1, VOICECHAT_STARTLEADER);
;2049:#endif
;2050:				ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2051
;2051:				Q_strncpyz(bs->teamleader, netname, sizeof(bs->teamleader));
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 2052
;2052:				bs->becometeamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
CNSTF4 0
ASGNF4
line 2053
;2053:			}
line 2054
;2054:			return;
ADDRGP4 $413
JUMPV
LABELV $418
line 2056
;2055:		}
;2056:	}
LABELV $416
line 2057
;2057:	bs->askteamleader_time    = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6936
ADDP4
CNSTF4 0
ASGNF4
line 2058
;2058:	bs->becometeamleader_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6940
ADDP4
CNSTF4 0
ASGNF4
line 2061
;2059:
;2060:	// return if this bot is NOT the team leader
;2061:	ClientName(bs->client, netname, sizeof(netname));
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 ClientName
CALLP4
pop
line 2062
;2062:	if (Q_stricmp(netname, bs->teamleader) != 0)
ADDRLP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 6900
ADDP4
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $430
line 2063
;2063:		return;
ADDRGP4 $413
JUMPV
LABELV $430
line 2065
;2064:	//
;2065:	numteammates = BotNumTeamMates(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 BotNumTeamMates
CALLI4
ASGNI4
ADDRLP4 36
ADDRLP4 48
INDIRI4
ASGNI4
line 2067
;2066:	// give orders
;2067:	switch (gametype) {
ADDRLP4 52
ADDRGP4 gametype
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 3
EQI4 $434
ADDRLP4 52
INDIRI4
CNSTI4 4
EQI4 $440
ADDRGP4 $432
JUMPV
LABELV $434
line 2068
;2068:	case GT_TEAM: {
line 2069
;2069:		if (bs->numteammates != numteammates || bs->forceorders) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $437
ADDRLP4 56
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $435
LABELV $437
line 2070
;2070:			bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2071
;2071:			bs->numteammates        = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2072
;2072:			bs->forceorders         = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
CNSTI4 0
ASGNI4
line 2073
;2073:		}
LABELV $435
line 2075
;2074:		// if it's time to give orders
;2075:		if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
CNSTF4 0
EQF4 $433
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1084227584
SUBF4
GEF4 $433
line 2076
;2076:			BotTeamOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotTeamOrders
CALLV
pop
line 2078
;2077:			// give orders again after 120 seconds
;2078:			bs->teamgiveorders_time = FloatTime() + 120;
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
CNSTF4 1123024896
ADDF4
ASGNF4
line 2079
;2079:		}
line 2080
;2080:		break;
ADDRGP4 $433
JUMPV
LABELV $440
line 2082
;2081:	}
;2082:	case GT_CTF: {
line 2085
;2083:		// if the number of team mates changed or the flag status changed
;2084:		// or someone wants to know what to do
;2085:		if (bs->numteammates != numteammates || bs->flagstatuschanged || bs->forceorders) {
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 6952
ADDP4
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $444
ADDRLP4 56
INDIRP4
CNSTI4 6968
ADDP4
INDIRI4
CNSTI4 0
NEI4 $444
ADDRLP4 56
INDIRP4
CNSTI4 6972
ADDP4
INDIRI4
CNSTI4 0
EQI4 $441
LABELV $444
line 2086
;2086:			bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2087
;2087:			bs->numteammates        = numteammates;
ADDRFP4 0
INDIRP4
CNSTI4 6952
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 2088
;2088:			bs->flagstatuschanged   = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6968
ADDP4
CNSTI4 0
ASGNI4
line 2089
;2089:			bs->forceorders         = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 6972
ADDP4
CNSTI4 0
ASGNI4
line 2090
;2090:		}
LABELV $441
line 2092
;2091:		// if there were no flag captures the last 3 minutes
;2092:		if (bs->lastflagcapture_time < FloatTime() - 240) {
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1131413504
SUBF4
GEF4 $445
line 2093
;2093:			bs->lastflagcapture_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6948
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2095
;2094:			// randomly change the CTF strategy
;2095:			if (random() < 0.4) {
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
CNSTF4 1053609165
GEF4 $447
line 2096
;2096:				bs->ctfstrategy ^= CTFS_AGRESSIVE;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 6980
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 2097
;2097:				bs->teamgiveorders_time = FloatTime();
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
ADDRGP4 floattime
INDIRF4
ASGNF4
line 2098
;2098:			}
LABELV $447
line 2099
;2099:		}
LABELV $445
line 2101
;2100:		// if it's time to give orders
;2101:		if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 3) {
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
CNSTF4 0
EQF4 $433
ADDRLP4 60
INDIRP4
CNSTI4 6944
ADDP4
INDIRF4
ADDRGP4 floattime
INDIRF4
CNSTF4 1077936128
SUBF4
GEF4 $433
line 2102
;2102:			BotCTFOrders(bs);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BotCTFOrders
CALLV
pop
line 2104
;2103:			//
;2104:			bs->teamgiveorders_time = 0;
ADDRFP4 0
INDIRP4
CNSTI4 6944
ADDP4
CNSTF4 0
ASGNF4
line 2105
;2105:		}
line 2106
;2106:		break;
LABELV $432
LABELV $433
line 2163
;2107:	}
;2108:#ifdef MISSIONPACK
;2109:	case GT_1FCTF: {
;2110:		if (bs->numteammates != numteammates || bs->flagstatuschanged || bs->forceorders) {
;2111:			bs->teamgiveorders_time = FloatTime();
;2112:			bs->numteammates        = numteammates;
;2113:			bs->flagstatuschanged   = qfalse;
;2114:			bs->forceorders         = qfalse;
;2115:		}
;2116:		// if there were no flag captures the last 4 minutes
;2117:		if (bs->lastflagcapture_time < FloatTime() - 240) {
;2118:			bs->lastflagcapture_time = FloatTime();
;2119:			// randomly change the CTF strategy
;2120:			if (random() < 0.4) {
;2121:				bs->ctfstrategy ^= CTFS_AGRESSIVE;
;2122:				bs->teamgiveorders_time = FloatTime();
;2123:			}
;2124:		}
;2125:		// if it's time to give orders
;2126:		if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 2) {
;2127:			Bot1FCTFOrders(bs);
;2128:			//
;2129:			bs->teamgiveorders_time = 0;
;2130:		}
;2131:		break;
;2132:	}
;2133:	case GT_OBELISK: {
;2134:		if (bs->numteammates != numteammates || bs->forceorders) {
;2135:			bs->teamgiveorders_time = FloatTime();
;2136:			bs->numteammates        = numteammates;
;2137:			bs->forceorders         = qfalse;
;2138:		}
;2139:		// if it's time to give orders
;2140:		if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
;2141:			BotObeliskOrders(bs);
;2142:			// give orders again after 30 seconds
;2143:			bs->teamgiveorders_time = FloatTime() + 30;
;2144:		}
;2145:		break;
;2146:	}
;2147:	case GT_HARVESTER: {
;2148:		if (bs->numteammates != numteammates || bs->forceorders) {
;2149:			bs->teamgiveorders_time = FloatTime();
;2150:			bs->numteammates        = numteammates;
;2151:			bs->forceorders         = qfalse;
;2152:		}
;2153:		// if it's time to give orders
;2154:		if (bs->teamgiveorders_time && bs->teamgiveorders_time < FloatTime() - 5) {
;2155:			BotHarvesterOrders(bs);
;2156:			// give orders again after 30 seconds
;2157:			bs->teamgiveorders_time = FloatTime() + 30;
;2158:		}
;2159:		break;
;2160:	}
;2161:#endif
;2162:	}
;2163:}
LABELV $413
endproc BotTeamAI 68 12
bss
export ctftaskpreferences
align 4
LABELV ctftaskpreferences
skip 2560
import BotVoiceChat_Defend
import BotVoiceChatCommand
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
import BotChatTest
import BotValidChatPosition
import BotChatTime
import BotChat_Random
import BotChat_EnemySuicide
import BotChat_Kill
import BotChat_Death
import BotChat_HitNoKill
import BotChat_HitNoDeath
import BotChat_HitTalking
import BotChat_EndLevel
import BotChat_StartLevel
import BotChat_ExitGame
import BotChat_EnterGame
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
LABELV $429
byte 1 105
byte 1 97
byte 1 109
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $426
byte 1 119
byte 1 104
byte 1 111
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $198
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 98
byte 1 97
byte 1 115
byte 1 101
byte 1 0
align 1
LABELV $155
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 0
align 1
LABELV $154
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 97
byte 1 99
byte 1 99
byte 1 111
byte 1 109
byte 1 112
byte 1 97
byte 1 110
byte 1 121
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 109
byte 1 100
byte 1 95
byte 1 103
byte 1 101
byte 1 116
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $131
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 25
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $72
byte 1 116
byte 1 0
align 1
LABELV $68
byte 1 110
byte 1 0
