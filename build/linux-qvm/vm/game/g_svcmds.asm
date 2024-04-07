code
proc StringToFilter 156 8
file "../../../../code/game/g_svcmds.c"
line 57
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:// this file holds commands that can be executed by the server console, but not remote clients
;5:
;6:#include "g_local.h"
;7:
;8:/*
;9:==============================================================================
;10:
;11:PACKET FILTERING
;12:
;13:
;14:You can add or remove addresses from the filter list with:
;15:
;16:addip <ip>
;17:removeip <ip>
;18:
;19:The ip address is specified in dot format, and you can use '*' to match any value
;20:so you can specify an entire class C network with "addip 192.246.40.*"
;21:
;22:Removeip will only remove an address specified exactly the same way.  You cannot addip a subnet, then removeip a single host.
;23:
;24:listip
;25:Prints the current list of filters.
;26:
;27:g_filterban <0 or 1>
;28:
;29:If 1 (the default), then ip addresses matching the current list will be prohibited from entering the game.  This is the default setting.
;30:
;31:If 0, then only addresses matching the list will be allowed.  This lets you easily set up a private game, or a game that only allows players from your local
;32:network.
;33:
;34:TTimo NOTE: for persistence, bans are stored in g_banIPs cvar MAX_CVAR_VALUE_STRING
;35:The size of the cvar string buffer is limiting the banning to around 20 masks
;36:this could be improved by putting some g_banIPs2 g_banIps3 etc. maybe
;37:still, you should rely on PB for banning instead
;38:
;39:==============================================================================
;40:*/
;41:
;42:typedef struct ipFilter_s {
;43:	unsigned mask;
;44:	unsigned compare;
;45:} ipFilter_t;
;46:
;47:#define MAX_IPFILTERS 1024
;48:
;49:static ipFilter_t ipFilters[MAX_IPFILTERS];
;50:static int        numIPFilters;
;51:
;52:/*
;53:=================
;54:StringToFilter
;55:=================
;56:*/
;57:static qboolean StringToFilter(char* s, ipFilter_t* f) {
line 63
;58:	char num[128];
;59:	int  i, j;
;60:	byte b[4];
;61:	byte m[4];
;62:
;63:	for (i = 0; i < 4; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $55
line 64
;64:		b[i] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
CNSTU1 0
ASGNU1
line 65
;65:		m[i] = 0;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 0
ASGNU1
line 66
;66:	}
LABELV $56
line 63
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $55
line 68
;67:
;68:	for (i = 0; i < 4; i++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
LABELV $59
line 69
;69:		if (*s < '0' || *s > '9') {
ADDRLP4 144
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 48
LTI4 $65
ADDRLP4 144
INDIRI4
CNSTI4 57
LEI4 $63
LABELV $65
line 70
;70:			if (*s == '*')  // 'match any'
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $66
line 71
;71:			{
line 73
;72:				// b[i] and m[i] to 0
;73:				s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 74
;74:				if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $68
line 75
;75:					break;
ADDRGP4 $61
JUMPV
LABELV $68
line 76
;76:				s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 77
;77:				continue;
ADDRGP4 $60
JUMPV
LABELV $66
line 79
;78:			}
;79:			G_Printf("Bad filter address: %s\n", s);
ADDRGP4 $70
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 80
;80:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $54
JUMPV
LABELV $63
line 83
;81:		}
;82:
;83:		j = 0;
ADDRLP4 128
CNSTI4 0
ASGNI4
ADDRGP4 $72
JUMPV
LABELV $71
line 84
;84:		while (*s >= '0' && *s <= '9') {
line 85
;85:			num[j++] = *s++;
ADDRLP4 148
ADDRLP4 128
INDIRI4
ASGNI4
ADDRLP4 128
ADDRLP4 148
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 152
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 152
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 148
INDIRI4
ADDRLP4 0
ADDP4
ADDRLP4 152
INDIRP4
INDIRI1
ASGNI1
line 86
;86:		}
LABELV $72
line 84
ADDRLP4 148
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 148
INDIRI4
CNSTI4 48
LTI4 $74
ADDRLP4 148
INDIRI4
CNSTI4 57
LEI4 $71
LABELV $74
line 87
;87:		num[j] = 0;
ADDRLP4 128
INDIRI4
ADDRLP4 0
ADDP4
CNSTI1 0
ASGNI1
line 88
;88:		b[i]   = atoi(num);
ADDRLP4 0
ARGP4
ADDRLP4 152
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 132
INDIRI4
ADDRLP4 136
ADDP4
ADDRLP4 152
INDIRI4
CVIU4 4
CVUU1 4
ASGNU1
line 89
;89:		m[i]   = 255;
ADDRLP4 132
INDIRI4
ADDRLP4 140
ADDP4
CNSTU1 255
ASGNU1
line 91
;90:
;91:		if (!*s)
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $75
line 92
;92:			break;
ADDRGP4 $61
JUMPV
LABELV $75
line 93
;93:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 94
;94:	}
LABELV $60
line 68
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 132
INDIRI4
CNSTI4 4
LTI4 $59
LABELV $61
line 96
;95:
;96:	f->mask    = *(unsigned*)m;
ADDRFP4 4
INDIRP4
ADDRLP4 140
INDIRU4
ASGNU4
line 97
;97:	f->compare = *(unsigned*)b;
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 136
INDIRU4
ASGNU4
line 99
;98:
;99:	return qtrue;
CNSTI4 1
RETI4
LABELV $54
endproc StringToFilter 156 8
proc UpdateIPBans 344 12
line 107
;100:}
;101:
;102:/*
;103:=================
;104:UpdateIPBans
;105:=================
;106:*/
;107:static void UpdateIPBans(void) {
line 114
;108:	byte b[4];
;109:	byte m[4];
;110:	int  i, j;
;111:	char iplist_final[MAX_CVAR_VALUE_STRING];
;112:	char ip[64];
;113:
;114:	*iplist_final = 0;
ADDRLP4 80
CNSTI1 0
ASGNI1
line 115
;115:	for (i = 0; i < numIPFilters; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $81
JUMPV
LABELV $78
line 116
;116:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $82
line 117
;117:			continue;
ADDRGP4 $79
JUMPV
LABELV $82
line 119
;118:
;119:		*(unsigned*)b = ipFilters[i].compare;
ADDRLP4 72
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ASGNU4
line 120
;120:		*(unsigned*)m = ipFilters[i].mask;
ADDRLP4 68
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
ASGNU4
line 121
;121:		*ip           = 0;
ADDRLP4 4
CNSTI1 0
ASGNI1
line 122
;122:		for (j = 0; j < 4; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $86
line 123
;123:			if (m[j] != 255)
ADDRLP4 0
INDIRI4
ADDRLP4 68
ADDP4
INDIRU1
CVUI4 1
CNSTI4 255
EQI4 $90
line 124
;124:				Q_strcat(ip, sizeof(ip), "*");
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $92
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
ADDRGP4 $91
JUMPV
LABELV $90
line 126
;125:			else
;126:				Q_strcat(ip, sizeof(ip), va("%i", b[j]));
ADDRGP4 $93
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 72
ADDP4
INDIRU1
CVUI4 1
ARGI4
ADDRLP4 336
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 336
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
LABELV $91
line 127
;127:			Q_strcat(ip, sizeof(ip), (j < 3) ? "." : " ");
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 3
GEI4 $97
ADDRLP4 340
ADDRGP4 $94
ASGNP4
ADDRGP4 $98
JUMPV
LABELV $97
ADDRLP4 340
ADDRGP4 $95
ASGNP4
LABELV $98
ADDRLP4 340
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 128
;128:		}
LABELV $87
line 122
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $86
line 129
;129:		if (strlen(iplist_final) + strlen(ip) < MAX_CVAR_VALUE_STRING) {
ADDRLP4 80
ARGP4
ADDRLP4 336
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ARGP4
ADDRLP4 340
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 336
INDIRI4
ADDRLP4 340
INDIRI4
ADDI4
CNSTI4 256
GEI4 $99
line 130
;130:			Q_strcat(iplist_final, sizeof(iplist_final), ip);
ADDRLP4 80
ARGP4
CNSTI4 256
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 131
;131:		} else {
ADDRGP4 $100
JUMPV
LABELV $99
line 132
;132:			Com_Printf("g_banIPs overflowed at MAX_CVAR_VALUE_STRING\n");
ADDRGP4 $101
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 133
;133:			break;
ADDRGP4 $80
JUMPV
LABELV $100
line 135
;134:		}
;135:	}
LABELV $79
line 115
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $81
ADDRLP4 76
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $78
LABELV $80
line 137
;136:
;137:	trap_Cvar_Set("g_banIPs", iplist_final);
ADDRGP4 $102
ARGP4
ADDRLP4 80
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 138
;138:}
LABELV $77
endproc UpdateIPBans 344 12
export G_FilterPacket
proc G_FilterPacket 28 0
line 145
;139:
;140:/*
;141:=================
;142:G_FilterPacket
;143:=================
;144:*/
;145:qboolean G_FilterPacket(char* from) {
line 151
;146:	int      i;
;147:	unsigned in;
;148:	byte     m[4];
;149:	char*    p;
;150:
;151:	i = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 152
;152:	p = from;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $105
JUMPV
LABELV $104
line 153
;153:	while (*p && i < 4) {
line 154
;154:		m[i] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTU1 0
ASGNU1
ADDRGP4 $108
JUMPV
LABELV $107
line 155
;155:		while (*p >= '0' && *p <= '9') {
line 156
;156:			m[i] = m[i] * 10 + (*p - '0');
ADDRLP4 16
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 10
MULI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
line 157
;157:			p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 158
;158:		}
LABELV $108
line 155
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 48
LTI4 $110
ADDRLP4 16
INDIRI4
CNSTI4 57
LEI4 $107
LABELV $110
line 159
;159:		if (!*p || *p == ':')
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $113
ADDRLP4 20
INDIRI4
CNSTI4 58
NEI4 $111
LABELV $113
line 160
;160:			break;
ADDRGP4 $106
JUMPV
LABELV $111
line 161
;161:		i++, p++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 162
;162:	}
LABELV $105
line 153
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $114
ADDRLP4 4
INDIRI4
CNSTI4 4
LTI4 $104
LABELV $114
LABELV $106
line 164
;163:
;164:	in = *(unsigned*)m;
ADDRLP4 12
ADDRLP4 8
INDIRU4
ASGNU4
line 166
;165:
;166:	for (i = 0; i < numIPFilters; i++)
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $118
JUMPV
LABELV $115
line 167
;167:		if ((in & ipFilters[i].mask) == ipFilters[i].compare)
ADDRLP4 12
INDIRU4
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
BANDU4
ADDRLP4 4
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
NEU4 $119
line 168
;168:			return g_filterBan.integer != 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
EQI4 $124
ADDRLP4 20
CNSTI4 1
ASGNI4
ADDRGP4 $125
JUMPV
LABELV $124
ADDRLP4 20
CNSTI4 0
ASGNI4
LABELV $125
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $103
JUMPV
LABELV $119
LABELV $116
line 166
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $118
ADDRLP4 4
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $115
line 170
;169:
;170:	return g_filterBan.integer == 0;
ADDRGP4 g_filterBan+12
INDIRI4
CNSTI4 0
NEI4 $128
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $129
JUMPV
LABELV $128
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $129
ADDRLP4 24
INDIRI4
RETI4
LABELV $103
endproc G_FilterPacket 28 0
proc AddIP 8 8
line 178
;171:}
;172:
;173:/*
;174:=================
;175:AddIP
;176:=================
;177:*/
;178:static void AddIP(char* str) {
line 181
;179:	int i;
;180:
;181:	for (i = 0; i < numIPFilters; i++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $134
JUMPV
LABELV $131
line 182
;182:		if (ipFilters[i].compare == 0xffffffff)
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
CNSTU4 4294967295
NEU4 $135
line 183
;183:			break;  // free spot
ADDRGP4 $133
JUMPV
LABELV $135
LABELV $132
line 181
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $134
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $131
LABELV $133
line 184
;184:	if (i == numIPFilters) {
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
NEI4 $138
line 185
;185:		if (numIPFilters == MAX_IPFILTERS) {
ADDRGP4 numIPFilters
INDIRI4
CNSTI4 1024
NEI4 $140
line 186
;186:			G_Printf("IP filter list is full\n");
ADDRGP4 $142
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 187
;187:			return;
ADDRGP4 $130
JUMPV
LABELV $140
line 189
;188:		}
;189:		numIPFilters++;
ADDRLP4 4
ADDRGP4 numIPFilters
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 190
;190:	}
LABELV $138
line 192
;191:
;192:	if (!StringToFilter(str, &ipFilters[i]))
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $143
line 193
;193:		ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
LABELV $143
line 195
;194:
;195:	UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 196
;196:}
LABELV $130
endproc AddIP 8 8
export G_ProcessIPBans
proc G_ProcessIPBans 276 12
line 203
;197:
;198:/*
;199:=================
;200:G_ProcessIPBans
;201:=================
;202:*/
;203:void G_ProcessIPBans(void) {
line 207
;204:	char *s, *t;
;205:	char  str[MAX_CVAR_VALUE_STRING];
;206:
;207:	Q_strncpyz(str, g_banIPs.string, sizeof(str));
ADDRLP4 8
ARGP4
ADDRGP4 g_banIPs+16
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 209
;208:
;209:	for (t = s = g_banIPs.string; *t; /* */) {
ADDRLP4 264
ADDRGP4 g_banIPs+16
ASGNP4
ADDRLP4 0
ADDRLP4 264
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 264
INDIRP4
ASGNP4
ADDRGP4 $151
JUMPV
LABELV $148
line 210
;210:		s = strchr(s, ' ');
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 32
ARGI4
ADDRLP4 268
ADDRGP4 strchr
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 268
INDIRP4
ASGNP4
line 211
;211:		if (!s)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $156
line 212
;212:			break;
ADDRGP4 $150
JUMPV
LABELV $155
line 214
;213:		while (*s == ' ')
;214:			*s++ = 0;
ADDRLP4 272
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 272
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI1 0
ASGNI1
LABELV $156
line 213
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $155
line 215
;215:		if (*t)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $158
line 216
;216:			AddIP(t);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 AddIP
CALLV
pop
LABELV $158
line 217
;217:		t = s;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 218
;218:	}
LABELV $149
line 209
LABELV $151
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $148
LABELV $150
line 219
;219:}
LABELV $146
endproc G_ProcessIPBans 276 12
export Svcmd_AddIP_f
proc Svcmd_AddIP_f 1028 12
line 226
;220:
;221:/*
;222:=================
;223:Svcmd_AddIP_f
;224:=================
;225:*/
;226:void Svcmd_AddIP_f(void) {
line 229
;227:	char str[MAX_TOKEN_CHARS];
;228:
;229:	if (trap_Argc() < 2) {
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
GEI4 $161
line 230
;230:		G_Printf("Usage:  addip <ip-mask>\n");
ADDRGP4 $163
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 231
;231:		return;
ADDRGP4 $160
JUMPV
LABELV $161
line 234
;232:	}
;233:
;234:	trap_Argv(1, str, sizeof(str));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 236
;235:
;236:	AddIP(str);
ADDRLP4 0
ARGP4
ADDRGP4 AddIP
CALLV
pop
line 237
;237:}
LABELV $160
endproc Svcmd_AddIP_f 1028 12
export Svcmd_RemoveIP_f
proc Svcmd_RemoveIP_f 1048 12
line 244
;238:
;239:/*
;240:=================
;241:Svcmd_RemoveIP_f
;242:=================
;243:*/
;244:void Svcmd_RemoveIP_f(void) {
line 249
;245:	ipFilter_t f;
;246:	int        i;
;247:	char       str[MAX_TOKEN_CHARS];
;248:
;249:	if (trap_Argc() < 2) {
ADDRLP4 1036
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 2
GEI4 $165
line 250
;250:		G_Printf("Usage:  sv removeip <ip-mask>\n");
ADDRGP4 $167
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 251
;251:		return;
ADDRGP4 $164
JUMPV
LABELV $165
line 254
;252:	}
;253:
;254:	trap_Argv(1, str, sizeof(str));
CNSTI4 1
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 256
;255:
;256:	if (!StringToFilter(str, &f))
ADDRLP4 12
ARGP4
ADDRLP4 4
ARGP4
ADDRLP4 1040
ADDRGP4 StringToFilter
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $168
line 257
;257:		return;
ADDRGP4 $164
JUMPV
LABELV $168
line 259
;258:
;259:	for (i = 0; i < numIPFilters; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $173
JUMPV
LABELV $170
line 260
;260:		if (ipFilters[i].mask == f.mask && ipFilters[i].compare == f.compare) {
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters
ADDP4
INDIRU4
ADDRLP4 4
INDIRU4
NEU4 $174
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
INDIRU4
ADDRLP4 4+4
INDIRU4
NEU4 $174
line 261
;261:			ipFilters[i].compare = 0xffffffffu;
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 ipFilters+4
ADDP4
CNSTU4 4294967295
ASGNU4
line 262
;262:			G_Printf("Removed.\n");
ADDRGP4 $179
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 264
;263:
;264:			UpdateIPBans();
ADDRGP4 UpdateIPBans
CALLV
pop
line 265
;265:			return;
ADDRGP4 $164
JUMPV
LABELV $174
line 267
;266:		}
;267:	}
LABELV $171
line 259
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $173
ADDRLP4 0
INDIRI4
ADDRGP4 numIPFilters
INDIRI4
LTI4 $170
line 269
;268:
;269:	G_Printf("Didn't find %s.\n", str);
ADDRGP4 $180
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 270
;270:}
LABELV $164
endproc Svcmd_RemoveIP_f 1048 12
export Svcmd_EntityList_f
proc Svcmd_EntityList_f 16 8
line 277
;271:
;272:/*
;273:===================
;274:Svcmd_EntityList_f
;275:===================
;276:*/
;277:void Svcmd_EntityList_f(void) {
line 281
;278:	int        e;
;279:	gentity_t* check;
;280:
;281:	check = g_entities;
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 282
;282:	for (e = 0; e < level.num_entities; e++, check++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $185
JUMPV
LABELV $182
line 283
;283:		if (!check->inuse) {
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
NEI4 $187
line 284
;284:			continue;
ADDRGP4 $183
JUMPV
LABELV $187
line 286
;285:		}
;286:		G_Printf("%3i:", e);
ADDRGP4 $189
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 287
;287:		switch (check->s.eType) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
LTI4 $190
ADDRLP4 8
INDIRI4
CNSTI4 11
GTI4 $190
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $218
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $218
address $193
address $195
address $197
address $199
address $201
address $203
address $205
address $207
address $209
address $211
address $213
address $215
code
LABELV $193
line 289
;288:		case ET_GENERAL:
;289:			G_Printf("ET_GENERAL          ");
ADDRGP4 $194
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 290
;290:			break;
ADDRGP4 $191
JUMPV
LABELV $195
line 292
;291:		case ET_PLAYER:
;292:			G_Printf("ET_PLAYER           ");
ADDRGP4 $196
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 293
;293:			break;
ADDRGP4 $191
JUMPV
LABELV $197
line 295
;294:		case ET_ITEM:
;295:			G_Printf("ET_ITEM             ");
ADDRGP4 $198
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 296
;296:			break;
ADDRGP4 $191
JUMPV
LABELV $199
line 298
;297:		case ET_MISSILE:
;298:			G_Printf("ET_MISSILE          ");
ADDRGP4 $200
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 299
;299:			break;
ADDRGP4 $191
JUMPV
LABELV $201
line 301
;300:		case ET_MOVER:
;301:			G_Printf("ET_MOVER            ");
ADDRGP4 $202
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 302
;302:			break;
ADDRGP4 $191
JUMPV
LABELV $203
line 304
;303:		case ET_BEAM:
;304:			G_Printf("ET_BEAM             ");
ADDRGP4 $204
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 305
;305:			break;
ADDRGP4 $191
JUMPV
LABELV $205
line 307
;306:		case ET_PORTAL:
;307:			G_Printf("ET_PORTAL           ");
ADDRGP4 $206
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 308
;308:			break;
ADDRGP4 $191
JUMPV
LABELV $207
line 310
;309:		case ET_SPEAKER:
;310:			G_Printf("ET_SPEAKER          ");
ADDRGP4 $208
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 311
;311:			break;
ADDRGP4 $191
JUMPV
LABELV $209
line 313
;312:		case ET_PUSH_TRIGGER:
;313:			G_Printf("ET_PUSH_TRIGGER     ");
ADDRGP4 $210
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 314
;314:			break;
ADDRGP4 $191
JUMPV
LABELV $211
line 316
;315:		case ET_TELEPORT_TRIGGER:
;316:			G_Printf("ET_TELEPORT_TRIGGER ");
ADDRGP4 $212
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 317
;317:			break;
ADDRGP4 $191
JUMPV
LABELV $213
line 319
;318:		case ET_INVISIBLE:
;319:			G_Printf("ET_INVISIBLE        ");
ADDRGP4 $214
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 320
;320:			break;
ADDRGP4 $191
JUMPV
LABELV $215
line 322
;321:		case ET_GRAPPLE:
;322:			G_Printf("ET_GRAPPLE          ");
ADDRGP4 $216
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 323
;323:			break;
ADDRGP4 $191
JUMPV
LABELV $190
line 325
;324:		default:
;325:			G_Printf("%3i                 ", check->s.eType);
ADDRGP4 $217
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 326
;326:			break;
LABELV $191
line 329
;327:		}
;328:
;329:		if (check->classname) {
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $219
line 330
;330:			G_Printf("%s", check->classname);
ADDRGP4 $221
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 331
;331:		}
LABELV $219
line 332
;332:		G_Printf("\n");
ADDRGP4 $222
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 333
;333:	}
LABELV $183
line 282
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 816
ADDP4
ASGNP4
LABELV $185
ADDRLP4 4
INDIRI4
ADDRGP4 level+12
INDIRI4
LTI4 $182
line 334
;334:}
LABELV $181
endproc Svcmd_EntityList_f 16 8
export ClientForString
proc ClientForString 24 8
line 336
;335:
;336:gclient_t* ClientForString(const char* s) {
line 342
;337:	gclient_t* cl;
;338:	int        i;
;339:	int        idnum;
;340:
;341:	// numeric values are just slot numbers
;342:	if (s[0] >= '0' && s[0] <= '9') {
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 48
LTI4 $224
ADDRLP4 12
INDIRI4
CNSTI4 57
GTI4 $224
line 343
;343:		idnum = atoi(s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 16
INDIRI4
ASGNI4
line 344
;344:		if (idnum < 0 || idnum >= level.maxclients) {
ADDRLP4 20
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
LTI4 $229
ADDRLP4 20
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $226
LABELV $229
line 345
;345:			Com_Printf("Bad client slot: %i\n", idnum);
ADDRGP4 $230
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 346
;346:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $223
JUMPV
LABELV $226
line 349
;347:		}
;348:
;349:		cl = &level.clients[idnum];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 350
;350:		if (cl->pers.connected == CON_DISCONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $231
line 351
;351:			G_Printf("Client %i is not connected\n", idnum);
ADDRGP4 $233
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 352
;352:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $223
JUMPV
LABELV $231
line 354
;353:		}
;354:		return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $223
JUMPV
LABELV $224
line 358
;355:	}
;356:
;357:	// check for a name match
;358:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $237
JUMPV
LABELV $234
line 359
;359:		cl = &level.clients[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 360
;360:		if (cl->pers.connected == CON_DISCONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $239
line 361
;361:			continue;
ADDRGP4 $235
JUMPV
LABELV $239
line 363
;362:		}
;363:		if (!Q_stricmp(cl->pers.netname, s)) {
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $241
line 364
;364:			return cl;
ADDRLP4 0
INDIRP4
RETP4
ADDRGP4 $223
JUMPV
LABELV $241
line 366
;365:		}
;366:	}
LABELV $235
line 358
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $237
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $234
line 368
;367:
;368:	G_Printf("User %s is not on the server\n", s);
ADDRGP4 $243
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 370
;369:
;370:	return NULL;
CNSTP4 0
RETP4
LABELV $223
endproc ClientForString 24 8
export Svcmd_ForceTeam_f
proc Svcmd_ForceTeam_f 1036 12
line 380
;371:}
;372:
;373:/*
;374:===================
;375:Svcmd_ForceTeam_f
;376:
;377:forceteam <player> <team>
;378:===================
;379:*/
;380:void Svcmd_ForceTeam_f(void) {
line 384
;381:	gclient_t* cl;
;382:	char       str[MAX_TOKEN_CHARS];
;383:
;384:	if (trap_Argc() < 3) {
ADDRLP4 1028
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 3
GEI4 $245
line 385
;385:		G_Printf("Usage: forceteam <player> <team>\n");
ADDRGP4 $247
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 386
;386:		return;
ADDRGP4 $244
JUMPV
LABELV $245
line 390
;387:	}
;388:
;389:	// find the player
;390:	trap_Argv(1, str, sizeof(str));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 391
;391:	cl = ClientForString(str);
ADDRLP4 0
ARGP4
ADDRLP4 1032
ADDRGP4 ClientForString
CALLP4
ASGNP4
ADDRLP4 1024
ADDRLP4 1032
INDIRP4
ASGNP4
line 392
;392:	if (!cl) {
ADDRLP4 1024
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $248
line 393
;393:		return;
ADDRGP4 $244
JUMPV
LABELV $248
line 397
;394:	}
;395:
;396:	// set the team
;397:	trap_Argv(2, str, sizeof(str));
CNSTI4 2
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 398
;398:	SetTeam(&g_entities[cl - level.clients], str);
ADDRLP4 1024
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1576
DIVI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 SetTeam
CALLI4
pop
line 399
;399:}
LABELV $244
endproc Svcmd_ForceTeam_f 1036 12
export Svcmd_Rotate_f
proc Svcmd_Rotate_f 1292 12
line 401
;400:
;401:void Svcmd_Rotate_f(void) {
line 404
;402:	char str[MAX_TOKEN_CHARS];
;403:
;404:	if (trap_Argc() >= 2) {
ADDRLP4 1024
ADDRGP4 trap_Argc
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 2
LTI4 $251
line 405
;405:		trap_Argv(1, str, sizeof(str));
CNSTI4 1
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 406
;406:		if (atoi(str) > 0) {
ADDRLP4 0
ARGP4
ADDRLP4 1028
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
LEI4 $253
line 407
;407:			trap_Cvar_Set(SV_ROTATION, str);
ADDRGP4 $255
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 408
;408:		}
LABELV $253
line 409
;409:	}
LABELV $251
line 411
;410:
;411:	if (!ParseMapRotation()) {
ADDRLP4 1028
ADDRGP4 ParseMapRotation
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $256
line 414
;412:		char val[MAX_CVAR_VALUE_STRING];
;413:
;414:		trap_Cvar_VariableStringBuffer("nextmap", val, sizeof(val));
ADDRGP4 $258
ARGP4
ADDRLP4 1032
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 416
;415:
;416:		if (!val[0] || !Q_stricmpn(val, "map_restart ", 12))
ADDRLP4 1032
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $262
ADDRLP4 1032
ARGP4
ADDRGP4 $261
ARGP4
CNSTI4 12
ARGI4
ADDRLP4 1288
ADDRGP4 Q_stricmpn
CALLI4
ASGNI4
ADDRLP4 1288
INDIRI4
CNSTI4 0
NEI4 $259
LABELV $262
line 417
;417:			G_LoadMap(NULL);
CNSTP4 0
ARGP4
ADDRGP4 G_LoadMap
CALLV
pop
ADDRGP4 $260
JUMPV
LABELV $259
line 419
;418:		else
;419:			trap_SendConsoleCommand(EXEC_APPEND, "vstr nextmap\n");
CNSTI4 2
ARGI4
ADDRGP4 $263
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
LABELV $260
line 420
;420:	}
LABELV $256
line 421
;421:}
LABELV $250
endproc Svcmd_Rotate_f 1292 12
export ConsoleCommand
proc ConsoleCommand 1076 12
line 431
;422:
;423:char* ConcatArgs(int start);
;424:
;425:/*
;426:=================
;427:ConsoleCommand
;428:
;429:=================
;430:*/
;431:qboolean ConsoleCommand(void) {
line 434
;432:	char cmd[MAX_TOKEN_CHARS];
;433:
;434:	trap_Argv(0, cmd, sizeof(cmd));
CNSTI4 0
ARGI4
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 436
;435:
;436:	if (Q_stricmp(cmd, "entitylist") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $267
ARGP4
ADDRLP4 1024
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1024
INDIRI4
CNSTI4 0
NEI4 $265
line 437
;437:		Svcmd_EntityList_f();
ADDRGP4 Svcmd_EntityList_f
CALLV
pop
line 438
;438:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $265
line 441
;439:	}
;440:
;441:	if (Q_stricmp(cmd, "forceteam") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $270
ARGP4
ADDRLP4 1028
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1028
INDIRI4
CNSTI4 0
NEI4 $268
line 442
;442:		Svcmd_ForceTeam_f();
ADDRGP4 Svcmd_ForceTeam_f
CALLV
pop
line 443
;443:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $268
line 446
;444:	}
;445:
;446:	if (Q_stricmp(cmd, "game_memory") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $273
ARGP4
ADDRLP4 1032
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1032
INDIRI4
CNSTI4 0
NEI4 $271
line 447
;447:		Svcmd_GameMem_f();
ADDRGP4 Svcmd_GameMem_f
CALLV
pop
line 448
;448:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $271
line 451
;449:	}
;450:
;451:	if (Q_stricmp(cmd, "addbot") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $276
ARGP4
ADDRLP4 1036
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $274
line 452
;452:		Svcmd_AddBot_f();
ADDRGP4 Svcmd_AddBot_f
CALLV
pop
line 453
;453:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $274
line 456
;454:	}
;455:
;456:	if (Q_stricmp(cmd, "botlist") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 1040
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
NEI4 $277
line 457
;457:		Svcmd_BotList_f();
ADDRGP4 Svcmd_BotList_f
CALLV
pop
line 458
;458:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $277
line 461
;459:	}
;460:
;461:	if (Q_stricmp(cmd, "abort_podium") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $282
ARGP4
ADDRLP4 1044
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $280
line 462
;462:		Svcmd_AbortPodium_f();
ADDRGP4 Svcmd_AbortPodium_f
CALLV
pop
line 463
;463:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $280
line 466
;464:	}
;465:
;466:	if (Q_stricmp(cmd, "addip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 1048
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $283
line 467
;467:		Svcmd_AddIP_f();
ADDRGP4 Svcmd_AddIP_f
CALLV
pop
line 468
;468:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $283
line 471
;469:	}
;470:
;471:	if (Q_stricmp(cmd, "removeip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $288
ARGP4
ADDRLP4 1052
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
NEI4 $286
line 472
;472:		Svcmd_RemoveIP_f();
ADDRGP4 Svcmd_RemoveIP_f
CALLV
pop
line 473
;473:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $286
line 476
;474:	}
;475:
;476:	if (Q_stricmp(cmd, "listip") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $291
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $289
line 477
;477:		trap_SendConsoleCommand(EXEC_NOW, "g_banIPs\n");
CNSTI4 0
ARGI4
ADDRGP4 $292
ARGP4
ADDRGP4 trap_SendConsoleCommand
CALLV
pop
line 478
;478:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $289
line 481
;479:	}
;480:
;481:	if (Q_stricmp(cmd, "rotate") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $295
ARGP4
ADDRLP4 1060
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1060
INDIRI4
CNSTI4 0
NEI4 $293
line 482
;482:		Svcmd_Rotate_f();
ADDRGP4 Svcmd_Rotate_f
CALLV
pop
line 483
;483:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $293
line 486
;484:	}
;485:
;486:	if (g_dedicated.integer) {
ADDRGP4 g_dedicated+12
INDIRI4
CNSTI4 0
EQI4 $296
line 487
;487:		if (Q_stricmp(cmd, "say") == 0) {
ADDRLP4 0
ARGP4
ADDRGP4 $301
ARGP4
ADDRLP4 1064
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $299
line 488
;488:			G_BroadcastServerCommand(-1, va("print \"server: %s\"", ConcatArgs(1)));
CNSTI4 1
ARGI4
ADDRLP4 1068
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $302
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 489
;489:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $299
line 492
;490:		}
;491:		// everything else will also be printed as a say command
;492:		G_BroadcastServerCommand(-1, va("print \"server: %s\"", ConcatArgs(0)));
CNSTI4 0
ARGI4
ADDRLP4 1068
ADDRGP4 ConcatArgs
CALLP4
ASGNP4
ADDRGP4 $302
ARGP4
ADDRLP4 1068
INDIRP4
ARGP4
ADDRLP4 1072
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1072
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 493
;493:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $264
JUMPV
LABELV $296
line 496
;494:	}
;495:
;496:	return qfalse;
CNSTI4 0
RETI4
LABELV $264
endproc ConsoleCommand 1076 12
import ConcatArgs
bss
align 4
LABELV numIPFilters
skip 4
align 4
LABELV ipFilters
skip 8192
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
LABELV $302
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
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
byte 1 34
byte 1 0
align 1
LABELV $301
byte 1 115
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $295
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $292
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $291
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $288
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $285
byte 1 97
byte 1 100
byte 1 100
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $282
byte 1 97
byte 1 98
byte 1 111
byte 1 114
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 100
byte 1 105
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $279
byte 1 98
byte 1 111
byte 1 116
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $276
byte 1 97
byte 1 100
byte 1 100
byte 1 98
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $273
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 109
byte 1 111
byte 1 114
byte 1 121
byte 1 0
align 1
LABELV $270
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $267
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $263
byte 1 118
byte 1 115
byte 1 116
byte 1 114
byte 1 32
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $261
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
byte 1 32
byte 1 0
align 1
LABELV $258
byte 1 110
byte 1 101
byte 1 120
byte 1 116
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $255
byte 1 115
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 77
byte 1 97
byte 1 112
byte 1 73
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 0
align 1
LABELV $247
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 60
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 62
byte 1 32
byte 1 60
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $243
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
byte 1 0
align 1
LABELV $233
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
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $230
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
byte 1 0
align 1
LABELV $222
byte 1 10
byte 1 0
align 1
LABELV $221
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $217
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $216
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 80
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $214
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 78
byte 1 86
byte 1 73
byte 1 83
byte 1 73
byte 1 66
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $212
byte 1 69
byte 1 84
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 0
align 1
LABELV $210
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 85
byte 1 83
byte 1 72
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $208
byte 1 69
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 69
byte 1 65
byte 1 75
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $206
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 79
byte 1 82
byte 1 84
byte 1 65
byte 1 76
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $204
byte 1 69
byte 1 84
byte 1 95
byte 1 66
byte 1 69
byte 1 65
byte 1 77
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $202
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 79
byte 1 86
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $200
byte 1 69
byte 1 84
byte 1 95
byte 1 77
byte 1 73
byte 1 83
byte 1 83
byte 1 73
byte 1 76
byte 1 69
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $198
byte 1 69
byte 1 84
byte 1 95
byte 1 73
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $196
byte 1 69
byte 1 84
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 69
byte 1 82
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $194
byte 1 69
byte 1 84
byte 1 95
byte 1 71
byte 1 69
byte 1 78
byte 1 69
byte 1 82
byte 1 65
byte 1 76
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $189
byte 1 37
byte 1 51
byte 1 105
byte 1 58
byte 1 0
align 1
LABELV $180
byte 1 68
byte 1 105
byte 1 100
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $179
byte 1 82
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 100
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $167
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 32
byte 1 115
byte 1 118
byte 1 32
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 105
byte 1 112
byte 1 32
byte 1 60
byte 1 105
byte 1 112
byte 1 45
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $163
byte 1 85
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 32
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 105
byte 1 112
byte 1 32
byte 1 60
byte 1 105
byte 1 112
byte 1 45
byte 1 109
byte 1 97
byte 1 115
byte 1 107
byte 1 62
byte 1 10
byte 1 0
align 1
LABELV $142
byte 1 73
byte 1 80
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 108
byte 1 105
byte 1 115
byte 1 116
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 102
byte 1 117
byte 1 108
byte 1 108
byte 1 10
byte 1 0
align 1
LABELV $102
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 0
align 1
LABELV $101
byte 1 103
byte 1 95
byte 1 98
byte 1 97
byte 1 110
byte 1 73
byte 1 80
byte 1 115
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 67
byte 1 86
byte 1 65
byte 1 82
byte 1 95
byte 1 86
byte 1 65
byte 1 76
byte 1 85
byte 1 69
byte 1 95
byte 1 83
byte 1 84
byte 1 82
byte 1 73
byte 1 78
byte 1 71
byte 1 10
byte 1 0
align 1
LABELV $95
byte 1 32
byte 1 0
align 1
LABELV $94
byte 1 46
byte 1 0
align 1
LABELV $93
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $92
byte 1 42
byte 1 0
align 1
LABELV $70
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
