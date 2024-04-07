export DeathmatchScoreboardMessage
code
proc DeathmatchScoreboardMessage 1344 64
file "../../../../code/game/g_cmds.c"
line 15
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:#ifdef MISSIONPACK
;6:#include "../../ui/menudef.h"  // for the voice chats
;7:#endif
;8:
;9:/*
;10:==================
;11:DeathmatchScoreboardMessage
;12:
;13:==================
;14:*/
;15:void DeathmatchScoreboardMessage(gentity_t* ent) {
line 24
;16:	char       entry[256];  // enough to hold 14 integers
;17:	char       string[MAX_STRING_CHARS - 1];
;18:	int        stringlength;
;19:	int        i, j, ping, prefix;
;20:	gclient_t* cl;
;21:	int        numSorted, scoreFlags, accuracy, perfect;
;22:
;23:	// send the latest information on all clients
;24:	string[0]    = '\0';
ADDRLP4 16
CNSTI1 0
ASGNI1
line 25
;25:	stringlength = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 26
;26:	scoreFlags   = 0;
ADDRLP4 1316
CNSTI4 0
ASGNI4
line 28
;27:
;28:	numSorted = level.numConnectedClients;
ADDRLP4 1308
ADDRGP4 level+76
INDIRI4
ASGNI4
line 31
;29:
;30:	// estimate prefix length to avoid oversize of final string
;31:	prefix = BG_sprintf(entry, "scores %i %i %i", level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE], numSorted);
ADDRLP4 1039
ARGP4
ADDRGP4 $56
ARGP4
ADDRGP4 level+48+4
INDIRI4
ARGI4
ADDRGP4 level+48+8
INDIRI4
ARGI4
ADDRLP4 1308
INDIRI4
ARGI4
ADDRLP4 1320
ADDRGP4 BG_sprintf
CALLI4
ASGNI4
ADDRLP4 1312
ADDRLP4 1320
INDIRI4
ASGNI4
line 33
;32:
;33:	for (i = 0; i < numSorted; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $64
JUMPV
LABELV $61
line 35
;34:
;35:		cl = &level.clients[level.sortedClients[i]];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 37
;36:
;37:		if (cl->pers.connected == CON_CONNECTING) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $66
line 38
;38:			ping = -1;
ADDRLP4 1296
CNSTI4 -1
ASGNI4
line 39
;39:		} else {
ADDRGP4 $67
JUMPV
LABELV $66
line 40
;40:			ping = cl->ps.ping < 999 ? cl->ps.ping : 999;
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
CNSTI4 999
GEI4 $69
ADDRLP4 1324
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
ADDRGP4 $70
JUMPV
LABELV $69
ADDRLP4 1324
CNSTI4 999
ASGNI4
LABELV $70
ADDRLP4 1296
ADDRLP4 1324
INDIRI4
ASGNI4
line 41
;41:		}
LABELV $67
line 43
;42:
;43:		if (cl->accuracy_shots) {
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
CNSTI4 0
EQI4 $71
line 44
;44:			accuracy = cl->accuracy_hits * 100 / cl->accuracy_shots;
ADDRLP4 1300
ADDRLP4 0
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
CNSTI4 100
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
DIVI4
ASGNI4
line 45
;45:		} else {
ADDRGP4 $72
JUMPV
LABELV $71
line 46
;46:			accuracy = 0;
ADDRLP4 1300
CNSTI4 0
ASGNI4
line 47
;47:		}
LABELV $72
line 49
;48:
;49:		perfect = (cl->ps.persistant[PERS_RANK] == 0 && cl->ps.persistant[PERS_KILLED] == 0) ? 1 : 0;
ADDRLP4 0
INDIRP4
CNSTI4 256
ADDP4
INDIRI4
CNSTI4 0
NEI4 $74
ADDRLP4 0
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
NEI4 $74
ADDRLP4 1324
CNSTI4 1
ASGNI4
ADDRGP4 $75
JUMPV
LABELV $74
ADDRLP4 1324
CNSTI4 0
ASGNI4
LABELV $75
ADDRLP4 1304
ADDRLP4 1324
INDIRI4
ASGNI4
line 51
;50:
;51:		j = BG_sprintf(
ADDRLP4 1039
ARGP4
ADDRGP4 $76
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 248
ADDP4
INDIRI4
ARGI4
ADDRLP4 1296
INDIRI4
ARGI4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
INDIRI4
SUBI4
CNSTI4 60000
DIVI4
ARGI4
ADDRLP4 1316
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+88
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+188
ADDP4
INDIRI4
ARGI4
ADDRLP4 1300
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 288
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 300
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 296
ADDP4
INDIRI4
ARGI4
ADDRLP4 1304
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRLP4 1340
ADDRGP4 BG_sprintf
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 1340
INDIRI4
ASGNI4
line 57
;52:			entry, " %i %i %i %i %i %i %i %i %i %i %i %i %i %i", level.sortedClients[i], cl->ps.persistant[PERS_SCORE], ping,
;53:			(level.time - cl->pers.enterTime) / 60000, scoreFlags, g_entities[level.sortedClients[i]].s.powerups, accuracy,
;54:			cl->ps.persistant[PERS_IMPRESSIVE_COUNT], cl->ps.persistant[PERS_EXCELLENT_COUNT], cl->ps.persistant[PERS_GAUNTLET_FRAG_COUNT],
;55:			cl->ps.persistant[PERS_DEFEND_COUNT], cl->ps.persistant[PERS_ASSIST_COUNT], perfect, cl->ps.persistant[PERS_CAPTURES]);
;56:
;57:		if (stringlength + j + prefix >= sizeof(string))
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ADDRLP4 1312
INDIRI4
ADDI4
CVIU4 4
CNSTU4 1023
LTU4 $81
line 58
;58:			break;
ADDRGP4 $63
JUMPV
LABELV $81
line 60
;59:
;60:		strcpy(string + stringlength, entry);
ADDRLP4 8
INDIRI4
ADDRLP4 16
ADDP4
ARGP4
ADDRLP4 1039
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 61
;61:		stringlength += j;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 62
;62:	}
LABELV $62
line 33
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $64
ADDRLP4 4
INDIRI4
ADDRLP4 1308
INDIRI4
LTI4 $61
LABELV $63
line 64
;63:
;64:	trap_SendServerCommand(ent - g_entities, va("scores %i %i %i%s", i, level.teamScores[TEAM_RED], level.teamScores[TEAM_BLUE], string));
ADDRGP4 $83
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 level+48+4
INDIRI4
ARGI4
ADDRGP4 level+48+8
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 1324
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 1324
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 65
;65:}
LABELV $54
endproc DeathmatchScoreboardMessage 1344 64
export Cmd_Score_f
proc Cmd_Score_f 0 4
line 74
;66:
;67:/*
;68:==================
;69:Cmd_Score_f
;70:
;71:Request current scoreboard information
;72:==================
;73:*/
;74:void Cmd_Score_f(gentity_t* ent) {
line 75
;75:	DeathmatchScoreboardMessage(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 DeathmatchScoreboardMessage
CALLV
pop
line 76
;76:}
LABELV $88
endproc Cmd_Score_f 0 4
export CheatsOk
proc CheatsOk 0 8
line 83
;77:
;78:/*
;79:==================
;80:CheatsOk
;81:==================
;82:*/
;83:qboolean CheatsOk(gentity_t* ent) {
line 84
;84:	if (!g_cheats.integer) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $90
line 85
;85:		trap_SendServerCommand(ent - g_entities, "print \"Cheats are not enabled on this server.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $93
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 86
;86:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $89
JUMPV
LABELV $90
line 88
;87:	}
;88:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $94
line 89
;89:		trap_SendServerCommand(ent - g_entities, "print \"You must be alive to use this command.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $96
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 90
;90:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $89
JUMPV
LABELV $94
line 92
;91:	}
;92:	return qtrue;
CNSTI4 1
RETI4
LABELV $89
endproc CheatsOk 0 8
bss
align 1
LABELV $98
skip 1024
export ConcatArgs
code
proc ConcatArgs 1048 12
line 100
;93:}
;94:
;95:/*
;96:==================
;97:ConcatArgs
;98:==================
;99:*/
;100:char* ConcatArgs(int start) {
line 106
;101:	static char line[MAX_STRING_CHARS];
;102:	char        arg[MAX_STRING_CHARS];
;103:	int         i, c, tlen;
;104:	int         len;
;105:
;106:	len = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 107
;107:	c   = trap_Argc();
ADDRLP4 1040
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
ADDRLP4 1040
INDIRI4
ASGNI4
line 108
;108:	for (i = start; i < c; i++) {
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 $102
JUMPV
LABELV $99
line 109
;109:		trap_Argv(i, arg, sizeof(arg));
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 110
;110:		tlen = (int)strlen(arg);
ADDRLP4 8
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1044
INDIRI4
ASGNI4
line 111
;111:		if (len + tlen >= sizeof(line) - 1) {
ADDRLP4 0
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
CVIU4 4
CNSTU4 1023
LTU4 $103
line 112
;112:			break;
ADDRGP4 $101
JUMPV
LABELV $103
line 114
;113:		}
;114:		memcpy(line + len, arg, tlen);
ADDRLP4 0
INDIRI4
ADDRGP4 $98
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 1032
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 115
;115:		len += tlen;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
ASGNI4
line 116
;116:		if (i != c - 1) {
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
CNSTI4 1
SUBI4
EQI4 $105
line 117
;117:			line[len] = ' ';
ADDRLP4 0
INDIRI4
ADDRGP4 $98
ADDP4
CNSTI1 32
ASGNI1
line 118
;118:			len++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 119
;119:		}
LABELV $105
line 120
;120:	}
LABELV $100
line 108
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $102
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
LTI4 $99
LABELV $101
line 122
;121:
;122:	line[len] = '\0';
ADDRLP4 0
INDIRI4
ADDRGP4 $98
ADDP4
CNSTI1 0
ASGNI1
line 124
;123:
;124:	return line;
ADDRGP4 $98
RETP4
LABELV $97
endproc ConcatArgs 1048 12
export SanitizeString
proc SanitizeString 4 4
line 134
;125:}
;126:
;127:/*
;128:==================
;129:SanitizeString
;130:
;131:Remove case and control characters
;132:==================
;133:*/
;134:void SanitizeString(const char* in, char* out) {
ADDRGP4 $109
JUMPV
LABELV $108
line 135
;135:	while (*in) {
line 136
;136:		if (*in == 27) {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 27
NEI4 $111
line 137
;137:			in += 2;  // skip color code
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 138
;138:			continue;
ADDRGP4 $109
JUMPV
LABELV $111
line 140
;139:		}
;140:		if (*in < ' ') {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
GEI4 $113
line 141
;141:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 142
;142:			continue;
ADDRGP4 $109
JUMPV
LABELV $113
line 144
;143:		}
;144:		*out = tolower(*in);
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 0
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRI4
CVII1 4
ASGNI1
line 145
;145:		out++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 146
;146:		in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 147
;147:	}
LABELV $109
line 135
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $108
line 149
;148:
;149:	*out = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 150
;150:}
LABELV $107
endproc SanitizeString 4 4
export ClientNumberFromString
proc ClientNumberFromString 2068 8
line 160
;151:
;152:/*
;153:==================
;154:ClientNumberFromString
;155:
;156:Returns a player number for either a number or name string
;157:Returns -1 if invalid
;158:==================
;159:*/
;160:int ClientNumberFromString(gentity_t* to, char* s) {
line 167
;161:	gclient_t* cl;
;162:	int        idnum;
;163:	char       s2[MAX_STRING_CHARS];
;164:	char       n2[MAX_STRING_CHARS];
;165:
;166:	// numeric values are just slot numbers
;167:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 2056
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 48
LTI4 $116
ADDRLP4 2056
INDIRI4
CNSTI4 57
GTI4 $116
line 168
;168:		idnum = atoi(s);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 2060
INDIRI4
ASGNI4
line 169
;169:		if ((unsigned)idnum >= (unsigned)level.maxclients) {
ADDRLP4 4
INDIRI4
CVIU4 4
ADDRGP4 level+24
INDIRI4
CVIU4 4
LTU4 $118
line 170
;170:			trap_SendServerCommand(to - g_entities, va("print \"Bad client slot: %i\n\"", idnum));
ADDRGP4 $121
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 171
;171:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $115
JUMPV
LABELV $118
line 174
;172:		}
;173:
;174:		cl = &level.clients[idnum];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 175
;175:		if (cl->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $122
line 176
;176:			trap_SendServerCommand(to - g_entities, va("print \"Client %i is not active\n\"", idnum));
ADDRGP4 $124
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 177
;177:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $115
JUMPV
LABELV $122
line 179
;178:		}
;179:		return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $115
JUMPV
LABELV $116
line 183
;180:	}
;181:
;182:	// check for a name match
;183:	SanitizeString(s, s2);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1032
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 184
;184:	for (idnum = 0, cl = level.clients; idnum < level.maxclients; idnum++, cl++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 level
INDIRP4
ASGNP4
ADDRGP4 $128
JUMPV
LABELV $125
line 185
;185:		if (cl->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $130
line 186
;186:			continue;
ADDRGP4 $126
JUMPV
LABELV $130
line 188
;187:		}
;188:		SanitizeString(cl->pers.netname, n2);
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 SanitizeString
CALLV
pop
line 189
;189:		if (!strcmp(n2, s2)) {
ADDRLP4 8
ARGP4
ADDRLP4 1032
ARGP4
ADDRLP4 2060
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 2060
INDIRI4
CNSTI4 0
NEI4 $132
line 190
;190:			return idnum;
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $115
JUMPV
LABELV $132
line 192
;191:		}
;192:	}
LABELV $126
line 184
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1576
ADDP4
ASGNP4
LABELV $128
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $125
line 194
;193:
;194:	trap_SendServerCommand(to - g_entities, va("print \"User %s is not on the server\n\"", s));
ADDRGP4 $134
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 2060
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 2060
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 195
;195:	return -1;
CNSTI4 -1
RETI4
LABELV $115
endproc ClientNumberFromString 2068 8
export Cmd_Give_f
proc Cmd_Give_f 132 12
line 205
;196:}
;197:
;198:/*
;199:==================
;200:Cmd_Give_f
;201:
;202:Give items to a client
;203:==================
;204:*/
;205:void Cmd_Give_f(gentity_t* ent) {
line 213
;206:	char*      name;
;207:	gitem_t*   it;
;208:	int        i;
;209:	qboolean   give_all;
;210:	gentity_t* it_ent;
;211:	trace_t    trace;
;212:
;213:	if (!CheatsOk(ent)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $136
line 214
;214:		return;
ADDRGP4 $135
JUMPV
LABELV $136
line 217
;215:	}
;216:
;217:	name = ConcatArgs(1);
CNSTI4 1
ARGI4
ADDRLP4 80
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 80
INDIRP4
ASGNP4
line 219
;218:
;219:	if (Q_stricmp(name, "all") == 0)
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $140
ARGP4
ADDRLP4 84
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
NEI4 $138
line 220
;220:		give_all = qtrue;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $139
JUMPV
LABELV $138
line 222
;221:	else
;222:		give_all = qfalse;
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $139
line 224
;223:
;224:	if (give_all || Q_stricmp(name, "health") == 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $144
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $143
ARGP4
ADDRLP4 88
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $141
LABELV $144
line 225
;225:		ent->health = ent->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 92
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 226
;226:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $145
line 227
;227:			return;
ADDRGP4 $135
JUMPV
LABELV $145
line 228
;228:	}
LABELV $141
line 230
;229:
;230:	if (give_all || Q_stricmp(name, "weapons") == 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $150
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $149
ARGP4
ADDRLP4 92
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $147
LABELV $150
line 231
;231:		ent->client->ps.stats[STAT_WEAPONS] = (1 << WP_NUM_WEAPONS) - 1 - (1 << WP_GRAPPLING_HOOK) - (1 << WP_NONE);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 1022
ASGNI4
line 232
;232:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $151
line 233
;233:			return;
ADDRGP4 $135
JUMPV
LABELV $151
line 234
;234:	}
LABELV $147
line 236
;235:
;236:	if (give_all || Q_stricmp(name, "ammo") == 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $156
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $155
ARGP4
ADDRLP4 96
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 96
INDIRI4
CNSTI4 0
NEI4 $153
LABELV $156
line 237
;237:		for (i = 0; i < MAX_WEAPONS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $157
line 238
;238:			ent->client->ps.ammo[i] = 999;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 999
ASGNI4
line 239
;239:		}
LABELV $158
line 237
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $157
line 240
;240:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $161
line 241
;241:			return;
ADDRGP4 $135
JUMPV
LABELV $161
line 242
;242:	}
LABELV $153
line 244
;243:
;244:	if (give_all || Q_stricmp(name, "armor") == 0) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $166
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $165
ARGP4
ADDRLP4 100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
NEI4 $163
LABELV $166
line 245
;245:		ent->client->ps.stats[STAT_ARMOR] = 200;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 196
ADDP4
CNSTI4 200
ASGNI4
line 247
;246:
;247:		if (!give_all)
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $167
line 248
;248:			return;
ADDRGP4 $135
JUMPV
LABELV $167
line 249
;249:	}
LABELV $163
line 251
;250:
;251:	if (Q_stricmp(name, "excellent") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $171
ARGP4
ADDRLP4 104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 104
INDIRI4
CNSTI4 0
NEI4 $169
line 252
;252:		ent->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 108
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 288
ADDP4
ASGNP4
ADDRLP4 108
INDIRP4
ADDRLP4 108
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 253
;253:		return;
ADDRGP4 $135
JUMPV
LABELV $169
line 255
;254:	}
;255:	if (Q_stricmp(name, "impressive") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $174
ARGP4
ADDRLP4 108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $172
line 256
;256:		ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 257
;257:		return;
ADDRGP4 $135
JUMPV
LABELV $172
line 259
;258:	}
;259:	if (Q_stricmp(name, "gauntletaward") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $177
ARGP4
ADDRLP4 112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
NEI4 $175
line 260
;260:		ent->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 116
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 116
INDIRP4
ADDRLP4 116
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 261
;261:		return;
ADDRGP4 $135
JUMPV
LABELV $175
line 263
;262:	}
;263:	if (Q_stricmp(name, "defend") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $180
ARGP4
ADDRLP4 116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 116
INDIRI4
CNSTI4 0
NEI4 $178
line 264
;264:		ent->client->ps.persistant[PERS_DEFEND_COUNT]++;
ADDRLP4 120
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 292
ADDP4
ASGNP4
ADDRLP4 120
INDIRP4
ADDRLP4 120
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 265
;265:		return;
ADDRGP4 $135
JUMPV
LABELV $178
line 267
;266:	}
;267:	if (Q_stricmp(name, "assist") == 0) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $183
ARGP4
ADDRLP4 120
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 120
INDIRI4
CNSTI4 0
NEI4 $181
line 268
;268:		ent->client->ps.persistant[PERS_ASSIST_COUNT]++;
ADDRLP4 124
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 296
ADDP4
ASGNP4
ADDRLP4 124
INDIRP4
ADDRLP4 124
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 269
;269:		return;
ADDRGP4 $135
JUMPV
LABELV $181
line 273
;270:	}
;271:
;272:	// spawn a specific item right on the player
;273:	if (!give_all) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $184
line 274
;274:		it = BG_FindItem(name);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 124
INDIRP4
ASGNP4
line 275
;275:		if (!it) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $186
line 276
;276:			return;
ADDRGP4 $135
JUMPV
LABELV $186
line 279
;277:		}
;278:
;279:		it_ent = G_Spawn();
ADDRLP4 128
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 128
INDIRP4
ASGNP4
line 280
;280:		VectorCopy(ent->r.currentOrigin, it_ent->s.origin);
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 281
;281:		it_ent->classname = it->classname;
ADDRLP4 12
INDIRP4
CNSTI4 524
ADDP4
ADDRLP4 16
INDIRP4
INDIRP4
ASGNP4
line 282
;282:		G_SpawnItem(it_ent, it);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 283
;283:		FinishSpawningItem(it_ent);
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 FinishSpawningItem
CALLV
pop
line 284
;284:		memset(&trace, 0, sizeof(trace));
ADDRLP4 20
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 285
;285:		Touch_Item(it_ent, ent, &trace);
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 Touch_Item
CALLV
pop
line 286
;286:		if (it_ent->inuse) {
ADDRLP4 12
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $188
line 287
;287:			G_FreeEntity(it_ent);
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 288
;288:		}
LABELV $188
line 289
;289:	}
LABELV $184
line 290
;290:}
LABELV $135
endproc Cmd_Give_f 132 12
export Cmd_God_f
proc Cmd_God_f 16 8
line 301
;291:
;292:/*
;293:==================
;294:Cmd_God_f
;295:
;296:Sets client to godmode
;297:
;298:argv(0) god
;299:==================
;300:*/
;301:void Cmd_God_f(gentity_t* ent) {
line 304
;302:	const char* msg;
;303:
;304:	if (!CheatsOk(ent)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $191
line 305
;305:		return;
ADDRGP4 $190
JUMPV
LABELV $191
line 308
;306:	}
;307:
;308:	ent->flags ^= FL_GODMODE;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 16
BXORI4
ASGNI4
line 309
;309:	if (!(ent->flags & FL_GODMODE))
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $193
line 310
;310:		msg = "godmode OFF\n";
ADDRLP4 0
ADDRGP4 $195
ASGNP4
ADDRGP4 $194
JUMPV
LABELV $193
line 312
;311:	else
;312:		msg = "godmode ON\n";
ADDRLP4 0
ADDRGP4 $196
ASGNP4
LABELV $194
line 314
;313:
;314:	trap_SendServerCommand(ent - g_entities, va("print \"%s\"", msg));
ADDRGP4 $197
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 315
;315:}
LABELV $190
endproc Cmd_God_f 16 8
export Cmd_Notarget_f
proc Cmd_Notarget_f 16 8
line 326
;316:
;317:/*
;318:==================
;319:Cmd_Notarget_f
;320:
;321:Sets client to notarget
;322:
;323:argv(0) notarget
;324:==================
;325:*/
;326:void Cmd_Notarget_f(gentity_t* ent) {
line 329
;327:	const char* msg;
;328:
;329:	if (!CheatsOk(ent)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $199
line 330
;330:		return;
ADDRGP4 $198
JUMPV
LABELV $199
line 333
;331:	}
;332:
;333:	ent->flags ^= FL_NOTARGET;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BXORI4
ASGNI4
line 334
;334:	if (!(ent->flags & FL_NOTARGET))
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
NEI4 $201
line 335
;335:		msg = "notarget OFF\n";
ADDRLP4 0
ADDRGP4 $203
ASGNP4
ADDRGP4 $202
JUMPV
LABELV $201
line 337
;336:	else
;337:		msg = "notarget ON\n";
ADDRLP4 0
ADDRGP4 $204
ASGNP4
LABELV $202
line 339
;338:
;339:	trap_SendServerCommand(ent - g_entities, va("print \"%s\"", msg));
ADDRGP4 $197
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 340
;340:}
LABELV $198
endproc Cmd_Notarget_f 16 8
export Cmd_Noclip_f
proc Cmd_Noclip_f 20 8
line 349
;341:
;342:/*
;343:==================
;344:Cmd_Noclip_f
;345:
;346:argv(0) noclip
;347:==================
;348:*/
;349:void Cmd_Noclip_f(gentity_t* ent) {
line 352
;350:	const char* msg;
;351:
;352:	if (!CheatsOk(ent)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $206
line 353
;353:		return;
ADDRGP4 $205
JUMPV
LABELV $206
line 356
;354:	}
;355:
;356:	if (ent->client->noclip) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $208
line 357
;357:		msg = "noclip OFF\n";
ADDRLP4 0
ADDRGP4 $210
ASGNP4
line 358
;358:	} else {
ADDRGP4 $209
JUMPV
LABELV $208
line 359
;359:		msg = "noclip ON\n";
ADDRLP4 0
ADDRGP4 $211
ASGNP4
line 360
;360:	}
LABELV $209
line 361
;361:	ent->client->noclip = !ent->client->noclip;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
NEI4 $213
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $214
JUMPV
LABELV $213
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $214
ADDRLP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 363
;362:
;363:	trap_SendServerCommand(ent - g_entities, va("print \"%s\"", msg));
ADDRGP4 $197
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 364
;364:}
LABELV $205
endproc Cmd_Noclip_f 20 8
export Cmd_LevelShot_f
proc Cmd_LevelShot_f 4 8
line 376
;365:
;366:/*
;367:==================
;368:Cmd_LevelShot_f
;369:
;370:This is just to help generate the level pictures
;371:for the menus.  It goes to the intermission immediately
;372:and sends over a command to the client to resize the view,
;373:hide the scoreboard, and take a special screenshot
;374:==================
;375:*/
;376:void Cmd_LevelShot_f(gentity_t* ent) {
line 377
;377:	if (!CheatsOk(ent)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 CheatsOk
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $216
line 378
;378:		return;
ADDRGP4 $215
JUMPV
LABELV $216
line 382
;379:	}
;380:
;381:	// doesn't work in single player
;382:	if (g_gametype.integer == GT_SINGLE_PLAYER) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $218
line 383
;383:		trap_SendServerCommand(ent - g_entities, "print \"Must be in g_gametype 0 for levelshot\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $221
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 384
;384:		return;
ADDRGP4 $215
JUMPV
LABELV $218
line 387
;385:	}
;386:
;387:	if (!ent->client->pers.localClient) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 0
NEI4 $222
line 388
;388:		trap_SendServerCommand(ent - g_entities, "print \"The levelshot command must be executed by a local client\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $224
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 389
;389:		return;
ADDRGP4 $215
JUMPV
LABELV $222
line 392
;390:	}
;391:
;392:	BeginIntermission();
ADDRGP4 BeginIntermission
CALLV
pop
line 393
;393:	trap_SendServerCommand(ent - g_entities, "clientLevelShot");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $225
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 394
;394:}
LABELV $215
endproc Cmd_LevelShot_f 4 8
export Cmd_TeamTask_f
proc Cmd_TeamTask_f 2068 12
line 401
;395:
;396:/*
;397:==================
;398:Cmd_TeamTask_f
;399:==================
;400:*/
;401:void Cmd_TeamTask_f(gentity_t* ent) {
line 405
;402:	char userinfo[MAX_INFO_STRING];
;403:	char arg[MAX_TOKEN_CHARS];
;404:	int  task;
;405:	int  client = ent->client - level.clients;
ADDRLP4 1024
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1576
DIVI4
ASGNI4
line 407
;406:
;407:	if (trap_Argc() != 2) {
ADDRLP4 2056
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 2
EQI4 $227
line 408
;408:		return;
ADDRGP4 $226
JUMPV
LABELV $227
line 410
;409:	}
;410:	trap_Argv(1, arg, sizeof(arg));
CNSTI4 1
ARGI4
ADDRLP4 1028
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 411
;411:	task = atoi(arg);
ADDRLP4 1028
ARGP4
ADDRLP4 2060
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 2052
ADDRLP4 2060
INDIRI4
ASGNI4
line 413
;412:
;413:	trap_GetUserinfo(client, userinfo, sizeof(userinfo));
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 414
;414:	Info_SetValueForKey(userinfo, "teamtask", va("%d", task));
ADDRGP4 $230
ARGP4
ADDRLP4 2052
INDIRI4
ARGI4
ADDRLP4 2064
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ARGP4
ADDRGP4 $229
ARGP4
ADDRLP4 2064
INDIRP4
ARGP4
ADDRGP4 Info_SetValueForKey
CALLI4
pop
line 415
;415:	trap_SetUserinfo(client, userinfo);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_SetUserinfo
CALLV
pop
line 416
;416:	ClientUserinfoChanged(client);
ADDRLP4 1024
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 417
;417:}
LABELV $226
endproc Cmd_TeamTask_f 2068 12
export Cmd_Kill_f
proc Cmd_Kill_f 16 20
line 424
;418:
;419:/*
;420:=================
;421:Cmd_Kill_f
;422:=================
;423:*/
;424:void Cmd_Kill_f(gentity_t* ent) {
line 425
;425:	if (ent->client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $232
line 426
;426:		return;
ADDRGP4 $231
JUMPV
LABELV $232
line 428
;427:	}
;428:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $234
line 429
;429:		return;
ADDRGP4 $231
JUMPV
LABELV $234
line 431
;430:	}
;431:	ent->flags &= ~FL_GODMODE;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 432
;432:	ent->client->ps.stats[STAT_HEALTH] = ent->health = -999;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
CNSTI4 -999
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 433
;433:	player_die(ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 player_die
CALLV
pop
line 434
;434:}
LABELV $231
endproc Cmd_Kill_f 16 20
export BroadcastTeamChange
proc BroadcastTeamChange 8 8
line 443
;435:
;436:/*
;437:=================
;438:BroadcastTeamChange
;439:
;440:Let everyone know about a team change
;441:=================
;442:*/
;443:void BroadcastTeamChange(gclient_t* client, team_t oldTeam) {
line 444
;444:	int clientNum = client - level.clients;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1576
DIVI4
ASGNI4
line 446
;445:
;446:	if (client->sess.sessionTeam == TEAM_RED) {
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
NEI4 $237
line 447
;447:		G_BroadcastServerCommand(clientNum, va("cp \"%s" S_COLOR_WHITE " joined the " S_COLOR_RED "red" S_COLOR_WHITE " team.\n\"", client->pers.netname));
ADDRGP4 $239
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 448
;448:	} else if (client->sess.sessionTeam == TEAM_BLUE) {
ADDRGP4 $238
JUMPV
LABELV $237
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $240
line 449
;449:		G_BroadcastServerCommand(clientNum, va("cp \"%s" S_COLOR_WHITE " joined the " S_COLOR_BLUE "blue" S_COLOR_WHITE " team.\n\"", client->pers.netname));
ADDRGP4 $242
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 450
;450:	} else if (client->sess.sessionTeam == TEAM_SPECTATOR && oldTeam != TEAM_SPECTATOR) {
ADDRGP4 $241
JUMPV
LABELV $240
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $243
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $243
line 451
;451:		G_BroadcastServerCommand(clientNum, va("cp \"%s" S_COLOR_WHITE " joined the spectators.\n\"", client->pers.netname));
ADDRGP4 $245
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 452
;452:	} else if (client->sess.sessionTeam == TEAM_FREE) {
ADDRGP4 $244
JUMPV
LABELV $243
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $246
line 453
;453:		G_BroadcastServerCommand(clientNum, va("cp \"%s" S_COLOR_WHITE " joined the battle.\n\"", client->pers.netname));
ADDRGP4 $248
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 454
;454:	}
LABELV $246
LABELV $244
LABELV $241
LABELV $238
line 455
;455:}
LABELV $236
endproc BroadcastTeamChange 8 8
proc AllowTeamSwitch 24 8
line 457
;456:
;457:static qboolean AllowTeamSwitch(int clientNum, team_t newTeam) {
line 459
;458:
;459:	if (g_teamForceBalance.integer) {
ADDRGP4 g_teamForceBalance+12
INDIRI4
CNSTI4 0
EQI4 $250
line 462
;460:		int counts[TEAM_NUM_TEAMS];
;461:
;462:		counts[TEAM_BLUE] = TeamCount(clientNum, TEAM_BLUE);
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 16
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 16
INDIRI4
ASGNI4
line 463
;463:		counts[TEAM_RED]  = TeamCount(clientNum, TEAM_RED);
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 20
ADDRGP4 TeamCount
CALLI4
ASGNI4
ADDRLP4 0+4
ADDRLP4 20
INDIRI4
ASGNI4
line 466
;464:
;465:		// We allow a spread of two
;466:		if (newTeam == TEAM_RED && counts[TEAM_RED] - counts[TEAM_BLUE] > 1) {
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $255
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
SUBI4
CNSTI4 1
LEI4 $255
line 467
;467:			trap_SendServerCommand(clientNum, "cp \"Red team has too many players.\n\"");
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $259
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 468
;468:			return qfalse;  // ignore the request
CNSTI4 0
RETI4
ADDRGP4 $249
JUMPV
LABELV $255
line 471
;469:		}
;470:
;471:		if (newTeam == TEAM_BLUE && counts[TEAM_BLUE] - counts[TEAM_RED] > 1) {
ADDRFP4 4
INDIRI4
CNSTI4 2
NEI4 $260
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
SUBI4
CNSTI4 1
LEI4 $260
line 472
;472:			trap_SendServerCommand(clientNum, "cp \"Blue team has too many players.\n\"");
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $264
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 473
;473:			return qfalse;  // ignore the request
CNSTI4 0
RETI4
ADDRGP4 $249
JUMPV
LABELV $260
line 477
;474:		}
;475:
;476:		// It's ok, the team we are switching to has less or same number of players
;477:	}
LABELV $250
line 479
;478:
;479:	return qtrue;
CNSTI4 1
RETI4
LABELV $249
endproc AllowTeamSwitch 24 8
export SetTeam
proc SetTeam 76 20
line 487
;480:}
;481:
;482:/*
;483:=================
;484:SetTeam
;485:=================
;486:*/
;487:qboolean SetTeam(gentity_t* ent, const char* s) {
line 500
;488:	team_t           team, oldTeam;
;489:	gclient_t*       client;
;490:	int              clientNum;
;491:	spectatorState_t specState;
;492:	int              specClient;
;493:	int              teamLeader;
;494:	qboolean         checkTeamLeader;
;495:
;496:	//
;497:	// see what change is requested
;498:	//
;499:
;500:	clientNum = ent - g_entities;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ASGNI4
line 501
;501:	client    = level.clients + clientNum;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 504
;502:
;503:	// early team override
;504:	if (client->pers.connected == CON_CONNECTING && g_gametype.integer >= GT_TEAM) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $266
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $266
line 505
;505:		if (!Q_stricmp(s, "red") || !Q_stricmp(s, "r")) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $271
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $273
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $272
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $269
LABELV $273
line 506
;506:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 507
;507:		} else if (!Q_stricmp(s, "blue") || !Q_stricmp(s, "b")) {
ADDRGP4 $270
JUMPV
LABELV $269
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $276
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $278
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $274
LABELV $278
line 508
;508:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 509
;509:		} else {
ADDRGP4 $275
JUMPV
LABELV $274
line 510
;510:			team = -1;
ADDRLP4 4
CNSTI4 -1
ASGNI4
line 511
;511:		}
LABELV $275
LABELV $270
line 512
;512:		if (team != -1 && AllowTeamSwitch(clientNum, team)) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $279
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 AllowTeamSwitch
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
EQI4 $279
line 513
;513:			client->sess.sessionTeam     = team;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 514
;514:			client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 515
;515:			G_WriteClientSessionData(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 517
;516:			// count current clients and rank for scoreboard
;517:			CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 518
;518:		}
LABELV $279
line 519
;519:		return qfalse;  // bypass flood protection
CNSTI4 0
RETI4
ADDRGP4 $265
JUMPV
LABELV $266
line 522
;520:	}
;521:
;522:	specClient = clientNum;
ADDRLP4 20
ADDRLP4 12
INDIRI4
ASGNI4
line 523
;523:	specState  = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 524
;524:	if (!Q_stricmp(s, "scoreboard") || !Q_stricmp(s, "score")) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $283
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $285
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $281
LABELV $285
line 525
;525:		team      = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 526
;526:		specState = SPECTATOR_SCOREBOARD;
ADDRLP4 16
CNSTI4 3
ASGNI4
line 527
;527:	} else if (!Q_stricmp(s, "follow1")) {
ADDRGP4 $282
JUMPV
LABELV $281
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 40
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $286
line 528
;528:		team       = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 529
;529:		specState  = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 530
;530:		specClient = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 531
;531:	} else if (!Q_stricmp(s, "follow2")) {
ADDRGP4 $287
JUMPV
LABELV $286
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $291
ARGP4
ADDRLP4 44
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 0
NEI4 $289
line 532
;532:		team       = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 533
;533:		specState  = SPECTATOR_FOLLOW;
ADDRLP4 16
CNSTI4 2
ASGNI4
line 534
;534:		specClient = -2;
ADDRLP4 20
CNSTI4 -2
ASGNI4
line 535
;535:	} else if (!Q_stricmp(s, "spectator") || !Q_stricmp(s, "s")) {
ADDRGP4 $290
JUMPV
LABELV $289
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $294
ARGP4
ADDRLP4 48
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $296
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $295
ARGP4
ADDRLP4 52
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 0
NEI4 $292
LABELV $296
line 536
;536:		team      = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 537
;537:		specState = SPECTATOR_FREE;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 538
;538:	} else if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 $293
JUMPV
LABELV $292
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $297
line 540
;539:		// if running a team game, assign player to one of the teams
;540:		specState = SPECTATOR_NOT;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 541
;541:		if (!Q_stricmp(s, "red") || !Q_stricmp(s, "r")) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $271
ARGP4
ADDRLP4 56
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 0
EQI4 $302
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $272
ARGP4
ADDRLP4 60
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $300
LABELV $302
line 542
;542:			team = TEAM_RED;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 543
;543:		} else if (!Q_stricmp(s, "blue") || !Q_stricmp(s, "b")) {
ADDRGP4 $301
JUMPV
LABELV $300
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $276
ARGP4
ADDRLP4 64
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $305
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $277
ARGP4
ADDRLP4 68
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 0
NEI4 $303
LABELV $305
line 544
;544:			team = TEAM_BLUE;
ADDRLP4 4
CNSTI4 2
ASGNI4
line 545
;545:		} else {
ADDRGP4 $304
JUMPV
LABELV $303
line 547
;546:			// pick the team with the least number of players
;547:			team = PickTeam(clientNum);
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 PickTeam
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 72
INDIRI4
ASGNI4
line 548
;548:		}
LABELV $304
LABELV $301
line 550
;549:
;550:		if (!AllowTeamSwitch(clientNum, team)) {
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 AllowTeamSwitch
CALLI4
ASGNI4
ADDRLP4 72
INDIRI4
CNSTI4 0
NEI4 $298
line 551
;551:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $265
JUMPV
line 554
;552:		}
;553:
;554:	} else {
LABELV $297
line 556
;555:		// force them to spectators if there aren't any spots free
;556:		team = TEAM_FREE;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 557
;557:	}
LABELV $298
LABELV $293
LABELV $290
LABELV $287
LABELV $282
line 560
;558:
;559:	// override decision if limiting the players
;560:	if ((g_gametype.integer == GT_TOURNAMENT) && level.numNonSpectatorClients >= 2) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $308
ADDRGP4 level+80
INDIRI4
CNSTI4 2
LTI4 $308
line 561
;561:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 562
;562:	} else if (g_maxGameClients.integer > 0 && level.numNonSpectatorClients >= g_maxGameClients.integer) {
ADDRGP4 $309
JUMPV
LABELV $308
ADDRGP4 g_maxGameClients+12
INDIRI4
CNSTI4 0
LEI4 $312
ADDRGP4 level+80
INDIRI4
ADDRGP4 g_maxGameClients+12
INDIRI4
LTI4 $312
line 563
;563:		team = TEAM_SPECTATOR;
ADDRLP4 4
CNSTI4 3
ASGNI4
line 564
;564:	}
LABELV $312
LABELV $309
line 569
;565:
;566:	//
;567:	// decide if we will allow the change
;568:	//
;569:	oldTeam = client->sess.sessionTeam;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 570
;570:	if (team == oldTeam) {
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $317
line 571
;571:		if (team != TEAM_SPECTATOR)
ADDRLP4 4
INDIRI4
CNSTI4 3
EQI4 $319
line 572
;572:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $265
JUMPV
LABELV $319
line 575
;573:
;574:		// do soft release if possible
;575:		if ((client->ps.pm_flags & PMF_FOLLOW) && client->sess.spectatorState == SPECTATOR_FOLLOW) {
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $321
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $321
line 576
;576:			StopFollowing(ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 577
;577:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $265
JUMPV
LABELV $321
line 581
;578:		}
;579:
;580:		// second spectator team request will move player to intermission point
;581:		if (client->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR && !(client->ps.pm_flags & PMF_FOLLOW) && client->sess.spectatorState == SPECTATOR_FREE) {
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 3
NEI4 $323
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $323
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 1
NEI4 $323
line 582
;582:			VectorCopy(level.intermission_origin, ent->s.origin);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 583
;583:			VectorCopy(level.intermission_origin, client->ps.origin);
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 584
;584:			SetClientViewAngle(ent, level.intermission_angle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 level+7628
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 585
;585:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $265
JUMPV
LABELV $323
line 587
;586:		}
;587:	}
LABELV $317
line 594
;588:
;589:	//
;590:	// execute the team change
;591:	//
;592:
;593:	// if the player was dead leave the body
;594:	if (ent->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $328
line 595
;595:		CopyToBodyQue(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
line 596
;596:	}
LABELV $328
line 599
;597:
;598:	// he starts at 'base'
;599:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 601
;600:
;601:	if (oldTeam != TEAM_SPECTATOR) {
ADDRLP4 8
INDIRI4
CNSTI4 3
EQI4 $330
line 604
;602:
;603:		// revert any casted votes
;604:		if (oldTeam != team)
ADDRLP4 8
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $332
line 605
;605:			G_RevertVote(ent->client);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_RevertVote
CALLV
pop
LABELV $332
line 608
;606:
;607:		// Kill him (makes sure he loses flags, etc)
;608:		ent->flags &= ~FL_GODMODE;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 -17
BANDI4
ASGNI4
line 609
;609:		ent->client->ps.stats[STAT_HEALTH] = ent->health = 0;
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 64
INDIRI4
ASGNI4
line 610
;610:		player_die(ent, ent, ent, 100000, MOD_SUICIDE);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 100000
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 player_die
CALLV
pop
line 611
;611:	}
LABELV $330
line 614
;612:
;613:	// they go to the end of the line for tournements
;614:	if (team == TEAM_SPECTATOR) {
ADDRLP4 4
INDIRI4
CNSTI4 3
NEI4 $334
line 615
;615:		client->sess.spectatorTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
CNSTI4 0
ASGNI4
line 616
;616:	}
LABELV $334
line 618
;617:
;618:	client->sess.sessionTeam     = team;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 619
;619:	client->sess.spectatorState  = specState;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 620
;620:	client->sess.spectatorClient = specClient;
ADDRLP4 0
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 20
INDIRI4
ASGNI4
line 622
;621:
;622:	checkTeamLeader         = client->sess.teamLeader;
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ASGNI4
line 623
;623:	client->sess.teamLeader = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
CNSTI4 0
ASGNI4
line 625
;624:
;625:	if (team == TEAM_RED || team == TEAM_BLUE) {
ADDRLP4 4
INDIRI4
CNSTI4 1
EQI4 $338
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $336
LABELV $338
line 626
;626:		teamLeader = TeamLeader(team);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 60
ADDRGP4 TeamLeader
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 60
INDIRI4
ASGNI4
line 628
;627:		// if there is no team leader or the team leader is a bot and this client is not a bot
;628:		if (teamLeader == -1 || (!(g_entities[clientNum].r.svFlags & SVF_BOT) && (g_entities[teamLeader].r.svFlags & SVF_BOT))) {
ADDRLP4 64
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 -1
EQI4 $345
ADDRLP4 12
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $339
ADDRLP4 64
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+208+216
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $339
LABELV $345
line 629
;629:			SetLeader(team, clientNum);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 SetLeader
CALLV
pop
line 630
;630:		}
LABELV $339
line 631
;631:	}
LABELV $336
line 634
;632:
;633:	// make sure there is a team leader on the team the player came from
;634:	if (oldTeam == TEAM_RED || oldTeam == TEAM_BLUE) {
ADDRLP4 8
INDIRI4
CNSTI4 1
EQI4 $348
ADDRLP4 8
INDIRI4
CNSTI4 2
NEI4 $346
LABELV $348
line 635
;635:		if (checkTeamLeader) {
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $349
line 636
;636:			CheckTeamLeader(oldTeam);
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
line 637
;637:		}
LABELV $349
line 638
;638:	}
LABELV $346
line 640
;639:
;640:	G_WriteClientSessionData(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 642
;641:
;642:	BroadcastTeamChange(client, oldTeam);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 645
;643:
;644:	// get and distribute relevent paramters
;645:	ClientUserinfoChanged(clientNum);
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 647
;646:
;647:	ClientBegin(clientNum);
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 649
;648:
;649:	return qtrue;
CNSTI4 1
RETI4
LABELV $265
endproc SetTeam 76 20
export StopFollowing
proc StopFollowing 12 12
line 660
;650:}
;651:
;652:/*
;653:=================
;654:StopFollowing
;655:
;656:If the client being followed leaves the game, or you just want to drop
;657:to free floating spectator mode
;658:=================
;659:*/
;660:void StopFollowing(gentity_t* ent, qboolean release) {
line 663
;661:	gclient_t* client;
;662:
;663:	if (ent->r.svFlags & SVF_BOT || !ent->inuse)
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $354
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $352
LABELV $354
line 664
;664:		return;
ADDRGP4 $351
JUMPV
LABELV $352
line 666
;665:
;666:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 668
;667:
;668:	client->ps.persistant[PERS_TEAM] = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 3
ASGNI4
line 669
;669:	client->sess.sessionTeam         = TEAM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 3
ASGNI4
line 670
;670:	if (release) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $355
line 671
;671:		client->ps.stats[STAT_HEALTH] = ent->health = 1;
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 672
;672:		memset(client->ps.powerups, 0, sizeof(client->ps.powerups));
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 memset
CALLP4
pop
line 673
;673:	}
LABELV $355
line 674
;674:	SetClientViewAngle(ent, client->ps.viewangles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 676
;675:
;676:	client->sess.spectatorState = SPECTATOR_FREE;
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 1
ASGNI4
line 677
;677:	client->ps.pm_flags &= ~PMF_FOLLOW;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 680
;678:	// ent->r.svFlags &= ~SVF_BOT;
;679:
;680:	client->ps.clientNum = ent - g_entities;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ASGNI4
line 681
;681:}
LABELV $351
endproc StopFollowing 12 12
proc Cmd_Team_f 1036 12
line 688
;682:
;683:/*
;684:=================
;685:Cmd_Team_f
;686:=================
;687:*/
;688:static void Cmd_Team_f(gentity_t* ent) {
line 691
;689:	char s[MAX_TOKEN_CHARS];
;690:
;691:	if (trap_Argc() != 2) {
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
EQI4 $358
line 692
;692:		switch (ent->client->sess.sessionTeam) {
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
LTI4 $357
ADDRLP4 1028
INDIRI4
CNSTI4 3
GTI4 $357
ADDRLP4 1028
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $371
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $371
address $367
address $365
address $363
address $369
code
LABELV $363
line 694
;693:		case TEAM_BLUE:
;694:			trap_SendServerCommand(ent - g_entities, "print \"Blue team\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $364
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 695
;695:			break;
ADDRGP4 $357
JUMPV
LABELV $365
line 697
;696:		case TEAM_RED:
;697:			trap_SendServerCommand(ent - g_entities, "print \"Red team\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $366
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 698
;698:			break;
ADDRGP4 $357
JUMPV
LABELV $367
line 700
;699:		case TEAM_FREE:
;700:			trap_SendServerCommand(ent - g_entities, "print \"Free team\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $368
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 701
;701:			break;
ADDRGP4 $357
JUMPV
LABELV $369
line 703
;702:		case TEAM_SPECTATOR:
;703:			trap_SendServerCommand(ent - g_entities, "print \"Spectator team\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $370
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 704
;704:			break;
line 706
;705:		default:
;706:			break;
line 708
;707:		}
;708:		return;
ADDRGP4 $357
JUMPV
LABELV $358
line 711
;709:	}
;710:
;711:	if (ent->client->switchTeamTime > level.time) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 772
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $372
line 712
;712:		trap_SendServerCommand(ent - g_entities, "print \"May not switch teams more than once per 5 seconds.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $375
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 713
;713:		return;
ADDRGP4 $357
JUMPV
LABELV $372
line 717
;714:	}
;715:
;716:	// if they are playing a tournement game, count as a loss
;717:	if ((g_gametype.integer == GT_TOURNAMENT) && ent->client->sess.sessionTeam == TEAM_FREE) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $376
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $376
line 718
;718:		ent->client->sess.losses++;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ASGNP4
ADDRLP4 1028
INDIRP4
ADDRLP4 1028
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 719
;719:	}
LABELV $376
line 721
;720:
;721:	trap_Argv(1, s, sizeof(s));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 723
;722:
;723:	if (SetTeam(ent, s)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 SetTeam
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
EQI4 $379
line 724
;724:		ent->client->switchTeamTime = level.time + 5000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 772
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 725
;725:	}
LABELV $379
line 726
;726:}
LABELV $357
endproc Cmd_Team_f 1036 12
proc Cmd_Follow_f 1040 12
line 733
;727:
;728:/*
;729:=================
;730:Cmd_Follow_f
;731:=================
;732:*/
;733:static void Cmd_Follow_f(gentity_t* ent) {
line 737
;734:	int  i;
;735:	char arg[MAX_TOKEN_CHARS];
;736:
;737:	if (trap_Argc() != 2) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 2
EQI4 $383
line 738
;738:		if (ent->client->sess.spectatorState == SPECTATOR_FOLLOW) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $382
line 739
;739:			StopFollowing(ent, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 740
;740:		}
line 741
;741:		return;
ADDRGP4 $382
JUMPV
LABELV $383
line 744
;742:	}
;743:
;744:	trap_Argv(1, arg, sizeof(arg));
CNSTI4 1
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 745
;745:	i = ClientNumberFromString(ent, arg);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1032
ADDRGP4 ClientNumberFromString
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1032
INDIRI4
ASGNI4
line 746
;746:	if (i == -1) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
NEI4 $387
line 747
;747:		return;
ADDRGP4 $382
JUMPV
LABELV $387
line 751
;748:	}
;749:
;750:	// can't follow self
;751:	if (&level.clients[i] == ent->client) {
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CVPU4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
NEU4 $389
line 752
;752:		return;
ADDRGP4 $382
JUMPV
LABELV $389
line 756
;753:	}
;754:
;755:	// can't follow another spectator
;756:	if (level.clients[i].sess.sessionTeam == TEAM_SPECTATOR) {
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $391
line 757
;757:		return;
ADDRGP4 $382
JUMPV
LABELV $391
line 761
;758:	}
;759:
;760:	// if they are playing a tournement game, count as a loss
;761:	if ((g_gametype.integer == GT_TOURNAMENT) && ent->client->sess.sessionTeam == TEAM_FREE) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $393
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $393
line 762
;762:		ent->client->sess.losses++;
ADDRLP4 1036
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ASGNP4
ADDRLP4 1036
INDIRP4
ADDRLP4 1036
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 763
;763:	}
LABELV $393
line 766
;764:
;765:	// first set them to spectator
;766:	if (ent->client->sess.sessionTeam != TEAM_SPECTATOR) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $396
line 767
;767:		SetTeam(ent, "spectator");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $294
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 768
;768:	}
LABELV $396
line 770
;769:
;770:	ent->client->sess.spectatorState  = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 2
ASGNI4
line 771
;771:	ent->client->sess.spectatorClient = i;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 772
;772:}
LABELV $382
endproc Cmd_Follow_f 1040 12
export Cmd_FollowCycle_f
proc Cmd_FollowCycle_f 16 8
line 779
;773:
;774:/*
;775:=================
;776:Cmd_FollowCycle_f
;777:=================
;778:*/
;779:void Cmd_FollowCycle_f(gentity_t* ent, int dir) {
line 785
;780:	int        clientnum;
;781:	int        original;
;782:	gclient_t* client;
;783:
;784:	// if they are playing a tournement game, count as a loss
;785:	if ((g_gametype.integer == GT_TOURNAMENT) && ent->client->sess.sessionTeam == TEAM_FREE) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $399
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $399
line 786
;786:		ent->client->sess.losses++;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 644
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 787
;787:	}
LABELV $399
line 789
;788:
;789:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 792
;790:
;791:	// first set them to spectator
;792:	if (client->sess.spectatorState == SPECTATOR_NOT) {
ADDRLP4 8
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 0
NEI4 $402
line 793
;793:		SetTeam(ent, "spectator");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $294
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 794
;794:	}
LABELV $402
line 796
;795:
;796:	if (dir != 1 && dir != -1) {
ADDRLP4 12
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
EQI4 $404
ADDRLP4 12
INDIRI4
CNSTI4 -1
EQI4 $404
line 797
;797:		G_Error("Cmd_FollowCycle_f: bad dir %i", dir);
ADDRGP4 $406
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_Error
CALLV
pop
line 798
;798:	}
LABELV $404
line 800
;799:
;800:	clientnum = client->sess.spectatorClient;
ADDRLP4 0
ADDRLP4 8
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ASGNI4
line 801
;801:	original  = clientnum;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
LABELV $407
line 802
;802:	do {
line 803
;803:		clientnum += dir;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
line 804
;804:		if (clientnum >= level.maxclients) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $410
line 805
;805:			clientnum = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 806
;806:		}
LABELV $410
line 807
;807:		if (clientnum < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $413
line 808
;808:			clientnum = level.maxclients - 1;
ADDRLP4 0
ADDRGP4 level+24
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 809
;809:		}
LABELV $413
line 812
;810:
;811:		// can only follow connected clients
;812:		if (level.clients[clientnum].pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $416
line 813
;813:			continue;
ADDRGP4 $408
JUMPV
LABELV $416
line 817
;814:		}
;815:
;816:		// can't follow another spectator
;817:		if (level.clients[clientnum].sess.sessionTeam == TEAM_SPECTATOR) {
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $418
line 818
;818:			continue;
ADDRGP4 $408
JUMPV
LABELV $418
line 822
;819:		}
;820:
;821:		// this is good, we can use it
;822:		ent->client->sess.spectatorClient = clientnum;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 636
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 823
;823:		ent->client->sess.spectatorState  = SPECTATOR_FOLLOW;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 2
ASGNI4
line 824
;824:		return;
ADDRGP4 $398
JUMPV
LABELV $408
line 825
;825:	} while (clientnum != original);
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $407
line 828
;826:
;827:	// leave it where it was
;828:}
LABELV $398
endproc Cmd_FollowCycle_f 16 8
proc G_SayTo 12 28
line 835
;829:
;830:/*
;831:==================
;832:G_Say
;833:==================
;834:*/
;835:static void G_SayTo(gentity_t* ent, gentity_t* other, int mode, int color, const char* name, const char* message) {
line 836
;836:	if (!other) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $421
line 837
;837:		return;
ADDRGP4 $420
JUMPV
LABELV $421
line 839
;838:	}
;839:	if (!other->inuse) {
ADDRFP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $423
line 840
;840:		return;
ADDRGP4 $420
JUMPV
LABELV $423
line 842
;841:	}
;842:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $425
line 843
;843:		return;
ADDRGP4 $420
JUMPV
LABELV $425
line 845
;844:	}
;845:	if (other->client->pers.connected != CON_CONNECTED) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $427
line 846
;846:		return;
ADDRGP4 $420
JUMPV
LABELV $427
line 848
;847:	}
;848:	if (mode == SAY_TEAM && !OnSameTeam(ent, other)) {
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $429
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $429
line 849
;849:		return;
ADDRGP4 $420
JUMPV
LABELV $429
line 852
;850:	}
;851:	// no chatting to players in tournements
;852:	if ((g_gametype.integer == GT_TOURNAMENT) && other->client->sess.sessionTeam == TEAM_FREE && ent->client->sess.sessionTeam != TEAM_FREE) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $431
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
NEI4 $431
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 0
EQI4 $431
line 853
;853:		return;
ADDRGP4 $420
JUMPV
LABELV $431
line 856
;854:	}
;855:
;856:	trap_SendServerCommand(
ADDRGP4 $434
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $438
ADDRLP4 4
ADDRGP4 $435
ASGNP4
ADDRGP4 $439
JUMPV
LABELV $438
ADDRLP4 4
ADDRGP4 $436
ASGNP4
LABELV $439
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 94
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 20
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 858
;857:		other - g_entities, va("%s \"%s%c%c%s\" %i", mode == SAY_TEAM ? "tchat" : "chat", name, Q_COLOR_ESCAPE, color, message, ent - g_entities));
;858:}
LABELV $420
endproc G_SayTo 12 28
proc G_Say 388 28
line 862
;859:
;860:#define EC "\x19"
;861:
;862:static void G_Say(gentity_t* ent, gentity_t* target, int mode, const char* chatText) {
line 871
;863:	int        j;
;864:	gentity_t* other;
;865:	int        color;
;866:	char       name[64 + 64 + 12];  // name + location + formatting
;867:	// don't let text be too long for malicious reasons
;868:	char text[MAX_SAY_TEXT];
;869:	char location[64];
;870:
;871:	if (g_gametype.integer < GT_TEAM && mode == SAY_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
GEI4 $441
ADDRFP4 8
INDIRI4
CNSTI4 1
NEI4 $441
line 872
;872:		mode = SAY_ALL;
ADDRFP4 8
CNSTI4 0
ASGNI4
line 873
;873:	}
LABELV $441
line 875
;874:
;875:	switch (mode) {
ADDRLP4 368
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 368
INDIRI4
CNSTI4 0
EQI4 $446
ADDRLP4 368
INDIRI4
CNSTI4 1
EQI4 $449
ADDRLP4 368
INDIRI4
CNSTI4 2
EQI4 $455
ADDRGP4 $444
JUMPV
LABELV $444
LABELV $446
line 878
;876:	default:
;877:	case SAY_ALL:
;878:		G_LogPrintf("say: %s: %s\n", ent->client->pers.netname, chatText);
ADDRGP4 $447
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 879
;879:		Com_sprintf(name, sizeof(name), "%s%c%c" EC ": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE);
ADDRLP4 158
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 $448
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 880
;880:		color = COLOR_GREEN;
ADDRLP4 300
CNSTI4 50
ASGNI4
line 881
;881:		break;
ADDRGP4 $445
JUMPV
LABELV $449
line 883
;882:	case SAY_TEAM:
;883:		G_LogPrintf("sayteam: %s: %s\n", ent->client->pers.netname, chatText);
ADDRGP4 $450
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 884
;884:		if (Team_GetLocationMsg(ent, location, sizeof(location)))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 304
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 372
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 372
INDIRI4
CNSTI4 0
EQI4 $451
line 885
;885:			Com_sprintf(name, sizeof(name), EC "(%s%c%c" EC ") (%s)" EC ": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
ADDRLP4 158
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 $453
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 304
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
ADDRGP4 $452
JUMPV
LABELV $451
line 887
;886:		else
;887:			Com_sprintf(name, sizeof(name), EC "(%s%c%c" EC ")" EC ": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE);
ADDRLP4 158
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 $454
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
LABELV $452
line 888
;888:		color = COLOR_CYAN;
ADDRLP4 300
CNSTI4 53
ASGNI4
line 889
;889:		break;
ADDRGP4 $445
JUMPV
LABELV $455
line 891
;890:	case SAY_TELL:
;891:		if (target && target->inuse && target->client && g_gametype.integer >= GT_TEAM && target->client->sess.sessionTeam == ent->client->sess.sessionTeam &&
ADDRLP4 376
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 376
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $456
ADDRLP4 376
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $456
ADDRLP4 376
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $456
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $456
ADDRLP4 380
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 376
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 380
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
NEI4 $456
ADDRLP4 380
INDIRP4
ARGP4
ADDRLP4 304
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 384
ADDRGP4 Team_GetLocationMsg
CALLI4
ASGNI4
ADDRLP4 384
INDIRI4
CNSTI4 0
EQI4 $456
line 893
;892:		    Team_GetLocationMsg(ent, location, sizeof(location)))
;893:			Com_sprintf(name, sizeof(name), EC "[%s%c%c" EC "] (%s)" EC ": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE, location);
ADDRLP4 158
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 $459
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRLP4 304
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
ADDRGP4 $457
JUMPV
LABELV $456
line 895
;894:		else
;895:			Com_sprintf(name, sizeof(name), EC "[%s%c%c" EC "]" EC ": ", ent->client->pers.netname, Q_COLOR_ESCAPE, COLOR_WHITE);
ADDRLP4 158
ARGP4
CNSTI4 140
ARGI4
ADDRGP4 $460
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 94
ARGI4
CNSTI4 55
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
LABELV $457
line 896
;896:		color = COLOR_MAGENTA;
ADDRLP4 300
CNSTI4 54
ASGNI4
line 897
;897:		break;
LABELV $445
line 900
;898:	}
;899:
;900:	Q_strncpyz(text, chatText, sizeof(text));
ADDRLP4 8
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
CNSTI4 150
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 902
;901:
;902:	if (target) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $461
line 903
;903:		G_SayTo(ent, target, mode, color, name, text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 300
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 904
;904:		return;
ADDRGP4 $440
JUMPV
LABELV $461
line 908
;905:	}
;906:
;907:	// echo the text to the console
;908:	if (g_dedicated.integer) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $463
line 909
;909:		G_Printf("%s%s\n", name, text);
ADDRGP4 $466
ARGP4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 910
;910:	}
LABELV $463
line 913
;911:
;912:	// send it to all the apropriate clients
;913:	for (j = 0; j < level.maxclients; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $470
JUMPV
LABELV $467
line 914
;914:		other = &g_entities[j];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 915
;915:		G_SayTo(ent, other, mode, color, name, text);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 300
INDIRI4
ARGI4
ADDRLP4 158
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 G_SayTo
CALLV
pop
line 916
;916:	}
LABELV $468
line 913
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $470
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $467
line 917
;917:}
LABELV $440
endproc G_Say 388 28
proc Cmd_Say_f 12 16
line 924
;918:
;919:/*
;920:==================
;921:Cmd_Say_f
;922:==================
;923:*/
;924:static void Cmd_Say_f(gentity_t* ent, int mode, qboolean arg0) {
line 927
;925:	char* p;
;926:
;927:	if (trap_Argc() < 2 && !arg0) {
ADDRLP4 4
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 2
GEI4 $473
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $473
line 928
;928:		return;
ADDRGP4 $472
JUMPV
LABELV $473
line 931
;929:	}
;930:
;931:	if (arg0) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $475
line 932
;932:		p = ConcatArgs(0);
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 933
;933:	} else {
ADDRGP4 $476
JUMPV
LABELV $475
line 934
;934:		p = ConcatArgs(1);
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 935
;935:	}
LABELV $476
line 937
;936:
;937:	G_Say(ent, NULL, mode, p);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 938
;938:}
LABELV $472
endproc Cmd_Say_f 12 16
proc Cmd_Tell_f 1060 16
line 945
;939:
;940:/*
;941:==================
;942:Cmd_Tell_f
;943:==================
;944:*/
;945:static void Cmd_Tell_f(gentity_t* ent) {
line 951
;946:	int        targetNum;
;947:	gentity_t* target;
;948:	char*      p;
;949:	char       arg[MAX_TOKEN_CHARS];
;950:
;951:	if (trap_Argc() < 2) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $478
line 952
;952:		return;
ADDRGP4 $477
JUMPV
LABELV $478
line 955
;953:	}
;954:
;955:	trap_Argv(1, arg, sizeof(arg));
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 956
;956:	targetNum = atoi(arg);
ADDRLP4 12
ARGP4
ADDRLP4 1040
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 1040
INDIRI4
ASGNI4
line 957
;957:	if ((unsigned)targetNum >= (unsigned)level.maxclients) {
ADDRLP4 8
INDIRI4
CVIU4 4
ADDRGP4 level+24
INDIRI4
CVIU4 4
LTU4 $480
line 958
;958:		return;
ADDRGP4 $477
JUMPV
LABELV $480
line 961
;959:	}
;960:
;961:	target = &g_entities[targetNum];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 962
;962:	if (!target->inuse || !target->client) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $485
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $483
LABELV $485
line 963
;963:		return;
ADDRGP4 $477
JUMPV
LABELV $483
line 966
;964:	}
;965:
;966:	p = ConcatArgs(2);
CNSTI4 2
ARGI4
ADDRLP4 1048
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 1048
INDIRP4
ASGNP4
line 968
;967:
;968:	G_LogPrintf("tell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, p);
ADDRGP4 $486
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 969
;969:	G_Say(ent, target, SAY_TELL, p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 972
;970:	// don't tell to the player self if it was already directed to this player
;971:	// also don't send the chat back to a bot
;972:	if (ent != target && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 1052
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
EQU4 $487
ADDRLP4 1052
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $487
line 973
;973:		G_Say(ent, ent, SAY_TELL, p);
ADDRLP4 1056
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1056
INDIRP4
ARGP4
ADDRLP4 1056
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 974
;974:	}
LABELV $487
line 975
;975:}
LABELV $477
endproc Cmd_Tell_f 1060 16
data
align 4
LABELV gc_orders
address $489
address $490
address $491
address $492
address $493
address $494
address $495
export Cmd_GameCommand_f
code
proc Cmd_GameCommand_f 1044 16
line 1172
;976:
;977:#ifdef MISSIONPACK
;978:
;979:static void G_VoiceTo(gentity_t* ent, gentity_t* other, int mode, const char* id, qboolean voiceonly) {
;980:	int   color;
;981:	char* cmd;
;982:
;983:	if (!other) {
;984:		return;
;985:	}
;986:	if (!other->inuse) {
;987:		return;
;988:	}
;989:	if (!other->client) {
;990:		return;
;991:	}
;992:	if (mode == SAY_TEAM && !OnSameTeam(ent, other)) {
;993:		return;
;994:	}
;995:	// no chatting to players in tournements
;996:	if (g_gametype.integer == GT_TOURNAMENT) {
;997:		return;
;998:	}
;999:
;1000:	if (mode == SAY_TEAM) {
;1001:		color = COLOR_CYAN;
;1002:		cmd   = "vtchat";
;1003:	} else if (mode == SAY_TELL) {
;1004:		color = COLOR_MAGENTA;
;1005:		cmd   = "vtell";
;1006:	} else {
;1007:		color = COLOR_GREEN;
;1008:		cmd   = "vchat";
;1009:	}
;1010:
;1011:	trap_SendServerCommand(other - g_entities, va("%s %d %d %d %s", cmd, voiceonly, ent->s.number, color, id));
;1012:}
;1013:
;1014:void G_Voice(gentity_t* ent, gentity_t* target, int mode, const char* id, qboolean voiceonly) {
;1015:	int        j;
;1016:	gentity_t* other;
;1017:
;1018:	if (g_gametype.integer < GT_TEAM && mode == SAY_TEAM) {
;1019:		mode = SAY_ALL;
;1020:	}
;1021:
;1022:	if (target) {
;1023:		G_VoiceTo(ent, target, mode, id, voiceonly);
;1024:		return;
;1025:	}
;1026:
;1027:	// echo the text to the console
;1028:	if (g_dedicated.integer) {
;1029:		G_Printf("voice: %s %s\n", ent->client->pers.netname, id);
;1030:	}
;1031:
;1032:	// send it to all the apropriate clients
;1033:	for (j = 0; j < level.maxclients; j++) {
;1034:		other = &g_entities[j];
;1035:		G_VoiceTo(ent, other, mode, id, voiceonly);
;1036:	}
;1037:}
;1038:
;1039:/*
;1040:==================
;1041:Cmd_Voice_f
;1042:==================
;1043:*/
;1044:static void Cmd_Voice_f(gentity_t* ent, int mode, qboolean arg0, qboolean voiceonly) {
;1045:	char* p;
;1046:
;1047:	if (trap_Argc() < 2 && !arg0) {
;1048:		return;
;1049:	}
;1050:
;1051:	if (arg0) {
;1052:		p = ConcatArgs(0);
;1053:	} else {
;1054:		p = ConcatArgs(1);
;1055:	}
;1056:
;1057:	G_Voice(ent, NULL, mode, p, voiceonly);
;1058:}
;1059:
;1060:/*
;1061:==================
;1062:Cmd_VoiceTell_f
;1063:==================
;1064:*/
;1065:static void Cmd_VoiceTell_f(gentity_t* ent, qboolean voiceonly) {
;1066:	int        targetNum;
;1067:	gentity_t* target;
;1068:	char*      id;
;1069:	char       arg[MAX_TOKEN_CHARS];
;1070:
;1071:	if (trap_Argc() < 2) {
;1072:		return;
;1073:	}
;1074:
;1075:	trap_Argv(1, arg, sizeof(arg));
;1076:	targetNum = atoi(arg);
;1077:	if (targetNum < 0 || targetNum >= level.maxclients) {
;1078:		return;
;1079:	}
;1080:
;1081:	target = &g_entities[targetNum];
;1082:	if (!target->inuse || !target->client) {
;1083:		return;
;1084:	}
;1085:
;1086:	id = ConcatArgs(2);
;1087:
;1088:	G_LogPrintf("vtell: %s to %s: %s\n", ent->client->pers.netname, target->client->pers.netname, id);
;1089:	G_Voice(ent, target, SAY_TELL, id, voiceonly);
;1090:	// don't tell to the player self if it was already directed to this player
;1091:	// also don't send the chat back to a bot
;1092:	if (ent != target && !(ent->r.svFlags & SVF_BOT)) {
;1093:		G_Voice(ent, ent, SAY_TELL, id, voiceonly);
;1094:	}
;1095:}
;1096:
;1097:/*
;1098:==================
;1099:Cmd_VoiceTaunt_f
;1100:==================
;1101:*/
;1102:static void Cmd_VoiceTaunt_f(gentity_t* ent) {
;1103:	gentity_t* who;
;1104:	int        i;
;1105:
;1106:	if (!ent->client) {
;1107:		return;
;1108:	}
;1109:
;1110:	// insult someone who just killed you
;1111:	if (ent->enemy && ent->enemy->client && ent->enemy->client->lastkilled_client == ent->s.number) {
;1112:		// i am a dead corpse
;1113:		if (!(ent->enemy->r.svFlags & SVF_BOT)) {
;1114:			G_Voice(ent, ent->enemy, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse);
;1115:		}
;1116:		if (!(ent->r.svFlags & SVF_BOT)) {
;1117:			G_Voice(ent, ent, SAY_TELL, VOICECHAT_DEATHINSULT, qfalse);
;1118:		}
;1119:		ent->enemy = NULL;
;1120:		return;
;1121:	}
;1122:	// insult someone you just killed
;1123:	if (ent->client->lastkilled_client >= 0 && ent->client->lastkilled_client != ent->s.number) {
;1124:		who = g_entities + ent->client->lastkilled_client;
;1125:		if (who->client) {
;1126:			// who is the person I just killed
;1127:			if (who->client->lasthurt_mod == MOD_GAUNTLET) {
;1128:				if (!(who->r.svFlags & SVF_BOT)) {
;1129:					G_Voice(ent, who, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse);  // and I killed them with a gauntlet
;1130:				}
;1131:				if (!(ent->r.svFlags & SVF_BOT)) {
;1132:					G_Voice(ent, ent, SAY_TELL, VOICECHAT_KILLGAUNTLET, qfalse);
;1133:				}
;1134:			} else {
;1135:				if (!(who->r.svFlags & SVF_BOT)) {
;1136:					G_Voice(ent, who, SAY_TELL, VOICECHAT_KILLINSULT, qfalse);  // and I killed them with something else
;1137:				}
;1138:				if (!(ent->r.svFlags & SVF_BOT)) {
;1139:					G_Voice(ent, ent, SAY_TELL, VOICECHAT_KILLINSULT, qfalse);
;1140:				}
;1141:			}
;1142:			ent->client->lastkilled_client = -1;
;1143:			return;
;1144:		}
;1145:	}
;1146:
;1147:	if (g_gametype.integer >= GT_TEAM) {
;1148:		// praise a team mate who just got a reward
;1149:		for (i = 0; i < MAX_CLIENTS; i++) {
;1150:			who = g_entities + i;
;1151:			if (who->client && who != ent && who->client->sess.sessionTeam == ent->client->sess.sessionTeam) {
;1152:				if (who->client->rewardTime > level.time) {
;1153:					if (!(who->r.svFlags & SVF_BOT)) {
;1154:						G_Voice(ent, who, SAY_TELL, VOICECHAT_PRAISE, qfalse);
;1155:					}
;1156:					if (!(ent->r.svFlags & SVF_BOT)) {
;1157:						G_Voice(ent, ent, SAY_TELL, VOICECHAT_PRAISE, qfalse);
;1158:					}
;1159:					return;
;1160:				}
;1161:			}
;1162:		}
;1163:	}
;1164:
;1165:	// just say something
;1166:	G_Voice(ent, NULL, SAY_ALL, VOICECHAT_TAUNT, qfalse);
;1167:}
;1168:#endif
;1169:
;1170:static char* gc_orders[] = {"hold your position", "hold this position", "come here", "cover me", "guard location", "search and destroy", "report"};
;1171:
;1172:void         Cmd_GameCommand_f(gentity_t* ent) {
line 1177
;1173:			int  player;
;1174:			int  order;
;1175:			char str[MAX_TOKEN_CHARS];
;1176:
;1177:			trap_Argv(1, str, sizeof(str));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1178
;1178:			player = atoi(str);
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
ADDRLP4 1032
INDIRI4
ASGNI4
line 1179
;1179:			trap_Argv(2, str, sizeof(str));
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1180
;1180:			order = atoi(str);
ADDRLP4 0
ARGP4
ADDRLP4 1036
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1024
ADDRLP4 1036
INDIRI4
ASGNI4
line 1182
;1181:
;1182:			if ((unsigned)player >= MAX_CLIENTS) {
ADDRLP4 1028
INDIRI4
CVIU4 4
CNSTU4 64
LTU4 $497
line 1183
;1183:				return;
ADDRGP4 $496
JUMPV
LABELV $497
line 1185
;1184:    }
;1185:			if ((unsigned)order > ARRAY_LEN(gc_orders)) {
ADDRLP4 1024
INDIRI4
CVIU4 4
CNSTU4 7
LEU4 $499
line 1186
;1186:				return;
ADDRGP4 $496
JUMPV
LABELV $499
line 1188
;1187:    }
;1188:			G_Say(ent, &g_entities[player], SAY_TELL, gc_orders[order]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1189
;1189:			G_Say(ent, ent, SAY_TELL, gc_orders[order]);
ADDRLP4 1040
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 1040
INDIRP4
ARGP4
ADDRLP4 1040
INDIRP4
ARGP4
CNSTI4 2
ARGI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 gc_orders
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Say
CALLV
pop
line 1190
;1190:}
LABELV $496
endproc Cmd_GameCommand_f 1044 16
export Cmd_Where_f
proc Cmd_Where_f 8 8
line 1197
;1191:
;1192:/*
;1193:==================
;1194:Cmd_Where_f
;1195:==================
;1196:*/
;1197:void Cmd_Where_f(gentity_t* ent) {
line 1198
;1198:	trap_SendServerCommand(ent - g_entities, va("print \"%s\n\"", vtos(ent->s.origin)));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $502
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1199
;1199:}
LABELV $501
endproc Cmd_Where_f 8 8
data
align 4
LABELV voteCommands
address $503
address $504
address $505
address $506
address $507
address $508
address $509
address $510
address $511
address $512
address $513
address $514
code
proc ValidVoteCommand 320 12
line 1211
;1200:
;1201:static const char* voteCommands[] = {"map_restart", "map",        "rotate",   "nextmap",   "kick",      "clientkick",
;1202:                                     "g_gametype",  "g_unlagged", "g_warmup", "timelimit", "fraglimit", "capturelimit"};
;1203:
;1204:/*
;1205:==================
;1206:ValidVoteCommand
;1207:
;1208:Input string can be modified by overwriting gametype number instead of text value, for example
;1209:==================
;1210:*/
;1211:static qboolean ValidVoteCommand(int clientNum, char* command) {
line 1217
;1212:	char  buf[MAX_CVAR_VALUE_STRING];
;1213:	char* base;
;1214:	char* s;
;1215:	int   i;
;1216:
;1217:	if (strchr(command, ';') || strchr(command, '\n') || strchr(command, '\r')) {
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 268
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 268
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $519
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 272
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 272
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $519
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 276
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 276
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $516
LABELV $519
line 1218
;1218:		trap_SendServerCommand(clientNum, "print \"Invalid vote command.\n\"");
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $520
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1219
;1219:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $515
JUMPV
LABELV $516
line 1222
;1220:	}
;1221:
;1222:	base = command;
ADDRLP4 264
ADDRFP4 4
INDIRP4
ASGNP4
line 1224
;1223:
;1224:	s = buf;  // extract command name
ADDRLP4 4
ADDRLP4 8
ASGNP4
ADDRGP4 $522
JUMPV
LABELV $521
line 1225
;1225:	while (*command != '\0' && *command != ' ') {
line 1226
;1226:		*s = *command;
ADDRLP4 4
INDIRP4
ADDRFP4 4
INDIRP4
INDIRI1
ASGNI1
line 1227
;1227:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1228
;1228:		command++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1229
;1229:	}
LABELV $522
line 1225
ADDRLP4 280
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 280
INDIRI4
CNSTI4 0
EQI4 $524
ADDRLP4 280
INDIRI4
CNSTI4 32
NEI4 $521
LABELV $524
line 1230
;1230:	*s = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
ADDRGP4 $526
JUMPV
LABELV $525
line 1233
;1231:	// point cmd on first argument
;1232:	while (*command == ' ' || *command == '\t')
;1233:		command++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $526
line 1232
ADDRLP4 284
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 32
EQI4 $525
ADDRLP4 284
INDIRI4
CNSTI4 9
EQI4 $525
line 1235
;1234:
;1235:	for (i = 0; i < ARRAY_LEN(voteCommands); i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $531
JUMPV
LABELV $528
line 1236
;1236:		if (!Q_stricmp(buf, voteCommands[i])) {
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 voteCommands
ADDP4
INDIRP4
ARGP4
ADDRLP4 288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $532
line 1237
;1237:			break;
ADDRGP4 $530
JUMPV
LABELV $532
line 1239
;1238:		}
;1239:	}
LABELV $529
line 1235
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $531
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 12
LTU4 $528
LABELV $530
line 1241
;1240:
;1241:	if (i == ARRAY_LEN(voteCommands)) {
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 12
NEU4 $534
line 1242
;1242:		trap_SendServerCommand(
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $536
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1249
;1243:			clientNum, "print \"Invalid vote command.\nVote commands are: \n"
;1244:					   " g_gametype <n|ffa|duel|tdm|ctf>\n"
;1245:					   " map_restart, map <mapname>, rotate [round], nextmap\n"
;1246:					   " kick <player>, clientkick <clientnum>\n"
;1247:					   " g_unlagged <0|1>, g_warmup <-1|0|seconds>\n"
;1248:					   " timelimit <time>, fraglimit <frags>, capturelimit <captures>.\n\"");
;1249:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $515
JUMPV
LABELV $534
line 1252
;1250:	}
;1251:
;1252:	if (Q_stricmp(buf, "g_gametype") == 0) {
ADDRLP4 8
ARGP4
ADDRGP4 $509
ARGP4
ADDRLP4 288
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 288
INDIRI4
CNSTI4 0
NEI4 $537
line 1253
;1253:		if (!Q_stricmp(command, "ffa"))
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $541
ARGP4
ADDRLP4 292
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $539
line 1254
;1254:			i = GT_RUN;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $540
JUMPV
LABELV $539
line 1255
;1255:		else if (!Q_stricmp(command, "duel"))
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $544
ARGP4
ADDRLP4 296
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $542
line 1256
;1256:			i = GT_TOURNAMENT;
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $543
JUMPV
LABELV $542
line 1257
;1257:		else if (!Q_stricmp(command, "tdm"))
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $547
ARGP4
ADDRLP4 300
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 300
INDIRI4
CNSTI4 0
NEI4 $545
line 1258
;1258:			i = GT_TEAM;
ADDRLP4 0
CNSTI4 3
ASGNI4
ADDRGP4 $546
JUMPV
LABELV $545
line 1259
;1259:		else if (!Q_stricmp(command, "ctf"))
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $550
ARGP4
ADDRLP4 304
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 304
INDIRI4
CNSTI4 0
NEI4 $548
line 1260
;1260:			i = GT_CTF;
ADDRLP4 0
CNSTI4 4
ASGNI4
ADDRGP4 $549
JUMPV
LABELV $548
line 1261
;1261:		else {
line 1262
;1262:			i = atoi(command);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 308
INDIRI4
ASGNI4
line 1263
;1263:			if (i == GT_SINGLE_PLAYER || i < GT_RUN || i >= GT_MAX_GAME_TYPE) {
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $554
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $554
ADDRLP4 0
INDIRI4
CNSTI4 5
LTI4 $551
LABELV $554
line 1264
;1264:				trap_SendServerCommand(clientNum, va("print \"Invalid gametype %i.\n\"", i));
ADDRGP4 $555
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 316
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 316
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1265
;1265:				return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $515
JUMPV
LABELV $551
line 1267
;1266:			}
;1267:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $515
JUMPV
LABELV $549
LABELV $546
LABELV $543
LABELV $540
line 1271
;1268:		}
;1269:
;1270:		// handle string values
;1271:		BG_sprintf(base, "g_gametype %i", i);
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 $556
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 BG_sprintf
CALLI4
pop
line 1273
;1272:
;1273:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $515
JUMPV
LABELV $537
line 1276
;1274:	}
;1275:
;1276:	if (Q_stricmp(buf, "map") == 0) {
ADDRLP4 8
ARGP4
ADDRGP4 $504
ARGP4
ADDRLP4 292
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
NEI4 $557
line 1277
;1277:		if (!G_MapExist(command)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 296
ADDRGP4 G_MapExist
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $559
line 1278
;1278:			trap_SendServerCommand(clientNum, va("print \"No such map on server: %s.\n\"", command));
ADDRGP4 $561
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 300
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1279
;1279:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $515
JUMPV
LABELV $559
line 1281
;1280:		}
;1281:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $515
JUMPV
LABELV $557
line 1284
;1282:	}
;1283:
;1284:	if (Q_stricmp(buf, "nextmap") == 0) {
ADDRLP4 8
ARGP4
ADDRGP4 $506
ARGP4
ADDRLP4 296
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 296
INDIRI4
CNSTI4 0
NEI4 $562
line 1285
;1285:		strcpy(base, "rotate");
ADDRLP4 264
INDIRP4
ARGP4
ADDRGP4 $505
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1286
;1286:	}
LABELV $562
line 1288
;1287:
;1288:	return qtrue;
CNSTI4 1
RETI4
LABELV $515
endproc ValidVoteCommand 320 12
export Cmd_CallVote_f
proc Cmd_CallVote_f 2108 16
line 1296
;1289:}
;1290:
;1291:/*
;1292:==================
;1293:Cmd_CallVote_f
;1294:==================
;1295:*/
;1296:void Cmd_CallVote_f(gentity_t* ent) {
line 1301
;1297:	int  i, n;
;1298:	char arg[MAX_STRING_TOKENS], *argn[4];
;1299:	char cmd[MAX_STRING_TOKENS], *s;
;1300:
;1301:	if (!g_allowVote.integer) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $565
line 1302
;1302:		trap_SendServerCommand(ent - g_entities, "print \"Voting not allowed here.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $568
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1303
;1303:		return;
ADDRGP4 $564
JUMPV
LABELV $565
line 1306
;1304:	}
;1305:
;1306:	if (level.voteTime) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
EQI4 $569
line 1307
;1307:		trap_SendServerCommand(ent - g_entities, "print \"A vote is already in progress.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $572
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1308
;1308:		return;
ADDRGP4 $564
JUMPV
LABELV $569
line 1312
;1309:	}
;1310:
;1311:	// if there is still a vote to be executed
;1312:	if (level.voteExecuteTime || level.restarted) {
ADDRGP4 level+876
INDIRI4
CNSTI4 0
NEI4 $577
ADDRGP4 level+72
INDIRI4
CNSTI4 0
EQI4 $573
LABELV $577
line 1313
;1313:		trap_SendServerCommand(ent - g_entities, "print \"Previous vote command is waiting execution^1.^7\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $578
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1314
;1314:		return;
ADDRGP4 $564
JUMPV
LABELV $573
line 1317
;1315:	}
;1316:
;1317:	if (ent->client->pers.voteCount >= MAX_VOTE_COUNT) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 600
ADDP4
INDIRI4
CNSTI4 3
LTI4 $579
line 1318
;1318:		trap_SendServerCommand(ent - g_entities, "print \"You have called the maximum number of votes.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $581
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1319
;1319:		return;
ADDRGP4 $564
JUMPV
LABELV $579
line 1321
;1320:	}
;1321:	if (ent->client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $582
line 1322
;1322:		trap_SendServerCommand(ent - g_entities, "print \"Not allowed to call a vote as spectator.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $584
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1323
;1323:		return;
ADDRGP4 $564
JUMPV
LABELV $582
line 1327
;1324:	}
;1325:
;1326:	// build command buffer
;1327:	arg[0] = '\0';
ADDRLP4 1052
CNSTI1 0
ASGNI1
line 1328
;1328:	s      = arg;
ADDRLP4 4
ADDRLP4 1052
ASGNP4
line 1329
;1329:	for (i = 1; i < trap_Argc(); i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $588
JUMPV
LABELV $585
line 1330
;1330:		if (arg[0])
ADDRLP4 1052
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $589
line 1331
;1331:			s = Q_stradd(s, " ");
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $591
ARGP4
ADDRLP4 2076
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2076
INDIRP4
ASGNP4
LABELV $589
line 1332
;1332:		trap_Argv(i, cmd, sizeof(cmd));
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1333
;1333:		s = Q_stradd(s, cmd);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2080
INDIRP4
ASGNP4
line 1334
;1334:	}
LABELV $586
line 1329
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $588
ADDRLP4 2076
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2076
INDIRI4
LTI4 $585
line 1337
;1335:
;1336:	// split by ';' seperators
;1337:	n = Com_Split(arg, argn, ARRAY_LEN(argn), ';');
ADDRLP4 1052
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 4
ARGI4
CNSTI4 59
ARGI4
ADDRLP4 2080
ADDRGP4 Com_Split
CALLI4
ASGNI4
ADDRLP4 1048
ADDRLP4 2080
INDIRI4
ASGNI4
line 1338
;1338:	if (n == 0 || *argn[0] == '\0')
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $594
ADDRLP4 1032
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $592
LABELV $594
line 1339
;1339:		return;  // empty callvote command?
ADDRGP4 $564
JUMPV
LABELV $592
line 1342
;1340:
;1341:	// validate all split commands
;1342:	for (i = 0; i < n; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $598
JUMPV
LABELV $595
line 1344
;1343:		// make sure it is a valid command to vote on
;1344:		if (!ValidVoteCommand(ent - g_entities, argn[i]))
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
INDIRP4
ARGP4
ADDRLP4 2084
ADDRGP4 ValidVoteCommand
CALLI4
ASGNI4
ADDRLP4 2084
INDIRI4
CNSTI4 0
NEI4 $599
line 1345
;1345:			return;
ADDRGP4 $564
JUMPV
LABELV $599
line 1346
;1346:	}
LABELV $596
line 1342
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $598
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
LTI4 $595
line 1349
;1347:
;1348:	// rebuild command buffer
;1349:	cmd[0] = '\0';
ADDRLP4 8
CNSTI1 0
ASGNI1
line 1350
;1350:	for (s = cmd, i = 0; i < n; i++) {
ADDRLP4 4
ADDRLP4 8
ASGNP4
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $604
JUMPV
LABELV $601
line 1351
;1351:		if (cmd[0])
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $605
line 1352
;1352:			s = Q_stradd(s, ";");
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 $607
ARGP4
ADDRLP4 2084
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2084
INDIRP4
ASGNP4
LABELV $605
line 1353
;1353:		s = Q_stradd(s, argn[i]);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1032
ADDP4
INDIRP4
ARGP4
ADDRLP4 2088
ADDRGP4 Q_stradd
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 2088
INDIRP4
ASGNP4
line 1354
;1354:	}
LABELV $602
line 1350
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $604
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
LTI4 $601
line 1356
;1355:
;1356:	Com_sprintf(level.voteString, sizeof(level.voteString), cmd);
ADDRGP4 level+360
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1357
;1357:	Com_sprintf(level.voteDisplayString, sizeof(level.voteDisplayString), "%s", level.voteString);
ADDRGP4 level+616
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $612
ARGP4
ADDRGP4 level+360
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1359
;1358:
;1359:	trap_SendServerCommand(-1, va("print \"%s called a vote(%s).\n\"", ent->client->pers.netname, cmd));
ADDRGP4 $614
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 2084
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1362
;1360:
;1361:	// start the voting, the caller automatically votes yes
;1362:	level.voteTime = level.time;
ADDRGP4 level+872
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1363
;1363:	level.voteYes  = 1;
ADDRGP4 level+880
CNSTI4 1
ASGNI4
line 1364
;1364:	level.voteNo   = 0;
ADDRGP4 level+884
CNSTI4 0
ASGNI4
line 1366
;1365:
;1366:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $622
JUMPV
LABELV $619
line 1367
;1367:		level.clients[i].ps.eFlags &= ~EF_VOTED;
ADDRLP4 2088
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1368
;1368:		level.clients[i].pers.voted = 0;
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 1369
;1369:	}
LABELV $620
line 1366
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $622
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $619
line 1371
;1370:
;1371:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 2088
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1372
;1372:	ent->client->pers.voted = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 1374
;1373:
;1374:	ent->client->pers.voteCount++;
ADDRLP4 2092
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 600
ADDP4
ASGNP4
ADDRLP4 2092
INDIRP4
ADDRLP4 2092
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1376
;1375:
;1376:	trap_SetConfigstring(CS_VOTE_TIME, va("%i", level.voteTime));
ADDRGP4 $624
ARGP4
ADDRGP4 level+872
INDIRI4
ARGI4
ADDRLP4 2096
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 8
ARGI4
ADDRLP4 2096
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1377
;1377:	trap_SetConfigstring(CS_VOTE_STRING, level.voteDisplayString);
CNSTI4 9
ARGI4
ADDRGP4 level+616
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1378
;1378:	trap_SetConfigstring(CS_VOTE_YES, va("%i", level.voteYes));
ADDRGP4 $624
ARGP4
ADDRGP4 level+880
INDIRI4
ARGI4
ADDRLP4 2100
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 2100
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1379
;1379:	trap_SetConfigstring(CS_VOTE_NO, va("%i", level.voteNo));
ADDRGP4 $624
ARGP4
ADDRGP4 level+884
INDIRI4
ARGI4
ADDRLP4 2104
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1380
;1380:}
LABELV $564
endproc Cmd_CallVote_f 2108 16
proc Cmd_Vote_f 80 12
line 1387
;1381:
;1382:/*
;1383:==================
;1384:Cmd_Vote_f
;1385:==================
;1386:*/
;1387:static void Cmd_Vote_f(gentity_t* ent) {
line 1390
;1388:	char msg[64];
;1389:
;1390:	if (!level.voteTime) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
NEI4 $630
line 1391
;1391:		trap_SendServerCommand(ent - g_entities, "print \"No vote in progress.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $633
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1392
;1392:		return;
ADDRGP4 $629
JUMPV
LABELV $630
line 1395
;1393:	}
;1394:
;1395:	if (ent->client->pers.voted != 0) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 0
EQI4 $634
line 1396
;1396:		trap_SendServerCommand(ent - g_entities, "print \"Vote already cast.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $636
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1397
;1397:		return;
ADDRGP4 $629
JUMPV
LABELV $634
line 1400
;1398:	}
;1399:
;1400:	if (ent->client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $637
line 1401
;1401:		trap_SendServerCommand(ent - g_entities, "print \"Not allowed to vote as spectator.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $639
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1402
;1402:		return;
ADDRGP4 $629
JUMPV
LABELV $637
line 1405
;1403:	}
;1404:
;1405:	trap_SendServerCommand(ent - g_entities, "print \"Vote cast.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $640
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1407
;1406:
;1407:	ent->client->ps.eFlags |= EF_VOTED;
ADDRLP4 64
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 1409
;1408:
;1409:	trap_Argv(1, msg, sizeof(msg));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1411
;1410:
;1411:	if (msg[0] == 'y' || msg[0] == 'Y' || msg[0] == '1') {
ADDRLP4 68
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 68
INDIRI4
CNSTI4 121
EQI4 $644
ADDRLP4 68
INDIRI4
CNSTI4 89
EQI4 $644
ADDRLP4 68
INDIRI4
CNSTI4 49
NEI4 $641
LABELV $644
line 1412
;1412:		level.voteYes++;
ADDRLP4 72
ADDRGP4 level+880
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1413
;1413:		ent->client->pers.voted = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 1
ASGNI4
line 1414
;1414:		trap_SetConfigstring(CS_VOTE_YES, va("%i", level.voteYes));
ADDRGP4 $624
ARGP4
ADDRGP4 level+880
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1415
;1415:	} else {
ADDRGP4 $642
JUMPV
LABELV $641
line 1416
;1416:		level.voteNo++;
ADDRLP4 72
ADDRGP4 level+884
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1417
;1417:		ent->client->pers.voted = -1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 -1
ASGNI4
line 1418
;1418:		trap_SetConfigstring(CS_VOTE_NO, va("%i", level.voteNo));
ADDRGP4 $624
ARGP4
ADDRGP4 level+884
INDIRI4
ARGI4
ADDRLP4 76
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 76
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1419
;1419:	}
LABELV $642
line 1423
;1420:
;1421:	// a majority will be determined in CheckVote, which will also account
;1422:	// for players entering or leaving
;1423:}
LABELV $629
endproc Cmd_Vote_f 80 12
export G_RevertVote
proc G_RevertVote 20 8
line 1425
;1424:
;1425:void G_RevertVote(gclient_t* client) {
line 1426
;1426:	if (level.voteTime) {
ADDRGP4 level+872
INDIRI4
CNSTI4 0
EQI4 $650
line 1427
;1427:		if (client->pers.voted == 1) {
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 1
NEI4 $653
line 1428
;1428:			level.voteYes--;
ADDRLP4 0
ADDRGP4 level+880
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1429
;1429:			client->pers.voted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 1430
;1430:			client->ps.eFlags &= ~EF_VOTED;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1431
;1431:			trap_SetConfigstring(CS_VOTE_YES, va("%i", level.voteYes));
ADDRGP4 $624
ARGP4
ADDRGP4 level+880
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 10
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1432
;1432:		} else if (client->pers.voted == -1) {
ADDRGP4 $654
JUMPV
LABELV $653
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $657
line 1433
;1433:			level.voteNo--;
ADDRLP4 0
ADDRGP4 level+884
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1434
;1434:			client->pers.voted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 612
ADDP4
CNSTI4 0
ASGNI4
line 1435
;1435:			client->ps.eFlags &= ~EF_VOTED;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 1436
;1436:			trap_SetConfigstring(CS_VOTE_NO, va("%i", level.voteNo));
ADDRGP4 $624
ARGP4
ADDRGP4 level+884
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 11
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1437
;1437:		}
LABELV $657
LABELV $654
line 1438
;1438:	}
LABELV $650
line 1439
;1439:	if (client->sess.sessionTeam == TEAM_RED || client->sess.sessionTeam == TEAM_BLUE) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
EQI4 $663
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $661
LABELV $663
line 1441
;1440:		int cs_offset;
;1441:		if (client->sess.sessionTeam == TEAM_RED)
ADDRFP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
NEI4 $664
line 1442
;1442:			cs_offset = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $665
JUMPV
LABELV $664
line 1444
;1443:		else
;1444:			cs_offset = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
LABELV $665
line 1445
;1445:		if (client->pers.teamVoted == 1) {
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 1
NEI4 $666
line 1446
;1446:			level.teamVoteYes[cs_offset]--;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1447
;1447:			client->pers.teamVoted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1448
;1448:			client->ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 1449
;1449:			trap_SetConfigstring(CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset]));
ADDRGP4 $624
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1450
;1450:		} else if (client->pers.teamVoted == -1) {
ADDRGP4 $667
JUMPV
LABELV $666
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 -1
NEI4 $670
line 1451
;1451:			level.teamVoteNo[cs_offset]--;
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1452
;1452:			client->pers.teamVoted = 0;
ADDRFP4 0
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1453
;1453:			client->ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 1454
;1454:			trap_SetConfigstring(CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset]));
ADDRGP4 $624
ARGP4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1455
;1455:		}
LABELV $670
LABELV $667
line 1456
;1456:	}
LABELV $661
line 1457
;1457:}
LABELV $649
endproc G_RevertVote 20 8
proc Cmd_CallTeamVote_f 2172 20
line 1464
;1458:
;1459:/*
;1460:==================
;1461:Cmd_CallTeamVote_f
;1462:==================
;1463:*/
;1464:static void Cmd_CallTeamVote_f(gentity_t* ent) {
line 1469
;1465:	int  i, team, cs_offset;
;1466:	char arg1[MAX_STRING_TOKENS];
;1467:	char arg2[MAX_STRING_TOKENS];
;1468:
;1469:	team = ent->client->sess.sessionTeam;
ADDRLP4 1028
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 1470
;1470:	if (team == TEAM_RED)
ADDRLP4 1028
INDIRI4
CNSTI4 1
NEI4 $675
line 1471
;1471:		cs_offset = 0;
ADDRLP4 1032
CNSTI4 0
ASGNI4
ADDRGP4 $676
JUMPV
LABELV $675
line 1472
;1472:	else if (team == TEAM_BLUE)
ADDRLP4 1028
INDIRI4
CNSTI4 2
NEI4 $674
line 1473
;1473:		cs_offset = 1;
ADDRLP4 1032
CNSTI4 1
ASGNI4
line 1475
;1474:	else
;1475:		return;
LABELV $678
LABELV $676
line 1477
;1476:
;1477:	if (!g_allowVote.integer) {
ADDRGP4 g_allowVote+12
INDIRI4
CNSTI4 0
NEI4 $679
line 1478
;1478:		trap_SendServerCommand(ent - g_entities, "print \"Voting not allowed here.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $568
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1479
;1479:		return;
ADDRGP4 $674
JUMPV
LABELV $679
line 1482
;1480:	}
;1481:
;1482:	if (level.teamVoteTime[cs_offset]) {
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
CNSTI4 0
EQI4 $682
line 1483
;1483:		trap_SendServerCommand(ent - g_entities, "print \"A team vote is already in progress.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $685
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1484
;1484:		return;
ADDRGP4 $674
JUMPV
LABELV $682
line 1486
;1485:	}
;1486:	if (ent->client->pers.teamVoteCount >= MAX_VOTE_COUNT) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 604
ADDP4
INDIRI4
CNSTI4 3
LTI4 $686
line 1487
;1487:		trap_SendServerCommand(ent - g_entities, "print \"You have called the maximum number of team votes.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $688
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1488
;1488:		return;
ADDRGP4 $674
JUMPV
LABELV $686
line 1491
;1489:	}
;1490:
;1491:	if (level.voteExecuteTime || level.restarted) {
ADDRGP4 level+876
INDIRI4
CNSTI4 0
NEI4 $693
ADDRGP4 level+72
INDIRI4
CNSTI4 0
EQI4 $689
LABELV $693
line 1492
;1492:		return;
ADDRGP4 $674
JUMPV
LABELV $689
line 1495
;1493:	}
;1494:
;1495:	if (ent->client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $694
line 1496
;1496:		trap_SendServerCommand(ent - g_entities, "print \"Not allowed to call a vote as spectator.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $584
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1497
;1497:		return;
ADDRGP4 $674
JUMPV
LABELV $694
line 1501
;1498:	}
;1499:
;1500:	// make sure it is a valid command to vote on
;1501:	trap_Argv(1, arg1, sizeof(arg1));
CNSTI4 1
ARGI4
ADDRLP4 1036
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1502
;1502:	arg2[0] = '\0';
ADDRLP4 4
CNSTI1 0
ASGNI1
line 1503
;1503:	for (i = 2; i < trap_Argc(); i++) {
ADDRLP4 0
CNSTI4 2
ASGNI4
ADDRGP4 $699
JUMPV
LABELV $696
line 1504
;1504:		if (i > 2)
ADDRLP4 0
INDIRI4
CNSTI4 2
LEI4 $700
line 1505
;1505:			strcat(arg2, " ");
ADDRLP4 4
ARGP4
ADDRGP4 $591
ARGP4
ADDRGP4 strcat
CALLP4
pop
LABELV $700
line 1506
;1506:		trap_Argv(i, &arg2[strlen(arg2)], sizeof(arg2) - (int)strlen(arg2));
ADDRLP4 4
ARGP4
ADDRLP4 2060
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 2064
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2060
INDIRI4
ADDRLP4 4
ADDP4
ARGP4
CNSTU4 1024
ADDRLP4 2064
INDIRI4
CVIU4 4
SUBU4
CVUI4 4
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1507
;1507:	}
LABELV $697
line 1503
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $699
ADDRLP4 2060
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
ADDRLP4 2060
INDIRI4
LTI4 $696
line 1509
;1508:
;1509:	if (strchr(arg1, ';') || strchr(arg2, ';') || strchr(arg2, '\n') || strchr(arg2, '\r')) {
ADDRLP4 1036
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2064
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2064
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $706
ADDRLP4 4
ARGP4
CNSTI4 59
ARGI4
ADDRLP4 2068
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2068
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $706
ADDRLP4 4
ARGP4
CNSTI4 10
ARGI4
ADDRLP4 2072
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2072
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $706
ADDRLP4 4
ARGP4
CNSTI4 13
ARGI4
ADDRLP4 2076
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 2076
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $702
LABELV $706
line 1510
;1510:		trap_SendServerCommand(ent - g_entities, "print \"Invalid vote string.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $707
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1511
;1511:		return;
ADDRGP4 $674
JUMPV
LABELV $702
line 1514
;1512:	}
;1513:
;1514:	if (!Q_stricmp(arg1, "leader")) {
ADDRLP4 1036
ARGP4
ADDRGP4 $710
ARGP4
ADDRLP4 2080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2080
INDIRI4
CNSTI4 0
NEI4 $708
line 1517
;1515:		char netname[MAX_NETNAME], leader[MAX_NETNAME];
;1516:
;1517:		if (!arg2[0]) {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $711
line 1518
;1518:			i = ent->client->ps.clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 1519
;1519:		} else {
ADDRGP4 $712
JUMPV
LABELV $711
line 1521
;1520:			// numeric values are just slot numbers
;1521:			for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $713
line 1522
;1522:				if (!arg2[i] || arg2[i] < '0' || arg2[i] > '9')
ADDRLP4 2156
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 2156
INDIRI4
CNSTI4 0
EQI4 $720
ADDRLP4 2156
INDIRI4
CNSTI4 48
LTI4 $720
ADDRLP4 2156
INDIRI4
CNSTI4 57
LEI4 $717
LABELV $720
line 1523
;1523:					break;
ADDRGP4 $715
JUMPV
LABELV $717
line 1524
;1524:			}
LABELV $714
line 1521
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $713
LABELV $715
line 1525
;1525:			if (i >= 3 || !arg2[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $723
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $721
LABELV $723
line 1526
;1526:				i = atoi(arg2);
ADDRLP4 4
ARGP4
ADDRLP4 2160
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 2160
INDIRI4
ASGNI4
line 1527
;1527:				if (i < 0 || i >= level.maxclients) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $727
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $724
LABELV $727
line 1528
;1528:					trap_SendServerCommand(ent - g_entities, va("print \"Bad client slot: %i\n\"", i));
ADDRGP4 $121
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2168
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 2168
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1529
;1529:					return;
ADDRGP4 $674
JUMPV
LABELV $724
line 1532
;1530:				}
;1531:
;1532:				if (!g_entities[i].inuse) {
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $722
line 1533
;1533:					trap_SendServerCommand(ent - g_entities, va("print \"Client %i is not active\n\"", i));
ADDRGP4 $124
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2168
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 2168
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1534
;1534:					return;
ADDRGP4 $674
JUMPV
line 1536
;1535:				}
;1536:			} else {
LABELV $721
line 1537
;1537:				Q_strncpyz(leader, arg2, sizeof(leader));
ADDRLP4 2120
ARGP4
ADDRLP4 4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1538
;1538:				Q_CleanStr(leader);
ADDRLP4 2120
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1539
;1539:				for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $734
JUMPV
LABELV $731
line 1540
;1540:					if (level.clients[i].pers.connected == CON_DISCONNECTED)
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $736
line 1541
;1541:						continue;
ADDRGP4 $732
JUMPV
LABELV $736
line 1542
;1542:					if (level.clients[i].sess.sessionTeam != team)
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
EQI4 $738
line 1543
;1543:						continue;
ADDRGP4 $732
JUMPV
LABELV $738
line 1544
;1544:					Q_strncpyz(netname, level.clients[i].pers.netname, sizeof(netname));
ADDRLP4 2084
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1545
;1545:					Q_CleanStr(netname);
ADDRLP4 2084
ARGP4
ADDRGP4 Q_CleanStr
CALLP4
pop
line 1546
;1546:					if (!Q_stricmp(netname, leader)) {
ADDRLP4 2084
ARGP4
ADDRLP4 2120
ARGP4
ADDRLP4 2160
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 2160
INDIRI4
CNSTI4 0
NEI4 $740
line 1547
;1547:						break;
ADDRGP4 $733
JUMPV
LABELV $740
line 1549
;1548:					}
;1549:				}
LABELV $732
line 1539
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $734
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $731
LABELV $733
line 1550
;1550:				if (i >= level.maxclients) {
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $742
line 1551
;1551:					trap_SendServerCommand(ent - g_entities, va("print \"%s is not a valid player on your team.\n\"", arg2));
ADDRGP4 $745
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 2160
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRLP4 2160
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1552
;1552:					return;
ADDRGP4 $674
JUMPV
LABELV $742
line 1554
;1553:				}
;1554:			}
LABELV $722
line 1555
;1555:		}
LABELV $712
line 1556
;1556:		Com_sprintf(arg2, sizeof(arg2), "%d", i);
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $230
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1557
;1557:	} else {
ADDRGP4 $709
JUMPV
LABELV $708
line 1558
;1558:		trap_SendServerCommand(ent - g_entities, "print \"Invalid vote string.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $707
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1559
;1559:		trap_SendServerCommand(ent - g_entities, "print \"Team vote commands are: leader <player>.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $746
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1560
;1560:		return;
ADDRGP4 $674
JUMPV
LABELV $709
line 1563
;1561:	}
;1562:
;1563:	Com_sprintf(level.teamVoteString[cs_offset], sizeof(level.teamVoteString[cs_offset]), "%s %s", arg1, arg2);
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $749
ARGP4
ADDRLP4 1036
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1565
;1564:
;1565:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $753
JUMPV
LABELV $750
line 1566
;1566:		if (level.clients[i].pers.connected == CON_DISCONNECTED)
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $755
line 1567
;1567:			continue;
ADDRGP4 $751
JUMPV
LABELV $755
line 1568
;1568:		if (level.clients[i].sess.sessionTeam == team)
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $757
line 1569
;1569:			trap_SendServerCommand(i, va("print \"%s called a team vote.\n\"", ent->client->pers.netname));
ADDRGP4 $759
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 2084
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 2084
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $757
line 1570
;1570:	}
LABELV $751
line 1565
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $753
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $750
line 1573
;1571:
;1572:	// start the voting, the caller automatically votes yes
;1573:	level.teamVoteTime[cs_offset] = level.time;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1574
;1574:	level.teamVoteYes[cs_offset]  = 1;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
CNSTI4 1
ASGNI4
line 1575
;1575:	level.teamVoteNo[cs_offset]   = 0;
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
CNSTI4 0
ASGNI4
line 1577
;1576:
;1577:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $767
JUMPV
LABELV $764
line 1578
;1578:		if (level.clients[i].sess.sessionTeam == team) {
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 1028
INDIRI4
NEI4 $769
line 1579
;1579:			level.clients[i].ps.eFlags &= ~EF_TEAMVOTED;
ADDRLP4 2084
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2084
INDIRP4
ADDRLP4 2084
INDIRP4
INDIRI4
CNSTI4 -524289
BANDI4
ASGNI4
line 1580
;1580:			level.clients[i].pers.teamVoted = 0;
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 616
ADDP4
CNSTI4 0
ASGNI4
line 1581
;1581:		}
LABELV $769
line 1582
;1582:	}
LABELV $765
line 1577
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $767
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $764
line 1583
;1583:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 2084
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 2084
INDIRP4
ADDRLP4 2084
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1584
;1584:	ent->client->pers.teamVoted = 1;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
CNSTI4 1
ASGNI4
line 1586
;1585:
;1586:	ent->client->pers.teamVoteCount++;
ADDRLP4 2088
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 604
ADDP4
ASGNP4
ADDRLP4 2088
INDIRP4
ADDRLP4 2088
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1588
;1587:
;1588:	trap_SetConfigstring(CS_TEAMVOTE_TIME + cs_offset, va("%i", level.teamVoteTime[cs_offset]));
ADDRGP4 $624
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
ARGI4
ADDRLP4 2092
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 12
ADDI4
ARGI4
ADDRLP4 2092
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1589
;1589:	trap_SetConfigstring(CS_TEAMVOTE_STRING + cs_offset, level.teamVoteString[cs_offset]);
ADDRLP4 1032
INDIRI4
CNSTI4 14
ADDI4
ARGI4
ADDRLP4 1032
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 level+892
ADDP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1590
;1590:	trap_SetConfigstring(CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset]));
ADDRGP4 $624
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ARGI4
ADDRLP4 2100
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 2100
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1591
;1591:	trap_SetConfigstring(CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset]));
ADDRGP4 $624
ARGP4
ADDRLP4 1032
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ARGI4
ADDRLP4 2104
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1032
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 2104
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1592
;1592:}
LABELV $674
endproc Cmd_CallTeamVote_f 2172 20
proc Cmd_TeamVote_f 92 12
line 1599
;1593:
;1594:/*
;1595:==================
;1596:Cmd_TeamVote_f
;1597:==================
;1598:*/
;1599:static void Cmd_TeamVote_f(gentity_t* ent) {
line 1603
;1600:	int  team, cs_offset;
;1601:	char msg[64];
;1602:
;1603:	team = ent->client->sess.sessionTeam;
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 1604
;1604:	if (team == TEAM_RED)
ADDRLP4 68
INDIRI4
CNSTI4 1
NEI4 $776
line 1605
;1605:		cs_offset = 0;
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $777
JUMPV
LABELV $776
line 1606
;1606:	else if (team == TEAM_BLUE)
ADDRLP4 68
INDIRI4
CNSTI4 2
NEI4 $775
line 1607
;1607:		cs_offset = 1;
ADDRLP4 64
CNSTI4 1
ASGNI4
line 1609
;1608:	else
;1609:		return;
LABELV $779
LABELV $777
line 1611
;1610:
;1611:	if (!level.teamVoteTime[cs_offset]) {
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2940
ADDP4
INDIRI4
CNSTI4 0
NEI4 $780
line 1612
;1612:		trap_SendServerCommand(ent - g_entities, "print \"No team vote in progress.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $783
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1613
;1613:		return;
ADDRGP4 $775
JUMPV
LABELV $780
line 1615
;1614:	}
;1615:	if (ent->client->pers.teamVoted != 0) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 616
ADDP4
INDIRI4
CNSTI4 0
EQI4 $784
line 1616
;1616:		trap_SendServerCommand(ent - g_entities, "print \"Team vote already cast.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $786
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1617
;1617:		return;
ADDRGP4 $775
JUMPV
LABELV $784
line 1619
;1618:	}
;1619:	if (ent->client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $787
line 1620
;1620:		trap_SendServerCommand(ent - g_entities, "print \"Not allowed to vote as spectator.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $639
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1621
;1621:		return;
ADDRGP4 $775
JUMPV
LABELV $787
line 1624
;1622:	}
;1623:
;1624:	trap_SendServerCommand(ent - g_entities, "print \"Team vote cast.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $789
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1626
;1625:
;1626:	ent->client->ps.eFlags |= EF_TEAMVOTED;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 72
INDIRP4
ADDRLP4 72
INDIRP4
INDIRI4
CNSTI4 524288
BORI4
ASGNI4
line 1627
;1627:	ent->client->pers.teamVoteCount++;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 604
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1629
;1628:
;1629:	trap_Argv(1, msg, sizeof(msg));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1631
;1630:
;1631:	if (msg[0] == 'y' || msg[0] == 'Y' || msg[0] == '1') {
ADDRLP4 80
ADDRLP4 0
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 80
INDIRI4
CNSTI4 121
EQI4 $793
ADDRLP4 80
INDIRI4
CNSTI4 89
EQI4 $793
ADDRLP4 80
INDIRI4
CNSTI4 49
NEI4 $790
LABELV $793
line 1632
;1632:		level.teamVoteYes[cs_offset]++;
ADDRLP4 84
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1633
;1633:		trap_SetConfigstring(CS_TEAMVOTE_YES + cs_offset, va("%i", level.teamVoteYes[cs_offset]));
ADDRGP4 $624
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2948
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 16
ADDI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1634
;1634:	} else {
ADDRGP4 $791
JUMPV
LABELV $790
line 1635
;1635:		level.teamVoteNo[cs_offset]++;
ADDRLP4 84
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1636
;1636:		trap_SetConfigstring(CS_TEAMVOTE_NO + cs_offset, va("%i", level.teamVoteNo[cs_offset]));
ADDRGP4 $624
ARGP4
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+2956
ADDP4
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 64
INDIRI4
CNSTI4 18
ADDI4
ARGI4
ADDRLP4 88
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1637
;1637:	}
LABELV $791
line 1641
;1638:
;1639:	// a majority will be determined in TeamCheckVote, which will also account
;1640:	// for players entering or leaving
;1641:}
LABELV $775
endproc Cmd_TeamVote_f 92 12
proc Cmd_SetViewpos_f 1060 12
line 1648
;1642:
;1643:/*
;1644:=================
;1645:Cmd_SetViewpos_f
;1646:=================
;1647:*/
;1648:static void Cmd_SetViewpos_f(gentity_t* ent) {
line 1653
;1649:	vec3_t origin, angles;
;1650:	char   buffer[MAX_TOKEN_CHARS];
;1651:	int    i;
;1652:
;1653:	if (!g_cheats.integer) {
ADDRGP4 g_cheats+12
INDIRI4
CNSTI4 0
NEI4 $799
line 1654
;1654:		trap_SendServerCommand(ent - g_entities, "print \"Cheats are not enabled on this server.\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $93
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1655
;1655:		return;
ADDRGP4 $798
JUMPV
LABELV $799
line 1657
;1656:	}
;1657:	if (trap_Argc() != 5) {
ADDRLP4 1052
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 5
EQI4 $802
line 1658
;1658:		trap_SendServerCommand(ent - g_entities, "print \"usage: setviewpos x y z yaw\n\"");
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ARGI4
ADDRGP4 $804
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 1659
;1659:		return;
ADDRGP4 $798
JUMPV
LABELV $802
line 1662
;1660:	}
;1661:
;1662:	VectorClear(angles);
ADDRLP4 1040
CNSTF4 0
ASGNF4
ADDRLP4 1040+4
CNSTF4 0
ASGNF4
ADDRLP4 1040+8
CNSTF4 0
ASGNF4
line 1663
;1663:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $807
line 1664
;1664:		trap_Argv(i + 1, buffer, sizeof(buffer));
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1665
;1665:		origin[i] = atof(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 1056
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 1028
ADDP4
ADDRLP4 1056
INDIRF4
ASGNF4
line 1666
;1666:	}
LABELV $808
line 1663
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $807
line 1668
;1667:
;1668:	trap_Argv(4, buffer, sizeof(buffer));
CNSTI4 4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1669
;1669:	angles[YAW] = atof(buffer);
ADDRLP4 4
ARGP4
ADDRLP4 1056
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 1040+4
ADDRLP4 1056
INDIRF4
ASGNF4
line 1671
;1670:
;1671:	TeleportPlayer(ent, origin, angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1028
ARGP4
ADDRLP4 1040
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 1672
;1672:}
LABELV $798
endproc Cmd_SetViewpos_f 1060 12
proc Cmd_Stats_f 0 0
line 1679
;1673:
;1674:/*
;1675:=================
;1676:Cmd_Stats_f
;1677:=================
;1678:*/
;1679:static void Cmd_Stats_f(gentity_t* ent) {
line 1694
;1680:	/*
;1681:	    int max, n, i;
;1682:
;1683:	    max = trap_AAS_PointReachabilityAreaIndex( NULL );
;1684:
;1685:	    n = 0;
;1686:	    for ( i = 0; i < max; i++ ) {
;1687:	        if ( ent->client->areabits[i >> 3] & (1 << (i & 7)) )
;1688:	            n++;
;1689:	    }
;1690:
;1691:	    //trap_SendServerCommand( ent-g_entities, va("print \"visited %d of %d areas\n\"", n, max));
;1692:	    trap_SendServerCommand( ent-g_entities, va("print \"%d%% level coverage\n\"", n * 100 / max));
;1693:	*/
;1694:}
LABELV $812
endproc Cmd_Stats_f 0 0
export ClientCommand
proc ClientCommand 1124 12
line 1701
;1695:
;1696:/*
;1697:=================
;1698:ClientCommand
;1699:=================
;1700:*/
;1701:void ClientCommand(int clientNum) {
line 1705
;1702:	gentity_t* ent;
;1703:	char       cmd[MAX_TOKEN_CHARS];
;1704:
;1705:	ent = g_entities + clientNum;
ADDRLP4 1024
ADDRFP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1706
;1706:	if (!ent->client)
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $814
line 1707
;1707:		return;
ADDRGP4 $813
JUMPV
LABELV $814
line 1709
;1708:
;1709:	trap_Argv(0, cmd, sizeof(cmd));
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 1711
;1710:
;1711:	if (ent->client->pers.connected != CON_CONNECTED) {
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $816
line 1712
;1712:		if (ent->client->pers.connected == CON_CONNECTING && g_gametype.integer >= GT_TEAM) {
ADDRLP4 1024
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 1
NEI4 $813
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $813
line 1713
;1713:			if (Q_stricmp(cmd, "team") == 0 && !level.restarted) {
ADDRLP4 0
ARGP4
ADDRGP4 $823
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $813
ADDRGP4 level+72
INDIRI4
CNSTI4 0
NEI4 $813
line 1714
;1714:				Cmd_Team_f(ent);  // early team override
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
line 1715
;1715:			}
line 1716
;1716:		}
line 1717
;1717:		return;  // not fully in game yet
ADDRGP4 $813
JUMPV
LABELV $816
line 1720
;1718:	}
;1719:
;1720:	if (Q_stricmp(cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $827
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $825
line 1721
;1721:		Cmd_Say_f(ent, SAY_ALL, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1722
;1722:		return;
ADDRGP4 $813
JUMPV
LABELV $825
line 1724
;1723:	}
;1724:	if (Q_stricmp(cmd, "say_team") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $830
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $828
line 1725
;1725:		Cmd_Say_f(ent, SAY_TEAM, qfalse);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1726
;1726:		return;
ADDRGP4 $813
JUMPV
LABELV $828
line 1728
;1727:	}
;1728:	if (Q_stricmp(cmd, "tell") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $833
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $831
line 1729
;1729:		Cmd_Tell_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Tell_f
CALLV
pop
line 1730
;1730:		return;
ADDRGP4 $813
JUMPV
LABELV $831
line 1762
;1731:	}
;1732:#ifdef MISSIONPACK
;1733:	if (Q_stricmp(cmd, "vsay") == 0) {
;1734:		Cmd_Voice_f(ent, SAY_ALL, qfalse, qfalse);
;1735:		return;
;1736:	}
;1737:	if (Q_stricmp(cmd, "vsay_team") == 0) {
;1738:		Cmd_Voice_f(ent, SAY_TEAM, qfalse, qfalse);
;1739:		return;
;1740:	}
;1741:	if (Q_stricmp(cmd, "vtell") == 0) {
;1742:		Cmd_VoiceTell_f(ent, qfalse);
;1743:		return;
;1744:	}
;1745:	if (Q_stricmp(cmd, "vosay") == 0) {
;1746:		Cmd_Voice_f(ent, SAY_ALL, qfalse, qtrue);
;1747:		return;
;1748:	}
;1749:	if (Q_stricmp(cmd, "vosay_team") == 0) {
;1750:		Cmd_Voice_f(ent, SAY_TEAM, qfalse, qtrue);
;1751:		return;
;1752:	}
;1753:	if (Q_stricmp(cmd, "votell") == 0) {
;1754:		Cmd_VoiceTell_f(ent, qtrue);
;1755:		return;
;1756:	}
;1757:	if (Q_stricmp(cmd, "vtaunt") == 0) {
;1758:		Cmd_VoiceTaunt_f(ent);
;1759:		return;
;1760:	}
;1761:#endif
;1762:	if (Q_stricmp(cmd, "score") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $834
line 1763
;1763:		Cmd_Score_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 1764
;1764:		return;
ADDRGP4 $813
JUMPV
LABELV $834
line 1768
;1765:	}
;1766:
;1767:	// ignore all other commands when at intermission
;1768:	if (level.intermissiontime) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $836
line 1769
;1769:		Cmd_Say_f(ent, qfalse, qtrue);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_Say_f
CALLV
pop
line 1770
;1770:		return;
ADDRGP4 $813
JUMPV
LABELV $836
line 1773
;1771:	}
;1772:
;1773:	if (Q_stricmp(cmd, "give") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $841
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $839
line 1774
;1774:		Cmd_Give_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Give_f
CALLV
pop
ADDRGP4 $840
JUMPV
LABELV $839
line 1775
;1775:	else if (Q_stricmp(cmd, "god") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $844
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $842
line 1776
;1776:		Cmd_God_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_God_f
CALLV
pop
ADDRGP4 $843
JUMPV
LABELV $842
line 1777
;1777:	else if (Q_stricmp(cmd, "notarget") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $847
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $845
line 1778
;1778:		Cmd_Notarget_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Notarget_f
CALLV
pop
ADDRGP4 $846
JUMPV
LABELV $845
line 1779
;1779:	else if (Q_stricmp(cmd, "noclip") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $850
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $848
line 1780
;1780:		Cmd_Noclip_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Noclip_f
CALLV
pop
ADDRGP4 $849
JUMPV
LABELV $848
line 1781
;1781:	else if (Q_stricmp(cmd, "kill") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $853
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $851
line 1782
;1782:		Cmd_Kill_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Kill_f
CALLV
pop
ADDRGP4 $852
JUMPV
LABELV $851
line 1783
;1783:	else if (Q_stricmp(cmd, "teamtask") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $229
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $854
line 1784
;1784:		Cmd_TeamTask_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamTask_f
CALLV
pop
ADDRGP4 $855
JUMPV
LABELV $854
line 1785
;1785:	else if (Q_stricmp(cmd, "levelshot") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $858
ARGP4
ADDRLP4 1068
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1068
INDIRI4
CNSTI4 0
NEI4 $856
line 1786
;1786:		Cmd_LevelShot_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_LevelShot_f
CALLV
pop
ADDRGP4 $857
JUMPV
LABELV $856
line 1787
;1787:	else if (Q_stricmp(cmd, "follow") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $861
ARGP4
ADDRLP4 1072
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1072
INDIRI4
CNSTI4 0
NEI4 $859
line 1788
;1788:		Cmd_Follow_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Follow_f
CALLV
pop
ADDRGP4 $860
JUMPV
LABELV $859
line 1789
;1789:	else if (Q_stricmp(cmd, "follownext") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $864
ARGP4
ADDRLP4 1076
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1076
INDIRI4
CNSTI4 0
NEI4 $862
line 1790
;1790:		Cmd_FollowCycle_f(ent, 1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $863
JUMPV
LABELV $862
line 1791
;1791:	else if (Q_stricmp(cmd, "followprev") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $867
ARGP4
ADDRLP4 1080
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1080
INDIRI4
CNSTI4 0
NEI4 $865
line 1792
;1792:		Cmd_FollowCycle_f(ent, -1);
ADDRLP4 1024
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
ADDRGP4 $866
JUMPV
LABELV $865
line 1793
;1793:	else if (Q_stricmp(cmd, "team") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $823
ARGP4
ADDRLP4 1084
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1084
INDIRI4
CNSTI4 0
NEI4 $868
line 1794
;1794:		Cmd_Team_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Team_f
CALLV
pop
ADDRGP4 $869
JUMPV
LABELV $868
line 1795
;1795:	else if (Q_stricmp(cmd, "where") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $872
ARGP4
ADDRLP4 1088
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1088
INDIRI4
CNSTI4 0
NEI4 $870
line 1796
;1796:		Cmd_Where_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Where_f
CALLV
pop
ADDRGP4 $871
JUMPV
LABELV $870
line 1797
;1797:	else if (Q_stricmp(cmd, "callvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $875
ARGP4
ADDRLP4 1092
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1092
INDIRI4
CNSTI4 0
NEI4 $873
line 1798
;1798:		Cmd_CallVote_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallVote_f
CALLV
pop
ADDRGP4 $874
JUMPV
LABELV $873
line 1799
;1799:	else if (Q_stricmp(cmd, "vote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $878
ARGP4
ADDRLP4 1096
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1096
INDIRI4
CNSTI4 0
NEI4 $876
line 1800
;1800:		Cmd_Vote_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Vote_f
CALLV
pop
ADDRGP4 $877
JUMPV
LABELV $876
line 1801
;1801:	else if (Q_stricmp(cmd, "callteamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $881
ARGP4
ADDRLP4 1100
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1100
INDIRI4
CNSTI4 0
NEI4 $879
line 1802
;1802:		Cmd_CallTeamVote_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_CallTeamVote_f
CALLV
pop
ADDRGP4 $880
JUMPV
LABELV $879
line 1803
;1803:	else if (Q_stricmp(cmd, "teamvote") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $884
ARGP4
ADDRLP4 1104
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1104
INDIRI4
CNSTI4 0
NEI4 $882
line 1804
;1804:		Cmd_TeamVote_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_TeamVote_f
CALLV
pop
ADDRGP4 $883
JUMPV
LABELV $882
line 1805
;1805:	else if (Q_stricmp(cmd, "gc") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $887
ARGP4
ADDRLP4 1108
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1108
INDIRI4
CNSTI4 0
NEI4 $885
line 1806
;1806:		Cmd_GameCommand_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_GameCommand_f
CALLV
pop
ADDRGP4 $886
JUMPV
LABELV $885
line 1807
;1807:	else if (Q_stricmp(cmd, "setviewpos") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $890
ARGP4
ADDRLP4 1112
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1112
INDIRI4
CNSTI4 0
NEI4 $888
line 1808
;1808:		Cmd_SetViewpos_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_SetViewpos_f
CALLV
pop
ADDRGP4 $889
JUMPV
LABELV $888
line 1809
;1809:	else if (Q_stricmp(cmd, "stats") == 0)
ADDRLP4 0
ARGP4
ADDRGP4 $893
ARGP4
ADDRLP4 1116
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1116
INDIRI4
CNSTI4 0
NEI4 $891
line 1810
;1810:		Cmd_Stats_f(ent);
ADDRLP4 1024
INDIRP4
ARGP4
ADDRGP4 Cmd_Stats_f
CALLV
pop
ADDRGP4 $892
JUMPV
LABELV $891
line 1812
;1811:	else
;1812:		trap_SendServerCommand(clientNum, va("print \"unknown cmd %s\n\"", cmd));
ADDRGP4 $894
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 1120
ADDRGP4 va
CALLP4
ASGNP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1120
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
LABELV $892
LABELV $889
LABELV $886
LABELV $883
LABELV $880
LABELV $877
LABELV $874
LABELV $871
LABELV $869
LABELV $866
LABELV $863
LABELV $860
LABELV $857
LABELV $855
LABELV $852
LABELV $849
LABELV $846
LABELV $843
LABELV $840
line 1813
;1813:}
LABELV $813
endproc ClientCommand 1124 12
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
LABELV $894
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $893
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $890
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 0
align 1
LABELV $887
byte 1 103
byte 1 99
byte 1 0
align 1
LABELV $884
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $881
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $878
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $875
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $872
byte 1 119
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $867
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 112
byte 1 114
byte 1 101
byte 1 118
byte 1 0
align 1
LABELV $864
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 0
align 1
LABELV $861
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $858
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $853
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $850
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $847
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $844
byte 1 103
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $841
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $833
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $830
byte 1 115
byte 1 97
byte 1 121
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $827
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $823
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $804
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 117
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 115
byte 1 101
byte 1 116
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 112
byte 1 111
byte 1 115
byte 1 32
byte 1 120
byte 1 32
byte 1 121
byte 1 32
byte 1 122
byte 1 32
byte 1 121
byte 1 97
byte 1 119
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $789
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $786
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $783
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $759
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $749
byte 1 37
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $746
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $745
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $710
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $707
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $688
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $685
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $640
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $639
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $636
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 99
byte 1 97
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $633
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $624
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $614
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $612
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $607
byte 1 59
byte 1 0
align 1
LABELV $591
byte 1 32
byte 1 0
align 1
LABELV $584
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 32
byte 1 97
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 97
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $581
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 99
byte 1 97
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 109
byte 1 97
byte 1 120
byte 1 105
byte 1 109
byte 1 117
byte 1 109
byte 1 32
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $578
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 80
byte 1 114
byte 1 101
byte 1 118
byte 1 105
byte 1 111
byte 1 117
byte 1 115
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 94
byte 1 49
byte 1 46
byte 1 94
byte 1 55
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $572
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 65
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 112
byte 1 114
byte 1 111
byte 1 103
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $568
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 86
byte 1 111
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $561
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 78
byte 1 111
byte 1 32
byte 1 115
byte 1 117
byte 1 99
byte 1 104
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $556
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $555
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 37
byte 1 105
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $550
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $547
byte 1 116
byte 1 100
byte 1 109
byte 1 0
align 1
LABELV $544
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $541
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $536
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 86
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 58
byte 1 32
byte 1 10
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 60
byte 1 110
byte 1 124
byte 1 102
byte 1 102
byte 1 97
byte 1 124
byte 1 100
byte 1 117
byte 1 101
byte 1 108
byte 1 124
byte 1 116
byte 1 100
byte 1 109
byte 1 124
byte 1 99
byte 1 116
byte 1 102
byte 1 62
byte 1 10
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 44
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 32
byte 1 60
byte 1 109
byte 1 97
byte 1 112
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 32
byte 1 91
byte 1 114
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 93
byte 1 44
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 32
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 44
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 32
byte 1 60
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 110
byte 1 117
byte 1 109
byte 1 62
byte 1 10
byte 1 32
byte 1 103
byte 1 95
byte 1 117
byte 1 110
byte 1 108
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 32
byte 1 60
byte 1 48
byte 1 124
byte 1 49
byte 1 62
byte 1 44
byte 1 32
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 32
byte 1 60
byte 1 45
byte 1 49
byte 1 124
byte 1 48
byte 1 124
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 62
byte 1 10
byte 1 32
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 60
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 62
byte 1 44
byte 1 32
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 60
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 62
byte 1 44
byte 1 32
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 32
byte 1 60
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 115
byte 1 62
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $520
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 111
byte 1 116
byte 1 101
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $514
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $513
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $512
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 108
byte 1 105
byte 1 109
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $511
byte 1 103
byte 1 95
byte 1 119
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $510
byte 1 103
byte 1 95
byte 1 117
byte 1 110
byte 1 108
byte 1 97
byte 1 103
byte 1 103
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $509
byte 1 103
byte 1 95
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
LABELV $508
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $507
byte 1 107
byte 1 105
byte 1 99
byte 1 107
byte 1 0
align 1
LABELV $506
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $505
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $504
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $503
byte 1 109
byte 1 97
byte 1 112
byte 1 95
byte 1 114
byte 1 101
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $502
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $495
byte 1 114
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $494
byte 1 115
byte 1 101
byte 1 97
byte 1 114
byte 1 99
byte 1 104
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 114
byte 1 111
byte 1 121
byte 1 0
align 1
LABELV $493
byte 1 103
byte 1 117
byte 1 97
byte 1 114
byte 1 100
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $492
byte 1 99
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $491
byte 1 99
byte 1 111
byte 1 109
byte 1 101
byte 1 32
byte 1 104
byte 1 101
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $490
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $489
byte 1 104
byte 1 111
byte 1 108
byte 1 100
byte 1 32
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 32
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $486
byte 1 116
byte 1 101
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $466
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $460
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $459
byte 1 25
byte 1 91
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 93
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $454
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $453
byte 1 25
byte 1 40
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 41
byte 1 32
byte 1 40
byte 1 37
byte 1 115
byte 1 41
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $450
byte 1 115
byte 1 97
byte 1 121
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $448
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 25
byte 1 58
byte 1 32
byte 1 0
align 1
LABELV $447
byte 1 115
byte 1 97
byte 1 121
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $436
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $435
byte 1 116
byte 1 99
byte 1 104
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $434
byte 1 37
byte 1 115
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 37
byte 1 99
byte 1 37
byte 1 99
byte 1 37
byte 1 115
byte 1 34
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $406
byte 1 67
byte 1 109
byte 1 100
byte 1 95
byte 1 70
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 67
byte 1 121
byte 1 99
byte 1 108
byte 1 101
byte 1 95
byte 1 102
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 100
byte 1 105
byte 1 114
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $375
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 97
byte 1 121
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 32
byte 1 109
byte 1 111
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 97
byte 1 110
byte 1 32
byte 1 111
byte 1 110
byte 1 99
byte 1 101
byte 1 32
byte 1 112
byte 1 101
byte 1 114
byte 1 32
byte 1 53
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $370
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 83
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $368
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 70
byte 1 114
byte 1 101
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $366
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $364
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $295
byte 1 115
byte 1 0
align 1
LABELV $294
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $291
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 50
byte 1 0
align 1
LABELV $288
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 49
byte 1 0
align 1
LABELV $284
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $283
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 98
byte 1 111
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $277
byte 1 98
byte 1 0
align 1
LABELV $276
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $272
byte 1 114
byte 1 0
align 1
LABELV $271
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $264
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $259
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $248
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $245
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 97
byte 1 116
byte 1 111
byte 1 114
byte 1 115
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $242
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 94
byte 1 52
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $239
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 106
byte 1 111
byte 1 105
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 94
byte 1 49
byte 1 114
byte 1 101
byte 1 100
byte 1 94
byte 1 55
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $230
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $229
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 97
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $225
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 76
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 83
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $224
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 101
byte 1 120
byte 1 101
byte 1 99
byte 1 117
byte 1 116
byte 1 101
byte 1 100
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 97
byte 1 32
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $221
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 77
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 103
byte 1 95
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 32
byte 1 48
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 32
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $211
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $210
byte 1 110
byte 1 111
byte 1 99
byte 1 108
byte 1 105
byte 1 112
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $204
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $203
byte 1 110
byte 1 111
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $197
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 34
byte 1 0
align 1
LABELV $196
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 78
byte 1 10
byte 1 0
align 1
LABELV $195
byte 1 103
byte 1 111
byte 1 100
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 32
byte 1 79
byte 1 70
byte 1 70
byte 1 10
byte 1 0
align 1
LABELV $183
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $180
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $177
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 97
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $174
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $171
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $165
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $155
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $149
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $143
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $140
byte 1 97
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $134
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $124
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $121
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $96
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 109
byte 1 117
byte 1 115
byte 1 116
byte 1 32
byte 1 98
byte 1 101
byte 1 32
byte 1 97
byte 1 108
byte 1 105
byte 1 118
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $93
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 67
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 115
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 110
byte 1 111
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 111
byte 1 110
byte 1 32
byte 1 116
byte 1 104
byte 1 105
byte 1 115
byte 1 32
byte 1 115
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 46
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $83
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $76
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $56
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 0
