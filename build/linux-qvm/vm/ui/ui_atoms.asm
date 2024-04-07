export Com_Error
code
proc Com_Error 2052 12
file "../../../../code/q3_ui/ui_atoms.c"
line 16
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:/**********************************************************************
;4:    UI_ATOMS.C
;5:
;6:    User interface building blocks and support functions.
;7:**********************************************************************/
;8:#include "ui_local.h"
;9:
;10:uiStatic_t uis;
;11:qboolean   m_entersound;  // after a frame, so caching won't disrupt the sound
;12:
;13:// these are here so the functions in q_shared.c can link
;14:#ifndef UI_HARD_LINKED
;15:
;16:void QDECL Com_Error(int level, const char* fmt, ...) {
line 20
;17:	va_list argptr;
;18:	char    text[2048];
;19:
;20:	va_start(argptr, fmt);
ADDRLP4 0
ADDRFP4 4+4
ASGNP4
line 21
;21:	ED_vsprintf(text, fmt, argptr);
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
line 22
;22:	va_end(argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 24
;23:
;24:	trap_Error(text);
ADDRLP4 4
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 25
;25:}
LABELV $68
endproc Com_Error 2052 12
export Com_Printf
proc Com_Printf 2052 12
line 27
;26:
;27:void QDECL Com_Printf(const char* fmt, ...) {
line 31
;28:	va_list argptr;
;29:	char    text[2048];
;30:
;31:	va_start(argptr, fmt);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 32
;32:	ED_vsprintf(text, fmt, argptr);
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
line 33
;33:	va_end(argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 35
;34:
;35:	trap_Print(text);
ADDRLP4 4
ARGP4
ADDRGP4 trap_Print
CALLV
pop
line 36
;36:}
LABELV $70
endproc Com_Printf 2052 12
export UI_ClampCvar
proc UI_ClampCvar 0 0
line 45
;37:
;38:#endif
;39:
;40:/*
;41:=================
;42:UI_ClampCvar
;43:=================
;44:*/
;45:float UI_ClampCvar(float min, float max, float value) {
line 46
;46:	if (value < min)
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $73
line 47
;47:		return min;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $72
JUMPV
LABELV $73
line 48
;48:	if (value > max)
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $75
line 49
;49:		return max;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $72
JUMPV
LABELV $75
line 50
;50:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $72
endproc UI_ClampCvar 0 0
export UI_StartDemoLoop
proc UI_StartDemoLoop 0 8
line 58
;51:}
;52:
;53:/*
;54:=================
;55:UI_StartDemoLoop
;56:=================
;57:*/
;58:void UI_StartDemoLoop(void) {
line 59
;59:	trap_Cmd_ExecuteText(EXEC_APPEND, "d1\n");
CNSTI4 2
ARGI4
ADDRGP4 $78
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 60
;60:}
LABELV $77
endproc UI_StartDemoLoop 0 8
export UI_PushMenu
proc UI_PushMenu 16 8
line 67
;61:
;62:/*
;63:=================
;64:UI_PushMenu
;65:=================
;66:*/
;67:void UI_PushMenu(menuframework_s* menu) {
line 72
;68:	int           i;
;69:	menucommon_s* item;
;70:
;71:	// avoid stacking menus invoked by hotkeys
;72:	for (i = 0; i < uis.menusp; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $83
JUMPV
LABELV $80
line 73
;73:		if (uis.stack[i] == menu) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24
ADDP4
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $85
line 74
;74:			uis.menusp = i;
ADDRGP4 uis+16
ADDRLP4 0
INDIRI4
ASGNI4
line 75
;75:			break;
ADDRGP4 $82
JUMPV
LABELV $85
line 77
;76:		}
;77:	}
LABELV $81
line 72
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $83
ADDRLP4 0
INDIRI4
ADDRGP4 uis+16
INDIRI4
LTI4 $80
LABELV $82
line 79
;78:
;79:	if (i == uis.menusp) {
ADDRLP4 0
INDIRI4
ADDRGP4 uis+16
INDIRI4
NEI4 $89
line 80
;80:		if (uis.menusp >= MAX_MENUDEPTH)
ADDRGP4 uis+16
INDIRI4
CNSTI4 8
LTI4 $92
line 81
;81:			trap_Error("UI_PushMenu: menu stack overflow");
ADDRGP4 $95
ARGP4
ADDRGP4 trap_Error
CALLV
pop
LABELV $92
line 83
;82:
;83:		uis.stack[uis.menusp++] = menu;
ADDRLP4 12
ADDRGP4 uis+16
ASGNP4
ADDRLP4 8
ADDRLP4 12
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRP4
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24
ADDP4
ADDRFP4 0
INDIRP4
ASGNP4
line 84
;84:	}
LABELV $89
line 86
;85:
;86:	uis.activemenu = menu;
ADDRGP4 uis+20
ADDRFP4 0
INDIRP4
ASGNP4
line 89
;87:
;88:	// default cursor position
;89:	menu->cursor      = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 90
;90:	menu->cursor_prev = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 92
;91:
;92:	m_entersound = qtrue;
ADDRGP4 m_entersound
CNSTI4 1
ASGNI4
line 94
;93:
;94:	trap_Key_SetCatcher(KEYCATCH_UI);
CNSTI4 2
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 97
;95:
;96:	// force first available item to have focus
;97:	for (i = 0; i < menu->nitems; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $102
JUMPV
LABELV $99
line 98
;98:		item = (menucommon_s*)menu->items[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
ASGNP4
line 99
;99:		if (!(item->flags & (QMF_GRAYED | QMF_MOUSEONLY | QMF_INACTIVE))) {
ADDRLP4 4
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 26624
BANDU4
CNSTU4 0
NEU4 $103
line 100
;100:			menu->cursor_prev = -1;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 -1
ASGNI4
line 101
;101:			Menu_SetCursor(menu, i);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 102
;102:			break;
ADDRGP4 $101
JUMPV
LABELV $103
line 104
;103:		}
;104:	}
LABELV $100
line 97
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $102
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $99
LABELV $101
line 106
;105:
;106:	uis.firstdraw = qtrue;
ADDRGP4 uis+11472
CNSTI4 1
ASGNI4
line 107
;107:}
LABELV $79
endproc UI_PushMenu 16 8
export UI_PopMenu
proc UI_PopMenu 4 8
line 114
;108:
;109:/*
;110:=================
;111:UI_PopMenu
;112:=================
;113:*/
;114:void UI_PopMenu(void) {
line 115
;115:	trap_S_StartLocalSound(menu_out_sound, CHAN_LOCAL_SOUND);
ADDRGP4 menu_out_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 117
;116:
;117:	uis.menusp--;
ADDRLP4 0
ADDRGP4 uis+16
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 119
;118:
;119:	if (uis.menusp < 0)
ADDRGP4 uis+16
INDIRI4
CNSTI4 0
GEI4 $108
line 120
;120:		trap_Error("UI_PopMenu: menu stack underflow");
ADDRGP4 $111
ARGP4
ADDRGP4 trap_Error
CALLV
pop
LABELV $108
line 122
;121:
;122:	if (uis.menusp) {
ADDRGP4 uis+16
INDIRI4
CNSTI4 0
EQI4 $112
line 123
;123:		uis.activemenu = uis.stack[uis.menusp - 1];
ADDRGP4 uis+20
ADDRGP4 uis+16
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+24-4
ADDP4
INDIRP4
ASGNP4
line 124
;124:		uis.firstdraw  = qtrue;
ADDRGP4 uis+11472
CNSTI4 1
ASGNI4
line 125
;125:	} else {
ADDRGP4 $113
JUMPV
LABELV $112
line 126
;126:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 127
;127:	}
LABELV $113
line 128
;128:}
LABELV $106
endproc UI_PopMenu 4 8
export UI_ForceMenuOff
proc UI_ForceMenuOff 4 8
line 130
;129:
;130:void UI_ForceMenuOff(void) {
line 131
;131:	uis.menusp     = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 132
;132:	uis.activemenu = NULL;
ADDRGP4 uis+20
CNSTP4 0
ASGNP4
line 134
;133:
;134:	trap_Key_SetCatcher(trap_Key_GetCatcher() & ~KEYCATCH_UI);
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 -3
BANDI4
ARGI4
ADDRGP4 trap_Key_SetCatcher
CALLV
pop
line 135
;135:	trap_Key_ClearStates();
ADDRGP4 trap_Key_ClearStates
CALLV
pop
line 136
;136:	trap_Cvar_Set("cl_paused", "0");
ADDRGP4 $123
ARGP4
ADDRGP4 $124
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 137
;137:}
LABELV $120
endproc UI_ForceMenuOff 4 8
export UI_LerpColor
proc UI_LerpColor 12 0
line 144
;138:
;139:/*
;140:=================
;141:UI_LerpColor
;142:=================
;143:*/
;144:void UI_LerpColor(vec4_t a, vec4_t b, vec4_t c, float t) {
line 148
;145:	int i;
;146:
;147:	// lerp and clamp each component
;148:	for (i = 0; i < 4; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $126
line 149
;149:		c[i] = a[i] + t * (b[i] - a[i]);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 8
INDIRP4
ADDP4
INDIRF4
ADDRFP4 12
INDIRF4
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
ADDRLP4 8
INDIRP4
ADDP4
INDIRF4
SUBF4
MULF4
ADDF4
ASGNF4
line 150
;150:		if (c[i] < 0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 0
GEF4 $130
line 151
;151:			c[i] = 0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 0
ASGNF4
ADDRGP4 $131
JUMPV
LABELV $130
line 152
;152:		else if (c[i] > 1.0)
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
INDIRF4
CNSTF4 1065353216
LEF4 $132
line 153
;153:			c[i] = 1.0;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
CNSTF4 1065353216
ASGNF4
LABELV $132
LABELV $131
line 154
;154:	}
LABELV $127
line 148
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $126
line 155
;155:}
LABELV $125
endproc UI_LerpColor 12 0
data
align 4
LABELV propMap
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 -1
byte 4 0
byte 4 0
byte 4 8
byte 4 11
byte 4 122
byte 4 7
byte 4 154
byte 4 181
byte 4 14
byte 4 55
byte 4 122
byte 4 17
byte 4 79
byte 4 122
byte 4 18
byte 4 101
byte 4 122
byte 4 23
byte 4 153
byte 4 122
byte 4 18
byte 4 9
byte 4 93
byte 4 7
byte 4 207
byte 4 122
byte 4 8
byte 4 230
byte 4 122
byte 4 9
byte 4 177
byte 4 122
byte 4 18
byte 4 30
byte 4 152
byte 4 18
byte 4 85
byte 4 181
byte 4 7
byte 4 34
byte 4 93
byte 4 11
byte 4 110
byte 4 181
byte 4 6
byte 4 130
byte 4 152
byte 4 14
byte 4 22
byte 4 64
byte 4 17
byte 4 41
byte 4 64
byte 4 12
byte 4 58
byte 4 64
byte 4 17
byte 4 78
byte 4 64
byte 4 18
byte 4 98
byte 4 64
byte 4 19
byte 4 120
byte 4 64
byte 4 18
byte 4 141
byte 4 64
byte 4 18
byte 4 204
byte 4 64
byte 4 16
byte 4 162
byte 4 64
byte 4 17
byte 4 182
byte 4 64
byte 4 18
byte 4 59
byte 4 181
byte 4 7
byte 4 35
byte 4 181
byte 4 7
byte 4 203
byte 4 152
byte 4 14
byte 4 56
byte 4 93
byte 4 14
byte 4 228
byte 4 152
byte 4 14
byte 4 177
byte 4 181
byte 4 18
byte 4 28
byte 4 122
byte 4 22
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 60
byte 4 152
byte 4 7
byte 4 106
byte 4 151
byte 4 13
byte 4 83
byte 4 152
byte 4 7
byte 4 128
byte 4 122
byte 4 17
byte 4 4
byte 4 152
byte 4 21
byte 4 134
byte 4 181
byte 4 5
byte 4 5
byte 4 4
byte 4 18
byte 4 27
byte 4 4
byte 4 18
byte 4 48
byte 4 4
byte 4 18
byte 4 69
byte 4 4
byte 4 17
byte 4 90
byte 4 4
byte 4 13
byte 4 106
byte 4 4
byte 4 13
byte 4 121
byte 4 4
byte 4 18
byte 4 143
byte 4 4
byte 4 17
byte 4 164
byte 4 4
byte 4 8
byte 4 175
byte 4 4
byte 4 16
byte 4 195
byte 4 4
byte 4 18
byte 4 216
byte 4 4
byte 4 12
byte 4 230
byte 4 4
byte 4 23
byte 4 6
byte 4 34
byte 4 18
byte 4 27
byte 4 34
byte 4 18
byte 4 48
byte 4 34
byte 4 18
byte 4 68
byte 4 34
byte 4 18
byte 4 90
byte 4 34
byte 4 17
byte 4 110
byte 4 34
byte 4 18
byte 4 130
byte 4 34
byte 4 14
byte 4 146
byte 4 34
byte 4 18
byte 4 166
byte 4 34
byte 4 19
byte 4 185
byte 4 34
byte 4 29
byte 4 215
byte 4 34
byte 4 18
byte 4 234
byte 4 34
byte 4 18
byte 4 5
byte 4 64
byte 4 14
byte 4 153
byte 4 152
byte 4 13
byte 4 11
byte 4 181
byte 4 5
byte 4 180
byte 4 152
byte 4 13
byte 4 79
byte 4 93
byte 4 17
byte 4 0
byte 4 0
byte 4 -1
align 4
LABELV propMapB
byte 4 11
byte 4 12
byte 4 33
byte 4 49
byte 4 12
byte 4 31
byte 4 85
byte 4 12
byte 4 31
byte 4 120
byte 4 12
byte 4 30
byte 4 156
byte 4 12
byte 4 21
byte 4 183
byte 4 12
byte 4 21
byte 4 207
byte 4 12
byte 4 32
byte 4 13
byte 4 55
byte 4 30
byte 4 49
byte 4 55
byte 4 13
byte 4 66
byte 4 55
byte 4 29
byte 4 101
byte 4 55
byte 4 31
byte 4 135
byte 4 55
byte 4 21
byte 4 158
byte 4 55
byte 4 40
byte 4 204
byte 4 55
byte 4 32
byte 4 12
byte 4 97
byte 4 31
byte 4 48
byte 4 97
byte 4 31
byte 4 82
byte 4 97
byte 4 30
byte 4 118
byte 4 97
byte 4 30
byte 4 153
byte 4 97
byte 4 30
byte 4 185
byte 4 97
byte 4 25
byte 4 213
byte 4 97
byte 4 30
byte 4 11
byte 4 139
byte 4 32
byte 4 42
byte 4 139
byte 4 51
byte 4 93
byte 4 139
byte 4 32
byte 4 126
byte 4 139
byte 4 31
byte 4 158
byte 4 139
byte 4 25
code
proc UI_DrawBannerString2 52 36
line 343
;156:
;157:/*
;158:=================
;159:UI_DrawProportionalString2
;160:=================
;161:*/
;162:static int propMap[128][3] = {
;163:	{0,   0,   -1			  },
;164:	{0,   0,   -1			  },
;165:	{0,   0,   -1			  },
;166:	{0,   0,   -1			  },
;167:	{0,   0,   -1			  },
;168:	{0,   0,   -1			  },
;169:	{0,   0,   -1			  },
;170:	{0,   0,   -1			  },
;171:	{0,   0,   -1			  },
;172:	{0,   0,   -1			  },
;173:	{0,   0,   -1			  },
;174:	{0,   0,   -1			  },
;175:	{0,   0,   -1			  },
;176:	{0,   0,   -1			  },
;177:	{0,   0,   -1			  },
;178:	{0,   0,   -1			  },
;179:
;180:	{0,   0,   -1			  },
;181:	{0,   0,   -1			  },
;182:	{0,   0,   -1			  },
;183:	{0,   0,   -1			  },
;184:	{0,   0,   -1			  },
;185:	{0,   0,   -1			  },
;186:	{0,   0,   -1			  },
;187:	{0,   0,   -1			  },
;188:	{0,   0,   -1			  },
;189:	{0,   0,   -1			  },
;190:	{0,   0,   -1			  },
;191:	{0,   0,   -1			  },
;192:	{0,   0,   -1			  },
;193:	{0,   0,   -1			  },
;194:	{0,   0,   -1			  },
;195:	{0,   0,   -1			  },
;196:
;197:	{0,   0,   PROP_SPACE_WIDTH}, // SPACE
;198:	{11,  122, 7			   }, // !
;199:	{154, 181, 14              }, // "
;200:	{55,  122, 17              }, // #
;201:	{79,  122, 18              }, // $
;202:	{101, 122, 23              }, // %
;203:	{153, 122, 18              }, // &
;204:	{9,   93,  7			   }, // '
;205:	{207, 122, 8               }, // (
;206:	{230, 122, 9               }, // )
;207:	{177, 122, 18              }, // *
;208:	{30,  152, 18              }, // +
;209:	{85,  181, 7			   }, // ,
;210:	{34,  93,  11              }, // -
;211:	{110, 181, 6               }, // .
;212:	{130, 152, 14              }, // /
;213:
;214:	{22,  64,  17              }, // 0
;215:	{41,  64,  12              }, // 1
;216:	{58,  64,  17              }, // 2
;217:	{78,  64,  18              }, // 3
;218:	{98,  64,  19              }, // 4
;219:	{120, 64,  18              }, // 5
;220:	{141, 64,  18              }, // 6
;221:	{204, 64,  16              }, // 7
;222:	{162, 64,  17              }, // 8
;223:	{182, 64,  18              }, // 9
;224:	{59,  181, 7			   }, // :
;225:	{35,  181, 7			   }, // ;
;226:	{203, 152, 14              }, // <
;227:	{56,  93,  14              }, // =
;228:	{228, 152, 14              }, // >
;229:	{177, 181, 18              }, // ?
;230:
;231:	{28,  122, 22              }, // @
;232:	{5,   4,   18			  }, // A
;233:	{27,  4,   18			  }, // B
;234:	{48,  4,   18			  }, // C
;235:	{69,  4,   17			  }, // D
;236:	{90,  4,   13			  }, // E
;237:	{106, 4,   13              }, // F
;238:	{121, 4,   18              }, // G
;239:	{143, 4,   17              }, // H
;240:	{164, 4,   8			   }, // I
;241:	{175, 4,   16              }, // J
;242:	{195, 4,   18              }, // K
;243:	{216, 4,   12              }, // L
;244:	{230, 4,   23              }, // M
;245:	{6,   34,  18			  }, // N
;246:	{27,  34,  18              }, // O
;247:
;248:	{48,  34,  18              }, // P
;249:	{68,  34,  18              }, // Q
;250:	{90,  34,  17              }, // R
;251:	{110, 34,  18              }, // S
;252:	{130, 34,  14              }, // T
;253:	{146, 34,  18              }, // U
;254:	{166, 34,  19              }, // V
;255:	{185, 34,  29              }, // W
;256:	{215, 34,  18              }, // X
;257:	{234, 34,  18              }, // Y
;258:	{5,   64,  14			  }, // Z
;259:	{60,  152, 7			   }, // [
;260:	{106, 151, 13              }, // '\'
;261:	{83,  152, 7			   }, // ]
;262:	{128, 122, 17              }, // ^
;263:	{4,   152, 21              }, // _
;264:
;265:	{134, 181, 5               }, // '
;266:	{5,   4,   18			  }, // A
;267:	{27,  4,   18			  }, // B
;268:	{48,  4,   18			  }, // C
;269:	{69,  4,   17			  }, // D
;270:	{90,  4,   13			  }, // E
;271:	{106, 4,   13              }, // F
;272:	{121, 4,   18              }, // G
;273:	{143, 4,   17              }, // H
;274:	{164, 4,   8			   }, // I
;275:	{175, 4,   16              }, // J
;276:	{195, 4,   18              }, // K
;277:	{216, 4,   12              }, // L
;278:	{230, 4,   23              }, // M
;279:	{6,   34,  18			  }, // N
;280:	{27,  34,  18              }, // O
;281:
;282:	{48,  34,  18              }, // P
;283:	{68,  34,  18              }, // Q
;284:	{90,  34,  17              }, // R
;285:	{110, 34,  18              }, // S
;286:	{130, 34,  14              }, // T
;287:	{146, 34,  18              }, // U
;288:	{166, 34,  19              }, // V
;289:	{185, 34,  29              }, // W
;290:	{215, 34,  18              }, // X
;291:	{234, 34,  18              }, // Y
;292:	{5,   64,  14			  }, // Z
;293:	{153, 152, 13              }, // {
;294:	{11,  181, 5			   }, // |
;295:	{180, 152, 13              }, // }
;296:	{79,  93,  17              }, // ~
;297:	{0,   0,   -1			  }  // DEL
;298:};
;299:
;300:static int propMapB[26][3] = {
;301:	{11,  12,  33},
;302:    {49,  12,  31},
;303:    {85,  12,  31},
;304:    {120, 12,  30},
;305:    {156, 12,  21},
;306:    {183, 12,  21},
;307:    {207, 12,  32},
;308:
;309:	{13,  55,  30},
;310:    {49,  55,  13},
;311:    {66,  55,  29},
;312:    {101, 55,  31},
;313:    {135, 55,  21},
;314:    {158, 55,  40},
;315:    {204, 55,  32},
;316:
;317:	{12,  97,  31},
;318:    {48,  97,  31},
;319:    {82,  97,  30},
;320:    {118, 97,  30},
;321:    {153, 97,  30},
;322:    {185, 97,  25},
;323:    {213, 97,  30},
;324:
;325:	{11,  139, 32},
;326:    {42,  139, 51},
;327:    {93,  139, 32},
;328:    {126, 139, 31},
;329:    {158, 139, 25},
;330:};
;331:
;332:#define PROPB_GAP_WIDTH   4
;333:#define PROPB_SPACE_WIDTH 12
;334:#define PROPB_HEIGHT      36
;335:
;336:// bk001205 - code below duplicated in cgame/cg_drawtools.c
;337:// bk001205 - FIXME: does this belong in ui_shared.c?
;338:/*
;339:=================
;340:UI_DrawBannerString
;341:=================
;342:*/
;343:static void UI_DrawBannerString2(int x, int y, const char* str, vec4_t color) {
line 356
;344:	const char*   s;
;345:	unsigned char ch;  // bk001204 - unsigned
;346:	float         ax;
;347:	float         ay;
;348:	float         aw;
;349:	float         ah;
;350:	float         frow;
;351:	float         fcol;
;352:	float         fwidth;
;353:	float         fheight;
;354:
;355:	// draw the colored text
;356:	trap_R_SetColor(color);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 358
;357:
;358:	ax = x * uis.scale + uis.biasX;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ADDRGP4 uis+11440
INDIRF4
ADDF4
ASGNF4
line 359
;359:	ay = y * uis.scale + uis.biasY;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ADDRGP4 uis+11444
INDIRF4
ADDF4
ASGNF4
line 361
;360:
;361:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $140
JUMPV
LABELV $139
line 362
;362:	while (*s) {
line 363
;363:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 364
;364:		if (ch == ' ') {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $142
line 365
;365:			ax += ((float)PROPB_SPACE_WIDTH + (float)PROPB_GAP_WIDTH) * uis.scale;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRGP4 uis+11436
INDIRF4
CNSTF4 1098907648
MULF4
ADDF4
ASGNF4
line 366
;366:		} else if (ch >= 'A' && ch <= 'Z') {
ADDRGP4 $143
JUMPV
LABELV $142
ADDRLP4 40
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 65
LTI4 $145
ADDRLP4 40
INDIRI4
CNSTI4 90
GTI4 $145
line 367
;367:			ch -= 'A';
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 65
SUBI4
CVIU4 4
CVUU1 4
ASGNU1
line 368
;368:			fcol    = (float)propMapB[ch][0] / 256.0f;
ADDRLP4 20
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMapB
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 369
;369:			frow    = (float)propMapB[ch][1] / 256.0f;
ADDRLP4 16
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMapB+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 370
;370:			fwidth  = (float)propMapB[ch][2] / 256.0f;
ADDRLP4 28
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 371
;371:			fheight = (float)PROPB_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1041235968
ASGNF4
line 372
;372:			aw      = (float)propMapB[ch][2] * uis.scale;
ADDRLP4 12
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMapB+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ASGNF4
line 373
;373:			ah      = (float)PROPB_HEIGHT * uis.scale;
ADDRLP4 24
ADDRGP4 uis+11436
INDIRF4
CNSTF4 1108344832
MULF4
ASGNF4
line 374
;374:			trap_R_DrawStretchPic(ax, ay, aw, ah, fcol, frow, fcol + fwidth, frow + fheight, uis.charsetPropB);
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRGP4 uis+11416
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 375
;375:			ax += (aw + (float)PROPB_GAP_WIDTH * uis.scale);
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDRGP4 uis+11436
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ADDF4
ASGNF4
line 376
;376:		}
LABELV $145
LABELV $143
line 377
;377:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 378
;378:	}
LABELV $140
line 362
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $139
line 380
;379:
;380:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 381
;381:}
LABELV $134
endproc UI_DrawBannerString2 52 36
export UI_DrawBannerString
proc UI_DrawBannerString 40 16
line 383
;382:
;383:void UI_DrawBannerString(int x, int y, const char* str, int style, vec4_t color) {
line 390
;384:	const char* s;
;385:	int         ch;
;386:	int         width;
;387:	vec4_t      drawcolor;
;388:
;389:	// find the width of the drawn text
;390:	s     = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 391
;391:	width = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $156
JUMPV
LABELV $155
line 392
;392:	while (*s) {
line 393
;393:		ch = *s;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 394
;394:		if (ch == ' ') {
ADDRLP4 0
INDIRI4
CNSTI4 32
NEI4 $158
line 395
;395:			width += PROPB_SPACE_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 396
;396:		} else if (ch >= 'A' && ch <= 'Z') {
ADDRGP4 $159
JUMPV
LABELV $158
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $160
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $160
line 397
;397:			width += propMapB[ch - 'A'][2] + PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 propMapB-780+8
ADDP4
INDIRI4
CNSTI4 4
ADDI4
ADDI4
ASGNI4
line 398
;398:		}
LABELV $160
LABELV $159
line 399
;399:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 400
;400:	}
LABELV $156
line 392
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $155
line 401
;401:	width -= PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 403
;402:
;403:	switch (style & UI_FORMATMASK) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $165
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $167
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $168
ADDRGP4 $165
JUMPV
LABELV $167
line 405
;404:	case UI_CENTER:
;405:		x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 406
;406:		break;
ADDRGP4 $165
JUMPV
LABELV $168
line 409
;407:
;408:	case UI_RIGHT:
;409:		x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 410
;410:		break;
line 414
;411:
;412:	case UI_LEFT:
;413:	default:
;414:		break;
LABELV $165
line 417
;415:	}
;416:
;417:	if (style & UI_DROPSHADOW) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $170
line 418
;418:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 36
INDIRF4
ASGNF4
line 419
;419:		drawcolor[3]                               = color[3];
ADDRLP4 12+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 420
;420:		UI_DrawBannerString2(x + 2, y + 2, str, drawcolor);
ADDRFP4 0
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 421
;421:	}
LABELV $170
line 423
;422:
;423:	UI_DrawBannerString2(x, y, str, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawBannerString2
CALLV
pop
line 424
;424:}
LABELV $154
endproc UI_DrawBannerString 40 16
export UI_ProportionalStringWidth
proc UI_ProportionalStringWidth 16 0
line 426
;425:
;426:int UI_ProportionalStringWidth(const char* str) {
line 432
;427:	const char* s;
;428:	int         ch;
;429:	int         charWidth;
;430:	int         width;
;431:
;432:	s     = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 433
;433:	width = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $177
JUMPV
LABELV $176
line 434
;434:	while (*s) {
line 435
;435:		ch        = *s & 127;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
ASGNI4
line 436
;436:		charWidth = propMap[ch][2];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
ASGNI4
line 437
;437:		if (charWidth != -1) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $180
line 438
;438:			width += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 439
;439:			width += PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 440
;440:		}
LABELV $180
line 441
;441:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 442
;442:	}
LABELV $177
line 434
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $176
line 444
;443:
;444:	width -= PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 445
;445:	return width;
ADDRLP4 12
INDIRI4
RETI4
LABELV $175
endproc UI_ProportionalStringWidth 16 0
proc UI_DrawProportionalString2 48 36
line 448
;446:}
;447:
;448:static void UI_DrawProportionalString2(int x, int y, const char* str, vec4_t color, float sizeScale, qhandle_t charset) {
line 453
;449:	const char*   s;
;450:	unsigned char ch;  // bk001204 - unsigned
;451:	float         ax;
;452:	float         ay;
;453:	float         aw = 0;  // bk001204 - init
ADDRLP4 8
CNSTF4 0
ASGNF4
line 461
;454:	float         ah;
;455:	float         frow;
;456:	float         fcol;
;457:	float         fwidth;
;458:	float         fheight;
;459:
;460:	// draw the colored text
;461:	trap_R_SetColor(color);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 463
;462:
;463:	ax = x * uis.scale + uis.biasX;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ADDRGP4 uis+11440
INDIRF4
ADDF4
ASGNF4
line 464
;464:	ay = y * uis.scale + uis.biasY;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ADDRGP4 uis+11444
INDIRF4
ADDF4
ASGNF4
line 466
;465:
;466:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $188
JUMPV
LABELV $187
line 467
;467:	while (*s) {
line 468
;468:		ch = *s & 127;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
CVIU4 4
CVUU1 4
ASGNU1
line 469
;469:		if (ch == ' ') {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $190
line 470
;470:			aw = (float)PROP_SPACE_WIDTH * uis.scale * sizeScale;
ADDRLP4 8
ADDRGP4 uis+11436
INDIRF4
CNSTF4 1090519040
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 471
;471:		} else if (propMap[ch][2] != -1) {
ADDRGP4 $191
JUMPV
LABELV $190
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $193
line 472
;472:			fcol    = (float)propMap[ch][0] / 256.0f;
ADDRLP4 20
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 473
;473:			frow    = (float)propMap[ch][1] / 256.0f;
ADDRLP4 16
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+4
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 474
;474:			fwidth  = (float)propMap[ch][2] / 256.0f;
ADDRLP4 28
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
CNSTF4 998244352
MULF4
ASGNF4
line 475
;475:			fheight = (float)PROP_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1037565952
ASGNF4
line 476
;476:			aw      = (float)propMap[ch][2] * uis.scale * sizeScale;
ADDRLP4 8
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 477
;477:			ah      = (float)PROP_HEIGHT * uis.scale * sizeScale;
ADDRLP4 24
ADDRGP4 uis+11436
INDIRF4
CNSTF4 1104674816
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 478
;478:			trap_R_DrawStretchPic(ax, ay, aw, ah, fcol, frow, fcol + fwidth, frow + fheight, charset);
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ADDRLP4 28
INDIRF4
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ARGF4
ADDRFP4 20
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 479
;479:		}
LABELV $193
LABELV $191
line 481
;480:
;481:		ax += (aw + (float)PROP_GAP_WIDTH * uis.scale * sizeScale);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 uis+11436
INDIRF4
CNSTF4 1077936128
MULF4
ADDRFP4 16
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 482
;482:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 483
;483:	}
LABELV $188
line 467
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $187
line 485
;484:
;485:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 486
;486:}
LABELV $182
endproc UI_DrawProportionalString2 48 36
export UI_ProportionalSizeScale
proc UI_ProportionalSizeScale 0 0
line 493
;487:
;488:/*
;489:=================
;490:UI_ProportionalSizeScale
;491:=================
;492:*/
;493:float UI_ProportionalSizeScale(int style) {
line 494
;494:	if (style & UI_SMALLFONT) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $203
line 495
;495:		return PROP_SMALL_SIZE_SCALE;
CNSTF4 1061158912
RETF4
ADDRGP4 $202
JUMPV
LABELV $203
line 498
;496:	}
;497:
;498:	return 1.00;
CNSTF4 1065353216
RETF4
LABELV $202
endproc UI_ProportionalSizeScale 0 0
export UI_DrawProportionalString
proc UI_DrawProportionalString 44 24
line 506
;499:}
;500:
;501:/*
;502:=================
;503:UI_DrawProportionalString
;504:=================
;505:*/
;506:void UI_DrawProportionalString(int x, int y, const char* str, int style, vec4_t color) {
line 511
;507:	vec4_t drawcolor;
;508:	int    width;
;509:	float  sizeScale;
;510:
;511:	sizeScale = UI_ProportionalSizeScale(style);
ADDRFP4 12
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 16
ADDRLP4 24
INDIRF4
ASGNF4
line 513
;512:
;513:	switch (style & UI_FORMATMASK) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $207
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $209
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $210
ADDRGP4 $207
JUMPV
LABELV $209
line 515
;514:	case UI_CENTER:
;515:		width = UI_ProportionalStringWidth(str) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 36
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 36
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 516
;516:		x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 517
;517:		break;
ADDRGP4 $207
JUMPV
LABELV $210
line 520
;518:
;519:	case UI_RIGHT:
;520:		width = UI_ProportionalStringWidth(str) * sizeScale;
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 40
INDIRI4
CVIF4 4
ADDRLP4 16
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 521
;521:		x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 522
;522:		break;
line 526
;523:
;524:	case UI_LEFT:
;525:	default:
;526:		break;
LABELV $207
line 529
;527:	}
;528:
;529:	if (style & UI_DROPSHADOW) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $212
line 530
;530:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
ADDRLP4 36
CNSTF4 0
ASGNF4
ADDRLP4 0+8
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 36
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 36
INDIRF4
ASGNF4
line 531
;531:		drawcolor[3]                               = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 532
;532:		UI_DrawProportionalString2(x + 2, y + 2, str, drawcolor, sizeScale, uis.charsetProp);
ADDRFP4 0
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 533
;533:	}
LABELV $212
line 535
;534:
;535:	if (style & UI_INVERSE) {
ADDRFP4 12
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $218
line 536
;536:		drawcolor[0] = color[0] * 0.7;
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 537
;537:		drawcolor[1] = color[1] * 0.7;
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 538
;538:		drawcolor[2] = color[2] * 0.7;
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 539
;539:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 540
;540:		UI_DrawProportionalString2(x, y, str, drawcolor, sizeScale, uis.charsetProp);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 541
;541:		return;
ADDRGP4 $205
JUMPV
LABELV $218
line 544
;542:	}
;543:
;544:	if (style & UI_PULSE) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $224
line 545
;545:		drawcolor[0] = color[0] * 0.7;
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 546
;546:		drawcolor[1] = color[1] * 0.7;
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 547
;547:		drawcolor[2] = color[2] * 0.7;
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1060320051
MULF4
ASGNF4
line 548
;548:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 549
;549:		UI_DrawProportionalString2(x, y, str, color, sizeScale, uis.charsetProp);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 551
;550:
;551:		drawcolor[0] = color[0];
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
ASGNF4
line 552
;552:		drawcolor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 553
;553:		drawcolor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 554
;554:		drawcolor[3] = 0.5 + 0.5 * sin((uis.realtime % TMOD_075) / PULSE_DIVISOR);
ADDRGP4 uis+4
INDIRI4
CNSTI4 2292106
MODI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 36
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+12
ADDRLP4 36
INDIRF4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
ASGNF4
line 555
;555:		UI_DrawProportionalString2(x, y, str, drawcolor, sizeScale, uis.charsetPropGlow);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11412
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 556
;556:		return;
ADDRGP4 $205
JUMPV
LABELV $224
line 559
;557:	}
;558:
;559:	UI_DrawProportionalString2(x, y, str, color, sizeScale, uis.charsetProp);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 uis+11408
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 560
;560:}
LABELV $205
endproc UI_DrawProportionalString 44 24
export UI_DrawProportionalString_AutoWrapped
proc UI_DrawProportionalString_AutoWrapped 1064 20
line 567
;561:
;562:/*
;563:=================
;564:UI_DrawProportionalString_Wrapped
;565:=================
;566:*/
;567:void UI_DrawProportionalString_AutoWrapped(int x, int y, int xmax, int ystep, const char* str, int style, vec4_t color) {
line 574
;568:	int   width;
;569:	char *s1, *s2, *s3;
;570:	char  c_bcp;
;571:	char  buf[1024];
;572:	float sizeScale;
;573:
;574:	if (!str || str[0] == '\0')
ADDRLP4 1048
ADDRFP4 16
INDIRP4
ASGNP4
ADDRLP4 1048
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $239
ADDRLP4 1048
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $237
LABELV $239
line 575
;575:		return;
ADDRGP4 $236
JUMPV
LABELV $237
line 577
;576:
;577:	sizeScale = UI_ProportionalSizeScale(style);
ADDRFP4 20
INDIRI4
ARGI4
ADDRLP4 1052
ADDRGP4 UI_ProportionalSizeScale
CALLF4
ASGNF4
ADDRLP4 20
ADDRLP4 1052
INDIRF4
ASGNF4
line 579
;578:
;579:	Q_strncpyz(buf, str, sizeof(buf));
ADDRLP4 24
ARGP4
ADDRFP4 16
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 580
;580:	s1 = s2 = s3 = buf;
ADDRLP4 0
ADDRLP4 24
ASGNP4
ADDRLP4 4
ADDRLP4 24
ASGNP4
ADDRLP4 12
ADDRLP4 24
ASGNP4
ADDRGP4 $241
JUMPV
LABELV $240
line 582
;581:
;582:	while (1) {
LABELV $243
line 583
;583:		do {
line 584
;584:			s3++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 585
;585:		} while (*s3 != ' ' && *s3 != '\0');
LABELV $244
ADDRLP4 1056
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1056
INDIRI4
CNSTI4 32
EQI4 $246
ADDRLP4 1056
INDIRI4
CNSTI4 0
NEI4 $243
LABELV $246
line 586
;586:		c_bcp = *s3;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 587
;587:		*s3   = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 588
;588:		width = UI_ProportionalStringWidth(s1) * sizeScale;
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 1060
ADDRGP4 UI_ProportionalStringWidth
CALLI4
ASGNI4
ADDRLP4 16
ADDRLP4 1060
INDIRI4
CVIF4 4
ADDRLP4 20
INDIRF4
MULF4
CVFI4 4
ASGNI4
line 589
;589:		*s3   = c_bcp;
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI1
ASGNI1
line 590
;590:		if (width > xmax) {
ADDRLP4 16
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $247
line 591
;591:			if (s1 == s2) {
ADDRLP4 12
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
NEU4 $249
line 593
;592:				// fuck, don't have a clean cut, we'll overflow
;593:				s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 594
;594:			}
LABELV $249
line 595
;595:			*s2 = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 596
;596:			UI_DrawProportionalString(x, y, s1, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 597
;597:			y += ystep;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
ASGNI4
line 598
;598:			if (c_bcp == '\0') {
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $251
line 603
;599:				// that was the last word
;600:				// we could start a new loop, but that wouldn't be much use
;601:				// even if the word is too long, we would overflow it (see above)
;602:				// so just print it now if needed
;603:				s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 604
;604:				if (*s2 != '\0')  // if we are printing an overflowing line we have s2 == s3
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $242
line 605
;605:					UI_DrawProportionalString(x, y, s2, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 606
;606:				break;
ADDRGP4 $242
JUMPV
LABELV $251
line 608
;607:			}
;608:			s2++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 609
;609:			s1 = s2;
ADDRLP4 12
ADDRLP4 4
INDIRP4
ASGNP4
line 610
;610:			s3 = s2;
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 611
;611:		} else {
ADDRGP4 $248
JUMPV
LABELV $247
line 612
;612:			s2 = s3;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
line 613
;613:			if (c_bcp == '\0')  // we reached the end
ADDRLP4 8
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $255
line 614
;614:			{
line 615
;615:				UI_DrawProportionalString(x, y, s1, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRFP4 20
INDIRI4
ARGI4
ADDRFP4 24
INDIRP4
ARGP4
ADDRGP4 UI_DrawProportionalString
CALLV
pop
line 616
;616:				break;
ADDRGP4 $242
JUMPV
LABELV $255
line 618
;617:			}
;618:		}
LABELV $248
line 619
;619:	}
LABELV $241
line 582
ADDRGP4 $240
JUMPV
LABELV $242
line 620
;620:}
LABELV $236
endproc UI_DrawProportionalString_AutoWrapped 1064 20
proc UI_DrawString2 64 36
line 627
;621:
;622:/*
;623:=================
;624:UI_DrawString2
;625:=================
;626:*/
;627:static void UI_DrawString2(int x, int y, const char* str, vec4_t color, int charw, int charh) {
line 630
;628:	const char* s;
;629:	char        ch;
;630:	int         forceColor = qfalse;  // APSFIXME;
ADDRLP4 40
CNSTI4 0
ASGNI4
line 639
;631:	vec4_t      tempcolor;
;632:	float       ax;
;633:	float       ay;
;634:	float       aw;
;635:	float       ah;
;636:	float       frow;
;637:	float       fcol;
;638:
;639:	if (y < -charh)
ADDRFP4 4
INDIRI4
ADDRFP4 20
INDIRI4
NEGI4
GEI4 $258
line 641
;640:		// offscreen
;641:		return;
ADDRGP4 $257
JUMPV
LABELV $258
line 644
;642:
;643:	// draw the colored text
;644:	trap_R_SetColor(color);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 646
;645:
;646:	ax = x * uis.scale + uis.biasX;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ADDRGP4 uis+11440
INDIRF4
ADDF4
ASGNF4
line 647
;647:	ay = y * uis.scale + uis.biasY;
ADDRLP4 44
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ADDRGP4 uis+11444
INDIRF4
ADDF4
ASGNF4
line 648
;648:	aw = charw * uis.scale;
ADDRLP4 12
ADDRFP4 16
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ASGNF4
line 649
;649:	ah = charh * uis.scale;
ADDRLP4 48
ADDRFP4 20
INDIRI4
CVIF4 4
ADDRGP4 uis+11436
INDIRF4
MULF4
ASGNF4
line 651
;650:
;651:	s = str;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $267
JUMPV
LABELV $266
line 652
;652:	while (*s) {
line 653
;653:		if (Q_IsColorString(s)) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $269
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $269
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $269
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $269
line 654
;654:			if (!forceColor) {
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $271
line 655
;655:				memcpy(tempcolor, g_color_table[ColorIndex(s[1])], sizeof(tempcolor));
ADDRLP4 24
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 656
;656:				tempcolor[3] = color[3];
ADDRLP4 24+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 657
;657:				trap_R_SetColor(tempcolor);
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 658
;658:			}
LABELV $271
line 659
;659:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 660
;660:			continue;
ADDRGP4 $267
JUMPV
LABELV $269
line 663
;661:		}
;662:
;663:		ch = *s & 255;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
CVII1 4
ASGNI1
line 664
;664:		if (ch != ' ') {
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 32
EQI4 $274
line 665
;665:			frow = (ch >> 4) * 0.0625;
ADDRLP4 16
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 4
RSHI4
CVIF4 4
CNSTF4 1031798784
MULF4
ASGNF4
line 666
;666:			fcol = (ch & 15) * 0.0625;
ADDRLP4 20
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 15
BANDI4
CVIF4 4
CNSTF4 1031798784
MULF4
ASGNF4
line 667
;667:			trap_R_DrawStretchPic(ax, ay, aw, ah, fcol, frow, fcol + 0.0625, frow + 0.0625, uis.charset);
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 44
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
CNSTF4 1031798784
ADDF4
ARGF4
ADDRLP4 16
INDIRF4
CNSTF4 1031798784
ADDF4
ARGF4
ADDRGP4 uis+11404
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 668
;668:		}
LABELV $274
line 670
;669:
;670:		ax += aw;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ASGNF4
line 671
;671:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 672
;672:	}
LABELV $267
line 652
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $266
line 674
;673:
;674:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 675
;675:}
LABELV $257
endproc UI_DrawString2 64 36
export UI_DrawString
proc UI_DrawString 80 24
line 682
;676:
;677:/*
;678:=================
;679:UI_DrawString
;680:=================
;681:*/
;682:void UI_DrawString(int x, int y, const char* str, int style, vec4_t color) {
line 691
;683:	int    len;
;684:	int    charw;
;685:	int    charh;
;686:	vec4_t newcolor;
;687:	vec4_t lowlight;
;688:	float* drawcolor;
;689:	vec4_t dropcolor;
;690:
;691:	if (!str) {
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $278
line 692
;692:		return;
ADDRGP4 $277
JUMPV
LABELV $278
line 695
;693:	}
;694:
;695:	if ((style & UI_BLINK) && ((uis.realtime / BLINK_DIVISOR) & 1))
ADDRFP4 12
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
EQI4 $280
ADDRGP4 uis+4
INDIRI4
CNSTI4 200
DIVI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $280
line 696
;696:		return;
ADDRGP4 $277
JUMPV
LABELV $280
line 698
;697:
;698:	if (style & UI_SMALLFONT) {
ADDRFP4 12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $283
line 699
;699:		charw = SMALLCHAR_WIDTH;
ADDRLP4 0
CNSTI4 8
ASGNI4
line 700
;700:		charh = SMALLCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 701
;701:	} else if (style & UI_GIANTFONT) {
ADDRGP4 $284
JUMPV
LABELV $283
ADDRFP4 12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $285
line 702
;702:		charw = GIANTCHAR_WIDTH;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 703
;703:		charh = GIANTCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 48
ASGNI4
line 704
;704:	} else {
ADDRGP4 $286
JUMPV
LABELV $285
line 705
;705:		charw = BIGCHAR_WIDTH;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 706
;706:		charh = BIGCHAR_HEIGHT;
ADDRLP4 4
CNSTI4 16
ASGNI4
line 707
;707:	}
LABELV $286
LABELV $284
line 709
;708:
;709:	if (style & UI_PULSE) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $287
line 710
;710:		lowlight[0] = 0.8 * color[0];
ADDRLP4 8
ADDRFP4 16
INDIRP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 711
;711:		lowlight[1] = 0.8 * color[1];
ADDRLP4 8+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 712
;712:		lowlight[2] = 0.8 * color[2];
ADDRLP4 8+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 713
;713:		lowlight[3] = 0.8 * color[3];
ADDRLP4 8+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 714
;714:		UI_LerpColor(color, lowlight, newcolor, 0.5 + 0.5 * sin(uis.realtime / PULSE_DIVISOR));
ADDRGP4 uis+4
INDIRI4
CNSTI4 75
DIVI4
CVIF4 4
ARGF4
ADDRLP4 64
ADDRGP4 sin
CALLF4
ASGNF4
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
ADDRLP4 44
ARGP4
ADDRLP4 64
INDIRF4
CNSTF4 1056964608
MULF4
CNSTF4 1056964608
ADDF4
ARGF4
ADDRGP4 UI_LerpColor
CALLV
pop
line 715
;715:		drawcolor = newcolor;
ADDRLP4 24
ADDRLP4 44
ASGNP4
line 716
;716:	} else
ADDRGP4 $288
JUMPV
LABELV $287
line 717
;717:		drawcolor = color;
ADDRLP4 24
ADDRFP4 16
INDIRP4
ASGNP4
LABELV $288
line 719
;718:
;719:	switch (style & UI_FORMATMASK) {
ADDRLP4 64
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 64
INDIRI4
CNSTI4 1
EQI4 $296
ADDRLP4 64
INDIRI4
CNSTI4 2
EQI4 $297
ADDRGP4 $294
JUMPV
LABELV $296
line 722
;720:	case UI_CENTER:
;721:		// center justify at x
;722:		len = strlen(str);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 72
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 72
INDIRI4
ASGNI4
line 723
;723:		x   = x - len * charw / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 724
;724:		break;
ADDRGP4 $294
JUMPV
LABELV $297
line 728
;725:
;726:	case UI_RIGHT:
;727:		// right justify at x
;728:		len = strlen(str);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 76
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 60
ADDRLP4 76
INDIRI4
ASGNI4
line 729
;729:		x   = x - len * charw;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 60
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
SUBI4
ASGNI4
line 730
;730:		break;
line 734
;731:
;732:	default:
;733:		// left justify at x
;734:		break;
LABELV $294
line 737
;735:	}
;736:
;737:	if (style & UI_DROPSHADOW) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $298
line 738
;738:		dropcolor[0] = dropcolor[1] = dropcolor[2] = 0;
ADDRLP4 72
CNSTF4 0
ASGNF4
ADDRLP4 28+8
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 28+4
ADDRLP4 72
INDIRF4
ASGNF4
ADDRLP4 28
ADDRLP4 72
INDIRF4
ASGNF4
line 739
;739:		dropcolor[3]                               = drawcolor[3];
ADDRLP4 28+12
ADDRLP4 24
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 740
;740:		UI_DrawString2(x + 2, y + 2, str, dropcolor, charw, charh);
ADDRFP4 0
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 28
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawString2
CALLV
pop
line 741
;741:	}
LABELV $298
line 743
;742:
;743:	UI_DrawString2(x, y, str, drawcolor, charw, charh);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 24
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_DrawString2
CALLV
pop
line 744
;744:}
LABELV $277
endproc UI_DrawString 80 24
export UI_DrawChar
proc UI_DrawChar 2 20
line 751
;745:
;746:/*
;747:=================
;748:UI_DrawChar
;749:=================
;750:*/
;751:void UI_DrawChar(int x, int y, int ch, int style, vec4_t color) {
line 754
;752:	char buff[2];
;753:
;754:	buff[0] = ch;
ADDRLP4 0
ADDRFP4 8
INDIRI4
CVII1 4
ASGNI1
line 755
;755:	buff[1] = '\0';
ADDRLP4 0+1
CNSTI1 0
ASGNI1
line 757
;756:
;757:	UI_DrawString(x, y, buff, style, color);
ADDRFP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 758
;758:}
LABELV $303
endproc UI_DrawChar 2 20
export UI_IsFullscreen
proc UI_IsFullscreen 4 0
line 760
;759:
;760:qboolean UI_IsFullscreen(void) {
line 761
;761:	if (uis.activemenu && (trap_Key_GetCatcher() & KEYCATCH_UI)) {
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $306
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $306
line 762
;762:		return uis.activemenu->fullscreen;
ADDRGP4 uis+20
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
RETI4
ADDRGP4 $305
JUMPV
LABELV $306
line 765
;763:	}
;764:
;765:	return qfalse;
CNSTI4 0
RETI4
LABELV $305
endproc UI_IsFullscreen 4 0
proc NeedCDAction 0 8
line 768
;766:}
;767:
;768:static void NeedCDAction(qboolean result) {
line 769
;769:	if (!result) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $311
line 770
;770:		trap_Cmd_ExecuteText(EXEC_APPEND, "quit\n");
CNSTI4 2
ARGI4
ADDRGP4 $313
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 771
;771:	}
LABELV $311
line 772
;772:}
LABELV $310
endproc NeedCDAction 0 8
proc NeedCDKeyAction 0 8
line 774
;773:
;774:static void NeedCDKeyAction(qboolean result) {
line 775
;775:	if (!result) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $315
line 776
;776:		trap_Cmd_ExecuteText(EXEC_APPEND, "quit\n");
CNSTI4 2
ARGI4
ADDRGP4 $313
ARGP4
ADDRGP4 trap_Cmd_ExecuteText
CALLV
pop
line 777
;777:	}
LABELV $315
line 778
;778:}
LABELV $314
endproc NeedCDKeyAction 0 8
export UI_SetActiveMenu
proc UI_SetActiveMenu 8 12
line 780
;779:
;780:void UI_SetActiveMenu(uiMenuCommand_t menu) {
line 783
;781:	// this should be the ONLY way the menu system is brought up
;782:	// enusure minumum menu data is cached
;783:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 785
;784:
;785:	switch (menu) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $318
ADDRLP4 0
INDIRI4
CNSTI4 6
GTI4 $318
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $331
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $331
address $321
address $322
address $327
address $323
address $325
address $329
address $329
code
LABELV $321
line 787
;786:	case UIMENU_NONE:
;787:		UI_ForceMenuOff();
ADDRGP4 UI_ForceMenuOff
CALLV
pop
line 788
;788:		return;
ADDRGP4 $317
JUMPV
LABELV $322
line 790
;789:	case UIMENU_MAIN:
;790:		UI_MainMenu();
ADDRGP4 UI_MainMenu
CALLV
pop
line 791
;791:		return;
ADDRGP4 $317
JUMPV
LABELV $323
line 793
;792:	case UIMENU_NEED_CD:
;793:		UI_ConfirmMenu("Insert the CD", (voidfunc_f)NULL, NeedCDAction);
ADDRGP4 $324
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 NeedCDAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 794
;794:		return;
ADDRGP4 $317
JUMPV
LABELV $325
line 796
;795:	case UIMENU_BAD_CD_KEY:
;796:		UI_ConfirmMenu("Bad CD Key", (voidfunc_f)NULL, NeedCDKeyAction);
ADDRGP4 $326
ARGP4
CNSTP4 0
ARGP4
ADDRGP4 NeedCDKeyAction
ARGP4
ADDRGP4 UI_ConfirmMenu
CALLV
pop
line 797
;797:		return;
ADDRGP4 $317
JUMPV
LABELV $327
line 804
;798:	case UIMENU_INGAME:
;799:		/*
;800:		//GRank
;801:		UI_RankingsMenu();
;802:		return;
;803:		*/
;804:		trap_Cvar_Set("cl_paused", "1");
ADDRGP4 $123
ARGP4
ADDRGP4 $328
ARGP4
ADDRGP4 trap_Cvar_Set
CALLV
pop
line 805
;805:		UI_InGameMenu();
ADDRGP4 UI_InGameMenu
CALLV
pop
line 806
;806:		return;
ADDRGP4 $317
JUMPV
LABELV $329
LABELV $318
line 813
;807:
;808:	// bk001204
;809:	case UIMENU_TEAM:
;810:	case UIMENU_POSTGAME:
;811:	default:
;812:#ifndef NDEBUG
;813:		Com_Printf("UI_SetActiveMenu: bad enum %d\n", menu);
ADDRGP4 $330
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 Com_Printf
CALLV
pop
line 815
;814:#endif
;815:		break;
LABELV $319
line 817
;816:	}
;817:}
LABELV $317
endproc UI_SetActiveMenu 8 12
export UI_KeyEvent
proc UI_KeyEvent 20 8
line 824
;818:
;819:/*
;820:=================
;821:UI_KeyEvent
;822:=================
;823:*/
;824:void UI_KeyEvent(int key, int down) {
line 827
;825:	sfxHandle_t s;
;826:
;827:	UI_VideoCheck(trap_Milliseconds());
ADDRLP4 4
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 UI_VideoCheck
CALLV
pop
line 828
;828:	if (!uis.activemenu) {
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $333
line 829
;829:		return;
ADDRGP4 $332
JUMPV
LABELV $333
line 832
;830:	}
;831:
;832:	if (!down) {
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $336
line 833
;833:		return;
ADDRGP4 $332
JUMPV
LABELV $336
line 836
;834:	}
;835:
;836:	if (uis.activemenu->key)
ADDRGP4 uis+20
INDIRP4
CNSTI4 272
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $338
line 837
;837:		s = uis.activemenu->key(key);
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 uis+20
INDIRP4
CNSTI4 272
ADDP4
INDIRP4
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRGP4 $339
JUMPV
LABELV $338
line 839
;838:	else
;839:		s = Menu_DefaultKey(uis.activemenu, key);
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 12
ADDRGP4 Menu_DefaultKey
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
LABELV $339
line 841
;840:
;841:	if ((s > 0) && (s != menu_null_sound))
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $343
ADDRLP4 0
INDIRI4
ADDRGP4 menu_null_sound
INDIRI4
EQI4 $343
line 842
;842:		trap_S_StartLocalSound(s, CHAN_LOCAL_SOUND);
ADDRLP4 0
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
LABELV $343
line 843
;843:}
LABELV $332
endproc UI_KeyEvent 20 8
export UI_MouseEvent
proc UI_MouseEvent 24 8
line 850
;844:
;845:/*
;846:=================
;847:UI_MouseEvent
;848:=================
;849:*/
;850:void UI_MouseEvent(int dx, int dy) {
line 854
;851:	int           i;
;852:	menucommon_s* m;
;853:
;854:	if (!uis.activemenu)
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $346
line 855
;855:		return;
ADDRGP4 $345
JUMPV
LABELV $346
line 858
;856:
;857:	// update virtual mouse cursor coordinates
;858:	uis.cursorx += dx * uis.cursorScaleR;
ADDRLP4 8
ADDRGP4 uis+8
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 uis+11448
INDIRF4
MULF4
ADDF4
ASGNF4
line 859
;859:	uis.cursory += dy * uis.cursorScaleR;
ADDRLP4 12
ADDRGP4 uis+12
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 uis+11448
INDIRF4
MULF4
ADDF4
ASGNF4
line 862
;860:
;861:	// clamp virtual coordinates
;862:	if (uis.cursorx < uis.screenXmin)
ADDRGP4 uis+8
INDIRF4
ADDRGP4 uis+11452
INDIRF4
GEF4 $353
line 863
;863:		uis.cursorx = uis.screenXmin;
ADDRGP4 uis+8
ADDRGP4 uis+11452
INDIRF4
ASGNF4
ADDRGP4 $354
JUMPV
LABELV $353
line 864
;864:	else if (uis.cursorx > uis.screenXmax)
ADDRGP4 uis+8
INDIRF4
ADDRGP4 uis+11456
INDIRF4
LEF4 $359
line 865
;865:		uis.cursorx = uis.screenXmax;
ADDRGP4 uis+8
ADDRGP4 uis+11456
INDIRF4
ASGNF4
LABELV $359
LABELV $354
line 867
;866:
;867:	if (uis.cursory < uis.screenYmin)
ADDRGP4 uis+12
INDIRF4
ADDRGP4 uis+11460
INDIRF4
GEF4 $365
line 868
;868:		uis.cursory = uis.screenYmin;
ADDRGP4 uis+12
ADDRGP4 uis+11460
INDIRF4
ASGNF4
ADDRGP4 $366
JUMPV
LABELV $365
line 869
;869:	else if (uis.cursory > uis.screenYmax)
ADDRGP4 uis+12
INDIRF4
ADDRGP4 uis+11464
INDIRF4
LEF4 $371
line 870
;870:		uis.cursory = uis.screenYmax;
ADDRGP4 uis+12
ADDRGP4 uis+11464
INDIRF4
ASGNF4
LABELV $371
LABELV $366
line 873
;871:
;872:	// region test the active menu items
;873:	for (i = 0; i < uis.activemenu->nitems; i++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $380
JUMPV
LABELV $377
line 874
;874:		m = (menucommon_s*)uis.activemenu->items[i];
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
ASGNP4
line 876
;875:
;876:		if (m->flags & (QMF_GRAYED | QMF_INACTIVE))
ADDRLP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 24576
BANDU4
CNSTU4 0
EQU4 $383
line 877
;877:			continue;
ADDRGP4 $378
JUMPV
LABELV $383
line 879
;878:
;879:		if ((uis.cursorx < m->left) || (uis.cursorx > m->right) || (uis.cursory < m->top) || (uis.cursory > m->bottom)) {
ADDRGP4 uis+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
LTF4 $393
ADDRGP4 uis+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
CVIF4 4
GTF4 $393
ADDRGP4 uis+12
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
LTF4 $393
ADDRGP4 uis+12
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
CVIF4 4
LEF4 $385
LABELV $393
line 881
;880:			// cursor out of item bounds
;881:			continue;
ADDRGP4 $378
JUMPV
LABELV $385
line 885
;882:		}
;883:
;884:		// set focus to item at cursor
;885:		if (uis.activemenu->cursor != i) {
ADDRGP4 uis+20
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $394
line 886
;886:			Menu_SetCursor(uis.activemenu, i);
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRGP4 Menu_SetCursor
CALLV
pop
line 887
;887:			((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor_prev]))->flags &= ~QMF_HASMOUSEFOCUS;
ADDRLP4 20
ADDRGP4 uis+20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTI4 -513
CVIU4 4
BANDU4
ASGNU4
line 889
;888:
;889:			if (!(((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags & QMF_SILENT)) {
ADDRGP4 uis+20
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 1048576
BANDU4
CNSTU4 0
NEU4 $400
line 890
;890:				trap_S_StartLocalSound(menu_move_sound, CHAN_LOCAL_SOUND);
ADDRGP4 menu_move_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 891
;891:			}
LABELV $400
line 892
;892:		}
LABELV $394
line 894
;893:
;894:		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags |= QMF_HASMOUSEFOCUS;
ADDRLP4 20
ADDRGP4 uis+20
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRU4
CNSTU4 512
BORU4
ASGNU4
line 895
;895:		return;
ADDRGP4 $345
JUMPV
LABELV $378
line 873
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $380
ADDRLP4 4
INDIRI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $377
line 898
;896:	}
;897:
;898:	if (uis.activemenu->nitems > 0) {
ADDRGP4 uis+20
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
CNSTI4 0
LEI4 $406
line 900
;899:		// out of any region
;900:		((menucommon_s*)(uis.activemenu->items[uis.activemenu->cursor]))->flags &= ~QMF_HASMOUSEFOCUS;
ADDRLP4 16
ADDRGP4 uis+20
INDIRP4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 uis+20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRU4
CNSTI4 -513
CVIU4 4
BANDU4
ASGNU4
line 901
;901:	}
LABELV $406
line 902
;902:}
LABELV $345
endproc UI_MouseEvent 24 8
bss
align 1
LABELV $412
skip 1024
export UI_Argv
code
proc UI_Argv 0 12
line 904
;903:
;904:char* UI_Argv(int arg) {
line 907
;905:	static char buffer[MAX_STRING_CHARS];
;906:
;907:	trap_Argv(arg, buffer, sizeof(buffer));
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 $412
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Argv
CALLV
pop
line 909
;908:
;909:	return buffer;
ADDRGP4 $412
RETP4
LABELV $411
endproc UI_Argv 0 12
bss
align 1
LABELV $414
skip 1024
export UI_Cvar_VariableString
code
proc UI_Cvar_VariableString 0 12
line 912
;910:}
;911:
;912:char* UI_Cvar_VariableString(const char* var_name) {
line 915
;913:	static char buffer[MAX_STRING_CHARS];
;914:
;915:	trap_Cvar_VariableStringBuffer(var_name, buffer, sizeof(buffer));
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $414
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 trap_Cvar_VariableStringBuffer
CALLV
pop
line 917
;916:
;917:	return buffer;
ADDRGP4 $414
RETP4
LABELV $413
endproc UI_Cvar_VariableString 0 12
export UI_Cache_f
proc UI_Cache_f 0 0
line 925
;918:}
;919:
;920:/*
;921:=================
;922:UI_Cache
;923:=================
;924:*/
;925:void UI_Cache_f(void) {
line 926
;926:	MainMenu_Cache();
ADDRGP4 MainMenu_Cache
CALLV
pop
line 927
;927:	InGame_Cache();
ADDRGP4 InGame_Cache
CALLV
pop
line 928
;928:	ConfirmMenu_Cache();
ADDRGP4 ConfirmMenu_Cache
CALLV
pop
line 929
;929:	PlayerModel_Cache();
ADDRGP4 PlayerModel_Cache
CALLV
pop
line 930
;930:	PlayerSettings_Cache();
ADDRGP4 PlayerSettings_Cache
CALLV
pop
line 931
;931:	Controls_Cache();
ADDRGP4 Controls_Cache
CALLV
pop
line 932
;932:	Demos_Cache();
ADDRGP4 Demos_Cache
CALLV
pop
line 933
;933:	UI_CinematicsMenu_Cache();
ADDRGP4 UI_CinematicsMenu_Cache
CALLV
pop
line 934
;934:	Preferences_Cache();
ADDRGP4 Preferences_Cache
CALLV
pop
line 935
;935:	ServerInfo_Cache();
ADDRGP4 ServerInfo_Cache
CALLV
pop
line 936
;936:	SpecifyServer_Cache();
ADDRGP4 SpecifyServer_Cache
CALLV
pop
line 937
;937:	ArenaServers_Cache();
ADDRGP4 ArenaServers_Cache
CALLV
pop
line 938
;938:	StartServer_Cache();
ADDRGP4 StartServer_Cache
CALLV
pop
line 939
;939:	ServerOptions_Cache();
ADDRGP4 ServerOptions_Cache
CALLV
pop
line 940
;940:	DriverInfo_Cache();
ADDRGP4 DriverInfo_Cache
CALLV
pop
line 941
;941:	GraphicsOptions_Cache();
ADDRGP4 GraphicsOptions_Cache
CALLV
pop
line 942
;942:	UI_DisplayOptionsMenu_Cache();
ADDRGP4 UI_DisplayOptionsMenu_Cache
CALLV
pop
line 943
;943:	UI_SoundOptionsMenu_Cache();
ADDRGP4 UI_SoundOptionsMenu_Cache
CALLV
pop
line 944
;944:	UI_NetworkOptionsMenu_Cache();
ADDRGP4 UI_NetworkOptionsMenu_Cache
CALLV
pop
line 945
;945:	UI_SPLevelMenu_Cache();
ADDRGP4 UI_SPLevelMenu_Cache
CALLV
pop
line 946
;946:	UI_SPSkillMenu_Cache();
ADDRGP4 UI_SPSkillMenu_Cache
CALLV
pop
line 947
;947:	UI_SPPostgameMenu_Cache();
ADDRGP4 UI_SPPostgameMenu_Cache
CALLV
pop
line 948
;948:	TeamMain_Cache();
ADDRGP4 TeamMain_Cache
CALLV
pop
line 949
;949:	UI_AddBots_Cache();
ADDRGP4 UI_AddBots_Cache
CALLV
pop
line 950
;950:	UI_RemoveBots_Cache();
ADDRGP4 UI_RemoveBots_Cache
CALLV
pop
line 951
;951:	UI_SetupMenu_Cache();
ADDRGP4 UI_SetupMenu_Cache
CALLV
pop
line 954
;952:	//	UI_LoadConfig_Cache();
;953:	//	UI_SaveConfigMenu_Cache();
;954:	UI_BotSelectMenu_Cache();
ADDRGP4 UI_BotSelectMenu_Cache
CALLV
pop
line 955
;955:	UI_CDKeyMenu_Cache();
ADDRGP4 UI_CDKeyMenu_Cache
CALLV
pop
line 956
;956:	UI_ModsMenu_Cache();
ADDRGP4 UI_ModsMenu_Cache
CALLV
pop
line 957
;957:}
LABELV $415
endproc UI_Cache_f 0 0
export UI_ConsoleCommand
proc UI_ConsoleCommand 40 8
line 964
;958:
;959:/*
;960:=================
;961:UI_ConsoleCommand
;962:=================
;963:*/
;964:qboolean UI_ConsoleCommand(int realTime) {
line 967
;965:	char* cmd;
;966:
;967:	uis.frametime = realTime - uis.realtime;
ADDRGP4 uis
ADDRFP4 0
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
ASGNI4
line 968
;968:	uis.realtime  = realTime;
ADDRGP4 uis+4
ADDRFP4 0
INDIRI4
ASGNI4
line 970
;969:
;970:	cmd = UI_Argv(0);
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 UI_Argv
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 973
;971:
;972:	// ensure minimum menu data is available
;973:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 975
;974:
;975:	if (Q_stricmp(cmd, "levelselect") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $421
ARGP4
ADDRLP4 8
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $419
line 976
;976:		UI_SPLevelMenu_f();
ADDRGP4 UI_SPLevelMenu_f
CALLV
pop
line 977
;977:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $416
JUMPV
LABELV $419
line 980
;978:	}
;979:
;980:	if (Q_stricmp(cmd, "postgame") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $424
ARGP4
ADDRLP4 12
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $422
line 981
;981:		UI_SPPostgameMenu_f();
ADDRGP4 UI_SPPostgameMenu_f
CALLV
pop
line 982
;982:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $416
JUMPV
LABELV $422
line 985
;983:	}
;984:
;985:	if (Q_stricmp(cmd, "ui_cache") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $427
ARGP4
ADDRLP4 16
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
NEI4 $425
line 986
;986:		UI_Cache_f();
ADDRGP4 UI_Cache_f
CALLV
pop
line 987
;987:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $416
JUMPV
LABELV $425
line 990
;988:	}
;989:
;990:	if (Q_stricmp(cmd, "ui_cinematics") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $430
ARGP4
ADDRLP4 20
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $428
line 991
;991:		UI_CinematicsMenu_f();
ADDRGP4 UI_CinematicsMenu_f
CALLV
pop
line 992
;992:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $416
JUMPV
LABELV $428
line 995
;993:	}
;994:
;995:	if (Q_stricmp(cmd, "ui_teamOrders") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $433
ARGP4
ADDRLP4 24
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $431
line 996
;996:		UI_TeamOrdersMenu_f();
ADDRGP4 UI_TeamOrdersMenu_f
CALLV
pop
line 997
;997:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $416
JUMPV
LABELV $431
line 1000
;998:	}
;999:
;1000:	if (Q_stricmp(cmd, "iamacheater") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $436
ARGP4
ADDRLP4 28
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
NEI4 $434
line 1001
;1001:		UI_SPUnlock_f();
ADDRGP4 UI_SPUnlock_f
CALLV
pop
line 1002
;1002:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $416
JUMPV
LABELV $434
line 1005
;1003:	}
;1004:
;1005:	if (Q_stricmp(cmd, "iamamonkey") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $439
ARGP4
ADDRLP4 32
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $437
line 1006
;1006:		UI_SPUnlockMedals_f();
ADDRGP4 UI_SPUnlockMedals_f
CALLV
pop
line 1007
;1007:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $416
JUMPV
LABELV $437
line 1010
;1008:	}
;1009:
;1010:	if (Q_stricmp(cmd, "ui_cdkey") == 0) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 $442
ARGP4
ADDRLP4 36
ADDRGP4 Q_stricmp
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
NEI4 $440
line 1011
;1011:		UI_CDKeyMenu_f();
ADDRGP4 UI_CDKeyMenu_f
CALLV
pop
line 1012
;1012:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $416
JUMPV
LABELV $440
line 1015
;1013:	}
;1014:
;1015:	return qfalse;
CNSTI4 0
RETI4
LABELV $416
endproc UI_ConsoleCommand 40 8
export UI_Shutdown
proc UI_Shutdown 0 0
line 1023
;1016:}
;1017:
;1018:/*
;1019:=================
;1020:UI_Shutdown
;1021:=================
;1022:*/
;1023:void UI_Shutdown(void) {}
LABELV $443
endproc UI_Shutdown 0 0
export UI_Init
proc UI_Init 0 4
line 1030
;1024:
;1025:/*
;1026:=================
;1027:UI_Init
;1028:=================
;1029:*/
;1030:void UI_Init(void) {
line 1031
;1031:	UI_RegisterCvars();
ADDRGP4 UI_RegisterCvars
CALLV
pop
line 1033
;1032:
;1033:	UI_InitGameinfo();
ADDRGP4 UI_InitGameinfo
CALLV
pop
line 1036
;1034:
;1035:	// cache redundant calulations
;1036:	UI_VideoCheck(-99999);
CNSTI4 -99999
ARGI4
ADDRGP4 UI_VideoCheck
CALLV
pop
line 1039
;1037:
;1038:	// initialize the menu system
;1039:	Menu_Cache();
ADDRGP4 Menu_Cache
CALLV
pop
line 1041
;1040:
;1041:	uis.activemenu = NULL;
ADDRGP4 uis+20
CNSTP4 0
ASGNP4
line 1042
;1042:	uis.menusp     = 0;
ADDRGP4 uis+16
CNSTI4 0
ASGNI4
line 1043
;1043:}
LABELV $444
endproc UI_Init 0 4
export UI_AdjustFrom640
proc UI_AdjustFrom640 16 0
line 1052
;1044:
;1045:/*
;1046:================
;1047:UI_AdjustFrom640
;1048:
;1049:Adjusted for resolution and screen aspect ratio
;1050:================
;1051:*/
;1052:void UI_AdjustFrom640(float* x, float* y, float* w, float* h) {
line 1054
;1053:	// expect valid pointers
;1054:	*x = *x * uis.scale + uis.biasX;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 uis+11436
INDIRF4
MULF4
ADDRGP4 uis+11440
INDIRF4
ADDF4
ASGNF4
line 1055
;1055:	*y = *y * uis.scale + uis.biasY;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 uis+11436
INDIRF4
MULF4
ADDRGP4 uis+11444
INDIRF4
ADDF4
ASGNF4
line 1056
;1056:	*w *= uis.scale;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 uis+11436
INDIRF4
MULF4
ASGNF4
line 1057
;1057:	*h *= uis.scale;
ADDRLP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 uis+11436
INDIRF4
MULF4
ASGNF4
line 1058
;1058:}
LABELV $447
endproc UI_AdjustFrom640 16 0
export UI_DrawNamedPic
proc UI_DrawNamedPic 8 36
line 1060
;1059:
;1060:void UI_DrawNamedPic(float x, float y, float width, float height, const char* picname) {
line 1063
;1061:	qhandle_t hShader;
;1062:
;1063:	hShader = trap_R_RegisterShaderNoMip(picname);
ADDRFP4 16
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 1064
;1064:	UI_AdjustFrom640(&x, &y, &width, &height);
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1065
;1065:	trap_R_DrawStretchPic(x, y, width, height, 0, 0, 1, 1, hShader);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1066
;1066:}
LABELV $454
endproc UI_DrawNamedPic 8 36
export UI_DrawHandlePic
proc UI_DrawHandlePic 16 36
line 1068
;1067:
;1068:void UI_DrawHandlePic(float x, float y, float w, float h, qhandle_t hShader) {
line 1074
;1069:	float s0;
;1070:	float s1;
;1071:	float t0;
;1072:	float t1;
;1073:
;1074:	if (w < 0) {  // flip about vertical
ADDRFP4 8
INDIRF4
CNSTF4 0
GEF4 $456
line 1075
;1075:		w  = -w;
ADDRFP4 8
ADDRFP4 8
INDIRF4
NEGF4
ASGNF4
line 1076
;1076:		s0 = 1;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1077
;1077:		s1 = 0;
ADDRLP4 4
CNSTF4 0
ASGNF4
line 1078
;1078:	} else {
ADDRGP4 $457
JUMPV
LABELV $456
line 1079
;1079:		s0 = 0;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1080
;1080:		s1 = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
line 1081
;1081:	}
LABELV $457
line 1083
;1082:
;1083:	if (h < 0) {  // flip about horizontal
ADDRFP4 12
INDIRF4
CNSTF4 0
GEF4 $458
line 1084
;1084:		h  = -h;
ADDRFP4 12
ADDRFP4 12
INDIRF4
NEGF4
ASGNF4
line 1085
;1085:		t0 = 1;
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
line 1086
;1086:		t1 = 0;
ADDRLP4 12
CNSTF4 0
ASGNF4
line 1087
;1087:	} else {
ADDRGP4 $459
JUMPV
LABELV $458
line 1088
;1088:		t0 = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1089
;1089:		t1 = 1;
ADDRLP4 12
CNSTF4 1065353216
ASGNF4
line 1090
;1090:	}
LABELV $459
line 1092
;1091:
;1092:	UI_AdjustFrom640(&x, &y, &w, &h);
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1093
;1093:	trap_R_DrawStretchPic(x, y, w, h, s0, t0, s1, t1, hShader);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1094
;1094:}
LABELV $455
endproc UI_DrawHandlePic 16 36
proc UI_DrawCursor 0 36
line 1096
;1095:
;1096:static void UI_DrawCursor(float x, float y, float w, float h) {
line 1098
;1097:
;1098:	UI_AdjustFrom640(&x, &y, &w, &h);
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1099
;1099:	trap_R_DrawStretchPic(x, y, w, h, 0, 0, 1, 1, uis.cursor);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 uis+11420
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1100
;1100:}
LABELV $460
endproc UI_DrawCursor 0 36
export UI_FillRect
proc UI_FillRect 0 36
line 1109
;1101:
;1102:/*
;1103:================
;1104:UI_FillRect
;1105:
;1106:Coordinates are 640*480 virtual values
;1107:=================
;1108:*/
;1109:void UI_FillRect(float x, float y, float width, float height, const float* color) {
line 1110
;1110:	trap_R_SetColor(color);
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1112
;1111:
;1112:	UI_AdjustFrom640(&x, &y, &width, &height);
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1113
;1113:	trap_R_DrawStretchPic(x, y, width, height, 0, 0, 0, 0, uis.whiteShader);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1115
;1114:
;1115:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1116
;1116:}
LABELV $462
endproc UI_FillRect 0 36
export UI_DrawRect
proc UI_DrawRect 0 36
line 1125
;1117:
;1118:/*
;1119:================
;1120:UI_DrawRect
;1121:
;1122:Coordinates are 640*480 virtual values
;1123:=================
;1124:*/
;1125:void UI_DrawRect(float x, float y, float width, float height, const float* color) {
line 1126
;1126:	trap_R_SetColor(color);
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1128
;1127:
;1128:	UI_AdjustFrom640(&x, &y, &width, &height);
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 UI_AdjustFrom640
CALLV
pop
line 1130
;1129:
;1130:	trap_R_DrawStretchPic(x, y, width, 1, 0, 0, 0, 0, uis.whiteShader);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1131
;1131:	trap_R_DrawStretchPic(x, y, 1, height, 0, 0, 0, 0, uis.whiteShader);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1132
;1132:	trap_R_DrawStretchPic(x, y + height - 1, width, 1, 0, 0, 0, 0, uis.whiteShader);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
CNSTF4 1065353216
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1133
;1133:	trap_R_DrawStretchPic(x + width - 1, y, 1, height, 0, 0, 0, 0, uis.whiteShader);
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
CNSTF4 1065353216
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRFP4 12
INDIRF4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+11392
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1135
;1134:
;1135:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1136
;1136:}
LABELV $464
endproc UI_DrawRect 0 36
export UI_SetColor
proc UI_SetColor 0 4
line 1138
;1137:
;1138:void UI_SetColor(const float* rgba) {
line 1139
;1139:	trap_R_SetColor(rgba);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1140
;1140:}
LABELV $469
endproc UI_SetColor 0 4
export UI_UpdateScreen
proc UI_UpdateScreen 0 0
line 1142
;1141:
;1142:void UI_UpdateScreen(void) {
line 1143
;1143:	trap_UpdateScreen();
ADDRGP4 trap_UpdateScreen
CALLV
pop
line 1144
;1144:}
LABELV $470
endproc UI_UpdateScreen 0 0
export UI_Refresh
proc UI_Refresh 8 36
line 1151
;1145:
;1146:/*
;1147:=================
;1148:UI_Refresh
;1149:=================
;1150:*/
;1151:void UI_Refresh(int realtime) {
line 1152
;1152:	uis.frametime = realtime - uis.realtime;
ADDRGP4 uis
ADDRFP4 0
INDIRI4
ADDRGP4 uis+4
INDIRI4
SUBI4
ASGNI4
line 1153
;1153:	uis.realtime  = realtime;
ADDRGP4 uis+4
ADDRFP4 0
INDIRI4
ASGNI4
line 1155
;1154:
;1155:	if (!(trap_Key_GetCatcher() & KEYCATCH_UI)) {
ADDRLP4 0
ADDRGP4 trap_Key_GetCatcher
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $474
line 1156
;1156:		return;
ADDRGP4 $471
JUMPV
LABELV $474
line 1159
;1157:	}
;1158:
;1159:	UI_UpdateCvars();
ADDRGP4 UI_UpdateCvars
CALLV
pop
line 1161
;1160:
;1161:	UI_VideoCheck(realtime);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 UI_VideoCheck
CALLV
pop
line 1163
;1162:
;1163:	if (uis.activemenu) {
ADDRGP4 uis+20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $476
line 1164
;1164:		if (uis.activemenu->fullscreen) {
ADDRGP4 uis+20
INDIRP4
CNSTI4 280
ADDP4
INDIRI4
CNSTI4 0
EQI4 $479
line 1166
;1165:			// draw the background
;1166:			trap_R_DrawStretchPic(0, 0, uis.glconfig.vidWidth, uis.glconfig.vidHeight, 0, 0, 1, 1, uis.menuBackNoLogoShader);
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+56+11304
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 uis+56+11308
INDIRI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 uis+11400
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1167
;1167:			if (uis.activemenu->showlogo) {
ADDRGP4 uis+20
INDIRP4
CNSTI4 284
ADDP4
INDIRI4
CNSTI4 0
EQI4 $487
line 1168
;1168:				trap_R_DrawStretchPic(0, 0, uis.glconfig.vidWidth, uis.glconfig.vidHeight, 0, 0, 1, 1, uis.menuBackShader);
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 uis+56+11304
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 uis+56+11308
INDIRI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 1065353216
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 uis+11396
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1171
;1169:				// trap_R_DrawStretchPic(0, 0, uis.glconfig.vidWidth*0.1, uis.glconfig.vidHeight*0.1, 0, 0, 1, 1, uis.logo_q3);
;1170:				// UI_DrawHandlePic(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, uis.menuBackShader);
;1171:			}
LABELV $487
line 1172
;1172:		}
LABELV $479
line 1174
;1173:
;1174:		if (uis.activemenu->draw)
ADDRGP4 uis+20
INDIRP4
CNSTI4 268
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $495
line 1175
;1175:			uis.activemenu->draw();
ADDRGP4 uis+20
INDIRP4
CNSTI4 268
ADDP4
INDIRP4
CALLV
pop
ADDRGP4 $496
JUMPV
LABELV $495
line 1177
;1176:		else
;1177:			Menu_Draw(uis.activemenu);
ADDRGP4 uis+20
INDIRP4
ARGP4
ADDRGP4 Menu_Draw
CALLV
pop
LABELV $496
line 1179
;1178:
;1179:		if (uis.firstdraw) {
ADDRGP4 uis+11472
INDIRI4
CNSTI4 0
EQI4 $500
line 1180
;1180:			UI_MouseEvent(0, 0);
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 UI_MouseEvent
CALLV
pop
line 1181
;1181:			uis.firstdraw = qfalse;
ADDRGP4 uis+11472
CNSTI4 0
ASGNI4
line 1182
;1182:		}
LABELV $500
line 1183
;1183:	}
LABELV $476
line 1186
;1184:
;1185:	// draw cursor
;1186:	UI_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 UI_SetColor
CALLV
pop
line 1187
;1187:	UI_DrawCursor(uis.cursorx - 16, uis.cursory - 16, 32, 32);
ADDRGP4 uis+8
INDIRF4
CNSTF4 1098907648
SUBF4
ARGF4
ADDRGP4 uis+12
INDIRF4
CNSTF4 1098907648
SUBF4
ARGF4
CNSTF4 1107296256
ARGF4
CNSTF4 1107296256
ARGF4
ADDRGP4 UI_DrawCursor
CALLV
pop
line 1190
;1188:
;1189:#ifndef NDEBUG
;1190:	if (uis.debug) {
ADDRGP4 uis+11388
INDIRI4
CNSTI4 0
EQI4 $506
line 1192
;1191:		// cursor coordinates
;1192:		UI_DrawString(0, 0, va("(%1.1f,%1.1f)", uis.cursorx, uis.cursory), UI_LEFT | UI_SMALLFONT, colorRed);
ADDRGP4 $509
ARGP4
ADDRGP4 uis+8
INDIRF4
ARGF4
ADDRGP4 uis+12
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRP4
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 colorRed
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 1193
;1193:	}
LABELV $506
line 1199
;1194:#endif
;1195:
;1196:	// delay playing the enter sound until after the
;1197:	// menu has been drawn, to avoid delay while
;1198:	// caching images
;1199:	if (m_entersound) {
ADDRGP4 m_entersound
INDIRI4
CNSTI4 0
EQI4 $512
line 1200
;1200:		trap_S_StartLocalSound(menu_in_sound, CHAN_LOCAL_SOUND);
ADDRGP4 menu_in_sound
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1201
;1201:		m_entersound = qfalse;
ADDRGP4 m_entersound
CNSTI4 0
ASGNI4
line 1202
;1202:	}
LABELV $512
line 1203
;1203:}
LABELV $471
endproc UI_Refresh 8 36
export UI_DrawTextBox
proc UI_DrawTextBox 0 20
line 1205
;1204:
;1205:void UI_DrawTextBox(int x, int y, int width, int lines) {
line 1206
;1206:	UI_FillRect(x + BIGCHAR_WIDTH / 2, y + BIGCHAR_HEIGHT / 2, (width + 1) * BIGCHAR_WIDTH, (lines + 1) * BIGCHAR_HEIGHT, colorBlack);
ADDRFP4 0
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 16
ADDI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 16
ADDI4
CVIF4 4
ARGF4
ADDRGP4 colorBlack
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 1207
;1207:	UI_DrawRect(x + BIGCHAR_WIDTH / 2, y + BIGCHAR_HEIGHT / 2, (width + 1) * BIGCHAR_WIDTH, (lines + 1) * BIGCHAR_HEIGHT, colorWhite);
ADDRFP4 0
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CNSTI4 8
ADDI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 16
ADDI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 16
ADDI4
CVIF4 4
ARGF4
ADDRGP4 colorWhite
ARGP4
ADDRGP4 UI_DrawRect
CALLV
pop
line 1208
;1208:}
LABELV $514
endproc UI_DrawTextBox 0 20
export UI_CursorInRect
proc UI_CursorInRect 8 0
line 1210
;1209:
;1210:qboolean UI_CursorInRect(int x, int y, int width, int height) {
line 1211
;1211:	if (uis.cursorx < x || uis.cursory < y || uis.cursorx > x + width || uis.cursory > y + height)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRGP4 uis+8
INDIRF4
ADDRLP4 0
INDIRI4
CVIF4 4
LTF4 $524
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRGP4 uis+12
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
LTF4 $524
ADDRGP4 uis+8
INDIRF4
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
CVIF4 4
GTF4 $524
ADDRGP4 uis+12
INDIRF4
ADDRLP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
CVIF4 4
LEF4 $516
LABELV $524
line 1212
;1212:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $515
JUMPV
LABELV $516
line 1214
;1213:
;1214:	return qtrue;
CNSTI4 1
RETI4
LABELV $515
endproc UI_CursorInRect 8 0
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
bss
export uis
align 4
LABELV uis
skip 11480
export m_entersound
align 4
LABELV m_entersound
skip 4
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
LABELV $509
byte 1 40
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 44
byte 1 37
byte 1 49
byte 1 46
byte 1 49
byte 1 102
byte 1 41
byte 1 0
align 1
LABELV $442
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 100
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $439
byte 1 105
byte 1 97
byte 1 109
byte 1 97
byte 1 109
byte 1 111
byte 1 110
byte 1 107
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $436
byte 1 105
byte 1 97
byte 1 109
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 97
byte 1 116
byte 1 101
byte 1 114
byte 1 0
align 1
LABELV $433
byte 1 117
byte 1 105
byte 1 95
byte 1 116
byte 1 101
byte 1 97
byte 1 109
byte 1 79
byte 1 114
byte 1 100
byte 1 101
byte 1 114
byte 1 115
byte 1 0
align 1
LABELV $430
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 105
byte 1 110
byte 1 101
byte 1 109
byte 1 97
byte 1 116
byte 1 105
byte 1 99
byte 1 115
byte 1 0
align 1
LABELV $427
byte 1 117
byte 1 105
byte 1 95
byte 1 99
byte 1 97
byte 1 99
byte 1 104
byte 1 101
byte 1 0
align 1
LABELV $424
byte 1 112
byte 1 111
byte 1 115
byte 1 116
byte 1 103
byte 1 97
byte 1 109
byte 1 101
byte 1 0
align 1
LABELV $421
byte 1 108
byte 1 101
byte 1 118
byte 1 101
byte 1 108
byte 1 115
byte 1 101
byte 1 108
byte 1 101
byte 1 99
byte 1 116
byte 1 0
align 1
LABELV $330
byte 1 85
byte 1 73
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 65
byte 1 99
byte 1 116
byte 1 105
byte 1 118
byte 1 101
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 101
byte 1 110
byte 1 117
byte 1 109
byte 1 32
byte 1 37
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $328
byte 1 49
byte 1 0
align 1
LABELV $326
byte 1 66
byte 1 97
byte 1 100
byte 1 32
byte 1 67
byte 1 68
byte 1 32
byte 1 75
byte 1 101
byte 1 121
byte 1 0
align 1
LABELV $324
byte 1 73
byte 1 110
byte 1 115
byte 1 101
byte 1 114
byte 1 116
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 67
byte 1 68
byte 1 0
align 1
LABELV $313
byte 1 113
byte 1 117
byte 1 105
byte 1 116
byte 1 10
byte 1 0
align 1
LABELV $124
byte 1 48
byte 1 0
align 1
LABELV $123
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
LABELV $111
byte 1 85
byte 1 73
byte 1 95
byte 1 80
byte 1 111
byte 1 112
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 117
byte 1 110
byte 1 100
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $95
byte 1 85
byte 1 73
byte 1 95
byte 1 80
byte 1 117
byte 1 115
byte 1 104
byte 1 77
byte 1 101
byte 1 110
byte 1 117
byte 1 58
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 115
byte 1 116
byte 1 97
byte 1 99
byte 1 107
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 0
align 1
LABELV $78
byte 1 100
byte 1 49
byte 1 10
byte 1 0
