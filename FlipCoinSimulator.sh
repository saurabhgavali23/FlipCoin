#!/bin/bash -x

echo "Welcom to FlipCoinSimulator"

number=0

function flipCoin(){

num=$1
number=$2
key=""

declare -A combinations

for (( i=0;i<$number;i++ ))
do

	for ((j=0;j<$num;j++))
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

result=${@}
echo

for i in $result
do

	j=${combinations[$i]}
	echo "$i	 $(( ($j * 100 ) / $number ))"

done | sort -k2 -nr | awk 'NR==1{print $1" "$2}'
}

function main()
{

read -p "Enter your choice: 1.SingletCoin 2.DoubletCoin 3.TripletCoin " coin
read -p "Enter How Many Times You Want to Flip " number

	case $coin in
	1)
		flipCoin 1 $number;;
	2)
		flipCoin 2 $number;;
	3)
		flipCoin 3 $number;;
	*)
		echo "Invalid Option";;
	esac
}

main
