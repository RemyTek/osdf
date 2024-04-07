export CG_AdjustFrom640
code
proc CG_AdjustFrom640 16 0
file "../../../../code/cgame/cg_drawtools.c"
line 13
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_drawtools.c -- helper functions called by cg_draw, cg_scoreboard, cg_info, etc
;4:#include "cg_local.h"
;5:
;6:/*
;7:================
;8:CG_AdjustFrom640
;9:
;10:Adjusted for resolution and screen aspect ratio
;11:================
;12:*/
;13:void CG_AdjustFrom640(float* x, float* y, float* w, float* h) {
line 15
;14:	// scale for screen sizes
;15:	*x = *x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRGP4 cgs+31444
INDIRF4
ADDF4
ASGNF4
line 16
;16:	*y = *y * cgs.screenYScale + cgs.screenYBias;
ADDRLP4 4
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ADDRGP4 cgs+31448
INDIRF4
ADDF4
ASGNF4
line 17
;17:	*w *= cgs.screenXScale;
ADDRLP4 8
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 18
;18:	*h *= cgs.screenYScale;
ADDRLP4 12
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 19
;19:}
LABELV $72
endproc CG_AdjustFrom640 16 0
export CG_FillRect
proc CG_FillRect 0 36
line 28
;20:
;21:/*
;22:================
;23:CG_FillRect
;24:
;25:Coordinates are 640*480 virtual values
;26:=================
;27:*/
;28:void CG_FillRect(float x, float y, float width, float height, const float* color) {
line 29
;29:	trap_R_SetColor(color);
ADDRFP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 31
;30:
;31:	CG_AdjustFrom640(&x, &y, &width, &height);
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 32
;32:	trap_R_DrawStretchPic(x, y, width, height, 0, 0, 0, 0, cgs.media.whiteShader);
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
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 34
;33:
;34:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 35
;35:}
LABELV $79
endproc CG_FillRect 0 36
export CG_FillScreen
proc CG_FillScreen 0 36
line 42
;36:
;37:/*
;38:================
;39:CG_FillScreen
;40:================
;41:*/
;42:void CG_FillScreen(const float* color) {
line 43
;43:	trap_R_SetColor(color);
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 44
;44:	trap_R_DrawStretchPic(0, 0, cgs.glconfig.vidWidth, cgs.glconfig.vidHeight, 0, 0, 0, 0, cgs.media.whiteShader);
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+20100+11308
INDIRI4
CVIF4 4
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
CNSTF4 0
ARGF4
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 45
;45:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 46
;46:}
LABELV $82
endproc CG_FillScreen 0 36
export CG_DrawSides
proc CG_DrawSides 4 36
line 55
;47:
;48:/*
;49:================
;50:CG_DrawSides
;51:
;52:Coords are virtual 640x480
;53:================
;54:*/
;55:void CG_DrawSides(float x, float y, float w, float h, float size) {
line 56
;56:	CG_AdjustFrom640(&x, &y, &w, &h);
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 57
;57:	size *= cgs.screenXScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 58
;58:	trap_R_DrawStretchPic(x, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 16
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
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 59
;59:	trap_R_DrawStretchPic(x + w - size, y, size, h, 0, 0, 0, 0, cgs.media.whiteShader);
ADDRLP4 0
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 0
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 0
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
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 60
;60:}
LABELV $89
endproc CG_DrawSides 4 36
export CG_DrawTopBottom
proc CG_DrawTopBottom 4 36
line 62
;61:
;62:void CG_DrawTopBottom(float x, float y, float w, float h, float size) {
line 63
;63:	CG_AdjustFrom640(&x, &y, &w, &h);
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 64
;64:	size *= cgs.screenYScale;
ADDRFP4 16
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 65
;65:	trap_R_DrawStretchPic(x, y, w, size, 0, 0, 0, 0, cgs.media.whiteShader);
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRFP4 16
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
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 66
;66:	trap_R_DrawStretchPic(x, y + h - size, w, size, 0, 0, 0, 0, cgs.media.whiteShader);
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 0
ADDRFP4 16
INDIRF4
ASGNF4
ADDRFP4 4
INDIRF4
ADDRFP4 12
INDIRF4
ADDF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 0
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
ADDRGP4 cgs+148692+16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 67
;67:}
LABELV $95
endproc CG_DrawTopBottom 4 36
export CG_DrawRect
proc CG_DrawRect 0 20
line 76
;68:
;69:/*
;70:================
;71:UI_DrawRect
;72:
;73:Coordinates are 640*480 virtual values
;74:=================
;75:*/
;76:void CG_DrawRect(float x, float y, float width, float height, float size, const float* color) {
line 77
;77:	trap_R_SetColor(color);
ADDRFP4 20
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 79
;78:
;79:	CG_DrawTopBottom(x, y, width, height, size);
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
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawTopBottom
CALLV
pop
line 80
;80:	CG_DrawSides(x, y, width, height, size);
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
ADDRFP4 16
INDIRF4
ARGF4
ADDRGP4 CG_DrawSides
CALLV
pop
line 82
;81:
;82:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 83
;83:}
LABELV $101
endproc CG_DrawRect 0 20
export CG_DrawPic
proc CG_DrawPic 0 36
line 92
;84:
;85:/*
;86:================
;87:CG_DrawPic
;88:
;89:Coordinates are 640*480 virtual values
;90:=================
;91:*/
;92:void CG_DrawPic(float x, float y, float width, float height, qhandle_t hShader) {
line 93
;93:	CG_AdjustFrom640(&x, &y, &width, &height);
ADDRFP4 0
ARGP4
ADDRFP4 4
ARGP4
ADDRFP4 8
ARGP4
ADDRFP4 12
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 94
;94:	trap_R_DrawStretchPic(x, y, width, height, 0, 0, 1, 1, hShader);
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
ADDRFP4 16
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 95
;95:}
LABELV $102
endproc CG_DrawPic 0 36
proc CG_DrawChar 48 36
line 104
;96:
;97:/*
;98:===============
;99:CG_DrawChar
;100:
;101:Coordinates and size in 640*480 virtual screen size
;102:===============
;103:*/
;104:static void CG_DrawChar(int x, int y, int width, int height, int ch) {
line 110
;105:	int   row, col;
;106:	float frow, fcol;
;107:	float size;
;108:	float ax, ay, aw, ah;
;109:
;110:	ch &= 255;
ADDRFP4 16
ADDRFP4 16
INDIRI4
CNSTI4 255
BANDI4
ASGNI4
line 112
;111:
;112:	if (ch == ' ') {
ADDRFP4 16
INDIRI4
CNSTI4 32
NEI4 $104
line 113
;113:		return;
ADDRGP4 $103
JUMPV
LABELV $104
line 116
;114:	}
;115:
;116:	ax = x;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ASGNF4
line 117
;117:	ay = y;
ADDRLP4 16
ADDRFP4 4
INDIRI4
CVIF4 4
ASGNF4
line 118
;118:	aw = width;
ADDRLP4 20
ADDRFP4 8
INDIRI4
CVIF4 4
ASGNF4
line 119
;119:	ah = height;
ADDRLP4 24
ADDRFP4 12
INDIRI4
CVIF4 4
ASGNF4
line 120
;120:	CG_AdjustFrom640(&ax, &ay, &aw, &ah);
ADDRLP4 12
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 24
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 122
;121:
;122:	row = ch >> 4;
ADDRLP4 28
ADDRFP4 16
INDIRI4
CNSTI4 4
RSHI4
ASGNI4
line 123
;123:	col = ch & 15;
ADDRLP4 32
ADDRFP4 16
INDIRI4
CNSTI4 15
BANDI4
ASGNI4
line 125
;124:
;125:	frow = row * 0.0625;
ADDRLP4 0
ADDRLP4 28
INDIRI4
CVIF4 4
CNSTF4 1031798784
MULF4
ASGNF4
line 126
;126:	fcol = col * 0.0625;
ADDRLP4 4
ADDRLP4 32
INDIRI4
CVIF4 4
CNSTF4 1031798784
MULF4
ASGNF4
line 127
;127:	size = 0.0625;
ADDRLP4 8
CNSTF4 1031798784
ASGNF4
line 129
;128:
;129:	trap_R_DrawStretchPic(ax, ay, aw, ah, fcol, frow, fcol + size, frow + size, cgs.media.charsetShader);
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
ADDF4
ARGF4
ADDRGP4 cgs+148692
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 130
;130:}
LABELV $103
endproc CG_DrawChar 48 36
export CG_DrawStringExt
proc CG_DrawStringExt 36 20
line 143
;131:
;132:/*
;133:==================
;134:CG_DrawStringExt
;135:
;136:Draws a multi-colored string with a drop shadow, optionally forcing
;137:to a fixed color.
;138:
;139:Coordinates are at 640 by 480 virtual resolution
;140:==================
;141:*/
;142:void CG_DrawStringExt(
;143:	int x, int y, const char* string, const float* setColor, qboolean forceColor, qboolean shadow, int charWidth, int charHeight, int maxChars) {
line 149
;144:	vec4_t      color;
;145:	const char* s;
;146:	int         xx;
;147:	int         cnt;
;148:
;149:	if (maxChars <= 0)
ADDRFP4 32
INDIRI4
CNSTI4 0
GTI4 $108
line 150
;150:		maxChars = 32767;  // do them all!
ADDRFP4 32
CNSTI4 32767
ASGNI4
LABELV $108
line 153
;151:
;152:	// draw the drop shadow
;153:	if (shadow) {
ADDRFP4 20
INDIRI4
CNSTI4 0
EQI4 $110
line 154
;154:		color[0] = color[1] = color[2] = 0;
ADDRLP4 28
CNSTF4 0
ASGNF4
ADDRLP4 12+8
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12+4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 12
ADDRLP4 28
INDIRF4
ASGNF4
line 155
;155:		color[3]                       = setColor[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 156
;156:		trap_R_SetColor(color);
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 157
;157:		s   = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 158
;158:		xx  = x;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 159
;159:		cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $116
JUMPV
LABELV $115
line 160
;160:		while (*s && cnt < maxChars) {
line 161
;161:			if (Q_IsColorString(s)) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $118
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $118
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $118
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $118
line 162
;162:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 163
;163:				continue;
ADDRGP4 $116
JUMPV
LABELV $118
line 165
;164:			}
;165:			CG_DrawChar(xx + 2, y + 2, charWidth, charHeight, *s);
ADDRLP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 4
INDIRI4
CNSTI4 2
ADDI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 166
;166:			cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 167
;167:			xx += charWidth;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 168
;168:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 169
;169:		}
LABELV $116
line 160
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $120
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $115
LABELV $120
line 170
;170:	}
LABELV $110
line 173
;171:
;172:	// draw the colored text
;173:	s   = string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 174
;174:	xx  = x;
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
line 175
;175:	cnt = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 176
;176:	trap_R_SetColor(setColor);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $122
JUMPV
LABELV $121
line 177
;177:	while (*s && cnt < maxChars) {
line 178
;178:		if (Q_IsColorString(s)) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $124
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $124
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $124
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $124
line 179
;179:			if (!forceColor) {
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $126
line 180
;180:				memcpy(color, g_color_table[ColorIndex(*(s + 1))], sizeof(color));
ADDRLP4 12
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
line 181
;181:				color[3] = setColor[3];
ADDRLP4 12+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 182
;182:				trap_R_SetColor(color);
ADDRLP4 12
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 183
;183:			}
LABELV $126
line 184
;184:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 185
;185:			continue;
ADDRGP4 $122
JUMPV
LABELV $124
line 187
;186:		}
;187:		CG_DrawChar(xx, y, charWidth, charHeight, *s);
ADDRLP4 4
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRFP4 24
INDIRI4
ARGI4
ADDRFP4 28
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRGP4 CG_DrawChar
CALLV
pop
line 188
;188:		xx += charWidth;
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRFP4 24
INDIRI4
ADDI4
ASGNI4
line 189
;189:		cnt++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 190
;190:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 191
;191:	}
LABELV $122
line 177
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $129
ADDRLP4 8
INDIRI4
ADDRFP4 32
INDIRI4
LTI4 $121
LABELV $129
line 192
;192:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 193
;193:}
LABELV $107
endproc CG_DrawStringExt 36 20
data
align 4
LABELV font
address bigchars
align 4
LABELV metrics
address bigchars
export CG_SelectFont
code
proc CG_SelectFont 0 0
line 221
;194:
;195:// new font renderer
;196:
;197:#ifdef USE_NEW_FONT_RENDERER
;198:
;199:#define MAX_FONT_SHADERS 4
;200:
;201:typedef struct {
;202:	float tc_prop[4];
;203:	float tc_mono[4];
;204:	float space1;
;205:	float space2;
;206:	float width;
;207:} font_metric_t;
;208:
;209:typedef struct {
;210:	font_metric_t metrics[256];
;211:	qhandle_t     shader[MAX_FONT_SHADERS];
;212:	int           shaderThreshold[MAX_FONT_SHADERS];
;213:	int           shaderCount;
;214:} font_t;
;215:
;216:static font_t               bigchars;
;217:static font_t               numbers;
;218:static const font_t*        font    = &bigchars;
;219:static const font_metric_t* metrics = &bigchars.metrics[0];
;220:
;221:void                        CG_SelectFont(int index) {
line 222
;222:						   if (index == 0)
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $133
line 223
;223:        font = &bigchars;
ADDRGP4 font
ADDRGP4 bigchars
ASGNP4
ADDRGP4 $134
JUMPV
LABELV $133
line 225
;224:    else
;225:        font = &numbers;
ADDRGP4 font
ADDRGP4 numbers
ASGNP4
LABELV $134
line 227
;226:
;227:    metrics = &font->metrics[0];
ADDRGP4 metrics
ADDRGP4 font
INDIRP4
ASGNP4
line 228
;228:}
LABELV $132
endproc CG_SelectFont 0 0
proc CG_FileExist 8 12
line 230
;229:
;230:static qboolean CG_FileExist(const char* file) {
line 233
;231:	fileHandle_t f;
;232:
;233:	if (!file || !file[0])
ADDRLP4 4
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $138
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $136
LABELV $138
line 234
;234:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $136
line 236
;235:
;236:	trap_FS_FOpenFile(file, &f, FS_READ);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
ADDRGP4 trap_FS_FOpenFile
CALLI4
pop
line 237
;237:	if (f == FS_INVALID_HANDLE)
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $139
line 238
;238:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $135
JUMPV
LABELV $139
line 239
;239:	else {
line 240
;240:		trap_FS_FCloseFile(f);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 241
;241:		return qtrue;
CNSTI4 1
RETI4
LABELV $135
endproc CG_FileExist 8 12
proc CG_LoadFont 8508 16
line 245
;242:	}
;243:}
;244:
;245:static void CG_LoadFont(font_t* fnt, const char* fontName) {
line 262
;246:	char           buf[8000];
;247:	fileHandle_t   f;
;248:	char *         token, *text;
;249:	float          width, height, r_width, r_height;
;250:	float          char_width;
;251:	float          char_height;
;252:	char           shaderName[MAX_FONT_SHADERS][MAX_QPATH], tmpName[MAX_QPATH];
;253:	int            shaderCount;
;254:	int            shaderThreshold[MAX_FONT_SHADERS];
;255:	font_metric_t* fm;
;256:	int            i, tmp, len, chars;
;257:	float          w1, w2;
;258:	float          s1, s2;
;259:	float          x0, y0;
;260:	qboolean       swapped;
;261:
;262:	memset(fnt, 0, sizeof(*fnt));
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 0
ARGI4
CNSTI4 11300
ARGI4
ADDRGP4 memset
CALLP4
pop
line 264
;263:
;264:	len = trap_FS_FOpenFile(fontName, &f, FS_READ);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8420
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8424
ADDRGP4 trap_FS_FOpenFile
CALLI4
ASGNI4
ADDRLP4 416
ADDRLP4 8424
INDIRI4
ASGNI4
line 265
;265:	if (f == FS_INVALID_HANDLE) {
ADDRLP4 8420
INDIRI4
CNSTI4 0
NEI4 $142
line 266
;266:		CG_Printf(S_COLOR_YELLOW "CG_LoadFont: error opening %s\n", fontName);
ADDRGP4 $144
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 267
;267:		return;
ADDRGP4 $141
JUMPV
LABELV $142
line 270
;268:	}
;269:
;270:	if (len >= sizeof(buf)) {
ADDRLP4 416
INDIRI4
CVIU4 4
CNSTU4 8000
LTU4 $145
line 271
;271:		CG_Printf(S_COLOR_YELLOW "CG_LoadFont: font file is too long: %i\n", len);
ADDRGP4 $147
ARGP4
ADDRLP4 416
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 272
;272:		len = sizeof(buf) - 1;
ADDRLP4 416
CNSTI4 7999
ASGNI4
line 273
;273:	}
LABELV $145
line 275
;274:
;275:	trap_FS_Read(buf, len, f);
ADDRLP4 420
ARGP4
ADDRLP4 416
INDIRI4
ARGI4
ADDRLP4 8420
INDIRI4
ARGI4
ADDRGP4 trap_FS_Read
CALLV
pop
line 276
;276:	trap_FS_FCloseFile(f);
ADDRLP4 8420
INDIRI4
ARGI4
ADDRGP4 trap_FS_FCloseFile
CALLV
pop
line 277
;277:	buf[len] = '\0';
ADDRLP4 416
INDIRI4
ADDRLP4 420
ADDP4
CNSTI1 0
ASGNI1
line 279
;278:
;279:	shaderCount = 0;
ADDRLP4 284
CNSTI4 0
ASGNI4
line 281
;280:
;281:	text = buf;  // initialize parser
ADDRLP4 288
ADDRLP4 420
ASGNP4
line 282
;282:	COM_BeginParseSession(fontName);
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 COM_BeginParseSession
CALLV
pop
ADDRGP4 $149
JUMPV
LABELV $148
line 284
;283:
;284:	while (1) {
line 285
;285:		token = COM_ParseExt(&text, qtrue);
ADDRLP4 288
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8428
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8428
INDIRP4
ASGNP4
line 286
;286:		if (token[0] == '\0') {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $151
line 287
;287:			Com_Printf(S_COLOR_RED "CG_LoadFont: parse error.\n");
ADDRGP4 $153
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 288
;288:			return;
ADDRGP4 $141
JUMPV
LABELV $151
line 292
;289:		}
;290:
;291:		// font image
;292:		if (strcmp(token, "img") == 0) {
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $156
ARGP4
ADDRLP4 8432
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8432
INDIRI4
CNSTI4 0
NEI4 $154
line 293
;293:			if (shaderCount >= MAX_FONT_SHADERS) {
ADDRLP4 284
INDIRI4
CNSTI4 4
LTI4 $157
line 294
;294:				Com_Printf("CG_LoadFont: too many font images, ignoring.\n");
ADDRGP4 $159
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 295
;295:				SkipRestOfLine(&text);
ADDRLP4 288
ARGP4
ADDRGP4 SkipRestOfLine
CALLV
pop
line 296
;296:				continue;
ADDRGP4 $149
JUMPV
LABELV $157
line 298
;297:			}
;298:			token = COM_ParseExt(&text, qfalse);
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8436
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8436
INDIRP4
ASGNP4
line 299
;299:			if (!CG_FileExist(token)) {
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8440
ADDRGP4 CG_FileExist
CALLI4
ASGNI4
ADDRLP4 8440
INDIRI4
CNSTI4 0
NEI4 $160
line 300
;300:				Com_Printf("CG_LoadFont: font image '%s' doesn't exist.\n", token);
ADDRGP4 $162
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 301
;301:				return;
ADDRGP4 $141
JUMPV
LABELV $160
line 304
;302:			}
;303:			// save shader name
;304:			Q_strncpyz(shaderName[shaderCount], token, sizeof(shaderName[shaderCount]));
ADDRLP4 284
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24
ADDP4
ARGP4
ADDRLP4 20
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 306
;305:			// get threshold
;306:			token                        = COM_ParseExt(&text, qfalse);
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8444
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8444
INDIRP4
ASGNP4
line 307
;307:			shaderThreshold[shaderCount] = atoi(token);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8448
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 284
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 8448
INDIRI4
ASGNI4
line 310
;308:
;309:			// Com_Printf( S_COLOR_CYAN "img: %s, threshold: %i\n", shaderName[ shaderCount ], shaderThreshold[ shaderCount ] );
;310:			shaderCount++;
ADDRLP4 284
ADDRLP4 284
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 312
;311:
;312:			SkipRestOfLine(&text);
ADDRLP4 288
ARGP4
ADDRGP4 SkipRestOfLine
CALLV
pop
line 313
;313:			continue;
ADDRGP4 $149
JUMPV
LABELV $154
line 317
;314:		}
;315:
;316:		// font parameters
;317:		if (strcmp(token, "fnt") == 0) {
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 $165
ARGP4
ADDRLP4 8436
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8436
INDIRI4
CNSTI4 0
NEI4 $163
line 318
;318:			token = COM_ParseExt(&text, qfalse);
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8440
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8440
INDIRP4
ASGNP4
line 319
;319:			if (token[0] == '\0' || (width = atof(token)) <= 0.0) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $168
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8448
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 408
ADDRLP4 8448
INDIRF4
ASGNF4
ADDRLP4 8448
INDIRF4
CNSTF4 0
GTF4 $166
LABELV $168
line 320
;320:				Com_Printf("CG_LoadFont: error reading image width.\n");
ADDRGP4 $169
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 321
;321:				return;
ADDRGP4 $141
JUMPV
LABELV $166
line 323
;322:			}
;323:			r_width = 1.0 / width;
ADDRLP4 364
CNSTF4 1065353216
ADDRLP4 408
INDIRF4
DIVF4
ASGNF4
line 325
;324:
;325:			token = COM_ParseExt(&text, qfalse);
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8452
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8452
INDIRP4
ASGNP4
line 326
;326:			if (token[0] == '\0' || (height = atof(token)) <= 0.0) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $172
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8460
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 412
ADDRLP4 8460
INDIRF4
ASGNF4
ADDRLP4 8460
INDIRF4
CNSTF4 0
GTF4 $170
LABELV $172
line 327
;327:				Com_Printf("CG_LoadFont: error reading image height.\n");
ADDRGP4 $173
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 328
;328:				return;
ADDRGP4 $141
JUMPV
LABELV $170
line 330
;329:			}
;330:			r_height = 1.0 / height;
ADDRLP4 384
CNSTF4 1065353216
ADDRLP4 412
INDIRF4
DIVF4
ASGNF4
line 332
;331:
;332:			token = COM_ParseExt(&text, qfalse);
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8464
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8464
INDIRP4
ASGNP4
line 333
;333:			if (token[0] == '\0') {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $174
line 334
;334:				Com_Printf("CG_LoadFont: error reading char widht.\n");
ADDRGP4 $176
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 335
;335:				return;
ADDRGP4 $141
JUMPV
LABELV $174
line 337
;336:			}
;337:			char_width = atof(token);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8468
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 368
ADDRLP4 8468
INDIRF4
ASGNF4
line 339
;338:
;339:			token = COM_ParseExt(&text, qfalse);
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8472
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8472
INDIRP4
ASGNP4
line 340
;340:			if (token[0] == '\0') {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $177
line 341
;341:				Com_Printf("CG_LoadFont: error reading char height.\n");
ADDRGP4 $179
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 342
;342:				return;
ADDRGP4 $141
JUMPV
LABELV $177
line 344
;343:			}
;344:			char_height = atof(token);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8476
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 400
ADDRLP4 8476
INDIRF4
ASGNF4
line 346
;345:
;346:			break;  // parse char metrics
ADDRGP4 $150
JUMPV
LABELV $163
line 348
;347:		}
;348:	}
LABELV $149
line 284
ADDRGP4 $148
JUMPV
LABELV $150
line 350
;349:
;350:	if (shaderCount == 0) {
ADDRLP4 284
INDIRI4
CNSTI4 0
NEI4 $180
line 351
;351:		Com_Printf("CG_LoadFont: no font images specified in %s.\n", fontName);
ADDRGP4 $182
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 352
;352:		return;
ADDRGP4 $141
JUMPV
LABELV $180
line 355
;353:	}
;354:
;355:	fm = fnt->metrics;
ADDRLP4 280
ADDRFP4 0
INDIRP4
ASGNP4
line 357
;356:
;357:	chars = 0;
ADDRLP4 404
CNSTI4 0
ASGNI4
line 358
;358:	for (;;) {
LABELV $183
line 360
;359:		// char index
;360:		token = COM_ParseExt(&text, qtrue);
ADDRLP4 288
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8428
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8428
INDIRP4
ASGNP4
line 361
;361:		if (!token[0])
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $187
line 362
;362:			break;
ADDRGP4 $185
JUMPV
LABELV $187
line 364
;363:
;364:		if (token[0] == '\'' && token[1] && token[2] == '\'')  // char code in form 'X'
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 39
NEI4 $189
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $189
ADDRLP4 20
INDIRP4
CNSTI4 2
ADDP4
INDIRI1
CVII4 1
CNSTI4 39
NEI4 $189
line 365
;365:			i = token[1] & 255;
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 255
BANDI4
ASGNI4
ADDRGP4 $190
JUMPV
LABELV $189
line 367
;366:		else  // integer code
;367:			i = atoi(token);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8436
ADDRGP4 atoi
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8436
INDIRI4
ASGNI4
LABELV $190
line 369
;368:
;369:		if (i < 0 || i > 255) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $193
ADDRLP4 0
INDIRI4
CNSTI4 255
LEI4 $191
LABELV $193
line 370
;370:			CG_Printf(S_COLOR_RED "CG_LoadFont: bad char index %i.\n", i);
ADDRGP4 $194
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 371
;371:			return;
ADDRGP4 $141
JUMPV
LABELV $191
line 373
;372:		}
;373:		fm = fnt->metrics + i;
ADDRLP4 280
ADDRLP4 0
INDIRI4
CNSTI4 44
MULI4
ADDRFP4 0
INDIRP4
ADDP4
ASGNP4
line 376
;374:
;375:		// x0
;376:		token = COM_ParseExt(&text, qfalse);
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8444
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8444
INDIRP4
ASGNP4
line 377
;377:		if (!token[0]) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $195
line 378
;378:			CG_Printf(S_COLOR_RED "CG_LoadFont: error reading x0.\n");
ADDRGP4 $197
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 379
;379:			return;
ADDRGP4 $141
JUMPV
LABELV $195
line 381
;380:		}
;381:		x0 = atof(token);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8448
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 376
ADDRLP4 8448
INDIRF4
ASGNF4
line 384
;382:
;383:		// y0
;384:		token = COM_ParseExt(&text, qfalse);
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8452
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8452
INDIRP4
ASGNP4
line 385
;385:		if (!token[0]) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $198
line 386
;386:			CG_Printf(S_COLOR_RED "CG_LoadFont: error reading y0.\n");
ADDRGP4 $200
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 387
;387:			return;
ADDRGP4 $141
JUMPV
LABELV $198
line 389
;388:		}
;389:		y0 = atof(token);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8456
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 380
ADDRLP4 8456
INDIRF4
ASGNF4
line 392
;390:
;391:		// w1-offset
;392:		token = COM_ParseExt(&text, qfalse);
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8460
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8460
INDIRP4
ASGNP4
line 393
;393:		if (!token[0]) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $201
line 394
;394:			CG_Printf(S_COLOR_RED "CG_LoadFont: error reading x-offset.\n");
ADDRGP4 $203
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 395
;395:			return;
ADDRGP4 $141
JUMPV
LABELV $201
line 397
;396:		}
;397:		w1 = atof(token);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8464
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 388
ADDRLP4 8464
INDIRF4
ASGNF4
line 400
;398:
;399:		// w2-offset
;400:		token = COM_ParseExt(&text, qfalse);
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8468
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8468
INDIRP4
ASGNP4
line 401
;401:		if (!token[0]) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $204
line 402
;402:			CG_Printf(S_COLOR_RED "CG_LoadFont: error reading x-length.\n");
ADDRGP4 $206
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 403
;403:			return;
ADDRGP4 $141
JUMPV
LABELV $204
line 405
;404:		}
;405:		w2 = atof(token);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8472
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 372
ADDRLP4 8472
INDIRF4
ASGNF4
line 408
;406:
;407:		// space1
;408:		token = COM_ParseExt(&text, qfalse);
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8476
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8476
INDIRP4
ASGNP4
line 409
;409:		if (!token[0]) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $207
line 410
;410:			CG_Printf(S_COLOR_RED "CG_LoadFont: error reading space1.\n");
ADDRGP4 $209
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 411
;411:			return;
ADDRGP4 $141
JUMPV
LABELV $207
line 413
;412:		}
;413:		s1 = atof(token);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8480
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 392
ADDRLP4 8480
INDIRF4
ASGNF4
line 416
;414:
;415:		// space2
;416:		token = COM_ParseExt(&text, qfalse);
ADDRLP4 288
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 8484
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 8484
INDIRP4
ASGNP4
line 417
;417:		if (!token[0]) {
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $210
line 418
;418:			CG_Printf(S_COLOR_RED "CG_LoadFont: error reading space2.\n");
ADDRGP4 $212
ARGP4
ADDRGP4 CG_Printf
CALLV
pop
line 419
;419:			return;
ADDRGP4 $141
JUMPV
LABELV $210
line 421
;420:		}
;421:		s2 = atof(token);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 8488
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 396
ADDRLP4 8488
INDIRF4
ASGNF4
line 423
;422:
;423:		fm->tc_mono[0] = x0 * r_width;
ADDRLP4 280
INDIRP4
CNSTI4 16
ADDP4
ADDRLP4 376
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ASGNF4
line 424
;424:		fm->tc_mono[1] = y0 * r_height;
ADDRLP4 280
INDIRP4
CNSTI4 20
ADDP4
ADDRLP4 380
INDIRF4
ADDRLP4 384
INDIRF4
MULF4
ASGNF4
line 425
;425:		fm->tc_mono[2] = (x0 + char_width) * r_width;
ADDRLP4 280
INDIRP4
CNSTI4 24
ADDP4
ADDRLP4 376
INDIRF4
ADDRLP4 368
INDIRF4
ADDF4
ADDRLP4 364
INDIRF4
MULF4
ASGNF4
line 426
;426:		fm->tc_mono[3] = (y0 + char_height) * r_height;
ADDRLP4 280
INDIRP4
CNSTI4 28
ADDP4
ADDRLP4 380
INDIRF4
ADDRLP4 400
INDIRF4
ADDF4
ADDRLP4 384
INDIRF4
MULF4
ASGNF4
line 429
;427:
;428:		// proportional y-coords is matching with mono
;429:		fm->tc_prop[1] = fm->tc_mono[1];
ADDRLP4 280
INDIRP4
CNSTI4 4
ADDP4
ADDRLP4 280
INDIRP4
CNSTI4 20
ADDP4
INDIRF4
ASGNF4
line 430
;430:		fm->tc_prop[3] = fm->tc_mono[3];
ADDRLP4 280
INDIRP4
CNSTI4 12
ADDP4
ADDRLP4 280
INDIRP4
CNSTI4 28
ADDP4
INDIRF4
ASGNF4
line 432
;431:
;432:		fm->width      = w2 / char_width;
ADDRLP4 280
INDIRP4
CNSTI4 40
ADDP4
ADDRLP4 372
INDIRF4
ADDRLP4 368
INDIRF4
DIVF4
ASGNF4
line 433
;433:		fm->space1     = s1 / char_width;
ADDRLP4 280
INDIRP4
CNSTI4 32
ADDP4
ADDRLP4 392
INDIRF4
ADDRLP4 368
INDIRF4
DIVF4
ASGNF4
line 434
;434:		fm->space2     = (s2 + w2) / char_width;
ADDRLP4 280
INDIRP4
CNSTI4 36
ADDP4
ADDRLP4 396
INDIRF4
ADDRLP4 372
INDIRF4
ADDF4
ADDRLP4 368
INDIRF4
DIVF4
ASGNF4
line 435
;435:		fm->tc_prop[0] = fm->tc_mono[0] + (w1 * r_width);
ADDRLP4 280
INDIRP4
ADDRLP4 280
INDIRP4
CNSTI4 16
ADDP4
INDIRF4
ADDRLP4 388
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ADDF4
ASGNF4
line 436
;436:		fm->tc_prop[2] = fm->tc_prop[0] + (w2 * r_width);
ADDRLP4 280
INDIRP4
CNSTI4 8
ADDP4
ADDRLP4 280
INDIRP4
INDIRF4
ADDRLP4 372
INDIRF4
ADDRLP4 364
INDIRF4
MULF4
ADDF4
ASGNF4
line 438
;437:
;438:		chars++;
ADDRLP4 404
ADDRLP4 404
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 440
;439:
;440:		SkipRestOfLine(&text);
ADDRLP4 288
ARGP4
ADDRGP4 SkipRestOfLine
CALLV
pop
line 441
;441:	}
line 358
ADDRGP4 $183
JUMPV
LABELV $185
LABELV $213
line 444
;442:
;443:	// sort images by threshold
;444:	do {
line 445
;445:		for (swapped = qfalse, i = 1; i < shaderCount; i++) {
ADDRLP4 360
CNSTI4 0
ASGNI4
ADDRLP4 0
CNSTI4 1
ASGNI4
ADDRGP4 $219
JUMPV
LABELV $216
line 446
;446:			if (shaderThreshold[i - 1] > shaderThreshold[i]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
LEI4 $220
line 447
;447:				tmp                    = shaderThreshold[i - 1];
ADDRLP4 356
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
INDIRI4
ASGNI4
line 448
;448:				shaderThreshold[i - 1] = shaderThreshold[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4-4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 449
;449:				shaderThreshold[i]     = tmp;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 356
INDIRI4
ASGNI4
line 450
;450:				strcpy(tmpName, shaderName[i - 1]);
ADDRLP4 292
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24-64
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 451
;451:				strcpy(shaderName[i - 1], shaderName[i]);
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24-64
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24
ADDP4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 452
;452:				strcpy(shaderName[i], tmpName);
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24
ADDP4
ARGP4
ADDRLP4 292
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 453
;453:				swapped = qtrue;
ADDRLP4 360
CNSTI4 1
ASGNI4
line 454
;454:			}
LABELV $220
line 455
;455:		}
LABELV $217
line 445
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $219
ADDRLP4 0
INDIRI4
ADDRLP4 284
INDIRI4
LTI4 $216
line 456
;456:	} while (swapped);
LABELV $214
ADDRLP4 360
INDIRI4
CNSTI4 0
NEI4 $213
line 459
;457:
;458:	// always assume zero threshold for lowest-quality shader
;459:	shaderThreshold[0] = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 461
;460:
;461:	fnt->shaderCount = shaderCount;
ADDRFP4 0
INDIRP4
CNSTI4 11296
ADDP4
ADDRLP4 284
INDIRI4
ASGNI4
line 462
;462:	for (i = 0; i < shaderCount; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $230
JUMPV
LABELV $227
line 463
;463:		fnt->shader[i]          = trap_R_RegisterShaderNoMip(shaderName[i]);
ADDRLP4 0
INDIRI4
CNSTI4 6
LSHI4
ADDRLP4 24
ADDP4
ARGP4
ADDRLP4 8432
ADDRGP4 trap_R_RegisterShaderNoMip
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 11264
ADDP4
ADDP4
ADDRLP4 8432
INDIRI4
ASGNI4
line 464
;464:		fnt->shaderThreshold[i] = shaderThreshold[i];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 0
INDIRP4
CNSTI4 11280
ADDP4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 465
;465:	}
LABELV $228
line 462
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $230
ADDRLP4 0
INDIRI4
ADDRLP4 284
INDIRI4
LTI4 $227
line 467
;466:
;467:	CG_Printf("Font '%s' loaded with %i chars and %i images\n", fontName, chars, shaderCount);
ADDRGP4 $231
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 404
INDIRI4
ARGI4
ADDRLP4 284
INDIRI4
ARGI4
ADDRGP4 CG_Printf
CALLV
pop
line 468
;468:}
LABELV $141
endproc CG_LoadFont 8508 16
export CG_LoadFonts
proc CG_LoadFonts 0 8
line 470
;469:
;470:void CG_LoadFonts(void) {
line 471
;471:	CG_LoadFont(&bigchars, "gfx/2d/bigchars.cfg");
ADDRGP4 bigchars
ARGP4
ADDRGP4 $233
ARGP4
ADDRGP4 CG_LoadFont
CALLV
pop
line 472
;472:	CG_LoadFont(&numbers, "gfx/2d/numbers.cfg");
ADDRGP4 numbers
ARGP4
ADDRGP4 $234
ARGP4
ADDRGP4 CG_LoadFont
CALLV
pop
line 473
;473:}
LABELV $232
endproc CG_LoadFonts 0 8
proc DrawStringLength 20 0
line 475
;474:
;475:static float DrawStringLength(const char* string, float ax, float aw, float max_ax, int proportional) {
line 482
;476:	const font_metric_t* fm;
;477:	// float			aw1;
;478:	float       x_end;
;479:	const byte* s;
;480:	float       xx;
;481:
;482:	if (!string)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $236
line 483
;483:		return 0.0f;
CNSTF4 0
RETF4
ADDRGP4 $235
JUMPV
LABELV $236
line 485
;484:
;485:	s = (const byte*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 487
;486:
;487:	xx = ax;
ADDRLP4 12
ADDRFP4 4
INDIRF4
ASGNF4
ADDRGP4 $239
JUMPV
LABELV $238
line 489
;488:
;489:	while (*s != '\0') {
line 491
;490:
;491:		if (*s == Q_COLOR_ESCAPE && s[1] != '\0' && s[1] != '^') {
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 94
NEI4 $241
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $241
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 94
EQI4 $241
line 493
;492:			// if ( !(flags & DS_SHOW_CODE) ) {
;493:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 494
;494:			continue;
ADDRGP4 $239
JUMPV
LABELV $241
line 499
;495:			//}
;496:		}
;497:
;498:		// fm = &font->metrics[ *s ];
;499:		fm = &metrics[*s];
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 44
MULI4
ADDRGP4 metrics
INDIRP4
ADDP4
ASGNP4
line 500
;500:		if (proportional) {
ADDRFP4 16
INDIRI4
CNSTI4 0
EQI4 $243
line 502
;501:			// aw1 = fm->width * aw;
;502:			ax += fm->space1 * aw;         // add extra space if required by metrics
ADDRFP4 4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 503
;503:			x_end = ax + fm->space2 * aw;  // final position
ADDRLP4 4
ADDRFP4 4
INDIRF4
ADDRLP4 8
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRFP4 8
INDIRF4
MULF4
ADDF4
ASGNF4
line 504
;504:		} else {
ADDRGP4 $244
JUMPV
LABELV $243
line 506
;505:			// aw1 = aw;
;506:			x_end = ax + aw;
ADDRLP4 4
ADDRFP4 4
INDIRF4
ADDRFP4 8
INDIRF4
ADDF4
ASGNF4
line 507
;507:		}
LABELV $244
line 509
;508:
;509:		if (x_end > max_ax)
ADDRLP4 4
INDIRF4
ADDRFP4 12
INDIRF4
LEF4 $245
line 510
;510:			break;
ADDRGP4 $240
JUMPV
LABELV $245
line 512
;511:
;512:		ax = x_end;
ADDRFP4 4
ADDRLP4 4
INDIRF4
ASGNF4
line 513
;513:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 514
;514:	}
LABELV $239
line 489
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 0
NEI4 $238
LABELV $240
line 516
;515:
;516:	return (ax - xx);
ADDRFP4 4
INDIRF4
ADDRLP4 12
INDIRF4
SUBF4
RETF4
LABELV $235
endproc DrawStringLength 20 0
export CG_DrawString
proc CG_DrawString 96 36
line 519
;517:}
;518:
;519:void CG_DrawString(float x, float y, const char* string, const vec4_t setColor, float charWidth, float charHeight, int maxChars, int flags) {
line 533
;520:	const font_metric_t* fm;
;521:	const float*         tc;                   // texture coordinates for char
;522:	float                ax, ay, aw, aw1, ah;  // absolute positions/dimensions
;523:	float                scale;
;524:	float                x_end, xx;
;525:	vec4_t               color;
;526:	const byte*          s;
;527:	float                xx_add, yy_add;
;528:	float                max_ax;
;529:	int                  i;
;530:	qhandle_t            sh;
;531:	int                  proportional;
;532:
;533:	if (!string)
ADDRFP4 8
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $248
line 534
;534:		return;
ADDRGP4 $247
JUMPV
LABELV $248
line 536
;535:
;536:	s = (const byte*)string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 538
;537:
;538:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 8
ADDRFP4 0
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRGP4 cgs+31444
INDIRF4
ADDF4
ASGNF4
line 539
;539:	ay = y * cgs.screenYScale + cgs.screenYBias;
ADDRLP4 48
ADDRFP4 4
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ADDRGP4 cgs+31448
INDIRF4
ADDF4
ASGNF4
line 541
;540:
;541:	aw = charWidth * cgs.screenXScale;
ADDRLP4 20
ADDRFP4 16
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 542
;542:	ah = charHeight * cgs.screenYScale;
ADDRLP4 32
ADDRFP4 20
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 544
;543:
;544:	if (maxChars <= 0) {
ADDRFP4 24
INDIRI4
CNSTI4 0
GTI4 $256
line 545
;545:		max_ax = 9999999.0f;
ADDRLP4 40
CNSTF4 1259902591
ASGNF4
line 546
;546:	} else {
ADDRGP4 $257
JUMPV
LABELV $256
line 547
;547:		max_ax = ax + aw * maxChars;
ADDRLP4 40
ADDRLP4 8
INDIRF4
ADDRLP4 20
INDIRF4
ADDRFP4 24
INDIRI4
CVIF4 4
MULF4
ADDF4
ASGNF4
line 548
;548:	}
LABELV $257
line 550
;549:
;550:	proportional = (flags & DS_PROPORTIONAL);
ADDRLP4 44
ADDRFP4 28
INDIRI4
CNSTI4 4
BANDI4
ASGNI4
line 552
;551:
;552:	if (flags & (DS_CENTER | DS_RIGHT)) {
ADDRFP4 28
INDIRI4
CNSTI4 24
BANDI4
CNSTI4 0
EQI4 $258
line 553
;553:		if (flags & DS_CENTER) {
ADDRFP4 28
INDIRI4
CNSTI4 8
BANDI4
CNSTI4 0
EQI4 $260
line 554
;554:			ax -= 0.5f * DrawStringLength(string, ax, aw, max_ax, proportional);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 DrawStringLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 88
INDIRF4
CNSTF4 1056964608
MULF4
SUBF4
ASGNF4
line 555
;555:		} else {
ADDRGP4 $261
JUMPV
LABELV $260
line 556
;556:			ax -= DrawStringLength(string, ax, aw, max_ax, proportional);
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 20
INDIRF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
ADDRLP4 44
INDIRI4
ARGI4
ADDRLP4 88
ADDRGP4 DrawStringLength
CALLF4
ASGNF4
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 88
INDIRF4
SUBF4
ASGNF4
line 557
;557:		}
LABELV $261
line 558
;558:	}
LABELV $258
line 560
;559:
;560:	sh = font->shader[0];  // low-res shader by default
ADDRLP4 36
ADDRGP4 font
INDIRP4
CNSTI4 11264
ADDP4
INDIRI4
ASGNI4
line 562
;561:
;562:	if (flags & DS_SHADOW) {
ADDRFP4 28
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $262
line 563
;563:		xx = ax;
ADDRLP4 80
ADDRLP4 8
INDIRF4
ASGNF4
line 566
;564:
;565:		// calculate shadow offsets
;566:		scale  = charWidth * 0.075f;  // charWidth/15
ADDRLP4 76
ADDRFP4 16
INDIRF4
CNSTF4 1033476506
MULF4
ASGNF4
line 567
;567:		xx_add = scale * cgs.screenXScale;
ADDRLP4 68
ADDRLP4 76
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 568
;568:		yy_add = scale * cgs.screenYScale;
ADDRLP4 72
ADDRLP4 76
INDIRF4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ASGNF4
line 570
;569:
;570:		color[0] = color[1] = color[2] = 0.0f;
ADDRLP4 84
CNSTF4 0
ASGNF4
ADDRLP4 52+8
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 84
INDIRF4
ASGNF4
ADDRLP4 52
ADDRLP4 84
INDIRF4
ASGNF4
line 571
;571:		color[3]                       = setColor[3] * 0.5f;
ADDRLP4 52+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 572
;572:		trap_R_SetColor(color);
ADDRLP4 52
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $270
JUMPV
LABELV $269
line 574
;573:
;574:		while (*s != '\0') {
line 575
;575:			if (*s == Q_COLOR_ESCAPE && s[1] != '\0' && s[1] != '^') {
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 94
NEI4 $272
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $272
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 94
EQI4 $272
line 577
;576:				// if ( !(options & DS_SHOW_CODE) ) {
;577:				s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 578
;578:				continue;
ADDRGP4 $270
JUMPV
LABELV $272
line 582
;579:				//}
;580:			}
;581:			// fm = &font->metrics[ *s ];
;582:			fm = &metrics[*s];
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 44
MULI4
ADDRGP4 metrics
INDIRP4
ADDP4
ASGNP4
line 583
;583:			if (proportional) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $274
line 584
;584:				tc  = fm->tc_prop;
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 585
;585:				aw1 = fm->width * aw;
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 586
;586:				ax += fm->space1 * aw;         // add extra space if required by metrics
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 587
;587:				x_end = ax + fm->space2 * aw;  // final position
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 588
;588:			} else {
ADDRGP4 $275
JUMPV
LABELV $274
line 589
;589:				tc    = fm->tc_mono;
ADDRLP4 4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
line 590
;590:				aw1   = aw;
ADDRLP4 28
ADDRLP4 20
INDIRF4
ASGNF4
line 591
;591:				x_end = ax + aw;
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
ASGNF4
line 592
;592:			}
LABELV $275
line 594
;593:
;594:			if (x_end > max_ax || ax >= cgs.glconfig.vidWidth)
ADDRLP4 16
INDIRF4
ADDRLP4 40
INDIRF4
GTF4 $280
ADDRLP4 8
INDIRF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
LTF4 $276
LABELV $280
line 595
;595:				break;
ADDRGP4 $271
JUMPV
LABELV $276
line 597
;596:
;597:			trap_R_DrawStretchPic(ax + xx_add, ay + yy_add, aw1, ah, tc[0], tc[1], tc[2], tc[3], sh);
ADDRLP4 8
INDIRF4
ADDRLP4 68
INDIRF4
ADDF4
ARGF4
ADDRLP4 48
INDIRF4
ADDRLP4 72
INDIRF4
ADDF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 599
;598:
;599:			ax = x_end;
ADDRLP4 8
ADDRLP4 16
INDIRF4
ASGNF4
line 600
;600:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 601
;601:		}
LABELV $270
line 574
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 0
NEI4 $269
LABELV $271
line 604
;602:
;603:		// recover altered parameters
;604:		s  = (const byte*)string;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
line 605
;605:		ax = xx;
ADDRLP4 8
ADDRLP4 80
INDIRF4
ASGNF4
line 606
;606:	}
LABELV $262
line 609
;607:
;608:	// select hi-res shader if accepted
;609:	for (i = 1; i < font->shaderCount; i++) {
ADDRLP4 24
CNSTI4 1
ASGNI4
ADDRGP4 $284
JUMPV
LABELV $281
line 610
;610:		if (ah >= font->shaderThreshold[i]) {
ADDRLP4 32
INDIRF4
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 font
INDIRP4
CNSTI4 11280
ADDP4
ADDP4
INDIRI4
CVIF4 4
LTF4 $285
line 611
;611:			sh = font->shader[i];
ADDRLP4 36
ADDRLP4 24
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 font
INDIRP4
CNSTI4 11264
ADDP4
ADDP4
INDIRI4
ASGNI4
line 612
;612:		}
LABELV $285
line 613
;613:	}
LABELV $282
line 609
ADDRLP4 24
ADDRLP4 24
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $284
ADDRLP4 24
INDIRI4
ADDRGP4 font
INDIRP4
CNSTI4 11296
ADDP4
INDIRI4
LTI4 $281
line 615
;614:
;615:	Vector4Copy(setColor, color);
ADDRLP4 84
ADDRFP4 12
INDIRP4
ASGNP4
ADDRLP4 52
ADDRLP4 84
INDIRP4
INDIRF4
ASGNF4
ADDRLP4 52+4
ADDRLP4 84
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52+8
ADDRFP4 12
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
ADDRLP4 52+12
ADDRFP4 12
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 616
;616:	trap_R_SetColor(color);
ADDRLP4 52
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
ADDRGP4 $291
JUMPV
LABELV $290
line 618
;617:
;618:	while (*s != '\0') {
line 620
;619:
;620:		if (*s == Q_COLOR_ESCAPE && s[1] != '\0' && s[1] != '^') {
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 94
NEI4 $293
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 0
EQI4 $293
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 94
EQI4 $293
line 621
;621:			if (!(flags & DS_FORCE_COLOR)) {
ADDRFP4 28
INDIRI4
CNSTI4 2
BANDI4
CNSTI4 0
NEI4 $295
line 622
;622:				VectorCopy(g_color_table[ColorIndex(s[1])], color);
ADDRLP4 52
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRU1
CVUI4 1
CNSTI4 48
SUBI4
CNSTI4 7
BANDI4
CNSTI4 4
LSHI4
ADDRGP4 g_color_table
ADDP4
INDIRB
ASGNB 12
line 623
;623:				trap_R_SetColor(color);
ADDRLP4 52
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 624
;624:			}
LABELV $295
line 626
;625:			// if ( !(options & DS_SHOW_CODE) ) {
;626:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 627
;627:			continue;
ADDRGP4 $291
JUMPV
LABELV $293
line 632
;628:			//}
;629:		}
;630:
;631:		// fm = &font->metrics[ *s ];
;632:		fm = &metrics[*s];
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 44
MULI4
ADDRGP4 metrics
INDIRP4
ADDP4
ASGNP4
line 633
;633:		if (proportional) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $297
line 634
;634:			tc  = fm->tc_prop;
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 635
;635:			aw1 = fm->width * aw;
ADDRLP4 28
ADDRLP4 12
INDIRP4
CNSTI4 40
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ASGNF4
line 636
;636:			ax += fm->space1 * aw;         // add extra space if required by metrics
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 32
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 637
;637:			x_end = ax + fm->space2 * aw;  // final position
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRP4
CNSTI4 36
ADDP4
INDIRF4
ADDRLP4 20
INDIRF4
MULF4
ADDF4
ASGNF4
line 638
;638:		} else {
ADDRGP4 $298
JUMPV
LABELV $297
line 639
;639:			tc    = fm->tc_mono;
ADDRLP4 4
ADDRLP4 12
INDIRP4
CNSTI4 16
ADDP4
ASGNP4
line 640
;640:			aw1   = aw;
ADDRLP4 28
ADDRLP4 20
INDIRF4
ASGNF4
line 641
;641:			x_end = ax + aw;
ADDRLP4 16
ADDRLP4 8
INDIRF4
ADDRLP4 20
INDIRF4
ADDF4
ASGNF4
line 642
;642:		}
LABELV $298
line 644
;643:
;644:		if (x_end > max_ax || ax >= cgs.glconfig.vidWidth)
ADDRLP4 16
INDIRF4
ADDRLP4 40
INDIRF4
GTF4 $303
ADDRLP4 8
INDIRF4
ADDRGP4 cgs+20100+11304
INDIRI4
CVIF4 4
LTF4 $299
LABELV $303
line 645
;645:			break;
ADDRGP4 $292
JUMPV
LABELV $299
line 647
;646:
;647:		trap_R_DrawStretchPic(ax, ay, aw1, ah, tc[0], tc[1], tc[2], tc[3], sh);
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 48
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ARGF4
ADDRLP4 36
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 649
;648:
;649:		ax = x_end;
ADDRLP4 8
ADDRLP4 16
INDIRF4
ASGNF4
line 650
;650:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 651
;651:	}
LABELV $291
line 618
ADDRLP4 0
INDIRP4
INDIRU1
CVUI4 1
CNSTI4 0
NEI4 $290
LABELV $292
line 654
;652:
;653:	// trap_R_SetColor( NULL );
;654:}
LABELV $247
endproc CG_DrawString 96 36
export CG_DrawStrlen
proc CG_DrawStrlen 12 0
line 696
;655:#else
;656:
;657:static float DrawStringLen(const char* s, float charWidth) {
;658:	int count;
;659:	count = 0;
;660:	while (*s) {
;661:		if (Q_IsColorString(s)) {
;662:			s += 2;
;663:		} else {
;664:			count++;
;665:			s++;
;666:		}
;667:	}
;668:	return count * charWidth;
;669:}
;670:
;671:void CG_DrawString(float x, float y, const char* s, const vec4_t color, float charWidth, float charHeight, int maxChars, int flags) {
;672:	if (!color) {
;673:		color = g_color_table[ColorIndex(COLOR_WHITE)];
;674:	}
;675:
;676:	if (flags & (DS_CENTER | DS_RIGHT)) {
;677:		float w;
;678:		w = DrawStringLen(s, charWidth);
;679:		if (flags & DS_CENTER)
;680:			x -= w * 0.5f;
;681:		else
;682:			x -= w;
;683:	}
;684:
;685:	CG_DrawStringExt(x, y, s, color, flags & DS_FORCE_COLOR, flags & DS_SHADOW, charWidth, charHeight, maxChars);
;686:}
;687:#endif
;688:
;689:/*
;690:=================
;691:CG_DrawStrlen
;692:
;693:Returns character count, skiping color escape codes
;694:=================
;695:*/
;696:int CG_DrawStrlen(const char* str) {
line 697
;697:	const char* s     = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 698
;698:	int         count = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $306
JUMPV
LABELV $305
line 700
;699:
;700:	while (*s) {
line 701
;701:		if (Q_IsColorString(s)) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $308
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $308
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $308
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $308
line 702
;702:			s += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 703
;703:		} else {
ADDRGP4 $309
JUMPV
LABELV $308
line 704
;704:			count++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 705
;705:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 706
;706:		}
LABELV $309
line 707
;707:	}
LABELV $306
line 700
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $305
line 709
;708:
;709:	return count;
ADDRLP4 4
INDIRI4
RETI4
LABELV $304
endproc CG_DrawStrlen 12 0
proc CG_TileClearBox 16 36
line 720
;710:}
;711:
;712:/*
;713:=============
;714:CG_TileClearBox
;715:
;716:This repeats a 64*64 tile graphic to fill the screen around a sized down
;717:refresh window.
;718:=============
;719:*/
;720:static void CG_TileClearBox(int x, int y, int w, int h, qhandle_t hShader) {
line 723
;721:	float s1, t1, s2, t2;
;722:
;723:	s1 = x / 64.0;
ADDRLP4 0
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1015021568
MULF4
ASGNF4
line 724
;724:	t1 = y / 64.0;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVIF4 4
CNSTF4 1015021568
MULF4
ASGNF4
line 725
;725:	s2 = (x + w) / 64.0;
ADDRLP4 8
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1015021568
MULF4
ASGNF4
line 726
;726:	t2 = (y + h) / 64.0;
ADDRLP4 12
ADDRFP4 4
INDIRI4
ADDRFP4 12
INDIRI4
ADDI4
CVIF4 4
CNSTF4 1015021568
MULF4
ASGNF4
line 727
;727:	trap_R_DrawStretchPic(x, y, w, h, s1, t1, s2, t2, hShader);
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
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
line 728
;728:}
LABELV $310
endproc CG_TileClearBox 16 36
export CG_TileClear
proc CG_TileClear 40 20
line 737
;729:
;730:/*
;731:==============
;732:CG_TileClear
;733:
;734:Clear around a sized down screen
;735:==============
;736:*/
;737:void CG_TileClear(void) {
line 741
;738:	int top, bottom, left, right;
;739:	int w, h;
;740:
;741:	w = cgs.glconfig.vidWidth;
ADDRLP4 8
ADDRGP4 cgs+20100+11304
INDIRI4
ASGNI4
line 742
;742:	h = cgs.glconfig.vidHeight;
ADDRLP4 20
ADDRGP4 cgs+20100+11308
INDIRI4
ASGNI4
line 744
;743:
;744:	if (cg.refdef.x == 0 && cg.refdef.y == 0 && cg.refdef.width == w && cg.refdef.height == h) {
ADDRGP4 cg+109056
INDIRI4
CNSTI4 0
NEI4 $316
ADDRGP4 cg+109056+4
INDIRI4
CNSTI4 0
NEI4 $316
ADDRGP4 cg+109056+8
INDIRI4
ADDRLP4 8
INDIRI4
NEI4 $316
ADDRGP4 cg+109056+12
INDIRI4
ADDRLP4 20
INDIRI4
NEI4 $316
line 745
;745:		return;  // full screen rendering
ADDRGP4 $311
JUMPV
LABELV $316
line 748
;746:	}
;747:
;748:	top    = cg.refdef.y;
ADDRLP4 0
ADDRGP4 cg+109056+4
INDIRI4
ASGNI4
line 749
;749:	bottom = top + cg.refdef.height - 1;
ADDRLP4 4
ADDRLP4 0
INDIRI4
ADDRGP4 cg+109056+12
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 750
;750:	left   = cg.refdef.x;
ADDRLP4 12
ADDRGP4 cg+109056
INDIRI4
ASGNI4
line 751
;751:	right  = left + cg.refdef.width - 1;
ADDRLP4 16
ADDRLP4 12
INDIRI4
ADDRGP4 cg+109056+8
INDIRI4
ADDI4
CNSTI4 1
SUBI4
ASGNI4
line 754
;752:
;753:	// clear above view screen
;754:	CG_TileClearBox(0, 0, w, top, cgs.media.backTileShader);
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cgs+148692+268
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 757
;755:
;756:	// clear below view screen
;757:	CG_TileClearBox(0, bottom, w, h - bottom, cgs.media.backTileShader);
CNSTI4 0
ARGI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 20
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
ARGI4
ADDRGP4 cgs+148692+268
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 760
;758:
;759:	// clear left of view screen
;760:	CG_TileClearBox(0, top, left, bottom - top + 1, cgs.media.backTileShader);
CNSTI4 0
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+148692+268
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 763
;761:
;762:	// clear right of view screen
;763:	CG_TileClearBox(right, top, w - right, bottom - top + 1, cgs.media.backTileShader);
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ADDRLP4 16
INDIRI4
SUBI4
ARGI4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 cgs+148692+268
INDIRI4
ARGI4
ADDRGP4 CG_TileClearBox
CALLV
pop
line 764
;764:}
LABELV $311
endproc CG_TileClear 40 20
bss
align 4
LABELV $341
skip 16
export CG_FadeColor
code
proc CG_FadeColor 8 0
line 771
;765:
;766:/*
;767:================
;768:CG_FadeColor
;769:================
;770:*/
;771:float* CG_FadeColor(int startMsec, int totalMsec) {
line 775
;772:	static vec4_t color;
;773:	int           t;
;774:
;775:	if (startMsec == 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $342
line 776
;776:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $340
JUMPV
LABELV $342
line 779
;777:	}
;778:
;779:	t = cg.time - startMsec;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 781
;780:
;781:	if (t >= totalMsec) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $345
line 782
;782:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $340
JUMPV
LABELV $345
line 786
;783:	}
;784:
;785:	// fade out
;786:	if (totalMsec - t < FADE_TIME) {
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 200
GEI4 $347
line 787
;787:		color[3] = (totalMsec - t) * 1.0 / FADE_TIME;
ADDRGP4 $341+12
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1000593162
MULF4
ASGNF4
line 788
;788:	} else {
ADDRGP4 $348
JUMPV
LABELV $347
line 789
;789:		color[3] = 1.0;
ADDRGP4 $341+12
CNSTF4 1065353216
ASGNF4
line 790
;790:	}
LABELV $348
line 791
;791:	color[0] = color[1] = color[2] = 1;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRGP4 $341+8
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $341+4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $341
ADDRLP4 4
INDIRF4
ASGNF4
line 793
;792:
;793:	return color;
ADDRGP4 $341
RETP4
LABELV $340
endproc CG_FadeColor 8 0
bss
align 4
LABELV $354
skip 16
export CG_FadeColorTime
code
proc CG_FadeColorTime 8 0
line 801
;794:}
;795:
;796:/*
;797:================
;798:CG_FadeColorTime
;799:================
;800:*/
;801:float* CG_FadeColorTime(int startMsec, int totalMsec, int fadeMsec) {
line 805
;802:	static vec4_t color;
;803:	int           t;
;804:
;805:	if (startMsec == 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
NEI4 $355
line 806
;806:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $353
JUMPV
LABELV $355
line 809
;807:	}
;808:
;809:	t = cg.time - startMsec;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRFP4 0
INDIRI4
SUBI4
ASGNI4
line 811
;810:
;811:	if (t >= totalMsec) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $358
line 812
;812:		return NULL;
CNSTP4 0
RETP4
ADDRGP4 $353
JUMPV
LABELV $358
line 816
;813:	}
;814:
;815:	// fade out
;816:	if (totalMsec - t < fadeMsec) {
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ADDRFP4 8
INDIRI4
GEI4 $360
line 817
;817:		color[3] = (totalMsec - t) * 1.0f / (float)fadeMsec;
ADDRGP4 $354+12
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CVIF4 4
ADDRFP4 8
INDIRI4
CVIF4 4
DIVF4
ASGNF4
line 818
;818:	} else {
ADDRGP4 $361
JUMPV
LABELV $360
line 819
;819:		color[3] = 1.0f;
ADDRGP4 $354+12
CNSTF4 1065353216
ASGNF4
line 820
;820:	}
LABELV $361
line 821
;821:	color[0] = color[1] = color[2] = 1.0f;
ADDRLP4 4
CNSTF4 1065353216
ASGNF4
ADDRGP4 $354+8
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $354+4
ADDRLP4 4
INDIRF4
ASGNF4
ADDRGP4 $354
ADDRLP4 4
INDIRF4
ASGNF4
line 823
;822:
;823:	return color;
ADDRGP4 $354
RETP4
LABELV $353
endproc CG_FadeColorTime 8 0
data
align 4
LABELV $367
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
align 4
LABELV $368
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $369
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
align 4
LABELV $370
byte 4 1060320051
byte 4 1060320051
byte 4 1060320051
byte 4 1065353216
export CG_TeamColor
code
proc CG_TeamColor 8 0
line 831
;824:}
;825:
;826:/*
;827:================
;828:CG_TeamColor
;829:================
;830:*/
;831:const float* CG_TeamColor(team_t team) {
line 837
;832:	static vec4_t red       = {1, 0.2f, 0.2f, 1};
;833:	static vec4_t blue      = {0.2f, 0.2f, 1, 1};
;834:	static vec4_t other     = {1, 1, 1, 1};
;835:	static vec4_t spectator = {0.7f, 0.7f, 0.7f, 1};
;836:
;837:	switch (team) {
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 1
EQI4 $374
ADDRLP4 0
INDIRI4
CNSTI4 2
EQI4 $375
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $376
ADDRGP4 $371
JUMPV
LABELV $374
line 839
;838:	case TEAM_RED:
;839:		return red;
ADDRGP4 $367
RETP4
ADDRGP4 $366
JUMPV
LABELV $375
line 841
;840:	case TEAM_BLUE:
;841:		return blue;
ADDRGP4 $368
RETP4
ADDRGP4 $366
JUMPV
LABELV $376
line 843
;842:	case TEAM_SPECTATOR:
;843:		return spectator;
ADDRGP4 $370
RETP4
ADDRGP4 $366
JUMPV
LABELV $371
line 845
;844:	default:
;845:		return other;
ADDRGP4 $369
RETP4
LABELV $366
endproc CG_TeamColor 8 0
export CG_GetColorForHealth
proc CG_GetColorForHealth 8 0
line 854
;846:	}
;847:}
;848:
;849:/*
;850:=================
;851:CG_GetColorForHealth
;852:=================
;853:*/
;854:void CG_GetColorForHealth(int health, int armor, vec4_t hcolor) {
line 860
;855:	int count;
;856:	int max;
;857:
;858:	// calculate the total points of damage that can
;859:	// be sustained at the current health / armor level
;860:	if (health <= 0) {
ADDRFP4 0
INDIRI4
CNSTI4 0
GTI4 $378
line 861
;861:		VectorClear(hcolor);  // black
ADDRFP4 8
INDIRP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 862
;862:		hcolor[3] = 1;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 863
;863:		return;
ADDRGP4 $377
JUMPV
LABELV $378
line 865
;864:	}
;865:	count = armor;
ADDRLP4 0
ADDRFP4 4
INDIRI4
ASGNI4
line 866
;866:	max   = health * ARMOR_PROTECTION / (1.0 - ARMOR_PROTECTION);
ADDRLP4 4
ADDRFP4 0
INDIRI4
CVIF4 4
CNSTF4 1073248376
MULF4
CVFI4 4
ASGNI4
line 867
;867:	if (max < count) {
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
GEI4 $380
line 868
;868:		count = max;
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 869
;869:	}
LABELV $380
line 870
;870:	health += count;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 0
INDIRI4
ADDI4
ASGNI4
line 873
;871:
;872:	// set the color based on health
;873:	hcolor[0] = 1.0;
ADDRFP4 8
INDIRP4
CNSTF4 1065353216
ASGNF4
line 874
;874:	hcolor[3] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 12
ADDP4
CNSTF4 1065353216
ASGNF4
line 875
;875:	if (health >= 100) {
ADDRFP4 0
INDIRI4
CNSTI4 100
LTI4 $382
line 876
;876:		hcolor[2] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 1065353216
ASGNF4
line 877
;877:	} else if (health < 66) {
ADDRGP4 $383
JUMPV
LABELV $382
ADDRFP4 0
INDIRI4
CNSTI4 66
GEI4 $384
line 878
;878:		hcolor[2] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
CNSTF4 0
ASGNF4
line 879
;879:	} else {
ADDRGP4 $385
JUMPV
LABELV $384
line 880
;880:		hcolor[2] = (health - 66) / 33.0;
ADDRFP4 8
INDIRP4
CNSTI4 8
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 66
SUBI4
CVIF4 4
CNSTF4 1022901776
MULF4
ASGNF4
line 881
;881:	}
LABELV $385
LABELV $383
line 883
;882:
;883:	if (health > 60) {
ADDRFP4 0
INDIRI4
CNSTI4 60
LEI4 $386
line 884
;884:		hcolor[1] = 1.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 1065353216
ASGNF4
line 885
;885:	} else if (health < 30) {
ADDRGP4 $387
JUMPV
LABELV $386
ADDRFP4 0
INDIRI4
CNSTI4 30
GEI4 $388
line 886
;886:		hcolor[1] = 0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
CNSTF4 0
ASGNF4
line 887
;887:	} else {
ADDRGP4 $389
JUMPV
LABELV $388
line 888
;888:		hcolor[1] = (health - 30) / 30.0;
ADDRFP4 8
INDIRP4
CNSTI4 4
ADDP4
ADDRFP4 0
INDIRI4
CNSTI4 30
SUBI4
CVIF4 4
CNSTF4 1023969417
MULF4
ASGNF4
line 889
;889:	}
LABELV $389
LABELV $387
line 890
;890:}
LABELV $377
endproc CG_GetColorForHealth 8 0
export CG_ColorForHealth
proc CG_ColorForHealth 0 12
line 897
;891:
;892:/*
;893:=================
;894:CG_ColorForHealth
;895:=================
;896:*/
;897:void CG_ColorForHealth(vec4_t hcolor) {
line 899
;898:
;899:	CG_GetColorForHealth(cg.snap->ps.stats[STAT_HEALTH], cg.snap->ps.stats[STAT_ARMOR], hcolor);
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 240
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 900
;900:}
LABELV $390
endproc CG_ColorForHealth 0 12
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
line 1090
;901:
;902:// bk001205 - code below duplicated in q3_ui/ui-atoms.c
;903:// bk001205 - FIXME: does this belong in ui_shared.c?
;904:// bk001205 - FIXME: HARD_LINKED flags not visible here
;905:#ifndef Q3_STATIC  // bk001205 - q_shared defines not visible here
;906:/*
;907:=================
;908:UI_DrawProportionalString2
;909:=================
;910:*/
;911:static int propMap[128][3] = {
;912:	{0,   0,   -1			  },
;913:	{0,   0,   -1			  },
;914:	{0,   0,   -1			  },
;915:	{0,   0,   -1			  },
;916:	{0,   0,   -1			  },
;917:	{0,   0,   -1			  },
;918:	{0,   0,   -1			  },
;919:	{0,   0,   -1			  },
;920:	{0,   0,   -1			  },
;921:	{0,   0,   -1			  },
;922:	{0,   0,   -1			  },
;923:	{0,   0,   -1			  },
;924:	{0,   0,   -1			  },
;925:	{0,   0,   -1			  },
;926:	{0,   0,   -1			  },
;927:	{0,   0,   -1			  },
;928:
;929:	{0,   0,   -1			  },
;930:	{0,   0,   -1			  },
;931:	{0,   0,   -1			  },
;932:	{0,   0,   -1			  },
;933:	{0,   0,   -1			  },
;934:	{0,   0,   -1			  },
;935:	{0,   0,   -1			  },
;936:	{0,   0,   -1			  },
;937:	{0,   0,   -1			  },
;938:	{0,   0,   -1			  },
;939:	{0,   0,   -1			  },
;940:	{0,   0,   -1			  },
;941:	{0,   0,   -1			  },
;942:	{0,   0,   -1			  },
;943:	{0,   0,   -1			  },
;944:	{0,   0,   -1			  },
;945:
;946:	{0,   0,   PROP_SPACE_WIDTH}, // SPACE
;947:	{11,  122, 7			   }, // !
;948:	{154, 181, 14              }, // "
;949:	{55,  122, 17              }, // #
;950:	{79,  122, 18              }, // $
;951:	{101, 122, 23              }, // %
;952:	{153, 122, 18              }, // &
;953:	{9,   93,  7			   }, // '
;954:	{207, 122, 8               }, // (
;955:	{230, 122, 9               }, // )
;956:	{177, 122, 18              }, // *
;957:	{30,  152, 18              }, // +
;958:	{85,  181, 7			   }, // ,
;959:	{34,  93,  11              }, // -
;960:	{110, 181, 6               }, // .
;961:	{130, 152, 14              }, // /
;962:
;963:	{22,  64,  17              }, // 0
;964:	{41,  64,  12              }, // 1
;965:	{58,  64,  17              }, // 2
;966:	{78,  64,  18              }, // 3
;967:	{98,  64,  19              }, // 4
;968:	{120, 64,  18              }, // 5
;969:	{141, 64,  18              }, // 6
;970:	{204, 64,  16              }, // 7
;971:	{162, 64,  17              }, // 8
;972:	{182, 64,  18              }, // 9
;973:	{59,  181, 7			   }, // :
;974:	{35,  181, 7			   }, // ;
;975:	{203, 152, 14              }, // <
;976:	{56,  93,  14              }, // =
;977:	{228, 152, 14              }, // >
;978:	{177, 181, 18              }, // ?
;979:
;980:	{28,  122, 22              }, // @
;981:	{5,   4,   18			  }, // A
;982:	{27,  4,   18			  }, // B
;983:	{48,  4,   18			  }, // C
;984:	{69,  4,   17			  }, // D
;985:	{90,  4,   13			  }, // E
;986:	{106, 4,   13              }, // F
;987:	{121, 4,   18              }, // G
;988:	{143, 4,   17              }, // H
;989:	{164, 4,   8			   }, // I
;990:	{175, 4,   16              }, // J
;991:	{195, 4,   18              }, // K
;992:	{216, 4,   12              }, // L
;993:	{230, 4,   23              }, // M
;994:	{6,   34,  18			  }, // N
;995:	{27,  34,  18              }, // O
;996:
;997:	{48,  34,  18              }, // P
;998:	{68,  34,  18              }, // Q
;999:	{90,  34,  17              }, // R
;1000:	{110, 34,  18              }, // S
;1001:	{130, 34,  14              }, // T
;1002:	{146, 34,  18              }, // U
;1003:	{166, 34,  19              }, // V
;1004:	{185, 34,  29              }, // W
;1005:	{215, 34,  18              }, // X
;1006:	{234, 34,  18              }, // Y
;1007:	{5,   64,  14			  }, // Z
;1008:	{60,  152, 7			   }, // [
;1009:	{106, 151, 13              }, // '\'
;1010:	{83,  152, 7			   }, // ]
;1011:	{128, 122, 17              }, // ^
;1012:	{4,   152, 21              }, // _
;1013:
;1014:	{134, 181, 5               }, // '
;1015:	{5,   4,   18			  }, // A
;1016:	{27,  4,   18			  }, // B
;1017:	{48,  4,   18			  }, // C
;1018:	{69,  4,   17			  }, // D
;1019:	{90,  4,   13			  }, // E
;1020:	{106, 4,   13              }, // F
;1021:	{121, 4,   18              }, // G
;1022:	{143, 4,   17              }, // H
;1023:	{164, 4,   8			   }, // I
;1024:	{175, 4,   16              }, // J
;1025:	{195, 4,   18              }, // K
;1026:	{216, 4,   12              }, // L
;1027:	{230, 4,   23              }, // M
;1028:	{6,   34,  18			  }, // N
;1029:	{27,  34,  18              }, // O
;1030:
;1031:	{48,  34,  18              }, // P
;1032:	{68,  34,  18              }, // Q
;1033:	{90,  34,  17              }, // R
;1034:	{110, 34,  18              }, // S
;1035:	{130, 34,  14              }, // T
;1036:	{146, 34,  18              }, // U
;1037:	{166, 34,  19              }, // V
;1038:	{185, 34,  29              }, // W
;1039:	{215, 34,  18              }, // X
;1040:	{234, 34,  18              }, // Y
;1041:	{5,   64,  14			  }, // Z
;1042:	{153, 152, 13              }, // {
;1043:	{11,  181, 5			   }, // |
;1044:	{180, 152, 13              }, // }
;1045:	{79,  93,  17              }, // ~
;1046:	{0,   0,   -1			  }  // DEL
;1047:};
;1048:
;1049:static int propMapB[26][3] = {
;1050:	{11,  12,  33},
;1051:    {49,  12,  31},
;1052:    {85,  12,  31},
;1053:    {120, 12,  30},
;1054:    {156, 12,  21},
;1055:    {183, 12,  21},
;1056:    {207, 12,  32},
;1057:
;1058:	{13,  55,  30},
;1059:    {49,  55,  13},
;1060:    {66,  55,  29},
;1061:    {101, 55,  31},
;1062:    {135, 55,  21},
;1063:    {158, 55,  40},
;1064:    {204, 55,  32},
;1065:
;1066:	{12,  97,  31},
;1067:    {48,  97,  31},
;1068:    {82,  97,  30},
;1069:    {118, 97,  30},
;1070:    {153, 97,  30},
;1071:    {185, 97,  25},
;1072:    {213, 97,  30},
;1073:
;1074:	{11,  139, 32},
;1075:    {42,  139, 51},
;1076:    {93,  139, 32},
;1077:    {126, 139, 31},
;1078:    {158, 139, 25},
;1079:};
;1080:
;1081:#define PROPB_GAP_WIDTH   4
;1082:#define PROPB_SPACE_WIDTH 12
;1083:#define PROPB_HEIGHT      36
;1084:
;1085:/*
;1086:=================
;1087:UI_DrawBannerString
;1088:=================
;1089:*/
;1090:static void UI_DrawBannerString2(int x, int y, const char* str, vec4_t color) {
line 1103
;1091:	const char*   s;
;1092:	unsigned char ch;  // bk001204 : array subscript
;1093:	float         ax;
;1094:	float         ay;
;1095:	float         aw;
;1096:	float         ah;
;1097:	float         frow;
;1098:	float         fcol;
;1099:	float         fwidth;
;1100:	float         fheight;
;1101:
;1102:	// draw the colored text
;1103:	trap_R_SetColor(color);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1105
;1104:
;1105:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 8
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRGP4 cgs+31444
INDIRF4
ADDF4
ASGNF4
line 1106
;1106:	ay = y * cgs.screenYScale + cgs.screenYBias;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ADDRGP4 cgs+31448
INDIRF4
ADDF4
ASGNF4
line 1108
;1107:
;1108:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $399
JUMPV
LABELV $398
line 1109
;1109:	while (*s) {
line 1110
;1110:		ch = *s & 127;
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
line 1111
;1111:		if (ch == ' ') {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $401
line 1112
;1112:			ax += ((float)PROPB_SPACE_WIDTH + (float)PROPB_GAP_WIDTH) * cgs.screenXScale;
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
CNSTF4 1098907648
MULF4
ADDF4
ASGNF4
line 1113
;1113:		} else if (ch >= 'A' && ch <= 'Z') {
ADDRGP4 $402
JUMPV
LABELV $401
ADDRLP4 40
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 65
LTI4 $404
ADDRLP4 40
INDIRI4
CNSTI4 90
GTI4 $404
line 1114
;1114:			ch -= 'A';
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 65
SUBI4
CVIU4 4
CVUU1 4
ASGNU1
line 1115
;1115:			fcol    = (float)propMapB[ch][0] / 256.0f;
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
line 1116
;1116:			frow    = (float)propMapB[ch][1] / 256.0f;
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
line 1117
;1117:			fwidth  = (float)propMapB[ch][2] / 256.0f;
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
line 1118
;1118:			fheight = (float)PROPB_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1041235968
ASGNF4
line 1119
;1119:			aw      = (float)propMapB[ch][2] * cgs.screenXScale;
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
ADDRGP4 cgs+31432
INDIRF4
MULF4
ASGNF4
line 1120
;1120:			ah      = (float)PROPB_HEIGHT * cgs.screenXScale;
ADDRLP4 24
ADDRGP4 cgs+31432
INDIRF4
CNSTF4 1108344832
MULF4
ASGNF4
line 1121
;1121:			trap_R_DrawStretchPic(ax, ay, aw, ah, fcol, frow, fcol + fwidth, frow + fheight, cgs.media.charsetPropB);
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
ADDRGP4 cgs+148692+12
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 1122
;1122:			ax += (aw + (float)PROPB_GAP_WIDTH * cgs.screenXScale);
ADDRLP4 8
ADDRLP4 8
INDIRF4
ADDRLP4 12
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
CNSTF4 1082130432
MULF4
ADDF4
ADDF4
ASGNF4
line 1123
;1123:		}
LABELV $404
LABELV $402
line 1124
;1124:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1125
;1125:	}
LABELV $399
line 1109
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $398
line 1127
;1126:
;1127:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1128
;1128:}
LABELV $393
endproc UI_DrawBannerString2 52 36
export UI_DrawBannerString
proc UI_DrawBannerString 40 16
line 1130
;1129:
;1130:void UI_DrawBannerString(int x, int y, const char* str, int style, vec4_t color) {
line 1137
;1131:	const char* s;
;1132:	int         ch;
;1133:	int         width;
;1134:	vec4_t      drawcolor;
;1135:
;1136:	// find the width of the drawn text
;1137:	s     = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
line 1138
;1138:	width = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $416
JUMPV
LABELV $415
line 1139
;1139:	while (*s) {
line 1140
;1140:		ch = *s;
ADDRLP4 0
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 1141
;1141:		if (ch == ' ') {
ADDRLP4 0
INDIRI4
CNSTI4 32
NEI4 $418
line 1142
;1142:			width += PROPB_SPACE_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 12
ADDI4
ASGNI4
line 1143
;1143:		} else if (ch >= 'A' && ch <= 'Z') {
ADDRGP4 $419
JUMPV
LABELV $418
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $420
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $420
line 1144
;1144:			width += propMapB[ch - 'A'][2] + PROPB_GAP_WIDTH;
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
line 1145
;1145:		}
LABELV $420
LABELV $419
line 1146
;1146:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1147
;1147:	}
LABELV $416
line 1139
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $415
line 1148
;1148:	width -= PROPB_GAP_WIDTH;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 4
SUBI4
ASGNI4
line 1150
;1149:
;1150:	switch (style & UI_FORMATMASK) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $425
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $427
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $428
ADDRGP4 $425
JUMPV
LABELV $427
line 1152
;1151:	case UI_CENTER:
;1152:		x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1153
;1153:		break;
ADDRGP4 $425
JUMPV
LABELV $428
line 1156
;1154:
;1155:	case UI_RIGHT:
;1156:		x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 8
INDIRI4
SUBI4
ASGNI4
line 1157
;1157:		break;
line 1161
;1158:
;1159:	case UI_LEFT:
;1160:	default:
;1161:		break;
LABELV $425
line 1164
;1162:	}
;1163:
;1164:	if (style & UI_DROPSHADOW) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $430
line 1165
;1165:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
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
line 1166
;1166:		drawcolor[3]                               = color[3];
ADDRLP4 12+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1167
;1167:		UI_DrawBannerString2(x + 2, y + 2, str, drawcolor);
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
line 1168
;1168:	}
LABELV $430
line 1170
;1169:
;1170:	UI_DrawBannerString2(x, y, str, color);
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
line 1171
;1171:}
LABELV $414
endproc UI_DrawBannerString 40 16
export UI_ProportionalStringWidth
proc UI_ProportionalStringWidth 16 0
line 1173
;1172:
;1173:int UI_ProportionalStringWidth(const char* str) {
line 1179
;1174:	const char* s;
;1175:	int         ch;
;1176:	int         charWidth;
;1177:	int         width;
;1178:
;1179:	s     = str;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 1180
;1180:	width = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRGP4 $437
JUMPV
LABELV $436
line 1181
;1181:	while (*s) {
line 1182
;1182:		ch        = *s & 127;
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 127
BANDI4
ASGNI4
line 1183
;1183:		charWidth = propMap[ch][2];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
ASGNI4
line 1184
;1184:		if (charWidth != -1) {
ADDRLP4 4
INDIRI4
CNSTI4 -1
EQI4 $440
line 1185
;1185:			width += charWidth;
ADDRLP4 12
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 1186
;1186:			width += PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
ADDI4
ASGNI4
line 1187
;1187:		}
LABELV $440
line 1188
;1188:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1189
;1189:	}
LABELV $437
line 1181
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $436
line 1191
;1190:
;1191:	width -= PROP_GAP_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
SUBI4
ASGNI4
line 1192
;1192:	return width;
ADDRLP4 12
INDIRI4
RETI4
LABELV $435
endproc UI_ProportionalStringWidth 16 0
proc UI_DrawProportionalString2 48 36
line 1195
;1193:}
;1194:
;1195:static void UI_DrawProportionalString2(int x, int y, const char* str, vec4_t color, float sizeScale, qhandle_t charset) {
line 1208
;1196:	const char*   s;
;1197:	unsigned char ch;  // bk001204 - unsigned
;1198:	float         ax;
;1199:	float         ay;
;1200:	float         aw;
;1201:	float         ah;
;1202:	float         frow;
;1203:	float         fcol;
;1204:	float         fwidth;
;1205:	float         fheight;
;1206:
;1207:	// draw the colored text
;1208:	trap_R_SetColor(color);
ADDRFP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1210
;1209:
;1210:	ax = x * cgs.screenXScale + cgs.screenXBias;
ADDRLP4 12
ADDRFP4 0
INDIRI4
CVIF4 4
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRGP4 cgs+31444
INDIRF4
ADDF4
ASGNF4
line 1211
;1211:	ay = y * cgs.screenYScale + cgs.screenYBias;
ADDRLP4 36
ADDRFP4 4
INDIRI4
CVIF4 4
ADDRGP4 cgs+31436
INDIRF4
MULF4
ADDRGP4 cgs+31448
INDIRF4
ADDF4
ASGNF4
line 1213
;1212:
;1213:	s = str;
ADDRLP4 4
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $448
JUMPV
LABELV $447
line 1214
;1214:	while (*s) {
line 1215
;1215:		ch = *s & 127;
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
line 1216
;1216:		if (ch == ' ') {
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
NEI4 $450
line 1217
;1217:			aw = (float)PROP_SPACE_WIDTH * cgs.screenXScale * sizeScale;
ADDRLP4 8
ADDRGP4 cgs+31432
INDIRF4
CNSTF4 1090519040
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 1218
;1218:		} else if (propMap[ch][2] != -1) {
ADDRGP4 $451
JUMPV
LABELV $450
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 12
MULI4
ADDRGP4 propMap+8
ADDP4
INDIRI4
CNSTI4 -1
EQI4 $453
line 1219
;1219:			fcol    = (float)propMap[ch][0] / 256.0f;
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
line 1220
;1220:			frow    = (float)propMap[ch][1] / 256.0f;
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
line 1221
;1221:			fwidth  = (float)propMap[ch][2] / 256.0f;
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
line 1222
;1222:			fheight = (float)PROP_HEIGHT / 256.0f;
ADDRLP4 32
CNSTF4 1037565952
ASGNF4
line 1223
;1223:			aw      = (float)propMap[ch][2] * cgs.screenXScale * sizeScale;
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
ADDRGP4 cgs+31432
INDIRF4
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 1224
;1224:			ah      = (float)PROP_HEIGHT * cgs.screenXScale * sizeScale;
ADDRLP4 24
ADDRGP4 cgs+31432
INDIRF4
CNSTF4 1104674816
MULF4
ADDRFP4 16
INDIRF4
MULF4
ASGNF4
line 1225
;1225:			trap_R_DrawStretchPic(ax, ay, aw, ah, fcol, frow, fcol + fwidth, frow + fheight, charset);
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
line 1226
;1226:		} else {
ADDRGP4 $454
JUMPV
LABELV $453
line 1227
;1227:			aw = 0;
ADDRLP4 8
CNSTF4 0
ASGNF4
line 1228
;1228:		}
LABELV $454
LABELV $451
line 1230
;1229:
;1230:		ax += (aw + (float)PROP_GAP_WIDTH * cgs.screenXScale * sizeScale);
ADDRLP4 12
ADDRLP4 12
INDIRF4
ADDRLP4 8
INDIRF4
ADDRGP4 cgs+31432
INDIRF4
CNSTF4 1077936128
MULF4
ADDRFP4 16
INDIRF4
MULF4
ADDF4
ADDF4
ASGNF4
line 1231
;1231:		s++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1232
;1232:	}
LABELV $448
line 1214
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $447
line 1234
;1233:
;1234:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1235
;1235:}
LABELV $442
endproc UI_DrawProportionalString2 48 36
export UI_ProportionalSizeScale
proc UI_ProportionalSizeScale 0 0
line 1242
;1236:
;1237:/*
;1238:=================
;1239:UI_ProportionalSizeScale
;1240:=================
;1241:*/
;1242:float UI_ProportionalSizeScale(int style) {
line 1243
;1243:	if (style & UI_SMALLFONT) {
ADDRFP4 0
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $463
line 1244
;1244:		return 0.75;
CNSTF4 1061158912
RETF4
ADDRGP4 $462
JUMPV
LABELV $463
line 1247
;1245:	}
;1246:
;1247:	return 1.00;
CNSTF4 1065353216
RETF4
LABELV $462
endproc UI_ProportionalSizeScale 0 0
export UI_DrawProportionalString
proc UI_DrawProportionalString 44 24
line 1255
;1248:}
;1249:
;1250:/*
;1251:=================
;1252:UI_DrawProportionalString
;1253:=================
;1254:*/
;1255:void UI_DrawProportionalString(int x, int y, const char* str, int style, vec4_t color) {
line 1260
;1256:	vec4_t drawcolor;
;1257:	int    width;
;1258:	float  sizeScale;
;1259:
;1260:	sizeScale = UI_ProportionalSizeScale(style);
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
line 1262
;1261:
;1262:	switch (style & UI_FORMATMASK) {
ADDRLP4 28
ADDRFP4 12
INDIRI4
CNSTI4 7
BANDI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $467
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $469
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $470
ADDRGP4 $467
JUMPV
LABELV $469
line 1264
;1263:	case UI_CENTER:
;1264:		width = UI_ProportionalStringWidth(str) * sizeScale;
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
line 1265
;1265:		x -= width / 2;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
line 1266
;1266:		break;
ADDRGP4 $467
JUMPV
LABELV $470
line 1269
;1267:
;1268:	case UI_RIGHT:
;1269:		width = UI_ProportionalStringWidth(str) * sizeScale;
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
line 1270
;1270:		x -= width;
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRLP4 20
INDIRI4
SUBI4
ASGNI4
line 1271
;1271:		break;
line 1275
;1272:
;1273:	case UI_LEFT:
;1274:	default:
;1275:		break;
LABELV $467
line 1278
;1276:	}
;1277:
;1278:	if (style & UI_DROPSHADOW) {
ADDRFP4 12
INDIRI4
CNSTI4 2048
BANDI4
CNSTI4 0
EQI4 $472
line 1279
;1279:		drawcolor[0] = drawcolor[1] = drawcolor[2] = 0;
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
line 1280
;1280:		drawcolor[3]                               = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1281
;1281:		UI_DrawProportionalString2(x + 2, y + 2, str, drawcolor, sizeScale, cgs.media.charsetProp);
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
ADDRGP4 cgs+148692+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1282
;1282:	}
LABELV $472
line 1284
;1283:
;1284:	if (style & UI_INVERSE) {
ADDRFP4 12
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $479
line 1285
;1285:		drawcolor[0] = color[0] * 0.8;
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1286
;1286:		drawcolor[1] = color[1] * 0.8;
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1287
;1287:		drawcolor[2] = color[2] * 0.8;
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1288
;1288:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1289
;1289:		UI_DrawProportionalString2(x, y, str, drawcolor, sizeScale, cgs.media.charsetProp);
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
ADDRGP4 cgs+148692+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1290
;1290:		return;
ADDRGP4 $465
JUMPV
LABELV $479
line 1293
;1291:	}
;1292:
;1293:	if (style & UI_PULSE) {
ADDRFP4 12
INDIRI4
CNSTI4 16384
BANDI4
CNSTI4 0
EQI4 $486
line 1294
;1294:		drawcolor[0] = color[0] * 0.8;
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1295
;1295:		drawcolor[1] = color[1] * 0.8;
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1296
;1296:		drawcolor[2] = color[2] * 0.8;
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1061997773
MULF4
ASGNF4
line 1297
;1297:		drawcolor[3] = color[3];
ADDRLP4 0+12
ADDRFP4 16
INDIRP4
CNSTI4 12
ADDP4
INDIRF4
ASGNF4
line 1298
;1298:		UI_DrawProportionalString2(x, y, str, color, sizeScale, cgs.media.charsetProp);
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
ADDRGP4 cgs+148692+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1300
;1299:
;1300:		drawcolor[0] = color[0];
ADDRLP4 0
ADDRFP4 16
INDIRP4
INDIRF4
ASGNF4
line 1301
;1301:		drawcolor[1] = color[1];
ADDRLP4 0+4
ADDRFP4 16
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
ASGNF4
line 1302
;1302:		drawcolor[2] = color[2];
ADDRLP4 0+8
ADDRFP4 16
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
ASGNF4
line 1303
;1303:		drawcolor[3] = 0.5 + 0.5 * sin((cg.time % TMOD_075) / PULSE_DIVISOR);
ADDRGP4 cg+107604
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
line 1304
;1304:		UI_DrawProportionalString2(x, y, str, drawcolor, sizeScale, cgs.media.charsetPropGlow);
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
ADDRGP4 cgs+148692+8
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1305
;1305:		return;
ADDRGP4 $465
JUMPV
LABELV $486
line 1308
;1306:	}
;1307:
;1308:	UI_DrawProportionalString2(x, y, str, color, sizeScale, cgs.media.charsetProp);
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
ADDRGP4 cgs+148692+4
INDIRI4
ARGI4
ADDRGP4 UI_DrawProportionalString2
CALLV
pop
line 1309
;1309:}
LABELV $465
endproc UI_DrawProportionalString 44 24
bss
align 4
LABELV numbers
skip 11300
align 4
LABELV bigchars
skip 11300
import trap_R_AddLinearLightToScene
import trap_R_AddRefEntityToScene2
import linearLight
import intShaderTime
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
import CG_ForceModelChange
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
import CG_SetScoreCatcher
import CG_BuildSpectatorString
import CG_SetScoreSelection
import CG_RankRunFrame
import CG_EventHandling
import CG_MouseEvent
import CG_KeyEvent
import CG_LoadMenus
import CG_LastAttacker
import CG_CrosshairPlayer
import CG_UpdateCvars
import CG_StartMusic
import CG_Error
import CG_Printf
import CG_Argv
import CG_ConfigString
import eventnames
import phy_movetype
import cg_timerBest_y
import cg_timerBest_x
import cg_timerActive_y
import cg_timerActive_x
import cg_timerSkim_y
import cg_timerSkim_x
import cg_speed_y
import cg_speed_x
import cg_followKiller
import cg_fovAdjust
import cg_deadBodyDarken
import cg_teamColors
import cg_teamModel
import cg_enemyColors
import cg_enemyModel
import cg_hitSounds
import cg_trueLightning
import cg_oldPlasma
import cg_oldRocket
import cg_oldRail
import cg_noProjectileTrail
import cg_noTaunt
import cg_bigFont
import cg_smallFont
import cg_cameraMode
import cg_timescale
import cg_timescaleFadeSpeed
import cg_timescaleFadeEnd
import cg_cameraOrbitDelay
import cg_cameraOrbit
import cg_smoothClients
import cg_scorePlum
import cg_teamChatsOnly
import cg_drawFriend
import cg_deferPlayers
import cg_predictItems
import cg_blood
import cg_paused
import cg_buildScript
import cg_forceModel
import cg_stats
import cg_teamChatHeight
import cg_teamChatTime
import cg_drawSpeed
import cg_drawAttacker
import cg_lagometer
import cg_thirdPerson
import cg_thirdPersonAngle
import cg_thirdPersonRange
import cg_zoomFov
import cg_fov
import cg_simpleItems
import cg_ignore
import cg_autoswitch
import cg_tracerLength
import cg_tracerWidth
import cg_tracerChance
import cg_viewsize
import cg_drawGun
import cg_gun_z
import cg_gun_y
import cg_gun_x
import cg_gun_frame
import cg_brassTime
import cg_addMarks
import cg_footsteps
import cg_showmiss
import cg_noPlayerAnims
import cg_nopredict
import cg_errorDecay
import cg_railTrailRadius
import cg_railTrailTime
import cg_debugEvents
import cg_debugPosition
import cg_debugAnim
import cg_animSpeed
import cg_draw2D
import cg_drawStatus
import cg_crosshairHealth
import cg_crosshairSize
import cg_crosshairY
import cg_crosshairX
import cg_drawWeaponSelect
import cg_teamOverlayUserinfo
import cg_drawTeamOverlay
import cg_drawRewards
import cg_drawCrosshairNames
import cg_drawCrosshair
import cg_drawAmmoWarning
import cg_drawIcons
import cg_draw3dIcons
import cg_drawSnapshot
import cg_drawFPS
import cg_drawTimer
import cg_gibs
import cg_shadows
import cg_swingSpeed
import cg_bobroll
import cg_bobpitch
import cg_bobup
import cg_runroll
import cg_runpitch
import cg_centertime
import cg_markPolys
import cg_items
import cg_weapons
import cg_entities
import cg
import cgs
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
LABELV $234
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
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $233
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
byte 1 46
byte 1 99
byte 1 102
byte 1 103
byte 1 0
align 1
LABELV $231
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 108
byte 1 111
byte 1 97
byte 1 100
byte 1 101
byte 1 100
byte 1 32
byte 1 119
byte 1 105
byte 1 116
byte 1 104
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 115
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $212
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 50
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $209
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 115
byte 1 112
byte 1 97
byte 1 99
byte 1 101
byte 1 49
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $206
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 120
byte 1 45
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $203
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 120
byte 1 45
byte 1 111
byte 1 102
byte 1 102
byte 1 115
byte 1 101
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $200
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 121
byte 1 48
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $197
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 120
byte 1 48
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $194
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 98
byte 1 97
byte 1 100
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 32
byte 1 105
byte 1 110
byte 1 100
byte 1 101
byte 1 120
byte 1 32
byte 1 37
byte 1 105
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $182
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 110
byte 1 111
byte 1 32
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 32
byte 1 115
byte 1 112
byte 1 101
byte 1 99
byte 1 105
byte 1 102
byte 1 105
byte 1 101
byte 1 100
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 115
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $179
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 32
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $176
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 99
byte 1 104
byte 1 97
byte 1 114
byte 1 32
byte 1 119
byte 1 105
byte 1 100
byte 1 104
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $173
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 104
byte 1 101
byte 1 105
byte 1 103
byte 1 104
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $169
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 119
byte 1 105
byte 1 100
byte 1 116
byte 1 104
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $165
byte 1 102
byte 1 110
byte 1 116
byte 1 0
align 1
LABELV $162
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 32
byte 1 100
byte 1 111
byte 1 101
byte 1 115
byte 1 110
byte 1 39
byte 1 116
byte 1 32
byte 1 101
byte 1 120
byte 1 105
byte 1 115
byte 1 116
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $159
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 109
byte 1 97
byte 1 110
byte 1 121
byte 1 32
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 105
byte 1 109
byte 1 97
byte 1 103
byte 1 101
byte 1 115
byte 1 44
byte 1 32
byte 1 105
byte 1 103
byte 1 110
byte 1 111
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $156
byte 1 105
byte 1 109
byte 1 103
byte 1 0
align 1
LABELV $153
byte 1 94
byte 1 49
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 112
byte 1 97
byte 1 114
byte 1 115
byte 1 101
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 46
byte 1 10
byte 1 0
align 1
LABELV $147
byte 1 94
byte 1 51
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 102
byte 1 111
byte 1 110
byte 1 116
byte 1 32
byte 1 102
byte 1 105
byte 1 108
byte 1 101
byte 1 32
byte 1 105
byte 1 115
byte 1 32
byte 1 116
byte 1 111
byte 1 111
byte 1 32
byte 1 108
byte 1 111
byte 1 110
byte 1 103
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $144
byte 1 94
byte 1 51
byte 1 67
byte 1 71
byte 1 95
byte 1 76
byte 1 111
byte 1 97
byte 1 100
byte 1 70
byte 1 111
byte 1 110
byte 1 116
byte 1 58
byte 1 32
byte 1 101
byte 1 114
byte 1 114
byte 1 111
byte 1 114
byte 1 32
byte 1 111
byte 1 112
byte 1 101
byte 1 110
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
