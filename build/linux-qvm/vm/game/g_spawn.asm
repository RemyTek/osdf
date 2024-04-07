export G_SpawnString
code
proc G_SpawnString 8 8
file "../../../../code/game/g_spawn.c"
line 6
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:
;4:#include "g_local.h"
;5:
;6:qboolean G_SpawnString(const char* key, const char* defaultString, char** out) {
line 9
;7:	int i;
;8:
;9:	if (!level.spawning) {
ADDRGP4 level+2980
INDIRI4
CNSTI4 0
NEI4 $55
line 10
;10:		*out = (char*)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 12
;11:		//		G_Error( "G_SpawnString() called while not spawning" );
;12:	}
LABELV $55
line 14
;13:
;14:	for (i = 0; i < level.numSpawnVars; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $61
JUMPV
LABELV $58
line 15
;15:		if (!Q_stricmp(key, level.spawnVars[i][0])) {
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+2988
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $63
line 16
;16:			*out = level.spawnVars[i][1];
ADDRFP4 8
INDIRP4
ADDRLP4 0
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+2988+4
ADDP4
INDIRP4
ASGNP4
line 17
;17:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $54
JUMPV
LABELV $63
line 19
;18:		}
;19:	}
LABELV $59
line 14
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $61
ADDRLP4 0
INDIRI4
ADDRGP4 level+2984
INDIRI4
LTI4 $58
line 21
;20:
;21:	*out = (char*)defaultString;
ADDRFP4 8
INDIRP4
ADDRFP4 4
INDIRP4
ASGNP4
line 22
;22:	return qfalse;
CNSTI4 0
RETI4
LABELV $54
endproc G_SpawnString 8 8
export G_SpawnFloat
proc G_SpawnFloat 16 12
line 25
;23:}
;24:
;25:qboolean G_SpawnFloat(const char* key, const char* defaultString, float* out) {
line 29
;26:	char*    s;
;27:	qboolean present;
;28:
;29:	present = G_SpawnString(key, defaultString, &s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 30
;30:	*out    = atof(s);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRF4
ASGNF4
line 31
;31:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $68
endproc G_SpawnFloat 16 12
export G_SpawnInt
proc G_SpawnInt 16 12
line 34
;32:}
;33:
;34:qboolean G_SpawnInt(const char* key, const char* defaultString, int* out) {
line 38
;35:	char*    s;
;36:	qboolean present;
;37:
;38:	present = G_SpawnString(key, defaultString, &s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 39
;39:	*out    = atoi(s);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRFP4 8
INDIRP4
ADDRLP4 12
INDIRI4
ASGNI4
line 40
;40:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $69
endproc G_SpawnInt 16 12
export G_SpawnVector
proc G_SpawnVector 16 20
line 43
;41:}
;42:
;43:qboolean G_SpawnVector(const char* key, const char* defaultString, float* out) {
line 47
;44:	char*    s;
;45:	qboolean present;
;46:
;47:	present = G_SpawnString(key, defaultString, &s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 8
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
line 48
;48:	Q_sscanf(s, "%f %f %f", &out[0], &out[1], &out[2]);
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $71
ARGP4
ADDRLP4 12
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 12
INDIRP4
CNSTI4 8
ADDP4
ARGP4
ADDRGP4 Q_sscanf
CALLI4
pop
line 49
;49:	return present;
ADDRLP4 4
INDIRI4
RETI4
LABELV $70
endproc G_SpawnVector 16 20
data
export fields
align 4
LABELV fields
address $74
byte 4 524
byte 4 2
address $75
byte 4 92
byte 4 4
address $76
byte 4 540
byte 4 2
address $77
byte 4 544
byte 4 2
address $78
byte 4 528
byte 4 0
address $79
byte 4 672
byte 4 1
address $80
byte 4 648
byte 4 2
address $81
byte 4 652
byte 4 2
address $82
byte 4 636
byte 4 2
address $83
byte 4 656
byte 4 2
address $84
byte 4 796
byte 4 1
address $85
byte 4 800
byte 4 1
address $86
byte 4 760
byte 4 0
address $87
byte 4 732
byte 4 0
address $88
byte 4 0
byte 4 9
address $89
byte 4 740
byte 4 0
address $90
byte 4 116
byte 4 4
address $91
byte 4 116
byte 4 5
address $92
byte 4 660
byte 4 2
address $93
byte 4 664
byte 4 2
byte 4 0
skip 8
export SP_item_botroam
code
proc SP_item_botroam 0 0
line 173
;50:}
;51:
;52://
;53:// fields are needed for spawning from the entity string
;54://
;55:typedef enum {
;56:	F_INT,
;57:	F_FLOAT,
;58:	F_LSTRING,  // string on disk, pointer in memory, TAG_LEVEL
;59:	F_GSTRING,  // string on disk, pointer in memory, TAG_GAME
;60:	F_VECTOR,
;61:	F_ANGLEHACK,
;62:	F_ENTITY,  // index on disk, pointer in memory
;63:	F_ITEM,    // index on disk, pointer in memory
;64:	F_CLIENT,  // index on disk, pointer in memory
;65:	F_IGNORE
;66:} fieldtype_t;
;67:
;68:typedef struct {
;69:	const char* name;
;70:	int         ofs;
;71:	fieldtype_t type;
;72:	// int		flags;
;73:} field_t;
;74:
;75:const field_t fields[] = {
;76:	{"classname",  FOFS(classname), F_LSTRING},
;77:	{"origin",   FOFS(s.origin), F_VECTOR},
;78:	{"model",     FOFS(model), F_LSTRING},
;79:	{"model2",    FOFS(model2), F_LSTRING},
;80:	{"spawnflags",      FOFS(spawnflags), F_INT},
;81:	{"speed",   FOFS(speed), F_FLOAT},
;82:	{"target",     FOFS(target), F_LSTRING},
;83:	{"targetname",   FOFS(targetname), F_LSTRING},
;84:	{"message", FOFS(message), F_LSTRING},
;85:	{"team",       FOFS(team), F_LSTRING},
;86:	{"wait",      FOFS(wait), F_FLOAT},
;87:	{"random",     FOFS(random), F_FLOAT},
;88:	{"count",     FOFS(count), F_INT},
;89:	{"health",   FOFS(health), F_INT},
;90:	{"light", 0, F_IGNORE},
;91:	{"dmg",   FOFS(damage), F_INT},
;92:	{"angles",    FOFS(s.angles), F_VECTOR},
;93:	{"angle",   FOFS(s.angles), F_ANGLEHACK},
;94:	{"targetShaderName",       FOFS(targetShaderName), F_LSTRING},
;95:	{"targetShaderNewName",   FOFS(targetShaderNewName), F_LSTRING},
;96:
;97:	{NULL      }
;98:};
;99:
;100:typedef struct {
;101:	char* name;
;102:	void (*spawn)(gentity_t* ent);
;103:} spawn_t;
;104:
;105:void SP_info_player_start(gentity_t* ent);
;106:void SP_info_player_deathmatch(gentity_t* ent);
;107:void SP_info_player_intermission(gentity_t* ent);
;108:void SP_info_firstplace(gentity_t* ent);
;109:void SP_info_secondplace(gentity_t* ent);
;110:void SP_info_thirdplace(gentity_t* ent);
;111:void SP_info_podium(gentity_t* ent);
;112:
;113:void SP_func_plat(gentity_t* ent);
;114:void SP_func_static(gentity_t* ent);
;115:void SP_func_rotating(gentity_t* ent);
;116:void SP_func_bobbing(gentity_t* ent);
;117:void SP_func_pendulum(gentity_t* ent);
;118:void SP_func_button(gentity_t* ent);
;119:void SP_func_door(gentity_t* ent);
;120:void SP_func_train(gentity_t* ent);
;121:void SP_func_timer(gentity_t* self);
;122:
;123:void SP_trigger_always(gentity_t* ent);
;124:void SP_trigger_multiple(gentity_t* ent);
;125:void SP_trigger_push(gentity_t* ent);
;126:void SP_trigger_teleport(gentity_t* ent);
;127:void SP_trigger_hurt(gentity_t* ent);
;128:
;129:void SP_target_remove_powerups(gentity_t* ent);
;130:void SP_target_give(gentity_t* ent);
;131:void SP_target_delay(gentity_t* ent);
;132:void SP_target_speaker(gentity_t* ent);
;133:void SP_target_print(gentity_t* ent);
;134:void SP_target_laser(gentity_t* self);
;135:void SP_target_character(gentity_t* ent);
;136:void SP_target_score(gentity_t* ent);
;137:void SP_target_teleporter(gentity_t* ent);
;138:void SP_target_relay(gentity_t* ent);
;139:void SP_target_kill(gentity_t* ent);
;140:void SP_target_position(gentity_t* ent);
;141:void SP_target_location(gentity_t* ent);
;142:void SP_target_push(gentity_t* ent);
;143:
;144:void SP_target_startTimer(gentity_t* ent);
;145:void SP_target_stopTimer(gentity_t* ent);
;146:
;147:void SP_light(gentity_t* self);
;148:void SP_info_null(gentity_t* self);
;149:void SP_info_notnull(gentity_t* self);
;150:void SP_info_camp(gentity_t* self);
;151:void SP_path_corner(gentity_t* self);
;152:
;153:void SP_misc_teleporter_dest(gentity_t* self);
;154:void SP_misc_model(gentity_t* ent);
;155:void SP_misc_portal_camera(gentity_t* ent);
;156:void SP_misc_portal_surface(gentity_t* ent);
;157:
;158:void SP_shooter_rocket(gentity_t* ent);
;159:void SP_shooter_plasma(gentity_t* ent);
;160:void SP_shooter_grenade(gentity_t* ent);
;161:
;162:void SP_team_CTF_redplayer(gentity_t* ent);
;163:void SP_team_CTF_blueplayer(gentity_t* ent);
;164:
;165:void SP_team_CTF_redspawn(gentity_t* ent);
;166:void SP_team_CTF_bluespawn(gentity_t* ent);
;167:
;168:#ifdef MISSIONPACK
;169:void SP_team_blueobelisk(gentity_t* ent);
;170:void SP_team_redobelisk(gentity_t* ent);
;171:void SP_team_neutralobelisk(gentity_t* ent);
;172:#endif
;173:void    SP_item_botroam(gentity_t* ent){};
LABELV $95
endproc SP_item_botroam 0 0
data
export spawns
align 4
LABELV spawns
address $96
address SP_info_player_start
address $97
address SP_info_player_deathmatch
address $98
address SP_info_player_intermission
address $99
address SP_info_null
address $100
address SP_info_notnull
address $101
address SP_info_camp
address $102
address SP_func_plat
address $103
address SP_func_button
address $104
address SP_func_door
address $105
address SP_func_static
address $106
address SP_func_rotating
address $107
address SP_func_bobbing
address $108
address SP_func_pendulum
address $109
address SP_func_train
address $110
address SP_info_null
address $111
address SP_func_timer
address $112
address SP_trigger_always
address $113
address SP_trigger_multiple
address $114
address SP_trigger_push
address $115
address SP_trigger_teleport
address $116
address SP_trigger_hurt
address $117
address SP_target_give
address $118
address SP_target_remove_powerups
address $119
address SP_target_delay
address $120
address SP_target_speaker
address $121
address SP_target_print
address $122
address SP_target_laser
address $123
address SP_target_score
address $124
address SP_target_teleporter
address $125
address SP_target_relay
address $126
address SP_target_kill
address $127
address SP_target_position
address $128
address SP_target_location
address $129
address SP_target_push
address $130
address SP_target_startTimer
address $131
address SP_target_stopTimer
address $88
address SP_light
address $132
address SP_path_corner
address $133
address SP_misc_teleporter_dest
address $134
address SP_misc_model
address $135
address SP_misc_portal_surface
address $136
address SP_misc_portal_camera
address $137
address SP_shooter_rocket
address $138
address SP_shooter_grenade
address $139
address SP_shooter_plasma
address $140
address SP_team_CTF_redplayer
address $141
address SP_team_CTF_blueplayer
address $142
address SP_team_CTF_redspawn
address $143
address SP_team_CTF_bluespawn
address $144
address SP_item_botroam
byte 4 0
byte 4 0
export G_CallSpawn
code
proc G_CallSpawn 12 8
line 263
;174:
;175:spawn_t spawns[] = {
;176:  // info entities don't do anything at all, but provide positional
;177:  // information for things controlled by other processes
;178:	{"info_player_start",        SP_info_player_start       },
;179:	{"info_player_deathmatch",   SP_info_player_deathmatch  },
;180:	{"info_player_intermission", SP_info_player_intermission},
;181:	{"info_null",                SP_info_null               },
;182:	{"info_notnull",             SP_info_notnull            }, // use target_position instead
;183:	{"info_camp",                SP_info_camp               },
;184:
;185:	{"func_plat",                SP_func_plat               },
;186:	{"func_button",              SP_func_button             },
;187:	{"func_door",                SP_func_door               },
;188:	{"func_static",              SP_func_static             },
;189:	{"func_rotating",            SP_func_rotating           },
;190:	{"func_bobbing",             SP_func_bobbing            },
;191:	{"func_pendulum",            SP_func_pendulum           },
;192:	{"func_train",               SP_func_train              },
;193:	{"func_group",               SP_info_null               },
;194:	{"func_timer",               SP_func_timer              }, // rename trigger_timer?
;195:
;196:  // Triggers are brush objects that cause an effect when contacted
;197:  // by a living player, usually involving firing targets.
;198:  // While almost everything could be done with
;199:  // a single trigger class and different targets, triggered effects
;200:  // could not be client side predicted (push and teleport).
;201:	{"trigger_always",           SP_trigger_always          },
;202:	{"trigger_multiple",         SP_trigger_multiple        },
;203:	{"trigger_push",             SP_trigger_push            },
;204:	{"trigger_teleport",         SP_trigger_teleport        },
;205:	{"trigger_hurt",             SP_trigger_hurt            },
;206:
;207: // targets perform no action by themselves, but must be triggered
;208:  // by another entity
;209:	{"target_give",              SP_target_give             },
;210:	{"target_remove_powerups",   SP_target_remove_powerups  },
;211:	{"target_delay",             SP_target_delay            },
;212:	{"target_speaker",           SP_target_speaker          },
;213:	{"target_print",             SP_target_print            },
;214:	{"target_laser",             SP_target_laser            },
;215:	{"target_score",             SP_target_score            },
;216:	{"target_teleporter",        SP_target_teleporter       },
;217:	{"target_relay",             SP_target_relay            },
;218:	{"target_kill",              SP_target_kill             },
;219:	{"target_position",          SP_target_position         },
;220:	{"target_location",          SP_target_location         },
;221:	{"target_push",              SP_target_push             },
;222:
;223: // Start/Stop timer entities
;224:	{"target_startTimer",        SP_target_startTimer       },
;225:	{"target_stopTimer",         SP_target_stopTimer        },
;226:
;227:	{"light",					SP_light                   },
;228:	{"path_corner",              SP_path_corner             },
;229:
;230:	{"misc_teleporter_dest",     SP_misc_teleporter_dest    },
;231:	{"misc_model",               SP_misc_model              },
;232:	{"misc_portal_surface",      SP_misc_portal_surface     },
;233:	{"misc_portal_camera",       SP_misc_portal_camera      },
;234:
;235:	{"shooter_rocket",           SP_shooter_rocket          },
;236:	{"shooter_grenade",          SP_shooter_grenade         },
;237:	{"shooter_plasma",           SP_shooter_plasma          },
;238:
;239:	{"team_CTF_redplayer",       SP_team_CTF_redplayer      },
;240:	{"team_CTF_blueplayer",      SP_team_CTF_blueplayer     },
;241:
;242:	{"team_CTF_redspawn",        SP_team_CTF_redspawn       },
;243:	{"team_CTF_bluespawn",       SP_team_CTF_bluespawn      },
;244:
;245:#ifdef MISSIONPACK
;246:	{"team_redobelisk",          SP_team_redobelisk         },
;247:	{"team_blueobelisk",         SP_team_blueobelisk        },
;248:	{"team_neutralobelisk",      SP_team_neutralobelisk     },
;249:#endif
;250:	{"item_botroam",             SP_item_botroam            },
;251:
;252:	{0,						  0						  }
;253:};
;254:
;255:/*
;256:===============
;257:G_CallSpawn
;258:
;259:Finds the spawn function for the entity and calls it,
;260:returning qfalse if not found
;261:===============
;262:*/
;263:qboolean G_CallSpawn(gentity_t* ent) {
line 267
;264:	spawn_t* s;
;265:	gitem_t* item;
;266:
;267:	if (!ent->classname) {
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $146
line 268
;268:		G_Printf("G_CallSpawn: NULL classname\n");
ADDRGP4 $148
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 269
;269:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $145
JUMPV
LABELV $146
line 273
;270:	}
;271:
;272:	// check item spawn functions
;273:	for (item = bg_itemlist + 1; item->classname; item++) {
ADDRLP4 4
ADDRGP4 bg_itemlist+52
ASGNP4
ADDRGP4 $152
JUMPV
LABELV $149
line 274
;274:		if (!strcmp(item->classname, ent->classname)) {
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $154
line 275
;275:			G_SpawnItem(ent, item);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_SpawnItem
CALLV
pop
line 276
;276:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $154
line 278
;277:		}
;278:	}
LABELV $150
line 273
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 52
ADDP4
ASGNP4
LABELV $152
ADDRLP4 4
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $149
line 281
;279:
;280:	// check normal spawn functions
;281:	for (s = spawns; s->name; s++) {
ADDRLP4 0
ADDRGP4 spawns
ASGNP4
ADDRGP4 $159
JUMPV
LABELV $156
line 282
;282:		if (!strcmp(s->name, ent->classname)) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $160
line 284
;283:			// found it
;284:			s->spawn(ent);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CALLV
pop
line 285
;285:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $145
JUMPV
LABELV $160
line 287
;286:		}
;287:	}
LABELV $157
line 281
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
ASGNP4
LABELV $159
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $156
line 288
;288:	G_Printf("%s doesn't have a spawn function\n", ent->classname);
ADDRGP4 $162
ARGP4
ADDRFP4 0
INDIRP4
CNSTI4 524
ADDP4
INDIRP4
ARGP4
ADDRGP4 G_Printf
CALLV
pop
line 289
;289:	return qfalse;
CNSTI4 0
RETI4
LABELV $145
endproc G_CallSpawn 12 8
export G_NewString
proc G_NewString 32 4
line 300
;290:}
;291:
;292:/*
;293:=============
;294:G_NewString
;295:
;296:Builds a copy of the string, translating \n to real linefeeds
;297:so message texts can be multi-line
;298:=============
;299:*/
;300:char* G_NewString(const char* string) {
line 304
;301:	char *newb, *new_p;
;302:	int   i, l;
;303:
;304:	l = (int)strlen(string) + 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 306
;305:
;306:	newb = G_Alloc(l);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 G_Alloc
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 20
INDIRP4
ASGNP4
line 308
;307:
;308:	new_p = newb;
ADDRLP4 8
ADDRLP4 12
INDIRP4
ASGNP4
line 311
;309:
;310:	// turn \n into a real linefeed
;311:	for (i = 0; i < l; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $167
JUMPV
LABELV $164
line 312
;312:		if (string[i] == '\\' && i < l - 1) {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $168
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $168
line 313
;313:			i++;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 314
;314:			if (string[i] == 'n') {
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 110
NEI4 $170
line 315
;315:				*new_p++ = '\n';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 10
ASGNI1
line 316
;316:			} else {
ADDRGP4 $169
JUMPV
LABELV $170
line 317
;317:				*new_p++ = '\\';
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI1 92
ASGNI1
line 318
;318:			}
line 319
;319:		} else {
ADDRGP4 $169
JUMPV
LABELV $168
line 320
;320:			*new_p++ = string[i];
ADDRLP4 28
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 28
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 321
;321:		}
LABELV $169
line 322
;322:	}
LABELV $165
line 311
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $167
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
LTI4 $164
line 324
;323:
;324:	return newb;
ADDRLP4 12
INDIRP4
RETP4
LABELV $163
endproc G_NewString 32 4
export G_ParseField
proc G_ParseField 52 20
line 335
;325:}
;326:
;327:/*
;328:===============
;329:G_ParseField
;330:
;331:Takes a key/value pair and sets the binary values
;332:in a gentity
;333:===============
;334:*/
;335:void G_ParseField(const char* key, const char* value, gentity_t* ent) {
line 341
;336:	const field_t* f;
;337:	byte*          b;
;338:	float          v;
;339:	vec3_t         vec;
;340:
;341:	for (f = fields; f->name; f++) {
ADDRLP4 0
ADDRGP4 fields
ASGNP4
ADDRGP4 $176
JUMPV
LABELV $173
line 342
;342:		if (!Q_stricmp(f->name, key)) {
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $177
line 344
;343:			// found it
;344:			b = (byte*)ent;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 346
;345:
;346:			switch (f->type) {
ADDRLP4 28
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
LTI4 $172
ADDRLP4 28
INDIRI4
CNSTI4 9
GTI4 $172
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $192
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $192
address $188
address $189
address $182
address $172
address $183
address $190
address $172
address $172
address $172
address $172
code
LABELV $182
line 348
;347:			case F_LSTRING:
;348:				*(char**)(b + f->ofs) = G_NewString(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_NewString
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 36
INDIRP4
ASGNP4
line 349
;349:				break;
ADDRGP4 $172
JUMPV
LABELV $183
line 351
;350:			case F_VECTOR:
;351:				Q_sscanf(value, "%f %f %f", &vec[0], &vec[1], &vec[2]);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 $71
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 8+4
ARGP4
ADDRLP4 8+8
ARGP4
ADDRGP4 Q_sscanf
CALLI4
pop
line 352
;352:				((float*)(b + f->ofs))[0] = vec[0];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 8
INDIRF4
ASGNF4
line 353
;353:				((float*)(b + f->ofs))[1] = vec[1];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 8+4
INDIRF4
ASGNF4
line 354
;354:				((float*)(b + f->ofs))[2] = vec[2];
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
ADDRLP4 8+8
INDIRF4
ASGNF4
line 355
;355:				break;
ADDRGP4 $172
JUMPV
LABELV $188
line 357
;356:			case F_INT:
;357:				*(int*)(b + f->ofs) = atoi(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 40
INDIRI4
ASGNI4
line 358
;358:				break;
ADDRGP4 $172
JUMPV
LABELV $189
line 360
;359:			case F_FLOAT:
;360:				*(float*)(b + f->ofs) = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 44
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
ADDRLP4 44
INDIRF4
ASGNF4
line 361
;361:				break;
ADDRGP4 $172
JUMPV
LABELV $190
line 363
;362:			case F_ANGLEHACK:
;363:				v                         = atof(value);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 48
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 48
INDIRF4
ASGNF4
line 364
;364:				((float*)(b + f->ofs))[0] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
line 365
;365:				((float*)(b + f->ofs))[1] = v;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 4
ADDP4
ADDRLP4 20
INDIRF4
ASGNF4
line 366
;366:				((float*)(b + f->ofs))[2] = 0;
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 4
INDIRP4
ADDP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 367
;367:				break;
line 370
;368:			default:
;369:			case F_IGNORE:
;370:				break;
line 372
;371:			}
;372:			return;
ADDRGP4 $172
JUMPV
LABELV $177
line 374
;373:		}
;374:	}
LABELV $174
line 341
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
LABELV $176
ADDRLP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $173
line 375
;375:}
LABELV $172
endproc G_ParseField 52 20
data
align 4
LABELV $194
address $195
address $196
address $197
address $83
address $198
address $199
address $200
address $201
address $202
export G_SpawnGEntityFromSpawnVars
code
proc G_SpawnGEntityFromSpawnVars 40 12
line 385
;376:
;377:/*
;378:===================
;379:G_SpawnGEntityFromSpawnVars
;380:
;381:Spawn an entity and fill in all of the level fields from
;382:level.spawnVars[], then call the class specfic spawn function
;383:===================
;384:*/
;385:void G_SpawnGEntityFromSpawnVars(void) {
line 392
;386:	int          i;
;387:	gentity_t*   ent;
;388:	char *       s, *value, *gametypeName;
;389:	static char* gametypeNames[] = {"ffa", "tournament", "single", "team", "ctf", "oneflag", "obelisk", "harvester", "teamtournament"};
;390:
;391:	// get the next free entity
;392:	ent = G_Spawn();
ADDRLP4 20
ADDRGP4 G_Spawn
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 20
INDIRP4
ASGNP4
line 394
;393:
;394:	for (i = 0; i < level.numSpawnVars; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $206
JUMPV
LABELV $203
line 395
;395:		G_ParseField(level.spawnVars[i][0], level.spawnVars[i][1], ent);
ADDRLP4 24
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+2988
ADDP4
INDIRP4
ARGP4
ADDRLP4 24
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+2988+4
ADDP4
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_ParseField
CALLV
pop
line 396
;396:	}
LABELV $204
line 394
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $206
ADDRLP4 0
INDIRI4
ADDRGP4 level+2984
INDIRI4
LTI4 $203
line 399
;397:
;398:	// check for "notsingle" flag
;399:	if (g_gametype.integer == GT_SINGLE_PLAYER) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $211
line 400
;400:		G_SpawnInt("notsingle", "0", &i);
ADDRGP4 $214
ARGP4
ADDRGP4 $215
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 401
;401:		if (i) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $216
line 402
;402:			G_FreeEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 403
;403:			return;
ADDRGP4 $193
JUMPV
LABELV $216
line 405
;404:		}
;405:	}
LABELV $211
line 407
;406:	// check for "notteam" flag (GT_RUN, GT_TOURNAMENT, GT_SINGLE_PLAYER)
;407:	if (g_gametype.integer >= GT_TEAM) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 3
LTI4 $218
line 408
;408:		G_SpawnInt("notteam", "0", &i);
ADDRGP4 $221
ARGP4
ADDRGP4 $215
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 409
;409:		if (i) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $219
line 410
;410:			G_FreeEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 411
;411:			return;
ADDRGP4 $193
JUMPV
line 413
;412:		}
;413:	} else {
LABELV $218
line 414
;414:		G_SpawnInt("notfree", "0", &i);
ADDRGP4 $224
ARGP4
ADDRGP4 $215
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 415
;415:		if (i) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $225
line 416
;416:			G_FreeEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 417
;417:			return;
ADDRGP4 $193
JUMPV
LABELV $225
line 419
;418:		}
;419:	}
LABELV $219
line 428
;420:
;421:#ifdef MISSIONPACK
;422:	G_SpawnInt("notta", "0", &i);
;423:	if (i) {
;424:		G_FreeEntity(ent);
;425:		return;
;426:	}
;427:#else
;428:	G_SpawnInt("notq3a", "0", &i);
ADDRGP4 $227
ARGP4
ADDRGP4 $215
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnInt
CALLI4
pop
line 429
;429:	if (i) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $228
line 430
;430:		G_FreeEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 431
;431:		return;
ADDRGP4 $193
JUMPV
LABELV $228
line 435
;432:	}
;433:#endif
;434:
;435:	if (G_SpawnString("gametype", NULL, &value)) {
ADDRGP4 $232
ARGP4
CNSTP4 0
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 24
ADDRGP4 G_SpawnString
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $230
line 436
;436:		if (g_gametype.integer >= GT_RUN && g_gametype.integer < GT_MAX_GAME_TYPE) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 0
LTI4 $233
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 5
GEI4 $233
line 437
;437:			gametypeName = gametypeNames[g_gametype.integer];
ADDRLP4 16
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $194
ADDP4
INDIRP4
ASGNP4
line 439
;438:
;439:			s = strstr(value, gametypeName);
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 28
INDIRP4
ASGNP4
line 440
;440:			if (!s) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $238
line 441
;441:				G_FreeEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 442
;442:				return;
ADDRGP4 $193
JUMPV
LABELV $238
line 444
;443:			}
;444:		}
LABELV $233
line 445
;445:	}
LABELV $230
line 448
;446:
;447:	// move editor origin to pos
;448:	VectorCopy(ent->s.origin, ent->s.pos.trBase);
ADDRLP4 4
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 449
;449:	VectorCopy(ent->s.origin, ent->r.currentOrigin);
ADDRLP4 4
INDIRP4
CNSTI4 488
ADDP4
ADDRLP4 4
INDIRP4
CNSTI4 92
ADDP4
INDIRB
ASGNB 12
line 452
;450:
;451:	// if we didn't get a classname, don't bother spawning anything
;452:	if (!G_CallSpawn(ent)) {
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 G_CallSpawn
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $240
line 453
;453:		G_FreeEntity(ent);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 G_FreeEntity
CALLV
pop
line 454
;454:	}
LABELV $240
line 455
;455:}
LABELV $193
endproc G_SpawnGEntityFromSpawnVars 40 12
export G_AddSpawnVarToken
proc G_AddSpawnVarToken 16 12
line 462
;456:
;457:/*
;458:====================
;459:G_AddSpawnVarToken
;460:====================
;461:*/
;462:char* G_AddSpawnVarToken(const char* string) {
line 466
;463:	int   l;
;464:	char* dest;
;465:
;466:	l = (int)strlen(string);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 467
;467:	if (level.numSpawnVarChars + l + 1 > MAX_SPAWN_VARS_CHARS) {
ADDRGP4 level+3500
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
CNSTI4 1
ADDI4
CNSTI4 4096
LEI4 $243
line 468
;468:		G_Error("G_AddSpawnVarToken: MAX_SPAWN_VARS_CHARS");
ADDRGP4 $246
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 469
;469:	}
LABELV $243
line 471
;470:
;471:	dest = level.spawnVarChars + level.numSpawnVarChars;
ADDRLP4 4
ADDRGP4 level+3500
INDIRI4
ADDRGP4 level+3504
ADDP4
ASGNP4
line 472
;472:	memcpy(dest, string, l + 1);
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 474
;473:
;474:	level.numSpawnVarChars += l + 1;
ADDRLP4 12
ADDRGP4 level+3500
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDI4
ASGNI4
line 476
;475:
;476:	return dest;
ADDRLP4 4
INDIRP4
RETP4
LABELV $242
endproc G_AddSpawnVarToken 16 12
export G_ParseSpawnVars
proc G_ParseSpawnVars 2072 8
line 489
;477:}
;478:
;479:/*
;480:====================
;481:G_ParseSpawnVars
;482:
;483:Parses a brace bounded set of key / value pairs out of the
;484:level's entity strings into level.spawnVars[]
;485:
;486:This does not actually spawn an entity.
;487:====================
;488:*/
;489:qboolean G_ParseSpawnVars(void) {
line 493
;490:	char keyname[MAX_TOKEN_CHARS];
;491:	char com_token[MAX_TOKEN_CHARS];
;492:
;493:	level.numSpawnVars     = 0;
ADDRGP4 level+2984
CNSTI4 0
ASGNI4
line 494
;494:	level.numSpawnVarChars = 0;
ADDRGP4 level+3500
CNSTI4 0
ASGNI4
line 497
;495:
;496:	// parse the opening brace
;497:	if (!trap_GetEntityToken(com_token, sizeof(com_token))) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2048
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2048
INDIRI4
CNSTI4 0
NEI4 $253
line 499
;498:		// end of spawn string
;499:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $250
JUMPV
LABELV $253
line 501
;500:	}
;501:	if (com_token[0] != '{') {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 123
EQI4 $259
line 502
;502:		G_Error("G_ParseSpawnVars: found %s when expecting {", com_token);
ADDRGP4 $257
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 503
;503:	}
ADDRGP4 $259
JUMPV
LABELV $258
line 506
;504:
;505:	// go through all the key / value pairs
;506:	while (1) {
line 508
;507:		// parse key
;508:		if (!trap_GetEntityToken(keyname, sizeof(keyname))) {
ADDRLP4 1024
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2052
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2052
INDIRI4
CNSTI4 0
NEI4 $261
line 509
;509:			G_Error("G_ParseSpawnVars: EOF without closing brace");
ADDRGP4 $263
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 510
;510:		}
LABELV $261
line 512
;511:
;512:		if (keyname[0] == '}') {
ADDRLP4 1024
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $264
line 513
;513:			break;
ADDRGP4 $260
JUMPV
LABELV $264
line 517
;514:		}
;515:
;516:		// parse value
;517:		if (!trap_GetEntityToken(com_token, sizeof(com_token))) {
ADDRLP4 0
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 2056
ADDRGP4 trap_GetEntityToken
CALLI4
ASGNI4
ADDRLP4 2056
INDIRI4
CNSTI4 0
NEI4 $266
line 518
;518:			G_Error("G_ParseSpawnVars: EOF without closing brace");
ADDRGP4 $263
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 519
;519:		}
LABELV $266
line 521
;520:
;521:		if (com_token[0] == '}') {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $268
line 522
;522:			G_Error("G_ParseSpawnVars: closing brace without data");
ADDRGP4 $270
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 523
;523:		}
LABELV $268
line 524
;524:		if (level.numSpawnVars == MAX_SPAWN_VARS) {
ADDRGP4 level+2984
INDIRI4
CNSTI4 64
NEI4 $271
line 525
;525:			G_Error("G_ParseSpawnVars: MAX_SPAWN_VARS");
ADDRGP4 $274
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 526
;526:		}
LABELV $271
line 527
;527:		level.spawnVars[level.numSpawnVars][0] = G_AddSpawnVarToken(keyname);
ADDRLP4 1024
ARGP4
ADDRLP4 2060
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+2984
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+2988
ADDP4
ADDRLP4 2060
INDIRP4
ASGNP4
line 528
;528:		level.spawnVars[level.numSpawnVars][1] = G_AddSpawnVarToken(com_token);
ADDRLP4 0
ARGP4
ADDRLP4 2064
ADDRGP4 G_AddSpawnVarToken
CALLP4
ASGNP4
ADDRGP4 level+2984
INDIRI4
CNSTI4 3
LSHI4
ADDRGP4 level+2988+4
ADDP4
ADDRLP4 2064
INDIRP4
ASGNP4
line 529
;529:		level.numSpawnVars++;
ADDRLP4 2068
ADDRGP4 level+2984
ASGNP4
ADDRLP4 2068
INDIRP4
ADDRLP4 2068
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 530
;530:	}
LABELV $259
line 506
ADDRGP4 $258
JUMPV
LABELV $260
line 532
;531:
;532:	return qtrue;
CNSTI4 1
RETI4
LABELV $250
endproc G_ParseSpawnVars 2072 8
export SP_worldspawn
proc SP_worldspawn 16 12
line 542
;533:}
;534:
;535:/*QUAKED worldspawn (0 0 0) ?
;536:
;537:Every map should have exactly one worldspawn.
;538:"music"		music wav file
;539:"gravity"	800 is default gravity
;540:"message"	Text to print during connection process
;541:*/
;542:void SP_worldspawn(void) {
line 545
;543:	char* s;
;544:
;545:	G_SpawnString("classname", "", &s);
ADDRGP4 $74
ARGP4
ADDRGP4 $282
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 546
;546:	if (Q_stricmp(s, "worldspawn")) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $285
ARGP4
ADDRLP4 4
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $283
line 547
;547:		G_Error("SP_worldspawn: The first entity isn't 'worldspawn'");
ADDRGP4 $286
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 548
;548:	}
LABELV $283
line 551
;549:
;550:	// make some data visible to connecting client
;551:	trap_SetConfigstring(CS_GAME_VERSION, GAME_VERSION);
CNSTI4 20
ARGI4
ADDRGP4 $287
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 553
;552:
;553:	trap_SetConfigstring(CS_LEVEL_START_TIME, va("%i", level.startTime));
ADDRGP4 $288
ARGP4
ADDRGP4 level+40
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 21
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 555
;554:
;555:	G_SpawnString("music", "", &s);
ADDRGP4 $290
ARGP4
ADDRGP4 $282
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 556
;556:	trap_SetConfigstring(CS_MUSIC, s);
CNSTI4 2
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 558
;557:
;558:	G_SpawnString("message", "", &s);
ADDRGP4 $82
ARGP4
ADDRGP4 $282
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 559
;559:	trap_SetConfigstring(CS_MESSAGE, s);  // map specific message
CNSTI4 3
ARGI4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 561
;560:
;561:	trap_SetConfigstring(CS_MOTD, g_motd.string);  // message of the day
CNSTI4 4
ARGI4
ADDRGP4 g_motd+16
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 563
;562:
;563:	G_SpawnString("gravity", "800", &s);
ADDRGP4 $292
ARGP4
ADDRGP4 $293
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 564
;564:	trap_Cvar_Set("g_gravity", s);
ADDRGP4 $294
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 566
;565:
;566:	G_SpawnString("enableDust", "0", &s);
ADDRGP4 $295
ARGP4
ADDRGP4 $215
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 567
;567:	trap_Cvar_Set("g_enableDust", s);
ADDRGP4 $296
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 569
;568:
;569:	G_SpawnString("enableBreath", "0", &s);
ADDRGP4 $297
ARGP4
ADDRGP4 $215
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 G_SpawnString
CALLI4
pop
line 570
;570:	trap_Cvar_Set("g_enableBreath", s);
ADDRGP4 $298
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 572
;571:
;572:	g_entities[ENTITYNUM_WORLD].s.number   = ENTITYNUM_WORLD;
ADDRGP4 g_entities+833952
CNSTI4 1022
ASGNI4
line 573
;573:	g_entities[ENTITYNUM_WORLD].r.ownerNum = ENTITYNUM_NONE;
ADDRGP4 g_entities+833952+208+304
CNSTI4 1023
ASGNI4
line 574
;574:	g_entities[ENTITYNUM_WORLD].classname  = "worldspawn";
ADDRGP4 g_entities+833952+524
ADDRGP4 $285
ASGNP4
line 576
;575:
;576:	g_entities[ENTITYNUM_NONE].s.number   = ENTITYNUM_NONE;
ADDRGP4 g_entities+834768
CNSTI4 1023
ASGNI4
line 577
;577:	g_entities[ENTITYNUM_NONE].r.ownerNum = ENTITYNUM_NONE;
ADDRGP4 g_entities+834768+208+304
CNSTI4 1023
ASGNI4
line 578
;578:	g_entities[ENTITYNUM_NONE].classname  = "nothing";
ADDRGP4 g_entities+834768+524
ADDRGP4 $311
ASGNP4
line 581
;579:
;580:	// see if we want a warmup time
;581:	if (/*g_restarted.integer ||*/ g_gametype.integer == GT_SINGLE_PLAYER) {
ADDRGP4 g_gametype+12
INDIRI4
CNSTI4 2
NEI4 $312
line 583
;582:		// trap_Cvar_Set( "g_restarted", "0" );
;583:		level.warmupTime = 0;
ADDRGP4 level+16
CNSTI4 0
ASGNI4
line 584
;584:		trap_SetConfigstring(CS_WARMUP, "");
CNSTI4 5
ARGI4
ADDRGP4 $282
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 585
;585:	} else {
ADDRGP4 $313
JUMPV
LABELV $312
line 587
;586:		// assume that g_doWarmup is always 1
;587:		level.warmupTime = -1;
ADDRGP4 level+16
CNSTI4 -1
ASGNI4
line 588
;588:		if (g_warmup.integer > 0) {
ADDRGP4 g_warmup+12
INDIRI4
CNSTI4 0
LEI4 $317
line 589
;589:			trap_SetConfigstring(CS_WARMUP, va("%i", level.warmupTime));
ADDRGP4 $288
ARGP4
ADDRGP4 level+16
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 5
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 590
;590:		} else {
ADDRGP4 $318
JUMPV
LABELV $317
line 591
;591:			trap_SetConfigstring(CS_WARMUP, "");
CNSTI4 5
ARGI4
ADDRGP4 $282
ARGP4
ADDRGP4 trap_SetConfigstring
CALLV
pop
line 592
;592:		}
LABELV $318
line 593
;593:		G_LogPrintf("Warmup:\n");
ADDRGP4 $321
ARGP4
ADDRGP4 G_LogPrintf
CALLV
pop
line 594
;594:	}
LABELV $313
line 595
;595:}
LABELV $281
endproc SP_worldspawn 16 12
export G_SpawnEntitiesFromString
proc G_SpawnEntitiesFromString 8 4
line 604
;596:
;597:/*
;598:==============
;599:G_SpawnEntitiesFromString
;600:
;601:Parses textual entity definitions out of an entstring and spawns gentities.
;602:==============
;603:*/
;604:void G_SpawnEntitiesFromString(void) {
line 606
;605:	// allow calls to G_Spawn*()
;606:	level.spawning     = qtrue;
ADDRGP4 level+2980
CNSTI4 1
ASGNI4
line 607
;607:	level.numSpawnVars = 0;
ADDRGP4 level+2984
CNSTI4 0
ASGNI4
line 612
;608:
;609:	// the worldspawn is not an actual entity, but it still
;610:	// has a "spawn" function to perform any global setup
;611:	// needed by a level (setting configstrings or cvars, etc)
;612:	if (!G_ParseSpawnVars()) {
ADDRLP4 0
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $325
line 613
;613:		G_Error("SpawnEntities: no entities");
ADDRGP4 $327
ARGP4
ADDRGP4 G_Error
CALLV
pop
line 614
;614:	}
LABELV $325
line 615
;615:	SP_worldspawn();
ADDRGP4 SP_worldspawn
CALLV
pop
ADDRGP4 $329
JUMPV
LABELV $328
line 618
;616:
;617:	// parse ents
;618:	while (G_ParseSpawnVars()) {
line 619
;619:		G_SpawnGEntityFromSpawnVars();
ADDRGP4 G_SpawnGEntityFromSpawnVars
CALLV
pop
line 620
;620:	}
LABELV $329
line 618
ADDRLP4 4
ADDRGP4 G_ParseSpawnVars
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $328
line 622
;621:
;622:	level.spawning = qfalse;  // any future calls to G_Spawn*() will be errors
ADDRGP4 level+2980
CNSTI4 0
ASGNI4
line 623
;623:}
LABELV $322
endproc G_SpawnEntitiesFromString 8 4
import SP_team_CTF_bluespawn
import SP_team_CTF_redspawn
import SP_team_CTF_blueplayer
import SP_team_CTF_redplayer
import SP_shooter_grenade
import SP_shooter_plasma
import SP_shooter_rocket
import SP_misc_portal_surface
import SP_misc_portal_camera
import SP_misc_model
import SP_misc_teleporter_dest
import SP_path_corner
import SP_info_camp
import SP_info_notnull
import SP_info_null
import SP_light
import SP_target_stopTimer
import SP_target_startTimer
import SP_target_push
import SP_target_location
import SP_target_position
import SP_target_kill
import SP_target_relay
import SP_target_teleporter
import SP_target_score
import SP_target_character
import SP_target_laser
import SP_target_print
import SP_target_speaker
import SP_target_delay
import SP_target_give
import SP_target_remove_powerups
import SP_trigger_hurt
import SP_trigger_teleport
import SP_trigger_push
import SP_trigger_multiple
import SP_trigger_always
import SP_func_timer
import SP_func_train
import SP_func_door
import SP_func_button
import SP_func_pendulum
import SP_func_bobbing
import SP_func_rotating
import SP_func_static
import SP_func_plat
import SP_info_podium
import SP_info_thirdplace
import SP_info_secondplace
import SP_info_firstplace
import SP_info_player_intermission
import SP_info_player_deathmatch
import SP_info_player_start
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
LABELV $327
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 105
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $321
byte 1 87
byte 1 97
byte 1 114
byte 1 109
byte 1 117
byte 1 112
byte 1 58
byte 1 10
byte 1 0
align 1
LABELV $311
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $298
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $297
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 66
byte 1 114
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $296
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $295
byte 1 101
byte 1 110
byte 1 97
byte 1 98
byte 1 108
byte 1 101
byte 1 68
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $294
byte 1 103
byte 1 95
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $293
byte 1 56
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $292
byte 1 103
byte 1 114
byte 1 97
byte 1 118
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $290
byte 1 109
byte 1 117
byte 1 115
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $288
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $287
byte 1 79
byte 1 112
byte 1 101
byte 1 110
byte 1 115
byte 1 111
byte 1 117
byte 1 114
byte 1 99
byte 1 101
byte 1 32
byte 1 68
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 48
byte 1 46
byte 1 51
byte 1 49
byte 1 97
byte 1 0
align 1
LABELV $286
byte 1 83
byte 1 80
byte 1 95
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 84
byte 1 104
byte 1 101
byte 1 32
byte 1 102
byte 1 105
byte 1 114
byte 1 115
byte 1 116
byte 1 32
byte 1 101
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 32
byte 1 105
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 39
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 39
byte 1 0
align 1
LABELV $285
byte 1 119
byte 1 111
byte 1 114
byte 1 108
byte 1 100
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $282
byte 1 0
align 1
LABELV $274
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 86
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $270
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 100
byte 1 97
byte 1 116
byte 1 97
byte 1 0
align 1
LABELV $263
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 69
byte 1 79
byte 1 70
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 111
byte 1 117
byte 1 116
byte 1 32
byte 1 99
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 98
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $257
byte 1 71
byte 1 95
byte 1 80
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 115
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 119
byte 1 104
byte 1 101
byte 1 110
byte 1 32
byte 1 101
byte 1 120
byte 1 112
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 123
byte 1 0
align 1
LABELV $246
byte 1 71
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 86
byte 1 97
byte 1 114
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 80
byte 1 65
byte 1 87
byte 1 78
byte 1 95
byte 1 86
byte 1 65
byte 1 82
byte 1 83
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 83
byte 1 0
align 1
LABELV $232
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $227
byte 1 110
byte 1 111
byte 1 116
byte 1 113
byte 1 51
byte 1 97
byte 1 0
align 1
LABELV $224
byte 1 110
byte 1 111
byte 1 116
byte 1 102
byte 1 114
byte 1 101
byte 1 101
byte 1 0
align 1
LABELV $221
byte 1 110
byte 1 111
byte 1 116
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $215
byte 1 48
byte 1 0
align 1
LABELV $214
byte 1 110
byte 1 111
byte 1 116
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $202
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $201
byte 1 104
byte 1 97
byte 1 114
byte 1 118
byte 1 101
byte 1 115
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $200
byte 1 111
byte 1 98
byte 1 101
byte 1 108
byte 1 105
byte 1 115
byte 1 107
byte 1 0
align 1
LABELV $199
byte 1 111
byte 1 110
byte 1 101
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $198
byte 1 99
byte 1 116
byte 1 102
byte 1 0
align 1
LABELV $197
byte 1 115
byte 1 105
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $196
byte 1 116
byte 1 111
byte 1 117
byte 1 114
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $195
byte 1 102
byte 1 102
byte 1 97
byte 1 0
align 1
LABELV $162
byte 1 37
byte 1 115
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 104
byte 1 97
byte 1 118
byte 1 101
byte 1 32
byte 1 97
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 32
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 10
byte 1 0
align 1
LABELV $148
byte 1 71
byte 1 95
byte 1 67
byte 1 97
byte 1 108
byte 1 108
byte 1 83
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 10
byte 1 0
align 1
LABELV $144
byte 1 105
byte 1 116
byte 1 101
byte 1 109
byte 1 95
byte 1 98
byte 1 111
byte 1 116
byte 1 114
byte 1 111
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $143
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
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $142
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
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $141
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $140
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
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $139
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $138
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $137
byte 1 115
byte 1 104
byte 1 111
byte 1 111
byte 1 116
byte 1 101
byte 1 114
byte 1 95
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $136
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 0
align 1
LABELV $135
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 97
byte 1 108
byte 1 95
byte 1 115
byte 1 117
byte 1 114
byte 1 102
byte 1 97
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $134
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $133
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 95
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
byte 1 95
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $132
byte 1 112
byte 1 97
byte 1 116
byte 1 104
byte 1 95
byte 1 99
byte 1 111
byte 1 114
byte 1 110
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $131
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 116
byte 1 111
byte 1 112
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $130
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $129
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $128
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 111
byte 1 99
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $127
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 111
byte 1 115
byte 1 105
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $126
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $125
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $124
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
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
byte 1 0
align 1
LABELV $123
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $122
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 108
byte 1 97
byte 1 115
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $121
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $120
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 97
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $119
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 100
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $118
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 114
byte 1 101
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 95
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $117
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 95
byte 1 103
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $116
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 104
byte 1 117
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $115
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $114
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 112
byte 1 117
byte 1 115
byte 1 104
byte 1 0
align 1
LABELV $113
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
byte 1 0
align 1
LABELV $112
byte 1 116
byte 1 114
byte 1 105
byte 1 103
byte 1 103
byte 1 101
byte 1 114
byte 1 95
byte 1 97
byte 1 108
byte 1 119
byte 1 97
byte 1 121
byte 1 115
byte 1 0
align 1
LABELV $111
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
byte 1 0
align 1
LABELV $110
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 103
byte 1 114
byte 1 111
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $109
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $108
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 101
byte 1 110
byte 1 100
byte 1 117
byte 1 108
byte 1 117
byte 1 109
byte 1 0
align 1
LABELV $107
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 98
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $106
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 114
byte 1 111
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $105
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 0
align 1
LABELV $104
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 100
byte 1 111
byte 1 111
byte 1 114
byte 1 0
align 1
LABELV $103
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 98
byte 1 117
byte 1 116
byte 1 116
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $102
byte 1 102
byte 1 117
byte 1 110
byte 1 99
byte 1 95
byte 1 112
byte 1 108
byte 1 97
byte 1 116
byte 1 0
align 1
LABELV $101
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 112
byte 1 0
align 1
LABELV $100
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $99
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 110
byte 1 117
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $98
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
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $97
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
LABELV $96
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
byte 1 115
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 0
align 1
LABELV $93
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 101
byte 1 119
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $92
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 101
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $91
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $90
byte 1 97
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $89
byte 1 100
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $88
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $87
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $86
byte 1 99
byte 1 111
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $85
byte 1 114
byte 1 97
byte 1 110
byte 1 100
byte 1 111
byte 1 109
byte 1 0
align 1
LABELV $84
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $83
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 0
align 1
LABELV $82
byte 1 109
byte 1 101
byte 1 115
byte 1 115
byte 1 97
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $81
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $80
byte 1 116
byte 1 97
byte 1 114
byte 1 103
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $79
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $78
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 0
align 1
LABELV $77
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 50
byte 1 0
align 1
LABELV $76
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $75
byte 1 111
byte 1 114
byte 1 105
byte 1 103
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $74
byte 1 99
byte 1 108
byte 1 97
byte 1 115
byte 1 115
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $71
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 32
byte 1 37
byte 1 102
byte 1 0
