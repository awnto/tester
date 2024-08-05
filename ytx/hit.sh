#!/bin/bash

((rcnt=0))

while (( $rcnt < 50 ))
do
echo $rcnt
((rcnt++))
sleep 1
xvfb-run -a ./map.sh "https://rinix.awnto.com/xmr/yt.html" &
sleep 30

done
