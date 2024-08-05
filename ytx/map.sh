#!/bin/bash

echo $DISPLAY
pulseaudio --start
sleep 2

cd data

(( pro_count=0 ))

if [ -f "profile_count.txt" ]
then
	pro_count=$(cat profile_count.txt)
	(( pro_count++ ))
	echo $pro_count > profile_count.txt
else
	
	(( pro_count++ ))
	echo $pro_count > profile_count.txt

fi

#mkdir -p fire/$pro_count
mkdir -p chrome/$pro_count
#../get.sh $pro_count firefox --profile fire/$pro_count --kiosk $1 &
../get.sh $pro_count chromium --user-data-dir=chrome/$pro_count --app=$1 &
sleep 60
xdotool key space

sleep 120
echo killing
kill $(cat pid/$pro_count)

sleep 2

