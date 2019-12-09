#!/bin/bash -x

echo "Welcom to FlipCoinSimulator"

head=0
tail=0
no=20
declare -A flipCoin

for (( i=0;$i<$no;i++ ))
do
	flip=$((RANDOM%2))

	if(( flip == 1 ))
	then
	head=$(($head+1))
	flipCoin[$head]="H"
	else
	tail=$(($tail+1))
	flipCoin[$tail]="T"
	fi
done

headPer=$(( ($head*100)/$no ))
tailPer=$(( ($tail*100)/$no ))

echo ${flipCoin[@]}
