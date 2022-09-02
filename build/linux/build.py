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
modVers  = "0.2.5"
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
rlsDir  = join(binDir, "releases", modVers)
rlsBase = join(rlsDir, modName)
winDir  = join(binDir, "release-mingw64-x86_64", modName)  # TODO generate based on keywords
lnxDir  = join(binDir, "release-linux-x86_64", modName)    # TODO generate based on keywords

#.....................................
# Files
dscFile  = join(cfgDir, "description.txt")
cfgFiles = glob(cfgDir, "*.cfg")
pk3Files = glob(astDir, "*.pk3")  # Every pk3 file in the asset folder
astFiles = [f for f in glob(astDir, "*") if ".pk3" not in f.name]  # Everything thats not a pk3 in the asset folder
astPk3   = join(rlsBase, f"y.{modName}-b3a.pk3")  # Resulting pk3 file after compressing all asset files
winFiles = glob(winDir, "*.dll")
lnxFiles = glob(lnxDir, "*.so")
srcFiles = glob(srcDir, "*")
srcZip   = join(rlsBase, "sourceCode.zip")
rlsZip   = join(rlsDir, f"{fullName}-{modVers}.zip")

#.....................................
# CLI options
#.............
addOpts("bpdr")
build   = getOpt("b")  # Builds with default options for current system only
debug   = getOpt("d")  # Builds debug version for current system only
release = getOpt("r")  # Builds release version for current system only
pack    = getOpt("p")  # Builds release for all platforms and Packs all files into the releases folder for distribution
noOpts = not pack and not build and not debug and not release
if noOpts: build = True  # Override to `b` when no options are given
distribute = pack        # Builds release for all platforms when packing

#.....................................
# Building
#...........
from multiprocessing import cpu_count
coresPc = 0.8
cores   = int(cpu_count()*coresPc)
makeCmd = f"make -j{cores}"
#.....................................
if build:                 bash(f"{makeCmd}", dir=thisDir())
if debug:                 bash(f"{makeCmd} debug", dir=thisDir())
if release or distribute: bash(f"{makeCmd} release", dir=thisDir())
if distribute:            bash(f"{makeCmd} release COMPILE_PLATFORM=mingw64", dir=thisDir())

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
  # Assets: Create b3a.pk3 and Copy all pk3 asset files
  Pk3(astFiles, astPk3, astDir)
  for file in pk3Files: cp(file, rlsBase)
  # Zip and Copy source code
  ZipDir(srcDir, srcZip)
  # Pack everything
  Zip(glob(rlsBase, "*"), rlsZip, rlsDir)

