call "C:\Program Files\Microsoft Visual Studio\2022\Enterprise\VC\Auxiliary\Build\vcvars64.bat"

cl -c %2% sqlite3.c lsqlite3.c
lib -out:lib\%1%\libsqlite3.lib sqlite3.obj lsqlite3.obj
