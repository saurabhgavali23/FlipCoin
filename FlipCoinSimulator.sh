#!/bin/bash -x

echo "Welcom to FlipCoinSimulator"

numOfCoins=0

declare -A combinations

function getFlipCoinResult(){

	numOfCoins=$2
	coin=$1
	key=""

	for (( i=0;i<$numOfCoins;i++ ))
	do

		for ((j=0;j<$coin;j++))
		do

			flip=$((RANDOM%2))
			if (( flip == 1 ))
			then
				key=$key"H"
			else
				key=$key"T"
			fi
		done

		combinations[$key]=$(( ${combinations[$key]} + 1 ))
		key=""
	done

	percentage ${!combinations[@]}
}

function percentage(){

	fatchDictValue=${@}

	for result in $fatchDictValue
	do

		value=${combinations[$result]}
		echo "$result	 $(( ($value * 100 ) / $numOfCoins ))"

	done | sort -k2 -nr | awk 'NR==1{print $1" "$2}'
}

function main(){

	read -p "Enter your choice: 1.SingletCoin 2.DoubletCoin 3.TripletCoin " coin
	read -p "Enter How Many Times You Want to Flip " numOfCoins

	case $coin in
		1)
			getFlipCoinResult 1 $numOfCoins;;
		2)
			getFlipCoinResult 2 $numOfCoins;;
		3)
			getFlipCoinResult 3 $numOfCoins;;
		*)
			echo "Invalid Option";;
	esac
}

main
