#!/bin/bash

## Files

DIR=$HOME/wallpaper/
PICS=($(ls ${DIR}))

RANDOMPICS=${PICS[$RANDOM % ${#PICS[@]}]}

matugen image $DIR/$RANDOMPICS
