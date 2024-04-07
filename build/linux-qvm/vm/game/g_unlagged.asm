export G_ResetHistory
code
proc G_ResetHistory 16 0
file "../../../../code/game/g_unlagged.c"
line 14
;1://
;2:// Based on Neil Toronto's code.
;3://
;4:
;5:#include "g_local.h"
;6:
;7:/*
;8:============
;9:G_ResetHistory
;10:
;11:Clear out the given client's history (should be called when the teleport bit is flipped)
;12:============
;13:*/
;14:void G_ResetHistory(gentity_t* ent) {
line 18
;15:	int        i, t, dt;
;16:	gclient_t* client;
;17:
;18:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 19
;19:	dt     = 1000 / sv_fps.integer;
ADDRLP4 12
CNSTI4 1000
ADDRGP4 sv_fps+12
INDIRI4
DIVI4
ASGNI4
line 22
;20:
;21:	// fill up the history with data (assume the current position)
;22:	client->historyHead = NUM_CLIENT_HISTORY - 1;
ADDRLP4 4
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 17
ASGNI4
line 23
;23:	for (i = client->historyHead, t = level.time; i >= 0; i--, t -= dt) {
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
ADDRGP4 level+32
INDIRI4
ASGNI4
ADDRGP4 $59
JUMPV
LABELV $56
line 24
;24:		VectorCopy(ent->r.mins, client->history[i].mins);
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 25
;25:		VectorCopy(ent->r.maxs, client->history[i].maxs);
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 26
;26:		VectorCopy(ent->r.currentOrigin, client->history[i].currentOrigin);
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 27
;27:		client->history[i].leveltime = t;
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 36
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 28
;28:	}
LABELV $57
line 23
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
LABELV $59
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $56
line 29
;29:}
LABELV $54
endproc G_ResetHistory 16 0
export G_StoreHistory
proc G_StoreHistory 12 0
line 38
;30:
;31:/*
;32:============
;33:G_StoreHistory
;34:
;35:Keep track of where the client's been
;36:============
;37:*/
;38:void G_StoreHistory(gentity_t* ent) {
line 42
;39:	int        head;
;40:	gclient_t* client;
;41:
;42:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 44
;43:
;44:	client->historyHead++;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 1544
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 45
;45:	if (client->historyHead >= NUM_CLIENT_HISTORY) {
ADDRLP4 0
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
CNSTI4 18
LTI4 $62
line 46
;46:		client->historyHead = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1544
ADDP4
CNSTI4 0
ASGNI4
line 47
;47:	}
LABELV $62
line 49
;48:
;49:	head = client->historyHead;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
ASGNI4
line 52
;50:
;51:	// store all the collision-detection info and the time
;52:	VectorCopy(ent->r.mins, client->history[head].mins);
ADDRLP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 53
;53:	VectorCopy(ent->r.maxs, client->history[head].maxs);
ADDRLP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 12
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 54
;54:	VectorCopy(ent->s.pos.trBase, client->history[head].currentOrigin);
ADDRLP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 24
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 55
;55:	client->history[head].leveltime = level.time;
ADDRLP4 4
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 36
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 56
;56:}
LABELV $61
endproc G_StoreHistory 12 0
proc TimeShiftLerp 12 0
line 66
;57:
;58:/*
;59:=============
;60:TimeShiftLerp
;61:
;62:Used below to interpolate between two previous vectors
;63:Returns a vector "frac" times the distance between "start" and "end"
;64:=============
;65:*/
;66:static void TimeShiftLerp(float frac, const vec3_t start, const vec3_t end, vec3_t result) {
line 67
;67:	result[0] = start[0] + frac * (end[0] - start[0]);
ADDRLP4 0
ADDRFP4 4
INDIRP4
INDIRF4
ASGNF4
ADDRFP4 12
INDIRP4
ADDRLP4 0
INDIRF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 68
;68:	result[1] = start[1] + frac * (end[1] - start[1]);
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 69
;69:	result[2] = start[2] + frac * (end[2] - start[2]);
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 70
;70:}
LABELV $65
endproc TimeShiftLerp 12 0
export G_TimeShiftClient
proc G_TimeShiftClient 40 16
line 79
;71:
;72:/*
;73:=================
;74:G_TimeShiftClient
;75:
;76:Move a client back to where he was at the specified "time"
;77:=================
;78:*/
;79:void G_TimeShiftClient(gentity_t* ent, int time, qboolean debug, gentity_t* debugger) {
line 85
;80:	int        j, k;
;81:	gclient_t* client;
;82:
;83:	// find two entries in the history whose times sandwich "time"
;84:	// assumes no two adjacent records have the same timestamp
;85:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 86
;86:	j = k = client->historyHead;
ADDRLP4 12
ADDRLP4 4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
ASGNI4
ADDRLP4 8
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
LABELV $67
line 87
;87:	do {
line 88
;88:		if (client->history[j].leveltime <= time)
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 36
ADDP4
INDIRI4
ADDRFP4 4
INDIRI4
GTI4 $70
line 89
;89:			break;
ADDRGP4 $69
JUMPV
LABELV $70
line 91
;90:
;91:		k = j;
ADDRLP4 8
ADDRLP4 0
INDIRI4
ASGNI4
line 92
;92:		j--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 93
;93:		if (j < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $72
line 94
;94:			j = NUM_CLIENT_HISTORY - 1;
ADDRLP4 0
CNSTI4 17
ASGNI4
line 95
;95:		}
LABELV $72
line 96
;96:	} while (j != client->historyHead);
LABELV $68
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
NEI4 $67
LABELV $69
line 99
;97:
;98:	// if we got past the first iteration above, we've sandwiched (or wrapped)
;99:	if (j != k) {
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
EQI4 $74
line 101
;100:		// make sure it doesn't get re-saved
;101:		if (client->saved.leveltime != level.time) {
ADDRLP4 4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
EQI4 $76
line 103
;102:			// save the current origin and bounding box
;103:			VectorCopy(ent->r.mins, client->saved.mins);
ADDRLP4 4
INDIRP4
CNSTI4 1504
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 104
;104:			VectorCopy(ent->r.maxs, client->saved.maxs);
ADDRLP4 4
INDIRP4
CNSTI4 1516
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 105
;105:			VectorCopy(ent->r.currentOrigin, client->saved.currentOrigin);
ADDRLP4 4
INDIRP4
CNSTI4 1528
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 106
;106:			client->saved.leveltime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 1540
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 107
;107:		}
LABELV $76
line 111
;108:
;109:		// if we haven't wrapped back to the head, we've sandwiched, so
;110:		// we shift the client's position back to where he was at "time"
;111:		if (j != client->historyHead) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 1544
ADDP4
INDIRI4
EQI4 $80
line 112
;112:			float frac = (float)(time - client->history[j].leveltime) / (float)(client->history[k].leveltime - client->history[j].leveltime);
ADDRLP4 16
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 36
ADDP4
INDIRI4
SUBI4
CVIF4 4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 36
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 36
ADDP4
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 115
;113:
;114:			// interpolate between the two origins to give position at time index "time"
;115:			TimeShiftLerp(frac, client->history[j].currentOrigin, client->history[k].currentOrigin, ent->r.currentOrigin);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 24
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 TimeShiftLerp
CALLV
pop
line 118
;116:
;117:			// lerp these too, just for fun (and ducking)
;118:			TimeShiftLerp(frac, client->history[j].mins, client->history[k].mins, ent->r.mins);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRGP4 TimeShiftLerp
CALLV
pop
line 120
;119:
;120:			TimeShiftLerp(frac, client->history[j].maxs, client->history[k].maxs, ent->r.maxs);
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRGP4 TimeShiftLerp
CALLV
pop
line 123
;121:
;122:			// this will recalculate absmin and absmax
;123:			trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 124
;124:		} else {
ADDRGP4 $81
JUMPV
LABELV $80
line 126
;125:			// we wrapped, so grab the earliest
;126:			VectorCopy(client->history[k].currentOrigin, ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 127
;127:			VectorCopy(client->history[k].mins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
INDIRB
ASGNB 12
line 128
;128:			VectorCopy(client->history[k].maxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 40
MULI4
ADDRLP4 4
INDIRP4
CNSTI4 784
ADDP4
ADDP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 131
;129:
;130:			// this will recalculate absmin and absmax
;131:			trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 132
;132:		}
LABELV $81
line 133
;133:	}
LABELV $74
line 134
;134:}
LABELV $66
endproc G_TimeShiftClient 40 16
export G_TimeShiftAllClients
proc G_TimeShiftAllClients 12 16
line 144
;135:
;136:/*
;137:=====================
;138:G_TimeShiftAllClients
;139:
;140:Move ALL clients back to where they were at the specified "ltime",
;141:except for "skip"
;142:=====================
;143:*/
;144:void G_TimeShiftAllClients(int ltime, gentity_t* skip) {
line 149
;145:	int        i;
;146:	gentity_t* ent;
;147:
;148:	// for every client
;149:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 150
;150:	for (i = 0; i < level.maxclients; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $86
JUMPV
LABELV $83
line 151
;151:		if (ent == skip)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $88
line 152
;152:			continue;
ADDRGP4 $84
JUMPV
LABELV $88
line 154
;153:
;154:		if (!ent->r.linked)
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
NEI4 $90
line 155
;155:			continue;
ADDRGP4 $84
JUMPV
LABELV $90
line 157
;156:
;157:		if (ent->client && ent->inuse && ent->client->sess.sessionTeam < TEAM_SPECTATOR)
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $92
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $92
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
GEI4 $92
line 158
;158:			G_TimeShiftClient(ent, ltime, qfalse, skip);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_TimeShiftClient
CALLV
pop
LABELV $92
line 159
;159:	}
LABELV $84
line 150
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
LABELV $86
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $83
line 160
;160:}
LABELV $82
endproc G_TimeShiftAllClients 12 16
export G_DoTimeShiftFor
proc G_DoTimeShiftFor 8 8
line 169
;161:
;162:/*
;163:================
;164:G_DoTimeShiftFor
;165:
;166:Decide what time to shift everyone back to, and do it
;167:================
;168:*/
;169:void G_DoTimeShiftFor(gentity_t* ent) {
line 173
;170:	int time;
;171:
;172:	// don't time shift for mistakes or bots
;173:	if (!ent->inuse || !ent->client || (ent->r.svFlags & SVF_BOT)) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $98
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $98
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $95
LABELV $98
line 174
;174:		return;
ADDRGP4 $94
JUMPV
LABELV $95
line 178
;175:	}
;176:
;177:	// if it's enabled server-side and the client wants it or wants it for this weapon
;178:	if (g_unlagged.integer) {
ADDRGP4 g_unlagged+12
INDIRI4
CNSTI4 0
EQI4 $99
line 180
;179:		// full lag compensation
;180:		time = ent->client->lastCmdTime;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 660
ADDP4
INDIRI4
ASGNI4
line 181
;181:	} else {
ADDRGP4 $100
JUMPV
LABELV $99
line 183
;182:		// server frame lag compensation
;183:		time = level.previousTime + ent->client->frameOffset;
ADDRLP4 0
ADDRGP4 level+36
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1548
ADDP4
INDIRI4
ADDI4
ASGNI4
line 184
;184:	}
LABELV $100
line 186
;185:
;186:	G_TimeShiftAllClients(time, ent);
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TimeShiftAllClients
CALLV
pop
line 187
;187:}
LABELV $94
endproc G_DoTimeShiftFor 8 8
export G_UnTimeShiftClient
proc G_UnTimeShiftClient 12 4
line 196
;188:
;189:/*
;190:===================
;191:G_UnTimeShiftClient
;192:
;193:Move a client back to where he was before the time shift
;194:===================
;195:*/
;196:void G_UnTimeShiftClient(gentity_t* ent) {
line 198
;197:	// if it was saved
;198:	if (ent->client->saved.leveltime == level.time) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
NEI4 $104
line 200
;199:		// move it back
;200:		VectorCopy(ent->client->saved.mins, ent->r.mins);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1504
ADDP4
INDIRB
ASGNB 12
line 201
;201:		VectorCopy(ent->client->saved.maxs, ent->r.maxs);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1516
ADDP4
INDIRB
ASGNB 12
line 202
;202:		VectorCopy(ent->client->saved.currentOrigin, ent->r.currentOrigin);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1528
ADDP4
INDIRB
ASGNB 12
line 203
;203:		ent->client->saved.leveltime = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 0
ASGNI4
line 206
;204:
;205:		// this will recalculate absmin and absmax
;206:		trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 207
;207:	}
LABELV $104
line 208
;208:}
LABELV $103
endproc G_UnTimeShiftClient 12 4
export G_UnTimeShiftAllClients
proc G_UnTimeShiftAllClients 16 4
line 218
;209:
;210:/*
;211:=======================
;212:G_UnTimeShiftAllClients
;213:
;214:Move ALL the clients back to where they were before the time shift,
;215:except for "skip"
;216:=======================
;217:*/
;218:void G_UnTimeShiftAllClients(gentity_t* skip) {
line 223
;219:	int        i;
;220:	gentity_t* ent;
;221:	qboolean   linked;
;222:
;223:	ent = &g_entities[0];
ADDRLP4 0
ADDRGP4 g_entities
ASGNP4
line 224
;224:	for (i = 0; i < level.maxclients; i++, ent++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $111
JUMPV
LABELV $108
line 225
;225:		if (ent == skip)
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $113
line 226
;226:			continue;
ADDRGP4 $109
JUMPV
LABELV $113
line 228
;227:
;228:		linked = ent->r.linked;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
ASGNI4
line 230
;229:
;230:		if (ent->client && ent->inuse && ent->client->sess.sessionTeam < TEAM_SPECTATOR) {
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $115
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $115
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
GEI4 $115
line 231
;231:			G_UnTimeShiftClient(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 232
;232:			if (!linked) {
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $117
line 233
;233:				trap_UnlinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 234
;234:			}
LABELV $117
line 235
;235:		}
LABELV $115
line 236
;236:	}
LABELV $109
line 224
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
LABELV $111
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $108
line 237
;237:}
LABELV $107
endproc G_UnTimeShiftAllClients 16 4
export G_UndoTimeShiftFor
proc G_UndoTimeShiftFor 4 4
line 246
;238:
;239:/*
;240:==================
;241:G_UndoTimeShiftFor
;242:
;243:Put everyone except for this client back where they were
;244:==================
;245:*/
;246:void G_UndoTimeShiftFor(gentity_t* ent) {
line 249
;247:
;248:	// don't un-time shift for mistakes or bots
;249:	if (!ent->inuse || !ent->client || (ent->r.svFlags & SVF_BOT)) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
INDIRI4
CNSTI4 0
EQI4 $123
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $123
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $120
LABELV $123
line 250
;250:		return;
ADDRGP4 $119
JUMPV
LABELV $120
line 253
;251:	}
;252:
;253:	G_UnTimeShiftAllClients(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftAllClients
CALLV
pop
line 254
;254:}
LABELV $119
endproc G_UndoTimeShiftFor 4 4
proc G_PredictPlayerClipVelocity 12 0
line 266
;255:
;256:/*
;257:===========================
;258:G_PredictPlayerClipVelocity
;259:
;260:Slide on the impacting surface
;261:===========================
;262:*/
;263:
;264:#define OVERCLIP 1.001f
;265:
;266:static void G_PredictPlayerClipVelocity(const vec3_t in, const vec3_t normal, vec3_t out) {
line 270
;267:	float backoff;
;268:
;269:	// find the magnitude of the vector "in" along "normal"
;270:	backoff = DotProduct(in, normal);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRF4
ADDRLP4 8
INDIRP4
INDIRF4
MULF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 273
;271:
;272:	// tilt the plane a bit to avoid floating-point error issues
;273:	if (backoff < 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $125
line 274
;274:		backoff *= OVERCLIP;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1065361605
MULF4
ASGNF4
line 275
;275:	} else {
ADDRGP4 $126
JUMPV
LABELV $125
line 276
;276:		backoff /= OVERCLIP;
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1065336456
MULF4
ASGNF4
line 277
;277:	}
LABELV $126
line 280
;278:
;279:	// slide along
;280:	VectorMA(in, -backoff, normal, out);
ADDRFP4 8
INDIRP4
ADDRFP4 0
INDIRP4
INDIRF4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
NEGF4
MULF4
ADDF4
ASGNF4
line 281
;281:}
LABELV $124
endproc G_PredictPlayerClipVelocity 12 0
export G_PredictPlayerSlideMove
proc G_PredictPlayerSlideMove 288 28
line 292
;282:
;283:/*
;284:========================
;285:G_PredictPlayerSlideMove
;286:
;287:Advance the given entity frametime seconds, sliding as appropriate
;288:========================
;289:*/
;290:#define MAX_CLIP_PLANES 5
;291:
;292:qboolean G_PredictPlayerSlideMove(gentity_t* ent, float frametime) {
line 308
;293:	int     bumpcount, numbumps;
;294:	vec3_t  dir;
;295:	float   d;
;296:	int     numplanes;
;297:	vec3_t  planes[MAX_CLIP_PLANES];
;298:	vec3_t  primal_velocity, velocity, origin;
;299:	vec3_t  clipVelocity;
;300:	int     i, j, k;
;301:	trace_t trace;
;302:	vec3_t  end;
;303:	float   time_left;
;304:	float   into;
;305:	vec3_t  endVelocity;
;306:	vec3_t  endClipVelocity;
;307:
;308:	numbumps = 4;
ADDRLP4 232
CNSTI4 4
ASGNI4
line 310
;309:
;310:	VectorCopy(ent->s.pos.trDelta, primal_velocity);
ADDRLP4 236
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 311
;311:	VectorCopy(primal_velocity, velocity);
ADDRLP4 76
ADDRLP4 236
INDIRB
ASGNB 12
line 312
;312:	VectorCopy(ent->s.pos.trBase, origin);
ADDRLP4 112
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 314
;313:
;314:	VectorCopy(velocity, endVelocity);
ADDRLP4 140
ADDRLP4 76
INDIRB
ASGNB 12
line 316
;315:
;316:	time_left = frametime;
ADDRLP4 212
ADDRFP4 4
INDIRF4
ASGNF4
line 318
;317:
;318:	numplanes = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 320
;319:
;320:	for (bumpcount = 0; bumpcount < numbumps; bumpcount++) {
ADDRLP4 228
CNSTI4 0
ASGNI4
ADDRGP4 $131
JUMPV
LABELV $128
line 323
;321:
;322:		// calculate position we are trying to move to
;323:		VectorMA(origin, time_left, velocity, end);
ADDRLP4 216
ADDRLP4 112
INDIRF4
ADDRLP4 76
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 216+4
ADDRLP4 112+4
INDIRF4
ADDRLP4 76+4
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 216+8
ADDRLP4 112+8
INDIRF4
ADDRLP4 76+8
INDIRF4
ADDRLP4 212
INDIRF4
MULF4
ADDF4
ASGNF4
line 326
;324:
;325:		// see if we can make it there
;326:		trap_Trace(&trace, origin, ent->r.mins, ent->r.maxs, end, ent->s.number, ent->clipmask);
ADDRLP4 152
ARGP4
ADDRLP4 112
ARGP4
ADDRLP4 252
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 252
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 252
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 216
ARGP4
ADDRLP4 252
INDIRP4
INDIRI4
ARGI4
ADDRLP4 252
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 328
;327:
;328:		if (trace.allsolid) {
ADDRLP4 152
INDIRI4
CNSTI4 0
EQI4 $138
line 330
;329:			// entity is completely trapped in another solid
;330:			VectorClear(velocity);
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 76+4
CNSTF4 0
ASGNF4
ADDRLP4 76+8
CNSTF4 0
ASGNF4
line 331
;331:			VectorCopy(origin, ent->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 332
;332:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $127
JUMPV
LABELV $138
line 335
;333:		}
;334:
;335:		if (trace.fraction > 0) {
ADDRLP4 152+8
INDIRF4
CNSTF4 0
LEF4 $142
line 337
;336:			// actually covered some distance
;337:			VectorCopy(trace.endpos, origin);
ADDRLP4 112
ADDRLP4 152+12
INDIRB
ASGNB 12
line 338
;338:		}
LABELV $142
line 340
;339:
;340:		if (trace.fraction == 1) {
ADDRLP4 152+8
INDIRF4
CNSTF4 1065353216
NEF4 $146
line 341
;341:			break;  // moved the entire distance
ADDRGP4 $130
JUMPV
LABELV $146
line 344
;342:		}
;343:
;344:		time_left -= time_left * trace.fraction;
ADDRLP4 212
ADDRLP4 212
INDIRF4
ADDRLP4 212
INDIRF4
ADDRLP4 152+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 346
;345:
;346:		if (numplanes >= MAX_CLIP_PLANES) {
ADDRLP4 108
INDIRI4
CNSTI4 5
LTI4 $150
line 348
;347:			// this shouldn't really happen
;348:			VectorClear(velocity);
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 76+4
CNSTF4 0
ASGNF4
ADDRLP4 76+8
CNSTF4 0
ASGNF4
line 349
;349:			VectorCopy(origin, ent->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 350
;350:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $127
JUMPV
LABELV $150
line 358
;351:		}
;352:
;353:		//
;354:		// if this is the same plane we hit before, nudge velocity
;355:		// out along it, which fixes some epsilon issues with
;356:		// non-axial planes
;357:		//
;358:		for (i = 0; i < numplanes; i++) {
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 $157
JUMPV
LABELV $154
line 359
;359:			if (DotProduct(trace.plane.normal, planes[i]) > 0.99) {
ADDRLP4 152+24
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 152+24+4
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 152+24+8
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $158
line 360
;360:				VectorAdd(trace.plane.normal, velocity, velocity);
ADDRLP4 76
ADDRLP4 152+24
INDIRF4
ADDRLP4 76
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 152+24+4
INDIRF4
ADDRLP4 76+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRLP4 152+24+8
INDIRF4
ADDRLP4 76+8
INDIRF4
ADDF4
ASGNF4
line 361
;361:				break;
ADDRGP4 $156
JUMPV
LABELV $158
line 363
;362:			}
;363:		}
LABELV $155
line 358
ADDRLP4 92
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $157
ADDRLP4 92
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $154
LABELV $156
line 365
;364:
;365:		if (i < numplanes) {
ADDRLP4 92
INDIRI4
ADDRLP4 108
INDIRI4
GEI4 $176
line 366
;366:			continue;
ADDRGP4 $129
JUMPV
LABELV $176
line 369
;367:		}
;368:
;369:		VectorCopy(trace.plane.normal, planes[numplanes]);
ADDRLP4 108
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ADDRLP4 152+24
INDIRB
ASGNB 12
line 370
;370:		numplanes++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 377
;371:
;372:		//
;373:		// modify velocity so it parallels all of the clip planes
;374:		//
;375:
;376:		// find a plane that it enters
;377:		for (i = 0; i < numplanes; i++) {
ADDRLP4 92
CNSTI4 0
ASGNI4
ADDRGP4 $182
JUMPV
LABELV $179
line 378
;378:			into = DotProduct(velocity, planes[i]);
ADDRLP4 208
ADDRLP4 76
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 76+4
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 76+8
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 379
;379:			if (into >= 0.1) {
ADDRLP4 208
INDIRF4
CNSTF4 1036831949
LTF4 $187
line 380
;380:				continue;  // move doesn't interact with the plane
ADDRGP4 $180
JUMPV
LABELV $187
line 384
;381:			}
;382:
;383:			// slide along the plane
;384:			G_PredictPlayerClipVelocity(velocity, planes[i], clipVelocity);
ADDRLP4 76
ARGP4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 387
;385:
;386:			// slide along the plane
;387:			G_PredictPlayerClipVelocity(endVelocity, planes[i], endClipVelocity);
ADDRLP4 140
ARGP4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 390
;388:
;389:			// see if there is a second plane that the new move enters
;390:			for (j = 0; j < numplanes; j++) {
ADDRLP4 88
CNSTI4 0
ASGNI4
ADDRGP4 $192
JUMPV
LABELV $189
line 391
;391:				if (j == i) {
ADDRLP4 88
INDIRI4
ADDRLP4 92
INDIRI4
NEI4 $193
line 392
;392:					continue;
ADDRGP4 $190
JUMPV
LABELV $193
line 395
;393:				}
;394:
;395:				if (DotProduct(clipVelocity, planes[j]) >= 0.1) {
ADDRLP4 64
INDIRF4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $195
line 396
;396:					continue;  // move doesn't interact with the plane
ADDRGP4 $190
JUMPV
LABELV $195
line 400
;397:				}
;398:
;399:				// try clipping the move to the plane
;400:				G_PredictPlayerClipVelocity(clipVelocity, planes[j], clipVelocity);
ADDRLP4 64
ARGP4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 401
;401:				G_PredictPlayerClipVelocity(endClipVelocity, planes[j], endClipVelocity);
ADDRLP4 128
ARGP4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 128
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 404
;402:
;403:				// see if it goes back into the first clip plane
;404:				if (DotProduct(clipVelocity, planes[i]) >= 0) {
ADDRLP4 64
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
LTF4 $201
line 405
;405:					continue;
ADDRGP4 $190
JUMPV
LABELV $201
line 409
;406:				}
;407:
;408:				// slide the original velocity along the crease
;409:				CrossProduct(planes[i], planes[j], dir);
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 410
;410:				VectorNormalize(dir);
ADDRLP4 96
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 411
;411:				d = DotProduct(dir, velocity);
ADDRLP4 124
ADDRLP4 96
INDIRF4
ADDRLP4 76
INDIRF4
MULF4
ADDRLP4 96+4
INDIRF4
ADDRLP4 76+4
INDIRF4
MULF4
ADDF4
ADDRLP4 96+8
INDIRF4
ADDRLP4 76+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 412
;412:				VectorScale(dir, d, clipVelocity);
ADDRLP4 64
ADDRLP4 96
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 96+8
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
line 414
;413:
;414:				CrossProduct(planes[i], planes[j], dir);
ADDRLP4 92
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 88
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 96
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 415
;415:				VectorNormalize(dir);
ADDRLP4 96
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 416
;416:				d = DotProduct(dir, endVelocity);
ADDRLP4 124
ADDRLP4 96
INDIRF4
ADDRLP4 140
INDIRF4
MULF4
ADDRLP4 96+4
INDIRF4
ADDRLP4 140+4
INDIRF4
MULF4
ADDF4
ADDRLP4 96+8
INDIRF4
ADDRLP4 140+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 417
;417:				VectorScale(dir, d, endClipVelocity);
ADDRLP4 128
ADDRLP4 96
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 128+4
ADDRLP4 96+4
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
ADDRLP4 128+8
ADDRLP4 96+8
INDIRF4
ADDRLP4 124
INDIRF4
MULF4
ASGNF4
line 420
;418:
;419:				// see if there is a third plane the the new move enters
;420:				for (k = 0; k < numplanes; k++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $226
JUMPV
LABELV $223
line 421
;421:					if (k == i || k == j) {
ADDRLP4 0
INDIRI4
ADDRLP4 92
INDIRI4
EQI4 $229
ADDRLP4 0
INDIRI4
ADDRLP4 88
INDIRI4
NEI4 $227
LABELV $229
line 422
;422:						continue;
ADDRGP4 $224
JUMPV
LABELV $227
line 425
;423:					}
;424:
;425:					if (DotProduct(clipVelocity, planes[k]) >= 0.1) {
ADDRLP4 64
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 64+8
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $230
line 426
;426:						continue;  // move doesn't interact with the plane
ADDRGP4 $224
JUMPV
LABELV $230
line 430
;427:					}
;428:
;429:					// stop dead at a tripple plane interaction
;430:					VectorClear(velocity);
ADDRLP4 76
CNSTF4 0
ASGNF4
ADDRLP4 76+4
CNSTF4 0
ASGNF4
ADDRLP4 76+8
CNSTF4 0
ASGNF4
line 431
;431:					VectorCopy(origin, ent->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 432
;432:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $127
JUMPV
LABELV $224
line 420
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $226
ADDRLP4 0
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $223
line 434
;433:				}
;434:			}
LABELV $190
line 390
ADDRLP4 88
ADDRLP4 88
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $192
ADDRLP4 88
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $189
line 437
;435:
;436:			// if we have fixed all interactions, try another move
;437:			VectorCopy(clipVelocity, velocity);
ADDRLP4 76
ADDRLP4 64
INDIRB
ASGNB 12
line 438
;438:			VectorCopy(endClipVelocity, endVelocity);
ADDRLP4 140
ADDRLP4 128
INDIRB
ASGNB 12
line 439
;439:			break;
ADDRGP4 $181
JUMPV
LABELV $180
line 377
ADDRLP4 92
ADDRLP4 92
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $182
ADDRLP4 92
INDIRI4
ADDRLP4 108
INDIRI4
LTI4 $179
LABELV $181
line 441
;440:		}
;441:	}
LABELV $129
line 320
ADDRLP4 228
ADDRLP4 228
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $131
ADDRLP4 228
INDIRI4
ADDRLP4 232
INDIRI4
LTI4 $128
LABELV $130
line 443
;442:
;443:	VectorCopy(endVelocity, velocity);
ADDRLP4 76
ADDRLP4 140
INDIRB
ASGNB 12
line 444
;444:	VectorCopy(origin, ent->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 112
INDIRB
ASGNB 12
line 446
;445:
;446:	return (bumpcount != 0);
ADDRLP4 228
INDIRI4
CNSTI4 0
EQI4 $239
ADDRLP4 248
CNSTI4 1
ASGNI4
ADDRGP4 $240
JUMPV
LABELV $239
ADDRLP4 248
CNSTI4 0
ASGNI4
LABELV $240
ADDRLP4 248
INDIRI4
RETI4
LABELV $127
endproc G_PredictPlayerSlideMove 288 28
export G_PredictPlayerStepSlideMove
proc G_PredictPlayerStepSlideMove 124 28
line 456
;447:}
;448:
;449:/*
;450:============================
;451:G_PredictPlayerStepSlideMove
;452:
;453:Advance the given entity frametime seconds, stepping and sliding as appropriate
;454:============================
;455:*/
;456:void G_PredictPlayerStepSlideMove(gentity_t* ent, float frametime) {
line 463
;457:	vec3_t start_o, start_v;
;458:	// vec3_t down_o, down_v;
;459:	vec3_t  down, up;
;460:	trace_t trace;
;461:	float   stepSize;
;462:
;463:	VectorCopy(ent->s.pos.trBase, start_o);
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 464
;464:	VectorCopy(ent->s.pos.trDelta, start_v);
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRB
ASGNB 12
line 466
;465:
;466:	if (!G_PredictPlayerSlideMove(ent, frametime)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 108
ADDRGP4 G_PredictPlayerSlideMove
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $242
line 468
;467:		// not clipped, so forget stepping
;468:		return;
ADDRGP4 $241
JUMPV
LABELV $242
line 474
;469:	}
;470:
;471:	// VectorCopy( ent->s.pos.trBase, down_o );
;472:	// VectorCopy( ent->s.pos.trDelta, down_v );
;473:
;474:	VectorCopy(start_o, up);
ADDRLP4 80
ADDRLP4 56
INDIRB
ASGNB 12
line 476
;475:
;476:	up[2] += PM_STEP_HEIGHT;
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 479
;477:
;478:	// test the player position if they were a stepheight higher
;479:	trap_Trace(&trace, start_o, ent->r.mins, ent->r.maxs, up, ent->s.number, ent->clipmask);
ADDRLP4 0
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 112
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 112
INDIRP4
INDIRI4
ARGI4
ADDRLP4 112
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 480
;480:	if (trace.allsolid) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $245
line 481
;481:		return;  // can't step up
ADDRGP4 $241
JUMPV
LABELV $245
line 484
;482:	}
;483:
;484:	stepSize = trace.endpos[2] - start_o[2];
ADDRLP4 104
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 56+8
INDIRF4
SUBF4
ASGNF4
line 487
;485:
;486:	// try slidemove from this position
;487:	VectorCopy(trace.endpos, ent->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 488
;488:	VectorCopy(start_v, ent->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 92
INDIRB
ASGNB 12
line 490
;489:
;490:	G_PredictPlayerSlideMove(ent, frametime);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 G_PredictPlayerSlideMove
CALLI4
pop
line 493
;491:
;492:	// push down the final amount
;493:	VectorCopy(ent->s.pos.trBase, down);
ADDRLP4 68
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 494
;494:	down[2] -= stepSize;
ADDRLP4 68+8
ADDRLP4 68+8
INDIRF4
ADDRLP4 104
INDIRF4
SUBF4
ASGNF4
line 495
;495:	trap_Trace(&trace, ent->s.pos.trBase, ent->r.mins, ent->r.maxs, down, ent->s.number, ent->clipmask);
ADDRLP4 0
ARGP4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 116
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 116
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 116
INDIRP4
INDIRI4
ARGI4
ADDRLP4 116
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 496
;496:	if (!trace.allsolid) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $252
line 497
;497:		VectorCopy(trace.endpos, ent->s.pos.trBase);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 498
;498:	}
LABELV $252
line 499
;499:	if (trace.fraction < 1.0) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $255
line 500
;500:		G_PredictPlayerClipVelocity(ent->s.pos.trDelta, trace.plane.normal, ent->s.pos.trDelta);
ADDRLP4 120
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 120
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 120
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRGP4 G_PredictPlayerClipVelocity
CALLV
pop
line 501
;501:	}
LABELV $255
line 502
;502:}
LABELV $241
endproc G_PredictPlayerStepSlideMove 124 28
export G_PredictPlayerMove
proc G_PredictPlayerMove 0 8
line 513
;503:
;504:/*
;505:===================
;506:G_PredictPlayerMove
;507:
;508:Advance the given entity frametime seconds, stepping and sliding as appropriate
;509:
;510:This is the entry point to the server-side-only prediction code
;511:===================
;512:*/
;513:void G_PredictPlayerMove(gentity_t* ent, float frametime) {
line 514
;514:	G_PredictPlayerStepSlideMove(ent, frametime);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRF4
ARGF4
ADDRGP4 G_PredictPlayerStepSlideMove
CALLV
pop
line 515
;515:}
LABELV $259
endproc G_PredictPlayerMove 0 8
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
