#!/bin/bash

echo "digite de 0.0000000000000000000001 a mais de 8000"
read n
progress_bar(){
  local PROG_BAR_MAX=${1:-50}
  local PROG_BAR_DELAY=${2:-$n}
  local PROG_BAR_TODO=${3:-"."}
  local PROG_BAR_DONE=${4:-"*"}
  local i

  echo -en "["
  for i in `seq 1 $PROG_BAR_MAX`
  do
    echo -en "$PROG_BAR_TODO"
  done
  echo -en "]\0015["
  for i in `seq 1 $PROG_BAR_MAX`
  do
    echo -en "$PROG_BAR_DONE"
    sleep ${PROG_BAR_DELAY}
  done
  echo
}

for ((j=0;j<8;j++))
do
  progress_bar 10
done