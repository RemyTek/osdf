#!/usr/bin/python
import sys; sys.dont_write_bytecode = True;
#.....................................
from helper import *
#.....................................
if not __name__=="__main__": err(f"File {__file__} is not meant to be used as a module")
#.....................................
def thisFile(type='abspath'): 
  from os.path import abspath, basename, dirname
  from inspect import getsourcefile
  src = str(getsourcefile(lambda:0))
  match type:
    case 'abs'  | 'abspath': return abspath(src)
    case 'name' | 'base' | 'basename': return basename(src)
    case 'dir'  | 'folder': return dirname(src)
    case _: err(f"Incorrect type keyword in function {__file__}.thisFile(): {type}")
def thisDir(): return thisFile("dir")
#.....................................

#.....................................
# Configuration
#...............
# Mod
modVers  = "0.2.5b"
modName  = "osdf"
fullName = "opensource-defrag"

#.....................................
# Folders
from os.path import join
rootDir = join(thisDir(), "..", "..")
binDir  = join(thisDir(), "build")
cfgDir  = join(rootDir, "cfg")
srcDir  = join(rootDir, "code")
astDir  = join(rootDir, "assets")
b3aDir  = join(astDir, "b3a")
cgDir   = join(astDir, "cgame")
gDir    = join(astDir, "game")
uiDir   = join(astDir, "q3ui")
rlsDir  = join(binDir, "releases", modVers)
rlsBase = join(rlsDir, modName)
winDir  = join(binDir, "release-mingw64-x86_64", modName)  # TODO generate based on keywords
lnxDir  = join(binDir, "release-linux-x86_64", modName)    # TODO generate based on keywords

#.....................................
# Files
#.............
# Config files
dscFile  = join(cfgDir, "description.txt")
cfgFiles = glob(cfgDir, "*.cfg")
# Assets:
pk3Files = glob(astDir, "*.pk3")  # Every pk3 file in the root asset folder
# Binaries and Code
winFiles = glob(winDir, "*.dll")
lnxFiles = glob(lnxDir, "*.so")
srcFiles = glob(srcDir, "*")
srcZip   = join(rlsBase, "sourceCode.zip")
# Final zip
rlsZip   = join(rlsDir, f"{fullName}-{modVers}.zip")

#.....................................
# CLI options
#.............
addOpts("bpdrv")
build   = getOpt("b")  # Builds with default options for current system only
debug   = getOpt("d")  # Builds debug version for current system only
release = getOpt("r")  # Builds release version for current system only
pack    = getOpt("p")  # Builds release for all platforms and Packs all files into the releases folder for distribution
verbose = getOpt('v')  # Makes the output of building completely verbose
noOpts = not pack and not build and not debug and not release
if noOpts: build = True  # Override to `b` when no options are given
distribute = pack        # Builds release for all platforms when packing

#.....................................
# Building
#...........
from multiprocessing import cpu_count
coresPc = 0.8
cores   = int(cpu_count()*coresPc)
makeCmd = f"make -j{cores} V={1 if verbose else 0}"
#.....................................
if build:                 bash(f"{makeCmd}", dir=thisDir())
if debug:                 bash(f"{makeCmd} debug", dir=thisDir())
if release or distribute: bash(f"{makeCmd} release", dir=thisDir())
if distribute:            bash(f"{makeCmd} release PLATFORM=mingw64", dir=thisDir())

#.....................................
# Packing
#...........
if pack:   # if -p
  # Create folders if they don't exist
  md(rlsDir)
  md(rlsBase)
  # Copy .cfg and description.txt files
  cp(dscFile, rlsBase)
  for file in cfgFiles: cp(file, rlsBase)
  # Copy library files
  for file in winFiles: cp(file, rlsBase)
  for file in lnxFiles: cp(file, rlsBase)
  # Assets: 
  for file in pk3Files: cp(file, rlsBase)  # Copy all pk3 asset files at root assets folder
  Pk3CreateAll(astDir, rlsBase, prefix=f"y.{modName}.")  # Pack all asset/ subfolders as separate pk3 files
  # Zip and Copy source code
  ZipDir(srcDir, srcZip)
  # Pack everything
  Zip(glob(rlsBase, "*"), rlsZip, rlsDir)

