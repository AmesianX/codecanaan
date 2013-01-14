#!/bin/bash

cd $CC_CLIENT_CWD

clear

javac -encoding utf-8 $CC_CLIENT_FILE

if [ $? -eq 0 ]; then

script -q .stdout java $CC_CLIENT_FILEBASE

fi

read -p 'Press ENTER to continue...' __KEY

touch .complete
