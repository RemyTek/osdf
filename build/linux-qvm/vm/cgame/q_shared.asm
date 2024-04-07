export Com_Clamp
code
proc Com_Clamp 0 0
file "../../../../code/game/q_shared.c"
line 6
;1:// Copyright (C) 1999-2000 Id Software, Inc.
;2://
;3:// q_shared.c -- stateless support routines that are included in each code dll
;4:#include "q_shared.h"
;5:
;6:float Com_Clamp(float min, float max, float value) {
line 7
;7:	if (value < min) {
ADDRFP4 8
INDIRF4
ADDRFP4 0
INDIRF4
GEF4 $22
line 8
;8:		return min;
ADDRFP4 0
INDIRF4
RETF4
ADDRGP4 $21
JUMPV
LABELV $22
line 10
;9:	}
;10:	if (value > max) {
ADDRFP4 8
INDIRF4
ADDRFP4 4
INDIRF4
LEF4 $24
line 11
;11:		return max;
ADDRFP4 4
INDIRF4
RETF4
ADDRGP4 $21
JUMPV
LABELV $24
line 13
;12:	}
;13:	return value;
ADDRFP4 8
INDIRF4
RETF4
LABELV $21
endproc Com_Clamp 0 0
export COM_SkipPath
proc COM_SkipPath 4 0
line 21
;14:}
;15:
;16:/*
;17:============
;18:COM_SkipPath
;19:============
;20:*/
;21:char* COM_SkipPath(char* pathname) {
line 24
;22:	char* last;
;23:
;24:	last = pathname;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $28
JUMPV
LABELV $27
line 25
;25:	while (*pathname) {
line 26
;26:		if (*pathname == '/')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $30
line 27
;27:			last = pathname + 1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $30
line 28
;28:		pathname++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 29
;29:	}
LABELV $28
line 25
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $27
line 30
;30:	return last;
ADDRLP4 0
INDIRP4
RETP4
LABELV $26
endproc COM_SkipPath 4 0
export COM_StripExtension
proc COM_StripExtension 12 12
line 38
;31:}
;32:
;33:/*
;34:============
;35:COM_StripExtension
;36:============
;37:*/
;38:void COM_StripExtension(const char* in, char* out, int destsize) {
line 41
;39:	int length;
;40:
;41:	Q_strncpyz(out, in, destsize);
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 43
;42:
;43:	length = strlen(out) - 1;
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRGP4 $34
JUMPV
LABELV $33
line 44
;44:	while (length > 0 && out[length] != '.') {
line 45
;45:		length--;
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 46
;46:		if (out[length] == '/')
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $36
line 47
;47:			return;  // no extension
ADDRGP4 $32
JUMPV
LABELV $36
line 48
;48:	}
LABELV $34
line 44
ADDRLP4 0
INDIRI4
CNSTI4 0
LEI4 $38
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $33
LABELV $38
line 49
;49:	if (length)
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $39
line 50
;50:		out[length] = '\0';
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
LABELV $39
line 51
;51:}
LABELV $32
endproc COM_StripExtension 12 12
export COM_DefaultExtension
proc COM_DefaultExtension 76 20
line 58
;52:
;53:/*
;54:==================
;55:COM_DefaultExtension
;56:==================
;57:*/
;58:void COM_DefaultExtension(char* path, int maxSize, const char* extension) {
line 66
;59:	char  oldPath[MAX_QPATH];
;60:	char* src;
;61:
;62:	//
;63:	// if path doesn't have a .EXT, append extension
;64:	// (extension should include the .)
;65:	//
;66:	src = path + strlen(path) - 1;
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 68
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 68
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI4 -1
ADDP4
ASGNP4
ADDRGP4 $43
JUMPV
LABELV $42
line 68
;67:
;68:	while (*src != '/' && src != path) {
line 69
;69:		if (*src == '.') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 46
NEI4 $45
line 70
;70:			return;  // it has an extension
ADDRGP4 $41
JUMPV
LABELV $45
line 72
;71:		}
;72:		src--;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 -1
ADDP4
ASGNP4
line 73
;73:	}
LABELV $43
line 68
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 47
EQI4 $47
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
NEU4 $42
LABELV $47
line 75
;74:
;75:	Q_strncpyz(oldPath, path, sizeof(oldPath));
ADDRLP4 4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 64
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 76
;76:	Com_sprintf(path, maxSize, "%s%s", oldPath, extension);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 $48
ARGP4
ADDRLP4 4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 77
;77:}
LABELV $41
endproc COM_DefaultExtension 76 20
export COM_BeginParseSession
proc COM_BeginParseSession 0 16
line 93
;78:
;79:/*
;80:============================================================================
;81:
;82:PARSING
;83:
;84:============================================================================
;85:*/
;86:
;87:static char com_token[MAX_TOKEN_CHARS];
;88:static char com_parsename[MAX_TOKEN_CHARS];
;89:static int  com_lines;
;90:static int  com_tokenline;
;91:static int  is_separator[256];
;92:
;93:void        COM_BeginParseSession(const char* name) {
line 94
;94:		   com_lines     = 1;
ADDRGP4 com_lines
CNSTI4 1
ASGNI4
line 95
;95:		   com_tokenline = 0;
ADDRGP4 com_tokenline
CNSTI4 0
ASGNI4
line 96
;96:		   Com_sprintf(com_parsename, sizeof(com_parsename), "%s", name);
ADDRGP4 com_parsename
ARGP4
CNSTI4 1024
ARGI4
ADDRGP4 $50
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 Com_sprintf
CALLI4
pop
line 97
;97:}
LABELV $49
endproc COM_BeginParseSession 0 16
export COM_GetCurrentParseLine
proc COM_GetCurrentParseLine 0 0
line 99
;98:
;99:int COM_GetCurrentParseLine(void) {
line 100
;100:	if (com_tokenline) {
ADDRGP4 com_tokenline
INDIRI4
CNSTI4 0
EQI4 $52
line 101
;101:		return com_tokenline;
ADDRGP4 com_tokenline
INDIRI4
RETI4
ADDRGP4 $51
JUMPV
LABELV $52
line 104
;102:	}
;103:
;104:	return com_lines;
ADDRGP4 com_lines
INDIRI4
RETI4
LABELV $51
endproc COM_GetCurrentParseLine 0 0
export COM_Parse
proc COM_Parse 4 8
line 107
;105:}
;106:
;107:char* COM_Parse(char** data_p) {
line 108
;108:	return COM_ParseExt(data_p, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 0
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
INDIRP4
RETP4
LABELV $54
endproc COM_Parse 4 8
bss
align 1
LABELV $56
skip 4096
export COM_ParseError
code
proc COM_ParseError 4 16
line 113
;109:}
;110:
;111:extern int ED_vsprintf(char* buffer, const char* fmt, va_list argptr);
;112:
;113:void       COM_ParseError(char* format, ...) {
line 117
;114:		  va_list     argptr;
;115:		  static char string[4096];
;116:
;117:		  va_start(argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 118
;118:		  ED_vsprintf(string, format, argptr);
ADDRGP4 $56
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
line 119
;119:		  va_end(argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 121
;120:
;121:		  Com_Printf("ERROR: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $58
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $56
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 122
;122:}
LABELV $55
endproc COM_ParseError 4 16
bss
align 1
LABELV $60
skip 4096
export COM_ParseWarning
code
proc COM_ParseWarning 4 16
line 124
;123:
;124:void COM_ParseWarning(char* format, ...) {
line 128
;125:	va_list     argptr;
;126:	static char string[4096];
;127:
;128:	va_start(argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 129
;129:	ED_vsprintf(string, format, argptr);
ADDRGP4 $60
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
line 130
;130:	va_end(argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 132
;131:
;132:	Com_Printf("WARNING: %s, line %d: %s\n", com_parsename, com_lines, string);
ADDRGP4 $62
ARGP4
ADDRGP4 com_parsename
ARGP4
ADDRGP4 com_lines
INDIRI4
ARGI4
ADDRGP4 $60
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 133
;133:}
LABELV $59
endproc COM_ParseWarning 4 16
proc SkipWhitespace 8 0
line 147
;134:
;135:/*
;136:==============
;137:COM_Parse
;138:
;139:Parse a token out of a string
;140:Will never return NULL, just empty strings
;141:
;142:If "allowLineBreaks" is qtrue then an empty
;143:string will be returned if the next token is
;144:a newline.
;145:==============
;146:*/
;147:static char* SkipWhitespace(char* data, qboolean* hasNewLines) {
ADDRGP4 $65
JUMPV
LABELV $64
line 150
;148:	int c;
;149:
;150:	while ((c = *data) <= ' ') {
line 151
;151:		if (!c) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $67
line 152
;152:			return NULL;
CNSTP4 0
RETP4
ADDRGP4 $63
JUMPV
LABELV $67
line 154
;153:		}
;154:		if (c == '\n') {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $69
line 155
;155:			com_lines++;
ADDRLP4 4
ADDRGP4 com_lines
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 4
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 156
;156:			*hasNewLines = qtrue;
ADDRFP4 4
INDIRP4
CNSTI4 1
ASGNI4
line 157
;157:		}
LABELV $69
line 158
;158:		data++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 159
;159:	}
LABELV $65
line 150
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $64
line 161
;160:
;161:	return data;
ADDRFP4 0
INDIRP4
RETP4
LABELV $63
endproc SkipWhitespace 8 0
export COM_Compress
proc COM_Compress 44 0
line 164
;162:}
;163:
;164:int COM_Compress(char* data_p) {
line 167
;165:	char *   in, *out;
;166:	int      c;
;167:	qboolean newline = qfalse, whitespace = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
ADDRLP4 16
CNSTI4 0
ASGNI4
line 169
;168:
;169:	in = out = data_p;
ADDRLP4 20
ADDRFP4 0
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 20
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 20
INDIRP4
ASGNP4
line 170
;170:	if (in) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $72
ADDRGP4 $75
JUMPV
LABELV $74
line 171
;171:		while ((c = *in) != 0) {
line 173
;172:			// skip double slash comments
;173:			if (c == '/' && in[1] == '/') {
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $77
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $77
ADDRGP4 $80
JUMPV
LABELV $79
line 174
;174:				while (*in && *in != '\n') {
line 175
;175:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 176
;176:				}
LABELV $80
line 174
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $82
ADDRLP4 24
INDIRI4
CNSTI4 10
NEI4 $79
LABELV $82
line 178
;177:				// skip /* */ comments
;178:			} else if (c == '/' && in[1] == '*') {
ADDRGP4 $78
JUMPV
LABELV $77
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $83
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $83
ADDRGP4 $86
JUMPV
LABELV $85
line 180
;179:				while (*in && (*in != '*' || in[1] != '/'))
;180:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $86
line 179
ADDRLP4 28
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $88
ADDRLP4 28
INDIRI4
CNSTI4 42
NEI4 $85
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $85
LABELV $88
line 181
;181:				if (*in)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $84
line 182
;182:					in += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 184
;183:				// record when we hit a newline
;184:			} else if (c == '\n' || c == '\r') {
ADDRGP4 $84
JUMPV
LABELV $83
ADDRLP4 4
INDIRI4
CNSTI4 10
EQI4 $93
ADDRLP4 4
INDIRI4
CNSTI4 13
NEI4 $91
LABELV $93
line 185
;185:				newline = qtrue;
ADDRLP4 12
CNSTI4 1
ASGNI4
line 186
;186:				in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 188
;187:				// record when we hit whitespace
;188:			} else if (c == ' ' || c == '\t') {
ADDRGP4 $92
JUMPV
LABELV $91
ADDRLP4 4
INDIRI4
CNSTI4 32
EQI4 $96
ADDRLP4 4
INDIRI4
CNSTI4 9
NEI4 $94
LABELV $96
line 189
;189:				whitespace = qtrue;
ADDRLP4 16
CNSTI4 1
ASGNI4
line 190
;190:				in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 192
;191:				// an actual token
;192:			} else {
ADDRGP4 $95
JUMPV
LABELV $94
line 194
;193:				// if we have a pending newline, emit it (and it counts as whitespace)
;194:				if (newline) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $97
line 195
;195:					*out++     = '\n';
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI1 10
ASGNI1
line 196
;196:					newline    = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 197
;197:					whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 198
;198:				} else if (whitespace) {
ADDRGP4 $98
JUMPV
LABELV $97
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $99
line 199
;199:					*out++     = ' ';
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
CNSTI1 32
ASGNI1
line 200
;200:					whitespace = qfalse;
ADDRLP4 16
CNSTI4 0
ASGNI4
line 201
;201:				}
LABELV $99
LABELV $98
line 204
;202:
;203:				// copy quoted strings unmolested
;204:				if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $101
line 205
;205:					*out++ = c;
ADDRLP4 32
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 32
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 32
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 206
;206:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $104
JUMPV
LABELV $103
line 207
;207:					while (1) {
line 208
;208:						c = *in;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 209
;209:						if (c && c != '"') {
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $105
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $105
line 210
;210:							*out++ = c;
ADDRLP4 40
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 40
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 40
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 211
;211:							in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 212
;212:						} else {
line 213
;213:							break;
LABELV $107
line 215
;214:						}
;215:					}
LABELV $104
line 207
ADDRGP4 $103
JUMPV
LABELV $105
line 216
;216:					if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $102
line 217
;217:						*out++ = c;
ADDRLP4 36
ADDRLP4 8
INDIRP4
ASGNP4
ADDRLP4 8
ADDRLP4 36
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 36
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 218
;218:						in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 219
;219:					}
line 220
;220:				} else {
ADDRGP4 $102
JUMPV
LABELV $101
line 221
;221:					*out = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 222
;222:					out++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 223
;223:					in++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 224
;224:				}
LABELV $102
line 225
;225:			}
LABELV $95
LABELV $92
LABELV $84
LABELV $78
line 226
;226:		}
LABELV $75
line 171
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 24
INDIRI4
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
NEI4 $74
line 227
;227:	}
LABELV $72
line 228
;228:	*out = 0;
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 229
;229:	return out - data_p;
ADDRLP4 8
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
LABELV $71
endproc COM_Compress 44 0
export COM_ParseExt
proc COM_ParseExt 28 8
line 232
;230:}
;231:
;232:char* COM_ParseExt(char** data_p, qboolean allowLineBreaks) {
line 233
;233:	int      c           = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 234
;234:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 237
;235:	char*    data;
;236:
;237:	data          = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 238
;238:	len           = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 239
;239:	com_token[0]  = '\0';
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 240
;240:	com_tokenline = 0;
ADDRGP4 com_tokenline
CNSTI4 0
ASGNI4
line 243
;241:
;242:	// make sure incoming data is valid
;243:	if (!data) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $114
line 244
;244:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 245
;245:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $110
JUMPV
LABELV $113
line 248
;246:	}
;247:
;248:	while (1) {
line 250
;249:		// skip whitespace
;250:		data = SkipWhitespace(data, &hasNewLines);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 251
;251:		if (!data) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $116
line 252
;252:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 253
;253:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $110
JUMPV
LABELV $116
line 255
;254:		}
;255:		if (hasNewLines && !allowLineBreaks) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $118
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $118
line 256
;256:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 257
;257:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $110
JUMPV
LABELV $118
line 260
;258:		}
;259:
;260:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 263
;261:
;262:		// skip double slash comments
;263:		if (c == '/' && data[1] == '/') {
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $120
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $120
line 264
;264:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $123
JUMPV
LABELV $122
line 265
;265:			while (*data && *data != '\n') {
line 266
;266:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 267
;267:			}
LABELV $123
line 265
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $125
ADDRLP4 20
INDIRI4
CNSTI4 10
NEI4 $122
LABELV $125
line 268
;268:		}
ADDRGP4 $121
JUMPV
LABELV $120
line 270
;269:		// skip /* */ comments
;270:		else if (c == '/' && data[1] == '*') {
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $115
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $115
line 271
;271:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $129
JUMPV
LABELV $128
line 272
;272:			while (*data && (*data != '*' || data[1] != '/')) {
line 273
;273:				if (*data == '\n') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $131
line 274
;274:					com_lines++;
ADDRLP4 20
ADDRGP4 com_lines
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 275
;275:				}
LABELV $131
line 276
;276:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 277
;277:			}
LABELV $129
line 272
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $133
ADDRLP4 24
INDIRI4
CNSTI4 42
NEI4 $128
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $128
LABELV $133
line 278
;278:			if (*data) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $127
line 279
;279:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 280
;280:			}
line 281
;281:		} else {
line 282
;282:			break;
LABELV $127
LABELV $121
line 284
;283:		}
;284:	}
LABELV $114
line 248
ADDRGP4 $113
JUMPV
LABELV $115
line 286
;285:
;286:	com_tokenline = com_lines;
ADDRGP4 com_tokenline
ADDRGP4 com_lines
INDIRI4
ASGNI4
line 289
;287:
;288:	// handle quoted strings
;289:	if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $136
line 290
;290:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $139
JUMPV
LABELV $138
line 291
;291:		while (1) {
line 292
;292:			c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 293
;293:			if (c == '"' || c == '\0') {
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $143
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $141
LABELV $143
line 294
;294:				if (c == '"')
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $144
line 295
;295:					data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $144
line 297
;296:
;297:				com_token[len] = '\0';
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 298
;298:				*data_p        = (char*)data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 299
;299:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $110
JUMPV
LABELV $141
line 301
;300:			}
;301:			data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 302
;302:			if (c == '\n') {
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $146
line 303
;303:				com_lines++;
ADDRLP4 20
ADDRGP4 com_lines
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 304
;304:			}
LABELV $146
line 305
;305:			if (len < MAX_TOKEN_CHARS - 1) {
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $148
line 306
;306:				com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 307
;307:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 308
;308:			}
LABELV $148
line 309
;309:		}
LABELV $139
line 291
ADDRGP4 $138
JUMPV
line 310
;310:	}
LABELV $136
LABELV $150
line 313
;311:
;312:	// parse a regular word
;313:	do {
line 314
;314:		if (len < MAX_TOKEN_CHARS - 1) {
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $153
line 315
;315:			com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 316
;316:			len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 317
;317:		}
LABELV $153
line 318
;318:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 319
;319:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 320
;320:	} while (c > ' ');
LABELV $151
ADDRLP4 4
INDIRI4
CNSTI4 32
GTI4 $150
line 322
;321:
;322:	com_token[len] = '\0';
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 324
;323:
;324:	*data_p = (char*)data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 325
;325:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $110
endproc COM_ParseExt 28 8
export COM_MatchToken
proc COM_MatchToken 12 16
line 333
;326:}
;327:
;328:/*
;329:==================
;330:COM_MatchToken
;331:==================
;332:*/
;333:void COM_MatchToken(char** buf_p, char* match) {
line 336
;334:	char* token;
;335:
;336:	token = COM_Parse(buf_p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
ASGNP4
line 337
;337:	if (strcmp(token, match)) {
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 strcmp
CALLI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
EQI4 $156
line 338
;338:		Com_Error(ERR_DROP, "MatchToken: %s != %s", token, match);
CNSTI4 1
ARGI4
ADDRGP4 $158
ARGP4
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 339
;339:	}
LABELV $156
line 340
;340:}
LABELV $155
endproc COM_MatchToken 12 16
export SkipBracedSection
proc SkipBracedSection 12 8
line 351
;341:
;342:/*
;343:=================
;344:SkipBracedSection
;345:
;346:The next token should be an open brace.
;347:Skips until a matching close brace is found.
;348:Internal brace depths are properly skipped.
;349:=================
;350:*/
;351:void SkipBracedSection(char** program) {
line 355
;352:	char* token;
;353:	int   depth;
;354:
;355:	depth = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
LABELV $160
line 356
;356:	do {
line 357
;357:		token = COM_ParseExt(program, qtrue);
ADDRFP4 0
INDIRP4
ARGP4
CNSTI4 1
ARGI4
ADDRLP4 8
ADDRGP4 COM_ParseExt
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 8
INDIRP4
ASGNP4
line 358
;358:		if (token[1] == 0) {
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $163
line 359
;359:			if (token[0] == '{') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 123
NEI4 $165
line 360
;360:				depth++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 361
;361:			} else if (token[0] == '}') {
ADDRGP4 $166
JUMPV
LABELV $165
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 125
NEI4 $167
line 362
;362:				depth--;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
line 363
;363:			}
LABELV $167
LABELV $166
line 364
;364:		}
LABELV $163
line 365
;365:	} while (depth && *program);
LABELV $161
ADDRLP4 4
INDIRI4
CNSTI4 0
EQI4 $169
ADDRFP4 0
INDIRP4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $160
LABELV $169
line 366
;366:}
LABELV $159
endproc SkipBracedSection 12 8
export SkipRestOfLine
proc SkipRestOfLine 12 0
line 373
;367:
;368:/*
;369:=================
;370:SkipRestOfLine
;371:=================
;372:*/
;373:void SkipRestOfLine(char** data) {
line 377
;374:	char* p;
;375:	int   c;
;376:
;377:	p = *data;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 379
;378:
;379:	if (!*p)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $174
line 380
;380:		return;
ADDRGP4 $170
JUMPV
LABELV $173
line 382
;381:
;382:	while ((c = *p) != '\0') {
line 383
;383:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 384
;384:		if (c == '\n') {
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $176
line 385
;385:			com_lines++;
ADDRLP4 8
ADDRGP4 com_lines
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 386
;386:			break;
ADDRGP4 $175
JUMPV
LABELV $176
line 388
;387:		}
;388:	}
LABELV $174
line 382
ADDRLP4 8
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $173
LABELV $175
line 390
;389:
;390:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 391
;391:}
LABELV $170
endproc SkipRestOfLine 12 0
export Com_InitSeparators
proc Com_InitSeparators 0 0
line 393
;392:
;393:void Com_InitSeparators(void) {
line 394
;394:	is_separator['\n'] = 1;
ADDRGP4 is_separator+40
CNSTI4 1
ASGNI4
line 395
;395:	is_separator[';']  = 1;
ADDRGP4 is_separator+236
CNSTI4 1
ASGNI4
line 396
;396:	is_separator['=']  = 1;
ADDRGP4 is_separator+244
CNSTI4 1
ASGNI4
line 397
;397:	is_separator['{']  = 1;
ADDRGP4 is_separator+492
CNSTI4 1
ASGNI4
line 398
;398:	is_separator['}']  = 1;
ADDRGP4 is_separator+500
CNSTI4 1
ASGNI4
line 399
;399:}
LABELV $178
endproc Com_InitSeparators 0 0
export SkipTillSeparators
proc SkipTillSeparators 12 0
line 401
;400:
;401:void SkipTillSeparators(char** data) {
line 405
;402:	char* p;
;403:	int   c;
;404:
;405:	p = *data;
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 407
;406:
;407:	if (!*p)
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $188
line 408
;408:		return;
ADDRGP4 $184
JUMPV
LABELV $187
line 410
;409:
;410:	while ((c = *p) != '\0') {
line 411
;411:		p++;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 412
;412:		if (is_separator[c]) {
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 is_separator
ADDP4
INDIRI4
CNSTI4 0
EQI4 $190
line 413
;413:			if (c == '\n') {
ADDRLP4 0
INDIRI4
CNSTI4 10
NEI4 $189
line 414
;414:				com_lines++;
ADDRLP4 8
ADDRGP4 com_lines
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 415
;415:			}
line 416
;416:			break;
ADDRGP4 $189
JUMPV
LABELV $190
line 418
;417:		}
;418:	}
LABELV $188
line 410
ADDRLP4 8
ADDRLP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $187
LABELV $189
line 420
;419:
;420:	*data = p;
ADDRFP4 0
INDIRP4
ADDRLP4 4
INDIRP4
ASGNP4
line 421
;421:}
LABELV $184
endproc SkipTillSeparators 12 0
export COM_ParseSep
proc COM_ParseSep 28 8
line 423
;422:
;423:char* COM_ParseSep(char** data_p, qboolean allowLineBreaks) {
line 424
;424:	int      c           = 0, len;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 425
;425:	qboolean hasNewLines = qfalse;
ADDRLP4 12
CNSTI4 0
ASGNI4
line 428
;426:	char*    data;
;427:
;428:	data          = *data_p;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRP4
ASGNP4
line 429
;429:	len           = 0;
ADDRLP4 8
CNSTI4 0
ASGNI4
line 430
;430:	com_token[0]  = '\0';
ADDRGP4 com_token
CNSTI1 0
ASGNI1
line 431
;431:	com_tokenline = 0;
ADDRGP4 com_tokenline
CNSTI4 0
ASGNI4
line 434
;432:
;433:	// make sure incoming data is valid
;434:	if (!data) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $198
line 435
;435:		*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 436
;436:		return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $194
JUMPV
LABELV $197
line 439
;437:	}
;438:
;439:	while (1) {
line 441
;440:		// skip whitespace
;441:		data = SkipWhitespace(data, &hasNewLines);
ADDRLP4 0
INDIRP4
ARGP4
ADDRLP4 12
ARGP4
ADDRLP4 16
ADDRGP4 SkipWhitespace
CALLP4
ASGNP4
ADDRLP4 0
ADDRLP4 16
INDIRP4
ASGNP4
line 442
;442:		if (!data) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $200
line 443
;443:			*data_p = NULL;
ADDRFP4 0
INDIRP4
CNSTP4 0
ASGNP4
line 444
;444:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $194
JUMPV
LABELV $200
line 446
;445:		}
;446:		if (hasNewLines && !allowLineBreaks) {
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $202
ADDRFP4 4
INDIRI4
CNSTI4 0
NEI4 $202
line 447
;447:			*data_p = data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 448
;448:			return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $194
JUMPV
LABELV $202
line 451
;449:		}
;450:
;451:		c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 454
;452:
;453:		// skip double slash comments
;454:		if (c == '/' && data[1] == '/') {
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $204
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $204
line 455
;455:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $207
JUMPV
LABELV $206
line 456
;456:			while (*data && *data != '\n') {
line 457
;457:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 458
;458:			}
LABELV $207
line 456
ADDRLP4 20
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 0
EQI4 $209
ADDRLP4 20
INDIRI4
CNSTI4 10
NEI4 $206
LABELV $209
line 459
;459:		}
ADDRGP4 $205
JUMPV
LABELV $204
line 461
;460:		// skip /* */ comments
;461:		else if (c == '/' && data[1] == '*') {
ADDRLP4 4
INDIRI4
CNSTI4 47
NEI4 $199
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 42
NEI4 $199
line 462
;462:			data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
ADDRGP4 $213
JUMPV
LABELV $212
line 463
;463:			while (*data && (*data != '*' || data[1] != '/')) {
line 464
;464:				if (*data == '\n') {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 10
NEI4 $215
line 465
;465:					com_lines++;
ADDRLP4 20
ADDRGP4 com_lines
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 466
;466:				}
LABELV $215
line 467
;467:				data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 468
;468:			}
LABELV $213
line 463
ADDRLP4 24
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 24
INDIRI4
CNSTI4 0
EQI4 $217
ADDRLP4 24
INDIRI4
CNSTI4 42
NEI4 $212
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 47
NEI4 $212
LABELV $217
line 469
;469:			if (*data) {
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $211
line 470
;470:				data += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 471
;471:			}
line 472
;472:		} else {
line 473
;473:			break;
LABELV $211
LABELV $205
line 475
;474:		}
;475:	}
LABELV $198
line 439
ADDRGP4 $197
JUMPV
LABELV $199
line 477
;476:
;477:	com_tokenline = com_lines;
ADDRGP4 com_tokenline
ADDRGP4 com_lines
INDIRI4
ASGNI4
line 480
;478:
;479:	// handle quoted strings
;480:	if (c == '"') {
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $220
line 481
;481:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $223
JUMPV
LABELV $222
line 482
;482:		while (1) {
line 483
;483:			c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 484
;484:			if (c == '"' || c == '\0') {
ADDRLP4 4
INDIRI4
CNSTI4 34
EQI4 $227
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $225
LABELV $227
line 485
;485:				if (c == '"')
ADDRLP4 4
INDIRI4
CNSTI4 34
NEI4 $228
line 486
;486:					data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $228
line 488
;487:
;488:				com_token[len] = '\0';
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 489
;489:				*data_p        = (char*)data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 490
;490:				return com_token;
ADDRGP4 com_token
RETP4
ADDRGP4 $194
JUMPV
LABELV $225
line 492
;491:			}
;492:			data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 493
;493:			if (c == '\n') {
ADDRLP4 4
INDIRI4
CNSTI4 10
NEI4 $230
line 494
;494:				com_lines++;
ADDRLP4 20
ADDRGP4 com_lines
ASGNP4
ADDRLP4 20
INDIRP4
ADDRLP4 20
INDIRP4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 495
;495:			}
LABELV $230
line 496
;496:			if (len < MAX_TOKEN_CHARS - 1) {
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $232
line 497
;497:				com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 498
;498:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 499
;499:			}
LABELV $232
line 500
;500:		}
LABELV $223
line 482
ADDRGP4 $222
JUMPV
line 501
;501:	}
LABELV $220
line 504
;502:
;503:	// special case for separators
;504:	if (is_separator[c]) {
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 is_separator
ADDP4
INDIRI4
CNSTI4 0
EQI4 $234
line 505
;505:		com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 506
;506:		len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 507
;507:		data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 508
;508:	} else  // parse a regular word
ADDRGP4 $235
JUMPV
LABELV $234
LABELV $236
line 509
;509:		do {
line 510
;510:			if (len < MAX_TOKEN_CHARS - 1) {
ADDRLP4 8
INDIRI4
CNSTI4 1023
GEI4 $239
line 511
;511:				com_token[len] = c;
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 512
;512:				len++;
ADDRLP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 513
;513:			}
LABELV $239
line 514
;514:			data++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 515
;515:			c = *data;
ADDRLP4 4
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 516
;516:		} while (c > ' ' && !is_separator[c]);
LABELV $237
ADDRLP4 4
INDIRI4
CNSTI4 32
LEI4 $241
ADDRLP4 4
INDIRI4
CNSTI4 2
LSHI4
ADDRGP4 is_separator
ADDP4
INDIRI4
CNSTI4 0
EQI4 $236
LABELV $241
LABELV $235
line 518
;517:
;518:	com_token[len] = '\0';
ADDRLP4 8
INDIRI4
ADDRGP4 com_token
ADDP4
CNSTI1 0
ASGNI1
line 520
;519:
;520:	*data_p = (char*)data;
ADDRFP4 0
INDIRP4
ADDRLP4 0
INDIRP4
ASGNP4
line 521
;521:	return com_token;
ADDRGP4 com_token
RETP4
LABELV $194
endproc COM_ParseSep 28 8
export Com_Split
proc Com_Split 20 0
line 529
;522:}
;523:
;524:/*
;525:============
;526:Com_Split
;527:============
;528:*/
;529:int Com_Split(char* in, char** out, int outsz, int delim) {
line 531
;530:	int    c;
;531:	char **o = out, **end = out + outsz;
ADDRLP4 8
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 4
INDIRP4
ADDP4
ASGNP4
line 533
;532:	// skip leading spaces
;533:	if (delim >= ' ') {
ADDRFP4 12
INDIRI4
CNSTI4 32
LTI4 $243
ADDRGP4 $246
JUMPV
LABELV $245
line 535
;534:		while ((c = *in) != '\0' && c <= ' ')
;535:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $246
line 534
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $248
ADDRLP4 0
INDIRI4
CNSTI4 32
LEI4 $245
LABELV $248
line 536
;536:	}
LABELV $243
line 537
;537:	*out = in;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
line 538
;538:	out++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
ADDRGP4 $250
JUMPV
line 539
;539:	while (out < end) {
LABELV $252
line 541
;540:		while ((c = *in) != '\0' && c != delim)
;541:			in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $253
line 540
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $255
ADDRLP4 0
INDIRI4
ADDRFP4 12
INDIRI4
NEI4 $252
LABELV $255
line 542
;542:		*in = '\0';
ADDRFP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 543
;543:		if (!c) {
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $256
line 545
;544:			// don't count last null value
;545:			if (out[-1][0] == '\0')
ADDRFP4 4
INDIRP4
CNSTI4 -4
ADDP4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $267
line 546
;546:				out--;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 -4
ADDP4
ASGNP4
line 547
;547:			break;
ADDRGP4 $267
JUMPV
LABELV $256
line 549
;548:		}
;549:		in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 551
;550:		// skip leading spaces
;551:		if (delim >= ' ') {
ADDRFP4 12
INDIRI4
CNSTI4 32
LTI4 $260
ADDRGP4 $263
JUMPV
LABELV $262
line 553
;552:			while ((c = *in) != '\0' && c <= ' ')
;553:				in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $263
line 552
ADDRLP4 16
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 16
INDIRI4
ASGNI4
ADDRLP4 16
INDIRI4
CNSTI4 0
EQI4 $265
ADDRLP4 0
INDIRI4
CNSTI4 32
LEI4 $262
LABELV $265
line 554
;554:		}
LABELV $260
line 555
;555:		*out = in;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
line 556
;556:		out++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 557
;557:	}
LABELV $250
line 539
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
LTU4 $253
ADDRGP4 $267
JUMPV
LABELV $266
line 560
;558:	// sanitize last value
;559:	while ((c = *in) != '\0' && c != delim)
;560:		in++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $267
line 559
ADDRLP4 12
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
EQI4 $269
ADDRLP4 0
INDIRI4
ADDRFP4 12
INDIRI4
NEI4 $266
LABELV $269
line 561
;561:	*in = '\0';
ADDRFP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 562
;562:	c   = out - o;
ADDRLP4 0
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 4
DIVI4
ASGNI4
ADDRGP4 $271
JUMPV
LABELV $270
line 564
;563:	// set remaining out pointers
;564:	while (out < end) {
line 565
;565:		*out = in;
ADDRFP4 4
INDIRP4
ADDRFP4 0
INDIRP4
ASGNP4
line 566
;566:		out++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 4
ADDP4
ASGNP4
line 567
;567:	}
LABELV $271
line 564
ADDRFP4 4
INDIRP4
CVPU4 4
ADDRLP4 4
INDIRP4
CVPU4 4
LTU4 $270
line 568
;568:	return c;
ADDRLP4 0
INDIRI4
RETI4
LABELV $242
endproc Com_Split 20 0
export Parse1DMatrix
proc Parse1DMatrix 16 8
line 571
;569:}
;570:
;571:void Parse1DMatrix(char** buf_p, int x, float* m) {
line 575
;572:	char* token;
;573:	int   i;
;574:
;575:	COM_MatchToken(buf_p, "(");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $274
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 577
;576:
;577:	for (i = 0; i < x; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $278
JUMPV
LABELV $275
line 578
;578:		token = COM_Parse(buf_p);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 COM_Parse
CALLP4
ASGNP4
ADDRLP4 4
ADDRLP4 8
INDIRP4
ASGNP4
line 579
;579:		m[i]  = atof(token);
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 12
ADDRGP4 atof
CALLF4
ASGNF4
ADDRLP4 0
INDIRI4
CNSTI4 2
LSHI4
ADDRFP4 8
INDIRP4
ADDP4
ADDRLP4 12
INDIRF4
ASGNF4
line 580
;580:	}
LABELV $276
line 577
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $278
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $275
line 582
;581:
;582:	COM_MatchToken(buf_p, ")");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 583
;583:}
LABELV $273
endproc Parse1DMatrix 16 8
export Parse2DMatrix
proc Parse2DMatrix 8 12
line 585
;584:
;585:void Parse2DMatrix(char** buf_p, int y, int x, float* m) {
line 588
;586:	int i;
;587:
;588:	COM_MatchToken(buf_p, "(");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $274
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 590
;589:
;590:	for (i = 0; i < y; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $284
JUMPV
LABELV $281
line 591
;591:		Parse1DMatrix(buf_p, x, m + i * x);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 12
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse1DMatrix
CALLV
pop
line 592
;592:	}
LABELV $282
line 590
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $284
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $281
line 594
;593:
;594:	COM_MatchToken(buf_p, ")");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 595
;595:}
LABELV $280
endproc Parse2DMatrix 8 12
export Parse3DMatrix
proc Parse3DMatrix 12 16
line 597
;596:
;597:void Parse3DMatrix(char** buf_p, int z, int y, int x, float* m) {
line 600
;598:	int i;
;599:
;600:	COM_MatchToken(buf_p, "(");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $274
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 602
;601:
;602:	for (i = 0; i < z; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $289
JUMPV
LABELV $286
line 603
;603:		Parse2DMatrix(buf_p, y, x, m + i * x * y);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRFP4 8
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 8
ADDRFP4 12
INDIRI4
ASGNI4
ADDRLP4 8
INDIRI4
ARGI4
ADDRLP4 0
INDIRI4
ADDRLP4 8
INDIRI4
MULI4
ADDRLP4 4
INDIRI4
MULI4
CNSTI4 2
LSHI4
ADDRFP4 16
INDIRP4
ADDP4
ARGP4
ADDRGP4 Parse2DMatrix
CALLV
pop
line 604
;604:	}
LABELV $287
line 602
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $289
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $286
line 606
;605:
;606:	COM_MatchToken(buf_p, ")");
ADDRFP4 0
INDIRP4
ARGP4
ADDRGP4 $279
ARGP4
ADDRGP4 COM_MatchToken
CALLV
pop
line 607
;607:}
LABELV $285
endproc Parse3DMatrix 12 16
lit
export locase
align 1
LABELV locase
byte 1 0
byte 1 1
byte 1 2
byte 1 3
byte 1 4
byte 1 5
byte 1 6
byte 1 7
byte 1 8
byte 1 9
byte 1 10
byte 1 11
byte 1 12
byte 1 13
byte 1 14
byte 1 15
byte 1 16
byte 1 17
byte 1 18
byte 1 19
byte 1 20
byte 1 21
byte 1 22
byte 1 23
byte 1 24
byte 1 25
byte 1 26
byte 1 27
byte 1 28
byte 1 29
byte 1 30
byte 1 31
byte 1 32
byte 1 33
byte 1 34
byte 1 35
byte 1 36
byte 1 37
byte 1 38
byte 1 39
byte 1 40
byte 1 41
byte 1 42
byte 1 43
byte 1 44
byte 1 45
byte 1 46
byte 1 47
byte 1 48
byte 1 49
byte 1 50
byte 1 51
byte 1 52
byte 1 53
byte 1 54
byte 1 55
byte 1 56
byte 1 57
byte 1 58
byte 1 59
byte 1 60
byte 1 61
byte 1 62
byte 1 63
byte 1 64
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 103
byte 1 104
byte 1 105
byte 1 106
byte 1 107
byte 1 108
byte 1 109
byte 1 110
byte 1 111
byte 1 112
byte 1 113
byte 1 114
byte 1 115
byte 1 116
byte 1 117
byte 1 118
byte 1 119
byte 1 120
byte 1 121
byte 1 122
byte 1 91
byte 1 92
byte 1 93
byte 1 94
byte 1 95
byte 1 96
byte 1 97
byte 1 98
byte 1 99
byte 1 100
byte 1 101
byte 1 102
byte 1 103
byte 1 104
byte 1 105
byte 1 106
byte 1 107
byte 1 108
byte 1 109
byte 1 110
byte 1 111
byte 1 112
byte 1 113
byte 1 114
byte 1 115
byte 1 116
byte 1 117
byte 1 118
byte 1 119
byte 1 120
byte 1 121
byte 1 122
byte 1 123
byte 1 124
byte 1 125
byte 1 126
byte 1 127
byte 1 128
byte 1 129
byte 1 130
byte 1 131
byte 1 132
byte 1 133
byte 1 134
byte 1 135
byte 1 136
byte 1 137
byte 1 138
byte 1 139
byte 1 140
byte 1 141
byte 1 142
byte 1 143
byte 1 144
byte 1 145
byte 1 146
byte 1 147
byte 1 148
byte 1 149
byte 1 150
byte 1 151
byte 1 152
byte 1 153
byte 1 154
byte 1 155
byte 1 156
byte 1 157
byte 1 158
byte 1 159
byte 1 160
byte 1 161
byte 1 162
byte 1 163
byte 1 164
byte 1 165
byte 1 166
byte 1 167
byte 1 168
byte 1 169
byte 1 170
byte 1 171
byte 1 172
byte 1 173
byte 1 174
byte 1 175
byte 1 176
byte 1 177
byte 1 178
byte 1 179
byte 1 180
byte 1 181
byte 1 182
byte 1 183
byte 1 184
byte 1 185
byte 1 186
byte 1 187
byte 1 188
byte 1 189
byte 1 190
byte 1 191
byte 1 192
byte 1 193
byte 1 194
byte 1 195
byte 1 196
byte 1 197
byte 1 198
byte 1 199
byte 1 200
byte 1 201
byte 1 202
byte 1 203
byte 1 204
byte 1 205
byte 1 206
byte 1 207
byte 1 208
byte 1 209
byte 1 210
byte 1 211
byte 1 212
byte 1 213
byte 1 214
byte 1 215
byte 1 216
byte 1 217
byte 1 218
byte 1 219
byte 1 220
byte 1 221
byte 1 222
byte 1 223
byte 1 224
byte 1 225
byte 1 226
byte 1 227
byte 1 228
byte 1 229
byte 1 230
byte 1 231
byte 1 232
byte 1 233
byte 1 234
byte 1 235
byte 1 236
byte 1 237
byte 1 238
byte 1 239
byte 1 240
byte 1 241
byte 1 242
byte 1 243
byte 1 244
byte 1 245
byte 1 246
byte 1 247
byte 1 248
byte 1 249
byte 1 250
byte 1 251
byte 1 252
byte 1 253
byte 1 254
byte 1 255
export Q_isprint
code
proc Q_isprint 4 0
line 629
;608:
;609:/*
;610:============================================================================
;611:
;612:                    LIBRARY REPLACEMENT FUNCTIONS
;613:
;614:============================================================================
;615:*/
;616:
;617:const byte locase[256] = {
;618:	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0x10, 0x11, 0x12, 0x13, 0x14, 0x15, 0x16, 0x17, 0x18, 0x19,
;619:	0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x30, 0x31, 0x32, 0x33,
;620:	0x34, 0x35, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x40, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d,
;621:	0x6e, 0x6f, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a, 0x5b, 0x5c, 0x5d, 0x5e, 0x5f, 0x60, 0x61, 0x62, 0x63, 0x64, 0x65, 0x66, 0x67,
;622:	0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f, 0x70, 0x71, 0x72, 0x73, 0x74, 0x75, 0x76, 0x77, 0x78, 0x79, 0x7a, 0x7b, 0x7c, 0x7d, 0x7e, 0x7f, 0x80, 0x81,
;623:	0x82, 0x83, 0x84, 0x85, 0x86, 0x87, 0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f, 0x90, 0x91, 0x92, 0x93, 0x94, 0x95, 0x96, 0x97, 0x98, 0x99, 0x9a, 0x9b,
;624:	0x9c, 0x9d, 0x9e, 0x9f, 0xa0, 0xa1, 0xa2, 0xa3, 0xa4, 0xa5, 0xa6, 0xa7, 0xa8, 0xa9, 0xaa, 0xab, 0xac, 0xad, 0xae, 0xaf, 0xb0, 0xb1, 0xb2, 0xb3, 0xb4, 0xb5,
;625:	0xb6, 0xb7, 0xb8, 0xb9, 0xba, 0xbb, 0xbc, 0xbd, 0xbe, 0xbf, 0xc0, 0xc1, 0xc2, 0xc3, 0xc4, 0xc5, 0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf,
;626:	0xd0, 0xd1, 0xd2, 0xd3, 0xd4, 0xd5, 0xd6, 0xd7, 0xd8, 0xd9, 0xda, 0xdb, 0xdc, 0xdd, 0xde, 0xdf, 0xe0, 0xe1, 0xe2, 0xe3, 0xe4, 0xe5, 0xe6, 0xe7, 0xe8, 0xe9,
;627:	0xea, 0xeb, 0xec, 0xed, 0xee, 0xef, 0xf0, 0xf1, 0xf2, 0xf3, 0xf4, 0xf5, 0xf6, 0xf7, 0xf8, 0xf9, 0xfa, 0xfb, 0xfc, 0xfd, 0xfe, 0xff};
;628:
;629:int Q_isprint(int c) {
line 630
;630:	if (c >= 0x20 && c <= 0x7E)
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 32
LTI4 $291
ADDRLP4 0
INDIRI4
CNSTI4 126
GTI4 $291
line 631
;631:		return (1);
CNSTI4 1
RETI4
ADDRGP4 $290
JUMPV
LABELV $291
line 632
;632:	return (0);
CNSTI4 0
RETI4
LABELV $290
endproc Q_isprint 4 0
export Q_islower
proc Q_islower 4 0
line 635
;633:}
;634:
;635:int Q_islower(int c) {
line 636
;636:	if (c >= 'a' && c <= 'z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $294
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $294
line 637
;637:		return (1);
CNSTI4 1
RETI4
ADDRGP4 $293
JUMPV
LABELV $294
line 638
;638:	return (0);
CNSTI4 0
RETI4
LABELV $293
endproc Q_islower 4 0
export Q_isupper
proc Q_isupper 4 0
line 641
;639:}
;640:
;641:int Q_isupper(int c) {
line 642
;642:	if (c >= 'A' && c <= 'Z')
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 65
LTI4 $297
ADDRLP4 0
INDIRI4
CNSTI4 90
GTI4 $297
line 643
;643:		return (1);
CNSTI4 1
RETI4
ADDRGP4 $296
JUMPV
LABELV $297
line 644
;644:	return (0);
CNSTI4 0
RETI4
LABELV $296
endproc Q_isupper 4 0
export Q_isalpha
proc Q_isalpha 8 0
line 647
;645:}
;646:
;647:int Q_isalpha(int c) {
line 648
;648:	if ((c >= 'a' && c <= 'z') || (c >= 'A' && c <= 'Z'))
ADDRLP4 0
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $303
ADDRLP4 0
INDIRI4
CNSTI4 122
LEI4 $302
LABELV $303
ADDRLP4 4
ADDRFP4 0
INDIRI4
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $300
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $300
LABELV $302
line 649
;649:		return (1);
CNSTI4 1
RETI4
ADDRGP4 $299
JUMPV
LABELV $300
line 650
;650:	return (0);
CNSTI4 0
RETI4
LABELV $299
endproc Q_isalpha 8 0
export Q_strrchr
proc Q_strrchr 12 0
line 653
;651:}
;652:
;653:char* Q_strrchr(const char* string, int c) {
line 654
;654:	char  cc = c;
ADDRLP4 4
ADDRFP4 4
INDIRI4
CVII1 4
ASGNI1
line 656
;655:	char* s;
;656:	char* sp = (char*)0;
ADDRLP4 8
CNSTP4 0
ASGNP4
line 658
;657:
;658:	s = (char*)string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $306
JUMPV
LABELV $305
line 660
;659:
;660:	while (*s) {
line 661
;661:		if (*s == cc)
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ADDRLP4 4
INDIRI1
CVII4 1
NEI4 $308
line 662
;662:			sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $308
line 663
;663:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 664
;664:	}
LABELV $306
line 660
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $305
line 665
;665:	if (cc == 0)
ADDRLP4 4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $310
line 666
;666:		sp = s;
ADDRLP4 8
ADDRLP4 0
INDIRP4
ASGNP4
LABELV $310
line 668
;667:
;668:	return sp;
ADDRLP4 8
INDIRP4
RETP4
LABELV $304
endproc Q_strrchr 12 0
export Q_strncpyz
proc Q_strncpyz 0 12
line 678
;669:}
;670:
;671:/*
;672:=============
;673:Q_strncpyz
;674:
;675:Safe strncpy that ensures a trailing zero
;676:=============
;677:*/
;678:void Q_strncpyz(char* dest, const char* src, int destsize) {
line 679
;679:	if (!dest) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $313
line 680
;680:		Com_Error(ERR_FATAL, "Q_strncpyz: NULL dest");
CNSTI4 0
ARGI4
ADDRGP4 $315
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 681
;681:	}
LABELV $313
line 683
;682:
;683:	if (!src) {
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $316
line 684
;684:		Com_Error(ERR_FATAL, "Q_strncpyz: NULL src");
CNSTI4 0
ARGI4
ADDRGP4 $318
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 685
;685:	}
LABELV $316
line 687
;686:
;687:	if (destsize < 1) {
ADDRFP4 8
INDIRI4
CNSTI4 1
GEI4 $319
line 688
;688:		Com_Error(ERR_FATAL, "Q_strncpyz: destsize < 1");
CNSTI4 0
ARGI4
ADDRGP4 $321
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 689
;689:	}
LABELV $319
line 691
;690:
;691:	strncpy(dest, src, destsize - 1);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ARGI4
ADDRGP4 strncpy
CALLP4
pop
line 692
;692:	dest[destsize - 1] = '\0';
ADDRFP4 8
INDIRI4
CNSTI4 1
SUBI4
ADDRFP4 0
INDIRP4
ADDP4
CNSTI1 0
ASGNI1
line 693
;693:}
LABELV $312
endproc Q_strncpyz 0 12
export Q_stricmpn
proc Q_stricmpn 24 0
line 695
;694:
;695:int Q_stricmpn(const char* s1, const char* s2, int n) {
line 698
;696:	int c1, c2;
;697:
;698:	if (s1 == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $323
line 699
;699:		if (s2 == NULL)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $325
line 700
;700:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $322
JUMPV
LABELV $325
line 702
;701:		else
;702:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $322
JUMPV
LABELV $323
line 703
;703:	} else if (s2 == NULL)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $327
line 704
;704:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $322
JUMPV
LABELV $327
LABELV $329
line 706
;705:
;706:	do {
line 707
;707:		c1 = *s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 708
;708:		s1++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 709
;709:		c2 = *s2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 710
;710:		s2++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 712
;711:
;712:		if (!n--) {
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $332
line 713
;713:			return 0;  // strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $322
JUMPV
LABELV $332
line 716
;714:		}
;715:
;716:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $334
line 717
;717:			if (c1 >= 'a' && c1 <= 'z') {
ADDRLP4 0
INDIRI4
CNSTI4 97
LTI4 $336
ADDRLP4 0
INDIRI4
CNSTI4 122
GTI4 $336
line 718
;718:				c1 -= ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 719
;719:			}
LABELV $336
line 720
;720:			if (c2 >= 'a' && c2 <= 'z') {
ADDRLP4 4
INDIRI4
CNSTI4 97
LTI4 $338
ADDRLP4 4
INDIRI4
CNSTI4 122
GTI4 $338
line 721
;721:				c2 -= ('a' - 'A');
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 32
SUBI4
ASGNI4
line 722
;722:			}
LABELV $338
line 723
;723:			if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $340
line 724
;724:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $343
ADDRLP4 20
CNSTI4 -1
ASGNI4
ADDRGP4 $344
JUMPV
LABELV $343
ADDRLP4 20
CNSTI4 1
ASGNI4
LABELV $344
ADDRLP4 20
INDIRI4
RETI4
ADDRGP4 $322
JUMPV
LABELV $340
line 726
;725:			}
;726:		}
LABELV $334
line 727
;727:	} while (c1);
LABELV $330
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $329
line 729
;728:
;729:	return 0;  // strings are equal
CNSTI4 0
RETI4
LABELV $322
endproc Q_stricmpn 24 0
export Q_strncmp
proc Q_strncmp 16 0
line 732
;730:}
;731:
;732:int Q_strncmp(const char* s1, const char* s2, int n) {
LABELV $346
line 735
;733:	int c1, c2;
;734:
;735:	do {
line 736
;736:		c1 = *s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 737
;737:		s1++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 738
;738:		c2 = *s2;
ADDRLP4 4
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
ASGNI4
line 739
;739:		s2++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 741
;740:
;741:		if (!n--) {
ADDRLP4 8
ADDRFP4 8
INDIRI4
ASGNI4
ADDRFP4 8
ADDRLP4 8
INDIRI4
CNSTI4 1
SUBI4
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 0
NEI4 $349
line 742
;742:			return 0;  // strings are equal until end point
CNSTI4 0
RETI4
ADDRGP4 $345
JUMPV
LABELV $349
line 745
;743:		}
;744:
;745:		if (c1 != c2) {
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
EQI4 $351
line 746
;746:			return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRI4
ADDRLP4 4
INDIRI4
GEI4 $354
ADDRLP4 12
CNSTI4 -1
ASGNI4
ADDRGP4 $355
JUMPV
LABELV $354
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $355
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $345
JUMPV
LABELV $351
line 748
;747:		}
;748:	} while (c1);
LABELV $347
ADDRLP4 0
INDIRI4
CNSTI4 0
NEI4 $346
line 750
;749:
;750:	return 0;  // strings are equal
CNSTI4 0
RETI4
LABELV $345
endproc Q_strncmp 16 0
export Q_stricmp
proc Q_stricmp 16 0
line 753
;751:}
;752:
;753:int Q_stricmp(const char* s1, const char* s2) {
line 756
;754:	unsigned char c1, c2;
;755:
;756:	if (s1 == NULL) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $357
line 757
;757:		if (s2 == NULL)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $359
line 758
;758:			return 0;
CNSTI4 0
RETI4
ADDRGP4 $356
JUMPV
LABELV $359
line 760
;759:		else
;760:			return -1;
CNSTI4 -1
RETI4
ADDRGP4 $356
JUMPV
LABELV $357
line 761
;761:	} else if (s2 == NULL)
ADDRFP4 4
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $361
line 762
;762:		return 1;
CNSTI4 1
RETI4
ADDRGP4 $356
JUMPV
LABELV $361
LABELV $363
line 764
;763:
;764:	do {
line 765
;765:		c1 = *s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
line 766
;766:		s1++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 767
;767:		c2 = *s2;
ADDRLP4 1
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
ASGNU1
line 768
;768:		s2++;
ADDRFP4 4
ADDRFP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 770
;769:
;770:		if (c1 != c2) {
ADDRLP4 0
INDIRU1
CVUI4 1
ADDRLP4 1
INDIRU1
CVUI4 1
EQI4 $366
line 771
;771:			if (c1 <= 'Z' && c1 >= 'A')
ADDRLP4 4
ADDRLP4 0
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 90
GTI4 $368
ADDRLP4 4
INDIRI4
CNSTI4 65
LTI4 $368
line 772
;772:				c1 += ('a' - 'A');
ADDRLP4 0
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 32
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
LABELV $368
line 774
;773:
;774:			if (c2 <= 'Z' && c2 >= 'A')
ADDRLP4 8
ADDRLP4 1
INDIRU1
CVUI4 1
ASGNI4
ADDRLP4 8
INDIRI4
CNSTI4 90
GTI4 $370
ADDRLP4 8
INDIRI4
CNSTI4 65
LTI4 $370
line 775
;775:				c2 += ('a' - 'A');
ADDRLP4 1
ADDRLP4 1
INDIRU1
CVUI4 1
CNSTI4 32
ADDI4
CVIU4 4
CVUU1 4
ASGNU1
LABELV $370
line 777
;776:
;777:			if (c1 != c2)
ADDRLP4 0
INDIRU1
CVUI4 1
ADDRLP4 1
INDIRU1
CVUI4 1
EQI4 $372
line 778
;778:				return c1 < c2 ? -1 : 1;
ADDRLP4 0
INDIRU1
CVUI4 1
ADDRLP4 1
INDIRU1
CVUI4 1
GEI4 $375
ADDRLP4 12
CNSTI4 -1
ASGNI4
ADDRGP4 $376
JUMPV
LABELV $375
ADDRLP4 12
CNSTI4 1
ASGNI4
LABELV $376
ADDRLP4 12
INDIRI4
RETI4
ADDRGP4 $356
JUMPV
LABELV $372
line 779
;779:		}
LABELV $366
line 780
;780:	} while (c1 != '\0');
LABELV $364
ADDRLP4 0
INDIRU1
CVUI4 1
CNSTI4 0
NEI4 $363
line 782
;781:
;782:	return 0;
CNSTI4 0
RETI4
LABELV $356
endproc Q_stricmp 16 0
export Q_strlwr
proc Q_strlwr 12 4
line 785
;783:}
;784:
;785:char* Q_strlwr(char* s1) {
line 788
;786:	char* s;
;787:
;788:	s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $379
JUMPV
LABELV $378
line 789
;789:	while (*s) {
line 790
;790:		*s = tolower(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 tolower
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 791
;791:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 792
;792:	}
LABELV $379
line 789
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $378
line 793
;793:	return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $377
endproc Q_strlwr 12 4
export Q_strupr
proc Q_strupr 12 4
line 796
;794:}
;795:
;796:char* Q_strupr(char* s1) {
line 799
;797:	char* s;
;798:
;799:	s = s1;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $383
JUMPV
LABELV $382
line 800
;800:	while (*s) {
line 801
;801:		*s = toupper(*s);
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ARGI4
ADDRLP4 8
ADDRGP4 toupper
CALLI4
ASGNI4
ADDRLP4 0
INDIRP4
ADDRLP4 8
INDIRI4
CVII1 4
ASGNI1
line 802
;802:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 803
;803:	}
LABELV $383
line 800
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $382
line 804
;804:	return s1;
ADDRFP4 0
INDIRP4
RETP4
LABELV $381
endproc Q_strupr 12 4
export Q_strcat
proc Q_strcat 12 12
line 808
;805:}
;806:
;807:// never goes past bounds or leaves without a terminating 0
;808:void Q_strcat(char* dest, int size, const char* src) {
line 811
;809:	int l1;
;810:
;811:	l1 = strlen(dest);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 4
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 4
INDIRI4
ASGNI4
line 812
;812:	if (l1 >= size) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $386
line 813
;813:		Com_Error(ERR_FATAL, "Q_strcat: already overflowed");
CNSTI4 0
ARGI4
ADDRGP4 $388
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 814
;814:	}
LABELV $386
line 815
;815:	Q_strncpyz(dest + l1, src, size - l1);
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRI4
ADDRLP4 0
INDIRI4
SUBI4
ARGI4
ADDRGP4 Q_strncpyz
CALLV
pop
line 816
;816:}
LABELV $385
endproc Q_strcat 12 12
export Q_PrintStrlen
proc Q_PrintStrlen 12 0
line 818
;817:
;818:int Q_PrintStrlen(const char* string) {
line 822
;819:	int         len;
;820:	const char* p;
;821:
;822:	if (!string) {
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
NEU4 $390
line 823
;823:		return 0;
CNSTI4 0
RETI4
ADDRGP4 $389
JUMPV
LABELV $390
line 826
;824:	}
;825:
;826:	len = 0;
ADDRLP4 4
CNSTI4 0
ASGNI4
line 827
;827:	p   = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $393
JUMPV
LABELV $392
line 828
;828:	while (*p) {
line 829
;829:		if (Q_IsColorString(p)) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $395
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $395
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $395
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $395
line 830
;830:			p += 2;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 2
ADDP4
ASGNP4
line 831
;831:			continue;
ADDRGP4 $393
JUMPV
LABELV $395
line 833
;832:		}
;833:		p++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 834
;834:		len++;
ADDRLP4 4
ADDRLP4 4
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
line 835
;835:	}
LABELV $393
line 828
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $392
line 837
;836:
;837:	return len;
ADDRLP4 4
INDIRI4
RETI4
LABELV $389
endproc Q_PrintStrlen 12 0
export Q_CleanStr
proc Q_CleanStr 20 0
line 840
;838:}
;839:
;840:char* Q_CleanStr(char* string) {
line 845
;841:	char* d;
;842:	char* s;
;843:	int   c;
;844:
;845:	s = string;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
line 846
;846:	d = string;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $399
JUMPV
LABELV $398
line 847
;847:	while ((c = *s) != '\0') {
line 848
;848:		if (Q_IsColorString(s)) {
ADDRLP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $401
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 94
NEI4 $401
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 0
EQI4 $401
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
INDIRI1
CVII4 1
CNSTI4 94
EQI4 $401
line 849
;849:			s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 850
;850:		} else if (c >= ' ' && c <= '~') {
ADDRGP4 $402
JUMPV
LABELV $401
ADDRLP4 4
INDIRI4
CNSTI4 32
LTI4 $403
ADDRLP4 4
INDIRI4
CNSTI4 126
GTI4 $403
line 851
;851:			*d = c;
ADDRLP4 8
INDIRP4
ADDRLP4 4
INDIRI4
CVII1 4
ASGNI1
line 852
;852:			d++;
ADDRLP4 8
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 853
;853:		}
LABELV $403
LABELV $402
line 854
;854:		s++;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 855
;855:	}
LABELV $399
line 847
ADDRLP4 12
ADDRLP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
ADDRLP4 12
INDIRI4
ASGNI4
ADDRLP4 12
INDIRI4
CNSTI4 0
NEI4 $398
line 856
;856:	*d = '\0';
ADDRLP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 858
;857:
;858:	return string;
ADDRFP4 0
INDIRP4
RETP4
LABELV $397
endproc Q_CleanStr 20 0
export Com_sprintf
proc Com_sprintf 12 16
line 861
;859:}
;860:
;861:int QDECL Com_sprintf(char* dest, int size, const char* fmt, ...) {
line 865
;862:	va_list argptr;
;863:	int     len;
;864:
;865:	va_start(argptr, fmt);
ADDRLP4 4
ADDRFP4 8+4
ASGNP4
line 866
;866:	len = ED_vsprintf(dest, fmt, argptr);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 4
INDIRP4
ARGP4
ADDRLP4 8
ADDRGP4 ED_vsprintf
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8
INDIRI4
ASGNI4
line 867
;867:	va_end(argptr);
ADDRLP4 4
CNSTP4 0
ASGNP4
line 869
;868:
;869:	if (len >= size) {
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRI4
LTI4 $407
line 870
;870:		Com_Error(ERR_FATAL, "Com_sprintf: overflow of %i in %i\n", len, size);
CNSTI4 0
ARGI4
ADDRGP4 $409
ARGP4
ADDRLP4 0
INDIRI4
ARGI4
ADDRFP4 4
INDIRI4
ARGI4
ADDRGP4 Com_Error
CALLV
pop
line 871
;871:	}
LABELV $407
line 873
;872:
;873:	return len;
ADDRLP4 0
INDIRI4
RETI4
LABELV $405
endproc Com_sprintf 12 16
bss
align 1
LABELV $411
skip 64000
data
align 4
LABELV $412
byte 4 0
export va
code
proc va 12 12
line 885
;874:}
;875:
;876:/*
;877:============
;878:va
;879:
;880:does a varargs printf into a temp buffer, so I don't need to have
;881:varargs versions of all text functions.
;882:FIXME: make this buffer size safe someday
;883:============
;884:*/
;885:char* QDECL va(const char* format, ...) {
line 891
;886:	va_list     argptr;
;887:	static char string[2][32000];  // in case va is called by nested functions
;888:	static int  index = 0;
;889:	char*       buf;
;890:
;891:	buf = string[index];
ADDRLP4 4
ADDRGP4 $412
INDIRI4
CNSTI4 32000
MULI4
ADDRGP4 $411
ADDP4
ASGNP4
line 892
;892:	index ^= 1;
ADDRLP4 8
ADDRGP4 $412
ASGNP4
ADDRLP4 8
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 894
;893:
;894:	va_start(argptr, format);
ADDRLP4 0
ADDRFP4 0+4
ASGNP4
line 895
;895:	ED_vsprintf(buf, format, argptr);
ADDRLP4 4
INDIRP4
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
line 896
;896:	va_end(argptr);
ADDRLP4 0
CNSTP4 0
ASGNP4
line 898
;897:
;898:	return buf;
ADDRLP4 4
INDIRP4
RETP4
LABELV $410
endproc va 12 12
proc Q_strkey 12 0
line 909
;899:}
;900:
;901:/*
;902:=====================================================================
;903:
;904:  INFO STRINGS
;905:
;906:=====================================================================
;907:*/
;908:
;909:static qboolean Q_strkey(const char* str, const char* key, int key_len) {
line 912
;910:	int i;
;911:
;912:	for (i = 0; i < key_len; i++) {
ADDRLP4 0
CNSTI4 0
ASGNI4
ADDRGP4 $418
JUMPV
LABELV $415
line 913
;913:		if (locase[(byte)str[i]] != locase[(byte)key[i]]) {
ADDRLP4 8
ADDRGP4 locase
ASGNP4
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
CVUI4 1
ADDRLP4 8
INDIRP4
ADDP4
INDIRU1
CVUI4 1
ADDRLP4 0
INDIRI4
ADDRFP4 4
INDIRP4
ADDP4
INDIRI1
CVII4 1
CVIU4 4
CVUU1 4
CVUI4 1
ADDRLP4 8
INDIRP4
ADDP4
INDIRU1
CVUI4 1
EQI4 $419
line 914
;914:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $414
JUMPV
LABELV $419
line 916
;915:		}
;916:	}
LABELV $416
line 912
ADDRLP4 0
ADDRLP4 0
INDIRI4
CNSTI4 1
ADDI4
ASGNI4
LABELV $418
ADDRLP4 0
INDIRI4
ADDRFP4 8
INDIRI4
LTI4 $415
line 918
;917:
;918:	return qtrue;
CNSTI4 1
RETI4
LABELV $414
endproc Q_strkey 12 0
bss
align 1
LABELV $422
skip 16384
data
align 4
LABELV $423
byte 4 0
export Info_ValueForKey
code
proc Info_ValueForKey 52 12
line 929
;919:}
;920:
;921:/*
;922:===============
;923:Info_ValueForKey
;924:
;925:Searches the string for the given
;926:key and returns the associated value, or an empty string.
;927:===============
;928:*/
;929:char* Info_ValueForKey(const char* s, const char* key) {
line 937
;930:	static char value[2][BIG_INFO_VALUE];  // use two buffers so compares
;931:	                                       // work without stomping on each other
;932:	static int  valueindex = 0;
;933:	const char *v, *pkey;
;934:	char *      o, *o2;
;935:	int         klen, len;
;936:
;937:	if (!s || !key || !*key)
ADDRFP4 0
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $427
ADDRLP4 24
ADDRFP4 4
INDIRP4
ASGNP4
ADDRLP4 24
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $427
ADDRLP4 24
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $424
LABELV $427
line 938
;938:		return "";
ADDRGP4 $428
RETP4
ADDRGP4 $421
JUMPV
LABELV $424
line 940
;939:
;940:	klen = (int)strlen(key);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 28
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 12
ADDRLP4 28
INDIRI4
ASGNI4
line 942
;941:
;942:	if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $432
line 943
;943:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $432
JUMPV
LABELV $431
line 945
;944:
;945:	while (1) {
line 946
;946:		pkey = s;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $435
JUMPV
LABELV $434
line 947
;947:		while (*s != '\\') {
line 948
;948:			if (*s == '\0')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $437
line 949
;949:				return "";
ADDRGP4 $428
RETP4
ADDRGP4 $421
JUMPV
LABELV $437
line 950
;950:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 951
;951:		}
LABELV $435
line 947
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $434
line 952
;952:		len = (int)(s - pkey);
ADDRLP4 16
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 953
;953:		s++;  // skip '\\'
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 955
;954:
;955:		v = s;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $440
JUMPV
LABELV $439
line 957
;956:		while (*s != '\\' && *s != '\0')
;957:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $440
line 956
ADDRLP4 32
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 32
INDIRI4
CNSTI4 92
EQI4 $442
ADDRLP4 32
INDIRI4
CNSTI4 0
NEI4 $439
LABELV $442
line 959
;958:
;959:		if (len == klen && Q_strkey(pkey, key, klen)) {
ADDRLP4 16
INDIRI4
ADDRLP4 12
INDIRI4
NEI4 $443
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 12
INDIRI4
ARGI4
ADDRLP4 40
ADDRGP4 Q_strkey
CALLI4
ASGNI4
ADDRLP4 40
INDIRI4
CNSTI4 0
EQI4 $443
line 960
;960:			o = o2 = value[valueindex];
ADDRLP4 44
ADDRGP4 $423
INDIRI4
CNSTI4 13
LSHI4
ADDRGP4 $422
ADDP4
ASGNP4
ADDRLP4 20
ADDRLP4 44
INDIRP4
ASGNP4
ADDRLP4 4
ADDRLP4 44
INDIRP4
ASGNP4
line 961
;961:			valueindex ^= 1;
ADDRLP4 48
ADDRGP4 $423
ASGNP4
ADDRLP4 48
INDIRP4
ADDRLP4 48
INDIRP4
INDIRI4
CNSTI4 1
BXORI4
ASGNI4
line 962
;962:			if ((int)(s - v) >= BIG_INFO_STRING) {
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
CNSTI4 8192
LTI4 $449
line 963
;963:				Com_Error(ERR_DROP, "Info_ValueForKey: oversize infostring value");
CNSTI4 1
ARGI4
ADDRGP4 $447
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 964
;964:			} else {
ADDRGP4 $446
JUMPV
LABELV $448
line 965
;965:				while (v < s) {
line 966
;966:					*o = *v;
ADDRLP4 4
INDIRP4
ADDRLP4 0
INDIRP4
INDIRI1
ASGNI1
line 967
;967:					++o;
ADDRLP4 4
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 968
;968:					++v;
ADDRLP4 0
ADDRLP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 969
;969:				}
LABELV $449
line 965
ADDRLP4 0
INDIRP4
CVPU4 4
ADDRFP4 0
INDIRP4
CVPU4 4
LTU4 $448
line 970
;970:			}
LABELV $446
line 971
;971:			*o = '\0';
ADDRLP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 972
;972:			return o2;
ADDRLP4 20
INDIRP4
RETP4
ADDRGP4 $421
JUMPV
LABELV $443
line 975
;973:		}
;974:
;975:		if (*s == '\0')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $451
line 976
;976:			break;
ADDRGP4 $433
JUMPV
LABELV $451
line 978
;977:
;978:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 979
;979:	}
LABELV $432
line 945
ADDRGP4 $431
JUMPV
LABELV $433
line 981
;980:
;981:	return "";
ADDRGP4 $428
RETP4
LABELV $421
endproc Info_ValueForKey 52 12
export Info_NextPair
proc Info_NextPair 12 0
line 991
;982:}
;983:
;984:/*
;985:===================
;986:Info_NextPair
;987:
;988:Used to itterate through all the key/value pairs in an info string
;989:===================
;990:*/
;991:const char* Info_NextPair(const char* s, char* key, char* value) {
line 994
;992:	char* o;
;993:
;994:	if (*s == '\\') {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $454
line 995
;995:		s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 996
;996:	}
LABELV $454
line 998
;997:
;998:	key[0]   = '\0';
ADDRFP4 4
INDIRP4
CNSTI1 0
ASGNI1
line 999
;999:	value[0] = '\0';
ADDRFP4 8
INDIRP4
CNSTI1 0
ASGNI1
line 1001
;1000:
;1001:	o = key;
ADDRLP4 0
ADDRFP4 4
INDIRP4
ASGNP4
ADDRGP4 $457
JUMPV
LABELV $456
line 1002
;1002:	while (*s != '\\') {
line 1003
;1003:		if (*s == '\0') {
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $459
line 1004
;1004:			*o = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1005
;1005:			return s;
ADDRFP4 0
INDIRP4
RETP4
ADDRGP4 $453
JUMPV
LABELV $459
line 1007
;1006:		}
;1007:		*o++ = *s++;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI1
ASGNI1
line 1008
;1008:	}
LABELV $457
line 1002
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $456
line 1009
;1009:	*o = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1010
;1010:	s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1012
;1011:
;1012:	o = value;
ADDRLP4 0
ADDRFP4 8
INDIRP4
ASGNP4
ADDRGP4 $462
JUMPV
LABELV $461
line 1013
;1013:	while (*s != '\\' && *s != '\0') {
line 1014
;1014:		*o++ = *s++;
ADDRLP4 4
ADDRLP4 0
INDIRP4
ASGNP4
ADDRLP4 0
ADDRLP4 4
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
ADDRFP4 0
ADDRLP4 8
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRLP4 4
INDIRP4
ADDRLP4 8
INDIRP4
INDIRI1
ASGNI1
line 1015
;1015:	}
LABELV $462
line 1013
ADDRLP4 4
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 4
INDIRI4
CNSTI4 92
EQI4 $464
ADDRLP4 4
INDIRI4
CNSTI4 0
NEI4 $461
LABELV $464
line 1016
;1016:	*o = '\0';
ADDRLP4 0
INDIRP4
CNSTI1 0
ASGNI1
line 1018
;1017:
;1018:	return s;
ADDRFP4 0
INDIRP4
RETP4
LABELV $453
endproc Info_NextPair 12 0
proc Info_RemoveKey 36 12
line 1026
;1019:}
;1020:
;1021:/*
;1022:===================
;1023:Info_RemoveKey
;1024:===================
;1025:*/
;1026:static int Info_RemoveKey(char* s, const char* key) {
line 1031
;1027:	char* start;
;1028:	char* pkey;
;1029:	int   key_len, len;
;1030:
;1031:	key_len = (int)strlen(key);
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 16
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 4
ADDRLP4 16
INDIRI4
ASGNI4
ADDRGP4 $467
JUMPV
LABELV $466
line 1033
;1032:
;1033:	while (1) {
line 1034
;1034:		start = s;
ADDRLP4 8
ADDRFP4 0
INDIRP4
ASGNP4
line 1035
;1035:		if (*s == '\\')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $469
line 1036
;1036:			s++;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $469
line 1037
;1037:		pkey = s;
ADDRLP4 0
ADDRFP4 0
INDIRP4
ASGNP4
ADDRGP4 $472
JUMPV
LABELV $471
line 1038
;1038:		while (*s != '\\') {
line 1039
;1039:			if (*s == '\0')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $474
line 1040
;1040:				return 0;
CNSTI4 0
RETI4
ADDRGP4 $465
JUMPV
LABELV $474
line 1041
;1041:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1042
;1042:		}
LABELV $472
line 1038
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 92
NEI4 $471
line 1044
;1043:
;1044:		len = (int)(s - pkey);
ADDRLP4 12
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 0
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
ASGNI4
line 1045
;1045:		++s;  // skip '\\'
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
ADDRGP4 $477
JUMPV
LABELV $476
line 1048
;1046:
;1047:		while (*s != '\\' && *s != '\0')
;1048:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
LABELV $477
line 1047
ADDRLP4 20
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 20
INDIRI4
CNSTI4 92
EQI4 $479
ADDRLP4 20
INDIRI4
CNSTI4 0
NEI4 $476
LABELV $479
line 1050
;1049:
;1050:		if (len == key_len && Q_strkey(pkey, key, key_len)) {
ADDRLP4 12
INDIRI4
ADDRLP4 4
INDIRI4
NEI4 $480
ADDRLP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 4
INDIRI4
ARGI4
ADDRLP4 28
ADDRGP4 Q_strkey
CALLI4
ASGNI4
ADDRLP4 28
INDIRI4
CNSTI4 0
EQI4 $480
line 1051
;1051:			memmove(start, s, strlen(s) + 1);  // remove this part
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 8
INDIRP4
ARGP4
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 32
INDIRI4
CNSTI4 1
ADDI4
ARGI4
ADDRGP4 memmove
CALLP4
pop
line 1052
;1052:			return (int)(s - start);
ADDRFP4 0
INDIRP4
CVPU4 4
ADDRLP4 8
INDIRP4
CVPU4 4
SUBU4
CVUI4 4
RETI4
ADDRGP4 $465
JUMPV
LABELV $480
line 1055
;1053:		}
;1054:
;1055:		if (*s == '\0')
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $482
line 1056
;1056:			break;
ADDRGP4 $468
JUMPV
LABELV $482
line 1057
;1057:	}
LABELV $467
line 1033
ADDRGP4 $466
JUMPV
LABELV $468
line 1059
;1058:
;1059:	return 0;
CNSTI4 0
RETI4
LABELV $465
endproc Info_RemoveKey 36 12
export Info_Validate
proc Info_Validate 8 0
line 1070
;1060:}
;1061:
;1062:/*
;1063:==================
;1064:Info_ValidateKeyValue
;1065:
;1066:Some characters are illegal in info strings because they
;1067:can mess up the server's parsing
;1068:==================
;1069:*/
;1070:qboolean Info_Validate(const char* s) {
line 1071
;1071:	for (;;) {
LABELV $485
line 1072
;1072:		switch (*s) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 34
EQI4 $493
ADDRLP4 0
INDIRI4
CNSTI4 34
GTI4 $495
LABELV $494
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $492
ADDRGP4 $489
JUMPV
LABELV $495
ADDRLP4 0
INDIRI4
CNSTI4 59
EQI4 $493
ADDRGP4 $489
JUMPV
LABELV $492
line 1074
;1073:		case '\0':
;1074:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $484
JUMPV
LABELV $493
line 1077
;1075:		case '\"':
;1076:		case ';':
;1077:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $484
JUMPV
LABELV $489
line 1079
;1078:		default:
;1079:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1080
;1080:			continue;
line 1071
ADDRGP4 $485
JUMPV
LABELV $484
endproc Info_Validate 8 0
export Info_ValidateKeyValue
proc Info_ValidateKeyValue 12 0
line 1090
;1081:		}
;1082:	}
;1083:}
;1084:
;1085:/*
;1086:==================
;1087:Info_ValidateKeyValue
;1088:==================
;1089:*/
;1090:qboolean Info_ValidateKeyValue(const char* s) {
line 1091
;1091:	for (;;) {
LABELV $497
line 1092
;1092:		switch (*s) {
ADDRLP4 0
ADDRFP4 0
INDIRP4
INDIRI1
CVII4 1
ASGNI4
ADDRLP4 0
INDIRI4
CNSTI4 34
EQI4 $505
ADDRLP4 0
INDIRI4
CNSTI4 34
GTI4 $507
LABELV $506
ADDRLP4 0
INDIRI4
CNSTI4 0
EQI4 $504
ADDRGP4 $501
JUMPV
LABELV $507
ADDRLP4 0
INDIRI4
CNSTI4 59
EQI4 $505
ADDRLP4 0
INDIRI4
CNSTI4 59
LTI4 $501
LABELV $508
ADDRLP4 0
INDIRI4
CNSTI4 92
EQI4 $505
ADDRGP4 $501
JUMPV
LABELV $504
line 1094
;1093:		case '\0':
;1094:			return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $496
JUMPV
LABELV $505
line 1098
;1095:		case '\\':
;1096:		case '\"':
;1097:		case ';':
;1098:			return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $496
JUMPV
LABELV $501
line 1100
;1099:		default:
;1100:			++s;
ADDRFP4 0
ADDRFP4 0
INDIRP4
CNSTI4 1
ADDP4
ASGNP4
line 1101
;1101:			continue;
line 1091
ADDRGP4 $497
JUMPV
LABELV $496
endproc Info_ValidateKeyValue 12 0
export Info_SetValueForKey
proc Info_SetValueForKey 1060 20
line 1113
;1102:		}
;1103:	}
;1104:}
;1105:
;1106:/*
;1107:==================
;1108:Info_SetValueForKey
;1109:
;1110:Changes or adds a key/value pair
;1111:==================
;1112:*/
;1113:qboolean Info_SetValueForKey(char* s, const char* key, const char* value) {
line 1117
;1114:	char newi[MAX_INFO_STRING + 2];
;1115:	int  len1, len2;
;1116:
;1117:	len1 = (int)strlen(s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 1036
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 1036
INDIRI4
ASGNI4
line 1118
;1118:	if (len1 >= MAX_INFO_STRING) {
ADDRLP4 0
INDIRI4
CNSTI4 1024
LTI4 $510
line 1119
;1119:		Com_Error(ERR_DROP, "Info_SetValueForKey: oversize infostring");
CNSTI4 1
ARGI4
ADDRGP4 $512
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1120
;1120:	}
LABELV $510
line 1122
;1121:
;1122:	if (!Info_ValidateKeyValue(key) || *key == '\0') {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1040
ADDRGP4 Info_ValidateKeyValue
CALLI4
ASGNI4
ADDRLP4 1040
INDIRI4
CNSTI4 0
EQI4 $515
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $513
LABELV $515
line 1123
;1123:		Com_Printf(S_COLOR_YELLOW "Invalid key name: '%s'\n", key);
ADDRGP4 $516
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1124
;1124:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $509
JUMPV
LABELV $513
line 1127
;1125:	}
;1126:
;1127:	if (!Info_ValidateKeyValue(value)) {
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1044
ADDRGP4 Info_ValidateKeyValue
CALLI4
ASGNI4
ADDRLP4 1044
INDIRI4
CNSTI4 0
NEI4 $517
line 1128
;1128:		Com_Printf(S_COLOR_YELLOW "Invalid value name: '%s'\n", value);
ADDRGP4 $519
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1129
;1129:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $509
JUMPV
LABELV $517
line 1132
;1130:	}
;1131:
;1132:	len1 -= Info_RemoveKey(s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 1048
ADDRGP4 Info_RemoveKey
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 1048
INDIRI4
SUBI4
ASGNI4
line 1133
;1133:	if (!value || !*value)
ADDRLP4 1052
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 1052
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $522
ADDRLP4 1052
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $520
LABELV $522
line 1134
;1134:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $509
JUMPV
LABELV $520
line 1136
;1135:
;1136:	len2 = Com_sprintf(newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 4
ARGP4
CNSTI4 1026
ARGI4
ADDRGP4 $523
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 1056
ADDRGP4 Com_sprintf
CALLI4
ASGNI4
ADDRLP4 1032
ADDRLP4 1056
INDIRI4
ASGNI4
line 1138
;1137:
;1138:	if (len1 + len2 >= MAX_INFO_STRING) {
ADDRLP4 0
INDIRI4
ADDRLP4 1032
INDIRI4
ADDI4
CNSTI4 1024
LTI4 $524
line 1139
;1139:		Com_Printf(S_COLOR_YELLOW "Info string length exceeded\n");
ADDRGP4 $526
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1140
;1140:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $509
JUMPV
LABELV $524
line 1143
;1141:	}
;1142:
;1143:	strcpy(s + len1, newi);
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1144
;1144:	return qtrue;
CNSTI4 1
RETI4
LABELV $509
endproc Info_SetValueForKey 1060 20
export Info_SetValueForKey_Big
proc Info_SetValueForKey_Big 8228 20
line 1154
;1145:}
;1146:
;1147:/*
;1148:==================
;1149:Info_SetValueForKey_Big
;1150:
;1151:Changes or adds a key/value pair
;1152:==================
;1153:*/
;1154:qboolean Info_SetValueForKey_Big(char* s, const char* key, const char* value) {
line 1158
;1155:	char newi[BIG_INFO_STRING + 2];
;1156:	int  len1, len2;
;1157:
;1158:	len1 = (int)strlen(s);
ADDRFP4 0
INDIRP4
ARGP4
ADDRLP4 8204
ADDRGP4 strlen
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 8204
INDIRI4
ASGNI4
line 1159
;1159:	if (len1 >= BIG_INFO_STRING) {
ADDRLP4 0
INDIRI4
CNSTI4 8192
LTI4 $528
line 1160
;1160:		Com_Error(ERR_DROP, "Info_SetValueForKey: oversize infostring");
CNSTI4 1
ARGI4
ADDRGP4 $512
ARGP4
ADDRGP4 Com_Error
CALLV
pop
line 1161
;1161:	}
LABELV $528
line 1163
;1162:
;1163:	if (!Info_ValidateKeyValue(key) || *key == '\0') {
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8208
ADDRGP4 Info_ValidateKeyValue
CALLI4
ASGNI4
ADDRLP4 8208
INDIRI4
CNSTI4 0
EQI4 $532
ADDRFP4 4
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $530
LABELV $532
line 1164
;1164:		Com_Printf(S_COLOR_YELLOW "Invalid key name: '%s'\n", key);
ADDRGP4 $516
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1165
;1165:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $527
JUMPV
LABELV $530
line 1168
;1166:	}
;1167:
;1168:	if (!Info_ValidateKeyValue(value)) {
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8212
ADDRGP4 Info_ValidateKeyValue
CALLI4
ASGNI4
ADDRLP4 8212
INDIRI4
CNSTI4 0
NEI4 $533
line 1169
;1169:		Com_Printf(S_COLOR_YELLOW "Invalid value name: '%s'\n", value);
ADDRGP4 $519
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1170
;1170:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $527
JUMPV
LABELV $533
line 1173
;1171:	}
;1172:
;1173:	len1 -= Info_RemoveKey(s, key);
ADDRFP4 0
INDIRP4
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRLP4 8216
ADDRGP4 Info_RemoveKey
CALLI4
ASGNI4
ADDRLP4 0
ADDRLP4 0
INDIRI4
ADDRLP4 8216
INDIRI4
SUBI4
ASGNI4
line 1174
;1174:	if (!value || !*value)
ADDRLP4 8220
ADDRFP4 8
INDIRP4
ASGNP4
ADDRLP4 8220
INDIRP4
CVPU4 4
CNSTU4 0
EQU4 $537
ADDRLP4 8220
INDIRP4
INDIRI1
CVII4 1
CNSTI4 0
NEI4 $535
LABELV $537
line 1175
;1175:		return qtrue;
CNSTI4 1
RETI4
ADDRGP4 $527
JUMPV
LABELV $535
line 1177
;1176:
;1177:	len2 = Com_sprintf(newi, sizeof(newi), "\\%s\\%s", key, value);
ADDRLP4 4
ARGP4
CNSTI4 8194
ARGI4
ADDRGP4 $523
ARGP4
ADDRFP4 4
INDIRP4
ARGP4
ADDRFP4 8
INDIRP4
ARGP4
ADDRLP4 8224
ADDRGP4 Com_sprintf
CALLI4
ASGNI4
ADDRLP4 8200
ADDRLP4 8224
INDIRI4
ASGNI4
line 1179
;1178:
;1179:	if (len1 + len2 >= BIG_INFO_STRING) {
ADDRLP4 0
INDIRI4
ADDRLP4 8200
INDIRI4
ADDI4
CNSTI4 8192
LTI4 $538
line 1180
;1180:		Com_Printf(S_COLOR_YELLOW "BIG Info string length exceeded\n");
ADDRGP4 $540
ARGP4
ADDRGP4 Com_Printf
CALLV
pop
line 1181
;1181:		return qfalse;
CNSTI4 0
RETI4
ADDRGP4 $527
JUMPV
LABELV $538
line 1184
;1182:	}
;1183:
;1184:	strcpy(s + len1, newi);
ADDRLP4 0
INDIRI4
ADDRFP4 0
INDIRP4
ADDP4
ARGP4
ADDRLP4 4
ARGP4
ADDRGP4 strcpy
CALLP4
pop
line 1185
;1185:	return qtrue;
CNSTI4 1
RETI4
LABELV $527
endproc Info_SetValueForKey_Big 8228 20
bss
align 4
LABELV is_separator
skip 1024
align 4
LABELV com_tokenline
skip 4
align 4
LABELV com_lines
skip 4
align 1
LABELV com_parsename
skip 1024
align 1
LABELV com_token
skip 1024
import Com_Printf
import Com_Error
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
LABELV $540
byte 1 94
byte 1 51
byte 1 66
byte 1 73
byte 1 71
byte 1 32
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $526
byte 1 94
byte 1 51
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 32
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 108
byte 1 101
byte 1 110
byte 1 103
byte 1 116
byte 1 104
byte 1 32
byte 1 101
byte 1 120
byte 1 99
byte 1 101
byte 1 101
byte 1 100
byte 1 101
byte 1 100
byte 1 10
byte 1 0
align 1
LABELV $523
byte 1 92
byte 1 37
byte 1 115
byte 1 92
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $519
byte 1 94
byte 1 51
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $516
byte 1 94
byte 1 51
byte 1 73
byte 1 110
byte 1 118
byte 1 97
byte 1 108
byte 1 105
byte 1 100
byte 1 32
byte 1 107
byte 1 101
byte 1 121
byte 1 32
byte 1 110
byte 1 97
byte 1 109
byte 1 101
byte 1 58
byte 1 32
byte 1 39
byte 1 37
byte 1 115
byte 1 39
byte 1 10
byte 1 0
align 1
LABELV $512
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 83
byte 1 101
byte 1 116
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 0
align 1
LABELV $447
byte 1 73
byte 1 110
byte 1 102
byte 1 111
byte 1 95
byte 1 86
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 70
byte 1 111
byte 1 114
byte 1 75
byte 1 101
byte 1 121
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 105
byte 1 110
byte 1 102
byte 1 111
byte 1 115
byte 1 116
byte 1 114
byte 1 105
byte 1 110
byte 1 103
byte 1 32
byte 1 118
byte 1 97
byte 1 108
byte 1 117
byte 1 101
byte 1 0
align 1
LABELV $428
byte 1 0
align 1
LABELV $409
byte 1 67
byte 1 111
byte 1 109
byte 1 95
byte 1 115
byte 1 112
byte 1 114
byte 1 105
byte 1 110
byte 1 116
byte 1 102
byte 1 58
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 32
byte 1 111
byte 1 102
byte 1 32
byte 1 37
byte 1 105
byte 1 32
byte 1 105
byte 1 110
byte 1 32
byte 1 37
byte 1 105
byte 1 10
byte 1 0
align 1
LABELV $388
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 99
byte 1 97
byte 1 116
byte 1 58
byte 1 32
byte 1 97
byte 1 108
byte 1 114
byte 1 101
byte 1 97
byte 1 100
byte 1 121
byte 1 32
byte 1 111
byte 1 118
byte 1 101
byte 1 114
byte 1 102
byte 1 108
byte 1 111
byte 1 119
byte 1 101
byte 1 100
byte 1 0
align 1
LABELV $321
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 115
byte 1 105
byte 1 122
byte 1 101
byte 1 32
byte 1 60
byte 1 32
byte 1 49
byte 1 0
align 1
LABELV $318
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 115
byte 1 114
byte 1 99
byte 1 0
align 1
LABELV $315
byte 1 81
byte 1 95
byte 1 115
byte 1 116
byte 1 114
byte 1 110
byte 1 99
byte 1 112
byte 1 121
byte 1 122
byte 1 58
byte 1 32
byte 1 78
byte 1 85
byte 1 76
byte 1 76
byte 1 32
byte 1 100
byte 1 101
byte 1 115
byte 1 116
byte 1 0
align 1
LABELV $279
byte 1 41
byte 1 0
align 1
LABELV $274
byte 1 40
byte 1 0
align 1
LABELV $158
byte 1 77
byte 1 97
byte 1 116
byte 1 99
byte 1 104
byte 1 84
byte 1 111
byte 1 107
byte 1 101
byte 1 110
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 32
byte 1 33
byte 1 61
byte 1 32
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $62
byte 1 87
byte 1 65
byte 1 82
byte 1 78
byte 1 73
byte 1 78
byte 1 71
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $58
byte 1 69
byte 1 82
byte 1 82
byte 1 79
byte 1 82
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 44
byte 1 32
byte 1 108
byte 1 105
byte 1 110
byte 1 101
byte 1 32
byte 1 37
byte 1 100
byte 1 58
byte 1 32
byte 1 37
byte 1 115
byte 1 10
byte 1 0
align 1
LABELV $50
byte 1 37
byte 1 115
byte 1 0
align 1
LABELV $48
byte 1 37
byte 1 115
byte 1 37
byte 1 115
byte 1 0
