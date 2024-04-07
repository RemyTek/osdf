code
proc Options_Event 8 0
file "../../../../code/q3_ui/ui_options.c"
line 45
;1:/*
;2:=======================================================================
;3:
;4:SYSTEM CONFIGURATION MENU
;5:
;6:=======================================================================
;7:*/
;8:
;9:#include "ui_local.h"
;10:
;11:#define ART_FRAMEL "menu/art/frame2_l"
;12:#define ART_FRAMER "menu/art/frame1_r"
;13:#define ART_BACK0  "menu/art/back_0"
;14:#define ART_BACK1  "menu/art/back_1"
;15:
;16:#define ID_GRAPHICS 10
;17:#define ID_DISPLAY  11
;18:#define ID_SOUND    12
;19:#define ID_NETWORK  13
;20:#define ID_BACK     14
;21:
;22:#define VERTICAL_SPACING 34
;23:
;24:typedef struct {
;25:	menuframework_s menu;
;26:
;27:	menutext_s      banner;
;28:	menubitmap_s    framel;
;29:	menubitmap_s    framer;
;30:
;31:	menutext_s      graphics;
;32:	menutext_s      display;
;33:	menutext_s      sound;
;34:	menutext_s      network;
;35:	menubitmap_s    back;
;36:} optionsmenu_t;
;37:
;38:static optionsmenu_t s_options;
;39:
;40:/*
;41:=================
;42:Options_Event
;43:=================
;44:*/
;45:static void Options_Event(void* ptr, int event) {
line 46
;46:	if (event != QM_ACTIVATED) {
ADDRFP4 4
INDIRI4
CNSTI4 3
EQI4 $70
line 47
;47:		return;
ADDRGP4 $69
JUMPV
LABELV $70
line 50
;48:	}
;49:
;50:	switch (((menucommon_s*)ptr)->id) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LTI4 $72
ADDRLP4 0
INDIRI4
CNSTI4 14
GTI4 $72
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $80-40
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $80
address $75
address $76
address $77
address $78
address $79
code
LABELV $75
line 52
;51:	case ID_GRAPHICS:
;52:		UI_GraphicsOptionsMenu();
ADDRGP4 UI_GraphicsOptionsMenu
CALLV
pop
line 53
;53:		break;
ADDRGP4 $73
JUMPV
LABELV $76
line 56
;54:
;55:	case ID_DISPLAY:
;56:		UI_DisplayOptionsMenu();
ADDRGP4 UI_DisplayOptionsMenu
CALLV
pop
line 57
;57:		break;
ADDRGP4 $73
JUMPV
LABELV $77
line 60
;58:
;59:	case ID_SOUND:
;60:		UI_SoundOptionsMenu();
ADDRGP4 UI_SoundOptionsMenu
CALLV
pop
line 61
;61:		break;
ADDRGP4 $73
JUMPV
LABELV $78
line 64
;62:
;63:	case ID_NETWORK:
;64:		UI_NetworkOptionsMenu();
ADDRGP4 UI_NetworkOptionsMenu
CALLV
pop
line 65
;65:		break;
ADDRGP4 $73
JUMPV
LABELV $79
line 68
;66:
;67:	case ID_BACK:
;68:		UI_PopMenu();
ADDRGP4 UI_PopMenu
CALLV
pop
line 69
;69:		break;
LABELV $72
LABELV $73
line 71
;70:	}
;71:}
LABELV $69
endproc Options_Event 8 0
export SystemConfig_Cache
proc SystemConfig_Cache 0 4
line 78
;72:
;73:/*
;74:===============
;75:SystemConfig_Cache
;76:===============
;77:*/
;78:void SystemConfig_Cache(void) {
line 79
;79:	trap_R_RegisterShaderNoMip(ART_FRAMEL);
ADDRGP4 $83
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 80
;80:	trap_R_RegisterShaderNoMip(ART_FRAMER);
ADDRGP4 $84
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 81
;81:	trap_R_RegisterShaderNoMip(ART_BACK0);
ADDRGP4 $85
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 82
;82:	trap_R_RegisterShaderNoMip(ART_BACK1);
ADDRGP4 $86
ARGP4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
pop
line 83
;83:}
LABELV $82
endproc SystemConfig_Cache 0 4
export Options_MenuInit
proc Options_MenuInit 3088 12
line 90
;84:
;85:/*
;86:===============
;87:Options_MenuInit
;88:===============
;89:*/
;90:void Options_MenuInit(void) {
line 94
;91:	int             y;
;92:	uiClientState_t cstate;
;93:
;94:	memset(&s_options, 0, sizeof(optionsmenu_t));
ADDRGP4 s_options
ARGP4
CNSTI4 0
ARGI4
CNSTI4 944
ARGI4
ADDRGP4 memset
CALLP4
pop
line 96
;95:
;96:	SystemConfig_Cache();
ADDRGP4 SystemConfig_Cache
CALLV
pop
line 97
;97:	s_options.menu.wrapAround = qtrue;
ADDRGP4 s_options+276
CNSTI4 1
ASGNI4
line 99
;98:
;99:	trap_GetClientState(&cstate);
ADDRLP4 4
ARGP4
ADDRGP4 trap_GetClientState
CALLV
pop
line 100
;100:	if (cstate.connState >= CA_CONNECTED) {
ADDRLP4 4
INDIRI4
CNSTI4 5
LTI4 $89
line 101
;101:		s_options.menu.fullscreen = qfalse;
ADDRGP4 s_options+280
CNSTI4 0
ASGNI4
line 102
;102:	} else {
ADDRGP4 $90
JUMPV
LABELV $89
line 103
;103:		s_options.menu.fullscreen = qtrue;
ADDRGP4 s_options+280
CNSTI4 1
ASGNI4
line 104
;104:	}
LABELV $90
line 106
;105:
;106:	s_options.banner.generic.type  = MTYPE_BTEXT;
ADDRGP4 s_options+288
CNSTI4 10
ASGNI4
line 107
;107:	s_options.banner.generic.flags = QMF_CENTER_JUSTIFY;
ADDRGP4 s_options+288+44
CNSTU4 8
ASGNU4
line 108
;108:	s_options.banner.generic.x     = 320;
ADDRGP4 s_options+288+12
CNSTI4 320
ASGNI4
line 109
;109:	s_options.banner.generic.y     = 16;
ADDRGP4 s_options+288+16
CNSTI4 16
ASGNI4
line 110
;110:	s_options.banner.string        = "SYSTEM SETUP";
ADDRGP4 s_options+288+64
ADDRGP4 $102
ASGNP4
line 111
;111:	s_options.banner.color         = color_white;
ADDRGP4 s_options+288+72
ADDRGP4 color_white
ASGNP4
line 112
;112:	s_options.banner.style         = UI_CENTER;
ADDRGP4 s_options+288+68
CNSTI4 1
ASGNI4
line 114
;113:
;114:	s_options.framel.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_options+364
CNSTI4 6
ASGNI4
line 115
;115:	s_options.framel.generic.name  = ART_FRAMEL;
ADDRGP4 s_options+364+4
ADDRGP4 $83
ASGNP4
line 116
;116:	s_options.framel.generic.flags = QMF_INACTIVE;
ADDRGP4 s_options+364+44
CNSTU4 16384
ASGNU4
line 117
;117:	s_options.framel.generic.x     = 8;
ADDRGP4 s_options+364+12
CNSTI4 8
ASGNI4
line 118
;118:	s_options.framel.generic.y     = 76;
ADDRGP4 s_options+364+16
CNSTI4 76
ASGNI4
line 119
;119:	s_options.framel.width         = 256;
ADDRGP4 s_options+364+80
CNSTI4 256
ASGNI4
line 120
;120:	s_options.framel.height        = 334;
ADDRGP4 s_options+364+84
CNSTI4 334
ASGNI4
line 122
;121:
;122:	s_options.framer.generic.type  = MTYPE_BITMAP;
ADDRGP4 s_options+456
CNSTI4 6
ASGNI4
line 123
;123:	s_options.framer.generic.name  = ART_FRAMER;
ADDRGP4 s_options+456+4
ADDRGP4 $84
ASGNP4
line 124
;124:	s_options.framer.generic.flags = QMF_INACTIVE;
ADDRGP4 s_options+456+44
CNSTU4 16384
ASGNU4
line 125
;125:	s_options.framer.generic.x     = 376;
ADDRGP4 s_options+456+12
CNSTI4 376
ASGNI4
line 126
;126:	s_options.framer.generic.y     = 76;
ADDRGP4 s_options+456+16
CNSTI4 76
ASGNI4
line 127
;127:	s_options.framer.width         = 256;
ADDRGP4 s_options+456+80
CNSTI4 256
ASGNI4
line 128
;128:	s_options.framer.height        = 334;
ADDRGP4 s_options+456+84
CNSTI4 334
ASGNI4
line 130
;129:
;130:	y                                   = 168;
ADDRLP4 0
CNSTI4 168
ASGNI4
line 131
;131:	s_options.graphics.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_options+548
CNSTI4 9
ASGNI4
line 132
;132:	s_options.graphics.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_options+548+44
CNSTU4 264
ASGNU4
line 133
;133:	s_options.graphics.generic.callback = Options_Event;
ADDRGP4 s_options+548+48
ADDRGP4 Options_Event
ASGNP4
line 134
;134:	s_options.graphics.generic.id       = ID_GRAPHICS;
ADDRGP4 s_options+548+8
CNSTI4 10
ASGNI4
line 135
;135:	s_options.graphics.generic.x        = 320;
ADDRGP4 s_options+548+12
CNSTI4 320
ASGNI4
line 136
;136:	s_options.graphics.generic.y        = y;
ADDRGP4 s_options+548+16
ADDRLP4 0
INDIRI4
ASGNI4
line 137
;137:	s_options.graphics.string           = "GRAPHICS";
ADDRGP4 s_options+548+64
ADDRGP4 $146
ASGNP4
line 138
;138:	s_options.graphics.color            = color_red;
ADDRGP4 s_options+548+72
ADDRGP4 color_red
ASGNP4
line 139
;139:	s_options.graphics.style            = UI_CENTER;
ADDRGP4 s_options+548+68
CNSTI4 1
ASGNI4
line 141
;140:
;141:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 142
;142:	s_options.display.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_options+624
CNSTI4 9
ASGNI4
line 143
;143:	s_options.display.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_options+624+44
CNSTU4 264
ASGNU4
line 144
;144:	s_options.display.generic.callback = Options_Event;
ADDRGP4 s_options+624+48
ADDRGP4 Options_Event
ASGNP4
line 145
;145:	s_options.display.generic.id       = ID_DISPLAY;
ADDRGP4 s_options+624+8
CNSTI4 11
ASGNI4
line 146
;146:	s_options.display.generic.x        = 320;
ADDRGP4 s_options+624+12
CNSTI4 320
ASGNI4
line 147
;147:	s_options.display.generic.y        = y;
ADDRGP4 s_options+624+16
ADDRLP4 0
INDIRI4
ASGNI4
line 148
;148:	s_options.display.string           = "DISPLAY";
ADDRGP4 s_options+624+64
ADDRGP4 $164
ASGNP4
line 149
;149:	s_options.display.color            = color_red;
ADDRGP4 s_options+624+72
ADDRGP4 color_red
ASGNP4
line 150
;150:	s_options.display.style            = UI_CENTER;
ADDRGP4 s_options+624+68
CNSTI4 1
ASGNI4
line 152
;151:
;152:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 153
;153:	s_options.sound.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_options+700
CNSTI4 9
ASGNI4
line 154
;154:	s_options.sound.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_options+700+44
CNSTU4 264
ASGNU4
line 155
;155:	s_options.sound.generic.callback = Options_Event;
ADDRGP4 s_options+700+48
ADDRGP4 Options_Event
ASGNP4
line 156
;156:	s_options.sound.generic.id       = ID_SOUND;
ADDRGP4 s_options+700+8
CNSTI4 12
ASGNI4
line 157
;157:	s_options.sound.generic.x        = 320;
ADDRGP4 s_options+700+12
CNSTI4 320
ASGNI4
line 158
;158:	s_options.sound.generic.y        = y;
ADDRGP4 s_options+700+16
ADDRLP4 0
INDIRI4
ASGNI4
line 159
;159:	s_options.sound.string           = "SOUND";
ADDRGP4 s_options+700+64
ADDRGP4 $182
ASGNP4
line 160
;160:	s_options.sound.color            = color_red;
ADDRGP4 s_options+700+72
ADDRGP4 color_red
ASGNP4
line 161
;161:	s_options.sound.style            = UI_CENTER;
ADDRGP4 s_options+700+68
CNSTI4 1
ASGNI4
line 163
;162:
;163:	y += VERTICAL_SPACING;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 34
ADDI4
ASGNI4
line 164
;164:	s_options.network.generic.type     = MTYPE_PTEXT;
ADDRGP4 s_options+776
CNSTI4 9
ASGNI4
line 165
;165:	s_options.network.generic.flags    = QMF_CENTER_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_options+776+44
CNSTU4 264
ASGNU4
line 166
;166:	s_options.network.generic.callback = Options_Event;
ADDRGP4 s_options+776+48
ADDRGP4 Options_Event
ASGNP4
line 167
;167:	s_options.network.generic.id       = ID_NETWORK;
ADDRGP4 s_options+776+8
CNSTI4 13
ASGNI4
line 168
;168:	s_options.network.generic.x        = 320;
ADDRGP4 s_options+776+12
CNSTI4 320
ASGNI4
line 169
;169:	s_options.network.generic.y        = y;
ADDRGP4 s_options+776+16
ADDRLP4 0
INDIRI4
ASGNI4
line 170
;170:	s_options.network.string           = "NETWORK";
ADDRGP4 s_options+776+64
ADDRGP4 $200
ASGNP4
line 171
;171:	s_options.network.color            = color_red;
ADDRGP4 s_options+776+72
ADDRGP4 color_red
ASGNP4
line 172
;172:	s_options.network.style            = UI_CENTER;
ADDRGP4 s_options+776+68
CNSTI4 1
ASGNI4
line 174
;173:
;174:	s_options.back.generic.type     = MTYPE_BITMAP;
ADDRGP4 s_options+852
CNSTI4 6
ASGNI4
line 175
;175:	s_options.back.generic.name     = ART_BACK0;
ADDRGP4 s_options+852+4
ADDRGP4 $85
ASGNP4
line 176
;176:	s_options.back.generic.flags    = QMF_LEFT_JUSTIFY | QMF_PULSEIFFOCUS;
ADDRGP4 s_options+852+44
CNSTU4 260
ASGNU4
line 177
;177:	s_options.back.generic.callback = Options_Event;
ADDRGP4 s_options+852+48
ADDRGP4 Options_Event
ASGNP4
line 178
;178:	s_options.back.generic.id       = ID_BACK;
ADDRGP4 s_options+852+8
CNSTI4 14
ASGNI4
line 179
;179:	s_options.back.generic.x        = 0;
ADDRGP4 s_options+852+12
CNSTI4 0
ASGNI4
line 180
;180:	s_options.back.generic.y        = 480 - 64;
ADDRGP4 s_options+852+16
CNSTI4 416
ASGNI4
line 181
;181:	s_options.back.width            = 128;
ADDRGP4 s_options+852+80
CNSTI4 128
ASGNI4
line 182
;182:	s_options.back.height           = 64;
ADDRGP4 s_options+852+84
CNSTI4 64
ASGNI4
line 183
;183:	s_options.back.focuspic         = ART_BACK1;
ADDRGP4 s_options+852+64
ADDRGP4 $86
ASGNP4
line 185
;184:
;185:	Menu_AddItem(&s_options.menu, (void*)&s_options.banner);
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+288
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 186
;186:	Menu_AddItem(&s_options.menu, (void*)&s_options.framel);
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+364
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 187
;187:	Menu_AddItem(&s_options.menu, (void*)&s_options.framer);
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+456
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 188
;188:	Menu_AddItem(&s_options.menu, (void*)&s_options.graphics);
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+548
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 189
;189:	Menu_AddItem(&s_options.menu, (void*)&s_options.display);
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+624
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 190
;190:	Menu_AddItem(&s_options.menu, (void*)&s_options.sound);
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+700
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 191
;191:	Menu_AddItem(&s_options.menu, (void*)&s_options.network);
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+776
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 192
;192:	Menu_AddItem(&s_options.menu, (void*)&s_options.back);
ADDRGP4 s_options
ARGP4
ADDRGP4 s_options+852
ARGP4
ADDRGP4 Menu_AddItem
CALLV
pop
line 193
;193:}
LABELV $87
endproc Options_MenuInit 3088 12
export UI_SystemConfigMenu
proc UI_SystemConfigMenu 0 4
line 200
;194:
;195:/*
;196:===============
;197:UI_SystemConfigMenu
;198:===============
;199:*/
;200:void UI_SystemConfigMenu(void) {
line 201
;201:	Options_MenuInit();
ADDRGP4 Options_MenuInit
CALLV
pop
line 202
;202:	UI_PushMenu(&s_options.menu);
ADDRGP4 s_options
ARGP4
ADDRGP4 UI_PushMenu
CALLV
pop
line 203
;203:}
LABELV $232
endproc UI_SystemConfigMenu 0 4
bss
align 4
LABELV s_options
skip 944
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
import SpecifyServer_Cache
import UI_SpecifyServerMenu
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
LABELV $200
byte 1 78
byte 1 69
byte 1 84
byte 1 87
byte 1 79
byte 1 82
byte 1 75
byte 1 0
align 1
LABELV $182
byte 1 83
byte 1 79
byte 1 85
byte 1 78
byte 1 68
byte 1 0
align 1
LABELV $164
byte 1 68
byte 1 73
byte 1 83
byte 1 80
byte 1 76
byte 1 65
byte 1 89
byte 1 0
align 1
LABELV $146
byte 1 71
byte 1 82
byte 1 65
byte 1 80
byte 1 72
byte 1 73
byte 1 67
byte 1 83
byte 1 0
align 1
LABELV $102
byte 1 83
byte 1 89
byte 1 83
byte 1 84
byte 1 69
byte 1 77
byte 1 32
byte 1 83
byte 1 69
byte 1 84
byte 1 85
byte 1 80
byte 1 0
align 1
LABELV $86
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
LABELV $85
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
LABELV $84
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
LABELV $83
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
