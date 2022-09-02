# Linux
## Simple:
```bash
# Change folder to the build/linux directory  
cd REPO/build/linux
# Execute the build command
make
```

## Advanced:
The project uses quake3e/baseq3e standard Makefile functionality.  
It builds a `release` version when not specified.  
Other options are:  
```bash
# Current system
make debug     # Builds only the debug version for the current system
make release   # Builds only the release version for the current system
make all       # Builds all possible build targets for the current system
make clean     # Cleans all build files
make clean X   # Cleans build files only for the selected X folders
```
### Cross compiling:
```bash
# Builds selected `v` version for the selected platform `p`
make v COMPILE_PLATFORM=p
# Example:  Build release version for win64
make release COMPILE_PLATFORM=mingw64
```
See the Makefile for other supported platforms.

### Custom Build Configuration
It is possible to have a different local-only configuration, than the defaults from the Makefile.  
To do so, create a new file named `Makefile.local` in the same directory as the Makefile, and define your parameters there.  
This allows changing configuration locally, without causing problems when updating the repository.

### Automated packing for distribution
The `build.py` script is created to automate the distribution process.  
The goal of the script is to output a zip file that's ready to publish to the users.  
The resulting file contains:  
- The correct folder structure for the mod  
- All assets and config files needed  
- A zipped copy of the latest source code  

It uses system-agnostic procedures, but currently depends on the file `build/linux/Makefile`.  
This means that the script will work in any system that can run the mentioned Makefile (mingw, cygwin, linux, etc)

```bash
# Usage:
build.py -p   # Builds release for all platforms and Packs all files into the releases folder for distribution
build.py      # Defaults to -b

build.py -b   # Builds with default options for current system only. Same as `make`
build.py -d   # Builds debug version for current system only. Same as `make debug`
build.py -r   # Builds release version for current system only. Same as `make release`
build.py -dr  # Options can be combined, and they will be executed one after the other: `make debug; make release`
```
It can be run from any current working directory, and it will behave in the same way.  
The functions change directories where they need to.  


# Windows
```ps
# TODO
see folder REPO/build/win32-msvc*
```
