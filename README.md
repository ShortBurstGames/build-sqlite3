# Build SQLite3

Actions in this repository build SQLite 3 and SQLite Lua bindings for use in the [defold-sqlite3 extension](https://github.com/ShortBurstGames/defold-sqlite3/).

The Lua bindings are [LuaSQLite 0.9.6](https://lua.sqlite.org/) using the SQLite 3.50.1 [amalgamation](https://www.sqlite.org/amalgamation.html). The lua.h file is from [LuaJIT 2.1.0](https://luajit.org/luajit.html).

These source files need to be built separately from the Defold extension because they are ANSI C that doesn't compile properly as C++, and Defold's extension builder only supports building C as C++.

This repo is inspired by [dlannan/sqlite3-amalg](https://github.com/dlannan/sqlite3-amalg/).
