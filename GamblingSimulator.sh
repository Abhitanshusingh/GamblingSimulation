#!/bin/bash -x
#PRINTING MESSAGE
echo "Welcome to gambling samulation"
#CONSTANT VARIABLE
STAKE=100
BET=1			#STARTING BET FROM RS 1
#VARIABLE
isWin=1
random=$((RANDOM%2+1))
if(($random == $isWin))
then
	echo="Win"
else
	echo "Loose"
fi
