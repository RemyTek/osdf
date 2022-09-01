import os

# Always build both windows and linux platforms
exec "make"
exec "make COMPILE_PLATFORM=mingw64"
