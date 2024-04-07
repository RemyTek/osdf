data
align 4
LABELV specifyserver_artlist
address $68
address $69
address $70
address $71
address $72
address $73
byte 4 0
code
proc SpecifyServer_Event 272 16
file "../../../../code/q3_ui/ui_specifyserver.c"
line 40
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:/*********************************************************************************
;6:    SPECIFY SERVER
;7:*********************************************************************************/
;8:
;9:#define SPECIFYSERVER_FRAMEL "menu/art/frame2_l"
;10:#define SPECIFYSERVER_FRAMER "menu/art/frame1_r"
;11:#define SPECIFYSERVER_BACK0  "menu/art/back_0"
;12:#define SPECIFYSERVER_BACK1  "menu/art/back_1"
;13:#define SPECIFYSERVER_FIGHT0 "menu/art/fight_0"
;14:#define SPECIFYSERVER_FIGHT1 "menu/art/fight_1"
;15:
;16:#define ID_SPECIFYSERVERBACK 102
;17:#define ID_SPECIFYSERVERGO   103
;18:
;19:static char* specifyserver_artlist[] = {
;20:	SPECIFYSERVER_FRAMEL, SPECIFYSERVER_FRAMER, SPECIFYSERVER_BACK0, SPECIFYSERVER_BACK1, SPECIFYSERVER_FIGHT0, SPECIFYSERVER_FIGHT1, NULL};
;21:
;22:typedef struct {
;23:	menuframework_s menu;
;24:	menutext_s      banner;
;25:	menubitmap_s    framel;
;26:	menubitmap_s    framer;
;27:	menufield_s     domain;
;28:	menufield_s     port;
;29:	menubitmap_s    go;
;30:	menubitmap_s    back;
;31:} specifyserver_t;
;32:
;33:static specifyserver_t s_specifyserver;
;34:
;35:/*
;36:=================
;37:SpecifyServer_Event
;38:=================
;39:*/
;40:static void SpecifyServer_Event(void* ptr, int event) {
line 43
;41:	char buff[256];
;42:
;43:	switch (((menucommon_s*)ptr)->id) {
ADDRLP4 256
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 256
INDIRI4
CNSTI4 102
EQI4 $100
ADDRLP4 256
INDIRI4
CNSTI4 103
EQI4 $79
ADDRGP4 $76
JUMPV
LABELV $79
line 45
;44:	case ID_SPECIFYSERVERGO:
;45:		if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $80
line 46
;46:			break;
ADDRGP4 $77
JUMPV
LABELV $80
line 48
;47:
;48:		if (s_specifyserver.domain.field.buffer[0]) {
ADDRGP4 s_specifyserver+548+64+12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $77
line 49
;49:			strcpy(buff, s_specifyserver.domain.field.buffer);
ADDRLP4 0
ARGP4
ADDRGP4 s_specifyserver+548+64+12
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 50
;50:			if (s_specifyserver.port.field.buffer[0])
ADDRGP4 s_specifyserver+888+64+12
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $90
line 51
;51:				Com_sprintf(buff + strlen(buff), 128, ":%s", s_specifyserver.port.field.buffer);
ADDRLP4 0
ARGP4
ADDRLP4 264
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 264
INDIRI4
ADDRLP4 0
ADDP4
ARGP4
CNSTI4 128
ARGI4
ADDRGP4 $95
ARGP4
ADDRGP4 s_specifyserver+888+64+12
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
LABELV $90
line 53
;52:
;53:			trap_Cmd_ExecuteText(EXEC_APPEND, va("connect %s\n", buff));
ADDRGP4 $99
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 268
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 2
ARGI4
ADDRLP4 268
INDIRP4
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 54
;54:		}
line 55
;55:		break;
ADDRGP4 $77
JUMPV
LABELV $100
line 58
;56:
;57:	case ID_SPECIFYSERVERBACK:
;58:		if (event != QM_ACTIVATED)
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $101
line 59
;59:			break;
ADDRGP4 $77
JUMPV
LABELV $101
line 61
;60:
;61:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 62
;62:		break;
LABELV $76
LABELV $77
line 64
;63:	}
;64:}
LABELV $75
endproc SpecifyServer_Event 272 16
export SpecifyServer_MenuInit
proc SpecifyServer_MenuInit 0 16
line 71
;65:
;66:/*
;67:=================
;68:SpecifyServer_MenuInit
;69:=================
;70:*/
;71:void SpecifyServer_MenuInit(void) {
line 73
;72:	// zero set all our globals
;73:	memset(&s_specifyserver, 0, sizeof(specifyserver_t));
ADDRGP4 s_specifyserver
ARGP4
CNSTI4 0
ARGI4
CNSTI4 1412
ARGI4
ADDRGP4 memset
CALLP4
pop
line 75
;74:
;75:	SpecifyServer_Cache();
ADDRGP4 SpecifyServer_Cache
CALLV
pop
line 77
;76:
;77:	s_specifyserver.menu.wrapAround = qtrue;
ADDRGP4 s_specifyserver+276
CNSTI4 1
ASGNI4
line 78
;78:	s_specifyserver.menu.fullscreen = qtrue;
ADDRGP4 s_specifyserver+280
CNSTI4 1
ASGNI4
line 80
;79:
;80:	s_specifyserver.banner.generic.type = MTYPE_BTEXT;
ADDRGP4 s_specifyserver+288
CNSTI4 10
ASGNI4
line 81
;81:	s_specifyserver.banner.generic.x    = 320;
ADDRGP4 s_specifyserver+288+12
CNSTI4 320
ASGNI4
line 82
;82:	s_specifyserver.banner.generic.y    = 16;
ADDRGP4 s_specifyserver+288+16
CNSTI4 16
ASGNI4
line 83
;83:	s_specifyserver.banner.string       = "SPECIFY SERVER";
ADDRGP4 s_specifyserver+288+64
ADDRGP4 $113
ASGNP4
line 84
;84:	s_specifyserver.banner.color        = color_white;
ADDRGP4 s_specifyserver+288+72
ADDRGP4 color_white
ASGNP4
line 85
;85:	s_specifyserver.banner.style        = UI_CENTER;
ADDRGP4 s_specifyserver+288+68
CNSTI4 1
ASGNI4
line 87
;86:
;87:	s_specifyserver.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifyserver+364
CNSTI4 6
ASGNI4
line 88
;88:	s_specifyserver.framel.generic.name  = SPECIFYSERVER_FRAMEL;
ADDRGP4 s_specifyserver+364+4
ADDRGP4 $68
ASGNP4
line 89
;89:	s_specifyserver.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifyserver+364+44
CNSTU4 16384
ASGNU4
line 90
;90:	s_specifyserver.framel.generic.x     = 0;
ADDRGP4 s_specifyserver+364+12
CNSTI4 0
ASGNI4
line 91
;91:	s_specifyserver.framel.generic.y     = 78;
ADDRGP4 s_specifyserver+364+16
CNSTI4 78
ASGNI4
line 92
;92:	s_specifyserver.framel.width         = 256;
ADDRGP4 s_specifyserver+364+80
CNSTI4 256
ASGNI4
line 93
;93:	s_specifyserver.framel.height        = 329;
ADDRGP4 s_specifyserver+364+84
CNSTI4 329
ASGNI4
line 95
;94:
;95:	s_specifyserver.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_specifyserver+456
CNSTI4 6
ASGNI4
line 96
;96:	s_specifyserver.framer.generic.name  = SPECIFYSERVER_FRAMER;
ADDRGP4 s_specifyserver+456+4
ADDRGP4 $69
ASGNP4
line 97
;97:	s_specifyserver.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_specifyserver+456+44
CNSTU4 16384
ASGNU4
line 98
;98:	s_specifyserver.framer.generic.x     = 376;
ADDRGP4 s_specifyserver+456+12
CNSTI4 376
ASGNI4
line 99
;99:	s_specifyserver.framer.generic.y     = 76;
ADDRGP4 s_specifyserver+456+16
CNSTI4 76
ASGNI4
line 100
;100:	s_specifyserver.framer.width         = 256;
ADDRGP4 s_specifyserver+456+80
CNSTI4 256
ASGNI4
line 101
;101:	s_specifyserver.framer.height        = 334;
ADDRGP4 s_specifyserver+456+84
CNSTI4 334
ASGNI4
line 103
;102:
;103:	s_specifyserver.domain.generic.type       = MTYPE_FIELD;
ADDRGP4 s_specifyserver+548
CNSTI4 4
ASGNI4
line 104
;104:	s_specifyserver.domain.generic.name       = "Address:";
ADDRGP4 s_specifyserver+548+4
ADDRGP4 $147
ASGNP4
line 105
;105:	s_specifyserver.domain.generic.flags      = QMF_PULSEIFFOCUS | QMF_SMALLFONT;
ADDRGP4 s_specifyserver+548+44
CNSTU4 258
ASGNU4
line 106
;106:	s_specifyserver.domain.generic.x          = 206;
ADDRGP4 s_specifyserver+548+12
CNSTI4 206
ASGNI4
line 107
;107:	s_specifyserver.domain.generic.y          = 220;
ADDRGP4 s_specifyserver+548+16
CNSTI4 220
ASGNI4
line 108
;108:	s_specifyserver.domain.field.widthInChars = 38;
ADDRGP4 s_specifyserver+548+64+8
CNSTI4 38
ASGNI4
line 109
;109:	s_specifyserver.domain.field.maxchars     = 80;
ADDRGP4 s_specifyserver+548+64+268
CNSTI4 80
ASGNI4
line 111
;110:
;111:	s_specifyserver.port.generic.type       = MTYPE_FIELD;
ADDRGP4 s_specifyserver+888
CNSTI4 4
ASGNI4
line 112
;112:	s_specifyserver.port.generic.name       = "Port:";
ADDRGP4 s_specifyserver+888+4
ADDRGP4 $163
ASGNP4
line 113
;113:	s_specifyserver.port.generic.flags      = QMF_PULSEIFFOCUS | QMF_SMALLFONT | QMF_NUMBERSONLY;
ADDRGP4 s_specifyserver+888+44
CNSTU4 290
ASGNU4
line 114
;114:	s_specifyserver.port.generic.x          = 206;
ADDRGP4 s_specifyserver+888+12
CNSTI4 206
ASGNI4
line 115
;115:	s_specifyserver.port.generic.y          = 250;
ADDRGP4 s_specifyserver+888+16
CNSTI4 250
ASGNI4
line 116
;116:	s_specifyserver.port.field.widthInChars = 6;
ADDRGP4 s_specifyserver+888+64+8
CNSTI4 6
ASGNI4
line 117
;117:	s_specifyserver.port.field.maxchars     = 5;
ADDRGP4 s_specifyserver+888+64+268
CNSTI4 5
ASGNI4
line 119
;118:
;119:	s_specifyserver.go.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_specifyserver+1228
CNSTI4 6
ASGNI4
line 120
;120:	s_specifyserver.go.generic.name     = SPECIFYSERVER_FIGHT0;
ADDRGP4 s_specifyserver+1228+4
ADDRGP4 $72
ASGNP4
line 121
;121:	s_specifyserver.go.generic.flags    = QMF_RIGHT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_specifyserver+1228+44
CNSTU4 272
ASGNU4
line 122
;122:	s_specifyserver.go.generic.callback = SpecifyServer_Event;
ADDRGP4 s_specifyserver+1228+48
ADDRGP4 SpecifyServer_Event
ASGNP4
line 123
;123:	s_specifyserver.go.generic.id       = ID_SPECIFYSERVERGO;
ADDRGP4 s_specifyserver+1228+8
CNSTI4 103
ASGNI4
line 124
;124:	s_specifyserver.go.generic.x        = 640;
ADDRGP4 s_specifyserver+1228+12
CNSTI4 640
ASGNI4
line 125
;125:	s_specifyserver.go.generic.y        = 480 - 64;
ADDRGP4 s_specifyserver+1228+16
CNSTI4 416
ASGNI4
line 126
;126:	s_specifyserver.go.width            = 128;
ADDRGP4 s_specifyserver+1228+80
CNSTI4 128
ASGNI4
line 127
;127:	s_specifyserver.go.height           = 64;
ADDRGP4 s_specifyserver+1228+84
CNSTI4 64
ASGNI4
line 128
;128:	s_specifyserver.go.focuspic         = SPECIFYSERVER_FIGHT1;
ADDRGP4 s_specifyserver+1228+64
ADDRGP4 $73
ASGNP4
line 130
;129:
;130:	s_specifyserver.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_specifyserver+1320
CNSTI4 6
ASGNI4
line 131
;131:	s_specifyserver.back.generic.name     = SPECIFYSERVER_BACK0;
ADDRGP4 s_specifyserver+1320+4
ADDRGP4 $70
ASGNP4
line 132
;132:	s_specifyserver.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_specifyserver+1320+44
CNSTU4 260
ASGNU4
line 133
;133:	s_specifyserver.back.generic.callback = SpecifyServer_Event;
ADDRGP4 s_specifyserver+1320+48
ADDRGP4 SpecifyServer_Event
ASGNP4
line 134
;134:	s_specifyserver.back.generic.id       = ID_SPECIFYSERVERBACK;
ADDRGP4 s_specifyserver+1320+8
CNSTI4 102
ASGNI4
line 135
;135:	s_specifyserver.back.generic.x        = 0;
ADDRGP4 s_specifyserver+1320+12
CNSTI4 0
ASGNI4
line 136
;136:	s_specifyserver.back.generic.y        = 480 - 64;
ADDRGP4 s_specifyserver+1320+16
CNSTI4 416
ASGNI4
line 137
;137:	s_specifyserver.back.width            = 128;
ADDRGP4 s_specifyserver+1320+80
CNSTI4 128
ASGNI4
line 138
;138:	s_specifyserver.back.height           = 64;
ADDRGP4 s_specifyserver+1320+84
CNSTI4 64
ASGNI4
line 139
;139:	s_specifyserver.back.focuspic         = SPECIFYSERVER_BACK1;
ADDRGP4 s_specifyserver+1320+64
ADDRGP4 $71
ASGNP4
line 141
;140:
;141:	Menu_AddItem(&s_specifyserver.menu, &s_specifyserver.banner);
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 142
;142:	Menu_AddItem(&s_specifyserver.menu, &s_specifyserver.framel);
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 143
;143:	Menu_AddItem(&s_specifyserver.menu, &s_specifyserver.framer);
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 144
;144:	Menu_AddItem(&s_specifyserver.menu, &s_specifyserver.domain);
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 145
;145:	Menu_AddItem(&s_specifyserver.menu, &s_specifyserver.port);
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+888
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 146
;146:	Menu_AddItem(&s_specifyserver.menu, &s_specifyserver.go);
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+1228
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 147
;147:	Menu_AddItem(&s_specifyserver.menu, &s_specifyserver.back);
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 s_specifyserver+1320
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 149
;148:
;149:	Com_sprintf(s_specifyserver.port.field.buffer, 6, "%i", 27960);
ADDRGP4 s_specifyserver+888+64+12
ARGP4
CNSTI4 6
ARGI4
ADDRGP4 $224
ARGP4
CNSTI4 27960
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 150
;150:}
LABELV $103
endproc SpecifyServer_MenuInit 0 16
export SpecifyServer_Cache
proc SpecifyServer_Cache 4 4
line 157
;151:
;152:/*
;153:=================
;154:SpecifyServer_Cache
;155:=================
;156:*/
;157:void SpecifyServer_Cache(void) {
line 161
;158:	int i;
;159:
;160:	// touch all our pics
;161:	for (i = 0;; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $226
line 162
;162:		if (!specifyserver_artlist[i])
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 specifyserver_artlist
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $230
line 163
;163:			break;
ADDRGP4 $228
JUMPV
LABELV $230
line 164
;164:		trap_R_RegisterShaderNoMip(specifyserver_artlist[i]);
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 specifyserver_artlist
ADDP4
INDIRP4
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 165
;165:	}
LABELV $227
line 161
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRGP4 $226
JUMPV
LABELV $228
line 166
;166:}
LABELV $225
endproc SpecifyServer_Cache 4 4
export UI_SpecifyServerMenu
proc UI_SpecifyServerMenu 0 4
line 173
;167:
;168:/*
;169:=================
;170:UI_SpecifyServerMenu
;171:=================
;172:*/
;173:void UI_SpecifyServerMenu(void) {
line 174
;174:	SpecifyServer_MenuInit();
ADDRGP4 SpecifyServer_MenuInit
CALLV
pop
line 175
;175:	UI_PushMenu(&s_specifyserver.menu);
ADDRGP4 s_specifyserver
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 176
;176:}
LABELV $232
endproc UI_SpecifyServerMenu 0 4
bss
align 4
LABELV s_specifyserver
skip 1412
import UI_RankStatusMenu
import RankStatus_Cache
import UI_SignupMenu
import Signup_Cache
import UI_LoginMenu
import Login_Cache
import UI_RankingsMenu
import Rankings_Cache
import Rankings_DrawPassword
import Rankings_DrawName
import Rankings_DrawText
import UI_InitGameinfo
import UI_SPUnlockMedals_f
import UI_SPUnlock_f
import UI_GetAwardLevel
import UI_LogAwardData
import UI_NewGame
import UI_GetCurrentGame
import UI_CanShowTierVideo
import UI_ShowTierVideo
import UI_TierCompleted
import UI_SetBestScore
import UI_GetBestScore
import UI_GetNumBots
import UI_GetBotInfoByName
import UI_GetBotInfoByNumber
import UI_GetNumSPTiers
import UI_GetNumSPArenas
import UI_GetNumArenas
import UI_GetSpecialArenaInfo
import UI_GetArenaInfoByMap
import UI_GetArenaInfoByNumber
import UI_NetworkOptionsMenu
import UI_NetworkOptionsMenu_Cache
import UI_SoundOptionsMenu
import UI_SoundOptionsMenu_Cache
import UI_DisplayOptionsMenu
import UI_DisplayOptionsMenu_Cache
import UI_SaveConfigMenu
import UI_SaveConfigMenu_Cache
import UI_LoadConfigMenu
import UI_LoadConfig_Cache
import UI_TeamOrdersMenu_Cache
import UI_TeamOrdersMenu_f
import UI_TeamOrdersMenu
import UI_RemoveBotsMenu
import UI_RemoveBots_Cache
import UI_AddBotsMenu
import UI_AddBots_Cache
import trap_SetPbClStatus
import trap_VerifyCDKey
import trap_SetCDKey
import trap_GetCDKey
import trap_MemoryRemaining
import trap_LAN_GetPingInfo
import trap_LAN_GetPing
import trap_LAN_ClearPing
import trap_LAN_ServerStatus
import trap_LAN_LoadCachedServers
import trap_LAN_SaveCachedServers
import trap_LAN_GetPingQueueCount
import trap_LAN_GetServerInfo
import trap_LAN_GetServerAddressString
import trap_LAN_GetServerCount
import trap_GetConfigString
import trap_GetGlconfig
import trap_GetClientState
import trap_GetClipboardData
import trap_Key_SetCatcher
import trap_Key_GetCatcher
import trap_Key_ClearStates
import trap_Key_SetOverstrikeMode
import trap_Key_GetOverstrikeMode
import trap_Key_IsDown
import trap_Key_SetBinding
import trap_Key_GetBindingBuf
import trap_Key_KeynumToStringBuf
import trap_S_RegisterSound
import trap_S_StartLocalSound
import trap_CM_LerpTag
import trap_UpdateScreen
import trap_R_DrawStretchPic
import trap_R_SetColor
import trap_R_RenderScene
import trap_R_AddLightToScene
import trap_R_AddPolyToScene
import trap_R_AddRefEntityToScene
import trap_R_ClearScene
import trap_R_RegisterShaderNoMip
import trap_R_RegisterSkin
import trap_R_RegisterModel
import trap_FS_Seek
import trap_FS_GetFileList
import trap_FS_FCloseFile
import trap_FS_Write
import trap_FS_Read
import trap_FS_FOpenFile
import trap_Cmd_ExecuteText
import trap_Argv
import trap_Argc
import trap_Cvar_InfoStringBuffer
import trap_Cvar_Create
import trap_Cvar_Reset
import trap_Cvar_SetValue
import trap_Cvar_VariableStringBuffer
import trap_Cvar_VariableValue
import trap_Cvar_Set
import trap_Cvar_Update
import trap_Cvar_Register
import trap_Milliseconds
import trap_Error
import trap_Print
import UI_SPSkillMenu_Cache
import UI_SPSkillMenu
import UI_SPPostgameMenu_f
import UI_SPPostgameMenu_Cache
import UI_SPArena_Start
import UI_SPLevelMenu_ReInit
import UI_SPLevelMenu_f
import UI_SPLevelMenu
import UI_SPLevelMenu_Cache
import uis
import m_entersound
import UI_StartDemoLoop
import UI_Cvar_VariableString
import UI_Argv
import UI_ForceMenuOff
import UI_PopMenu
import UI_PushMenu
import UI_SetActiveMenu
import UI_IsFullscreen
import UI_DrawTextBox
import UI_AdjustFrom640
import UI_CursorInRect
import UI_DrawChar
import UI_DrawString
import UI_ProportionalStringWidth
import UI_DrawProportionalString_AutoWrapped
import UI_DrawProportionalString
import UI_ProportionalSizeScale
import UI_DrawBannerString
import UI_LerpColor
import UI_SetColor
import UI_UpdateScreen
import UI_DrawRect
import UI_FillRect
import UI_DrawHandlePic
import UI_DrawNamedPic
import UI_ClampCvar
import UI_ConsoleCommand
import UI_Refresh
import UI_MouseEvent
import UI_KeyEvent
import UI_Shutdown
import UI_Init
import UI_RegisterClientModelname
import UI_PlayerInfo_SetInfo
import UI_PlayerInfo_SetModel
import UI_DrawPlayer
import DriverInfo_Cache
import GraphicsOptions_Cache
import UI_GraphicsOptionsMenu
import ServerInfo_Cache
import UI_ServerInfoMenu
import UI_BotSelectMenu_Cache
import UI_BotSelectMenu
import ServerOptions_Cache
import StartServer_Cache
import UI_StartServerMenu
import ArenaServers_Cache
import UI_ArenaServersMenu
import SpecifyLeague_Cache
import UI_SpecifyLeagueMenu
import Preferences_Cache
import UI_PreferencesMenu
import PlayerSettings_Cache
import UI_PlayerSettingsMenu
import PlayerModel_Cache
import UI_PlayerModelMenu
import UI_CDKeyMenu_f
import UI_CDKeyMenu_Cache
import UI_CDKeyMenu
import UI_ModsMenu_Cache
import UI_ModsMenu
import UI_CinematicsMenu_Cache
import UI_CinematicsMenu_f
import UI_CinematicsMenu
import Demos_Cache
import UI_DemosMenu
import Controls_Cache
import UI_ControlsMenu
import UI_DrawConnectScreen
import TeamMain_Cache
import UI_TeamMainMenu
import UI_SetupMenu
import UI_SetupMenu_Cache
import UI_Message
import UI_ConfirmMenu_Style
import UI_ConfirmMenu
import ConfirmMenu_Cache
import UI_InGameMenu
import InGame_Cache
import UI_CreditMenu
import UI_UpdateCvars
import UI_RegisterCvars
import UI_MainMenu
import MainMenu_Cache
import MenuField_Key
import MenuField_Draw
import MenuField_Init
import MField_Draw
import MField_CharEvent
import MField_KeyDownEvent
import MField_Clear
import UI_VideoCheck
import ui_medalSounds
import ui_medalPicNames
import ui_medalNames
import text_color_highlight
import text_color_normal
import text_color_disabled
import listbar_color
import list_color
import name_color
import color_dim
import color_red
import color_orange
import color_blue
import color_yellow
import color_white
import color_black
import menu_dim_color
import menu_black_color
import menu_red_color
import menu_highlight_color
import menu_dark_color
import menu_grayed_color
import menu_text_color
import weaponChangeSound
import menu_null_sound
import menu_buzz_sound
import menu_out_sound
import menu_move_sound
import menu_in_sound
import ScrollList_Key
import ScrollList_Draw
import Bitmap_Draw
import Bitmap_Init
import Menu_DefaultKey
import Menu_SetCursorToItem
import Menu_SetCursor
import Menu_ActivateItem
import Menu_ItemAtCursor
import Menu_Draw
import Menu_AdjustCursor
import Menu_AddItem
import Menu_Focus
import Menu_Cache
import ui_cdkeychecked
import ui_cdkey
import ui_server16
import ui_server15
import ui_server14
import ui_server13
import ui_server12
import ui_server11
import ui_server10
import ui_server9
import ui_server8
import ui_server7
import ui_server6
import ui_server5
import ui_server4
import ui_server3
import ui_server2
import ui_server1
import ui_marks
import ui_drawCrosshairNames
import ui_drawCrosshair
import ui_brassTime
import ui_browserShowEmpty
import ui_browserShowFull
import ui_browserSortKey
import ui_browserGameType
import ui_browserMaster
import ui_spSelection
import ui_spSkill
import ui_spVideos
import ui_spAwards
import ui_spScores5
import ui_spScores4
import ui_spScores3
import ui_spScores2
import ui_spScores1
import ui_botsFile
import ui_arenasFile
import ui_ctf_friendly
import ui_ctf_timelimit
import ui_ctf_capturelimit
import ui_team_friendly
import ui_team_timelimit
import ui_team_fraglimit
import ui_tourney_timelimit
import ui_tourney_fraglimit
import ui_ffa_timelimit
import ui_ffa_fraglimit
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
LABELV $224
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $163
byte 1 80
byte 1 111
byte 1 114
byte 1 116
byte 1 58
byte 1 0
align 1
LABELV $147
byte 1 65
byte 1 100
byte 1 100
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 58
byte 1 0
align 1
LABELV $113
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 73
byte 1 70
byte 1 89
byte 1 32
byte 1 83
byte 1 69
byte 1 82
byte 1 86
byte 1 69
byte 1 82
byte 1 0
align 1
LABELV $99
byte 1 99
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $95
byte 1 58
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $73
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $72
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
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $71
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 49
byte 1 0
align 1
LABELV $70
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 47
byte 1 97
byte 1 114
byte 1 116
byte 1 47
byte 1 98
byte 1 97
byte 1 99
byte 1 107
byte 1 95
byte 1 48
byte 1 0
align 1
LABELV $69
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
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 49
byte 1 95
byte 1 114
byte 1 0
align 1
LABELV $68
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
byte 1 114
byte 1 97
byte 1 109
byte 1 101
byte 1 50
byte 1 95
byte 1 108
byte 1 0
