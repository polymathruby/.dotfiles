#!/bin/bash

DEV="$HOME/Developer"
directories=($DEV/ExoCortex $DEV/Learn2Code $DEV/AdventOfCode $DEV/LeetCode $DEV/Wargames)
GIT_SYNC="$HOME/.dotfiles/.meta/Scripts/gitSync.sh"

for dir in "${directories[@]}"
do
  if [ -d "$dir" ]
  then
    cd "$dir"
    printf "\n+++ Now updating: $dir +++"
    $GIT_SYNC
    printf "\n+++Finished updating $dir +++"
  else
    echo "\nSkipping: $dir - directory not found on this machine\n"
  fi
done
