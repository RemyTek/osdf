export PM_SlideMove
code
proc PM_SlideMove 292 28
file "../../../../code/game/bg_slidemove.c"
line 25
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// bg_slidemove.c -- part of bg_pmove functionality
;4:
;5:#include "q_shared.h"
;6:#include "bg_public.h"
;7:#include "bg_local.h"
;8:
;9:/*
;10:
;11:input: origin, velocity, bounds, groundPlane, trace function
;12:
;13:output: origin, velocity, impacts, stairup boolean
;14:
;15:*/
;16:
;17:/*
;18:==================
;19:PM_SlideMove
;20:
;21:Returns qtrue if the velocity was clipped in some way
;22:==================
;23:*/
;24:#define MAX_CLIP_PLANES 5
;25:qboolean PM_SlideMove(qboolean gravity) {
line 41
;26:	int     bumpcount, numbumps;
;27:	vec3_t  dir;
;28:	float   d;
;29:	int     numplanes;
;30:	vec3_t  planes[MAX_CLIP_PLANES];
;31:	vec3_t  primal_velocity;
;32:	vec3_t  clipVelocity;
;33:	int     i, j, k;
;34:	trace_t trace;
;35:	vec3_t  end;
;36:	float   time_left;
;37:	float   into;
;38:	vec3_t  endVelocity;
;39:	vec3_t  endClipVelocity;
;40:
;41:	numbumps = 4;
ADDRLP4 208
CNSTI4 4
ASGNI4
line 43
;42:
;43:	VectorCopy(pm->ps->velocity, primal_velocity);
ADDRLP4 212
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 45
;44:
;45:	if (gravity) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $42
line 46
;46:		VectorCopy(pm->ps->velocity, endVelocity);
ADDRLP4 116
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 47
;47:		endVelocity[2] -= pm->ps->gravity * pml.frametime;
ADDRLP4 116+8
ADDRLP4 116+8
INDIRF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 pml+36
INDIRF4
MULF4
SUBF4
ASGNF4
line 48
;48:		pm->ps->velocity[2] = (pm->ps->velocity[2] + endVelocity[2]) * 0.5;
ADDRLP4 224
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 224
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 224
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 116+8
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 49
;49:		primal_velocity[2]  = endVelocity[2];
ADDRLP4 212+8
ADDRLP4 116+8
INDIRF4
ASGNF4
line 50
;50:		if (pml.groundPlane) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $49
line 52
;51:			// slide along the ground plane
;52:			PM_ClipVelocity(pm->ps->velocity, pml.groundTrace.plane.normal, pm->ps->velocity, OVERCLIP);
ADDRLP4 228
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 228
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRGP4 pml+52+24
ARGP4
ADDRLP4 228
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 53
;53:		}
LABELV $49
line 54
;54:	}
LABELV $42
line 56
;55:
;56:	time_left = pml.frametime;
ADDRLP4 188
ADDRGP4 pml+36
INDIRF4
ASGNF4
line 59
;57:
;58:	// never turn against the ground plane
;59:	if (pml.groundPlane) {
ADDRGP4 pml+48
INDIRI4
CNSTI4 0
EQI4 $55
line 60
;60:		numplanes = 1;
ADDRLP4 96
CNSTI4 1
ASGNI4
line 61
;61:		VectorCopy(pml.groundTrace.plane.normal, planes[0]);
ADDRLP4 4
ADDRGP4 pml+52+24
INDIRB
ASGNB 12
line 62
;62:	} else {
ADDRGP4 $56
JUMPV
LABELV $55
line 63
;63:		numplanes = 0;
ADDRLP4 96
CNSTI4 0
ASGNI4
line 64
;64:	}
LABELV $56
line 67
;65:
;66:	// never turn against original velocity
;67:	VectorNormalize2(pm->ps->velocity, planes[numplanes]);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 96
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRGP4 VectorNormalize2
CALLF4
pop
line 68
;68:	numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 70
;69:
;70:	for (bumpcount = 0; bumpcount < numbumps; bumpcount++) {
ADDRLP4 204
CNSTI4 0
ASGNI4
ADDRGP4 $63
JUMPV
LABELV $60
line 73
;71:
;72:		// calculate position we are trying to move to
;73:		VectorMA(pm->ps->origin, time_left, pm->ps->velocity, end);
ADDRLP4 224
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 228
ADDRLP4 224
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192
ADDRLP4 228
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ADDRLP4 228
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 236
ADDRLP4 224
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192+4
ADDRLP4 236
INDIRP4
CNSTI4 24
ADDP4
INDIRF4
ADDRLP4 236
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
ADDRLP4 240
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 192+8
ADDRLP4 240
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 240
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 188
INDIRF4
MULF4
ADDF4
ASGNF4
line 76
;74:
;75:		// see if we can make it there
;76:		pm->trace(&trace, pm->ps->origin, pm->mins, pm->maxs, end, pm->ps->clientNum, pm->tracemask);
ADDRLP4 128
ARGP4
ADDRLP4 244
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 248
ADDRLP4 244
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 248
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 244
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 192
ARGP4
ADDRLP4 248
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 244
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 78
;77:
;78:		if (trace.allsolid) {
ADDRLP4 128
INDIRI4
CNSTI4 0
EQI4 $66
line 80
;79:			// entity is completely trapped in another solid
;80:			pm->ps->velocity[2] = 0;  // don't build up falling damage, but allow sideways acceleration
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 81
;81:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $41
JUMPV
LABELV $66
line 84
;82:		}
;83:
;84:		if (trace.fraction > 0) {
ADDRLP4 128+8
INDIRF4
CNSTF4 0
LEF4 $68
line 86
;85:			// actually covered some distance
;86:			VectorCopy(trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 128+12
INDIRB
ASGNB 12
line 87
;87:		}
LABELV $68
line 89
;88:
;89:		if (trace.fraction == 1) {
ADDRLP4 128+8
INDIRF4
CNSTF4 1065353216
NEF4 $72
line 90
;90:			break;  // moved the entire distance
ADDRGP4 $62
JUMPV
LABELV $72
line 94
;91:		}
;92:
;93:		// save entity for contact
;94:		PM_AddTouchEnt(trace.entityNum);
ADDRLP4 128+52
INDIRI4
ARGI4
ADDRGP4 PM_AddTouchEnt
CALLV
pop
line 96
;95:
;96:		time_left -= time_left * trace.fraction;
ADDRLP4 188
ADDRLP4 188
INDIRF4
ADDRLP4 188
INDIRF4
ADDRLP4 128+8
INDIRF4
MULF4
SUBF4
ASGNF4
line 98
;97:
;98:		if (numplanes >= MAX_CLIP_PLANES) {
ADDRLP4 96
INDIRI4
CNSTI4 5
LTI4 $77
line 100
;99:			// this shouldn't really happen
;100:			VectorClear(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 101
;101:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $41
JUMPV
LABELV $77
line 109
;102:		}
;103:
;104:		//
;105:		// if this is the same plane we hit before, nudge velocity
;106:		// out along it, which fixes some epsilon issues with
;107:		// non-axial planes
;108:		//
;109:		for (i = 0; i < numplanes; i++) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $82
JUMPV
LABELV $79
line 110
;110:			if (DotProduct(trace.plane.normal, planes[i]) > 0.99) {
ADDRLP4 128+24
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1065185444
LEF4 $83
line 111
;111:				VectorAdd(trace.plane.normal, pm->ps->velocity, pm->ps->velocity);
ADDRLP4 260
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 260
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 128+24
INDIRF4
ADDRLP4 260
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 264
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 264
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 128+24+4
INDIRF4
ADDRLP4 264
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 268
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 268
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 128+24+8
INDIRF4
ADDRLP4 268
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDF4
ASGNF4
line 112
;112:				break;
ADDRGP4 $81
JUMPV
LABELV $83
line 114
;113:			}
;114:		}
LABELV $80
line 109
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $82
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $79
LABELV $81
line 115
;115:		if (i < numplanes) {
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
GEI4 $97
line 116
;116:			continue;
ADDRGP4 $61
JUMPV
LABELV $97
line 118
;117:		}
;118:		VectorCopy(trace.plane.normal, planes[numplanes]);
ADDRLP4 96
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ADDRLP4 128+24
INDIRB
ASGNB 12
line 119
;119:		numplanes++;
ADDRLP4 96
ADDRLP4 96
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 126
;120:
;121:		//
;122:		// modify velocity so it parallels all of the clip planes
;123:		//
;124:
;125:		// find a plane that it enters
;126:		for (i = 0; i < numplanes; i++) {
ADDRLP4 80
CNSTI4 0
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $100
line 127
;127:			into = DotProduct(pm->ps->velocity, planes[i]);
ADDRLP4 256
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 184
ADDRLP4 256
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 256
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+4
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 256
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 128
;128:			if (into >= 0.1) {
ADDRLP4 184
INDIRF4
CNSTF4 1036831949
LTF4 $106
line 129
;129:				continue;  // move doesn't interact with the plane
ADDRGP4 $101
JUMPV
LABELV $106
line 133
;130:			}
;131:
;132:			// see how hard we are hitting things
;133:			if (-into > pml.impactSpeed) {
ADDRLP4 184
INDIRF4
NEGF4
ADDRGP4 pml+108
INDIRF4
LEF4 $108
line 134
;134:				pml.impactSpeed = -into;
ADDRGP4 pml+108
ADDRLP4 184
INDIRF4
NEGF4
ASGNF4
line 135
;135:			}
LABELV $108
line 138
;136:
;137:			// slide along the plane
;138:			PM_ClipVelocity(pm->ps->velocity, planes[i], clipVelocity, OVERCLIP);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 141
;139:
;140:			// slide along the plane
;141:			PM_ClipVelocity(endVelocity, planes[i], endClipVelocity, OVERCLIP);
ADDRLP4 116
ARGP4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 144
;142:
;143:			// see if there is a second plane that the new move enters
;144:			for (j = 0; j < numplanes; j++) {
ADDRLP4 76
CNSTI4 0
ASGNI4
ADDRGP4 $115
JUMPV
LABELV $112
line 145
;145:				if (j == i) {
ADDRLP4 76
INDIRI4
ADDRLP4 80
INDIRI4
NEI4 $116
line 146
;146:					continue;
ADDRGP4 $113
JUMPV
LABELV $116
line 148
;147:				}
;148:				if (DotProduct(clipVelocity, planes[j]) >= 0.1) {
ADDRLP4 64
INDIRF4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 76
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
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 1036831949
LTF4 $118
line 149
;149:					continue;  // move doesn't interact with the plane
ADDRGP4 $113
JUMPV
LABELV $118
line 153
;150:				}
;151:
;152:				// try clipping the move to the plane
;153:				PM_ClipVelocity(clipVelocity, planes[j], clipVelocity, OVERCLIP);
ADDRLP4 64
ARGP4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 64
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 154
;154:				PM_ClipVelocity(endClipVelocity, planes[j], endClipVelocity, OVERCLIP);
ADDRLP4 104
ARGP4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 104
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 157
;155:
;156:				// see if it goes back into the first clip plane
;157:				if (DotProduct(clipVelocity, planes[i]) >= 0) {
ADDRLP4 64
INDIRF4
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
INDIRF4
MULF4
ADDRLP4 64+4
INDIRF4
ADDRLP4 80
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
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4+8
ADDP4
INDIRF4
MULF4
ADDF4
CNSTF4 0
LTF4 $124
line 158
;158:					continue;
ADDRGP4 $113
JUMPV
LABELV $124
line 162
;159:				}
;160:
;161:				// slide the original velocity along the crease
;162:				CrossProduct(planes[i], planes[j], dir);
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 163
;163:				VectorNormalize(dir);
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 164
;164:				d = DotProduct(dir, pm->ps->velocity);
ADDRLP4 272
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 272
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
MULF4
ADDF4
ASGNF4
line 165
;165:				VectorScale(dir, d, clipVelocity);
ADDRLP4 64
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 64+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 167
;166:
;167:				CrossProduct(planes[i], planes[j], dir);
ADDRLP4 80
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 76
INDIRI4
CNSTI4 12
MULI4
ADDRLP4 4
ADDP4
ARGP4
ADDRLP4 84
ARGP4
ADDRGP4 CrossProduct
CALLV
pop
line 168
;168:				VectorNormalize(dir);
ADDRLP4 84
ARGP4
ADDRGP4 VectorNormalize
CALLF4
pop
line 169
;169:				d = DotProduct(dir, endVelocity);
ADDRLP4 100
ADDRLP4 84
INDIRF4
ADDRLP4 116
INDIRF4
MULF4
ADDRLP4 84+4
INDIRF4
ADDRLP4 116+4
INDIRF4
MULF4
ADDF4
ADDRLP4 84+8
INDIRF4
ADDRLP4 116+8
INDIRF4
MULF4
ADDF4
ASGNF4
line 170
;170:				VectorScale(dir, d, endClipVelocity);
ADDRLP4 104
ADDRLP4 84
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+4
ADDRLP4 84+4
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
ADDRLP4 104+8
ADDRLP4 84+8
INDIRF4
ADDRLP4 100
INDIRF4
MULF4
ASGNF4
line 173
;171:
;172:				// see if there is a third plane the the new move enters
;173:				for (k = 0; k < numplanes; k++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $147
JUMPV
LABELV $144
line 174
;174:					if (k == i || k == j) {
ADDRLP4 0
INDIRI4
ADDRLP4 80
INDIRI4
EQI4 $150
ADDRLP4 0
INDIRI4
ADDRLP4 76
INDIRI4
NEI4 $148
LABELV $150
line 175
;175:						continue;
ADDRGP4 $145
JUMPV
LABELV $148
line 177
;176:					}
;177:					if (DotProduct(clipVelocity, planes[k]) >= 0.1) {
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
LTF4 $151
line 178
;178:						continue;  // move doesn't interact with the plane
ADDRGP4 $145
JUMPV
LABELV $151
line 182
;179:					}
;180:
;181:					// stop dead at a tripple plane interaction
;182:					VectorClear(pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 36
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
CNSTF4 0
ASGNF4
line 183
;183:					return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $41
JUMPV
LABELV $145
line 173
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $147
ADDRLP4 0
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $144
line 185
;184:				}
;185:			}
LABELV $113
line 144
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $115
ADDRLP4 76
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $112
line 188
;186:
;187:			// if we have fixed all interactions, try another move
;188:			VectorCopy(clipVelocity, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 64
INDIRB
ASGNB 12
line 189
;189:			VectorCopy(endClipVelocity, endVelocity);
ADDRLP4 116
ADDRLP4 104
INDIRB
ASGNB 12
line 190
;190:			break;
ADDRGP4 $102
JUMPV
LABELV $101
line 126
ADDRLP4 80
ADDRLP4 80
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $103
ADDRLP4 80
INDIRI4
ADDRLP4 96
INDIRI4
LTI4 $100
LABELV $102
line 192
;191:		}
;192:	}
LABELV $61
line 70
ADDRLP4 204
ADDRLP4 204
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $63
ADDRLP4 204
INDIRI4
ADDRLP4 208
INDIRI4
LTI4 $60
LABELV $62
line 194
;193:
;194:	if (gravity) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $157
line 195
;195:		VectorCopy(endVelocity, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 116
INDIRB
ASGNB 12
line 196
;196:	}
LABELV $157
line 199
;197:
;198:	// don't change velocity if in a timer (FIXME: is this correct?)
;199:	if (pm->ps->pm_time) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
CNSTI4 0
EQI4 $159
line 200
;200:		VectorCopy(primal_velocity, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 212
INDIRB
ASGNB 12
line 201
;201:	}
LABELV $159
line 203
;202:
;203:	return (bumpcount != 0);
ADDRLP4 204
INDIRI4
CNSTI4 0
EQI4 $162
ADDRLP4 224
CNSTI4 1
ASGNI4
ADDRGP4 $163
JUMPV
LABELV $162
ADDRLP4 224
CNSTI4 0
ASGNI4
LABELV $163
ADDRLP4 224
INDIRI4
RETI4
LABELV $41
endproc PM_SlideMove 292 28
export PM_StepSlideMove
proc PM_StepSlideMove 132 28
line 212
;204:}
;205:
;206:/*
;207:==================
;208:PM_StepSlideMove
;209:
;210:==================
;211:*/
;212:void PM_StepSlideMove(qboolean gravity) {
line 221
;213:	vec3_t start_o, start_v;
;214:	//	vec3_t		down_o, down_v;
;215:	trace_t trace;
;216:	//	float		down_dist, up_dist;
;217:	//	vec3_t		delta, delta2;
;218:	vec3_t up, down;
;219:	float  stepSize;
;220:
;221:	VectorCopy(pm->ps->origin, start_o);
ADDRLP4 68
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 222
;222:	VectorCopy(pm->ps->velocity, start_v);
ADDRLP4 92
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
INDIRB
ASGNB 12
line 224
;223:
;224:	if (PM_SlideMove(gravity) == 0) {
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 108
ADDRGP4 PM_SlideMove
CALLI4
ASGNI4
ADDRLP4 108
INDIRI4
CNSTI4 0
NEI4 $165
line 225
;225:		return;  // we got exactly where we wanted to go first try
ADDRGP4 $164
JUMPV
LABELV $165
line 228
;226:	}
;227:
;228:	VectorCopy(start_o, down);
ADDRLP4 80
ADDRLP4 68
INDIRB
ASGNB 12
line 229
;229:	down[2] -= PM_STEP_HEIGHT;
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
CNSTF4 1099956224
SUBF4
ASGNF4
line 230
;230:	pm->trace(&trace, start_o, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 112
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 112
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 112
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 112
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 112
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 231
;231:	VectorSet(up, 0, 0, 1);
ADDRLP4 56
CNSTF4 0
ASGNF4
ADDRLP4 56+4
CNSTF4 0
ASGNF4
ADDRLP4 56+8
CNSTF4 1065353216
ASGNF4
line 233
;232:	// never step up when you still have up velocity
;233:	if (pm->ps->velocity[2] > 0 && (trace.fraction == 1.0 || DotProduct(trace.plane.normal, up) < 0.7)) {
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
CNSTF4 0
LEF4 $170
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
EQF4 $180
ADDRLP4 0+24
INDIRF4
ADDRLP4 56
INDIRF4
MULF4
ADDRLP4 0+24+4
INDIRF4
ADDRLP4 56+4
INDIRF4
MULF4
ADDF4
ADDRLP4 0+24+8
INDIRF4
ADDRLP4 56+8
INDIRF4
MULF4
ADDF4
CNSTF4 1060320051
GEF4 $170
LABELV $180
line 234
;234:		return;
ADDRGP4 $164
JUMPV
LABELV $170
line 240
;235:	}
;236:
;237:	// VectorCopy (pm->ps->origin, down_o);
;238:	// VectorCopy (pm->ps->velocity, down_v);
;239:
;240:	VectorCopy(start_o, up);
ADDRLP4 56
ADDRLP4 68
INDIRB
ASGNB 12
line 241
;241:	up[2] += PM_STEP_HEIGHT;
ADDRLP4 56+8
ADDRLP4 56+8
INDIRF4
CNSTF4 1099956224
ADDF4
ASGNF4
line 244
;242:
;243:	// test the player position if they were a stepheight higher
;244:	pm->trace(&trace, start_o, pm->mins, pm->maxs, up, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 68
ARGP4
ADDRLP4 116
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 116
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 116
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 116
INDIRP4
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 116
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 116
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 245
;245:	if (trace.allsolid) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $182
line 246
;246:		if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $164
line 247
;247:			Com_Printf("%i:bend can't step\n", c_pmove);
ADDRGP4 $186
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 248
;248:		}
line 249
;249:		return;  // can't step up
ADDRGP4 $164
JUMPV
LABELV $182
line 252
;250:	}
;251:
;252:	stepSize = trace.endpos[2] - start_o[2];
ADDRLP4 104
ADDRLP4 0+12+8
INDIRF4
ADDRLP4 68+8
INDIRF4
SUBF4
ASGNF4
line 254
;253:	// try slidemove from this position
;254:	VectorCopy(trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 255
;255:	VectorCopy(start_v, pm->ps->velocity);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 92
INDIRB
ASGNB 12
line 257
;256:
;257:	PM_SlideMove(gravity);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 PM_SlideMove
CALLI4
pop
line 260
;258:
;259:	// push down the final amount
;260:	VectorCopy(pm->ps->origin, down);
ADDRLP4 80
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
INDIRB
ASGNB 12
line 261
;261:	down[2] -= stepSize;
ADDRLP4 80+8
ADDRLP4 80+8
INDIRF4
ADDRLP4 104
INDIRF4
SUBF4
ASGNF4
line 262
;262:	pm->trace(&trace, pm->ps->origin, pm->mins, pm->maxs, down, pm->ps->clientNum, pm->tracemask);
ADDRLP4 0
ARGP4
ADDRLP4 120
ADDRGP4 pm
INDIRP4
ASGNP4
ADDRLP4 124
ADDRLP4 120
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 124
INDIRP4
CNSTI4 20
ADDP4
ARGP4
ADDRLP4 120
INDIRP4
CNSTI4 176
ADDP4
ARGP4
ADDRLP4 120
INDIRP4
CNSTI4 188
ADDP4
ARGP4
ADDRLP4 80
ARGP4
ADDRLP4 124
INDIRP4
CNSTI4 140
ADDP4
INDIRI4
ARGI4
ADDRLP4 120
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ARGI4
ADDRLP4 120
INDIRP4
CNSTI4 220
ADDP4
INDIRP4
CALLV
pop
line 263
;263:	if (!trace.allsolid) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $192
line 264
;264:		VectorCopy(trace.endpos, pm->ps->origin);
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 0+12
INDIRB
ASGNB 12
line 265
;265:	}
LABELV $192
line 266
;266:	if (trace.fraction < 1.0) {
ADDRLP4 0+8
INDIRF4
CNSTF4 1065353216
GEF4 $195
line 267
;267:		PM_ClipVelocity(pm->ps->velocity, trace.plane.normal, pm->ps->velocity, OVERCLIP);
ADDRLP4 128
ADDRGP4 pm
INDIRP4
INDIRP4
ASGNP4
ADDRLP4 128
INDIRP4
CNSTI4 32
ADDP4
ARGP4
ADDRLP4 0+24
ARGP4
ADDRLP4 128
INDIRP4
CNSTI4 32
ADDP4
ARGP4
CNSTF4 1065361605
ARGF4
ADDRGP4 PM_ClipVelocity
CALLV
pop
line 268
;268:	}
LABELV $195
line 282
;269:
;270:#if 0
;271:	// if the down trace can trace back to the original position directly, don't step
;272:	pm->trace( &trace, pm->ps->origin, pm->mins, pm->maxs, start_o, pm->ps->clientNum, pm->tracemask);
;273:	if ( trace.fraction == 1.0 ) {
;274:		// use the original move
;275:		VectorCopy (down_o, pm->ps->origin);
;276:		VectorCopy (down_v, pm->ps->velocity);
;277:		if ( pm->debugLevel ) {
;278:			Com_Printf("%i:bend\n", c_pmove);
;279:		}
;280:	} else
;281:#endif
;282:	{
line 286
;283:		// use the step move
;284:		float delta;
;285:
;286:		delta = pm->ps->origin[2] - start_o[2];
ADDRLP4 128
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ADDRLP4 68+8
INDIRF4
SUBF4
ASGNF4
line 287
;287:		if (delta > 2 && pm->ps->pm_type != PM_DEAD) {
ADDRLP4 128
INDIRF4
CNSTF4 1073741824
LEF4 $200
ADDRGP4 pm
INDIRP4
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 3
EQI4 $200
line 288
;288:			if (delta < 7) {
ADDRLP4 128
INDIRF4
CNSTF4 1088421888
GEF4 $202
line 289
;289:				PM_AddEvent(EV_STEP_4);
CNSTI4 6
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 290
;290:			} else if (delta < 11) {
ADDRGP4 $203
JUMPV
LABELV $202
ADDRLP4 128
INDIRF4
CNSTF4 1093664768
GEF4 $204
line 291
;291:				PM_AddEvent(EV_STEP_8);
CNSTI4 7
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 292
;292:			} else if (delta < 15) {
ADDRGP4 $205
JUMPV
LABELV $204
ADDRLP4 128
INDIRF4
CNSTF4 1097859072
GEF4 $206
line 293
;293:				PM_AddEvent(EV_STEP_12);
CNSTI4 8
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 294
;294:			} else {
ADDRGP4 $207
JUMPV
LABELV $206
line 295
;295:				PM_AddEvent(EV_STEP_16);
CNSTI4 9
ARGI4
ADDRGP4 PM_AddEvent
CALLV
pop
line 296
;296:			}
LABELV $207
LABELV $205
LABELV $203
line 297
;297:		}
LABELV $200
line 298
;298:		if (pm->debugLevel) {
ADDRGP4 pm
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CNSTI4 0
EQI4 $208
line 299
;299:			Com_Printf("%i:stepped\n", c_pmove);
ADDRGP4 $210
ARGP4
ADDRGP4 c_pmove
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 300
;300:		}
LABELV $208
line 301
;301:	}
line 302
;302:}
LABELV $164
endproc PM_StepSlideMove 132 28
import PM_AddEvent
import PM_AddTouchEnt
import PM_ClipVelocity
import c_pmove
import pm_flightfriction
import pm_waterfriction
import pm_friction
import pm_flyaccelerate
import pm_wateraccelerate
import pm_airaccelerate
import pm_accelerate
import pm_wadeScale
import pm_swimScale
import pm_duckScale
import pm_stopspeed
import pml
import pm
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
LABELV $210
byte 1 37
byte 1 105
byte 1 58
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 112
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $186
byte 1 37
byte 1 105
byte 1 58
byte 1 98
byte 1 101
byte 1 110
byte 1 100
byte 1 32
byte 1 99
byte 1 97
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 10
byte 1 0
