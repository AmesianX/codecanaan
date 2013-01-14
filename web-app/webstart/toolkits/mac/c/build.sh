#!/bin/bash

cd $CC_CLIENT_CWD

clear

gcc -o $CC_CLIENT_FILEBASE $CC_CLIENT_FILE

if [ $? -eq 0 ]; then

script -q .stdout ./$CC_CLIENT_FILEBASE

fi

read -p 'Press ENTER to continue...' __KEY

touch .complete
