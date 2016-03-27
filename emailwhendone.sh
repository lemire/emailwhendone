#!/bin/bash
# Send email when a task is done
#
# $ emailwhendone.sh myemail@something sort giganticfile
# runs 'sort giganticfile'
# then sends email to myemail@something when it is done.
#
# It assumes that you have a working mail executable.
#
# Inspired by Emmanuel Bernard's script
# https://emmanuelbernard.com/blog/2015/03/26/being-notified-when-commands-end/

TFILE=/tmp/"$(basename $0).$$.tmp"

say() {
    if [ `uname -s` == "Darwin" ]; then
        # On Mac OS, notify via Growl
        which -s growlnotify && growlnotify --name "Command line" --sticky --message $MESSAGE
    fi
    if [ `uname -s` == "Linux" ]; then
        # On Linux, notify via notify-send
        which notify-send && notify-send $MESSAGE
    fi
}

if [[ $# -lt 2 ]]; then
  echo "Usage: $(basename $0) myemail mycommand"
  exit -1
else
  if [[ "$1" =~ ^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$ ]]
  then
    EMAIL_ADDRESS=$1
  else
    echo "This is not a valid email address: $1."
    exit -1
  fi
  CMD_DISPLAY="${@:2}"
fi

$CMD_DISPLAY 2>&1 | tee -a some_file $TFILE
EXIT_CODE=$?

if [ $EXIT_CODE -eq 0 ]; then
  MESSAGE="'$CMD_DISPLAY' has run successfully."
else
  MESSAGE="'$CMD_DISPLAY' has failed with exit code $EXIT_CODE."
fi
cat $TFILE | mail -s $MESSAGE  $EMAIL_ADDRESS
rm -f $TFILE
exit $EXIT_CODE
