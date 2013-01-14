#!/bin/bash

export CC_CLIENT_CWD=`pwd`/test
export CC_CLIENT_FILE=Main.java
export CC_CLIENT_FILEBASE=Main

osascript terminal.scpt "cd $CC_CLIENT_CWD; export CC_CLIENT_CWD=$CC_CLIENT_CWD; export CC_CLIENT_FILE=$CC_CLIENT_FILE; export CC_CLIENT_FILEBASE=$CC_CLIENT_FILEBASE; sh ../build.sh; exit"

