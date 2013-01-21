#!/bin/bash

cd $CC_CLIENT_CWD

clear

javac $CC_CLIENT_FILE

if [ $? -eq 0 ]; then

script -c "java $CC_CLIENT_FILEBASE" -e -f -q .script.output

tail -n +2 .script.output > .stdout

rm -f .script.output

fi

read -p 'Press ENTER to continue...' __KEY

touch .complete

