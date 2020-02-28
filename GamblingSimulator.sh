#!/bin/bash -x
#PRINTING MESSAGE
echo "Welcome to gambling samulation"
#CONSTANT VARIABLE
STAKE=100
BET=1			#STARTING BET FROM RS 1
#VARIABLE
isWin=1
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
		echo "Win"
	else
		echo "Loose"
	fi
