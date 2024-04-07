export MField_Draw
code
proc MField_Draw 1056 20
file "../../../../code/q3_ui/ui_mfield.c"
line 13
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:#include "ui_local.h"
;4:
;5:/*
;6:===================
;7:MField_Draw
;8:
;9:Handles horizontal scrolling and cursor blinking
;10:x, y, are in pixels
;11:===================
;12:*/
;13:void MField_Draw(mfield_t* edit, int x, int y, int style, vec4_t color) {
line 21
;14:	int  len;
;15:	int  charw;
;16:	int  drawLen;
;17:	int  prestep;
;18:	int  cursorChar;
;19:	char str[MAX_STRING_CHARS];
;20:
;21:	drawLen = edit->widthInChars;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ASGNI4
line 22
;22:	len     = strlen(edit->buffer) + 1;
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 1044
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1044
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 25
;23:
;24:	// guarantee that cursor will be visible
;25:	if (len <= drawLen) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
GTI4 $69
line 26
;26:		prestep = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 27
;27:	} else {
ADDRGP4 $70
JUMPV
LABELV $69
line 28
;28:		if (edit->scroll + drawLen > len) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRLP4 4
INDIRI4
LEI4 $71
line 29
;29:			edit->scroll = len - drawLen;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ASGNI4
line 30
;30:			if (edit->scroll < 0) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $73
line 31
;31:				edit->scroll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 32
;32:			}
LABELV $73
line 33
;33:		}
LABELV $71
line 34
;34:		prestep = edit->scroll;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 35
;35:	}
LABELV $70
line 37
;36:
;37:	if (prestep + drawLen > len) {
ADDRLP4 8
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRLP4 4
INDIRI4
LEI4 $75
line 38
;38:		drawLen = len - prestep;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 39
;39:	}
LABELV $75
line 42
;40:
;41:	// extract <drawLen> characters from the field at <prestep>
;42:	if (drawLen >= MAX_STRING_CHARS) {
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $77
line 43
;43:		trap_Error("drawLen >= MAX_STRING_CHARS");
ADDRGP4 $79
ARGP4
ADDRGP4 trap_Error
CALLV
pop
line 44
;44:	}
LABELV $77
line 45
;45:	memcpy(str, edit->buffer + prestep, drawLen);
ADDRLP4 12
ARGP4
ADDRLP4 8
INDIRI4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 memcpy
CALLP4
pop
line 46
;46:	str[drawLen] = 0;
ADDRLP4 0
INDIRI4
ADDRLP4 12
ADDP4
CNSTI1 0
ASGNI1
line 48
;47:
;48:	UI_DrawString(x, y, str, style, color);
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 12
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
line 51
;49:
;50:	// draw the cursor
;51:	if (!(style & UI_PULSE)) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
NEI4 $80
line 52
;52:		return;
ADDRGP4 $68
JUMPV
LABELV $80
line 55
;53:	}
;54:
;55:	if (trap_Key_GetOverstrikeMode()) {
ADDRLP4 1048
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 1048
INDIRI4
CNSTI4 0
EQI4 $82
line 56
;56:		cursorChar = 11;
ADDRLP4 1040
CNSTI4 11
ASGNI4
line 57
;57:	} else {
ADDRGP4 $83
JUMPV
LABELV $82
line 58
;58:		cursorChar = 10;
ADDRLP4 1040
CNSTI4 10
ASGNI4
line 59
;59:	}
LABELV $83
line 61
;60:
;61:	style &= ~UI_PULSE;
ADDRFP4 12
ADDRFP4 12
INDIRI4
CNSTI4 -16385
BANDI4
ASGNI4
line 62
;62:	style |= UI_BLINK;
ADDRFP4 12
ADDRFP4 12
INDIRI4
CNSTI4 4096
BORI4
ASGNI4
line 64
;63:
;64:	if (style & UI_SMALLFONT) {
ADDRFP4 12
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $84
line 65
;65:		charw = SMALLCHAR_WIDTH;
ADDRLP4 1036
CNSTI4 8
ASGNI4
line 66
;66:	} else if (style & UI_GIANTFONT) {
ADDRGP4 $85
JUMPV
LABELV $84
ADDRFP4 12
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $86
line 67
;67:		charw = GIANTCHAR_WIDTH;
ADDRLP4 1036
CNSTI4 32
ASGNI4
line 68
;68:	} else {
ADDRGP4 $87
JUMPV
LABELV $86
line 69
;69:		charw = BIGCHAR_WIDTH;
ADDRLP4 1036
CNSTI4 16
ASGNI4
line 70
;70:	}
LABELV $87
LABELV $85
line 72
;71:
;72:	if (style & UI_CENTER) {
ADDRFP4 12
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $88
line 73
;73:		len = strlen(str);
ADDRLP4 12
ARGP4
ADDRLP4 1052
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1052
INDIRI4
ASGNI4
line 74
;74:		x   = x - len * charw / 2;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
MULI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 75
;75:	} else if (style & UI_RIGHT) {
ADDRGP4 $89
JUMPV
LABELV $88
ADDRFP4 12
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
EQI4 $90
line 76
;76:		len = strlen(str);
ADDRLP4 12
ARGP4
ADDRLP4 1052
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 1052
INDIRI4
ASGNI4
line 77
;77:		x   = x - len * charw;
ADDRFP4 4
ADDRFP4 4
INDIRI4
ADDRLP4 4
INDIRI4
ADDRLP4 1036
INDIRI4
MULI4
SUBI4
ASGNI4
line 78
;78:	}
LABELV $90
LABELV $89
line 80
;79:
;80:	UI_DrawChar(x + (edit->cursor - prestep) * charw, y, cursorChar, style & ~(UI_CENTER | UI_RIGHT), color);
ADDRFP4 4
INDIRI4
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ADDRLP4 1036
INDIRI4
MULI4
ADDI4
ARGI4
ADDRFP4 8
INDIRI4
ARGI4
ADDRLP4 1040
INDIRI4
ARGI4
ADDRFP4 12
INDIRI4
CNSTI4 -4
BANDI4
ARGI4
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 81
;81:}
LABELV $68
endproc MField_Draw 1056 20
export MField_Paste
proc MField_Paste 76 8
line 88
;82:
;83:/*
;84:================
;85:MField_Paste
;86:================
;87:*/
;88:void MField_Paste(mfield_t* edit) {
line 92
;89:	char pasteBuffer[64];
;90:	int  pasteLen, i;
;91:
;92:	trap_GetClipboardData(pasteBuffer, 64);
ADDRLP4 4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 trap_GetClipboardData
CALLV
pop
line 95
;93:
;94:	// send as if typed, so insert / overstrike works properly
;95:	pasteLen = strlen(pasteBuffer);
ADDRLP4 4
ARGP4
ADDRLP4 72
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 68
ADDRLP4 72
INDIRI4
ASGNI4
line 96
;96:	for (i = 0; i < pasteLen; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $96
JUMPV
LABELV $93
line 97
;97:		MField_CharEvent(edit, pasteBuffer[i]);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 4
ADDP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 MField_CharEvent
CALLV
pop
line 98
;98:	}
LABELV $94
line 96
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $96
ADDRLP4 0
INDIRI4
ADDRLP4 68
INDIRI4
LTI4 $93
line 99
;99:}
LABELV $92
endproc MField_Paste 76 8
export MField_KeyDownEvent
proc MField_KeyDownEvent 64 12
line 111
;100:
;101:/*
;102:=================
;103:MField_KeyDownEvent
;104:
;105:Performs the basic line editing functions for the console,
;106:in-game talk, and menu fields
;107:
;108:Key events are used for non-printable characters, others are gotten from char events.
;109:=================
;110:*/
;111:void MField_KeyDownEvent(mfield_t* edit, int key) {
line 115
;112:	int len;
;113:
;114:	// shift-insert is paste
;115:	if (((key == K_INS) || (key == K_KP_INS)) && trap_Key_IsDown(K_SHIFT)) {
ADDRLP4 4
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 139
EQI4 $100
ADDRLP4 4
INDIRI4
CNSTI4 170
NEI4 $98
LABELV $100
CNSTI4 138
ARGI4
ADDRLP4 8
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $98
line 116
;116:		MField_Paste(edit);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MField_Paste
CALLV
pop
line 117
;117:		return;
ADDRGP4 $97
JUMPV
LABELV $98
line 120
;118:	}
;119:
;120:	len = strlen(edit->buffer);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
line 122
;121:
;122:	if (key == K_DEL || key == K_KP_DEL) {
ADDRLP4 16
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 140
EQI4 $103
ADDRLP4 16
INDIRI4
CNSTI4 171
NEI4 $101
LABELV $103
line 123
;123:		if (edit->cursor < len) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $97
line 124
;124:			memmove(edit->buffer + edit->cursor, edit->buffer + edit->cursor + 1, len - edit->cursor);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
ARGP4
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 125
;125:		}
line 126
;126:		return;
ADDRGP4 $97
JUMPV
LABELV $101
line 129
;127:	}
;128:
;129:	if (key == K_RIGHTARROW || key == K_KP_RIGHTARROW) {
ADDRLP4 20
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 135
EQI4 $108
ADDRLP4 20
INDIRI4
CNSTI4 165
NEI4 $106
LABELV $108
line 130
;130:		if (edit->cursor < len) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $109
line 131
;131:			edit->cursor++;
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 132
;132:		}
LABELV $109
line 133
;133:		if (edit->cursor >= edit->scroll + edit->widthInChars && edit->cursor <= len) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
ADDRLP4 24
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDI4
LTI4 $97
ADDRLP4 28
INDIRI4
ADDRLP4 0
INDIRI4
GTI4 $97
line 134
;134:			edit->scroll++;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 4
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
line 135
;135:		}
line 136
;136:		return;
ADDRGP4 $97
JUMPV
LABELV $106
line 139
;137:	}
;138:
;139:	if (key == K_LEFTARROW || key == K_KP_LEFTARROW) {
ADDRLP4 24
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 134
EQI4 $115
ADDRLP4 24
INDIRI4
CNSTI4 163
NEI4 $113
LABELV $115
line 140
;140:		if (edit->cursor > 0) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
LEI4 $116
line 141
;141:			edit->cursor--;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 142
;142:		}
LABELV $116
line 143
;143:		if (edit->cursor < edit->scroll) {
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $97
line 144
;144:			edit->scroll--;
ADDRLP4 32
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 32
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 145
;145:		}
line 146
;146:		return;
ADDRGP4 $97
JUMPV
LABELV $113
line 149
;147:	}
;148:
;149:	if (key == K_HOME || key == K_KP_HOME || (tolower(key) == 'a' && trap_Key_IsDown(K_CTRL))) {
ADDRLP4 28
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 143
EQI4 $123
ADDRLP4 28
INDIRI4
CNSTI4 160
EQI4 $123
ADDRLP4 28
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 97
NEI4 $120
CNSTI4 137
ARGI4
ADDRLP4 36
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 0
EQI4 $120
LABELV $123
line 150
;150:		edit->cursor = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 151
;151:		edit->scroll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 152
;152:		return;
ADDRGP4 $97
JUMPV
LABELV $120
line 155
;153:	}
;154:
;155:	if (key == K_END || key == K_KP_END || (tolower(key) == 'e' && trap_Key_IsDown(K_CTRL))) {
ADDRLP4 40
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 144
EQI4 $127
ADDRLP4 40
INDIRI4
CNSTI4 166
EQI4 $127
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 44
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 44
INDIRI4
CNSTI4 101
NEI4 $124
CNSTI4 137
ARGI4
ADDRLP4 48
ADDRGP4 trap_Key_IsDown
CALLI4
ASGNI4
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $124
LABELV $127
line 156
;156:		edit->cursor = len;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 157
;157:		edit->scroll = len - edit->widthInChars + 1;
ADDRLP4 52
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 52
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 0
INDIRI4
ADDRLP4 52
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 158
;158:		if (edit->scroll < 0)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $97
line 159
;159:			edit->scroll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 160
;160:		return;
ADDRGP4 $97
JUMPV
LABELV $124
line 163
;161:	}
;162:
;163:	if (key == K_INS || key == K_KP_INS) {
ADDRLP4 52
ADDRFP4 4
INDIRI4
ASGNI4
ADDRLP4 52
INDIRI4
CNSTI4 139
EQI4 $132
ADDRLP4 52
INDIRI4
CNSTI4 170
NEI4 $130
LABELV $132
line 164
;164:		trap_Key_SetOverstrikeMode(!trap_Key_GetOverstrikeMode());
ADDRLP4 60
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 60
INDIRI4
CNSTI4 0
NEI4 $134
ADDRLP4 56
CNSTI4 1
ASGNI4
ADDRGP4 $135
JUMPV
LABELV $134
ADDRLP4 56
CNSTI4 0
ASGNI4
LABELV $135
ADDRLP4 56
INDIRI4
ARGI4
ADDRGP4 trap_Key_SetOverstrikeMode
CALLV
pop
line 165
;165:		return;
LABELV $130
line 167
;166:	}
;167:}
LABELV $97
endproc MField_KeyDownEvent 64 12
export MField_CharEvent
proc MField_CharEvent 32 12
line 174
;168:
;169:/*
;170:==================
;171:MField_CharEvent
;172:==================
;173:*/
;174:void MField_CharEvent(mfield_t* edit, int ch) {
line 177
;175:	int len;
;176:
;177:	if (ch == 'v' - 'a' + 1) {  // ctrl-v is paste
ADDRFP4 4
INDIRI4
CNSTI4 22
NEI4 $137
line 178
;178:		MField_Paste(edit);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MField_Paste
CALLV
pop
line 179
;179:		return;
ADDRGP4 $136
JUMPV
LABELV $137
line 182
;180:	}
;181:
;182:	if (ch == 'c' - 'a' + 1) {  // ctrl-c clears the field
ADDRFP4 4
INDIRI4
CNSTI4 3
NEI4 $139
line 183
;183:		MField_Clear(edit);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 MField_Clear
CALLV
pop
line 184
;184:		return;
ADDRGP4 $136
JUMPV
LABELV $139
line 187
;185:	}
;186:
;187:	len = strlen(edit->buffer);
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 189
;188:
;189:	if (ch == 'h' - 'a' + 1) {  // ctrl-h is backspace
ADDRFP4 4
INDIRI4
CNSTI4 8
NEI4 $141
line 190
;190:		if (edit->cursor > 0) {
ADDRFP4 0
INDIRP4
INDIRI4
CNSTI4 0
LEI4 $136
line 191
;191:			memmove(edit->buffer + edit->cursor - 1, edit->buffer + edit->cursor, len + 1 - edit->cursor);
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
ADDRLP4 8
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ADDP4
CNSTI4 -1
ADDP4
ARGP4
ADDRLP4 12
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 12
ADDP4
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 12
INDIRI4
SUBI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 192
;192:			edit->cursor--;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
ADDRLP4 16
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 193
;193:			if (edit->cursor < edit->scroll) {
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
GEI4 $136
line 194
;194:				edit->scroll--;
ADDRLP4 24
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 24
INDIRP4
ADDRLP4 24
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 195
;195:			}
line 196
;196:		}
line 197
;197:		return;
ADDRGP4 $136
JUMPV
LABELV $141
line 200
;198:	}
;199:
;200:	if (ch == 'a' - 'a' + 1) {  // ctrl-a is home
ADDRFP4 4
INDIRI4
CNSTI4 1
NEI4 $147
line 201
;201:		edit->cursor = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 202
;202:		edit->scroll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 203
;203:		return;
ADDRGP4 $136
JUMPV
LABELV $147
line 206
;204:	}
;205:
;206:	if (ch == 'e' - 'a' + 1) {  // ctrl-e is end
ADDRFP4 4
INDIRI4
CNSTI4 5
NEI4 $149
line 207
;207:		edit->cursor = len;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRI4
ASGNI4
line 208
;208:		edit->scroll = edit->cursor - edit->widthInChars + 1;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 8
INDIRP4
INDIRI4
ADDRLP4 8
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 209
;209:		if (edit->scroll < 0)
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
CNSTI4 0
GEI4 $136
line 210
;210:			edit->scroll = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 211
;211:		return;
ADDRGP4 $136
JUMPV
LABELV $149
line 217
;212:	}
;213:
;214:	//
;215:	// ignore any other non printable chars
;216:	//
;217:	if (ch < ' ') {
ADDRFP4 4
INDIRI4
CNSTI4 32
GEI4 $153
line 218
;218:		return;
ADDRGP4 $136
JUMPV
LABELV $153
line 221
;219:	}
;220:
;221:	if (trap_Key_GetOverstrikeMode()) {
ADDRLP4 8
ADDRGP4 trap_Key_GetOverstrikeMode
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $155
line 222
;222:		if ((edit->cursor == MAX_EDIT_LINE - 1) || (edit->maxchars && edit->cursor >= edit->maxchars))
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
ADDRLP4 12
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 255
EQI4 $159
ADDRLP4 12
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 0
EQI4 $156
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
LTI4 $156
LABELV $159
line 223
;223:			return;
ADDRGP4 $136
JUMPV
line 224
;224:	} else {
LABELV $155
line 226
;225:		// insert mode
;226:		if ((len == MAX_EDIT_LINE - 1) || (edit->maxchars && len >= edit->maxchars))
ADDRLP4 0
INDIRI4
CNSTI4 255
EQI4 $162
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 0
EQI4 $160
ADDRLP4 0
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
LTI4 $160
LABELV $162
line 227
;227:			return;
ADDRGP4 $136
JUMPV
LABELV $160
line 228
;228:		memmove(edit->buffer + edit->cursor + 1, edit->buffer + edit->cursor, len + 1 - edit->cursor);
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
ADDRLP4 20
INDIRP4
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
CNSTI4 1
ADDP4
ARGP4
ADDRLP4 24
INDIRI4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 24
INDIRI4
SUBI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 229
;229:	}
LABELV $156
line 231
;230:
;231:	edit->buffer[edit->cursor] = ch;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
ADDP4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 232
;232:	if (!edit->maxchars || edit->cursor < edit->maxchars - 1)
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 0
EQI4 $165
ADDRLP4 16
INDIRP4
INDIRI4
ADDRLP4 16
INDIRP4
CNSTI4 268
ADDP4
INDIRI4
CNSTI4 1
SUBI4
GEI4 $163
LABELV $165
line 233
;233:		edit->cursor++;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $163
line 235
;234:
;235:	if (edit->cursor >= edit->widthInChars) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
INDIRI4
ADDRLP4 24
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
LTI4 $166
line 236
;236:		edit->scroll++;
ADDRLP4 28
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 237
;237:	}
LABELV $166
line 239
;238:
;239:	if (edit->cursor == len + 1) {
ADDRFP4 0
INDIRP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
NEI4 $168
line 240
;240:		edit->buffer[edit->cursor] = '\0';
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
INDIRI4
ADDRLP4 28
INDIRP4
CNSTI4 12
ADDP4
ADDP4
CNSTI1 0
ASGNI1
line 241
;241:	}
LABELV $168
line 242
;242:}
LABELV $136
endproc MField_CharEvent 32 12
export MField_Clear
proc MField_Clear 0 0
line 249
;243:
;244:/*
;245:==================
;246:MField_Clear
;247:==================
;248:*/
;249:void MField_Clear(mfield_t* edit) {
line 250
;250:	edit->buffer[0] = '\0';
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
CNSTI1 0
ASGNI1
line 251
;251:	edit->cursor    = 0;
ADDRFP4 0
INDIRP4
CNSTI4 0
ASGNI4
line 252
;252:	edit->scroll    = 0;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
CNSTI4 0
ASGNI4
line 253
;253:}
LABELV $170
endproc MField_Clear 0 0
export MenuField_Init
proc MenuField_Init 32 4
line 260
;254:
;255:/*
;256:==================
;257:MenuField_Init
;258:==================
;259:*/
;260:void MenuField_Init(menufield_s* m) {
line 265
;261:	int l;
;262:	int w;
;263:	int h;
;264:
;265:	MField_Clear(&m->field);
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRGP4 MField_Clear
CALLV
pop
line 267
;266:
;267:	if (m->generic.flags & QMF_SMALLFONT) {
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 2
BANDU4
CNSTU4 0
EQU4 $172
line 268
;268:		w = SMALLCHAR_WIDTH;
ADDRLP4 0
CNSTI4 8
ASGNI4
line 269
;269:		h = SMALLCHAR_HEIGHT;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 270
;270:	} else {
ADDRGP4 $173
JUMPV
LABELV $172
line 271
;271:		w = BIGCHAR_WIDTH;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 272
;272:		h = BIGCHAR_HEIGHT;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 273
;273:	}
LABELV $173
line 275
;274:
;275:	if (m->generic.name) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $174
line 276
;276:		l = (strlen(m->generic.name) + 1) * w;
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 1
ADDI4
ADDRLP4 0
INDIRI4
MULI4
ASGNI4
line 277
;277:	} else {
ADDRGP4 $175
JUMPV
LABELV $174
line 278
;278:		l = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 279
;279:	}
LABELV $175
line 281
;280:
;281:	m->generic.left   = m->generic.x - l;
ADDRLP4 12
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ASGNI4
line 282
;282:	m->generic.top    = m->generic.y;
ADDRLP4 16
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 16
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 283
;283:	m->generic.right  = m->generic.x + w + m->field.widthInChars * w;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 20
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 20
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ADDRLP4 20
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
MULI4
ADDI4
ASGNI4
line 284
;284:	m->generic.bottom = m->generic.y + h;
ADDRLP4 28
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 28
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 28
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ADDRLP4 8
INDIRI4
ADDI4
ASGNI4
line 285
;285:}
LABELV $171
endproc MenuField_Init 32 4
export MenuField_Draw
proc MenuField_Draw 36 20
line 292
;286:
;287:/*
;288:==================
;289:MenuField_Draw
;290:==================
;291:*/
;292:void MenuField_Draw(menufield_s* f) {
line 301
;293:	int x;
;294:	int y;
;295:	int w;
;296:	// int		h;
;297:	int      style;
;298:	qboolean focus;
;299:	float*   color;
;300:
;301:	x = f->generic.x;
ADDRLP4 4
ADDRFP4 0
INDIRP4
CNSTI4 12
ADDP4
INDIRI4
ASGNI4
line 302
;302:	y = f->generic.y;
ADDRLP4 8
ADDRFP4 0
INDIRP4
CNSTI4 16
ADDP4
INDIRI4
ASGNI4
line 304
;303:
;304:	if (f->generic.flags & QMF_SMALLFONT) {
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 2
BANDU4
CNSTU4 0
EQU4 $177
line 305
;305:		w = SMALLCHAR_WIDTH;
ADDRLP4 16
CNSTI4 8
ASGNI4
line 307
;306:		// h = SMALLCHAR_HEIGHT;
;307:		style = UI_SMALLFONT;
ADDRLP4 0
CNSTI4 16
ASGNI4
line 308
;308:	} else {
ADDRGP4 $178
JUMPV
LABELV $177
line 309
;309:		w = BIGCHAR_WIDTH;
ADDRLP4 16
CNSTI4 16
ASGNI4
line 311
;310:		// h = BIGCHAR_HEIGHT;
;311:		style = UI_BIGFONT;
ADDRLP4 0
CNSTI4 32
ASGNI4
line 312
;312:	}
LABELV $178
line 314
;313:
;314:	if (Menu_ItemAtCursor(f->generic.parent) == f) {
ADDRLP4 24
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CNSTI4 36
ADDP4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 Menu_ItemAtCursor
CALLP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
ADDRLP4 28
INDIRP4
CVPU4 4
NEU4 $179
line 315
;315:		focus = qtrue;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 316
;316:		style |= UI_PULSE;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 16384
BORI4
ASGNI4
line 317
;317:	} else {
ADDRGP4 $180
JUMPV
LABELV $179
line 318
;318:		focus = qfalse;
ADDRLP4 20
CNSTI4 0
ASGNI4
line 319
;319:	}
LABELV $180
line 321
;320:
;321:	if (f->generic.flags & QMF_GRAYED)
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 8192
BANDU4
CNSTU4 0
EQU4 $181
line 322
;322:		color = text_color_disabled;
ADDRLP4 12
ADDRGP4 text_color_disabled
ASGNP4
ADDRGP4 $182
JUMPV
LABELV $181
line 323
;323:	else if (focus)
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $183
line 324
;324:		color = text_color_highlight;
ADDRLP4 12
ADDRGP4 text_color_highlight
ASGNP4
ADDRGP4 $184
JUMPV
LABELV $183
line 326
;325:	else
;326:		color = text_color_normal;
ADDRLP4 12
ADDRGP4 text_color_normal
ASGNP4
LABELV $184
LABELV $182
line 328
;327:
;328:	if (focus) {
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $185
line 330
;329:		// draw cursor
;330:		UI_FillRect(f->generic.left, f->generic.top, f->generic.right - f->generic.left + 1, f->generic.bottom - f->generic.top + 1, listbar_color);
ADDRLP4 32
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 28
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 20
ADDP4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
CVIF4 4
ARGF4
ADDRLP4 32
INDIRP4
CNSTI4 32
ADDP4
INDIRI4
ADDRLP4 32
INDIRP4
CNSTI4 24
ADDP4
INDIRI4
SUBI4
CNSTI4 1
ADDI4
CVIF4 4
ARGF4
ADDRGP4 listbar_color
ARGP4
ADDRGP4 UI_FillRect
CALLV
pop
line 331
;331:		UI_DrawChar(x, y, 13, UI_CENTER | UI_BLINK | style, color);
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
CNSTI4 13
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 4097
BORI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawChar
CALLV
pop
line 332
;332:	}
LABELV $185
line 334
;333:
;334:	if (f->generic.name) {
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $187
line 335
;335:		UI_DrawString(x - w, y, f->generic.name, style | UI_RIGHT, color);
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
BORI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 UI_DrawString
CALLV
pop
line 336
;336:	}
LABELV $187
line 338
;337:
;338:	MField_Draw(&f->field, x + w, y, style, color);
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 4
INDIRI4
ADDRLP4 16
INDIRI4
ADDI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 MField_Draw
CALLV
pop
line 339
;339:}
LABELV $176
endproc MenuField_Draw 36 20
export MenuField_Key
proc MenuField_Key 32 8
line 346
;340:
;341:/*
;342:==================
;343:MenuField_Key
;344:==================
;345:*/
;346:sfxHandle_t MenuField_Key(menufield_s* m, int* key) {
line 349
;347:	int keycode;
;348:
;349:	keycode = *key;
ADDRLP4 0
ADDRFP4 4
INDIRP4
INDIRI4
ASGNI4
line 351
;350:
;351:	if (m->field.skipKey) {
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
INDIRI4
CNSTI4 0
EQI4 $190
line 352
;352:		m->field.skipKey = qfalse;
ADDRFP4 0
INDIRP4
CNSTI4 336
ADDP4
CNSTI4 0
ASGNI4
line 353
;353:		return (0);
CNSTI4 0
RETI4
ADDRGP4 $189
JUMPV
LABELV $190
line 356
;354:	}
;355:
;356:	switch (keycode) {
ADDRLP4 0
INDIRI4
CNSTI4 132
EQI4 $193
ADDRLP4 0
INDIRI4
CNSTI4 133
EQI4 $193
ADDRLP4 0
INDIRI4
CNSTI4 133
GTI4 $205
LABELV $204
ADDRLP4 0
INDIRI4
CNSTI4 9
EQI4 $193
ADDRLP4 0
INDIRI4
CNSTI4 9
LTI4 $192
LABELV $206
ADDRLP4 0
INDIRI4
CNSTI4 13
EQI4 $194
ADDRGP4 $192
JUMPV
LABELV $205
ADDRLP4 0
INDIRI4
CNSTI4 167
EQI4 $193
ADDRLP4 0
INDIRI4
CNSTI4 169
EQI4 $194
ADDRLP4 0
INDIRI4
CNSTI4 169
GTI4 $208
LABELV $207
ADDRLP4 0
INDIRI4
CNSTI4 161
EQI4 $193
ADDRGP4 $192
JUMPV
LABELV $208
ADDRLP4 0
INDIRI4
CNSTI4 185
LTI4 $192
ADDRLP4 0
INDIRI4
CNSTI4 188
GTI4 $192
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $209-740
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $209
address $194
address $194
address $194
address $194
code
LABELV $194
line 364
;357:	case K_KP_ENTER:
;358:	case K_ENTER:
;359:	case K_JOY1:
;360:	case K_JOY2:
;361:	case K_JOY3:
;362:	case K_JOY4:
;363:		// have enter go to next cursor point
;364:		*key = K_TAB;
ADDRFP4 4
INDIRP4
CNSTI4 9
ASGNI4
line 365
;365:		break;
ADDRGP4 $193
JUMPV
line 372
;366:
;367:	case K_TAB:
;368:	case K_KP_DOWNARROW:
;369:	case K_DOWNARROW:
;370:	case K_KP_UPARROW:
;371:	case K_UPARROW:
;372:		break;
LABELV $192
line 375
;373:
;374:	default:
;375:		if (keycode & K_CHAR_FLAG) {
ADDRLP4 0
INDIRI4
CNSTI4 1024
BANDI4
CNSTI4 0
EQI4 $196
line 376
;376:			keycode &= ~K_CHAR_FLAG;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 -1025
BANDI4
ASGNI4
line 378
;377:
;378:			if ((m->generic.flags & QMF_UPPERCASE) && Q_islower(keycode))
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 524288
BANDU4
CNSTU4 0
EQU4 $198
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 20
ADDRGP4 Q_islower
CALLI4
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $198
line 379
;379:				keycode -= 'a' - 'A';
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
ADDRGP4 $199
JUMPV
LABELV $198
line 380
;380:			else if ((m->generic.flags & QMF_LOWERCASE) && Q_isupper(keycode))
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 262144
BANDU4
CNSTU4 0
EQU4 $200
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 Q_isupper
CALLI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $200
line 381
;381:				keycode -= 'A' - 'a';
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 -32
SUBI4
ASGNI4
ADDRGP4 $201
JUMPV
LABELV $200
line 382
;382:			else if ((m->generic.flags & QMF_NUMBERSONLY) && Q_isalpha(keycode))
ADDRFP4 0
INDIRP4
CNSTI4 44
ADDP4
INDIRU4
CNSTU4 32
BANDU4
CNSTU4 0
EQU4 $202
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 Q_isalpha
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $202
line 383
;383:				return (menu_buzz_sound);
ADDRGP4 menu_buzz_sound
INDIRI4
RETI4
ADDRGP4 $189
JUMPV
LABELV $202
LABELV $201
LABELV $199
line 385
;384:
;385:			MField_CharEvent(&m->field, keycode);
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 MField_CharEvent
CALLV
pop
line 386
;386:		} else
ADDRGP4 $193
JUMPV
LABELV $196
line 387
;387:			MField_KeyDownEvent(&m->field, keycode);
ADDRFP4 0
INDIRP4
CNSTI4 64
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 MField_KeyDownEvent
CALLV
pop
line 388
;388:		break;
LABELV $193
line 391
;389:	}
;390:
;391:	return (0);
CNSTI4 0
RETI4
LABELV $189
endproc MenuField_Key 32 8
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
LABELV $79
byte 1 100
byte 1 114
byte 1 97
byte 1 119
byte 1 76
byte 1 101
byte 1 110
byte 1 32
byte 1 62
byte 1 61
byte 1 32
byte 1 77
byte 1 65
byte 1 88
byte 1 95
byte 1 83
byte 1 84
byte 1 82
byte 1 73
byte 1 78
byte 1 71
byte 1 95
byte 1 67
byte 1 72
byte 1 65
byte 1 82
byte 1 83
byte 1 0
