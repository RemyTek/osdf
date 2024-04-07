data
export forceModelModificationCount
align 4
LABELV forceModelModificationCount
byte 4 -1
export enemyModelModificationCount
align 4
LABELV enemyModelModificationCount
byte 4 -1
export enemyColorsModificationCount
align 4
LABELV enemyColorsModificationCount
byte 4 -1
export teamModelModificationCount
align 4
LABELV teamModelModificationCount
byte 4 -1
export teamColorsModificationCount
align 4
LABELV teamColorsModificationCount
byte 4 -1
export intShaderTime
align 4
LABELV intShaderTime
byte 4 0
export linearLight
align 4
LABELV linearLight
byte 4 0
export vmMain
code
proc vmMain 16 12
file "../../../../code/cgame/cg_main.c"
line 43
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_main.c -- initialization and primary entry point for cgame
;4:#include "cg_local.h"
;5:
;6:#ifdef MISSIONPACK
;7:#include "../ui/ui_shared.h"
;8:// display context for new ui stuff
;9:displayContextDef_t cgDC;
;10:#endif
;11:
;12:int  forceModelModificationCount  = -1;
;13:int  enemyModelModificationCount  = -1;
;14:int  enemyColorsModificationCount = -1;
;15:int  teamModelModificationCount   = -1;
;16:int  teamColorsModificationCount  = -1;
;17:
;18:void CG_Init(int serverMessageNum, int serverCommandSequence, int clientNum);
;19:void CG_Shutdown(void);
;20:
;21:// extension interface
;22:qboolean intShaderTime = qfalse;
;23:qboolean linearLight   = qfalse;
;24:
;25:#ifdef Q3_VM
;26:qboolean (*trap_GetValue)(char* value, int valueSize, const char* key);
;27:void (*trap_R_AddRefEntityToScene2)(const refEntity_t* re);
;28:void (*trap_R_AddLinearLightToScene)(const vec3_t start, const vec3_t end, float intensity, float r, float g, float b);
;29:#else
;30:int dll_com_trapGetValue;
;31:int dll_trap_R_AddRefEntityToScene2;
;32:int dll_trap_R_AddLinearLightToScene;
;33:#endif
;34:
;35:/*
;36:================
;37:vmMain
;38:
;39:This is the only way control passes into the module.
;40:This must be the very first function compiled into the .q3vm file
;41:================
;42:*/
;43:DLLEXPORT intptr_t vmMain(int command, int arg0, int arg1, int arg2) {
line 45
;44:
;45:	switch (command) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 8
GTI4 $73
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $85
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $85
address $75
address $76
address $77
address $78
address $79
address $80
address $81
address $82
address $83
code
LABELV $75
line 47
;46:	case CG_INIT:
;47:		CG_Init(arg0, arg1, arg2);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_Init
CALLV
pop
line 48
;48:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $76
line 50
;49:	case CG_SHUTDOWN:
;50:		CG_Shutdown();
ADDRGP4 CG_Shutdown
CALLV
pop
line 51
;51:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $77
line 53
;52:	case CG_CONSOLE_COMMAND:
;53:		return CG_ConsoleCommand();
ADDRLP4 4
ADDRGP4 CG_ConsoleCommand
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
RETI4
ADDRGP4 $72
JUMPV
LABELV $78
line 55
;54:	case CG_DRAW_ACTIVE_FRAME:
;55:		CG_DrawActiveFrame(arg0, arg1, arg2);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 CG_DrawActiveFrame
CALLV
pop
line 56
;56:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $79
line 58
;57:	case CG_CROSSHAIR_PLAYER:
;58:		return CG_CrosshairPlayer();
ADDRLP4 8
ADDRGP4 CG_CrosshairPlayer
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
RETI4
ADDRGP4 $72
JUMPV
LABELV $80
line 60
;59:	case CG_LAST_ATTACKER:
;60:		return CG_LastAttacker();
ADDRLP4 12
ADDRGP4 CG_LastAttacker
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $72
JUMPV
LABELV $81
line 62
;61:	case CG_KEY_EVENT:
;62:		CG_KeyEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_KeyEvent
CALLV
pop
line 63
;63:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $82
line 69
;64:	case CG_MOUSE_EVENT:
;65:#ifdef MISSIONPACK
;66:		cgDC.cursorx = cgs.cursorX;
;67:		cgDC.cursory = cgs.cursorY;
;68:#endif
;69:		CG_MouseEvent(arg0, arg1);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 CG_MouseEvent
CALLV
pop
line 70
;70:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $83
line 72
;71:	case CG_EVENT_HANDLING:
;72:		CG_EventHandling(arg0);
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 CG_EventHandling
CALLV
pop
line 73
;73:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $72
JUMPV
LABELV $73
line 75
;74:	default:
;75:		CG_Error("vmMain: unknown command %i", command);
ADDRGP4 $84
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 76
;76:		break;
LABELV $74
line 78
;77:	}
;78:	return -1;
CNSTI4 -1
RETI4
LABELV $72
endproc vmMain 16 12
data
align 4
LABELV cvarTable
address cg_ignore
address $87
address $88
byte 4 0
address cg_autoswitch
address $89
address $90
byte 4 1
address cg_drawGun
address $91
address $90
byte 4 1
address cg_zoomFov
address $92
address $93
byte 4 1
address cg_fov
address $94
address $95
byte 4 1
address cg_viewsize
address $96
address $97
byte 4 1
address cg_shadows
address $98
address $90
byte 4 1
address cg_gibs
address $99
address $88
byte 4 1
address cg_draw2D
address $100
address $90
byte 4 1
address cg_drawStatus
address $101
address $90
byte 4 1
address cg_drawTimer
address $102
address $88
byte 4 1
address cg_drawFPS
address $103
address $88
byte 4 1
address cg_drawSnapshot
address $104
address $88
byte 4 1
address cg_draw3dIcons
address $105
address $90
byte 4 1
address cg_drawIcons
address $106
address $90
byte 4 1
address cg_drawAmmoWarning
address $107
address $90
byte 4 1
address cg_drawAttacker
address $108
address $90
byte 4 1
address cg_drawSpeed
address $109
address $90
byte 4 1
address cg_drawCrosshair
address $110
address $111
byte 4 1
address cg_drawCrosshairNames
address $112
address $90
byte 4 1
address cg_drawRewards
address $113
address $90
byte 4 1
address cg_drawWeaponSelect
address $114
address $90
byte 4 1
address cg_crosshairSize
address $115
address $116
byte 4 1
address cg_crosshairHealth
address $117
address $90
byte 4 1
address cg_crosshairX
address $118
address $88
byte 4 1
address cg_crosshairY
address $119
address $88
byte 4 1
address cg_brassTime
address $120
address $121
byte 4 1
address cg_simpleItems
address $122
address $88
byte 4 1
address cg_addMarks
address $123
address $90
byte 4 1
address cg_lagometer
address $124
address $90
byte 4 1
address cg_railTrailTime
address $125
address $126
byte 4 1
address cg_railTrailRadius
address $127
address $88
byte 4 1
address cg_gun_x
address $128
address $88
byte 4 1
address cg_gun_y
address $129
address $88
byte 4 1
address cg_gun_z
address $130
address $88
byte 4 1
address cg_centertime
address $131
address $132
byte 4 512
address cg_runpitch
address $133
address $134
byte 4 1
address cg_runroll
address $135
address $136
byte 4 1
address cg_bobup
address $137
address $138
byte 4 1
address cg_bobpitch
address $139
address $138
byte 4 1
address cg_bobroll
address $140
address $138
byte 4 1
address cg_swingSpeed
address $141
address $142
byte 4 512
address cg_animSpeed
address $143
address $90
byte 4 512
address cg_debugAnim
address $144
address $88
byte 4 512
address cg_debugPosition
address $145
address $88
byte 4 512
address cg_debugEvents
address $146
address $88
byte 4 512
address cg_errorDecay
address $147
address $97
byte 4 0
address cg_nopredict
address $148
address $88
byte 4 0
address cg_noPlayerAnims
address $149
address $88
byte 4 512
address cg_showmiss
address $150
address $88
byte 4 0
address cg_footsteps
address $151
address $90
byte 4 512
address cg_tracerChance
address $152
address $153
byte 4 512
address cg_tracerWidth
address $154
address $90
byte 4 512
address cg_tracerLength
address $155
address $97
byte 4 512
address cg_thirdPersonRange
address $156
address $157
byte 4 512
address cg_thirdPersonAngle
address $158
address $88
byte 4 512
address cg_thirdPerson
address $159
address $88
byte 4 0
address cg_teamChatTime
address $160
address $161
byte 4 1
address cg_teamChatHeight
address $162
address $88
byte 4 1
address cg_forceModel
address $163
address $88
byte 4 1
address cg_predictItems
address $164
address $90
byte 4 1
address cg_deferPlayers
address $165
address $90
byte 4 1
address cg_drawTeamOverlay
address $166
address $88
byte 4 1
address cg_teamOverlayUserinfo
address $167
address $88
byte 4 66
address cg_stats
address $168
address $88
byte 4 0
address cg_drawFriend
address $169
address $90
byte 4 1
address cg_teamChatsOnly
address $170
address $88
byte 4 1
address cg_buildScript
address $171
address $88
byte 4 0
address cg_paused
address $172
address $88
byte 4 64
address cg_blood
address $173
address $90
byte 4 1
address cg_cameraOrbit
address $174
address $88
byte 4 512
address cg_cameraOrbitDelay
address $175
address $176
byte 4 1
address cg_timescaleFadeEnd
address $177
address $90
byte 4 0
address cg_timescaleFadeSpeed
address $178
address $88
byte 4 0
address cg_timescale
address $179
address $90
byte 4 0
address cg_scorePlum
address $180
address $90
byte 4 3
address cg_smoothClients
address $181
address $88
byte 4 3
address cg_cameraMode
address $182
address $88
byte 4 512
address cg_noTaunt
address $183
address $88
byte 4 1
address cg_noProjectileTrail
address $184
address $88
byte 4 1
address cg_smallFont
address $185
address $186
byte 4 1
address cg_bigFont
address $187
address $153
byte 4 1
address cg_oldRail
address $188
address $90
byte 4 1
address cg_oldRocket
address $189
address $90
byte 4 1
address cg_oldPlasma
address $190
address $90
byte 4 1
address cg_trueLightning
address $191
address $138
byte 4 1
address cg_hitSounds
address $192
address $88
byte 4 1
address cg_enemyModel
address $193
address $194
byte 4 1
address cg_enemyColors
address $195
address $194
byte 4 1
address cg_teamModel
address $196
address $194
byte 4 1
address cg_teamColors
address $197
address $194
byte 4 1
address cg_deadBodyDarken
address $198
address $90
byte 4 1
address cg_fovAdjust
address $199
address $88
byte 4 1
address cg_followKiller
address $200
address $88
byte 4 1
address cg_speed_x
address $201
address $202
byte 4 2
address cg_speed_y
address $203
address $204
byte 4 2
address cg_timerActive_x
address $205
address $202
byte 4 2
address cg_timerActive_y
address $206
address $138
byte 4 2
address cg_timerBest_x
address $207
address $208
byte 4 2
address cg_timerBest_y
address $209
address $138
byte 4 2
address cg_timerSkim_x
address $210
address $202
byte 4 2
address cg_timerSkim_y
address $211
address $212
byte 4 2
address phy_movetype
address $213
address $88
byte 4 8
export CG_RegisterCvars
code
proc CG_RegisterCvars 1036 16
line 360
;79:}
;80:
;81:cg_t         cg;
;82:cgs_t        cgs;
;83:centity_t    cg_entities[MAX_GENTITIES];
;84:weaponInfo_t cg_weapons[MAX_WEAPONS];
;85:itemInfo_t   cg_items[MAX_ITEMS];
;86:
;87:vmCvar_t     cg_railTrailTime;
;88:vmCvar_t     cg_railTrailRadius;
;89:vmCvar_t     cg_centertime;
;90:vmCvar_t     cg_runpitch;
;91:vmCvar_t     cg_runroll;
;92:vmCvar_t     cg_bobup;
;93:vmCvar_t     cg_bobpitch;
;94:vmCvar_t     cg_bobroll;
;95:vmCvar_t     cg_swingSpeed;
;96:vmCvar_t     cg_shadows;
;97:vmCvar_t     cg_gibs;
;98:vmCvar_t     cg_drawTimer;
;99:vmCvar_t     cg_drawFPS;
;100:vmCvar_t     cg_drawSnapshot;
;101:vmCvar_t     cg_draw3dIcons;
;102:vmCvar_t     cg_drawIcons;
;103:vmCvar_t     cg_drawAmmoWarning;
;104:vmCvar_t     cg_drawCrosshair;
;105:vmCvar_t     cg_drawCrosshairNames;
;106:vmCvar_t     cg_drawRewards;
;107:vmCvar_t     cg_drawWeaponSelect;
;108:vmCvar_t     cg_crosshairSize;
;109:vmCvar_t     cg_crosshairX;
;110:vmCvar_t     cg_crosshairY;
;111:vmCvar_t     cg_crosshairHealth;
;112:vmCvar_t     cg_draw2D;
;113:vmCvar_t     cg_drawStatus;
;114:vmCvar_t     cg_animSpeed;
;115:vmCvar_t     cg_debugAnim;
;116:vmCvar_t     cg_debugPosition;
;117:vmCvar_t     cg_debugEvents;
;118:vmCvar_t     cg_errorDecay;
;119:vmCvar_t     cg_nopredict;
;120:vmCvar_t     cg_noPlayerAnims;
;121:vmCvar_t     cg_showmiss;
;122:vmCvar_t     cg_footsteps;
;123:vmCvar_t     cg_addMarks;
;124:vmCvar_t     cg_brassTime;
;125:vmCvar_t     cg_viewsize;
;126:vmCvar_t     cg_drawGun;
;127:vmCvar_t     cg_gun_frame;
;128:vmCvar_t     cg_gun_x;
;129:vmCvar_t     cg_gun_y;
;130:vmCvar_t     cg_gun_z;
;131:vmCvar_t     cg_tracerChance;
;132:vmCvar_t     cg_tracerWidth;
;133:vmCvar_t     cg_tracerLength;
;134:vmCvar_t     cg_autoswitch;
;135:vmCvar_t     cg_ignore;
;136:vmCvar_t     cg_simpleItems;
;137:vmCvar_t     cg_fov;
;138:vmCvar_t     cg_zoomFov;
;139:vmCvar_t     cg_thirdPerson;
;140:vmCvar_t     cg_thirdPersonRange;
;141:vmCvar_t     cg_thirdPersonAngle;
;142:vmCvar_t     cg_lagometer;
;143:vmCvar_t     cg_drawAttacker;
;144:vmCvar_t     cg_drawSpeed;
;145:vmCvar_t     cg_teamChatTime;
;146:vmCvar_t     cg_teamChatHeight;
;147:vmCvar_t     cg_stats;
;148:vmCvar_t     cg_buildScript;
;149:vmCvar_t     cg_forceModel;
;150:vmCvar_t     cg_paused;
;151:vmCvar_t     cg_blood;
;152:vmCvar_t     cg_predictItems;
;153:vmCvar_t     cg_deferPlayers;
;154:vmCvar_t     cg_drawTeamOverlay;
;155:vmCvar_t     cg_teamOverlayUserinfo;
;156:vmCvar_t     cg_drawFriend;
;157:vmCvar_t     cg_teamChatsOnly;
;158:#ifdef MISSIONPACK
;159:vmCvar_t cg_noVoiceChats;
;160:vmCvar_t cg_noVoiceText;
;161:#endif
;162:vmCvar_t cg_hudFiles;
;163:vmCvar_t cg_scorePlum;
;164:vmCvar_t cg_smoothClients;
;165:vmCvar_t cg_cameraMode;
;166:vmCvar_t cg_cameraOrbit;
;167:vmCvar_t cg_cameraOrbitDelay;
;168:vmCvar_t cg_timescaleFadeEnd;
;169:vmCvar_t cg_timescaleFadeSpeed;
;170:vmCvar_t cg_timescale;
;171:vmCvar_t cg_smallFont;
;172:vmCvar_t cg_bigFont;
;173:vmCvar_t cg_noTaunt;
;174:vmCvar_t cg_noProjectileTrail;
;175:vmCvar_t cg_oldRail;
;176:vmCvar_t cg_oldRocket;
;177:vmCvar_t cg_oldPlasma;
;178:vmCvar_t cg_trueLightning;
;179:
;180:#ifdef MISSIONPACK
;181:vmCvar_t cg_redTeamName;
;182:vmCvar_t cg_blueTeamName;
;183:vmCvar_t cg_currentSelectedPlayer;
;184:vmCvar_t cg_currentSelectedPlayerName;
;185:vmCvar_t cg_singlePlayer;
;186:vmCvar_t cg_enableDust;
;187:vmCvar_t cg_enableBreath;
;188:vmCvar_t cg_singlePlayerActive;
;189:vmCvar_t cg_recordSPDemo;
;190:vmCvar_t cg_recordSPDemoName;
;191:vmCvar_t cg_obeliskRespawnDelay;
;192:#endif
;193:
;194:vmCvar_t cg_hitSounds;
;195:
;196:vmCvar_t cg_enemyModel;
;197:vmCvar_t cg_enemyColors;
;198:vmCvar_t cg_teamModel;
;199:vmCvar_t cg_teamColors;
;200:
;201:vmCvar_t cg_deadBodyDarken;
;202:vmCvar_t cg_fovAdjust;
;203:vmCvar_t cg_followKiller;
;204:
;205:vmCvar_t cg_speed_x;
;206:vmCvar_t cg_speed_y;
;207:vmCvar_t cg_timerActive_x;
;208:vmCvar_t cg_timerActive_y;
;209:vmCvar_t cg_timerBest_x;
;210:vmCvar_t cg_timerBest_y;
;211:vmCvar_t cg_timerSkim_x;
;212:vmCvar_t cg_timerSkim_y;
;213:vmCvar_t phy_movetype;
;214:
;215:typedef struct {
;216:	vmCvar_t*   vmCvar;
;217:	const char* cvarName;
;218:	const char* defaultString;
;219:	const int   cvarFlags;
;220:} cvarTable_t;
;221:
;222:// clang-format off
;223:static const cvarTable_t cvarTable[] = {
;224:	{&cg_ignore, "cg_ignore", "0", 0},  // used for debugging
;225:	{&cg_autoswitch, "cg_autoswitch", "1", CVAR_ARCHIVE},
;226:	{&cg_drawGun, "cg_drawGun", "1", CVAR_ARCHIVE},
;227:	{&cg_zoomFov, "cg_zoomfov", "22.5", CVAR_ARCHIVE},
;228:	{&cg_fov, "cg_fov", "105", CVAR_ARCHIVE},
;229:	{&cg_viewsize, "cg_viewsize", "100", CVAR_ARCHIVE},
;230:	{&cg_shadows, "cg_shadows", "1", CVAR_ARCHIVE},
;231:	{&cg_gibs, "cg_gibs", "0", CVAR_ARCHIVE},
;232:	{&cg_draw2D, "cg_draw2D", "1", CVAR_ARCHIVE},
;233:	{&cg_drawStatus, "cg_drawStatus", "1", CVAR_ARCHIVE},
;234:	{&cg_drawTimer, "cg_drawTimer", "0", CVAR_ARCHIVE},
;235:	{&cg_drawFPS, "cg_drawFPS", "0", CVAR_ARCHIVE},
;236:	{&cg_drawSnapshot, "cg_drawSnapshot", "0", CVAR_ARCHIVE},
;237:	{&cg_draw3dIcons, "cg_draw3dIcons", "1", CVAR_ARCHIVE},
;238:	{&cg_drawIcons, "cg_drawIcons", "1", CVAR_ARCHIVE},
;239:	{&cg_drawAmmoWarning, "cg_drawAmmoWarning", "1", CVAR_ARCHIVE},
;240:	{&cg_drawAttacker, "cg_drawAttacker", "1", CVAR_ARCHIVE},
;241:	{&cg_drawSpeed, "cg_drawSpeed", "1", CVAR_ARCHIVE},
;242:	{&cg_drawCrosshair, "cg_drawCrosshair", "4", CVAR_ARCHIVE},
;243:	{&cg_drawCrosshairNames, "cg_drawCrosshairNames", "1", CVAR_ARCHIVE},
;244:	{&cg_drawRewards, "cg_drawRewards", "1", CVAR_ARCHIVE},
;245:	{&cg_drawWeaponSelect, "cg_drawWeaponSelect", "1", CVAR_ARCHIVE},
;246:	{&cg_crosshairSize, "cg_crosshairSize", "24", CVAR_ARCHIVE},
;247:	{&cg_crosshairHealth, "cg_crosshairHealth", "1", CVAR_ARCHIVE},
;248:	{&cg_crosshairX, "cg_crosshairX", "0", CVAR_ARCHIVE},
;249:	{&cg_crosshairY, "cg_crosshairY", "0", CVAR_ARCHIVE},
;250:	{&cg_brassTime, "cg_brassTime", "2500", CVAR_ARCHIVE},
;251:	{&cg_simpleItems, "cg_simpleItems", "0", CVAR_ARCHIVE},
;252:	{&cg_addMarks, "cg_marks", "1", CVAR_ARCHIVE},
;253:	{&cg_lagometer, "cg_lagometer", "1", CVAR_ARCHIVE},
;254:	{&cg_railTrailTime, "cg_railTrailTime", "400", CVAR_ARCHIVE},
;255:	{&cg_railTrailRadius, "cg_railTrailRadius", "0", CVAR_ARCHIVE},
;256:	{&cg_gun_x, "cg_gunX", "0", CVAR_ARCHIVE},
;257:	{&cg_gun_y, "cg_gunY", "0", CVAR_ARCHIVE},
;258:	{&cg_gun_z, "cg_gunZ", "0", CVAR_ARCHIVE},
;259:	{&cg_centertime, "cg_centertime", "3", CVAR_CHEAT},
;260:	{&cg_runpitch, "cg_runpitch", "0.002", CVAR_ARCHIVE},
;261:	{&cg_runroll, "cg_runroll", "0.005", CVAR_ARCHIVE},
;262:	{&cg_bobup, "cg_bobup", "0.0", CVAR_ARCHIVE},
;263:	{&cg_bobpitch, "cg_bobpitch", "0.0", CVAR_ARCHIVE},
;264:	{&cg_bobroll, "cg_bobroll", "0.0", CVAR_ARCHIVE},
;265:	{&cg_swingSpeed, "cg_swingSpeed", "0.3", CVAR_CHEAT},
;266:	{&cg_animSpeed, "cg_animspeed", "1", CVAR_CHEAT},
;267:	{&cg_debugAnim, "cg_debuganim", "0", CVAR_CHEAT},
;268:	{&cg_debugPosition, "cg_debugposition", "0", CVAR_CHEAT},
;269:	{&cg_debugEvents, "cg_debugevents", "0", CVAR_CHEAT},
;270:	{&cg_errorDecay, "cg_errordecay", "100", 0},
;271:	{&cg_nopredict, "cg_nopredict", "0", 0},
;272:	{&cg_noPlayerAnims, "cg_noplayeranims", "0", CVAR_CHEAT},
;273:	{&cg_showmiss, "cg_showmiss", "0", 0},
;274:	{&cg_footsteps, "cg_footsteps", "1", CVAR_CHEAT},
;275:	{&cg_tracerChance, "cg_tracerchance", "0.4", CVAR_CHEAT},
;276:	{&cg_tracerWidth, "cg_tracerwidth", "1", CVAR_CHEAT},
;277:	{&cg_tracerLength, "cg_tracerlength", "100", CVAR_CHEAT},
;278:	{&cg_thirdPersonRange, "cg_thirdPersonRange", "40", CVAR_CHEAT},
;279:	{&cg_thirdPersonAngle, "cg_thirdPersonAngle", "0", CVAR_CHEAT},
;280:	{&cg_thirdPerson, "cg_thirdPerson", "0", 0},
;281:	{&cg_teamChatTime, "cg_teamChatTime", "3000", CVAR_ARCHIVE},
;282:	{&cg_teamChatHeight, "cg_teamChatHeight", "0", CVAR_ARCHIVE},
;283:	{&cg_forceModel, "cg_forceModel", "0", CVAR_ARCHIVE},
;284:	{&cg_predictItems, "cg_predictItems", "1", CVAR_ARCHIVE},
;285:#ifdef MISSIONPACK
;286:	{&cg_deferPlayers, "cg_deferPlayers", "0", CVAR_ARCHIVE},
;287:#else
;288:	{&cg_deferPlayers, "cg_deferPlayers", "1", CVAR_ARCHIVE},
;289:#endif
;290:	{&cg_drawTeamOverlay, "cg_drawTeamOverlay", "0", CVAR_ARCHIVE},
;291:	{&cg_teamOverlayUserinfo, "teamoverlay", "0", CVAR_ROM | CVAR_USERINFO},
;292:	{&cg_stats, "cg_stats", "0", 0},
;293:	{&cg_drawFriend, "cg_drawFriend", "1", CVAR_ARCHIVE},
;294:	{&cg_teamChatsOnly, "cg_teamChatsOnly", "0", CVAR_ARCHIVE},
;295:#ifdef MISSIONPACK
;296:	{&cg_noVoiceChats, "cg_noVoiceChats", "0", CVAR_ARCHIVE},
;297:	{&cg_noVoiceText, "cg_noVoiceText", "0", CVAR_ARCHIVE},
;298:#endif
;299:	// the following variables are created in other parts of the system,
;300:    // but we also reference them here
;301:	{&cg_buildScript, "com_buildScript", "0", 0},  // force loading of all possible data amd error on failures
;302:	{&cg_paused, "cl_paused", "0", CVAR_ROM},
;303:	{&cg_blood, "com_blood", "1", CVAR_ARCHIVE},
;304:#ifdef MISSIONPACK
;305:	{&cg_redTeamName, "g_redteam", DEFAULT_REDTEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO},
;306:	{&cg_blueTeamName, "g_blueteam", DEFAULT_BLUETEAM_NAME, CVAR_ARCHIVE | CVAR_SERVERINFO | CVAR_USERINFO},
;307:	{&cg_currentSelectedPlayer, "cg_currentSelectedPlayer", "0", CVAR_ARCHIVE},
;308:	{&cg_currentSelectedPlayerName, "cg_currentSelectedPlayerName", "", CVAR_ARCHIVE},
;309:	{&cg_singlePlayer, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;310:	{&cg_enableDust, "g_enableDust", "0", CVAR_SERVERINFO},
;311:	{&cg_enableBreath, "g_enableBreath", "0", CVAR_SERVERINFO},
;312:	{&cg_singlePlayerActive, "ui_singlePlayerActive", "0", CVAR_USERINFO},
;313:	{&cg_recordSPDemo, "ui_recordSPDemo", "0", CVAR_ARCHIVE},
;314:	{&cg_recordSPDemoName, "ui_recordSPDemoName", "", CVAR_ARCHIVE},
;315:	{&cg_obeliskRespawnDelay, "g_obeliskRespawnDelay", "10", CVAR_SERVERINFO},
;316:	{&cg_hudFiles, "cg_hudFiles", "ui/hud.txt", CVAR_ARCHIVE},
;317:#endif
;318:	{&cg_cameraOrbit, "cg_cameraOrbit", "0", CVAR_CHEAT},
;319:	{&cg_cameraOrbitDelay, "cg_cameraOrbitDelay", "50", CVAR_ARCHIVE},
;320:	{&cg_timescaleFadeEnd, "cg_timescaleFadeEnd", "1", 0},
;321:	{&cg_timescaleFadeSpeed, "cg_timescaleFadeSpeed", "0", 0},
;322:	{&cg_timescale, "timescale", "1", 0},
;323:	{&cg_scorePlum, "cg_scorePlums", "1", CVAR_USERINFO | CVAR_ARCHIVE},
;324:	{&cg_smoothClients, "cg_smoothClients", "0", CVAR_USERINFO | CVAR_ARCHIVE},
;325:	{&cg_cameraMode, "com_cameraMode", "0", CVAR_CHEAT},
;326:	{&cg_noTaunt, "cg_noTaunt", "0", CVAR_ARCHIVE},
;327:	{&cg_noProjectileTrail, "cg_noProjectileTrail", "0", CVAR_ARCHIVE},
;328:	{&cg_smallFont, "ui_smallFont", "0.25", CVAR_ARCHIVE},
;329:	{&cg_bigFont, "ui_bigFont", "0.4", CVAR_ARCHIVE},
;330:	{&cg_oldRail, "cg_oldRail", "1", CVAR_ARCHIVE},
;331:	{&cg_oldRocket, "cg_oldRocket", "1", CVAR_ARCHIVE},
;332:	{&cg_oldPlasma, "cg_oldPlasma", "1", CVAR_ARCHIVE},
;333:	{&cg_trueLightning, "cg_trueLightning", "0.0", CVAR_ARCHIVE},
;334:	{&cg_hitSounds, "cg_hitSounds", "0", CVAR_ARCHIVE},
;335:	{&cg_enemyModel, "cg_enemyModel", "", CVAR_ARCHIVE},
;336:	{&cg_enemyColors, "cg_enemyColors", "", CVAR_ARCHIVE},
;337:	{&cg_teamModel, "cg_teamModel", "", CVAR_ARCHIVE},
;338:	{&cg_teamColors, "cg_teamColors", "", CVAR_ARCHIVE},
;339:	{&cg_deadBodyDarken, "cg_deadBodyDarken", "1", CVAR_ARCHIVE},
;340:	{&cg_fovAdjust, "cg_fovAdjust", "0", CVAR_ARCHIVE},
;341:	{&cg_followKiller, "cg_followKiller", "0", CVAR_ARCHIVE},
;342:
;343:	{&cg_speed_x, "cg_speed_x", "0.5", CVAR_USERINFO},
;344:	{&cg_speed_y, "cg_speed_y", "0.55", CVAR_USERINFO},
;345:	{&cg_timerActive_x, "cg_timerActive_x", "0.5", CVAR_USERINFO},
;346:	{&cg_timerActive_y, "cg_timerActive_y", "0.0", CVAR_USERINFO},
;347:	{&cg_timerBest_x, "cg_timerBest_x", "0.8", CVAR_USERINFO},
;348:	{&cg_timerBest_y, "cg_timerBest_y", "0.0", CVAR_USERINFO},
;349:	{&cg_timerSkim_x, "cg_timerSkim_x", "0.5", CVAR_USERINFO},
;350:	{&cg_timerSkim_y, "cg_timerSkim_y", "0.7", CVAR_USERINFO},
;351:
;352:	{&phy_movetype, "phy_movetype", "0", CVAR_SYSTEMINFO},
;353:};  // clang-format on
;354:
;355:/*
;356:=================
;357:CG_RegisterCvars
;358:=================
;359:*/
;360:void CG_RegisterCvars(void) {
line 365
;361:	int                i;
;362:	const cvarTable_t* cv;
;363:	char               var[MAX_TOKEN_CHARS];
;364:
;365:	for (i = 0, cv = cvarTable; i < ARRAY_LEN(cvarTable); i++, cv++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRLP4 0
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $218
JUMPV
LABELV $215
line 366
;366:		trap_Cvar_Register(cv->vmCvar, cv->cvarName, cv->defaultString, cv->cvarFlags);
ADDRLP4 0
INDIRP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 367
;367:	}
LABELV $216
line 365
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $218
ADDRLP4 4
INDIRI4
CVIU4 4
CNSTU4 103
LTU4 $215
line 370
;368:
;369:	// see if we are also running the server on this machine
;370:	trap_Cvar_VariableStringBuffer("sv_running", var, sizeof(var));
ADDRGP4 $219
ARGP4
ADDRLP4 8
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 371
;371:	cgs.localServer = atoi(var);
ADDRLP4 8
ARGP4
ADDRLP4 1032
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+31476
ADDRLP4 1032
INDIRI4
ASGNI4
line 373
;372:
;373:	forceModelModificationCount  = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 374
;374:	enemyModelModificationCount  = cg_enemyModel.modificationCount;
ADDRGP4 enemyModelModificationCount
ADDRGP4 cg_enemyModel+4
INDIRI4
ASGNI4
line 375
;375:	enemyColorsModificationCount = cg_enemyColors.modificationCount;
ADDRGP4 enemyColorsModificationCount
ADDRGP4 cg_enemyColors+4
INDIRI4
ASGNI4
line 376
;376:	teamModelModificationCount   = cg_teamModel.modificationCount;
ADDRGP4 teamModelModificationCount
ADDRGP4 cg_teamModel+4
INDIRI4
ASGNI4
line 377
;377:	teamColorsModificationCount  = cg_teamColors.modificationCount;
ADDRGP4 teamColorsModificationCount
ADDRGP4 cg_teamColors+4
INDIRI4
ASGNI4
line 379
;378:
;379:	trap_Cvar_Register(NULL, "model", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE);
CNSTP4 0
ARGP4
ADDRGP4 $226
ARGP4
ADDRGP4 $227
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 380
;380:	trap_Cvar_Register(NULL, "headmodel", DEFAULT_MODEL, CVAR_USERINFO | CVAR_ARCHIVE);
CNSTP4 0
ARGP4
ADDRGP4 $228
ARGP4
ADDRGP4 $227
ARGP4
CNSTI4 3
ARGI4
ADDRGP4 trap_Cvar_Register
CALLV
pop
line 383
;381:	// trap_Cvar_Register(NULL, "team_model", DEFAULT_TEAM_MODEL, CVAR_USERINFO | CVAR_ARCHIVE );
;382:	// trap_Cvar_Register(NULL, "team_headmodel", DEFAULT_TEAM_HEAD, CVAR_USERINFO | CVAR_ARCHIVE );
;383:}
LABELV $214
endproc CG_RegisterCvars 1036 16
export CG_ForceModelChange
proc CG_ForceModelChange 12 4
line 390
;384:
;385:/*
;386:===================
;387:CG_ForceModelChange
;388:===================
;389:*/
;390:void CG_ForceModelChange(void) {
line 394
;391:	const char* clientInfo;
;392:	int         i;
;393:
;394:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $230
line 395
;395:		clientInfo = CG_ConfigString(CS_PLAYERS + i);
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 396
;396:		if (!clientInfo[0]) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $234
line 397
;397:			continue;
ADDRGP4 $231
JUMPV
LABELV $234
line 399
;398:		}
;399:		CG_NewClientInfo(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 400
;400:	}
LABELV $231
line 394
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $230
line 401
;401:}
LABELV $229
endproc CG_ForceModelChange 12 4
export CG_UpdateCvars
proc CG_UpdateCvars 8 8
line 408
;402:
;403:/*
;404:=================
;405:CG_UpdateCvars
;406:=================
;407:*/
;408:void CG_UpdateCvars(void) {
line 412
;409:	int                i;
;410:	const cvarTable_t* cv;
;411:
;412:	for (i = 0, cv = cvarTable; i < ARRAY_LEN(cvarTable); i++, cv++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 4
ADDRGP4 cvarTable
ASGNP4
ADDRGP4 $240
JUMPV
LABELV $237
line 413
;413:		trap_Cvar_Update(cv->vmCvar);
ADDRLP4 4
INDIRP4
INDIRP4
ARGP4
ADDRGP4 trap_Cvar_Update
CALLV
pop
line 414
;414:	}
LABELV $238
line 412
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
LABELV $240
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 103
LTU4 $237
line 420
;415:
;416:	// check for modications here
;417:
;418:	// If team overlay is on, ask for updates from the server.  If its off,
;419:	// let the server know so we don't receive it
;420:	if (drawTeamOverlayModificationCount != cg_drawTeamOverlay.modificationCount) {
ADDRGP4 drawTeamOverlayModificationCount
INDIRI4
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
EQI4 $241
line 421
;421:		drawTeamOverlayModificationCount = cg_drawTeamOverlay.modificationCount;
ADDRGP4 drawTeamOverlayModificationCount
ADDRGP4 cg_drawTeamOverlay+4
INDIRI4
ASGNI4
line 430
;422:#if 0
;423:		if ( cg_drawTeamOverlay.integer > 0 ) {
;424:			trap_Cvar_Set( "teamoverlay", "1" );
;425:		} else {
;426:			trap_Cvar_Set( "teamoverlay", "0" );
;427:		}
;428:#endif
;429:		// FIXME E3 HACK
;430:		trap_Cvar_Set("teamoverlay", "1");
ADDRGP4 $167
ARGP4
ADDRGP4 $90
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 431
;431:	}
LABELV $241
line 434
;432:
;433:	// if model changed
;434:	if (forceModelModificationCount != cg_forceModel.modificationCount || enemyModelModificationCount != cg_enemyModel.modificationCount ||
ADDRGP4 forceModelModificationCount
INDIRI4
ADDRGP4 cg_forceModel+4
INDIRI4
NEI4 $255
ADDRGP4 enemyModelModificationCount
INDIRI4
ADDRGP4 cg_enemyModel+4
INDIRI4
NEI4 $255
ADDRGP4 enemyColorsModificationCount
INDIRI4
ADDRGP4 cg_enemyColors+4
INDIRI4
NEI4 $255
ADDRGP4 teamModelModificationCount
INDIRI4
ADDRGP4 cg_teamModel+4
INDIRI4
NEI4 $255
ADDRGP4 teamColorsModificationCount
INDIRI4
ADDRGP4 cg_teamColors+4
INDIRI4
EQI4 $245
LABELV $255
line 436
;435:	    enemyColorsModificationCount != cg_enemyColors.modificationCount || teamModelModificationCount != cg_teamModel.modificationCount ||
;436:	    teamColorsModificationCount != cg_teamColors.modificationCount) {
line 438
;437:
;438:		forceModelModificationCount  = cg_forceModel.modificationCount;
ADDRGP4 forceModelModificationCount
ADDRGP4 cg_forceModel+4
INDIRI4
ASGNI4
line 439
;439:		enemyModelModificationCount  = cg_enemyModel.modificationCount;
ADDRGP4 enemyModelModificationCount
ADDRGP4 cg_enemyModel+4
INDIRI4
ASGNI4
line 440
;440:		enemyColorsModificationCount = cg_enemyColors.modificationCount;
ADDRGP4 enemyColorsModificationCount
ADDRGP4 cg_enemyColors+4
INDIRI4
ASGNI4
line 441
;441:		teamModelModificationCount   = cg_teamModel.modificationCount;
ADDRGP4 teamModelModificationCount
ADDRGP4 cg_teamModel+4
INDIRI4
ASGNI4
line 442
;442:		teamColorsModificationCount  = cg_teamColors.modificationCount;
ADDRGP4 teamColorsModificationCount
ADDRGP4 cg_teamColors+4
INDIRI4
ASGNI4
line 444
;443:
;444:		CG_ForceModelChange();
ADDRGP4 CG_ForceModelChange
CALLV
pop
line 445
;445:	}
LABELV $245
line 446
;446:}
LABELV $236
endproc CG_UpdateCvars 8 8
export CG_CrosshairPlayer
proc CG_CrosshairPlayer 0 0
line 448
;447:
;448:int CG_CrosshairPlayer(void) {
line 449
;449:	if (cg.time > (cg.crosshairClientTime + 1000)) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117540
INDIRI4
CNSTI4 1000
ADDI4
LEI4 $262
line 450
;450:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $261
JUMPV
LABELV $262
line 452
;451:	}
;452:	return cg.crosshairClientNum;
ADDRGP4 cg+117536
INDIRI4
RETI4
LABELV $261
endproc CG_CrosshairPlayer 0 0
export CG_LastAttacker
proc CG_LastAttacker 0 0
line 455
;453:}
;454:
;455:int CG_LastAttacker(void) {
line 456
;456:	if (!cg.attackerTime) {
ADDRGP4 cg+117588
INDIRI4
CNSTI4 0
NEI4 $268
line 457
;457:		return -1;
CNSTI4 -1
RETI4
ADDRGP4 $267
JUMPV
LABELV $268
line 459
;458:	}
;459:	return cg.snap->ps.persistant[PERS_ATTACKER];
ADDRGP4 cg+36
INDIRP4
CNSTI4 316
ADDP4
INDIRI4
RETI4
LABELV $267
endproc CG_LastAttacker 0 0
export CG_Printf
proc CG_Printf 1028 12
line 462
;460:}
;461:
;462:void QDECL CG_Printf(const char* msg, ...) {
line 466
;463:	va_list argptr;
;464:	char    text[1024];
;465:
;466:	va_start(argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 467
;467:	ED_vsprintf(text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 468
;468:	va_end(argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 470
;469:
;470:	trap_Print(text);
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 471
;471:}
LABELV $272
endproc CG_Printf 1028 12
export CG_Error
proc CG_Error 1028 12
line 473
;472:
;473:void QDECL CG_Error(const char* msg, ...) {
line 477
;474:	va_list argptr;
;475:	char    text[1024];
;476:
;477:	va_start(argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 478
;478:	ED_vsprintf(text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 479
;479:	va_end(argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 481
;480:
;481:	trap_Error(text);
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 482
;482:}
LABELV $274
endproc CG_Error 1028 12
export Com_Error
proc Com_Error 1028 12
line 487
;483:
;484:#ifndef CGAME_HARD_LINKED
;485:// this is only here so the functions in q_shared.c and bg_*.c can link (FIXME)
;486:
;487:void QDECL Com_Error(int level, const char* error, ...) {
line 491
;488:	va_list argptr;
;489:	char    text[1024];
;490:
;491:	va_start(argptr, error);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 492
;492:	ED_vsprintf(text, error, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 493
;493:	va_end(argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 495
;494:
;495:	trap_Error(text);
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 496
;496:}
LABELV $276
endproc Com_Error 1028 12
export Com_Printf
proc Com_Printf 1028 12
line 498
;497:
;498:void QDECL Com_Printf(const char* msg, ...) {
line 502
;499:	va_list argptr;
;500:	char    text[1024];
;501:
;502:	va_start(argptr, msg);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 503
;503:	ED_vsprintf(text, msg, argptr);
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 ED_vsprintf
CALLI4
pop
line 504
;504:	va_end(argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 506
;505:
;506:	trap_Print(text);
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 507
;507:}
LABELV $278
endproc Com_Printf 1028 12
bss
align 1
LABELV $281
skip 2048
data
align 4
LABELV $282
byte 4 0
export CG_Argv
code
proc CG_Argv 4 12
line 516
;508:
;509:#endif
;510:
;511:/*
;512:================
;513:CG_Argv
;514:================
;515:*/
;516:const char* CG_Argv(int arg) {
line 520
;517:	static char buffer[2][MAX_STRING_CHARS];
;518:	static int  index = 0;
;519:
;520:	index ^= 1;
ADDRLP4 0
ADDRGP4 $282
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 521
;521:	trap_Argv(arg, buffer[index], sizeof(buffer[0]));
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $282
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 $281
ADDP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 523
;522:
;523:	return buffer[index];
ADDRGP4 $282
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 $281
ADDP4
RETP4
LABELV $280
endproc CG_Argv 4 12
proc CG_RegisterItemSounds 96 12
line 535
;524:}
;525:
;526://========================================================================
;527:
;528:/*
;529:=================
;530:CG_RegisterItemSounds
;531:
;532:The server says this item is used on this level
;533:=================
;534:*/
;535:static void CG_RegisterItemSounds(int itemNum) {
line 541
;536:	gitem_t*    item;
;537:	char        data[MAX_QPATH];
;538:	const char *s, *start;
;539:	int         len;
;540:
;541:	item = &bg_itemlist[itemNum];
ADDRLP4 76
ADDRFP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist
ADDP4
ASGNP4
line 543
;542:
;543:	if (item->pickup_sound) {
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $284
line 544
;544:		trap_S_RegisterSound(item->pickup_sound, qfalse);
ADDRLP4 76
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 545
;545:	}
LABELV $284
line 548
;546:
;547:	// parse the space seperated precache string for other media
;548:	s = item->sounds;
ADDRLP4 0
ADDRLP4 76
INDIRP4
CNSTI4 48
ADDP4
INDIRP4
ASGNP4
line 549
;549:	if (!s || !s[0])
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $288
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $290
LABELV $288
line 550
;550:		return;
ADDRGP4 $283
JUMPV
LABELV $289
line 552
;551:
;552:	while (*s) {
line 553
;553:		start = s;
ADDRLP4 72
ADDRLP4 0
INDIRP4
ASGNP4
ADDRGP4 $293
JUMPV
LABELV $292
line 554
;554:		while (*s && *s != ' ') {
line 555
;555:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 556
;556:		}
LABELV $293
line 554
ADDRLP4 84
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 84
INDIRI4
CNSTI4 0
EQI4 $295
ADDRLP4 84
INDIRI4
CNSTI4 32
NEI4 $292
LABELV $295
line 558
;557:
;558:		len = s - start;
ADDRLP4 4
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRLP4 72
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 559
;559:		if (len >= MAX_QPATH || len < 5) {
ADDRLP4 4
INDIRI4
CNSTI4 64
GEI4 $298
ADDRLP4 4
INDIRI4
CNSTI4 5
GEI4 $296
LABELV $298
line 560
;560:			CG_Error("PrecacheItem: %s has bad precache string", item->classname);
ADDRGP4 $299
ARGP4
ADDRLP4 76
INDIRP4
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 561
;561:			return;
ADDRGP4 $283
JUMPV
LABELV $296
line 563
;562:		}
;563:		memcpy(data, start, len);
ADDRLP4 8
ARGP4
ADDRLP4 72
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 564
;564:		data[len] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 8
ADDP4
CNSTI1 0
ASGNI1
line 565
;565:		if (*s) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $300
line 566
;566:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 567
;567:		}
LABELV $300
line 569
;568:
;569:		if (!strcmp(data + len - 3, "wav")) {
ADDRLP4 4
INDIRI4
ADDRLP4 8-3
ADDP4
ARGP4
ADDRGP4 $305
ARGP4
ADDRLP4 92
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 92
INDIRI4
CNSTI4 0
NEI4 $302
line 570
;570:			trap_S_RegisterSound(data, qfalse);
ADDRLP4 8
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_S_RegisterSound
CALLI4
pop
line 571
;571:		}
LABELV $302
line 572
;572:	}
LABELV $290
line 552
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $289
line 573
;573:}
LABELV $283
endproc CG_RegisterItemSounds 96 12
proc CG_RegisterSounds 560 16
line 582
;574:
;575:/*
;576:=================
;577:CG_RegisterSounds
;578:
;579:called during a precache command
;580:=================
;581:*/
;582:static void CG_RegisterSounds(void) {
line 593
;583:	int         i;
;584:	char        items[MAX_ITEMS + 1];
;585:	char        name[MAX_QPATH];
;586:	const char* soundName;
;587:
;588:	// voice commands
;589:#ifdef MISSIONPACK
;590:	CG_LoadVoiceChats();
;591:#endif
;592:
;593:	cgs.media.oneMinuteSound    = trap_S_RegisterSound("sound/feedback/1_minute.wav", qtrue);
ADDRGP4 $309
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 332
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+728
ADDRLP4 332
INDIRI4
ASGNI4
line 594
;594:	cgs.media.fiveMinuteSound   = trap_S_RegisterSound("sound/feedback/5_minute.wav", qtrue);
ADDRGP4 $312
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 336
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+732
ADDRLP4 336
INDIRI4
ASGNI4
line 595
;595:	cgs.media.suddenDeathSound  = trap_S_RegisterSound("sound/feedback/sudden_death.wav", qtrue);
ADDRGP4 $315
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 340
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+736
ADDRLP4 340
INDIRI4
ASGNI4
line 596
;596:	cgs.media.oneFragSound      = trap_S_RegisterSound("sound/feedback/1_frag.wav", qtrue);
ADDRGP4 $318
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 344
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+748
ADDRLP4 344
INDIRI4
ASGNI4
line 597
;597:	cgs.media.twoFragSound      = trap_S_RegisterSound("sound/feedback/2_frags.wav", qtrue);
ADDRGP4 $321
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 348
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+744
ADDRLP4 348
INDIRI4
ASGNI4
line 598
;598:	cgs.media.threeFragSound    = trap_S_RegisterSound("sound/feedback/3_frags.wav", qtrue);
ADDRGP4 $324
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 352
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+740
ADDRLP4 352
INDIRI4
ASGNI4
line 599
;599:	cgs.media.count3Sound       = trap_S_RegisterSound("sound/feedback/three.wav", qtrue);
ADDRGP4 $327
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 356
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+916
ADDRLP4 356
INDIRI4
ASGNI4
line 600
;600:	cgs.media.count2Sound       = trap_S_RegisterSound("sound/feedback/two.wav", qtrue);
ADDRGP4 $330
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 360
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+920
ADDRLP4 360
INDIRI4
ASGNI4
line 601
;601:	cgs.media.count1Sound       = trap_S_RegisterSound("sound/feedback/one.wav", qtrue);
ADDRGP4 $333
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 364
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+924
ADDRLP4 364
INDIRI4
ASGNI4
line 602
;602:	cgs.media.countFightSound   = trap_S_RegisterSound("sound/feedback/fight.wav", qtrue);
ADDRGP4 $336
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 368
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+928
ADDRLP4 368
INDIRI4
ASGNI4
line 603
;603:	cgs.media.countPrepareSound = trap_S_RegisterSound("sound/feedback/prepare.wav", qtrue);
ADDRGP4 $339
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 372
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+932
ADDRLP4 372
INDIRI4
ASGNI4
line 608
;604:#ifdef MISSIONPACK
;605:	cgs.media.countPrepareTeamSound = trap_S_RegisterSound("sound/feedback/prepare_team.wav", qtrue);
;606:#endif
;607:
;608:	if (cgs.gametype >= GT_TEAM || cg_buildScript.integer) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
GEI4 $344
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $340
LABELV $344
line 610
;609:
;610:		cgs.media.captureAwardSound = trap_S_RegisterSound("sound/teamplay/flagcapture_yourteam.wav", qtrue);
ADDRGP4 $347
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 376
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+832
ADDRLP4 376
INDIRI4
ASGNI4
line 611
;611:		cgs.media.redLeadsSound     = trap_S_RegisterSound("sound/feedback/redleads.wav", qtrue);
ADDRGP4 $350
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 380
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+844
ADDRLP4 380
INDIRI4
ASGNI4
line 612
;612:		cgs.media.blueLeadsSound    = trap_S_RegisterSound("sound/feedback/blueleads.wav", qtrue);
ADDRGP4 $353
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 384
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+848
ADDRLP4 384
INDIRI4
ASGNI4
line 613
;613:		cgs.media.teamsTiedSound    = trap_S_RegisterSound("sound/feedback/teamstied.wav", qtrue);
ADDRGP4 $356
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 388
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+852
ADDRLP4 388
INDIRI4
ASGNI4
line 614
;614:		cgs.media.hitTeamSound      = trap_S_RegisterSound("sound/feedback/hit_teammate.wav", qtrue);
ADDRGP4 $359
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 392
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+772
ADDRLP4 392
INDIRI4
ASGNI4
line 616
;615:
;616:		cgs.media.redScoredSound  = trap_S_RegisterSound("sound/teamplay/voc_red_scores.wav", qtrue);
ADDRGP4 $362
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 396
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+836
ADDRLP4 396
INDIRI4
ASGNI4
line 617
;617:		cgs.media.blueScoredSound = trap_S_RegisterSound("sound/teamplay/voc_blue_scores.wav", qtrue);
ADDRGP4 $365
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 400
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+840
ADDRLP4 400
INDIRI4
ASGNI4
line 619
;618:
;619:		cgs.media.captureYourTeamSound = trap_S_RegisterSound("sound/teamplay/flagcapture_yourteam.wav", qtrue);
ADDRGP4 $347
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 404
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+856
ADDRLP4 404
INDIRI4
ASGNI4
line 620
;620:		cgs.media.captureOpponentSound = trap_S_RegisterSound("sound/teamplay/flagcapture_opponent.wav", qtrue);
ADDRGP4 $370
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+860
ADDRLP4 408
INDIRI4
ASGNI4
line 622
;621:
;622:		cgs.media.returnYourTeamSound = trap_S_RegisterSound("sound/teamplay/flagreturn_yourteam.wav", qtrue);
ADDRGP4 $373
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+864
ADDRLP4 412
INDIRI4
ASGNI4
line 623
;623:		cgs.media.returnOpponentSound = trap_S_RegisterSound("sound/teamplay/flagreturn_opponent.wav", qtrue);
ADDRGP4 $376
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+868
ADDRLP4 416
INDIRI4
ASGNI4
line 625
;624:
;625:		cgs.media.takenYourTeamSound = trap_S_RegisterSound("sound/teamplay/flagtaken_yourteam.wav", qtrue);
ADDRGP4 $379
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+872
ADDRLP4 420
INDIRI4
ASGNI4
line 626
;626:		cgs.media.takenOpponentSound = trap_S_RegisterSound("sound/teamplay/flagtaken_opponent.wav", qtrue);
ADDRGP4 $382
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+876
ADDRLP4 424
INDIRI4
ASGNI4
line 628
;627:
;628:		if (cgs.gametype == GT_CTF || cg_buildScript.integer) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
EQI4 $387
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $383
LABELV $387
line 629
;629:			cgs.media.redFlagReturnedSound       = trap_S_RegisterSound("sound/teamplay/voc_red_returned.wav", qtrue);
ADDRGP4 $390
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+880
ADDRLP4 428
INDIRI4
ASGNI4
line 630
;630:			cgs.media.blueFlagReturnedSound      = trap_S_RegisterSound("sound/teamplay/voc_blue_returned.wav", qtrue);
ADDRGP4 $393
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+884
ADDRLP4 432
INDIRI4
ASGNI4
line 631
;631:			cgs.media.enemyTookYourFlagSound     = trap_S_RegisterSound("sound/teamplay/voc_enemy_flag.wav", qtrue);
ADDRGP4 $396
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+888
ADDRLP4 436
INDIRI4
ASGNI4
line 632
;632:			cgs.media.yourTeamTookEnemyFlagSound = trap_S_RegisterSound("sound/teamplay/voc_team_flag.wav", qtrue);
ADDRGP4 $399
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+896
ADDRLP4 440
INDIRI4
ASGNI4
line 633
;633:		}
LABELV $383
line 653
;634:
;635:#ifdef MISSIONPACK
;636:		if (cgs.gametype == GT_1FCTF || cg_buildScript.integer) {
;637:			// FIXME: get a replacement for this sound ?
;638:			cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound("sound/teamplay/flagreturn_opponent.wav", qtrue);
;639:			cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound("sound/teamplay/voc_team_1flag.wav", qtrue);
;640:			cgs.media.enemyTookTheFlagSound    = trap_S_RegisterSound("sound/teamplay/voc_enemy_1flag.wav", qtrue);
;641:		}
;642:
;643:		if (cgs.gametype == GT_1FCTF || cgs.gametype == GT_CTF || cg_buildScript.integer) {
;644:			cgs.media.youHaveFlagSound = trap_S_RegisterSound("sound/teamplay/voc_you_flag.wav", qtrue);
;645:			cgs.media.holyShitSound    = trap_S_RegisterSound("sound/feedback/voc_holyshit.wav", qtrue);
;646:		}
;647:
;648:		if (cgs.gametype == GT_OBELISK || cg_buildScript.integer) {
;649:			cgs.media.yourBaseIsUnderAttackSound = trap_S_RegisterSound("sound/teamplay/voc_base_attack.wav", qtrue);
;650:		}
;651:		cgs.media.neutralFlagReturnedSound = trap_S_RegisterSound("sound/teamplay/flagreturn_opponent.wav", qtrue);
;652:#else
;653:		cgs.media.youHaveFlagSound         = trap_S_RegisterSound("sound/teamplay/voc_you_flag.wav", qtrue);
ADDRGP4 $402
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+904
ADDRLP4 428
INDIRI4
ASGNI4
line 654
;654:		cgs.media.holyShitSound            = trap_S_RegisterSound("sound/feedback/voc_holyshit.wav", qtrue);
ADDRGP4 $405
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+912
ADDRLP4 432
INDIRI4
ASGNI4
line 655
;655:		cgs.media.yourTeamTookTheFlagSound = trap_S_RegisterSound("sound/teamplay/voc_team_1flag.wav", qtrue);
ADDRGP4 $408
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+900
ADDRLP4 436
INDIRI4
ASGNI4
line 656
;656:		cgs.media.enemyTookTheFlagSound    = trap_S_RegisterSound("sound/teamplay/voc_enemy_1flag.wav", qtrue);
ADDRGP4 $411
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+892
ADDRLP4 440
INDIRI4
ASGNI4
line 658
;657:#endif
;658:	}
LABELV $340
line 660
;659:
;660:	cgs.media.tracerSound     = trap_S_RegisterSound("sound/weapons/machinegun/buletby1.wav", qfalse);
ADDRGP4 $414
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 376
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+520
ADDRLP4 376
INDIRI4
ASGNI4
line 661
;661:	cgs.media.selectSound     = trap_S_RegisterSound("sound/weapons/change.wav", qfalse);
ADDRGP4 $417
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 380
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+524
ADDRLP4 380
INDIRI4
ASGNI4
line 662
;662:	cgs.media.wearOffSound    = trap_S_RegisterSound("sound/items/wearoff.wav", qfalse);
ADDRGP4 $420
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 384
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+532
ADDRLP4 384
INDIRI4
ASGNI4
line 663
;663:	cgs.media.useNothingSound = trap_S_RegisterSound("sound/items/use_nothing.wav", qfalse);
ADDRGP4 $423
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 388
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+528
ADDRLP4 388
INDIRI4
ASGNI4
line 664
;664:	cgs.media.gibSound        = trap_S_RegisterSound("sound/player/gibsplt1.wav", qfalse);
ADDRGP4 $426
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 392
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+684
ADDRLP4 392
INDIRI4
ASGNI4
line 665
;665:	cgs.media.gibBounce1Sound = trap_S_RegisterSound("sound/player/gibimp1.wav", qfalse);
ADDRGP4 $429
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 396
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+688
ADDRLP4 396
INDIRI4
ASGNI4
line 666
;666:	cgs.media.gibBounce2Sound = trap_S_RegisterSound("sound/player/gibimp2.wav", qfalse);
ADDRGP4 $432
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 400
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+692
ADDRLP4 400
INDIRI4
ASGNI4
line 667
;667:	cgs.media.gibBounce3Sound = trap_S_RegisterSound("sound/player/gibimp3.wav", qfalse);
ADDRGP4 $435
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 404
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+696
ADDRLP4 404
INDIRI4
ASGNI4
line 686
;668:
;669:#ifdef MISSIONPACK
;670:	cgs.media.useInvulnerabilitySound     = trap_S_RegisterSound("sound/items/invul_activate.wav", qfalse);
;671:	cgs.media.invulnerabilityImpactSound1 = trap_S_RegisterSound("sound/items/invul_impact_01.wav", qfalse);
;672:	cgs.media.invulnerabilityImpactSound2 = trap_S_RegisterSound("sound/items/invul_impact_02.wav", qfalse);
;673:	cgs.media.invulnerabilityImpactSound3 = trap_S_RegisterSound("sound/items/invul_impact_03.wav", qfalse);
;674:	cgs.media.invulnerabilityJuicedSound  = trap_S_RegisterSound("sound/items/invul_juiced.wav", qfalse);
;675:	cgs.media.obeliskHitSound1            = trap_S_RegisterSound("sound/items/obelisk_hit_01.wav", qfalse);
;676:	cgs.media.obeliskHitSound2            = trap_S_RegisterSound("sound/items/obelisk_hit_02.wav", qfalse);
;677:	cgs.media.obeliskHitSound3            = trap_S_RegisterSound("sound/items/obelisk_hit_03.wav", qfalse);
;678:	cgs.media.obeliskRespawnSound         = trap_S_RegisterSound("sound/items/obelisk_respawn.wav", qfalse);
;679:
;680:	cgs.media.ammoregenSound = trap_S_RegisterSound("sound/items/cl_ammoregen.wav", qfalse);
;681:	cgs.media.doublerSound   = trap_S_RegisterSound("sound/items/cl_doubler.wav", qfalse);
;682:	cgs.media.guardSound     = trap_S_RegisterSound("sound/items/cl_guard.wav", qfalse);
;683:	cgs.media.scoutSound     = trap_S_RegisterSound("sound/items/cl_scout.wav", qfalse);
;684:#endif
;685:
;686:	cgs.media.teleInSound  = trap_S_RegisterSound("sound/world/telein.wav", qfalse);
ADDRGP4 $438
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 408
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+700
ADDRLP4 408
INDIRI4
ASGNI4
line 687
;687:	cgs.media.teleOutSound = trap_S_RegisterSound("sound/world/teleout.wav", qfalse);
ADDRGP4 $441
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 412
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+704
ADDRLP4 412
INDIRI4
ASGNI4
line 688
;688:	cgs.media.respawnSound = trap_S_RegisterSound("sound/items/respawn1.wav", qfalse);
ADDRGP4 $444
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 416
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+712
ADDRLP4 416
INDIRI4
ASGNI4
line 690
;689:
;690:	cgs.media.noAmmoSound = trap_S_RegisterSound("sound/weapons/noammo.wav", qfalse);
ADDRGP4 $447
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 420
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+708
ADDRLP4 420
INDIRI4
ASGNI4
line 692
;691:
;692:	cgs.media.talkSound = trap_S_RegisterSound("sound/player/talk.wav", qfalse);
ADDRGP4 $450
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 424
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+716
ADDRLP4 424
INDIRI4
ASGNI4
line 693
;693:	cgs.media.landSound = trap_S_RegisterSound("sound/player/land1.wav", qfalse);
ADDRGP4 $453
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 428
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+720
ADDRLP4 428
INDIRI4
ASGNI4
line 695
;694:
;695:	cgs.media.hitSounds[0] = trap_S_RegisterSound("sound/feedback/hit25.wav", qfalse);
ADDRGP4 $456
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 432
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+756
ADDRLP4 432
INDIRI4
ASGNI4
line 696
;696:	cgs.media.hitSounds[1] = trap_S_RegisterSound("sound/feedback/hit50.wav", qfalse);
ADDRGP4 $460
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 436
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+756+4
ADDRLP4 436
INDIRI4
ASGNI4
line 697
;697:	cgs.media.hitSounds[2] = trap_S_RegisterSound("sound/feedback/hit75.wav", qfalse);
ADDRGP4 $464
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 440
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+756+8
ADDRLP4 440
INDIRI4
ASGNI4
line 698
;698:	cgs.media.hitSounds[3] = trap_S_RegisterSound("sound/feedback/hit100.wav", qfalse);
ADDRGP4 $468
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 444
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+756+12
ADDRLP4 444
INDIRI4
ASGNI4
line 700
;699:
;700:	cgs.media.hitSound = trap_S_RegisterSound("sound/feedback/hit.wav", qfalse);
ADDRGP4 $471
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 448
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+752
ADDRLP4 448
INDIRI4
ASGNI4
line 707
;701:
;702:#ifdef MISSIONPACK
;703:	cgs.media.hitSoundHighArmor = trap_S_RegisterSound("sound/feedback/hithi.wav", qfalse);
;704:	cgs.media.hitSoundLowArmor  = trap_S_RegisterSound("sound/feedback/hitlo.wav", qfalse);
;705:#endif
;706:
;707:	cgs.media.impressiveSound  = trap_S_RegisterSound("sound/feedback/impressive.wav", qtrue);
ADDRGP4 $474
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 452
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+776
ADDRLP4 452
INDIRI4
ASGNI4
line 708
;708:	cgs.media.excellentSound   = trap_S_RegisterSound("sound/feedback/excellent.wav", qtrue);
ADDRGP4 $477
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 456
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+780
ADDRLP4 456
INDIRI4
ASGNI4
line 709
;709:	cgs.media.deniedSound      = trap_S_RegisterSound("sound/feedback/denied.wav", qtrue);
ADDRGP4 $480
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 460
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+784
ADDRLP4 460
INDIRI4
ASGNI4
line 710
;710:	cgs.media.humiliationSound = trap_S_RegisterSound("sound/feedback/humiliation.wav", qtrue);
ADDRGP4 $483
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 464
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+788
ADDRLP4 464
INDIRI4
ASGNI4
line 711
;711:	cgs.media.assistSound      = trap_S_RegisterSound("sound/feedback/assist.wav", qtrue);
ADDRGP4 $486
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 468
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+792
ADDRLP4 468
INDIRI4
ASGNI4
line 712
;712:	cgs.media.defendSound      = trap_S_RegisterSound("sound/feedback/defense.wav", qtrue);
ADDRGP4 $489
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 472
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+796
ADDRLP4 472
INDIRI4
ASGNI4
line 719
;713:#ifdef MISSIONPACK
;714:	cgs.media.firstImpressiveSound  = trap_S_RegisterSound("sound/feedback/first_impressive.wav", qtrue);
;715:	cgs.media.firstExcellentSound   = trap_S_RegisterSound("sound/feedback/first_excellent.wav", qtrue);
;716:	cgs.media.firstHumiliationSound = trap_S_RegisterSound("sound/feedback/first_gauntlet.wav", qtrue);
;717:#endif
;718:
;719:	cgs.media.takenLeadSound = trap_S_RegisterSound("sound/feedback/takenlead.wav", qtrue);
ADDRGP4 $492
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 476
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+800
ADDRLP4 476
INDIRI4
ASGNI4
line 720
;720:	cgs.media.tiedLeadSound  = trap_S_RegisterSound("sound/feedback/tiedlead.wav", qtrue);
ADDRGP4 $495
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 480
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+804
ADDRLP4 480
INDIRI4
ASGNI4
line 721
;721:	cgs.media.lostLeadSound  = trap_S_RegisterSound("sound/feedback/lostlead.wav", qtrue);
ADDRGP4 $498
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 484
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+808
ADDRLP4 484
INDIRI4
ASGNI4
line 729
;722:
;723:#ifdef MISSIONPACK
;724:	cgs.media.voteNow    = trap_S_RegisterSound("sound/feedback/vote_now.wav", qtrue);
;725:	cgs.media.votePassed = trap_S_RegisterSound("sound/feedback/vote_passed.wav", qtrue);
;726:	cgs.media.voteFailed = trap_S_RegisterSound("sound/feedback/vote_failed.wav", qtrue);
;727:#endif
;728:
;729:	cgs.media.watrInSound  = trap_S_RegisterSound("sound/player/watr_in.wav", qfalse);
ADDRGP4 $501
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 488
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+812
ADDRLP4 488
INDIRI4
ASGNI4
line 730
;730:	cgs.media.watrOutSound = trap_S_RegisterSound("sound/player/watr_out.wav", qfalse);
ADDRGP4 $504
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 492
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+816
ADDRLP4 492
INDIRI4
ASGNI4
line 731
;731:	cgs.media.watrUnSound  = trap_S_RegisterSound("sound/player/watr_un.wav", qfalse);
ADDRGP4 $507
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 496
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+820
ADDRLP4 496
INDIRI4
ASGNI4
line 733
;732:
;733:	cgs.media.jumpPadSound = trap_S_RegisterSound("sound/world/jumppad.wav", qfalse);
ADDRGP4 $510
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 500
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+724
ADDRLP4 500
INDIRI4
ASGNI4
line 735
;734:
;735:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $511
line 736
;736:		Com_sprintf(name, sizeof(name), "sound/player/footsteps/step%i.wav", i + 1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $515
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 737
;737:		cgs.media.footsteps[FOOTSTEP_NORMAL][i] = trap_S_RegisterSound(name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 504
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+536
ADDP4
ADDRLP4 504
INDIRI4
ASGNI4
line 739
;738:
;739:		Com_sprintf(name, sizeof(name), "sound/player/footsteps/boot%i.wav", i + 1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $518
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 740
;740:		cgs.media.footsteps[FOOTSTEP_BOOT][i] = trap_S_RegisterSound(name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 508
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+536+16
ADDP4
ADDRLP4 508
INDIRI4
ASGNI4
line 742
;741:
;742:		Com_sprintf(name, sizeof(name), "sound/player/footsteps/flesh%i.wav", i + 1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $522
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 743
;743:		cgs.media.footsteps[FOOTSTEP_FLESH][i] = trap_S_RegisterSound(name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+536+32
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 745
;744:
;745:		Com_sprintf(name, sizeof(name), "sound/player/footsteps/mech%i.wav", i + 1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $526
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 746
;746:		cgs.media.footsteps[FOOTSTEP_MECH][i] = trap_S_RegisterSound(name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 516
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+536+48
ADDP4
ADDRLP4 516
INDIRI4
ASGNI4
line 748
;747:
;748:		Com_sprintf(name, sizeof(name), "sound/player/footsteps/energy%i.wav", i + 1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $530
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 749
;749:		cgs.media.footsteps[FOOTSTEP_ENERGY][i] = trap_S_RegisterSound(name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 520
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+536+64
ADDP4
ADDRLP4 520
INDIRI4
ASGNI4
line 751
;750:
;751:		Com_sprintf(name, sizeof(name), "sound/player/footsteps/splash%i.wav", i + 1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $534
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 752
;752:		cgs.media.footsteps[FOOTSTEP_SPLASH][i] = trap_S_RegisterSound(name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 524
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+536+96
ADDP4
ADDRLP4 524
INDIRI4
ASGNI4
line 754
;753:
;754:		Com_sprintf(name, sizeof(name), "sound/player/footsteps/clank%i.wav", i + 1);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 $538
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 755
;755:		cgs.media.footsteps[FOOTSTEP_METAL][i] = trap_S_RegisterSound(name, qfalse);
ADDRLP4 4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 528
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+536+80
ADDP4
ADDRLP4 528
INDIRI4
ASGNI4
line 756
;756:	}
LABELV $512
line 735
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $511
line 759
;757:
;758:	// only register the items that the server says we need
;759:	Q_strncpyz(items, CG_ConfigString(CS_ITEMS), sizeof(items));
CNSTI4 27
ARGI4
ADDRLP4 504
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 72
ARGP4
ADDRLP4 504
INDIRP4
ARGP4
CNSTI4 257
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 761
;760:
;761:	for (i = 1; i < bg_numItems; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $545
JUMPV
LABELV $542
line 763
;762:		//		if ( items[ i ] == '1' || cg_buildScript.integer ) {
;763:		CG_RegisterItemSounds(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemSounds
CALLV
pop
line 765
;764:		//		}
;765:	}
LABELV $543
line 761
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $545
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $542
line 767
;766:
;767:	for (i = 1; i < MAX_SOUNDS; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $546
line 768
;768:		soundName = CG_ConfigString(CS_SOUNDS + i);
ADDRLP4 0
INDIRI4
CNSTI4 288
ADDI4
ARGI4
ADDRLP4 508
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 68
ADDRLP4 508
INDIRP4
ASGNP4
line 769
;769:		if (!soundName[0]) {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $550
line 770
;770:			break;
ADDRGP4 $548
JUMPV
LABELV $550
line 772
;771:		}
;772:		if (soundName[0] == '*') {
ADDRLP4 68
INDIRP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $552
line 773
;773:			continue;  // custom sound
ADDRGP4 $547
JUMPV
LABELV $552
line 775
;774:		}
;775:		cgs.gameSounds[i] = trap_S_RegisterSound(soundName, qfalse);
ADDRLP4 68
INDIRP4
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+35872
ADDP4
ADDRLP4 512
INDIRI4
ASGNI4
line 776
;776:	}
LABELV $547
line 767
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $546
LABELV $548
line 779
;777:
;778:	// FIXME: only needed with item
;779:	cgs.media.flightSound = trap_S_RegisterSound("sound/items/flight.wav", qfalse);
ADDRGP4 $557
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 508
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+824
ADDRLP4 508
INDIRI4
ASGNI4
line 780
;780:	cgs.media.medkitSound = trap_S_RegisterSound("sound/items/use_medkit.wav", qfalse);
ADDRGP4 $560
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 512
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+828
ADDRLP4 512
INDIRI4
ASGNI4
line 781
;781:	cgs.media.quadSound   = trap_S_RegisterSound("sound/items/damage3.wav", qfalse);
ADDRGP4 $563
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 516
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+516
ADDRLP4 516
INDIRI4
ASGNI4
line 782
;782:	cgs.media.sfx_ric1    = trap_S_RegisterSound("sound/weapons/machinegun/ric1.wav", qfalse);
ADDRGP4 $566
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 520
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+660
ADDRLP4 520
INDIRI4
ASGNI4
line 783
;783:	cgs.media.sfx_ric2    = trap_S_RegisterSound("sound/weapons/machinegun/ric2.wav", qfalse);
ADDRGP4 $569
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 524
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+664
ADDRLP4 524
INDIRI4
ASGNI4
line 784
;784:	cgs.media.sfx_ric3    = trap_S_RegisterSound("sound/weapons/machinegun/ric3.wav", qfalse);
ADDRGP4 $572
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 528
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+668
ADDRLP4 528
INDIRI4
ASGNI4
line 786
;785:	// cgs.media.sfx_railg = trap_S_RegisterSound ("sound/weapons/railgun/railgf1a.wav", qfalse);
;786:	cgs.media.sfx_rockexp   = trap_S_RegisterSound("sound/weapons/rocket/rocklx1a.wav", qfalse);
ADDRGP4 $575
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 532
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+676
ADDRLP4 532
INDIRI4
ASGNI4
line 787
;787:	cgs.media.sfx_plasmaexp = trap_S_RegisterSound("sound/weapons/plasma/plasmx1a.wav", qfalse);
ADDRGP4 $578
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 536
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+680
ADDRLP4 536
INDIRI4
ASGNI4
line 809
;788:#ifdef MISSIONPACK
;789:	cgs.media.sfx_proxexp          = trap_S_RegisterSound("sound/weapons/proxmine/wstbexpl.wav", qfalse);
;790:	cgs.media.sfx_nghit            = trap_S_RegisterSound("sound/weapons/nailgun/wnalimpd.wav", qfalse);
;791:	cgs.media.sfx_nghitflesh       = trap_S_RegisterSound("sound/weapons/nailgun/wnalimpl.wav", qfalse);
;792:	cgs.media.sfx_nghitmetal       = trap_S_RegisterSound("sound/weapons/nailgun/wnalimpm.wav", qfalse);
;793:	cgs.media.sfx_chghit           = trap_S_RegisterSound("sound/weapons/vulcan/wvulimpd.wav", qfalse);
;794:	cgs.media.sfx_chghitflesh      = trap_S_RegisterSound("sound/weapons/vulcan/wvulimpl.wav", qfalse);
;795:	cgs.media.sfx_chghitmetal      = trap_S_RegisterSound("sound/weapons/vulcan/wvulimpm.wav", qfalse);
;796:	cgs.media.weaponHoverSound     = trap_S_RegisterSound("sound/weapons/weapon_hover.wav", qfalse);
;797:	cgs.media.kamikazeExplodeSound = trap_S_RegisterSound("sound/items/kam_explode.wav", qfalse);
;798:	cgs.media.kamikazeImplodeSound = trap_S_RegisterSound("sound/items/kam_implode.wav", qfalse);
;799:	cgs.media.kamikazeFarSound     = trap_S_RegisterSound("sound/items/kam_explode_far.wav", qfalse);
;800:	cgs.media.winnerSound          = trap_S_RegisterSound("sound/feedback/voc_youwin.wav", qfalse);
;801:	cgs.media.loserSound           = trap_S_RegisterSound("sound/feedback/voc_youlose.wav", qfalse);
;802:
;803:	cgs.media.wstbimplSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpl.wav", qfalse);
;804:	cgs.media.wstbimpmSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpm.wav", qfalse);
;805:	cgs.media.wstbimpdSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbimpd.wav", qfalse);
;806:	cgs.media.wstbactvSound = trap_S_RegisterSound("sound/weapons/proxmine/wstbactv.wav", qfalse);
;807:#endif
;808:
;809:	cgs.media.regenSound    = trap_S_RegisterSound("sound/items/regen.wav", qfalse);
ADDRGP4 $581
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 540
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+940
ADDRLP4 540
INDIRI4
ASGNI4
line 810
;810:	cgs.media.protectSound  = trap_S_RegisterSound("sound/items/protect3.wav", qfalse);
ADDRGP4 $584
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 544
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+944
ADDRLP4 544
INDIRI4
ASGNI4
line 811
;811:	cgs.media.n_healthSound = trap_S_RegisterSound("sound/items/n_health.wav", qfalse);
ADDRGP4 $587
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 548
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+948
ADDRLP4 548
INDIRI4
ASGNI4
line 812
;812:	cgs.media.hgrenb1aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb1a.wav", qfalse);
ADDRGP4 $590
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 552
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+952
ADDRLP4 552
INDIRI4
ASGNI4
line 813
;813:	cgs.media.hgrenb2aSound = trap_S_RegisterSound("sound/weapons/grenade/hgrenb2a.wav", qfalse);
ADDRGP4 $593
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 556
ADDRGP4 trap_S_RegisterSound
CALLI4
ASGNI4
ADDRGP4 cgs+148692+956
ADDRLP4 556
INDIRI4
ASGNI4
line 842
;814:
;815:#ifdef MISSIONPACK
;816:	trap_S_RegisterSound("sound/player/james/death1.wav", qfalse);
;817:	trap_S_RegisterSound("sound/player/james/death2.wav", qfalse);
;818:	trap_S_RegisterSound("sound/player/james/death3.wav", qfalse);
;819:	trap_S_RegisterSound("sound/player/james/jump1.wav", qfalse);
;820:	trap_S_RegisterSound("sound/player/james/pain25_1.wav", qfalse);
;821:	trap_S_RegisterSound("sound/player/james/pain75_1.wav", qfalse);
;822:	trap_S_RegisterSound("sound/player/james/pain100_1.wav", qfalse);
;823:	trap_S_RegisterSound("sound/player/james/falling1.wav", qfalse);
;824:	trap_S_RegisterSound("sound/player/james/gasp.wav", qfalse);
;825:	trap_S_RegisterSound("sound/player/james/drown.wav", qfalse);
;826:	trap_S_RegisterSound("sound/player/james/fall1.wav", qfalse);
;827:	trap_S_RegisterSound("sound/player/james/taunt.wav", qfalse);
;828:
;829:	trap_S_RegisterSound("sound/player/janet/death1.wav", qfalse);
;830:	trap_S_RegisterSound("sound/player/janet/death2.wav", qfalse);
;831:	trap_S_RegisterSound("sound/player/janet/death3.wav", qfalse);
;832:	trap_S_RegisterSound("sound/player/janet/jump1.wav", qfalse);
;833:	trap_S_RegisterSound("sound/player/janet/pain25_1.wav", qfalse);
;834:	trap_S_RegisterSound("sound/player/janet/pain75_1.wav", qfalse);
;835:	trap_S_RegisterSound("sound/player/janet/pain100_1.wav", qfalse);
;836:	trap_S_RegisterSound("sound/player/janet/falling1.wav", qfalse);
;837:	trap_S_RegisterSound("sound/player/janet/gasp.wav", qfalse);
;838:	trap_S_RegisterSound("sound/player/janet/drown.wav", qfalse);
;839:	trap_S_RegisterSound("sound/player/janet/fall1.wav", qfalse);
;840:	trap_S_RegisterSound("sound/player/janet/taunt.wav", qfalse);
;841:#endif
;842:}
LABELV $306
endproc CG_RegisterSounds 560 16
data
align 4
LABELV $595
address $596
address $597
address $598
address $599
address $600
address $601
address $602
address $603
address $604
address $605
address $606
code
proc CG_RegisterGraphics 580 16
line 853
;843:
;844://===================================================================================
;845:
;846:/*
;847:=================
;848:CG_RegisterGraphics
;849:
;850:This function may execute for a couple of minutes with a slow disk.
;851:=================
;852:*/
;853:static void CG_RegisterGraphics(void) {
line 863
;854:	int          i;
;855:	char         items[MAX_ITEMS + 1];
;856:	static char* sb_nums[11] = {
;857:		"gfx/2d/numbers/zero_32b",  "gfx/2d/numbers/one_32b",  "gfx/2d/numbers/two_32b",   "gfx/2d/numbers/three_32b",
;858:		"gfx/2d/numbers/four_32b",  "gfx/2d/numbers/five_32b", "gfx/2d/numbers/six_32b",   "gfx/2d/numbers/seven_32b",
;859:		"gfx/2d/numbers/eight_32b", "gfx/2d/numbers/nine_32b", "gfx/2d/numbers/minus_32b",
;860:	};
;861:
;862:	// clear any references to old media
;863:	memset(&cg.refdef, 0, sizeof(cg.refdef));
ADDRGP4 cg+109056
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 864
;864:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 866
;865:
;866:	CG_LoadingString(cgs.mapname);
ADDRGP4 cgs+31508
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 868
;867:
;868:	trap_R_LoadWorldMap(cgs.mapname);
ADDRGP4 cgs+31508
ARGP4
ADDRGP4 trap_R_LoadWorldMap
CALLV
pop
line 871
;869:
;870:	// precache status bar pics
;871:	CG_LoadingString("game media");
ADDRGP4 $611
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 873
;872:
;873:	for (i = 0; i < ARRAY_LEN(sb_nums); i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $615
JUMPV
LABELV $612
line 874
;874:		cgs.media.numberShaders[i] = trap_R_RegisterShader(sb_nums[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $595
ADDP4
INDIRP4
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+300
ADDP4
ADDRLP4 268
INDIRI4
ASGNI4
line 875
;875:	}
LABELV $613
line 873
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $615
ADDRLP4 0
INDIRI4
CVIU4 4
CNSTU4 11
LTU4 $612
line 877
;876:
;877:	cgs.media.botSkillShaders[0] = trap_R_RegisterShader("menu/art/skill1.tga");
ADDRGP4 $620
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+348
ADDRLP4 264
INDIRI4
ASGNI4
line 878
;878:	cgs.media.botSkillShaders[1] = trap_R_RegisterShader("menu/art/skill2.tga");
ADDRGP4 $624
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+348+4
ADDRLP4 268
INDIRI4
ASGNI4
line 879
;879:	cgs.media.botSkillShaders[2] = trap_R_RegisterShader("menu/art/skill3.tga");
ADDRGP4 $628
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+348+8
ADDRLP4 272
INDIRI4
ASGNI4
line 880
;880:	cgs.media.botSkillShaders[3] = trap_R_RegisterShader("menu/art/skill4.tga");
ADDRGP4 $632
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+348+12
ADDRLP4 276
INDIRI4
ASGNI4
line 881
;881:	cgs.media.botSkillShaders[4] = trap_R_RegisterShader("menu/art/skill5.tga");
ADDRGP4 $636
ARGP4
ADDRLP4 280
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+348+16
ADDRLP4 280
INDIRI4
ASGNI4
line 883
;882:
;883:	cgs.media.viewBloodShader = trap_R_RegisterShader("viewBloodBlend");
ADDRGP4 $639
ARGP4
ADDRLP4 284
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+216
ADDRLP4 284
INDIRI4
ASGNI4
line 885
;884:
;885:	cgs.media.deferShader = trap_R_RegisterShaderNoMip("gfx/2d/defer.tga");
ADDRGP4 $642
ARGP4
ADDRLP4 288
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+132
ADDRLP4 288
INDIRI4
ASGNI4
line 887
;886:
;887:	cgs.media.scoreboardName  = trap_R_RegisterShaderNoMip("menu/tab/name.tga");
ADDRGP4 $645
ARGP4
ADDRLP4 292
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+476
ADDRLP4 292
INDIRI4
ASGNI4
line 888
;888:	cgs.media.scoreboardPing  = trap_R_RegisterShaderNoMip("menu/tab/ping.tga");
ADDRGP4 $648
ARGP4
ADDRLP4 296
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+480
ADDRLP4 296
INDIRI4
ASGNI4
line 889
;889:	cgs.media.scoreboardScore = trap_R_RegisterShaderNoMip("menu/tab/score.tga");
ADDRGP4 $651
ARGP4
ADDRLP4 300
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+484
ADDRLP4 300
INDIRI4
ASGNI4
line 890
;890:	cgs.media.scoreboardTime  = trap_R_RegisterShaderNoMip("menu/tab/time.tga");
ADDRGP4 $654
ARGP4
ADDRLP4 304
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+488
ADDRLP4 304
INDIRI4
ASGNI4
line 892
;891:
;892:	cgs.media.smokePuffShader        = trap_R_RegisterShader("smokePuff");
ADDRGP4 $657
ARGP4
ADDRLP4 308
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+276
ADDRLP4 308
INDIRI4
ASGNI4
line 893
;893:	cgs.media.smokePuffRageProShader = trap_R_RegisterShader("smokePuffRagePro");
ADDRGP4 $660
ARGP4
ADDRLP4 312
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+280
ADDRLP4 312
INDIRI4
ASGNI4
line 894
;894:	cgs.media.shotgunSmokePuffShader = trap_R_RegisterShader("shotgunSmokePuff");
ADDRGP4 $663
ARGP4
ADDRLP4 316
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+284
ADDRLP4 316
INDIRI4
ASGNI4
line 899
;895:#ifdef MISSIONPACK
;896:	cgs.media.nailPuffShader = trap_R_RegisterShader("nailtrail");
;897:	cgs.media.blueProxMine   = trap_R_RegisterModel("models/weaphits/proxmineb.md3");
;898:#endif
;899:	cgs.media.plasmaBallShader = trap_R_RegisterShader("sprites/plasma1");
ADDRGP4 $666
ARGP4
ADDRLP4 320
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+288
ADDRLP4 320
INDIRI4
ASGNI4
line 900
;900:	cgs.media.bloodTrailShader = trap_R_RegisterShader("bloodTrail");
ADDRGP4 $669
ARGP4
ADDRLP4 324
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+296
ADDRLP4 324
INDIRI4
ASGNI4
line 901
;901:	cgs.media.lagometerShader  = trap_R_RegisterShader("lagometer");
ADDRGP4 $672
ARGP4
ADDRLP4 328
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+264
ADDRLP4 328
INDIRI4
ASGNI4
line 902
;902:	cgs.media.connectionShader = trap_R_RegisterShader("disconnected");
ADDRGP4 $675
ARGP4
ADDRLP4 332
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+208
ADDRLP4 332
INDIRI4
ASGNI4
line 904
;903:
;904:	cgs.media.waterBubbleShader = trap_R_RegisterShader("waterBubble");
ADDRGP4 $678
ARGP4
ADDRLP4 336
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+292
ADDRLP4 336
INDIRI4
ASGNI4
line 906
;905:
;906:	cgs.media.tracerShader = trap_R_RegisterShader("gfx/misc/tracer");
ADDRGP4 $681
ARGP4
ADDRLP4 340
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+220
ADDRLP4 340
INDIRI4
ASGNI4
line 907
;907:	cgs.media.selectShader = trap_R_RegisterShader("gfx/2d/select");
ADDRGP4 $684
ARGP4
ADDRLP4 344
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+212
ADDRLP4 344
INDIRI4
ASGNI4
line 909
;908:
;909:	for (i = 0; i < NUM_CROSSHAIRS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $685
line 910
;910:		cgs.media.crosshairShader[i] = trap_R_RegisterShader(va("gfx/2d/crosshair%c", 'a' + i));
ADDRGP4 $691
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 97
ADDI4
ARGI4
ADDRLP4 352
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 352
INDIRP4
ARGP4
ADDRLP4 356
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+224
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 911
;911:	}
LABELV $686
line 909
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $685
line 913
;912:
;913:	cgs.media.backTileShader = trap_R_RegisterShader("gfx/2d/backtile");
ADDRGP4 $694
ARGP4
ADDRLP4 348
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+268
ADDRLP4 348
INDIRI4
ASGNI4
line 914
;914:	cgs.media.noammoShader   = trap_R_RegisterShader("icons/noammo");
ADDRGP4 $697
ARGP4
ADDRLP4 352
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+272
ADDRLP4 352
INDIRI4
ASGNI4
line 917
;915:
;916:	// powerup shaders
;917:	cgs.media.quadShader         = trap_R_RegisterShader("powerups/quad");
ADDRGP4 $700
ARGP4
ADDRLP4 356
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+392
ADDRLP4 356
INDIRI4
ASGNI4
line 918
;918:	cgs.media.quadWeaponShader   = trap_R_RegisterShader("powerups/quadWeapon");
ADDRGP4 $703
ARGP4
ADDRLP4 360
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+400
ADDRLP4 360
INDIRI4
ASGNI4
line 919
;919:	cgs.media.battleSuitShader   = trap_R_RegisterShader("powerups/battleSuit");
ADDRGP4 $706
ARGP4
ADDRLP4 364
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+412
ADDRLP4 364
INDIRI4
ASGNI4
line 920
;920:	cgs.media.battleWeaponShader = trap_R_RegisterShader("powerups/battleWeapon");
ADDRGP4 $709
ARGP4
ADDRLP4 368
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+416
ADDRLP4 368
INDIRI4
ASGNI4
line 921
;921:	cgs.media.invisShader        = trap_R_RegisterShader("powerups/invisibility");
ADDRGP4 $712
ARGP4
ADDRLP4 372
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+404
ADDRLP4 372
INDIRI4
ASGNI4
line 922
;922:	cgs.media.regenShader        = trap_R_RegisterShader("powerups/regen");
ADDRGP4 $715
ARGP4
ADDRLP4 376
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+408
ADDRLP4 376
INDIRI4
ASGNI4
line 923
;923:	cgs.media.hastePuffShader    = trap_R_RegisterShader("hasteSmokePuff");
ADDRGP4 $718
ARGP4
ADDRLP4 380
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+420
ADDRLP4 380
INDIRI4
ASGNI4
line 928
;924:
;925:#ifdef MISSIONPACK
;926:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer) {
;927:#else
;928:	if (cgs.gametype == GT_CTF || cg_buildScript.integer) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
EQI4 $723
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $719
LABELV $723
line 930
;929:#endif
;930:		cgs.media.redCubeModel  = trap_R_RegisterModel("models/powerups/orb/r_orb.md3");
ADDRGP4 $726
ARGP4
ADDRLP4 384
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+20
ADDRLP4 384
INDIRI4
ASGNI4
line 931
;931:		cgs.media.blueCubeModel = trap_R_RegisterModel("models/powerups/orb/b_orb.md3");
ADDRGP4 $729
ARGP4
ADDRLP4 388
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+24
ADDRLP4 388
INDIRI4
ASGNI4
line 932
;932:		cgs.media.redCubeIcon   = trap_R_RegisterShader("icons/skull_red");
ADDRGP4 $732
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+28
ADDRLP4 392
INDIRI4
ASGNI4
line 933
;933:		cgs.media.blueCubeIcon  = trap_R_RegisterShader("icons/skull_blue");
ADDRGP4 $735
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+32
ADDRLP4 396
INDIRI4
ASGNI4
line 934
;934:	}
LABELV $719
line 939
;935:
;936:#ifdef MISSIONPACK
;937:	if (cgs.gametype == GT_CTF || cgs.gametype == GT_1FCTF || cgs.gametype == GT_HARVESTER || cg_buildScript.integer) {
;938:#else
;939:	if (cgs.gametype == GT_CTF || cg_buildScript.integer) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
EQI4 $740
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $736
LABELV $740
line 941
;940:#endif
;941:		cgs.media.redFlagModel      = trap_R_RegisterModel("models/flags/r_flag.md3");
ADDRGP4 $743
ARGP4
ADDRLP4 384
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+36
ADDRLP4 384
INDIRI4
ASGNI4
line 942
;942:		cgs.media.blueFlagModel     = trap_R_RegisterModel("models/flags/b_flag.md3");
ADDRGP4 $746
ARGP4
ADDRLP4 388
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+40
ADDRLP4 388
INDIRI4
ASGNI4
line 943
;943:		cgs.media.redFlagShader[0]  = trap_R_RegisterShaderNoMip("icons/iconf_red1");
ADDRGP4 $749
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+48
ADDRLP4 392
INDIRI4
ASGNI4
line 944
;944:		cgs.media.redFlagShader[1]  = trap_R_RegisterShaderNoMip("icons/iconf_red2");
ADDRGP4 $753
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+48+4
ADDRLP4 396
INDIRI4
ASGNI4
line 945
;945:		cgs.media.redFlagShader[2]  = trap_R_RegisterShaderNoMip("icons/iconf_red3");
ADDRGP4 $757
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+48+8
ADDRLP4 400
INDIRI4
ASGNI4
line 946
;946:		cgs.media.blueFlagShader[0] = trap_R_RegisterShaderNoMip("icons/iconf_blu1");
ADDRGP4 $760
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+60
ADDRLP4 404
INDIRI4
ASGNI4
line 947
;947:		cgs.media.blueFlagShader[1] = trap_R_RegisterShaderNoMip("icons/iconf_blu2");
ADDRGP4 $764
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+60+4
ADDRLP4 408
INDIRI4
ASGNI4
line 948
;948:		cgs.media.blueFlagShader[2] = trap_R_RegisterShaderNoMip("icons/iconf_blu3");
ADDRGP4 $768
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+60+8
ADDRLP4 412
INDIRI4
ASGNI4
line 950
;949:
;950:		cgs.media.flagPoleModel = trap_R_RegisterModel("models/flag2/flagpole.md3");
ADDRGP4 $771
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+88
ADDRLP4 416
INDIRI4
ASGNI4
line 951
;951:		cgs.media.flagFlapModel = trap_R_RegisterModel("models/flag2/flagflap3.md3");
ADDRGP4 $774
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+92
ADDRLP4 420
INDIRI4
ASGNI4
line 953
;952:
;953:		cgs.media.redFlagFlapSkin     = trap_R_RegisterSkin("models/flag2/red.skin");
ADDRGP4 $777
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+148692+96
ADDRLP4 424
INDIRI4
ASGNI4
line 954
;954:		cgs.media.blueFlagFlapSkin    = trap_R_RegisterSkin("models/flag2/blue.skin");
ADDRGP4 $780
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+148692+100
ADDRLP4 428
INDIRI4
ASGNI4
line 955
;955:		cgs.media.neutralFlagFlapSkin = trap_R_RegisterSkin("models/flag2/white.skin");
ADDRGP4 $783
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterSkin
CALLI4
ASGNI4
ADDRGP4 cgs+148692+104
ADDRLP4 432
INDIRI4
ASGNI4
line 961
;956:#ifdef MISSIONPACK
;957:		cgs.media.redFlagBaseModel     = trap_R_RegisterModel("models/mapobjects/flagbase/red_base.md3");
;958:		cgs.media.blueFlagBaseModel    = trap_R_RegisterModel("models/mapobjects/flagbase/blue_base.md3");
;959:		cgs.media.neutralFlagBaseModel = trap_R_RegisterModel("models/mapobjects/flagbase/ntrl_base.md3");
;960:#endif
;961:	}
LABELV $736
line 990
;962:
;963:#ifdef MISSIONPACK
;964:	if (cgs.gametype == GT_1FCTF || cg_buildScript.integer) {
;965:		cgs.media.neutralFlagModel = trap_R_RegisterModel("models/flags/n_flag.md3");
;966:		cgs.media.flagShader[0]    = trap_R_RegisterShaderNoMip("icons/iconf_neutral1");
;967:		cgs.media.flagShader[1]    = trap_R_RegisterShaderNoMip("icons/iconf_red2");
;968:		cgs.media.flagShader[2]    = trap_R_RegisterShaderNoMip("icons/iconf_blu2");
;969:		cgs.media.flagShader[3]    = trap_R_RegisterShaderNoMip("icons/iconf_neutral3");
;970:	}
;971:
;972:	if (cgs.gametype == GT_OBELISK || cg_buildScript.integer) {
;973:		cgs.media.overloadBaseModel   = trap_R_RegisterModel("models/powerups/overload_base.md3");
;974:		cgs.media.overloadTargetModel = trap_R_RegisterModel("models/powerups/overload_target.md3");
;975:		cgs.media.overloadLightsModel = trap_R_RegisterModel("models/powerups/overload_lights.md3");
;976:		cgs.media.overloadEnergyModel = trap_R_RegisterModel("models/powerups/overload_energy.md3");
;977:	}
;978:
;979:	if (cgs.gametype == GT_HARVESTER || cg_buildScript.integer) {
;980:		cgs.media.harvesterModel        = trap_R_RegisterModel("models/powerups/harvester/harvester.md3");
;981:		cgs.media.harvesterRedSkin      = trap_R_RegisterSkin("models/powerups/harvester/red.skin");
;982:		cgs.media.harvesterBlueSkin     = trap_R_RegisterSkin("models/powerups/harvester/blue.skin");
;983:		cgs.media.harvesterNeutralModel = trap_R_RegisterModel("models/powerups/obelisk/obelisk.md3");
;984:	}
;985:
;986:	cgs.media.redKamikazeShader = trap_R_RegisterShader("models/weaphits/kamikred");
;987:	cgs.media.dustPuffShader    = trap_R_RegisterShader("hasteSmokePuff");
;988:#endif
;989:
;990:	if (cgs.gametype >= GT_TEAM || cg_buildScript.integer) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
GEI4 $788
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $784
LABELV $788
line 991
;991:		cgs.media.friendShader  = trap_R_RegisterShader("sprites/foe");
ADDRGP4 $791
ARGP4
ADDRLP4 384
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+200
ADDRLP4 384
INDIRI4
ASGNI4
line 992
;992:		cgs.media.redQuadShader = trap_R_RegisterShader("powerups/blueflag");
ADDRGP4 $794
ARGP4
ADDRLP4 388
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+396
ADDRLP4 388
INDIRI4
ASGNI4
line 993
;993:		cgs.media.teamStatusBar = trap_R_RegisterShader("gfx/2d/colorbar.tga");
ADDRGP4 $797
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+128
ADDRLP4 392
INDIRI4
ASGNI4
line 997
;994:#ifdef MISSIONPACK
;995:		cgs.media.blueKamikazeShader = trap_R_RegisterShader("models/weaphits/kamikblu");
;996:#endif
;997:	}
LABELV $784
line 999
;998:
;999:	cgs.media.armorModel = trap_R_RegisterModel("models/powerups/armor/armor_yel.md3");
ADDRGP4 $800
ARGP4
ADDRLP4 384
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+120
ADDRLP4 384
INDIRI4
ASGNI4
line 1000
;1000:	cgs.media.armorIcon  = trap_R_RegisterShaderNoMip("icons/iconr_yellow");
ADDRGP4 $803
ARGP4
ADDRLP4 388
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+124
ADDRLP4 388
INDIRI4
ASGNI4
line 1002
;1001:
;1002:	cgs.media.machinegunBrassModel = trap_R_RegisterModel("models/weapons2/shells/m_shell.md3");
ADDRGP4 $806
ARGP4
ADDRLP4 392
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+180
ADDRLP4 392
INDIRI4
ASGNI4
line 1003
;1003:	cgs.media.shotgunBrassModel    = trap_R_RegisterModel("models/weapons2/shells/s_shell.md3");
ADDRGP4 $809
ARGP4
ADDRLP4 396
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+184
ADDRLP4 396
INDIRI4
ASGNI4
line 1005
;1004:
;1005:	cgs.media.gibAbdomen   = trap_R_RegisterModel("models/gibs/abdomen.md3");
ADDRGP4 $812
ARGP4
ADDRLP4 400
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+136
ADDRLP4 400
INDIRI4
ASGNI4
line 1006
;1006:	cgs.media.gibArm       = trap_R_RegisterModel("models/gibs/arm.md3");
ADDRGP4 $815
ARGP4
ADDRLP4 404
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+140
ADDRLP4 404
INDIRI4
ASGNI4
line 1007
;1007:	cgs.media.gibChest     = trap_R_RegisterModel("models/gibs/chest.md3");
ADDRGP4 $818
ARGP4
ADDRLP4 408
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+144
ADDRLP4 408
INDIRI4
ASGNI4
line 1008
;1008:	cgs.media.gibFist      = trap_R_RegisterModel("models/gibs/fist.md3");
ADDRGP4 $821
ARGP4
ADDRLP4 412
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+148
ADDRLP4 412
INDIRI4
ASGNI4
line 1009
;1009:	cgs.media.gibFoot      = trap_R_RegisterModel("models/gibs/foot.md3");
ADDRGP4 $824
ARGP4
ADDRLP4 416
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+152
ADDRLP4 416
INDIRI4
ASGNI4
line 1010
;1010:	cgs.media.gibForearm   = trap_R_RegisterModel("models/gibs/forearm.md3");
ADDRGP4 $827
ARGP4
ADDRLP4 420
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+156
ADDRLP4 420
INDIRI4
ASGNI4
line 1011
;1011:	cgs.media.gibIntestine = trap_R_RegisterModel("models/gibs/intestine.md3");
ADDRGP4 $830
ARGP4
ADDRLP4 424
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+160
ADDRLP4 424
INDIRI4
ASGNI4
line 1012
;1012:	cgs.media.gibLeg       = trap_R_RegisterModel("models/gibs/leg.md3");
ADDRGP4 $833
ARGP4
ADDRLP4 428
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+164
ADDRLP4 428
INDIRI4
ASGNI4
line 1013
;1013:	cgs.media.gibSkull     = trap_R_RegisterModel("models/gibs/skull.md3");
ADDRGP4 $836
ARGP4
ADDRLP4 432
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+168
ADDRLP4 432
INDIRI4
ASGNI4
line 1014
;1014:	cgs.media.gibBrain     = trap_R_RegisterModel("models/gibs/brain.md3");
ADDRGP4 $839
ARGP4
ADDRLP4 436
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+172
ADDRLP4 436
INDIRI4
ASGNI4
line 1016
;1015:
;1016:	cgs.media.smoke2 = trap_R_RegisterModel("models/weapons2/shells/s_shell.md3");
ADDRGP4 $809
ARGP4
ADDRLP4 440
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+176
ADDRLP4 440
INDIRI4
ASGNI4
line 1018
;1017:
;1018:	cgs.media.balloonShader = trap_R_RegisterShader("sprites/balloon3");
ADDRGP4 $844
ARGP4
ADDRLP4 444
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+204
ADDRLP4 444
INDIRI4
ASGNI4
line 1020
;1019:
;1020:	cgs.media.bloodExplosionShader = trap_R_RegisterShader("bloodExplosion");
ADDRGP4 $847
ARGP4
ADDRLP4 448
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+464
ADDRLP4 448
INDIRI4
ASGNI4
line 1022
;1021:
;1022:	cgs.media.bulletFlashModel = trap_R_RegisterModel("models/weaphits/bullet.md3");
ADDRGP4 $850
ARGP4
ADDRLP4 452
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+424
ADDRLP4 452
INDIRI4
ASGNI4
line 1023
;1023:	cgs.media.ringFlashModel   = trap_R_RegisterModel("models/weaphits/ring02.md3");
ADDRGP4 $853
ARGP4
ADDRLP4 456
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+428
ADDRLP4 456
INDIRI4
ASGNI4
line 1024
;1024:	cgs.media.dishFlashModel   = trap_R_RegisterModel("models/weaphits/boom01.md3");
ADDRGP4 $856
ARGP4
ADDRLP4 460
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+432
ADDRLP4 460
INDIRI4
ASGNI4
line 1028
;1025:#ifdef MISSIONPACK
;1026:	cgs.media.teleportEffectModel = trap_R_RegisterModel("models/powerups/pop.md3");
;1027:#else
;1028:	cgs.media.teleportEffectModel  = trap_R_RegisterModel("models/misc/telep.md3");
ADDRGP4 $859
ARGP4
ADDRLP4 464
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRGP4 cgs+148692+468
ADDRLP4 464
INDIRI4
ASGNI4
line 1029
;1029:	cgs.media.teleportEffectShader = trap_R_RegisterShader("teleportEffect");
ADDRGP4 $862
ARGP4
ADDRLP4 468
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+472
ADDRLP4 468
INDIRI4
ASGNI4
line 1047
;1030:#endif
;1031:#ifdef MISSIONPACK
;1032:	cgs.media.kamikazeEffectModel         = trap_R_RegisterModel("models/weaphits/kamboom2.md3");
;1033:	cgs.media.kamikazeShockWave           = trap_R_RegisterModel("models/weaphits/kamwave.md3");
;1034:	cgs.media.kamikazeHeadModel           = trap_R_RegisterModel("models/powerups/kamikazi.md3");
;1035:	cgs.media.kamikazeHeadTrail           = trap_R_RegisterModel("models/powerups/trailtest.md3");
;1036:	cgs.media.guardPowerupModel           = trap_R_RegisterModel("models/powerups/guard_player.md3");
;1037:	cgs.media.scoutPowerupModel           = trap_R_RegisterModel("models/powerups/scout_player.md3");
;1038:	cgs.media.doublerPowerupModel         = trap_R_RegisterModel("models/powerups/doubler_player.md3");
;1039:	cgs.media.ammoRegenPowerupModel       = trap_R_RegisterModel("models/powerups/ammo_player.md3");
;1040:	cgs.media.invulnerabilityImpactModel  = trap_R_RegisterModel("models/powerups/shield/impact.md3");
;1041:	cgs.media.invulnerabilityJuicedModel  = trap_R_RegisterModel("models/powerups/shield/juicer.md3");
;1042:	cgs.media.medkitUsageModel            = trap_R_RegisterModel("models/powerups/regen.md3");
;1043:	cgs.media.heartShader                 = trap_R_RegisterShaderNoMip("ui/assets/statusbar/selectedhealth.tga");
;1044:	cgs.media.invulnerabilityPowerupModel = trap_R_RegisterModel("models/powerups/shield/shield.md3");
;1045:#endif
;1046:
;1047:	cgs.media.medalImpressive = trap_R_RegisterShaderNoMip("medal_impressive");
ADDRGP4 $865
ARGP4
ADDRLP4 472
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+492
ADDRLP4 472
INDIRI4
ASGNI4
line 1048
;1048:	cgs.media.medalExcellent  = trap_R_RegisterShaderNoMip("medal_excellent");
ADDRGP4 $868
ARGP4
ADDRLP4 476
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+496
ADDRLP4 476
INDIRI4
ASGNI4
line 1049
;1049:	cgs.media.medalGauntlet   = trap_R_RegisterShaderNoMip("medal_gauntlet");
ADDRGP4 $871
ARGP4
ADDRLP4 480
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+500
ADDRLP4 480
INDIRI4
ASGNI4
line 1050
;1050:	cgs.media.medalDefend     = trap_R_RegisterShaderNoMip("medal_defend");
ADDRGP4 $874
ARGP4
ADDRLP4 484
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+504
ADDRLP4 484
INDIRI4
ASGNI4
line 1051
;1051:	cgs.media.medalAssist     = trap_R_RegisterShaderNoMip("medal_assist");
ADDRGP4 $877
ARGP4
ADDRLP4 488
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+508
ADDRLP4 488
INDIRI4
ASGNI4
line 1052
;1052:	cgs.media.medalCapture    = trap_R_RegisterShaderNoMip("medal_capture");
ADDRGP4 $880
ARGP4
ADDRLP4 492
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+512
ADDRLP4 492
INDIRI4
ASGNI4
line 1054
;1053:
;1054:	memset(cg_items, 0, sizeof(cg_items));
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7168
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1055
;1055:	memset(cg_weapons, 0, sizeof(cg_weapons));
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1058
;1056:
;1057:	// only register the items that the server says we need
;1058:	Q_strncpyz(items, CG_ConfigString(CS_ITEMS), sizeof(items));
CNSTI4 27
ARGI4
ADDRLP4 496
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 496
INDIRP4
ARGP4
CNSTI4 257
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1060
;1059:
;1060:	for (i = 1; i < bg_numItems; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $884
JUMPV
LABELV $881
line 1061
;1061:		if (items[i] == '1' || cg_buildScript.integer) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
CNSTI4 49
EQI4 $888
ADDRGP4 cg_buildScript+12
INDIRI4
CNSTI4 0
EQI4 $885
LABELV $888
line 1062
;1062:			CG_LoadingItem(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingItem
CALLV
pop
line 1063
;1063:			CG_RegisterItemVisuals(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1064
;1064:		}
LABELV $885
line 1065
;1065:	}
LABELV $882
line 1060
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $884
ADDRLP4 0
INDIRI4
ADDRGP4 bg_numItems
INDIRI4
LTI4 $881
line 1067
;1066:
;1067:	cg.skipDFshaders = qfalse;
ADDRGP4 cg+149088
CNSTI4 0
ASGNI4
line 1070
;1068:
;1069:	// wall marks
;1070:	cgs.media.bulletMarkShader = trap_R_RegisterShader("gfx/damage/bullet_mrk");
ADDRGP4 $892
ARGP4
ADDRLP4 500
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+376
ADDRLP4 500
INDIRI4
ASGNI4
line 1071
;1071:	cgs.media.burnMarkShader   = trap_R_RegisterShader("gfx/damage/burn_med_mrk");
ADDRGP4 $895
ARGP4
ADDRLP4 504
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+380
ADDRLP4 504
INDIRI4
ASGNI4
line 1072
;1072:	cgs.media.holeMarkShader   = trap_R_RegisterShader("gfx/damage/hole_lg_mrk");
ADDRGP4 $898
ARGP4
ADDRLP4 508
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+384
ADDRLP4 508
INDIRI4
ASGNI4
line 1073
;1073:	cgs.media.energyMarkShader = trap_R_RegisterShader("gfx/damage/plasma_mrk");
ADDRGP4 $901
ARGP4
ADDRLP4 512
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+388
ADDRLP4 512
INDIRI4
ASGNI4
line 1074
;1074:	cgs.media.shadowMarkShader = trap_R_RegisterShader("markShadow");
ADDRGP4 $904
ARGP4
ADDRLP4 516
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+344
ADDRLP4 516
INDIRI4
ASGNI4
line 1075
;1075:	cgs.media.wakeMarkShader   = trap_R_RegisterShader("wake");
ADDRGP4 $907
ARGP4
ADDRLP4 520
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+368
ADDRLP4 520
INDIRI4
ASGNI4
line 1076
;1076:	cgs.media.bloodMarkShader  = trap_R_RegisterShader("bloodMark");
ADDRGP4 $910
ARGP4
ADDRLP4 524
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+372
ADDRLP4 524
INDIRI4
ASGNI4
line 1079
;1077:
;1078:	// register the inline models
;1079:	cgs.numInlineModels = trap_CM_NumInlineModels();
ADDRLP4 528
ADDRGP4 trap_CM_NumInlineModels
CALLI4
ASGNI4
ADDRGP4 cgs+36896
ADDRLP4 528
INDIRI4
ASGNI4
line 1080
;1080:	for (i = 1; i < cgs.numInlineModels; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $915
JUMPV
LABELV $912
line 1085
;1081:		char   name[10];
;1082:		vec3_t mins, maxs;
;1083:		int    j;
;1084:
;1085:		Com_sprintf(name, sizeof(name), "*%i", i);
ADDRLP4 560
ARGP4
CNSTI4 10
ARGI4
ADDRGP4 $917
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1086
;1086:		cgs.inlineDrawModel[i] = trap_R_RegisterModel(name);
ADDRLP4 560
ARGP4
ADDRLP4 572
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36900
ADDP4
ADDRLP4 572
INDIRI4
ASGNI4
line 1087
;1087:		trap_R_ModelBounds(cgs.inlineDrawModel[i], mins, maxs);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+36900
ADDP4
INDIRI4
ARGI4
ADDRLP4 536
ARGP4
ADDRLP4 548
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 1088
;1088:		for (j = 0; j < 3; j++) {
ADDRLP4 532
CNSTI4 0
ASGNI4
LABELV $920
line 1089
;1089:			cgs.inlineModelMidpoints[i][j] = mins[j] + 0.5 * (maxs[j] - mins[j]);
ADDRLP4 532
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 cgs+37924
ADDP4
ADDP4
ADDRLP4 532
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 536
ADDP4
INDIRF4
ADDRLP4 532
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 548
ADDP4
INDIRF4
ADDRLP4 532
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 536
ADDP4
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ADDF4
ASGNF4
line 1090
;1090:		}
LABELV $921
line 1088
ADDRLP4 532
ADDRLP4 532
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 532
INDIRI4
CNSTI4 3
LTI4 $920
line 1091
;1091:	}
LABELV $913
line 1080
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $915
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+36896
INDIRI4
LTI4 $912
line 1094
;1092:
;1093:	// register all the server specified models
;1094:	for (i = 1; i < MAX_MODELS; i++) {
ADDRLP4 0
CNSTI4 1
ASGNI4
LABELV $925
line 1097
;1095:		const char* modelName;
;1096:
;1097:		modelName = CG_ConfigString(CS_MODELS + i);
ADDRLP4 0
INDIRI4
CNSTI4 32
ADDI4
ARGI4
ADDRLP4 536
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 532
ADDRLP4 536
INDIRP4
ASGNP4
line 1098
;1098:		if (!modelName[0]) {
ADDRLP4 532
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $929
line 1099
;1099:			break;
ADDRGP4 $927
JUMPV
LABELV $929
line 1101
;1100:		}
;1101:		cgs.gameModels[i] = trap_R_RegisterModel(modelName);
ADDRLP4 532
INDIRP4
ARGP4
ADDRLP4 540
ADDRGP4 trap_R_RegisterModel
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+34848
ADDP4
ADDRLP4 540
INDIRI4
ASGNI4
line 1102
;1102:	}
LABELV $926
line 1094
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 256
LTI4 $925
LABELV $927
line 1104
;1103:
;1104:	cgs.media.cursor = trap_R_RegisterShaderNoMip("menu/art/3_cursor2");
ADDRGP4 $934
ARGP4
ADDRLP4 532
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+936
ADDRLP4 532
INDIRI4
ASGNI4
line 1130
;1105:#ifdef MISSIONPACK
;1106:	// new stuff
;1107:	cgs.media.patrolShader     = trap_R_RegisterShaderNoMip("ui/assets/statusbar/patrol.tga");
;1108:	cgs.media.assaultShader    = trap_R_RegisterShaderNoMip("ui/assets/statusbar/assault.tga");
;1109:	cgs.media.campShader       = trap_R_RegisterShaderNoMip("ui/assets/statusbar/camp.tga");
;1110:	cgs.media.followShader     = trap_R_RegisterShaderNoMip("ui/assets/statusbar/follow.tga");
;1111:	cgs.media.defendShader     = trap_R_RegisterShaderNoMip("ui/assets/statusbar/defend.tga");
;1112:	cgs.media.teamLeaderShader = trap_R_RegisterShaderNoMip("ui/assets/statusbar/team_leader.tga");
;1113:	cgs.media.retrieveShader   = trap_R_RegisterShaderNoMip("ui/assets/statusbar/retrieve.tga");
;1114:	cgs.media.escortShader     = trap_R_RegisterShaderNoMip("ui/assets/statusbar/escort.tga");
;1115:	cgs.media.sizeCursor       = trap_R_RegisterShaderNoMip("ui/assets/sizecursor.tga");
;1116:	cgs.media.selectCursor     = trap_R_RegisterShaderNoMip("ui/assets/selectcursor.tga");
;1117:	cgs.media.flagShaders[0]   = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_in_base.tga");
;1118:	cgs.media.flagShaders[1]   = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_capture.tga");
;1119:	cgs.media.flagShaders[2]   = trap_R_RegisterShaderNoMip("ui/assets/statusbar/flag_missing.tga");
;1120:
;1121:	trap_R_RegisterModel("models/players/james/lower.md3");
;1122:	trap_R_RegisterModel("models/players/james/upper.md3");
;1123:	trap_R_RegisterModel("models/players/heads/james/james.md3");
;1124:
;1125:	trap_R_RegisterModel("models/players/janet/lower.md3");
;1126:	trap_R_RegisterModel("models/players/janet/upper.md3");
;1127:	trap_R_RegisterModel("models/players/heads/janet/janet.md3");
;1128:
;1129:#endif
;1130:	CG_ClearParticles();
ADDRGP4 CG_ClearParticles
CALLV
pop
line 1143
;1131:	/*
;1132:	    for (i=1; i<MAX_PARTICLES_AREAS; i++)
;1133:	    {
;1134:	        {
;1135:	            int rval;
;1136:
;1137:	            rval = CG_NewParticleArea ( CS_PARTICLES + i);
;1138:	            if (!rval)
;1139:	                break;
;1140:	        }
;1141:	    }
;1142:	*/
;1143:}
LABELV $594
endproc CG_RegisterGraphics 580 16
export CG_BuildSpectatorString
proc CG_BuildSpectatorString 12 12
line 1151
;1144:
;1145:/*
;1146:=======================
;1147:CG_BuildSpectatorString
;1148:
;1149:=======================
;1150:*/
;1151:void CG_BuildSpectatorString(void) {
line 1153
;1152:	int i;
;1153:	cg.spectatorList[0] = 0;
ADDRGP4 cg+115436
CNSTI1 0
ASGNI1
line 1154
;1154:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $937
line 1155
;1155:		if (cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_SPECTATOR) {
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $941
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 3
NEI4 $941
line 1156
;1156:			Q_strcat(cg.spectatorList, sizeof(cg.spectatorList), va("%s     ", cgs.clientinfo[i].name));
ADDRGP4 $948
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+4
ADDP4
ARGP4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRGP4 cg+115436
ARGP4
CNSTI4 1024
ARGI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 Q_strcat
CALLV
pop
line 1157
;1157:		}
LABELV $941
line 1158
;1158:	}
LABELV $938
line 1154
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $937
line 1159
;1159:	i = strlen(cg.spectatorList);
ADDRGP4 cg+115436
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1160
;1160:	if (i != cg.spectatorLen) {
ADDRLP4 0
INDIRI4
ADDRGP4 cg+116460
INDIRI4
EQI4 $952
line 1161
;1161:		cg.spectatorLen   = i;
ADDRGP4 cg+116460
ADDRLP4 0
INDIRI4
ASGNI4
line 1162
;1162:		cg.spectatorWidth = -1;
ADDRGP4 cg+116464
CNSTF4 3212836864
ASGNF4
line 1163
;1163:	}
LABELV $952
line 1164
;1164:}
LABELV $935
endproc CG_BuildSpectatorString 12 12
proc CG_RegisterClients 12 4
line 1171
;1165:
;1166:/*
;1167:===================
;1168:CG_RegisterClients
;1169:===================
;1170:*/
;1171:static void CG_RegisterClients(void) {
line 1174
;1172:	int i;
;1173:
;1174:	CG_LoadingClient(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1175
;1175:	CG_NewClientInfo(cg.clientNum);
ADDRGP4 cg+4
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1177
;1176:
;1177:	for (i = 0; i < MAX_CLIENTS; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $960
line 1180
;1178:		const char* clientInfo;
;1179:
;1180:		if (cg.clientNum == i) {
ADDRGP4 cg+4
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $964
line 1181
;1181:			continue;
ADDRGP4 $961
JUMPV
LABELV $964
line 1184
;1182:		}
;1183:
;1184:		clientInfo = CG_ConfigString(CS_PLAYERS + i);
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 8
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 1185
;1185:		if (!clientInfo[0]) {
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $967
line 1186
;1186:			continue;
ADDRGP4 $961
JUMPV
LABELV $967
line 1188
;1187:		}
;1188:		CG_LoadingClient(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_LoadingClient
CALLV
pop
line 1189
;1189:		CG_NewClientInfo(i);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_NewClientInfo
CALLV
pop
line 1190
;1190:	}
LABELV $961
line 1177
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 64
LTI4 $960
line 1191
;1191:	CG_BuildSpectatorString();
ADDRGP4 CG_BuildSpectatorString
CALLV
pop
line 1192
;1192:}
LABELV $957
endproc CG_RegisterClients 12 4
export CG_ConfigString
proc CG_ConfigString 4 8
line 1201
;1193:
;1194://===========================================================================
;1195:
;1196:/*
;1197:=================
;1198:CG_ConfigString
;1199:=================
;1200:*/
;1201:const char* CG_ConfigString(int index) {
line 1202
;1202:	if (index < 0 || index >= MAX_CONFIGSTRINGS) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $972
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $970
LABELV $972
line 1203
;1203:		CG_Error("CG_ConfigString: bad index: %i", index);
ADDRGP4 $973
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Error
CALLV
pop
line 1204
;1204:		return "";
ADDRGP4 $194
RETP4
ADDRGP4 $969
JUMPV
LABELV $970
line 1206
;1205:	}
;1206:	return cgs.gameState.stringData + cgs.gameState.stringOffsets[index];
ADDRFP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs
ADDP4
INDIRI4
ADDRGP4 cgs+4096
ADDP4
RETP4
LABELV $969
endproc CG_ConfigString 4 8
export CG_StartMusic
proc CG_StartMusic 144 12
line 1217
;1207:}
;1208:
;1209://==================================================================
;1210:
;1211:/*
;1212:======================
;1213:CG_StartMusic
;1214:
;1215:======================
;1216:*/
;1217:void CG_StartMusic(void) {
line 1222
;1218:	char* s;
;1219:	char  parm1[MAX_QPATH], parm2[MAX_QPATH];
;1220:
;1221:	// start the background music
;1222:	s = (char*)CG_ConfigString(CS_MUSIC);
CNSTI4 2
ARGI4
ADDRLP4 132
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 132
INDIRP4
ASGNP4
line 1223
;1223:	Q_strncpyz(parm1, COM_Parse(&s), sizeof(parm1));
ADDRLP4 0
ARGP4
ADDRLP4 136
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ARGP4
ADDRLP4 136
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1224
;1224:	Q_strncpyz(parm2, COM_Parse(&s), sizeof(parm2));
ADDRLP4 0
ARGP4
ADDRLP4 140
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 68
ARGP4
ADDRLP4 140
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1226
;1225:
;1226:	trap_S_StartBackgroundTrack(parm1, parm2);
ADDRLP4 4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 trap_S_StartBackgroundTrack
CALLV
pop
line 1227
;1227:}
LABELV $975
endproc CG_StartMusic 144 12
export CG_Init
proc CG_Init 312 12
line 1883
;1228:#ifdef MISSIONPACK
;1229:char* CG_GetMenuBuffer(const char* filename) {
;1230:	int          len;
;1231:	fileHandle_t f;
;1232:	static char  buf[MAX_MENUFILE];
;1233:
;1234:	len = trap_FS_FOpenFile(filename, &f, FS_READ);
;1235:	if (!f) {
;1236:		trap_Print(va(S_COLOR_RED "menu file not found: %s, using default\n", filename));
;1237:		return NULL;
;1238:	}
;1239:	if (len >= MAX_MENUFILE) {
;1240:		trap_Print(va(S_COLOR_RED "menu file too large: %s is %i, max allowed is %i\n", filename, len, MAX_MENUFILE));
;1241:		trap_FS_FCloseFile(f);
;1242:		return NULL;
;1243:	}
;1244:
;1245:	trap_FS_Read(buf, len, f);
;1246:	buf[len] = 0;
;1247:	trap_FS_FCloseFile(f);
;1248:
;1249:	return buf;
;1250:}
;1251:
;1252://
;1253:// ==============================
;1254:// new hud stuff ( mission pack )
;1255:// ==============================
;1256://
;1257:qboolean CG_Asset_Parse(int handle) {
;1258:	pc_token_t  token;
;1259:	const char* tempStr;
;1260:
;1261:	if (!trap_PC_ReadToken(handle, &token))
;1262:		return qfalse;
;1263:	if (Q_stricmp(token.string, "{") != 0) {
;1264:		return qfalse;
;1265:	}
;1266:
;1267:	while (1) {
;1268:		if (!trap_PC_ReadToken(handle, &token))
;1269:			return qfalse;
;1270:
;1271:		if (Q_stricmp(token.string, "}") == 0) {
;1272:			return qtrue;
;1273:		}
;1274:
;1275:		// font
;1276:		if (Q_stricmp(token.string, "font") == 0) {
;1277:			int pointSize;
;1278:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1279:				return qfalse;
;1280:			}
;1281:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.textFont);
;1282:			continue;
;1283:		}
;1284:
;1285:		// smallFont
;1286:		if (Q_stricmp(token.string, "smallFont") == 0) {
;1287:			int pointSize;
;1288:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1289:				return qfalse;
;1290:			}
;1291:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.smallFont);
;1292:			continue;
;1293:		}
;1294:
;1295:		// font
;1296:		if (Q_stricmp(token.string, "bigfont") == 0) {
;1297:			int pointSize;
;1298:			if (!PC_String_Parse(handle, &tempStr) || !PC_Int_Parse(handle, &pointSize)) {
;1299:				return qfalse;
;1300:			}
;1301:			cgDC.registerFont(tempStr, pointSize, &cgDC.Assets.bigFont);
;1302:			continue;
;1303:		}
;1304:
;1305:		// gradientbar
;1306:		if (Q_stricmp(token.string, "gradientbar") == 0) {
;1307:			if (!PC_String_Parse(handle, &tempStr)) {
;1308:				return qfalse;
;1309:			}
;1310:			cgDC.Assets.gradientBar = trap_R_RegisterShaderNoMip(tempStr);
;1311:			continue;
;1312:		}
;1313:
;1314:		// enterMenuSound
;1315:		if (Q_stricmp(token.string, "menuEnterSound") == 0) {
;1316:			if (!PC_String_Parse(handle, &tempStr)) {
;1317:				return qfalse;
;1318:			}
;1319:			cgDC.Assets.menuEnterSound = trap_S_RegisterSound(tempStr, qfalse);
;1320:			continue;
;1321:		}
;1322:
;1323:		// exitMenuSound
;1324:		if (Q_stricmp(token.string, "menuExitSound") == 0) {
;1325:			if (!PC_String_Parse(handle, &tempStr)) {
;1326:				return qfalse;
;1327:			}
;1328:			cgDC.Assets.menuExitSound = trap_S_RegisterSound(tempStr, qfalse);
;1329:			continue;
;1330:		}
;1331:
;1332:		// itemFocusSound
;1333:		if (Q_stricmp(token.string, "itemFocusSound") == 0) {
;1334:			if (!PC_String_Parse(handle, &tempStr)) {
;1335:				return qfalse;
;1336:			}
;1337:			cgDC.Assets.itemFocusSound = trap_S_RegisterSound(tempStr, qfalse);
;1338:			continue;
;1339:		}
;1340:
;1341:		// menuBuzzSound
;1342:		if (Q_stricmp(token.string, "menuBuzzSound") == 0) {
;1343:			if (!PC_String_Parse(handle, &tempStr)) {
;1344:				return qfalse;
;1345:			}
;1346:			cgDC.Assets.menuBuzzSound = trap_S_RegisterSound(tempStr, qfalse);
;1347:			continue;
;1348:		}
;1349:
;1350:		if (Q_stricmp(token.string, "cursor") == 0) {
;1351:			if (!PC_String_Parse(handle, &cgDC.Assets.cursorStr)) {
;1352:				return qfalse;
;1353:			}
;1354:			cgDC.Assets.cursor = trap_R_RegisterShaderNoMip(cgDC.Assets.cursorStr);
;1355:			continue;
;1356:		}
;1357:
;1358:		if (Q_stricmp(token.string, "fadeClamp") == 0) {
;1359:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeClamp)) {
;1360:				return qfalse;
;1361:			}
;1362:			continue;
;1363:		}
;1364:
;1365:		if (Q_stricmp(token.string, "fadeCycle") == 0) {
;1366:			if (!PC_Int_Parse(handle, &cgDC.Assets.fadeCycle)) {
;1367:				return qfalse;
;1368:			}
;1369:			continue;
;1370:		}
;1371:
;1372:		if (Q_stricmp(token.string, "fadeAmount") == 0) {
;1373:			if (!PC_Float_Parse(handle, &cgDC.Assets.fadeAmount)) {
;1374:				return qfalse;
;1375:			}
;1376:			continue;
;1377:		}
;1378:
;1379:		if (Q_stricmp(token.string, "shadowX") == 0) {
;1380:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowX)) {
;1381:				return qfalse;
;1382:			}
;1383:			continue;
;1384:		}
;1385:
;1386:		if (Q_stricmp(token.string, "shadowY") == 0) {
;1387:			if (!PC_Float_Parse(handle, &cgDC.Assets.shadowY)) {
;1388:				return qfalse;
;1389:			}
;1390:			continue;
;1391:		}
;1392:
;1393:		if (Q_stricmp(token.string, "shadowColor") == 0) {
;1394:			if (!PC_Color_Parse(handle, &cgDC.Assets.shadowColor)) {
;1395:				return qfalse;
;1396:			}
;1397:			cgDC.Assets.shadowFadeClamp = cgDC.Assets.shadowColor[3];
;1398:			continue;
;1399:		}
;1400:	}
;1401:	return qfalse;
;1402:}
;1403:
;1404:void CG_ParseMenu(const char* menuFile) {
;1405:	pc_token_t token;
;1406:	int        handle;
;1407:
;1408:	handle = trap_PC_LoadSource(menuFile);
;1409:	if (!handle)
;1410:		handle = trap_PC_LoadSource("ui/testhud.menu");
;1411:	if (!handle)
;1412:		return;
;1413:
;1414:	while (1) {
;1415:		if (!trap_PC_ReadToken(handle, &token)) {
;1416:			break;
;1417:		}
;1418:
;1419:		// if ( Q_stricmp( token, "{" ) ) {
;1420:		//	Com_Printf( "Missing { in menu file\n" );
;1421:		//	break;
;1422:		// }
;1423:
;1424:		// if ( menuCount == MAX_MENUS ) {
;1425:		//	Com_Printf( "Too many menus!\n" );
;1426:		//	break;
;1427:		// }
;1428:
;1429:		if (token.string[0] == '}') {
;1430:			break;
;1431:		}
;1432:
;1433:		if (Q_stricmp(token.string, "assetGlobalDef") == 0) {
;1434:			if (CG_Asset_Parse(handle)) {
;1435:				continue;
;1436:			} else {
;1437:				break;
;1438:			}
;1439:		}
;1440:
;1441:		if (Q_stricmp(token.string, "menudef") == 0) {
;1442:			// start a new menu
;1443:			Menu_New(handle);
;1444:		}
;1445:	}
;1446:	trap_PC_FreeSource(handle);
;1447:}
;1448:
;1449:qboolean CG_Load_Menu(char** p) {
;1450:	char* token;
;1451:
;1452:	token = COM_ParseExt(p, qtrue);
;1453:
;1454:	if (token[0] != '{') {
;1455:		return qfalse;
;1456:	}
;1457:
;1458:	while (1) {
;1459:
;1460:		token = COM_ParseExt(p, qtrue);
;1461:
;1462:		if (Q_stricmp(token, "}") == 0) {
;1463:			return qtrue;
;1464:		}
;1465:
;1466:		if (!token || token[0] == 0) {
;1467:			return qfalse;
;1468:		}
;1469:
;1470:		CG_ParseMenu(token);
;1471:	}
;1472:	return qfalse;
;1473:}
;1474:
;1475:void CG_LoadMenus(const char* menuFile) {
;1476:	char*        token;
;1477:	char*        p;
;1478:	int          len, start;
;1479:	fileHandle_t f;
;1480:	static char  buf[MAX_MENUDEFFILE];
;1481:
;1482:	start = trap_Milliseconds();
;1483:
;1484:	len = trap_FS_FOpenFile(menuFile, &f, FS_READ);
;1485:	if (!f) {
;1486:		trap_Error(va(S_COLOR_YELLOW "menu file not found: %s, using default\n", menuFile));
;1487:		len = trap_FS_FOpenFile("ui/hud.txt", &f, FS_READ);
;1488:		if (!f) {
;1489:			trap_Error(va(S_COLOR_RED "default menu file not found: ui/hud.txt, unable to continue!\n", menuFile));
;1490:		}
;1491:	}
;1492:
;1493:	if (len >= MAX_MENUDEFFILE) {
;1494:		trap_FS_FCloseFile(f);
;1495:		trap_Error(va(S_COLOR_RED "menu file too large: %s is %i, max allowed is %i", menuFile, len, MAX_MENUDEFFILE));
;1496:		return;
;1497:	}
;1498:
;1499:	trap_FS_Read(buf, len, f);
;1500:	buf[len] = 0;
;1501:	trap_FS_FCloseFile(f);
;1502:
;1503:	COM_Compress(buf);
;1504:
;1505:	Menu_Reset();
;1506:
;1507:	p = buf;
;1508:
;1509:	while (1) {
;1510:		token = COM_ParseExt(&p, qtrue);
;1511:		if (!token || token[0] == 0 || token[0] == '}') {
;1512:			break;
;1513:		}
;1514:
;1515:		// if ( Q_stricmp( token, "{" ) ) {
;1516:		//	Com_Printf( "Missing { in menu file\n" );
;1517:		//	break;
;1518:		// }
;1519:
;1520:		// if ( menuCount == MAX_MENUS ) {
;1521:		//	Com_Printf( "Too many menus!\n" );
;1522:		//	break;
;1523:		// }
;1524:
;1525:		if (Q_stricmp(token, "}") == 0) {
;1526:			break;
;1527:		}
;1528:
;1529:		if (Q_stricmp(token, "loadmenu") == 0) {
;1530:			if (CG_Load_Menu(&p)) {
;1531:				continue;
;1532:			} else {
;1533:				break;
;1534:			}
;1535:		}
;1536:	}
;1537:
;1538:	Com_Printf("UI menu load time = %d milli seconds\n", trap_Milliseconds() - start);
;1539:}
;1540:
;1541:static qboolean CG_OwnerDrawHandleKey(int ownerDraw, int flags, float* special, int key) {
;1542:	return qfalse;
;1543:}
;1544:
;1545:static int CG_FeederCount(float feederID) {
;1546:	int i, count;
;1547:	count = 0;
;1548:	if (feederID == FEEDER_REDTEAM_LIST) {
;1549:		for (i = 0; i < cg.numScores; i++) {
;1550:			if (cg.scores[i].team == TEAM_RED) {
;1551:				count++;
;1552:			}
;1553:		}
;1554:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1555:		for (i = 0; i < cg.numScores; i++) {
;1556:			if (cg.scores[i].team == TEAM_BLUE) {
;1557:				count++;
;1558:			}
;1559:		}
;1560:	} else if (feederID == FEEDER_SCOREBOARD) {
;1561:		return cg.numScores;
;1562:	}
;1563:	return count;
;1564:}
;1565:
;1566:void CG_SetScoreSelection(void* p) {
;1567:	menuDef_t*     menu = (menuDef_t*)p;
;1568:	playerState_t* ps   = &cg.snap->ps;
;1569:	int            i, red, blue;
;1570:	red = blue = 0;
;1571:	for (i = 0; i < cg.numScores; i++) {
;1572:		if (cg.scores[i].team == TEAM_RED) {
;1573:			red++;
;1574:		} else if (cg.scores[i].team == TEAM_BLUE) {
;1575:			blue++;
;1576:		}
;1577:		if (ps->clientNum == cg.scores[i].client) {
;1578:			cg.selectedScore = i;
;1579:		}
;1580:	}
;1581:
;1582:	if (menu == NULL) {
;1583:		// just interested in setting the selected score
;1584:		return;
;1585:	}
;1586:
;1587:	if (cgs.gametype >= GT_TEAM) {
;1588:		int feeder = FEEDER_REDTEAM_LIST;
;1589:		i          = red;
;1590:		if (cg.scores[cg.selectedScore].team == TEAM_BLUE) {
;1591:			feeder = FEEDER_BLUETEAM_LIST;
;1592:			i      = blue;
;1593:		}
;1594:		Menu_SetFeederSelection(menu, feeder, i, NULL);
;1595:	} else {
;1596:		Menu_SetFeederSelection(menu, FEEDER_SCOREBOARD, cg.selectedScore, NULL);
;1597:	}
;1598:}
;1599:
;1600:// FIXME: might need to cache this info
;1601:static clientInfo_t* CG_InfoFromScoreIndex(int index, int team, int* scoreIndex) {
;1602:	int i, count;
;1603:	if (cgs.gametype >= GT_TEAM) {
;1604:		count = 0;
;1605:		for (i = 0; i < cg.numScores; i++) {
;1606:			if (cg.scores[i].team == team) {
;1607:				if (count == index) {
;1608:					*scoreIndex = i;
;1609:					return &cgs.clientinfo[cg.scores[i].client];
;1610:				}
;1611:				count++;
;1612:			}
;1613:		}
;1614:	}
;1615:	*scoreIndex = index;
;1616:	return &cgs.clientinfo[cg.scores[index].client];
;1617:}
;1618:
;1619:static const char* CG_FeederItemText(float feederID, int index, int column, qhandle_t* handle) {
;1620:	gitem_t*      item;
;1621:	int           scoreIndex = 0;
;1622:	clientInfo_t* info       = NULL;
;1623:	int           team       = -1;
;1624:	score_t*      sp         = NULL;
;1625:
;1626:	*handle = -1;
;1627:
;1628:	if (feederID == FEEDER_REDTEAM_LIST) {
;1629:		team = TEAM_RED;
;1630:	} else if (feederID == FEEDER_BLUETEAM_LIST) {
;1631:		team = TEAM_BLUE;
;1632:	}
;1633:
;1634:	info = CG_InfoFromScoreIndex(index, team, &scoreIndex);
;1635:	sp   = &cg.scores[scoreIndex];
;1636:
;1637:	if (info && info->infoValid) {
;1638:		switch (column) {
;1639:		case 0:
;1640:			if (info->powerups & (1 << PW_NEUTRALFLAG)) {
;1641:				item    = BG_FindItemForPowerup(PW_NEUTRALFLAG);
;1642:				*handle = cg_items[ITEM_INDEX(item)].icon;
;1643:			} else if (info->powerups & (1 << PW_REDFLAG)) {
;1644:				item    = BG_FindItemForPowerup(PW_REDFLAG);
;1645:				*handle = cg_items[ITEM_INDEX(item)].icon;
;1646:			} else if (info->powerups & (1 << PW_BLUEFLAG)) {
;1647:				item    = BG_FindItemForPowerup(PW_BLUEFLAG);
;1648:				*handle = cg_items[ITEM_INDEX(item)].icon;
;1649:			} else {
;1650:				if (info->botSkill > 0 && info->botSkill <= 5) {
;1651:					*handle = cgs.media.botSkillShaders[info->botSkill - 1];
;1652:				} else if (info->handicap < 100) {
;1653:					return va("%i", info->handicap);
;1654:				}
;1655:			}
;1656:			break;
;1657:		case 1:
;1658:			if (team == -1) {
;1659:				return "";
;1660:			} else {
;1661:				*handle = CG_StatusHandle(info->teamTask);
;1662:			}
;1663:			break;
;1664:		case 2:
;1665:			if (cg.snap->ps.stats[STAT_CLIENTS_READY] & (1 << sp->client)) {
;1666:				return "Ready";
;1667:			}
;1668:			if (team == -1) {
;1669:				if (cgs.gametype == GT_TOURNAMENT) {
;1670:					return va("%i/%i", info->wins, info->losses);
;1671:				} else if (info->infoValid && info->team == TEAM_SPECTATOR) {
;1672:					return "Spectator";
;1673:				} else {
;1674:					return "";
;1675:				}
;1676:			} else {
;1677:				if (info->teamLeader) {
;1678:					return "Leader";
;1679:				}
;1680:			}
;1681:			break;
;1682:		case 3:
;1683:			return info->name;
;1684:			break;
;1685:		case 4:
;1686:			return va("%i", info->score);
;1687:			break;
;1688:		case 5:
;1689:			return va("%4i", sp->time);
;1690:			break;
;1691:		case 6:
;1692:			if (sp->ping == -1) {
;1693:				return "connecting";
;1694:			}
;1695:			return va("%4i", sp->ping);
;1696:			break;
;1697:		}
;1698:	}
;1699:
;1700:	return "";
;1701:}
;1702:
;1703:static qhandle_t CG_FeederItemImage(float feederID, int index) {
;1704:	return 0;
;1705:}
;1706:
;1707:static void CG_FeederSelection(float feederID, int index) {
;1708:	if (cgs.gametype >= GT_TEAM) {
;1709:		int i, count;
;1710:		int team = (feederID == FEEDER_REDTEAM_LIST) ? TEAM_RED : TEAM_BLUE;
;1711:		count    = 0;
;1712:		for (i = 0; i < cg.numScores; i++) {
;1713:			if (cg.scores[i].team == team) {
;1714:				if (index == count) {
;1715:					cg.selectedScore = i;
;1716:				}
;1717:				count++;
;1718:			}
;1719:		}
;1720:	} else {
;1721:		cg.selectedScore = index;
;1722:	}
;1723:}
;1724:#endif
;1725:
;1726:#ifdef MISSIONPACK
;1727:static float CG_Cvar_Get(const char* cvar) {
;1728:	char buff[128];
;1729:	memset(buff, 0, sizeof(buff));
;1730:	trap_Cvar_VariableStringBuffer(cvar, buff, sizeof(buff));
;1731:	return atof(buff);
;1732:}
;1733:#endif
;1734:
;1735:#ifdef MISSIONPACK
;1736:void CG_Text_PaintWithCursor(float x, float y, float scale, vec4_t color, const char* text, int cursorPos, char cursor, int limit, int style) {
;1737:	CG_Text_Paint(x, y, scale, color, text, 0, limit, style);
;1738:}
;1739:
;1740:static int CG_OwnerDrawWidth(int ownerDraw, float scale) {
;1741:	switch (ownerDraw) {
;1742:	case CG_GAME_TYPE:
;1743:		return CG_Text_Width(CG_GameTypeString(), scale, 0);
;1744:	case CG_GAME_STATUS:
;1745:		return CG_Text_Width(CG_GetGameStatusText(), scale, 0);
;1746:		break;
;1747:	case CG_KILLER:
;1748:		return CG_Text_Width(CG_GetKillerText(), scale, 0);
;1749:		break;
;1750:	case CG_RED_NAME:
;1751:		return CG_Text_Width(cg_redTeamName.string, scale, 0);
;1752:		break;
;1753:	case CG_BLUE_NAME:
;1754:		return CG_Text_Width(cg_blueTeamName.string, scale, 0);
;1755:		break;
;1756:	}
;1757:	return 0;
;1758:}
;1759:
;1760:static int CG_PlayCinematic(const char* name, float x, float y, float w, float h) {
;1761:	return trap_CIN_PlayCinematic(name, x, y, w, h, CIN_loop);
;1762:}
;1763:
;1764:static void CG_StopCinematic(int handle) {
;1765:	trap_CIN_StopCinematic(handle);
;1766:}
;1767:
;1768:static void CG_DrawCinematic(int handle, float x, float y, float w, float h) {
;1769:	trap_CIN_SetExtents(handle, x, y, w, h);
;1770:	trap_CIN_DrawCinematic(handle);
;1771:}
;1772:
;1773:static void CG_RunCinematicFrame(int handle) {
;1774:	trap_CIN_RunCinematic(handle);
;1775:}
;1776:
;1777:/*
;1778:=================
;1779:CG_LoadHudMenu();
;1780:
;1781:=================
;1782:*/
;1783:void CG_LoadHudMenu(void) {
;1784:	char        buff[1024];
;1785:	const char* hudSet;
;1786:
;1787:	cgDC.registerShaderNoMip = &trap_R_RegisterShaderNoMip;
;1788:	cgDC.setColor            = &trap_R_SetColor;
;1789:	cgDC.drawHandlePic       = &CG_DrawPic;
;1790:	cgDC.drawStretchPic      = &trap_R_DrawStretchPic;
;1791:	cgDC.drawText            = &CG_Text_Paint;
;1792:	cgDC.textWidth           = &CG_Text_Width;
;1793:	cgDC.textHeight          = &CG_Text_Height;
;1794:	cgDC.registerModel       = &trap_R_RegisterModel;
;1795:	cgDC.modelBounds         = &trap_R_ModelBounds;
;1796:	cgDC.fillRect            = &CG_FillRect;
;1797:	cgDC.drawRect            = &CG_DrawRect;
;1798:	cgDC.drawSides           = &CG_DrawSides;
;1799:	cgDC.drawTopBottom       = &CG_DrawTopBottom;
;1800:	cgDC.clearScene          = &trap_R_ClearScene;
;1801:	cgDC.addRefEntityToScene = &trap_R_AddRefEntityToScene;
;1802:	cgDC.renderScene         = &trap_R_RenderScene;
;1803:	cgDC.registerFont        = &trap_R_RegisterFont;
;1804:	cgDC.ownerDrawItem       = &CG_OwnerDraw;
;1805:	cgDC.getValue            = &CG_GetValue;
;1806:	cgDC.ownerDrawVisible    = &CG_OwnerDrawVisible;
;1807:	cgDC.runScript           = &CG_RunMenuScript;
;1808:	cgDC.getTeamColor        = &CG_GetTeamColor;
;1809:	cgDC.setCVar             = trap_Cvar_Set;
;1810:	cgDC.getCVarString       = trap_Cvar_VariableStringBuffer;
;1811:	cgDC.getCVarValue        = CG_Cvar_Get;
;1812:	cgDC.drawTextWithCursor  = &CG_Text_PaintWithCursor;
;1813:	// cgDC.setOverstrikeMode = &trap_Key_SetOverstrikeMode;
;1814:	// cgDC.getOverstrikeMode = &trap_Key_GetOverstrikeMode;
;1815:	cgDC.startLocalSound    = &trap_S_StartLocalSound;
;1816:	cgDC.ownerDrawHandleKey = &CG_OwnerDrawHandleKey;
;1817:	cgDC.feederCount        = &CG_FeederCount;
;1818:	cgDC.feederItemImage    = &CG_FeederItemImage;
;1819:	cgDC.feederItemText     = &CG_FeederItemText;
;1820:	cgDC.feederSelection    = &CG_FeederSelection;
;1821:	// cgDC.setBinding = &trap_Key_SetBinding;
;1822:	// cgDC.getBindingBuf = &trap_Key_GetBindingBuf;
;1823:	// cgDC.keynumToStringBuf = &trap_Key_KeynumToStringBuf;
;1824:	// cgDC.executeText = &trap_Cmd_ExecuteText;
;1825:	cgDC.Error          = &Com_Error;
;1826:	cgDC.Print          = &Com_Printf;
;1827:	cgDC.ownerDrawWidth = &CG_OwnerDrawWidth;
;1828:	// cgDC.Pause = &CG_Pause;
;1829:	cgDC.registerSound        = &trap_S_RegisterSound;
;1830:	cgDC.startBackgroundTrack = &trap_S_StartBackgroundTrack;
;1831:	cgDC.stopBackgroundTrack  = &trap_S_StopBackgroundTrack;
;1832:	cgDC.playCinematic        = &CG_PlayCinematic;
;1833:	cgDC.stopCinematic        = &CG_StopCinematic;
;1834:	cgDC.drawCinematic        = &CG_DrawCinematic;
;1835:	cgDC.runCinematicFrame    = &CG_RunCinematicFrame;
;1836:
;1837:	Init_Display(&cgDC);
;1838:
;1839:	Menu_Reset();
;1840:
;1841:	trap_Cvar_VariableStringBuffer("cg_hudFiles", buff, sizeof(buff));
;1842:	hudSet = buff;
;1843:	if (hudSet[0] == '\0') {
;1844:		hudSet = "ui/hud.txt";
;1845:	}
;1846:
;1847:	CG_LoadMenus(hudSet);
;1848:}
;1849:
;1850:void CG_AssetCache(void) {
;1851:	// if (Assets.textFont == NULL) {
;1852:	//   trap_R_RegisterFont("fonts/arial.ttf", 72, &Assets.textFont);
;1853:	// }
;1854:	// Assets.background = trap_R_RegisterShaderNoMip( ASSET_BACKGROUND );
;1855:	// Com_Printf("Menu Size: %i bytes\n", sizeof(Menus));
;1856:	cgDC.Assets.gradientBar         = trap_R_RegisterShaderNoMip(ASSET_GRADIENTBAR);
;1857:	cgDC.Assets.fxBasePic           = trap_R_RegisterShaderNoMip(ART_FX_BASE);
;1858:	cgDC.Assets.fxPic[0]            = trap_R_RegisterShaderNoMip(ART_FX_RED);
;1859:	cgDC.Assets.fxPic[1]            = trap_R_RegisterShaderNoMip(ART_FX_YELLOW);
;1860:	cgDC.Assets.fxPic[2]            = trap_R_RegisterShaderNoMip(ART_FX_GREEN);
;1861:	cgDC.Assets.fxPic[3]            = trap_R_RegisterShaderNoMip(ART_FX_TEAL);
;1862:	cgDC.Assets.fxPic[4]            = trap_R_RegisterShaderNoMip(ART_FX_BLUE);
;1863:	cgDC.Assets.fxPic[5]            = trap_R_RegisterShaderNoMip(ART_FX_CYAN);
;1864:	cgDC.Assets.fxPic[6]            = trap_R_RegisterShaderNoMip(ART_FX_WHITE);
;1865:	cgDC.Assets.scrollBar           = trap_R_RegisterShaderNoMip(ASSET_SCROLLBAR);
;1866:	cgDC.Assets.scrollBarArrowDown  = trap_R_RegisterShaderNoMip(ASSET_SCROLLBAR_ARROWDOWN);
;1867:	cgDC.Assets.scrollBarArrowUp    = trap_R_RegisterShaderNoMip(ASSET_SCROLLBAR_ARROWUP);
;1868:	cgDC.Assets.scrollBarArrowLeft  = trap_R_RegisterShaderNoMip(ASSET_SCROLLBAR_ARROWLEFT);
;1869:	cgDC.Assets.scrollBarArrowRight = trap_R_RegisterShaderNoMip(ASSET_SCROLLBAR_ARROWRIGHT);
;1870:	cgDC.Assets.scrollBarThumb      = trap_R_RegisterShaderNoMip(ASSET_SCROLL_THUMB);
;1871:	cgDC.Assets.sliderBar           = trap_R_RegisterShaderNoMip(ASSET_SLIDER_BAR);
;1872:	cgDC.Assets.sliderThumb         = trap_R_RegisterShaderNoMip(ASSET_SLIDER_THUMB);
;1873:}
;1874:#endif
;1875:/*
;1876:=================
;1877:CG_Init
;1878:
;1879:Called after every level change or subsystem restart
;1880:Will perform callbacks to make the loading info screen update.
;1881:=================
;1882:*/
;1883:void CG_Init(int serverMessageNum, int serverCommandSequence, int clientNum) {
line 1888
;1884:	char        value[MAX_CVAR_VALUE_STRING];
;1885:	const char* s;
;1886:
;1887:	// clear everything
;1888:	memset(&cgs, 0, sizeof(cgs));
ADDRGP4 cgs
ARGP4
CNSTI4 0
ARGI4
CNSTI4 149716
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1889
;1889:	memset(&cg, 0, sizeof(cg));
ADDRGP4 cg
ARGP4
CNSTI4 0
ARGI4
CNSTI4 149108
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1890
;1890:	memset(cg_entities, 0, sizeof(cg_entities));
ADDRGP4 cg_entities
ARGP4
CNSTI4 0
ARGI4
CNSTI4 757760
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1891
;1891:	memset(cg_weapons, 0, sizeof(cg_weapons));
ADDRGP4 cg_weapons
ARGP4
CNSTI4 0
ARGI4
CNSTI4 2176
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1892
;1892:	memset(cg_items, 0, sizeof(cg_items));
ADDRGP4 cg_items
ARGP4
CNSTI4 0
ARGI4
CNSTI4 7168
ARGI4
ADDRGP4 memset
CALLP4
pop
line 1894
;1893:
;1894:	cg.clientNum = clientNum;
ADDRGP4 cg+4
ADDRFP4 8
INDIRI4
ASGNI4
line 1896
;1895:
;1896:	cgs.processedSnapshotNum  = serverMessageNum;
ADDRGP4 cgs+31472
ADDRFP4 0
INDIRI4
ASGNI4
line 1897
;1897:	cgs.serverCommandSequence = serverCommandSequence;
ADDRGP4 cgs+31468
ADDRFP4 4
INDIRI4
ASGNI4
line 1899
;1898:
;1899:	trap_Cvar_VariableStringBuffer("//trap_GetValue", value, sizeof(value));
ADDRGP4 $980
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 1900
;1900:	if (value[0]) {
ADDRLP4 0
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $981
line 1902
;1901:#ifdef Q3_VM
;1902:		trap_GetValue = (void*)~atoi(value);
ADDRLP4 0
ARGP4
ADDRLP4 260
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 trap_GetValue
ADDRLP4 260
INDIRI4
BCOMI4
CVIU4 4
CVUP4 4
ASGNP4
line 1903
;1903:		if (trap_GetValue(value, sizeof(value), "trap_R_AddRefEntityToScene2")) {
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $985
ARGP4
ADDRLP4 264
ADDRGP4 trap_GetValue
INDIRP4
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
CNSTI4 0
EQI4 $983
line 1904
;1904:			trap_R_AddRefEntityToScene2 = (void*)~atoi(value);
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 trap_R_AddRefEntityToScene2
ADDRLP4 268
INDIRI4
BCOMI4
CVIU4 4
CVUP4 4
ASGNP4
line 1905
;1905:			intShaderTime               = qtrue;
ADDRGP4 intShaderTime
CNSTI4 1
ASGNI4
line 1906
;1906:		}
LABELV $983
line 1907
;1907:		if (trap_GetValue(value, sizeof(value), "trap_R_AddLinearLightToScene_Q3E")) {
ADDRLP4 0
ARGP4
CNSTI4 256
ARGI4
ADDRGP4 $988
ARGP4
ADDRLP4 268
ADDRGP4 trap_GetValue
INDIRP4
CALLI4
ASGNI4
ADDRLP4 268
INDIRI4
CNSTI4 0
EQI4 $986
line 1908
;1908:			trap_R_AddLinearLightToScene = (void*)~atoi(value);
ADDRLP4 0
ARGP4
ADDRLP4 272
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 trap_R_AddLinearLightToScene
ADDRLP4 272
INDIRI4
BCOMI4
CVIU4 4
CVUP4 4
ASGNP4
line 1909
;1909:			linearLight                  = qtrue;
ADDRGP4 linearLight
CNSTI4 1
ASGNI4
line 1910
;1910:		}
LABELV $986
line 1922
;1911:#else
;1912:		dll_com_trapGetValue = atoi(value);
;1913:		if (trap_GetValue(value, sizeof(value), "trap_R_AddRefEntityToScene2")) {
;1914:			dll_trap_R_AddRefEntityToScene2 = atoi(value);
;1915:			intShaderTime                   = qtrue;
;1916:		}
;1917:		if (trap_GetValue(value, sizeof(value), "trap_R_AddLinearLightToScene_Q3E")) {
;1918:			dll_trap_R_AddLinearLightToScene = atoi(value);
;1919:			linearLight                      = qtrue;
;1920:		}
;1921:#endif
;1922:	}
LABELV $981
line 1925
;1923:
;1924:	// load a few needed things before we do any screen updates
;1925:	cgs.media.charsetShader   = trap_R_RegisterShader("gfx/2d/bigchars");
ADDRGP4 $990
ARGP4
ADDRLP4 260
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692
ADDRLP4 260
INDIRI4
ASGNI4
line 1926
;1926:	cgs.media.whiteShader     = trap_R_RegisterShader("white");
ADDRGP4 $993
ARGP4
ADDRLP4 264
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+148692+16
ADDRLP4 264
INDIRI4
ASGNI4
line 1927
;1927:	cgs.media.charsetProp     = trap_R_RegisterShaderNoMip("menu/art/font1_prop.tga");
ADDRGP4 $996
ARGP4
ADDRLP4 268
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+4
ADDRLP4 268
INDIRI4
ASGNI4
line 1928
;1928:	cgs.media.charsetPropGlow = trap_R_RegisterShaderNoMip("menu/art/font1_prop_glo.tga");
ADDRGP4 $999
ARGP4
ADDRLP4 272
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+8
ADDRLP4 272
INDIRI4
ASGNI4
line 1929
;1929:	cgs.media.charsetPropB    = trap_R_RegisterShaderNoMip("menu/art/font2_prop.tga");
ADDRGP4 $1002
ARGP4
ADDRLP4 276
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRGP4 cgs+148692+12
ADDRLP4 276
INDIRI4
ASGNI4
line 1931
;1930:
;1931:	CG_RegisterCvars();
ADDRGP4 CG_RegisterCvars
CALLV
pop
line 1933
;1932:
;1933:	CG_InitConsoleCommands();
ADDRGP4 CG_InitConsoleCommands
CALLV
pop
line 1935
;1934:
;1935:	cg.weaponSelect = WP_MACHINEGUN;
ADDRGP4 cg+108956
CNSTI4 2
ASGNI4
line 1937
;1936:
;1937:	cgs.redflag = cgs.blueflag = -1;  // For compatibily, default to unset for
ADDRLP4 280
CNSTI4 -1
ASGNI4
ADDRGP4 cgs+34836
ADDRLP4 280
INDIRI4
ASGNI4
ADDRGP4 cgs+34832
ADDRLP4 280
INDIRI4
ASGNI4
line 1938
;1938:	cgs.flagStatus             = -1;
ADDRGP4 cgs+34840
CNSTI4 -1
ASGNI4
line 1942
;1939:	// old servers
;1940:
;1941:	// get the rendering configuration from the client system
;1942:	trap_GetGlconfig(&cgs.glconfig);
ADDRGP4 cgs+20100
ARGP4
ADDRGP4 trap_GetGlconfig
CALLV
pop
line 1944
;1943:
;1944:	cgs.screenXBias = 0.0;
ADDRGP4 cgs+31444
CNSTF4 0
ASGNF4
line 1945
;1945:	cgs.screenYBias = 0.0;
ADDRGP4 cgs+31448
CNSTF4 0
ASGNF4
line 1947
;1946:
;1947:	if (cgs.glconfig.vidWidth * 480 > cgs.glconfig.vidHeight * 640) {
ADDRGP4 cgs+20100+11304
INDIRI4
CNSTI4 480
MULI4
ADDRGP4 cgs+20100+11308
INDIRI4
CNSTI4 640
MULI4
LEI4 $1010
line 1949
;1948:		// wide screen, scale by height
;1949:		cgs.screenXScale = cgs.screenYScale = cgs.glconfig.vidHeight * (1.0 / 480.0);
ADDRLP4 284
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 990414985
MULF4
ASGNF4
ADDRGP4 cgs+31436
ADDRLP4 284
INDIRF4
ASGNF4
ADDRGP4 cgs+31432
ADDRLP4 284
INDIRF4
ASGNF4
line 1950
;1950:		cgs.screenXBias                     = 0.5 * (cgs.glconfig.vidWidth - (cgs.glconfig.vidHeight * (640.0 / 480.0)));
ADDRGP4 cgs+31444
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
CNSTF4 1068149419
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1951
;1951:	} else {
ADDRGP4 $1011
JUMPV
LABELV $1010
line 1953
;1952:		// no wide screen, scale by width
;1953:		cgs.screenXScale = cgs.screenYScale = cgs.glconfig.vidWidth * (1.0 / 640.0);
ADDRLP4 284
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 986500301
MULF4
ASGNF4
ADDRGP4 cgs+31436
ADDRLP4 284
INDIRF4
ASGNF4
ADDRGP4 cgs+31432
ADDRLP4 284
INDIRF4
ASGNF4
line 1954
;1954:		cgs.screenYBias                     = 0.5 * (cgs.glconfig.vidHeight - (cgs.glconfig.vidWidth * (480.0 / 640.0)));
ADDRGP4 cgs+31448
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
CNSTF4 1061158912
MULF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1955
;1955:	}
LABELV $1011
line 1957
;1956:
;1957:	cgs.screenXmin = 0.0 - (cgs.screenXBias / cgs.screenXScale);
ADDRGP4 cgs+31452
CNSTF4 0
ADDRGP4 cgs+31444
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
DIVF4
SUBF4
ASGNF4
line 1958
;1958:	cgs.screenXmax = 640.0 + (cgs.screenXBias / cgs.screenXScale);
ADDRGP4 cgs+31456
ADDRGP4 cgs+31444
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
DIVF4
CNSTF4 1142947840
ADDF4
ASGNF4
line 1960
;1959:
;1960:	cgs.screenYmin = 0.0 - (cgs.screenYBias / cgs.screenYScale);
ADDRGP4 cgs+31460
CNSTF4 0
ADDRGP4 cgs+31448
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
DIVF4
SUBF4
ASGNF4
line 1961
;1961:	cgs.screenYmax = 480.0 + (cgs.screenYBias / cgs.screenYScale);
ADDRGP4 cgs+31464
ADDRGP4 cgs+31448
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
DIVF4
CNSTF4 1139802112
ADDF4
ASGNF4
line 1963
;1962:
;1963:	cgs.cursorScaleR = 1.0 / cgs.screenXScale;
ADDRGP4 cgs+31440
CNSTF4 1065353216
ADDRGP4 cgs+31432
INDIRF4
DIVF4
ASGNF4
line 1964
;1964:	if (cgs.cursorScaleR < 0.5) {
ADDRGP4 cgs+31440
INDIRF4
CNSTF4 1056964608
GEF4 $1048
line 1965
;1965:		cgs.cursorScaleR = 0.5;
ADDRGP4 cgs+31440
CNSTF4 1056964608
ASGNF4
line 1966
;1966:	}
LABELV $1048
line 1969
;1967:
;1968:#ifdef USE_NEW_FONT_RENDERER
;1969:	CG_LoadFonts();
ADDRGP4 CG_LoadFonts
CALLV
pop
line 1973
;1970:#endif
;1971:
;1972:	// get the gamestate from the client system
;1973:	trap_GetGameState(&cgs.gameState);
ADDRGP4 cgs
ARGP4
ADDRGP4 trap_GetGameState
CALLV
pop
line 1976
;1974:
;1975:	// check version
;1976:	s = CG_ConfigString(CS_GAME_VERSION);
CNSTI4 20
ARGI4
ADDRLP4 284
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 256
ADDRLP4 284
INDIRP4
ASGNP4
line 1977
;1977:	if (strstr(s, "defrag-")) {
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 $1054
ARGP4
ADDRLP4 288
ADDRGP4 strstr
CALLP4
ASGNP4
ADDRLP4 288
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1052
line 1978
;1978:		cgs.defrag = qtrue;
ADDRGP4 cgs+149692
CNSTI4 1
ASGNI4
line 1979
;1979:	} else if (strcmp(s, GAME_VERSION)) {
ADDRGP4 $1053
JUMPV
LABELV $1052
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 $1058
ARGP4
ADDRLP4 292
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 292
INDIRI4
CNSTI4 0
EQI4 $1056
line 1980
;1980:		CG_Error("Client/Server game mismatch: %s/%s", GAME_VERSION, s);
ADDRGP4 $1059
ARGP4
ADDRGP4 $1058
ARGP4
ADDRLP4 256
INDIRP4
ARGP4
ADDRGP4 CG_Error
CALLV
pop
line 1981
;1981:	}
LABELV $1056
LABELV $1053
line 1983
;1982:
;1983:	cgs.ospEnc = atoi(CG_ConfigString(872)) & 1;
CNSTI4 872
ARGI4
ADDRLP4 296
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 296
INDIRP4
ARGP4
ADDRLP4 300
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+149688
ADDRLP4 300
INDIRI4
CNSTI4 1
BANDI4
ASGNI4
line 1985
;1984:
;1985:	s                  = CG_ConfigString(CS_LEVEL_START_TIME);
CNSTI4 21
ARGI4
ADDRLP4 304
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 256
ADDRLP4 304
INDIRP4
ASGNP4
line 1986
;1986:	cgs.levelStartTime = atoi(s);
ADDRLP4 256
INDIRP4
ARGP4
ADDRLP4 308
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRGP4 cgs+34820
ADDRLP4 308
INDIRI4
ASGNI4
line 1988
;1987:
;1988:	CG_ParseServerinfo();
ADDRGP4 CG_ParseServerinfo
CALLV
pop
line 1989
;1989:	CG_ParseSysteminfo();
ADDRGP4 CG_ParseSysteminfo
CALLV
pop
line 1992
;1990:
;1991:	// load the new map
;1992:	CG_LoadingString("collision map");
ADDRGP4 $1062
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 1994
;1993:
;1994:	trap_CM_LoadMap(cgs.mapname);
ADDRGP4 cgs+31508
ARGP4
ADDRGP4 trap_CM_LoadMap
CALLV
pop
line 2000
;1995:
;1996:#ifdef MISSIONPACK
;1997:	String_Init();
;1998:#endif
;1999:
;2000:	cg.loading = qtrue;  // force players to load instead of defer
ADDRGP4 cg+20
CNSTI4 1
ASGNI4
line 2002
;2001:
;2002:	CG_LoadingString("sounds");
ADDRGP4 $1065
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2004
;2003:
;2004:	CG_RegisterSounds();
ADDRGP4 CG_RegisterSounds
CALLV
pop
line 2006
;2005:
;2006:	CG_LoadingString("graphics");
ADDRGP4 $1066
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2008
;2007:
;2008:	CG_RegisterGraphics();
ADDRGP4 CG_RegisterGraphics
CALLV
pop
line 2010
;2009:
;2010:	CG_LoadingString("clients");
ADDRGP4 $1067
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2012
;2011:
;2012:	CG_RegisterClients();  // if low on memory, some clients will be deferred
ADDRGP4 CG_RegisterClients
CALLV
pop
line 2019
;2013:
;2014:#ifdef MISSIONPACK
;2015:	CG_AssetCache();
;2016:	CG_LoadHudMenu();  // load new hud stuff
;2017:#endif
;2018:
;2019:	cg.loading = qfalse;  // future players will be deferred
ADDRGP4 cg+20
CNSTI4 0
ASGNI4
line 2021
;2020:
;2021:	CG_InitLocalEntities();
ADDRGP4 CG_InitLocalEntities
CALLV
pop
line 2023
;2022:
;2023:	CG_InitMarkPolys();
ADDRGP4 CG_InitMarkPolys
CALLV
pop
line 2026
;2024:
;2025:	// remove the last loading update
;2026:	cg.infoScreenText[0] = 0;
ADDRGP4 cg+109448
CNSTI1 0
ASGNI1
line 2031
;2027:
;2028:	// Make sure we have update values (scores)
;2029:	// CG_SetConfigValues();
;2030:
;2031:	CG_StartMusic();
ADDRGP4 CG_StartMusic
CALLV
pop
line 2033
;2032:
;2033:	CG_LoadingString("");
ADDRGP4 $194
ARGP4
ADDRGP4 CG_LoadingString
CALLV
pop
line 2039
;2034:
;2035:#ifdef MISSIONPACK
;2036:	CG_InitTeamChat();
;2037:#endif
;2038:
;2039:	CG_ShaderStateChanged();
ADDRGP4 CG_ShaderStateChanged
CALLV
pop
line 2041
;2040:
;2041:	trap_S_ClearLoopingSounds(qtrue);
CNSTI4 1
ARGI4
ADDRGP4 trap_S_ClearLoopingSounds
CALLV
pop
line 2042
;2042:}
LABELV $976
endproc CG_Init 312 12
export CG_Shutdown
proc CG_Shutdown 0 0
line 2051
;2043:
;2044:/*
;2045:=================
;2046:CG_Shutdown
;2047:
;2048:Called before every level change or subsystem restart
;2049:=================
;2050:*/
;2051:void CG_Shutdown(void) {
line 2054
;2052:	// some mods may need to do cleanup work here,
;2053:	// like closing files or archiving session data
;2054:}
LABELV $1070
endproc CG_Shutdown 0 0
export CG_EventHandling
proc CG_EventHandling 0 0
line 2066
;2055:
;2056:/*
;2057:==================
;2058:CG_EventHandling
;2059:==================
;2060: type 0 - no event handling
;2061:      1 - team menu
;2062:      2 - scoreboard
;2063:      3 - hud editor
;2064:*/
;2065:#ifndef MISSIONPACK
;2066:void CG_EventHandling(cgame_event_t type) {}
LABELV $1071
endproc CG_EventHandling 0 0
export CG_SetScoreCatcher
proc CG_SetScoreCatcher 36 4
line 2068
;2067:
;2068:void CG_SetScoreCatcher(qboolean enable) {
line 2072
;2069:	int      currentCatcher, newCatcher, old_state, new_state;
;2070:	qboolean spectator;
;2071:
;2072:	currentCatcher = trap_Key_GetCatcher();
ADDRLP4 20
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 20
INDIRI4
ASGNI4
line 2074
;2073:
;2074:	if (currentCatcher & KEYCATCH_CONSOLE || !cg.snap)
ADDRLP4 0
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
NEI4 $1076
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1073
LABELV $1076
line 2075
;2075:		return;
ADDRGP4 $1072
JUMPV
LABELV $1073
line 2077
;2076:
;2077:	spectator = cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR || cg.demoPlayback || (cg.snap->ps.pm_flags & PMF_FOLLOW);
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
EQI4 $1084
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $1084
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $1081
LABELV $1084
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $1082
JUMPV
LABELV $1081
ADDRLP4 24
CNSTI4 0
ASGNI4
LABELV $1082
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 2079
;2078:
;2079:	if (enable && spectator) {
ADDRFP4 0
INDIRI4
CNSTI4 0
EQI4 $1085
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1085
line 2080
;2080:		cgs.score_key     = trap_Key_GetKey("+scores");
ADDRGP4 $1088
ARGP4
ADDRLP4 28
ADDRGP4 trap_Key_GetKey
CALLI4
ASGNI4
ADDRGP4 cgs+149704
ADDRLP4 28
INDIRI4
ASGNI4
line 2081
;2081:		cgs.score_catched = qtrue;
ADDRGP4 cgs+149700
CNSTI4 1
ASGNI4
line 2082
;2082:		newCatcher        = currentCatcher | KEYCATCH_CGAME;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 8
BORI4
ASGNI4
line 2083
;2083:	} else {
ADDRGP4 $1086
JUMPV
LABELV $1085
line 2084
;2084:		cgs.score_catched = qfalse;
ADDRGP4 cgs+149700
CNSTI4 0
ASGNI4
line 2085
;2085:		newCatcher        = currentCatcher & ~KEYCATCH_CGAME;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 -9
BANDI4
ASGNI4
line 2086
;2086:	}
LABELV $1086
line 2088
;2087:
;2088:	if (newCatcher != currentCatcher) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1091
line 2089
;2089:		if (cgs.score_key) {
ADDRGP4 cgs+149704
INDIRI4
CNSTI4 0
EQI4 $1093
line 2092
;2090:			// keycatcher change may cause reset of all pressed buttons on new engines
;2091:			// so track state of scoreboard key and ignore first upcoming keyup event for it
;2092:			old_state = trap_Key_IsDown(cgs.score_key);
ADDRGP4 cgs+149704
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 2093
;2093:			trap_Key_SetCatcher(newCatcher);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 2094
;2094:			new_state = trap_Key_IsDown(cgs.score_key);
ADDRGP4 cgs+149704
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 32
INDIRI4
ASGNI4
line 2095
;2095:			if (new_state != old_state) {
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
EQI4 $1094
line 2096
;2096:				cgs.filterKeyUpEvent = qtrue;
ADDRGP4 cgs+149696
CNSTI4 1
ASGNI4
line 2097
;2097:			}
line 2098
;2098:		} else {
ADDRGP4 $1094
JUMPV
LABELV $1093
line 2099
;2099:			trap_Key_SetCatcher(newCatcher);
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 2100
;2100:		}
LABELV $1094
line 2101
;2101:	}
LABELV $1091
line 2102
;2102:}
LABELV $1072
endproc CG_SetScoreCatcher 36 4
export CG_KeyEvent
proc CG_KeyEvent 0 4
line 2104
;2103:
;2104:void CG_KeyEvent(int key, qboolean down) {
line 2106
;2105:	// process scoreboard clicks etc.
;2106:	if (cgs.score_catched && down) {
ADDRGP4 cgs+149700
INDIRI4
CNSTI4 0
EQI4 $1102
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $1102
line 2107
;2107:		if (key == /*K_TAB*/ cgs.score_key)
ADDRFP4 0
INDIRI4
ADDRGP4 cgs+149704
INDIRI4
NEI4 $1105
line 2108
;2108:			return;
ADDRGP4 $1101
JUMPV
LABELV $1105
line 2109
;2109:		if (key == /*K_MOUSE1*/ 178)
ADDRFP4 0
INDIRI4
CNSTI4 178
NEI4 $1108
line 2110
;2110:			CG_ScoreboardClick();
ADDRGP4 CG_ScoreboardClick
CALLV
pop
ADDRGP4 $1109
JUMPV
LABELV $1108
line 2112
;2111:		else
;2112:			CG_SetScoreCatcher(qfalse);
CNSTI4 0
ARGI4
ADDRGP4 CG_SetScoreCatcher
CALLV
pop
LABELV $1109
line 2113
;2113:	}
LABELV $1102
line 2114
;2114:}
LABELV $1101
endproc CG_KeyEvent 0 4
export CG_MouseEvent
proc CG_MouseEvent 8 0
line 2116
;2115:
;2116:void CG_MouseEvent(int x, int y) {
line 2117
;2117:	cgs.cursorX += x * cgs.cursorScaleR;
ADDRLP4 0
ADDRGP4 cgs+149708
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31440
INDIRF4
MULF4
ADDF4
ASGNF4
line 2118
;2118:	cgs.cursorY += y * cgs.cursorScaleR;
ADDRLP4 4
ADDRGP4 cgs+149712
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31440
INDIRF4
MULF4
ADDF4
ASGNF4
line 2120
;2119:
;2120:	if (cgs.cursorX < cgs.screenXmin) {
ADDRGP4 cgs+149708
INDIRF4
ADDRGP4 cgs+31452
INDIRF4
GEF4 $1115
line 2121
;2121:		cgs.cursorX = cgs.screenXmin;
ADDRGP4 cgs+149708
ADDRGP4 cgs+31452
INDIRF4
ASGNF4
line 2122
;2122:	} else if (cgs.cursorX > cgs.screenXmax) {
ADDRGP4 $1116
JUMPV
LABELV $1115
ADDRGP4 cgs+149708
INDIRF4
ADDRGP4 cgs+31456
INDIRF4
LEF4 $1121
line 2123
;2123:		cgs.cursorX = cgs.screenXmax;
ADDRGP4 cgs+149708
ADDRGP4 cgs+31456
INDIRF4
ASGNF4
line 2124
;2124:	}
LABELV $1121
LABELV $1116
line 2126
;2125:
;2126:	if (cgs.cursorY < cgs.screenYmin) {
ADDRGP4 cgs+149712
INDIRF4
ADDRGP4 cgs+31460
INDIRF4
GEF4 $1127
line 2127
;2127:		cgs.cursorY = cgs.screenYmin;
ADDRGP4 cgs+149712
ADDRGP4 cgs+31460
INDIRF4
ASGNF4
line 2128
;2128:	} else if (cgs.cursorY > cgs.screenYmax) {
ADDRGP4 $1128
JUMPV
LABELV $1127
ADDRGP4 cgs+149712
INDIRF4
ADDRGP4 cgs+31464
INDIRF4
LEF4 $1133
line 2129
;2129:		cgs.cursorY = cgs.screenYmax;
ADDRGP4 cgs+149712
ADDRGP4 cgs+31464
INDIRF4
ASGNF4
line 2130
;2130:	}
LABELV $1133
LABELV $1128
line 2131
;2131:}
LABELV $1110
endproc CG_MouseEvent 8 0
bss
export cg_hudFiles
align 4
LABELV cg_hudFiles
skip 272
export trap_GetValue
align 4
LABELV trap_GetValue
skip 4
export trap_R_AddLinearLightToScene
align 4
LABELV trap_R_AddLinearLightToScene
skip 4
export trap_R_AddRefEntityToScene2
align 4
LABELV trap_R_AddRefEntityToScene2
skip 4
import CG_NewParticleArea
import initparticles
import CG_ParticleExplosion
import CG_ParticleMisc
import CG_ParticleDust
import CG_ParticleSparks
import CG_ParticleBulletDebris
import CG_ParticleSnowFlurry
import CG_AddParticleShrapnel
import CG_ParticleSmoke
import CG_ParticleSnow
import CG_AddParticles
import CG_ClearParticles
import trap_GetEntityToken
import trap_getCameraInfo
import trap_startCamera
import trap_loadCamera
import trap_SnapVector
import trap_CIN_SetExtents
import trap_CIN_DrawCinematic
import trap_CIN_RunCinematic
import trap_CIN_StopCinematic
import trap_CIN_PlayCinematic
import trap_Key_GetKey
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_IsDown
import trap_R_RegisterFont
import trap_MemoryRemaining
import testPrintFloat
import testPrintInt
import trap_SetUserCmdValue
import trap_GetUserCmd
import trap_GetCurrentCmdNumber
import trap_GetServerCommand
import trap_GetSnapshot
import trap_GetCurrentSnapshotNumber
import trap_GetGameState
import trap_GetGlconfig
import trap_R_inPVS
import trap_R_RemapShader
import trap_R_LerpTag
import trap_R_ModelBounds
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_LightForPoint
import trap_R_AddAdditiveLightToScene
import trap_R_AddLightToScene
import trap_R_AddPolysToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterShader
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_R_LoadWorldMap
import trap_S_StopBackgroundTrack
import trap_S_StartBackgroundTrack
import trap_S_RegisterSound
import trap_S_Respatialize
import trap_S_UpdateEntityPosition
import trap_S_AddRealLoopingSound
import trap_S_AddLoopingSound
import trap_S_ClearLoopingSounds
import trap_S_StartLocalSound
import trap_S_StopLoopingSound
import trap_S_StartSound
import trap_CM_MarkFragments
import trap_CM_TransformedCapsuleTrace
import trap_CM_TransformedBoxTrace
import trap_CM_CapsuleTrace
import trap_CM_BoxTrace
import trap_CM_TransformedPointContents
import trap_CM_PointContents
import trap_CM_TempBoxModel
import trap_CM_InlineModel
import trap_CM_NumInlineModels
import trap_CM_LoadMap
import trap_UpdateScreen
import trap_SendClientCommand
import trap_RemoveCommand
import trap_AddCommand
import trap_RealTime
import trap_SendConsoleCommand
import trap_FS_Seek
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Args
import trap_Argv
import trap_Argc
import trap_Cvar_VariableStringBuffer
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import CG_CheckChangedPredictableEvents
import CG_TransitionPlayerState
import CG_Respawn
import CG_ShaderStateChanged
import CG_SetConfigValues
import CG_ParseSysteminfo
import CG_ParseServerinfo
import CG_ExecuteNewServerCommands
import CG_InitConsoleCommands
import CG_ConsoleCommand
import CG_ScoreboardClick
import CG_DrawOldTourneyScoreboard
import CG_DrawOldScoreboard
import CG_DrawInformation
import CG_LoadingClient
import CG_LoadingItem
import CG_LoadingString
import CG_ProcessSnapshots
import CG_MakeExplosion
import CG_Bleed
import CG_BigExplode
import CG_GibPlayer
import CG_ScorePlum
import CG_SpawnEffect
import CG_BubbleTrail
import CG_SmokePuff
import CG_AddLocalEntities
import CG_AllocLocalEntity
import CG_InitLocalEntities
import CG_ImpactMark
import CG_AddMarks
import CG_InitMarkPolys
import CG_OutOfAmmoChange
import CG_DrawWeaponSelect
import CG_AddPlayerWeapon
import CG_AddViewWeapon
import CG_GrappleTrail
import CG_RailTrail
import CG_Bullet
import CG_ShotgunFire
import CG_MissileHitPlayer
import CG_MissileHitWall
import CG_FireWeapon
import CG_RegisterItemVisuals
import CG_RegisterWeapon
import CG_Weapon_f
import CG_PrevWeapon_f
import CG_NextWeapon_f
import CG_PositionRotatedEntityOnTag
import CG_PositionEntityOnTag
import CG_AdjustPositionForMover
import CG_Beam
import CG_AddPacketEntities
import CG_SetEntitySoundPosition
import CG_PainEvent
import CG_EntityEvent
import CG_PlaceString
import CG_CheckEvents
import CG_PlayDroppedEvents
import CG_LoadDeferredPlayers
import CG_PredictPlayerState
import CG_Trace
import CG_PointContents
import CG_BuildSolidList
import CG_CustomSound
import CG_NewClientInfo
import CG_AddRefEntityWithPowerups
import CG_ResetPlayerEntity
import CG_Player
import CG_TrackClientTeamChange
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
import CG_Draw3DModel
import CG_GetKillerText
import CG_GetGameStatusText
import CG_GetTeamColor
import CG_InitTeamChat
import CG_SetPrintString
import CG_ShowResponseHead
import CG_RunMenuScript
import CG_OwnerDrawVisible
import CG_GetValue
import CG_SelectNextPlayer
import CG_SelectPrevPlayer
import CG_Text_Height
import CG_Text_Width
import CG_Text_Paint
import CG_OwnerDraw
import CG_DrawTeamBackground
import CG_DrawFlagModel
import CG_DrawActive
import CG_DrawHead
import CG_CenterPrint
import CG_AddLagometerSnapshotInfo
import CG_AddLagometerFrameInfo
import teamChat2
import teamChat1
import systemChat
import drawTeamOverlayModificationCount
import numSortedTeamPlayers
import sortedTeamPlayers
import CG_SelectFont
import CG_LoadFonts
import CG_DrawString
import CG_DrawTopBottom
import CG_DrawSides
import CG_DrawRect
import UI_DrawProportionalString
import CG_GetColorForHealth
import CG_ColorForHealth
import CG_TileClear
import CG_TeamColor
import CG_FadeColorTime
import CG_FadeColor
import CG_DrawStrlen
import CG_DrawStringExt
import CG_DrawPic
import CG_FillScreen
import CG_FillRect
import CG_AdjustFrom640
import CG_DrawActiveFrame
import CG_AddBufferedSound
import CG_ZoomUp_f
import CG_ZoomDown_f
import CG_TestModelPrevSkin_f
import CG_TestModelNextSkin_f
import CG_TestModelPrevFrame_f
import CG_TestModelNextFrame_f
import CG_TestGun_f
import CG_TestModel_f
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_LoadMenus
import eventnames
export phy_movetype
align 4
LABELV phy_movetype
skip 272
export cg_timerBest_y
align 4
LABELV cg_timerBest_y
skip 272
export cg_timerBest_x
align 4
LABELV cg_timerBest_x
skip 272
export cg_timerActive_y
align 4
LABELV cg_timerActive_y
skip 272
export cg_timerActive_x
align 4
LABELV cg_timerActive_x
skip 272
export cg_timerSkim_y
align 4
LABELV cg_timerSkim_y
skip 272
export cg_timerSkim_x
align 4
LABELV cg_timerSkim_x
skip 272
export cg_speed_y
align 4
LABELV cg_speed_y
skip 272
export cg_speed_x
align 4
LABELV cg_speed_x
skip 272
export cg_followKiller
align 4
LABELV cg_followKiller
skip 272
export cg_fovAdjust
align 4
LABELV cg_fovAdjust
skip 272
export cg_deadBodyDarken
align 4
LABELV cg_deadBodyDarken
skip 272
export cg_teamColors
align 4
LABELV cg_teamColors
skip 272
export cg_teamModel
align 4
LABELV cg_teamModel
skip 272
export cg_enemyColors
align 4
LABELV cg_enemyColors
skip 272
export cg_enemyModel
align 4
LABELV cg_enemyModel
skip 272
export cg_hitSounds
align 4
LABELV cg_hitSounds
skip 272
export cg_trueLightning
align 4
LABELV cg_trueLightning
skip 272
export cg_oldPlasma
align 4
LABELV cg_oldPlasma
skip 272
export cg_oldRocket
align 4
LABELV cg_oldRocket
skip 272
export cg_oldRail
align 4
LABELV cg_oldRail
skip 272
export cg_noProjectileTrail
align 4
LABELV cg_noProjectileTrail
skip 272
export cg_noTaunt
align 4
LABELV cg_noTaunt
skip 272
export cg_bigFont
align 4
LABELV cg_bigFont
skip 272
export cg_smallFont
align 4
LABELV cg_smallFont
skip 272
export cg_cameraMode
align 4
LABELV cg_cameraMode
skip 272
export cg_timescale
align 4
LABELV cg_timescale
skip 272
export cg_timescaleFadeSpeed
align 4
LABELV cg_timescaleFadeSpeed
skip 272
export cg_timescaleFadeEnd
align 4
LABELV cg_timescaleFadeEnd
skip 272
export cg_cameraOrbitDelay
align 4
LABELV cg_cameraOrbitDelay
skip 272
export cg_cameraOrbit
align 4
LABELV cg_cameraOrbit
skip 272
export cg_smoothClients
align 4
LABELV cg_smoothClients
skip 272
export cg_scorePlum
align 4
LABELV cg_scorePlum
skip 272
export cg_teamChatsOnly
align 4
LABELV cg_teamChatsOnly
skip 272
export cg_drawFriend
align 4
LABELV cg_drawFriend
skip 272
export cg_deferPlayers
align 4
LABELV cg_deferPlayers
skip 272
export cg_predictItems
align 4
LABELV cg_predictItems
skip 272
export cg_blood
align 4
LABELV cg_blood
skip 272
export cg_paused
align 4
LABELV cg_paused
skip 272
export cg_buildScript
align 4
LABELV cg_buildScript
skip 272
export cg_forceModel
align 4
LABELV cg_forceModel
skip 272
export cg_stats
align 4
LABELV cg_stats
skip 272
export cg_teamChatHeight
align 4
LABELV cg_teamChatHeight
skip 272
export cg_teamChatTime
align 4
LABELV cg_teamChatTime
skip 272
export cg_drawSpeed
align 4
LABELV cg_drawSpeed
skip 272
export cg_drawAttacker
align 4
LABELV cg_drawAttacker
skip 272
export cg_lagometer
align 4
LABELV cg_lagometer
skip 272
export cg_thirdPerson
align 4
LABELV cg_thirdPerson
skip 272
export cg_thirdPersonAngle
align 4
LABELV cg_thirdPersonAngle
skip 272
export cg_thirdPersonRange
align 4
LABELV cg_thirdPersonRange
skip 272
export cg_zoomFov
align 4
LABELV cg_zoomFov
skip 272
export cg_fov
align 4
LABELV cg_fov
skip 272
export cg_simpleItems
align 4
LABELV cg_simpleItems
skip 272
export cg_ignore
align 4
LABELV cg_ignore
skip 272
export cg_autoswitch
align 4
LABELV cg_autoswitch
skip 272
export cg_tracerLength
align 4
LABELV cg_tracerLength
skip 272
export cg_tracerWidth
align 4
LABELV cg_tracerWidth
skip 272
export cg_tracerChance
align 4
LABELV cg_tracerChance
skip 272
export cg_viewsize
align 4
LABELV cg_viewsize
skip 272
export cg_drawGun
align 4
LABELV cg_drawGun
skip 272
export cg_gun_z
align 4
LABELV cg_gun_z
skip 272
export cg_gun_y
align 4
LABELV cg_gun_y
skip 272
export cg_gun_x
align 4
LABELV cg_gun_x
skip 272
export cg_gun_frame
align 4
LABELV cg_gun_frame
skip 272
export cg_brassTime
align 4
LABELV cg_brassTime
skip 272
export cg_addMarks
align 4
LABELV cg_addMarks
skip 272
export cg_footsteps
align 4
LABELV cg_footsteps
skip 272
export cg_showmiss
align 4
LABELV cg_showmiss
skip 272
export cg_noPlayerAnims
align 4
LABELV cg_noPlayerAnims
skip 272
export cg_nopredict
align 4
LABELV cg_nopredict
skip 272
export cg_errorDecay
align 4
LABELV cg_errorDecay
skip 272
export cg_railTrailRadius
align 4
LABELV cg_railTrailRadius
skip 272
export cg_railTrailTime
align 4
LABELV cg_railTrailTime
skip 272
export cg_debugEvents
align 4
LABELV cg_debugEvents
skip 272
export cg_debugPosition
align 4
LABELV cg_debugPosition
skip 272
export cg_debugAnim
align 4
LABELV cg_debugAnim
skip 272
export cg_animSpeed
align 4
LABELV cg_animSpeed
skip 272
export cg_draw2D
align 4
LABELV cg_draw2D
skip 272
export cg_drawStatus
align 4
LABELV cg_drawStatus
skip 272
export cg_crosshairHealth
align 4
LABELV cg_crosshairHealth
skip 272
export cg_crosshairSize
align 4
LABELV cg_crosshairSize
skip 272
export cg_crosshairY
align 4
LABELV cg_crosshairY
skip 272
export cg_crosshairX
align 4
LABELV cg_crosshairX
skip 272
export cg_drawWeaponSelect
align 4
LABELV cg_drawWeaponSelect
skip 272
export cg_teamOverlayUserinfo
align 4
LABELV cg_teamOverlayUserinfo
skip 272
export cg_drawTeamOverlay
align 4
LABELV cg_drawTeamOverlay
skip 272
export cg_drawRewards
align 4
LABELV cg_drawRewards
skip 272
export cg_drawCrosshairNames
align 4
LABELV cg_drawCrosshairNames
skip 272
export cg_drawCrosshair
align 4
LABELV cg_drawCrosshair
skip 272
export cg_drawAmmoWarning
align 4
LABELV cg_drawAmmoWarning
skip 272
export cg_drawIcons
align 4
LABELV cg_drawIcons
skip 272
export cg_draw3dIcons
align 4
LABELV cg_draw3dIcons
skip 272
export cg_drawSnapshot
align 4
LABELV cg_drawSnapshot
skip 272
export cg_drawFPS
align 4
LABELV cg_drawFPS
skip 272
export cg_drawTimer
align 4
LABELV cg_drawTimer
skip 272
export cg_gibs
align 4
LABELV cg_gibs
skip 272
export cg_shadows
align 4
LABELV cg_shadows
skip 272
export cg_swingSpeed
align 4
LABELV cg_swingSpeed
skip 272
export cg_bobroll
align 4
LABELV cg_bobroll
skip 272
export cg_bobpitch
align 4
LABELV cg_bobpitch
skip 272
export cg_bobup
align 4
LABELV cg_bobup
skip 272
export cg_runroll
align 4
LABELV cg_runroll
skip 272
export cg_runpitch
align 4
LABELV cg_runpitch
skip 272
export cg_centertime
align 4
LABELV cg_centertime
skip 272
import cg_markPolys
export cg_items
align 4
LABELV cg_items
skip 7168
export cg_weapons
align 4
LABELV cg_weapons
skip 2176
export cg_entities
align 4
LABELV cg_entities
skip 757760
export cg
align 4
LABELV cg
skip 149108
export cgs
align 4
LABELV cgs
skip 149716
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
LABELV $1088
byte 1 43
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $1067
byte 1 99
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $1066
byte 1 103
byte 1 114
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $1065
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $1062
byte 1 99
byte 1 111
byte 1 108
byte 1 108
byte 1 105
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 109
byte 1 97
byte 1 112
byte 1 0
align 1
LABELV $1059
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 47
byte 1 83
byte 1 101
byte 1 114
byte 1 118
byte 1 101
byte 1 114
byte 1 32
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 105
byte 1 115
byte 1 109
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 47
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1058
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
LABELV $1054
byte 1 100
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 45
byte 1 0
align 1
LABELV $1002
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 50
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $999
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 95
byte 1 103
byte 1 108
byte 1 111
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $996
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 49
byte 1 95
byte 1 112
byte 1 114
byte 1 111
byte 1 112
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $993
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 0
align 1
LABELV $990
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 105
byte 1 103
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $988
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 82
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 76
byte 1 105
byte 1 110
byte 1 101
byte 1 97
byte 1 114
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 84
byte 1 111
byte 1 83
byte 1 99
byte 1 101
byte 1 110
byte 1 101
byte 1 95
byte 1 81
byte 1 51
byte 1 69
byte 1 0
align 1
LABELV $985
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 82
byte 1 95
byte 1 65
byte 1 100
byte 1 100
byte 1 82
byte 1 101
byte 1 102
byte 1 69
byte 1 110
byte 1 116
byte 1 105
byte 1 116
byte 1 121
byte 1 84
byte 1 111
byte 1 83
byte 1 99
byte 1 101
byte 1 110
byte 1 101
byte 1 50
byte 1 0
align 1
LABELV $980
byte 1 47
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 112
byte 1 95
byte 1 71
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $973
byte 1 67
byte 1 71
byte 1 95
byte 1 67
byte 1 111
byte 1 110
byte 1 102
byte 1 105
byte 1 103
byte 1 83
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $948
byte 1 37
byte 1 115
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 32
byte 1 0
align 1
LABELV $934
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 51
byte 1 95
byte 1 99
byte 1 117
byte 1 114
byte 1 115
byte 1 111
byte 1 114
byte 1 50
byte 1 0
align 1
LABELV $917
byte 1 42
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $910
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 77
byte 1 97
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $907
byte 1 119
byte 1 97
byte 1 107
byte 1 101
byte 1 0
align 1
LABELV $904
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 83
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $901
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $898
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 104
byte 1 111
byte 1 108
byte 1 101
byte 1 95
byte 1 108
byte 1 103
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $895
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $892
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 95
byte 1 109
byte 1 114
byte 1 107
byte 1 0
align 1
LABELV $880
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $877
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $874
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $871
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 103
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 108
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $868
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $865
byte 1 109
byte 1 101
byte 1 100
byte 1 97
byte 1 108
byte 1 95
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 0
align 1
LABELV $862
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 111
byte 1 114
byte 1 116
byte 1 69
byte 1 102
byte 1 102
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $859
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 112
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $856
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 111
byte 1 109
byte 1 48
byte 1 49
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $853
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 48
byte 1 50
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $850
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 104
byte 1 105
byte 1 116
byte 1 115
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 108
byte 1 101
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $847
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 69
byte 1 120
byte 1 112
byte 1 108
byte 1 111
byte 1 115
byte 1 105
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $844
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 108
byte 1 108
byte 1 111
byte 1 111
byte 1 110
byte 1 51
byte 1 0
align 1
LABELV $839
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 98
byte 1 114
byte 1 97
byte 1 105
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $836
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $833
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 108
byte 1 101
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $830
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 116
byte 1 101
byte 1 115
byte 1 116
byte 1 105
byte 1 110
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $827
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 114
byte 1 101
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $824
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $821
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $818
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 101
byte 1 115
byte 1 116
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $815
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $812
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 47
byte 1 97
byte 1 98
byte 1 100
byte 1 111
byte 1 109
byte 1 101
byte 1 110
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $809
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 115
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $806
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 50
byte 1 47
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 115
byte 1 47
byte 1 109
byte 1 95
byte 1 115
byte 1 104
byte 1 101
byte 1 108
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $803
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $800
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 47
byte 1 97
byte 1 114
byte 1 109
byte 1 111
byte 1 114
byte 1 95
byte 1 121
byte 1 101
byte 1 108
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $797
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 98
byte 1 97
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $794
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
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
LABELV $791
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 101
byte 1 0
align 1
LABELV $783
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 119
byte 1 104
byte 1 105
byte 1 116
byte 1 101
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $780
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $777
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 46
byte 1 115
byte 1 107
byte 1 105
byte 1 110
byte 1 0
align 1
LABELV $774
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 102
byte 1 108
byte 1 97
byte 1 112
byte 1 51
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $771
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 50
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 112
byte 1 111
byte 1 108
byte 1 101
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $768
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 51
byte 1 0
align 1
LABELV $764
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 50
byte 1 0
align 1
LABELV $760
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 49
byte 1 0
align 1
LABELV $757
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $753
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 50
byte 1 0
align 1
LABELV $749
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 102
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 49
byte 1 0
align 1
LABELV $746
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 98
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $743
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 115
byte 1 47
byte 1 114
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $735
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $732
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 115
byte 1 107
byte 1 117
byte 1 108
byte 1 108
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $729
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 98
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $726
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 115
byte 1 47
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 111
byte 1 114
byte 1 98
byte 1 47
byte 1 114
byte 1 95
byte 1 111
byte 1 114
byte 1 98
byte 1 46
byte 1 109
byte 1 100
byte 1 51
byte 1 0
align 1
LABELV $718
byte 1 104
byte 1 97
byte 1 115
byte 1 116
byte 1 101
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $715
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $712
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 105
byte 1 110
byte 1 118
byte 1 105
byte 1 115
byte 1 105
byte 1 98
byte 1 105
byte 1 108
byte 1 105
byte 1 116
byte 1 121
byte 1 0
align 1
LABELV $709
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $706
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 97
byte 1 116
byte 1 116
byte 1 108
byte 1 101
byte 1 83
byte 1 117
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $703
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $700
byte 1 112
byte 1 111
byte 1 119
byte 1 101
byte 1 114
byte 1 117
byte 1 112
byte 1 115
byte 1 47
byte 1 113
byte 1 117
byte 1 97
byte 1 100
byte 1 0
align 1
LABELV $697
byte 1 105
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 111
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 0
align 1
LABELV $694
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $691
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 37
byte 1 99
byte 1 0
align 1
LABELV $684
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $681
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 109
byte 1 105
byte 1 115
byte 1 99
byte 1 47
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $678
byte 1 119
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 66
byte 1 117
byte 1 98
byte 1 98
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $675
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
LABELV $672
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $669
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $666
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 116
byte 1 101
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 49
byte 1 0
align 1
LABELV $663
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 103
byte 1 117
byte 1 110
byte 1 83
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $660
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 82
byte 1 97
byte 1 103
byte 1 101
byte 1 80
byte 1 114
byte 1 111
byte 1 0
align 1
LABELV $657
byte 1 115
byte 1 109
byte 1 111
byte 1 107
byte 1 101
byte 1 80
byte 1 117
byte 1 102
byte 1 102
byte 1 0
align 1
LABELV $654
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $651
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $648
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 112
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $645
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 116
byte 1 97
byte 1 98
byte 1 47
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $642
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $639
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 66
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 66
byte 1 108
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $636
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 53
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $632
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 52
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $628
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 51
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $624
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 50
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $620
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 115
byte 1 107
byte 1 105
byte 1 108
byte 1 108
byte 1 49
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $611
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 32
byte 1 109
byte 1 101
byte 1 100
byte 1 105
byte 1 97
byte 1 0
align 1
LABELV $606
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 115
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $605
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 110
byte 1 105
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $604
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $603
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $602
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 115
byte 1 105
byte 1 120
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $601
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $600
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 102
byte 1 111
byte 1 117
byte 1 114
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $599
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $598
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $597
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $596
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 117
byte 1 109
byte 1 98
byte 1 101
byte 1 114
byte 1 115
byte 1 47
byte 1 122
byte 1 101
byte 1 114
byte 1 111
byte 1 95
byte 1 51
byte 1 50
byte 1 98
byte 1 0
align 1
LABELV $593
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 104
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 98
byte 1 50
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $590
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 97
byte 1 100
byte 1 101
byte 1 47
byte 1 104
byte 1 103
byte 1 114
byte 1 101
byte 1 110
byte 1 98
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $587
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
byte 1 110
byte 1 95
byte 1 104
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $584
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
byte 1 114
byte 1 111
byte 1 116
byte 1 101
byte 1 99
byte 1 116
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $581
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
byte 1 114
byte 1 101
byte 1 103
byte 1 101
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $578
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 120
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $575
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 47
byte 1 114
byte 1 111
byte 1 99
byte 1 107
byte 1 108
byte 1 120
byte 1 49
byte 1 97
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $572
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $569
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $566
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 114
byte 1 105
byte 1 99
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $563
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
byte 1 100
byte 1 97
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $560
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
byte 1 117
byte 1 115
byte 1 101
byte 1 95
byte 1 109
byte 1 101
byte 1 100
byte 1 107
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $557
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
byte 1 102
byte 1 108
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $538
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 99
byte 1 108
byte 1 97
byte 1 110
byte 1 107
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $534
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 112
byte 1 108
byte 1 97
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $530
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 101
byte 1 110
byte 1 101
byte 1 114
byte 1 103
byte 1 121
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $526
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 109
byte 1 101
byte 1 99
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $522
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 102
byte 1 108
byte 1 101
byte 1 115
byte 1 104
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $518
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 98
byte 1 111
byte 1 111
byte 1 116
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $515
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 47
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 37
byte 1 105
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $510
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
LABELV $507
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 117
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $504
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $501
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 119
byte 1 97
byte 1 116
byte 1 114
byte 1 95
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $498
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 108
byte 1 111
byte 1 115
byte 1 116
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $495
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $492
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $489
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 110
byte 1 115
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $486
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 97
byte 1 115
byte 1 115
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $483
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 117
byte 1 109
byte 1 105
byte 1 108
byte 1 105
byte 1 97
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $480
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 100
byte 1 101
byte 1 110
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $477
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 108
byte 1 108
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $474
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 105
byte 1 109
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 105
byte 1 118
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $471
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $468
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 49
byte 1 48
byte 1 48
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $464
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 55
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $460
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 53
byte 1 48
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $456
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 50
byte 1 53
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $453
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 108
byte 1 97
byte 1 110
byte 1 100
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $450
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 116
byte 1 97
byte 1 108
byte 1 107
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $447
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 110
byte 1 111
byte 1 97
byte 1 109
byte 1 109
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $444
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
byte 1 114
byte 1 101
byte 1 115
byte 1 112
byte 1 97
byte 1 119
byte 1 110
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $441
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
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 111
byte 1 117
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $438
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
byte 1 116
byte 1 101
byte 1 108
byte 1 101
byte 1 105
byte 1 110
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $435
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 51
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $432
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 50
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $429
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 105
byte 1 109
byte 1 112
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $426
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 47
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 112
byte 1 108
byte 1 116
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $423
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
byte 1 117
byte 1 115
byte 1 101
byte 1 95
byte 1 110
byte 1 111
byte 1 116
byte 1 104
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $420
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
byte 1 119
byte 1 101
byte 1 97
byte 1 114
byte 1 111
byte 1 102
byte 1 102
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $417
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $414
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 119
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 115
byte 1 47
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 105
byte 1 110
byte 1 101
byte 1 103
byte 1 117
byte 1 110
byte 1 47
byte 1 98
byte 1 117
byte 1 108
byte 1 101
byte 1 116
byte 1 98
byte 1 121
byte 1 49
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $411
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 49
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $408
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 49
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $405
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 104
byte 1 111
byte 1 108
byte 1 121
byte 1 115
byte 1 104
byte 1 105
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $402
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $399
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $396
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 95
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $393
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $390
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $382
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $379
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 116
byte 1 97
byte 1 107
byte 1 101
byte 1 110
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $376
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $373
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 114
byte 1 101
byte 1 116
byte 1 117
byte 1 114
byte 1 110
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $370
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 111
byte 1 112
byte 1 112
byte 1 111
byte 1 110
byte 1 101
byte 1 110
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $365
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $362
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 118
byte 1 111
byte 1 99
byte 1 95
byte 1 114
byte 1 101
byte 1 100
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $359
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 104
byte 1 105
byte 1 116
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 109
byte 1 97
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $356
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 115
byte 1 116
byte 1 105
byte 1 101
byte 1 100
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $353
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 98
byte 1 108
byte 1 117
byte 1 101
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $350
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 114
byte 1 101
byte 1 100
byte 1 108
byte 1 101
byte 1 97
byte 1 100
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $347
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 47
byte 1 102
byte 1 108
byte 1 97
byte 1 103
byte 1 99
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 95
byte 1 121
byte 1 111
byte 1 117
byte 1 114
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $339
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 112
byte 1 114
byte 1 101
byte 1 112
byte 1 97
byte 1 114
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $336
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 102
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $333
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 111
byte 1 110
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $330
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 119
byte 1 111
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $327
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 116
byte 1 104
byte 1 114
byte 1 101
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $324
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 51
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $321
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 50
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 115
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $318
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 49
byte 1 95
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $315
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 115
byte 1 117
byte 1 100
byte 1 100
byte 1 101
byte 1 110
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 116
byte 1 104
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $312
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 53
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $309
byte 1 115
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 47
byte 1 102
byte 1 101
byte 1 101
byte 1 100
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 47
byte 1 49
byte 1 95
byte 1 109
byte 1 105
byte 1 110
byte 1 117
byte 1 116
byte 1 101
byte 1 46
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $305
byte 1 119
byte 1 97
byte 1 118
byte 1 0
align 1
LABELV $299
byte 1 80
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 104
byte 1 97
byte 1 115
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 112
byte 1 114
byte 1 101
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $228
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
LABELV $227
byte 1 114
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 114
byte 1 47
byte 1 112
byte 1 109
byte 1 0
align 1
LABELV $226
byte 1 109
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $219
byte 1 115
byte 1 118
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $213
byte 1 112
byte 1 104
byte 1 121
byte 1 95
byte 1 109
byte 1 111
byte 1 118
byte 1 101
byte 1 116
byte 1 121
byte 1 112
byte 1 101
byte 1 0
align 1
LABELV $212
byte 1 48
byte 1 46
byte 1 55
byte 1 0
align 1
LABELV $211
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 83
byte 1 107
byte 1 105
byte 1 109
byte 1 95
byte 1 121
byte 1 0
align 1
LABELV $210
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 83
byte 1 107
byte 1 105
byte 1 109
byte 1 95
byte 1 120
byte 1 0
align 1
LABELV $209
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 66
byte 1 101
byte 1 115
byte 1 116
byte 1 95
byte 1 121
byte 1 0
align 1
LABELV $208
byte 1 48
byte 1 46
byte 1 56
byte 1 0
align 1
LABELV $207
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 66
byte 1 101
byte 1 115
byte 1 116
byte 1 95
byte 1 120
byte 1 0
align 1
LABELV $206
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 121
byte 1 0
align 1
LABELV $205
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 95
byte 1 120
byte 1 0
align 1
LABELV $204
byte 1 48
byte 1 46
byte 1 53
byte 1 53
byte 1 0
align 1
LABELV $203
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 95
byte 1 121
byte 1 0
align 1
LABELV $202
byte 1 48
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $201
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 95
byte 1 120
byte 1 0
align 1
LABELV $200
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 75
byte 1 105
byte 1 108
byte 1 108
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $199
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 65
byte 1 100
byte 1 106
byte 1 117
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $198
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 97
byte 1 100
byte 1 66
byte 1 111
byte 1 100
byte 1 121
byte 1 68
byte 1 97
byte 1 114
byte 1 107
byte 1 101
byte 1 110
byte 1 0
align 1
LABELV $197
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $196
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $195
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 67
byte 1 111
byte 1 108
byte 1 111
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $194
byte 1 0
align 1
LABELV $193
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 110
byte 1 101
byte 1 109
byte 1 121
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $192
byte 1 99
byte 1 103
byte 1 95
byte 1 104
byte 1 105
byte 1 116
byte 1 83
byte 1 111
byte 1 117
byte 1 110
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $191
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 117
byte 1 101
byte 1 76
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $190
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 80
byte 1 108
byte 1 97
byte 1 115
byte 1 109
byte 1 97
byte 1 0
align 1
LABELV $189
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 111
byte 1 99
byte 1 107
byte 1 101
byte 1 116
byte 1 0
align 1
LABELV $188
byte 1 99
byte 1 103
byte 1 95
byte 1 111
byte 1 108
byte 1 100
byte 1 82
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $187
byte 1 117
byte 1 105
byte 1 95
byte 1 98
byte 1 105
byte 1 103
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $186
byte 1 48
byte 1 46
byte 1 50
byte 1 53
byte 1 0
align 1
LABELV $185
byte 1 117
byte 1 105
byte 1 95
byte 1 115
byte 1 109
byte 1 97
byte 1 108
byte 1 108
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $184
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 80
byte 1 114
byte 1 111
byte 1 106
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 108
byte 1 101
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 0
align 1
LABELV $183
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 84
byte 1 97
byte 1 117
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $182
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 0
align 1
LABELV $181
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 109
byte 1 111
byte 1 111
byte 1 116
byte 1 104
byte 1 67
byte 1 108
byte 1 105
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $180
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 99
byte 1 111
byte 1 114
byte 1 101
byte 1 80
byte 1 108
byte 1 117
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $179
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $178
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $177
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 115
byte 1 99
byte 1 97
byte 1 108
byte 1 101
byte 1 70
byte 1 97
byte 1 100
byte 1 101
byte 1 69
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $176
byte 1 53
byte 1 48
byte 1 0
align 1
LABELV $175
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 68
byte 1 101
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $174
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 97
byte 1 109
byte 1 101
byte 1 114
byte 1 97
byte 1 79
byte 1 114
byte 1 98
byte 1 105
byte 1 116
byte 1 0
align 1
LABELV $173
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 108
byte 1 111
byte 1 111
byte 1 100
byte 1 0
align 1
LABELV $172
byte 1 99
byte 1 108
byte 1 95
byte 1 112
byte 1 97
byte 1 117
byte 1 115
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $171
byte 1 99
byte 1 111
byte 1 109
byte 1 95
byte 1 98
byte 1 117
byte 1 105
byte 1 108
byte 1 100
byte 1 83
byte 1 99
byte 1 114
byte 1 105
byte 1 112
byte 1 116
byte 1 0
align 1
LABELV $170
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 115
byte 1 79
byte 1 110
byte 1 108
byte 1 121
byte 1 0
align 1
LABELV $169
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 114
byte 1 105
byte 1 101
byte 1 110
byte 1 100
byte 1 0
align 1
LABELV $168
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 116
byte 1 97
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $167
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
LABELV $166
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 118
byte 1 101
byte 1 114
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $165
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 102
byte 1 101
byte 1 114
byte 1 80
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $164
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
LABELV $163
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 114
byte 1 99
byte 1 101
byte 1 77
byte 1 111
byte 1 100
byte 1 101
byte 1 108
byte 1 0
align 1
LABELV $162
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 72
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 0
align 1
LABELV $161
byte 1 51
byte 1 48
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $160
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 67
byte 1 104
byte 1 97
byte 1 116
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $159
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 0
align 1
LABELV $158
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 65
byte 1 110
byte 1 103
byte 1 108
byte 1 101
byte 1 0
align 1
LABELV $157
byte 1 52
byte 1 48
byte 1 0
align 1
LABELV $156
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 104
byte 1 105
byte 1 114
byte 1 100
byte 1 80
byte 1 101
byte 1 114
byte 1 115
byte 1 111
byte 1 110
byte 1 82
byte 1 97
byte 1 110
byte 1 103
byte 1 101
byte 1 0
align 1
LABELV $155
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $154
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $153
byte 1 48
byte 1 46
byte 1 52
byte 1 0
align 1
LABELV $152
byte 1 99
byte 1 103
byte 1 95
byte 1 116
byte 1 114
byte 1 97
byte 1 99
byte 1 101
byte 1 114
byte 1 99
byte 1 104
byte 1 97
byte 1 110
byte 1 99
byte 1 101
byte 1 0
align 1
LABELV $151
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 111
byte 1 116
byte 1 115
byte 1 116
byte 1 101
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $150
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 111
byte 1 119
byte 1 109
byte 1 105
byte 1 115
byte 1 115
byte 1 0
align 1
LABELV $149
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 101
byte 1 114
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $148
byte 1 99
byte 1 103
byte 1 95
byte 1 110
byte 1 111
byte 1 112
byte 1 114
byte 1 101
byte 1 100
byte 1 105
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $147
byte 1 99
byte 1 103
byte 1 95
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 100
byte 1 101
byte 1 99
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $146
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 101
byte 1 118
byte 1 101
byte 1 110
byte 1 116
byte 1 115
byte 1 0
align 1
LABELV $145
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
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
LABELV $144
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 101
byte 1 98
byte 1 117
byte 1 103
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 0
align 1
LABELV $143
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 110
byte 1 105
byte 1 109
byte 1 115
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $142
byte 1 48
byte 1 46
byte 1 51
byte 1 0
align 1
LABELV $141
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $140
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $139
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $138
byte 1 48
byte 1 46
byte 1 48
byte 1 0
align 1
LABELV $137
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 111
byte 1 98
byte 1 117
byte 1 112
byte 1 0
align 1
LABELV $136
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 53
byte 1 0
align 1
LABELV $135
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 114
byte 1 111
byte 1 108
byte 1 108
byte 1 0
align 1
LABELV $134
byte 1 48
byte 1 46
byte 1 48
byte 1 48
byte 1 50
byte 1 0
align 1
LABELV $133
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 117
byte 1 110
byte 1 112
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $132
byte 1 51
byte 1 0
align 1
LABELV $131
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 101
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $130
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 90
byte 1 0
align 1
LABELV $129
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 89
byte 1 0
align 1
LABELV $128
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 117
byte 1 110
byte 1 88
byte 1 0
align 1
LABELV $127
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 82
byte 1 97
byte 1 100
byte 1 105
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $126
byte 1 52
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $125
byte 1 99
byte 1 103
byte 1 95
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 114
byte 1 97
byte 1 105
byte 1 108
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $124
byte 1 99
byte 1 103
byte 1 95
byte 1 108
byte 1 97
byte 1 103
byte 1 111
byte 1 109
byte 1 101
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $123
byte 1 99
byte 1 103
byte 1 95
byte 1 109
byte 1 97
byte 1 114
byte 1 107
byte 1 115
byte 1 0
align 1
LABELV $122
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 105
byte 1 109
byte 1 112
byte 1 108
byte 1 101
byte 1 73
byte 1 116
byte 1 101
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $121
byte 1 50
byte 1 53
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $120
byte 1 99
byte 1 103
byte 1 95
byte 1 98
byte 1 114
byte 1 97
byte 1 115
byte 1 115
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $119
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 89
byte 1 0
align 1
LABELV $118
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 88
byte 1 0
align 1
LABELV $117
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 72
byte 1 101
byte 1 97
byte 1 108
byte 1 116
byte 1 104
byte 1 0
align 1
LABELV $116
byte 1 50
byte 1 52
byte 1 0
align 1
LABELV $115
byte 1 99
byte 1 103
byte 1 95
byte 1 99
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 83
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $114
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 87
byte 1 101
byte 1 97
byte 1 112
byte 1 111
byte 1 110
byte 1 83
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $113
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 82
byte 1 101
byte 1 119
byte 1 97
byte 1 114
byte 1 100
byte 1 115
byte 1 0
align 1
LABELV $112
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 78
byte 1 97
byte 1 109
byte 1 101
byte 1 115
byte 1 0
align 1
LABELV $111
byte 1 52
byte 1 0
align 1
LABELV $110
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 67
byte 1 114
byte 1 111
byte 1 115
byte 1 115
byte 1 104
byte 1 97
byte 1 105
byte 1 114
byte 1 0
align 1
LABELV $109
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 112
byte 1 101
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $108
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 116
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $107
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 65
byte 1 109
byte 1 109
byte 1 111
byte 1 87
byte 1 97
byte 1 114
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $106
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $105
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 51
byte 1 100
byte 1 73
byte 1 99
byte 1 111
byte 1 110
byte 1 115
byte 1 0
align 1
LABELV $104
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 110
byte 1 97
byte 1 112
byte 1 115
byte 1 104
byte 1 111
byte 1 116
byte 1 0
align 1
LABELV $103
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 70
byte 1 80
byte 1 83
byte 1 0
align 1
LABELV $102
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 84
byte 1 105
byte 1 109
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $101
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 83
byte 1 116
byte 1 97
byte 1 116
byte 1 117
byte 1 115
byte 1 0
align 1
LABELV $100
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 50
byte 1 68
byte 1 0
align 1
LABELV $99
byte 1 99
byte 1 103
byte 1 95
byte 1 103
byte 1 105
byte 1 98
byte 1 115
byte 1 0
align 1
LABELV $98
byte 1 99
byte 1 103
byte 1 95
byte 1 115
byte 1 104
byte 1 97
byte 1 100
byte 1 111
byte 1 119
byte 1 115
byte 1 0
align 1
LABELV $97
byte 1 49
byte 1 48
byte 1 48
byte 1 0
align 1
LABELV $96
byte 1 99
byte 1 103
byte 1 95
byte 1 118
byte 1 105
byte 1 101
byte 1 119
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 0
align 1
LABELV $95
byte 1 49
byte 1 48
byte 1 53
byte 1 0
align 1
LABELV $94
byte 1 99
byte 1 103
byte 1 95
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $93
byte 1 50
byte 1 50
byte 1 46
byte 1 53
byte 1 0
align 1
LABELV $92
byte 1 99
byte 1 103
byte 1 95
byte 1 122
byte 1 111
byte 1 111
byte 1 109
byte 1 102
byte 1 111
byte 1 118
byte 1 0
align 1
LABELV $91
byte 1 99
byte 1 103
byte 1 95
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 71
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $90
byte 1 49
byte 1 0
align 1
LABELV $89
byte 1 99
byte 1 103
byte 1 95
byte 1 97
byte 1 117
byte 1 116
byte 1 111
byte 1 115
byte 1 119
byte 1 105
byte 1 116
byte 1 99
byte 1 104
byte 1 0
align 1
LABELV $88
byte 1 48
byte 1 0
align 1
LABELV $87
byte 1 99
byte 1 103
byte 1 95
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 101
byte 1 0
align 1
LABELV $84
byte 1 118
byte 1 109
byte 1 77
byte 1 97
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 32
byte 1 99
byte 1 111
byte 1 109
byte 1 109
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 0
