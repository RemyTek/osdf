data
export playerMins
align 4
LABELV playerMins
byte 4 3245342720
byte 4 3245342720
byte 4 3250585600
export playerMaxs
align 4
LABELV playerMaxs
byte 4 1097859072
byte 4 1097859072
byte 4 1107296256
export SP_info_player_deathmatch
code
proc SP_info_player_deathmatch 8 12
file "../../../../code/game/g_client.c"
line 19
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:// g_client.c -- client functions that don't happen every frame
;6:
;7:const vec3_t playerMins = {-15, -15, -24};
;8:const vec3_t playerMaxs = {15, 15, 32};
;9:
;10:static char  ban_reason[MAX_CVAR_VALUE_STRING];
;11:
;12:/*QUAKED info_player_deathmatch (1 0 1) (-16 -16 -24) (16 16 32) initial
;13:potential spawning position for deathmatch games.
;14:The first time a player enters the game, they will be at an 'initial' spot.
;15:Targets will be fired when someone spawns in on them.
;16:"nobots" will prevent bots from using this spot.
;17:"nohumans" will prevent non-bots from using this spot.
;18:*/
;19:void SP_info_player_deathmatch(gentity_t* ent) {
line 22
;20:	int i;
;21:
;22:	G_SpawnInt("nobots", "0", &i);
ADDRGP4 $55
ARGP4
ADDRGP4 $56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 23
;23:	if (i) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $57
line 24
;24:		ent->flags |= FL_NO_BOTS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 25
;25:	}
LABELV $57
line 26
;26:	G_SpawnInt("nohumans", "0", &i);
ADDRGP4 $59
ARGP4
ADDRGP4 $56
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 27
;27:	if (i) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $60
line 28
;28:		ent->flags |= FL_NO_HUMANS;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 29
;29:	}
LABELV $60
line 30
;30:}
LABELV $54
endproc SP_info_player_deathmatch 8 12
export SP_info_player_start
proc SP_info_player_start 0 4
line 35
;31:
;32:/*QUAKED info_player_start (1 0 0) (-16 -16 -24) (16 16 32)
;33:equivelant to info_player_deathmatch
;34:*/
;35:void SP_info_player_start(gentity_t* ent) {
line 36
;36:	ent->classname = "info_player_deathmatch";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $63
ASGNP4
line 37
;37:	SP_info_player_deathmatch(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SP_info_player_deathmatch
CALLV
pop
line 38
;38:}
LABELV $62
endproc SP_info_player_start 0 4
export SP_info_player_intermission
proc SP_info_player_intermission 0 0
line 43
;39:
;40:/*QUAKED info_player_intermission (1 0 1) (-16 -16 -24) (16 16 32)
;41:The intermission will be viewed from this point.  Target an info_notnull for the view direction.
;42:*/
;43:void SP_info_player_intermission(gentity_t* ent) {}
LABELV $64
endproc SP_info_player_intermission 0 0
export SpotWouldTelefrag
proc SpotWouldTelefrag 4144 16
line 59
;44:
;45:/*
;46:=======================================================================
;47:
;48:  SelectSpawnPoint
;49:
;50:=======================================================================
;51:*/
;52:
;53:/*
;54:================
;55:SpotWouldTelefrag
;56:
;57:================
;58:*/
;59:qboolean SpotWouldTelefrag(gentity_t* spot) {
line 65
;60:	int        i, num;
;61:	int        touch[MAX_GENTITIES];
;62:	gentity_t* hit;
;63:	vec3_t     mins, maxs;
;64:
;65:	VectorAdd(spot->s.origin, playerMins, mins);
ADDRLP4 4132
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4108
ADDRLP4 4132
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMins
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+4
ADDRLP4 4132
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMins+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4108+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMins+8
INDIRF4
ADDF4
ASGNF4
line 66
;66:	VectorAdd(spot->s.origin, playerMaxs, maxs);
ADDRLP4 4136
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4120
ADDRLP4 4136
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRGP4 playerMaxs
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+4
ADDRLP4 4136
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRGP4 playerMaxs+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4120+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRGP4 playerMaxs+8
INDIRF4
ADDF4
ASGNF4
line 67
;67:	num = trap_EntitiesInBox(mins, maxs, touch, MAX_GENTITIES);
ADDRLP4 4108
ARGP4
ADDRLP4 4120
ARGP4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4140
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 4140
INDIRI4
ASGNI4
line 69
;68:
;69:	for (i = 0; i < num; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $77
JUMPV
LABELV $74
line 70
;70:		hit = &g_entities[touch[i]];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 72
;71:		// if ( hit->client && hit->client->ps.stats[STAT_HEALTH] > 0 ) {
;72:		if (hit->client) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $78
line 73
;73:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $65
JUMPV
LABELV $78
line 75
;74:		}
;75:	}
LABELV $75
line 69
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $77
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $74
line 77
;76:
;77:	return qfalse;
CNSTI4 0
RETI4
LABELV $65
endproc SpotWouldTelefrag 4144 16
proc SelectRandomFurthestSpawnPoint 596 4
line 88
;78:}
;79:
;80:/*
;81:===========
;82:SelectRandomFurthestSpawnPoint
;83:
;84:Chooses a player start, deathmatch start, etc
;85:============
;86:*/
;87:#define MAX_SPAWN_POINTS 64
;88:static gentity_t* SelectRandomFurthestSpawnPoint(const gentity_t* ent, vec3_t avoidPoint, vec3_t origin, vec3_t angles) {
line 101
;89:	gentity_t* spot;
;90:	vec3_t     delta;
;91:	float      dist;
;92:	float      list_dist[MAX_SPAWN_POINTS];
;93:	gentity_t* list_spot[MAX_SPAWN_POINTS];
;94:	int        numSpots, i, j, n;
;95:	int        selection;
;96:	int        checkTelefrag;
;97:	int        checkType;
;98:	int        checkMask;
;99:	qboolean   isBot;
;100:
;101:	checkType     = qtrue;
ADDRLP4 552
CNSTI4 1
ASGNI4
line 102
;102:	checkTelefrag = qtrue;
ADDRLP4 548
CNSTI4 1
ASGNI4
line 104
;103:
;104:	if (ent)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $81
line 105
;105:		isBot = ((ent->r.svFlags & SVF_BOT) == SVF_BOT);
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 8
NEI4 $84
ADDRLP4 568
CNSTI4 1
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $84
ADDRLP4 568
CNSTI4 0
ASGNI4
LABELV $85
ADDRLP4 556
ADDRLP4 568
INDIRI4
ASGNI4
ADDRGP4 $82
JUMPV
LABELV $81
line 107
;106:	else
;107:		isBot = qfalse;
ADDRLP4 556
CNSTI4 0
ASGNI4
LABELV $82
line 109
;108:
;109:	checkMask = 3;
ADDRLP4 560
CNSTI4 3
ASGNI4
LABELV $86
line 113
;110:
;111:__search:
;112:
;113:	checkTelefrag = checkMask & 1;
ADDRLP4 548
ADDRLP4 560
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 114
;114:	checkType     = checkMask & 2;
ADDRLP4 552
ADDRLP4 560
INDIRI4
CNSTI4 2
BANDI4
ASGNI4
line 116
;115:
;116:	numSpots = 0;
ADDRLP4 520
CNSTI4 0
ASGNI4
line 117
;117:	for (n = 0; n < level.numSpawnSpots; n++) {
ADDRLP4 544
CNSTI4 0
ASGNI4
ADDRGP4 $90
JUMPV
LABELV $87
line 118
;118:		spot = level.spawnSpots[n];
ADDRLP4 528
ADDRLP4 544
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
INDIRP4
ASGNP4
line 120
;119:
;120:		if (spot->fteam != TEAM_FREE && level.numSpawnSpotsFFA > 0)
ADDRLP4 528
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $93
ADDRGP4 level+11792
INDIRI4
CNSTI4 0
LEI4 $93
line 121
;121:			continue;
ADDRGP4 $88
JUMPV
LABELV $93
line 123
;122:
;123:		if (checkTelefrag && SpotWouldTelefrag(spot))
ADDRLP4 548
INDIRI4
CNSTI4 0
EQI4 $96
ADDRLP4 528
INDIRP4
ARGP4
ADDRLP4 572
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 572
INDIRI4
CNSTI4 0
EQI4 $96
line 124
;124:			continue;
ADDRGP4 $88
JUMPV
LABELV $96
line 126
;125:
;126:		if (checkType) {
ADDRLP4 552
INDIRI4
CNSTI4 0
EQI4 $98
line 127
;127:			if ((spot->flags & FL_NO_BOTS) && isBot)
ADDRLP4 528
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $100
ADDRLP4 556
INDIRI4
CNSTI4 0
EQI4 $100
line 128
;128:				continue;
ADDRGP4 $88
JUMPV
LABELV $100
line 129
;129:			if ((spot->flags & FL_NO_HUMANS) && !isBot)
ADDRLP4 528
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $102
ADDRLP4 556
INDIRI4
CNSTI4 0
NEI4 $102
line 130
;130:				continue;
ADDRGP4 $88
JUMPV
LABELV $102
line 131
;131:		}
LABELV $98
line 133
;132:
;133:		VectorSubtract(spot->s.origin, avoidPoint, delta);
ADDRLP4 580
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 532
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 580
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+4
ADDRLP4 528
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 580
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 532+8
ADDRLP4 528
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 134
;134:		dist = VectorLength(delta);
ADDRLP4 532
ARGP4
ADDRLP4 584
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 524
ADDRLP4 584
INDIRF4
ASGNF4
line 136
;135:
;136:		for (i = 0; i < numSpots; i++) {
ADDRLP4 516
CNSTI4 0
ASGNI4
ADDRGP4 $109
JUMPV
LABELV $106
line 137
;137:			if (dist > list_dist[i]) {
ADDRLP4 524
INDIRF4
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRF4
LEF4 $110
line 138
;138:				if (numSpots >= MAX_SPAWN_POINTS)
ADDRLP4 520
INDIRI4
CNSTI4 64
LTI4 $112
line 139
;139:					numSpots = MAX_SPAWN_POINTS - 1;
ADDRLP4 520
CNSTI4 63
ASGNI4
LABELV $112
line 141
;140:
;141:				for (j = numSpots; j > i; j--) {
ADDRLP4 0
ADDRLP4 520
INDIRI4
ASGNI4
ADDRGP4 $117
JUMPV
LABELV $114
line 142
;142:					list_dist[j] = list_dist[j - 1];
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
INDIRF4
ASGNF4
line 143
;143:					list_spot[j] = list_spot[j - 1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260-4
ADDP4
INDIRP4
ASGNP4
line 144
;144:				}
LABELV $115
line 141
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $117
ADDRLP4 0
INDIRI4
ADDRLP4 516
INDIRI4
GTI4 $114
line 146
;145:
;146:				list_dist[i] = dist;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 147
;147:				list_spot[i] = spot;
ADDRLP4 516
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 149
;148:
;149:				numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 150
;150:				break;
ADDRGP4 $108
JUMPV
LABELV $110
line 152
;151:			}
;152:		}
LABELV $107
line 136
ADDRLP4 516
ADDRLP4 516
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $109
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $106
LABELV $108
line 154
;153:
;154:		if (i >= numSpots && numSpots < MAX_SPAWN_POINTS) {
ADDRLP4 516
INDIRI4
ADDRLP4 520
INDIRI4
LTI4 $120
ADDRLP4 520
INDIRI4
CNSTI4 64
GEI4 $120
line 155
;155:			list_dist[numSpots] = dist;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 524
INDIRF4
ASGNF4
line 156
;156:			list_spot[numSpots] = spot;
ADDRLP4 520
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
ADDRLP4 528
INDIRP4
ASGNP4
line 157
;157:			numSpots++;
ADDRLP4 520
ADDRLP4 520
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 158
;158:		}
LABELV $120
line 159
;159:	}
LABELV $88
line 117
ADDRLP4 544
ADDRLP4 544
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $90
ADDRLP4 544
INDIRI4
ADDRGP4 level+11784
INDIRI4
LTI4 $87
line 161
;160:
;161:	if (!numSpots) {
ADDRLP4 520
INDIRI4
CNSTI4 0
NEI4 $122
line 162
;162:		if (checkMask <= 0) {
ADDRLP4 560
INDIRI4
CNSTI4 0
GTI4 $124
line 163
;163:			G_Error("Couldn't find a spawn point");
ADDRGP4 $126
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 164
;164:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $80
JUMPV
LABELV $124
line 166
;165:		}
;166:		checkMask--;
ADDRLP4 560
ADDRLP4 560
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 167
;167:		goto __search;  // next attempt with different flags
ADDRGP4 $86
JUMPV
LABELV $122
line 171
;168:	}
;169:
;170:	// select a random spot from the spawn points furthest away
;171:	selection = random() * (numSpots / 2);
ADDRLP4 572
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 564
ADDRLP4 572
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
ADDRLP4 520
INDIRI4
CNSTI4 2
DIVI4
CVIF4 4
MULF4
CVFI4 4
ASGNI4
line 172
;172:	spot      = list_spot[selection];
ADDRLP4 528
ADDRLP4 564
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 260
ADDP4
INDIRP4
ASGNP4
line 174
;173:
;174:	VectorCopy(spot->s.angles, angles);
ADDRFP4 12
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 175
;175:	VectorCopy(spot->s.origin, origin);
ADDRFP4 8
INDIRP4
ADDRLP4 528
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 176
;176:	origin[2] += 9.0f;
ADDRLP4 576
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 576
INDIRP4
ADDRLP4 576
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 178
;177:
;178:	return spot;
ADDRLP4 528
INDIRP4
RETP4
LABELV $80
endproc SelectRandomFurthestSpawnPoint 596 4
export SelectSpawnPoint
proc SelectSpawnPoint 4 16
line 188
;179:}
;180:
;181:/*
;182:===========
;183:SelectSpawnPoint
;184:
;185:Chooses a player start, deathmatch start, etc
;186:============
;187:*/
;188:gentity_t* SelectSpawnPoint(gentity_t* ent, vec3_t avoidPoint, vec3_t origin, vec3_t angles) {
line 189
;189:	return SelectRandomFurthestSpawnPoint(ent, avoidPoint, origin, angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 SelectRandomFurthestSpawnPoint
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $127
endproc SelectSpawnPoint 4 16
export SelectInitialSpawnPoint
proc SelectInitialSpawnPoint 20 16
line 200
;190:}
;191:
;192:/*
;193:===========
;194:SelectInitialSpawnPoint
;195:
;196:Try to find a spawn point marked 'initial', otherwise
;197:use normal spawn selection.
;198:============
;199:*/
;200:gentity_t* SelectInitialSpawnPoint(gentity_t* ent, vec3_t origin, vec3_t angles) {
line 204
;201:	gentity_t* spot;
;202:	int        n;
;203:
;204:	spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 206
;205:
;206:	for (n = 0; n < level.numSpawnSpotsFFA; n++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $132
JUMPV
LABELV $129
line 207
;207:		spot = level.spawnSpots[n];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7688
ADDP4
INDIRP4
ASGNP4
line 208
;208:		if (spot->fteam != TEAM_FREE)
ADDRLP4 0
INDIRP4
CNSTI4 808
ADDP4
INDIRI4
CNSTI4 0
EQI4 $135
line 209
;209:			continue;
ADDRGP4 $130
JUMPV
LABELV $135
line 210
;210:		if (spot->spawnflags & 1)
ADDRLP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $137
line 211
;211:			break;
ADDRGP4 $131
JUMPV
LABELV $137
line 213
;212:		else
;213:			spot = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
line 214
;214:	}
LABELV $130
line 206
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $132
ADDRLP4 4
INDIRI4
ADDRGP4 level+11792
INDIRI4
LTI4 $129
LABELV $131
line 216
;215:
;216:	if (!spot || SpotWouldTelefrag(spot)) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $141
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 SpotWouldTelefrag
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $139
LABELV $141
line 217
;217:		return SelectSpawnPoint(ent, vec3_origin, origin, angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 16
INDIRP4
RETP4
ADDRGP4 $128
JUMPV
LABELV $139
line 220
;218:	}
;219:
;220:	VectorCopy(spot->s.angles, angles);
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 221
;221:	VectorCopy(spot->s.origin, origin);
ADDRFP4 4
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 222
;222:	origin[2] += 9.0f;
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRF4
CNSTF4 1091567616
ADDF4
ASGNF4
line 224
;223:
;224:	return spot;
ADDRLP4 0
INDIRP4
RETP4
LABELV $128
endproc SelectInitialSpawnPoint 20 16
export SelectSpectatorSpawnPoint
proc SelectSpectatorSpawnPoint 0 0
line 233
;225:}
;226:
;227:/*
;228:===========
;229:SelectSpectatorSpawnPoint
;230:
;231:============
;232:*/
;233:gentity_t* SelectSpectatorSpawnPoint(vec3_t origin, vec3_t angles) {
line 234
;234:	FindIntermissionPoint();
ADDRGP4 FindIntermissionPoint
CALLV
pop
line 236
;235:
;236:	VectorCopy(level.intermission_origin, origin);
ADDRFP4 0
INDIRP4
ADDRGP4 level+7616
INDIRB
ASGNB 12
line 237
;237:	VectorCopy(level.intermission_angle, angles);
ADDRFP4 4
INDIRP4
ADDRGP4 level+7628
INDIRB
ASGNB 12
line 239
;238:
;239:	return level.spawnSpots[SPAWN_SPOT_INTERMISSION];  // was NULL
ADDRGP4 level+7688+4092
INDIRP4
RETP4
LABELV $142
endproc SelectSpectatorSpawnPoint 0 0
export InitBodyQue
proc InitBodyQue 12 0
line 255
;240:}
;241:
;242:/*
;243:=======================================================================
;244:
;245:BODYQUE
;246:
;247:=======================================================================
;248:*/
;249:
;250:/*
;251:===============
;252:InitBodyQue
;253:===============
;254:*/
;255:void InitBodyQue(void) {
line 259
;256:	int        i;
;257:	gentity_t* ent;
;258:
;259:	level.bodyQueIndex = 0;
ADDRGP4 level+7652
CNSTI4 0
ASGNI4
line 260
;260:	for (i = 0; i < BODY_QUEUE_SIZE; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $149
line 261
;261:		ent              = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 262
;262:		ent->classname   = "bodyque";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $153
ASGNP4
line 263
;263:		ent->neverFree   = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 532
ADDP4
CNSTI4 1
ASGNI4
line 264
;264:		level.bodyQue[i] = ent;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7656
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 265
;265:	}
LABELV $150
line 260
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 8
LTI4 $149
line 266
;266:}
LABELV $147
endproc InitBodyQue 12 0
export BodySink
proc BodySink 4 4
line 275
;267:
;268:/*
;269:=============
;270:BodySink
;271:
;272:After sitting around for five seconds, fall into the ground and dissapear
;273:=============
;274:*/
;275:void BodySink(gentity_t* ent) {
line 276
;276:	if (level.time - ent->timestamp > 6500) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
SUBI4
CNSTI4 6500
LEI4 $156
line 278
;277:		// the body ques are never actually freed, they are just unlinked
;278:		trap_UnlinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 279
;279:		ent->physicsObject = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 0
ASGNI4
line 280
;280:		return;
ADDRGP4 $155
JUMPV
LABELV $156
line 282
;281:	}
;282:	ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 283
;283:	ent->s.pos.trBase[2] -= 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
CNSTF4 1065353216
SUBF4
ASGNF4
line 284
;284:}
LABELV $155
endproc BodySink 4 4
export CopyToBodyQue
proc CopyToBodyQue 48 8
line 294
;285:
;286:/*
;287:=============
;288:CopyToBodyQue
;289:
;290:A player is respawning, so make an entity that looks
;291:just like the existing corpse to leave behind.
;292:=============
;293:*/
;294:void CopyToBodyQue(gentity_t* ent) {
line 302
;295:#ifdef MISSIONPACK
;296:	gentity_t* e;
;297:	int        i;
;298:#endif
;299:	gentity_t* body;
;300:	int        contents;
;301:
;302:	trap_UnlinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 305
;303:
;304:	// if client is in a nodrop area, don't leave the body
;305:	contents = trap_PointContents(ent->s.origin, -1);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 8
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 306
;306:	if (contents & CONTENTS_NODROP) {
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $161
line 307
;307:		return;
ADDRGP4 $160
JUMPV
LABELV $161
line 311
;308:	}
;309:
;310:	// grab a body que and cycle to the next one
;311:	body               = level.bodyQue[level.bodyQueIndex];
ADDRLP4 0
ADDRGP4 level+7652
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+7656
ADDP4
INDIRP4
ASGNP4
line 312
;312:	level.bodyQueIndex = (level.bodyQueIndex + 1) % BODY_QUEUE_SIZE;
ADDRGP4 level+7652
ADDRGP4 level+7652
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 8
MODI4
ASGNI4
line 314
;313:
;314:	trap_UnlinkEntity(body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 316
;315:
;316:	body->s        = ent->s;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 208
line 317
;317:	body->s.eFlags = EF_DEAD;  // clear EF_TALK, etc
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 1
ASGNI4
line 336
;318:#ifdef MISSIONPACK
;319:	if (ent->s.eFlags & EF_KAMIKAZE) {
;320:		body->s.eFlags |= EF_KAMIKAZE;
;321:
;322:		// check if there is a kamikaze timer around for this owner
;323:		for (i = 0; i < level.num_entities; i++) {
;324:			e = &g_entities[i];
;325:			if (!e->inuse)
;326:				continue;
;327:			if (e->activator != ent)
;328:				continue;
;329:			if (strcmp(e->classname, "kamikaze timer"))
;330:				continue;
;331:			e->activator = body;
;332:			break;
;333:		}
;334:	}
;335:#endif
;336:	body->s.powerups    = 0;  // clear powerups
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 337
;337:	body->s.loopSound   = 0;  // clear lava burning
ADDRLP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 338
;338:	body->s.number      = body - g_entities;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRGP4 g_entities
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 816
DIVI4
ASGNI4
line 339
;339:	body->timestamp     = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 340
;340:	body->physicsObject = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 564
ADDP4
CNSTI4 1
ASGNI4
line 341
;341:	body->physicsBounce = 0;  // don't bounce
ADDRLP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTF4 0
ASGNF4
line 342
;342:	if (body->s.groundEntityNum == ENTITYNUM_NONE) {
ADDRLP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $168
line 343
;343:		body->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 344
;344:		body->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 345
;345:		VectorCopy(ent->client->ps.velocity, body->s.pos.trDelta);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 346
;346:	} else {
ADDRGP4 $169
JUMPV
LABELV $168
line 347
;347:		body->s.pos.trType = TR_STATIONARY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 0
ASGNI4
line 348
;348:	}
LABELV $169
line 349
;349:	body->s.event = 0;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
CNSTI4 0
ASGNI4
line 353
;350:
;351:	// change the animation to the last-frame only, so the sequence
;352:	// doesn't repeat anew for the body
;353:	switch (body->s.legsAnim & ~ANIM_TOGGLEBIT) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
LTI4 $171
ADDRLP4 16
INDIRI4
CNSTI4 5
GTI4 $171
ADDRLP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $177
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $177
address $174
address $174
address $175
address $175
address $176
address $176
code
LABELV $174
line 356
;354:	case BOTH_DEATH1:
;355:	case BOTH_DEAD1:
;356:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD1;
ADDRLP4 28
CNSTI4 1
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 28
INDIRI4
ASGNI4
line 357
;357:		break;
ADDRGP4 $172
JUMPV
LABELV $175
line 360
;358:	case BOTH_DEATH2:
;359:	case BOTH_DEAD2:
;360:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD2;
ADDRLP4 36
CNSTI4 3
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 36
INDIRI4
ASGNI4
line 361
;361:		break;
ADDRGP4 $172
JUMPV
LABELV $176
LABELV $171
line 365
;362:	case BOTH_DEATH3:
;363:	case BOTH_DEAD3:
;364:	default:
;365:		body->s.torsoAnim = body->s.legsAnim = BOTH_DEAD3;
ADDRLP4 44
CNSTI4 5
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 44
INDIRI4
ASGNI4
line 366
;366:		break;
LABELV $172
line 369
;367:	}
;368:
;369:	body->r.svFlags = ent->r.svFlags;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
ASGNI4
line 370
;370:	VectorCopy(ent->r.mins, body->r.mins);
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRB
ASGNB 12
line 371
;371:	VectorCopy(ent->r.maxs, body->r.maxs);
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRB
ASGNB 12
line 372
;372:	VectorCopy(ent->r.absmin, body->r.absmin);
ADDRLP4 0
INDIRP4
CNSTI4 464
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRB
ASGNB 12
line 373
;373:	VectorCopy(ent->r.absmax, body->r.absmax);
ADDRLP4 0
INDIRP4
CNSTI4 476
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 375
;374:
;375:	body->clipmask   = CONTENTS_SOLID | CONTENTS_PLAYERCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 65537
ASGNI4
line 376
;376:	body->r.contents = CONTENTS_CORPSE;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 67108864
ASGNI4
line 377
;377:	body->r.ownerNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 379
;378:
;379:	body->nextthink = level.time + 5000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 5000
ADDI4
ASGNI4
line 380
;380:	body->think     = BodySink;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 BodySink
ASGNP4
line 382
;381:
;382:	body->die = body_die;
ADDRLP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 body_die
ASGNP4
line 385
;383:
;384:	// don't take more damage if already gibbed
;385:	if (ent->health <= GIB_HEALTH) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $179
line 386
;386:		body->takedamage = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 387
;387:	} else {
ADDRGP4 $180
JUMPV
LABELV $179
line 388
;388:		body->takedamage = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 389
;389:	}
LABELV $180
line 391
;390:
;391:	VectorCopy(body->s.pos.trBase, body->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 392
;392:	trap_LinkEntity(body);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 393
;393:}
LABELV $160
endproc CopyToBodyQue 48 8
export SetClientViewAngle
proc SetClientViewAngle 20 0
line 402
;394:
;395://======================================================================
;396:
;397:/*
;398:==================
;399:SetClientViewAngle
;400:==================
;401:*/
;402:void SetClientViewAngle(gentity_t* ent, vec3_t angle) {
line 406
;403:	int        i, cmdAngle;
;404:	gclient_t* client;
;405:
;406:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 409
;407:
;408:	// set the delta angle
;409:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $182
line 410
;410:		cmdAngle                   = ANGLE2SHORT(angle[i]);
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRF4
CNSTF4 1127615329
MULF4
CVFI4 4
CNSTI4 65535
BANDI4
ASGNI4
line 411
;411:		client->ps.delta_angles[i] = cmdAngle - client->pers.cmd.angles[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 56
ADDP4
ADDP4
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 412
;412:	}
LABELV $183
line 409
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $182
line 413
;413:	VectorCopy(angle, ent->s.angles);
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 414
;414:	VectorCopy(ent->s.angles, client->ps.viewangles);
ADDRLP4 4
INDIRP4
CNSTI4 152
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 415
;415:}
LABELV $181
endproc SetClientViewAngle 20 0
export respawn
proc respawn 8 8
line 422
;416:
;417:/*
;418:================
;419:respawn
;420:================
;421:*/
;422:void respawn(gentity_t* ent) {
line 425
;423:	gentity_t* tent;
;424:
;425:	if (ent->health <= 0)
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $187
line 426
;426:		CopyToBodyQue(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CopyToBodyQue
CALLV
pop
LABELV $187
line 428
;427:
;428:	ClientSpawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 431
;429:
;430:	// bots doesn't need to see any effects
;431:	if (level.intermissiontime && ent->r.svFlags & SVF_BOT)
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $189
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $189
line 432
;432:		return;
ADDRGP4 $186
JUMPV
LABELV $189
line 435
;433:
;434:	// add a teleportation effect
;435:	tent              = G_TempEntity(ent->client->ps.origin, EV_PLAYER_TELEPORT_IN);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 436
;436:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 439
;437:
;438:	// optimize bandwidth
;439:	if (level.intermissiontime) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $192
line 440
;440:		tent->r.svFlags      = SVF_SINGLECLIENT;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 256
ASGNI4
line 441
;441:		tent->r.singleClient = ent->s.clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 442
;442:	}
LABELV $192
line 443
;443:}
LABELV $186
endproc respawn 8 8
export TeamCount
proc TeamCount 8 0
line 452
;444:
;445:/*
;446:================
;447:TeamCount
;448:
;449:Returns number of players on a team
;450:================
;451:*/
;452:int TeamCount(int ignoreClientNum, team_t team) {
line 454
;453:	int i;
;454:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 456
;455:
;456:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $199
JUMPV
LABELV $196
line 457
;457:		if (i == ignoreClientNum) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $201
line 458
;458:			continue;
ADDRGP4 $197
JUMPV
LABELV $201
line 460
;459:		}
;460:		if (level.clients[i].pers.connected == CON_DISCONNECTED) {
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
NEI4 $203
line 461
;461:			continue;
ADDRGP4 $197
JUMPV
LABELV $203
line 463
;462:		}
;463:		if (level.clients[i].sess.sessionTeam == team) {
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
ADDRFP4 4
INDIRI4
NEI4 $205
line 464
;464:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 465
;465:		}
LABELV $205
line 466
;466:	}
LABELV $197
line 456
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $199
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $196
line 468
;467:
;468:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $195
endproc TeamCount 8 0
export TeamConnectedCount
proc TeamConnectedCount 8 0
line 478
;469:}
;470:
;471:/*
;472:================
;473:TeamConnectedCount
;474:
;475:Returns number of active players on a team
;476:================
;477:*/
;478:int TeamConnectedCount(int ignoreClientNum, team_t team) {
line 480
;479:	int i;
;480:	int count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 482
;481:
;482:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $211
JUMPV
LABELV $208
line 483
;483:		if (i == ignoreClientNum) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $213
line 484
;484:			continue;
ADDRGP4 $209
JUMPV
LABELV $213
line 486
;485:		}
;486:		if (level.clients[i].pers.connected != CON_CONNECTED) {
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
EQI4 $215
line 487
;487:			continue;
ADDRGP4 $209
JUMPV
LABELV $215
line 489
;488:		}
;489:		if (level.clients[i].sess.sessionTeam == team) {
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
ADDRFP4 4
INDIRI4
NEI4 $217
line 490
;490:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 491
;491:		}
LABELV $217
line 492
;492:	}
LABELV $209
line 482
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $211
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $208
line 494
;493:
;494:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $207
endproc TeamConnectedCount 8 0
export TeamLeader
proc TeamLeader 4 0
line 504
;495:}
;496:
;497:/*
;498:================
;499:TeamLeader
;500:
;501:Returns the client number of the team leader
;502:================
;503:*/
;504:int TeamLeader(team_t team) {
line 507
;505:	int i;
;506:
;507:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $223
JUMPV
LABELV $220
line 508
;508:		if (level.clients[i].pers.connected == CON_DISCONNECTED) {
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
NEI4 $225
line 509
;509:			continue;
ADDRGP4 $221
JUMPV
LABELV $225
line 511
;510:		}
;511:		if (level.clients[i].sess.sessionTeam == team) {
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
ADDRFP4 0
INDIRI4
NEI4 $227
line 512
;512:			if (level.clients[i].sess.teamLeader)
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 648
ADDP4
INDIRI4
CNSTI4 0
EQI4 $229
line 513
;513:				return i;
ADDRLP4 0
INDIRI4
RETI4
ADDRGP4 $219
JUMPV
LABELV $229
line 514
;514:		}
LABELV $227
line 515
;515:	}
LABELV $221
line 507
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $223
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $220
line 517
;516:
;517:	return -1;
CNSTI4 -1
RETI4
LABELV $219
endproc TeamLeader 4 0
export PickTeam
proc PickTeam 24 8
line 525
;518:}
;519:
;520:/*
;521:================
;522:PickTeam
;523:================
;524:*/
;525:team_t PickTeam(int ignoreClientNum) {
line 528
;526:	int counts[TEAM_NUM_TEAMS];
;527:
;528:	counts[TEAM_BLUE] = TeamCount(ignoreClientNum, TEAM_BLUE);
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
line 529
;529:	counts[TEAM_RED]  = TeamCount(ignoreClientNum, TEAM_RED);
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
line 531
;530:
;531:	if (counts[TEAM_BLUE] > counts[TEAM_RED]) {
ADDRLP4 0+8
INDIRI4
ADDRLP4 0+4
INDIRI4
LEI4 $234
line 532
;532:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $231
JUMPV
LABELV $234
line 534
;533:	}
;534:	if (counts[TEAM_RED] > counts[TEAM_BLUE]) {
ADDRLP4 0+4
INDIRI4
ADDRLP4 0+8
INDIRI4
LEI4 $238
line 535
;535:		return TEAM_BLUE;
CNSTI4 2
RETI4
ADDRGP4 $231
JUMPV
LABELV $238
line 538
;536:	}
;537:	// equal team count, so join the team with the lowest score
;538:	if (level.teamScores[TEAM_BLUE] > level.teamScores[TEAM_RED]) {
ADDRGP4 level+48+8
INDIRI4
ADDRGP4 level+48+4
INDIRI4
LEI4 $242
line 539
;539:		return TEAM_RED;
CNSTI4 1
RETI4
ADDRGP4 $231
JUMPV
LABELV $242
line 541
;540:	}
;541:	return TEAM_BLUE;
CNSTI4 2
RETI4
LABELV $231
endproc PickTeam 24 8
export ClientUserinfoChanged
proc ClientUserinfoChanged 1316 52
line 557
;542:}
;543:
;544:/*
;545:===========
;546:ClientUserInfoChanged
;547:
;548:Called from ClientConnect when the player first connects and
;549:directly by the server system when the player updates a userinfo variable.
;550:
;551:The game can override any of the settings and call trap_SetUserinfo
;552:if desired.
;553:
;554:returns qfalse in case of invalid userinfo
;555:============
;556:*/
;557:qboolean ClientUserinfoChanged(int clientNum) {
line 569
;558:	gentity_t* ent;
;559:	int        teamTask, teamLeader, health;
;560:	char*      s;
;561:	char       model[MAX_QPATH];
;562:	char       headModel[MAX_QPATH];
;563:	char       oldname[MAX_NETNAME];
;564:	gclient_t* client;
;565:	char       c1[8];
;566:	char       c2[8];
;567:	char       userinfo[MAX_INFO_STRING];
;568:
;569:	ent    = g_entities + clientNum;
ADDRLP4 1032
ADDRFP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 570
;570:	client = ent->client;
ADDRLP4 0
ADDRLP4 1032
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 572
;571:
;572:	trap_GetUserinfo(clientNum, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 575
;573:
;574:	// check for malformed or illegal info strings
;575:	if (!Info_Validate(userinfo)) {
ADDRLP4 4
ARGP4
ADDRLP4 1228
ADDRGP4 Info_Validate
CALLI4
ASGNI4
ADDRLP4 1228
INDIRI4
CNSTI4 0
NEI4 $249
line 576
;576:		Q_strcpy(ban_reason, "bad userinfo");
ADDRGP4 ban_reason
ARGP4
ADDRGP4 $251
ARGP4
ADDRGP4 Q_strcpy
CALLV
pop
line 577
;577:		if (client && client->pers.connected != CON_DISCONNECTED)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $252
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
EQI4 $252
line 578
;578:			trap_DropClient(clientNum, ban_reason);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ban_reason
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
LABELV $252
line 579
;579:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $248
JUMPV
LABELV $249
line 582
;580:	}
;581:
;582:	if (client->pers.connected == CON_DISCONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $254
line 585
;583:		// we just checked if connecting player can join server
;584:		// so quit now as some important data like player team is still not set
;585:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $248
JUMPV
LABELV $254
line 589
;586:	}
;587:
;588:	// check for local client
;589:	s = Info_ValueForKey(userinfo, "ip");
ADDRLP4 4
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 1232
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1232
INDIRP4
ASGNP4
line 590
;590:	if (!strcmp(s, "localhost")) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 1236
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1236
INDIRI4
CNSTI4 0
NEI4 $257
line 591
;591:		client->pers.localClient = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 1
ASGNI4
line 592
;592:	} else {
ADDRGP4 $258
JUMPV
LABELV $257
line 593
;593:		client->pers.localClient = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
CNSTI4 0
ASGNI4
line 594
;594:	}
LABELV $258
line 597
;595:
;596:	// check the item prediction
;597:	s = Info_ValueForKey(userinfo, "cg_predictItems");
ADDRLP4 4
ARGP4
ADDRGP4 $260
ARGP4
ADDRLP4 1240
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1240
INDIRP4
ASGNP4
line 598
;598:	if (!atoi(s)) {
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1244
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1244
INDIRI4
CNSTI4 0
NEI4 $261
line 599
;599:		client->pers.predictItemPickup = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 0
ASGNI4
line 600
;600:	} else {
ADDRGP4 $262
JUMPV
LABELV $261
line 601
;601:		client->pers.predictItemPickup = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 504
ADDP4
CNSTI4 1
ASGNI4
line 602
;602:	}
LABELV $262
line 605
;603:
;604:	// set name
;605:	Q_strncpyz(oldname, client->pers.netname, sizeof(oldname));
ADDRLP4 1180
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 606
;606:	s = Info_ValueForKey(userinfo, "name");
ADDRLP4 4
ARGP4
ADDRGP4 $263
ARGP4
ADDRLP4 1248
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1248
INDIRP4
ASGNP4
line 607
;607:	BG_CleanName(s, client->pers.netname, sizeof(client->pers.netname), "UnnamedPlayer");
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 $264
ARGP4
ADDRGP4 BG_CleanName
CALLV
pop
line 609
;608:
;609:	if (client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $265
line 610
;610:		if (client->sess.spectatorState == SPECTATOR_SCOREBOARD) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 3
NEI4 $267
line 611
;611:			Q_strncpyz(client->pers.netname, "scoreboard", sizeof(client->pers.netname));
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRGP4 $269
ARGP4
CNSTI4 36
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 612
;612:		}
LABELV $267
line 613
;613:	}
LABELV $265
line 615
;614:
;615:	if (client->pers.connected == CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $270
line 616
;616:		if (strcmp(oldname, client->pers.netname)) {
ADDRLP4 1180
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 1252
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1252
INDIRI4
CNSTI4 0
EQI4 $272
line 617
;617:			G_BroadcastServerCommand(-1, va("print \"%s" S_COLOR_WHITE " renamed to %s\n\"", oldname, client->pers.netname));
ADDRGP4 $274
ARGP4
ADDRLP4 1180
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 1256
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1256
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 618
;618:		}
LABELV $272
line 619
;619:	}
LABELV $270
line 633
;620:
;621:	// set max health
;622:#ifdef MISSIONPACK
;623:	if (client->ps.powerups[PW_GUARD]) {
;624:		client->pers.maxHealth = HEALTH_SOFT_LIMIT * 2;
;625:	} else {
;626:		health                 = atoi(Info_ValueForKey(userinfo, "handicap"));
;627:		client->pers.maxHealth = health;
;628:		if (client->pers.maxHealth < 1 || client->pers.maxHealth > HEALTH_SOFT_LIMIT) {
;629:			client->pers.maxHealth = HEALTH_SOFT_LIMIT;
;630:		}
;631:	}
;632:#else
;633:	health                 = atoi(Info_ValueForKey(userinfo, "handicap"));
ADDRLP4 4
ARGP4
ADDRGP4 $275
ARGP4
ADDRLP4 1252
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1252
INDIRP4
ARGP4
ADDRLP4 1256
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1224
ADDRLP4 1256
INDIRI4
ASGNI4
line 634
;634:	client->pers.maxHealth = health;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 1224
INDIRI4
ASGNI4
line 635
;635:	if (client->pers.maxHealth < 1 || client->pers.maxHealth > HEALTH_SOFT_LIMIT) {
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 1
LTI4 $278
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 100
LEI4 $276
LABELV $278
line 636
;636:		client->pers.maxHealth = HEALTH_SOFT_LIMIT;
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 100
ASGNI4
line 637
;637:	}
LABELV $276
line 639
;638:#endif
;639:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 654
;640:
;641:#ifdef MISSIONPACK
;642:	if (g_gametype.integer >= GT_TEAM) {
;643:		client->pers.teamInfo = qtrue;
;644:	} else {
;645:		s = Info_ValueForKey(userinfo, "teamoverlay");
;646:		if (!*s || atoi(s) != 0) {
;647:			client->pers.teamInfo = qtrue;
;648:		} else {
;649:			client->pers.teamInfo = qfalse;
;650:		}
;651:	}
;652:#else
;653:	// teamInfo
;654:	s = Info_ValueForKey(userinfo, "teamoverlay");
ADDRLP4 4
ARGP4
ADDRGP4 $279
ARGP4
ADDRLP4 1268
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1268
INDIRP4
ASGNP4
line 655
;655:	if (!*s || atoi(s) != 0) {
ADDRLP4 1028
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $282
ADDRLP4 1028
INDIRP4
ARGP4
ADDRLP4 1276
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1276
INDIRI4
CNSTI4 0
EQI4 $280
LABELV $282
line 656
;656:		client->pers.teamInfo = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 1
ASGNI4
line 657
;657:	} else {
ADDRGP4 $281
JUMPV
LABELV $280
line 658
;658:		client->pers.teamInfo = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 608
ADDP4
CNSTI4 0
ASGNI4
line 659
;659:	}
LABELV $281
line 663
;660:#endif
;661:
;662:	// set model
;663:	Q_strncpyz(model, Info_ValueForKey(userinfo, "model"), sizeof(model));
ADDRLP4 4
ARGP4
ADDRGP4 $283
ARGP4
ADDRLP4 1280
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1036
ARGP4
ADDRLP4 1280
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 664
;664:	Q_strncpyz(headModel, Info_ValueForKey(userinfo, "headmodel"), sizeof(headModel));
ADDRLP4 4
ARGP4
ADDRGP4 $284
ARGP4
ADDRLP4 1284
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1100
ARGP4
ADDRLP4 1284
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 667
;665:
;666:	// team task (0 = none, 1 = offence, 2 = defence)
;667:	teamTask = atoi(Info_ValueForKey(userinfo, "teamtask"));
ADDRLP4 4
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 1288
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1288
INDIRP4
ARGP4
ADDRLP4 1292
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 1216
ADDRLP4 1292
INDIRI4
ASGNI4
line 669
;668:	// team Leader (1 = leader, 0 is normal player)
;669:	teamLeader = client->sess.teamLeader;
ADDRLP4 1220
ADDRLP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRI4
ASGNI4
line 672
;670:
;671:	// colors
;672:	Q_strncpyz(c1, Info_ValueForKey(userinfo, "color1"), sizeof(c1));
ADDRLP4 4
ARGP4
ADDRGP4 $286
ARGP4
ADDRLP4 1296
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1164
ARGP4
ADDRLP4 1296
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 673
;673:	Q_strncpyz(c2, Info_ValueForKey(userinfo, "color2"), sizeof(c2));
ADDRLP4 4
ARGP4
ADDRGP4 $287
ARGP4
ADDRLP4 1300
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1172
ARGP4
ADDRLP4 1300
INDIRP4
ARGP4
CNSTI4 8
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 677
;674:
;675:	// send over a subset of the userinfo keys so other clients can
;676:	// print scoreboards, display models, and play custom sounds
;677:	if (ent->r.svFlags & SVF_BOT) {
ADDRLP4 1032
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $288
line 678
;678:		s =
ADDRLP4 4
ARGP4
ADDRGP4 $291
ARGP4
ADDRLP4 1304
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRGP4 $290
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1172
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
ARGI4
ADDRLP4 1304
INDIRP4
ARGP4
ADDRLP4 1216
INDIRI4
ARGI4
ADDRLP4 1220
INDIRI4
ARGI4
ADDRLP4 1312
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1312
INDIRP4
ASGNP4
line 682
;679:			va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\skill\\%s\\tt\\%d\\tl\\%d", client->pers.netname,
;680:		       client->sess.sessionTeam, model, headModel, c1, c2, client->pers.maxHealth, client->sess.wins, client->sess.losses,
;681:		       Info_ValueForKey(userinfo, "skill"), teamTask, teamLeader);
;682:	} else {
ADDRGP4 $289
JUMPV
LABELV $288
line 683
;683:		s =
ADDRGP4 $292
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRLP4 1036
ARGP4
ADDRLP4 1100
ARGP4
ADDRLP4 1164
ARGP4
ADDRLP4 1172
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 644
ADDP4
INDIRI4
ARGI4
ADDRLP4 1216
INDIRI4
ARGI4
ADDRLP4 1220
INDIRI4
ARGI4
ADDRLP4 1308
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 1028
ADDRLP4 1308
INDIRP4
ASGNP4
line 686
;684:			va("n\\%s\\t\\%i\\model\\%s\\hmodel\\%s\\c1\\%s\\c2\\%s\\hc\\%i\\w\\%i\\l\\%i\\tt\\%d\\tl\\%d", client->pers.netname, client->sess.sessionTeam,
;685:		       model, headModel, c1, c2, client->pers.maxHealth, client->sess.wins, client->sess.losses, teamTask, teamLeader);
;686:	}
LABELV $289
line 688
;687:
;688:	trap_SetConfigstring(CS_PLAYERS + clientNum, s);
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 691
;689:
;690:	// this is not the userinfo, more like the configstring actually
;691:	G_LogPrintf("ClientUserinfoChanged: %i %s\n", clientNum, s);
ADDRGP4 $293
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1028
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 693
;692:
;693:	return qtrue;
CNSTI4 1
RETI4
LABELV $248
endproc ClientUserinfoChanged 1316 52
export ClientConnect
proc ClientConnect 1072 12
line 716
;694:}
;695:
;696:/*
;697:===========
;698:ClientConnect
;699:
;700:Called when a player begins connecting to the server.
;701:Called again for every map change or tournement restart.
;702:
;703:The session information will be valid after exit.
;704:
;705:Return NULL if the client should be allowed, otherwise return
;706:a string with the reason for denial.
;707:
;708:Otherwise, the client will be sent the current gamestate
;709:and will eventually get to ClientBegin.
;710:
;711:firstTime will be qtrue the very first time a client connects
;712:to the server machine, but qfalse on map changes and tournement
;713:restarts.
;714:============
;715:*/
;716:const char* ClientConnect(int clientNum, qboolean firstTime, qboolean isBot) {
line 724
;717:	char* value;
;718:	//	char		*areabits;
;719:	gclient_t* client;
;720:	char       userinfo[MAX_INFO_STRING];
;721:	gentity_t* ent;
;722:	qboolean   isAdmin;
;723:
;724:	if (clientNum >= level.maxclients) {
ADDRFP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $295
line 725
;725:		return "Bad connection slot.";
ADDRGP4 $298
RETP4
ADDRGP4 $294
JUMPV
LABELV $295
line 728
;726:	}
;727:
;728:	ent         = &g_entities[clientNum];
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 729
;729:	ent->client = level.clients + clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 731
;730:
;731:	if (firstTime) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $299
line 734
;732:		// cleanup previous data manually
;733:		// because client may silently (re)connect without ClientDisconnect in case of crash for example
;734:		if (level.clients[clientNum].pers.connected != CON_DISCONNECTED)
ADDRFP4 0
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
EQI4 $301
line 735
;735:			ClientDisconnect(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientDisconnect
CALLV
pop
LABELV $301
line 738
;736:
;737:		// remove old entity from the world
;738:		trap_UnlinkEntity(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 739
;739:		ent->r.contents   = 0;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 740
;740:		ent->s.eType      = ET_INVISIBLE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 741
;741:		ent->s.eFlags     = 0;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 0
ASGNI4
line 742
;742:		ent->s.modelindex = 0;
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 743
;743:		ent->s.clientNum  = clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 744
;744:		ent->s.number     = clientNum;
ADDRLP4 0
INDIRP4
ADDRFP4 0
INDIRI4
ASGNI4
line 745
;745:		ent->takedamage   = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 746
;746:	}
LABELV $299
line 748
;747:
;748:	ent->r.svFlags &= ~SVF_BOT;
ADDRLP4 1040
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 1040
INDIRP4
ADDRLP4 1040
INDIRP4
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 749
;749:	ent->inuse = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 751
;750:
;751:	trap_GetUserinfo(clientNum, userinfo, sizeof(userinfo));
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 757
;752:
;753:	// IP filtering
;754:	// https://zerowing.idsoftware.com/bugzilla/show_bug.cgi?id=500
;755:	// recommanding PB based IP / GUID banning, the builtin system is pretty limited
;756:	// check to see if they are on the banned IP list
;757:	value = Info_ValueForKey(userinfo, "ip");
ADDRLP4 12
ARGP4
ADDRGP4 $256
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1044
INDIRP4
ASGNP4
line 759
;758:
;759:	if (!strcmp(value, "localhost") && !isBot)
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 $259
ARGP4
ADDRLP4 1048
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
NEI4 $303
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $303
line 760
;760:		isAdmin = qtrue;
ADDRLP4 1036
CNSTI4 1
ASGNI4
ADDRGP4 $304
JUMPV
LABELV $303
line 762
;761:	else
;762:		isAdmin = qfalse;
ADDRLP4 1036
CNSTI4 0
ASGNI4
LABELV $304
line 764
;763:
;764:	if (!isAdmin && G_FilterPacket(value)) {
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $305
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1052
ADDRGP4 G_FilterPacket
CALLI4
ASGNI4
ADDRLP4 1052
INDIRI4
CNSTI4 0
EQI4 $305
line 765
;765:		return "You are banned from this server.";
ADDRGP4 $307
RETP4
ADDRGP4 $294
JUMPV
LABELV $305
line 771
;766:	}
;767:
;768:	// we don't check password for bots and local client
;769:	// NOTE: local client <-> "ip" "localhost"
;770:	// this means this client is not running in our current process
;771:	if (!isBot && !isAdmin) {
ADDRFP4 8
INDIRI4
CNSTI4 0
NEI4 $308
ADDRLP4 1036
INDIRI4
CNSTI4 0
NEI4 $308
line 773
;772:		// check for a password
;773:		if (g_password.string[0] && Q_stricmp(g_password.string, "none")) {
ADDRGP4 g_password+16
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $310
ADDRGP4 g_password+16
ARGP4
ADDRGP4 $314
ARGP4
ADDRLP4 1056
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
EQI4 $310
line 774
;774:			value = Info_ValueForKey(userinfo, "password");
ADDRLP4 12
ARGP4
ADDRGP4 $315
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1060
INDIRP4
ASGNP4
line 775
;775:			if (strcmp(g_password.string, value))
ADDRGP4 g_password+16
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 1064
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
EQI4 $316
line 776
;776:				return "Invalid password";
ADDRGP4 $319
RETP4
ADDRGP4 $294
JUMPV
LABELV $316
line 777
;777:		}
LABELV $310
line 778
;778:	}
LABELV $308
line 781
;779:
;780:	// they can connect
;781:	ent->client = level.clients + clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 782
;782:	client      = ent->client;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 785
;783:
;784:	//	areabits = client->areabits;
;785:	memset(client, 0, sizeof(*client));
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1576
ARGI4
ADDRGP4 memset
CALLP4
pop
line 787
;786:
;787:	client->ps.clientNum = clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 789
;788:
;789:	if (!ClientUserinfoChanged(clientNum)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 1056
ADDRGP4 ClientUserinfoChanged
CALLI4
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $320
line 790
;790:		return ban_reason;
ADDRGP4 ban_reason
RETP4
ADDRGP4 $294
JUMPV
LABELV $320
line 794
;791:	}
;792:
;793:	// read or initialize the session data
;794:	if (firstTime || level.newSession) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $325
ADDRGP4 level+68
INDIRI4
CNSTI4 0
EQI4 $322
LABELV $325
line 795
;795:		value = Info_ValueForKey(userinfo, "team");
ADDRLP4 12
ARGP4
ADDRGP4 $326
ARGP4
ADDRLP4 1060
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 1060
INDIRP4
ASGNP4
line 796
;796:		G_InitSessionData(client, value, isBot);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 G_InitSessionData
CALLV
pop
line 797
;797:		G_WriteClientSessionData(client);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_WriteClientSessionData
CALLV
pop
line 798
;798:	}
LABELV $322
line 800
;799:
;800:	G_ReadClientSessionData(client);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ReadClientSessionData
CALLV
pop
line 802
;801:
;802:	if (isBot) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $327
line 803
;803:		if (!G_BotConnect(clientNum, !firstTime)) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $332
ADDRLP4 1060
CNSTI4 1
ASGNI4
ADDRGP4 $333
JUMPV
LABELV $332
ADDRLP4 1060
CNSTI4 0
ASGNI4
LABELV $333
ADDRLP4 1060
INDIRI4
ARGI4
ADDRLP4 1064
ADDRGP4 G_BotConnect
CALLI4
ASGNI4
ADDRLP4 1064
INDIRI4
CNSTI4 0
NEI4 $329
line 804
;804:			return "BotConnectfailed";
ADDRGP4 $334
RETP4
ADDRGP4 $294
JUMPV
LABELV $329
line 806
;805:		}
;806:		ent->r.svFlags |= SVF_BOT;
ADDRLP4 1068
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 1068
INDIRP4
ADDRLP4 1068
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 807
;807:		client->sess.spectatorClient = clientNum;
ADDRLP4 4
INDIRP4
CNSTI4 636
ADDP4
ADDRFP4 0
INDIRI4
ASGNI4
line 808
;808:	}
LABELV $327
line 809
;809:	ent->inuse = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 812
;810:
;811:	// get and distribute relevant paramters
;812:	G_LogPrintf("ClientConnect: %i\n", clientNum);
ADDRGP4 $335
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 814
;813:
;814:	client->pers.connected = CON_CONNECTING;
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 1
ASGNI4
line 816
;815:
;816:	ClientUserinfoChanged(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 819
;817:
;818:	// don't do the "xxx connected" messages if they were caried over from previous level
;819:	if (firstTime) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $336
line 820
;820:		G_BroadcastServerCommand(-1, va("print \"%s" S_COLOR_WHITE " connected\n\"", client->pers.netname));
ADDRGP4 $338
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 1060
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 1060
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 823
;821:
;822:		// mute all prints until completely in game
;823:		client->pers.inGame = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 0
ASGNI4
line 824
;824:	} else {
ADDRGP4 $337
JUMPV
LABELV $336
line 825
;825:		client->pers.inGame = qtrue;  // FIXME: read from session data?
ADDRLP4 4
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 1
ASGNI4
line 826
;826:	}
LABELV $337
line 829
;827:
;828:	// count current clients and rank for scoreboard
;829:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 836
;830:
;831:	// for statistics
;832:	//	client->areabits = areabits;
;833:	//	if ( !client->areabits )
;834:	//		client->areabits = G_Alloc( (trap_AAS_PointReachabilityAreaIndex( NULL ) + 7) / 8 );
;835:
;836:	return NULL;
CNSTP4 0
RETP4
LABELV $294
endproc ClientConnect 1072 12
export ClientBegin
proc ClientBegin 28 12
line 848
;837:}
;838:
;839:/*
;840:===========
;841:ClientBegin
;842:
;843:called when a client has finished connecting, and is ready
;844:to be placed into the level.  This will happen every level load,
;845:and on transition between teams, but doesn't happen on respawns
;846:============
;847:*/
;848:void ClientBegin(int clientNum) {
line 855
;849:	gentity_t* ent;
;850:	gclient_t* client;
;851:	gentity_t* tent;
;852:	int        flags;
;853:	int        spawns;
;854:
;855:	ent = g_entities + clientNum;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 857
;856:
;857:	client = level.clients + clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 859
;858:
;859:	if (ent->r.linked) {
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $340
line 860
;860:		trap_UnlinkEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 861
;861:	}
LABELV $340
line 863
;862:
;863:	G_InitGentity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_InitGentity
CALLV
pop
line 864
;864:	ent->touch  = 0;
ADDRLP4 4
INDIRP4
CNSTI4 704
ADDP4
CNSTP4 0
ASGNP4
line 865
;865:	ent->pain   = 0;
ADDRLP4 4
INDIRP4
CNSTI4 712
ADDP4
CNSTP4 0
ASGNP4
line 866
;866:	ent->client = client;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 868
;867:
;868:	if (client->pers.connected == CON_DISCONNECTED)
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $342
line 869
;869:		return;
ADDRGP4 $339
JUMPV
LABELV $342
line 871
;870:
;871:	client->pers.connected       = CON_CONNECTED;
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 2
ASGNI4
line 872
;872:	client->pers.enterTime       = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 548
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 873
;873:	client->pers.teamState.state = TEAM_BEGIN;
ADDRLP4 0
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 0
ASGNI4
line 874
;874:	spawns                       = client->ps.persistant[PERS_SPAWN_COUNT];
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
INDIRI4
ASGNI4
line 881
;875:
;876:	// save eflags around this, because changing teams will
;877:	// cause this to happen with a valid entity, and we
;878:	// want to make sure the teleport bit is set right
;879:	// so the viewpoint doesn't interpolate through the
;880:	// world to the new position
;881:	flags = client->ps.eFlags;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
ASGNI4
line 882
;882:	memset(&client->ps, 0, sizeof(client->ps));
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 468
ARGI4
ADDRGP4 memset
CALLP4
pop
line 883
;883:	client->ps.eFlags                       = flags;
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 884
;884:	client->ps.persistant[PERS_SPAWN_COUNT] = spawns;
ADDRLP4 0
INDIRP4
CNSTI4 264
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 887
;885:
;886:	// locate ent at a spawn point
;887:	ClientSpawn(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 ClientSpawn
CALLV
pop
line 889
;888:
;889:	if (!client->pers.inGame) {
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $345
line 890
;890:		BroadcastTeamChange(client, -1);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 -1
ARGI4
ADDRGP4 BroadcastTeamChange
CALLV
pop
line 891
;891:		if (client->sess.sessionTeam == TEAM_RED || client->sess.sessionTeam == TEAM_BLUE)
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
EQI4 $349
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $347
LABELV $349
line 892
;892:			CheckTeamLeader(client->sess.sessionTeam);
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRGP4 CheckTeamLeader
CALLV
pop
LABELV $347
line 893
;893:	}
LABELV $345
line 895
;894:
;895:	if (client->sess.sessionTeam != TEAM_SPECTATOR) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $350
line 897
;896:		// send event
;897:		tent              = G_TempEntity(client->ps.origin, EV_PLAYER_TELEPORT_IN);
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 42
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 20
INDIRP4
ASGNP4
line 898
;898:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 16
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 900
;899:
;900:		client->sess.spectatorTime = 0;
ADDRLP4 0
INDIRP4
CNSTI4 628
ADDP4
CNSTI4 0
ASGNI4
line 902
;901:
;902:		if (g_gametype.integer != GT_TOURNAMENT && !client->pers.inGame) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
EQI4 $352
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
INDIRI4
CNSTI4 0
NEI4 $352
line 903
;903:			G_BroadcastServerCommand(-1, va("print \"%s" S_COLOR_WHITE " entered the game\n\"", client->pers.netname));
ADDRGP4 $355
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 -1
ARGI4
ADDRLP4 24
INDIRP4
ARGP4
ADDRGP4 G_BroadcastServerCommand
CALLV
pop
line 904
;904:		}
LABELV $352
line 905
;905:	}
LABELV $350
line 907
;906:
;907:	client->pers.inGame = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 620
ADDP4
CNSTI4 1
ASGNI4
line 909
;908:
;909:	G_LogPrintf("ClientBegin: %i\n", clientNum);
ADDRGP4 $356
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 912
;910:
;911:	// count current clients and rank for scoreboard
;912:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 913
;913:}
LABELV $339
endproc ClientBegin 28 12
export ClientSpawn
proc ClientSpawn 1384 20
line 924
;914:
;915:/*
;916:===========
;917:ClientSpawn
;918:
;919:Called every time a client is placed fresh in the world:
;920:after the first ClientBegin, and after each respawn
;921:Initializes all non-persistant parts of playerState
;922:============
;923:*/
;924:void ClientSpawn(gentity_t* ent) {
line 941
;925:	int                index;
;926:	vec3_t             spawn_origin, spawn_angles;
;927:	gclient_t*         client;
;928:	int                i;
;929:	clientPersistant_t saved;
;930:	clientSession_t    savedSess;
;931:	int                persistant[MAX_PERSISTANT];
;932:	gentity_t*         spawnPoint;
;933:	int                flags;
;934:	int                savedPing;
;935:	//	char	*savedAreaBits;
;936:	int      accuracy_hits, accuracy_shots;
;937:	int      eventSequence;
;938:	char     userinfo[MAX_INFO_STRING];
;939:	qboolean isSpectator;
;940:
;941:	index  = ent - g_entities;
ADDRLP4 104
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
line 942
;942:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 944
;943:
;944:	trap_UnlinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 946
;945:
;946:	isSpectator = client->sess.sessionTeam == TEAM_SPECTATOR;
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $359
ADDRLP4 1336
CNSTI4 1
ASGNI4
ADDRGP4 $360
JUMPV
LABELV $359
ADDRLP4 1336
CNSTI4 0
ASGNI4
LABELV $360
ADDRLP4 88
ADDRLP4 1336
INDIRI4
ASGNI4
line 950
;947:	// find a spawn point
;948:	// do it before setting health back up, so farthest
;949:	// ranging doesn't count this client
;950:	if (isSpectator) {
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $361
line 951
;951:		spawnPoint = SelectSpectatorSpawnPoint(spawn_origin, spawn_angles);
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 1340
ADDRGP4 SelectSpectatorSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1340
INDIRP4
ASGNP4
line 952
;952:	} else if (g_gametype.integer >= GT_CTF) {
ADDRGP4 $362
JUMPV
LABELV $361
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
LTI4 $363
line 954
;953:		// all base oriented team games use the CTF spawn points
;954:		spawnPoint = SelectCTFSpawnPoint(ent, client->sess.sessionTeam, client->pers.teamState.state, spawn_origin, spawn_angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
INDIRI4
ARGI4
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 1344
ADDRGP4 SelectCTFSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1344
INDIRP4
ASGNP4
line 955
;955:	} else {
ADDRGP4 $364
JUMPV
LABELV $363
LABELV $366
line 956
;956:		do {
line 958
;957:			// the first spawn should be at a good looking spot
;958:			if (!client->pers.initialSpawn && client->pers.localClient) {
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
INDIRI4
CNSTI4 0
NEI4 $369
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 0
EQI4 $369
line 959
;959:				client->pers.initialSpawn = qtrue;
ADDRLP4 4
INDIRP4
CNSTI4 500
ADDP4
CNSTI4 1
ASGNI4
line 960
;960:				spawnPoint                = SelectInitialSpawnPoint(ent, spawn_origin, spawn_angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 1344
ADDRGP4 SelectInitialSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1344
INDIRP4
ASGNP4
line 961
;961:			} else {
ADDRGP4 $370
JUMPV
LABELV $369
line 963
;962:				// don't spawn near existing origin if possible
;963:				spawnPoint = SelectSpawnPoint(ent, client->ps.origin, spawn_origin, spawn_angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
ADDRLP4 1344
ADDRGP4 SelectSpawnPoint
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 1344
INDIRP4
ASGNP4
line 964
;964:			}
LABELV $370
line 968
;965:
;966:			// Tim needs to prevent bots from spawning at the initial point
;967:			// on q3dm0...
;968:			if ((spawnPoint->flags & FL_NO_BOTS) && (ent->r.svFlags & SVF_BOT)) {
ADDRLP4 72
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $371
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $371
line 969
;969:				continue;  // try again
ADDRGP4 $367
JUMPV
LABELV $371
line 972
;970:			}
;971:			// just to be symetric, we have a nohumans option...
;972:			if ((spawnPoint->flags & FL_NO_HUMANS) && !(ent->r.svFlags & SVF_BOT)) {
ADDRLP4 72
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $368
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $368
line 973
;973:				continue;  // try again
line 976
;974:			}
;975:
;976:			break;
LABELV $367
line 978
;977:
;978:		} while (1);
ADDRGP4 $366
JUMPV
LABELV $368
line 979
;979:	}
LABELV $364
LABELV $362
line 980
;980:	client->pers.teamState.state = TEAM_ACTIVE;
ADDRLP4 4
INDIRP4
CNSTI4 552
ADDP4
CNSTI4 1
ASGNI4
line 989
;981:
;982:#ifdef MISSIONPACK
;983:	// always clear the kamikaze flag
;984:	ent->s.eFlags &= ~EF_KAMIKAZE;
;985:#endif
;986:
;987:	// toggle the teleport bit so the client knows to not lerp
;988:	// and never clear the voted flag
;989:	flags = client->ps.eFlags & (EF_TELEPORT_BIT | EF_VOTED | EF_TEAMVOTED);
ADDRLP4 108
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540676
BANDI4
ASGNI4
line 990
;990:	flags ^= EF_TELEPORT_BIT;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 993
;991:
;992:	// unlagged
;993:	G_ResetHistory(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_ResetHistory
CALLV
pop
line 994
;994:	client->saved.leveltime = 0;
ADDRLP4 4
INDIRP4
CNSTI4 1540
ADDP4
CNSTI4 0
ASGNI4
line 998
;995:
;996:	// clear everything but the persistant data
;997:
;998:	saved     = client->pers;
ADDRLP4 1136
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
INDIRB
ASGNB 156
line 999
;999:	savedSess = client->sess;
ADDRLP4 1292
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRB
ASGNB 28
line 1000
;1000:	savedPing = client->ps.ping;
ADDRLP4 1320
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
INDIRI4
ASGNI4
line 1002
;1001:	//	savedAreaBits = client->areabits;
;1002:	accuracy_hits  = client->accuracy_hits;
ADDRLP4 1324
ADDRLP4 4
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ASGNI4
line 1003
;1003:	accuracy_shots = client->accuracy_shots;
ADDRLP4 1328
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
ASGNI4
line 1004
;1004:	for (i = 0; i < MAX_PERSISTANT; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $375
line 1005
;1005:		persistant[i] = client->ps.persistant[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1006
;1006:	}
LABELV $376
line 1004
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $375
line 1007
;1007:	eventSequence = client->ps.eventSequence;
ADDRLP4 1332
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 1009
;1008:
;1009:	Com_Memset(client, 0, sizeof(*client));
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1576
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1011
;1010:
;1011:	client->pers    = saved;
ADDRLP4 4
INDIRP4
CNSTI4 468
ADDP4
ADDRLP4 1136
INDIRB
ASGNB 156
line 1012
;1012:	client->sess    = savedSess;
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
ADDRLP4 1292
INDIRB
ASGNB 28
line 1013
;1013:	client->ps.ping = savedPing;
ADDRLP4 4
INDIRP4
CNSTI4 452
ADDP4
ADDRLP4 1320
INDIRI4
ASGNI4
line 1015
;1014:	//	client->areabits = savedAreaBits;
;1015:	client->accuracy_hits     = accuracy_hits;
ADDRLP4 4
INDIRP4
CNSTI4 724
ADDP4
ADDRLP4 1324
INDIRI4
ASGNI4
line 1016
;1016:	client->accuracy_shots    = accuracy_shots;
ADDRLP4 4
INDIRP4
CNSTI4 720
ADDP4
ADDRLP4 1328
INDIRI4
ASGNI4
line 1017
;1017:	client->lastkilled_client = -1;
ADDRLP4 4
INDIRP4
CNSTI4 728
ADDP4
CNSTI4 -1
ASGNI4
line 1019
;1018:
;1019:	for (i = 0; i < MAX_PERSISTANT; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $379
line 1020
;1020:		client->ps.persistant[i] = persistant[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
INDIRI4
ASGNI4
line 1021
;1021:	}
LABELV $380
line 1019
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 16
LTI4 $379
line 1022
;1022:	client->ps.eventSequence = eventSequence;
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 1332
INDIRI4
ASGNI4
line 1024
;1023:	// increment the spawncount so the client will detect the respawn
;1024:	client->ps.persistant[PERS_SPAWN_COUNT]++;
ADDRLP4 1340
ADDRLP4 4
INDIRP4
CNSTI4 264
ADDP4
ASGNP4
ADDRLP4 1340
INDIRP4
ADDRLP4 1340
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1025
;1025:	client->ps.persistant[PERS_TEAM] = client->sess.sessionTeam;
ADDRLP4 4
INDIRP4
CNSTI4 260
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ASGNI4
line 1027
;1026:
;1027:	client->airOutTime = level.time + 12000;
ADDRLP4 4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 1029
;1028:
;1029:	trap_GetUserinfo(index, userinfo, sizeof(userinfo));
ADDRLP4 104
INDIRI4
ARGI4
ADDRLP4 112
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_GetUserinfo
CALLV
pop
line 1031
;1030:	// set max health
;1031:	client->pers.maxHealth = atoi(Info_ValueForKey(userinfo, "handicap"));
ADDRLP4 112
ARGP4
ADDRGP4 $275
ARGP4
ADDRLP4 1348
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 1348
INDIRP4
ARGP4
ADDRLP4 1352
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
ADDRLP4 1352
INDIRI4
ASGNI4
line 1032
;1032:	if (client->pers.maxHealth < 1 || client->pers.maxHealth > HEALTH_SOFT_LIMIT) {
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 1
LTI4 $386
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
CNSTI4 100
LEI4 $384
LABELV $386
line 1033
;1033:		client->pers.maxHealth = HEALTH_SOFT_LIMIT;
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
CNSTI4 100
ASGNI4
line 1034
;1034:	}
LABELV $384
line 1036
;1035:	// clear entity values
;1036:	client->ps.stats[STAT_MAX_HEALTH] = client->pers.maxHealth;
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 544
ADDP4
INDIRI4
ASGNI4
line 1037
;1037:	client->ps.eFlags                 = flags;
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 108
INDIRI4
ASGNI4
line 1038
;1038:	client->ps.persistant[PERS_SCORE] = 0;  // Resets score on every spawn (for fragfilters)
ADDRLP4 4
INDIRP4
CNSTI4 248
ADDP4
CNSTI4 0
ASGNI4
line 1040
;1039:
;1040:	ent->s.groundEntityNum = ENTITYNUM_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 1023
ASGNI4
line 1041
;1041:	ent->client            = &level.clients[index];
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
ADDRLP4 104
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1042
;1042:	ent->inuse             = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 1
ASGNI4
line 1043
;1043:	ent->classname         = "player";
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $387
ASGNP4
line 1044
;1044:	if (isSpectator) {
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $388
line 1045
;1045:		ent->takedamage    = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 1046
;1046:		ent->r.contents    = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 1047
;1047:		ent->clipmask      = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 65537
ASGNI4
line 1048
;1048:		client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 1049
;1049:	} else {
ADDRGP4 $389
JUMPV
LABELV $388
line 1050
;1050:		ent->takedamage = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 1051
;1051:		ent->r.contents = CONTENTS_BODY;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 33554432
ASGNI4
line 1052
;1052:		ent->clipmask   = MASK_PLAYERSOLID;
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 33619969
ASGNI4
line 1053
;1053:	}
LABELV $389
line 1054
;1054:	ent->die        = player_die;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 player_die
ASGNP4
line 1055
;1055:	ent->waterlevel = 0;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
CNSTI4 0
ASGNI4
line 1056
;1056:	ent->watertype  = 0;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
CNSTI4 0
ASGNI4
line 1057
;1057:	ent->flags      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 0
ASGNI4
line 1059
;1058:
;1059:	VectorCopy(playerMins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRGP4 playerMins
INDIRB
ASGNB 12
line 1060
;1060:	VectorCopy(playerMaxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRGP4 playerMaxs
INDIRB
ASGNB 12
line 1062
;1061:
;1062:	client->ps.clientNum = index;
ADDRLP4 4
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 104
INDIRI4
ASGNI4
line 1064
;1063:
;1064:	client->ps.stats[STAT_WEAPONS] = (1 << WP_MACHINEGUN);
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 1065
;1065:	if (g_gametype.integer == GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $390
line 1066
;1066:		client->ps.ammo[WP_MACHINEGUN] = 50;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 50
ASGNI4
line 1067
;1067:	} else {
ADDRGP4 $391
JUMPV
LABELV $390
line 1068
;1068:		client->ps.ammo[WP_MACHINEGUN] = 100;
ADDRLP4 4
INDIRP4
CNSTI4 384
ADDP4
CNSTI4 100
ASGNI4
line 1069
;1069:	}
LABELV $391
line 1071
;1070:
;1071:	client->ps.stats[STAT_WEAPONS] |= (1 << WP_GAUNTLET);
ADDRLP4 1364
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 1364
INDIRP4
ADDRLP4 1364
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
line 1072
;1072:	client->ps.ammo[WP_GAUNTLET]       = -1;
ADDRLP4 4
INDIRP4
CNSTI4 380
ADDP4
CNSTI4 -1
ASGNI4
line 1073
;1073:	client->ps.ammo[WP_GRAPPLING_HOOK] = -1;
ADDRLP4 4
INDIRP4
CNSTI4 416
ADDP4
CNSTI4 -1
ASGNI4
line 1076
;1074:
;1075:	// health will count down towards max_health
;1076:	ent->health = client->ps.stats[STAT_HEALTH] = client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 1372
ADDRLP4 4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
ADDRLP4 4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 1372
INDIRI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 1372
INDIRI4
ASGNI4
line 1078
;1077:
;1078:	G_SetOrigin(ent, spawn_origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 76
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 1079
;1079:	VectorCopy(spawn_origin, client->ps.origin);
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 76
INDIRB
ASGNB 12
line 1082
;1080:
;1081:	// the respawned flag will be cleared after the attack and jump keys come up
;1082:	client->ps.pm_flags |= PMF_RESPAWNED;
ADDRLP4 1376
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1376
INDIRP4
ADDRLP4 1376
INDIRP4
INDIRI4
CNSTI4 512
BORI4
ASGNI4
line 1084
;1083:
;1084:	trap_GetUsercmd(client - level.clients, &ent->client->pers.cmd);
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRGP4 level
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 1576
DIVI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ARGP4
ADDRGP4 trap_GetUsercmd
CALLV
pop
line 1085
;1085:	SetClientViewAngle(ent, spawn_angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 92
ARGP4
ADDRGP4 SetClientViewAngle
CALLV
pop
line 1088
;1086:
;1087:	// entity should be unlinked before calling G_KillBox()
;1088:	if (!isSpectator)
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $393
line 1089
;1089:		G_KillBox(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_KillBox
CALLV
pop
LABELV $393
line 1092
;1090:
;1091:	// force the base weapon up
;1092:	client->ps.weapon      = WP_MACHINEGUN;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 2
ASGNI4
line 1093
;1093:	client->ps.weaponstate = WEAPON_READY;
ADDRLP4 4
INDIRP4
CNSTI4 148
ADDP4
CNSTI4 0
ASGNI4
line 1096
;1094:
;1095:	// don't allow full run speed for a bit
;1096:	client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 1380
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 1380
INDIRP4
ADDRLP4 1380
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 1097
;1097:	client->ps.pm_time = 100;
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
CNSTI4 100
ASGNI4
line 1099
;1098:
;1099:	client->timer_start = -1;  // Mark run timer as stopped
ADDRLP4 4
INDIRP4
CNSTI4 1568
ADDP4
CNSTI4 -1
ASGNI4
line 1101
;1100:
;1101:	client->respawnTime     = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1102
;1102:	client->inactivityTime  = level.time + g_inactivity.integer * 1000;
ADDRLP4 4
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 g_inactivity+12
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 1103
;1103:	client->latched_buttons = 0;
ADDRLP4 4
INDIRP4
CNSTI4 672
ADDP4
CNSTI4 0
ASGNI4
line 1106
;1104:
;1105:	// set default animations
;1106:	client->ps.torsoAnim = TORSO_STAND;
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
CNSTI4 11
ASGNI4
line 1107
;1107:	client->ps.legsAnim  = LEGS_IDLE;
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
CNSTI4 22
ASGNI4
line 1109
;1108:
;1109:	if (level.intermissiontime) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $398
line 1110
;1110:		MoveClientToIntermission(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MoveClientToIntermission
CALLV
pop
line 1111
;1111:	} else {
ADDRGP4 $399
JUMPV
LABELV $398
line 1112
;1112:		if (!isSpectator)
ADDRLP4 88
INDIRI4
CNSTI4 0
NEI4 $401
line 1113
;1113:			trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
LABELV $401
line 1115
;1114:		// fire the targets of the spawn point
;1115:		G_UseTargets(spawnPoint, ent);
ADDRLP4 72
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 1119
;1116:
;1117:		// select the highest weapon number available, after any
;1118:		// spawn given items have fired
;1119:		client->ps.weapon = 1;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
CNSTI4 1
ASGNI4
line 1120
;1120:		for (i = WP_NUM_WEAPONS - 1; i > 0; i--) {
ADDRLP4 0
CNSTI4 10
ASGNI4
LABELV $403
line 1121
;1121:			if (client->ps.stats[STAT_WEAPONS] & (1 << i)) {
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $407
line 1122
;1122:				client->ps.weapon = i;
ADDRLP4 4
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1123
;1123:				break;
ADDRGP4 $405
JUMPV
LABELV $407
line 1125
;1124:			}
;1125:		}
LABELV $404
line 1120
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $403
LABELV $405
line 1126
;1126:	}
LABELV $399
line 1130
;1127:
;1128:	// run a client frame to drop exactly to the floor,
;1129:	// initialize animations and other things
;1130:	client->ps.commandTime      = level.time - 100;
ADDRLP4 4
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
SUBI4
ASGNI4
line 1131
;1131:	client->pers.cmd.serverTime = level.time;
ADDRLP4 4
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1132
;1132:	ClientThink(ent - g_entities);
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
ADDRGP4 ClientThink
CALLV
pop
line 1134
;1133:
;1134:	BG_PlayerStateToEntityState(&client->ps, &ent->s, qtrue);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1135
;1135:	VectorCopy(client->ps.origin, ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 1138
;1136:
;1137:	// run the presend to set anything else
;1138:	ClientEndFrame(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientEndFrame
CALLV
pop
line 1141
;1139:
;1140:	// clear entity state values
;1141:	BG_PlayerStateToEntityState(&client->ps, &ent->s, qtrue);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 1142
;1142:}
LABELV $357
endproc ClientSpawn 1384 20
export ClientDisconnect
proc ClientDisconnect 24 8
line 1156
;1143:
;1144:/*
;1145:===========
;1146:ClientDisconnect
;1147:
;1148:Called when a player drops from the server.
;1149:Will not be called between levels.
;1150:
;1151:This should NOT be called directly by any game logic,
;1152:call trap_DropClient(), which will call this and do
;1153:server system housekeeping.
;1154:============
;1155:*/
;1156:void ClientDisconnect(int clientNum) {
line 1163
;1157:	gentity_t* ent;
;1158:	gentity_t* tent;
;1159:	int        i;
;1160:
;1161:	// cleanup if we are kicking a bot that
;1162:	// hasn't spawned yet
;1163:	G_RemoveQueuedBotBegin(clientNum);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_RemoveQueuedBotBegin
CALLV
pop
line 1165
;1164:
;1165:	ent = g_entities + clientNum;
ADDRLP4 4
ADDRFP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1166
;1166:	if (!ent->client || ent->client->pers.connected == CON_DISCONNECTED) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $414
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 0
NEI4 $412
LABELV $414
line 1167
;1167:		return;
ADDRGP4 $411
JUMPV
LABELV $412
line 1171
;1168:	}
;1169:
;1170:	// stop any following clients
;1171:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $418
JUMPV
LABELV $415
line 1172
;1172:		if (level.clients[i].sess.sessionTeam == TEAM_SPECTATOR && level.clients[i].sess.spectatorState == SPECTATOR_FOLLOW &&
ADDRLP4 20
ADDRGP4 level
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRLP4 20
INDIRP4
ADDP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $420
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRLP4 20
INDIRP4
ADDP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $420
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRLP4 20
INDIRP4
ADDP4
CNSTI4 636
ADDP4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $420
line 1173
;1173:		    level.clients[i].sess.spectatorClient == clientNum) {
line 1174
;1174:			StopFollowing(&g_entities[i], qtrue);
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 StopFollowing
CALLV
pop
line 1175
;1175:		}
LABELV $420
line 1176
;1176:	}
LABELV $416
line 1171
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $418
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $415
line 1179
;1177:
;1178:	// send effect if they were completely connected
;1179:	if (ent->client->pers.connected == CON_CONNECTED && ent->client->sess.sessionTeam != TEAM_SPECTATOR) {
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $422
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $422
line 1180
;1180:		tent              = G_TempEntity(ent->client->ps.origin, EV_PLAYER_TELEPORT_OUT);
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTI4 43
ARGI4
ADDRLP4 20
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
line 1181
;1181:		tent->s.clientNum = ent->s.clientNum;
ADDRLP4 8
INDIRP4
CNSTI4 168
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 1185
;1182:
;1183:		// They don't get to take powerups with them!
;1184:		// Especially important for stuff like CTF flags
;1185:		TossClientItems(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 TossClientItems
CALLV
pop
line 1192
;1186:#ifdef MISSIONPACK
;1187:		TossClientPersistantPowerups(ent);
;1188:		if (g_gametype.integer == GT_HARVESTER) {
;1189:			TossClientCubes(ent);
;1190:		}
;1191:#endif
;1192:	}
LABELV $422
line 1194
;1193:
;1194:	G_RevertVote(ent->client);
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_RevertVote
CALLV
pop
line 1196
;1195:
;1196:	G_LogPrintf("ClientDisconnect: %i\n", clientNum);
ADDRGP4 $424
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 G_LogPrintf
CALLV
pop
line 1199
;1197:
;1198:	// if we are playing in tourney mode and losing, give a win to the other player
;1199:	if ((g_gametype.integer == GT_TOURNAMENT) && !level.intermissiontime && !level.warmupTime && level.sortedClients[1] == clientNum) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 1
NEI4 $425
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
NEI4 $425
ADDRGP4 level+16
INDIRI4
CNSTI4 0
NEI4 $425
ADDRGP4 level+88+4
INDIRI4
ADDRFP4 0
INDIRI4
NEI4 $425
line 1200
;1200:		level.clients[level.sortedClients[0]].sess.wins++;
ADDRLP4 20
ADDRGP4 level+88
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
CNSTI4 640
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1201
;1201:		ClientUserinfoChanged(level.sortedClients[0]);
ADDRGP4 level+88
INDIRI4
ARGI4
ADDRGP4 ClientUserinfoChanged
CALLI4
pop
line 1202
;1202:	}
LABELV $425
line 1204
;1203:
;1204:	trap_UnlinkEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 1205
;1205:	ent->s.modelindex                     = 0;
ADDRLP4 4
INDIRP4
CNSTI4 160
ADDP4
CNSTI4 0
ASGNI4
line 1206
;1206:	ent->inuse                            = qfalse;
ADDRLP4 4
INDIRP4
CNSTI4 520
ADDP4
CNSTI4 0
ASGNI4
line 1207
;1207:	ent->classname                        = "disconnected";
ADDRLP4 4
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $434
ASGNP4
line 1208
;1208:	ent->client->pers.connected           = CON_DISCONNECTED;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 468
ADDP4
CNSTI4 0
ASGNI4
line 1209
;1209:	ent->client->ps.persistant[PERS_TEAM] = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 260
ADDP4
CNSTI4 0
ASGNI4
line 1210
;1210:	ent->client->sess.sessionTeam         = TEAM_FREE;
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
CNSTI4 0
ASGNI4
line 1212
;1211:
;1212:	trap_SetConfigstring(CS_PLAYERS + clientNum, "");
ADDRFP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRGP4 $435
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 1214
;1213:
;1214:	G_ClearClientSessionData(ent->client);
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_ClearClientSessionData
CALLV
pop
line 1216
;1215:
;1216:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 1218
;1217:
;1218:	if (ent->r.svFlags & SVF_BOT) {
ADDRLP4 4
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $436
line 1219
;1219:		BotAIShutdownClient(clientNum, qfalse);
ADDRFP4 0
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 BotAIShutdownClient
CALLI4
pop
line 1220
;1220:	}
LABELV $436
line 1221
;1221:}
LABELV $411
endproc ClientDisconnect 24 8
bss
align 1
LABELV ban_reason
skip 256
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
import CalculateRanks
import AddScore
import player_die
import BeginIntermission
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
LABELV $435
byte 1 0
align 1
LABELV $434
byte 1 100
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $424
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 68
byte 1 105
byte 1 115
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $387
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $356
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 66
byte 1 101
byte 1 103
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $355
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $338
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
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
byte 1 34
byte 1 0
align 1
LABELV $335
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $334
byte 1 66
byte 1 111
byte 1 116
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 102
byte 1 97
byte 1 105
byte 1 108
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $326
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $319
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $315
byte 1 112
byte 1 97
byte 1 115
byte 1 115
byte 1 119
byte 1 111
byte 1 114
byte 1 100
byte 1 0
align 1
LABELV $314
byte 1 110
byte 1 111
byte 1 110
byte 1 101
byte 1 0
align 1
LABELV $307
byte 1 89
byte 1 111
byte 1 117
byte 1 32
byte 1 97
byte 1 114
byte 1 101
byte 1 32
byte 1 98
byte 1 97
byte 1 110
byte 1 110
byte 1 101
byte 1 100
byte 1 32
byte 1 102
byte 1 114
byte 1 111
byte 1 109
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
byte 1 0
align 1
LABELV $298
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 115
byte 1 108
byte 1 111
byte 1 116
byte 1 46
byte 1 0
align 1
LABELV $293
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 85
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 67
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $292
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $291
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $290
byte 1 110
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 49
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 99
byte 1 50
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 104
byte 1 99
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 119
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 108
byte 1 92
byte 1 37
byte 1 105
byte 1 92
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 116
byte 1 116
byte 1 92
byte 1 37
byte 1 100
byte 1 92
byte 1 116
byte 1 108
byte 1 92
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $287
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $286
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 49
byte 1 0
align 1
LABELV $285
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
LABELV $284
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
LABELV $283
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $279
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $275
byte 1 104
byte 1 97
byte 1 110
byte 1 100
byte 1 105
byte 1 99
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $274
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 32
byte 1 34
byte 1 37
byte 1 115
byte 1 94
byte 1 55
byte 1 32
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $269
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
LABELV $264
byte 1 85
byte 1 110
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $263
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $260
byte 1 99
byte 1 103
byte 1 95
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $259
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 108
byte 1 104
byte 1 111
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $256
byte 1 105
byte 1 112
byte 1 0
align 1
LABELV $251
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 114
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 0
align 1
LABELV $153
byte 1 98
byte 1 111
byte 1 100
byte 1 121
byte 1 113
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $126
byte 1 67
byte 1 111
byte 1 117
byte 1 108
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
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 112
byte 1 111
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $63
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 95
byte 1 100
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
LABELV $59
byte 1 110
byte 1 111
byte 1 104
byte 1 117
byte 1 109
byte 1 97
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $56
byte 1 48
byte 1 0
align 1
LABELV $55
byte 1 110
byte 1 111
byte 1 98
byte 1 111
byte 1 116
byte 1 115
byte 1 0
