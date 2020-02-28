#!/bin/bash -x
#PRINTING MESSAGE
echo "Welcome to gambling samulation"
#CONSTANT VARIABLE
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
		#USING ARRAY TO STORE DAILY RECORD
		array1[$day]=$(($STAKE-100))
		winningTime=$(($winingTime+1))
		win=$(($win+50))
		#STORING EACH DAY WINNING
		array2[$day]=$(($win))
		#PRINTING DAILY WINNING RECORFD
		echo  "Day $day  Won by   : ${array1[$day]}"
	else
		#USING ARRAY TO STORE DAILY RECORD
		array1[$day]=$(($STAKE-100))
		loosingTime=$(($loosingTime+1))
		loose=$(($loose-50))
		array2[$day]=$(($loose))
		#PRINTIND DAILY LOOSING RECORD
		echo  "Day $day  Loose by : ${array1[$day]}"
	fi
done
#RESULT AFTER 20 DAYS
echo "After 20 day Won $win"
echo "After 20 day lost  $loose"
#COUNTING MONEY WIN AND LOSS
for count in ${!array2[@]}
do
	echo "Day $count : ${array2[$count]}" 
done
#FINDING MINIMUM AND MAXIMUM VALUE
minimumMoney=${array2[0]}
maximumMoney=${array2[0]}
for cash in ${!array2[@]}
do
	if(( $cash > ${array2[cash]} ))
	then
		minimumMoney=${array2[cash]}
	fi
	if(( $cash < ${array2[cash]} ))
	then

		maximumMoney=${array2[cash]}
	fi
done
#FOR LUCKIESTDAY AND UNLUCKIEST DAY
for findDay in ${!array2[@]}
do
	if(( ${array2[findDay]}==$maximumMoney ))
	then
		echo "Luckiest day is : $findDay"
	fi
	if (( ${array2[findDay]}==$minimumMoney))
   then
      echo "Unluckiest day is : $findDay"
   fi
done
#ADDING TOTAL WIN AND LOSS MONEY
total=win+loose
if(($total > 0))
then
	echo "Continue to play next month"
else
	echo "Stop playing"
fi






