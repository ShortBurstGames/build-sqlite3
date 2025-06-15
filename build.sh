#!/bin/sh

DEFINES='-DLSQLITE_VERSION="0.9.6"'

rm -f *.o *.obj *.a *.lib
mkdir -p lib/$1

case $1 in
	arm64-osx|x86_64-osx)
		# Build both architectures for both architectures.
		set -x
		clang -arch arm64 -arch x86_64 -c $DEFINES sqlite3.c lsqlite3.c
		ar rcs lib/$1/libsqlite3.a sqlite3.o lsqlite3.o
	;;
	x86_64-linux)
		set -x
		clang -arch x86_64 -c $DEFINES sqlite3.c lsqlite3.c
		ar rcs lib/$1/libsqlite3.a sqlite3.o lsqlite3.o
	;;
	arm64-linux)
		set -x
		clang -arch arm64 -c $DEFINES sqlite3.c lsqlite3.c
		ar rcs lib/$1/libsqlite3.a sqlite3.o lsqlite3.o
	;;
	x86_64-win32)
		set -x
		cl -c $DEFINES sqlite3.c lsqlite3.c
		lib -out:lib/$1/libsqlite3.lib sqlite3.obj lsqlite3.obj
	;;
esac
