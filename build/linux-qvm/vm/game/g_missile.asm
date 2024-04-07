export G_BounceMissile
code
proc G_BounceMissile 40 12
file "../../../../code/game/g_missile.c"
line 13
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:#define MISSILE_PRESTEP_TIME 50
;6:
;7:/*
;8:================
;9:G_BounceMissile
;10:
;11:================
;12:*/
;13:void G_BounceMissile(gentity_t* ent, trace_t* trace) {
line 19
;14:	vec3_t velocity;
;15:	float  dot;
;16:	int    hitTime;
;17:
;18:	// reflect the velocity on the trace plane
;19:	hitTime = level.previousTime + (level.time - level.previousTime) * trace->fraction;
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
line 20
;20:	BG_EvaluateTrajectoryDelta(&ent->s.pos, hitTime, velocity);
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
line 21
;21:	dot = DotProduct(velocity, trace->plane.normal);
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
line 22
;22:	VectorMA(velocity, -2 * dot, trace->plane.normal, ent->s.pos.trDelta);
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
line 24
;23:
;24:	if (ent->s.eFlags & EF_BOUNCE_HALF) {
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 32
BANDI4
CNSTI4 0
EQI4 $62
line 25
;25:		VectorScale(ent->s.pos.trDelta, 0.65, ent->s.pos.trDelta);
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
CNSTF4 1059481190
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
CNSTF4 1059481190
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
CNSTF4 1059481190
MULF4
ASGNF4
line 27
;26:		// check for stop
;27:		if (trace->plane.normal[2] > 0.2 && VectorLength(ent->s.pos.trDelta) < 40) {
ADDRFP4 4
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CNSTF4 1045220557
LEF4 $64
ADDRFP4 0
INDIRP4
CNSTI4 36
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 36
INDIRF4
CNSTF4 1109393408
GEF4 $64
line 28
;28:			G_SetOrigin(ent, trace->endpos);
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
line 29
;29:			ent->s.time = level.time / 4;
ADDRFP4 0
INDIRP4
CNSTI4 84
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 4
DIVI4
ASGNI4
line 30
;30:			return;
ADDRGP4 $54
JUMPV
LABELV $64
line 32
;31:		}
;32:	}
LABELV $62
line 34
;33:
;34:	VectorAdd(ent->r.currentOrigin, trace->plane.normal, ent->r.currentOrigin);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 24
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
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 492
ADDP4
ADDRLP4 28
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
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 496
ADDP4
ADDRLP4 32
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
line 35
;35:	VectorCopy(ent->r.currentOrigin, ent->s.pos.trBase);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 36
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 36
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 36
;36:	ent->s.pos.trTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 37
;37:}
LABELV $54
endproc G_BounceMissile 40 12
export G_ExplodeMissile
proc G_ExplodeMissile 44 24
line 46
;38:
;39:/*
;40:================
;41:G_ExplodeMissile
;42:
;43:Explode a missile without an impact
;44:================
;45:*/
;46:void G_ExplodeMissile(gentity_t* ent) {
line 50
;47:	vec3_t dir;
;48:	vec3_t origin;
;49:
;50:	BG_EvaluateTrajectory(&ent->s.pos, level.time, origin);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 51
;51:	SnapVector(origin);
ADDRLP4 0
ADDRLP4 0
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 52
;52:	G_SetOrigin(ent, origin);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 55
;53:
;54:	// we don't have a valid direction, so just point straight up
;55:	dir[0] = dir[1] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
ADDRLP4 12+4
ADDRLP4 24
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 24
INDIRF4
ASGNF4
line 56
;56:	dir[2]          = 1;
ADDRLP4 12+8
CNSTF4 1065353216
ASGNF4
line 58
;57:
;58:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 59
;59:	G_AddEvent(ent, EV_MISSILE_MISS, DirToByte(dir));
ADDRLP4 12
ARGP4
ADDRLP4 28
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 28
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 61
;60:
;61:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 64
;62:
;63:	// splash damage
;64:	if (ent->splashDamage) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $76
line 65
;65:		if (G_RadiusDamage(ent->r.currentOrigin, ent->parent, ent->splashDamage, ent->splashRadius, ent, ent->splashMethodOfDeath)) {
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
ARGP4
ADDRLP4 32
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $78
line 66
;66:			g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 40
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 40
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 67
;67:		}
LABELV $78
line 68
;68:	}
LABELV $76
line 70
;69:
;70:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 71
;71:}
LABELV $68
endproc G_ExplodeMissile 44 24
export G_MissileImpact
proc G_MissileImpact 52 32
line 244
;72:
;73:#ifdef MISSIONPACK
;74:/*
;75:================
;76:ProximityMine_Explode
;77:================
;78:*/
;79:static void ProximityMine_Explode(gentity_t* mine) {
;80:	G_ExplodeMissile(mine);
;81:	// if the prox mine has a trigger free it
;82:	if (mine->activator) {
;83:		G_FreeEntity(mine->activator);
;84:		mine->activator = NULL;
;85:	}
;86:}
;87:
;88:/*
;89:================
;90:ProximityMine_Die
;91:================
;92:*/
;93:static void ProximityMine_Die(gentity_t* ent, gentity_t* inflictor, gentity_t* attacker, int damage, int mod) {
;94:	ent->think     = ProximityMine_Explode;
;95:	ent->nextthink = level.time + 1;
;96:}
;97:
;98:/*
;99:================
;100:ProximityMine_Trigger
;101:================
;102:*/
;103:void ProximityMine_Trigger(gentity_t* trigger, gentity_t* other, trace_t* trace) {
;104:	vec3_t     v;
;105:	gentity_t* mine;
;106:
;107:	if (!other->client) {
;108:		return;
;109:	}
;110:
;111:	// trigger is a cube, do a distance test now to act as if it's a sphere
;112:	VectorSubtract(trigger->s.pos.trBase, other->s.pos.trBase, v);
;113:	if (VectorLength(v) > trigger->parent->splashRadius) {
;114:		return;
;115:	}
;116:
;117:	if (g_gametype.integer >= GT_TEAM) {
;118:		// don't trigger same team mines
;119:		if (trigger->parent->s.generic1 == other->client->sess.sessionTeam) {
;120:			return;
;121:		}
;122:	}
;123:
;124:	// ok, now check for ability to damage so we don't get triggered thru walls, closed doors, etc...
;125:	if (!CanDamage(other, trigger->s.pos.trBase)) {
;126:		return;
;127:	}
;128:
;129:	// trigger the mine!
;130:	mine              = trigger->parent;
;131:	mine->s.loopSound = 0;
;132:	G_AddEvent(mine, EV_PROXIMITY_MINE_TRIGGER, 0);
;133:	mine->nextthink = level.time + 500;
;134:
;135:	G_FreeEntity(trigger);
;136:}
;137:
;138:/*
;139:================
;140:ProximityMine_Activate
;141:================
;142:*/
;143:static void ProximityMine_Activate(gentity_t* ent) {
;144:	gentity_t* trigger;
;145:	float      r;
;146:
;147:	ent->think     = ProximityMine_Explode;
;148:	ent->nextthink = level.time + g_proxMineTimeout.integer;
;149:
;150:	ent->takedamage = qtrue;
;151:	ent->health     = 1;
;152:	ent->die        = ProximityMine_Die;
;153:
;154:	ent->s.loopSound = G_SoundIndex("sound/weapons/proxmine/wstbtick.wav");
;155:
;156:	// build the proximity trigger
;157:	trigger = G_Spawn();
;158:
;159:	trigger->classname = "proxmine_trigger";
;160:
;161:	r = ent->splashRadius;
;162:	VectorSet(trigger->r.mins, -r, -r, -r);
;163:	VectorSet(trigger->r.maxs, r, r, r);
;164:
;165:	G_SetOrigin(trigger, ent->s.pos.trBase);
;166:
;167:	trigger->parent     = ent;
;168:	trigger->r.contents = CONTENTS_TRIGGER;
;169:	trigger->touch      = ProximityMine_Trigger;
;170:
;171:	trap_LinkEntity(trigger);
;172:
;173:	// set pointer to trigger so the entity can be freed when the mine explodes
;174:	ent->activator = trigger;
;175:}
;176:
;177:/*
;178:================
;179:ProximityMine_ExplodeOnPlayer
;180:================
;181:*/
;182:static void ProximityMine_ExplodeOnPlayer(gentity_t* mine) {
;183:	gentity_t* player;
;184:
;185:	player = mine->enemy;
;186:	player->client->ps.eFlags &= ~EF_TICKING;
;187:
;188:	if (player->client->invulnerabilityTime > level.time) {
;189:		G_Damage(player, mine->parent, mine->parent, vec3_origin, mine->s.origin, 1000, DAMAGE_NO_KNOCKBACK, MOD_JUICED);
;190:		player->client->invulnerabilityTime = 0;
;191:		G_TempEntity(player->client->ps.origin, EV_JUICED);
;192:	} else {
;193:		G_SetOrigin(mine, player->s.pos.trBase);
;194:		// make sure the explosion gets to the client
;195:		mine->r.svFlags &= ~SVF_NOCLIENT;
;196:		mine->splashMethodOfDeath = MOD_PROXIMITY_MINE;
;197:		G_ExplodeMissile(mine);
;198:	}
;199:}
;200:
;201:/*
;202:================
;203:ProximityMine_Player
;204:================
;205:*/
;206:static void ProximityMine_Player(gentity_t* mine, gentity_t* player) {
;207:	if (mine->s.eFlags & EF_NODRAW) {
;208:		return;
;209:	}
;210:
;211:	G_AddEvent(mine, EV_PROXIMITY_MINE_STICK, 0);
;212:
;213:	if (player->s.eFlags & EF_TICKING) {
;214:		player->activator->splashDamage += mine->splashDamage;
;215:		player->activator->splashRadius *= 1.50;
;216:		mine->think     = G_FreeEntity;
;217:		mine->nextthink = level.time;
;218:		return;
;219:	}
;220:
;221:	player->client->ps.eFlags |= EF_TICKING;
;222:	player->activator = mine;
;223:
;224:	mine->s.eFlags |= EF_NODRAW;
;225:	mine->r.svFlags |= SVF_NOCLIENT;
;226:	mine->s.pos.trType = TR_LINEAR;
;227:	VectorClear(mine->s.pos.trDelta);
;228:
;229:	mine->enemy = player;
;230:	mine->think = ProximityMine_ExplodeOnPlayer;
;231:	if (player->client->invulnerabilityTime > level.time) {
;232:		mine->nextthink = level.time + 2 * 1000;
;233:	} else {
;234:		mine->nextthink = level.time + 10 * 1000;
;235:	}
;236:}
;237:#endif
;238:
;239:/*
;240:================
;241:G_MissileImpact
;242:================
;243:*/
;244:void G_MissileImpact(gentity_t* ent, trace_t* trace) {
line 246
;245:	gentity_t* other;
;246:	qboolean   hitClient = qfalse;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 251
;247:#ifdef MISSIONPACK
;248:	vec3_t forward, impactpoint, bouncedir;
;249:	int    eFlags;
;250:#endif
;251:	other = &g_entities[trace->entityNum];
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 52
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 254
;252:
;253:	// check for bounce
;254:	if (!other->takedamage && (ent->s.eFlags & (EF_BOUNCE | EF_BOUNCE_HALF))) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $82
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 48
BANDI4
CNSTI4 0
EQI4 $82
line 255
;255:		G_BounceMissile(ent, trace);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 G_BounceMissile
CALLV
pop
line 256
;256:		G_AddEvent(ent, EV_GRENADE_BOUNCE, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 44
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 257
;257:		return;
ADDRGP4 $81
JUMPV
LABELV $82
line 281
;258:	}
;259:
;260:#ifdef MISSIONPACK
;261:	if (other->takedamage) {
;262:		if (ent->s.weapon != WP_PROX_LAUNCHER) {
;263:			if (other->client && other->client->invulnerabilityTime > level.time) {
;264:				//
;265:				VectorCopy(ent->s.pos.trDelta, forward);
;266:				VectorNormalize(forward);
;267:				if (G_InvulnerabilityEffect(other, forward, ent->s.pos.trBase, impactpoint, bouncedir)) {
;268:					VectorCopy(bouncedir, trace->plane.normal);
;269:					eFlags = ent->s.eFlags & EF_BOUNCE_HALF;
;270:					ent->s.eFlags &= ~EF_BOUNCE_HALF;
;271:					G_BounceMissile(ent, trace);
;272:					ent->s.eFlags |= eFlags;
;273:				}
;274:				ent->target_ent = other;
;275:				return;
;276:			}
;277:		}
;278:	}
;279:#endif
;280:	// impact damage
;281:	if (other->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $84
line 283
;282:		// FIXME: wrong damage direction?
;283:		if (ent->damage) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
EQI4 $86
line 286
;284:			vec3_t velocity;
;285:
;286:			if (LogAccuracyHit(other, &g_entities[ent->r.ownerNum])) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 20
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $88
line 287
;287:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 288
;288:				hitClient = qtrue;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 289
;289:			}
LABELV $88
line 290
;290:			BG_EvaluateTrajectoryDelta(&ent->s.pos, level.time, velocity);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 8
ARGP4
ADDRGP4 BG_EvaluateTrajectoryDelta
CALLV
pop
line 291
;291:			if (VectorLength(velocity) == 0) {
ADDRLP4 8
ARGP4
ADDRLP4 24
ADDRGP4 VectorLength
CALLF4
ASGNF4
ADDRLP4 24
INDIRF4
CNSTF4 0
NEF4 $92
line 292
;292:				velocity[2] = 1;  // stepped on a grenade
ADDRLP4 8+8
CNSTF4 1065353216
ASGNF4
line 293
;293:			}
LABELV $92
line 294
;294:			G_Damage(other, ent, &g_entities[ent->r.ownerNum], velocity, ent->s.origin, ent->damage, 0, ent->methodOfDeath);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 28
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 295
;295:		}
LABELV $86
line 296
;296:	}
LABELV $84
line 335
;297:
;298:#ifdef MISSIONPACK
;299:	if (ent->s.weapon == WP_PROX_LAUNCHER) {
;300:		if (ent->s.pos.trType != TR_GRAVITY) {
;301:			return;
;302:		}
;303:
;304:		// if it's a player, stick it on to them (flag them and remove this entity)
;305:		if (other->s.eType == ET_PLAYER && other->health > 0) {
;306:			ProximityMine_Player(ent, other);
;307:			return;
;308:		}
;309:
;310:		SnapVectorTowards(trace->endpos, ent->s.pos.trBase);
;311:		G_SetOrigin(ent, trace->endpos);
;312:		ent->s.pos.trType = TR_STATIONARY;
;313:		VectorClear(ent->s.pos.trDelta);
;314:
;315:		G_AddEvent(ent, EV_PROXIMITY_MINE_STICK, trace->surfaceFlags);
;316:
;317:		ent->think     = ProximityMine_Activate;
;318:		ent->nextthink = level.time + 2000;
;319:
;320:		vectoangles(trace->plane.normal, ent->s.angles);
;321:		ent->s.angles[0] += 90;
;322:
;323:		// link the prox mine to the other entity
;324:		ent->enemy = other;
;325:		ent->die   = ProximityMine_Die;
;326:		VectorCopy(trace->plane.normal, ent->movedir);
;327:		VectorSet(ent->r.mins, -4, -4, -4);
;328:		VectorSet(ent->r.maxs, 4, 4, 4);
;329:		trap_LinkEntity(ent);
;330:
;331:		return;
;332:	}
;333:#endif
;334:
;335:	if (!strcmp(ent->classname, "hook")) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 $97
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $95
line 339
;336:		gentity_t* nent;
;337:		vec3_t     v;
;338:
;339:		nent = G_Spawn();
ADDRLP4 28
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 340
;340:		if (other->takedamage && other->client) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $98
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $98
line 342
;341:
;342:			G_AddEvent(nent, EV_MISSILE_HIT, DirToByte(trace->plane.normal));
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 343
;343:			nent->s.otherEntityNum = other->s.number;
ADDRLP4 12
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 345
;344:
;345:			ent->enemy = other;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 347
;346:
;347:			v[0] = other->r.currentOrigin[0] + (other->r.mins[0] + other->r.maxs[0]) * 0.5;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 348
;348:			v[1] = other->r.currentOrigin[1] + (other->r.mins[1] + other->r.maxs[1]) * 0.5;
ADDRLP4 16+4
ADDRLP4 0
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 349
;349:			v[2] = other->r.currentOrigin[2] + (other->r.mins[2] + other->r.maxs[2]) * 0.5;
ADDRLP4 16+8
ADDRLP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 351
;350:
;351:			SnapVectorTowards(v, ent->s.pos.trBase);  // save net bandwidth
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 352
;352:		} else {
ADDRGP4 $99
JUMPV
LABELV $98
line 353
;353:			VectorCopy(trace->endpos, v);
ADDRLP4 16
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRB
ASGNB 12
line 354
;354:			G_AddEvent(nent, EV_MISSILE_MISS, DirToByte(trace->plane.normal));
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 12
INDIRP4
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 355
;355:			ent->enemy = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
CNSTP4 0
ASGNP4
line 356
;356:		}
LABELV $99
line 358
;357:
;358:		SnapVectorTowards(v, ent->s.pos.trBase);  // save net bandwidth
ADDRLP4 16
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 360
;359:
;360:		nent->freeAfterEvent = qtrue;
ADDRLP4 12
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 362
;361:		// change over to a normal entity right at the point of impact
;362:		nent->s.eType = ET_GENERAL;
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 363
;363:		ent->s.eType  = ET_GRAPPLE;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 11
ASGNI4
line 365
;364:
;365:		G_SetOrigin(ent, v);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 366
;366:		G_SetOrigin(nent, v);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 16
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 368
;367:
;368:		ent->think     = Weapon_HookThink;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Weapon_HookThink
ASGNP4
line 369
;369:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 371
;370:
;371:		ent->parent->client->ps.pm_flags |= PMF_GRAPPLE_PULL;
ADDRLP4 36
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 2048
BORI4
ASGNI4
line 372
;372:		VectorCopy(ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 40
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 40
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 374
;373:
;374:		trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 375
;375:		trap_LinkEntity(nent);
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 377
;376:
;377:		return;
ADDRGP4 $81
JUMPV
LABELV $95
line 383
;378:	}
;379:
;380:	// is it cheaper in bandwidth to just remove this ent and create a new
;381:	// one, rather than changing the missile into the explosion?
;382:
;383:	if (other->takedamage && other->client) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $103
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $103
line 384
;384:		G_AddEvent(ent, EV_MISSILE_HIT, DirToByte(trace->plane.normal));
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 385
;385:		ent->s.otherEntityNum = other->s.number;
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 386
;386:	} else if (trace->surfaceFlags & SURF_METALSTEPS) {
ADDRGP4 $104
JUMPV
LABELV $103
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $105
line 387
;387:		G_AddEvent(ent, EV_MISSILE_MISS_METAL, DirToByte(trace->plane.normal));
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 52
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 388
;388:	} else {
ADDRGP4 $106
JUMPV
LABELV $105
line 389
;389:		G_AddEvent(ent, EV_MISSILE_MISS, DirToByte(trace->plane.normal));
ADDRFP4 4
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRLP4 16
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 390
;390:	}
LABELV $106
LABELV $104
line 392
;391:
;392:	ent->freeAfterEvent = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 556
ADDP4
CNSTI4 1
ASGNI4
line 395
;393:
;394:	// change over to a normal entity right at the point of impact
;395:	ent->s.eType = ET_GENERAL;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 397
;396:
;397:	SnapVectorTowards(trace->endpos, ent->s.pos.trBase);  // save net bandwidth
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 24
ADDP4
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 399
;398:
;399:	G_SetOrigin(ent, trace->endpos);
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
line 402
;400:
;401:	// splash damage (doesn't apply to person directly hit)
;402:	if (ent->splashDamage) {
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 0
EQI4 $107
line 403
;403:		if (G_RadiusDamage(trace->endpos, ent->parent, ent->splashDamage, ent->splashRadius, other, ent->splashMethodOfDeath)) {
ADDRFP4 4
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 16
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 G_RadiusDamage
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $109
line 404
;404:			if (!hitClient) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $111
line 405
;405:				g_entities[ent->r.ownerNum].client->accuracy_hits++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities+516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 406
;406:			}
LABELV $111
line 407
;407:		}
LABELV $109
line 408
;408:	}
LABELV $107
line 410
;409:
;410:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 411
;411:}
LABELV $81
endproc G_MissileImpact 52 32
export G_RunMissile
proc G_RunMissile 80 28
line 418
;412:
;413:/*
;414:================
;415:G_RunMissile
;416:================
;417:*/
;418:void G_RunMissile(gentity_t* ent) {
line 424
;419:	vec3_t  origin;
;420:	trace_t tr;
;421:	int     passent;
;422:
;423:	// get current position
;424:	BG_EvaluateTrajectory(&ent->s.pos, level.time, origin);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 60
ARGP4
ADDRGP4 BG_EvaluateTrajectory
CALLV
pop
line 427
;425:
;426:	// if this missile bounced off an invulnerability sphere
;427:	if (ent->target_ent) {
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $116
line 428
;428:		passent = ent->target_ent->s.number;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRP4
INDIRI4
ASGNI4
line 429
;429:	}
ADDRGP4 $117
JUMPV
LABELV $116
line 436
;430:#ifdef MISSIONPACK
;431:	// prox mines that left the owner bbox will attach to anything, even the owner
;432:	else if (ent->s.weapon == WP_PROX_LAUNCHER && ent->count) {
;433:		passent = ENTITYNUM_NONE;
;434:	}
;435:#endif
;436:	else {
line 438
;437:		// ignore interactions with the missile owner
;438:		passent = ent->r.ownerNum;
ADDRLP4 56
ADDRFP4 0
INDIRP4
CNSTI4 512
ADDP4
INDIRI4
ASGNI4
line 439
;439:	}
LABELV $117
line 441
;440:	// trace a line from the previous position to the current position
;441:	trap_Trace(&tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, origin, passent, ent->clipmask);
ADDRLP4 0
ARGP4
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 436
ADDP4
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 448
ADDP4
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 72
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 443
;442:
;443:	if (tr.startsolid || tr.allsolid) {
ADDRLP4 0+4
INDIRI4
CNSTI4 0
NEI4 $121
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $118
LABELV $121
line 445
;444:		// make sure the tr.entityNum is set to the entity we're stuck in
;445:		trap_Trace(&tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, passent, ent->clipmask);
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
ADDRLP4 76
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRLP4 56
INDIRI4
ARGI4
ADDRLP4 76
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 446
;446:		tr.fraction = 0;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 447
;447:	} else {
ADDRGP4 $119
JUMPV
LABELV $118
line 448
;448:		VectorCopy(tr.endpos, ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 449
;449:	}
LABELV $119
line 451
;450:
;451:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 453
;452:
;453:	if (tr.fraction != 1) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $124
line 455
;454:		// never explode or bounce on sky
;455:		if (tr.surfaceFlags & SURF_NOIMPACT) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $127
line 457
;456:			// If grapple, reset owner
;457:			if (ent->parent && ent->parent->client && ent->parent->client->hook == ent) {
ADDRLP4 76
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $130
ADDRLP4 76
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $130
ADDRLP4 76
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
ADDRLP4 76
INDIRP4
CVPU4 4
NEU4 $130
line 458
;458:				ent->parent->client->hook = NULL;
ADDRFP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
CNSTP4 0
ASGNP4
line 459
;459:			}
LABELV $130
line 460
;460:			G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 461
;461:			return;
ADDRGP4 $114
JUMPV
LABELV $127
line 463
;462:		}
;463:		G_MissileImpact(ent, &tr);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_MissileImpact
CALLV
pop
line 464
;464:		if (ent->s.eType != ET_MISSILE) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $132
line 465
;465:			return;  // exploded
ADDRGP4 $114
JUMPV
LABELV $132
line 467
;466:		}
;467:	}
LABELV $124
line 479
;468:#ifdef MISSIONPACK
;469:	// if the prox mine wasn't yet outside the player body
;470:	if (ent->s.weapon == WP_PROX_LAUNCHER && !ent->count) {
;471:		// check if the prox mine is outside the owner bbox
;472:		trap_Trace(&tr, ent->r.currentOrigin, ent->r.mins, ent->r.maxs, ent->r.currentOrigin, ENTITYNUM_NONE, ent->clipmask);
;473:		if (!tr.startsolid || tr.entityNum != ent->r.ownerNum) {
;474:			ent->count = 1;
;475:		}
;476:	}
;477:#endif
;478:	// check think function after bouncing
;479:	G_RunThink(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_RunThink
CALLV
pop
line 480
;480:}
LABELV $114
endproc G_RunMissile 80 28
export fire_plasma
proc fire_plasma 20 4
line 490
;481:
;482://=============================================================================
;483:
;484:/*
;485:=================
;486:fire_plasma
;487:
;488:=================
;489:*/
;490:gentity_t* fire_plasma(gentity_t* self, vec3_t start, vec3_t dir) {
line 493
;491:	gentity_t* bolt;
;492:
;493:	VectorNormalize(dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 495
;494:
;495:	bolt                      = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 496
;496:	bolt->classname           = "plasma";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $135
ASGNP4
line 497
;497:	bolt->nextthink           = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 498
;498:	bolt->think               = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 499
;499:	bolt->s.eType             = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 500
;500:	bolt->r.svFlags           = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 501
;501:	bolt->s.weapon            = WP_PLASMAGUN;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 8
ASGNI4
line 502
;502:	bolt->r.ownerNum          = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 503
;503:	bolt->parent              = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 504
;504:	bolt->damage              = 20;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 20
ASGNI4
line 505
;505:	bolt->splashDamage        = 15;
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 15
ASGNI4
line 506
;506:	bolt->splashRadius        = 20;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 20
ASGNI4
line 507
;507:	bolt->methodOfDeath       = MOD_PLASMA;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 8
ASGNI4
line 508
;508:	bolt->splashMethodOfDeath = MOD_PLASMA_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 9
ASGNI4
line 509
;509:	bolt->clipmask            = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 510
;510:	bolt->target_ent          = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 513
;511:
;512:	// missile owner
;513:	bolt->s.clientNum = self->s.clientNum;
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
line 515
;514:	// unlagged
;515:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 517
;516:
;517:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 518
;518:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;  // move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 519
;519:	VectorCopy(start, bolt->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 520
;520:	SnapVector(bolt->s.pos.trBase);  // save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 521
;521:	VectorScale(dir, 2000, bolt->s.pos.trDelta);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1157234688
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1157234688
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1157234688
MULF4
ASGNF4
line 522
;522:	SnapVector(bolt->s.pos.trDelta);  // save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 524
;523:
;524:	VectorCopy(start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 526
;525:
;526:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $134
endproc fire_plasma 20 4
export fire_grenade
proc fire_grenade 24 4
line 536
;527:}
;528:
;529://=============================================================================
;530:
;531:/*
;532:=================
;533:fire_grenade
;534:=================
;535:*/
;536:gentity_t* fire_grenade(gentity_t* self, vec3_t start, vec3_t dir) {
line 539
;537:	gentity_t* bolt;
;538:
;539:	VectorNormalize(dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 541
;540:
;541:	bolt                      = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 542
;542:	bolt->classname           = "grenade";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $139
ASGNP4
line 543
;543:	bolt->nextthink           = level.time + 2500;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 2500
ADDI4
ASGNI4
line 544
;544:	bolt->think               = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 545
;545:	bolt->s.eType             = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 546
;546:	bolt->r.svFlags           = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 547
;547:	bolt->s.weapon            = WP_GRENADE_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 4
ASGNI4
line 548
;548:	bolt->s.eFlags            = EF_BOUNCE_HALF;
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
CNSTI4 32
ASGNI4
line 549
;549:	bolt->r.ownerNum          = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 550
;550:	bolt->parent              = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 551
;551:	bolt->damage              = 100;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 100
ASGNI4
line 552
;552:	bolt->splashDamage        = 100;
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 100
ASGNI4
line 553
;553:	bolt->splashRadius        = 150;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 150
ASGNI4
line 554
;554:	bolt->methodOfDeath       = MOD_GRENADE;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 4
ASGNI4
line 555
;555:	bolt->splashMethodOfDeath = MOD_GRENADE_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 5
ASGNI4
line 556
;556:	bolt->clipmask            = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 557
;557:	bolt->target_ent          = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 559
;558:
;559:	if (self->s.powerups & (1 << PW_QUAD))
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $141
line 560
;560:		bolt->s.powerups |= (1 << PW_QUAD);
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $141
line 563
;561:
;562:	// missile owner
;563:	bolt->s.clientNum = self->s.clientNum;
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
line 565
;564:	// unlagged
;565:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 567
;566:
;567:	bolt->s.pos.trType = TR_GRAVITY;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 5
ASGNI4
line 568
;568:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;  // move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 569
;569:	VectorCopy(start, bolt->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 570
;570:	VectorScale(dir, 700, bolt->s.pos.trDelta);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1143930880
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1143930880
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1143930880
MULF4
ASGNF4
line 571
;571:	SnapVector(bolt->s.pos.trDelta);  // save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 573
;572:
;573:	VectorCopy(start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 575
;574:
;575:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $138
endproc fire_grenade 24 4
export fire_bfg
proc fire_bfg 24 4
line 585
;576:}
;577:
;578://=============================================================================
;579:
;580:/*
;581:=================
;582:fire_bfg
;583:=================
;584:*/
;585:gentity_t* fire_bfg(gentity_t* self, vec3_t start, vec3_t dir) {
line 588
;586:	gentity_t* bolt;
;587:
;588:	VectorNormalize(dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 590
;589:
;590:	bolt                      = G_Spawn();
ADDRLP4 4
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 591
;591:	bolt->classname           = "bfg";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $145
ASGNP4
line 592
;592:	bolt->nextthink           = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 593
;593:	bolt->think               = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 594
;594:	bolt->s.eType             = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 595
;595:	bolt->r.svFlags           = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 596
;596:	bolt->s.weapon            = WP_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 9
ASGNI4
line 597
;597:	bolt->r.ownerNum          = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 598
;598:	bolt->parent              = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 599
;599:	bolt->damage              = 100;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 100
ASGNI4
line 600
;600:	bolt->splashDamage        = 100;
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 100
ASGNI4
line 601
;601:	bolt->splashRadius        = 120;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 120
ASGNI4
line 602
;602:	bolt->methodOfDeath       = MOD_BFG;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 12
ASGNI4
line 603
;603:	bolt->splashMethodOfDeath = MOD_BFG_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 13
ASGNI4
line 604
;604:	bolt->clipmask            = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 605
;605:	bolt->target_ent          = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 607
;606:
;607:	if (self->s.powerups & (1 << PW_QUAD))
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $147
line 608
;608:		bolt->s.powerups |= (1 << PW_QUAD);
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $147
line 611
;609:
;610:	// missile owner
;611:	bolt->s.clientNum = self->s.clientNum;
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
line 613
;612:	// unlagged
;613:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 615
;614:
;615:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 616
;616:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;  // move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 617
;617:	VectorCopy(start, bolt->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 618
;618:	SnapVector(bolt->s.pos.trBase);  // save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 619
;619:	VectorScale(dir, 2000, bolt->s.pos.trDelta);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1157234688
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1157234688
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1157234688
MULF4
ASGNF4
line 620
;620:	SnapVector(bolt->s.pos.trDelta);  // save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 621
;621:	VectorCopy(start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 623
;622:
;623:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $144
endproc fire_bfg 24 4
export fire_rocket
proc fire_rocket 32 4
line 633
;624:}
;625:
;626://=============================================================================
;627:
;628:/*
;629:=================
;630:fire_rocket
;631:=================
;632:*/
;633:gentity_t* fire_rocket(gentity_t* self, vec3_t start, vec3_t dir) {
line 637
;634:	gentity_t* bolt;
;635:	int rocketSpeed;
;636:
;637:	VectorNormalize(dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 639
;638:
;639:	bolt                      = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 640
;640:	bolt->classname           = "rocket";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $151
ASGNP4
line 641
;641:	bolt->nextthink           = level.time + 15000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 15000
ADDI4
ASGNI4
line 642
;642:	bolt->think               = G_ExplodeMissile;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_ExplodeMissile
ASGNP4
line 643
;643:	bolt->s.eType             = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 644
;644:	bolt->r.svFlags           = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 645
;645:	bolt->s.weapon            = WP_ROCKET_LAUNCHER;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 5
ASGNI4
line 646
;646:	bolt->r.ownerNum          = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 647
;647:	bolt->parent              = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 648
;648:	bolt->damage              = 100;
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 100
ASGNI4
line 649
;649:	bolt->splashDamage        = 100;
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
CNSTI4 100
ASGNI4
line 650
;650:	bolt->splashRadius        = 120;
ADDRLP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 120
ASGNI4
line 651
;651:	bolt->methodOfDeath       = MOD_ROCKET;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 6
ASGNI4
line 652
;652:	bolt->splashMethodOfDeath = MOD_ROCKET_SPLASH;
ADDRLP4 0
INDIRP4
CNSTI4 756
ADDP4
CNSTI4 7
ASGNI4
line 653
;653:	bolt->clipmask            = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 654
;654:	bolt->target_ent          = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 656
;655:
;656:	if (self->s.powerups & (1 << PW_QUAD))
ADDRFP4 0
INDIRP4
CNSTI4 188
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $153
line 657
;657:		bolt->s.powerups |= (1 << PW_QUAD);
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 188
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 2
BORI4
ASGNI4
LABELV $153
line 660
;658:
;659:	// missile owner
;660:	bolt->s.clientNum = self->s.clientNum;
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
line 662
;661:	// unlagged
;662:	bolt->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 664
;663:
;664:	bolt->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 665
;665:	bolt->s.pos.trTime = level.time - MISSILE_PRESTEP_TIME;  // move a bit on the very first frame
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 666
;666:	VectorCopy(start, bolt->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 667
;667:	SnapVector(bolt->s.pos.trBase);  // save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 668
;668:  	rocketSpeed = (phy_movetype.integer == 0) ? 1000 : 900;
ADDRGP4 phy_movetype+12
INDIRI4
CNSTI4 0
NEI4 $158
ADDRLP4 16
CNSTI4 1000
ASGNI4
ADDRGP4 $159
JUMPV
LABELV $158
ADDRLP4 16
CNSTI4 900
ASGNI4
LABELV $159
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
line 669
;669:	VectorScale(dir, rocketSpeed, bolt->s.pos.trDelta);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
MULF4
ASGNF4
line 670
;670:	SnapVector(bolt->s.pos.trDelta);  // save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 671
;671:	VectorCopy(start, bolt->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 673
;672:
;673:	return bolt;
ADDRLP4 0
INDIRP4
RETP4
LABELV $150
endproc fire_rocket 32 4
export fire_grapple
proc fire_grapple 24 4
line 681
;674:}
;675:
;676:/*
;677:=================
;678:fire_grapple
;679:=================
;680:*/
;681:gentity_t* fire_grapple(gentity_t* self, vec3_t start, vec3_t dir) {
line 686
;682:	gentity_t* hook;
;683:	// unlagged
;684:	int hooktime;
;685:
;686:	VectorNormalize(dir);
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 688
;687:
;688:	hook                = G_Spawn();
ADDRLP4 8
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 689
;689:	hook->classname     = "hook";
ADDRLP4 0
INDIRP4
CNSTI4 524
ADDP4
ADDRGP4 $97
ASGNP4
line 690
;690:	hook->nextthink     = level.time + 10000;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 691
;691:	hook->think         = Weapon_HookFree;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 Weapon_HookFree
ASGNP4
line 692
;692:	hook->s.eType       = ET_MISSILE;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 693
;693:	hook->r.svFlags     = SVF_USE_CURRENT_ORIGIN;
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 128
ASGNI4
line 694
;694:	hook->s.weapon      = WP_GRAPPLING_HOOK;
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
CNSTI4 10
ASGNI4
line 695
;695:	hook->r.ownerNum    = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 512
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 696
;696:	hook->methodOfDeath = MOD_GRAPPLE;
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
CNSTI4 23
ASGNI4
line 697
;697:	hook->clipmask      = MASK_SHOT;
ADDRLP4 0
INDIRP4
CNSTI4 572
ADDP4
CNSTI4 100663297
ASGNI4
line 698
;698:	hook->parent        = self;
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 699
;699:	hook->target_ent    = NULL;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
CNSTP4 0
ASGNP4
line 702
;700:
;701:	// missile owner
;702:	hook->s.clientNum = self->s.clientNum;
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
line 704
;703:	// unlagged
;704:	hook->s.otherEntityNum = self->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 706
;705:
;706:	if (self->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $162
line 707
;707:		hooktime = self->client->pers.cmd.serverTime + MISSILE_PRESTEP_TIME;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
CNSTI4 50
ADDI4
ASGNI4
line 708
;708:	} else {
ADDRGP4 $163
JUMPV
LABELV $162
line 709
;709:		hooktime = level.time - MISSILE_PRESTEP_TIME;  // // move a bit on the very first frame
ADDRLP4 4
ADDRGP4 level+32
INDIRI4
CNSTI4 50
SUBI4
ASGNI4
line 710
;710:	}
LABELV $163
line 712
;711:
;712:	hook->s.pos.trType = TR_LINEAR;
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI4 2
ASGNI4
line 713
;713:	hook->s.pos.trTime = hooktime;
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 714
;714:	VectorCopy(start, hook->s.pos.trBase);
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 715
;715:	SnapVector(hook->s.pos.trBase);  // save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 716
;716:	VectorScale(dir, 800, hook->s.pos.trDelta);
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1145569280
MULF4
ASGNF4
line 717
;717:	SnapVector(hook->s.pos.trDelta);  // save net bandwidth
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 718
;718:	VectorCopy(start, hook->r.currentOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 720
;719:
;720:	self->client->hook = hook;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 722
;721:
;722:	return hook;
ADDRLP4 0
INDIRP4
RETP4
LABELV $160
endproc fire_grapple 24 4
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
import fire_blaster
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
LABELV $151
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $145
byte 1 98
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $139
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $135
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $97
byte 1 104
byte 1 111
byte 1 111
byte 1 107
byte 1 0
