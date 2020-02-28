#!/bin/bash -x
#PRINTING MESSAGE
echo "Welcome to gambling samulation"
#CONSTANT VARIABLE
STAKE=100
BET=1			#STARTING BET FROM RS 1
#VARIABLE
isWin=1
loose=0
win=0
winningTime=0
loosingTime=0
for(( day=1; day<=20 ;day++ ))
do
	STAKE=100
	goal=150
	stop=50
	while(($STAKE < $goal && $STAKE > $stop ))
	do
		#GENERATING RANDOM VALUE 1 THEN WIN 2 THEN LOOSE
		random=$((RANDOM%2+1))
		if(($random == $isWin))
		then
			STAKE=$(($STAKE+$BET))
		else
			STAKE=$(($STAKE-$BET))
		fi
	done
	if (( $((STAKE-100))>0 ))
	then
		winningTime=$(($winingTime+1))
		win=$(($win+50))
	else
		loosingTime=$(($loosingTime+1))
		loose=$(($loose-50))
	fi
done
echo "After 20 day Won $win"
echo "After 20 day lost  $loose"
