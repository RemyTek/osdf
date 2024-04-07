export SpawnTime
code
proc SpawnTime 32 0
file "../../../../code/game/g_items.c"
line 40
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:/*
;6:
;7:  Items are any object that a player can touch to gain some effect.
;8:
;9:  Pickup will return the number of seconds until they should respawn.
;10:
;11:  all items should pop when dropped in lava or slime
;12:
;13:  Respawnable items don't actually go away when picked up, they are
;14:  just made invisible and untouchable.  This allows them to ride
;15:  movers and respawn apropriately.
;16:*/
;17:
;18:// initial spawn times after warmup
;19:// in vq3 most of the items appears in one frame but we will delay that a bit
;20:// to reduce peak bandwidth and get some nice transition effects
;21:#define SPAWN_WEAPONS    333
;22:#define SPAWN_ARMOR      1200
;23:#define SPAWN_HEALTH     900
;24:#define SPAWN_AMMO       600
;25:#define SPAWN_HOLDABLE   2500
;26:#define SPAWN_MEGAHEALTH 10000
;27:#define SPAWN_POWERUP    45000
;28:
;29:// periodic respawn times
;30:// g_weaponRespawn.integer || g_weaponTeamRespawn.integer
;31:#define RESPAWN_ARMOR      25000
;32:#define RESPAWN_HEALTH     35000
;33:#define RESPAWN_AMMO       40000
;34:#define RESPAWN_HOLDABLE   60000
;35:#define RESPAWN_MEGAHEALTH 35000  // 120000
;36:#define RESPAWN_POWERUP    120000
;37:
;38://======================================================================
;39:
;40:int SpawnTime(gentity_t* ent, qboolean firstSpawn) {
line 41
;41:	if (!ent->item)
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $55
line 42
;42:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $54
JUMPV
LABELV $55
line 44
;43:
;44:	switch (ent->item->giType) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
LTI4 $57
ADDRLP4 0
INDIRI4
CNSTI4 6
GTI4 $57
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $93-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $93
address $60
address $68
address $72
address $76
address $85
address $89
code
LABELV $60
line 46
;45:	case IT_WEAPON:
;46:		if (firstSpawn)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $61
line 47
;47:			return SPAWN_WEAPONS;
CNSTI4 333
RETI4
ADDRGP4 $54
JUMPV
LABELV $61
line 48
;48:		if (g_gametype.integer == GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $63
line 49
;49:			return g_weaponTeamRespawn.value * 1000;
ADDRGP4 g_weaponTeamRespawn+8
INDIRF4
CNSTF4 1148846080
MULF4
CVFI4 4
RETI4
ADDRGP4 $54
JUMPV
LABELV $63
line 51
;50:		else
;51:			return g_weaponRespawn.value * 1000;
ADDRGP4 g_weaponRespawn+8
INDIRF4
CNSTF4 1148846080
MULF4
CVFI4 4
RETI4
ADDRGP4 $54
JUMPV
LABELV $68
line 54
;52:
;53:	case IT_AMMO:
;54:		return firstSpawn ? SPAWN_AMMO : RESPAWN_AMMO;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $70
ADDRLP4 8
CNSTI4 600
ASGNI4
ADDRGP4 $71
JUMPV
LABELV $70
ADDRLP4 8
CNSTI4 40000
ASGNI4
LABELV $71
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $72
line 57
;55:
;56:	case IT_ARMOR:
;57:		return firstSpawn ? SPAWN_ARMOR : RESPAWN_ARMOR;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $74
ADDRLP4 12
CNSTI4 1200
ASGNI4
ADDRGP4 $75
JUMPV
LABELV $74
ADDRLP4 12
CNSTI4 25000
ASGNI4
LABELV $75
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $76
line 60
;58:
;59:	case IT_HEALTH:
;60:		if (ent->item->quantity == 100)  // mega health respawns slow
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 100
NEI4 $77
line 61
;61:			return firstSpawn ? SPAWN_MEGAHEALTH : RESPAWN_MEGAHEALTH;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $80
ADDRLP4 16
CNSTI4 10000
ASGNI4
ADDRGP4 $81
JUMPV
LABELV $80
ADDRLP4 16
CNSTI4 35000
ASGNI4
LABELV $81
ADDRLP4 16
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $77
line 63
;62:		else
;63:			return firstSpawn ? SPAWN_HEALTH : RESPAWN_HEALTH;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $83
ADDRLP4 20
CNSTI4 900
ASGNI4
ADDRGP4 $84
JUMPV
LABELV $83
ADDRLP4 20
CNSTI4 35000
ASGNI4
LABELV $84
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $85
line 66
;64:
;65:	case IT_POWERUP:
;66:		return firstSpawn ? SPAWN_POWERUP : RESPAWN_POWERUP;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $87
ADDRLP4 24
CNSTI4 45000
ASGNI4
ADDRGP4 $88
JUMPV
LABELV $87
ADDRLP4 24
CNSTI4 120000
ASGNI4
LABELV $88
ADDRLP4 24
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $89
line 75
;67:
;68:#ifdef MISSIONPACK
;69:	case IT_PERSISTANT_POWERUP:
;70:		return -1;
;71:		break;
;72:#endif
;73:
;74:	case IT_HOLDABLE:
;75:		return firstSpawn ? SPAWN_HOLDABLE : RESPAWN_HOLDABLE;
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $91
ADDRLP4 28
CNSTI4 2500
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $91
ADDRLP4 28
CNSTI4 60000
ASGNI4
LABELV $92
ADDRLP4 28
INDIRI4
RETI4
ADDRGP4 $54
JUMPV
LABELV $57
line 78
;76:
;77:	default:  // IT_BAD and others
;78:		return 0;
CNSTI4 0
RETI4
LABELV $54
endproc SpawnTime 32 0
export Pickup_Powerup
proc Pickup_Powerup 116 28
line 82
;79:	}
;80:}
;81:
;82:int Pickup_Powerup(gentity_t* ent, gentity_t* other) {
line 87
;83:	int        quantity;
;84:	int        i;
;85:	gclient_t* client;
;86:
;87:	if (!other->client->ps.powerups[ent->item->giTag]) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $96
line 89
;88:		// round timing to seconds to make multiple powerup timers count in sync
;89:		other->client->ps.powerups[ent->item->giTag] = level.time - (level.time % 1000);
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
MODI4
SUBI4
ASGNI4
line 90
;90:	}
LABELV $96
line 92
;91:
;92:	if (ent->count) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $100
line 93
;93:		quantity = ent->count;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 94
;94:	} else {
ADDRGP4 $101
JUMPV
LABELV $100
line 95
;95:		quantity = ent->item->quantity;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 96
;96:	}
LABELV $101
line 98
;97:
;98:	other->client->ps.powerups[ent->item->giTag] += quantity * 1000;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 1000
MULI4
ADDI4
ASGNI4
line 101
;99:
;100:	// give any nearby players a "denied" anti-reward
;101:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $105
JUMPV
LABELV $102
line 107
;102:		vec3_t  delta;
;103:		float   len;
;104:		vec3_t  forward;
;105:		trace_t tr;
;106:
;107:		client = &level.clients[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 108
;108:		if (client == other->client) {
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
NEU4 $107
line 109
;109:			continue;
ADDRGP4 $103
JUMPV
LABELV $107
line 111
;110:		}
;111:		if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $109
line 112
;112:			continue;
ADDRGP4 $103
JUMPV
LABELV $109
line 114
;113:		}
;114:		if (client->ps.stats[STAT_HEALTH] <= 0) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $111
line 115
;115:			continue;
ADDRGP4 $103
JUMPV
LABELV $111
line 120
;116:		}
;117:
;118:		// if same team in team game, no sound
;119:		// cannot use OnSameTeam as it expects to g_entities, not clients
;120:		if (g_gametype.integer >= GT_TEAM && other->client->sess.sessionTeam == client->sess.sessionTeam) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $113
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
NEI4 $113
line 121
;121:			continue;
ADDRGP4 $103
JUMPV
LABELV $113
line 125
;122:		}
;123:
;124:		// if too far away, no sound
;125:		VectorSubtract(ent->s.pos.trBase, client->ps.origin, delta);
ADDRLP4 100
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 100
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 100
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 16+8
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
line 126
;126:		len = VectorNormalize(delta);
ADDRLP4 16
ARGP4
ADDRLP4 108
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 40
ADDRLP4 108
INDIRF4
ASGNF4
line 127
;127:		if (len > 192) {
ADDRLP4 40
INDIRF4
CNSTF4 1128267776
LEF4 $118
line 128
;128:			continue;
ADDRGP4 $103
JUMPV
LABELV $118
line 132
;129:		}
;130:
;131:		// if not facing, no sound
;132:		AngleVectors(client->ps.viewangles, forward, NULL, NULL);
ADDRLP4 0
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRLP4 28
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 133
;133:		if (DotProduct(delta, forward) < 0.4) {
ADDRLP4 16
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
MULF4
ADDF4
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
MULF4
ADDF4
CNSTF4 1053609165
GEF4 $120
line 134
;134:			continue;
ADDRGP4 $103
JUMPV
LABELV $120
line 138
;135:		}
;136:
;137:		// if not line of sight, no sound
;138:		trap_Trace(&tr, client->ps.origin, NULL, NULL, ent->s.pos.trBase, ENTITYNUM_NONE, CONTENTS_SOLID);
ADDRLP4 44
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 139
;139:		if (tr.fraction != 1.0) {
ADDRLP4 44+8
INDIRF4
CNSTF4 1065353216
EQF4 $126
line 140
;140:			continue;
ADDRGP4 $103
JUMPV
LABELV $126
line 144
;141:		}
;142:
;143:		// anti-reward
;144:		client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_DENIEDREWARD;
ADDRLP4 112
ADDRLP4 0
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 112
INDIRP4
ADDRLP4 112
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 145
;145:	}
LABELV $103
line 101
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $105
ADDRLP4 4
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $102
line 147
;146:
;147:	return SpawnTime(ent, qfalse);  // return RESPAWN_POWERUP;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 16
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
RETI4
LABELV $95
endproc Pickup_Powerup 116 28
export Pickup_Holdable
proc Pickup_Holdable 4 8
line 227
;148:}
;149:
;150://======================================================================
;151:
;152:#ifdef MISSIONPACK
;153:int Pickup_PersistantPowerup(gentity_t* ent, gentity_t* other) {
;154:	int   clientNum;
;155:	char  userinfo[MAX_INFO_STRING];
;156:	float handicap;
;157:	int   max;
;158:
;159:	other->client->ps.stats[STAT_PERSISTANT_POWERUP] = ent->item - bg_itemlist;
;160:	other->client->persistantPowerup                 = ent;
;161:
;162:	switch (ent->item->giTag) {
;163:	case PW_GUARD:
;164:		clientNum = other->client->ps.clientNum;
;165:		trap_GetUserinfo(clientNum, userinfo, sizeof(userinfo));
;166:		handicap = atof(Info_ValueForKey(userinfo, "handicap"));
;167:		if (handicap <= 0.0f || handicap > 100.0f) {
;168:			handicap = 100.0f;
;169:		}
;170:		max = (int)(2 * handicap);
;171:
;172:		other->health                            = max;
;173:		other->client->ps.stats[STAT_HEALTH]     = max;
;174:		other->client->ps.stats[STAT_MAX_HEALTH] = max;
;175:		other->client->ps.stats[STAT_ARMOR]      = max;
;176:		other->client->pers.maxHealth            = max;
;177:
;178:		break;
;179:
;180:	case PW_SCOUT:
;181:		clientNum = other->client->ps.clientNum;
;182:		trap_GetUserinfo(clientNum, userinfo, sizeof(userinfo));
;183:		handicap = atof(Info_ValueForKey(userinfo, "handicap"));
;184:		if (handicap <= 0.0f || handicap > 100.0f) {
;185:			handicap = 100.0f;
;186:		}
;187:		other->client->pers.maxHealth       = handicap;
;188:		other->client->ps.stats[STAT_ARMOR] = 0;
;189:		break;
;190:
;191:	case PW_DOUBLER:
;192:		clientNum = other->client->ps.clientNum;
;193:		trap_GetUserinfo(clientNum, userinfo, sizeof(userinfo));
;194:		handicap = atof(Info_ValueForKey(userinfo, "handicap"));
;195:		if (handicap <= 0.0f || handicap > 100.0f) {
;196:			handicap = 100.0f;
;197:		}
;198:		other->client->pers.maxHealth = handicap;
;199:		break;
;200:	case PW_AMMOREGEN:
;201:		clientNum = other->client->ps.clientNum;
;202:		trap_GetUserinfo(clientNum, userinfo, sizeof(userinfo));
;203:		handicap = atof(Info_ValueForKey(userinfo, "handicap"));
;204:		if (handicap <= 0.0f || handicap > 100.0f) {
;205:			handicap = 100.0f;
;206:		}
;207:		other->client->pers.maxHealth = handicap;
;208:		memset(other->client->ammoTimes, 0, sizeof(other->client->ammoTimes));
;209:		break;
;210:	default:
;211:		clientNum = other->client->ps.clientNum;
;212:		trap_GetUserinfo(clientNum, userinfo, sizeof(userinfo));
;213:		handicap = atof(Info_ValueForKey(userinfo, "handicap"));
;214:		if (handicap <= 0.0f || handicap > 100.0f) {
;215:			handicap = 100.0f;
;216:		}
;217:		other->client->pers.maxHealth = handicap;
;218:		break;
;219:	}
;220:
;221:	return SpawnTime(ent, qfalse);  // return -1;
;222:}
;223:
;224://======================================================================
;225:#endif
;226:
;227:int Pickup_Holdable(gentity_t* ent, gentity_t* other) {
line 229
;228:
;229:	other->client->ps.stats[STAT_HOLDABLE_ITEM] = ent->item - bg_itemlist;
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 188
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 237
;230:
;231:#ifdef MISSIONPACK
;232:	if (ent->item->giTag == HI_KAMIKAZE) {
;233:		other->client->ps.eFlags |= EF_KAMIKAZE;
;234:	}
;235:#endif
;236:
;237:	return SpawnTime(ent, qfalse);  // return RESPAWN_HOLDABLE;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 0
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $129
endproc Pickup_Holdable 4 8
proc Add_Ammo 4 0
line 242
;238:}
;239:
;240://======================================================================
;241:
;242:static void Add_Ammo(gentity_t* ent, int weapon, int count) {
line 243
;243:	ent->client->ps.ammo[weapon] += count;
ADDRLP4 0
ADDRFP4 4
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
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
ASGNI4
line 244
;244:	if (ent->client->ps.ammo[weapon] > AMMO_HARD_LIMIT) {
ADDRFP4 4
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
INDIRI4
CNSTI4 200
LEI4 $131
line 245
;245:		ent->client->ps.ammo[weapon] = AMMO_HARD_LIMIT;
ADDRFP4 4
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
CNSTI4 200
ASGNI4
line 246
;246:	}
LABELV $131
line 247
;247:}
LABELV $130
endproc Add_Ammo 4 0
proc Pickup_Ammo 8 12
line 249
;248:
;249:static int Pickup_Ammo(gentity_t* ent, gentity_t* other) {
line 252
;250:	int quantity;
;251:
;252:	if (ent->count) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $134
line 253
;253:		quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 254
;254:	} else {
ADDRGP4 $135
JUMPV
LABELV $134
line 255
;255:		quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 256
;256:	}
LABELV $135
line 258
;257:
;258:	Add_Ammo(other, ent->item->giTag, quantity);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Add_Ammo
CALLV
pop
line 260
;259:
;260:	return SpawnTime(ent, qfalse);  // return RESPAWN_AMMO;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
LABELV $133
endproc Pickup_Ammo 8 12
proc Pickup_Weapon 12 12
line 265
;261:}
;262:
;263://======================================================================
;264:
;265:static int Pickup_Weapon(gentity_t* ent, gentity_t* other) {
line 268
;266:	int quantity;
;267:
;268:	if (ent->count < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
GEI4 $137
line 269
;269:		quantity = 0;  // None for you, sir!
ADDRLP4 0
CNSTI4 0
ASGNI4
line 270
;270:	} else {
ADDRGP4 $138
JUMPV
LABELV $137
line 271
;271:		if (ent->count) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $139
line 272
;272:			quantity = ent->count;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 273
;273:		} else {
ADDRGP4 $140
JUMPV
LABELV $139
line 274
;274:			quantity = ent->item->quantity;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 275
;275:		}
LABELV $140
line 278
;276:
;277:		// dropped items and teamplay weapons always have full ammo
;278:		if (!(ent->flags & FL_DROPPED_ITEM) && g_gametype.integer != GT_TEAM) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $141
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $141
line 281
;279:			// respawning rules
;280:			// drop the quantity if the already have over the minimum
;281:			if (other->client->ps.ammo[ent->item->giTag] < quantity) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $144
line 282
;282:				quantity = quantity - other->client->ps.ammo[ent->item->giTag];
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
SUBI4
ASGNI4
line 283
;283:			} else {
ADDRGP4 $145
JUMPV
LABELV $144
line 284
;284:				quantity = 1;  // only add a single shot
ADDRLP4 0
CNSTI4 1
ASGNI4
line 285
;285:			}
LABELV $145
line 286
;286:		}
LABELV $141
line 287
;287:	}
LABELV $138
line 290
;288:
;289:	// add the weapon
;290:	other->client->ps.stats[STAT_WEAPONS] |= (1 << ent->item->giTag);
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 192
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
LSHI4
BORI4
ASGNI4
line 292
;291:
;292:	Add_Ammo(other, ent->item->giTag, quantity);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Add_Ammo
CALLV
pop
line 294
;293:
;294:	if (ent->item->giTag == WP_GRAPPLING_HOOK)
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 10
NEI4 $146
line 295
;295:		other->client->ps.ammo[ent->item->giTag] = -1;  // unlimited ammo
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 376
ADDP4
ADDP4
CNSTI4 -1
ASGNI4
LABELV $146
line 303
;296:
;297:	// team deathmatch has slow weapon respawns
;298:	// if ( g_gametype.integer == GT_TEAM ) {
;299:	//	return g_weaponTeamRespawn.integer;
;300:	//} else {
;301:	//	return g_weaponRespawn.integer;
;302:	//}
;303:	return SpawnTime(ent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $136
endproc Pickup_Weapon 12 12
proc Pickup_Health 24 8
line 308
;304:}
;305:
;306://======================================================================
;307:
;308:static int Pickup_Health(gentity_t* ent, gentity_t* other) {
line 318
;309:	int max;
;310:	int quantity;
;311:
;312:	// small and mega healths will go over the max
;313:#ifdef MISSIONPACK
;314:	if (other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD) {
;315:		max = other->client->ps.stats[STAT_MAX_HEALTH];
;316:	} else
;317:#endif
;318:		if (ent->item->quantity != 5 && ent->item->quantity != 100) {
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 5
EQI4 $149
ADDRLP4 8
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 100
EQI4 $149
line 319
;319:		max = other->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 320
;320:	} else {
ADDRGP4 $150
JUMPV
LABELV $149
line 321
;321:		max = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 322
;322:	}
LABELV $150
line 324
;323:
;324:	if (ent->count) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $151
line 325
;325:		quantity = ent->count;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 326
;326:	} else {
ADDRGP4 $152
JUMPV
LABELV $151
line 327
;327:		quantity = ent->item->quantity;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 328
;328:	}
LABELV $152
line 330
;329:
;330:	other->health += quantity;
ADDRLP4 12
ADDRFP4 4
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 332
;331:
;332:	if (other->health > max) {
ADDRFP4 4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
LEI4 $153
line 333
;333:		other->health = max;
ADDRFP4 4
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 334
;334:	}
LABELV $153
line 335
;335:	other->client->ps.stats[STAT_HEALTH] = other->health;
ADDRLP4 16
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 342
;336:
;337:	// if ( ent->item->quantity == 100 ) { // mega health respawns slow
;338:	//	return RESPAWN_MEGAHEALTH;
;339:	// } else {
;340:	//	return RESPAWN_HEALTH;
;341:	// }
;342:	return SpawnTime(ent, qfalse);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 20
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
RETI4
LABELV $148
endproc Pickup_Health 24 8
export Pickup_Armor
proc Pickup_Armor 12 8
line 347
;343:}
;344:
;345://======================================================================
;346:
;347:int Pickup_Armor(gentity_t* ent, gentity_t* other) {
line 363
;348:#ifdef MISSIONPACK
;349:	int upperBound;
;350:
;351:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
;352:
;353:	if (other->client && bg_itemlist[other->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD) {
;354:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH];
;355:	} else {
;356:		upperBound = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
;357:	}
;358:
;359:	if (other->client->ps.stats[STAT_ARMOR] > upperBound) {
;360:		other->client->ps.stats[STAT_ARMOR] = upperBound;
;361:	}
;362:#else
;363:	other->client->ps.stats[STAT_ARMOR] += ent->item->quantity;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDI4
ASGNI4
line 364
;364:	if (other->client->ps.stats[STAT_ARMOR] > other->client->ps.stats[STAT_MAX_HEALTH] * 2) {
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $156
line 365
;365:		other->client->ps.stats[STAT_ARMOR] = other->client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 196
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 366
;366:	}
LABELV $156
line 369
;367:#endif
;368:
;369:	return SpawnTime(ent, qfalse);  // return RESPAWN_ARMOR;
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8
ADDRGP4 SpawnTime
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
LABELV $155
endproc Pickup_Armor 12 8
export RespawnItem
proc RespawnItem 20 12
line 379
;370:}
;371:
;372://======================================================================
;373:
;374:/*
;375:===============
;376:RespawnItem
;377:===============
;378:*/
;379:void RespawnItem(gentity_t* ent) {
line 381
;380:
;381:	if (!ent) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $159
line 382
;382:		return;
ADDRGP4 $158
JUMPV
LABELV $159
line 386
;383:	}
;384:
;385:	// randomly select from teamed entities
;386:	if (ent->team) {
ADDRFP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $161
line 391
;387:		gentity_t* master;
;388:		int        count;
;389:		int        choice;
;390:
;391:		if (!ent->teammaster) {
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $163
line 392
;392:			G_Error("RespawnItem: bad teammaster");
ADDRGP4 $165
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 393
;393:		}
LABELV $163
line 395
;394:
;395:		master = ent->teammaster;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 780
ADDP4
INDIRP4
ASGNP4
line 397
;396:
;397:		for (count = 0, ent = master; ent; ent = ent->teamchain, count++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $169
JUMPV
LABELV $166
line 399
;398:			// reset spawn timers on all teamed entities
;399:			ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 400
;400:		}
LABELV $167
line 397
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $169
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $166
line 402
;401:
;402:		choice = rand() % count;
ADDRLP4 12
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ADDRLP4 0
INDIRI4
MODI4
ASGNI4
line 404
;403:
;404:		for (count = 0, ent = master; ent && count < choice; ent = ent->teamchain, count++)
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRFP4 0
ADDRLP4 8
INDIRP4
ASGNP4
ADDRGP4 $173
JUMPV
LABELV $170
line 405
;405:			;
LABELV $171
line 404
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $173
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $174
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $170
LABELV $174
line 406
;406:	}
LABELV $161
line 408
;407:
;408:	if (!ent) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $175
line 409
;409:		return;
ADDRGP4 $158
JUMPV
LABELV $175
line 412
;410:	}
;411:
;412:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 413
;413:	ent->s.eFlags &= ~EF_NODRAW;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -129
BANDI4
ASGNI4
line 414
;414:	ent->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 415
;415:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 417
;416:
;417:	if (ent->item->giType == IT_POWERUP) {
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $177
line 422
;418:		// play powerup spawn sound to all clients
;419:		gentity_t* te;
;420:
;421:		// if the powerup respawn sound should Not be global
;422:		if (ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
EQF4 $179
line 423
;423:			te = G_TempEntity(ent->s.pos.trBase, EV_GENERAL_SOUND);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 45
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 424
;424:		} else {
ADDRGP4 $180
JUMPV
LABELV $179
line 425
;425:			te = G_TempEntity(ent->s.pos.trBase, EV_GLOBAL_SOUND);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 46
ARGI4
ADDRLP4 12
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 426
;426:		}
LABELV $180
line 427
;427:		te->s.eventParm = G_SoundIndex("sound/items/poweruprespawn.wav");
ADDRGP4 $181
ARGP4
ADDRLP4 12
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 428
;428:		te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 16
ADDRLP4 8
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 429
;429:	}
LABELV $177
line 448
;430:
;431:#ifdef MISSIONPACK
;432:	if (ent->item->giType == IT_HOLDABLE && ent->item->giTag == HI_KAMIKAZE) {
;433:		// play powerup spawn sound to all clients
;434:		gentity_t* te;
;435:
;436:		// if the powerup respawn sound should Not be global
;437:		if (ent->speed) {
;438:			te = G_TempEntity(ent->s.pos.trBase, EV_GENERAL_SOUND);
;439:		} else {
;440:			te = G_TempEntity(ent->s.pos.trBase, EV_GLOBAL_SOUND);
;441:		}
;442:		te->s.eventParm = G_SoundIndex("sound/items/kamikazerespawn.wav");
;443:		te->r.svFlags |= SVF_BROADCAST;
;444:	}
;445:#endif
;446:
;447:	// play the normal respawn sound only to nearby clients
;448:	G_AddEvent(ent, EV_ITEM_RESPAWN, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 40
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 450
;449:
;450:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 451
;451:}
LABELV $158
endproc RespawnItem 20 12
export Touch_Item
proc Touch_Item 52 12
line 458
;452:
;453:/*
;454:===============
;455:Touch_Item
;456:===============
;457:*/
;458:void Touch_Item(gentity_t* ent, gentity_t* other, trace_t* trace) {
line 462
;459:	int      respawn;
;460:	qboolean predict;
;461:
;462:	if (!other->client)
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $183
line 463
;463:		return;
ADDRGP4 $182
JUMPV
LABELV $183
line 464
;464:	if (other->health < 1)
ADDRFP4 4
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 1
GEI4 $185
line 465
;465:		return;  // dead people can't pickup
ADDRGP4 $182
JUMPV
LABELV $185
line 468
;466:
;467:	// the same pickup rules are used for client side and server side
;468:	if (!BG_CanItemBeGrabbed(g_gametype.integer, &ent->s, &other->client->ps)) {
ADDRGP4 g_gametype+12
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 BG_CanItemBeGrabbed
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $187
line 469
;469:		return;
ADDRGP4 $182
JUMPV
LABELV $187
line 472
;470:	}
;471:
;472:	G_LogPrintf("Item: %i %s\n", other->s.number, ent->item->classname);
ADDRGP4 $190
ARGP4
ADDRFP4 4
INDIRP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 474
;473:
;474:	predict = other->client->pers.predictItemPickup;
ADDRLP4 4
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 504
ADDP4
INDIRI4
ASGNI4
line 477
;475:
;476:	// call the item-specific pickup function
;477:	switch (ent->item->giType) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 1
LTI4 $182
ADDRLP4 12
INDIRI4
CNSTI4 8
GTI4 $182
ADDRLP4 12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $203-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $203
address $194
address $195
address $196
address $197
address $198
address $202
address $182
address $201
code
LABELV $194
line 479
;478:	case IT_WEAPON:
;479:		respawn = Pickup_Weapon(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 Pickup_Weapon
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 480
;480:		break;
ADDRGP4 $192
JUMPV
LABELV $195
line 482
;481:	case IT_AMMO:
;482:		respawn = Pickup_Ammo(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Pickup_Ammo
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 24
INDIRI4
ASGNI4
line 483
;483:		break;
ADDRGP4 $192
JUMPV
LABELV $196
line 485
;484:	case IT_ARMOR:
;485:		respawn = Pickup_Armor(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Pickup_Armor
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 28
INDIRI4
ASGNI4
line 486
;486:		break;
ADDRGP4 $192
JUMPV
LABELV $197
line 488
;487:	case IT_HEALTH:
;488:		respawn = Pickup_Health(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 Pickup_Health
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 32
INDIRI4
ASGNI4
line 489
;489:		break;
ADDRGP4 $192
JUMPV
LABELV $198
line 491
;490:	case IT_POWERUP:
;491:		respawn = Pickup_Powerup(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 Pickup_Powerup
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 36
INDIRI4
ASGNI4
line 493
;492:		// allow prediction for some powerups
;493:		if (ent->item->giTag >= PW_QUAD && ent->item->giTag <= PW_FLIGHT)
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 1
LTI4 $199
ADDRLP4 40
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRI4
CNSTI4 6
GTI4 $199
line 494
;494:			predict = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
ADDRGP4 $192
JUMPV
LABELV $199
line 496
;495:		else
;496:			predict = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 497
;497:		break;
ADDRGP4 $192
JUMPV
LABELV $201
line 504
;498:#ifdef MISSIONPACK
;499:	case IT_PERSISTANT_POWERUP:
;500:		respawn = Pickup_PersistantPowerup(ent, other);
;501:		break;
;502:#endif
;503:	case IT_TEAM:
;504:		respawn = Pickup_Team(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 Pickup_Team
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 44
INDIRI4
ASGNI4
line 505
;505:		break;
ADDRGP4 $192
JUMPV
LABELV $202
line 507
;506:	case IT_HOLDABLE:
;507:		respawn = Pickup_Holdable(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 Pickup_Holdable
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 48
INDIRI4
ASGNI4
line 508
;508:		break;
line 510
;509:	default:
;510:		return;
LABELV $192
line 513
;511:	}
;512:
;513:	if (!respawn) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $205
line 514
;514:		return;
ADDRGP4 $182
JUMPV
LABELV $205
line 518
;515:	}
;516:
;517:	// play the normal pickup sound
;518:	if (predict) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $207
line 519
;519:		G_AddPredictableEvent(other, EV_ITEM_PICKUP, ent->s.modelindex);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddPredictableEvent
CALLV
pop
line 520
;520:	} else {
ADDRGP4 $208
JUMPV
LABELV $207
line 521
;521:		G_AddEvent(other, EV_ITEM_PICKUP, ent->s.modelindex);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 19
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 522
;522:	}
LABELV $208
line 525
;523:
;524:	// powerup pickups are global broadcasts
;525:	if (ent->item->giType == IT_POWERUP || ent->item->giType == IT_TEAM) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
EQI4 $211
ADDRLP4 20
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $209
LABELV $211
line 527
;526:		// if we want the global sound to play
;527:		if (!ent->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $212
line 530
;528:			gentity_t* te;
;529:
;530:			te              = G_TempEntity(ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 531
;531:			te->s.eventParm = ent->s.modelindex;
ADDRLP4 24
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 532
;532:			te->r.svFlags |= SVF_BROADCAST;
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 533
;533:		} else {
ADDRGP4 $213
JUMPV
LABELV $212
line 536
;534:			gentity_t* te;
;535:
;536:			te              = G_TempEntity(ent->s.pos.trBase, EV_GLOBAL_ITEM_PICKUP);
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
CNSTI4 20
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 24
ADDRLP4 28
INDIRP4
ASGNP4
line 537
;537:			te->s.eventParm = ent->s.modelindex;
ADDRLP4 24
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 160
ADDP4
INDIRI4
ASGNI4
line 539
;538:			// only send this temp entity to a single client
;539:			te->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 32
ADDRLP4 24
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 540
;540:			te->r.singleClient = other->s.number;
ADDRLP4 24
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 541
;541:		}
LABELV $213
line 542
;542:	}
LABELV $209
line 545
;543:
;544:	// fire item targets
;545:	G_UseTargets(ent, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 548
;546:
;547:	// wait of -1 will not respawn
;548:	if (ent->wait == -1) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 3212836864
NEF4 $214
line 549
;549:		ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 550
;550:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 551
;551:		ent->r.contents       = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 552
;552:		ent->unlinkAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 560
ADDP4
CNSTI4 1
ASGNI4
line 553
;553:		return;
ADDRGP4 $182
JUMPV
LABELV $214
line 557
;554:	}
;555:
;556:	// non zero wait overrides respawn time
;557:	if (ent->wait) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
EQF4 $216
line 558
;558:		respawn = ent->wait;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 559
;559:		respawn *= 1000;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1000
MULI4
ASGNI4
line 560
;560:	}
LABELV $216
line 563
;561:
;562:	// random can be used to vary the respawn time
;563:	if (ent->random) {
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
CNSTF4 0
EQF4 $218
line 564
;564:		respawn += (crandom() * ent->random) * 1000;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
CVIF4 4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1073741824
MULF4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
MULF4
CNSTF4 1148846080
MULF4
ADDF4
CVFI4 4
ASGNI4
line 565
;565:		if (respawn < 1000) {
ADDRLP4 0
INDIRI4
CNSTI4 1000
GEI4 $220
line 566
;566:			respawn = 1000;
ADDRLP4 0
CNSTI4 1000
ASGNI4
line 567
;567:		}
LABELV $220
line 568
;568:	}
LABELV $218
line 571
;569:
;570:	// dropped items will not respawn
;571:	if (ent->flags & FL_DROPPED_ITEM) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $222
line 572
;572:		ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 573
;573:	}
LABELV $222
line 578
;574:
;575:	// picked up items still stay around, they just don't
;576:	// draw anything.  This allows respawnable items
;577:	// to be placed on movers.
;578:	ent->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 579
;579:	ent->s.eFlags |= EF_NODRAW;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 580
;580:	ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 586
;581:
;582:	// ZOID
;583:	// A negative respawn times means to never respawn this item (but don't
;584:	// delete it).  This is used by items that are respawned by third party
;585:	// events such as ctf flags
;586:	if (respawn <= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GTI4 $224
line 587
;587:		ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 588
;588:		ent->think     = 0;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTP4 0
ASGNP4
line 589
;589:	} else {
ADDRGP4 $225
JUMPV
LABELV $224
line 590
;590:		ent->nextthink = level.time + respawn;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 591
;591:		ent->think     = RespawnItem;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 RespawnItem
ASGNP4
line 592
;592:	}
LABELV $225
line 594
;593:
;594:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 595
;595:}
LABELV $182
endproc Touch_Item 52 12
export LaunchItem
proc LaunchItem 12 8
line 606
;596:
;597://======================================================================
;598:
;599:/*
;600:================
;601:LaunchItem
;602:
;603:Spawns an item and tosses it forward
;604:================
;605:*/
;606:gentity_t* LaunchItem(gitem_t* item, vec3_t origin, vec3_t velocity) {
line 609
;607:	gentity_t* dropped;
;608:
;609:	dropped = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 611
;610:
;611:	dropped->s.eType       = ET_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 612
;612:	dropped->s.modelindex  = item - bg_itemlist;  // store item number in modelindex
ADDRLP4 0
INDIRP4
CNSTI4 160
ADDP4
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 613
;613:	dropped->s.modelindex2 = 1;                   // This is non-zero is it's a dropped item
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 1
ASGNI4
line 616
;614:
;615:	// item scale-down
;616:	dropped->s.time = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 618
;617:
;618:	dropped->classname = item->classname;
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 619
;619:	dropped->item      = item;
ADDRLP4 0
INDIRP4
CNSTI4 804
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 620
;620:	VectorSet(dropped->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3245342720
ASGNF4
line 621
;621:	VectorSet(dropped->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS);
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1097859072
ASGNF4
line 622
;622:	dropped->r.contents = CONTENTS_TRIGGER;
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 624
;623:
;624:	dropped->touch = Touch_Item;
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 626
;625:
;626:	G_SetOrigin(dropped, origin);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 627
;627:	dropped->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 628
;628:	dropped->s.pos.trTime = level.time;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 629
;629:	VectorCopy(velocity, dropped->s.pos.trDelta);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRB
ASGNB 12
line 631
;630:
;631:	dropped->s.eFlags |= EF_BOUNCE_HALF;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 32
BORI4
ASGNI4
line 635
;632:#ifdef MISSIONPACK
;633:	if ((g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF) && item->giType == IT_TEAM) {  // Special case for CTF flags
;634:#else
;635:	if (g_gametype.integer == GT_CTF && item->giType == IT_TEAM) {  // Special case for CTF flags
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $230
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $230
line 637
;636:#endif
;637:		dropped->think     = Team_DroppedFlagThink;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Team_DroppedFlagThink
ASGNP4
line 638
;638:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 639
;639:		Team_CheckDroppedItem(dropped);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 Team_CheckDroppedItem
CALLV
pop
line 640
;640:	} else {  // auto-remove after 30 seconds
ADDRGP4 $231
JUMPV
LABELV $230
line 641
;641:		dropped->think     = G_FreeEntity;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 642
;642:		dropped->nextthink = level.time + 30000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 30000
ADDI4
ASGNI4
line 643
;643:	}
LABELV $231
line 645
;644:
;645:	dropped->flags = FL_DROPPED_ITEM;
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
CNSTI4 4096
ASGNI4
line 647
;646:
;647:	trap_LinkEntity(dropped);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 649
;648:
;649:	return dropped;
ADDRLP4 0
INDIRP4
RETP4
LABELV $227
endproc LaunchItem 12 8
export Drop_Item
proc Drop_Item 32 16
line 659
;650:}
;651:
;652:/*
;653:================
;654:Drop_Item
;655:
;656:Spawns an item and tosses it forward
;657:================
;658:*/
;659:gentity_t* Drop_Item(gentity_t* ent, gitem_t* item, float angle) {
line 663
;660:	vec3_t velocity;
;661:	vec3_t angles;
;662:
;663:	VectorCopy(ent->s.apos.trBase, angles);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 60
ADDP4
INDIRB
ASGNB 12
line 664
;664:	angles[YAW] += angle;
ADDRLP4 12+4
ADDRLP4 12+4
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ASGNF4
line 665
;665:	angles[PITCH] = 0;  // always forward
ADDRLP4 12
CNSTF4 0
ASGNF4
line 667
;666:
;667:	AngleVectors(angles, velocity, NULL, NULL);
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 668
;668:	VectorScale(velocity, 150, velocity);
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1125515264
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1125515264
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1125515264
MULF4
ASGNF4
line 669
;669:	velocity[2] += 200 + crandom() * 50;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1120403456
MULF4
CNSTF4 1128792064
ADDF4
ADDF4
ASGNF4
line 671
;670:
;671:	return LaunchItem(item, ent->s.pos.trBase, velocity);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 28
ADDRGP4 LaunchItem
CALLP4
ASGNP4
ADDRLP4 28
INDIRP4
RETP4
LABELV $235
endproc Drop_Item 32 16
export Use_Item
proc Use_Item 0 4
line 681
;672:}
;673:
;674:/*
;675:================
;676:Use_Item
;677:
;678:Respawn the item
;679:================
;680:*/
;681:void Use_Item(gentity_t* ent, gentity_t* other, gentity_t* activator) {
line 682
;682:	RespawnItem(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 RespawnItem
CALLV
pop
line 683
;683:}
LABELV $242
endproc Use_Item 0 4
export FinishSpawningItem
proc FinishSpawningItem 84 28
line 695
;684:
;685://======================================================================
;686:
;687:/*
;688:================
;689:FinishSpawningItem
;690:
;691:Traces down to find where an item should rest, instead of letting them
;692:free fall from their spawn points
;693:================
;694:*/
;695:void FinishSpawningItem(gentity_t* ent) {
line 699
;696:	trace_t tr;
;697:	vec3_t  dest;
;698:
;699:	VectorSet(ent->r.mins, -ITEM_RADIUS, -ITEM_RADIUS, -ITEM_RADIUS);
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 440
ADDP4
CNSTF4 3245342720
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 444
ADDP4
CNSTF4 3245342720
ASGNF4
line 700
;700:	VectorSet(ent->r.maxs, ITEM_RADIUS, ITEM_RADIUS, ITEM_RADIUS);
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 452
ADDP4
CNSTF4 1097859072
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 1097859072
ASGNF4
line 702
;701:
;702:	ent->s.eType       = ET_ITEM;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 703
;703:	ent->s.modelindex  = ent->item - bg_itemlist;  // store item number in modelindex
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 160
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
ASGNI4
line 704
;704:	ent->s.modelindex2 = 0;                        // zero indicates this isn't a dropped item
ADDRFP4 0
INDIRP4
CNSTI4 164
ADDP4
CNSTI4 0
ASGNI4
line 706
;705:
;706:	ent->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 707
;707:	ent->touch      = Touch_Item;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Item
ASGNP4
line 709
;708:	// using an item causes it to respawn
;709:	ent->use = Use_Item;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Item
ASGNP4
line 712
;710:
;711:	// for pickup prediction
;712:	if (ent->count) {
ADDRFP4 0
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 0
EQI4 $244
line 713
;713:		ent->s.time2 = ent->count;
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 714
;714:	} else if (ent->item) {
ADDRGP4 $245
JUMPV
LABELV $244
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $246
line 715
;715:		ent->s.time2 = ent->item->quantity;
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 716
;716:	}
LABELV $246
LABELV $245
line 718
;717:
;718:	if (ent->spawnflags & 1) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $248
line 720
;719:		// suspended
;720:		G_SetOrigin(ent, ent->s.origin);
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 721
;721:	} else {
ADDRGP4 $249
JUMPV
LABELV $248
line 723
;722:		// drop to floor
;723:		VectorSet(dest, ent->s.origin[0], ent->s.origin[1], ent->s.origin[2] - 4096);
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 72
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56+4
ADDRLP4 72
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ASGNF4
ADDRLP4 56+8
ADDRFP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
CNSTF4 1166016512
SUBF4
ASGNF4
line 724
;724:		trap_Trace(&tr, ent->s.origin, ent->r.mins, ent->r.maxs, dest, ent->s.number, MASK_SOLID);
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 76
INDIRP4
INDIRI4
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 725
;725:		if (tr.startsolid) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $252
line 726
;726:			G_Printf("FinishSpawningItem: %s startsolid at %s\n", ent->classname, vtos(ent->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 80
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $255
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 80
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 727
;727:			G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 728
;728:			return;
ADDRGP4 $243
JUMPV
LABELV $252
line 732
;729:		}
;730:
;731:		// allow to ride movers
;732:		ent->s.groundEntityNum = tr.entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRLP4 0+52
INDIRI4
ASGNI4
line 734
;733:
;734:		G_SetOrigin(ent, tr.endpos);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0+12
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 735
;735:	}
LABELV $249
line 738
;736:
;737:	// team slaves and targeted items aren't present at start
;738:	if ((ent->flags & FL_TEAMSLAVE) || ent->targetname) {
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
NEI4 $260
ADDRLP4 72
INDIRP4
CNSTI4 652
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $258
LABELV $260
line 739
;739:		ent->s.eFlags |= EF_NODRAW;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 128
BORI4
ASGNI4
line 740
;740:		ent->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 741
;741:		return;
ADDRGP4 $243
JUMPV
LABELV $258
line 744
;742:	}
;743:
;744:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 745
;745:}
LABELV $243
endproc FinishSpawningItem 84 28
export G_CheckTeamItems
proc G_CheckTeamItems 20 4
line 754
;746:
;747:qboolean itemRegistered[MAX_ITEMS];
;748:
;749:/*
;750:==================
;751:G_CheckTeamItems
;752:==================
;753:*/
;754:void G_CheckTeamItems(void) {
line 757
;755:
;756:	// Set up team stuff
;757:	Team_InitGame();
ADDRGP4 Team_InitGame
CALLV
pop
line 759
;758:
;759:	if (g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $262
line 763
;760:		gitem_t* item;
;761:
;762:		// check for the two flags
;763:		item = BG_FindItem("Red Flag");
ADDRGP4 $265
ARGP4
ADDRLP4 4
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 764
;764:		if (!item || !itemRegistered[item - bg_itemlist]) {
ADDRLP4 8
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 8
INDIRU4
CNSTU4 0
EQU4 $268
ADDRLP4 8
INDIRU4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
NEI4 $266
LABELV $268
line 765
;765:			G_Printf(S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map\n");
ADDRGP4 $269
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 766
;766:		}
LABELV $266
line 767
;767:		item = BG_FindItem("Blue Flag");
ADDRGP4 $270
ARGP4
ADDRLP4 12
ADDRGP4 BG_FindItem
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 12
INDIRP4
ASGNP4
line 768
;768:		if (!item || !itemRegistered[item - bg_itemlist]) {
ADDRLP4 16
ADDRLP4 0
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
CNSTU4 0
EQU4 $273
ADDRLP4 16
INDIRU4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
NEI4 $271
LABELV $273
line 769
;769:			G_Printf(S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map\n");
ADDRGP4 $274
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 770
;770:		}
LABELV $271
line 771
;771:	}
LABELV $262
line 831
;772:#ifdef MISSIONPACK
;773:	if (g_gametype.integer == GT_1FCTF) {
;774:		gitem_t* item;
;775:
;776:		// check for all three flags
;777:		item = BG_FindItem("Red Flag");
;778:		if (!item || !itemRegistered[item - bg_itemlist]) {
;779:			G_Printf(S_COLOR_YELLOW "WARNING: No team_CTF_redflag in map\n");
;780:		}
;781:		item = BG_FindItem("Blue Flag");
;782:		if (!item || !itemRegistered[item - bg_itemlist]) {
;783:			G_Printf(S_COLOR_YELLOW "WARNING: No team_CTF_blueflag in map\n");
;784:		}
;785:		item = BG_FindItem("Neutral Flag");
;786:		if (!item || !itemRegistered[item - bg_itemlist]) {
;787:			G_Printf(S_COLOR_YELLOW "WARNING: No team_CTF_neutralflag in map\n");
;788:		}
;789:	}
;790:
;791:	if (g_gametype.integer == GT_OBELISK) {
;792:		gentity_t* ent;
;793:
;794:		// check for the two obelisks
;795:		ent = NULL;
;796:		ent = G_Find(ent, FOFS(classname), "team_redobelisk");
;797:		if (!ent) {
;798:			G_Printf(S_COLOR_YELLOW "WARNING: No team_redobelisk in map\n");
;799:		}
;800:
;801:		ent = NULL;
;802:		ent = G_Find(ent, FOFS(classname), "team_blueobelisk");
;803:		if (!ent) {
;804:			G_Printf(S_COLOR_YELLOW "WARNING: No team_blueobelisk in map\n");
;805:		}
;806:	}
;807:
;808:	if (g_gametype.integer == GT_HARVESTER) {
;809:		gentity_t* ent;
;810:
;811:		// check for all three obelisks
;812:		ent = NULL;
;813:		ent = G_Find(ent, FOFS(classname), "team_redobelisk");
;814:		if (!ent) {
;815:			G_Printf(S_COLOR_YELLOW "WARNING: No team_redobelisk in map\n");
;816:		}
;817:
;818:		ent = NULL;
;819:		ent = G_Find(ent, FOFS(classname), "team_blueobelisk");
;820:		if (!ent) {
;821:			G_Printf(S_COLOR_YELLOW "WARNING: No team_blueobelisk in map\n");
;822:		}
;823:
;824:		ent = NULL;
;825:		ent = G_Find(ent, FOFS(classname), "team_neutralobelisk");
;826:		if (!ent) {
;827:			G_Printf(S_COLOR_YELLOW "WARNING: No team_neutralobelisk in map\n");
;828:		}
;829:	}
;830:#endif
;831:}
LABELV $261
endproc G_CheckTeamItems 20 4
export ClearRegisteredItems
proc ClearRegisteredItems 8 12
line 838
;832:
;833:/*
;834:==============
;835:ClearRegisteredItems
;836:==============
;837:*/
;838:void ClearRegisteredItems(void) {
line 839
;839:	memset(itemRegistered, 0, sizeof(itemRegistered));
ADDRGP4 itemRegistered
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1024
ARGI4
ADDRGP4 memset
CALLP4
pop
line 842
;840:
;841:	// players always start with the base weapon
;842:	RegisterItem(BG_FindItemForWeapon(WP_MACHINEGUN));
CNSTI4 2
ARGI4
ADDRLP4 0
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 843
;843:	RegisterItem(BG_FindItemForWeapon(WP_GAUNTLET));
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 850
;844:#ifdef MISSIONPACK
;845:	if (g_gametype.integer == GT_HARVESTER) {
;846:		RegisterItem(BG_FindItem("Red Cube"));
;847:		RegisterItem(BG_FindItem("Blue Cube"));
;848:	}
;849:#endif
;850:}
LABELV $275
endproc ClearRegisteredItems 8 12
export RegisterItem
proc RegisterItem 0 4
line 859
;851:
;852:/*
;853:===============
;854:RegisterItem
;855:
;856:The item will be added to the precache list
;857:===============
;858:*/
;859:void RegisterItem(gitem_t* item) {
line 860
;860:	if (!item) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $277
line 861
;861:		G_Error("RegisterItem: NULL");
ADDRGP4 $279
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 862
;862:	}
LABELV $277
line 863
;863:	itemRegistered[item - bg_itemlist] = qtrue;
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
CNSTI4 1
ASGNI4
line 864
;864:}
LABELV $276
endproc RegisterItem 0 4
export SaveRegisteredItems
proc SaveRegisteredItems 268 8
line 874
;865:
;866:/*
;867:===============
;868:SaveRegisteredItems
;869:
;870:Write the needed items to a config string
;871:so the client will know which ones to precache
;872:===============
;873:*/
;874:void SaveRegisteredItems(void) {
line 879
;875:	char string[MAX_ITEMS + 1];
;876:	int  i;
;877:	int  count;
;878:
;879:	count = 0;
ADDRLP4 264
CNSTI4 0
ASGNI4
line 880
;880:	for (i = 0; i < bg_numItems; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $284
JUMPV
LABELV $281
line 881
;881:		if (itemRegistered[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 itemRegistered
ADDP4
INDIRI4
CNSTI4 0
EQI4 $285
line 882
;882:			count++;
ADDRLP4 264
ADDRLP4 264
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 883
;883:			string[i] = '1';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 49
ASGNI1
line 884
;884:		} else {
ADDRGP4 $286
JUMPV
LABELV $285
line 885
;885:			string[i] = '0';
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 48
ASGNI1
line 886
;886:		}
LABELV $286
line 887
;887:	}
LABELV $282
line 880
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $284
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $281
line 888
;888:	string[bg_numItems] = 0;
ADDRGP4 bg_numItems
INDIRI4
ADDRLP4 4
ADDP4
CNSTI1 0
ASGNI1
line 890
;889:
;890:	G_Printf("%i items registered\n", count);
ADDRGP4 $287
ARGP4
ADDRLP4 264
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 891
;891:	trap_SetConfigstring(CS_ITEMS, string);
CNSTI4 27
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 892
;892:}
LABELV $280
endproc SaveRegisteredItems 268 8
export G_ItemDisabled
proc G_ItemDisabled 132 16
line 899
;893:
;894:/*
;895:============
;896:G_ItemDisabled
;897:============
;898:*/
;899:int G_ItemDisabled(gitem_t* item) {
line 903
;900:
;901:	char name[128];
;902:
;903:	Com_sprintf(name, sizeof(name), "disable_%s", item->classname);
ADDRLP4 0
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $289
ARGP4
ADDRFP4 0
INDIRP4
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 904
;904:	return trap_Cvar_VariableIntegerValue(name);
ADDRLP4 0
ARGP4
ADDRLP4 128
ADDRGP4 trap_Cvar_VariableIntegerValue
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
RETI4
LABELV $288
endproc G_ItemDisabled 132 16
export G_SpawnItem
proc G_SpawnItem 4 12
line 917
;905:}
;906:
;907:/*
;908:============
;909:G_SpawnItem
;910:
;911:Sets the clipping size and plants the object on the floor.
;912:
;913:Items can't be immediately dropped to floor, because they might
;914:be on an entity that hasn't spawned yet.
;915:============
;916:*/
;917:void G_SpawnItem(gentity_t* ent, gitem_t* item) {
line 919
;918:
;919:	G_SpawnFloat("random", "0", &ent->random);
ADDRGP4 $291
ARGP4
ADDRGP4 $292
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 920
;920:	G_SpawnFloat("wait", "0", &ent->wait);
ADDRGP4 $293
ARGP4
ADDRGP4 $292
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 922
;921:
;922:	RegisterItem(item);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 RegisterItem
CALLV
pop
line 924
;923:
;924:	if (G_ItemDisabled(item)) {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ADDRGP4 G_ItemDisabled
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $294
line 925
;925:		ent->tag = TAG_DONTSPAWN;
ADDRFP4 0
INDIRP4
CNSTI4 812
ADDP4
CNSTI4 1
ASGNI4
line 926
;926:		return;
ADDRGP4 $290
JUMPV
LABELV $294
line 929
;927:	}
;928:
;929:	ent->item = item;
ADDRFP4 0
INDIRP4
CNSTI4 804
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 932
;930:	// some movers spawn on the second frame, so delay item
;931:	// spawns until the third frame so they can ride trains
;932:	ent->nextthink = level.time + FRAMETIME * 2;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 933
;933:	ent->think     = FinishSpawningItem;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 FinishSpawningItem
ASGNP4
line 935
;934:
;935:	ent->physicsBounce = 0.50;  // items are bouncy
ADDRFP4 0
INDIRP4
CNSTI4 568
ADDP4
CNSTF4 1056964608
ASGNF4
line 937
;936:
;937:	if (item->giType == IT_POWERUP) {
ADDRFP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 5
NEI4 $297
line 938
;938:		G_SoundIndex("sound/items/poweruprespawn.wav");
ADDRGP4 $181
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 939
;939:		G_SpawnFloat("noglobalsound", "0", &ent->speed);
ADDRGP4 $299
ARGP4
ADDRGP4 $292
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 940
;940:	}
LABELV $297
line 947
;941:
;942:#ifdef MISSIONPACK
;943:	if (item->giType == IT_PERSISTANT_POWERUP) {
;944:		ent->s.generic1 = ent->spawnflags;
;945:	}
;946:#endif
;947:}
LABELV $290
endproc G_SpawnItem 4 12
export G_BounceItem
proc G_BounceItem 52 12
line 955
;948:
;949:/*
;950:================
;951:G_BounceItem
;952:
;953:================
;954:*/
;955:void G_BounceItem(gentity_t* ent, trace_t* trace) {
line 961
;956:	vec3_t velocity;
;957:	float  dot;
;958:	int    hitTime;
;959:
;960:	// reflect the velocity on the trace plane
;961:	hitTime = level.previousTime + (level.time - level.previousTime) * trace->fraction;
ADDRLP4 16
ADDRGP4 level+36
INDIRI4
CVIF4 4
ADDRGP4 level+32
INDIRI4
ADDRGP4 level+36
INDIRI4
SUBI4
CVIF4 4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
CVFI4 4
ASGNI4
line 962
;962:	BG_EvaluateTrajectoryDelta(&ent->s.pos, hitTime, velocity);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 963
;963:	dot = DotProduct(velocity, trace->plane.normal);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 964
;964:	VectorMA(velocity, -2 * dot, trace->plane.normal, ent->s.pos.trDelta);
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0+4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0+8
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
line 967
;965:
;966:	// cut the velocity to keep from bouncing forever
;967:	VectorScale(ent->s.pos.trDelta, ent->physicsBounce, ent->s.pos.trDelta);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 568
ADDP4
INDIRF4
MULF4
ASGNF4
line 970
;968:
;969:	// check for stop
;970:	if (trace->plane.normal[2] > 0 && ent->s.pos.trDelta[2] < 40) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 0
LEF4 $308
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CNSTF4 1109393408
GEF4 $308
line 971
;971:		trace->endpos[2] += 1.0;  // make sure it is off ground
ADDRLP4 36
ADDRFP4 4
INDIRP4
CNSTI4 20
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRF4
CNSTF4 1065353216
ADDF4
ASGNF4
line 972
;972:		SnapVector(trace->endpos);
ADDRLP4 40
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 44
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 48
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 973
;973:		G_SetOrigin(ent, trace->endpos);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 974
;974:		ent->s.groundEntityNum = trace->entityNum;
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
ASGNI4
line 975
;975:		return;
ADDRGP4 $300
JUMPV
LABELV $308
line 978
;976:	}
;977:
;978:	VectorAdd(ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
line 979
;979:	VectorCopy(ent->r.currentOrigin, ent->s.pos.trBase);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 48
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 980
;980:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 981
;981:}
LABELV $300
endproc G_BounceItem 52 12
export G_RunItem
proc G_RunItem 88 28
line 989
;982:
;983:/*
;984:================
;985:G_RunItem
;986:
;987:================
;988:*/
;989:void G_RunItem(gentity_t* ent) {
line 996
;990:	vec3_t  origin;
;991:	trace_t tr;
;992:	int     contents;
;993:	int     mask;
;994:
;995:	// if its groundentity has been set to ENTITYNUM_NONE, it may have been pushed off an edge
;996:	if (ent->s.groundEntityNum == ENTITYNUM_NONE) {
ADDRFP4 0
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 1023
NEI4 $312
line 997
;997:		if (ent->s.pos.trType != TR_GRAVITY) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 5
EQI4 $314
line 998
;998:			ent->s.pos.trType = TR_GRAVITY;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 999
;999:			ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1000
;1000:		}
LABELV $314
line 1001
;1001:	}
LABELV $312
line 1003
;1002:
;1003:	if (ent->s.pos.trType == TR_STATIONARY) {
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
CNSTI4 0
NEI4 $317
line 1005
;1004:		// check think function
;1005:		G_RunThink(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1006
;1006:		return;
ADDRGP4 $311
JUMPV
LABELV $317
line 1010
;1007:	}
;1008:
;1009:	// get current position
;1010:	BG_EvaluateTrajectory(&ent->s.pos, level.time, origin);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 56
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 1013
;1011:
;1012:	// trace a line from the previous position to the current position
;1013:	if (ent->clipmask) {
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
CNSTI4 0
EQI4 $320
line 1014
;1014:		mask = ent->clipmask;
ADDRLP4 72
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ASGNI4
line 1015
;1015:	} else {
ADDRGP4 $321
JUMPV
LABELV $320
line 1016
;1016:		mask = MASK_PLAYERSOLID & ~CONTENTS_BODY;  // MASK_SOLID;
ADDRLP4 72
CNSTI4 65537
ASGNI4
line 1017
;1017:	}
LABELV $321
line 1018
;1018:	trap_Trace(&tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, ent->r.ownerNum, mask);
ADDRLP4 0
ARGP4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 76
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ARGI4
ADDRLP4 72
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1020
;1019:
;1020:	VectorCopy(tr.endpos, ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 1022
;1021:
;1022:	if (tr.startsolid) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
EQI4 $323
line 1023
;1023:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1024
;1024:	}
LABELV $323
line 1026
;1025:
;1026:	trap_LinkEntity(ent);  // FIXME: avoid this for stationary?
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 1029
;1027:
;1028:	// check think function
;1029:	G_RunThink(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 1031
;1030:
;1031:	if (tr.fraction == 1) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
NEF4 $327
line 1032
;1032:		return;
ADDRGP4 $311
JUMPV
LABELV $327
line 1036
;1033:	}
;1034:
;1035:	// if it is in a nodrop volume, remove it
;1036:	contents = trap_PointContents(ent->r.currentOrigin, -1);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 80
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 80
INDIRI4
ASGNI4
line 1037
;1037:	if (contents & CONTENTS_NODROP) {
ADDRLP4 68
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
EQU4 $330
line 1038
;1038:		if (ent->item && ent->item->giType == IT_TEAM) {
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $332
ADDRLP4 84
INDIRP4
CNSTI4 804
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
CNSTI4 8
NEI4 $332
line 1039
;1039:			Team_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Team_FreeEntity
CALLV
pop
line 1040
;1040:		} else {
ADDRGP4 $311
JUMPV
LABELV $332
line 1041
;1041:			G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 1042
;1042:		}
line 1043
;1043:		return;
ADDRGP4 $311
JUMPV
LABELV $330
line 1046
;1044:	}
;1045:
;1046:	G_BounceItem(ent, &tr);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_BounceItem
CALLV
pop
line 1047
;1047:}
LABELV $311
endproc G_RunItem 88 28
bss
export itemRegistered
align 4
LABELV itemRegistered
skip 1024
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
import ArmorIndex
import Think_Weapon
import SetRespawn
import PrecacheItem
import UseHoldableItem
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
LABELV $299
byte 1 110
byte 1 111
byte 1 103
byte 1 108
byte 1 111
byte 1 98
byte 1 97
byte 1 108
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $293
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $292
byte 1 48
byte 1 0
align 1
LABELV $291
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $289
byte 1 100
byte 1 105
byte 1 115
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 95
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $287
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 32
byte 1 114
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $279
byte 1 82
byte 1 101
byte 1 103
byte 1 105
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 0
align 1
LABELV $274
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $270
byte 1 66
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $269
byte 1 94
byte 1 51
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 78
byte 1 111
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 67
byte 1 84
byte 1 70
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 10
byte 1 0
align 1
LABELV $265
byte 1 82
byte 1 101
byte 1 100
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $255
byte 1 70
byte 1 105
byte 1 110
byte 1 105
byte 1 115
byte 1 104
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 111
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $190
byte 1 73
byte 1 116
byte 1 101
byte 1 109
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
LABELV $181
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $165
byte 1 82
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
