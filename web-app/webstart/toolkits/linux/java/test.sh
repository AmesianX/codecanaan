#!/bin/bash

export CC_CLIENT_CWD=./test
export CC_CLIENT_FILE=Main.java
export CC_CLIENT_FILEBASE=Main

gnome-terminal -t CodeCanaan -x sh build.sh

