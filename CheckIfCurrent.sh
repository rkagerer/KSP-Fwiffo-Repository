#!/bin/bash

# shell script to check if a git pull is required.

LOCALPATH=$1
GITURL=$2
GITPASS=$3

cd $LOCALPATH
BRANCH="$(git rev-parse --abbrev-ref HEAD)"

echo 
echo git url = $GITURL
echo branch = $BRANCH

# bash replace - replace @ with :password@ in the GIT URL
GITURL2="${GITURL/@/:$GITPASS@}"
FOO="$(git ls-remote $GITURL2 -h $BRANCH 2> /dev/null)"
if [ "$?" != "0" ]; then
  echo cannot get remote status
  exit 2
fi
FOO_ARRAY=($FOO)
BAR=${FOO_ARRAY[0]}
echo [$BAR]

LOCALBAR="$(git rev-parse HEAD)"
echo [$LOCALBAR]
echo

if [ "$BAR" == "$LOCALBAR" ]; then
  #read -t4 -n1 -r -p 'Press any key in the next four seconds...' key
  echo No changes
  exit 0
else
  read -t4 -n1 -r -p 'Press any key in the next four seconds...' key
  #echo pressed $key
  echo There are changes between local and remote repositories.
  exit 1
fi
