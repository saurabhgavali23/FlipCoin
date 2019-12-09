#!/bin/bash -x

echo "Welcom to FlipCoinSimulator"

flip=$((RANDOM%2))

if(( flip == 1 ))
then
	echo "Head"
else
	echo "Tail"
fi
