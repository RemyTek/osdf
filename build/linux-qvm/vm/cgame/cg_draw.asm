data
export drawTeamOverlayModificationCount
align 4
LABELV drawTeamOverlayModificationCount
byte 4 -1
code
proc CG_DrawField 64 20
file "../../../../code/cgame/cg_draw.c"
line 177
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// cg_draw.c -- draw all of the graphical elements during
;4:// active (after loading) gameplay
;5:
;6:#include "cg_local.h"
;7:
;8:#ifdef MISSIONPACK
;9:#include "../ui/ui_shared.h"
;10:
;11:// used for scoreboard
;12:extern displayContextDef_t cgDC;
;13:menuDef_t*                 menuScoreboard = NULL;
;14:#else
;15:int drawTeamOverlayModificationCount = -1;
;16:#endif
;17:
;18:int  sortedTeamPlayers[TEAM_MAXOVERLAY];
;19:int  numSortedTeamPlayers;
;20:
;21:char systemChat[256];
;22:char teamChat1[256];
;23:char teamChat2[256];
;24:
;25:#ifdef MISSIONPACK
;26:
;27:int CG_Text_Width(const char* text, float scale, int limit) {
;28:	int          count, len;
;29:	float        out;
;30:	glyphInfo_t* glyph;
;31:	float        useScale;
;32:	// FIXME: see ui_main.c, same problem
;33:	//	const unsigned char *s = text;
;34:	const char* s    = text;
;35:	fontInfo_t* font = &cgDC.Assets.textFont;
;36:	if (scale <= cg_smallFont.value) {
;37:		font = &cgDC.Assets.smallFont;
;38:	} else if (scale > cg_bigFont.value) {
;39:		font = &cgDC.Assets.bigFont;
;40:	}
;41:	useScale = scale * font->glyphScale;
;42:	out      = 0;
;43:	if (text) {
;44:		len = strlen(text);
;45:		if (limit > 0 && len > limit) {
;46:			len = limit;
;47:		}
;48:		count = 0;
;49:		while (s && *s && count < len) {
;50:			if (Q_IsColorString(s)) {
;51:				s += 2;
;52:				continue;
;53:			} else {
;54:				glyph = &font->glyphs[(int)*s];  // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;55:				out += glyph->xSkip;
;56:				s++;
;57:				count++;
;58:			}
;59:		}
;60:	}
;61:	return out * useScale;
;62:}
;63:
;64:int CG_Text_Height(const char* text, float scale, int limit) {
;65:	int          len, count;
;66:	float        max;
;67:	glyphInfo_t* glyph;
;68:	float        useScale;
;69:	// TTimo: FIXME
;70:	//	const unsigned char *s = text;
;71:	const char* s    = text;
;72:	fontInfo_t* font = &cgDC.Assets.textFont;
;73:	if (scale <= cg_smallFont.value) {
;74:		font = &cgDC.Assets.smallFont;
;75:	} else if (scale > cg_bigFont.value) {
;76:		font = &cgDC.Assets.bigFont;
;77:	}
;78:	useScale = scale * font->glyphScale;
;79:	max      = 0;
;80:	if (text) {
;81:		len = strlen(text);
;82:		if (limit > 0 && len > limit) {
;83:			len = limit;
;84:		}
;85:		count = 0;
;86:		while (s && *s && count < len) {
;87:			if (Q_IsColorString(s)) {
;88:				s += 2;
;89:				continue;
;90:			} else {
;91:				glyph = &font->glyphs[(int)*s];  // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;92:				if (max < glyph->height) {
;93:					max = glyph->height;
;94:				}
;95:				s++;
;96:				count++;
;97:			}
;98:		}
;99:	}
;100:	return max * useScale;
;101:}
;102:
;103:void CG_Text_PaintChar(float x, float y, float width, float height, float scale, float s, float t, float s2, float t2, qhandle_t hShader) {
;104:	float w, h;
;105:	w = width * scale;
;106:	h = height * scale;
;107:	CG_AdjustFrom640(&x, &y, &w, &h);
;108:	trap_R_DrawStretchPic(x, y, w, h, s, t, s2, t2, hShader);
;109:}
;110:
;111:void CG_Text_Paint(float x, float y, float scale, vec4_t color, const char* text, float adjust, int limit, int style) {
;112:	int          len, count;
;113:	vec4_t       newColor;
;114:	glyphInfo_t* glyph;
;115:	float        useScale;
;116:	fontInfo_t*  font = &cgDC.Assets.textFont;
;117:	if (scale <= cg_smallFont.value) {
;118:		font = &cgDC.Assets.smallFont;
;119:	} else if (scale > cg_bigFont.value) {
;120:		font = &cgDC.Assets.bigFont;
;121:	}
;122:	useScale = scale * font->glyphScale;
;123:	if (text) {
;124:		// TTimo: FIXME
;125:		//		const unsigned char *s = text;
;126:		const char* s = text;
;127:		trap_R_SetColor(color);
;128:		memcpy(&newColor[0], &color[0], sizeof(vec4_t));
;129:		len = strlen(text);
;130:		if (limit > 0 && len > limit) {
;131:			len = limit;
;132:		}
;133:		count = 0;
;134:		while (s && *s && count < len) {
;135:			glyph = &font->glyphs[(int)*s];  // TTimo: FIXME: getting nasty warnings without the cast, hopefully this doesn't break the VM build
;136:			                                 // int yadj = Assets.textFont.glyphs[text[i]].bottom + Assets.textFont.glyphs[text[i]].top;
;137:			// float yadj = scale * (Assets.textFont.glyphs[text[i]].imageHeight - Assets.textFont.glyphs[text[i]].height);
;138:			if (Q_IsColorString(s)) {
;139:				memcpy(newColor, g_color_table[ColorIndex(*(s + 1))], sizeof(newColor));
;140:				newColor[3] = color[3];
;141:				trap_R_SetColor(newColor);
;142:				s += 2;
;143:				continue;
;144:			} else {
;145:				float yadj = useScale * glyph->top;
;146:				if (style == ITEM_TEXTSTYLE_SHADOWED || style == ITEM_TEXTSTYLE_SHADOWEDMORE) {
;147:					int ofs       = style == ITEM_TEXTSTYLE_SHADOWED ? 1 : 2;
;148:					colorBlack[3] = newColor[3];
;149:					trap_R_SetColor(colorBlack);
;150:					CG_Text_PaintChar(
;151:						x + ofs, y - yadj + ofs, glyph->imageWidth, glyph->imageHeight, useScale, glyph->s, glyph->t, glyph->s2, glyph->t2, glyph->glyph);
;152:					colorBlack[3] = 1.0;
;153:					trap_R_SetColor(newColor);
;154:				}
;155:				CG_Text_PaintChar(x, y - yadj, glyph->imageWidth, glyph->imageHeight, useScale, glyph->s, glyph->t, glyph->s2, glyph->t2, glyph->glyph);
;156:				// CG_DrawPic(x, y - yadj, scale * cgDC.Assets.textFont.glyphs[text[i]].imageWidth, scale * cgDC.Assets.textFont.glyphs[text[i]].imageHeight,
;157:				// cgDC.Assets.textFont.glyphs[text[i]].glyph);
;158:				x += (glyph->xSkip * useScale) + adjust;
;159:				s++;
;160:				count++;
;161:			}
;162:		}
;163:		trap_R_SetColor(NULL);
;164:	}
;165:}
;166:
;167:#endif
;168:
;169:/*
;170:==============
;171:CG_DrawField
;172:
;173:Draws large numbers for status bar and powerups
;174:==============
;175:*/
;176:#ifndef MISSIONPACK
;177:static void CG_DrawField(int x, int y, int width, int value) {
line 182
;178:	char num[16], *ptr;
;179:	int  l;
;180:	int  frame;
;181:
;182:	if (width < 1) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $73
line 183
;183:		return;
ADDRGP4 $72
JUMPV
LABELV $73
line 187
;184:	}
;185:
;186:	// draw number string
;187:	if (width > 5) {
ADDRFP4 8
INDIRI4
CNSTI4 5
LEI4 $75
line 188
;188:		width = 5;
ADDRFP4 8
CNSTI4 5
ASGNI4
line 189
;189:	}
LABELV $75
line 191
;190:
;191:	switch (width) {
ADDRLP4 28
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
LTI4 $77
ADDRLP4 28
INDIRI4
CNSTI4 4
GTI4 $77
ADDRLP4 28
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $107-4
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $107
address $79
address $86
address $93
address $100
code
LABELV $79
line 193
;192:	case 1:
;193:		value = value > 9 ? 9 : value;
ADDRFP4 12
INDIRI4
CNSTI4 9
LEI4 $81
ADDRLP4 32
CNSTI4 9
ASGNI4
ADDRGP4 $82
JUMPV
LABELV $81
ADDRLP4 32
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $82
ADDRFP4 12
ADDRLP4 32
INDIRI4
ASGNI4
line 194
;194:		value = value < 0 ? 0 : value;
ADDRFP4 12
INDIRI4
CNSTI4 0
GEI4 $84
ADDRLP4 36
CNSTI4 0
ASGNI4
ADDRGP4 $85
JUMPV
LABELV $84
ADDRLP4 36
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $85
ADDRFP4 12
ADDRLP4 36
INDIRI4
ASGNI4
line 195
;195:		break;
ADDRGP4 $78
JUMPV
LABELV $86
line 197
;196:	case 2:
;197:		value = value > 99 ? 99 : value;
ADDRFP4 12
INDIRI4
CNSTI4 99
LEI4 $88
ADDRLP4 40
CNSTI4 99
ASGNI4
ADDRGP4 $89
JUMPV
LABELV $88
ADDRLP4 40
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $89
ADDRFP4 12
ADDRLP4 40
INDIRI4
ASGNI4
line 198
;198:		value = value < -9 ? -9 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -9
GEI4 $91
ADDRLP4 44
CNSTI4 -9
ASGNI4
ADDRGP4 $92
JUMPV
LABELV $91
ADDRLP4 44
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $92
ADDRFP4 12
ADDRLP4 44
INDIRI4
ASGNI4
line 199
;199:		break;
ADDRGP4 $78
JUMPV
LABELV $93
line 201
;200:	case 3:
;201:		value = value > 999 ? 999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 999
LEI4 $95
ADDRLP4 48
CNSTI4 999
ASGNI4
ADDRGP4 $96
JUMPV
LABELV $95
ADDRLP4 48
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $96
ADDRFP4 12
ADDRLP4 48
INDIRI4
ASGNI4
line 202
;202:		value = value < -99 ? -99 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -99
GEI4 $98
ADDRLP4 52
CNSTI4 -99
ASGNI4
ADDRGP4 $99
JUMPV
LABELV $98
ADDRLP4 52
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $99
ADDRFP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 203
;203:		break;
ADDRGP4 $78
JUMPV
LABELV $100
line 205
;204:	case 4:
;205:		value = value > 9999 ? 9999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 9999
LEI4 $102
ADDRLP4 56
CNSTI4 9999
ASGNI4
ADDRGP4 $103
JUMPV
LABELV $102
ADDRLP4 56
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $103
ADDRFP4 12
ADDRLP4 56
INDIRI4
ASGNI4
line 206
;206:		value = value < -999 ? -999 : value;
ADDRFP4 12
INDIRI4
CNSTI4 -999
GEI4 $105
ADDRLP4 60
CNSTI4 -999
ASGNI4
ADDRGP4 $106
JUMPV
LABELV $105
ADDRLP4 60
ADDRFP4 12
INDIRI4
ASGNI4
LABELV $106
ADDRFP4 12
ADDRLP4 60
INDIRI4
ASGNI4
line 207
;207:		break;
LABELV $77
LABELV $78
line 210
;208:	}
;209:
;210:	Com_sprintf(num, sizeof(num), "%i", value);
ADDRLP4 12
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $109
ARGP4
ADDRFP4 12
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 211
;211:	l = strlen(num);
ADDRLP4 12
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 32
INDIRI4
ASGNI4
line 212
;212:	if (l > width)
ADDRLP4 4
INDIRI4
ADDRFP4 8
INDIRI4
LEI4 $110
line 213
;213:		l = width;
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
LABELV $110
line 214
;214:	x += 2 + CHAR_WIDTH * (width - l);
ADDRFP4 0
ADDRFP4 0
INDIRI4
ADDRFP4 8
INDIRI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 5
LSHI4
CNSTI4 2
ADDI4
ADDI4
ASGNI4
line 216
;215:
;216:	ptr = num;
ADDRLP4 0
ADDRLP4 12
ASGNP4
ADDRGP4 $113
JUMPV
LABELV $112
line 217
;217:	while (*ptr && l) {
line 218
;218:		if (*ptr == '-')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 45
NEI4 $115
line 219
;219:			frame = STAT_MINUS;
ADDRLP4 8
CNSTI4 10
ASGNI4
ADDRGP4 $116
JUMPV
LABELV $115
line 221
;220:		else
;221:			frame = *ptr - '0';
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 48
SUBI4
ASGNI4
LABELV $116
line 223
;222:
;223:		CG_DrawPic(x, y, CHAR_WIDTH, CHAR_HEIGHT, cgs.media.numberShaders[frame]);
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 4
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+300
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 224
;224:		x += CHAR_WIDTH;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 32
ADDI4
ASGNI4
line 225
;225:		ptr++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 226
;226:		l--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 227
;227:	}
LABELV $113
line 217
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $119
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $112
LABELV $119
line 228
;228:}
LABELV $72
endproc CG_DrawField 64 20
export CG_Draw3DModel
proc CG_Draw3DModel 508 16
line 236
;229:#endif  // MISSIONPACK
;230:
;231:/*
;232:================
;233:CG_Draw3DModel
;234:================
;235:*/
;236:void CG_Draw3DModel(float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles) {
line 240
;237:	refdef_t    refdef;
;238:	refEntity_t ent;
;239:
;240:	if (!cg_draw3dIcons.integer || !cg_drawIcons.integer) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $125
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
NEI4 $121
LABELV $125
line 241
;241:		return;
ADDRGP4 $120
JUMPV
LABELV $121
line 244
;242:	}
;243:
;244:	CG_AdjustFrom640(&x, &y, &w, &h);
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
line 246
;245:
;246:	memset(&refdef, 0, sizeof(refdef));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 248
;247:
;248:	memset(&ent, 0, sizeof(ent));
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 249
;249:	AnglesToAxis(angles, ent.axis);
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 250
;250:	VectorCopy(origin, ent.origin);
ADDRLP4 368+68
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 251
;251:	ent.hModel     = model;
ADDRLP4 368+8
ADDRFP4 16
INDIRI4
ASGNI4
line 252
;252:	ent.customSkin = skin;
ADDRLP4 368+108
ADDRFP4 20
INDIRI4
ASGNI4
line 253
;253:	ent.renderfx   = RF_NOSHADOW;  // no stencil shadows
ADDRLP4 368+4
CNSTI4 64
ASGNI4
line 255
;254:
;255:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 257
;256:
;257:	AxisClear(refdef.viewaxis);
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 259
;258:
;259:	refdef.fov_x = 30;
ADDRLP4 0+16
CNSTF4 1106247680
ASGNF4
line 260
;260:	refdef.fov_y = 30;
ADDRLP4 0+20
CNSTF4 1106247680
ASGNF4
line 262
;261:
;262:	refdef.x      = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 263
;263:	refdef.y      = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 264
;264:	refdef.width  = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 265
;265:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 267
;266:
;267:	refdef.time = cg.time;
ADDRLP4 0+72
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 269
;268:
;269:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 270
;270:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 271
;271:	trap_R_RenderScene(&refdef);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 272
;272:}
LABELV $120
endproc CG_Draw3DModel 508 16
export CG_Draw3DModelColor
proc CG_Draw3DModelColor 544 16
line 279
;273:
;274:/*
;275:================
;276:CG_Draw3DModel
;277:================
;278:*/
;279:void CG_Draw3DModelColor(float x, float y, float w, float h, qhandle_t model, qhandle_t skin, vec3_t origin, vec3_t angles, vec3_t color) {
line 283
;280:	refdef_t    refdef;
;281:	refEntity_t ent;
;282:
;283:	if (!cg_draw3dIcons.integer || !cg_drawIcons.integer) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $145
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
NEI4 $141
LABELV $145
line 284
;284:		return;
ADDRGP4 $140
JUMPV
LABELV $141
line 287
;285:	}
;286:
;287:	CG_AdjustFrom640(&x, &y, &w, &h);
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
line 289
;288:
;289:	memset(&refdef, 0, sizeof(refdef));
ADDRLP4 0
ARGP4
CNSTI4 0
ARGI4
CNSTI4 368
ARGI4
ADDRGP4 memset
CALLP4
pop
line 291
;290:
;291:	memset(&ent, 0, sizeof(ent));
ADDRLP4 368
ARGP4
CNSTI4 0
ARGI4
CNSTI4 140
ARGI4
ADDRGP4 memset
CALLP4
pop
line 292
;292:	AnglesToAxis(angles, ent.axis);
ADDRFP4 28
INDIRP4
ARGP4
ADDRLP4 368+28
ARGP4
ADDRGP4 AnglesToAxis
CALLV
pop
line 293
;293:	VectorCopy(origin, ent.origin);
ADDRLP4 368+68
ADDRFP4 24
INDIRP4
INDIRB
ASGNB 12
line 294
;294:	ent.hModel     = model;
ADDRLP4 368+8
ADDRFP4 16
INDIRI4
ASGNI4
line 295
;295:	ent.customSkin = skin;
ADDRLP4 368+108
ADDRFP4 20
INDIRI4
ASGNI4
line 296
;296:	ent.renderfx   = RF_NOSHADOW;  // no stencil shadows
ADDRLP4 368+4
CNSTI4 64
ASGNI4
line 298
;297:
;298:	refdef.rdflags = RDF_NOWORLDMODEL;
ADDRLP4 0+76
CNSTI4 1
ASGNI4
line 300
;299:
;300:	AxisClear(refdef.viewaxis);
ADDRLP4 0+36
ARGP4
ADDRGP4 AxisClear
CALLV
pop
line 302
;301:
;302:	refdef.fov_x = 30;
ADDRLP4 0+16
CNSTF4 1106247680
ASGNF4
line 303
;303:	refdef.fov_y = 30;
ADDRLP4 0+20
CNSTF4 1106247680
ASGNF4
line 305
;304:
;305:	refdef.x      = x;
ADDRLP4 0
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 306
;306:	refdef.y      = y;
ADDRLP4 0+4
ADDRFP4 4
INDIRF4
CVFI4 4
ASGNI4
line 307
;307:	refdef.width  = w;
ADDRLP4 0+8
ADDRFP4 8
INDIRF4
CVFI4 4
ASGNI4
line 308
;308:	refdef.height = h;
ADDRLP4 0+12
ADDRFP4 12
INDIRF4
CVFI4 4
ASGNI4
line 310
;309:
;310:	refdef.time = cg.time;
ADDRLP4 0+72
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 312
;311:
;312:	ent.shaderRGBA[0] = color[0] * 255;
ADDRLP4 512
ADDRFP4 32
INDIRP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 516
CNSTF4 1325400064
ASGNF4
ADDRLP4 512
INDIRF4
ADDRLP4 516
INDIRF4
LTF4 $162
ADDRLP4 508
ADDRLP4 512
INDIRF4
ADDRLP4 516
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $163
JUMPV
LABELV $162
ADDRLP4 508
ADDRLP4 512
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $163
ADDRLP4 368+116
ADDRLP4 508
INDIRU4
CVUU1 4
ASGNU1
line 313
;313:	ent.shaderRGBA[1] = color[1] * 255;
ADDRLP4 524
ADDRFP4 32
INDIRP4
CNSTI4 4
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 528
CNSTF4 1325400064
ASGNF4
ADDRLP4 524
INDIRF4
ADDRLP4 528
INDIRF4
LTF4 $167
ADDRLP4 520
ADDRLP4 524
INDIRF4
ADDRLP4 528
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $168
JUMPV
LABELV $167
ADDRLP4 520
ADDRLP4 524
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $168
ADDRLP4 368+116+1
ADDRLP4 520
INDIRU4
CVUU1 4
ASGNU1
line 314
;314:	ent.shaderRGBA[2] = color[2] * 255;
ADDRLP4 536
ADDRFP4 32
INDIRP4
CNSTI4 8
ADDP4
INDIRF4
CNSTF4 1132396544
MULF4
ASGNF4
ADDRLP4 540
CNSTF4 1325400064
ASGNF4
ADDRLP4 536
INDIRF4
ADDRLP4 540
INDIRF4
LTF4 $172
ADDRLP4 532
ADDRLP4 536
INDIRF4
ADDRLP4 540
INDIRF4
SUBF4
CVFI4 4
CVIU4 4
CNSTU4 2147483648
ADDU4
ASGNU4
ADDRGP4 $173
JUMPV
LABELV $172
ADDRLP4 532
ADDRLP4 536
INDIRF4
CVFI4 4
CVIU4 4
ASGNU4
LABELV $173
ADDRLP4 368+116+2
ADDRLP4 532
INDIRU4
CVUU1 4
ASGNU1
line 315
;315:	ent.shaderRGBA[3] = 255;
ADDRLP4 368+116+3
CNSTU1 255
ASGNU1
line 317
;316:
;317:	trap_R_ClearScene();
ADDRGP4 trap_R_ClearScene
CALLV
pop
line 318
;318:	trap_R_AddRefEntityToScene(&ent);
ADDRLP4 368
ARGP4
ADDRGP4 trap_R_AddRefEntityToScene
CALLV
pop
line 319
;319:	trap_R_RenderScene(&refdef);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 320
;320:}
LABELV $140
endproc CG_Draw3DModelColor 544 16
export CG_DrawHead
proc CG_DrawHead 56 36
line 329
;321:
;322:/*
;323:================
;324:CG_DrawHead
;325:
;326:Used for both the status bar and the scoreboard
;327:================
;328:*/
;329:void CG_DrawHead(float x, float y, float w, float h, int clientNum, vec3_t headAngles) {
line 336
;330:	clipHandle_t  cm;
;331:	clientInfo_t* ci;
;332:	float         len;
;333:	vec3_t        origin;
;334:	vec3_t        mins, maxs;
;335:
;336:	ci = &cgs.clientinfo[clientNum];
ADDRLP4 0
ADDRFP4 16
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 338
;337:
;338:	if (cg_draw3dIcons.integer) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $178
line 339
;339:		cm = ci->headModel;
ADDRLP4 40
ADDRLP4 0
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ASGNI4
line 340
;340:		if (!cm) {
ADDRLP4 40
INDIRI4
CNSTI4 0
NEI4 $181
line 341
;341:			return;
ADDRGP4 $176
JUMPV
LABELV $181
line 345
;342:		}
;343:
;344:		// offset the origin y and z to center the head
;345:		trap_R_ModelBounds(cm, mins, maxs);
ADDRLP4 40
INDIRI4
ARGI4
ADDRLP4 16
ARGP4
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 347
;346:
;347:		origin[2] = -0.5 * (mins[2] + maxs[2]);
ADDRLP4 4+8
ADDRLP4 16+8
INDIRF4
ADDRLP4 28+8
INDIRF4
ADDF4
CNSTF4 3204448256
MULF4
ASGNF4
line 348
;348:		origin[1] = 0.5 * (mins[1] + maxs[1]);
ADDRLP4 4+4
ADDRLP4 16+4
INDIRF4
ADDRLP4 28+4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 352
;349:
;350:		// calculate distance so the head nearly fills the box
;351:		// assume heads are taller than wide
;352:		len       = 0.7 * (maxs[2] - mins[2]);
ADDRLP4 44
ADDRLP4 28+8
INDIRF4
ADDRLP4 16+8
INDIRF4
SUBF4
CNSTF4 1060320051
MULF4
ASGNF4
line 353
;353:		origin[0] = len / 0.268;  // len / tan( fov/2 )
ADDRLP4 4
ADDRLP4 44
INDIRF4
CNSTF4 1081003604
MULF4
ASGNF4
line 356
;354:
;355:		// allow per-model tweaking
;356:		VectorAdd(origin, ci->headOffset, origin);
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 400
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+4
ADDRLP4 4+4
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 404
ADDP4
INDIRF4
ADDF4
ASGNF4
ADDRLP4 4+8
ADDRLP4 4+8
INDIRF4
ADDRLP4 0
INDIRP4
CNSTI4 408
ADDP4
INDIRF4
ADDF4
ASGNF4
line 358
;357:
;358:		CG_Draw3DModelColor(x, y, w, h, ci->headModel, ci->headSkin, origin, headAngles, ci->headColor);
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
INDIRP4
CNSTI4 436
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRP4
CNSTI4 440
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRFP4 20
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
CNSTI4 1616
ADDP4
ARGP4
ADDRGP4 CG_Draw3DModelColor
CALLV
pop
line 359
;359:	} else if (cg_drawIcons.integer) {
ADDRGP4 $179
JUMPV
LABELV $178
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $195
line 360
;360:		trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 361
;361:		CG_DrawPic(x, y, w, h, ci->modelIcon);
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
INDIRP4
CNSTI4 444
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 362
;362:	}
LABELV $195
LABELV $179
line 365
;363:
;364:	// if they are deferred, draw a cross out
;365:	if (ci->deferred) {
ADDRLP4 0
INDIRP4
CNSTI4 384
ADDP4
INDIRI4
CNSTI4 0
EQI4 $198
line 366
;366:		trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 367
;367:		CG_DrawPic(x, y, w, h, cgs.media.deferShader);
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
ADDRGP4 cgs+148692+132
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 368
;368:	}
LABELV $198
line 369
;369:}
LABELV $176
endproc CG_DrawHead 56 36
export CG_DrawFlagModel
proc CG_DrawFlagModel 68 32
line 378
;370:
;371:/*
;372:================
;373:CG_DrawFlagModel
;374:
;375:Used for both the status bar and the scoreboard
;376:================
;377:*/
;378:void CG_DrawFlagModel(float x, float y, float w, float h, int team, qboolean force2D) {
line 385
;379:	qhandle_t cm;
;380:	float     len;
;381:	vec3_t    origin, angles;
;382:	vec3_t    mins, maxs;
;383:	qhandle_t handle;
;384:
;385:	if (!force2D && cg_draw3dIcons.integer) {
ADDRFP4 20
INDIRI4
CNSTI4 0
NEI4 $203
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
EQI4 $203
line 387
;386:
;387:		VectorClear(angles);
ADDRLP4 0
CNSTF4 0
ASGNF4
ADDRLP4 0+4
CNSTF4 0
ASGNF4
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 389
;388:
;389:		cm = cgs.media.redFlagModel;
ADDRLP4 48
ADDRGP4 cgs+148692+36
INDIRI4
ASGNI4
line 392
;390:
;391:		// offset the origin y and z to center the flag
;392:		trap_R_ModelBounds(cm, mins, maxs);
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRGP4 trap_R_ModelBounds
CALLV
pop
line 394
;393:
;394:		origin[2] = -0.5 * (mins[2] + maxs[2]);
ADDRLP4 12+8
ADDRLP4 24+8
INDIRF4
ADDRLP4 36+8
INDIRF4
ADDF4
CNSTF4 3204448256
MULF4
ASGNF4
line 395
;395:		origin[1] = 0.5 * (mins[1] + maxs[1]);
ADDRLP4 12+4
ADDRLP4 24+4
INDIRF4
ADDRLP4 36+4
INDIRF4
ADDF4
CNSTF4 1056964608
MULF4
ASGNF4
line 399
;396:
;397:		// calculate distance so the flag nearly fills the box
;398:		// assume heads are taller than wide
;399:		len       = 0.5 * (maxs[2] - mins[2]);
ADDRLP4 52
ADDRLP4 36+8
INDIRF4
ADDRLP4 24+8
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ASGNF4
line 400
;400:		origin[0] = len / 0.268;  // len / tan( fov/2 )
ADDRLP4 12
ADDRLP4 52
INDIRF4
CNSTF4 1081003604
MULF4
ASGNF4
line 402
;401:
;402:		angles[YAW] = 60 * sin((cg.time % TMOD_2000) / 2000.0);
ADDRGP4 cg+107604
INDIRI4
CNSTI4 5730265
MODI4
CVIF4 4
CNSTF4 973279855
MULF4
ARGF4
ADDRLP4 60
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 0+4
ADDRLP4 60
INDIRF4
CNSTF4 1114636288
MULF4
ASGNF4
line 403
;403:		;
line 405
;404:
;405:		if (team == TEAM_RED) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $220
line 406
;406:			handle = cgs.media.redFlagModel;
ADDRLP4 56
ADDRGP4 cgs+148692+36
INDIRI4
ASGNI4
line 407
;407:		} else if (team == TEAM_BLUE) {
ADDRGP4 $221
JUMPV
LABELV $220
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $224
line 408
;408:			handle = cgs.media.blueFlagModel;
ADDRLP4 56
ADDRGP4 cgs+148692+40
INDIRI4
ASGNI4
line 409
;409:		} else if (team == TEAM_FREE) {
ADDRGP4 $225
JUMPV
LABELV $224
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $202
line 410
;410:			handle = cgs.media.neutralFlagModel;
ADDRLP4 56
ADDRGP4 cgs+148692+44
INDIRI4
ASGNI4
line 411
;411:		} else {
line 412
;412:			return;
LABELV $229
LABELV $225
LABELV $221
line 414
;413:		}
;414:		CG_Draw3DModel(x, y, w, h, handle, 0, origin, angles);
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
ADDRLP4 56
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 12
ARGP4
ADDRLP4 0
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 415
;415:	} else if (cg_drawIcons.integer) {
ADDRGP4 $204
JUMPV
LABELV $203
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $232
line 418
;416:		gitem_t* item;
;417:
;418:		if (team == TEAM_RED) {
ADDRFP4 16
INDIRI4
CNSTI4 1
NEI4 $235
line 419
;419:			item = BG_FindItemForPowerup(PW_REDFLAG);
CNSTI4 7
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 64
INDIRP4
ASGNP4
line 420
;420:		} else if (team == TEAM_BLUE) {
ADDRGP4 $236
JUMPV
LABELV $235
ADDRFP4 16
INDIRI4
CNSTI4 2
NEI4 $237
line 421
;421:			item = BG_FindItemForPowerup(PW_BLUEFLAG);
CNSTI4 8
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 64
INDIRP4
ASGNP4
line 422
;422:		} else if (team == TEAM_FREE) {
ADDRGP4 $238
JUMPV
LABELV $237
ADDRFP4 16
INDIRI4
CNSTI4 0
NEI4 $202
line 423
;423:			item = BG_FindItemForPowerup(PW_NEUTRALFLAG);
CNSTI4 9
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 60
ADDRLP4 64
INDIRP4
ASGNP4
line 424
;424:		} else {
line 425
;425:			return;
LABELV $240
LABELV $238
LABELV $236
line 427
;426:		}
;427:		if (item) {
ADDRLP4 60
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $241
line 428
;428:			CG_DrawPic(x, y, w, h, cg_items[ITEM_INDEX(item)].icon);
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
ADDRLP4 60
INDIRP4
CVPU4 4
ADDRGP4 bg_itemlist
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 52
DIVI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 429
;429:		}
LABELV $241
line 430
;430:	}
LABELV $232
LABELV $204
line 431
;431:}
LABELV $202
endproc CG_DrawFlagModel 68 32
proc CG_DrawStatusBarHead 48 24
line 441
;432:
;433:/*
;434:================
;435:CG_DrawStatusBarHead
;436:
;437:================
;438:*/
;439:#ifndef MISSIONPACK
;440:
;441:static void CG_DrawStatusBarHead(float x) {
line 446
;442:	vec3_t angles;
;443:	float  size, stretch;
;444:	float  frac;
;445:
;446:	VectorClear(angles);
ADDRLP4 4
CNSTF4 0
ASGNF4
ADDRLP4 4+4
CNSTF4 0
ASGNF4
ADDRLP4 4+8
CNSTF4 0
ASGNF4
line 448
;447:
;448:	if (cg.damageTime && cg.time - cg.damageTime < DAMAGE_TIME) {
ADDRGP4 cg+117860
INDIRI4
CNSTI4 0
EQI4 $247
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117860
INDIRI4
SUBI4
CNSTI4 500
GEI4 $247
line 449
;449:		frac = (float)(cg.time - cg.damageTime) / DAMAGE_TIME;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117860
INDIRI4
SUBI4
CVIF4 4
CNSTF4 990057071
MULF4
ASGNF4
line 450
;450:		size = ICON_SIZE * 1.25 * (1.5 - frac * 0.5);
ADDRLP4 16
CNSTF4 1069547520
ADDRLP4 0
INDIRF4
CNSTF4 1056964608
MULF4
SUBF4
CNSTF4 1114636288
MULF4
ASGNF4
line 452
;451:
;452:		stretch = size - ICON_SIZE * 1.25;
ADDRLP4 20
ADDRLP4 16
INDIRF4
CNSTF4 1114636288
SUBF4
ASGNF4
line 454
;453:		// kick in the direction of damage
;454:		x -= stretch * 0.5 + cg.damageX * stretch * 0.5;
ADDRLP4 24
ADDRLP4 20
INDIRF4
ASGNF4
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 24
INDIRF4
CNSTF4 1056964608
MULF4
ADDRGP4 cg+117864
INDIRF4
ADDRLP4 24
INDIRF4
MULF4
CNSTF4 1056964608
MULF4
ADDF4
SUBF4
ASGNF4
line 456
;455:
;456:		cg.headStartYaw = 180 + cg.damageX * 45;
ADDRGP4 cg+117896
ADDRGP4 cg+117864
INDIRF4
CNSTF4 1110704128
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 458
;457:
;458:		cg.headEndYaw   = 180 + 20 * cos(crandom() * M_PI);
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1086918619
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+117884
ADDRLP4 32
INDIRF4
CNSTF4 1101004800
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 459
;459:		cg.headEndPitch = 5 * cos(crandom() * M_PI);
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1086918619
MULF4
ARGF4
ADDRLP4 40
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+117880
ADDRLP4 40
INDIRF4
CNSTF4 1084227584
MULF4
ASGNF4
line 461
;460:
;461:		cg.headStartTime = cg.time;
ADDRGP4 cg+117900
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 462
;462:		cg.headEndTime   = cg.time + 100 + random() * 2000;
ADDRLP4 44
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+117888
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ADDRLP4 44
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1031406068
MULF4
ADDF4
CVFI4 4
ASGNI4
line 463
;463:	} else {
ADDRGP4 $248
JUMPV
LABELV $247
line 464
;464:		if (cg.time >= cg.headEndTime) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117888
INDIRI4
LTI4 $263
line 466
;465:			// select a new head angle
;466:			cg.headStartYaw   = cg.headEndYaw;
ADDRGP4 cg+117896
ADDRGP4 cg+117884
INDIRF4
ASGNF4
line 467
;467:			cg.headStartPitch = cg.headEndPitch;
ADDRGP4 cg+117892
ADDRGP4 cg+117880
INDIRF4
ASGNF4
line 468
;468:			cg.headStartTime  = cg.headEndTime;
ADDRGP4 cg+117900
ADDRGP4 cg+117888
INDIRI4
ASGNI4
line 469
;469:			cg.headEndTime    = cg.time + 100 + random() * 2000;
ADDRLP4 24
ADDRGP4 rand
CALLI4
ASGNI4
ADDRGP4 cg+117888
ADDRGP4 cg+107604
INDIRI4
CNSTI4 100
ADDI4
CVIF4 4
ADDRLP4 24
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 1031406068
MULF4
ADDF4
CVFI4 4
ASGNI4
line 471
;470:
;471:			cg.headEndYaw   = 180 + 20 * cos(crandom() * M_PI);
ADDRLP4 28
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1086918619
MULF4
ARGF4
ADDRLP4 32
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+117884
ADDRLP4 32
INDIRF4
CNSTF4 1101004800
MULF4
CNSTF4 1127481344
ADDF4
ASGNF4
line 472
;472:			cg.headEndPitch = 5 * cos(crandom() * M_PI);
ADDRLP4 36
ADDRGP4 rand
CALLI4
ASGNI4
ADDRLP4 36
INDIRI4
CNSTI4 32767
BANDI4
CVIF4 4
CNSTF4 939524352
MULF4
CNSTF4 1056964608
SUBF4
CNSTF4 1086918619
MULF4
ARGF4
ADDRLP4 40
ADDRGP4 cos
CALLF4
ASGNF4
ADDRGP4 cg+117880
ADDRLP4 40
INDIRF4
CNSTF4 1084227584
MULF4
ASGNF4
line 473
;473:		}
LABELV $263
line 475
;474:
;475:		size = ICON_SIZE * 1.25;
ADDRLP4 16
CNSTF4 1114636288
ASGNF4
line 476
;476:	}
LABELV $248
line 479
;477:
;478:	// if the server was frozen for a while we may have a bad head start time
;479:	if (cg.headStartTime > cg.time) {
ADDRGP4 cg+117900
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $277
line 480
;480:		cg.headStartTime = cg.time;
ADDRGP4 cg+117900
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 481
;481:	}
LABELV $277
line 483
;482:
;483:	frac          = (cg.time - cg.headStartTime) / (float)(cg.headEndTime - cg.headStartTime);
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117900
INDIRI4
SUBI4
CVIF4 4
ADDRGP4 cg+117888
INDIRI4
ADDRGP4 cg+117900
INDIRI4
SUBI4
CVIF4 4
DIVF4
ASGNF4
line 484
;484:	frac          = frac * frac * (3 - 2 * frac);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 0
INDIRF4
MULF4
CNSTF4 1077936128
ADDRLP4 0
INDIRF4
CNSTF4 1073741824
MULF4
SUBF4
MULF4
ASGNF4
line 485
;485:	angles[YAW]   = cg.headStartYaw + (cg.headEndYaw - cg.headStartYaw) * frac;
ADDRLP4 4+4
ADDRGP4 cg+117896
INDIRF4
ADDRGP4 cg+117884
INDIRF4
ADDRGP4 cg+117896
INDIRF4
SUBF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 486
;486:	angles[PITCH] = cg.headStartPitch + (cg.headEndPitch - cg.headStartPitch) * frac;
ADDRLP4 4
ADDRGP4 cg+117892
INDIRF4
ADDRGP4 cg+117880
INDIRF4
ADDRGP4 cg+117892
INDIRF4
SUBF4
ADDRLP4 0
INDIRF4
MULF4
ADDF4
ASGNF4
line 488
;487:
;488:	CG_DrawHead(x, cgs.screenYmax + 1 - size, size, size, cg.snap->ps.clientNum, angles);
ADDRFP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 489
;489:}
LABELV $244
endproc CG_DrawStatusBarHead 48 24
proc CG_DrawStatusBarFlag 0 24
line 499
;490:#endif  // MISSIONPACK
;491:
;492:/*
;493:================
;494:CG_DrawStatusBarFlag
;495:
;496:================
;497:*/
;498:#ifndef MISSIONPACK
;499:static void CG_DrawStatusBarFlag(float x, int team) {
line 500
;500:	CG_DrawFlagModel(x, cgs.screenYmax + 1 - ICON_SIZE, ICON_SIZE, ICON_SIZE, team, qfalse);
ADDRFP4 0
INDIRF4
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRFP4 4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawFlagModel
CALLV
pop
line 501
;501:}
LABELV $296
endproc CG_DrawStatusBarFlag 0 24
export CG_DrawTeamBackground
proc CG_DrawTeamBackground 16 20
line 510
;502:#endif  // MISSIONPACK
;503:
;504:/*
;505:================
;506:CG_DrawTeamBackground
;507:
;508:================
;509:*/
;510:void CG_DrawTeamBackground(int x, int y, int w, int h, float alpha, int team) {
line 513
;511:	vec4_t hcolor;
;512:
;513:	hcolor[3] = alpha;
ADDRLP4 0+12
ADDRFP4 16
INDIRF4
ASGNF4
line 514
;514:	if (team == TEAM_RED) {
ADDRFP4 20
INDIRI4
CNSTI4 1
NEI4 $300
line 515
;515:		hcolor[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 516
;516:		hcolor[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 517
;517:		hcolor[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 518
;518:	} else if (team == TEAM_BLUE) {
ADDRGP4 $301
JUMPV
LABELV $300
ADDRFP4 20
INDIRI4
CNSTI4 2
NEI4 $298
line 519
;519:		hcolor[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 520
;520:		hcolor[1] = 0.1f;
ADDRLP4 0+4
CNSTF4 1036831949
ASGNF4
line 521
;521:		hcolor[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 522
;522:	} else {
line 523
;523:		return;
LABELV $305
LABELV $301
line 525
;524:	}
;525:	trap_R_SetColor(hcolor);
ADDRLP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 526
;526:	CG_DrawPic(x, y, w, h, cgs.media.teamStatusBar);
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
ADDRGP4 cgs+148692+128
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 527
;527:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 528
;528:}
LABELV $298
endproc CG_DrawTeamBackground 16 20
data
align 4
LABELV $311
byte 4 1065353216
byte 4 1060152279
byte 4 0
byte 4 1065353216
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
byte 4 1056964608
byte 4 1056964608
byte 4 1056964608
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
byte 4 1065353216
code
proc CG_DrawStatusBar 72 32
line 537
;529:
;530:/*
;531:================
;532:CG_DrawStatusBar
;533:================
;534:*/
;535:#ifndef MISSIONPACK
;536:#define STATUSBAR_HEIGHT 60
;537:static void CG_DrawStatusBar(void) {
line 557
;538:	int            color;
;539:	centity_t*     cent;
;540:	playerState_t* ps;
;541:	int            value;
;542:	vec4_t         hcolor;
;543:	vec3_t         angles;
;544:	vec3_t         origin;
;545:	float          y;
;546:#ifdef MISSIONPACK
;547:	qhandle_t handle;
;548:#endif
;549:	static float colors[4][4] = {
;550:  //		{ 0.2, 1.0, 0.2, 1.0 } , { 1.0, 0.2, 0.2, 1.0 }, {0.5, 0.5, 0.5, 1} };
;551:		{1.0f, 0.69f, 0.0f, 1.0f}, // normal
;552:		{1.0f, 0.2f,  0.2f, 1.0f}, // low health
;553:		{0.5f, 0.5f,  0.5f, 1.0f}, // weapon firing
;554:		{1.0f, 1.0f,  1.0f, 1.0f}
;555:    };  // health > 100
;556:
;557:	if (cg_drawStatus.integer == 0) {
ADDRGP4 cg_drawStatus+12
INDIRI4
CNSTI4 0
NEI4 $312
line 558
;558:		return;
ADDRGP4 $310
JUMPV
LABELV $312
line 562
;559:	}
;560:
;561:	// draw the team background
;562:	CG_DrawTeamBackground(
ADDRGP4 cgs+31452
INDIRF4
CVFI4 4
ARGI4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1114636288
SUBF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ARGI4
ADDRGP4 cgs+31456
INDIRF4
ADDRGP4 cgs+31452
INDIRF4
SUBF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ARGI4
CNSTI4 60
ARGI4
CNSTF4 1051260355
ARGF4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawTeamBackground
CALLV
pop
line 565
;563:		cgs.screenXmin, cgs.screenYmax - STATUSBAR_HEIGHT + 1, cgs.screenXmax - cgs.screenXmin + 1, STATUSBAR_HEIGHT, 0.33f, cg.snap->ps.persistant[PERS_TEAM]);
;564:
;565:	y = cgs.screenYmax + 1 - ICON_SIZE;
ADDRLP4 24
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 567
;566:
;567:	cent = &cg_entities[cg.snap->ps.clientNum];
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities
ADDP4
ASGNP4
line 568
;568:	ps   = &cg.snap->ps;
ADDRLP4 20
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 570
;569:
;570:	VectorClear(angles);
ADDRLP4 8
CNSTF4 0
ASGNF4
ADDRLP4 8+4
CNSTF4 0
ASGNF4
ADDRLP4 8+8
CNSTF4 0
ASGNF4
line 573
;571:
;572:	// draw any 3D icons first, so the changes back to 2D are minimized
;573:	if (cent->currentState.weapon && cg_weapons[cent->currentState.weapon].ammoModel) {
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $325
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+76
ADDP4
INDIRI4
CNSTI4 0
EQI4 $325
line 574
;574:		origin[0]   = 70;
ADDRLP4 28
CNSTF4 1116471296
ASGNF4
line 575
;575:		origin[1]   = 0;
ADDRLP4 28+4
CNSTF4 0
ASGNF4
line 576
;576:		origin[2]   = 0;
ADDRLP4 28+8
CNSTF4 0
ASGNF4
line 577
;577:		angles[YAW] = 90 + 20 * sin((cg.time % TMOD_1000) / 1000.0);
ADDRGP4 cg+107604
INDIRI4
CNSTI4 5730265
MODI4
CVIF4 4
CNSTF4 981668463
MULF4
ARGF4
ADDRLP4 64
ADDRGP4 sin
CALLF4
ASGNF4
ADDRLP4 8+4
ADDRLP4 64
INDIRF4
CNSTF4 1101004800
MULF4
CNSTF4 1119092736
ADDF4
ASGNF4
line 578
;578:		CG_Draw3DModel(CHAR_WIDTH * 3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE, cg_weapons[cent->currentState.weapon].ammoModel, 0, origin, angles);
CNSTF4 1120403456
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+76
ADDP4
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 28
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 579
;579:	}
LABELV $325
line 581
;580:
;581:	CG_DrawStatusBarHead(185 + CHAR_WIDTH * 3 + TEXT_ICON_SPACE);
CNSTF4 1133412352
ARGF4
ADDRGP4 CG_DrawStatusBarHead
CALLV
pop
line 583
;582:
;583:	if (cg.predictedPlayerState.powerups[PW_REDFLAG]) {
ADDRGP4 cg+107636+312+28
INDIRI4
CNSTI4 0
EQI4 $333
line 584
;584:		CG_DrawStatusBarFlag(185 + CHAR_WIDTH * 3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_RED);
CNSTF4 1134985216
ARGF4
CNSTI4 1
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 585
;585:	} else if (cg.predictedPlayerState.powerups[PW_BLUEFLAG]) {
ADDRGP4 $334
JUMPV
LABELV $333
ADDRGP4 cg+107636+312+32
INDIRI4
CNSTI4 0
EQI4 $338
line 586
;586:		CG_DrawStatusBarFlag(185 + CHAR_WIDTH * 3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_BLUE);
CNSTF4 1134985216
ARGF4
CNSTI4 2
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 587
;587:	} else if (cg.predictedPlayerState.powerups[PW_NEUTRALFLAG]) {
ADDRGP4 $339
JUMPV
LABELV $338
ADDRGP4 cg+107636+312+36
INDIRI4
CNSTI4 0
EQI4 $343
line 588
;588:		CG_DrawStatusBarFlag(185 + CHAR_WIDTH * 3 + TEXT_ICON_SPACE + ICON_SIZE, TEAM_FREE);
CNSTF4 1134985216
ARGF4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawStatusBarFlag
CALLV
pop
line 589
;589:	}
LABELV $343
LABELV $339
LABELV $334
line 591
;590:
;591:	if (ps->stats[STAT_ARMOR]) {
ADDRLP4 20
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
CNSTI4 0
EQI4 $348
line 592
;592:		origin[0]   = 90;
ADDRLP4 28
CNSTF4 1119092736
ASGNF4
line 593
;593:		origin[1]   = 0;
ADDRLP4 28+4
CNSTF4 0
ASGNF4
line 594
;594:		origin[2]   = -10;
ADDRLP4 28+8
CNSTF4 3240099840
ASGNF4
line 595
;595:		angles[YAW] = (cg.time & 2047) * 360 / 2048.0;
ADDRLP4 8+4
ADDRGP4 cg+107604
INDIRI4
CNSTI4 2047
BANDI4
CNSTI4 360
MULI4
CVIF4 4
CNSTF4 973078528
MULF4
ASGNF4
line 596
;596:		CG_Draw3DModel(370 + CHAR_WIDTH * 3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE, cgs.media.armorModel, 0, origin, angles);
CNSTF4 1139474432
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRGP4 cgs+148692+120
INDIRI4
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 28
ARGP4
ADDRLP4 8
ARGP4
ADDRGP4 CG_Draw3DModel
CALLV
pop
line 597
;597:	}
LABELV $348
line 615
;598:#ifdef MISSIONPACK
;599:	if (cgs.gametype == GT_HARVESTER) {
;600:		origin[0]   = 90;
;601:		origin[1]   = 0;
;602:		origin[2]   = -10;
;603:		angles[YAW] = (cg.time & 2047) * 360 / 2048.0;
;604:		if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
;605:			handle = cgs.media.redCubeModel;
;606:		} else {
;607:			handle = cgs.media.blueCubeModel;
;608:		}
;609:		CG_Draw3DModel(640 - (TEXT_ICON_SPACE + ICON_SIZE), 416, ICON_SIZE, ICON_SIZE, handle, 0, origin, angles);
;610:	}
;611:#endif
;612:	//
;613:	// ammo
;614:	//
;615:	if (cent->currentState.weapon) {
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 0
EQI4 $356
line 616
;616:		value = ps->ammo[cent->currentState.weapon];
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 192
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 20
INDIRP4
CNSTI4 376
ADDP4
ADDP4
INDIRI4
ASGNI4
line 617
;617:		if (value > -1) {
ADDRLP4 0
INDIRI4
CNSTI4 -1
LEI4 $358
line 618
;618:			if (cg.predictedPlayerState.weaponstate == WEAPON_FIRING && cg.predictedPlayerState.weaponTime > 100) {
ADDRGP4 cg+107636+148
INDIRI4
CNSTI4 3
NEI4 $360
ADDRGP4 cg+107636+44
INDIRI4
CNSTI4 100
LEI4 $360
line 620
;619:				// draw as dark grey when reloading
;620:				color = 2;  // dark grey
ADDRLP4 40
CNSTI4 2
ASGNI4
line 621
;621:			} else {
ADDRGP4 $361
JUMPV
LABELV $360
line 622
;622:				if (value >= 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $366
line 623
;623:					color = 0;  // yellow
ADDRLP4 40
CNSTI4 0
ASGNI4
line 624
;624:				} else {
ADDRGP4 $367
JUMPV
LABELV $366
line 625
;625:					color = 1;  // red
ADDRLP4 40
CNSTI4 1
ASGNI4
line 626
;626:				}
LABELV $367
line 627
;627:			}
LABELV $361
line 629
;628:#ifdef USE_NEW_FONT_RENDERER
;629:			CG_SelectFont(1);
CNSTI4 1
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 630
;630:			CG_DrawString(CHAR_WIDTH * 3, y, va("%i", value), colors[color], CHAR_WIDTH, CHAR_HEIGHT, 0, DS_RIGHT | DS_PROPORTIONAL);
ADDRGP4 $109
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1119879168
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $311
ADDP4
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 631
;631:			CG_SelectFont(0);
CNSTI4 0
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 636
;632:#else
;633:			trap_R_SetColor(colors[color]);
;634:			CG_DrawField(0, y, 3, value);
;635:#endif
;636:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 639
;637:
;638:			// if we didn't draw a 3D icon, draw a 2D icon for ammo
;639:			if (!cg_draw3dIcons.integer && cg_drawIcons.integer) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
NEI4 $368
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $368
line 642
;640:				qhandle_t icon;
;641:
;642:				icon = cg_weapons[cg.predictedPlayerState.weapon].ammoIcon;
ADDRLP4 68
ADDRGP4 cg+107636+144
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+72
ADDP4
INDIRI4
ASGNI4
line 643
;643:				if (icon) {
ADDRLP4 68
INDIRI4
CNSTI4 0
EQI4 $375
line 644
;644:					CG_DrawPic(CHAR_WIDTH * 3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE, icon);
CNSTF4 1120403456
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 68
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 645
;645:				}
LABELV $375
line 646
;646:			}
LABELV $368
line 647
;647:		}
LABELV $358
line 648
;648:	}
LABELV $356
line 653
;649:
;650:	//
;651:	// health
;652:	//
;653:	value = ps->stats[STAT_HEALTH];
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 654
;654:	if (value > 100) {
ADDRLP4 0
INDIRI4
CNSTI4 100
LEI4 $377
line 655
;655:		color = 3;  // white
ADDRLP4 40
CNSTI4 3
ASGNI4
line 656
;656:	} else if (value > 25) {
ADDRGP4 $378
JUMPV
LABELV $377
ADDRLP4 0
INDIRI4
CNSTI4 25
LEI4 $379
line 657
;657:		color = 0;  // yellow
ADDRLP4 40
CNSTI4 0
ASGNI4
line 658
;658:	} else if (value > 0) {
ADDRGP4 $380
JUMPV
LABELV $379
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $381
line 659
;659:		color = (cg.time >> 8) & 1;  // red/yellow flashing
ADDRLP4 40
ADDRGP4 cg+107604
INDIRI4
CNSTI4 8
RSHI4
CNSTI4 1
BANDI4
ASGNI4
line 660
;660:	} else {
ADDRGP4 $382
JUMPV
LABELV $381
line 661
;661:		color = 1;  // red
ADDRLP4 40
CNSTI4 1
ASGNI4
line 662
;662:	}
LABELV $382
LABELV $380
LABELV $378
line 665
;663:
;664:#ifdef USE_NEW_FONT_RENDERER
;665:	CG_SelectFont(1);
CNSTI4 1
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 666
;666:	CG_DrawString(185 + CHAR_WIDTH * 3, y, va("%i", value), colors[color], CHAR_WIDTH, CHAR_HEIGHT, 0, DS_RIGHT | DS_PROPORTIONAL);
ADDRGP4 $109
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1133281280
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 64
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $311
ADDP4
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 667
;667:	CG_SelectFont(0);
CNSTI4 0
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 674
;668:#else
;669:	trap_R_SetColor(colors[color]);
;670:	// stretch the health up when taking damage
;671:	CG_DrawField(185, y, 3, value);
;672:#endif
;673:
;674:	CG_ColorForHealth(hcolor);
ADDRLP4 44
ARGP4
ADDRGP4 CG_ColorForHealth
CALLV
pop
line 675
;675:	trap_R_SetColor(hcolor);
ADDRLP4 44
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 680
;676:
;677:	//
;678:	// armor
;679:	//
;680:	value = ps->stats[STAT_ARMOR];
ADDRLP4 0
ADDRLP4 20
INDIRP4
CNSTI4 196
ADDP4
INDIRI4
ASGNI4
line 681
;681:	if (value > 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $384
line 683
;682:#ifdef USE_NEW_FONT_RENDERER
;683:		CG_SelectFont(1);
CNSTI4 1
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 684
;684:		CG_DrawString(370 + CHAR_WIDTH * 3, y, va("%i", value), colors[color], CHAR_WIDTH, CHAR_HEIGHT, 0, DS_RIGHT | DS_PROPORTIONAL);
ADDRGP4 $109
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 68
ADDRGP4 va
CALLP4
ASGNP4
CNSTF4 1139343360
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 68
INDIRP4
ARGP4
ADDRLP4 40
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $311
ADDP4
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 685
;685:		CG_SelectFont(0);
CNSTI4 0
ARGI4
ADDRGP4 CG_SelectFont
CALLV
pop
line 690
;686:#else
;687:		trap_R_SetColor(colors[0]);
;688:		CG_DrawField(370, y, 3, value);
;689:#endif
;690:		trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 692
;691:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;692:		if (!cg_draw3dIcons.integer && cg_drawIcons.integer) {
ADDRGP4 cg_draw3dIcons+12
INDIRI4
CNSTI4 0
NEI4 $386
ADDRGP4 cg_drawIcons+12
INDIRI4
CNSTI4 0
EQI4 $386
line 693
;693:			CG_DrawPic(370 + CHAR_WIDTH * 3 + TEXT_ICON_SPACE, y, ICON_SIZE, ICON_SIZE, cgs.media.armorIcon);
CNSTF4 1139474432
ARGF4
ADDRLP4 24
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRGP4 cgs+148692+124
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 694
;694:		}
LABELV $386
line 695
;695:	}
LABELV $384
line 720
;696:
;697:#ifdef MISSIONPACK
;698:	//
;699:	// cubes
;700:	//
;701:	if (cgs.gametype == GT_HARVESTER) {
;702:		value = ps->generic1;
;703:		if (value > 99) {
;704:			value = 99;
;705:		}
;706:		trap_R_SetColor(colors[0]);
;707:		CG_DrawField(640 - (CHAR_WIDTH * 2 + TEXT_ICON_SPACE + ICON_SIZE), y, 2, value);
;708:		trap_R_SetColor(NULL);
;709:		// if we didn't draw a 3D icon, draw a 2D icon for armor
;710:		if (!cg_draw3dIcons.integer && cg_drawIcons.integer) {
;711:			if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
;712:				handle = cgs.media.redCubeIcon;
;713:			} else {
;714:				handle = cgs.media.blueCubeIcon;
;715:			}
;716:			CG_DrawPic(640 - (TEXT_ICON_SPACE + ICON_SIZE), y, ICON_SIZE, ICON_SIZE, handle);
;717:		}
;718:	}
;719:#endif
;720:}
LABELV $310
endproc CG_DrawStatusBar 72 32
proc CG_DrawAttacker 64 32
line 737
;721:#endif
;722:
;723:/*
;724:===========================================================================================
;725:
;726:  UPPER RIGHT CORNER
;727:
;728:===========================================================================================
;729:*/
;730:
;731:/*
;732:================
;733:CG_DrawAttacker
;734:
;735:================
;736:*/
;737:static float CG_DrawAttacker(float y) {
line 746
;738:	int         t;
;739:	float       size;
;740:	vec3_t      angles;
;741:	const char* info;
;742:	const char* name;
;743:	int         clientNum;
;744:	vec4_t      color;
;745:
;746:	if (cg.predictedPlayerState.stats[STAT_HEALTH] <= 0) {
ADDRGP4 cg+107636+184
INDIRI4
CNSTI4 0
GTI4 $393
line 747
;747:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $392
JUMPV
LABELV $393
line 750
;748:	}
;749:
;750:	if (!cg.attackerTime) {
ADDRGP4 cg+117588
INDIRI4
CNSTI4 0
NEI4 $397
line 751
;751:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $392
JUMPV
LABELV $397
line 754
;752:	}
;753:
;754:	clientNum = cg.predictedPlayerState.persistant[PERS_ATTACKER];
ADDRLP4 0
ADDRGP4 cg+107636+248+24
INDIRI4
ASGNI4
line 755
;755:	if (clientNum < 0 || clientNum >= MAX_CLIENTS || clientNum == cg.snap->ps.clientNum) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $407
ADDRLP4 0
INDIRI4
CNSTI4 64
GEI4 $407
ADDRLP4 0
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
NEI4 $403
LABELV $407
line 756
;756:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $392
JUMPV
LABELV $403
line 759
;757:	}
;758:
;759:	t = cg.time - cg.attackerTime;
ADDRLP4 36
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117588
INDIRI4
SUBI4
ASGNI4
line 760
;760:	if (t > ATTACKER_HEAD_TIME) {
ADDRLP4 36
INDIRI4
CNSTI4 10000
LEI4 $410
line 761
;761:		cg.attackerTime = 0;
ADDRGP4 cg+117588
CNSTI4 0
ASGNI4
line 762
;762:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $392
JUMPV
LABELV $410
line 765
;763:	}
;764:
;765:	size = ICON_SIZE * 1.25;
ADDRLP4 4
CNSTF4 1114636288
ASGNF4
line 767
;766:
;767:	angles[PITCH] = 0;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 768
;768:	angles[YAW]   = 180;
ADDRLP4 24+4
CNSTF4 1127481344
ASGNF4
line 769
;769:	angles[ROLL]  = 0;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 770
;770:	CG_DrawHead(cgs.screenXmax + 1 - size, y, size, size, clientNum, angles);
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 4
INDIRF4
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 CG_DrawHead
CALLV
pop
line 772
;771:
;772:	info = CG_ConfigString(CS_PLAYERS + clientNum);
ADDRLP4 0
INDIRI4
CNSTI4 544
ADDI4
ARGI4
ADDRLP4 56
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 40
ADDRLP4 56
INDIRP4
ASGNP4
line 773
;773:	name = Info_ValueForKey(info, "n");
ADDRLP4 40
INDIRP4
ARGP4
ADDRGP4 $416
ARGP4
ADDRLP4 60
ADDRGP4 Info_ValueForKey
CALLP4
ASGNP4
ADDRLP4 44
ADDRLP4 60
INDIRP4
ASGNP4
line 774
;774:	y += size;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 4
INDIRF4
ADDF4
ASGNF4
line 776
;775:
;776:	VectorSet(color, 1, 1, 1);
ADDRLP4 8
CNSTF4 1065353216
ASGNF4
ADDRLP4 8+4
CNSTF4 1065353216
ASGNF4
ADDRLP4 8+8
CNSTF4 1065353216
ASGNF4
line 777
;777:	color[3] = 0.5f;
ADDRLP4 8+12
CNSTF4 1056964608
ASGNF4
line 779
;778:
;779:	CG_DrawString(cgs.screenXmax - 4, y, name, color, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_PROPORTIONAL | DS_RIGHT);
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 44
INDIRP4
ARGP4
ADDRLP4 8
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 781
;780:
;781:	return y + BIGCHAR_HEIGHT + 2;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1073741824
ADDF4
RETF4
LABELV $392
endproc CG_DrawAttacker 64 32
proc CG_DrawSpeedMeter 16 32
line 789
;782:}
;783:
;784:/*
;785:================
;786:CG_DrawSpeedMeter
;787:================
;788:*/
;789:static float CG_DrawSpeedMeter(float y) {
line 793
;790:	const char* s;
;791:
;792:	/* speed meter can get in the way of the scoreboard */
;793:	if (cg.scoreBoardShowing) {
ADDRGP4 cg+115360
INDIRI4
CNSTI4 0
EQI4 $422
line 794
;794:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $421
JUMPV
LABELV $422
line 797
;795:	}
;796:
;797:	s = va("%1.0f", cg.xyspeed);
ADDRGP4 $425
ARGP4
ADDRGP4 cg+117948
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 799
;798:
;799:	if (cg_drawSpeed.integer == 2) {
ADDRGP4 cg_drawSpeed+12
INDIRI4
CNSTI4 2
NEI4 $427
line 801
;800:		/* top left-hand corner of screen */
;801:		CG_DrawString(cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL);
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 802
;802:		return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
ADDRGP4 $421
JUMPV
LABELV $427
line 803
;803:	} else {
line 805
;804:		/* center of screen */
;805:		int xpos = SCREEN_WIDTH * cg_speed_x.value;
ADDRLP4 8
ADDRGP4 cg_speed_x+8
INDIRF4
CNSTF4 1142947840
MULF4
CVFI4 4
ASGNI4
line 806
;806:		int ypos = SCREEN_HEIGHT * cg_speed_y.value;
ADDRLP4 12
ADDRGP4 cg_speed_y+8
INDIRF4
CNSTF4 1139802112
MULF4
CVFI4 4
ASGNI4
line 807
;807:		CG_DrawString(xpos, ypos, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL);
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 808
;808:		return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $421
endproc CG_DrawSpeedMeter 16 32
proc CG_DrawSnapshot 8 32
line 817
;809:	}
;810:}
;811:
;812:/*
;813:==================
;814:CG_DrawSnapshot
;815:==================
;816:*/
;817:static float CG_DrawSnapshot(float y) {
line 820
;818:	const char* s;
;819:
;820:	s = va("time:%i snap:%i cmd:%i", cg.snap->serverTime, cg.latestSnapshotNum, cgs.serverCommandSequence);
ADDRGP4 $434
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ARGI4
ADDRGP4 cg+28
INDIRI4
ARGI4
ADDRGP4 cgs+31468
INDIRI4
ARGI4
ADDRLP4 4
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 822
;821:
;822:	CG_DrawString(cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT);
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 824
;823:
;824:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $433
endproc CG_DrawSnapshot 8 32
bss
align 4
LABELV $440
skip 16
align 4
LABELV $441
skip 4
align 4
LABELV $442
skip 4
code
proc CG_DrawFPS 36 32
line 833
;825:}
;826:
;827:/*
;828:==================
;829:CG_DrawFPS
;830:==================
;831:*/
;832:#define FPS_FRAMES 4
;833:static float CG_DrawFPS(float y) {
line 844
;834:	const char* s;
;835:	static int  previousTimes[FPS_FRAMES];
;836:	static int  index;
;837:	int         i, total;
;838:	int         fps;
;839:	static int  previous;
;840:	int         t, frameTime;
;841:
;842:	// don't use serverTime, because that will be drifting to
;843:	// correct for internet lag changes, timescales, timedemos, etc
;844:	t         = trap_Milliseconds();
ADDRLP4 24
ADDRGP4 trap_Milliseconds
CALLI4
ASGNI4
ADDRLP4 8
ADDRLP4 24
INDIRI4
ASGNI4
line 845
;845:	frameTime = t - previous;
ADDRLP4 12
ADDRLP4 8
INDIRI4
ADDRGP4 $442
INDIRI4
SUBI4
ASGNI4
line 846
;846:	previous  = t;
ADDRGP4 $442
ADDRLP4 8
INDIRI4
ASGNI4
line 848
;847:
;848:	previousTimes[index % FPS_FRAMES] = frameTime;
ADDRGP4 $441
INDIRI4
CNSTI4 4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 $440
ADDP4
ADDRLP4 12
INDIRI4
ASGNI4
line 849
;849:	index++;
ADDRLP4 28
ADDRGP4 $441
ASGNP4
ADDRLP4 28
INDIRP4
ADDRLP4 28
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 850
;850:	if (index > FPS_FRAMES) {
ADDRGP4 $441
INDIRI4
CNSTI4 4
LEI4 $443
line 852
;851:		// average multiple frames together to smooth changes out a bit
;852:		total = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 853
;853:		for (i = 0; i < FPS_FRAMES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $445
line 854
;854:			total += previousTimes[i];
ADDRLP4 4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $440
ADDP4
INDIRI4
ADDI4
ASGNI4
line 855
;855:		}
LABELV $446
line 853
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 4
LTI4 $445
line 856
;856:		if (!total) {
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $449
line 857
;857:			total = 1;
ADDRLP4 4
CNSTI4 1
ASGNI4
line 858
;858:		}
LABELV $449
line 859
;859:		fps = 1000 * FPS_FRAMES / total;
ADDRLP4 20
CNSTI4 4000
ADDRLP4 4
INDIRI4
DIVI4
ASGNI4
line 861
;860:
;861:		s = va("%ifps", fps);
ADDRGP4 $451
ARGP4
ADDRLP4 20
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 32
INDIRP4
ASGNP4
line 862
;862:		CG_DrawString(cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL);
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 863
;863:	}
LABELV $443
line 865
;864:
;865:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $439
endproc CG_DrawFPS 36 32
proc CG_DrawTimer 20 32
line 873
;866:}
;867:
;868:/*
;869:=================
;870:CG_DrawTimer
;871:=================
;872:*/
;873:static float CG_DrawTimer(float y) {
line 878
;874:	const char* s;
;875:	int         mins, seconds;
;876:	int         msec;
;877:
;878:	msec = cg.time - cgs.levelStartTime;
ADDRLP4 12
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+34820
INDIRI4
SUBI4
ASGNI4
line 880
;879:
;880:	seconds = msec / 1000;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 881
;881:	mins    = seconds / 60;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 882
;882:	seconds -= mins * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 60
MULI4
SUBI4
ASGNI4
line 884
;883:
;884:	s = va("%i:%02i", mins, seconds);
ADDRGP4 $456
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 885
;885:	CG_DrawString(cgs.screenXmax - 4, y + 2, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL);
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1073741824
ADDF4
ARGF4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 887
;886:
;887:	return y + BIGCHAR_HEIGHT + 4;
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
ADDF4
CNSTF4 1082130432
ADDF4
RETF4
LABELV $453
endproc CG_DrawTimer 20 32
proc CG_DrawTeamOverlay 120 32
line 895
;888:}
;889:
;890:/*
;891:=================
;892:CG_DrawTeamOverlay
;893:=================
;894:*/
;895:static float CG_DrawTeamOverlay(float y, qboolean right, qboolean upper) {
line 907
;896:	int           x, w, h, xx;
;897:	int           i, j, len;
;898:	const char*   p;
;899:	vec4_t        hcolor;
;900:	int           pwidth, lwidth;
;901:	int           plyrs;
;902:	char          st[16];
;903:	clientInfo_t* ci;
;904:	gitem_t*      item;
;905:	int           ret_y, count;
;906:
;907:	if (!cg_drawTeamOverlay.integer) {
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 0
NEI4 $459
line 908
;908:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $458
JUMPV
LABELV $459
line 911
;909:	}
;910:
;911:	if (cg.snap->ps.persistant[PERS_TEAM] != TEAM_RED && cg.snap->ps.persistant[PERS_TEAM] != TEAM_BLUE) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
EQI4 $462
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
EQI4 $462
line 912
;912:		return y;  // Not on any team
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $458
JUMPV
LABELV $462
line 915
;913:	}
;914:
;915:	plyrs = 0;
ADDRLP4 76
CNSTI4 0
ASGNI4
line 918
;916:
;917:	// max player name width
;918:	pwidth = 0;
ADDRLP4 56
CNSTI4 0
ASGNI4
line 919
;919:	count  = (numSortedTeamPlayers > 8) ? 8 : numSortedTeamPlayers;
ADDRGP4 numSortedTeamPlayers
INDIRI4
CNSTI4 8
LEI4 $467
ADDRLP4 92
CNSTI4 8
ASGNI4
ADDRGP4 $468
JUMPV
LABELV $467
ADDRLP4 92
ADDRGP4 numSortedTeamPlayers
INDIRI4
ASGNI4
LABELV $468
ADDRLP4 48
ADDRLP4 92
INDIRI4
ASGNI4
line 920
;920:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $472
JUMPV
LABELV $469
line 921
;921:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 922
;922:		if (ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $474
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
NEI4 $474
line 923
;923:			plyrs++;
ADDRLP4 76
ADDRLP4 76
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 924
;924:			len = CG_DrawStrlen(ci->name);
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 100
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 100
INDIRI4
ASGNI4
line 925
;925:			if (len > pwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 56
INDIRI4
LEI4 $477
line 926
;926:				pwidth = len;
ADDRLP4 56
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $477
line 927
;927:		}
LABELV $474
line 928
;928:	}
LABELV $470
line 920
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $472
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $469
line 930
;929:
;930:	if (!plyrs)
ADDRLP4 76
INDIRI4
CNSTI4 0
NEI4 $479
line 931
;931:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $458
JUMPV
LABELV $479
line 933
;932:
;933:	if (pwidth > TEAM_OVERLAY_MAXNAME_WIDTH)
ADDRLP4 56
INDIRI4
CNSTI4 12
LEI4 $481
line 934
;934:		pwidth = TEAM_OVERLAY_MAXNAME_WIDTH;
ADDRLP4 56
CNSTI4 12
ASGNI4
LABELV $481
line 937
;935:
;936:	// max location name width
;937:	lwidth = 0;
ADDRLP4 44
CNSTI4 0
ASGNI4
line 938
;938:	for (i = 1; i < MAX_LOCATIONS; i++) {
ADDRLP4 8
CNSTI4 1
ASGNI4
LABELV $483
line 939
;939:		p = CG_ConfigString(CS_LOCATIONS + i);
ADDRLP4 8
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRLP4 96
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 96
INDIRP4
ASGNP4
line 940
;940:		if (p && *p) {
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $487
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $487
line 941
;941:			len = CG_DrawStrlen(p);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 104
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 104
INDIRI4
ASGNI4
line 942
;942:			if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $489
line 943
;943:				lwidth = len;
ADDRLP4 44
ADDRLP4 40
INDIRI4
ASGNI4
LABELV $489
line 944
;944:		}
LABELV $487
line 945
;945:	}
LABELV $484
line 938
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 64
LTI4 $483
line 947
;946:
;947:	if (lwidth > TEAM_OVERLAY_MAXLOCATION_WIDTH)
ADDRLP4 44
INDIRI4
CNSTI4 16
LEI4 $491
line 948
;948:		lwidth = TEAM_OVERLAY_MAXLOCATION_WIDTH;
ADDRLP4 44
CNSTI4 16
ASGNI4
LABELV $491
line 950
;949:
;950:	w = (pwidth + lwidth + 4 + 7) * TINYCHAR_WIDTH;
ADDRLP4 80
ADDRLP4 56
INDIRI4
ADDRLP4 44
INDIRI4
ADDI4
CNSTI4 3
LSHI4
CNSTI4 32
ADDI4
CNSTI4 56
ADDI4
ASGNI4
line 952
;951:
;952:	if (right)
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $493
line 953
;953:		x = cgs.screenXmax + 1 - w;
ADDRLP4 52
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 80
INDIRI4
CVIF4 4
SUBF4
CVFI4 4
ASGNI4
ADDRGP4 $494
JUMPV
LABELV $493
line 955
;954:	else
;955:		x = cgs.screenXmin;
ADDRLP4 52
ADDRGP4 cgs+31452
INDIRF4
CVFI4 4
ASGNI4
LABELV $494
line 957
;956:
;957:	h = plyrs * TINYCHAR_HEIGHT;
ADDRLP4 84
ADDRLP4 76
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 959
;958:
;959:	if (upper) {
ADDRFP4 8
INDIRI4
CNSTI4 0
EQI4 $497
line 960
;960:		ret_y = y + h;
ADDRLP4 88
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
ADDF4
CVFI4 4
ASGNI4
line 961
;961:	} else {
ADDRGP4 $498
JUMPV
LABELV $497
line 962
;962:		y -= h;
ADDRFP4 0
ADDRFP4 0
INDIRF4
ADDRLP4 84
INDIRI4
CVIF4 4
SUBF4
ASGNF4
line 963
;963:		ret_y = y;
ADDRLP4 88
ADDRFP4 0
INDIRF4
CVFI4 4
ASGNI4
line 964
;964:	}
LABELV $498
line 966
;965:
;966:	if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $499
line 967
;967:		hcolor[0] = 1.0f;
ADDRLP4 24
CNSTF4 1065353216
ASGNF4
line 968
;968:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 969
;969:		hcolor[2] = 0.0f;
ADDRLP4 24+8
CNSTF4 0
ASGNF4
line 970
;970:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 971
;971:	} else {  // if ( cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE )
ADDRGP4 $500
JUMPV
LABELV $499
line 972
;972:		hcolor[0] = 0.0f;
ADDRLP4 24
CNSTF4 0
ASGNF4
line 973
;973:		hcolor[1] = 0.0f;
ADDRLP4 24+4
CNSTF4 0
ASGNF4
line 974
;974:		hcolor[2] = 1.0f;
ADDRLP4 24+8
CNSTF4 1065353216
ASGNF4
line 975
;975:		hcolor[3] = 0.33f;
ADDRLP4 24+12
CNSTF4 1051260355
ASGNF4
line 976
;976:	}
LABELV $500
line 977
;977:	trap_R_SetColor(hcolor);
ADDRLP4 24
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 978
;978:	CG_DrawPic(x, y, w, h, cgs.media.teamStatusBar);
ADDRLP4 52
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 80
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 84
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cgs+148692+128
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 979
;979:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 981
;980:
;981:	for (i = 0; i < count; i++) {
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $513
JUMPV
LABELV $510
line 982
;982:		ci = cgs.clientinfo + sortedTeamPlayers[i];
ADDRLP4 4
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 sortedTeamPlayers
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 983
;983:		if (ci->infoValid && ci->team == cg.snap->ps.persistant[PERS_TEAM]) {
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 0
EQI4 $515
ADDRLP4 4
INDIRP4
CNSTI4 36
ADDP4
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
NEI4 $515
line 985
;984:
;985:			hcolor[0] = hcolor[1] = hcolor[2] = hcolor[3] = 1.0;
ADDRLP4 100
CNSTF4 1065353216
ASGNF4
ADDRLP4 24+12
ADDRLP4 100
INDIRF4
ASGNF4
ADDRLP4 24+8
ADDRLP4 100
INDIRF4
ASGNF4
ADDRLP4 24+4
ADDRLP4 100
INDIRF4
ASGNF4
ADDRLP4 24
ADDRLP4 100
INDIRF4
ASGNF4
line 987
;986:
;987:			xx = x + TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 989
;988:
;989:			CG_DrawString(xx, y, ci->name, hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXNAME_WIDTH, DS_PROPORTIONAL);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 24
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
CNSTI4 12
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 991
;990:
;991:			if (lwidth) {
ADDRLP4 44
INDIRI4
CNSTI4 0
EQI4 $521
line 992
;992:				p = CG_ConfigString(CS_LOCATIONS + ci->location);
ADDRLP4 4
INDIRP4
CNSTI4 72
ADDP4
INDIRI4
CNSTI4 608
ADDI4
ARGI4
ADDRLP4 104
ADDRGP4 CG_ConfigString
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 104
INDIRP4
ASGNP4
line 993
;993:				if (!p || !*p)
ADDRLP4 20
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $525
ADDRLP4 20
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $523
LABELV $525
line 994
;994:					p = "unknown";
ADDRLP4 20
ADDRGP4 $526
ASGNP4
LABELV $523
line 995
;995:				len = CG_DrawStrlen(p);
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 112
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 40
ADDRLP4 112
INDIRI4
ASGNI4
line 996
;996:				if (len > lwidth)
ADDRLP4 40
INDIRI4
ADDRLP4 44
INDIRI4
LEI4 $527
line 997
;997:					len = lwidth;
ADDRLP4 40
ADDRLP4 44
INDIRI4
ASGNI4
LABELV $527
line 1001
;998:
;999:				//				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth +
;1000:				//					((lwidth/2 - len/2) * TINYCHAR_WIDTH);
;1001:				xx = x + TINYCHAR_WIDTH * 2 + TINYCHAR_WIDTH * pwidth;
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 16
ADDI4
ADDRLP4 56
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ASGNI4
line 1002
;1002:				CG_DrawString(xx, y, p, hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, TEAM_OVERLAY_MAXLOCATION_WIDTH, DS_PROPORTIONAL);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 24
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
CNSTI4 16
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1003
;1003:			}
LABELV $521
line 1005
;1004:
;1005:			CG_GetColorForHealth(ci->health, ci->armor, hcolor);
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
ADDRLP4 24
ARGP4
ADDRGP4 CG_GetColorForHealth
CALLV
pop
line 1007
;1006:
;1007:			Com_sprintf(st, sizeof(st), "%3i %3i", ci->health, ci->armor);
ADDRLP4 60
ARGP4
CNSTI4 16
ARGI4
ADDRGP4 $529
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 76
ADDP4
INDIRI4
ARGI4
ADDRLP4 4
INDIRP4
CNSTI4 80
ADDP4
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1009
;1008:
;1009:			xx = x + TINYCHAR_WIDTH * 3 + TINYCHAR_WIDTH * pwidth + TINYCHAR_WIDTH * lwidth;
ADDRLP4 12
ADDRLP4 52
INDIRI4
CNSTI4 24
ADDI4
ADDRLP4 56
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ADDRLP4 44
INDIRI4
CNSTI4 3
LSHI4
ADDI4
ASGNI4
line 1011
;1010:
;1011:			CG_DrawString(xx, y, st, hcolor, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, 0, 0);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 60
ARGP4
ADDRLP4 24
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1014
;1012:
;1013:			// draw weapon icon
;1014:			xx += TINYCHAR_WIDTH * 3;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 24
ADDI4
ASGNI4
line 1016
;1015:
;1016:			if (cg_weapons[ci->curWeapon].weaponIcon) {
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
CNSTI4 0
EQI4 $530
line 1017
;1017:				CG_DrawPic(xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, cg_weapons[ci->curWeapon].weaponIcon);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
ADDRLP4 4
INDIRP4
CNSTI4 84
ADDP4
INDIRI4
CNSTI4 136
MULI4
ADDRGP4 cg_weapons+68
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1018
;1018:			} else {
ADDRGP4 $531
JUMPV
LABELV $530
line 1019
;1019:				CG_DrawPic(xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, cgs.media.deferShader);
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
ADDRGP4 cgs+148692+132
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1020
;1020:			}
LABELV $531
line 1023
;1021:
;1022:			// Draw powerup icons
;1023:			if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $536
line 1024
;1024:				xx = x;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ASGNI4
line 1025
;1025:			} else {
ADDRGP4 $537
JUMPV
LABELV $536
line 1026
;1026:				xx = x + w - TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 52
INDIRI4
ADDRLP4 80
INDIRI4
ADDI4
CNSTI4 8
SUBI4
ASGNI4
line 1027
;1027:			}
LABELV $537
line 1028
;1028:			for (j = 0; j <= PW_NUM_POWERUPS; j++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
LABELV $538
line 1029
;1029:				if (ci->powerups & (1 << j)) {
ADDRLP4 4
INDIRP4
CNSTI4 108
ADDP4
INDIRI4
CNSTI4 1
ADDRLP4 0
INDIRI4
LSHI4
BANDI4
CNSTI4 0
EQI4 $542
line 1031
;1030:
;1031:					item = BG_FindItemForPowerup(j);
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 112
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 112
INDIRP4
ASGNP4
line 1033
;1032:
;1033:					if (item) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $544
line 1034
;1034:						CG_DrawPic(xx, y, TINYCHAR_WIDTH, TINYCHAR_HEIGHT, trap_R_RegisterShader(item->icon));
ADDRLP4 16
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 116
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
ADDRLP4 116
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1035
;1035:						if (right) {
ADDRFP4 4
INDIRI4
CNSTI4 0
EQI4 $546
line 1036
;1036:							xx -= TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
SUBI4
ASGNI4
line 1037
;1037:						} else {
ADDRGP4 $547
JUMPV
LABELV $546
line 1038
;1038:							xx += TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 8
ADDI4
ASGNI4
line 1039
;1039:						}
LABELV $547
line 1040
;1040:					}
LABELV $544
line 1041
;1041:				}
LABELV $542
line 1042
;1042:			}
LABELV $539
line 1028
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 15
LEI4 $538
line 1044
;1043:
;1044:			y += TINYCHAR_HEIGHT;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1090519040
ADDF4
ASGNF4
line 1045
;1045:		}
LABELV $515
line 1046
;1046:	}
LABELV $511
line 981
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $513
ADDRLP4 8
INDIRI4
ADDRLP4 48
INDIRI4
LTI4 $510
line 1048
;1047:
;1048:	return ret_y;
ADDRLP4 88
INDIRI4
CVIF4 4
RETF4
LABELV $458
endproc CG_DrawTeamOverlay 120 32
proc CG_DrawUpperRight 12 12
line 1057
;1049:}
;1050:
;1051:/*
;1052:=====================
;1053:CG_DrawUpperRight
;1054:
;1055:=====================
;1056:*/
;1057:static void CG_DrawUpperRight(stereoFrame_t stereoFrame) {
line 1060
;1058:	float y;
;1059:
;1060:	y = cgs.screenYmin;
ADDRLP4 0
ADDRGP4 cgs+31460
INDIRF4
ASGNF4
line 1062
;1061:
;1062:	if (cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 1) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $550
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 1
NEI4 $550
line 1063
;1063:		y = CG_DrawTeamOverlay(y, qtrue, qtrue);
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 1
ARGI4
CNSTI4 1
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1064
;1064:	}
LABELV $550
line 1065
;1065:	if (cg_drawSnapshot.integer) {
ADDRGP4 cg_drawSnapshot+12
INDIRI4
CNSTI4 0
EQI4 $554
line 1066
;1066:		y = CG_DrawSnapshot(y);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawSnapshot
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1067
;1067:	}
LABELV $554
line 1068
;1068:	if (cg_drawFPS.integer && (stereoFrame == STEREO_CENTER || stereoFrame == STEREO_RIGHT)) {
ADDRGP4 cg_drawFPS+12
INDIRI4
CNSTI4 0
EQI4 $557
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $560
ADDRLP4 4
INDIRI4
CNSTI4 2
NEI4 $557
LABELV $560
line 1069
;1069:		y = CG_DrawFPS(y);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawFPS
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1070
;1070:	}
LABELV $557
line 1071
;1071:	if (cg_drawSpeed.integer) {
ADDRGP4 cg_drawSpeed+12
INDIRI4
CNSTI4 0
EQI4 $561
line 1072
;1072:		y = CG_DrawSpeedMeter(y);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawSpeedMeter
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1073
;1073:	}
LABELV $561
line 1074
;1074:	if (cg_drawTimer.integer) {
ADDRGP4 cg_drawTimer+12
INDIRI4
CNSTI4 0
EQI4 $564
line 1075
;1075:		y = CG_DrawTimer(y);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawTimer
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1076
;1076:	}
LABELV $564
line 1077
;1077:	if (cg_drawAttacker.integer) {
ADDRGP4 cg_drawAttacker+12
INDIRI4
CNSTI4 0
EQI4 $567
line 1078
;1078:		y = CG_DrawAttacker(y);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawAttacker
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1079
;1079:	}
LABELV $567
line 1080
;1080:}
LABELV $548
endproc CG_DrawUpperRight 12 12
proc CG_DrawScores 76 32
line 1098
;1081:
;1082:/*
;1083:===========================================================================================
;1084:
;1085:  LOWER RIGHT CORNER
;1086:
;1087:===========================================================================================
;1088:*/
;1089:
;1090:/*
;1091:=================
;1092:CG_DrawScores
;1093:
;1094:Draw the small two score display
;1095:=================
;1096:*/
;1097:#ifndef MISSIONPACK
;1098:static float CG_DrawScores(float y) {
line 1107
;1099:	const char* s;
;1100:	int         s1, s2, score;
;1101:	int         x, x0, w;
;1102:	int         v;
;1103:	vec4_t      color;
;1104:	float       y1;
;1105:	gitem_t*    item;
;1106:
;1107:	s1 = cgs.scores1;
ADDRLP4 32
ADDRGP4 cgs+34824
INDIRI4
ASGNI4
line 1108
;1108:	s2 = cgs.scores2;
ADDRLP4 36
ADDRGP4 cgs+34828
INDIRI4
ASGNI4
line 1110
;1109:
;1110:	y -= BIGCHAR_HEIGHT + 8 - 4;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1101004800
SUBF4
ASGNF4
line 1112
;1111:
;1112:	y1 = y;
ADDRLP4 40
ADDRFP4 0
INDIRF4
ASGNF4
line 1115
;1113:
;1114:	// draw from the right side to left
;1115:	if (cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $573
line 1116
;1116:		x0       = cgs.screenXmax + 1;
ADDRLP4 28
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1117
;1117:		color[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1118
;1118:		color[1] = 0.1f;
ADDRLP4 0+4
CNSTF4 1036831949
ASGNF4
line 1119
;1119:		color[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1120
;1120:		color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1122
;1121:		// second score
;1122:		s = va("%2i", s2);
ADDRGP4 $580
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 56
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 56
INDIRP4
ASGNP4
line 1123
;1123:		w = CG_DrawStrlen(s) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 60
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 60
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1124
;1124:		x = x0 - w;
ADDRLP4 16
ADDRLP4 28
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1125
;1125:		CG_FillRect(x, y - 4, w, BIGCHAR_HEIGHT + 8, color);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1126
;1126:		if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $581
line 1127
;1127:			CG_DrawPic(x, y - 4, w, BIGCHAR_HEIGHT + 8, cgs.media.selectShader);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+148692+212
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1128
;1128:		}
LABELV $581
line 1129
;1129:		CG_DrawString(x0 - 4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT);
ADDRLP4 28
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1131
;1130:
;1131:		if (cgs.gametype == GT_CTF) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
NEI4 $586
line 1133
;1132:			// Display flag status
;1133:			item = BG_FindItemForPowerup(PW_BLUEFLAG);
CNSTI4 8
ARGI4
ADDRLP4 64
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 64
INDIRP4
ASGNP4
line 1135
;1134:
;1135:			if (item) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $589
line 1136
;1136:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 40
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1137
;1137:				if (cgs.blueflag >= 0 && cgs.blueflag <= 2) {
ADDRGP4 cgs+34836
INDIRI4
CNSTI4 0
LTI4 $591
ADDRGP4 cgs+34836
INDIRI4
CNSTI4 2
GTI4 $591
line 1138
;1138:					CG_DrawPic(x, y1 - 4, w, BIGCHAR_HEIGHT + 8, cgs.media.blueFlagShader[cgs.blueflag]);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+34836
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+60
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1139
;1139:				}
LABELV $591
line 1140
;1140:			}
LABELV $589
line 1141
;1141:		}
LABELV $586
line 1142
;1142:		color[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1143
;1143:		color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1144
;1144:		color[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1145
;1145:		color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1147
;1146:		// first score
;1147:		x0 = x;
ADDRLP4 28
ADDRLP4 16
INDIRI4
ASGNI4
line 1148
;1148:		s  = va("%2i", s1);
ADDRGP4 $580
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
ASGNP4
line 1149
;1149:		w  = CG_DrawStrlen(s) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 68
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1150
;1150:		x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1151
;1151:		CG_FillRect(x, y - 4, w, BIGCHAR_HEIGHT + 8, color);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1152
;1152:		if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $601
line 1153
;1153:			CG_DrawPic(x, y - 4, w, BIGCHAR_HEIGHT + 8, cgs.media.selectShader);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+148692+212
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1154
;1154:		}
LABELV $601
line 1156
;1155:
;1156:		CG_DrawString(x0 - 4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT);
ADDRLP4 28
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1158
;1157:
;1158:		if (cgs.gametype == GT_CTF) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
NEI4 $606
line 1160
;1159:			// Display flag status
;1160:			item = BG_FindItemForPowerup(PW_REDFLAG);
CNSTI4 7
ARGI4
ADDRLP4 72
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 52
ADDRLP4 72
INDIRP4
ASGNP4
line 1162
;1161:
;1162:			if (item) {
ADDRLP4 52
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $609
line 1163
;1163:				y1 = y - BIGCHAR_HEIGHT - 8;
ADDRLP4 40
ADDRFP4 0
INDIRF4
CNSTF4 1098907648
SUBF4
CNSTF4 1090519040
SUBF4
ASGNF4
line 1164
;1164:				if (cgs.redflag >= 0 && cgs.redflag <= 2) {
ADDRGP4 cgs+34832
INDIRI4
CNSTI4 0
LTI4 $611
ADDRGP4 cgs+34832
INDIRI4
CNSTI4 2
GTI4 $611
line 1165
;1165:					CG_DrawPic(x, y1 - 4, w, BIGCHAR_HEIGHT + 8, cgs.media.redFlagShader[cgs.redflag]);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 40
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+34832
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+48
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1166
;1166:				}
LABELV $611
line 1167
;1167:			}
LABELV $609
line 1168
;1168:		}
LABELV $606
line 1183
;1169:
;1170:#ifdef MISSIONPACK
;1171:		if (cgs.gametype == GT_1FCTF) {
;1172:			// Display flag status
;1173:			item = BG_FindItemForPowerup(PW_NEUTRALFLAG);
;1174:
;1175:			if (item) {
;1176:				y1 = y - BIGCHAR_HEIGHT - 8;
;1177:				if (cgs.flagStatus >= 0 && cgs.flagStatus <= 3) {
;1178:					CG_DrawPic(x, y1 - 4, w, BIGCHAR_HEIGHT + 8, cgs.media.flagShader[cgs.flagStatus]);
;1179:				}
;1180:			}
;1181:		}
;1182:#endif
;1183:		if (cgs.gametype >= GT_CTF) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
LTI4 $618
line 1184
;1184:			v = cgs.capturelimit;
ADDRLP4 48
ADDRGP4 cgs+31496
INDIRI4
ASGNI4
line 1185
;1185:		} else {
ADDRGP4 $619
JUMPV
LABELV $618
line 1186
;1186:			v = cgs.fraglimit;
ADDRLP4 48
ADDRGP4 cgs+31492
INDIRI4
ASGNI4
line 1187
;1187:		}
LABELV $619
line 1188
;1188:		if (v) {
ADDRLP4 48
INDIRI4
CNSTI4 0
EQI4 $574
line 1189
;1189:			s = va("%2i", v);
ADDRGP4 $580
ARGP4
ADDRLP4 48
INDIRI4
ARGI4
ADDRLP4 72
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 72
INDIRP4
ASGNP4
line 1190
;1190:			CG_DrawString(x - 4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT);
ADDRLP4 16
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1191
;1191:		}
line 1193
;1192:
;1193:	} else {
ADDRGP4 $574
JUMPV
LABELV $573
line 1196
;1194:		qboolean spectator;
;1195:
;1196:		x = cgs.screenXmax + 1;
ADDRLP4 16
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CVFI4 4
ASGNI4
line 1198
;1197:
;1198:		score     = cg.snap->ps.persistant[PERS_SCORE];
ADDRLP4 44
ADDRGP4 cg+36
INDIRP4
CNSTI4 292
ADDP4
INDIRI4
ASGNI4
line 1199
;1199:		spectator = (cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR);
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $629
ADDRLP4 60
CNSTI4 1
ASGNI4
ADDRGP4 $630
JUMPV
LABELV $629
ADDRLP4 60
CNSTI4 0
ASGNI4
LABELV $630
ADDRLP4 56
ADDRLP4 60
INDIRI4
ASGNI4
line 1202
;1200:
;1201:		// always show your score in the second box if not in first place
;1202:		if (s1 != score) {
ADDRLP4 32
INDIRI4
ADDRLP4 44
INDIRI4
EQI4 $631
line 1203
;1203:			s2 = score;
ADDRLP4 36
ADDRLP4 44
INDIRI4
ASGNI4
line 1204
;1204:		}
LABELV $631
line 1205
;1205:		if (s2 != SCORE_NOT_PRESENT) {
ADDRLP4 36
INDIRI4
CNSTI4 -9999
EQI4 $633
line 1206
;1206:			x0 = x;
ADDRLP4 28
ADDRLP4 16
INDIRI4
ASGNI4
line 1207
;1207:			s  = va("%2i", s2);
ADDRGP4 $580
ARGP4
ADDRLP4 36
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
ASGNP4
line 1208
;1208:			w  = CG_DrawStrlen(s) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 68
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1209
;1209:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1210
;1210:			if (!spectator && score == s2 && score != s1) {
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $635
ADDRLP4 72
ADDRLP4 44
INDIRI4
ASGNI4
ADDRLP4 72
INDIRI4
ADDRLP4 36
INDIRI4
NEI4 $635
ADDRLP4 72
INDIRI4
ADDRLP4 32
INDIRI4
EQI4 $635
line 1211
;1211:				color[0] = 1.0f;
ADDRLP4 0
CNSTF4 1065353216
ASGNF4
line 1212
;1212:				color[1] = 0.0f;
ADDRLP4 0+4
CNSTF4 0
ASGNF4
line 1213
;1213:				color[2] = 0.0f;
ADDRLP4 0+8
CNSTF4 0
ASGNF4
line 1214
;1214:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1215
;1215:				CG_FillRect(x, y - 4, w, BIGCHAR_HEIGHT + 8, color);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1216
;1216:				CG_DrawPic(x, y - 4, w, BIGCHAR_HEIGHT + 8, cgs.media.selectShader);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+148692+212
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1217
;1217:			} else {
ADDRGP4 $636
JUMPV
LABELV $635
line 1218
;1218:				color[0] = 0.5f;
ADDRLP4 0
CNSTF4 1056964608
ASGNF4
line 1219
;1219:				color[1] = 0.5f;
ADDRLP4 0+4
CNSTF4 1056964608
ASGNF4
line 1220
;1220:				color[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
ASGNF4
line 1221
;1221:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1222
;1222:				CG_FillRect(x, y - 4, w, BIGCHAR_HEIGHT + 8, color);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1223
;1223:			}
LABELV $636
line 1224
;1224:			CG_DrawString(x0 - 4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT);
ADDRLP4 28
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1225
;1225:		}
LABELV $633
line 1228
;1226:
;1227:		// first place
;1228:		if (s1 != SCORE_NOT_PRESENT) {
ADDRLP4 32
INDIRI4
CNSTI4 -9999
EQI4 $645
line 1229
;1229:			x0 = x;
ADDRLP4 28
ADDRLP4 16
INDIRI4
ASGNI4
line 1230
;1230:			s  = va("%2i", s1);
ADDRGP4 $580
ARGP4
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
ASGNP4
line 1231
;1231:			w  = CG_DrawStrlen(s) * BIGCHAR_WIDTH + 8;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 68
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 8
ADDI4
ASGNI4
line 1232
;1232:			x -= w;
ADDRLP4 16
ADDRLP4 16
INDIRI4
ADDRLP4 24
INDIRI4
SUBI4
ASGNI4
line 1233
;1233:			if (!spectator && score == s1) {
ADDRLP4 56
INDIRI4
CNSTI4 0
NEI4 $647
ADDRLP4 44
INDIRI4
ADDRLP4 32
INDIRI4
NEI4 $647
line 1234
;1234:				color[0] = 0.0f;
ADDRLP4 0
CNSTF4 0
ASGNF4
line 1235
;1235:				color[1] = 0.1f;
ADDRLP4 0+4
CNSTF4 1036831949
ASGNF4
line 1236
;1236:				color[2] = 1.0f;
ADDRLP4 0+8
CNSTF4 1065353216
ASGNF4
line 1237
;1237:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1238
;1238:				CG_FillRect(x, y - 4, w, BIGCHAR_HEIGHT + 8, color);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1239
;1239:				CG_DrawPic(x, y - 4, w, BIGCHAR_HEIGHT + 8, cgs.media.selectShader);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRGP4 cgs+148692+212
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1240
;1240:			} else {
ADDRGP4 $648
JUMPV
LABELV $647
line 1241
;1241:				color[0] = 0.5f;
ADDRLP4 0
CNSTF4 1056964608
ASGNF4
line 1242
;1242:				color[1] = 0.5f;
ADDRLP4 0+4
CNSTF4 1056964608
ASGNF4
line 1243
;1243:				color[2] = 0.5f;
ADDRLP4 0+8
CNSTF4 1056964608
ASGNF4
line 1244
;1244:				color[3] = 0.33f;
ADDRLP4 0+12
CNSTF4 1051260355
ASGNF4
line 1245
;1245:				CG_FillRect(x, y - 4, w, BIGCHAR_HEIGHT + 8, color);
ADDRLP4 16
INDIRI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1082130432
SUBF4
ARGF4
ADDRLP4 24
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1103101952
ARGF4
ADDRLP4 0
ARGP4
ADDRGP4 CG_FillRect
CALLV
pop
line 1246
;1246:			}
LABELV $648
line 1247
;1247:			CG_DrawString(x0 - 4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT);
ADDRLP4 28
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1248
;1248:		}
LABELV $645
line 1250
;1249:
;1250:		if (cgs.fraglimit) {
ADDRGP4 cgs+31492
INDIRI4
CNSTI4 0
EQI4 $657
line 1251
;1251:			s = va("%2i", cgs.fraglimit);
ADDRGP4 $580
ARGP4
ADDRGP4 cgs+31492
INDIRI4
ARGI4
ADDRLP4 64
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 20
ADDRLP4 64
INDIRP4
ASGNP4
line 1252
;1252:			CG_DrawString(x - 4, y, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT);
ADDRLP4 16
INDIRI4
CNSTI4 4
SUBI4
CVIF4 4
ARGF4
ADDRFP4 0
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 17
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1253
;1253:		}
LABELV $657
line 1254
;1254:	}
LABELV $574
line 1256
;1255:
;1256:	return y1 - 8;
ADDRLP4 40
INDIRF4
CNSTF4 1090519040
SUBF4
RETF4
LABELV $570
endproc CG_DrawScores 76 32
data
align 4
LABELV $662
byte 4 1045220557
byte 4 1065353216
byte 4 1045220557
byte 4 1065353216
byte 4 1065353216
byte 4 1045220557
byte 4 1045220557
byte 4 1065353216
code
proc CG_DrawPowerups 200 20
line 1266
;1257:}
;1258:#endif  // MISSIONPACK
;1259:
;1260:/*
;1261:================
;1262:CG_DrawPowerups
;1263:================
;1264:*/
;1265:#ifndef MISSIONPACK
;1266:static float CG_DrawPowerups(float y) {
line 1283
;1267:	int                sorted[MAX_POWERUPS];
;1268:	int                sortedTime[MAX_POWERUPS];
;1269:	int                i, j, k;
;1270:	int                active;
;1271:	playerState_t*     ps;
;1272:	int                t;
;1273:	gitem_t*           item;
;1274:	int                x;
;1275:	int                color;
;1276:	float              size;
;1277:	float              f;
;1278:	static const float colors[2][4] = {
;1279:		{0.2f, 1.0f, 0.2f, 1.0f},
;1280:        {1.0f, 0.2f, 0.2f, 1.0f}
;1281:    };
;1282:
;1283:	ps = &cg.snap->ps;
ADDRLP4 148
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
ASGNP4
line 1285
;1284:
;1285:	if (ps->stats[STAT_HEALTH] <= 0) {
ADDRLP4 148
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 0
GTI4 $664
line 1286
;1286:		return y;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $661
JUMPV
LABELV $664
line 1290
;1287:	}
;1288:
;1289:	// sort the list by time remaining
;1290:	active = 0;
ADDRLP4 136
CNSTI4 0
ASGNI4
line 1291
;1291:	for (i = 0; i < MAX_POWERUPS; i++) {
ADDRLP4 144
CNSTI4 0
ASGNI4
LABELV $666
line 1292
;1292:		if (!ps->powerups[i]) {
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
CNSTI4 0
NEI4 $670
line 1293
;1293:			continue;
ADDRGP4 $667
JUMPV
LABELV $670
line 1295
;1294:		}
;1295:		t = ps->powerups[i] - cg.time;
ADDRLP4 140
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
ASGNI4
line 1298
;1296:		// ZOID--don't draw if the power up has unlimited time (999 seconds)
;1297:		// This is true of the CTF flags
;1298:		if (t < 0 || t > 999000) {
ADDRLP4 140
INDIRI4
CNSTI4 0
LTI4 $675
ADDRLP4 140
INDIRI4
CNSTI4 999000
LEI4 $673
LABELV $675
line 1299
;1299:			continue;
ADDRGP4 $667
JUMPV
LABELV $673
line 1303
;1300:		}
;1301:
;1302:		// insert into the list
;1303:		for (j = 0; j < active; j++) {
ADDRLP4 132
CNSTI4 0
ASGNI4
ADDRGP4 $679
JUMPV
LABELV $676
line 1304
;1304:			if (sortedTime[j] >= t) {
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ADDRLP4 140
INDIRI4
LTI4 $680
line 1305
;1305:				for (k = active - 1; k >= j; k--) {
ADDRLP4 0
ADDRLP4 136
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $685
JUMPV
LABELV $682
line 1306
;1306:					sorted[k + 1]     = sorted[k];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ASGNI4
line 1307
;1307:					sortedTime[k + 1] = sortedTime[k];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4+4
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
ASGNI4
line 1308
;1308:				}
LABELV $683
line 1305
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $685
ADDRLP4 0
INDIRI4
ADDRLP4 132
INDIRI4
GEI4 $682
line 1309
;1309:				break;
ADDRGP4 $678
JUMPV
LABELV $680
line 1311
;1310:			}
;1311:		}
LABELV $677
line 1303
ADDRLP4 132
ADDRLP4 132
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $679
ADDRLP4 132
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $676
LABELV $678
line 1312
;1312:		sorted[j]     = i;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
ADDRLP4 144
INDIRI4
ASGNI4
line 1313
;1313:		sortedTime[j] = t;
ADDRLP4 132
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
ADDRLP4 140
INDIRI4
ASGNI4
line 1314
;1314:		active++;
ADDRLP4 136
ADDRLP4 136
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1315
;1315:	}
LABELV $667
line 1291
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 144
INDIRI4
CNSTI4 16
LTI4 $666
line 1318
;1316:
;1317:	// draw the icons and timers
;1318:	x = cgs.screenXmax + 1 - ICON_SIZE - CHAR_WIDTH * 2;
ADDRLP4 168
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
CNSTF4 1115684864
SUBF4
CVFI4 4
ASGNI4
line 1319
;1319:	for (i = 0; i < active; i++) {
ADDRLP4 144
CNSTI4 0
ASGNI4
ADDRGP4 $692
JUMPV
LABELV $689
line 1320
;1320:		item = BG_FindItemForPowerup(sorted[i]);
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
ARGI4
ADDRLP4 172
ADDRGP4 BG_FindItemForPowerup
CALLP4
ASGNP4
ADDRLP4 152
ADDRLP4 172
INDIRP4
ASGNP4
line 1322
;1321:
;1322:		if (item) {
ADDRLP4 152
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $693
line 1324
;1323:
;1324:			color = 1;
ADDRLP4 164
CNSTI4 1
ASGNI4
line 1326
;1325:
;1326:			y -= ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 1328
;1327:
;1328:			trap_R_SetColor(colors[color]);
ADDRLP4 164
INDIRI4
CNSTI4 4
LSHI4
ADDRGP4 $662
ADDP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1329
;1329:			CG_DrawField(x, y, 2, sortedTime[i] / 1000);
ADDRLP4 168
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
CVFI4 4
ARGI4
CNSTI4 2
ARGI4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 4
ADDP4
INDIRI4
CNSTI4 1000
DIVI4
ARGI4
ADDRGP4 CG_DrawField
CALLV
pop
line 1331
;1330:
;1331:			t = ps->powerups[sorted[i]];
ADDRLP4 140
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 148
INDIRP4
CNSTI4 312
ADDP4
ADDP4
INDIRI4
ASGNI4
line 1332
;1332:			if (t - cg.time >= POWERUP_BLINKS * POWERUP_BLINK_TIME) {
ADDRLP4 140
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CNSTI4 5000
LTI4 $695
line 1333
;1333:				trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1334
;1334:			} else {
ADDRGP4 $696
JUMPV
LABELV $695
line 1337
;1335:				vec4_t modulate;
;1336:
;1337:				f = (float)(t - cg.time) / POWERUP_BLINK_TIME;
ADDRLP4 160
ADDRLP4 140
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CVIF4 4
CNSTF4 981668463
MULF4
ASGNF4
line 1338
;1338:				f -= (int)f;
ADDRLP4 160
ADDRLP4 160
INDIRF4
ADDRLP4 160
INDIRF4
CVFI4 4
CVIF4 4
SUBF4
ASGNF4
line 1339
;1339:				modulate[0] = modulate[1] = modulate[2] = modulate[3] = f;
ADDRLP4 176+12
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 176+8
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 176+4
ADDRLP4 160
INDIRF4
ASGNF4
ADDRLP4 176
ADDRLP4 160
INDIRF4
ASGNF4
line 1340
;1340:				trap_R_SetColor(modulate);
ADDRLP4 176
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1341
;1341:			}
LABELV $696
line 1343
;1342:
;1343:			if (cg.powerupActive == sorted[i] && cg.time - cg.powerupTime < PULSE_TIME) {
ADDRGP4 cg+117544
INDIRI4
ADDRLP4 144
INDIRI4
CNSTI4 2
LSHI4
ADDRLP4 68
ADDP4
INDIRI4
NEI4 $702
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117548
INDIRI4
SUBI4
CNSTI4 200
GEI4 $702
line 1344
;1344:				f    = 1.0 - ((float)(cg.time - cg.powerupTime) / PULSE_TIME);
ADDRLP4 160
CNSTF4 1065353216
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117548
INDIRI4
SUBI4
CVIF4 4
CNSTF4 1000593162
MULF4
SUBF4
ASGNF4
line 1345
;1345:				size = ICON_SIZE * (1.0 + (PULSE_SCALE - 1.0) * f);
ADDRLP4 156
ADDRLP4 160
INDIRF4
CNSTF4 1056964608
MULF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
MULF4
ASGNF4
line 1346
;1346:			} else {
ADDRGP4 $703
JUMPV
LABELV $702
line 1347
;1347:				size = ICON_SIZE;
ADDRLP4 156
CNSTF4 1111490560
ASGNF4
line 1348
;1348:			}
LABELV $703
line 1350
;1349:
;1350:			CG_DrawPic(cgs.screenXmax + 1 - size, y + ICON_SIZE / 2 - size / 2, size, size, trap_R_RegisterShader(item->icon));
ADDRLP4 152
INDIRP4
CNSTI4 24
ADDP4
INDIRP4
ARGP4
ADDRLP4 176
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
ADDRLP4 156
INDIRF4
SUBF4
ARGF4
ADDRFP4 0
INDIRF4
CNSTF4 1103101952
ADDF4
ADDRLP4 156
INDIRF4
CNSTF4 1056964608
MULF4
SUBF4
ARGF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 156
INDIRF4
ARGF4
ADDRLP4 176
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1351
;1351:		}  // if ( item )
LABELV $693
line 1352
;1352:	}
LABELV $690
line 1319
ADDRLP4 144
ADDRLP4 144
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $692
ADDRLP4 144
INDIRI4
ADDRLP4 136
INDIRI4
LTI4 $689
line 1353
;1353:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1355
;1354:
;1355:	return y;
ADDRFP4 0
INDIRF4
RETF4
LABELV $661
endproc CG_DrawPowerups 200 20
proc CG_DrawLowerRight 12 12
line 1366
;1356:}
;1357:#endif  // MISSIONPACK
;1358:
;1359:/*
;1360:=====================
;1361:CG_DrawLowerRight
;1362:
;1363:=====================
;1364:*/
;1365:#ifndef MISSIONPACK
;1366:static void CG_DrawLowerRight(void) {
line 1369
;1367:	float y;
;1368:
;1369:	y = cgs.screenYmax + 1 - STATUSBAR_HEIGHT;
ADDRLP4 0
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1114636288
SUBF4
ASGNF4
line 1371
;1370:
;1371:	if (cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 2) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $712
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 2
NEI4 $712
line 1372
;1372:		y = CG_DrawTeamOverlay(y, qtrue, qfalse);
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 1
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1373
;1373:	}
LABELV $712
line 1375
;1374:
;1375:	y = CG_DrawScores(y);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 4
ADDRGP4 CG_DrawScores
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1376
;1376:	y = CG_DrawPowerups(y);
ADDRLP4 0
INDIRF4
ARGF4
ADDRLP4 8
ADDRGP4 CG_DrawPowerups
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 8
INDIRF4
ASGNF4
line 1377
;1377:}
LABELV $710
endproc CG_DrawLowerRight 12 12
proc CG_DrawPickupItem 20 32
line 1386
;1378:#endif  // MISSIONPACK
;1379:
;1380:/*
;1381:===================
;1382:CG_DrawPickupItem
;1383:===================
;1384:*/
;1385:#ifndef MISSIONPACK
;1386:static int CG_DrawPickupItem(int y) {
line 1391
;1387:	int         value;
;1388:	float*      fadeColor;
;1389:	const char* text;
;1390:
;1391:	if (cg.snap->ps.stats[STAT_HEALTH] <= 0) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
GTI4 $717
line 1392
;1392:		return y;
ADDRFP4 0
INDIRI4
RETI4
ADDRGP4 $716
JUMPV
LABELV $717
line 1395
;1393:	}
;1394:
;1395:	y -= PICKUP_ICON_SIZE;
ADDRFP4 0
ADDRFP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 1397
;1396:
;1397:	value = cg.itemPickup;
ADDRLP4 0
ADDRGP4 cg+117832
INDIRI4
ASGNI4
line 1398
;1398:	if (value) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $721
line 1399
;1399:		fadeColor = CG_FadeColorTime(cg.itemPickupTime, 3000, 250);
ADDRGP4 cg+117840
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
CNSTI4 250
ARGI4
ADDRLP4 12
ADDRGP4 CG_FadeColorTime
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 12
INDIRP4
ASGNP4
line 1400
;1400:		if (fadeColor) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $724
line 1401
;1401:			CG_RegisterItemVisuals(value);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1402
;1402:			trap_R_SetColor(fadeColor);
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1403
;1403:			CG_DrawPic(cgs.screenXmin + 8, y, PICKUP_ICON_SIZE, PICKUP_ICON_SIZE, cg_items[value].icon);
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRFP4 0
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1107296256
ARGF4
CNSTF4 1107296256
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1404
;1404:			if (cg.itemPickupCount > 1) {
ADDRGP4 cg+117836
INDIRI4
CNSTI4 1
LEI4 $728
line 1405
;1405:				text = va("%s x%i", bg_itemlist[value].pickup_name, cg.itemPickupCount);
ADDRGP4 $731
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+28
ADDP4
INDIRP4
ARGP4
ADDRGP4 cg+117836
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 1406
;1406:			} else {
ADDRGP4 $729
JUMPV
LABELV $728
line 1407
;1407:				text = bg_itemlist[value].pickup_name;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 52
MULI4
ADDRGP4 bg_itemlist+28
ADDP4
INDIRP4
ASGNP4
line 1408
;1408:			}
LABELV $729
line 1410
;1409:
;1410:			CG_DrawString(
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 1107296256
ADDF4
CNSTF4 1098907648
ADDF4
ARGF4
ADDRFP4 0
INDIRI4
CNSTI4 10
ADDI4
CVIF4 4
ARGF4
ADDRLP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
CNSTF4 1094713344
ARGF4
CNSTF4 1094713344
ARGF4
CNSTI4 0
ARGI4
CNSTI4 5
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1414
;1411:				cgs.screenXmin + PICKUP_ICON_SIZE + 16, y + (PICKUP_ICON_SIZE / 2 - PICKUP_TEXT_SIZE / 2), text, fadeColor, PICKUP_TEXT_SIZE, PICKUP_TEXT_SIZE,
;1412:				0, DS_SHADOW | DS_PROPORTIONAL);
;1413:
;1414:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1415
;1415:		} else {
ADDRGP4 $725
JUMPV
LABELV $724
line 1416
;1416:			cg.itemPickupCount = 0;
ADDRGP4 cg+117836
CNSTI4 0
ASGNI4
line 1417
;1417:		}
LABELV $725
line 1418
;1418:	}
LABELV $721
line 1420
;1419:
;1420:	return y;
ADDRFP4 0
INDIRI4
RETI4
LABELV $716
endproc CG_DrawPickupItem 20 32
proc CG_DrawLowerLeft 8 12
line 1430
;1421:}
;1422:#endif  // MISSIONPACK
;1423:
;1424:/*
;1425:=====================
;1426:CG_DrawLowerLeft
;1427:=====================
;1428:*/
;1429:#ifndef MISSIONPACK
;1430:static void CG_DrawLowerLeft(void) {
line 1433
;1431:	float y;
;1432:
;1433:	y = cgs.screenYmax + 1 - STATUSBAR_HEIGHT;
ADDRLP4 0
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1114636288
SUBF4
ASGNF4
line 1435
;1434:
;1435:	if (cgs.gametype >= GT_TEAM && cg_drawTeamOverlay.integer == 3) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $739
ADDRGP4 cg_drawTeamOverlay+12
INDIRI4
CNSTI4 3
NEI4 $739
line 1436
;1436:		y = CG_DrawTeamOverlay(y, qfalse, qfalse);
ADDRLP4 0
INDIRF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 0
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawTeamOverlay
CALLF4
ASGNF4
ADDRLP4 0
ADDRLP4 4
INDIRF4
ASGNF4
line 1437
;1437:	}
LABELV $739
line 1439
;1438:
;1439:	y = CG_DrawPickupItem(y);
ADDRLP4 0
INDIRF4
CVFI4 4
ARGI4
ADDRLP4 4
ADDRGP4 CG_DrawPickupItem
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CVIF4 4
ASGNF4
line 1440
;1440:}
LABELV $737
endproc CG_DrawLowerLeft 8 12
proc CG_DrawTeamInfo 48 32
line 1451
;1441:#endif  // MISSIONPACK
;1442:
;1443://===========================================================================================
;1444:
;1445:/*
;1446:=================
;1447:CG_DrawTeamInfo
;1448:=================
;1449:*/
;1450:#ifndef MISSIONPACK
;1451:static void CG_DrawTeamInfo(void) {
line 1460
;1452:	int    w, h;
;1453:	int    i, len;
;1454:	vec4_t hcolor;
;1455:	int    chatHeight;
;1456:
;1457:#define CHATLOC_Y (cgs.screenYmax + 1 - STATUSBAR_HEIGHT)  // bottom end
;1458:#define CHATLOC_X (cgs.screenXmin)
;1459:
;1460:	if (cg_teamChatHeight.integer < TEAMCHAT_HEIGHT)
ADDRGP4 cg_teamChatHeight+12
INDIRI4
CNSTI4 8
GEI4 $744
line 1461
;1461:		chatHeight = cg_teamChatHeight.integer;
ADDRLP4 8
ADDRGP4 cg_teamChatHeight+12
INDIRI4
ASGNI4
ADDRGP4 $745
JUMPV
LABELV $744
line 1463
;1462:	else
;1463:		chatHeight = TEAMCHAT_HEIGHT;
ADDRLP4 8
CNSTI4 8
ASGNI4
LABELV $745
line 1464
;1464:	if (chatHeight <= 0)
ADDRLP4 8
INDIRI4
CNSTI4 0
GTI4 $748
line 1465
;1465:		return;  // disabled
ADDRGP4 $743
JUMPV
LABELV $748
line 1467
;1466:
;1467:	if (cgs.teamLastChatPos != cgs.teamChatPos) {
ADDRGP4 cgs+148688
INDIRI4
ADDRGP4 cgs+148684
INDIRI4
EQI4 $750
line 1468
;1468:		if (cg.time - cgs.teamChatMsgTimes[cgs.teamLastChatPos % chatHeight] > cg_teamChatTime.integer) {
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+148688
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148652
ADDP4
INDIRI4
SUBI4
ADDRGP4 cg_teamChatTime+12
INDIRI4
LEI4 $754
line 1469
;1469:			cgs.teamLastChatPos++;
ADDRLP4 36
ADDRGP4 cgs+148688
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 36
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1470
;1470:		}
LABELV $754
line 1472
;1471:
;1472:		h = (cgs.teamChatPos - cgs.teamLastChatPos) * TINYCHAR_HEIGHT;
ADDRLP4 32
ADDRGP4 cgs+148684
INDIRI4
ADDRGP4 cgs+148688
INDIRI4
SUBI4
CNSTI4 3
LSHI4
ASGNI4
line 1474
;1473:
;1474:		w = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1476
;1475:
;1476:		for (i = cgs.teamLastChatPos; i < cgs.teamChatPos; i++) {
ADDRLP4 0
ADDRGP4 cgs+148688
INDIRI4
ASGNI4
ADDRGP4 $766
JUMPV
LABELV $763
line 1477
;1477:			len = CG_DrawStrlen(cgs.teamChatMsgs[i % chatHeight]);
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 241
MULI4
ADDRGP4 cgs+146724
ADDP4
ARGP4
ADDRLP4 36
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 36
INDIRI4
ASGNI4
line 1478
;1478:			if (len > w)
ADDRLP4 4
INDIRI4
ADDRLP4 12
INDIRI4
LEI4 $770
line 1479
;1479:				w = len;
ADDRLP4 12
ADDRLP4 4
INDIRI4
ASGNI4
LABELV $770
line 1480
;1480:		}
LABELV $764
line 1476
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $766
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+148684
INDIRI4
LTI4 $763
line 1481
;1481:		w *= TINYCHAR_WIDTH;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 3
LSHI4
ASGNI4
line 1482
;1482:		w += TINYCHAR_WIDTH * 2;
ADDRLP4 12
ADDRLP4 12
INDIRI4
CNSTI4 16
ADDI4
ASGNI4
line 1484
;1483:
;1484:		if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_RED) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 1
NEI4 $772
line 1485
;1485:			hcolor[0] = 1.0f;
ADDRLP4 16
CNSTF4 1065353216
ASGNF4
line 1486
;1486:			hcolor[1] = 0.0f;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 1487
;1487:			hcolor[2] = 0.0f;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 1488
;1488:			hcolor[3] = 0.33f;
ADDRLP4 16+12
CNSTF4 1051260355
ASGNF4
line 1489
;1489:		} else if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_BLUE) {
ADDRGP4 $773
JUMPV
LABELV $772
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 2
NEI4 $778
line 1490
;1490:			hcolor[0] = 0.0f;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 1491
;1491:			hcolor[1] = 0.0f;
ADDRLP4 16+4
CNSTF4 0
ASGNF4
line 1492
;1492:			hcolor[2] = 1.0f;
ADDRLP4 16+8
CNSTF4 1065353216
ASGNF4
line 1493
;1493:			hcolor[3] = 0.33f;
ADDRLP4 16+12
CNSTF4 1051260355
ASGNF4
line 1494
;1494:		} else {
ADDRGP4 $779
JUMPV
LABELV $778
line 1495
;1495:			hcolor[0] = 0.0f;
ADDRLP4 16
CNSTF4 0
ASGNF4
line 1496
;1496:			hcolor[1] = 1.0f;
ADDRLP4 16+4
CNSTF4 1065353216
ASGNF4
line 1497
;1497:			hcolor[2] = 0.0f;
ADDRLP4 16+8
CNSTF4 0
ASGNF4
line 1498
;1498:			hcolor[3] = 0.33f;
ADDRLP4 16+12
CNSTF4 1051260355
ASGNF4
line 1499
;1499:		}
LABELV $779
LABELV $773
line 1501
;1500:
;1501:		trap_R_SetColor(hcolor);
ADDRLP4 16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1502
;1502:		CG_DrawPic(CHATLOC_X, CHATLOC_Y - h, w, h, cgs.media.teamStatusBar);
ADDRGP4 cgs+31452
INDIRF4
ARGF4
ADDRLP4 36
ADDRLP4 32
INDIRI4
CVIF4 4
ASGNF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1114636288
SUBF4
ADDRLP4 36
INDIRF4
SUBF4
ARGF4
ADDRLP4 12
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRGP4 cgs+148692+128
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1503
;1503:		trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1505
;1504:
;1505:		hcolor[0] = hcolor[1] = hcolor[2] = 1.0f;
ADDRLP4 40
CNSTF4 1065353216
ASGNF4
ADDRLP4 16+8
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 16+4
ADDRLP4 40
INDIRF4
ASGNF4
ADDRLP4 16
ADDRLP4 40
INDIRF4
ASGNF4
line 1506
;1506:		hcolor[3]                         = 1.0f;
ADDRLP4 16+12
CNSTF4 1065353216
ASGNF4
line 1508
;1507:
;1508:		for (i = cgs.teamChatPos - 1; i >= cgs.teamLastChatPos; i--) {
ADDRLP4 0
ADDRGP4 cgs+148684
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $797
JUMPV
LABELV $794
line 1509
;1509:			CG_DrawString(
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 1090519040
ADDF4
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1114636288
SUBF4
ADDRGP4 cgs+148684
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
CNSTI4 3
LSHI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MODI4
CNSTI4 241
MULI4
ADDRGP4 cgs+146724
ADDP4
ARGP4
ADDRLP4 16
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1090519040
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1512
;1510:				CHATLOC_X + TINYCHAR_WIDTH, CHATLOC_Y - (cgs.teamChatPos - i) * TINYCHAR_HEIGHT, cgs.teamChatMsgs[i % chatHeight], hcolor, TINYCHAR_WIDTH,
;1511:				TINYCHAR_HEIGHT, 0, DS_PROPORTIONAL);
;1512:		}
LABELV $795
line 1508
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
LABELV $797
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+148688
INDIRI4
GEI4 $794
line 1513
;1513:	}
LABELV $750
line 1514
;1514:}
LABELV $743
endproc CG_DrawTeamInfo 48 32
proc CG_DrawHoldableItem 4 20
line 1523
;1515:#endif  // MISSIONPACK
;1516:
;1517:/*
;1518:===================
;1519:CG_DrawHoldableItem
;1520:===================
;1521:*/
;1522:#ifndef MISSIONPACK
;1523:static void CG_DrawHoldableItem(void) {
line 1526
;1524:	int value;
;1525:
;1526:	value = cg.snap->ps.stats[STAT_HOLDABLE_ITEM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 232
ADDP4
INDIRI4
ASGNI4
line 1527
;1527:	if (value) {
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $806
line 1528
;1528:		CG_RegisterItemVisuals(value);
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 CG_RegisterItemVisuals
CALLV
pop
line 1529
;1529:		CG_DrawPic(cgs.screenXmax + 1 - ICON_SIZE, (SCREEN_HEIGHT - ICON_SIZE) / 2, ICON_SIZE, ICON_SIZE, cg_items[value].icon);
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ARGF4
CNSTF4 1129840640
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 0
INDIRI4
CNSTI4 28
MULI4
ADDRGP4 cg_items+20
ADDP4
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1530
;1530:	}
LABELV $806
line 1531
;1531:}
LABELV $804
endproc CG_DrawHoldableItem 4 20
proc CG_DrawReward 68 32
line 1558
;1532:#endif  // MISSIONPACK
;1533:
;1534:#ifdef MISSIONPACK
;1535:/*
;1536:===================
;1537:CG_DrawPersistantPowerup
;1538:===================
;1539:*/
;1540:#if 0  // sos001208 - DEAD
;1541:static void CG_DrawPersistantPowerup( void ) { 
;1542:	int		value;
;1543:
;1544:	value = cg.snap->ps.stats[STAT_PERSISTANT_POWERUP];
;1545:	if ( value ) {
;1546:		CG_RegisterItemVisuals( value );
;1547:		CG_DrawPic( 640-ICON_SIZE, (SCREEN_HEIGHT-ICON_SIZE)/2 - ICON_SIZE, ICON_SIZE, ICON_SIZE, cg_items[ value ].icon );
;1548:	}
;1549:}
;1550:#endif
;1551:#endif  // MISSIONPACK
;1552:
;1553:/*
;1554:===================
;1555:CG_DrawReward
;1556:===================
;1557:*/
;1558:static void CG_DrawReward(void) {
line 1564
;1559:	float* color;
;1560:	int    i, count;
;1561:	float  x, y;
;1562:	char   buf[32];
;1563:
;1564:	if (!cg_drawRewards.integer) {
ADDRGP4 cg_drawRewards+12
INDIRI4
CNSTI4 0
NEI4 $811
line 1565
;1565:		return;
ADDRGP4 $810
JUMPV
LABELV $811
line 1568
;1566:	}
;1567:
;1568:	color = CG_FadeColor(cg.rewardTime, REWARD_TIME);
ADDRGP4 cg+117600
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 52
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 52
INDIRP4
ASGNP4
line 1569
;1569:	if (!color) {
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $815
line 1570
;1570:		if (cg.rewardStack > 0) {
ADDRGP4 cg+117596
INDIRI4
CNSTI4 0
LEI4 $810
line 1571
;1571:			for (i = 0; i < cg.rewardStack; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $823
JUMPV
LABELV $820
line 1572
;1572:				cg.rewardSound[i]  = cg.rewardSound[i + 1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117684
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117684+4
ADDP4
INDIRI4
ASGNI4
line 1573
;1573:				cg.rewardShader[i] = cg.rewardShader[i + 1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117644
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117644+4
ADDP4
INDIRI4
ASGNI4
line 1574
;1574:				cg.rewardCount[i]  = cg.rewardCount[i + 1];
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117604
ADDP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cg+117604+4
ADDP4
INDIRI4
ASGNI4
line 1575
;1575:			}
LABELV $821
line 1571
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $823
ADDRLP4 0
INDIRI4
ADDRGP4 cg+117596
INDIRI4
LTI4 $820
line 1576
;1576:			cg.rewardTime = cg.time;
ADDRGP4 cg+117600
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1577
;1577:			cg.rewardStack--;
ADDRLP4 56
ADDRGP4 cg+117596
ASGNP4
ADDRLP4 56
INDIRP4
ADDRLP4 56
INDIRP4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 1578
;1578:			color = CG_FadeColor(cg.rewardTime, REWARD_TIME);
ADDRGP4 cg+117600
INDIRI4
ARGI4
CNSTI4 3000
ARGI4
ADDRLP4 60
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 16
ADDRLP4 60
INDIRP4
ASGNP4
line 1579
;1579:			trap_S_StartLocalSound(cg.rewardSound[0], CHAN_ANNOUNCER);
ADDRGP4 cg+117684
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 1580
;1580:		} else {
line 1581
;1581:			return;
LABELV $818
line 1583
;1582:		}
;1583:	}
LABELV $815
line 1585
;1584:
;1585:	trap_R_SetColor(color);
ADDRLP4 16
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1602
;1586:
;1587:	/*
;1588:	count = cg.rewardCount[0]/10;				// number of big rewards to draw
;1589:
;1590:	if (count) {
;1591:	    y = 4;
;1592:	    x = 320 - count * ICON_SIZE;
;1593:	    for ( i = 0 ; i < count ; i++ ) {
;1594:	        CG_DrawPic( x, y, (ICON_SIZE*2)-4, (ICON_SIZE*2)-4, cg.rewardShader[0] );
;1595:	        x += (ICON_SIZE*2);
;1596:	    }
;1597:	}
;1598:
;1599:	count = cg.rewardCount[0] - count*10;		// number of small rewards to draw
;1600:	*/
;1601:
;1602:	if (cg.rewardCount[0] >= 10) {
ADDRGP4 cg+117604
INDIRI4
CNSTI4 10
LTI4 $839
line 1603
;1603:		y = 56;  // FIXME: cgs.screenYmin + 56?
ADDRLP4 8
CNSTF4 1113587712
ASGNF4
line 1604
;1604:		x = 320 - ICON_SIZE / 2;
ADDRLP4 4
CNSTF4 1133772800
ASGNF4
line 1605
;1605:		CG_DrawPic(x, y, ICON_SIZE - 4, ICON_SIZE - 4, cg.rewardShader[0]);
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
CNSTF4 1110441984
ARGF4
CNSTF4 1110441984
ARGF4
ADDRGP4 cg+117644
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1606
;1606:		Com_sprintf(buf, sizeof(buf), "%d", cg.rewardCount[0]);
ADDRLP4 20
ARGP4
CNSTI4 32
ARGI4
ADDRGP4 $843
ARGP4
ADDRGP4 cg+117604
INDIRI4
ARGI4
ADDRGP4 Com_sprintf
CALLI4
pop
line 1607
;1607:		CG_DrawString(320, y + ICON_SIZE, buf, color, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER);
CNSTF4 1134559232
ARGF4
ADDRLP4 8
INDIRF4
CNSTF4 1111490560
ADDF4
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 16
INDIRP4
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1608
;1608:	} else {
ADDRGP4 $840
JUMPV
LABELV $839
line 1610
;1609:
;1610:		count = cg.rewardCount[0];
ADDRLP4 12
ADDRGP4 cg+117604
INDIRI4
ASGNI4
line 1612
;1611:
;1612:		y = 56;  // FIXME: cgs.screenYmin + 56?
ADDRLP4 8
CNSTF4 1113587712
ASGNF4
line 1613
;1613:		x = 320 - count * ICON_SIZE / 2;
ADDRLP4 4
CNSTI4 320
ADDRLP4 12
INDIRI4
CNSTI4 48
MULI4
CNSTI4 2
DIVI4
SUBI4
CVIF4 4
ASGNF4
line 1614
;1614:		for (i = 0; i < count; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $849
JUMPV
LABELV $846
line 1615
;1615:			CG_DrawPic(x, y, ICON_SIZE - 4, ICON_SIZE - 4, cg.rewardShader[0]);
ADDRLP4 4
INDIRF4
ARGF4
ADDRLP4 8
INDIRF4
ARGF4
CNSTF4 1110441984
ARGF4
CNSTF4 1110441984
ARGF4
ADDRGP4 cg+117644
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1616
;1616:			x += ICON_SIZE;
ADDRLP4 4
ADDRLP4 4
INDIRF4
CNSTF4 1111490560
ADDF4
ASGNF4
line 1617
;1617:		}
LABELV $847
line 1614
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $849
ADDRLP4 0
INDIRI4
ADDRLP4 12
INDIRI4
LTI4 $846
line 1618
;1618:	}
LABELV $840
line 1619
;1619:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1620
;1620:}
LABELV $810
endproc CG_DrawReward 68 32
export CG_AddLagometerFrameInfo
proc CG_AddLagometerFrameInfo 8 0
line 1649
;1621:
;1622:/*
;1623:===============================================================================
;1624:
;1625:LAGOMETER
;1626:
;1627:===============================================================================
;1628:*/
;1629:
;1630:#define LAG_SAMPLES 128
;1631:
;1632:typedef struct {
;1633:	int frameSamples[LAG_SAMPLES];
;1634:	int frameCount;
;1635:	int snapshotFlags[LAG_SAMPLES];
;1636:	int snapshotSamples[LAG_SAMPLES];
;1637:	int snapshotCount;
;1638:} lagometer_t;
;1639:
;1640:lagometer_t lagometer;
;1641:
;1642:/*
;1643:==============
;1644:CG_AddLagometerFrameInfo
;1645:
;1646:Adds the current interpolate / extrapolate bar for this frame
;1647:==============
;1648:*/
;1649:void CG_AddLagometerFrameInfo(void) {
line 1652
;1650:	int offset;
;1651:
;1652:	offset                                                           = cg.time - cg.latestSnapshotTime;
ADDRLP4 0
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+32
INDIRI4
SUBI4
ASGNI4
line 1653
;1653:	lagometer.frameSamples[lagometer.frameCount & (LAG_SAMPLES - 1)] = offset;
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
ADDRLP4 0
INDIRI4
ASGNI4
line 1654
;1654:	lagometer.frameCount++;
ADDRLP4 4
ADDRGP4 lagometer+512
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1655
;1655:}
LABELV $852
endproc CG_AddLagometerFrameInfo 8 0
export CG_AddLagometerSnapshotInfo
proc CG_AddLagometerSnapshotInfo 4 0
line 1667
;1656:
;1657:/*
;1658:==============
;1659:CG_AddLagometerSnapshotInfo
;1660:
;1661:Each time a snapshot is received, log its ping time and
;1662:the number of snapshots that were dropped before it.
;1663:
;1664:Pass NULL for a dropped packet.
;1665:==============
;1666:*/
;1667:void CG_AddLagometerSnapshotInfo(snapshot_t* snap) {
line 1669
;1668:	// dropped packet
;1669:	if (!snap) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $858
line 1670
;1670:		lagometer.snapshotSamples[lagometer.snapshotCount & (LAG_SAMPLES - 1)] = -1;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
CNSTI4 -1
ASGNI4
line 1671
;1671:		lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1672
;1672:		return;
ADDRGP4 $857
JUMPV
LABELV $858
line 1676
;1673:	}
;1674:
;1675:	// add this snapshot's info
;1676:	lagometer.snapshotSamples[lagometer.snapshotCount & (LAG_SAMPLES - 1)] = snap->ping;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
ADDRFP4 0
INDIRP4
CNSTI4 4
ADDP4
INDIRI4
ASGNI4
line 1677
;1677:	lagometer.snapshotFlags[lagometer.snapshotCount & (LAG_SAMPLES - 1)]   = snap->snapFlags;
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 127
BANDI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
ADDRFP4 0
INDIRP4
INDIRI4
ASGNI4
line 1678
;1678:	lagometer.snapshotCount++;
ADDRLP4 0
ADDRGP4 lagometer+1540
ASGNP4
ADDRLP4 0
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 1679
;1679:}
LABELV $857
endproc CG_AddLagometerSnapshotInfo 4 0
proc CG_DrawDisconnect 52 32
line 1688
;1680:
;1681:/*
;1682:==============
;1683:CG_DrawDisconnect
;1684:
;1685:Should we draw something differnet for long lag vs no packets?
;1686:==============
;1687:*/
;1688:static void CG_DrawDisconnect(void) {
line 1695
;1689:	float       x, y;
;1690:	int         cmdNum;
;1691:	usercmd_t   cmd;
;1692:	const char* s;
;1693:
;1694:	// draw the phone jack if we are completely past our buffers
;1695:	cmdNum = trap_GetCurrentCmdNumber() - CMD_BACKUP + 1;
ADDRLP4 40
ADDRGP4 trap_GetCurrentCmdNumber
CALLI4
ASGNI4
ADDRLP4 32
ADDRLP4 40
INDIRI4
CNSTI4 64
SUBI4
CNSTI4 1
ADDI4
ASGNI4
line 1696
;1696:	trap_GetUserCmd(cmdNum, &cmd);
ADDRLP4 32
INDIRI4
ARGI4
ADDRLP4 0
ARGP4
ADDRGP4 trap_GetUserCmd
CALLI4
pop
line 1697
;1697:	if (cmd.serverTime <= cg.snap->ps.commandTime || cmd.serverTime > cg.time) {  // special check for map_restart // bk 0102165 - FIXME
ADDRLP4 44
ADDRLP4 0
INDIRI4
ASGNI4
ADDRLP4 44
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 44
ADDP4
INDIRI4
LEI4 $873
ADDRLP4 44
INDIRI4
ADDRGP4 cg+107604
INDIRI4
LEI4 $869
LABELV $873
line 1698
;1698:		return;
ADDRGP4 $868
JUMPV
LABELV $869
line 1702
;1699:	}
;1700:
;1701:	// also add text in center of screen
;1702:	s = "Connection Interrupted";
ADDRLP4 36
ADDRGP4 $874
ASGNP4
line 1703
;1703:	CG_DrawString(320, cgs.screenYmin + 100, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_PROPORTIONAL | DS_CENTER);
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31460
INDIRF4
CNSTF4 1120403456
ADDF4
ARGF4
ADDRLP4 36
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1706
;1704:
;1705:	// blink the icon
;1706:	if ((cg.time >> 9) & 1) {
ADDRGP4 cg+107604
INDIRI4
CNSTI4 9
RSHI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $876
line 1707
;1707:		return;
ADDRGP4 $868
JUMPV
LABELV $876
line 1710
;1708:	}
;1709:
;1710:	x = cgs.screenXmax + 1 - 48;
ADDRLP4 24
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 1711
;1711:	y = cgs.screenYmax + 1 - 48;
ADDRLP4 28
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
ASGNF4
line 1713
;1712:
;1713:	CG_DrawPic(x, y, 48, 48, trap_R_RegisterShader("gfx/2d/net.tga"));
ADDRGP4 $881
ARGP4
ADDRLP4 48
ADDRGP4 trap_R_RegisterShader
CALLI4
ASGNI4
ADDRLP4 24
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRLP4 48
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1714
;1714:}
LABELV $868
endproc CG_DrawDisconnect 52 32
proc CG_DrawLagometer 56 36
line 1724
;1715:
;1716:#define MAX_LAGOMETER_PING  900
;1717:#define MAX_LAGOMETER_RANGE 300
;1718:
;1719:/*
;1720:==============
;1721:CG_DrawLagometer
;1722:==============
;1723:*/
;1724:static void CG_DrawLagometer(void) {
line 1731
;1725:	int   a, x, y, i;
;1726:	float v;
;1727:	float ax, ay, aw, ah, mid, range;
;1728:	int   color;
;1729:	float vscale;
;1730:
;1731:	if (!cg_lagometer.integer || cgs.localServer) {
ADDRGP4 cg_lagometer+12
INDIRI4
CNSTI4 0
EQI4 $887
ADDRGP4 cgs+31476
INDIRI4
CNSTI4 0
EQI4 $883
LABELV $887
line 1732
;1732:		CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 1733
;1733:		return;
ADDRGP4 $882
JUMPV
LABELV $883
line 1743
;1734:	}
;1735:
;1736:	//
;1737:	// draw the graph
;1738:	//
;1739:#ifdef MISSIONPACK
;1740:	x = cgs.screenXmax + 1 - 48;
;1741:	y = cgs.screenYmax + 1 - 144;
;1742:#else
;1743:	x = cgs.screenXmax + 1 - 48;
ADDRLP4 48
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
CVFI4 4
ASGNI4
line 1744
;1744:	y = cgs.screenYmax + 1 - 48;
ADDRLP4 44
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1065353216
ADDF4
CNSTF4 1111490560
SUBF4
CVFI4 4
ASGNI4
line 1747
;1745:#endif
;1746:
;1747:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1748
;1748:	CG_DrawPic(x, y, 48, 48, cgs.media.lagometerShader);
ADDRLP4 48
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
CNSTF4 1111490560
ARGF4
CNSTF4 1111490560
ARGF4
ADDRGP4 cgs+148692+264
INDIRI4
ARGI4
ADDRGP4 CG_DrawPic
CALLV
pop
line 1750
;1749:
;1750:	ax = x;
ADDRLP4 24
ADDRLP4 48
INDIRI4
CVIF4 4
ASGNF4
line 1751
;1751:	ay = y;
ADDRLP4 36
ADDRLP4 44
INDIRI4
CVIF4 4
ASGNF4
line 1752
;1752:	aw = 48;
ADDRLP4 12
CNSTF4 1111490560
ASGNF4
line 1753
;1753:	ah = 48;
ADDRLP4 32
CNSTF4 1111490560
ASGNF4
line 1754
;1754:	CG_AdjustFrom640(&ax, &ay, &aw, &ah);
ADDRLP4 24
ARGP4
ADDRLP4 36
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 32
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 1756
;1755:
;1756:	color = -1;
ADDRLP4 20
CNSTI4 -1
ASGNI4
line 1757
;1757:	range = ah / 3;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1051372203
MULF4
ASGNF4
line 1758
;1758:	mid   = ay + range;
ADDRLP4 40
ADDRLP4 36
INDIRF4
ADDRLP4 16
INDIRF4
ADDF4
ASGNF4
line 1760
;1759:
;1760:	vscale = range / MAX_LAGOMETER_RANGE;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 995783694
MULF4
ASGNF4
line 1763
;1761:
;1762:	// draw the frame interpoalte / extrapolate graph
;1763:	for (a = 0; a < aw; a++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $895
JUMPV
LABELV $892
line 1764
;1764:		i = (lagometer.frameCount - 1 - a) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+512
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 1765
;1765:		v = lagometer.frameSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1766
;1766:		v *= vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1767
;1767:		if (v > 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $897
line 1768
;1768:			if (color != 1) {
ADDRLP4 20
INDIRI4
CNSTI4 1
EQI4 $899
line 1769
;1769:				color = 1;
ADDRLP4 20
CNSTI4 1
ASGNI4
line 1770
;1770:				trap_R_SetColor(g_color_table[ColorIndex(COLOR_YELLOW)]);
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1771
;1771:			}
LABELV $899
line 1772
;1772:			if (v > range) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $902
line 1773
;1773:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1774
;1774:			}
LABELV $902
line 1775
;1775:			trap_R_DrawStretchPic(ax + aw - a, mid - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader);
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
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
line 1776
;1776:		} else if (v < 0) {
ADDRGP4 $898
JUMPV
LABELV $897
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $906
line 1777
;1777:			if (color != 2) {
ADDRLP4 20
INDIRI4
CNSTI4 2
EQI4 $908
line 1778
;1778:				color = 2;
ADDRLP4 20
CNSTI4 2
ASGNI4
line 1779
;1779:				trap_R_SetColor(g_color_table[ColorIndex(COLOR_BLUE)]);
ADDRGP4 g_color_table+64
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1780
;1780:			}
LABELV $908
line 1781
;1781:			v = -v;
ADDRLP4 0
ADDRLP4 0
INDIRF4
NEGF4
ASGNF4
line 1782
;1782:			if (v > range) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $911
line 1783
;1783:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1784
;1784:			}
LABELV $911
line 1785
;1785:			trap_R_DrawStretchPic(ax + aw - a, mid, 1, v, 0, 0, 0, 0, cgs.media.whiteShader);
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 40
INDIRF4
ARGF4
CNSTF4 1065353216
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
line 1786
;1786:		}
LABELV $906
LABELV $898
line 1787
;1787:	}
LABELV $893
line 1763
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $895
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $892
line 1790
;1788:
;1789:	// draw the snapshot latency / drop graph
;1790:	range  = ah / 2;
ADDRLP4 16
ADDRLP4 32
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 1791
;1791:	vscale = range / MAX_LAGOMETER_PING;
ADDRLP4 28
ADDRLP4 16
INDIRF4
CNSTF4 982622900
MULF4
ASGNF4
line 1793
;1792:
;1793:	for (a = 0; a < aw; a++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
ADDRGP4 $918
JUMPV
LABELV $915
line 1794
;1794:		i = (lagometer.snapshotCount - 1 - a) & (LAG_SAMPLES - 1);
ADDRLP4 8
ADDRGP4 lagometer+1540
INDIRI4
CNSTI4 1
SUBI4
ADDRLP4 4
INDIRI4
SUBI4
CNSTI4 127
BANDI4
ASGNI4
line 1795
;1795:		v = lagometer.snapshotSamples[i];
ADDRLP4 0
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
INDIRI4
CVIF4 4
ASGNF4
line 1796
;1796:		if (v > 0) {
ADDRLP4 0
INDIRF4
CNSTF4 0
LEF4 $921
line 1797
;1797:			if (lagometer.snapshotFlags[i] & SNAPFLAG_RATE_DELAYED) {
ADDRLP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+516
ADDP4
INDIRI4
CNSTI4 1
BANDI4
CNSTI4 0
EQI4 $923
line 1798
;1798:				if (color != 5) {
ADDRLP4 20
INDIRI4
CNSTI4 5
EQI4 $924
line 1799
;1799:					color = 5;  // YELLOW for rate delay
ADDRLP4 20
CNSTI4 5
ASGNI4
line 1800
;1800:					trap_R_SetColor(g_color_table[ColorIndex(COLOR_YELLOW)]);
ADDRGP4 g_color_table+48
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1801
;1801:				}
line 1802
;1802:			} else {
ADDRGP4 $924
JUMPV
LABELV $923
line 1803
;1803:				if (color != 3) {
ADDRLP4 20
INDIRI4
CNSTI4 3
EQI4 $929
line 1804
;1804:					color = 3;
ADDRLP4 20
CNSTI4 3
ASGNI4
line 1805
;1805:					trap_R_SetColor(g_color_table[ColorIndex(COLOR_GREEN)]);
ADDRGP4 g_color_table+32
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1806
;1806:				}
LABELV $929
line 1807
;1807:			}
LABELV $924
line 1808
;1808:			v = v * vscale;
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 28
INDIRF4
MULF4
ASGNF4
line 1809
;1809:			if (v > range) {
ADDRLP4 0
INDIRF4
ADDRLP4 16
INDIRF4
LEF4 $932
line 1810
;1810:				v = range;
ADDRLP4 0
ADDRLP4 16
INDIRF4
ASGNF4
line 1811
;1811:			}
LABELV $932
line 1812
;1812:			trap_R_DrawStretchPic(ax + aw - a, ay + ah - v, 1, v, 0, 0, 0, 0, cgs.media.whiteShader);
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 0
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
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
line 1813
;1813:		} else if (v < 0) {
ADDRGP4 $922
JUMPV
LABELV $921
ADDRLP4 0
INDIRF4
CNSTF4 0
GEF4 $936
line 1814
;1814:			if (color != 4) {
ADDRLP4 20
INDIRI4
CNSTI4 4
EQI4 $938
line 1815
;1815:				color = 4;  // RED for dropped snapshots
ADDRLP4 20
CNSTI4 4
ASGNI4
line 1816
;1816:				trap_R_SetColor(g_color_table[ColorIndex(COLOR_RED)]);
ADDRGP4 g_color_table+16
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1817
;1817:			}
LABELV $938
line 1818
;1818:			trap_R_DrawStretchPic(ax + aw - a, ay + ah - range, 1, range, 0, 0, 0, 0, cgs.media.whiteShader);
ADDRLP4 24
INDIRF4
ADDRLP4 12
INDIRF4
ADDF4
ADDRLP4 4
INDIRI4
CVIF4 4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ADDRLP4 32
INDIRF4
ADDF4
ADDRLP4 16
INDIRF4
SUBF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRLP4 16
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
line 1819
;1819:		}
LABELV $936
LABELV $922
line 1820
;1820:	}
LABELV $916
line 1793
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $918
ADDRLP4 4
INDIRI4
CVIF4 4
ADDRLP4 12
INDIRF4
LTF4 $915
line 1822
;1821:
;1822:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1824
;1823:
;1824:	if (cg_nopredict.integer || cgs.synchronousClients) {
ADDRGP4 cg_nopredict+12
INDIRI4
CNSTI4 0
NEI4 $947
ADDRGP4 cgs+149684
INDIRI4
CNSTI4 0
EQI4 $943
LABELV $947
line 1825
;1825:		CG_DrawString(cgs.screenXmax - 1, y, "snc", colorWhite, 5, 10, 0, DS_PROPORTIONAL | DS_RIGHT);
ADDRGP4 cgs+31456
INDIRF4
CNSTF4 1065353216
SUBF4
ARGF4
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 $949
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1084227584
ARGF4
CNSTF4 1092616192
ARGF4
CNSTI4 0
ARGI4
CNSTI4 20
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1826
;1826:	}
LABELV $943
line 1828
;1827:
;1828:	if (!cg.demoPlayback) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $950
line 1829
;1829:		CG_DrawString(x + 1, y, va("%ims", cg.meanPing), colorWhite, 5, 10, 0, DS_PROPORTIONAL);
ADDRGP4 $953
ARGP4
ADDRGP4 cg+149068
INDIRI4
ARGI4
ADDRLP4 52
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 48
INDIRI4
CNSTI4 1
ADDI4
CVIF4 4
ARGF4
ADDRLP4 44
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 52
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1084227584
ARGF4
CNSTF4 1092616192
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1830
;1830:	}
LABELV $950
line 1832
;1831:
;1832:	CG_DrawDisconnect();
ADDRGP4 CG_DrawDisconnect
CALLV
pop
line 1833
;1833:}
LABELV $882
endproc CG_DrawLagometer 56 36
export CG_CenterPrint
proc CG_CenterPrint 8 12
line 1851
;1834:
;1835:/*
;1836:===============================================================================
;1837:
;1838:CENTER PRINTING
;1839:
;1840:===============================================================================
;1841:*/
;1842:
;1843:/*
;1844:==============
;1845:CG_CenterPrint
;1846:
;1847:Called for important messages that should stay in the center of the screen
;1848:for a few moments
;1849:==============
;1850:*/
;1851:void CG_CenterPrint(const char* str, int y, int charWidth) {
line 1854
;1852:	char* s;
;1853:
;1854:	Q_strncpyz(cg.centerPrint, str, sizeof(cg.centerPrint));
ADDRGP4 cg+116500
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 1856
;1855:
;1856:	cg.centerPrintTime      = cg.time;
ADDRGP4 cg+116488
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 1857
;1857:	cg.centerPrintY         = y;
ADDRGP4 cg+116496
ADDRFP4 4
INDIRI4
ASGNI4
line 1858
;1858:	cg.centerPrintCharWidth = charWidth;
ADDRGP4 cg+116492
ADDRFP4 8
INDIRI4
ASGNI4
line 1861
;1859:
;1860:	// count the number of lines for centering
;1861:	cg.centerPrintLines = 1;
ADDRGP4 cg+117524
CNSTI4 1
ASGNI4
line 1862
;1862:	s                   = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+116500
ASGNP4
ADDRGP4 $965
JUMPV
LABELV $964
line 1863
;1863:	while (*s) {
line 1864
;1864:		if (*s == '\n')
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $967
line 1865
;1865:			cg.centerPrintLines++;
ADDRLP4 4
ADDRGP4 cg+117524
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $967
line 1866
;1866:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1867
;1867:	}
LABELV $965
line 1863
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $964
line 1868
;1868:}
LABELV $955
endproc CG_CenterPrint 8 12
proc CG_DrawCenterString 1052 32
line 1875
;1869:
;1870:/*
;1871:===================
;1872:CG_DrawCenterString
;1873:===================
;1874:*/
;1875:static void CG_DrawCenterString(void) {
line 1884
;1876:	char* start;
;1877:	int   l;
;1878:	int   y;
;1879:#ifdef MISSIONPACK  // bk010221 - unused else
;1880:	int h;
;1881:#endif
;1882:	float* color;
;1883:
;1884:	if (!cg.centerPrintTime) {
ADDRGP4 cg+116488
INDIRI4
CNSTI4 0
NEI4 $971
line 1885
;1885:		return;
ADDRGP4 $970
JUMPV
LABELV $971
line 1888
;1886:	}
;1887:
;1888:	color = CG_FadeColor(cg.centerPrintTime, 1000 * cg_centertime.value);
ADDRGP4 cg+116488
INDIRI4
ARGI4
ADDRGP4 cg_centertime+8
INDIRF4
CNSTF4 1148846080
MULF4
CVFI4 4
ARGI4
ADDRLP4 16
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 16
INDIRP4
ASGNP4
line 1889
;1889:	if (!color) {
ADDRLP4 12
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $976
line 1890
;1890:		return;
ADDRGP4 $970
JUMPV
LABELV $976
line 1893
;1891:	}
;1892:
;1893:	trap_R_SetColor(color);
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1895
;1894:
;1895:	start = cg.centerPrint;
ADDRLP4 0
ADDRGP4 cg+116500
ASGNP4
line 1897
;1896:
;1897:	y = cg.centerPrintY - cg.centerPrintLines * BIGCHAR_HEIGHT / 2;
ADDRLP4 8
ADDRGP4 cg+116496
INDIRI4
ADDRGP4 cg+117524
INDIRI4
CNSTI4 4
LSHI4
CNSTI4 2
DIVI4
SUBI4
ASGNI4
ADDRGP4 $982
JUMPV
LABELV $981
line 1899
;1898:
;1899:	while (1) {
line 1902
;1900:		char linebuffer[1024];
;1901:
;1902:		for (l = 0; l < 50; l++) {
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $984
line 1903
;1903:			if (!start[l] || start[l] == '\n') {
ADDRLP4 1044
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $990
ADDRLP4 1044
INDIRI4
CNSTI4 10
NEI4 $988
LABELV $990
line 1904
;1904:				break;
ADDRGP4 $986
JUMPV
LABELV $988
line 1906
;1905:			}
;1906:			linebuffer[l] = start[l];
ADDRLP4 4
INDIRI4
ADDRLP4 20
ADDP4
ADDRLP4 4
INDIRI4
ADDRLP4 0
INDIRP4
ADDP4
INDIRI1
ASGNI1
line 1907
;1907:		}
LABELV $985
line 1902
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 50
LTI4 $984
LABELV $986
line 1908
;1908:		linebuffer[l] = 0;
ADDRLP4 4
INDIRI4
ADDRLP4 20
ADDP4
CNSTI1 0
ASGNI1
line 1917
;1909:
;1910:#ifdef MISSIONPACK
;1911:		w = CG_Text_Width(linebuffer, 0.5, 0);
;1912:		h = CG_Text_Height(linebuffer, 0.5, 0);
;1913:		x = (SCREEN_WIDTH - w) / 2;
;1914:		CG_Text_Paint(x, y + h, 0.5, color, linebuffer, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;1915:		y += h + 6;
;1916:#else
;1917:		CG_DrawString(320, y, linebuffer, color, cg.centerPrintCharWidth, cg.centerPrintCharWidth * 1.5, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL);
CNSTF4 1134559232
ARGF4
ADDRLP4 8
INDIRI4
CVIF4 4
ARGF4
ADDRLP4 20
ARGP4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 cg+116492
INDIRI4
CVIF4 4
ARGF4
ADDRGP4 cg+116492
INDIRI4
CVIF4 4
CNSTF4 1069547520
MULF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 1919
;1918:
;1919:		y += cg.centerPrintCharWidth * 1.5;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CVIF4 4
ADDRGP4 cg+116492
INDIRI4
CVIF4 4
CNSTF4 1069547520
MULF4
ADDF4
CVFI4 4
ASGNI4
ADDRGP4 $995
JUMPV
LABELV $994
line 1921
;1920:#endif
;1921:		while (*start && (*start != '\n')) {
line 1922
;1922:			start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1923
;1923:		}
LABELV $995
line 1921
ADDRLP4 1044
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
EQI4 $997
ADDRLP4 1044
INDIRI4
CNSTI4 10
NEI4 $994
LABELV $997
line 1924
;1924:		if (!*start) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $998
line 1925
;1925:			break;
ADDRGP4 $983
JUMPV
LABELV $998
line 1927
;1926:		}
;1927:		start++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1928
;1928:	}
LABELV $982
line 1899
ADDRGP4 $981
JUMPV
LABELV $983
line 1930
;1929:
;1930:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1931
;1931:}
LABELV $970
endproc CG_DrawCenterString 1052 32
proc CG_DrawCrosshair 44 36
line 1946
;1932:
;1933:/*
;1934:================================================================================
;1935:
;1936:CROSSHAIR
;1937:
;1938:================================================================================
;1939:*/
;1940:
;1941:/*
;1942:=================
;1943:CG_DrawCrosshair
;1944:=================
;1945:*/
;1946:static void CG_DrawCrosshair(void) {
line 1953
;1947:	float     w, h;
;1948:	qhandle_t hShader;
;1949:	float     f;
;1950:	float     x, y;
;1951:	int       ca;
;1952:
;1953:	if (!cg_drawCrosshair.integer) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $1001
line 1954
;1954:		return;
ADDRGP4 $1000
JUMPV
LABELV $1001
line 1957
;1955:	}
;1956:
;1957:	if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1004
line 1958
;1958:		return;
ADDRGP4 $1000
JUMPV
LABELV $1004
line 1961
;1959:	}
;1960:
;1961:	if (cg.renderingThirdPerson) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
EQI4 $1007
line 1962
;1962:		return;
ADDRGP4 $1000
JUMPV
LABELV $1007
line 1966
;1963:	}
;1964:
;1965:	// set color based on health
;1966:	if (cg_crosshairHealth.integer) {
ADDRGP4 cg_crosshairHealth+12
INDIRI4
CNSTI4 0
EQI4 $1010
line 1969
;1967:		vec4_t hcolor;
;1968:
;1969:		CG_ColorForHealth(hcolor);
ADDRLP4 28
ARGP4
ADDRGP4 CG_ColorForHealth
CALLV
pop
line 1970
;1970:		trap_R_SetColor(hcolor);
ADDRLP4 28
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1971
;1971:	} else {
ADDRGP4 $1011
JUMPV
LABELV $1010
line 1972
;1972:		trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 1973
;1973:	}
LABELV $1011
line 1975
;1974:
;1975:	w = h = cg_crosshairSize.value;
ADDRLP4 28
ADDRGP4 cg_crosshairSize+8
INDIRF4
ASGNF4
ADDRLP4 4
ADDRLP4 28
INDIRF4
ASGNF4
ADDRLP4 0
ADDRLP4 28
INDIRF4
ASGNF4
line 1978
;1976:
;1977:	// pulse the size of the crosshair when picking up items
;1978:	f = cg.time - cg.itemPickupBlendTime;
ADDRLP4 8
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cg+117844
INDIRI4
SUBI4
CVIF4 4
ASGNF4
line 1979
;1979:	if (f > 0 && f < ITEM_BLOB_TIME) {
ADDRLP4 8
INDIRF4
CNSTF4 0
LEF4 $1016
ADDRLP4 8
INDIRF4
CNSTF4 1128792064
GEF4 $1016
line 1980
;1980:		f /= ITEM_BLOB_TIME;
ADDRLP4 8
ADDRLP4 8
INDIRF4
CNSTF4 1000593162
MULF4
ASGNF4
line 1981
;1981:		w *= (1 + f);
ADDRLP4 0
ADDRLP4 0
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 1982
;1982:		h *= (1 + f);
ADDRLP4 4
ADDRLP4 4
INDIRF4
ADDRLP4 8
INDIRF4
CNSTF4 1065353216
ADDF4
MULF4
ASGNF4
line 1983
;1983:	}
LABELV $1016
line 1985
;1984:
;1985:	x = cg_crosshairX.integer;
ADDRLP4 16
ADDRGP4 cg_crosshairX+12
INDIRI4
CVIF4 4
ASGNF4
line 1986
;1986:	y = cg_crosshairY.integer;
ADDRLP4 20
ADDRGP4 cg_crosshairY+12
INDIRI4
CVIF4 4
ASGNF4
line 1988
;1987:
;1988:	CG_AdjustFrom640(&x, &y, &w, &h);
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRLP4 0
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 1990
;1989:
;1990:	ca = cg_drawCrosshair.integer;
ADDRLP4 12
ADDRGP4 cg_drawCrosshair+12
INDIRI4
ASGNI4
line 1991
;1991:	if (ca < 0) {
ADDRLP4 12
INDIRI4
CNSTI4 0
GEI4 $1021
line 1992
;1992:		ca = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 1993
;1993:	}
LABELV $1021
line 1995
;1994:
;1995:	hShader = cgs.media.crosshairShader[ca % NUM_CROSSHAIRS];
ADDRLP4 24
ADDRLP4 12
INDIRI4
CNSTI4 10
MODI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+148692+224
ADDP4
INDIRI4
ASGNI4
line 1997
;1996:
;1997:	trap_R_DrawStretchPic(
ADDRLP4 36
ADDRLP4 0
INDIRF4
ASGNF4
ADDRLP4 16
INDIRF4
ADDRGP4 cg+109056
INDIRI4
CVIF4 4
ADDF4
ADDRGP4 cg+109056+8
INDIRI4
CVIF4 4
ADDRLP4 36
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ADDF4
ADDRGP4 cgs+31444
INDIRF4
SUBF4
ARGF4
ADDRLP4 40
ADDRLP4 4
INDIRF4
ASGNF4
ADDRLP4 20
INDIRF4
ADDRGP4 cg+109056+4
INDIRI4
CVIF4 4
ADDF4
ADDRGP4 cg+109056+12
INDIRI4
CVIF4 4
ADDRLP4 40
INDIRF4
SUBF4
CNSTF4 1056964608
MULF4
ADDF4
ADDRGP4 cgs+31448
INDIRF4
SUBF4
ARGF4
ADDRLP4 36
INDIRF4
ARGF4
ADDRLP4 40
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
ADDRLP4 24
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2000
;1998:		x + cg.refdef.x + 0.5 * (cg.refdef.width - w) - cgs.screenXBias, y + cg.refdef.y + 0.5 * (cg.refdef.height - h) - cgs.screenYBias, w, h, 0, 0, 1, 1,
;1999:		hShader);
;2000:}
LABELV $1000
endproc CG_DrawCrosshair 44 36
proc CG_ScanForCrosshairEntity 92 28
line 2007
;2001:
;2002:/*
;2003:=================
;2004:CG_ScanForCrosshairEntity
;2005:=================
;2006:*/
;2007:static void CG_ScanForCrosshairEntity(void) {
line 2012
;2008:	trace_t trace;
;2009:	vec3_t  start, end;
;2010:	int     content;
;2011:
;2012:	VectorCopy(cg.refdef.vieworg, start);
ADDRLP4 56
ADDRGP4 cg+109056+24
INDIRB
ASGNB 12
line 2013
;2013:	VectorMA(start, 131072, cg.refdef.viewaxis[0], end);
ADDRLP4 68
ADDRLP4 56
INDIRF4
ADDRGP4 cg+109056+36
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 68+4
ADDRLP4 56+4
INDIRF4
ADDRGP4 cg+109056+36+4
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
ADDRLP4 68+8
ADDRLP4 56+8
INDIRF4
ADDRGP4 cg+109056+36+8
INDIRF4
CNSTF4 1207959552
MULF4
ADDF4
ASGNF4
line 2015
;2014:
;2015:	CG_Trace(&trace, start, vec3_origin, vec3_origin, end, cg.snap->ps.clientNum, CONTENTS_SOLID | CONTENTS_BODY);
ADDRLP4 0
ARGP4
ADDRLP4 56
ARGP4
ADDRLP4 84
ADDRGP4 vec3_origin
ASGNP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 84
INDIRP4
ARGP4
ADDRLP4 68
ARGP4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ARGI4
CNSTI4 33554433
ARGI4
ADDRGP4 CG_Trace
CALLV
pop
line 2016
;2016:	if (trace.entityNum >= MAX_CLIENTS) {
ADDRLP4 0+52
INDIRI4
CNSTI4 64
LTI4 $1050
line 2017
;2017:		return;
ADDRGP4 $1034
JUMPV
LABELV $1050
line 2021
;2018:	}
;2019:
;2020:	// if the player is in fog, don't show it
;2021:	content = CG_PointContents(trace.endpos, 0);
ADDRLP4 0+12
ARGP4
CNSTI4 0
ARGI4
ADDRLP4 88
ADDRGP4 CG_PointContents
CALLI4
ASGNI4
ADDRLP4 80
ADDRLP4 88
INDIRI4
ASGNI4
line 2022
;2022:	if (content & CONTENTS_FOG) {
ADDRLP4 80
INDIRI4
CNSTI4 64
BANDI4
CNSTI4 0
EQI4 $1054
line 2023
;2023:		return;
ADDRGP4 $1034
JUMPV
LABELV $1054
line 2027
;2024:	}
;2025:
;2026:	// if the player is invisible, don't show it
;2027:	if (cg_entities[trace.entityNum].currentState.powerups & (1 << PW_INVIS)) {
ADDRLP4 0+52
INDIRI4
CNSTI4 740
MULI4
ADDRGP4 cg_entities+188
ADDP4
INDIRI4
CNSTI4 16
BANDI4
CNSTI4 0
EQI4 $1056
line 2028
;2028:		return;
ADDRGP4 $1034
JUMPV
LABELV $1056
line 2032
;2029:	}
;2030:
;2031:	// update the fade timer
;2032:	cg.crosshairClientNum  = trace.entityNum;
ADDRGP4 cg+117536
ADDRLP4 0+52
INDIRI4
ASGNI4
line 2033
;2033:	cg.crosshairClientTime = cg.time;
ADDRGP4 cg+117540
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2034
;2034:}
LABELV $1034
endproc CG_ScanForCrosshairEntity 92 28
proc CG_DrawCrosshairNames 16 32
line 2041
;2035:
;2036:/*
;2037:=====================
;2038:CG_DrawCrosshairNames
;2039:=====================
;2040:*/
;2041:static void CG_DrawCrosshairNames(void) {
line 2045
;2042:	float*      color;
;2043:	const char* name;
;2044:
;2045:	if (!cg_drawCrosshair.integer) {
ADDRGP4 cg_drawCrosshair+12
INDIRI4
CNSTI4 0
NEI4 $1065
line 2046
;2046:		return;
ADDRGP4 $1064
JUMPV
LABELV $1065
line 2048
;2047:	}
;2048:	if (!cg_drawCrosshairNames.integer) {
ADDRGP4 cg_drawCrosshairNames+12
INDIRI4
CNSTI4 0
NEI4 $1068
line 2049
;2049:		return;
ADDRGP4 $1064
JUMPV
LABELV $1068
line 2051
;2050:	}
;2051:	if (cg.renderingThirdPerson) {
ADDRGP4 cg+107628
INDIRI4
CNSTI4 0
EQI4 $1071
line 2052
;2052:		return;
ADDRGP4 $1064
JUMPV
LABELV $1071
line 2056
;2053:	}
;2054:
;2055:	// scan the known entities to see if the crosshair is sighted on one
;2056:	CG_ScanForCrosshairEntity();
ADDRGP4 CG_ScanForCrosshairEntity
CALLV
pop
line 2059
;2057:
;2058:	// draw the name of the player being looked at
;2059:	color = CG_FadeColor(cg.crosshairClientTime, 1000);
ADDRGP4 cg+117540
INDIRI4
ARGI4
CNSTI4 1000
ARGI4
ADDRLP4 8
ADDRGP4 CG_FadeColor
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2060
;2060:	if (!color) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1075
line 2061
;2061:		trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2062
;2062:		return;
ADDRGP4 $1064
JUMPV
LABELV $1075
line 2065
;2063:	}
;2064:
;2065:	name = cgs.clientinfo[cg.crosshairClientNum].name;
ADDRLP4 4
ADDRGP4 cg+117536
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+4
ADDP4
ASGNP4
line 2071
;2066:#ifdef MISSIONPACK
;2067:	color[3] *= 0.5f;
;2068:	w = CG_Text_Width(name, 0.3f, 0);
;2069:	CG_Text_Paint(320 - w / 2, 190, 0.3f, color, name, 0, 0, ITEM_TEXTSTYLE_SHADOWED);
;2070:#else
;2071:	color[3] *= 0.5f;
ADDRLP4 12
ADDRLP4 0
INDIRP4
CNSTI4 12
ADDP4
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRF4
CNSTF4 1056964608
MULF4
ASGNF4
line 2072
;2072:	CG_DrawString(320, 174, name, color, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_CENTER | DS_PROPORTIONAL);
CNSTF4 1134559232
ARGF4
CNSTF4 1127088128
ARGF4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 12
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2074
;2073:#endif
;2074:	trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2075
;2075:}
LABELV $1064
endproc CG_DrawCrosshairNames 16 32
proc CG_DrawSpectator 0 32
line 2084
;2076:
;2077://==============================================================================
;2078:
;2079:/*
;2080:=================
;2081:CG_DrawSpectator
;2082:=================
;2083:*/
;2084:static void CG_DrawSpectator(void) {
line 2085
;2085:	CG_DrawString(320, cgs.screenYmax - 40 + 1, "SPECTATOR", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL);
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1109393408
SUBF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRGP4 $1082
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2086
;2086:	if (cgs.gametype == GT_TOURNAMENT) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 1
NEI4 $1083
line 2087
;2087:		CG_DrawString(320, cgs.screenYmax - 20 + 1, "waiting to play", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL);
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1101004800
SUBF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRGP4 $1087
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2088
;2088:	} else if (cgs.gametype >= GT_TEAM) {
ADDRGP4 $1084
JUMPV
LABELV $1083
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $1088
line 2089
;2089:		CG_DrawString(
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31464
INDIRF4
CNSTF4 1101004800
SUBF4
CNSTF4 1065353216
ADDF4
ARGF4
ADDRGP4 $1092
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2092
;2090:			320, cgs.screenYmax - 20 + 1, "press ESC and use the JOIN menu to play", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0,
;2091:			DS_SHADOW | DS_CENTER | DS_PROPORTIONAL);
;2092:	}
LABELV $1088
LABELV $1084
line 2093
;2093:}
LABELV $1080
endproc CG_DrawSpectator 0 32
proc CG_DrawVote 12 32
line 2100
;2094:
;2095:/*
;2096:=================
;2097:CG_DrawVote
;2098:=================
;2099:*/
;2100:static void CG_DrawVote(void) {
line 2104
;2101:	char* s;
;2102:	int   sec;
;2103:
;2104:	if (!cgs.voteTime) {
ADDRGP4 cgs+31700
INDIRI4
CNSTI4 0
NEI4 $1094
line 2105
;2105:		return;
ADDRGP4 $1093
JUMPV
LABELV $1094
line 2109
;2106:	}
;2107:
;2108:	// play a talk beep whenever it is modified
;2109:	if (cgs.voteModified) {
ADDRGP4 cgs+31712
INDIRI4
CNSTI4 0
EQI4 $1097
line 2110
;2110:		cgs.voteModified = qfalse;
ADDRGP4 cgs+31712
CNSTI4 0
ASGNI4
line 2111
;2111:		trap_S_StartLocalSound(cgs.media.talkSound, CHAN_LOCAL_SOUND);
ADDRGP4 cgs+148692+716
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2112
;2112:	}
LABELV $1097
line 2114
;2113:
;2114:	sec = (VOTE_TIME - (cg.time - cgs.voteTime)) / 1000;
ADDRLP4 0
CNSTI4 30000
ADDRGP4 cg+107604
INDIRI4
ADDRGP4 cgs+31700
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2115
;2115:	if (sec < 0) {
ADDRLP4 0
INDIRI4
CNSTI4 0
GEI4 $1105
line 2116
;2116:		sec = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2117
;2117:	}
LABELV $1105
line 2124
;2118:#ifdef MISSIONPACK
;2119:	s = va("VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo);
;2120:	CG_DrawString(cgs.screenXmin - 0, 58, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DF_PROPORTIONAL);
;2121:	s = "or press ESC then click Vote";
;2122:	CG_DrawString(cgs.screenXmin - 0, 58 + SMALLCHAR_HEIGHT + 2, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DF_PROPORTIONAL);
;2123:#else
;2124:	s = va("VOTE(%i):%s yes:%i no:%i", sec, cgs.voteString, cgs.voteYes, cgs.voteNo);
ADDRGP4 $1107
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRGP4 cgs+31716
ARGP4
ADDRGP4 cgs+31704
INDIRI4
ARGI4
ADDRGP4 cgs+31708
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 2125
;2125:	CG_DrawString(cgs.screenXmin - 0, 58, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_PROPORTIONAL);  // DS_SHADOW?
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 0
SUBF4
ARGF4
CNSTF4 1114112000
ARGF4
ADDRLP4 4
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2127
;2126:#endif
;2127:}
LABELV $1093
endproc CG_DrawVote 12 32
proc CG_DrawTeamVote 20 32
line 2134
;2128:
;2129:/*
;2130:=================
;2131:CG_DrawTeamVote
;2132:=================
;2133:*/
;2134:static void CG_DrawTeamVote(void) {
line 2138
;2135:	char* s;
;2136:	int   sec, cs_offset;
;2137:
;2138:	if (cgs.clientinfo[cg.clientNum].team == TEAM_RED)
ADDRGP4 cg+4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 1
NEI4 $1113
line 2139
;2139:		cs_offset = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1114
JUMPV
LABELV $1113
line 2140
;2140:	else if (cgs.clientinfo[cg.clientNum].team == TEAM_BLUE)
ADDRGP4 cg+4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 2
NEI4 $1112
line 2141
;2141:		cs_offset = 1;
ADDRLP4 0
CNSTI4 1
ASGNI4
line 2143
;2142:	else
;2143:		return;
LABELV $1119
LABELV $1114
line 2145
;2144:
;2145:	if (!cgs.teamVoteTime[cs_offset]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32740
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1123
line 2146
;2146:		return;
ADDRGP4 $1112
JUMPV
LABELV $1123
line 2150
;2147:	}
;2148:
;2149:	// play a talk beep whenever it is modified
;2150:	if (cgs.teamVoteModified[cs_offset]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32764
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1126
line 2151
;2151:		cgs.teamVoteModified[cs_offset] = qfalse;
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32764
ADDP4
CNSTI4 0
ASGNI4
line 2152
;2152:		trap_S_StartLocalSound(cgs.media.talkSound, CHAN_LOCAL_SOUND);
ADDRGP4 cgs+148692+716
INDIRI4
ARGI4
CNSTI4 6
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2153
;2153:	}
LABELV $1126
line 2155
;2154:
;2155:	sec = (VOTE_TIME - (cg.time - cgs.teamVoteTime[cs_offset])) / 1000;
ADDRLP4 4
CNSTI4 30000
ADDRGP4 cg+107604
INDIRI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32740
ADDP4
INDIRI4
SUBI4
SUBI4
CNSTI4 1000
DIVI4
ASGNI4
line 2156
;2156:	if (sec < 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
GEI4 $1134
line 2157
;2157:		sec = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 2158
;2158:	}
LABELV $1134
line 2159
;2159:	s = va("TEAMVOTE(%i):%s yes:%i no:%i", sec, cgs.teamVoteString[cs_offset], cgs.teamVoteYes[cs_offset], cgs.teamVoteNo[cs_offset]);
ADDRGP4 $1136
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 10
LSHI4
ADDRGP4 cgs+32772
ADDP4
ARGP4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32748
ADDP4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 cgs+32756
ADDP4
INDIRI4
ARGI4
ADDRLP4 16
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 8
ADDRLP4 16
INDIRP4
ASGNP4
line 2161
;2160:
;2161:	CG_DrawString(cgs.screenXmin - 0, 90, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_PROPORTIONAL);  // DF_SHADOW?
ADDRGP4 cgs+31452
INDIRF4
CNSTF4 0
SUBF4
ARGF4
CNSTF4 1119092736
ARGF4
ADDRLP4 8
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 4
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2162
;2162:}
LABELV $1112
endproc CG_DrawTeamVote 20 32
proc CG_DrawScoreboard 4 0
line 2164
;2163:
;2164:static qboolean CG_DrawScoreboard(void) {
line 2228
;2165:#ifdef MISSIONPACK
;2166:	static qboolean firstTime = qtrue;
;2167:	float           fade, *fadeColor;
;2168:
;2169:	if (menuScoreboard) {
;2170:		menuScoreboard->window.flags &= ~WINDOW_FORCED;
;2171:	}
;2172:	if (cg_paused.integer) {
;2173:		cg.deferredPlayerLoading = 0;
;2174:		firstTime                = qtrue;
;2175:		return qfalse;
;2176:	}
;2177:
;2178:	// should never happen in Team Arena
;2179:	if (cgs.gametype == GT_SINGLE_PLAYER && cg.predictedPlayerState.pm_type == PM_INTERMISSION) {
;2180:		cg.deferredPlayerLoading = 0;
;2181:		firstTime                = qtrue;
;2182:		return qfalse;
;2183:	}
;2184:
;2185:	// don't draw scoreboard during death while warmup up
;2186:	if (cg.warmup && !cg.showScores) {
;2187:		return qfalse;
;2188:	}
;2189:
;2190:	if (cg.showScores || cg.predictedPlayerState.pm_type == PM_DEAD || cg.predictedPlayerState.pm_type == PM_INTERMISSION) {
;2191:		fade      = 1.0;
;2192:		fadeColor = colorWhite;
;2193:	} else {
;2194:		fadeColor = CG_FadeColor(cg.scoreFadeTime, FADE_TIME);
;2195:		if (!fadeColor) {
;2196:			// next time scoreboard comes up, don't print killer
;2197:			cg.deferredPlayerLoading = 0;
;2198:			cg.killerName[0]         = 0;
;2199:			firstTime                = qtrue;
;2200:			return qfalse;
;2201:		}
;2202:		fade = *fadeColor;
;2203:	}
;2204:
;2205:	if (menuScoreboard == NULL) {
;2206:		if (cgs.gametype >= GT_TEAM) {
;2207:			menuScoreboard = Menus_FindByName("teamscore_menu");
;2208:		} else {
;2209:			menuScoreboard = Menus_FindByName("score_menu");
;2210:		}
;2211:	}
;2212:
;2213:	if (menuScoreboard) {
;2214:		if (firstTime) {
;2215:			CG_SetScoreSelection(menuScoreboard);
;2216:			firstTime = qfalse;
;2217:		}
;2218:		Menu_Paint(menuScoreboard, qtrue);
;2219:	}
;2220:
;2221:	// load any models that have been deferred
;2222:	if (++cg.deferredPlayerLoading > 10) {
;2223:		CG_LoadDeferredPlayers();
;2224:	}
;2225:
;2226:	return qtrue;
;2227:#else
;2228:	return CG_DrawOldScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawOldScoreboard
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
RETI4
LABELV $1141
endproc CG_DrawScoreboard 4 0
proc CG_DrawIntermission 4 0
line 2237
;2229:#endif
;2230:}
;2231:
;2232:/*
;2233:=================
;2234:CG_DrawIntermission
;2235:=================
;2236:*/
;2237:static void CG_DrawIntermission(void) {
line 2245
;2238://	int key;
;2239:#ifdef MISSIONPACK
;2240:	// if (cg_singlePlayer.integer) {
;2241:	//	CG_DrawCenterString();
;2242:	//	return;
;2243:	// }
;2244:#else
;2245:	if (cgs.gametype == GT_SINGLE_PLAYER) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 2
NEI4 $1143
line 2246
;2246:		CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 2247
;2247:		return;
ADDRGP4 $1142
JUMPV
LABELV $1143
line 2250
;2248:	}
;2249:#endif
;2250:	cg.scoreFadeTime     = cg.time;
ADDRGP4 cg+115364
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2251
;2251:	cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 0
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+115360
ADDRLP4 0
INDIRI4
ASGNI4
line 2252
;2252:}
LABELV $1142
endproc CG_DrawIntermission 4 0
proc CG_DrawFollow 4 32
line 2259
;2253:
;2254:/*
;2255:=================
;2256:CG_DrawFollow
;2257:=================
;2258:*/
;2259:static qboolean CG_DrawFollow(void) {
line 2263
;2260:
;2261:	const char* name;
;2262:
;2263:	if (!(cg.snap->ps.pm_flags & PMF_FOLLOW)) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $1150
line 2264
;2264:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $1149
JUMPV
LABELV $1150
line 2267
;2265:	}
;2266:
;2267:	CG_DrawString(320, cgs.screenYmin + 24, "following", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_CENTER | DS_SHADOW);
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31460
INDIRF4
CNSTF4 1103101952
ADDF4
ARGF4
ADDRGP4 $1154
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 9
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2269
;2268:
;2269:	name = cgs.clientinfo[cg.snap->ps.clientNum].name;
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+4
ADDP4
ASGNP4
line 2271
;2270:
;2271:	CG_DrawString(320, cgs.screenYmin + 40, name, colorWhite, GIANT_WIDTH, GIANT_HEIGHT, 0, DS_FORCE_COLOR | DS_SHADOW | DS_CENTER);
CNSTF4 1134559232
ARGF4
ADDRGP4 cgs+31460
INDIRF4
CNSTF4 1109393408
ADDF4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1107296256
ARGF4
CNSTF4 1111490560
ARGF4
CNSTI4 0
ARGI4
CNSTI4 11
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2273
;2272:
;2273:	return qtrue;
CNSTI4 1
RETI4
LABELV $1149
endproc CG_DrawFollow 4 32
proc CG_DrawAmmoWarning 4 32
line 2281
;2274:}
;2275:
;2276:/*
;2277:=================
;2278:CG_DrawAmmoWarning
;2279:=================
;2280:*/
;2281:static void CG_DrawAmmoWarning(void) {
line 2284
;2282:	const char* s;
;2283:
;2284:	if (cg_drawAmmoWarning.integer == 0) {
ADDRGP4 cg_drawAmmoWarning+12
INDIRI4
CNSTI4 0
NEI4 $1160
line 2285
;2285:		return;
ADDRGP4 $1159
JUMPV
LABELV $1160
line 2288
;2286:	}
;2287:
;2288:	if (!cg.lowAmmoWarning) {
ADDRGP4 cg+117528
INDIRI4
CNSTI4 0
NEI4 $1163
line 2289
;2289:		return;
ADDRGP4 $1159
JUMPV
LABELV $1163
line 2292
;2290:	}
;2291:
;2292:	if (cg.lowAmmoWarning == 2) {
ADDRGP4 cg+117528
INDIRI4
CNSTI4 2
NEI4 $1166
line 2293
;2293:		s = "OUT OF AMMO";
ADDRLP4 0
ADDRGP4 $1169
ASGNP4
line 2294
;2294:	} else {
ADDRGP4 $1167
JUMPV
LABELV $1166
line 2295
;2295:		s = "LOW AMMO WARNING";
ADDRLP4 0
ADDRGP4 $1170
ASGNP4
line 2296
;2296:	}
LABELV $1167
line 2298
;2297:
;2298:	CG_DrawString(320, 64, s, colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_PROPORTIONAL | DS_CENTER | DS_SHADOW);
CNSTF4 1134559232
ARGF4
CNSTF4 1115684864
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1098907648
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2299
;2299:}
LABELV $1159
endproc CG_DrawAmmoWarning 4 32
proc CG_DrawWarmup 36 32
line 2344
;2300:
;2301:#ifdef MISSIONPACK
;2302:/*
;2303:=================
;2304:CG_DrawProxWarning
;2305:=================
;2306:*/
;2307:static void CG_DrawProxWarning(void) {
;2308:	char       s[32];
;2309:	static int proxTime;
;2310:	static int proxCounter;
;2311:	static int proxTick;
;2312:
;2313:	if (!(cg.snap->ps.eFlags & EF_TICKING)) {
;2314:		proxTime = 0;
;2315:		return;
;2316:	}
;2317:
;2318:	if (proxTime == 0) {
;2319:		proxTime    = cg.time + 5000;
;2320:		proxCounter = 5;
;2321:		proxTick    = 0;
;2322:	}
;2323:
;2324:	if (cg.time > proxTime) {
;2325:		proxTick = proxCounter--;
;2326:		proxTime = cg.time + 1000;
;2327:	}
;2328:
;2329:	if (proxTick != 0) {
;2330:		Com_sprintf(s, sizeof(s), "INTERNAL COMBUSTION IN: %i", proxTick);
;2331:	} else {
;2332:		Com_sprintf(s, sizeof(s), "YOU HAVE BEEN MINED");
;2333:	}
;2334:
;2335:	CG_DrawString(
;2336:		320, 64 + 64 + BIGCHAR_HEIGHT, s, g_color_table[ColorIndex(COLOR_RED)], BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DF_SHADOW | DF_FORCE_COLOR | DF_CENTER);
;2337:#endif
;2338:
;2339:	/*
;2340:	=================
;2341:	CG_DrawWarmup
;2342:	=================
;2343:	*/
;2344:	static void CG_DrawWarmup(void) {
line 2354
;2345:		int w;
;2346:		int i;
;2347:#ifdef MISSIONPACK
;2348:		float scale;
;2349:#endif
;2350:		clientInfo_t *ci1, *ci2;
;2351:		int           cw;
;2352:		const char*   s;
;2353:
;2354:		if (!cg.warmup) {
ADDRGP4 cg+117820
INDIRI4
CNSTI4 0
NEI4 $1172
line 2355
;2355:			return;
ADDRGP4 $1171
JUMPV
LABELV $1172
line 2358
;2356:		}
;2357:
;2358:		if (cg.warmup < 0) {
ADDRGP4 cg+117820
INDIRI4
CNSTI4 0
GEI4 $1175
line 2361
;2359:			// Remove waiting for players message in all modes.  TODO: Do this correctly, for future gamemodes that might have warmup
;2360:			// CG_DrawString(320, 24, "Waiting for players", colorWhite, BIGCHAR_WIDTH, BIGCHAR_HEIGHT, 0, DS_PROPORTIONAL | DS_CENTER | DS_SHADOW);
;2361:			return;
ADDRGP4 $1171
JUMPV
LABELV $1175
line 2364
;2362:		}
;2363:
;2364:		if (cgs.gametype == GT_TOURNAMENT) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 1
NEI4 $1178
line 2366
;2365:			// find the two active players
;2366:			ci1 = NULL;
ADDRLP4 4
CNSTP4 0
ASGNP4
line 2367
;2367:			ci2 = NULL;
ADDRLP4 16
CNSTP4 0
ASGNP4
line 2368
;2368:			for (i = 0; i < cgs.maxclients; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $1184
JUMPV
LABELV $1181
line 2369
;2369:				if (cgs.clientinfo[i].infoValid && cgs.clientinfo[i].team == TEAM_FREE) {
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1186
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
CNSTI4 0
NEI4 $1186
line 2370
;2370:					if (!ci1) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1191
line 2371
;2371:						ci1 = &cgs.clientinfo[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2372
;2372:					} else {
ADDRGP4 $1192
JUMPV
LABELV $1191
line 2373
;2373:						ci2 = &cgs.clientinfo[i];
ADDRLP4 16
ADDRLP4 0
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996
ADDP4
ASGNP4
line 2374
;2374:					}
LABELV $1192
line 2375
;2375:				}
LABELV $1186
line 2376
;2376:			}
LABELV $1182
line 2368
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1184
ADDRLP4 0
INDIRI4
ADDRGP4 cgs+31504
INDIRI4
LTI4 $1181
line 2378
;2377:
;2378:			if (ci1 && ci2) {
ADDRLP4 4
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1179
ADDRLP4 16
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $1179
line 2379
;2379:				s = va("%s vs %s", ci1->name, ci2->name);
ADDRGP4 $1197
ARGP4
ADDRLP4 4
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 16
INDIRP4
CNSTI4 4
ADDP4
ARGP4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 2384
;2380:#ifdef MISSIONPACK
;2381:				w = CG_Text_Width(s, 0.6f, 0);
;2382:				CG_Text_Paint(320 - w / 2, 60, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2383:#else
;2384:			w = CG_DrawStrlen(s);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 28
INDIRI4
ASGNI4
line 2385
;2385:			if (w > 640 / GIANT_WIDTH) {
ADDRLP4 20
INDIRI4
CNSTI4 20
LEI4 $1198
line 2386
;2386:				cw = 640 / w;
ADDRLP4 8
CNSTI4 640
ADDRLP4 20
INDIRI4
DIVI4
ASGNI4
line 2387
;2387:			} else {
ADDRGP4 $1199
JUMPV
LABELV $1198
line 2388
;2388:				cw = GIANT_WIDTH;
ADDRLP4 8
CNSTI4 32
ASGNI4
line 2389
;2389:			}
LABELV $1199
line 2390
;2390:			CG_DrawString(320, 20, s, colorWhite, cw, cw * 1.5, 0, DS_SHADOW | DS_CENTER | DS_PROPORTIONAL);
CNSTF4 1134559232
ARGF4
CNSTF4 1101004800
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 32
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
CNSTF4 1069547520
MULF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2392
;2391:#endif
;2392:			}
line 2393
;2393:		} else {
ADDRGP4 $1179
JUMPV
LABELV $1178
line 2394
;2394:			if (cgs.gametype == GT_RUN) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 0
NEI4 $1200
line 2395
;2395:				s = "Defrag Run";
ADDRLP4 12
ADDRGP4 $1203
ASGNP4
line 2396
;2396:			} else if (cgs.gametype == GT_TEAM) {
ADDRGP4 $1201
JUMPV
LABELV $1200
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
NEI4 $1204
line 2397
;2397:				s = "Team Deathmatch";
ADDRLP4 12
ADDRGP4 $1207
ASGNP4
line 2398
;2398:			} else if (cgs.gametype == GT_CTF) {
ADDRGP4 $1205
JUMPV
LABELV $1204
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 4
NEI4 $1208
line 2399
;2399:				s = "Capture the Flag";
ADDRLP4 12
ADDRGP4 $1211
ASGNP4
line 2408
;2400:#ifdef MISSIONPACK
;2401:			} else if (cgs.gametype == GT_1FCTF) {
;2402:				s = "One Flag CTF";
;2403:			} else if (cgs.gametype == GT_OBELISK) {
;2404:				s = "Overload";
;2405:			} else if (cgs.gametype == GT_HARVESTER) {
;2406:				s = "Harvester";
;2407:#endif
;2408:			} else {
ADDRGP4 $1209
JUMPV
LABELV $1208
line 2409
;2409:				s = "";
ADDRLP4 12
ADDRGP4 $1212
ASGNP4
line 2410
;2410:			}
LABELV $1209
LABELV $1205
LABELV $1201
line 2415
;2411:#ifdef MISSIONPACK
;2412:			w = CG_Text_Width(s, 0.6f, 0);
;2413:			CG_Text_Paint(320 - w / 2, 90, 0.6f, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2414:#else
;2415:		w = CG_DrawStrlen(s);
ADDRLP4 12
INDIRP4
ARGP4
ADDRLP4 24
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 20
ADDRLP4 24
INDIRI4
ASGNI4
line 2416
;2416:		if (w > 640 / GIANT_WIDTH) {
ADDRLP4 20
INDIRI4
CNSTI4 20
LEI4 $1213
line 2417
;2417:			cw = 640 / w;
ADDRLP4 8
CNSTI4 640
ADDRLP4 20
INDIRI4
DIVI4
ASGNI4
line 2418
;2418:		} else {
ADDRGP4 $1214
JUMPV
LABELV $1213
line 2419
;2419:			cw = GIANT_WIDTH;
ADDRLP4 8
CNSTI4 32
ASGNI4
line 2420
;2420:		}
LABELV $1214
line 2421
;2421:		CG_DrawString(320, 25, s, colorWhite, cw, cw * 1.1f, 0, DS_PROPORTIONAL | DS_SHADOW | DS_CENTER);
CNSTF4 1134559232
ARGF4
CNSTF4 1103626240
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 28
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 28
INDIRF4
ARGF4
ADDRLP4 28
INDIRF4
CNSTF4 1066192077
MULF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2423
;2422:#endif
;2423:		}
LABELV $1179
line 2425
;2424:
;2425:		if (cg.warmupCount <= 0)
ADDRGP4 cg+117824
INDIRI4
CNSTI4 0
GTI4 $1215
line 2426
;2426:			return;
ADDRGP4 $1171
JUMPV
LABELV $1215
line 2428
;2427:
;2428:		s = va("Starts in: %i", cg.warmupCount);
ADDRGP4 $1218
ARGP4
ADDRGP4 cg+117824
INDIRI4
ARGI4
ADDRLP4 24
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 12
ADDRLP4 24
INDIRP4
ASGNP4
line 2430
;2429:
;2430:		switch (cg.warmupCount) {
ADDRLP4 28
ADDRGP4 cg+117824
INDIRI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 1
EQI4 $1223
ADDRLP4 28
INDIRI4
CNSTI4 2
EQI4 $1224
ADDRLP4 28
INDIRI4
CNSTI4 3
EQI4 $1225
ADDRGP4 $1220
JUMPV
LABELV $1223
line 2432
;2431:		case 1:
;2432:			cw = 28;
ADDRLP4 8
CNSTI4 28
ASGNI4
line 2436
;2433:#ifdef MISSIONPACK
;2434:			scale = 0.54f;
;2435:#endif
;2436:			break;
ADDRGP4 $1221
JUMPV
LABELV $1224
line 2438
;2437:		case 2:
;2438:			cw = 24;
ADDRLP4 8
CNSTI4 24
ASGNI4
line 2442
;2439:#ifdef MISSIONPACK
;2440:			scale = 0.51f;
;2441:#endif
;2442:			break;
ADDRGP4 $1221
JUMPV
LABELV $1225
line 2444
;2443:		case 3:
;2444:			cw = 20;
ADDRLP4 8
CNSTI4 20
ASGNI4
line 2448
;2445:#ifdef MISSIONPACK
;2446:			scale = 0.48f;
;2447:#endif
;2448:			break;
ADDRGP4 $1221
JUMPV
LABELV $1220
line 2450
;2449:		default:
;2450:			cw = 16;
ADDRLP4 8
CNSTI4 16
ASGNI4
line 2454
;2451:#ifdef MISSIONPACK
;2452:			scale = 0.45f;
;2453:#endif
;2454:			break;
LABELV $1221
line 2461
;2455:		}
;2456:
;2457:#ifdef MISSIONPACK
;2458:		w = CG_Text_Width(s, scale, 0);
;2459:		CG_Text_Paint(320 - w / 2, 125, scale, colorWhite, s, 0, 0, ITEM_TEXTSTYLE_SHADOWEDMORE);
;2460:#else
;2461:	CG_DrawString(320, 70, s, colorWhite, cw, cw * 1.5, 0, DS_CENTER | DS_SHADOW | DS_PROPORTIONAL);
CNSTF4 1134559232
ARGF4
CNSTF4 1116471296
ARGF4
ADDRLP4 12
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
ADDRLP4 32
ADDRLP4 8
INDIRI4
CVIF4 4
ASGNF4
ADDRLP4 32
INDIRF4
ARGF4
ADDRLP4 32
INDIRF4
CNSTF4 1069547520
MULF4
ARGF4
CNSTI4 0
ARGI4
CNSTI4 13
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2463
;2462:#endif
;2463:	}
LABELV $1171
endproc CG_DrawWarmup 36 32
proc CG_DrawTimerActive 44 32
line 2485
;2464:
;2465://==================================================================================
;2466:#ifdef MISSIONPACK
;2467:	/*
;2468:	=================
;2469:	CG_DrawTimedMenus
;2470:	=================
;2471:	*/
;2472:	void CG_DrawTimedMenus(void) {
;2473:		if (cg.voiceTime) {
;2474:			int t = cg.time - cg.voiceTime;
;2475:			if (t > 2500) {
;2476:				Menus_CloseByName("voiceMenu");
;2477:				trap_Cvar_Set("cl_conXOffset", "0");
;2478:				cg.voiceTime = 0;
;2479:			}
;2480:		}
;2481:	}
;2482:#endif
;2483:
;2484:	//:::::::::::::::::::::::::::::::::::::::::
;2485:	static void CG_DrawTimerActive(float x, float y, float alpha) {
line 2495
;2486:		int timer;
;2487:		int msec;
;2488:		int sec;
;2489:		int min;
;2490:		int ten;
;2491:
;2492:		char* s;
;2493:		int   w;
;2494:
;2495:		x = x * SCREEN_WIDTH;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1142947840
MULF4
ASGNF4
line 2496
;2496:		y = y * SCREEN_HEIGHT;
ADDRFP4 4
ADDRFP4 4
INDIRF4
CNSTF4 1139802112
MULF4
ASGNF4
line 2500
;2497:
;2498:		// Timers set to -1 are considered disabled. On player_die(), ClientSpawn(), etc
;2499:		
;2500:		if (cg.timer_stop >= 0) {  // If there is a timer_stop active, draw it and ignore active timer
ADDRGP4 cg+149096
INDIRI4
CNSTI4 0
LTI4 $1227
line 2501
;2501:			timer = cg.timer_stop;
ADDRLP4 12
ADDRGP4 cg+149096
INDIRI4
ASGNI4
line 2502
;2502:		} else if (cg.timer_start >= 0) {  // Draw active timer instead
ADDRGP4 $1228
JUMPV
LABELV $1227
ADDRGP4 cg+149092
INDIRI4
CNSTI4 0
LTI4 $1231
line 2503
;2503:			timer = cg.snap->serverTime - cg.timer_start;
ADDRLP4 12
ADDRGP4 cg+36
INDIRP4
CNSTI4 8
ADDP4
INDIRI4
ADDRGP4 cg+149092
INDIRI4
SUBI4
ASGNI4
line 2504
;2504:		} else {  // None of them is active, so draw a static 0 timer
ADDRGP4 $1232
JUMPV
LABELV $1231
line 2505
;2505:			timer = 0;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 2506
;2506:		}
LABELV $1232
LABELV $1228
line 2508
;2507:
;2508:		msec = timer % 1000;
ADDRLP4 16
ADDRLP4 12
INDIRI4
CNSTI4 1000
MODI4
ASGNI4
line 2509
;2509:		sec  = timer / 1000;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 2510
;2510:		min  = sec / 60;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 2511
;2511:		sec -= min * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 60
MULI4
SUBI4
ASGNI4
line 2512
;2512:		ten = sec / 10;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 2513
;2513:		sec -= ten * 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 10
MULI4
SUBI4
ASGNI4
line 2515
;2514:
;2515:		s = (min > 0) ? va("%i:%i%i:%03i", min, ten, sec, msec) : va("%i%i:%03i", ten, sec, msec);
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $1239
ADDRGP4 $1236
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 32
INDIRP4
ASGNP4
ADDRGP4 $1240
JUMPV
LABELV $1239
ADDRGP4 $1237
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 36
INDIRP4
ASGNP4
LABELV $1240
ADDRLP4 20
ADDRLP4 28
INDIRP4
ASGNP4
line 2516
;2516:		w = CG_DrawStrlen(s) * SMALLCHAR_WIDTH * 0.5;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRI4
CNSTI4 3
LSHI4
CVIF4 4
CNSTF4 1056964608
MULF4
CVFI4 4
ASGNI4
line 2517
;2517:		CG_DrawString(x+w, y, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL);
ADDRFP4 0
INDIRF4
ADDRLP4 24
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2518
;2518:	}
LABELV $1226
endproc CG_DrawTimerActive 44 32
proc CG_DrawTimerBest 44 32
line 2520
;2519:	//..............................................
;2520:	static void CG_DrawTimerBest(float x, float y, float alpha) {
line 2533
;2521:
;2522:		int timer;
;2523:
;2524:		int msec;
;2525:		int sec;
;2526:		int min;
;2527:		int ten;
;2528:
;2529:		char* s;
;2530:		int   w;
;2531:		
;2532:		// Don't draw the best timer when its 0 or negative
;2533:		if (cg.timer_best <= 0) {
ADDRGP4 cg+149104
INDIRI4
CNSTI4 0
GTI4 $1242
line 2534
;2534:			return;
ADDRGP4 $1241
JUMPV
LABELV $1242
line 2537
;2535:		}
;2536:
;2537:		x = x * SCREEN_WIDTH;
ADDRFP4 0
ADDRFP4 0
INDIRF4
CNSTF4 1142947840
MULF4
ASGNF4
line 2538
;2538:		y = y * SCREEN_HEIGHT;
ADDRFP4 4
ADDRFP4 4
INDIRF4
CNSTF4 1139802112
MULF4
ASGNF4
line 2540
;2539:
;2540:		timer = cg.timer_best;
ADDRLP4 12
ADDRGP4 cg+149104
INDIRI4
ASGNI4
line 2542
;2541:
;2542:		msec = timer % 1000;
ADDRLP4 16
ADDRLP4 12
INDIRI4
CNSTI4 1000
MODI4
ASGNI4
line 2543
;2543:		sec  = timer / 1000;
ADDRLP4 0
ADDRLP4 12
INDIRI4
CNSTI4 1000
DIVI4
ASGNI4
line 2544
;2544:		min  = sec / 60;
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 60
DIVI4
ASGNI4
line 2545
;2545:		sec -= min * 60;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
CNSTI4 60
MULI4
SUBI4
ASGNI4
line 2546
;2546:		ten = sec / 10;
ADDRLP4 8
ADDRLP4 0
INDIRI4
CNSTI4 10
DIVI4
ASGNI4
line 2547
;2547:		sec -= ten * 10;
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
CNSTI4 10
MULI4
SUBI4
ASGNI4
line 2549
;2548:
;2549:		s = (min > 0) ? va("%i:%i%i:%03i", min, ten, sec, msec) : va("%i%i:%03i", ten, sec, msec);
ADDRLP4 4
INDIRI4
CNSTI4 0
LEI4 $1247
ADDRGP4 $1236
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 32
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 32
INDIRP4
ASGNP4
ADDRGP4 $1248
JUMPV
LABELV $1247
ADDRGP4 $1237
ARGP4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ARGI4
ADDRLP4 16
INDIRI4
ARGI4
ADDRLP4 36
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 28
ADDRLP4 36
INDIRP4
ASGNP4
LABELV $1248
ADDRLP4 20
ADDRLP4 28
INDIRP4
ASGNP4
line 2550
;2550:		w = CG_DrawStrlen(s) * SMALLCHAR_WIDTH * 0.5;
ADDRLP4 20
INDIRP4
ARGP4
ADDRLP4 40
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 24
ADDRLP4 40
INDIRI4
CNSTI4 3
LSHI4
CVIF4 4
CNSTF4 1056964608
MULF4
CVFI4 4
ASGNI4
line 2551
;2551:		CG_DrawString(x+w, y, s, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL);
ADDRFP4 0
INDIRF4
ADDRLP4 24
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRLP4 20
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2552
;2552:	}
LABELV $1241
endproc CG_DrawTimerBest 44 32
proc CG_DrawSmallIntCentered 16 32
line 2554
;2553:	//..............................................
;2554:	static void CG_DrawSmallIntCentered(int num, float x, float y, float alpha) {
line 2560
;2555:
;2556:		char* time;
;2557:		int   w;
;2558:
;2559:		// Convert [0-1] input range to ui expected range
;2560:		x          = x * SCREEN_WIDTH;
ADDRFP4 4
ADDRFP4 4
INDIRF4
CNSTF4 1142947840
MULF4
ASGNF4
line 2561
;2561:		y          = y * SCREEN_HEIGHT;
ADDRFP4 8
ADDRFP4 8
INDIRF4
CNSTF4 1139802112
MULF4
ASGNF4
line 2562
;2562:		time = va("%i", num);
ADDRGP4 $109
ARGP4
ADDRFP4 0
INDIRI4
ARGI4
ADDRLP4 8
ADDRGP4 va
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 2563
;2563:		w    = CG_DrawStrlen(time) * SMALLCHAR_WIDTH * 0.5;
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 CG_DrawStrlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
CNSTI4 3
LSHI4
CVIF4 4
CNSTF4 1056964608
MULF4
CVFI4 4
ASGNI4
line 2564
;2564:		CG_DrawString(x+w, y, time, colorWhite, SMALLCHAR_WIDTH, SMALLCHAR_HEIGHT, 0, DS_SHADOW | DS_RIGHT | DS_PROPORTIONAL);
ADDRFP4 4
INDIRF4
ADDRLP4 4
INDIRI4
CVIF4 4
ADDF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRLP4 0
INDIRP4
ARGP4
ADDRGP4 colorWhite
ARGP4
CNSTF4 1090519040
ARGF4
CNSTF4 1098907648
ARGF4
CNSTI4 0
ARGI4
CNSTI4 21
ARGI4
ADDRGP4 CG_DrawString
CALLV
pop
line 2565
;2565:	}
LABELV $1249
endproc CG_DrawSmallIntCentered 16 32
proc CG_DrawPMTime 0 16
line 2567
;2566:	//..............................................
;2567:	static void CG_DrawPMTime(float x, float y, float alpha) {
line 2568
;2568:		CG_DrawSmallIntCentered(cg.snap->ps.pm_time, x, y, alpha);
ADDRGP4 cg+36
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
ARGI4
ADDRFP4 0
INDIRF4
ARGF4
ADDRFP4 4
INDIRF4
ARGF4
ADDRFP4 8
INDIRF4
ARGF4
ADDRGP4 CG_DrawSmallIntCentered
CALLV
pop
line 2569
;2569:	}
LABELV $1250
endproc CG_DrawPMTime 0 16
proc CG_Draw2D 24 36
line 2577
;2570:	//:::::::::::::::::::::::::::::::::::::::::
;2571:
;2572:	/*
;2573:	=================
;2574:	CG_Draw2D
;2575:	=================
;2576:	*/
;2577:	static void CG_Draw2D(stereoFrame_t stereoFrame) {
line 2584
;2578:#ifdef MISSIONPACK
;2579:		if (cgs.orderPending && cg.time > cgs.orderTime) {
;2580:			CG_CheckOrderPending();
;2581:		}
;2582:#endif
;2583:		// if we are taking a levelshot for the menu, don't draw anything
;2584:		if (cg.levelShot) {
ADDRGP4 cg+12
INDIRI4
CNSTI4 0
EQI4 $1253
line 2585
;2585:			return;
ADDRGP4 $1252
JUMPV
LABELV $1253
line 2588
;2586:		}
;2587:
;2588:		if (cg_draw2D.integer == 0) {
ADDRGP4 cg_draw2D+12
INDIRI4
CNSTI4 0
NEI4 $1256
line 2589
;2589:			return;
ADDRGP4 $1252
JUMPV
LABELV $1256
line 2592
;2590:		}
;2591:
;2592:		if (cg.snap->ps.pm_type == PM_INTERMISSION) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 48
ADDP4
INDIRI4
CNSTI4 5
NEI4 $1259
line 2593
;2593:			CG_DrawIntermission();
ADDRGP4 CG_DrawIntermission
CALLV
pop
line 2594
;2594:			return;
ADDRGP4 $1252
JUMPV
LABELV $1259
line 2602
;2595:		}
;2596:
;2597:		/*
;2598:		    if (cg.cameraMode) {
;2599:		        return;
;2600:		    }
;2601:		*/
;2602:		if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1262
line 2603
;2603:			CG_DrawSpectator();
ADDRGP4 CG_DrawSpectator
CALLV
pop
line 2604
;2604:			CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 2605
;2605:			CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 2606
;2606:		} else {
ADDRGP4 $1263
JUMPV
LABELV $1262
line 2608
;2607:			// don't draw any status if dead or the scoreboard is being explicitly shown
;2608:			if (!cg.showScores && cg.snap->ps.stats[STAT_HEALTH] > 0) {
ADDRGP4 cg+115356
INDIRI4
CNSTI4 0
NEI4 $1265
ADDRGP4 cg+36
INDIRP4
CNSTI4 228
ADDP4
INDIRI4
CNSTI4 0
LEI4 $1265
line 2616
;2609:
;2610:#ifdef MISSIONPACK
;2611:				if (cg_drawStatus.integer) {
;2612:					Menu_PaintAll();
;2613:					CG_DrawTimedMenus();
;2614:				}
;2615:#else
;2616:			CG_DrawStatusBar();
ADDRGP4 CG_DrawStatusBar
CALLV
pop
line 2619
;2617:#endif
;2618:
;2619:				CG_DrawAmmoWarning();
ADDRGP4 CG_DrawAmmoWarning
CALLV
pop
line 2624
;2620:
;2621:#ifdef MISSIONPACK
;2622:				CG_DrawProxWarning();
;2623:#endif
;2624:				CG_DrawCrosshair();
ADDRGP4 CG_DrawCrosshair
CALLV
pop
line 2625
;2625:				CG_DrawCrosshairNames();
ADDRGP4 CG_DrawCrosshairNames
CALLV
pop
line 2626
;2626:				CG_DrawWeaponSelect();
ADDRGP4 CG_DrawWeaponSelect
CALLV
pop
line 2629
;2627:
;2628:#ifndef MISSIONPACK
;2629:				CG_DrawHoldableItem();
ADDRGP4 CG_DrawHoldableItem
CALLV
pop
line 2633
;2630:#else
;2631:			// CG_DrawPersistantPowerup();
;2632:#endif
;2633:				CG_DrawReward();
ADDRGP4 CG_DrawReward
CALLV
pop
line 2634
;2634:			}
LABELV $1265
line 2636
;2635:
;2636:			if (cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $1269
line 2638
;2637:#ifndef MISSIONPACK
;2638:				CG_DrawTeamInfo();
ADDRGP4 CG_DrawTeamInfo
CALLV
pop
line 2640
;2639:#endif
;2640:			}
LABELV $1269
line 2641
;2641:		}
LABELV $1263
line 2643
;2642:
;2643:		CG_DrawVote();
ADDRGP4 CG_DrawVote
CALLV
pop
line 2644
;2644:		CG_DrawTeamVote();
ADDRGP4 CG_DrawTeamVote
CALLV
pop
line 2646
;2645:
;2646:		CG_DrawLagometer();
ADDRGP4 CG_DrawLagometer
CALLV
pop
line 2653
;2647:
;2648:#ifdef MISSIONPACK
;2649:		if (!cg_paused.integer) {
;2650:			CG_DrawUpperRight(stereoFrame);
;2651:		}
;2652:#else
;2653:	CG_DrawUpperRight(stereoFrame);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_DrawUpperRight
CALLV
pop
line 2657
;2654:#endif
;2655:
;2656:#ifndef MISSIONPACK
;2657:		CG_DrawLowerRight();
ADDRGP4 CG_DrawLowerRight
CALLV
pop
line 2658
;2658:		CG_DrawLowerLeft();
ADDRGP4 CG_DrawLowerLeft
CALLV
pop
line 2661
;2659:#endif
;2660:
;2661:		if (!CG_DrawFollow()) {
ADDRLP4 0
ADDRGP4 CG_DrawFollow
CALLI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $1272
line 2662
;2662:			CG_DrawWarmup();
ADDRGP4 CG_DrawWarmup
CALLV
pop
line 2663
;2663:		}
LABELV $1272
line 2666
;2664:
;2665:		// don't draw center string if scoreboard is up
;2666:		cg.scoreBoardShowing = CG_DrawScoreboard();
ADDRLP4 4
ADDRGP4 CG_DrawScoreboard
CALLI4
ASGNI4
ADDRGP4 cg+115360
ADDRLP4 4
INDIRI4
ASGNI4
line 2667
;2667:		if (!cg.scoreBoardShowing) {
ADDRGP4 cg+115360
INDIRI4
CNSTI4 0
NEI4 $1275
line 2668
;2668:			CG_DrawCenterString();
ADDRGP4 CG_DrawCenterString
CALLV
pop
line 2669
;2669:			CG_DrawTimerActive(cg_timerActive_x.value, cg_timerActive_y.value, 1.0F);
ADDRGP4 cg_timerActive_x+8
INDIRF4
ARGF4
ADDRGP4 cg_timerActive_y+8
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawTimerActive
CALLV
pop
line 2670
;2670:			CG_DrawTimerBest(cg_timerBest_x.value, cg_timerBest_y.value, 1.0F);
ADDRGP4 cg_timerBest_x+8
INDIRF4
ARGF4
ADDRGP4 cg_timerBest_y+8
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawTimerBest
CALLV
pop
line 2671
;2671:			if (cg.snap->ps.pm_time) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 60
ADDP4
INDIRI4
CNSTI4 0
EQI4 $1282
line 2672
;2672:				CG_DrawPMTime(cg_timerSkim_x.value, cg_timerSkim_y.value, 1.0F);
ADDRGP4 cg_timerSkim_x+8
INDIRF4
ARGF4
ADDRGP4 cg_timerSkim_y+8
INDIRF4
ARGF4
CNSTF4 1065353216
ARGF4
ADDRGP4 CG_DrawPMTime
CALLV
pop
line 2673
;2673:			}
LABELV $1282
line 2674
;2674:		}
LABELV $1275
line 2676
;2675:
;2676:		if (cgs.score_catched) {
ADDRGP4 cgs+149700
INDIRI4
CNSTI4 0
EQI4 $1287
line 2678
;2677:			float x, y, w, h;
;2678:			trap_R_SetColor(NULL);
CNSTP4 0
ARGP4
ADDRGP4 trap_R_SetColor
CALLV
pop
line 2679
;2679:			x = cgs.cursorX - 12;
ADDRLP4 8
ADDRGP4 cgs+149708
INDIRF4
CNSTF4 1094713344
SUBF4
ASGNF4
line 2680
;2680:			y = cgs.cursorY - 12;
ADDRLP4 12
ADDRGP4 cgs+149712
INDIRF4
CNSTF4 1094713344
SUBF4
ASGNF4
line 2681
;2681:			w = 24;
ADDRLP4 16
CNSTF4 1103101952
ASGNF4
line 2682
;2682:			h = 24;
ADDRLP4 20
CNSTF4 1103101952
ASGNF4
line 2683
;2683:			CG_AdjustFrom640(&x, &y, &w, &h);
ADDRLP4 8
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ARGP4
ADDRLP4 20
ARGP4
ADDRGP4 CG_AdjustFrom640
CALLV
pop
line 2684
;2684:			trap_R_DrawStretchPic(x, y, w, h, 0, 0, 1, 1, cgs.media.cursor);
ADDRLP4 8
INDIRF4
ARGF4
ADDRLP4 12
INDIRF4
ARGF4
ADDRLP4 16
INDIRF4
ARGF4
ADDRLP4 20
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
ADDRGP4 cgs+148692+936
INDIRI4
ARGI4
ADDRGP4 trap_R_DrawStretchPic
CALLV
pop
line 2685
;2685:		}
LABELV $1287
line 2686
;2686:	}
LABELV $1252
endproc CG_Draw2D 24 36
proc CG_DrawTourneyScoreboard 0 0
line 2688
;2687:
;2688:	static void CG_DrawTourneyScoreboard(void) {
line 2691
;2689:#ifdef MISSIONPACK
;2690:#else
;2691:	CG_DrawOldTourneyScoreboard();
ADDRGP4 CG_DrawOldTourneyScoreboard
CALLV
pop
line 2693
;2692:#endif
;2693:	}
LABELV $1294
endproc CG_DrawTourneyScoreboard 0 0
proc CG_CalculatePing 16 0
line 2695
;2694:
;2695:	static void CG_CalculatePing(void) {
line 2698
;2696:		int count, i, v;
;2697:
;2698:		cg.meanPing = 0;
ADDRGP4 cg+149068
CNSTI4 0
ASGNI4
line 2700
;2699:
;2700:		for (i = 0, count = 0; i < LAG_SAMPLES; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRLP4 8
CNSTI4 0
ASGNI4
ADDRGP4 $1300
JUMPV
LABELV $1297
line 2702
;2701:
;2702:			v = lagometer.snapshotSamples[i];
ADDRLP4 4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 lagometer+1028
ADDP4
INDIRI4
ASGNI4
line 2703
;2703:			if (v >= 0) {
ADDRLP4 4
INDIRI4
CNSTI4 0
LTI4 $1302
line 2704
;2704:				cg.meanPing += v;
ADDRLP4 12
ADDRGP4 cg+149068
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 4
INDIRI4
ADDI4
ASGNI4
line 2705
;2705:				count++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 2706
;2706:			}
LABELV $1302
line 2707
;2707:		}
LABELV $1298
line 2700
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $1300
ADDRLP4 0
INDIRI4
CNSTI4 128
LTI4 $1297
line 2709
;2708:
;2709:		if (count) {
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $1305
line 2710
;2710:			cg.meanPing /= count;
ADDRLP4 12
ADDRGP4 cg+149068
ASGNP4
ADDRLP4 12
INDIRP4
ADDRLP4 12
INDIRP4
INDIRI4
ADDRLP4 8
INDIRI4
DIVI4
ASGNI4
line 2711
;2711:		}
LABELV $1305
line 2712
;2712:	}
LABELV $1295
endproc CG_CalculatePing 16 0
proc CG_WarmupEvents 8 12
line 2714
;2713:
;2714:	static void CG_WarmupEvents(void) {
line 2718
;2715:
;2716:		int count;
;2717:
;2718:		if (!cg.warmup)
ADDRGP4 cg+117820
INDIRI4
CNSTI4 0
NEI4 $1309
line 2719
;2719:			return;
ADDRGP4 $1308
JUMPV
LABELV $1309
line 2721
;2720:
;2721:		if (cg.warmup < 0) {
ADDRGP4 cg+117820
INDIRI4
CNSTI4 0
GEI4 $1312
line 2722
;2722:			cg.warmupCount = -1;
ADDRGP4 cg+117824
CNSTI4 -1
ASGNI4
line 2723
;2723:			return;
ADDRGP4 $1308
JUMPV
LABELV $1312
line 2726
;2724:		}
;2725:
;2726:		if (cg.warmup < cg.time) {
ADDRGP4 cg+117820
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GEI4 $1316
line 2727
;2727:			cg.warmup = 0;
ADDRGP4 cg+117820
CNSTI4 0
ASGNI4
line 2728
;2728:			count     = 0;
ADDRLP4 0
CNSTI4 0
ASGNI4
line 2729
;2729:		} else {
ADDRGP4 $1317
JUMPV
LABELV $1316
line 2730
;2730:			count = (cg.warmup - cg.time + 999) / 1000;
ADDRLP4 0
ADDRGP4 cg+117820
INDIRI4
ADDRGP4 cg+107604
INDIRI4
SUBI4
CNSTI4 999
ADDI4
CNSTI4 1000
DIVI4
ASGNI4
line 2731
;2731:		}
LABELV $1317
line 2733
;2732:
;2733:		if (cg.warmupCount == -2 && cg.demoPlayback) {
ADDRGP4 cg+117824
INDIRI4
CNSTI4 -2
NEI4 $1323
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
EQI4 $1323
line 2734
;2734:			cg.warmupCount = 0;
ADDRGP4 cg+117824
CNSTI4 0
ASGNI4
line 2735
;2735:		}
LABELV $1323
line 2737
;2736:
;2737:		if (cg.warmupCount == count) {
ADDRGP4 cg+117824
INDIRI4
ADDRLP4 0
INDIRI4
NEI4 $1328
line 2738
;2738:			return;
ADDRGP4 $1308
JUMPV
LABELV $1328
line 2741
;2739:		}
;2740:
;2741:		cg.warmupCount       = count;
ADDRGP4 cg+117824
ADDRLP4 0
INDIRI4
ASGNI4
line 2742
;2742:		cg.timelimitWarnings = 0;
ADDRGP4 cg+107616
CNSTI4 0
ASGNI4
line 2744
;2743:
;2744:		switch (count) {
ADDRLP4 0
INDIRI4
CNSTI4 0
LTI4 $1334
ADDRLP4 0
INDIRI4
CNSTI4 3
GTI4 $1334
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 $1354
ADDP4
INDIRP4
JUMPV
data
align 4
LABELV $1354
address $1335
address $1345
address $1348
address $1351
code
LABELV $1335
line 2746
;2745:		case 0:
;2746:			if (cg.warmupFightSound <= cg.time) {
ADDRGP4 cg+117828
INDIRI4
ADDRGP4 cg+107604
INDIRI4
GTI4 $1336
line 2747
;2747:				trap_S_StartLocalSound(cgs.media.countFightSound, CHAN_ANNOUNCER);
ADDRGP4 cgs+148692+928
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2748
;2748:				cg.warmupFightSound = cg.time + 750;
ADDRGP4 cg+117828
ADDRGP4 cg+107604
INDIRI4
CNSTI4 750
ADDI4
ASGNI4
line 2749
;2749:			}
LABELV $1336
line 2750
;2750:			CG_CenterPrint("FIGHT!", 120, GIANTCHAR_WIDTH * 2);
ADDRGP4 $1344
ARGP4
CNSTI4 120
ARGI4
CNSTI4 64
ARGI4
ADDRGP4 CG_CenterPrint
CALLV
pop
line 2751
;2751:			break;
ADDRGP4 $1334
JUMPV
LABELV $1345
line 2754
;2752:
;2753:		case 1:
;2754:			trap_S_StartLocalSound(cgs.media.count1Sound, CHAN_ANNOUNCER);
ADDRGP4 cgs+148692+924
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2755
;2755:			break;
ADDRGP4 $1334
JUMPV
LABELV $1348
line 2758
;2756:
;2757:		case 2:
;2758:			trap_S_StartLocalSound(cgs.media.count2Sound, CHAN_ANNOUNCER);
ADDRGP4 cgs+148692+920
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2759
;2759:			break;
ADDRGP4 $1334
JUMPV
LABELV $1351
line 2762
;2760:
;2761:		case 3:
;2762:			trap_S_StartLocalSound(cgs.media.count3Sound, CHAN_ANNOUNCER);
ADDRGP4 cgs+148692+916
INDIRI4
ARGI4
CNSTI4 7
ARGI4
ADDRGP4 trap_S_StartLocalSound
CALLV
pop
line 2763
;2763:			break;
line 2766
;2764:
;2765:		default:
;2766:			break;
LABELV $1334
line 2768
;2767:		}
;2768:	}
LABELV $1308
endproc CG_WarmupEvents 8 12
export CG_WarmupEvent
proc CG_WarmupEvent 0 0
line 2771
;2769:
;2770:	// will be called on warmup end and when client changed
;2771:	void CG_WarmupEvent(void) {
line 2773
;2772:
;2773:		cg.attackerTime    = 0;
ADDRGP4 cg+117588
CNSTI4 0
ASGNI4
line 2774
;2774:		cg.attackerName[0] = '\0';
ADDRGP4 cg+117552
CNSTI1 0
ASGNI1
line 2776
;2775:
;2776:		cg.itemPickupTime      = 0;
ADDRGP4 cg+117840
CNSTI4 0
ASGNI4
line 2777
;2777:		cg.itemPickupBlendTime = 0;
ADDRGP4 cg+117844
CNSTI4 0
ASGNI4
line 2778
;2778:		cg.itemPickupCount     = 0;
ADDRGP4 cg+117836
CNSTI4 0
ASGNI4
line 2780
;2779:
;2780:		cg.killerTime    = 0;
ADDRGP4 cg+115432
CNSTI4 0
ASGNI4
line 2781
;2781:		cg.killerName[0] = '\0';
ADDRGP4 cg+115368
CNSTI1 0
ASGNI1
line 2783
;2782:
;2783:		cg.damageTime = 0;
ADDRGP4 cg+117860
CNSTI4 0
ASGNI4
line 2785
;2784:
;2785:		cg.rewardStack = 0;
ADDRGP4 cg+117596
CNSTI4 0
ASGNI4
line 2786
;2786:		cg.rewardTime  = 0;
ADDRGP4 cg+117600
CNSTI4 0
ASGNI4
line 2788
;2787:
;2788:		cg.weaponSelectTime = cg.time;
ADDRGP4 cg+117848
ADDRGP4 cg+107604
INDIRI4
ASGNI4
line 2790
;2789:
;2790:		cg.lowAmmoWarning = 0;
ADDRGP4 cg+117528
CNSTI4 0
ASGNI4
line 2792
;2791:
;2792:		cg.followTime = 0;
ADDRGP4 cg+149080
CNSTI4 0
ASGNI4
line 2793
;2793:	}
LABELV $1355
endproc CG_WarmupEvent 0 0
proc CG_ApplyClientChange 0 0
line 2796
;2794:
;2795:	// called each time client team changed
;2796:	static void CG_ApplyClientChange(void) {
line 2797
;2797:		CG_WarmupEvent();
ADDRGP4 CG_WarmupEvent
CALLV
pop
line 2798
;2798:		CG_ForceModelChange();
ADDRGP4 CG_ForceModelChange
CALLV
pop
line 2799
;2799:	}
LABELV $1370
endproc CG_ApplyClientChange 0 0
data
align 4
LABELV $1372
byte 4 -1
align 4
LABELV $1373
byte 4 -1
align 4
LABELV $1374
byte 4 -1
export CG_TrackClientTeamChange
code
proc CG_TrackClientTeamChange 8 4
line 2806
;2800:
;2801:	/*
;2802:	=====================
;2803:	CG_TrackClientTeamChange
;2804:	=====================
;2805:	*/
;2806:	void CG_TrackClientTeamChange(void) {
line 2814
;2807:		static int spec_client = -1;
;2808:		static int spec_team   = -1;
;2809:		static int curr_team   = -1;
;2810:
;2811:		int        ti;  // team from clientinfo
;2812:		int        tp;  // persistant team from snapshot
;2813:
;2814:		if (!cg.snap)
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1375
line 2815
;2815:			return;
ADDRGP4 $1371
JUMPV
LABELV $1375
line 2817
;2816:
;2817:		tp = cg.snap->ps.persistant[PERS_TEAM];
ADDRLP4 0
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
ASGNI4
line 2818
;2818:		ti = cgs.clientinfo[cg.snap->ps.clientNum].team;
ADDRLP4 4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
ASGNI4
line 2820
;2819:
;2820:		if (!(cg.snap->ps.pm_flags & PMF_FOLLOW) && tp != TEAM_SPECTATOR) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 4096
BANDI4
CNSTI4 0
NEI4 $1382
ADDRLP4 0
INDIRI4
CNSTI4 3
EQI4 $1382
line 2821
;2821:			ti = tp;  // use team from persistant info
ADDRLP4 4
ADDRLP4 0
INDIRI4
ASGNI4
line 2822
;2822:		}
LABELV $1382
line 2825
;2823:
;2824:		// team changed
;2825:		if (curr_team != ti) {
ADDRGP4 $1374
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $1385
line 2826
;2826:			curr_team   = ti;
ADDRGP4 $1374
ADDRLP4 4
INDIRI4
ASGNI4
line 2827
;2827:			spec_client = cg.snap->ps.clientNum;
ADDRGP4 $1372
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2828
;2828:			spec_team   = tp;
ADDRGP4 $1373
ADDRLP4 0
INDIRI4
ASGNI4
line 2830
;2829:
;2830:			if (spec_team == TEAM_SPECTATOR)
ADDRGP4 $1373
INDIRI4
CNSTI4 3
NEI4 $1388
line 2831
;2831:				spec_team = curr_team;
ADDRGP4 $1373
ADDRGP4 $1374
INDIRI4
ASGNI4
LABELV $1388
line 2833
;2832:
;2833:			CG_ApplyClientChange();
ADDRGP4 CG_ApplyClientChange
CALLV
pop
line 2834
;2834:			CG_ResetPlayerEntity(&cg.predictedPlayerEntity);
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 2835
;2835:			return;
ADDRGP4 $1371
JUMPV
LABELV $1385
line 2838
;2836:		}
;2837:
;2838:		if (curr_team == TEAM_SPECTATOR) {
ADDRGP4 $1374
INDIRI4
CNSTI4 3
NEI4 $1391
line 2839
;2839:			if (spec_team != tp) {
ADDRGP4 $1373
INDIRI4
ADDRLP4 0
INDIRI4
EQI4 $1393
line 2840
;2840:				spec_team   = tp;
ADDRGP4 $1373
ADDRLP4 0
INDIRI4
ASGNI4
line 2841
;2841:				spec_client = cg.snap->ps.clientNum;
ADDRGP4 $1372
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2843
;2842:
;2843:				CG_ApplyClientChange();
ADDRGP4 CG_ApplyClientChange
CALLV
pop
line 2844
;2844:				CG_ResetPlayerEntity(&cg.predictedPlayerEntity);
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 2845
;2845:				return;
ADDRGP4 $1371
JUMPV
LABELV $1393
line 2848
;2846:			}
;2847:
;2848:			if (cgs.gametype >= GT_TEAM) {
ADDRGP4 cgs+31480
INDIRI4
CNSTI4 3
LTI4 $1397
line 2849
;2849:				spec_client = cg.snap->ps.clientNum;
ADDRGP4 $1372
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2850
;2850:				return;
ADDRGP4 $1371
JUMPV
LABELV $1397
line 2853
;2851:			}
;2852:			// pass through to spec client checks
;2853:		}
LABELV $1391
line 2855
;2854:
;2855:		if (spec_client != cg.snap->ps.clientNum) {
ADDRGP4 $1372
INDIRI4
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
EQI4 $1401
line 2856
;2856:			spec_client = cg.snap->ps.clientNum;
ADDRGP4 $1372
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
ASGNI4
line 2857
;2857:			spec_team   = tp;
ADDRGP4 $1373
ADDRLP4 0
INDIRI4
ASGNI4
line 2859
;2858:
;2859:			if (spec_team == TEAM_SPECTATOR)
ADDRGP4 $1373
INDIRI4
CNSTI4 3
NEI4 $1405
line 2860
;2860:				spec_team = cgs.clientinfo[cg.snap->ps.clientNum].team;
ADDRGP4 $1373
ADDRGP4 cg+36
INDIRP4
CNSTI4 184
ADDP4
INDIRI4
CNSTI4 1652
MULI4
ADDRGP4 cgs+40996+36
ADDP4
INDIRI4
ASGNI4
LABELV $1405
line 2862
;2861:
;2862:			CG_ApplyClientChange();
ADDRGP4 CG_ApplyClientChange
CALLV
pop
line 2863
;2863:			CG_ResetPlayerEntity(&cg.predictedPlayerEntity);
ADDRGP4 cg+108104
ARGP4
ADDRGP4 CG_ResetPlayerEntity
CALLV
pop
line 2864
;2864:		}
LABELV $1401
line 2865
;2865:	}
LABELV $1371
endproc CG_TrackClientTeamChange 8 4
export CG_DrawActive
proc CG_DrawActive 0 4
line 2874
;2866:
;2867:	/*
;2868:	=====================
;2869:	CG_DrawActive
;2870:
;2871:	Perform all drawing needed to completely fill the screen
;2872:	=====================
;2873:	*/
;2874:	void CG_DrawActive(stereoFrame_t stereoView) {
line 2876
;2875:		// optionally draw the info screen instead
;2876:		if (!cg.snap) {
ADDRGP4 cg+36
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $1412
line 2877
;2877:			CG_DrawInformation();
ADDRGP4 CG_DrawInformation
CALLV
pop
line 2878
;2878:			return;
ADDRGP4 $1411
JUMPV
LABELV $1412
line 2881
;2879:		}
;2880:
;2881:		if (!cg.demoPlayback) {
ADDRGP4 cg+8
INDIRI4
CNSTI4 0
NEI4 $1415
line 2882
;2882:			CG_CalculatePing();
ADDRGP4 CG_CalculatePing
CALLV
pop
line 2883
;2883:		}
LABELV $1415
line 2886
;2884:
;2885:		// optionally draw the tournement scoreboard instead
;2886:		if (cg.snap->ps.persistant[PERS_TEAM] == TEAM_SPECTATOR && (cg.snap->ps.pm_flags & PMF_SCOREBOARD)) {
ADDRGP4 cg+36
INDIRP4
CNSTI4 304
ADDP4
INDIRI4
CNSTI4 3
NEI4 $1418
ADDRGP4 cg+36
INDIRP4
CNSTI4 56
ADDP4
INDIRI4
CNSTI4 8192
BANDI4
CNSTI4 0
EQI4 $1418
line 2887
;2887:			CG_DrawTourneyScoreboard();
ADDRGP4 CG_DrawTourneyScoreboard
CALLV
pop
line 2888
;2888:			return;
ADDRGP4 $1411
JUMPV
LABELV $1418
line 2892
;2889:		}
;2890:
;2891:		// clear around the rendered view if sized down
;2892:		CG_TileClear();
ADDRGP4 CG_TileClear
CALLV
pop
line 2895
;2893:
;2894:		// draw 3D view
;2895:		trap_R_RenderScene(&cg.refdef);
ADDRGP4 cg+109056
ARGP4
ADDRGP4 trap_R_RenderScene
CALLV
pop
line 2898
;2896:
;2897:		// play warmup sounds and display text
;2898:		CG_WarmupEvents();
ADDRGP4 CG_WarmupEvents
CALLV
pop
line 2901
;2899:
;2900:		// draw status bar and other floating elements
;2901:		CG_Draw2D(stereoView);
ADDRFP4 0
INDIRI4
ARGI4
ADDRGP4 CG_Draw2D
CALLV
pop
line 2902
;2902:	}
LABELV $1411
endproc CG_DrawActive 0 4
bss
export lagometer
align 4
LABELV lagometer
skip 1544
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
import CG_ForceModelChange
import CG_StatusHandle
import CG_OtherTeamHasFlag
import CG_YourTeamHasFlag
import CG_GameTypeString
import CG_CheckOrderPending
import CG_Text_PaintChar
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
export teamChat2
align 1
LABELV teamChat2
skip 256
export teamChat1
align 1
LABELV teamChat1
skip 256
export systemChat
align 1
LABELV systemChat
skip 256
export numSortedTeamPlayers
align 4
LABELV numSortedTeamPlayers
skip 4
export sortedTeamPlayers
align 4
LABELV sortedTeamPlayers
skip 128
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
LABELV $1344
byte 1 70
byte 1 73
byte 1 71
byte 1 72
byte 1 84
byte 1 33
byte 1 0
align 1
LABELV $1237
byte 1 37
byte 1 105
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 51
byte 1 105
byte 1 0
align 1
LABELV $1236
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 105
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 51
byte 1 105
byte 1 0
align 1
LABELV $1218
byte 1 83
byte 1 116
byte 1 97
byte 1 114
byte 1 116
byte 1 115
byte 1 32
byte 1 105
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1212
byte 1 0
align 1
LABELV $1211
byte 1 67
byte 1 97
byte 1 112
byte 1 116
byte 1 117
byte 1 114
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 70
byte 1 108
byte 1 97
byte 1 103
byte 1 0
align 1
LABELV $1207
byte 1 84
byte 1 101
byte 1 97
byte 1 109
byte 1 32
byte 1 68
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
LABELV $1203
byte 1 68
byte 1 101
byte 1 102
byte 1 114
byte 1 97
byte 1 103
byte 1 32
byte 1 82
byte 1 117
byte 1 110
byte 1 0
align 1
LABELV $1197
byte 1 37
byte 1 115
byte 1 32
byte 1 118
byte 1 115
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $1170
byte 1 76
byte 1 79
byte 1 87
byte 1 32
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 32
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 0
align 1
LABELV $1169
byte 1 79
byte 1 85
byte 1 84
byte 1 32
byte 1 79
byte 1 70
byte 1 32
byte 1 65
byte 1 77
byte 1 77
byte 1 79
byte 1 0
align 1
LABELV $1154
byte 1 102
byte 1 111
byte 1 108
byte 1 108
byte 1 111
byte 1 119
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $1136
byte 1 84
byte 1 69
byte 1 65
byte 1 77
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 37
byte 1 115
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1107
byte 1 86
byte 1 79
byte 1 84
byte 1 69
byte 1 40
byte 1 37
byte 1 105
byte 1 41
byte 1 58
byte 1 37
byte 1 115
byte 1 32
byte 1 121
byte 1 101
byte 1 115
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 110
byte 1 111
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $1092
byte 1 112
byte 1 114
byte 1 101
byte 1 115
byte 1 115
byte 1 32
byte 1 69
byte 1 83
byte 1 67
byte 1 32
byte 1 97
byte 1 110
byte 1 100
byte 1 32
byte 1 117
byte 1 115
byte 1 101
byte 1 32
byte 1 116
byte 1 104
byte 1 101
byte 1 32
byte 1 74
byte 1 79
byte 1 73
byte 1 78
byte 1 32
byte 1 109
byte 1 101
byte 1 110
byte 1 117
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1087
byte 1 119
byte 1 97
byte 1 105
byte 1 116
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 116
byte 1 111
byte 1 32
byte 1 112
byte 1 108
byte 1 97
byte 1 121
byte 1 0
align 1
LABELV $1082
byte 1 83
byte 1 80
byte 1 69
byte 1 67
byte 1 84
byte 1 65
byte 1 84
byte 1 79
byte 1 82
byte 1 0
align 1
LABELV $953
byte 1 37
byte 1 105
byte 1 109
byte 1 115
byte 1 0
align 1
LABELV $949
byte 1 115
byte 1 110
byte 1 99
byte 1 0
align 1
LABELV $881
byte 1 103
byte 1 102
byte 1 120
byte 1 47
byte 1 50
byte 1 100
byte 1 47
byte 1 110
byte 1 101
byte 1 116
byte 1 46
byte 1 116
byte 1 103
byte 1 97
byte 1 0
align 1
LABELV $874
byte 1 67
byte 1 111
byte 1 110
byte 1 110
byte 1 101
byte 1 99
byte 1 116
byte 1 105
byte 1 111
byte 1 110
byte 1 32
byte 1 73
byte 1 110
byte 1 116
byte 1 101
byte 1 114
byte 1 114
byte 1 117
byte 1 112
byte 1 116
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $843
byte 1 37
byte 1 100
byte 1 0
align 1
LABELV $731
byte 1 37
byte 1 115
byte 1 32
byte 1 120
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $580
byte 1 37
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $529
byte 1 37
byte 1 51
byte 1 105
byte 1 32
byte 1 37
byte 1 51
byte 1 105
byte 1 0
align 1
LABELV $526
byte 1 117
byte 1 110
byte 1 107
byte 1 110
byte 1 111
byte 1 119
byte 1 110
byte 1 0
align 1
LABELV $456
byte 1 37
byte 1 105
byte 1 58
byte 1 37
byte 1 48
byte 1 50
byte 1 105
byte 1 0
align 1
LABELV $451
byte 1 37
byte 1 105
byte 1 102
byte 1 112
byte 1 115
byte 1 0
align 1
LABELV $434
byte 1 116
byte 1 105
byte 1 109
byte 1 101
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 115
byte 1 110
byte 1 97
byte 1 112
byte 1 58
byte 1 37
byte 1 105
byte 1 32
byte 1 99
byte 1 109
byte 1 100
byte 1 58
byte 1 37
byte 1 105
byte 1 0
align 1
LABELV $425
byte 1 37
byte 1 49
byte 1 46
byte 1 48
byte 1 102
byte 1 0
align 1
LABELV $416
byte 1 110
byte 1 0
align 1
LABELV $109
byte 1 37
byte 1 105
byte 1 0
