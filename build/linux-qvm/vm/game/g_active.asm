export P_DamageFeedback
code
proc P_DamageFeedback 36 12
file "../../../../code/game/g_active.c"
line 16
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:/*
;7:===============
;8:G_DamageFeedback
;9:
;10:Called just before a snapshot is sent to the given player.
;11:Totals up all damage and generates both the player_state_t
;12:damage values to that client for pain blends and kicks, and
;13:global pain sound events for all clients.
;14:===============
;15:*/
;16:void P_DamageFeedback(gentity_t* player) {
line 21
;17:	gclient_t* client;
;18:	float      count;
;19:	vec3_t     angles;
;20:
;21:	client = player->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 22
;22:	if (client->ps.pm_type == PM_DEAD) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $55
line 23
;23:		return;
ADDRGP4 $54
JUMPV
LABELV $55
line 27
;24:	}
;25:
;26:	// total points of damage shot at the player this frame
;27:	count = client->damage_blood + client->damage_armor;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
ADDI4
CVIF4 4
ASGNF4
line 28
;28:	if (count == 0) {
ADDRLP4 4
INDIRF4
CNSTF4 0
NEF4 $57
line 29
;29:		return;  // didn't take any damage
ADDRGP4 $54
JUMPV
LABELV $57
line 32
;30:	}
;31:
;32:	if (count > 255) {
ADDRLP4 4
INDIRF4
CNSTF4 1132396544
LEF4 $59
line 33
;33:		count = 255;
ADDRLP4 4
CNSTF4 1132396544
ASGNF4
line 34
;34:	}
LABELV $59
line 40
;35:
;36:	// send the information to the client
;37:
;38:	// world damage (falling, slime, etc) uses a special code
;39:	// to make the blend blob centered instead of positional
;40:	if (client->damage_fromWorld) {
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
INDIRI4
CNSTI4 0
EQI4 $61
line 41
;41:		client->ps.damagePitch = 255;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
CNSTI4 255
ASGNI4
line 42
;42:		client->ps.damageYaw   = 255;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
CNSTI4 255
ASGNI4
line 44
;43:
;44:		client->damage_fromWorld = qfalse;
ADDRLP4 0
INDIRP4
CNSTI4 712
ADDP4
CNSTI4 0
ASGNI4
line 45
;45:	} else {
ADDRGP4 $62
JUMPV
LABELV $61
line 46
;46:		vectoangles(client->damage_from, angles);
ADDRLP4 0
INDIRP4
CNSTI4 700
ADDP4
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 vectoangles
CALLV
pop
line 47
;47:		client->ps.damagePitch = angles[PITCH] / 360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 176
ADDP4
ADDRLP4 8
INDIRF4
CNSTF4 1060506465
MULF4
CVFI4 4
ASGNI4
line 48
;48:		client->ps.damageYaw   = angles[YAW] / 360.0 * 256;
ADDRLP4 0
INDIRP4
CNSTI4 172
ADDP4
ADDRLP4 8+4
INDIRF4
CNSTF4 1060506465
MULF4
CVFI4 4
ASGNI4
line 49
;49:	}
LABELV $62
line 52
;50:
;51:	// play an apropriate pain sound
;52:	if ((level.time > player->pain_debounce_time) && !(player->flags & FL_GODMODE)) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
LEI4 $64
ADDRLP4 24
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
NEI4 $64
line 53
;53:		player->pain_debounce_time = level.time + 700;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 700
ADDI4
ASGNI4
line 54
;54:		G_AddEvent(player, EV_PAIN, player->health);
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ARGP4
CNSTI4 56
ARGI4
ADDRLP4 28
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 55
;55:		client->ps.damageEvent++;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 168
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 56
;56:	}
LABELV $64
line 58
;57:
;58:	client->ps.damageCount = count;
ADDRLP4 0
INDIRP4
CNSTI4 180
ADDP4
ADDRLP4 4
INDIRF4
CVFI4 4
ASGNI4
line 63
;59:
;60:	//
;61:	// clear totals
;62:	//
;63:	client->damage_blood     = 0;
ADDRLP4 0
INDIRP4
CNSTI4 692
ADDP4
CNSTI4 0
ASGNI4
line 64
;64:	client->damage_armor     = 0;
ADDRLP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 65
;65:	client->damage_knockback = 0;
ADDRLP4 0
INDIRP4
CNSTI4 696
ADDP4
CNSTI4 0
ASGNI4
line 66
;66:}
LABELV $54
endproc P_DamageFeedback 36 12
export P_WorldEffects
proc P_WorldEffects 24 32
line 75
;67:
;68:/*
;69:=============
;70:P_WorldEffects
;71:
;72:Check for lava / slime contents and drowning
;73:=============
;74:*/
;75:void P_WorldEffects(gentity_t* ent) {
line 79
;76:	qboolean envirosuit;
;77:	int      waterlevel;
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
EQI4 $69
line 80
;80:		ent->client->airOutTime = level.time + 12000;  // don't need air
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 81
;81:		return;
ADDRGP4 $68
JUMPV
LABELV $69
line 84
;82:	}
;83:
;84:	waterlevel = ent->waterlevel;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
ASGNI4
line 86
;85:
;86:	envirosuit = ent->client->ps.powerups[PW_BATTLESUIT] > level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 320
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $74
ADDRLP4 8
CNSTI4 1
ASGNI4
ADDRGP4 $75
JUMPV
LABELV $74
ADDRLP4 8
CNSTI4 0
ASGNI4
LABELV $75
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 91
;87:
;88:	//
;89:	// check for drowning
;90:	//
;91:	if (waterlevel == 3) {
ADDRLP4 0
INDIRI4
CNSTI4 3
NEI4 $76
line 93
;92:		// envirosuit give air
;93:		if (envirosuit) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $78
line 94
;94:			ent->client->airOutTime = level.time + 10000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 10000
ADDI4
ASGNI4
line 95
;95:		}
LABELV $78
line 98
;96:
;97:		// if out of air, start drowning
;98:		if (ent->client->airOutTime < level.time) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $77
line 100
;99:			// drown!
;100:			ent->client->airOutTime += 1000;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 101
;101:			if (ent->health > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
LEI4 $77
line 103
;102:				// take more damage the longer underwater
;103:				ent->damage += 2;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 2
ADDI4
ASGNI4
line 104
;104:				if (ent->damage > 15)
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 15
LEI4 $86
line 105
;105:					ent->damage = 15;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 15
ASGNI4
LABELV $86
line 108
;106:
;107:				// don't play a normal pain sound
;108:				ent->pain_debounce_time = level.time + 200;
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 110
;109:
;110:				G_Damage(ent, NULL, NULL, NULL, NULL, ent->damage, DAMAGE_NO_ARMOR, MOD_WATER);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 20
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
CNSTI4 2
ARGI4
CNSTI4 14
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 111
;111:			}
line 112
;112:		}
line 113
;113:	} else {
ADDRGP4 $77
JUMPV
LABELV $76
line 114
;114:		ent->client->airOutTime = level.time + 12000;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 756
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 12000
ADDI4
ASGNI4
line 115
;115:		ent->damage             = 2;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 2
ASGNI4
line 116
;116:	}
LABELV $77
line 121
;117:
;118:	//
;119:	// check for sizzle damage (move to pmove?)
;120:	//
;121:	if (waterlevel && (ent->watertype & (CONTENTS_LAVA | CONTENTS_SLIME))) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $90
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
EQI4 $90
line 122
;122:		if (ent->health > 0 && ent->pain_debounce_time <= level.time) {
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CNSTI4 0
LEI4 $92
ADDRLP4 12
INDIRP4
CNSTI4 720
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GTI4 $92
line 124
;123:
;124:			if (envirosuit) {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $95
line 125
;125:				G_AddEvent(ent, EV_POWERUP_BATTLESUIT, 0);
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
line 126
;126:			} else {
ADDRGP4 $96
JUMPV
LABELV $95
line 127
;127:				if (ent->watertype & CONTENTS_LAVA) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $97
line 128
;128:					G_Damage(ent, NULL, NULL, NULL, NULL, 30 * waterlevel, 0, MOD_LAVA);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 30
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 16
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 129
;129:				}
LABELV $97
line 131
;130:
;131:				if (ent->watertype & CONTENTS_SLIME) {
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $99
line 132
;132:					G_Damage(ent, NULL, NULL, NULL, NULL, 10 * waterlevel, 0, MOD_SLIME);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 10
MULI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 15
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 133
;133:				}
LABELV $99
line 134
;134:			}
LABELV $96
line 135
;135:		}
LABELV $92
line 136
;136:	}
LABELV $90
line 137
;137:}
LABELV $68
endproc P_WorldEffects 24 32
export G_SetClientSound
proc G_SetClientSound 4 0
line 144
;138:
;139:/*
;140:===============
;141:G_SetClientSound
;142:===============
;143:*/
;144:void G_SetClientSound(gentity_t* ent) {
line 150
;145:#ifdef MISSIONPACK
;146:	if (ent->s.eFlags & EF_TICKING) {
;147:		ent->client->ps.loopSound = G_SoundIndex("sound/weapons/proxmine/wstbtick.wav");
;148:	} else
;149:#endif
;150:		if (ent->waterlevel && (ent->watertype & (CONTENTS_LAVA | CONTENTS_SLIME))) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 788
ADDP4
INDIRI4
CNSTI4 0
EQI4 $102
ADDRLP4 0
INDIRP4
CNSTI4 784
ADDP4
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
EQI4 $102
line 151
;151:		ent->client->ps.loopSound = level.snd_fry;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 444
ADDP4
ADDRGP4 level+352
INDIRI4
ASGNI4
line 152
;152:	} else {
ADDRGP4 $103
JUMPV
LABELV $102
line 153
;153:		ent->client->ps.loopSound = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 444
ADDP4
CNSTI4 0
ASGNI4
line 154
;154:	}
LABELV $103
line 155
;155:}
LABELV $101
endproc G_SetClientSound 4 0
export ClientImpacts
proc ClientImpacts 76 12
line 164
;156:
;157://==============================================================
;158:
;159:/*
;160:==============
;161:ClientImpacts
;162:==============
;163:*/
;164:void ClientImpacts(gentity_t* ent, pmove_t* pm) {
line 169
;165:	int        i, j;
;166:	trace_t    trace;
;167:	gentity_t* other;
;168:
;169:	memset(&trace, 0, sizeof(trace));
ADDRLP4 12
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 170
;170:	for (i = 0; i < pm->numtouch; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $109
JUMPV
LABELV $106
line 171
;171:		for (j = 0; j < i; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $113
JUMPV
LABELV $110
line 172
;172:			if (pm->touchents[j] == pm->touchents[i]) {
ADDRLP4 68
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 48
ADDP4
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
INDIRP4
CNSTI4 48
ADDP4
ADDP4
INDIRI4
NEI4 $114
line 173
;173:				break;
ADDRGP4 $112
JUMPV
LABELV $114
line 175
;174:			}
;175:		}
LABELV $111
line 171
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $113
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $110
LABELV $112
line 176
;176:		if (j != i) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $116
line 177
;177:			continue;  // duplicated
ADDRGP4 $107
JUMPV
LABELV $116
line 179
;178:		}
;179:		other = &g_entities[pm->touchents[i]];
ADDRLP4 8
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
CNSTI4 48
ADDP4
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 181
;180:
;181:		if ((ent->r.svFlags & SVF_BOT) && (ent->touch)) {
ADDRLP4 68
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 68
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $118
ADDRLP4 68
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
line 182
;182:			ent->touch(ent, other, &trace);
ADDRLP4 72
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 72
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CALLV
pop
line 183
;183:		}
LABELV $118
line 185
;184:
;185:		if (!other->touch) {
ADDRLP4 8
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $120
line 186
;186:			continue;
ADDRGP4 $107
JUMPV
LABELV $120
line 189
;187:		}
;188:
;189:		other->touch(other, ent, &trace);
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CALLV
pop
line 190
;190:	}
LABELV $107
line 170
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $109
ADDRLP4 4
INDIRI4
ADDRFP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LTI4 $106
line 191
;191:}
LABELV $105
endproc ClientImpacts 76 12
data
align 4
LABELV $123
byte 4 1109393408
byte 4 1109393408
byte 4 1112539136
export G_TouchTriggers
code
proc G_TouchTriggers 4224 16
line 201
;192:
;193:/*
;194:============
;195:G_TouchTriggers
;196:
;197:Find all trigger entities that ent's current position touches.
;198:Spectators will only interact with teleporters.
;199:============
;200:*/
;201:void G_TouchTriggers(gentity_t* ent) {
line 209
;202:	int           i, num;
;203:	int           touch[MAX_GENTITIES];
;204:	gentity_t*    hit;
;205:	trace_t       trace;
;206:	vec3_t        mins, maxs;
;207:	static vec3_t range = {40, 40, 52};
;208:
;209:	if (!ent->client) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $124
line 210
;210:		return;
ADDRGP4 $122
JUMPV
LABELV $124
line 214
;211:	}
;212:
;213:	// dead clients don't activate triggers!
;214:	if (ent->client->ps.stats[STAT_HEALTH] <= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $126
line 215
;215:		return;
ADDRGP4 $122
JUMPV
LABELV $126
line 218
;216:	}
;217:
;218:	VectorSubtract(ent->client->ps.origin, range, mins);
ADDRLP4 4188
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 4188
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $123
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 4188
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $123+4
INDIRF4
SUBF4
ASGNF4
ADDRLP4 64+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $123+8
INDIRF4
SUBF4
ASGNF4
line 219
;219:	VectorAdd(ent->client->ps.origin, range, maxs);
ADDRLP4 4192
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
ADDRLP4 4192
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRGP4 $123
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 4192
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRGP4 $123+4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRGP4 $123+8
INDIRF4
ADDF4
ASGNF4
line 221
;220:
;221:	num = trap_EntitiesInBox(mins, maxs, touch, MAX_GENTITIES);
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 92
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 4196
ADDRGP4 trap_EntitiesInBox
CALLI4
ASGNI4
ADDRLP4 88
ADDRLP4 4196
INDIRI4
ASGNI4
line 224
;222:
;223:	// can't use ent->absmin, because that has a one unit pad
;224:	VectorAdd(ent->client->ps.origin, ent->r.mins, mins);
ADDRLP4 4200
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
ADDRLP4 4200
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4200
INDIRP4
CNSTI4 436
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 4200
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4200
INDIRP4
CNSTI4 440
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4204
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64+8
ADDRLP4 4204
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4204
INDIRP4
CNSTI4 444
ADDP4
INDIRF4
ADDF4
ASGNF4
line 225
;225:	VectorAdd(ent->client->ps.origin, ent->r.maxs, maxs);
ADDRLP4 4208
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76
ADDRLP4 4208
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 4208
INDIRP4
CNSTI4 448
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 76+4
ADDRLP4 4208
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 4208
INDIRP4
CNSTI4 452
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4212
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 76+8
ADDRLP4 4212
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 4212
INDIRP4
CNSTI4 456
ADDP4
INDIRF4
ADDF4
ASGNF4
line 227
;226:
;227:	for (i = 0; i < num; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $143
JUMPV
LABELV $140
line 228
;228:		hit = &g_entities[touch[i]];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 92
ADDP4
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 230
;229:
;230:		if (!hit->touch && !ent->touch) {
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $144
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $144
line 231
;231:			continue;
ADDRGP4 $141
JUMPV
LABELV $144
line 233
;232:		}
;233:		if (!(hit->r.contents & CONTENTS_TRIGGER)) {
ADDRLP4 0
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
CNSTI4 1073741824
BANDI4
CNSTI4 0
NEI4 $146
line 234
;234:			continue;
ADDRGP4 $141
JUMPV
LABELV $146
line 238
;235:		}
;236:
;237:		// ignore most entities if a spectator
;238:		if (ent->client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $148
line 239
;239:			if (hit->s.eType != ET_TELEPORT_TRIGGER &&
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 9
EQI4 $150
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
ADDRGP4 Touch_DoorTrigger
CVPU4 4
EQU4 $150
line 242
;240:			    // this is ugly but adding a new ET_? type will
;241:			    // most likely cause network incompatibilities
;242:			    hit->touch != Touch_DoorTrigger) {
line 243
;243:				continue;
ADDRGP4 $141
JUMPV
LABELV $150
line 245
;244:			}
;245:		}
LABELV $148
line 249
;246:
;247:		// use seperate code for determining if an item is picked up
;248:		// so you don't have to actually contact its bounding box
;249:		if (hit->s.eType == ET_ITEM) {
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
NEI4 $152
line 250
;250:			if (!BG_PlayerTouchesItem(&ent->client->ps, &hit->s, level.time)) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 level+32
INDIRI4
ARGI4
ADDRLP4 4216
ADDRGP4 BG_PlayerTouchesItem
CALLI4
ASGNI4
ADDRLP4 4216
INDIRI4
CNSTI4 0
NEI4 $153
line 251
;251:				continue;
ADDRGP4 $141
JUMPV
line 253
;252:			}
;253:		} else {
LABELV $152
line 254
;254:			if (!trap_EntityContact(mins, maxs, hit)) {
ADDRLP4 64
ARGP4
ADDRLP4 76
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 4216
ADDRGP4 trap_EntityContact
CALLI4
ASGNI4
ADDRLP4 4216
INDIRI4
CNSTI4 0
NEI4 $157
line 255
;255:				continue;
ADDRGP4 $141
JUMPV
LABELV $157
line 257
;256:			}
;257:		}
LABELV $153
line 259
;258:
;259:		memset(&trace, 0, sizeof(trace));
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
CNSTI4 56
ARGI4
ADDRGP4 memset
CALLP4
pop
line 261
;260:
;261:		if (hit->touch) {
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $159
line 262
;262:			hit->touch(hit, ent, &trace);
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CALLV
pop
line 263
;263:		}
LABELV $159
line 265
;264:
;265:		if ((ent->r.svFlags & SVF_BOT) && (ent->touch)) {
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4216
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $161
ADDRLP4 4216
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $161
line 266
;266:			ent->touch(ent, hit, &trace);
ADDRLP4 4220
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4220
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 4220
INDIRP4
CNSTI4 704
ADDP4
INDIRP4
CALLV
pop
line 267
;267:		}
LABELV $161
line 268
;268:	}
LABELV $141
line 227
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $143
ADDRLP4 4
INDIRI4
ADDRLP4 88
INDIRI4
LTI4 $140
line 271
;269:
;270:	// if we didn't touch a jump pad this pmove frame
;271:	if (ent->client->ps.jumppad_frame != ent->client->ps.pmove_framecount) {
ADDRLP4 4216
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4216
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 460
ADDP4
INDIRI4
ADDRLP4 4216
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 456
ADDP4
INDIRI4
EQI4 $163
line 272
;272:		ent->client->ps.jumppad_frame = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 0
ASGNI4
line 273
;273:		ent->client->ps.jumppad_ent   = 0;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 448
ADDP4
CNSTI4 0
ASGNI4
line 274
;274:	}
LABELV $163
line 275
;275:}
LABELV $122
endproc G_TouchTriggers 4224 16
export SpectatorThink
proc SpectatorThink 240 12
line 282
;276:
;277:/*
;278:=================
;279:SpectatorThink
;280:=================
;281:*/
;282:void SpectatorThink(gentity_t* ent, usercmd_t* ucmd) {
line 286
;283:	pmove_t    pm;
;284:	gclient_t* client;
;285:
;286:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 288
;287:
;288:	if (client->sess.spectatorState != SPECTATOR_FOLLOW) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
EQI4 $166
line 289
;289:		client->ps.pm_type = PM_SPECTATOR;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 2
ASGNI4
line 290
;290:		client->ps.speed   = g_speed.value * 1.25f;  // faster than normal
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CNSTF4 1067450368
MULF4
CVFI4 4
ASGNI4
line 293
;291:
;292:		// set up for pmove
;293:		memset(&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 228
ARGI4
ADDRGP4 memset
CALLP4
pop
line 294
;294:		pm.ps  = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 295
;295:		pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRFP4 4
INDIRP4
INDIRB
ASGNB 24
line 296
;296:		if (client->noclip)
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $170
line 297
;297:			pm.tracemask = 0;
ADDRLP4 4+28
CNSTI4 0
ASGNI4
ADDRGP4 $171
JUMPV
LABELV $170
line 299
;298:		else
;299:			pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;  // spectators can fly through bodies
ADDRLP4 4+28
CNSTI4 65537
ASGNI4
LABELV $171
line 300
;300:		pm.trace         = trap_Trace;
ADDRLP4 4+220
ADDRGP4 trap_Trace
ASGNP4
line 301
;301:		pm.pointcontents = trap_PointContents;
ADDRLP4 4+224
ADDRGP4 trap_PointContents
ASGNP4
line 304
;302:
;303:		// perform a pmove
;304:		Pmove(&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 306
;305:		// save results of pmove
;306:		VectorCopy(client->ps.origin, ent->s.origin);
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 308
;307:
;308:		G_TouchTriggers(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 309
;309:		trap_UnlinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 310
;310:	}
LABELV $166
line 312
;311:
;312:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
ASGNI4
line 313
;313:	client->buttons    = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRFP4 4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 316
;314:
;315:	// attack button cycles through spectators
;316:	if ((client->buttons & BUTTON_ATTACK) && !(client->oldbuttons & BUTTON_ATTACK)) {
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $176
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $176
line 317
;317:		Cmd_FollowCycle_f(ent, 1);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 Cmd_FollowCycle_f
CALLV
pop
line 318
;318:	}
LABELV $176
line 319
;319:}
LABELV $165
endproc SpectatorThink 240 12
export ClientInactivityTimer
proc ClientInactivityTimer 8 8
line 328
;320:
;321:/*
;322:=================
;323:ClientInactivityTimer
;324:
;325:Returns qfalse if the client is dropped
;326:=================
;327:*/
;328:qboolean ClientInactivityTimer(gclient_t* client) {
line 329
;329:	if (!g_inactivity.integer) {
ADDRGP4 g_inactivity+12
INDIRI4
CNSTI4 0
NEI4 $179
line 332
;330:		// give everyone some time, so if the operator sets g_inactivity during
;331:		// gameplay, everyone isn't kicked
;332:		client->inactivityTime    = level.time + 60 * 1000;
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 60000
ADDI4
ASGNI4
line 333
;333:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 0
ASGNI4
line 334
;334:	} else if (client->pers.cmd.forwardmove || client->pers.cmd.rightmove || client->pers.cmd.upmove || (client->pers.cmd.buttons & BUTTON_ATTACK)) {
ADDRGP4 $180
JUMPV
LABELV $179
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 493
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $187
ADDRLP4 0
INDIRP4
CNSTI4 494
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $187
ADDRLP4 0
INDIRP4
CNSTI4 495
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $187
ADDRLP4 0
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $183
LABELV $187
line 335
;335:		client->inactivityTime    = level.time + g_inactivity.integer * 1000;
ADDRFP4 0
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
line 336
;336:		client->inactivityWarning = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 0
ASGNI4
line 337
;337:	} else if (!client->pers.localClient) {
ADDRGP4 $184
JUMPV
LABELV $183
ADDRFP4 0
INDIRP4
CNSTI4 496
ADDP4
INDIRI4
CNSTI4 0
NEI4 $190
line 338
;338:		if (level.time > client->inactivityTime) {
ADDRGP4 level+32
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
LEI4 $192
line 339
;339:			trap_DropClient(client - level.clients, "Dropped due to inactivity");
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
ARGI4
ADDRGP4 $195
ARGP4
ADDRGP4 trap_DropClient
CALLV
pop
line 340
;340:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $178
JUMPV
LABELV $192
line 342
;341:		}
;342:		if (level.time > client->inactivityTime - 10000 && !client->inactivityWarning) {
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 level+32
INDIRI4
ADDRLP4 4
INDIRP4
CNSTI4 744
ADDP4
INDIRI4
CNSTI4 10000
SUBI4
LEI4 $196
ADDRLP4 4
INDIRP4
CNSTI4 748
ADDP4
INDIRI4
CNSTI4 0
NEI4 $196
line 343
;343:			client->inactivityWarning = qtrue;
ADDRFP4 0
INDIRP4
CNSTI4 748
ADDP4
CNSTI4 1
ASGNI4
line 344
;344:			trap_SendServerCommand(client - level.clients, "cp \"Ten seconds until inactivity drop!\n\"");
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
ARGI4
ADDRGP4 $199
ARGP4
ADDRGP4 trap_SendServerCommand
CALLV
pop
line 345
;345:		}
LABELV $196
line 346
;346:	}
LABELV $190
LABELV $184
LABELV $180
line 347
;347:	return qtrue;
CNSTI4 1
RETI4
LABELV $178
endproc ClientInactivityTimer 8 8
export ClientTimerActions
proc ClientTimerActions 20 12
line 357
;348:}
;349:
;350:/*
;351:==================
;352:ClientTimerActions
;353:
;354:Actions that happen once a second
;355:==================
;356:*/
;357:void ClientTimerActions(gentity_t* ent, int msec) {
line 363
;358:	gclient_t* client;
;359:#ifdef MISSIONPACK
;360:	int maxHealth;
;361:#endif
;362:
;363:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 364
;364:	client->timeResidual += msec;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
ADDRFP4 4
INDIRI4
ADDI4
ASGNI4
ADDRGP4 $202
JUMPV
LABELV $201
line 366
;365:
;366:	while (client->timeResidual >= 1000) {
line 367
;367:		client->timeResidual -= 1000;
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 393
;368:
;369:		// regenerate
;370:#ifdef MISSIONPACK
;371:		if (bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD) {
;372:			maxHealth = client->ps.stats[STAT_MAX_HEALTH] / 2;
;373:		} else if (client->ps.powerups[PW_REGEN]) {
;374:			maxHealth = client->ps.stats[STAT_MAX_HEALTH];
;375:		} else {
;376:			maxHealth = 0;
;377:		}
;378:		if (maxHealth) {
;379:			if (ent->health < maxHealth) {
;380:				ent->health += 15;
;381:				if (ent->health > maxHealth * 1.1) {
;382:					ent->health = maxHealth * 1.1;
;383:				}
;384:				G_AddEvent(ent, EV_POWERUP_REGEN, 0);
;385:			} else if (ent->health < maxHealth * 2) {
;386:				ent->health += 5;
;387:				if (ent->health > maxHealth * 2) {
;388:					ent->health = maxHealth * 2;
;389:				}
;390:				G_AddEvent(ent, EV_POWERUP_REGEN, 0);
;391:			}
;392:#else
;393:		if (client->ps.powerups[PW_REGEN]) {
ADDRLP4 0
INDIRP4
CNSTI4 332
ADDP4
INDIRI4
CNSTI4 0
EQI4 $204
line 394
;394:			if (ent->health < client->ps.stats[STAT_MAX_HEALTH]) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
GEI4 $206
line 395
;395:				ent->health += 15;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 15
ADDI4
ASGNI4
line 396
;396:				if (ent->health > client->ps.stats[STAT_MAX_HEALTH] * 1.1) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
CVIF4 4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1066192077
MULF4
LEF4 $208
line 397
;397:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 1.1;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CVIF4 4
CNSTF4 1066192077
MULF4
CVFI4 4
ASGNI4
line 398
;398:				}
LABELV $208
line 399
;399:				G_AddEvent(ent, EV_POWERUP_REGEN, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 63
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 400
;400:			} else if (ent->health < client->ps.stats[STAT_MAX_HEALTH] * 2) {
ADDRGP4 $205
JUMPV
LABELV $206
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
GEI4 $205
line 401
;401:				ent->health += 5;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 5
ADDI4
ASGNI4
line 402
;402:				if (ent->health > client->ps.stats[STAT_MAX_HEALTH] * 2) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
LEI4 $212
line 403
;403:					ent->health = client->ps.stats[STAT_MAX_HEALTH] * 2;
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 1
LSHI4
ASGNI4
line 404
;404:				}
LABELV $212
line 405
;405:				G_AddEvent(ent, EV_POWERUP_REGEN, 0);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 63
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 G_AddEvent
CALLV
pop
line 406
;406:			}
line 408
;407:#endif
;408:		} else {
ADDRGP4 $205
JUMPV
LABELV $204
line 410
;409:			// count down health when over max
;410:			if (ent->health > client->ps.stats[STAT_MAX_HEALTH]) {
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LEI4 $214
line 411
;411:				ent->health--;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 412
;412:			}
LABELV $214
line 413
;413:		}
LABELV $205
line 416
;414:
;415:		// count down armor when over max
;416:		if (client->ps.stats[STAT_ARMOR] > client->ps.stats[STAT_MAX_HEALTH]) {
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
LEI4 $216
line 417
;417:			client->ps.stats[STAT_ARMOR]--;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 196
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 418
;418:		}
LABELV $216
line 419
;419:	}
LABELV $202
line 366
ADDRLP4 0
INDIRP4
CNSTI4 776
ADDP4
INDIRI4
CNSTI4 1000
GEI4 $201
line 507
;420:#ifdef MISSIONPACK
;421:	if (bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN) {
;422:		int w, max, inc, t, i;
;423:		int weapList[] = {WP_MACHINEGUN, WP_SHOTGUN, WP_GRENADE_LAUNCHER, WP_ROCKET_LAUNCHER, WP_LIGHTNING, WP_RAILGUN,
;424:		                  WP_PLASMAGUN,  WP_BFG,     WP_NAILGUN,          WP_PROX_LAUNCHER,   WP_CHAINGUN};
;425:		int weapCount  = ARRAY_LEN(weapList);
;426:		//
;427:		for (i = 0; i < weapCount; i++) {
;428:			w = weapList[i];
;429:
;430:			switch (w) {
;431:			case WP_MACHINEGUN:
;432:				max = 50;
;433:				inc = 4;
;434:				t   = 1000;
;435:				break;
;436:			case WP_SHOTGUN:
;437:				max = 10;
;438:				inc = 1;
;439:				t   = 1500;
;440:				break;
;441:			case WP_GRENADE_LAUNCHER:
;442:				max = 10;
;443:				inc = 1;
;444:				t   = 2000;
;445:				break;
;446:			case WP_ROCKET_LAUNCHER:
;447:				max = 10;
;448:				inc = 1;
;449:				t   = 1750;
;450:				break;
;451:			case WP_LIGHTNING:
;452:				max = 50;
;453:				inc = 5;
;454:				t   = 1500;
;455:				break;
;456:			case WP_RAILGUN:
;457:				max = 10;
;458:				inc = 1;
;459:				t   = 1750;
;460:				break;
;461:			case WP_PLASMAGUN:
;462:				max = 50;
;463:				inc = 5;
;464:				t   = 1500;
;465:				break;
;466:			case WP_BFG:
;467:				max = 10;
;468:				inc = 1;
;469:				t   = 4000;
;470:				break;
;471:			case WP_NAILGUN:
;472:				max = 10;
;473:				inc = 1;
;474:				t   = 1250;
;475:				break;
;476:			case WP_PROX_LAUNCHER:
;477:				max = 5;
;478:				inc = 1;
;479:				t   = 2000;
;480:				break;
;481:			case WP_CHAINGUN:
;482:				max = 100;
;483:				inc = 5;
;484:				t   = 1000;
;485:				break;
;486:			default:
;487:				max = 0;
;488:				inc = 0;
;489:				t   = 1000;
;490:				break;
;491:			}
;492:			client->ammoTimes[w] += msec;
;493:			if (client->ps.ammo[w] >= max) {
;494:				client->ammoTimes[w] = 0;
;495:			}
;496:			if (client->ammoTimes[w] >= t) {
;497:				while (client->ammoTimes[w] >= t)
;498:					client->ammoTimes[w] -= t;
;499:				client->ps.ammo[w] += inc;
;500:				if (client->ps.ammo[w] > max) {
;501:					client->ps.ammo[w] = max;
;502:				}
;503:			}
;504:		}
;505:	}
;506:#endif
;507:}
LABELV $200
endproc ClientTimerActions 20 12
export ClientIntermissionThink
proc ClientIntermissionThink 20 0
line 514
;508:
;509:/*
;510:====================
;511:ClientIntermissionThink
;512:====================
;513:*/
;514:void ClientIntermissionThink(gclient_t* client) {
line 515
;515:	client->ps.eFlags &= ~EF_TALK;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -4097
BANDI4
ASGNI4
line 516
;516:	client->ps.eFlags &= ~EF_FIRING;
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
CNSTI4 -257
BANDI4
ASGNI4
line 521
;517:
;518:	// the level will exit when everyone wants to or after timeouts
;519:
;520:	// swap and latch button actions
;521:	client->oldbuttons = client->buttons;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 668
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
ASGNI4
line 522
;522:	client->buttons    = client->pers.cmd.buttons;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 664
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 488
ADDP4
INDIRI4
ASGNI4
line 523
;523:	if (client->buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE) & (client->oldbuttons ^ client->buttons)) {
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
CNSTI4 5
BANDI4
ADDRLP4 16
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
BXORI4
BANDI4
CNSTI4 0
EQI4 $219
line 525
;524:		// this used to be an ^1 but once a player says ready, it should stick
;525:		client->readyToExit = 1;
ADDRFP4 0
INDIRP4
CNSTI4 652
ADDP4
CNSTI4 1
ASGNI4
line 526
;526:	}
LABELV $219
line 527
;527:}
LABELV $218
endproc ClientIntermissionThink 20 0
export ClientEvents
proc ClientEvents 68 32
line 537
;528:
;529:/*
;530:================
;531:ClientEvents
;532:
;533:Events will be passed on to the clients for presentation,
;534:but any server game effects are handled here
;535:================
;536:*/
;537:void ClientEvents(gentity_t* ent, int oldEventSequence) {
line 547
;538:	int        i, j;
;539:	int        event;
;540:	gclient_t* client;
;541:	int        damage;
;542:	vec3_t     origin, angles;
;543:	//	qboolean	fired;
;544:	gitem_t*   item;
;545:	gentity_t* drop;
;546:
;547:	client = ent->client;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 549
;548:
;549:	if (oldEventSequence < client->ps.eventSequence - MAX_PS_EVENTS) {
ADDRFP4 4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
GEI4 $222
line 550
;550:		oldEventSequence = client->ps.eventSequence - MAX_PS_EVENTS;
ADDRFP4 4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 2
SUBI4
ASGNI4
line 551
;551:	}
LABELV $222
line 552
;552:	for (i = oldEventSequence; i < client->ps.eventSequence; i++) {
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 $227
JUMPV
LABELV $224
line 553
;553:		event = client->ps.events[i & (MAX_PS_EVENTS - 1)];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ASGNI4
line 555
;554:
;555:		switch (event) {
ADDRLP4 4
INDIRI4
CNSTI4 11
EQI4 $230
ADDRLP4 4
INDIRI4
CNSTI4 12
EQI4 $230
ADDRLP4 4
INDIRI4
CNSTI4 11
LTI4 $229
LABELV $253
ADDRLP4 4
INDIRI4
CNSTI4 23
EQI4 $239
ADDRLP4 4
INDIRI4
CNSTI4 25
EQI4 $240
ADDRLP4 4
INDIRI4
CNSTI4 26
EQI4 $252
ADDRGP4 $229
JUMPV
LABELV $230
line 558
;556:		case EV_FALL_MEDIUM:
;557:		case EV_FALL_FAR:
;558:			if (ent->s.eType != ET_PLAYER) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 1
EQI4 $231
line 559
;559:				break;  // not in the player model
ADDRGP4 $229
JUMPV
LABELV $231
line 561
;560:			}
;561:			if (g_dmflags.integer & DF_NO_FALLING) {
ADDRGP4 g_dmflags+12
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $233
line 562
;562:				break;
ADDRGP4 $229
JUMPV
LABELV $233
line 564
;563:			}
;564:			if (event == EV_FALL_FAR) {
ADDRLP4 4
INDIRI4
CNSTI4 12
NEI4 $236
line 565
;565:				damage = 10;
ADDRLP4 24
CNSTI4 10
ASGNI4
line 566
;566:			} else {
ADDRGP4 $237
JUMPV
LABELV $236
line 567
;567:				damage = 5;
ADDRLP4 24
CNSTI4 5
ASGNI4
line 568
;568:			}
LABELV $237
line 569
;569:			ent->pain_debounce_time = level.time + 200;  // no normal pain sound
ADDRFP4 0
INDIRP4
CNSTI4 720
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 570
;570:			G_Damage(ent, NULL, NULL, NULL, NULL, damage, 0, MOD_FALLING);
ADDRFP4 0
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 24
INDIRI4
ARGI4
CNSTI4 0
ARGI4
CNSTI4 19
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 571
;571:			break;
ADDRGP4 $229
JUMPV
LABELV $239
line 574
;572:
;573:		case EV_FIRE_WEAPON:
;574:			FireWeapon(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 FireWeapon
CALLV
pop
line 575
;575:			break;
ADDRGP4 $229
JUMPV
LABELV $240
line 579
;576:
;577:		case EV_USE_ITEM1:  // teleporter
;578:			// drop flags in CTF
;579:			item = NULL;
ADDRLP4 12
CNSTP4 0
ASGNP4
line 580
;580:			j    = 0;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 582
;581:
;582:			if (ent->client->ps.powerups[PW_REDFLAG]) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 340
ADDP4
INDIRI4
CNSTI4 0
EQI4 $241
line 583
;583:				item = BG_FindItemForPowerup(PW_REDFLAG);
CNSTI4 7
ARGI4
ADDRLP4 60
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 60
INDIRP4
ASGNP4
line 584
;584:				j    = PW_REDFLAG;
ADDRLP4 16
CNSTI4 7
ASGNI4
line 585
;585:			} else if (ent->client->ps.powerups[PW_BLUEFLAG]) {
ADDRGP4 $242
JUMPV
LABELV $241
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 344
ADDP4
INDIRI4
CNSTI4 0
EQI4 $243
line 586
;586:				item = BG_FindItemForPowerup(PW_BLUEFLAG);
CNSTI4 8
ARGI4
ADDRLP4 60
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 60
INDIRP4
ASGNP4
line 587
;587:				j    = PW_BLUEFLAG;
ADDRLP4 16
CNSTI4 8
ASGNI4
line 588
;588:			} else if (ent->client->ps.powerups[PW_NEUTRALFLAG]) {
ADDRGP4 $244
JUMPV
LABELV $243
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 348
ADDP4
INDIRI4
CNSTI4 0
EQI4 $245
line 589
;589:				item = BG_FindItemForPowerup(PW_NEUTRALFLAG);
CNSTI4 9
ARGI4
ADDRLP4 60
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 60
INDIRP4
ASGNP4
line 590
;590:				j    = PW_NEUTRALFLAG;
ADDRLP4 16
CNSTI4 9
ASGNI4
line 591
;591:			}
LABELV $245
LABELV $244
LABELV $242
line 593
;592:
;593:			if (item) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $247
line 594
;594:				drop = Drop_Item(ent, item, 0);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
CNSTF4 0
ARGF4
ADDRLP4 60
ADDRGP4 Drop_Item
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 60
INDIRP4
ASGNP4
line 596
;595:				// decide how many seconds it has left
;596:				drop->count = (ent->client->ps.powerups[j] - level.time) / 1000;
ADDRLP4 20
INDIRP4
CNSTI4 760
ADDP4
ADDRLP4 16
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
line 597
;597:				if (drop->count < 1) {
ADDRLP4 20
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
CNSTI4 1
GEI4 $250
line 598
;598:					drop->count = 1;
ADDRLP4 20
INDIRP4
CNSTI4 760
ADDP4
CNSTI4 1
ASGNI4
line 599
;599:				}
LABELV $250
line 601
;600:				// for pickup prediction
;601:				drop->s.time2 = drop->count;
ADDRLP4 64
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 88
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 760
ADDP4
INDIRI4
ASGNI4
line 603
;602:
;603:				ent->client->ps.powerups[j] = 0;
ADDRLP4 16
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
CNSTI4 0
ASGNI4
line 604
;604:			}
LABELV $247
line 628
;605:
;606:#ifdef MISSIONPACK
;607:			if (g_gametype.integer == GT_HARVESTER) {
;608:				if (ent->client->ps.generic1 > 0) {
;609:					if (ent->client->sess.sessionTeam == TEAM_RED) {
;610:						item = BG_FindItem("Blue Cube");
;611:					} else {
;612:						item = BG_FindItem("Red Cube");
;613:					}
;614:					if (item) {
;615:						for (j = 0; j < ent->client->ps.generic1; j++) {
;616:							drop = Drop_Item(ent, item, 0);
;617:							if (ent->client->sess.sessionTeam == TEAM_RED) {
;618:								drop->spawnflags = TEAM_BLUE;
;619:							} else {
;620:								drop->spawnflags = TEAM_RED;
;621:							}
;622:						}
;623:					}
;624:					ent->client->ps.generic1 = 0;
;625:				}
;626:			}
;627:#endif
;628:			SelectSpawnPoint(ent, ent->client->ps.origin, origin, angles);
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
ARGP4
ADDRLP4 60
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 SelectSpawnPoint
CALLP4
pop
line 629
;629:			TeleportPlayer(ent, origin, angles);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 40
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 630
;630:			break;
ADDRGP4 $229
JUMPV
LABELV $252
line 633
;631:
;632:		case EV_USE_ITEM2:  // medkit
;633:			ent->health = ent->client->ps.stats[STAT_MAX_HEALTH] + 25;
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 732
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
CNSTI4 25
ADDI4
ASGNI4
line 635
;634:
;635:			break;
line 658
;636:
;637:#ifdef MISSIONPACK
;638:		case EV_USE_ITEM3:  // kamikaze
;639:			// make sure the invulnerability is off
;640:			ent->client->invulnerabilityTime = 0;
;641:			// start the kamikze
;642:			G_StartKamikaze(ent);
;643:			break;
;644:
;645:		case EV_USE_ITEM4:  // portal
;646:			if (ent->client->portalID) {
;647:				DropPortalSource(ent);
;648:			} else {
;649:				DropPortalDestination(ent);
;650:			}
;651:			break;
;652:		case EV_USE_ITEM5:  // invulnerability
;653:			ent->client->invulnerabilityTime = level.time + 10000;
;654:			break;
;655:#endif
;656:
;657:		default:
;658:			break;
LABELV $229
line 660
;659:		}
;660:	}
LABELV $225
line 552
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $227
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
LTI4 $224
line 661
;661:}
LABELV $221
endproc ClientEvents 68 32
export SendPendingPredictableEvents
proc SendPendingPredictableEvents 40 12
line 713
;662:
;663:#ifdef MISSIONPACK
;664:/*
;665:==============
;666:StuckInOtherClient
;667:==============
;668:*/
;669:static int StuckInOtherClient(gentity_t* ent) {
;670:	int        i;
;671:	gentity_t* ent2;
;672:
;673:	ent2 = &g_entities[0];
;674:	for (i = 0; i < MAX_CLIENTS; i++, ent2++) {
;675:		if (ent2 == ent) {
;676:			continue;
;677:		}
;678:		if (!ent2->inuse) {
;679:			continue;
;680:		}
;681:		if (!ent2->client) {
;682:			continue;
;683:		}
;684:		if (ent2->health <= 0) {
;685:			continue;
;686:		}
;687:		//
;688:		if (ent2->r.absmin[0] > ent->r.absmax[0])
;689:			continue;
;690:		if (ent2->r.absmin[1] > ent->r.absmax[1])
;691:			continue;
;692:		if (ent2->r.absmin[2] > ent->r.absmax[2])
;693:			continue;
;694:		if (ent2->r.absmax[0] < ent->r.absmin[0])
;695:			continue;
;696:		if (ent2->r.absmax[1] < ent->r.absmin[1])
;697:			continue;
;698:		if (ent2->r.absmax[2] < ent->r.absmin[2])
;699:			continue;
;700:		return qtrue;
;701:	}
;702:	return qfalse;
;703:}
;704:#endif
;705:
;706:void BotTestSolid(vec3_t origin);
;707:
;708:/*
;709:==============
;710:SendPendingPredictableEvents
;711:==============
;712:*/
;713:void SendPendingPredictableEvents(playerState_t* ps) {
line 719
;714:	gentity_t* t;
;715:	int        event, seq;
;716:	int        extEvent, number;
;717:
;718:	// if there are still events pending
;719:	if (ps->entityEventSequence < ps->eventSequence) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
GEI4 $255
line 722
;720:		// create a temporary entity for this event which is sent to everyone
;721:		// except the client who generated the event
;722:		seq   = ps->entityEventSequence & (MAX_PS_EVENTS - 1);
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 723
;723:		event = ps->events[seq] | ((ps->entityEventSequence & 3) << 8);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 24
INDIRP4
CNSTI4 112
ADDP4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 464
ADDP4
INDIRI4
CNSTI4 3
BANDI4
CNSTI4 8
LSHI4
BORI4
ASGNI4
line 725
;724:		// set external event to zero before calling BG_PlayerStateToEntityState
;725:		extEvent          = ps->externalEvent;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
INDIRI4
ASGNI4
line 726
;726:		ps->externalEvent = 0;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
CNSTI4 0
ASGNI4
line 728
;727:		// create temporary entity for event
;728:		t      = G_TempEntity(ps->origin, event);
ADDRFP4 0
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 G_TempEntity
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 28
INDIRP4
ASGNP4
line 729
;729:		number = t->s.number;
ADDRLP4 16
ADDRLP4 0
INDIRP4
INDIRI4
ASGNI4
line 730
;730:		BG_PlayerStateToEntityState(ps, &t->s, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 731
;731:		t->s.number = number;
ADDRLP4 0
INDIRP4
ADDRLP4 16
INDIRI4
ASGNI4
line 732
;732:		t->s.eType  = ET_EVENTS + event;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
CNSTI4 13
ADDI4
ASGNI4
line 733
;733:		t->s.eFlags |= EF_PLAYER_EVENT;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 16
BORI4
ASGNI4
line 734
;734:		t->s.otherEntityNum = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 140
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 736
;735:		// send to everyone except the client who generated the event
;736:		t->r.svFlags |= SVF_NOTSINGLECLIENT;
ADDRLP4 36
ADDRLP4 0
INDIRP4
CNSTI4 424
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
line 737
;737:		t->r.singleClient = ps->clientNum;
ADDRLP4 0
INDIRP4
CNSTI4 428
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ASGNI4
line 739
;738:		// set back external event
;739:		ps->externalEvent = extEvent;
ADDRFP4 0
INDIRP4
CNSTI4 128
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 740
;740:	}
LABELV $255
line 741
;741:}
LABELV $254
endproc SendPendingPredictableEvents 40 12
export ClientThink_real
proc ClientThink_real 292 12
line 754
;742:
;743:/*
;744:==============
;745:ClientThink
;746:
;747:This will be called once for each client frame, which will
;748:usually be a couple times for each server frame on fast clients.
;749:
;750:If "g_synchronousClients 1" is set, this will be called exactly
;751:once for each server frame, which makes for smooth demo recording.
;752:==============
;753:*/
;754:void ClientThink_real(gentity_t* ent) {
line 761
;755:	gclient_t* client;
;756:	pmove_t    pm;
;757:	int        oldEventSequence;
;758:	int        msec;
;759:	usercmd_t* ucmd;
;760:
;761:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 764
;762:
;763:	// don't think if the client is not yet connected (and thus not yet spawned in)
;764:	if (client->pers.connected != CON_CONNECTED) {
ADDRLP4 0
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
EQI4 $258
line 765
;765:		return;
ADDRGP4 $257
JUMPV
LABELV $258
line 768
;766:	}
;767:	// mark the time, so the connection sprite can be removed
;768:	ucmd = &ent->client->pers.cmd;
ADDRLP4 232
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ASGNP4
line 771
;769:
;770:	// sanity check the command time to prevent speedup cheating
;771:	if (ucmd->serverTime > level.time + 200) {
ADDRLP4 232
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
LEI4 $260
line 772
;772:		ucmd->serverTime = level.time + 200;
ADDRLP4 232
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 200
ADDI4
ASGNI4
line 774
;773:		//		G_Printf("serverTime <<<<<\n" );
;774:	} else if (ucmd->serverTime < level.time - 1000) {
ADDRGP4 $261
JUMPV
LABELV $260
ADDRLP4 232
INDIRP4
INDIRI4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
GEI4 $264
line 775
;775:		ucmd->serverTime = level.time - 1000;
ADDRLP4 232
INDIRP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
SUBI4
ASGNI4
line 777
;776:		//		G_Printf("serverTime >>>>>\n" );
;777:	}
LABELV $264
LABELV $261
line 780
;778:
;779:	// unlagged
;780:	client->frameOffset     = trap_Milliseconds() - level.frameStartTime;
ADDRLP4 244
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 1548
ADDP4
ADDRLP4 244
INDIRI4
ADDRGP4 level+11800
INDIRI4
SUBI4
ASGNI4
line 781
;781:	client->lastCmdTime     = ucmd->serverTime;
ADDRLP4 0
INDIRP4
CNSTI4 660
ADDP4
ADDRLP4 232
INDIRP4
INDIRI4
ASGNI4
line 782
;782:	client->lastUpdateFrame = level.framenum;
ADDRLP4 0
INDIRP4
CNSTI4 1552
ADDP4
ADDRGP4 level+28
INDIRI4
ASGNI4
line 784
;783:
;784:	msec = ucmd->serverTime - client->ps.commandTime;
ADDRLP4 236
ADDRLP4 232
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
SUBI4
ASGNI4
line 787
;785:	// following others may result in bad times, but we still want
;786:	// to check for follow toggles
;787:	if (msec < 1 && client->sess.spectatorState != SPECTATOR_FOLLOW) {
ADDRLP4 236
INDIRI4
CNSTI4 1
GEI4 $270
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
EQI4 $270
line 788
;788:		return;
ADDRGP4 $257
JUMPV
LABELV $270
line 790
;789:	}
;790:	if (msec > 200) {
ADDRLP4 236
INDIRI4
CNSTI4 200
LEI4 $272
line 791
;791:		msec = 200;
ADDRLP4 236
CNSTI4 200
ASGNI4
line 792
;792:	}
LABELV $272
line 794
;793:
;794:	if (pmove_msec.integer < 8) {
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 8
GEI4 $274
line 795
;795:		trap_Cvar_Set("pmove_msec", "8");
ADDRGP4 $277
ARGP4
ADDRGP4 $278
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 796
;796:		trap_Cvar_Update(&pmove_msec);
ADDRGP4 pmove_msec
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 797
;797:	} else if (pmove_msec.integer > 33) {
ADDRGP4 $275
JUMPV
LABELV $274
ADDRGP4 pmove_msec+12
INDIRI4
CNSTI4 33
LEI4 $279
line 798
;798:		trap_Cvar_Set("pmove_msec", "33");
ADDRGP4 $277
ARGP4
ADDRGP4 $282
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 799
;799:		trap_Cvar_Update(&pmove_msec);
ADDRGP4 pmove_msec
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 800
;800:	}
LABELV $279
LABELV $275
line 802
;801:
;802:	if (pmove_fixed.integer) {
ADDRGP4 pmove_fixed+12
INDIRI4
CNSTI4 0
EQI4 $283
line 803
;803:		ucmd->serverTime = ((ucmd->serverTime + pmove_msec.integer - 1) / pmove_msec.integer) * pmove_msec.integer;
ADDRLP4 232
INDIRP4
ADDRLP4 232
INDIRP4
INDIRI4
ADDRGP4 pmove_msec+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ADDRGP4 pmove_msec+12
INDIRI4
DIVI4
ADDRGP4 pmove_msec+12
INDIRI4
MULI4
ASGNI4
line 806
;804:		// if (ucmd->serverTime - client->ps.commandTime <= 0)
;805:		//	return;
;806:	}
LABELV $283
line 811
;807:
;808:	//
;809:	// check for exiting intermission
;810:	//
;811:	if (level.intermissiontime) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $289
line 812
;812:		ClientIntermissionThink(client);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientIntermissionThink
CALLV
pop
line 813
;813:		return;
ADDRGP4 $257
JUMPV
LABELV $289
line 817
;814:	}
;815:
;816:	// spectators don't do much
;817:	if (client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRLP4 0
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $292
line 818
;818:		if (client->sess.spectatorState == SPECTATOR_SCOREBOARD) {
ADDRLP4 0
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 3
NEI4 $294
line 819
;819:			return;
ADDRGP4 $257
JUMPV
LABELV $294
line 821
;820:		}
;821:		SpectatorThink(ent, ucmd);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 232
INDIRP4
ARGP4
ADDRGP4 SpectatorThink
CALLV
pop
line 822
;822:		return;
ADDRGP4 $257
JUMPV
LABELV $292
line 826
;823:	}
;824:
;825:	// check for inactivity timer, but never drop the local client of a non-dedicated server
;826:	if (!ClientInactivityTimer(client)) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 248
ADDRGP4 ClientInactivityTimer
CALLI4
ASGNI4
ADDRLP4 248
INDIRI4
CNSTI4 0
NEI4 $296
line 827
;827:		return;
ADDRGP4 $257
JUMPV
LABELV $296
line 831
;828:	}
;829:
;830:	// clear the rewards if time
;831:	if (level.time > client->rewardTime) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 752
ADDP4
INDIRI4
LEI4 $298
line 832
;832:		client->ps.eFlags &= ~EF_AWARDS;
ADDRLP4 252
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 252
INDIRP4
ADDRLP4 252
INDIRP4
INDIRI4
CNSTI4 -231497
BANDI4
ASGNI4
line 833
;833:	}
LABELV $298
line 835
;834:
;835:	if (client->noclip) {
ADDRLP4 0
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
EQI4 $301
line 836
;836:		client->ps.pm_type = PM_NOCLIP;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 1
ASGNI4
line 837
;837:	} else if (client->ps.stats[STAT_HEALTH] <= 0) {
ADDRGP4 $302
JUMPV
LABELV $301
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $303
line 838
;838:		client->ps.pm_type = PM_DEAD;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 3
ASGNI4
line 839
;839:	} else {
ADDRGP4 $304
JUMPV
LABELV $303
line 840
;840:		client->ps.pm_type = PM_NORMAL;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 841
;841:	}
LABELV $304
LABELV $302
line 843
;842:
;843:	client->ps.gravity = g_gravity.value;
ADDRLP4 0
INDIRP4
CNSTI4 48
ADDP4
ADDRGP4 g_gravity+8
INDIRF4
CVFI4 4
ASGNI4
line 846
;844:
;845:	// set speed
;846:	client->ps.speed = g_speed.value;
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ADDRGP4 g_speed+8
INDIRF4
CVFI4 4
ASGNI4
line 853
;847:
;848:#ifdef MISSIONPACK
;849:	if (bg_itemlist[client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT) {
;850:		client->ps.speed *= 1.5;
;851:	} else
;852:#endif
;853:		if (client->ps.powerups[PW_HASTE]) {
ADDRLP4 0
INDIRP4
CNSTI4 324
ADDP4
INDIRI4
CNSTI4 0
EQI4 $307
line 854
;854:		client->ps.speed *= 1.3;
ADDRLP4 252
ADDRLP4 0
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
ADDRLP4 252
INDIRP4
ADDRLP4 252
INDIRP4
INDIRI4
CVIF4 4
CNSTF4 1067869798
MULF4
CVFI4 4
ASGNI4
line 855
;855:	}
LABELV $307
line 858
;856:
;857:	// Let go of the hook if we aren't firing
;858:	if (client->ps.weapon == WP_GRAPPLING_HOOK && client->hook && !(ucmd->buttons & BUTTON_ATTACK)) {
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 10
NEI4 $309
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $309
ADDRLP4 232
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $309
line 859
;859:		Weapon_HookFree(client->hook);
ADDRLP4 0
INDIRP4
CNSTI4 768
ADDP4
INDIRP4
ARGP4
ADDRGP4 Weapon_HookFree
CALLV
pop
line 860
;860:	}
LABELV $309
line 863
;861:
;862:	// set up for pmove
;863:	oldEventSequence = client->ps.eventSequence;
ADDRLP4 240
ADDRLP4 0
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ASGNI4
line 865
;864:
;865:	memset(&pm, 0, sizeof(pm));
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 228
ARGI4
ADDRGP4 memset
CALLP4
pop
line 869
;866:
;867:	// check for the hit-scan gauntlet, don't let the action
;868:	// go through as an attack unless it actually hits something
;869:	if (client->ps.weapon == WP_GAUNTLET && !(ucmd->buttons & BUTTON_TALK) && (ucmd->buttons & BUTTON_ATTACK) && client->ps.weaponTime <= 0) {
ADDRLP4 0
INDIRP4
CNSTI4 144
ADDP4
INDIRI4
CNSTI4 1
NEI4 $311
ADDRLP4 232
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $311
ADDRLP4 232
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $311
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
CNSTI4 0
GTI4 $311
line 870
;870:		pm.gauntletHit = CheckGauntletAttack(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 264
ADDRGP4 CheckGauntletAttack
CALLI4
ASGNI4
ADDRLP4 4+36
ADDRLP4 264
INDIRI4
ASGNI4
line 871
;871:	}
LABELV $311
line 873
;872:
;873:	if (ent->flags & FL_FORCE_GESTURE) {
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
INDIRI4
CNSTI4 32768
BANDI4
CNSTI4 0
EQI4 $314
line 874
;874:		ent->flags &= ~FL_FORCE_GESTURE;
ADDRLP4 264
ADDRFP4 0
INDIRP4
CNSTI4 536
ADDP4
ASGNP4
ADDRLP4 264
INDIRP4
ADDRLP4 264
INDIRP4
INDIRI4
CNSTI4 -32769
BANDI4
ASGNI4
line 875
;875:		ent->client->pers.cmd.buttons |= BUTTON_GESTURE;
ADDRLP4 268
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 488
ADDP4
ASGNP4
ADDRLP4 268
INDIRP4
ADDRLP4 268
INDIRP4
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 876
;876:	}
LABELV $314
line 905
;877:
;878:#ifdef MISSIONPACK
;879:	// check for invulnerability expansion before doing the Pmove
;880:	if (client->ps.powerups[PW_INVULNERABILITY]) {
;881:		if (!(client->ps.pm_flags & PMF_INVULEXPAND)) {
;882:			vec3_t mins = {-42, -42, -42};
;883:			vec3_t maxs = {42, 42, 42};
;884:			vec3_t oldmins, oldmaxs;
;885:
;886:			VectorCopy(ent->r.mins, oldmins);
;887:			VectorCopy(ent->r.maxs, oldmaxs);
;888:			// expand
;889:			VectorCopy(mins, ent->r.mins);
;890:			VectorCopy(maxs, ent->r.maxs);
;891:			trap_LinkEntity(ent);
;892:			// check if this would get anyone stuck in this player
;893:			if (!StuckInOtherClient(ent)) {
;894:				// set flag so the expanded size will be set in PM_CheckDuck
;895:				client->ps.pm_flags |= PMF_INVULEXPAND;
;896:			}
;897:			// set back
;898:			VectorCopy(oldmins, ent->r.mins);
;899:			VectorCopy(oldmaxs, ent->r.maxs);
;900:			trap_LinkEntity(ent);
;901:		}
;902:	}
;903:#endif
;904:
;905:	pm.ps  = &client->ps;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 906
;906:	pm.cmd = *ucmd;
ADDRLP4 4+4
ADDRLP4 232
INDIRP4
INDIRB
ASGNB 24
line 907
;907:	if (pm.ps->pm_type == PM_DEAD) {
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $317
line 908
;908:		pm.tracemask = MASK_PLAYERSOLID & ~CONTENTS_BODY;
ADDRLP4 4+28
CNSTI4 65537
ASGNI4
line 909
;909:	} else if (ent->r.svFlags & SVF_BOT) {
ADDRGP4 $318
JUMPV
LABELV $317
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $320
line 910
;910:		pm.tracemask = MASK_PLAYERSOLID | CONTENTS_BOTCLIP;
ADDRLP4 4+28
CNSTI4 37814273
ASGNI4
line 911
;911:	} else {
ADDRGP4 $321
JUMPV
LABELV $320
line 912
;912:		pm.tracemask = MASK_PLAYERSOLID;
ADDRLP4 4+28
CNSTI4 33619969
ASGNI4
line 913
;913:	}
LABELV $321
LABELV $318
line 914
;914:	pm.trace         = trap_Trace;
ADDRLP4 4+220
ADDRGP4 trap_Trace
ASGNP4
line 915
;915:	pm.pointcontents = trap_PointContents;
ADDRLP4 4+224
ADDRGP4 trap_PointContents
ASGNP4
line 916
;916:	pm.debugLevel    = g_debugMove.integer;
ADDRLP4 4+32
ADDRGP4 g_debugMove+12
INDIRI4
ASGNI4
line 918
;917:
;918:	pm.pmove_fixed = pmove_fixed.integer;
ADDRLP4 4+208
ADDRGP4 pmove_fixed+12
INDIRI4
ASGNI4
line 919
;919:	pm.pmove_msec  = pmove_msec.integer;
ADDRLP4 4+212
ADDRGP4 pmove_msec+12
INDIRI4
ASGNI4
line 921
;920:
;921:	VectorCopy(client->ps.origin, client->oldOrigin);
ADDRLP4 0
INDIRP4
CNSTI4 676
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 924
;922:
;923:	// Pass cvar data through pm->
;924:	pm.movetype = phy_movetype.integer;
ADDRLP4 4+216
ADDRGP4 phy_movetype+12
INDIRI4
ASGNI4
line 941
;925:
;926:#ifdef MISSIONPACK
;927:	if (level.intermissionQueued != 0 && g_singlePlayer.integer) {
;928:		if (level.time - level.intermissionQueued >= 1000) {
;929:			pm.cmd.buttons     = 0;
;930:			pm.cmd.forwardmove = 0;
;931:			pm.cmd.rightmove   = 0;
;932:			pm.cmd.upmove      = 0;
;933:			if (level.time - level.intermissionQueued >= 2000 && level.time - level.intermissionQueued <= 2500) {
;934:				trap_SendConsoleCommand(EXEC_APPEND, "centerview\n");
;935:			}
;936:			ent->client->ps.pm_type = PM_SPINTERMISSION;
;937:		}
;938:	}
;939:	Pmove(&pm);
;940:#else
;941:	Pmove(&pm);
ADDRLP4 4
ARGP4
ADDRGP4 Pmove
CALLV
pop
line 945
;942:#endif
;943:
;944:	// save results of pmove
;945:	if (ent->client->ps.eventSequence != oldEventSequence) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 240
INDIRI4
EQI4 $334
line 946
;946:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 947
;947:	}
LABELV $334
line 949
;948:
;949:	BG_PlayerStateToEntityState(&ent->client->ps, &ent->s, qtrue);
ADDRLP4 268
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRLP4 268
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRGP4 BG_PlayerStateToEntityState
CALLV
pop
line 951
;950:
;951:	SendPendingPredictableEvents(&ent->client->ps);
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 953
;952:
;953:	if (!(ent->client->ps.eFlags & EF_FIRING)) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 256
BANDI4
CNSTI4 0
NEI4 $337
line 954
;954:		client->fireHeld = qfalse;  // for grapple
ADDRLP4 0
INDIRP4
CNSTI4 764
ADDP4
CNSTI4 0
ASGNI4
line 955
;955:	}
LABELV $337
line 958
;956:
;957:	// use the snapped origin for linking so it matches client predicted versions
;958:	VectorCopy(ent->s.pos.trBase, ent->r.currentOrigin);
ADDRLP4 272
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 272
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 272
INDIRP4
CNSTI4 24
ADDP4
INDIRB
ASGNB 12
line 960
;959:
;960:	VectorCopy(pm.mins, ent->r.mins);
ADDRFP4 0
INDIRP4
CNSTI4 436
ADDP4
ADDRLP4 4+176
INDIRB
ASGNB 12
line 961
;961:	VectorCopy(pm.maxs, ent->r.maxs);
ADDRFP4 0
INDIRP4
CNSTI4 448
ADDP4
ADDRLP4 4+188
INDIRB
ASGNB 12
line 963
;962:
;963:	ent->waterlevel = pm.waterlevel;
ADDRFP4 0
INDIRP4
CNSTI4 788
ADDP4
ADDRLP4 4+204
INDIRI4
ASGNI4
line 964
;964:	ent->watertype  = pm.watertype;
ADDRFP4 0
INDIRP4
CNSTI4 784
ADDP4
ADDRLP4 4+200
INDIRI4
ASGNI4
line 967
;965:
;966:	// execute client events
;967:	ClientEvents(ent, oldEventSequence);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 240
INDIRI4
ARGI4
ADDRGP4 ClientEvents
CALLV
pop
line 970
;968:
;969:	// link entity now, after any personal teleporters have been used
;970:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 971
;971:	if (!ent->client->noclip) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 656
ADDP4
INDIRI4
CNSTI4 0
NEI4 $343
line 972
;972:		G_TouchTriggers(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_TouchTriggers
CALLV
pop
line 973
;973:	}
LABELV $343
line 976
;974:
;975:	// NOTE: now copy the exact origin over otherwise clients can be snapped into solid
;976:	VectorCopy(ent->client->ps.origin, ent->r.currentOrigin);
ADDRLP4 276
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 276
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 276
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 979
;977:
;978:	// test for solid areas in the AAS file
;979:	BotTestAAS(ent->r.currentOrigin);
ADDRFP4 0
INDIRP4
CNSTI4 488
ADDP4
ARGP4
ADDRGP4 BotTestAAS
CALLV
pop
line 982
;980:
;981:	// touch other objects
;982:	ClientImpacts(ent, &pm);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 ClientImpacts
CALLV
pop
line 985
;983:
;984:	// save results of triggers and client events
;985:	if (ent->client->ps.eventSequence != oldEventSequence) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
ADDRLP4 240
INDIRI4
EQI4 $345
line 986
;986:		ent->eventTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 552
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 987
;987:	}
LABELV $345
line 990
;988:
;989:	// swap and latch button actions
;990:	client->oldbuttons = client->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
ASGNI4
line 991
;991:	client->buttons    = ucmd->buttons;
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
ADDRLP4 232
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 992
;992:	client->latched_buttons |= client->buttons & ~client->oldbuttons;
ADDRLP4 288
ADDRLP4 0
INDIRP4
CNSTI4 672
ADDP4
ASGNP4
ADDRLP4 288
INDIRP4
ADDRLP4 288
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 664
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 668
ADDP4
INDIRI4
BCOMI4
BANDI4
BORI4
ASGNI4
line 995
;993:
;994:	// check for respawning
;995:	if (client->ps.stats[STAT_HEALTH] <= 0) {
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $348
line 997
;996:		// wait for the attack button to be pressed
;997:		if (level.time > client->respawnTime) {
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
LEI4 $257
line 999
;998:			// forcerespawn is to prevent users from waiting out powerups
;999:			if (g_forcerespawn.integer > 0 && (level.time - client->respawnTime) > g_forcerespawn.integer) {
ADDRGP4 g_forcerespawn+12
INDIRI4
CNSTI4 0
LEI4 $353
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
SUBI4
ADDRGP4 g_forcerespawn+12
INDIRI4
LEI4 $353
line 1000
;1000:				respawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1001
;1001:				return;
ADDRGP4 $257
JUMPV
LABELV $353
line 1005
;1002:			}
;1003:
;1004:			// pressing attack or use is the normal respawn method
;1005:			if (ucmd->buttons & (BUTTON_ATTACK | BUTTON_USE_HOLDABLE)) {
ADDRLP4 232
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 5
BANDI4
CNSTI4 0
EQI4 $257
line 1006
;1006:				respawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 respawn
CALLV
pop
line 1007
;1007:			}
line 1008
;1008:		}
line 1009
;1009:		return;
ADDRGP4 $257
JUMPV
LABELV $348
line 1013
;1010:	}
;1011:
;1012:	// perform once-a-second actions
;1013:	ClientTimerActions(ent, msec);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 236
INDIRI4
ARGI4
ADDRGP4 ClientTimerActions
CALLV
pop
line 1014
;1014:}
LABELV $257
endproc ClientThink_real 292 12
export ClientThink
proc ClientThink 4 8
line 1023
;1015:
;1016:/*
;1017:==================
;1018:ClientThink
;1019:
;1020:A new command has arrived from the client
;1021:==================
;1022:*/
;1023:void ClientThink(int clientNum) {
line 1026
;1024:	gentity_t* ent;
;1025:
;1026:	ent = g_entities + clientNum;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CNSTI4 816
MULI4
ADDRGP4 g_entities
ADDP4
ASGNP4
line 1027
;1027:	trap_GetUsercmd(clientNum, &ent->client->pers.cmd);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 0
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
line 1035
;1028:
;1029:	// mark the time we got info, so we can display the
;1030:	// phone jack if they don't get any for a while
;1031:#if 0  // unlagged
;1032:	ent->client->lastCmdTime = level.time;
;1033:#endif
;1034:
;1035:	if (!(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer) {
ADDRLP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $361
ADDRGP4 g_synchronousClients+12
INDIRI4
CNSTI4 0
NEI4 $361
line 1036
;1036:		ClientThink_real(ent);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1037
;1037:	}
LABELV $361
line 1038
;1038:}
LABELV $360
endproc ClientThink 4 8
export G_RunClient
proc G_RunClient 0 4
line 1040
;1039:
;1040:void G_RunClient(gentity_t* ent) {
line 1041
;1041:	if (!(ent->r.svFlags & SVF_BOT) && !g_synchronousClients.integer) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $365
ADDRGP4 g_synchronousClients+12
INDIRI4
CNSTI4 0
NEI4 $365
line 1042
;1042:		return;
ADDRGP4 $364
JUMPV
LABELV $365
line 1044
;1043:	}
;1044:	ent->client->pers.cmd.serverTime = level.time;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 472
ADDP4
ADDRGP4 level+32
INDIRI4
ASGNI4
line 1045
;1045:	ClientThink_real(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 ClientThink_real
CALLV
pop
line 1046
;1046:}
LABELV $364
endproc G_RunClient 0 4
export SpectatorClientEndFrame
proc SpectatorClientEndFrame 20 4
line 1054
;1047:
;1048:/*
;1049:==================
;1050:SpectatorClientEndFrame
;1051:
;1052:==================
;1053:*/
;1054:void SpectatorClientEndFrame(gentity_t* ent) {
line 1058
;1055:	gclient_t* cl;
;1056:
;1057:	// if we are doing a chase cam or a remote view, grab the latest info
;1058:	if (ent->client->sess.spectatorState == SPECTATOR_FOLLOW) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 2
NEI4 $370
line 1061
;1059:		int clientNum, flags;
;1060:
;1061:		clientNum = ent->client->sess.spectatorClient;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
ASGNI4
line 1064
;1062:
;1063:		// team follow1 and team follow2 go to whatever clients are playing
;1064:		if (clientNum == -1) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
NEI4 $372
line 1065
;1065:			clientNum = level.follow1;
ADDRLP4 4
ADDRGP4 level+344
INDIRI4
ASGNI4
line 1066
;1066:		} else if (clientNum == -2) {
ADDRGP4 $373
JUMPV
LABELV $372
ADDRLP4 4
INDIRI4
CNSTI4 -2
NEI4 $375
line 1067
;1067:			clientNum = level.follow2;
ADDRLP4 4
ADDRGP4 level+348
INDIRI4
ASGNI4
line 1068
;1068:		}
LABELV $375
LABELV $373
line 1069
;1069:		if ((unsigned)clientNum < MAX_CLIENTS) {
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 64
GEU4 $378
line 1070
;1070:			cl = &level.clients[clientNum];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1576
MULI4
ADDRGP4 level
INDIRP4
ADDP4
ASGNP4
line 1071
;1071:			if (cl->pers.connected == CON_CONNECTED && cl->sess.sessionTeam != TEAM_SPECTATOR) {
ADDRLP4 12
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 468
ADDP4
INDIRI4
CNSTI4 2
NEI4 $380
ADDRLP4 12
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $380
line 1072
;1072:				flags           = (cl->ps.eFlags & ~(EF_VOTED | EF_TEAMVOTED)) | (ent->client->ps.eFlags & (EF_VOTED | EF_TEAMVOTED));
ADDRLP4 8
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 -540673
BANDI4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
INDIRI4
CNSTI4 540672
BANDI4
BORI4
ASGNI4
line 1073
;1073:				ent->client->ps = cl->ps;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRB
ASGNB 468
line 1074
;1074:				ent->client->ps.pm_flags |= PMF_FOLLOW;
ADDRLP4 16
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 1075
;1075:				ent->client->ps.eFlags = flags;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 8
INDIRI4
ASGNI4
line 1076
;1076:				return;
ADDRGP4 $369
JUMPV
LABELV $380
line 1077
;1077:			} else {
line 1079
;1078:				// drop them to free spectators unless they are dedicated camera followers
;1079:				if (ent->client->sess.spectatorClient >= 0) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 636
ADDP4
INDIRI4
CNSTI4 0
LTI4 $382
line 1080
;1080:					ent->client->sess.spectatorState = SPECTATOR_FREE;
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
CNSTI4 1
ASGNI4
line 1081
;1081:					ClientBegin(ent->client - level.clients);
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
ARGI4
ADDRGP4 ClientBegin
CALLV
pop
line 1082
;1082:				}
LABELV $382
line 1083
;1083:			}
line 1084
;1084:		}
LABELV $378
line 1085
;1085:	}
LABELV $370
line 1087
;1086:
;1087:	if (ent->client->sess.spectatorState == SPECTATOR_SCOREBOARD) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 632
ADDP4
INDIRI4
CNSTI4 3
NEI4 $384
line 1088
;1088:		ent->client->ps.pm_flags |= PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
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
line 1089
;1089:	} else {
ADDRGP4 $385
JUMPV
LABELV $384
line 1090
;1090:		ent->client->ps.pm_flags &= ~PMF_SCOREBOARD;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1091
;1091:	}
LABELV $385
line 1092
;1092:}
LABELV $369
endproc SpectatorClientEndFrame 20 4
bss
align 4
LABELV $387
skip 816
export ClientEndFrame
code
proc ClientEndFrame 40 12
line 1103
;1093:
;1094:/*
;1095:==============
;1096:ClientEndFrame
;1097:
;1098:Called at the end of each server frame for each connected client
;1099:A fast client will have multiple ClientThink for each ClientEdFrame,
;1100:while a slow client may have multiple ClientEndFrame between ClientThink.
;1101:==============
;1102:*/
;1103:void ClientEndFrame(gentity_t* ent) {
line 1110
;1104:	static gentity_t sent;
;1105:	int              i;
;1106:	gclient_t*       client;
;1107:	// unlagged
;1108:	int frames;
;1109:
;1110:	if (!ent->client)
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $388
line 1111
;1111:		return;
ADDRGP4 $386
JUMPV
LABELV $388
line 1113
;1112:
;1113:	ent->r.svFlags &= ~svf_self_portal2;
ADDRLP4 12
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRGP4 svf_self_portal2
INDIRI4
BCOMI4
BANDI4
ASGNI4
line 1115
;1114:
;1115:	if (ent->client->sess.sessionTeam == TEAM_SPECTATOR) {
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
NEI4 $390
line 1116
;1116:		SpectatorClientEndFrame(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 SpectatorClientEndFrame
CALLV
pop
line 1117
;1117:		return;
ADDRGP4 $386
JUMPV
LABELV $390
line 1120
;1118:	}
;1119:
;1120:	client = ent->client;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ASGNP4
line 1123
;1121:
;1122:	// turn off any expired powerups
;1123:	for (i = 0; i < MAX_POWERUPS; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $392
line 1124
;1124:		if (client->ps.powerups[i] < client->pers.cmd.serverTime) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
GEI4 $396
line 1125
;1125:			client->ps.powerups[i] = 0;
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDP4
CNSTI4 0
ASGNI4
line 1126
;1126:		}
LABELV $396
line 1127
;1127:	}
LABELV $393
line 1123
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 16
LTI4 $392
line 1160
;1128:
;1129:#ifdef MISSIONPACK
;1130:	// set powerup for player animation
;1131:	if (bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_GUARD) {
;1132:		ent->client->ps.powerups[PW_GUARD] = level.time;
;1133:	}
;1134:	if (bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_SCOUT) {
;1135:		ent->client->ps.powerups[PW_SCOUT] = level.time;
;1136:	}
;1137:	if (bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_DOUBLER) {
;1138:		ent->client->ps.powerups[PW_DOUBLER] = level.time;
;1139:	}
;1140:	if (bg_itemlist[ent->client->ps.stats[STAT_PERSISTANT_POWERUP]].giTag == PW_AMMOREGEN) {
;1141:		ent->client->ps.powerups[PW_AMMOREGEN] = level.time;
;1142:	}
;1143:	if (ent->client->invulnerabilityTime > level.time) {
;1144:		ent->client->ps.powerups[PW_INVULNERABILITY] = level.time;
;1145:	}
;1146:#endif
;1147:
;1148:	// save network bandwidth
;1149:#if 0
;1150:	if ( !g_synchronousClients->integer && ent->client->ps.pm_type == PM_NORMAL ) {
;1151:		// FIXME: this must change eventually for non-sync demo recording
;1152:		VectorClear( ent->client->ps.viewangles );
;1153:	}
;1154:#endif
;1155:
;1156:	//
;1157:	// If the end of unit layout is displayed, don't give
;1158:	// the player any normal movement attributes
;1159:	//
;1160:	if (level.intermissiontime) {
ADDRGP4 level+7604
INDIRI4
CNSTI4 0
EQI4 $398
line 1161
;1161:		client->ps.commandTime = client->pers.cmd.serverTime;
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
CNSTI4 472
ADDP4
INDIRI4
ASGNI4
line 1162
;1162:		return;
ADDRGP4 $386
JUMPV
LABELV $398
line 1166
;1163:	}
;1164:
;1165:	// burn from lava, etc
;1166:	P_WorldEffects(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_WorldEffects
CALLV
pop
line 1169
;1167:
;1168:	// apply all the damage taken this frame
;1169:	P_DamageFeedback(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 P_DamageFeedback
CALLV
pop
line 1171
;1170:
;1171:	client->ps.stats[STAT_HEALTH] = ent->health;  // FIXME: get rid of ent->health...
ADDRLP4 0
INDIRP4
CNSTI4 184
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 732
ADDP4
INDIRI4
ASGNI4
line 1173
;1172:
;1173:	G_SetClientSound(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_SetClientSound
CALLV
pop
line 1176
;1174:
;1175:	// set the latest info
;1176:	BG_PlayerStateToEntityState(&client->ps, &ent->s, qtrue);
ADDRLP4 0
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
line 1178
;1177:
;1178:	SendPendingPredictableEvents(&client->ps);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 SendPendingPredictableEvents
CALLV
pop
line 1180
;1179:
;1180:	client->ps.eFlags &= ~EF_CONNECTION;
ADDRLP4 16
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1181
;1181:	ent->s.eFlags &= ~EF_CONNECTION;
ADDRLP4 20
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 -8193
BANDI4
ASGNI4
line 1183
;1182:
;1183:	frames = level.framenum - client->lastUpdateFrame - 1;
ADDRLP4 8
ADDRGP4 level+28
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1552
ADDP4
INDIRI4
SUBI4
CNSTI4 1
SUBI4
ASGNI4
line 1186
;1184:
;1185:	// PVS prediction
;1186:	if (g_predictPVS.integer && svf_self_portal2) {
ADDRGP4 g_predictPVS+12
INDIRI4
CNSTI4 0
EQI4 $402
ADDRGP4 svf_self_portal2
INDIRI4
CNSTI4 0
EQI4 $402
line 1188
;1187:		int lag;
;1188:		sent.s        = ent->s;
ADDRGP4 $387
ADDRFP4 0
INDIRP4
INDIRB
ASGNB 208
line 1189
;1189:		sent.r        = ent->r;
ADDRGP4 $387+208
ADDRFP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRB
ASGNB 308
line 1190
;1190:		sent.clipmask = ent->clipmask;
ADDRGP4 $387+572
ADDRFP4 0
INDIRP4
CNSTI4 572
ADDP4
INDIRI4
ASGNI4
line 1193
;1191:		// VectorCopy( client->ps.origin, sent.s.pos.trBase );
;1192:		// VectorCopy( client->ps.velocity, sent.s.pos.trDelta );
;1193:		lag = level.time - client->ps.commandTime + 50;
ADDRLP4 24
ADDRGP4 level+32
INDIRI4
ADDRLP4 0
INDIRP4
INDIRI4
SUBI4
CNSTI4 50
ADDI4
ASGNI4
line 1194
;1194:		if (lag > 500)
ADDRLP4 24
INDIRI4
CNSTI4 500
LEI4 $408
line 1195
;1195:			lag = 500;
ADDRLP4 24
CNSTI4 500
ASGNI4
LABELV $408
line 1196
;1196:		G_PredictPlayerMove(&sent, (float)lag * 0.001f);
ADDRGP4 $387
ARGP4
ADDRLP4 24
INDIRI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRGP4 G_PredictPlayerMove
CALLV
pop
line 1197
;1197:		VectorCopy(sent.s.pos.trBase, ent->r.unused.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 312
ADDP4
ADDRGP4 $387+12+12
INDIRB
ASGNB 12
line 1198
;1198:		ent->r.unused.origin2[2] += client->ps.viewheight;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 320
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 164
ADDP4
INDIRI4
CVIF4 4
ADDF4
ASGNF4
line 1199
;1199:		ent->r.svFlags |= svf_self_portal2;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRGP4 svf_self_portal2
INDIRI4
BORI4
ASGNI4
line 1200
;1200:	}
LABELV $402
line 1202
;1201:
;1202:	if (frames > 2) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LEI4 $412
line 1204
;1203:		// limit lagged player prediction to 2 server frames
;1204:		frames = 2;
ADDRLP4 8
CNSTI4 2
ASGNI4
line 1206
;1205:		// and add the EF_CONNECTION flag if we haven't gotten commands recently
;1206:		if (!(ent->r.svFlags & SVF_BOT)) {
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
NEI4 $414
line 1207
;1207:			client->ps.eFlags |= EF_CONNECTION;
ADDRLP4 24
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 8192
BORI4
ASGNI4
line 1208
;1208:			ent->s.eFlags |= EF_CONNECTION;
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
CNSTI4 8192
BORI4
ASGNI4
line 1209
;1209:		}
LABELV $414
line 1210
;1210:	}
LABELV $412
line 1212
;1211:
;1212:	if (frames > 0 && g_smoothClients.integer) {
ADDRLP4 8
INDIRI4
CNSTI4 0
LEI4 $416
ADDRGP4 g_smoothClients+12
INDIRI4
CNSTI4 0
EQI4 $416
line 1213
;1213:		G_PredictPlayerMove(ent, (float)frames / sv_fps.value);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 sv_fps+8
INDIRF4
DIVF4
ARGF4
ADDRGP4 G_PredictPlayerMove
CALLV
pop
line 1214
;1214:		SnapVector(ent->s.pos.trBase);
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 24
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 32
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
CVFI4 4
CVIF4 4
ASGNF4
line 1215
;1215:	}
LABELV $416
line 1218
;1216:
;1217:	// unlagged
;1218:	G_StoreHistory(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_StoreHistory
CALLV
pop
line 1221
;1219:
;1220:	// hitsounds
;1221:	if (client->damage.enemy && client->damage.amount) {
ADDRLP4 0
INDIRP4
CNSTI4 1560
ADDP4
INDIRI4
CNSTI4 0
EQI4 $420
ADDRLP4 0
INDIRP4
CNSTI4 1564
ADDP4
INDIRI4
CNSTI4 0
EQI4 $420
line 1222
;1222:		client->ps.persistant[PERS_HITS] += client->damage.enemy;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1560
ADDP4
INDIRI4
ADDI4
ASGNI4
line 1223
;1223:		client->damage.enemy = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1560
ADDP4
CNSTI4 0
ASGNI4
line 1225
;1224:		// scale damage by max.health
;1225:		i = client->damage.amount * 100 / client->ps.stats[STAT_MAX_HEALTH];
ADDRLP4 4
ADDRLP4 0
INDIRP4
CNSTI4 1564
ADDP4
INDIRI4
CNSTI4 100
MULI4
ADDRLP4 0
INDIRP4
CNSTI4 208
ADDP4
INDIRI4
DIVI4
ASGNI4
line 1227
;1226:		// avoid high-byte setup
;1227:		if (i > 255)
ADDRLP4 4
INDIRI4
CNSTI4 255
LEI4 $422
line 1228
;1228:			i = 255;
ADDRLP4 4
CNSTI4 255
ASGNI4
LABELV $422
line 1229
;1229:		client->ps.persistant[PERS_ATTACKEE_ARMOR] = i;
ADDRLP4 0
INDIRP4
CNSTI4 276
ADDP4
ADDRLP4 4
INDIRI4
ASGNI4
line 1230
;1230:		client->damage.amount                      = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1564
ADDP4
CNSTI4 0
ASGNI4
line 1231
;1231:	} else if (client->damage.team) {
ADDRGP4 $421
JUMPV
LABELV $420
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
CNSTI4 0
EQI4 $424
line 1232
;1232:		client->ps.persistant[PERS_HITS] -= client->damage.team;
ADDRLP4 32
ADDRLP4 0
INDIRP4
CNSTI4 252
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
INDIRI4
SUBI4
ASGNI4
line 1233
;1233:		client->damage.team = 0;
ADDRLP4 0
INDIRP4
CNSTI4 1556
ADDP4
CNSTI4 0
ASGNI4
line 1234
;1234:	}
LABELV $424
LABELV $421
line 1239
;1235:
;1236:	// set the bit for the reachability area the client is currently in
;1237:	//	i = trap_AAS_PointReachabilityAreaIndex( ent->client->ps.origin );
;1238:	//	ent->client->areabits[i >> 3] |= 1 << (i & 7);
;1239:}
LABELV $386
endproc ClientEndFrame 40 12
import BotTestSolid
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
LABELV $282
byte 1 51
byte 1 51
byte 1 0
align 1
LABELV $278
byte 1 56
byte 1 0
align 1
LABELV $277
byte 1 112
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 109
byte 1 115
byte 1 101
byte 1 99
byte 1 0
align 1
LABELV $199
byte 1 99
byte 1 112
byte 1 32
byte 1 34
byte 1 84
byte 1 101
byte 1 110
byte 1 32
byte 1 115
byte 1 101
byte 1 99
byte 1 111
byte 1 110
byte 1 100
byte 1 115
byte 1 32
byte 1 117
byte 1 110
byte 1 116
byte 1 105
byte 1 108
byte 1 32
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 100
byte 1 114
byte 1 111
byte 1 112
byte 1 33
byte 1 10
byte 1 34
byte 1 0
align 1
LABELV $195
byte 1 68
byte 1 114
byte 1 111
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 32
byte 1 100
byte 1 117
byte 1 101
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 105
byte 1 110
byte 1 97
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
