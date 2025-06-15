#!/bin/sh

DEFINES='-DLSQLITE_VERSION="0.9.6"'

rm -f *.o *.obj *.a *.lib
mkdir -p lib/$1

case $1 in
	*-osx)
		# Build both architectures for both architectures.
		set -x
		clang -arch arm64 -arch x86_64 -c $DEFINES sqlite3.c lsqlite3.c
		ar rcs lib/$1/libsqlite3.a sqlite3.o lsqlite3.o
	;;
	*-linux)
		set -x
		clang -c $DEFINES sqlite3.c lsqlite3.c
		ar rcs lib/$1/libsqlite3.a sqlite3.o lsqlite3.o
	;;
	x86_64-win32)
		set -x
		./build-windows.bat $1 $DEFINES
	;;
esac
