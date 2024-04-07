export ScorePlum
code
proc ScorePlum 12 8
file "../../../../code/game/g_combat.c"
line 12
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_combat.c
;4:
;5:#include "g_local.h"
;6:
;7:/*
;8:============
;9:ScorePlum
;10:============
;11:*/
;12:void ScorePlum(gentity_t* ent, vec3_t origin, int score) {
line 15
;13:	gentity_t* plum;
;14:
;15:	plum = G_TempEntity(origin, EV_SCOREPLUM);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 65
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 17
;16:	// only send this temp entity to a single client
;17:	plum->r.svFlags |= SVF_SINGLECLIENT;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 256
BORI4
ASGNI4
line 18
;18:	plum->r.singleClient = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 20
;19:	//
;20:	plum->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 21
;21:	plum->s.time           = score;
ADDRLP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 22
;22:}
LABELV $54
endproc ScorePlum 12 8
export SetScore
proc SetScore 0 0
line 27
;23:
;24:// SetScore
;25:// ============
;26:// Set score to both the client and his team
;27:void SetScore(gentity_t* ent, vec3_t origin, int score) {
line 28
;28:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $56
line 29
;29:		return;
ADDRGP4 $55
JUMPV
LABELV $56
line 32
;30:	}
;31:	// no scoring during pre-match warmup
;32:	if (level.warmupTime) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $58
line 33
;33:		return;
ADDRGP4 $55
JUMPV
LABELV $58
line 38
;34:	}
;35:	// show score plum
;36:	// ScorePlum(ent, origin, score);
;37:	//
;38:	ent->client->ps.persistant[PERS_SCORE] = score;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 248
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
line 39
;39:	if (g_gametype.integer == GT_TEAM)
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $61
line 40
;40:		level.teamScores[ent->client->ps.persistant[PERS_TEAM]] = score;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 level+48
ADDP4
ADDRFP4 8
INDIRI4
ASGNI4
LABELV $61
line 41
;41:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 42
;42:}
LABELV $55
endproc SetScore 0 0
export AddScore
proc AddScore 4 12
line 51
;43:
;44:/*
;45:============
;46:AddScore
;47:
;48:Adds score to both the client and his team
;49:============
;50:*/
;51:void AddScore(gentity_t* ent, vec3_t origin, int score) {
line 52
;52:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $66
line 53
;53:		return;
ADDRGP4 $65
JUMPV
LABELV $66
line 56
;54:	}
;55:	// no scoring during pre-match warmup
;56:	if (level.warmupTime) {
ADDRGP4 level+16
INDIRI4
CNSTI4 0
EQI4 $68
line 57
;57:		return;
ADDRGP4 $65
JUMPV
LABELV $68
line 60
;58:	}
;59:	// show score plum
;60:	ScorePlum(ent, origin, score);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 ScorePlum
CALLV
pop
line 62
;61:	//
;62:	ent->client->ps.persistant[PERS_SCORE] += score;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 248
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
line 63
;63:	if (g_gametype.integer == GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
NEI4 $71
line 64
;64:		AddTeamScore(origin, ent->client->ps.persistant[PERS_TEAM], score);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 260
ADDP4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 AddTeamScore
CALLV
pop
line 65
;65:	}
LABELV $71
line 66
;66:	CalculateRanks();
ADDRGP4 CalculateRanks
CALLV
pop
line 67
;67:}
LABELV $65
endproc AddScore 4 12
export TossClientItems
proc TossClientItems 40 12
line 76
;68:
;69:/*
;70:=================
;71:TossClientItems
;72:
;73:Toss the weapon and powerups for the killed player
;74:=================
;75:*/
;76:void TossClientItems(gentity_t* self) {
line 84
;77:	gitem_t*   item;
;78:	int        weapon;
;79:	float      angle;
;80:	int        i;
;81:	gentity_t* drop;
;82:
;83:	// drop the weapon if not a gauntlet or machinegun
;84:	weapon = self->s.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 90
;85:
;86:	// make a special check to see if they are changing to a new
;87:	// weapon that isn't the mg or gauntlet.  Without this, a client
;88:	// can pick up a weapon, be killed, and not drop the weapon because
;89:	// their weapon change hasn't completed yet and they are still holding the MG.
;90:	if (weapon == WP_MACHINEGUN || weapon == WP_GRAPPLING_HOOK) {
ADDRLP4 12
INDIRI4
CNSTI4 2
EQI4 $77
ADDRLP4 12
INDIRI4
CNSTI4 10
NEI4 $75
LABELV $77
line 91
;91:		if (self->client->ps.weaponstate == WEAPON_DROPPING) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 148
ADDP4
INDIRI4
CNSTI4 2
NEI4 $78
line 92
;92:			weapon = self->client->pers.cmd.weapon;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 492
ADDP4
INDIRU1
CVUI4 1
ASGNI4
line 93
;93:		}
LABELV $78
line 94
;94:		if (!(self->client->ps.stats[STAT_WEAPONS] & (1 << weapon))) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 12
INDIRI4
LSHI4
BANDI4
CNSTI4 0
NEI4 $80
line 95
;95:			weapon = WP_NONE;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 96
;96:		}
LABELV $80
line 97
;97:	}
LABELV $75
line 99
;98:
;99:	if (weapon > WP_MACHINEGUN && weapon != WP_GRAPPLING_HOOK && self->client->ps.ammo[weapon]) {
ADDRLP4 12
INDIRI4
CNSTI4 2
LEI4 $82
ADDRLP4 12
INDIRI4
CNSTI4 10
EQI4 $82
ADDRLP4 12
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
CNSTI4 0
EQI4 $82
line 101
;100:		// find the item type for this weapon
;101:		item = BG_FindItemForWeapon(weapon);
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForWeapon
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
ASGNP4
line 104
;102:
;103:		// spawn the item
;104:		drop = Drop_Item(self, item, 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 32
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 107
;105:
;106:		// for pickup prediction
;107:		drop->s.time2 = item->quantity;
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ASGNI4
line 108
;108:	}
LABELV $82
line 111
;109:
;110:	// drop all the powerups if not in teamplay
;111:	if (g_gametype.integer != GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $84
line 112
;112:		angle = 45;
ADDRLP4 16
CNSTF4 1110704128
ASGNF4
line 113
;113:		for (i = 1; i < PW_NUM_POWERUPS; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $87
line 114
;114:			if (self->client->ps.powerups[i] > level.time) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $91
line 115
;115:				item = BG_FindItemForPowerup(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
ASGNP4
line 116
;116:				if (!item) {
ADDRLP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $94
line 117
;117:					continue;
ADDRGP4 $88
JUMPV
LABELV $94
line 119
;118:				}
;119:				drop = Drop_Item(self, item, angle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 32
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 32
INDIRP4
ASGNP4
line 121
;120:				// decide how many seconds it has left
;121:				drop->count = (self->client->ps.powerups[i] - level.time) / 1000;
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 122
;122:				if (drop->count < 1) {
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 1
GEI4 $97
line 123
;123:					drop->count = 1;
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 124
;124:				}
LABELV $97
line 126
;125:				// for pickup prediction
;126:				drop->s.time2 = drop->count;
ADDRLP4 4
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 127
;127:				angle += 45;
ADDRLP4 16
ADDRLP4 16
INDIRF4
CNSTF4 1110704128
ADDF4
ASGNF4
line 128
;128:			}
LABELV $91
line 129
;129:		}
LABELV $88
line 113
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LTI4 $87
line 130
;130:	}
LABELV $84
line 131
;131:}
LABELV $74
endproc TossClientItems 40 12
export LookAtKiller
proc LookAtKiller 28 4
line 217
;132:
;133:#ifdef MISSIONPACK
;134:/*
;135:=================
;136:TossClientCubes
;137:=================
;138:*/
;139:extern gentity_t* neutralObelisk;
;140:
;141:void              TossClientCubes(gentity_t* self) {
;142:				 gitem_t*   item;
;143:				 gentity_t* drop;
;144:				 vec3_t     velocity;
;145:				 vec3_t     angles;
;146:				 vec3_t     origin;
;147:
;148:				 self->client->ps.generic1 = 0;
;149:
;150:				 // this should never happen but we should never
;151:	             // get the server to crash due to skull being spawned in
;152:				 if (!G_EntitiesFree()) {
;153:					 return;
;154:    }
;155:
;156:				 if (self->client->sess.sessionTeam == TEAM_RED) {
;157:					 item = BG_FindItem("Red Cube");
;158:    } else {
;159:					 item = BG_FindItem("Blue Cube");
;160:    }
;161:
;162:				 angles[YAW]   = (float)(level.time % 360);
;163:				 angles[PITCH] = 0;  // always forward
;164:				 angles[ROLL]  = 0;
;165:
;166:				 AngleVectors(angles, velocity, NULL, NULL);
;167:				 VectorScale(velocity, 150, velocity);
;168:				 velocity[2] += 200 + crandom() * 50;
;169:
;170:				 if (neutralObelisk) {
;171:					 VectorCopy(neutralObelisk->s.pos.trBase, origin);
;172:					 origin[2] += 44;
;173:    } else {
;174:					 VectorClear(origin);
;175:    }
;176:
;177:				 drop = LaunchItem(item, origin, velocity);
;178:
;179:				 drop->nextthink  = level.time + g_cubeTimeout.integer * 1000;
;180:				 drop->think      = G_FreeEntity;
;181:				 drop->spawnflags = self->client->sess.sessionTeam;
;182:}
;183:
;184:/*
;185:=================
;186:TossClientPersistantPowerups
;187:=================
;188:*/
;189:void TossClientPersistantPowerups(gentity_t* ent) {
;190:	gentity_t* powerup;
;191:
;192:	if (!ent->client) {
;193:		return;
;194:	}
;195:
;196:	if (!ent->client->persistantPowerup) {
;197:		return;
;198:	}
;199:
;200:	powerup = ent->client->persistantPowerup;
;201:
;202:	powerup->r.svFlags &= ~SVF_NOCLIENT;
;203:	powerup->s.eFlags &= ~EF_NODRAW;
;204:	powerup->r.contents = CONTENTS_TRIGGER;
;205:	trap_LinkEntity(powerup);
;206:
;207:	ent->client->ps.stats[STAT_PERSISTANT_POWERUP] = 0;
;208:	ent->client->persistantPowerup                 = NULL;
;209:}
;210:#endif
;211:
;212:/*
;213:==================
;214:LookAtKiller
;215:==================
;216:*/
;217:void LookAtKiller(gentity_t* self, gentity_t* inflictor, gentity_t* attacker) {
line 220
;218:	vec3_t dir;
;219:
;220:	if (attacker && attacker != self) {
ADDRLP4 12
ADDRFP4 8
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 12
INDIRU4
CNSTU4 0
EQU4 $100
ADDRLP4 12
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $100
line 221
;221:		VectorSubtract(attacker->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 16
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 16
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 222
;222:	} else if (inflictor && inflictor != self) {
ADDRGP4 $101
JUMPV
LABELV $100
ADDRLP4 16
ADDRFP4 4
INDIRP4
CVPU4 4
ASGNU4
ADDRLP4 16
INDIRU4
CNSTU4 0
EQU4 $104
ADDRLP4 16
INDIRU4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $104
line 223
;223:		VectorSubtract(inflictor->s.pos.trBase, self->s.pos.trBase, dir);
ADDRLP4 20
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
SUBF4
ASGNF4
line 224
;224:	} else {
ADDRGP4 $105
JUMPV
LABELV $104
line 225
;225:		self->client->ps.stats[STAT_DEAD_YAW] = self->s.angles[YAW];
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 120
ADDP4
INDIRF4
CVFI4 4
ASGNI4
line 226
;226:		return;
ADDRGP4 $99
JUMPV
LABELV $105
LABELV $101
line 229
;227:	}
;228:
;229:	self->client->ps.stats[STAT_DEAD_YAW] = vectoyaw(dir);
ADDRLP4 0
ARGP4
ADDRLP4 20
ADDRGP4 vectoyaw
CALLF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 200
ADDP4
ADDRLP4 20
INDIRF4
CVFI4 4
ASGNI4
line 230
;230:}
LABELV $99
endproc LookAtKiller 28 4
export GibEntity
proc GibEntity 0 12
line 237
;231:
;232:/*
;233:==================
;234:GibEntity
;235:==================
;236:*/
;237:void GibEntity(gentity_t* self, int killer) {
line 259
;238:#ifdef MISSIONPACK
;239:	gentity_t* ent;
;240:	int        i;
;241:
;242:	// if this entity still has kamikaze
;243:	if (self->s.eFlags & EF_KAMIKAZE) {
;244:		// check if there is a kamikaze timer around for this owner
;245:		for (i = 0; i < level.num_entities; i++) {
;246:			ent = &g_entities[i];
;247:			if (!ent->inuse)
;248:				continue;
;249:			if (ent->activator != self)
;250:				continue;
;251:			if (strcmp(ent->classname, "kamikaze timer"))
;252:				continue;
;253:			G_FreeEntity(ent);
;254:			break;
;255:		}
;256:	}
;257:#endif
;258:
;259:	G_AddEvent(self, EV_GIB_PLAYER, killer);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 260
;260:	self->takedamage = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 0
ASGNI4
line 261
;261:	self->s.eType    = ET_INVISIBLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 10
ASGNI4
line 262
;262:	self->r.contents = 0;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 263
;263:}
LABELV $108
endproc GibEntity 0 12
export body_die
proc body_die 0 8
line 270
;264:
;265:/*
;266:==================
;267:body_die
;268:==================
;269:*/
;270:void body_die(gentity_t* self, gentity_t* inflictor, gentity_t* attacker, int damage, int meansOfDeath) {
line 271
;271:	if (self->health > GIB_HEALTH) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
LEI4 $110
line 272
;272:		return;
ADDRGP4 $109
JUMPV
LABELV $110
line 274
;273:	}
;274:	if (!g_blood.integer) {
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $112
line 275
;275:		self->health = GIB_HEALTH + 1;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -39
ASGNI4
line 276
;276:		return;
ADDRGP4 $109
JUMPV
LABELV $112
line 279
;277:	}
;278:
;279:	GibEntity(self, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 280
;280:}
LABELV $109
endproc body_die 0 8
data
export modNames
align 4
LABELV modNames
address $115
address $116
address $117
address $118
address $119
address $120
address $121
address $122
address $123
address $124
address $125
address $126
address $127
address $128
address $129
address $130
address $131
address $132
address $133
address $134
address $135
address $136
address $137
address $138
export CheckAlmostCapture
code
proc CheckAlmostCapture 52 12
line 328
;281:
;282:// these are just for logging, the client prints its own messages
;283:char* modNames[] = {"MOD_UNKNOWN",  "MOD_SHOTGUN",       "MOD_GAUNTLET",       "MOD_MACHINEGUN",    "MOD_GRENADE",      "MOD_GRENADE_SPLASH",
;284:                    "MOD_ROCKET",   "MOD_ROCKET_SPLASH", "MOD_PLASMA",         "MOD_PLASMA_SPLASH", "MOD_RAILGUN",      "MOD_LIGHTNING",
;285:                    "MOD_BFG",      "MOD_BFG_SPLASH",    "MOD_WATER",          "MOD_SLIME",         "MOD_LAVA",         "MOD_CRUSH",
;286:                    "MOD_TELEFRAG", "MOD_FALLING",       "MOD_SUICIDE",        "MOD_TARGET_LASER",  "MOD_TRIGGER_HURT",
;287:#ifdef MISSIONPACK
;288:                    "MOD_NAIL",     "MOD_CHAINGUN",      "MOD_PROXIMITY_MINE", "MOD_KAMIKAZE",      "MOD_JUICED",
;289:#endif
;290:                    "MOD_GRAPPLE"};
;291:
;292:#ifdef MISSIONPACK
;293:/*
;294:==================
;295:Kamikaze_DeathActivate
;296:==================
;297:*/
;298:void Kamikaze_DeathActivate(gentity_t* ent) {
;299:	G_StartKamikaze(ent);
;300:	G_FreeEntity(ent);
;301:}
;302:
;303:/*
;304:==================
;305:Kamikaze_DeathTimer
;306:==================
;307:*/
;308:void Kamikaze_DeathTimer(gentity_t* self) {
;309:	gentity_t* ent;
;310:
;311:	ent            = G_Spawn();
;312:	ent->classname = "kamikaze timer";
;313:	VectorCopy(self->s.pos.trBase, ent->s.pos.trBase);
;314:	ent->r.svFlags |= SVF_NOCLIENT;
;315:	ent->think     = Kamikaze_DeathActivate;
;316:	ent->nextthink = level.time + 5 * 1000;
;317:
;318:	ent->activator = self;
;319:}
;320:
;321:#endif
;322:
;323:/*
;324:==================
;325:CheckAlmostCapture
;326:==================
;327:*/
;328:void CheckAlmostCapture(gentity_t* self, gentity_t* attacker) {
line 334
;329:	gentity_t* ent;
;330:	vec3_t     dir;
;331:	char*      classname;
;332:
;333:	// if this player was carrying a flag
;334:	if (self->client->ps.powerups[PW_REDFLAG] || self->client->ps.powerups[PW_BLUEFLAG] || self->client->ps.powerups[PW_NEUTRALFLAG]) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
NEI4 $143
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
NEI4 $143
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $140
LABELV $143
line 336
;335:		// get the goal flag this player should have been going for
;336:		if (g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $144
line 337
;337:			if (self->client->sess.sessionTeam == TEAM_BLUE) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $147
line 338
;338:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $149
ASGNP4
line 339
;339:			} else {
ADDRGP4 $145
JUMPV
LABELV $147
line 340
;340:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $150
ASGNP4
line 341
;341:			}
line 342
;342:		} else {
ADDRGP4 $145
JUMPV
LABELV $144
line 343
;343:			if (self->client->sess.sessionTeam == TEAM_BLUE) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $151
line 344
;344:				classname = "team_CTF_redflag";
ADDRLP4 4
ADDRGP4 $150
ASGNP4
line 345
;345:			} else {
ADDRGP4 $152
JUMPV
LABELV $151
line 346
;346:				classname = "team_CTF_blueflag";
ADDRLP4 4
ADDRGP4 $149
ASGNP4
line 347
;347:			}
LABELV $152
line 348
;348:		}
LABELV $145
line 349
;349:		ent = NULL;
ADDRLP4 0
CNSTP4 0
ASGNP4
LABELV $153
line 350
;350:		do {
line 351
;351:			ent = G_Find(ent, FOFS(classname), classname);
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
ASGNP4
line 352
;352:		} while (ent && (ent->flags & FL_DROPPED_ITEM));
LABELV $154
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $156
ADDRLP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $153
LABELV $156
line 354
;353:		// if we found the destination flag and it's not picked up
;354:		if (ent && !(ent->r.svFlags & SVF_NOCLIENT)) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $157
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $157
line 356
;355:			// if the player was *very* close
;356:			VectorSubtract(self->client->ps.origin, ent->s.origin, dir);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 8+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 357
;357:			if (VectorLength(dir) < 200) {
ADDRLP4 8
ARGP4
ADDRLP4 40
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 40
INDIRF4
CNSTF4 1128792064
GEF4 $161
line 358
;358:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 359
;359:				if (attacker->client) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $163
line 360
;360:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 48
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 361
;361:				}
LABELV $163
line 362
;362:			}
LABELV $161
line 363
;363:		}
LABELV $157
line 364
;364:	}
LABELV $140
line 365
;365:}
LABELV $139
endproc CheckAlmostCapture 52 12
export CheckAlmostScored
proc CheckAlmostScored 44 12
line 372
;366:
;367:/*
;368:==================
;369:CheckAlmostScored
;370:==================
;371:*/
;372:void CheckAlmostScored(gentity_t* self, gentity_t* attacker) {
line 378
;373:	gentity_t* ent;
;374:	vec3_t     dir;
;375:	char*      classname;
;376:
;377:	// if the player was carrying cubes
;378:	if (self->client->ps.generic1) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
CNSTI4 0
EQI4 $166
line 379
;379:		if (self->client->sess.sessionTeam == TEAM_BLUE) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
NEI4 $168
line 380
;380:			classname = "team_redobelisk";
ADDRLP4 16
ADDRGP4 $170
ASGNP4
line 381
;381:		} else {
ADDRGP4 $169
JUMPV
LABELV $168
line 382
;382:			classname = "team_blueobelisk";
ADDRLP4 16
ADDRGP4 $171
ASGNP4
line 383
;383:		}
LABELV $169
line 384
;384:		ent = G_Find(NULL, FOFS(classname), classname);
CNSTP4 0
ARGP4
CNSTI4 524
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 20
ADDRGP4 G_Find
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 386
;385:		// if we found the destination obelisk
;386:		if (ent) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $172
line 388
;387:			// if the player was *very* close
;388:			VectorSubtract(self->client->ps.origin, ent->s.origin, dir);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 24
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 24
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 4+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
SUBF4
ASGNF4
line 389
;389:			if (VectorLength(dir) < 200) {
ADDRLP4 4
ARGP4
ADDRLP4 32
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 32
INDIRF4
CNSTF4 1128792064
GEF4 $176
line 390
;390:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 391
;391:				if (attacker->client) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $178
line 392
;392:					attacker->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_HOLYSHIT;
ADDRLP4 40
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 4
BXORI4
ASGNI4
line 393
;393:				}
LABELV $178
line 394
;394:			}
LABELV $176
line 395
;395:		}
LABELV $172
line 396
;396:	}
LABELV $166
line 397
;397:}
LABELV $165
endproc CheckAlmostScored 44 12
bss
align 4
LABELV $247
skip 4
export player_die
code
proc player_die 80 28
line 404
;398:
;399:/*
;400:==================
;401:player_die
;402:==================
;403:*/
;404:void player_die(gentity_t* self, gentity_t* inflictor, gentity_t* attacker, int damage, int meansOfDeath) {
line 412
;405:	gentity_t* ent;
;406:	int        anim;
;407:	int        contents;
;408:	int        killer;
;409:	int        i;
;410:	char *     killerName, *obit;
;411:
;412:	if (self->client->ps.pm_type == PM_DEAD) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $181
line 413
;413:		return;
ADDRGP4 $180
JUMPV
LABELV $181
line 416
;414:	}
;415:
;416:	if (level.intermissiontime) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $183
line 417
;417:		return;
ADDRGP4 $180
JUMPV
LABELV $183
line 421
;418:	}
;419:
;420:	// unlag the client
;421:	G_UnTimeShiftClient(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UnTimeShiftClient
CALLV
pop
line 424
;422:
;423:	// check for an almost capture
;424:	CheckAlmostCapture(self, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostCapture
CALLV
pop
line 426
;425:	// check for a player that almost brought in cubes
;426:	CheckAlmostScored(self, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 CheckAlmostScored
CALLV
pop
line 428
;427:
;428:	if (self->client && self->client->hook) {
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $186
ADDRLP4 28
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $186
line 429
;429:		Weapon_HookFree(self->client->hook);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
line 430
;430:	}
LABELV $186
line 438
;431:#ifdef MISSIONPACK
;432:	if ((self->client->ps.eFlags & EF_TICKING) && self->activator) {
;433:		self->client->ps.eFlags &= ~EF_TICKING;
;434:		self->activator->think     = G_FreeEntity;
;435:		self->activator->nextthink = level.time;
;436:	}
;437:#endif
;438:	self->client->ps.pm_type = PM_DEAD;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 440
;439:
;440:	if (attacker) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $188
line 441
;441:		killer = attacker->s.number;
ADDRLP4 4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 442
;442:		if (attacker->client) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $190
line 443
;443:			killerName = attacker->client->pers.netname;
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ASGNP4
line 444
;444:		} else {
ADDRGP4 $189
JUMPV
LABELV $190
line 445
;445:			killerName = "<non-client>";
ADDRLP4 16
ADDRGP4 $192
ASGNP4
line 446
;446:		}
line 447
;447:	} else {
ADDRGP4 $189
JUMPV
LABELV $188
line 448
;448:		killer     = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 449
;449:		killerName = "<world>";
ADDRLP4 16
ADDRGP4 $193
ASGNP4
line 450
;450:	}
LABELV $189
line 452
;451:
;452:	if (killer < 0 || killer >= MAX_CLIENTS) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $196
ADDRLP4 4
INDIRI4
CNSTI4 64
LTI4 $194
LABELV $196
line 453
;453:		killer     = ENTITYNUM_WORLD;
ADDRLP4 4
CNSTI4 1022
ASGNI4
line 454
;454:		killerName = "<world>";
ADDRLP4 16
ADDRGP4 $193
ASGNP4
line 455
;455:	}
LABELV $194
line 457
;456:
;457:	if ((unsigned)meansOfDeath >= ARRAY_LEN(modNames)) {
ADDRFP4 16
INDIRI4
CVIU4 4
CNSTU4 24
LTU4 $197
line 458
;458:		obit = "<bad obituary>";
ADDRLP4 20
ADDRGP4 $199
ASGNP4
line 459
;459:	} else {
ADDRGP4 $198
JUMPV
LABELV $197
line 460
;460:		obit = modNames[meansOfDeath];
ADDRLP4 20
ADDRFP4 16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 modNames
ADDP4
INDIRP4
ASGNP4
line 461
;461:	}
LABELV $198
line 463
;462:
;463:	G_LogPrintf("Kill: %i %i %i: %s killed %s by %s\n", killer, self->s.number, meansOfDeath, killerName, self->client->pers.netname, obit);
ADDRGP4 $200
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
INDIRI4
ARGI4
ADDRFP4 16
INDIRI4
ARGI4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 36
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 508
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 466
;464:
;465:	// broadcast the death event to everyone
;466:	ent                    = G_TempEntity(self->r.currentOrigin, EV_OBITUARY);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 60
ARGI4
ADDRLP4 40
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
ASGNP4
line 467
;467:	ent->s.eventParm       = meansOfDeath;
ADDRLP4 8
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 16
INDIRI4
ASGNI4
line 468
;468:	ent->s.otherEntityNum  = self - g_entities;
ADDRLP4 8
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
line 469
;469:	ent->s.otherEntityNum2 = killer;
ADDRLP4 8
INDIRP4
CNSTI4 144
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 470
;470:	ent->r.svFlags         = SVF_BROADCAST;  // send to everyone
ADDRLP4 8
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 32
ASGNI4
line 472
;471:
;472:	self->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 474
;473:
;474:	self->client->ps.persistant[PERS_KILLED]++;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 280
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 476
;475:
;476:	if (attacker && attacker->client) {
ADDRLP4 48
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $201
ADDRLP4 48
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $201
line 477
;477:		attacker->client->lastkilled_client = self->s.number;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 728
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 479
;478:
;479:		if (attacker == self || OnSameTeam(self, attacker)) {
ADDRLP4 52
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CVPU4 4
ADDRLP4 56
INDIRP4
CVPU4 4
EQU4 $205
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
EQI4 $203
LABELV $205
line 480
;480:			SetScore(attacker, self->r.currentOrigin, 0);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 SetScore
CALLV
pop
line 481
;481:		} else {
ADDRGP4 $202
JUMPV
LABELV $203
line 482
;482:			AddScore(attacker, self->r.currentOrigin, 1);
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 AddScore
CALLV
pop
line 484
;483:
;484:			if (meansOfDeath == MOD_GAUNTLET) {
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $206
line 487
;485:
;486:				// play humiliation on player
;487:				attacker->client->ps.persistant[PERS_GAUNTLET_FRAG_COUNT]++;
ADDRLP4 64
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 300
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 490
;488:
;489:				// add the sprite over the player's head
;490:				attacker->client->ps.eFlags &=
ADDRLP4 68
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 492
;491:					~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP);
;492:				attacker->client->ps.eFlags |= EF_AWARD_GAUNTLET;
ADDRLP4 72
ADDRFP4 8
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
CNSTI4 64
BORI4
ASGNI4
line 493
;493:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 496
;494:
;495:				// also play humiliation on target
;496:				self->client->ps.persistant[PERS_PLAYEREVENTS] ^= PLAYEREVENT_GAUNTLETREWARD;
ADDRLP4 76
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 268
ADDP4
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 2
BXORI4
ASGNI4
line 497
;497:			}
LABELV $206
line 501
;498:
;499:			// check for two kills in a short amount of time
;500:			// if this is close enough to the last kill, give a reward sound
;501:			if (level.time - attacker->client->lastKillTime < CARNAGE_REWARD_TIME) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
SUBI4
CNSTI4 3000
GEI4 $209
line 503
;502:				// play excellent on player
;503:				attacker->client->ps.persistant[PERS_EXCELLENT_COUNT]++;
ADDRLP4 64
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 288
ADDP4
ASGNP4
ADDRLP4 64
INDIRP4
ADDRLP4 64
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 506
;504:
;505:				// add the sprite over the player's head
;506:				attacker->client->ps.eFlags &=
ADDRLP4 68
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 68
INDIRP4
ADDRLP4 68
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 508
;507:					~(EF_AWARD_IMPRESSIVE | EF_AWARD_EXCELLENT | EF_AWARD_GAUNTLET | EF_AWARD_ASSIST | EF_AWARD_DEFEND | EF_AWARD_CAP);
;508:				attacker->client->ps.eFlags |= EF_AWARD_EXCELLENT;
ADDRLP4 72
ADDRFP4 8
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
CNSTI4 8
BORI4
ASGNI4
line 509
;509:				attacker->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 752
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2000
ADDI4
ASGNI4
line 510
;510:			}
LABELV $209
line 511
;511:			attacker->client->lastKillTime = level.time;
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 760
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 512
;512:		}
line 513
;513:	} else {
ADDRGP4 $202
JUMPV
LABELV $201
line 514
;514:		SetScore(self, self->r.currentOrigin, 0);
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
ARGP4
ADDRLP4 52
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 SetScore
CALLV
pop
line 515
;515:	}
LABELV $202
line 518
;516:
;517:	// Add team bonuses
;518:	Team_FragBonuses(self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_FragBonuses
CALLV
pop
line 521
;519:
;520:	// if I committed suicide, the flag does not fall, it returns.
;521:	if (meansOfDeath == MOD_SUICIDE) {
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $214
line 528
;522:#ifdef MISSIONPACK
;523:		if (self->client->ps.powerups[PW_NEUTRALFLAG]) {  // only happens in One Flag CTF
;524:			Team_ReturnFlag(TEAM_FREE);
;525:			self->client->ps.powerups[PW_NEUTRALFLAG] = 0;
;526:		} else
;527:#endif
;528:			if (self->client->ps.powerups[PW_REDFLAG]) {  // only happens in standard CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $216
line 529
;529:			Team_ReturnFlag(TEAM_RED);
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 530
;530:			self->client->ps.powerups[PW_REDFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
CNSTI4 0
ASGNI4
line 531
;531:		} else if (self->client->ps.powerups[PW_BLUEFLAG]) {  // only happens in standard CTF
ADDRGP4 $217
JUMPV
LABELV $216
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $218
line 532
;532:			Team_ReturnFlag(TEAM_BLUE);
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 533
;533:			self->client->ps.powerups[PW_BLUEFLAG] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
CNSTI4 0
ASGNI4
line 534
;534:		}
LABELV $218
LABELV $217
line 535
;535:	}
LABELV $214
line 538
;536:
;537:	// if client is in a nodrop area, don't drop anything (but return CTF flags!)
;538:	contents = trap_PointContents(self->r.currentOrigin, -1);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
CNSTI4 -1
ARGI4
ADDRLP4 52
ADDRGP4 trap_PointContents
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 539
;539:	if (!(contents & CONTENTS_NODROP)) {
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $220
line 541
;540:		// TossClientItems(self); // Never drop client items on the ground
;541:	} else {
ADDRGP4 $221
JUMPV
LABELV $220
line 542
;542:		if (self->client->ps.powerups[PW_NEUTRALFLAG]) {  // only happens in One Flag CTF
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $222
line 543
;543:			Team_ReturnFlag(TEAM_FREE);
CNSTI4 0
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 544
;544:		} else if (self->client->ps.powerups[PW_REDFLAG]) {  // only happens in standard CTF
ADDRGP4 $223
JUMPV
LABELV $222
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $224
line 545
;545:			Team_ReturnFlag(TEAM_RED);
CNSTI4 1
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 546
;546:		} else if (self->client->ps.powerups[PW_BLUEFLAG]) {  // only happens in standard CTF
ADDRGP4 $225
JUMPV
LABELV $224
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $226
line 547
;547:			Team_ReturnFlag(TEAM_BLUE);
CNSTI4 2
ARGI4
ADDRGP4 Team_ReturnFlag
CALLV
pop
line 548
;548:		}
LABELV $226
LABELV $225
LABELV $223
line 549
;549:	}
LABELV $221
line 557
;550:#ifdef MISSIONPACK
;551:	TossClientPersistantPowerups(self);
;552:	if (g_gametype.integer == GT_HARVESTER) {
;553:		TossClientCubes(self);
;554:	}
;555:#endif
;556:
;557:	Cmd_Score_f(self);  // show scores
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 560
;558:	// send updated scores to any clients that are following this one,
;559:	// or they would get stale scoreboards
;560:	for (i = 0; i < level.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $231
JUMPV
LABELV $228
line 563
;561:		gclient_t* client;
;562:
;563:		client = &level.clients[i];
ADDRLP4 56
ADDRLP4 0
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 564
;564:		if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 56
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $233
line 565
;565:			continue;
ADDRGP4 $229
JUMPV
LABELV $233
line 567
;566:		}
;567:		if (client->sess.sessionTeam != TEAM_SPECTATOR) {
ADDRLP4 56
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $235
line 568
;568:			continue;
ADDRGP4 $229
JUMPV
LABELV $235
line 570
;569:		}
;570:		if (client->sess.spectatorClient == self->s.number) {
ADDRLP4 56
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $237
line 571
;571:			Cmd_Score_f(g_entities + i);
ADDRLP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRGP4 Cmd_Score_f
CALLV
pop
line 572
;572:		}
LABELV $237
line 573
;573:	}
LABELV $229
line 560
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $231
ADDRLP4 0
INDIRI4
ADDRGP4 level+24
INDIRI4
LTI4 $228
line 575
;574:
;575:	self->takedamage = qtrue;  // can still be gibbed
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
CNSTI4 1
ASGNI4
line 577
;576:
;577:	self->s.weapon   = WP_NONE;
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 0
ASGNI4
line 578
;578:	self->s.powerups = 0;
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
CNSTI4 0
ASGNI4
line 579
;579:	self->r.contents = CONTENTS_CORPSE;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 67108864
ASGNI4
line 581
;580:
;581:	self->s.angles[0] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
CNSTF4 0
ASGNF4
line 582
;582:	self->s.angles[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 124
ADDP4
CNSTF4 0
ASGNF4
line 583
;583:	LookAtKiller(self, inflictor, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 LookAtKiller
CALLV
pop
line 585
;584:
;585:	VectorCopy(self->s.angles, self->client->ps.viewangles);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 116
ADDP4
INDIRB
ASGNB 12
line 587
;586:
;587:	self->s.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 156
ADDP4
CNSTI4 0
ASGNI4
line 589
;588:
;589:	self->r.maxs[2] = -8;
ADDRFP4 0
INDIRP4
CNSTI4 456
ADDP4
CNSTF4 3238002688
ASGNF4
line 594
;590:
;591:	// don't allow respawn until the death anim is done
;592:	// g_forcerespawn may force spawning at some later time
;593:	// + 1700;  // Allow Instant Respawn
;594:	self->client->respawnTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 740
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 596
;595:	// Send server time at the time of respawn.
;596:	trap_SendServerCommand(self - g_entities, va("timerStop %i", self->client->ps.commandTime));
ADDRGP4 $240
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
INDIRI4
ARGI4
ADDRLP4 60
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
ADDRLP4 60
INDIRP4
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 599
;597:
;598:	// remove powerups
;599:	memset(self->client->ps.powerups, 0, sizeof(self->client->ps.powerups));
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
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
line 602
;600:
;601:	// never gib in a nodrop
;602:	if ((self->health <= GIB_HEALTH && !(contents & CONTENTS_NODROP) && g_blood.integer) || meansOfDeath == MOD_SUICIDE) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $246
ADDRLP4 12
INDIRI4
CVIU4 4
CNSTU4 2147483648
BANDU4
CNSTU4 0
NEU4 $246
ADDRGP4 g_blood+12
INDIRI4
CNSTI4 0
NEI4 $244
LABELV $246
ADDRFP4 16
INDIRI4
CNSTI4 20
NEI4 $241
LABELV $244
line 604
;603:		// gib death
;604:		GibEntity(self, killer);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 GibEntity
CALLV
pop
line 605
;605:	} else {
ADDRGP4 $242
JUMPV
LABELV $241
line 609
;606:		// normal death
;607:		static int i;
;608:
;609:		switch (i) {
ADDRLP4 64
ADDRGP4 $247
INDIRI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 0
EQI4 $250
ADDRLP4 64
INDIRI4
CNSTI4 1
EQI4 $251
ADDRLP4 64
INDIRI4
CNSTI4 2
EQI4 $252
ADDRGP4 $248
JUMPV
LABELV $250
line 611
;610:		case 0:
;611:			anim = BOTH_DEATH1;
ADDRLP4 24
CNSTI4 0
ASGNI4
line 612
;612:			break;
ADDRGP4 $249
JUMPV
LABELV $251
line 614
;613:		case 1:
;614:			anim = BOTH_DEATH2;
ADDRLP4 24
CNSTI4 2
ASGNI4
line 615
;615:			break;
ADDRGP4 $249
JUMPV
LABELV $252
LABELV $248
line 618
;616:		case 2:
;617:		default:
;618:			anim = BOTH_DEATH3;
ADDRLP4 24
CNSTI4 4
ASGNI4
line 619
;619:			break;
LABELV $249
line 624
;620:		}
;621:
;622:		// for the no-blood option, we need to prevent the health
;623:		// from going to gib level
;624:		if (self->health <= GIB_HEALTH) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -40
GTI4 $253
line 625
;625:			self->health = GIB_HEALTH + 1;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -39
ASGNI4
line 626
;626:		}
LABELV $253
line 628
;627:
;628:		self->client->ps.legsAnim  = ((self->client->ps.legsAnim & ANIM_TOGGLEBIT) ^ ANIM_TOGGLEBIT) | anim;
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 76
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 128
BXORI4
ADDRLP4 24
INDIRI4
BORI4
ASGNI4
line 629
;629:		self->client->ps.torsoAnim = ((self->client->ps.torsoAnim & ANIM_TOGGLEBIT) ^ ANIM_TOGGLEBIT) | anim;
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 84
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 128
BANDI4
CNSTI4 128
BXORI4
ADDRLP4 24
INDIRI4
BORI4
ASGNI4
line 631
;630:
;631:		G_AddEvent(self, EV_DEATH1 + i, killer);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $247
INDIRI4
CNSTI4 57
ADDI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 634
;632:
;633:		// the body can still be gibbed
;634:		self->die = body_die;
ADDRFP4 0
INDIRP4
CNSTI4 716
ADDP4
ADDRGP4 body_die
ASGNP4
line 637
;635:
;636:		// globally cycle through the different death animations
;637:		i = (i + 1) % 3;
ADDRLP4 76
ADDRGP4 $247
ASGNP4
ADDRLP4 76
INDIRP4
ADDRLP4 76
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
CNSTI4 3
MODI4
ASGNI4
line 644
;638:
;639:#ifdef MISSIONPACK
;640:		if (self->s.eFlags & EF_KAMIKAZE) {
;641:			Kamikaze_DeathTimer(self);
;642:		}
;643:#endif
;644:	}
LABELV $242
line 646
;645:
;646:	trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 647
;647:}
LABELV $180
endproc player_die 80 28
export CheckArmor
proc CheckArmor 20 4
line 654
;648:
;649:/*
;650:================
;651:CheckArmor
;652:================
;653:*/
;654:int CheckArmor(gentity_t* ent, int damage, int dflags) {
line 659
;655:	gclient_t* client;
;656:	int        save;
;657:	int        count;
;658:
;659:	if (!damage)
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $256
line 660
;660:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $255
JUMPV
LABELV $256
line 662
;661:
;662:	client = ent->client;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 664
;663:
;664:	if (!client)
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $258
line 665
;665:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $255
JUMPV
LABELV $258
line 667
;666:
;667:	if (dflags & DAMAGE_NO_ARMOR)
ADDRFP4 8
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $260
line 668
;668:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $255
JUMPV
LABELV $260
line 671
;669:
;670:	// armor
;671:	count = client->ps.stats[STAT_ARMOR];
ADDRLP4 8
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 672
;672:	save  = ceil(damage * ARMOR_PROTECTION);
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1059648963
MULF4
ARGF4
ADDRLP4 12
ADDRGP4 ceil
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 12
INDIRF4
CVFI4 4
ASGNI4
line 673
;673:	if (save >= count)
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
LTI4 $262
line 674
;674:		save = count;
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
LABELV $262
line 676
;675:
;676:	if (!save)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $264
line 677
;677:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $255
JUMPV
LABELV $264
line 679
;678:
;679:	client->ps.stats[STAT_ARMOR] -= save;
ADDRLP4 16
ADDRLP4 4
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 681
;680:
;681:	return save;
ADDRLP4 0
INDIRI4
RETI4
LABELV $255
endproc CheckArmor 20 4
export RaySphereIntersections
proc RaySphereIntersections 56 4
line 689
;682:}
;683:
;684:/*
;685:================
;686:RaySphereIntersections
;687:================
;688:*/
;689:int RaySphereIntersections(vec3_t origin, float radius, vec3_t point, vec3_t dir, vec3_t intersections[2]) {
line 698
;690:	float b, c, d, t;
;691:
;692:	//	| origin - (point + t * dir) | = radius
;693:	//	a = dir[0]^2 + dir[1]^2 + dir[2]^2;
;694:	//	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
;695:	//	c = (point[0] - origin[0])^2 + (point[1] - origin[1])^2 + (point[2] - origin[2])^2 - radius^2;
;696:
;697:	// normalize dir so a = 1
;698:	VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 699
;699:	b = 2 * (dir[0] * (point[0] - origin[0]) + dir[1] * (point[1] - origin[1]) + dir[2] * (point[2] - origin[2]));
ADDRLP4 16
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 16
INDIRP4
INDIRF4
ADDRLP4 20
INDIRP4
INDIRF4
ADDRLP4 24
INDIRP4
INDIRF4
SUBF4
MULF4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
CNSTF4 1073741824
MULF4
ASGNF4
line 700
;700:	c = (point[0] - origin[0]) * (point[0] - origin[0]) + (point[1] - origin[1]) * (point[1] - origin[1]) + (point[2] - origin[2]) * (point[2] - origin[2]) -
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 40
ADDRFP4 4
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ADDRLP4 36
INDIRF4
MULF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ADDRLP4 28
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ADDRLP4 40
INDIRF4
ADDRLP4 40
INDIRF4
MULF4
SUBF4
ASGNF4
line 703
;701:	    radius * radius;
;702:
;703:	d = b * b - 4 * c;
ADDRLP4 8
ADDRLP4 4
INDIRF4
ADDRLP4 4
INDIRF4
MULF4
ADDRLP4 12
INDIRF4
CNSTF4 1082130432
MULF4
SUBF4
ASGNF4
line 704
;704:	if (d > 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $267
line 705
;705:		t = (-b + sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 48
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 48
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 706
;706:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 707
;707:		t = (-b - sqrt(d)) / 2;
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 52
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
ADDRLP4 52
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 708
;708:		VectorMA(point, t, dir, intersections[1]);
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 16
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 20
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 709
;709:		return 2;
CNSTI4 2
RETI4
ADDRGP4 $266
JUMPV
LABELV $267
line 710
;710:	} else if (d == 0) {
ADDRLP4 8
INDIRF4
CNSTF4 0
NEF4 $269
line 711
;711:		t = (-b) / 2;
ADDRLP4 0
ADDRLP4 4
INDIRF4
NEGF4
CNSTF4 1056964608
MULF4
ASGNF4
line 712
;712:		VectorMA(point, t, dir, intersections[0]);
ADDRFP4 16
INDIRP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRFP4 12
INDIRP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 713
;713:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $266
JUMPV
LABELV $269
line 715
;714:	}
;715:	return 0;
CNSTI4 0
RETI4
LABELV $266
endproc RaySphereIntersections 56 4
export G_Damage
proc G_Damage 88 24
line 780
;716:}
;717:
;718:#ifdef MISSIONPACK
;719:/*
;720:================
;721:G_InvulnerabilityEffect
;722:================
;723:*/
;724:int G_InvulnerabilityEffect(gentity_t* targ, vec3_t dir, vec3_t point, vec3_t impactpoint, vec3_t bouncedir) {
;725:	gentity_t* impact;
;726:	vec3_t     intersections[2], vec;
;727:	int        n;
;728:
;729:	if (!targ->client) {
;730:		return qfalse;
;731:	}
;732:	VectorCopy(dir, vec);
;733:	VectorInverse(vec);
;734:	// sphere model radius = 42 units
;735:	n = RaySphereIntersections(targ->client->ps.origin, 42, point, vec, intersections);
;736:	if (n > 0) {
;737:		impact = G_TempEntity(targ->client->ps.origin, EV_INVUL_IMPACT);
;738:		VectorSubtract(intersections[0], targ->client->ps.origin, vec);
;739:		vectoangles(vec, impact->s.angles);
;740:		impact->s.angles[0] += 90;
;741:		if (impact->s.angles[0] > 360)
;742:			impact->s.angles[0] -= 360;
;743:		if (impactpoint) {
;744:			VectorCopy(intersections[0], impactpoint);
;745:		}
;746:		if (bouncedir) {
;747:			VectorCopy(vec, bouncedir);
;748:			VectorNormalize(bouncedir);
;749:		}
;750:		return qtrue;
;751:	} else {
;752:		return qfalse;
;753:	}
;754:}
;755:#endif
;756:/*
;757:============
;758:G_Damage
;759:
;760:targ		entity that is being damaged
;761:inflictor	entity that is causing the damage
;762:attacker	entity that caused the inflictor to damage targ
;763:    example: targ=monster, inflictor=rocket, attacker=player
;764:
;765:dir			direction of the attack for knockback
;766:point		point at which the damage is being inflicted, used for headshots
;767:damage		amount of damage being inflicted
;768:knockback	force to be applied against targ as a result of the damage
;769:
;770:inflictor, attacker, dir, and point can be NULL for environmental effects
;771:
;772:dflags		these flags are used to control how T_Damage works
;773:    DAMAGE_RADIUS			damage was indirect (from a nearby explosion)
;774:    DAMAGE_NO_ARMOR			armor does not protect from this damage
;775:    DAMAGE_NO_KNOCKBACK		do not affect velocity, just view angles
;776:    DAMAGE_NO_PROTECTION	kills godmode, armor, everything
;777:============
;778:*/
;779:
;780:void G_Damage(gentity_t* targ, gentity_t* inflictor, gentity_t* attacker, vec3_t dir, vec3_t point, int damage, int dflags, int mod) {
line 790
;781:	gclient_t* client;
;782:	int        take;
;783:	int        asave;
;784:	int        knockback;
;785:	int        max;
;786:#ifdef MISSIONPACK
;787:	vec3_t bouncedir, impactpoint;
;788:#endif
;789:
;790:	if (!targ->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $272
line 791
;791:		return;
ADDRGP4 $271
JUMPV
LABELV $272
line 796
;792:	}
;793:
;794:	// the intermission has allready been qualified for, so don't
;795:	// allow any extra scoring
;796:	if (level.intermissionQueued) {
ADDRGP4 level+7600
INDIRI4
CNSTI4 0
EQI4 $274
line 797
;797:		return;
ADDRGP4 $271
JUMPV
LABELV $274
line 809
;798:	}
;799:#ifdef MISSIONPACK
;800:	if (targ->client && mod != MOD_JUICED) {
;801:		if (targ->client->invulnerabilityTime > level.time) {
;802:			if (dir && point) {
;803:				G_InvulnerabilityEffect(targ, dir, point, impactpoint, bouncedir);
;804:			}
;805:			return;
;806:		}
;807:	}
;808:#endif
;809:	if (!inflictor) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $277
line 810
;810:		inflictor = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 4
ADDRGP4 g_entities+833952
ASGNP4
line 811
;811:	}
LABELV $277
line 812
;812:	if (!attacker) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $280
line 813
;813:		attacker = &g_entities[ENTITYNUM_WORLD];
ADDRFP4 8
ADDRGP4 g_entities+833952
ASGNP4
line 814
;814:	}
LABELV $280
line 817
;815:
;816:	// shootable doors / buttons don't actually have any health
;817:	if (targ->s.eType == ET_MOVER) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 4
NEI4 $283
line 818
;818:		if (targ->use && targ->moverState == MOVER_POS1) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $271
ADDRLP4 20
INDIRP4
CNSTI4 576
ADDP4
INDIRI4
CNSTI4 0
NEI4 $271
line 819
;819:			targ->use(targ, inflictor, attacker);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
CNSTI4 708
ADDP4
INDIRP4
CALLV
pop
line 820
;820:		}
line 821
;821:		return;
ADDRGP4 $271
JUMPV
LABELV $283
line 830
;822:	}
;823:#ifdef MISSIONPACK
;824:	if (g_gametype.integer == GT_OBELISK && CheckObeliskAttack(targ, attacker)) {
;825:		return;
;826:	}
;827:#endif
;828:	// reduce damage by the attacker's handicap value
;829:	// unless they are rocket jumping
;830:	if (attacker->client && attacker != targ) {
ADDRLP4 20
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $287
ADDRLP4 20
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
EQU4 $287
line 831
;831:		max = attacker->client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 16
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
ASGNI4
line 837
;832:#ifdef MISSIONPACK
;833:		if (bg_itemlist[attacker->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD) {
;834:			max /= 2;
;835:		}
;836:#endif
;837:		damage = damage * max / 100;
ADDRFP4 20
ADDRFP4 20
INDIRI4
ADDRLP4 16
INDIRI4
MULI4
CNSTI4 100
DIVI4
ASGNI4
line 838
;838:	}
LABELV $287
line 840
;839:
;840:	client = targ->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 842
;841:
;842:	if (client) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $289
line 843
;843:		if (client->noclip) {
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $291
line 844
;844:			return;
ADDRGP4 $271
JUMPV
LABELV $291
line 846
;845:		}
;846:	}
LABELV $289
line 848
;847:
;848:	if (!dir) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $293
line 849
;849:		dflags |= DAMAGE_NO_KNOCKBACK;
ADDRFP4 24
ADDRFP4 24
INDIRI4
CNSTI4 4
BORI4
ASGNI4
line 850
;850:	} else {
ADDRGP4 $294
JUMPV
LABELV $293
line 851
;851:		VectorNormalize(dir);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 852
;852:	}
LABELV $294
line 854
;853:
;854:	knockback = damage;
ADDRLP4 4
ADDRFP4 20
INDIRI4
ASGNI4
line 855
;855:	if (knockback > 200) {
ADDRLP4 4
INDIRI4
CNSTI4 200
LEI4 $295
line 856
;856:		knockback = 200;
ADDRLP4 4
CNSTI4 200
ASGNI4
line 857
;857:	}
LABELV $295
line 858
;858:	if (targ->flags & FL_NO_KNOCKBACK) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $297
line 859
;859:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 860
;860:	}
LABELV $297
line 861
;861:	if (dflags & DAMAGE_NO_KNOCKBACK) {
ADDRFP4 24
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
EQI4 $299
line 862
;862:		knockback = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 863
;863:	}
LABELV $299
line 866
;864:
;865:	// figure momentum add, even if the damage won't be taken
;866:	if (knockback && targ->client) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $301
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $301
line 872
;867:		vec3_t kvel;
;868:		float  mass;
;869:		float scale;
;870:		float kvel_z;
;871:
;872:		mass = 200;
ADDRLP4 36
CNSTF4 1128792064
ASGNF4
line 874
;873:
;874:		scale = 1;  // Default knockback scaling
ADDRLP4 40
CNSTF4 1065353216
ASGNF4
line 876
;875:		// Increased rocket knockback for CPM
;876:		if ((targ == attacker) && (mod == MOD_ROCKET_SPLASH || mod == MOD_ROCKET) && (phy_movetype.integer == 0)) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $303
ADDRLP4 48
ADDRFP4 28
INDIRI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 7
EQI4 $306
ADDRLP4 48
INDIRI4
CNSTI4 6
NEI4 $303
LABELV $306
ADDRGP4 phy_movetype+12
INDIRI4
CNSTI4 0
NEI4 $303
line 877
;877:			scale = 1.2;
ADDRLP4 40
CNSTF4 1067030938
ASGNF4
line 878
;878:		}
LABELV $303
line 880
;879:		// Calculate vertical knockback without scale
;880:		kvel_z = dir[2] * g_knockback.value * (float)knockback / mass;
ADDRLP4 44
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
MULF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDRLP4 36
INDIRF4
DIVF4
ASGNF4
line 881
;881:		VectorScale(dir, scale * g_knockback.value * (float)knockback / mass, kvel);
ADDRLP4 52
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 56
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 60
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 64
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 52
INDIRP4
INDIRF4
ADDRLP4 56
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
MULF4
ADDRLP4 60
INDIRF4
MULF4
ADDRLP4 64
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 56
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
MULF4
ADDRLP4 60
INDIRF4
MULF4
ADDRLP4 64
INDIRF4
DIVF4
MULF4
ASGNF4
ADDRLP4 24+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 40
INDIRF4
ADDRGP4 g_knockback+8
INDIRF4
MULF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ADDRLP4 36
INDIRF4
DIVF4
MULF4
ASGNF4
line 882
;882:		kvel[2] = kvel_z;  // Restore vertical scale
ADDRLP4 24+8
ADDRLP4 44
INDIRF4
ASGNF4
line 884
;883:
;884:		VectorAdd(targ->client->ps.velocity, kvel, targ->client->ps.velocity);
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
ADDF4
ASGNF4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 72
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 24+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 76
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 24+8
INDIRF4
ADDF4
ASGNF4
line 888
;885:
;886:		// set the timer so that the other client can't cancel
;887:		// out the movement immediately
;888:		if (!targ->client->ps.pm_time) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
NEI4 $316
line 891
;889:			int t;
;890:
;891:			t = knockback * 2;
ADDRLP4 80
ADDRLP4 4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 892
;892:			if (t < 50) {
ADDRLP4 80
INDIRI4
CNSTI4 50
GEI4 $318
line 893
;893:				t = 50;
ADDRLP4 80
CNSTI4 50
ASGNI4
line 894
;894:			}
LABELV $318
line 895
;895:			if (t > 200) {
ADDRLP4 80
INDIRI4
CNSTI4 200
LEI4 $320
line 896
;896:				t = 200;
ADDRLP4 80
CNSTI4 200
ASGNI4
line 897
;897:			}
LABELV $320
line 898
;898:			targ->client->ps.pm_time = t;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 80
INDIRI4
ASGNI4
line 899
;899:			targ->client->ps.pm_flags |= PMF_TIME_KNOCKBACK;
ADDRLP4 84
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 84
INDIRP4
ADDRLP4 84
INDIRP4
INDIRI4
CNSTI4 64
BORI4
ASGNI4
line 900
;900:		}
LABELV $316
line 901
;901:	}
LABELV $301
line 904
;902:
;903:	// check for completely getting out of the damage
;904:	if (!(dflags & DAMAGE_NO_PROTECTION)) {
ADDRFP4 24
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $322
line 911
;905:
;906:		// if TF_NO_FRIENDLY_FIRE is set, don't do damage to the target
;907:		// if the attacker was on the same team
;908:#ifdef MISSIONPACK
;909:		if (mod != MOD_JUICED && targ != attacker && !(dflags & DAMAGE_NO_TEAM_PROTECTION) && OnSameTeam(targ, attacker)) {
;910:#else
;911:		if (targ != attacker && OnSameTeam(targ, attacker)) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRP4
CVPU4 4
EQU4 $324
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
EQI4 $324
line 913
;912:#endif
;913:			if (!g_friendlyFire.integer) {
ADDRGP4 g_friendlyFire+12
INDIRI4
CNSTI4 0
NEI4 $326
line 914
;914:				return;
ADDRGP4 $271
JUMPV
LABELV $326
line 916
;915:			}
;916:		}
LABELV $324
line 929
;917:#ifdef MISSIONPACK
;918:		if (mod == MOD_PROXIMITY_MINE) {
;919:			if (inflictor && inflictor->parent && OnSameTeam(targ, inflictor->parent)) {
;920:				return;
;921:			}
;922:			if (targ == attacker) {
;923:				return;
;924:			}
;925:		}
;926:#endif
;927:
;928:		// check for godmode
;929:		if (targ->flags & FL_GODMODE) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $329
line 930
;930:			return;
ADDRGP4 $271
JUMPV
LABELV $329
line 932
;931:		}
;932:	}
LABELV $322
line 936
;933:
;934:	// battlesuit protects from all radius damage (but takes knockback)
;935:	// and protects 50% against all damage
;936:	if (client && client->ps.powerups[PW_BATTLESUIT]) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $331
ADDRLP4 0
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
CNSTI4 0
EQI4 $331
line 937
;937:		G_AddEvent(targ, EV_POWERUP_BATTLESUIT, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 62
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 938
;938:		if ((dflags & DAMAGE_RADIUS) || (mod == MOD_FALLING)) {
ADDRFP4 24
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $335
ADDRFP4 28
INDIRI4
CNSTI4 19
NEI4 $333
LABELV $335
line 939
;939:			return;
ADDRGP4 $271
JUMPV
LABELV $333
line 941
;940:		}
;941:		damage *= 0.5;
ADDRFP4 20
ADDRFP4 20
INDIRI4
CVIF4 4
CNSTF4 1056964608
MULF4
CVFI4 4
ASGNI4
line 942
;942:	}
LABELV $331
line 946
;943:
;944:	// always give half damage if hurting self
;945:	// calculated after knockback, so rocket jumping works
;946:	if (targ == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 8
INDIRP4
CVPU4 4
NEU4 $336
line 947
;947:		damage *= 0.5;
ADDRFP4 20
ADDRFP4 20
INDIRI4
CVIF4 4
CNSTF4 1056964608
MULF4
CVFI4 4
ASGNI4
line 948
;948:	}
LABELV $336
line 950
;949:
;950:	if (damage < 1) {
ADDRFP4 20
INDIRI4
CNSTI4 1
GEI4 $338
line 951
;951:		damage = 1;
ADDRFP4 20
CNSTI4 1
ASGNI4
line 952
;952:	}
LABELV $338
line 953
;953:	take = damage;
ADDRLP4 8
ADDRFP4 20
INDIRI4
ASGNI4
line 956
;954:
;955:	// save some from armor
;956:	asave = CheckArmor(targ, take, dflags);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 CheckArmor
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 958
;957:
;958:	take -= asave;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
SUBI4
ASGNI4
line 960
;959:
;960:	if (g_debugDamage.integer) {
ADDRGP4 g_debugDamage+12
INDIRI4
CNSTI4 0
EQI4 $340
line 961
;961:		G_Printf("%i: client:%i health:%i damage:%i armor:%i\n", level.time, targ->s.number, targ->health, take, asave);
ADDRGP4 $343
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
INDIRI4
ARGI4
ADDRLP4 32
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRGP4 G_Printf
CALLV
pop
line 962
;962:	}
LABELV $340
line 965
;963:
;964:	// add to the attacker's hit counter (if the target isn't a general entity like a prox mine)
;965:	if (attacker->client && client && targ != attacker && targ->health > 0 && targ->s.eType != ET_MISSILE && targ->s.eType != ET_GENERAL) {
ADDRLP4 32
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $345
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $345
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CVPU4 4
ADDRLP4 32
INDIRP4
CVPU4 4
EQU4 $345
ADDRLP4 36
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
LEI4 $345
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $345
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $345
line 976
;966:#ifdef MISSIONPACK
;967:		if (OnSameTeam(targ, attacker)) {
;968:			attacker->client->ps.persistant[PERS_HITS]--;
;969:		} else {
;970:			attacker->client->ps.persistant[PERS_HITS]++;
;971:		}
;972:		attacker->client->ps.persistant[PERS_ATTACKEE_ARMOR] = (targ->health << 8) | (client->ps.stats[STAT_ARMOR]);
;973:#else
;974:		// we may hit multiple targets from different teams
;975:		// so usual PERS_HITS increments/decrements could result in ZERO delta
;976:		if (OnSameTeam(targ, attacker)) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 OnSameTeam
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $347
line 977
;977:			attacker->client->damage.team++;
ADDRLP4 44
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1556
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 978
;978:		} else {
ADDRGP4 $348
JUMPV
LABELV $347
line 979
;979:			attacker->client->damage.enemy++;
ADDRLP4 44
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1560
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 981
;980:			// accumulate damage during server frame
;981:			attacker->client->damage.amount += take + asave;
ADDRLP4 48
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 1564
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ADDI4
ASGNI4
line 982
;982:		}
LABELV $348
line 984
;983:#endif
;984:	}
LABELV $345
line 989
;985:
;986:	// add to the damage inflicted on a player this frame
;987:	// the total will be turned into screen blends and view angle kicks
;988:	// at the end of the frame
;989:	if (client) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $349
line 990
;990:		if (attacker) {  // FIXME: always true?
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $351
line 991
;991:			client->ps.persistant[PERS_ATTACKER] = attacker->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 992
;992:		} else {
ADDRGP4 $352
JUMPV
LABELV $351
line 993
;993:			client->ps.persistant[PERS_ATTACKER] = ENTITYNUM_WORLD;
ADDRLP4 0
INDIRP4
CNSTI4 272
ADDP4
CNSTI4 1022
ASGNI4
line 994
;994:		}
LABELV $352
line 995
;995:		client->damage_armor += asave;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
ADDRLP4 12
INDIRI4
ADDI4
ASGNI4
line 996
;996:		client->damage_blood += take;
ADDRLP4 44
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 997
;997:		client->damage_knockback += knockback;
ADDRLP4 48
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 998
;998:		if (dir) {
ADDRFP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $353
line 999
;999:			VectorCopy(dir, client->damage_from);
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRFP4 12
INDIRP4
INDIRB
ASGNB 12
line 1000
;1000:			client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 0
ASGNI4
line 1001
;1001:		} else {
ADDRGP4 $354
JUMPV
LABELV $353
line 1002
;1002:			VectorCopy(targ->r.currentOrigin, client->damage_from);
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 1003
;1003:			client->damage_fromWorld = qtrue;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 1
ASGNI4
line 1004
;1004:		}
LABELV $354
line 1005
;1005:	}
LABELV $349
line 1011
;1006:
;1007:	// See if it's the player hurting the emeny flag carrier
;1008:#ifdef MISSIONPACK
;1009:	if (g_gametype.integer == GT_CTF || g_gametype.integer == GT_1FCTF) {
;1010:#else
;1011:	if (g_gametype.integer == GT_CTF) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 4
NEI4 $355
line 1013
;1012:#endif
;1013:		Team_CheckHurtCarrier(targ, attacker);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Team_CheckHurtCarrier
CALLV
pop
line 1014
;1014:	}
LABELV $355
line 1016
;1015:
;1016:	if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $358
line 1018
;1017:		// set the last client who damaged the target
;1018:		targ->client->lasthurt_client = attacker->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 732
ADDP4
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 1019
;1019:		targ->client->lasthurt_mod    = mod;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 736
ADDP4
ADDRFP4 28
INDIRI4
ASGNI4
line 1020
;1020:	}
LABELV $358
line 1023
;1021:
;1022:	// do the damage
;1023:	if (take) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $360
line 1024
;1024:		targ->health = targ->health - take;
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1025
;1025:		if (targ->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $362
line 1026
;1026:			targ->client->ps.stats[STAT_HEALTH] = targ->health;
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 44
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 1027
;1027:		}
LABELV $362
line 1029
;1028:
;1029:		if (targ->health <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
GTI4 $364
line 1030
;1030:			if (client)
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $366
line 1031
;1031:				targ->flags |= FL_NO_KNOCKBACK;
ADDRLP4 44
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 44
INDIRP4
ADDRLP4 44
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
LABELV $366
line 1033
;1032:
;1033:			if (targ->health < -999)
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 -999
GEI4 $368
line 1034
;1034:				targ->health = -999;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
CNSTI4 -999
ASGNI4
LABELV $368
line 1036
;1035:
;1036:			targ->enemy = attacker;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 1037
;1037:			targ->die(targ, inflictor, attacker, take, mod);
ADDRLP4 48
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 48
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 48
INDIRP4
CNSTI4 716
ADDP4
INDIRP4
CALLV
pop
line 1038
;1038:			return;
ADDRGP4 $271
JUMPV
LABELV $364
line 1039
;1039:		} else if (targ->pain) {
ADDRFP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $370
line 1040
;1040:			targ->pain(targ, attacker, take);
ADDRLP4 44
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 44
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 44
INDIRP4
CNSTI4 712
ADDP4
INDIRP4
CALLV
pop
line 1041
;1041:		}
LABELV $370
line 1042
;1042:	}
LABELV $360
line 1043
;1043:}
LABELV $271
endproc G_Damage 88 24
export CanDamage
proc CanDamage 144 28
line 1053
;1044:
;1045:/*
;1046:============
;1047:CanDamage
;1048:
;1049:Returns qtrue if the inflictor can directly damage the target.  Used for
;1050:explosions and melee attacks.
;1051:============
;1052:*/
;1053:qboolean CanDamage(gentity_t* targ, vec3_t origin) {
line 1061
;1054:	// we check if the attacker can damage the target, return qtrue if yes, qfalse if no
;1055:	vec3_t  dest;
;1056:	trace_t tr;
;1057:	vec3_t  midpoint;
;1058:	vec3_t  size;
;1059:
;1060:	// use the midpoint of the bounds instead of the origin, because bmodels may have their origin 0,0,0
;1061:	VectorAdd(targ->r.absmin, targ->r.absmax, midpoint);
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80
ADDRLP4 92
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 80+4
ADDRLP4 92
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 92
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 96
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 80+8
ADDRLP4 96
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 96
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
line 1062
;1062:	VectorScale(midpoint, 0.5, dest);
ADDRLP4 0
ADDRLP4 80
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 80+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1064
;1063:
;1064:	trap_Trace(&tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 100
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1065
;1065:	if (tr.fraction == 1.0 || tr.entityNum == targ->s.number)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
EQF4 $383
ADDRLP4 12+52
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
NEI4 $379
LABELV $383
line 1066
;1066:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $372
JUMPV
LABELV $379
line 1068
;1067:
;1068:	VectorSubtract(targ->r.absmax, targ->r.absmin, size);
ADDRLP4 104
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
ADDRLP4 104
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 104
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDRLP4 104
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 108
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68+8
ADDRLP4 108
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDRLP4 108
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1074
;1069:
;1070:	// top quad
;1071:
;1072:	// - +
;1073:	// - -
;1074:	VectorCopy(targ->r.absmax, dest);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 476
ADDP4
INDIRB
ASGNB 12
line 1075
;1075:	trap_Trace(&tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 112
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1076
;1076:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $386
line 1077
;1077:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $372
JUMPV
LABELV $386
line 1081
;1078:
;1079:	// + -
;1080:	// - -
;1081:	dest[0] -= size[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
ASGNF4
line 1082
;1082:	trap_Trace(&tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1083
;1083:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $389
line 1084
;1084:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $372
JUMPV
LABELV $389
line 1088
;1085:
;1086:	// - -
;1087:	// + -
;1088:	dest[1] -= size[1];
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 68+4
INDIRF4
SUBF4
ASGNF4
line 1089
;1089:	trap_Trace(&tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 120
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 120
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1090
;1090:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $394
line 1091
;1091:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $372
JUMPV
LABELV $394
line 1095
;1092:
;1093:	// - -
;1094:	// - +
;1095:	dest[0] += size[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ASGNF4
line 1096
;1096:	trap_Trace(&tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 124
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1097
;1097:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $397
line 1098
;1098:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $372
JUMPV
LABELV $397
line 1104
;1099:
;1100:	// bottom quad
;1101:
;1102:	// - -
;1103:	// + -
;1104:	VectorCopy(targ->r.absmin, dest);
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRB
ASGNB 12
line 1105
;1105:	trap_Trace(&tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 128
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1106
;1106:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $400
line 1107
;1107:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $372
JUMPV
LABELV $400
line 1111
;1108:
;1109:	// - -
;1110:	// - +
;1111:	dest[0] += size[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ASGNF4
line 1112
;1112:	trap_Trace(&tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 132
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 132
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1113
;1113:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $403
line 1114
;1114:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $372
JUMPV
LABELV $403
line 1118
;1115:
;1116:	// - +
;1117:	// - -
;1118:	dest[1] += size[1];
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 68+4
INDIRF4
ADDF4
ASGNF4
line 1119
;1119:	trap_Trace(&tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 136
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1120
;1120:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $408
line 1121
;1121:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $372
JUMPV
LABELV $408
line 1125
;1122:
;1123:	// + -
;1124:	// - -
;1125:	dest[0] -= size[0];
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 68
INDIRF4
SUBF4
ASGNF4
line 1126
;1126:	trap_Trace(&tr, origin, vec3_origin, vec3_origin, dest, ENTITYNUM_NONE, MASK_SOLID);
ADDRLP4 12
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 140
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 1023
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 1127
;1127:	if (tr.fraction == 1.0)
ADDRLP4 12+8
INDIRF4
CNSTF4 1065353216
NEF4 $411
line 1128
;1128:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $372
JUMPV
LABELV $411
line 1130
;1129:
;1130:	return qfalse;
CNSTI4 0
RETI4
LABELV $372
endproc CanDamage 144 28
export G_RadiusDamage
proc G_RadiusDamage 4196 32
line 1138
;1131:}
;1132:
;1133:/*
;1134:============
;1135:G_RadiusDamage
;1136:============
;1137:*/
;1138:qboolean G_RadiusDamage(vec3_t origin, gentity_t* attacker, float damage, float radius, gentity_t* ignore, int mod) {
line 1147
;1139:	float      points, dist;
;1140:	gentity_t* ent;
;1141:	int        entityList[MAX_GENTITIES];
;1142:	int        numListedEntities;
;1143:	vec3_t     mins, maxs;
;1144:	vec3_t     v;
;1145:	vec3_t     dir;
;1146:	int        i, e;
;1147:	qboolean   hitClient = qfalse;
ADDRLP4 4168
CNSTI4 0
ASGNI4
line 1149
;1148:
;1149:	if (radius < 1) {
ADDRFP4 12
INDIRF4
CNSTF4 1065353216
GEF4 $415
line 1150
;1150:		radius = 1;
ADDRFP4 12
CNSTF4 1065353216
ASGNF4
line 1151
;1151:	}
LABELV $415
line 1153
;1152:
;1153:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $417
line 1154
;1154:		mins[i] = origin[i] - radius;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4144
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
SUBF4
ASGNF4
line 1155
;1155:		maxs[i] = origin[i] + radius;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4156
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ASGNF4
line 1156
;1156:	}
LABELV $418
line 1153
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $417
line 1158
;1157:
;1158:	numListedEntities = trap_EntitiesInBox(mins, maxs, entityList, MAX_GENTITIES);
ADDRLP4 4144
ARGP4
ADDRLP4 4156
ARGP4
ADDRLP4 44
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4172
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 4140
ADDRLP4 4172
INDIRI4
ASGNI4
line 1160
;1159:
;1160:	for (e = 0; e < numListedEntities; e++) {
ADDRLP4 20
CNSTI4 0
ASGNI4
ADDRGP4 $424
JUMPV
LABELV $421
line 1161
;1161:		ent = &g_entities[entityList[e]];
ADDRLP4 4
ADDRLP4 20
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 44
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1163
;1162:
;1163:		if (ent == ignore)
ADDRLP4 4
INDIRP4
CVPU4 4
ADDRFP4 16
INDIRP4
CVPU4 4
NEU4 $425
line 1164
;1164:			continue;
ADDRGP4 $422
JUMPV
LABELV $425
line 1165
;1165:		if (!ent->takedamage)
ADDRLP4 4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $427
line 1166
;1166:			continue;
ADDRGP4 $422
JUMPV
LABELV $427
line 1169
;1167:
;1168:		// find the distance from the edge of the bounding box
;1169:		for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $429
line 1170
;1170:			if (origin[i] < ent->r.absmin[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 464
ADDP4
ADDP4
INDIRF4
GEF4 $433
line 1171
;1171:				v[i] = ent->r.absmin[i] - origin[i];
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
CNSTI4 464
ADDP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1172
;1172:			} else if (origin[i] > ent->r.absmax[i]) {
ADDRGP4 $434
JUMPV
LABELV $433
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
LEF4 $435
line 1173
;1173:				v[i] = origin[i] - ent->r.absmax[i];
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
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
INDIRP4
CNSTI4 476
ADDP4
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1174
;1174:			} else {
ADDRGP4 $436
JUMPV
LABELV $435
line 1175
;1175:				v[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
ADDP4
CNSTF4 0
ASGNF4
line 1176
;1176:			}
LABELV $436
LABELV $434
line 1177
;1177:		}
LABELV $430
line 1169
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $429
line 1179
;1178:
;1179:		dist = VectorLength(v);
ADDRLP4 8
ARGP4
ADDRLP4 4176
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
ADDRLP4 4176
INDIRF4
ASGNF4
line 1180
;1180:		if (dist >= radius) {
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
LTF4 $437
line 1181
;1181:			continue;
ADDRGP4 $422
JUMPV
LABELV $437
line 1184
;1182:		}
;1183:
;1184:		points = damage * (1.0 - dist / radius);
ADDRLP4 40
ADDRFP4 8
INDIRF4
CNSTF4 1065353216
ADDRLP4 24
INDIRF4
ADDRFP4 12
INDIRF4
DIVF4
SUBF4
MULF4
ASGNF4
line 1186
;1185:
;1186:		if (CanDamage(ent, origin)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4180
ADDRGP4 CanDamage
CALLI4
ASGNI4
ADDRLP4 4180
INDIRI4
CNSTI4 0
EQI4 $439
line 1187
;1187:			if (LogAccuracyHit(ent, attacker)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4184
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 4184
INDIRI4
CNSTI4 0
EQI4 $441
line 1188
;1188:				hitClient = qtrue;
ADDRLP4 4168
CNSTI4 1
ASGNI4
line 1189
;1189:			}
LABELV $441
line 1190
;1190:			VectorSubtract(ent->r.currentOrigin, origin, dir);
ADDRLP4 4192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 4192
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 28+8
ADDRLP4 4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 1193
;1191:			// push the center of mass higher than the origin so players
;1192:			// get knocked into the air more
;1193:			dir[2] += 24;
ADDRLP4 28+8
ADDRLP4 28+8
INDIRF4
CNSTF4 1103101952
ADDF4
ASGNF4
line 1194
;1194:			G_Damage(ent, NULL, attacker, dir, origin, (int)points, DAMAGE_RADIUS, mod);
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 40
INDIRF4
CVFI4 4
ARGI4
CNSTI4 1
ARGI4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 1195
;1195:		}
LABELV $439
line 1196
;1196:	}
LABELV $422
line 1160
ADDRLP4 20
ADDRLP4 20
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $424
ADDRLP4 20
INDIRI4
ADDRLP4 4140
INDIRI4
LTI4 $421
line 1198
;1197:
;1198:	return hitClient;
ADDRLP4 4168
INDIRI4
RETI4
LABELV $414
endproc G_RadiusDamage 4196 32
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
import G_InvulnerabilityEffect
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
LABELV $343
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 58
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $240
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 83
byte 1 116
byte 1 111
byte 1 112
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $200
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 37
byte 1 105
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 98
byte 1 121
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $199
byte 1 60
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 111
byte 1 98
byte 1 105
byte 1 116
byte 1 117
byte 1 97
byte 1 114
byte 1 121
byte 1 62
byte 1 0
align 1
LABELV $193
byte 1 60
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 62
byte 1 0
align 1
LABELV $192
byte 1 60
byte 1 110
byte 1 111
byte 1 110
byte 1 45
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 62
byte 1 0
align 1
LABELV $171
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $170
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $150
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
byte 1 0
align 1
LABELV $149
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
byte 1 0
align 1
LABELV $138
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 80
byte 1 76
byte 1 69
byte 1 0
align 1
LABELV $137
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 82
byte 1 73
byte 1 71
byte 1 71
byte 1 69
byte 1 82
byte 1 95
byte 1 72
byte 1 85
byte 1 82
byte 1 84
byte 1 0
align 1
LABELV $136
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 65
byte 1 82
byte 1 71
byte 1 69
byte 1 84
byte 1 95
byte 1 76
byte 1 65
byte 1 83
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $135
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 85
byte 1 73
byte 1 67
byte 1 73
byte 1 68
byte 1 69
byte 1 0
align 1
LABELV $134
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 70
byte 1 65
byte 1 76
byte 1 76
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $133
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 84
byte 1 69
byte 1 76
byte 1 69
byte 1 70
byte 1 82
byte 1 65
byte 1 71
byte 1 0
align 1
LABELV $132
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 67
byte 1 82
byte 1 85
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $131
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 76
byte 1 65
byte 1 86
byte 1 65
byte 1 0
align 1
LABELV $130
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 76
byte 1 73
byte 1 77
byte 1 69
byte 1 0
align 1
LABELV $129
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 87
byte 1 65
byte 1 84
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $128
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $127
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 66
byte 1 70
byte 1 71
byte 1 0
align 1
LABELV $126
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 76
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $125
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 65
byte 1 73
byte 1 76
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $124
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 77
byte 1 65
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $123
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 77
byte 1 65
byte 1 0
align 1
LABELV $122
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $121
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 82
byte 1 79
byte 1 67
byte 1 75
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $120
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 95
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 83
byte 1 72
byte 1 0
align 1
LABELV $119
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 82
byte 1 69
byte 1 78
byte 1 65
byte 1 68
byte 1 69
byte 1 0
align 1
LABELV $118
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 77
byte 1 65
byte 1 67
byte 1 72
byte 1 73
byte 1 78
byte 1 69
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $117
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 71
byte 1 65
byte 1 85
byte 1 78
byte 1 84
byte 1 76
byte 1 69
byte 1 84
byte 1 0
align 1
LABELV $116
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 83
byte 1 72
byte 1 79
byte 1 84
byte 1 71
byte 1 85
byte 1 78
byte 1 0
align 1
LABELV $115
byte 1 77
byte 1 79
byte 1 68
byte 1 95
byte 1 85
byte 1 78
byte 1 75
byte 1 78
byte 1 79
byte 1 87
byte 1 78
byte 1 0
