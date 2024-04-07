export InitTrigger
code
proc InitTrigger 12 8
file "../../../../code/game/g_trigger.c"
line 5
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "g_local.h"
;4:
;5:void InitTrigger(gentity_t* self) {
line 6
;6:	if (!VectorCompare(self->s.angles, vec3_origin))
ADDRFP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 vec3_origin
ARGP4
ADDRLP4 0
ADDRGP4 VectorCompare
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $55
line 7
;7:		G_SetMovedir(self->s.angles, self->movedir);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 676
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
LABELV $55
line 9
;8:
;9:	trap_SetBrushModel(self, self->model);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRP4
CNSTI4 540
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_SetBrushModel
CALLV
pop
line 10
;10:	self->r.contents = CONTENTS_TRIGGER;  // replaces the -1 from trap_SetBrushModel
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 11
;11:	self->r.svFlags  = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 12
;12:}
LABELV $54
endproc InitTrigger 12 8
export multi_wait
proc multi_wait 0 0
line 15
;13:
;14:// the wait time has passed, so set back up for another activation
;15:void multi_wait(gentity_t* ent) {
line 16
;16:	ent->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 17
;17:}
LABELV $57
endproc multi_wait 0 0
export multi_trigger
proc multi_trigger 12 8
line 22
;18:
;19:// the trigger was just activated
;20:// ent->activator should be set to the activator so it can be held through a delay
;21:// so wait for the delay time before firing
;22:void multi_trigger(gentity_t* ent, gentity_t* activator) {
line 23
;23:	ent->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 4
INDIRP4
ASGNP4
line 24
;24:	if (ent->nextthink) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $59
line 25
;25:		return;  // can't retrigger until the wait is over
ADDRGP4 $58
JUMPV
LABELV $59
line 28
;26:	}
;27:
;28:	if (activator->client) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $61
line 29
;29:		if ((ent->spawnflags & 1) && activator->client->sess.sessionTeam != TEAM_RED) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $63
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 1
EQI4 $63
line 30
;30:			return;
ADDRGP4 $58
JUMPV
LABELV $63
line 32
;31:		}
;32:		if ((ent->spawnflags & 2) && activator->client->sess.sessionTeam != TEAM_BLUE) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $65
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 2
EQI4 $65
line 33
;33:			return;
ADDRGP4 $58
JUMPV
LABELV $65
line 35
;34:		}
;35:	}
LABELV $61
line 37
;36:
;37:	G_UseTargets(ent, ent->activator);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 39
;38:
;39:	if (ent->wait > 0) {
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
LEF4 $67
line 40
;40:		ent->think     = multi_wait;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 multi_wait
ASGNP4
line 41
;41:		ent->nextthink = level.time + (ent->wait + ent->random * crandom()) * 1000;
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDRLP4 4
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
ADDF4
CNSTF4 1148846080
MULF4
ADDF4
CVFI4 4
ASGNI4
line 42
;42:	} else {
ADDRGP4 $68
JUMPV
LABELV $67
line 45
;43:		// we can't just remove (self) here, because this is a touch function
;44:		// called while looping through area links...
;45:		ent->touch     = 0;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
CNSTP4 0
ASGNP4
line 46
;46:		ent->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 47
;47:		ent->think     = G_FreeEntity;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 G_FreeEntity
ASGNP4
line 48
;48:	}
LABELV $68
line 49
;49:}
LABELV $58
endproc multi_trigger 12 8
export Use_Multi
proc Use_Multi 0 8
line 51
;50:
;51:void Use_Multi(gentity_t* ent, gentity_t* other, gentity_t* activator) {
line 52
;52:	multi_trigger(ent, activator);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 53
;53:}
LABELV $71
endproc Use_Multi 0 8
export Touch_Multi
proc Touch_Multi 0 8
line 55
;54:
;55:void Touch_Multi(gentity_t* self, gentity_t* other, trace_t* trace) {
line 56
;56:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $73
line 57
;57:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 59
;58:	}
;59:	multi_trigger(self, other);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 multi_trigger
CALLV
pop
line 60
;60:}
LABELV $72
endproc Touch_Multi 0 8
export SP_trigger_multiple
proc SP_trigger_multiple 8 12
line 69
;61:
;62:/*QUAKED trigger_multiple (.5 .5 .5) ?
;63:"wait" : Seconds between triggerings, 0.5 default, -1 = one time only.
;64:"random"	wait variance, default is 0
;65:Variable sized repeatable trigger.  Must be targeted at one or more entities.
;66:so, the basic time between firing is a random time between
;67:(wait - random) and (wait + random)
;68:*/
;69:void SP_trigger_multiple(gentity_t* ent) {
line 70
;70:	G_SpawnFloat("wait", "0.5", &ent->wait);
ADDRGP4 $76
ARGP4
ADDRGP4 $77
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 71
;71:	G_SpawnFloat("random", "0", &ent->random);
ADDRGP4 $78
ARGP4
ADDRGP4 $79
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 73
;72:
;73:	if (ent->random >= ent->wait && ent->wait >= 0) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
LTF4 $80
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 0
LTF4 $80
line 74
;74:		ent->random = ent->wait - FRAMETIME;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 75
;75:		G_Printf("trigger_multiple has random >= wait\n");
ADDRGP4 $82
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 76
;76:	}
LABELV $80
line 78
;77:
;78:	ent->touch = Touch_Multi;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 Touch_Multi
ASGNP4
line 79
;79:	ent->use   = Use_Multi;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_Multi
ASGNP4
line 81
;80:
;81:	InitTrigger(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 82
;82:	trap_LinkEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 83
;83:}
LABELV $75
endproc SP_trigger_multiple 8 12
export trigger_always_think
proc trigger_always_think 4 8
line 93
;84:
;85:/*
;86:==============================================================================
;87:
;88:trigger_always
;89:
;90:==============================================================================
;91:*/
;92:
;93:void trigger_always_think(gentity_t* ent) {
line 94
;94:	G_UseTargets(ent, ent);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 95
;95:	G_FreeEntity(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 96
;96:}
LABELV $83
endproc trigger_always_think 4 8
export SP_trigger_always
proc SP_trigger_always 0 0
line 101
;97:
;98:/*QUAKED trigger_always (.5 .5 .5) (-8 -8 -8) (8 8 8)
;99:This trigger will always fire.  It is activated by the world.
;100:*/
;101:void SP_trigger_always(gentity_t* ent) {
line 103
;102:	// we must have some delay to make sure our use targets are present
;103:	ent->nextthink = level.time + 300;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 300
ADDI4
ASGNI4
line 104
;104:	ent->think     = trigger_always_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 trigger_always_think
ASGNP4
line 105
;105:}
LABELV $84
endproc SP_trigger_always 0 0
export trigger_push_touch
proc trigger_push_touch 0 8
line 115
;106:
;107:/*
;108:==============================================================================
;109:
;110:trigger_push
;111:
;112:==============================================================================
;113:*/
;114:
;115:void trigger_push_touch(gentity_t* self, gentity_t* other, trace_t* trace) {
line 117
;116:
;117:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $87
line 118
;118:		return;
ADDRGP4 $86
JUMPV
LABELV $87
line 121
;119:	}
;120:
;121:	BG_TouchJumpPad(&other->client->ps, &self->s);
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 BG_TouchJumpPad
CALLV
pop
line 122
;122:}
LABELV $86
endproc trigger_push_touch 0 8
export AimAtTarget
proc AimAtTarget 68 4
line 131
;123:
;124:/*
;125:=================
;126:AimAtTarget
;127:
;128:Calculate origin2 so the target apogee will be hit
;129:=================
;130:*/
;131:void AimAtTarget(gentity_t* self) {
line 137
;132:	gentity_t* ent;
;133:	vec3_t     origin;
;134:	float      height, gravity, time, forward;
;135:	float      dist;
;136:
;137:	VectorAdd(self->r.absmin, self->r.absmax, origin);
ADDRLP4 36
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 36
INDIRP4
CNSTI4 464
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 476
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRP4
CNSTI4 468
ADDP4
INDIRF4
ADDRLP4 36
INDIRP4
CNSTI4 480
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 40
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0+8
ADDRLP4 40
INDIRP4
CNSTI4 472
ADDP4
INDIRF4
ADDRLP4 40
INDIRP4
CNSTI4 484
ADDP4
INDIRF4
ADDF4
ASGNF4
line 138
;138:	VectorScale(origin, 0.5, origin);
ADDRLP4 0
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 0+4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
ADDRLP4 0+8
ADDRLP4 0+8
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 140
;139:
;140:	ent = G_PickTarget(self->target);
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 44
INDIRP4
ASGNP4
line 141
;141:	if (!ent) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $96
line 142
;142:		G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 143
;143:		return;
ADDRGP4 $89
JUMPV
LABELV $96
line 146
;144:	}
;145:
;146:	height  = ent->s.origin[2] - origin[2];
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 147
;147:	gravity = g_gravity.value;
ADDRLP4 24
ADDRGP4 g_gravity+8
INDIRF4
ASGNF4
line 148
;148:	time    = sqrt(height / (0.5 * gravity));
ADDRLP4 28
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1056964608
MULF4
DIVF4
ARGF4
ADDRLP4 48
ADDRGP4 sqrt
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 48
INDIRF4
ASGNF4
line 149
;149:	if (!time) {
ADDRLP4 16
INDIRF4
CNSTF4 0
NEF4 $100
line 150
;150:		G_FreeEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 151
;151:		return;
ADDRGP4 $89
JUMPV
LABELV $100
line 155
;152:	}
;153:
;154:	// set s.origin2 to the push velocity
;155:	VectorSubtract(ent->s.origin, origin, self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 92
ADDP4
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 96
ADDP4
INDIRF4
ADDRLP4 0+4
INDIRF4
SUBF4
ASGNF4
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 100
ADDP4
INDIRF4
ADDRLP4 0+8
INDIRF4
SUBF4
ASGNF4
line 156
;156:	self->s.origin2[2] = 0;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
CNSTF4 0
ASGNF4
line 157
;157:	dist               = VectorNormalize(self->s.origin2);
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRLP4 52
ADDRGP4 VectorNormalize
CALLF4
ASGNF4
ADDRLP4 32
ADDRLP4 52
INDIRF4
ASGNF4
line 159
;158:
;159:	forward = dist / time;
ADDRLP4 20
ADDRLP4 32
INDIRF4
ADDRLP4 16
INDIRF4
DIVF4
ASGNF4
line 160
;160:	VectorScale(self->s.origin2, forward, self->s.origin2);
ADDRLP4 56
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 56
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 56
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 60
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 60
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 60
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
ADDRLP4 64
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 64
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 64
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 162
;161:
;162:	self->s.origin2[2] = time * gravity;
ADDRFP4 0
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 16
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
ASGNF4
line 163
;163:}
LABELV $89
endproc AimAtTarget 68 4
export SP_trigger_push
proc SP_trigger_push 4 4
line 169
;164:
;165:/*QUAKED trigger_push (.5 .5 .5) ?
;166:Must point at a target_position, which will be the apex of the leap.
;167:This will be client side predicted, unlike target_push
;168:*/
;169:void SP_trigger_push(gentity_t* self) {
line 170
;170:	InitTrigger(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 173
;171:
;172:	// unlike other triggers, we need to send this one to the client
;173:	self->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 176
;174:
;175:	// make sure the client precaches this sound
;176:	G_SoundIndex("sound/world/jumppad.wav");
ADDRGP4 $105
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 178
;177:
;178:	self->s.eType   = ET_PUSH_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 8
ASGNI4
line 179
;179:	self->touch     = trigger_push_touch;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 trigger_push_touch
ASGNP4
line 180
;180:	self->think     = AimAtTarget;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 AimAtTarget
ASGNP4
line 181
;181:	self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 182
;182:	trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 183
;183:}
LABELV $104
endproc SP_trigger_push 4 4
export Use_target_push
proc Use_target_push 0 12
line 185
;184:
;185:void Use_target_push(gentity_t* self, gentity_t* other, gentity_t* activator) {
line 186
;186:	if (!activator->client) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $108
line 187
;187:		return;
ADDRGP4 $107
JUMPV
LABELV $108
line 190
;188:	}
;189:
;190:	if (activator->client->ps.pm_type != PM_NORMAL) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
EQI4 $110
line 191
;191:		return;
ADDRGP4 $107
JUMPV
LABELV $110
line 193
;192:	}
;193:	if (activator->client->ps.powerups[PW_FLIGHT]) {
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $112
line 194
;194:		return;
ADDRGP4 $107
JUMPV
LABELV $112
line 197
;195:	}
;196:
;197:	VectorCopy(self->s.origin2, activator->client->ps.velocity);
ADDRFP4 8
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 32
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 104
ADDP4
INDIRB
ASGNB 12
line 200
;198:
;199:	// play fly sound every 1.5 seconds
;200:	if (activator->fly_sound_debounce_time < level.time) {
ADDRFP4 8
INDIRP4
CNSTI4 724
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
GEI4 $114
line 201
;201:		activator->fly_sound_debounce_time = level.time + 1500;
ADDRFP4 8
INDIRP4
CNSTI4 724
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1500
ADDI4
ASGNI4
line 202
;202:		G_Sound(activator, CHAN_AUTO, self->noise_index);
ADDRFP4 8
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 203
;203:	}
LABELV $114
line 204
;204:}
LABELV $107
endproc Use_target_push 0 12
export SP_target_push
proc SP_target_push 24 8
line 211
;205:
;206:/*QUAKED target_push (.5 .5 .5) (-8 -8 -8) (8 8 8) bouncepad
;207:Pushes the activator in the direction.of angle, or towards a target apex.
;208:"speed"		defaults to 1000
;209:if "bouncepad", play bounce noise instead of windfly
;210:*/
;211:void SP_target_push(gentity_t* self) {
line 212
;212:	if (!self->speed) {
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
CNSTF4 0
NEF4 $119
line 213
;213:		self->speed = 1000;
ADDRFP4 0
INDIRP4
CNSTI4 672
ADDP4
CNSTF4 1148846080
ASGNF4
line 214
;214:	}
LABELV $119
line 215
;215:	G_SetMovedir(self->s.angles, self->s.origin2);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 104
ADDP4
ARGP4
ADDRGP4 G_SetMovedir
CALLV
pop
line 216
;216:	VectorScale(self->s.origin2, self->speed, self->s.origin2);
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 104
ADDP4
INDIRF4
ADDRLP4 4
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
ADDRLP4 8
INDIRP4
CNSTI4 108
ADDP4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 112
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 112
ADDP4
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 672
ADDP4
INDIRF4
MULF4
ASGNF4
line 218
;217:
;218:	if (self->spawnflags & 1) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $121
line 219
;219:		self->noise_index = G_SoundIndex("sound/world/jumppad.wav");
ADDRGP4 $105
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 220
;220:	} else {
ADDRGP4 $122
JUMPV
LABELV $121
line 221
;221:		self->noise_index = G_SoundIndex("sound/misc/windfly.wav");
ADDRGP4 $123
ARGP4
ADDRLP4 16
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 16
INDIRI4
ASGNI4
line 222
;222:	}
LABELV $122
line 223
;223:	if (self->target) {
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $124
line 224
;224:		VectorCopy(self->s.origin, self->r.absmin);
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 464
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 225
;225:		VectorCopy(self->s.origin, self->r.absmax);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 476
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 226
;226:		self->think     = AimAtTarget;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 AimAtTarget
ASGNP4
line 227
;227:		self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 228
;228:	}
LABELV $124
line 229
;229:	self->use = Use_target_push;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 Use_target_push
ASGNP4
line 230
;230:}
LABELV $118
endproc SP_target_push 24 8
export trigger_teleporter_touch
proc trigger_teleporter_touch 12 12
line 240
;231:
;232:/*
;233:==============================================================================
;234:
;235:trigger_teleport
;236:
;237:==============================================================================
;238:*/
;239:
;240:void trigger_teleporter_touch(gentity_t* self, gentity_t* other, trace_t* trace) {
line 243
;241:	gentity_t* dest;
;242:
;243:	if (!other->client) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $128
line 244
;244:		return;
ADDRGP4 $127
JUMPV
LABELV $128
line 246
;245:	}
;246:	if (other->client->ps.pm_type == PM_DEAD) {
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
NEI4 $130
line 247
;247:		return;
ADDRGP4 $127
JUMPV
LABELV $130
line 250
;248:	}
;249:	// Spectators only?
;250:	if ((self->spawnflags & 1) && other->client->sess.sessionTeam != TEAM_SPECTATOR) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $132
ADDRFP4 4
INDIRP4
CNSTI4 516
ADDP4
INDIRP4
CNSTI4 624
ADDP4
INDIRI4
CNSTI4 3
EQI4 $132
line 251
;251:		return;
ADDRGP4 $127
JUMPV
LABELV $132
line 254
;252:	}
;253:
;254:	dest = G_PickTarget(self->target);
ADDRFP4 0
INDIRP4
CNSTI4 648
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 G_PickTarget
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 255
;255:	if (!dest) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $134
line 256
;256:		G_Printf("Couldn't find teleporter destination\n");
ADDRGP4 $136
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 257
;257:		return;
ADDRGP4 $127
JUMPV
LABELV $134
line 260
;258:	}
;259:
;260:	TeleportPlayer(other, dest->s.origin, dest->s.angles);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 116
ADDP4
ARGP4
ADDRGP4 TeleportPlayer
CALLV
pop
line 261
;261:}
LABELV $127
endproc trigger_teleporter_touch 12 12
export SP_trigger_teleport
proc SP_trigger_teleport 4 4
line 271
;262:
;263:/*QUAKED trigger_teleport (.5 .5 .5) ? SPECTATOR
;264:Allows client side prediction of teleportation events.
;265:Must point at a target_position, which will be the teleport destination.
;266:
;267:If spectator is set, only spectators can use this teleport
;268:Spectator teleporters are not normally placed in the editor, but are created
;269:automatically near doors to allow spectators to move through them
;270:*/
;271:void SP_trigger_teleport(gentity_t* self) {
line 272
;272:	InitTrigger(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 276
;273:
;274:	// unlike other triggers, we need to send this one to the client
;275:	// unless is a spectator trigger
;276:	if (self->spawnflags & 1) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $138
line 277
;277:		self->r.svFlags |= SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BORI4
ASGNI4
line 278
;278:	} else {
ADDRGP4 $139
JUMPV
LABELV $138
line 279
;279:		self->r.svFlags &= ~SVF_NOCLIENT;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 -2
BANDI4
ASGNI4
line 280
;280:	}
LABELV $139
line 283
;281:
;282:	// make sure the client precaches this sound
;283:	G_SoundIndex("sound/world/jumppad.wav");
ADDRGP4 $105
ARGP4
ADDRGP4 G_SoundIndex
CALLI4
pop
line 285
;284:
;285:	self->s.eType = ET_TELEPORT_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 9
ASGNI4
line 286
;286:	self->touch   = trigger_teleporter_touch;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 trigger_teleporter_touch
ASGNP4
line 288
;287:
;288:	trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 289
;289:}
LABELV $137
endproc SP_trigger_teleport 4 4
export hurt_use
proc hurt_use 0 4
line 311
;290:
;291:/*
;292:==============================================================================
;293:
;294:trigger_hurt
;295:
;296:==============================================================================
;297:*/
;298:
;299:/*QUAKED trigger_hurt (.5 .5 .5) ? START_OFF - SILENT NO_PROTECTION SLOW
;300:Any entity that touches this will be hurt.
;301:It does dmg points of damage each server frame
;302:Targeting the trigger will toggle its on / off state.
;303:
;304:SILENT			supresses playing the sound
;305:SLOW			changes the damage rate to once per second
;306:NO_PROTECTION	*nothing* stops the damage
;307:
;308:"dmg"			default 5 (whole numbers only)
;309:
;310:*/
;311:void hurt_use(gentity_t* self, gentity_t* other, gentity_t* activator) {
line 312
;312:	if (self->r.linked) {
ADDRFP4 0
INDIRP4
CNSTI4 416
ADDP4
INDIRI4
CNSTI4 0
EQI4 $141
line 313
;313:		trap_UnlinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_UnlinkEntity
CALLV
pop
line 314
;314:	} else {
ADDRGP4 $142
JUMPV
LABELV $141
line 315
;315:		trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 316
;316:	}
LABELV $142
line 317
;317:}
LABELV $140
endproc hurt_use 0 4
export hurt_touch
proc hurt_touch 8 32
line 319
;318:
;319:void hurt_touch(gentity_t* self, gentity_t* other, trace_t* trace) {
line 322
;320:	int dflags;
;321:
;322:	if (!other->takedamage) {
ADDRFP4 4
INDIRP4
CNSTI4 736
ADDP4
INDIRI4
CNSTI4 0
NEI4 $144
line 323
;323:		return;
ADDRGP4 $143
JUMPV
LABELV $144
line 326
;324:	}
;325:
;326:	if (self->timestamp > level.time) {
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
INDIRI4
ADDRGP4 level+32
INDIRI4
LEI4 $146
line 327
;327:		return;
ADDRGP4 $143
JUMPV
LABELV $146
line 330
;328:	}
;329:
;330:	if (self->spawnflags & 16) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $149
line 331
;331:		self->timestamp = level.time + 1000;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 1000
ADDI4
ASGNI4
line 332
;332:	} else {
ADDRGP4 $150
JUMPV
LABELV $149
line 333
;333:		self->timestamp = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 640
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 334
;334:	}
LABELV $150
line 337
;335:
;336:	// play sound
;337:	if (!(self->spawnflags & 4)) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 4
BANDI4
CNSTI4 0
NEI4 $153
line 338
;338:		G_Sound(other, CHAN_AUTO, self->noise_index);
ADDRFP4 4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
INDIRI4
ARGI4
ADDRGP4 G_Sound
CALLV
pop
line 339
;339:	}
LABELV $153
line 341
;340:
;341:	if (self->spawnflags & 8)
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $155
line 342
;342:		dflags = DAMAGE_NO_PROTECTION;
ADDRLP4 0
CNSTI4 8
ASGNI4
ADDRGP4 $156
JUMPV
LABELV $155
line 344
;343:	else
;344:		dflags = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $156
line 345
;345:	G_Damage(other, self, self, NULL, NULL, self->damage, dflags, MOD_TRIGGER_HURT);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTP4 0
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 22
ARGI4
ADDRGP4 G_Damage
CALLV
pop
line 346
;346:}
LABELV $143
endproc hurt_touch 8 32
export SP_trigger_hurt
proc SP_trigger_hurt 4 4
line 348
;347:
;348:void SP_trigger_hurt(gentity_t* self) {
line 349
;349:	InitTrigger(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 InitTrigger
CALLV
pop
line 351
;350:
;351:	self->noise_index = G_SoundIndex("sound/world/electro.wav");
ADDRGP4 $158
ARGP4
ADDRLP4 0
ADDRGP4 G_SoundIndex
CALLI4
ASGNI4
ADDRFP4 0
INDIRP4
CNSTI4 792
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 352
;352:	self->touch       = hurt_touch;
ADDRFP4 0
INDIRP4
CNSTI4 704
ADDP4
ADDRGP4 hurt_touch
ASGNP4
line 354
;353:
;354:	if (!self->damage) {
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $159
line 355
;355:		self->damage = 5;
ADDRFP4 0
INDIRP4
CNSTI4 740
ADDP4
CNSTI4 5
ASGNI4
line 356
;356:	}
LABELV $159
line 358
;357:
;358:	self->r.contents = CONTENTS_TRIGGER;
ADDRFP4 0
INDIRP4
CNSTI4 460
ADDP4
CNSTI4 1073741824
ASGNI4
line 360
;359:
;360:	if (self->spawnflags & 2) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $161
line 361
;361:		self->use = hurt_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 hurt_use
ASGNP4
line 362
;362:	}
LABELV $161
line 365
;363:
;364:	// link in to the world if starting active
;365:	if (!(self->spawnflags & 1)) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $163
line 366
;366:		trap_LinkEntity(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_LinkEntity
CALLV
pop
line 367
;367:	}
LABELV $163
line 368
;368:}
LABELV $157
endproc SP_trigger_hurt 4 4
export func_timer_think
proc func_timer_think 12 8
line 389
;369:
;370:/*
;371:==============================================================================
;372:
;373:timer
;374:
;375:==============================================================================
;376:*/
;377:
;378:/*QUAKED func_timer (0.3 0.1 0.6) (-8 -8 -8) (8 8 8) START_ON
;379:This should be renamed trigger_timer...
;380:Repeatedly fires its targets.
;381:Can be turned on or off by using.
;382:
;383:"wait"			base time between triggering all targets, default is 1
;384:"random"		wait variance, default is 0
;385:so, the basic time between firing is a random time between
;386:(wait - random) and (wait + random)
;387:
;388:*/
;389:void func_timer_think(gentity_t* self) {
line 390
;390:	G_UseTargets(self, self->activator);
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 772
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_UseTargets
CALLV
pop
line 392
;391:	// set time before next firing
;392:	self->nextthink = level.time + 1000 * (self->wait + crandom() * self->random);
ADDRLP4 4
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CVIF4 4
ADDRLP4 8
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
ADDRLP4 4
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
ADDF4
CNSTF4 1148846080
MULF4
ADDF4
CVFI4 4
ASGNI4
line 393
;393:}
LABELV $165
endproc func_timer_think 12 8
export func_timer_use
proc func_timer_use 0 4
line 395
;394:
;395:void func_timer_use(gentity_t* self, gentity_t* other, gentity_t* activator) {
line 396
;396:	self->activator = activator;
ADDRFP4 0
INDIRP4
CNSTI4 772
ADDP4
ADDRFP4 8
INDIRP4
ASGNP4
line 399
;397:
;398:	// if on, turn it off
;399:	if (self->nextthink) {
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
INDIRI4
CNSTI4 0
EQI4 $168
line 400
;400:		self->nextthink = 0;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
CNSTI4 0
ASGNI4
line 401
;401:		return;
ADDRGP4 $167
JUMPV
LABELV $168
line 405
;402:	}
;403:
;404:	// turn it on
;405:	func_timer_think(self);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 func_timer_think
CALLV
pop
line 406
;406:}
LABELV $167
endproc func_timer_use 0 4
export SP_func_timer
proc SP_func_timer 12 12
line 408
;407:
;408:void SP_func_timer(gentity_t* self) {
line 409
;409:	G_SpawnFloat("random", "1", &self->random);
ADDRGP4 $78
ARGP4
ADDRGP4 $171
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 800
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 410
;410:	G_SpawnFloat("wait", "1", &self->wait);
ADDRGP4 $76
ARGP4
ADDRGP4 $171
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 796
ADDP4
ARGP4
ADDRGP4 G_SpawnFloat
CALLI4
pop
line 412
;411:
;412:	self->use   = func_timer_use;
ADDRFP4 0
INDIRP4
CNSTI4 708
ADDP4
ADDRGP4 func_timer_use
ASGNP4
line 413
;413:	self->think = func_timer_think;
ADDRFP4 0
INDIRP4
CNSTI4 692
ADDP4
ADDRGP4 func_timer_think
ASGNP4
line 415
;414:
;415:	if (self->random >= self->wait) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 800
ADDP4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
LTF4 $172
line 416
;416:		self->random = self->wait - FRAMETIME;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 800
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 796
ADDP4
INDIRF4
CNSTF4 1120403456
SUBF4
ASGNF4
line 417
;417:		G_Printf("func_timer at %s has random >= wait\n", vtos(self->s.origin));
ADDRFP4 0
INDIRP4
CNSTI4 92
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 vtos
CALLP4
ASGNP4
ADDRGP4 $174
ARGP4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 418
;418:	}
LABELV $172
line 420
;419:
;420:	if (self->spawnflags & 1) {
ADDRFP4 0
INDIRP4
CNSTI4 528
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $175
line 421
;421:		self->nextthink = level.time + FRAMETIME;
ADDRFP4 0
INDIRP4
CNSTI4 688
ADDP4
ADDRGP4 level+32
INDIRI4
CNSTI4 100
ADDI4
ASGNI4
line 422
;422:		self->activator = self;
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CNSTI4 772
ADDP4
ADDRLP4 4
INDIRP4
ASGNP4
line 423
;423:	}
LABELV $175
line 425
;424:
;425:	self->r.svFlags = SVF_NOCLIENT;
ADDRFP4 0
INDIRP4
CNSTI4 424
ADDP4
CNSTI4 1
ASGNI4
line 426
;426:}
LABELV $170
endproc SP_func_timer 12 12
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
LABELV $174
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 32
byte 1 97
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $171
byte 1 49
byte 1 0
align 1
LABELV $158
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 114
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $136
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
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 101
byte 1 114
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $123
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 119
byte 1 105
byte 1 110
byte 1 100
byte 1 102
byte 1 108
byte 1 121
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $105
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 47
byte 1 106
byte 1 117
byte 1 109
byte 1 112
byte 1 112
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $82
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 109
byte 1 117
byte 1 108
byte 1 116
byte 1 105
byte 1 112
byte 1 108
byte 1 101
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $79
byte 1 48
byte 1 0
align 1
LABELV $78
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $77
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $76
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
