# Deprecated build files
This folder contains buildsystem files that are no longer supported.  

## QVM
This project doesn't support building as qvm.  
Reasons for this are:  
- LCC feature set is very outdated, compared to GCC, MSVC or CLANG. And later versions are not backwars compatible.
- The QVM architecture doesn't support the usage of C standard library. This renders every helpful library out there immediately unusable in mod-code.
- Basic math functions, and other common-usage modern C functionality, requires porting and maintaining custom code inside `bg_lib.c`.

The files are kept here for archival reasons.  
To use them, do `mv win32-qvm ../win32-qvm`, and follow its instructions.
The project contains code that's incompatible with qvm compilation _(e.g: acos() call inside CPM aircontrol function)_. You will need to troubleshoot those, with the help of the compiler's output feedback.
