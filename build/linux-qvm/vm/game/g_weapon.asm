export CalcMuzzlePointOrigin
code
proc CalcMuzzlePointOrigin 4 0
file "../../../../code/game/g_weapon.c"
line 20
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// g_weapon.c
;4:// perform the server side effects of a weapon firing
;5:
;6:#include "g_local.h"
;7:
;8:static float  s_quadFactor;
;9:static vec3_t forward, right, up;
;10:static vec3_t muzzle;
;11:static vec3_t muzzle_origin;  // for hitscan weapon trace
;12:
;13:#define NUM_NAILSHOTS 15
;14:
;15:/*
;16:===============
;17:CalcMuzzlePointOrigin
;18:===============
;19:*/
;20:void CalcMuzzlePointOrigin(const gentity_t* ent, vec3_t origin, const vec3_t forward, const vec3_t right, const vec3_t up, vec3_t muzzlePoint) {
line 21
;21:	VectorCopy(ent->client->ps.origin, origin);
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 22
;22:	origin[2] += ent->client->ps.viewheight;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 23
;23:	VectorMA(origin, 14.0, forward, muzzlePoint);
ADDRFP4 20
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRFP4 8
INDIRP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
ADDRFP4 20
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
ADDRFP4 20
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1096810496
MULF4
ADDF4
ASGNF4
line 26
;24:	// snap to integer coordinates for more efficient network bandwidth usage
;25:	// SnapVector( muzzlePoint );
;26:}
LABELV $54
endproc CalcMuzzlePointOrigin 4 0
export G_BounceProjectile
proc G_BounceProjectile 48 4
line 33
;27:
;28:/*
;29:================
;30:G_BounceProjectile
;31:================
;32:*/
;33:void G_BounceProjectile(vec3_t start, vec3_t impact, vec3_t dir, vec3_t endout) {
line 37
;34:	vec3_t v, newv;
;35:	float  dot;
;36:
;37:	VectorSubtract(impact, start, v);
ADDRLP4 28
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 32
INDIRP4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 0+4
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
ASGNF4
ADDRLP4 0+8
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
SUBF4
ASGNF4
line 38
;38:	dot = DotProduct(v, dir);
ADDRLP4 36
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 0
INDIRF4
ADDRLP4 36
INDIRP4
INDIRF4
MULF4
ADDRLP4 0+4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+8
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 39
;39:	VectorMA(v, -2 * dot, dir, newv);
ADDRLP4 40
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 0
INDIRF4
ADDRLP4 40
INDIRP4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
ADDRLP4 12+8
ADDRLP4 0+8
INDIRF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 3221225472
MULF4
MULF4
ADDF4
ASGNF4
line 41
;40:
;41:	VectorNormalize(newv);
ADDRLP4 12
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 42
;42:	VectorMA(impact, 8192, newv, endout);
ADDRFP4 12
INDIRP4
ADDRFP4 4
INDIRP4
INDIRF4
ADDRLP4 12
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 12+4
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 12+8
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
line 43
;43:}
LABELV $55
endproc G_BounceProjectile 48 4
export Weapon_Gauntlet
proc Weapon_Gauntlet 0 0
line 53
;44:
;45:/*
;46:======================================================================
;47:
;48:GAUNTLET
;49:
;50:======================================================================
;51:*/
;52:
;53:void Weapon_Gauntlet(gentity_t* ent) {}
LABELV $66
endproc Weapon_Gauntlet 0 0
export CheckGauntletAttack
proc CheckGauntletAttack 92 32
line 60
;54:
;55:/*
;56:===============
;57:CheckGauntletAttack
;58:===============
;59:*/
;60:qboolean CheckGauntletAttack(gentity_t* ent) {
line 68
;61:	trace_t    tr;
;62:	vec3_t     end;
;63:	gentity_t* tent;
;64:	gentity_t* traceEnt;
;65:	int        damage;
;66:
;67:	// set aiming directions
;68:	AngleVectors(ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 70
;69:
;70:	CalcMuzzlePointOrigin(ent, muzzle_origin, forward, right, up, muzzle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePointOrigin
CALLV
pop
line 72
;71:
;72:	VectorMA(muzzle_origin, (32.0 + 14.0), forward, end);
ADDRLP4 60
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1110966272
MULF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1110966272
MULF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1110966272
MULF4
ADDF4
ASGNF4
line 74
;73:
;74:	trap_Trace(&tr, muzzle_origin, NULL, NULL, end, ent->s.number, MASK_SHOT);
ADDRLP4 4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRFP4 0
INDIRP4
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 75
;75:	if (tr.surfaceFlags & SURF_NOIMPACT) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $74
line 76
;76:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $67
JUMPV
LABELV $74
line 79
;77:	}
;78:
;79:	if (ent->client->noclip) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $77
line 80
;80:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $67
JUMPV
LABELV $77
line 83
;81:	}
;82:
;83:	traceEnt = &g_entities[tr.entityNum];
ADDRLP4 0
ADDRLP4 4+52
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 86
;84:
;85:	// send blood impact
;86:	if (traceEnt->takedamage && traceEnt->client) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $80
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $80
line 87
;87:		tent                   = G_TempEntity(tr.endpos, EV_MISSILE_HIT);
ADDRLP4 4+12
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 84
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 84
INDIRP4
ASGNP4
line 88
;88:		tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 89
;89:		tent->s.eventParm      = DirToByte(tr.plane.normal);
ADDRLP4 4+24
ARGP4
ADDRLP4 88
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 88
INDIRI4
ASGNI4
line 90
;90:		tent->s.weapon         = ent->s.weapon;
ADDRLP4 72
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 91
;91:	}
LABELV $80
line 93
;92:
;93:	if (!traceEnt->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $84
line 94
;94:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $67
JUMPV
LABELV $84
line 97
;95:	}
;96:
;97:	if (ent->client->ps.powerups[PW_QUAD]) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $86
line 98
;98:		G_AddEvent(ent, EV_POWERUP_QUAD, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 61
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 99
;99:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 100
;100:	} else {
ADDRGP4 $87
JUMPV
LABELV $86
line 101
;101:		s_quadFactor = 1.0;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 102
;102:	}
LABELV $87
line 109
;103:#ifdef MISSIONPACK
;104:	if (ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER) {
;105:		s_quadFactor *= 2;
;106:	}
;107:#endif
;108:
;109:	damage = 50 * s_quadFactor;
ADDRLP4 76
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1112014848
MULF4
CVFI4 4
ASGNI4
line 110
;110:	G_Damage(traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_GAUNTLET);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 84
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 76
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 2
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 112
;111:
;112:	return qtrue;
CNSTI4 1
RETI4
LABELV $67
endproc CheckGauntletAttack 92 32
export SnapVectorTowards
proc SnapVectorTowards 24 0
line 133
;113:}
;114:
;115:/*
;116:======================================================================
;117:
;118:MACHINEGUN
;119:
;120:======================================================================
;121:*/
;122:
;123:/*
;124:======================
;125:SnapVectorTowards
;126:
;127:Round a vector to integers for more efficient network
;128:transmission, but make sure that it rounds towards a given point
;129:rather than blindly truncating.  This prevents it from truncating
;130:into a wall.
;131:======================
;132:*/
;133:void SnapVectorTowards(vec3_t v, vec3_t to) {
line 136
;134:	int i;
;135:
;136:	for (i = 0; i < 3; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $91
line 137
;137:		if (v[i] < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $95
line 138
;138:			if (to[i] >= v[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
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
LTF4 $97
line 139
;139:				v[i] = (int)v[i];
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRGP4 $96
JUMPV
LABELV $97
line 141
;140:			else
;141:				v[i] = (int)v[i] - 1;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CNSTI4 1
SUBI4
CVIF4 4
ASGNF4
line 142
;142:		} else {
ADDRGP4 $96
JUMPV
LABELV $95
line 143
;143:			if (to[i] <= v[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
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
GTF4 $99
line 144
;144:				v[i] = (int)v[i];
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 12
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRGP4 $100
JUMPV
LABELV $99
line 146
;145:			else
;146:				v[i] = (int)v[i] + 1;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
ADDP4
INDIRF4
CVFI4 4
CNSTI4 1
ADDI4
CVIF4 4
ASGNF4
LABELV $100
line 147
;147:		}
LABELV $96
line 148
;148:	}
LABELV $92
line 136
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 3
LTI4 $91
line 149
;149:}
LABELV $90
endproc SnapVectorTowards 24 0
proc Bullet_Fire 136 32
line 158
;150:
;151:#ifdef MISSIONPACK
;152:#define CHAINGUN_SPREAD 600
;153:#endif
;154:#define MACHINEGUN_SPREAD      200
;155:#define MACHINEGUN_DAMAGE      7
;156:#define MACHINEGUN_TEAM_DAMAGE 5  // wimpier MG in teamplay
;157:
;158:static void Bullet_Fire(gentity_t* ent, float spread, int damage) {
line 170
;159:	trace_t tr;
;160:	vec3_t  end;
;161:#ifdef MISSIONPACK
;162:	vec3_t impactpoint, bouncedir;
;163:#endif
;164:	float      r;
;165:	float      u;
;166:	gentity_t* tent;
;167:	gentity_t* traceEnt;
;168:	int        i, passent;
;169:
;170:	damage *= s_quadFactor;
ADDRFP4 8
ADDRFP4 8
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 172
;171:
;172:	r = random() * M_PI * 2.0f;
ADDRLP4 92
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 92
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 961089901
MULF4
ASGNF4
line 173
;173:	u = sin(r) * crandom() * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 96
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 100
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 96
INDIRF4
ADDRLP4 100
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
MULF4
ADDRFP4 4
INDIRF4
MULF4
CNSTF4 1098907648
MULF4
ASGNF4
line 174
;174:	r = cos(r) * crandom() * spread * 16;
ADDRLP4 84
INDIRF4
ARGF4
ADDRLP4 104
ADDRGP4 cos
CALLF4
ASGNF4
ADDRLP4 108
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 84
ADDRLP4 104
INDIRF4
ADDRLP4 108
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
MULF4
ADDRFP4 4
INDIRF4
MULF4
CNSTF4 1098907648
MULF4
ASGNF4
line 176
;175:
;176:	VectorMA(muzzle_origin, (8192.0 * 16.0), forward, end);
ADDRLP4 64
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
line 177
;177:	VectorMA(end, r, right, end);
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 right
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 right+4
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 right+8
INDIRF4
ADDRLP4 84
INDIRF4
MULF4
ADDF4
ASGNF4
line 178
;178:	VectorMA(end, u, up, end);
ADDRLP4 64
ADDRLP4 64
INDIRF4
ADDRGP4 up
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 64+4
INDIRF4
ADDRGP4 up+4
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 64+8
INDIRF4
ADDRGP4 up+8
INDIRF4
ADDRLP4 88
INDIRF4
MULF4
ADDF4
ASGNF4
line 180
;179:
;180:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 181
;181:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $120
line 184
;182:
;183:		// unlagged
;184:		G_DoTimeShiftFor(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 186
;185:
;186:		trap_Trace(&tr, muzzle_origin, NULL, NULL, end, passent, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 64
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 189
;187:
;188:		// unlagged
;189:		G_UndoTimeShiftFor(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 191
;190:
;191:		if (tr.surfaceFlags & SURF_NOIMPACT)
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $124
line 192
;192:			return;
ADDRGP4 $101
JUMPV
LABELV $124
line 194
;193:
;194:		traceEnt = &g_entities[tr.entityNum];
ADDRLP4 56
ADDRLP4 0+52
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 197
;195:
;196:		// snap the endpos to integers, but nudged towards the line
;197:		SnapVectorTowards(tr.endpos, muzzle_origin);
ADDRLP4 0+12
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 200
;198:
;199:		// send bullet impact
;200:		if (traceEnt->takedamage && traceEnt->client) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $129
ADDRLP4 56
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $129
line 201
;201:			tent              = G_TempEntity(tr.endpos, EV_BULLET_HIT_FLESH);
ADDRLP4 0+12
ARGP4
CNSTI4 48
ARGI4
ADDRLP4 124
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 124
INDIRP4
ASGNP4
line 202
;202:			tent->s.eventParm = traceEnt->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 205
;203:
;204:			// unlagged
;205:			tent->s.clientNum = ent->s.clientNum;
ADDRLP4 60
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 207
;206:
;207:			if (LogAccuracyHit(traceEnt, ent)) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 128
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $130
line 208
;208:				ent->client->accuracy_hits++;
ADDRLP4 132
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 132
INDIRP4
ADDRLP4 132
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 209
;209:			}
line 210
;210:		} else {
ADDRGP4 $130
JUMPV
LABELV $129
line 211
;211:			tent              = G_TempEntity(tr.endpos, EV_BULLET_HIT_WALL);
ADDRLP4 0+12
ARGP4
CNSTI4 49
ARGI4
ADDRLP4 124
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 124
INDIRP4
ASGNP4
line 212
;212:			tent->s.eventParm = DirToByte(tr.plane.normal);
ADDRLP4 0+24
ARGP4
ADDRLP4 128
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 60
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 128
INDIRI4
ASGNI4
line 213
;213:		}
LABELV $130
line 214
;214:		tent->s.otherEntityNum = ent->s.number;
ADDRLP4 60
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 216
;215:
;216:		if (traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $122
line 231
;217:#ifdef MISSIONPACK
;218:			if (traceEnt->client && traceEnt->client->invulnerabilityTime > level.time) {
;219:				if (G_InvulnerabilityEffect(traceEnt, forward, tr.endpos, impactpoint, bouncedir)) {
;220:					G_BounceProjectile(muzzle, impactpoint, bouncedir, end);
;221:					VectorCopy(impactpoint, muzzle);
;222:					// the player can hit him/herself with the bounced rail
;223:					passent = ENTITYNUM_NONE;
;224:				} else {
;225:					VectorCopy(tr.endpos, muzzle);
;226:					passent = traceEnt->s.number;
;227:				}
;228:				continue;
;229:			} else {
;230:#endif
;231:				G_Damage(traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_MACHINEGUN);
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 124
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRLP4 124
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 3
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 235
;232:#ifdef MISSIONPACK
;233:			}
;234:#endif
;235:		}
line 236
;236:		break;
ADDRGP4 $122
JUMPV
LABELV $121
line 181
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $120
LABELV $122
line 238
;237:	}
;238:}
LABELV $101
endproc Bullet_Fire 136 32
export BFG_Fire
proc BFG_Fire 16 12
line 248
;239:
;240:/*
;241:======================================================================
;242:
;243:BFG
;244:
;245:======================================================================
;246:*/
;247:
;248:void BFG_Fire(gentity_t* ent) {
line 251
;249:	gentity_t* m;
;250:
;251:	m = fire_bfg(ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_bfg
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 252
;252:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 253
;253:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 256
;254:
;255:	//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;256:}
LABELV $139
endproc BFG_Fire 16 12
proc ShotgunPellet 108 32
line 270
;257:
;258:/*
;259:======================================================================
;260:
;261:SHOTGUN
;262:
;263:======================================================================
;264:*/
;265:
;266:// DEFAULT_SHOTGUN_SPREAD and DEFAULT_SHOTGUN_COUNT	are in bg_public.h, because
;267:// client predicts same spreads
;268:#define DEFAULT_SHOTGUN_DAMAGE 10
;269:
;270:static qboolean ShotgunPellet(const vec3_t start, const vec3_t end, gentity_t* ent) {
line 278
;271:	trace_t    tr;
;272:	int        damage, i, passent;
;273:	gentity_t* traceEnt;
;274:#ifdef MISSIONPACK
;275:	vec3_t impactpoint, bouncedir;
;276:#endif
;277:	vec3_t   tr_start, tr_end;
;278:	qboolean hitClient = qfalse;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 280
;279:
;280:	passent = ent->s.number;
ADDRLP4 64
ADDRFP4 8
INDIRP4
INDIRI4
ASGNI4
line 281
;281:	VectorCopy(start, tr_start);
ADDRLP4 68
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 12
line 282
;282:	VectorCopy(end, tr_end);
ADDRLP4 80
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 12
line 284
;283:
;284:	for (i = 0; i < 10; i++) {
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $141
line 285
;285:		trap_Trace(&tr, tr_start, NULL, NULL, tr_end, passent, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 64
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 286
;286:		traceEnt = &g_entities[tr.entityNum];
ADDRLP4 56
ADDRLP4 0+52
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 289
;287:
;288:		// send bullet impact
;289:		if (tr.surfaceFlags & SURF_NOIMPACT) {
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $146
line 290
;290:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $140
JUMPV
LABELV $146
line 293
;291:		}
;292:
;293:		if (traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $149
line 294
;294:			damage = DEFAULT_SHOTGUN_DAMAGE * s_quadFactor;
ADDRLP4 92
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1092616192
MULF4
CVFI4 4
ASGNI4
line 309
;295:#ifdef MISSIONPACK
;296:			if (traceEnt->client && traceEnt->client->invulnerabilityTime > level.time) {
;297:				if (G_InvulnerabilityEffect(traceEnt, forward, tr.endpos, impactpoint, bouncedir)) {
;298:					G_BounceProjectile(tr_start, impactpoint, bouncedir, tr_end);
;299:					VectorCopy(impactpoint, tr_start);
;300:					// the player can hit him/herself with the bounced rail
;301:					passent = ENTITYNUM_NONE;
;302:				} else {
;303:					VectorCopy(tr.endpos, tr_start);
;304:					passent = traceEnt->s.number;
;305:				}
;306:				continue;
;307:			}
;308:#else
;309:			if (LogAccuracyHit(traceEnt, ent)) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 100
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 100
INDIRI4
CNSTI4 0
EQI4 $151
line 310
;310:				hitClient = qtrue;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 311
;311:			}
LABELV $151
line 312
;312:			G_Damage(traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_SHOTGUN);
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 104
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRLP4 104
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 92
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 1
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 313
;313:			return hitClient;
ADDRLP4 96
INDIRI4
RETI4
ADDRGP4 $140
JUMPV
LABELV $149
line 316
;314:#endif
;315:		}
;316:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $140
JUMPV
LABELV $142
line 284
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 10
LTI4 $141
line 318
;317:	}
;318:	return qfalse;
CNSTI4 0
RETI4
LABELV $140
endproc ShotgunPellet 108 32
proc ShotgunPattern 92 12
line 322
;319:}
;320:
;321:// this should match CG_ShotgunPattern
;322:static void ShotgunPattern(const vec3_t origin, const vec3_t origin2, int seed, gentity_t* ent) {
line 327
;323:	int      i;
;324:	float    r, u;
;325:	vec3_t   end;
;326:	vec3_t   forward, right, up;
;327:	qboolean hitClient = qfalse;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 331
;328:
;329:	// derive the right and up vectors from the forward vector, because
;330:	// the client won't have any other information
;331:	VectorNormalize2(origin2, forward);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 332
;332:	PerpendicularVector(right, forward);
ADDRLP4 32
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 PerpendicularVector
CALLV
pop
line 333
;333:	CrossProduct(forward, right, up);
ADDRLP4 20
ARGP4
ADDRLP4 32
ARGP4
ADDRLP4 44
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 336
;334:
;335:	// unlagged
;336:	G_DoTimeShiftFor(ent);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 339
;337:
;338:	// generate the "random" spread pattern
;339:	for (i = 0; i < DEFAULT_SHOTGUN_COUNT; i++) {
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $155
line 340
;340:		r = Q_crandom(&seed) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 64
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 12
ADDRLP4 64
INDIRF4
CNSTF4 1177485312
MULF4
ASGNF4
line 341
;341:		u = Q_crandom(&seed) * DEFAULT_SHOTGUN_SPREAD * 16;
ADDRFP4 8
ARGP4
ADDRLP4 68
ADDRGP4 Q_crandom
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 68
INDIRF4
CNSTF4 1177485312
MULF4
ASGNF4
line 342
;342:		VectorMA(origin, (8192.0 * 16.0), forward, end);
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 72
INDIRP4
INDIRF4
ADDRLP4 20
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 72
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ADDRLP4 20+4
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ADDRLP4 20+8
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
line 343
;343:		VectorMA(end, r, right, end);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 32
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 32+4
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 32+8
INDIRF4
ADDRLP4 12
INDIRF4
MULF4
ADDF4
ASGNF4
line 344
;344:		VectorMA(end, u, up, end);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 44
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
ADDRLP4 44+4
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
ADDRLP4 44+8
INDIRF4
ADDRLP4 16
INDIRF4
MULF4
ADDF4
ASGNF4
line 345
;345:		if (ShotgunPellet(origin, end, ent) && !hitClient) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRP4
ARGP4
ADDRLP4 84
ADDRGP4 ShotgunPellet
CALLI4
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $175
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $175
line 346
;346:			hitClient = qtrue;
ADDRLP4 60
CNSTI4 1
ASGNI4
line 347
;347:			ent->client->accuracy_hits++;
ADDRLP4 88
ADDRFP4 12
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 88
INDIRP4
ADDRLP4 88
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 348
;348:		}
LABELV $175
line 349
;349:	}
LABELV $156
line 339
ADDRLP4 56
ADDRLP4 56
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 56
INDIRI4
CNSTI4 11
LTI4 $155
line 352
;350:
;351:	// unlagged
;352:	G_UndoTimeShiftFor(ent);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 353
;353:}
LABELV $154
endproc ShotgunPattern 92 12
proc weapon_supershotgun_fire 20 16
line 355
;354:
;355:static void weapon_supershotgun_fire(gentity_t* ent) {
line 359
;356:	gentity_t* tent;
;357:
;358:	// send shotgun blast
;359:	tent = G_TempEntity(muzzle, EV_SHOTGUN);
ADDRGP4 muzzle
ARGP4
CNSTI4 54
ARGI4
ADDRLP4 4
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 360
;360:	VectorScale(forward, 4096.0, tent->s.origin2);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 forward
INDIRF4
CNSTF4 1166016512
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1166016512
MULF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1166016512
MULF4
ASGNF4
line 362
;361:
;362:	SnapVector(tent->s.origin2);
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 363
;363:	tent->s.eventParm      = rand() & 255;  // seed for spread pattern
ADDRLP4 8
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 8
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 364
;364:	tent->s.otherEntityNum = ent->s.number;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 366
;365:
;366:	ShotgunPattern(muzzle_origin, tent->s.origin2, tent->s.eventParm, ent);
ADDRGP4 muzzle_origin
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ShotgunPattern
CALLV
pop
line 367
;367:}
LABELV $177
endproc weapon_supershotgun_fire 20 16
export weapon_grenadelauncher_fire
proc weapon_grenadelauncher_fire 20 12
line 377
;368:
;369:/*
;370:======================================================================
;371:
;372:GRENADE LAUNCHER
;373:
;374:======================================================================
;375:*/
;376:
;377:void weapon_grenadelauncher_fire(gentity_t* ent) {
line 381
;378:	gentity_t* m;
;379:
;380:	// extra vertical velocity
;381:	forward[2] += 0.2f;
ADDRLP4 4
ADDRGP4 forward+8
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
CNSTF4 1045220557
ADDF4
ASGNF4
line 382
;382:	VectorNormalize(forward);
ADDRGP4 forward
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 384
;383:
;384:	m = fire_grenade(ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 8
ADDRGP4 fire_grenade
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 385
;385:	m->damage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 386
;386:	m->splashDamage *= s_quadFactor;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 389
;387:
;388:	//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;389:}
LABELV $180
endproc weapon_grenadelauncher_fire 20 12
export Weapon_RocketLauncher_Fire
proc Weapon_RocketLauncher_Fire 16 12
line 399
;390:
;391:/*
;392:======================================================================
;393:
;394:ROCKET
;395:
;396:======================================================================
;397:*/
;398:
;399:void Weapon_RocketLauncher_Fire(gentity_t* ent) {
line 402
;400:	gentity_t* m;
;401:
;402:	m = fire_rocket(ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_rocket
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 403
;403:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 404
;404:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 407
;405:
;406:	//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;407:}
LABELV $182
endproc Weapon_RocketLauncher_Fire 16 12
export Weapon_Plasmagun_Fire
proc Weapon_Plasmagun_Fire 16 12
line 417
;408:
;409:/*
;410:======================================================================
;411:
;412:PLASMA GUN
;413:
;414:======================================================================
;415:*/
;416:
;417:void Weapon_Plasmagun_Fire(gentity_t* ent) {
line 420
;418:	gentity_t* m;
;419:
;420:	m = fire_plasma(ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4
ADDRGP4 fire_plasma
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 421
;421:	m->damage *= s_quadFactor;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 422
;422:	m->splashDamage *= s_quadFactor;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 744
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CVIF4 4
ADDRGP4 s_quadFactor
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 425
;423:
;424:	//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;425:}
LABELV $183
endproc Weapon_Plasmagun_Fire 16 12
export weapon_railgun_fire
proc weapon_railgun_fire 160 32
line 441
;426:
;427:/*
;428:======================================================================
;429:
;430:RAILGUN
;431:
;432:======================================================================
;433:*/
;434:
;435:/*
;436:=================
;437:weapon_railgun_fire
;438:=================
;439:*/
;440:#define MAX_RAIL_HITS 4
;441:void weapon_railgun_fire(gentity_t* ent) {
line 456
;442:	vec3_t end;
;443:#ifdef MISSIONPACK
;444:	vec3_t impactpoint, bouncedir;
;445:#endif
;446:	trace_t    trace;
;447:	gentity_t* tent;
;448:	gentity_t* traceEnt;
;449:	int        damage;
;450:	int        i;
;451:	int        hits;
;452:	int        unlinked;
;453:	int        passent;
;454:	gentity_t* unlinkedEntities[MAX_RAIL_HITS];
;455:
;456:	damage = 100 * s_quadFactor;
ADDRLP4 104
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1120403456
MULF4
CVFI4 4
ASGNI4
line 458
;457:
;458:	VectorMA(muzzle_origin, 8192.0, forward, end);
ADDRLP4 88
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRLP4 88+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
ADDRLP4 88+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1174405120
MULF4
ADDF4
ASGNF4
line 461
;459:
;460:	// unlagged
;461:	G_DoTimeShiftFor(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 464
;462:
;463:	// trace only against the solids, so the railgun will go through people
;464:	unlinked = 0;
ADDRLP4 60
CNSTI4 0
ASGNI4
line 465
;465:	hits     = 0;
ADDRLP4 108
CNSTI4 0
ASGNI4
line 466
;466:	passent  = ent->s.number;
ADDRLP4 100
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
LABELV $191
line 467
;467:	do {
line 468
;468:		trap_Trace(&trace, muzzle_origin, NULL, NULL, end, passent, MASK_SHOT);
ADDRLP4 4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 88
ARGP4
ADDRLP4 100
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 469
;469:		if (trace.entityNum >= ENTITYNUM_MAX_NORMAL) {
ADDRLP4 4+52
INDIRI4
CNSTI4 1022
LTI4 $194
line 470
;470:			break;
ADDRGP4 $193
JUMPV
LABELV $194
line 472
;471:		}
;472:		traceEnt = &g_entities[trace.entityNum];
ADDRLP4 0
ADDRLP4 4+52
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 473
;473:		if (traceEnt->takedamage) {
ADDRLP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $198
line 496
;474:#ifdef MISSIONPACK
;475:			if (traceEnt->client && traceEnt->client->invulnerabilityTime > level.time) {
;476:				if (G_InvulnerabilityEffect(traceEnt, forward, trace.endpos, impactpoint, bouncedir)) {
;477:					G_BounceProjectile(muzzle, impactpoint, bouncedir, end);
;478:					// snap the endpos to integers to save net bandwidth, but nudged towards the line
;479:					SnapVectorTowards(trace.endpos, muzzle);
;480:					// send railgun beam effect
;481:					tent = G_TempEntity(trace.endpos, EV_RAILTRAIL);
;482:					// set player number for custom colors on the railtrail
;483:					tent->s.clientNum = ent->s.clientNum;
;484:					VectorCopy(muzzle, tent->s.origin2);
;485:					// move origin a bit to come closer to the drawn gun muzzle
;486:					VectorMA(tent->s.origin2, 4, right, tent->s.origin2);
;487:					VectorMA(tent->s.origin2, -1, up, tent->s.origin2);
;488:					tent->s.eventParm = 255;  // don't make the explosion at the end
;489:					//
;490:					VectorCopy(impactpoint, muzzle);
;491:					// the player can hit him/herself with the bounced rail
;492:					passent = ENTITYNUM_NONE;
;493:				}
;494:			} else
;495:#else
;496:			{
line 497
;497:				if (LogAccuracyHit(traceEnt, ent)) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 112
INDIRI4
CNSTI4 0
EQI4 $200
line 498
;498:					hits++;
ADDRLP4 108
ADDRLP4 108
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 499
;499:				}
LABELV $200
line 500
;500:				G_Damage(traceEnt, ent, ent, forward, trace.endpos, damage, 0, MOD_RAILGUN);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 116
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRLP4 116
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 4+12
ARGP4
ADDRLP4 104
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 10
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 501
;501:			}
line 503
;502:#endif
;503:		}
LABELV $198
line 504
;504:		if (trace.contents & CONTENTS_SOLID) {
ADDRLP4 4+48
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $203
line 505
;505:			break;  // we hit something solid enough to stop the beam
ADDRGP4 $193
JUMPV
LABELV $203
line 508
;506:		}
;507:		// unlink this entity, so the next trace will go past it
;508:		trap_UnlinkEntity(traceEnt);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 509
;509:		unlinkedEntities[unlinked] = traceEnt;
ADDRLP4 60
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 72
ADDP4
ADDRLP4 0
INDIRP4
ASGNP4
line 510
;510:		unlinked++;
ADDRLP4 60
ADDRLP4 60
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 511
;511:	} while (unlinked < MAX_RAIL_HITS);
LABELV $192
ADDRLP4 60
INDIRI4
CNSTI4 4
LTI4 $191
LABELV $193
line 514
;512:
;513:	// unlagged
;514:	G_UndoTimeShiftFor(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 517
;515:
;516:	// link back in any entities we unlinked
;517:	for (i = 0; i < unlinked; i++) {
ADDRLP4 64
CNSTI4 0
ASGNI4
ADDRGP4 $209
JUMPV
LABELV $206
line 518
;518:		trap_LinkEntity(unlinkedEntities[i]);
ADDRLP4 64
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 72
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 519
;519:	}
LABELV $207
line 517
ADDRLP4 64
ADDRLP4 64
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $209
ADDRLP4 64
INDIRI4
ADDRLP4 60
INDIRI4
LTI4 $206
line 524
;520:
;521:	// the final trace endpos will be the terminal point of the rail trail
;522:
;523:	// snap the endpos to integers to save net bandwidth, but nudged towards the line
;524:	SnapVectorTowards(trace.endpos, muzzle_origin);
ADDRLP4 4+12
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 527
;525:
;526:	// send railgun beam effect
;527:	tent = G_TempEntity(trace.endpos, EV_RAILTRAIL);
ADDRLP4 4+12
ARGP4
CNSTI4 53
ARGI4
ADDRLP4 112
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 112
INDIRP4
ASGNP4
line 530
;528:
;529:	// set player number for custom colors on the railtrail
;530:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 68
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 532
;531:
;532:	VectorCopy(muzzle, tent->s.origin2);
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
ADDRGP4 muzzle
INDIRB
ASGNB 12
line 534
;533:	// move origin a bit to come closer to the drawn gun muzzle
;534:	VectorMA(tent->s.origin2, 4, right, tent->s.origin2);
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRGP4 right
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRGP4 right+4
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRGP4 right+8
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ASGNF4
line 535
;535:	VectorMA(tent->s.origin2, -1, up, tent->s.origin2);
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRGP4 up
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRGP4 up+4
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRGP4 up+8
INDIRF4
CNSTF4 3212836864
MULF4
ADDF4
ASGNF4
line 537
;536:
;537:	SnapVector(tent->s.origin2);
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 68
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 540
;538:
;539:	// no explosion at end if SURF_NOIMPACT, but still make the trail
;540:	if (trace.surfaceFlags & SURF_NOIMPACT) {
ADDRLP4 4+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $216
line 541
;541:		tent->s.eventParm = 255;  // don't make the explosion at the end
ADDRLP4 68
INDIRP4
CNSTI4 184
ADDP4
CNSTI4 255
ASGNI4
line 542
;542:	} else {
ADDRGP4 $217
JUMPV
LABELV $216
line 543
;543:		tent->s.eventParm = DirToByte(trace.plane.normal);
ADDRLP4 4+24
ARGP4
ADDRLP4 140
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 68
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 544
;544:	}
LABELV $217
line 545
;545:	tent->s.clientNum = ent->s.clientNum;
ADDRLP4 68
INDIRP4
CNSTI4 168
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 168
ADDP4
INDIRI4
ASGNI4
line 548
;546:
;547:	// give the shooter a reward sound if they have made two railgun hits in a row
;548:	if (hits == 0) {
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $220
line 550
;549:		// complete miss
;550:		ent->client->accurateCount = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
CNSTI4 0
ASGNI4
line 551
;551:	} else {
ADDRGP4 $221
JUMPV
LABELV $220
line 553
;552:		// check for "impressive" reward sound
;553:		ent->client->accurateCount += hits;
ADDRLP4 140
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 140
INDIRP4
ADDRLP4 140
INDIRP4
INDIRI4
ADDRLP4 108
INDIRI4
ADDI4
ASGNI4
line 554
;554:		if (ent->client->accurateCount >= 2) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
INDIRI4
CNSTI4 2
LTI4 $222
line 555
;555:			ent->client->accurateCount -= 2;
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 716
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 556
;556:			ent->client->ps.persistant[PERS_IMPRESSIVE_COUNT]++;
ADDRLP4 148
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 284
ADDP4
ASGNP4
ADDRLP4 148
INDIRP4
ADDRLP4 148
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 558
;557:			// add the sprite over the player's head
;558:			ent->client->ps.eFlags &= ~EF_AWARDS;
ADDRLP4 152
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 152
INDIRP4
ADDRLP4 152
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 559
;559:			ent->client->ps.eFlags |= EF_AWARD_IMPRESSIVE;
ADDRLP4 156
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 156
INDIRP4
ADDRLP4 156
INDIRP4
INDIRI4
CNSTI4 32768
BORI4
ASGNI4
line 560
;560:			ent->client->rewardTime = level.time + REWARD_SPRITE_TIME;
ADDRFP4 0
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
line 561
;561:		}
LABELV $222
line 562
;562:		ent->client->accuracy_hits++;
ADDRLP4 144
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 144
INDIRP4
ADDRLP4 144
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 563
;563:	}
LABELV $221
line 564
;564:}
LABELV $184
endproc weapon_railgun_fire 160 32
export Weapon_GrapplingHook_Fire
proc Weapon_GrapplingHook_Fire 4 12
line 574
;565:
;566:/*
;567:======================================================================
;568:
;569:GRAPPLING HOOK
;570:
;571:======================================================================
;572:*/
;573:
;574:void Weapon_GrapplingHook_Fire(gentity_t* ent) {
line 575
;575:	if (!ent->client->fireHeld && !ent->client->hook)
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 764
ADDP4
INDIRI4
CNSTI4 0
NEI4 $226
ADDRLP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $226
line 576
;576:		fire_grapple(ent, muzzle, forward);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 fire_grapple
CALLP4
pop
LABELV $226
line 578
;577:
;578:	ent->client->fireHeld = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 1
ASGNI4
line 579
;579:}
LABELV $225
endproc Weapon_GrapplingHook_Fire 4 12
export Weapon_HookFree
proc Weapon_HookFree 4 4
line 581
;580:
;581:void Weapon_HookFree(gentity_t* ent) {
line 582
;582:	ent->parent->client->hook = NULL;
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
line 583
;583:	ent->parent->client->ps.pm_flags &= ~PMF_GRAPPLE_PULL;
ADDRLP4 0
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
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2049
BANDI4
ASGNI4
line 584
;584:	G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 585
;585:}
LABELV $228
endproc Weapon_HookFree 4 4
export Weapon_HookThink
proc Weapon_HookThink 36 8
line 587
;586:
;587:void Weapon_HookThink(gentity_t* ent) {
line 588
;588:	if (ent->enemy) {
ADDRFP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $230
line 591
;589:		vec3_t v, oldorigin;
;590:
;591:		VectorCopy(ent->r.currentOrigin, oldorigin);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 592
;592:		v[0] = ent->enemy->r.currentOrigin[0] + (ent->enemy->r.mins[0] + ent->enemy->r.maxs[0]) * 0.5;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 24
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 488
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDRLP4 24
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 593
;593:		v[1] = ent->enemy->r.currentOrigin[1] + (ent->enemy->r.mins[1] + ent->enemy->r.maxs[1]) * 0.5;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+4
ADDRLP4 28
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 492
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDRLP4 28
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 594
;594:		v[2] = ent->enemy->r.currentOrigin[2] + (ent->enemy->r.mins[2] + ent->enemy->r.maxs[2]) * 0.5;
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 32
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 496
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDRLP4 32
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 595
;595:		SnapVectorTowards(v, oldorigin);  // save net bandwidth
ADDRLP4 0
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 SnapVectorTowards
CALLV
pop
line 597
;596:
;597:		G_SetOrigin(ent, v);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SetOrigin
CALLV
pop
line 598
;598:	}
LABELV $230
line 600
;599:
;600:	VectorCopy(ent->r.currentOrigin, ent->parent->client->ps.grapplePoint);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 600
ADDP4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRB
ASGNB 12
line 601
;601:}
LABELV $229
endproc Weapon_HookThink 36 8
export Weapon_LightningFire
proc Weapon_LightningFire 100 32
line 611
;602:
;603:/*
;604:======================================================================
;605:
;606:LIGHTNING GUN
;607:
;608:======================================================================
;609:*/
;610:
;611:void Weapon_LightningFire(gentity_t* ent) {
line 620
;612:	trace_t tr;
;613:	vec3_t  end;
;614:#ifdef MISSIONPACK
;615:	vec3_t impactpoint, bouncedir;
;616:#endif
;617:	gentity_t *traceEnt, *tent;
;618:	int        damage, i, passent;
;619:
;620:	damage = 8 * s_quadFactor;
ADDRLP4 84
ADDRGP4 s_quadFactor
INDIRF4
CNSTF4 1090519040
MULF4
CVFI4 4
ASGNI4
line 622
;621:
;622:	passent = ent->s.number;
ADDRLP4 80
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 624
;623:
;624:	for (i = 0; i < 10; i++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
LABELV $235
line 625
;625:		VectorMA(muzzle_origin, LIGHTNING_RANGE, forward, end);
ADDRLP4 60
ADDRGP4 muzzle_origin
INDIRF4
ADDRGP4 forward
INDIRF4
CNSTF4 1145044992
MULF4
ADDF4
ASGNF4
ADDRLP4 60+4
ADDRGP4 muzzle_origin+4
INDIRF4
ADDRGP4 forward+4
INDIRF4
CNSTF4 1145044992
MULF4
ADDF4
ASGNF4
ADDRLP4 60+8
ADDRGP4 muzzle_origin+8
INDIRF4
ADDRGP4 forward+8
INDIRF4
CNSTF4 1145044992
MULF4
ADDF4
ASGNF4
line 628
;626:
;627:		// unlagged
;628:		G_DoTimeShiftFor(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_DoTimeShiftFor
CALLV
pop
line 630
;629:
;630:		trap_Trace(&tr, muzzle_origin, NULL, NULL, end, passent, MASK_SHOT);
ADDRLP4 0
ARGP4
ADDRGP4 muzzle_origin
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 60
ARGP4
ADDRLP4 80
INDIRI4
ARGI4
CNSTI4 100663297
ARGI4
ADDRGP4 trap_Trace
CALLV
pop
line 633
;631:
;632:		// unlagged
;633:		G_UndoTimeShiftFor(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_UndoTimeShiftFor
CALLV
pop
line 647
;634:
;635:#ifdef MISSIONPACK
;636:		// if not the first trace (the lightning bounced of an invulnerability sphere)
;637:		if (i) {
;638:			// add bounced off lightning bolt temp entity
;639:			// the first lightning bolt is a cgame only visual
;640:			//
;641:			tent = G_TempEntity(muzzle, EV_LIGHTNINGBOLT);
;642:			VectorCopy(tr.endpos, end);
;643:			SnapVector(end);
;644:			VectorCopy(end, tent->s.origin2);
;645:		}
;646:#endif
;647:		if (tr.entityNum == ENTITYNUM_NONE) {
ADDRLP4 0+52
INDIRI4
CNSTI4 1023
NEI4 $245
line 648
;648:			return;
ADDRGP4 $234
JUMPV
LABELV $245
line 651
;649:		}
;650:
;651:		traceEnt = &g_entities[tr.entityNum];
ADDRLP4 56
ADDRLP4 0+52
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 653
;652:
;653:		if (traceEnt->takedamage) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $249
line 670
;654:#ifdef MISSIONPACK
;655:			if (traceEnt->client && traceEnt->client->invulnerabilityTime > level.time) {
;656:				if (G_InvulnerabilityEffect(traceEnt, forward, tr.endpos, impactpoint, bouncedir)) {
;657:					G_BounceProjectile(muzzle, impactpoint, bouncedir, end);
;658:					VectorCopy(impactpoint, muzzle);
;659:					VectorSubtract(end, impactpoint, forward);
;660:					VectorNormalize(forward);
;661:					// the player can hit him/herself with the bounced lightning
;662:					passent = ENTITYNUM_NONE;
;663:				} else {
;664:					VectorCopy(tr.endpos, muzzle);
;665:					passent = traceEnt->s.number;
;666:				}
;667:				continue;
;668:			}
;669:#else
;670:			if (LogAccuracyHit(traceEnt, ent)) {
ADDRLP4 56
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 88
ADDRGP4 LogAccuracyHit
CALLI4
ASGNI4
ADDRLP4 88
INDIRI4
CNSTI4 0
EQI4 $251
line 671
;671:				ent->client->accuracy_hits++;
ADDRLP4 92
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 724
ADDP4
ASGNP4
ADDRLP4 92
INDIRP4
ADDRLP4 92
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 672
;672:			}
LABELV $251
line 673
;673:			G_Damage(traceEnt, ent, ent, forward, tr.endpos, damage, 0, MOD_LIGHTNING);
ADDRLP4 56
INDIRP4
ARGP4
ADDRLP4 92
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRLP4 92
INDIRP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRLP4 0+12
ARGP4
ADDRLP4 84
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 675
;674:#endif
;675:		}
LABELV $249
line 677
;676:
;677:		if (traceEnt->takedamage && traceEnt->client) {
ADDRLP4 56
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
EQI4 $254
ADDRLP4 56
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $254
line 678
;678:			tent                   = G_TempEntity(tr.endpos, EV_MISSILE_HIT);
ADDRLP4 0+12
ARGP4
CNSTI4 50
ARGI4
ADDRLP4 92
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 92
INDIRP4
ASGNP4
line 679
;679:			tent->s.otherEntityNum = traceEnt->s.number;
ADDRLP4 72
INDIRP4
CNSTI4 140
ADDP4
ADDRLP4 56
INDIRP4
INDIRI4
ASGNI4
line 680
;680:			tent->s.eventParm      = DirToByte(tr.plane.normal);
ADDRLP4 0+24
ARGP4
ADDRLP4 96
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 681
;681:			tent->s.weapon         = ent->s.weapon;
ADDRLP4 72
INDIRP4
CNSTI4 192
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
line 682
;682:		} else if (!(tr.surfaceFlags & SURF_NOIMPACT)) {
ADDRGP4 $237
JUMPV
LABELV $254
ADDRLP4 0+44
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $237
line 683
;683:			tent              = G_TempEntity(tr.endpos, EV_MISSILE_MISS);
ADDRLP4 0+12
ARGP4
CNSTI4 51
ARGI4
ADDRLP4 92
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 72
ADDRLP4 92
INDIRP4
ASGNP4
line 684
;684:			tent->s.eventParm = DirToByte(tr.plane.normal);
ADDRLP4 0+24
ARGP4
ADDRLP4 96
ADDRGP4 DirToByte
CALLI4
ASGNI4
ADDRLP4 72
INDIRP4
CNSTI4 184
ADDP4
ADDRLP4 96
INDIRI4
ASGNI4
line 685
;685:		}
line 687
;686:
;687:		break;
ADDRGP4 $237
JUMPV
LABELV $236
line 624
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 76
INDIRI4
CNSTI4 10
LTI4 $235
LABELV $237
line 689
;688:	}
;689:}
LABELV $234
endproc Weapon_LightningFire 100 32
export LogAccuracyHit
proc LogAccuracyHit 4 8
line 744
;690:
;691:#ifdef MISSIONPACK
;692:/*
;693:======================================================================
;694:
;695:NAILGUN
;696:
;697:======================================================================
;698:*/
;699:
;700:void Weapon_Nailgun_Fire(gentity_t* ent) {
;701:	gentity_t* m;
;702:	int        count;
;703:
;704:	for (count = 0; count < NUM_NAILSHOTS; count++) {
;705:		m = fire_nail(ent, muzzle, forward, right, up);
;706:		m->damage *= s_quadFactor;
;707:		m->splashDamage *= s_quadFactor;
;708:	}
;709:
;710:	//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;711:}
;712:
;713:/*
;714:======================================================================
;715:
;716:PROXIMITY MINE LAUNCHER
;717:
;718:======================================================================
;719:*/
;720:
;721:void weapon_proxlauncher_fire(gentity_t* ent) {
;722:	gentity_t* m;
;723:
;724:	// extra vertical velocity
;725:	forward[2] += 0.2f;
;726:	VectorNormalize(forward);
;727:
;728:	m = fire_prox(ent, muzzle, forward);
;729:	m->damage *= s_quadFactor;
;730:	m->splashDamage *= s_quadFactor;
;731:
;732:	//	VectorAdd( m->s.pos.trDelta, ent->client->ps.velocity, m->s.pos.trDelta );	// "real" physics
;733:}
;734:
;735:#endif
;736:
;737://======================================================================
;738:
;739:/*
;740:===============
;741:LogAccuracyHit
;742:===============
;743:*/
;744:qboolean LogAccuracyHit(gentity_t* target, gentity_t* attacker) {
line 745
;745:	if (!target->takedamage) {
ADDRFP4 0
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $264
line 746
;746:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $263
JUMPV
LABELV $264
line 749
;747:	}
;748:
;749:	if (target == attacker) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRFP4 4
INDIRP4
CVPU4 4
NEU4 $266
line 750
;750:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $263
JUMPV
LABELV $266
line 753
;751:	}
;752:
;753:	if (!target->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $268
line 754
;754:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $263
JUMPV
LABELV $268
line 757
;755:	}
;756:
;757:	if (!attacker->client) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $270
line 758
;758:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $263
JUMPV
LABELV $270
line 761
;759:	}
;760:
;761:	if (target->client->ps.stats[STAT_HEALTH] <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $272
line 762
;762:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $263
JUMPV
LABELV $272
line 765
;763:	}
;764:
;765:	if (OnSameTeam(target, attacker)) {
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
EQI4 $274
line 766
;766:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $263
JUMPV
LABELV $274
line 769
;767:	}
;768:
;769:	return qtrue;
CNSTI4 1
RETI4
LABELV $263
endproc LogAccuracyHit 4 8
export FireWeapon
proc FireWeapon 12 24
line 777
;770:}
;771:
;772:/*
;773:===============
;774:FireWeapon
;775:===============
;776:*/
;777:void FireWeapon(gentity_t* ent) {
line 778
;778:	if (ent->client->ps.powerups[PW_QUAD]) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
CNSTI4 0
EQI4 $277
line 779
;779:		s_quadFactor = g_quadfactor.value;
ADDRGP4 s_quadFactor
ADDRGP4 g_quadfactor+8
INDIRF4
ASGNF4
line 780
;780:	} else {
ADDRGP4 $278
JUMPV
LABELV $277
line 781
;781:		s_quadFactor = 1.0;
ADDRGP4 s_quadFactor
CNSTF4 1065353216
ASGNF4
line 782
;782:	}
LABELV $278
line 790
;783:#ifdef MISSIONPACK
;784:	if (ent->client->persistantPowerup && ent->client->persistantPowerup->item && ent->client->persistantPowerup->item->giTag == PW_DOUBLER) {
;785:		s_quadFactor *= 2;
;786:	}
;787:#endif
;788:
;789:	// track shots taken for accuracy tracking.  Grapple is not a weapon and gauntet is just not tracked
;790:	if (ent->s.weapon != WP_GRAPPLING_HOOK && ent->s.weapon != WP_GAUNTLET) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 10
EQI4 $280
ADDRLP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 1
EQI4 $280
line 798
;791:#ifdef MISSIONPACK
;792:		if (ent->s.weapon == WP_NAILGUN) {
;793:			ent->client->accuracy_shots += NUM_NAILSHOTS;
;794:		} else {
;795:			ent->client->accuracy_shots++;
;796:		}
;797:#else
;798:		ent->client->accuracy_shots++;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 720
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 800
;799:#endif
;800:	}
LABELV $280
line 803
;801:
;802:	// set aiming directions
;803:	AngleVectors(ent->client->ps.viewangles, forward, right, up);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 152
ADDP4
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 AngleVectors
CALLV
pop
line 805
;804:
;805:	CalcMuzzlePointOrigin(ent, muzzle_origin, forward, right, up, muzzle);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 muzzle_origin
ARGP4
ADDRGP4 forward
ARGP4
ADDRGP4 right
ARGP4
ADDRGP4 up
ARGP4
ADDRGP4 muzzle
ARGP4
ADDRGP4 CalcMuzzlePointOrigin
CALLV
pop
line 808
;806:
;807:	// fire the specific weapon
;808:	switch (ent->s.weapon) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 1
LTI4 $283
ADDRLP4 4
INDIRI4
CNSTI4 10
GTI4 $283
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $298-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $298
address $285
address $288
address $287
address $292
address $293
address $286
address $295
address $294
address $296
address $297
code
LABELV $285
line 810
;809:	case WP_GAUNTLET:
;810:		Weapon_Gauntlet(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Gauntlet
CALLV
pop
line 811
;811:		break;
ADDRGP4 $283
JUMPV
LABELV $286
line 813
;812:	case WP_LIGHTNING:
;813:		Weapon_LightningFire(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_LightningFire
CALLV
pop
line 814
;814:		break;
ADDRGP4 $283
JUMPV
LABELV $287
line 816
;815:	case WP_SHOTGUN:
;816:		weapon_supershotgun_fire(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_supershotgun_fire
CALLV
pop
line 817
;817:		break;
ADDRGP4 $283
JUMPV
LABELV $288
line 819
;818:	case WP_MACHINEGUN:
;819:		if (g_gametype.integer != GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
EQI4 $289
line 820
;820:			Bullet_Fire(ent, MACHINEGUN_SPREAD, MACHINEGUN_DAMAGE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1128792064
ARGF4
CNSTI4 7
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 821
;821:		} else {
ADDRGP4 $283
JUMPV
LABELV $289
line 822
;822:			Bullet_Fire(ent, MACHINEGUN_SPREAD, MACHINEGUN_TEAM_DAMAGE);
ADDRFP4 0
INDIRP4
ARGP4
CNSTF4 1128792064
ARGF4
CNSTI4 5
ARGI4
ADDRGP4 Bullet_Fire
CALLV
pop
line 823
;823:		}
line 824
;824:		break;
ADDRGP4 $283
JUMPV
LABELV $292
line 826
;825:	case WP_GRENADE_LAUNCHER:
;826:		weapon_grenadelauncher_fire(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_grenadelauncher_fire
CALLV
pop
line 827
;827:		break;
ADDRGP4 $283
JUMPV
LABELV $293
line 829
;828:	case WP_ROCKET_LAUNCHER:
;829:		Weapon_RocketLauncher_Fire(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_RocketLauncher_Fire
CALLV
pop
line 830
;830:		break;
ADDRGP4 $283
JUMPV
LABELV $294
line 832
;831:	case WP_PLASMAGUN:
;832:		Weapon_Plasmagun_Fire(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_Plasmagun_Fire
CALLV
pop
line 833
;833:		break;
ADDRGP4 $283
JUMPV
LABELV $295
line 835
;834:	case WP_RAILGUN:
;835:		weapon_railgun_fire(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 weapon_railgun_fire
CALLV
pop
line 836
;836:		break;
ADDRGP4 $283
JUMPV
LABELV $296
line 838
;837:	case WP_BFG:
;838:		BFG_Fire(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BFG_Fire
CALLV
pop
line 839
;839:		break;
ADDRGP4 $283
JUMPV
LABELV $297
line 841
;840:	case WP_GRAPPLING_HOOK:
;841:		Weapon_GrapplingHook_Fire(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Weapon_GrapplingHook_Fire
CALLV
pop
line 842
;842:		break;
line 856
;843:#ifdef MISSIONPACK
;844:	case WP_NAILGUN:
;845:		Weapon_Nailgun_Fire(ent);
;846:		break;
;847:	case WP_PROX_LAUNCHER:
;848:		weapon_proxlauncher_fire(ent);
;849:		break;
;850:	case WP_CHAINGUN:
;851:		Bullet_Fire(ent, CHAINGUN_SPREAD, MACHINEGUN_DAMAGE);
;852:		break;
;853:#endif
;854:	default:
;855:		// FIXME		G_Error( "Bad ent->s.weapon" );
;856:		break;
LABELV $283
line 858
;857:	}
;858:}
LABELV $276
endproc FireWeapon 12 24
bss
align 4
LABELV muzzle_origin
skip 12
align 4
LABELV muzzle
skip 12
align 4
LABELV up
skip 12
align 4
LABELV right
skip 12
align 4
LABELV forward
skip 12
align 4
LABELV s_quadFactor
skip 4
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
import CalcMuzzlePoint
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
