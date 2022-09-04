#!/usr/bin/python
import sys; sys.dont_write_bytecode = True;
#.....................................

#.....................................
def err(msg): print(f"ERR:: {msg}"); import sys; sys.exit(1)
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
def glob(path, name): from pathlib import Path; return Path(path).glob(name)
#.....................................
def cp(src,trg):
  from shutil import copyfile, copytree
  from os.path import isdir, join, basename
  from pathlib import Path
  srcT = 'd' if isdir(src) or Path(src).is_dir() else 'f'
  trgT = 'd' if isdir(trg) or Path(trg).is_dir() else 'f'
  ftod = srcT in 'f' and trgT in 'd'
  ftof = srcT in 'f' and trgT in 'f'
  dtod = srcT in 'd' and trgT in 'd'
  dtof = srcT in 'd' and trgT in 'f'
  if ftod: copyfile(src, join(trg, basename(src)))
  if ftof: copyfile(src, trg)
  if dtod: copytree(src, trg)
  if dtof: err(f"Cannot copy folder to dir:  {src}  to  {trg}")
#.....................................
def mv(src,trg): import shutil; shutil.move(src,trg)
#.....................................
def md(trg): 
  import os
  if not os.path.exists(trg): os.makedirs(trg)
def mdOld(trg): from pathlib import Path; Path(trg).mkdir(exist_ok=True)
#.....................................
def writeStr(string, file, type='w'):
  match type:
    case 'w': f = open(file, "w+")
    case 'a': f = open(file, "a+")
    case _: err("Incorrect type keyword in function writeStr: {type}")
  f.write(string)
  f.close()
#.....................................
def isEmpty(trg):
  from os.path import isdir, isfile, exists, getsize
  from os import listdir
  unkn = True if not trg or not exists(trg) else False
  dir  = trg.is_dir() or isdir(trg)
  file = trg.is_file  or isfile(trg)
  if dir:
    empty = not listdir(trg)
    return True if empty or unkn else False
  elif file:
    try:    empty = getsize(trg)
    except: empty = True  # If file does not exist, getsize will raise an exception
    return True if empty or unkn else False
  else:  # Input is not a dir or a file. Treat it as a python variable
    return True if not trg else False
#.....................................
def bash(cmd, dir="", type='print'):
  import subprocess
  com = " ".join(list(filter(None, cmd.split(";")))).split(" ")
  match type:
    case 'pipe':  result = subprocess.run(com, cwd=dir, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    case 'print': result = subprocess.run(com, cwd=dir)
    case _: err(f"Incorrect type keyword in function bash(): {type}")
  return result
#.....................................
from optparse import OptionParser
_parser = OptionParser()
def addOpts(opts):
  for opt in opts:
    global _parser; _parser.add_option("-"+opt, action="store_true")
def getOpt(kw):
  global _parser;
  (opts,args) = _parser.parse_args()
  for (key,value) in vars(opts).items():
    if kw == key and value: return True
  return False
def getArg(idx):
  global _parser
  (opts,args) = _parser.parse_args()
  try:    return args[idx] 
  except: return None
#.....................................
def Zip(src,trg,rel=None):
  from os.path import join, relpath, basename, dirname, isfile, isdir
  from os import walk
  if not rel: rel = str(dirname(trg))
  from zipfile import ZipFile, ZIP_DEFLATED
  z = ZipFile(trg, 'w', ZIP_DEFLATED)
  # Zip all files contained in the list
  srcfiles = [f for f in src if isfile(f)]
  for it in srcfiles:
    root = dirname(it)
    frel = relpath(dirname(it), rel)
    file = basename(it)
    z.write(join(root, file), arcname=join(frel, file))
  # Walk through all dirs, and zip everything in them recursively
  srcdirs  = [d for d in src if isdir(d)]
  for it in srcdirs:
    for root, dirs, files in walk(it):
      for file in files:
        frel = relpath(root, rel)
        z.write(join(root, file), arcname=join(frel, file))
  z.close()

def Pk3(list, trg, rel=None):
  from os.path import splitext
  z = splitext(trg)[0]+".zip" 
  p = splitext(trg)[0]+".pk3" 
  Zip(list, z, rel)
  mv(z,p)
#.....................................
def ZipDir(src,trg,rel=None):
  from os.path import relpath, join; from os import walk
  from zipfile import ZipFile, ZIP_DEFLATED
  if not rel: rel = src
  z = ZipFile(trg, 'w', ZIP_DEFLATED)
  for root, dirs, files in walk(src):
    for file in files:
      frel = relpath(root, rel)
      z.write(join(root, file), arcname=join(frel, file))
  z.close()

def Pk3Dir(src, trg, rel=None):
  from os.path import basename, splitext, dirname, join
  z = splitext(basename(trg))[0]+".zip"
  p = splitext(basename(trg))[0]+".pk3"
  ZipDir(src, z, rel)
  mv(z, join(dirname(trg), p))
#.....................................
def Pk3CreateAll(src, trg, prefix=None):
  from os.path import join, basename, isdir 
  if prefix is None: prefix = "y.custom."
  dirs = [d for d in glob(src, "*") if d.is_dir() or isdir(d)]
  for it in dirs:  # For every folder in src
    if isEmpty(it): continue # Skip empty folder
    pk3 = join(trg, f"{prefix}{basename(it)}.pk3")
    Pk3Dir(it, pk3)
#.....................................


#.....................................
if __name__=="__main__": err(f"File {__file__} is only meant to be used as a module.")
