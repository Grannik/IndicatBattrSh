#!/bin/bash
 a="\e[1;32m+~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~+\e[0m"
 b="\e[1;32m+-------------------------------------------------------------------------------+\e[0m"
#c
#d
#e
powrerStattic ()
{
clear
tput cup 1 0
 for (( c=0; c<=15; c++ ))
  do
   echo -e "\e[1;32m|                                                                               |\e[0m"
  done
tput cup  0 0; echo -e "$a"
tput cup  2 0; echo -e "$b"
tput cup  4 1; echo -e "\e[95m 25%+\e[0m"
tput cup  7 1; echo -e "\e[92m 25%+\e[0m"
tput cup  8 2; echo -e "\e[0m\e[92m□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□□\e[0m"
tput cup 10 0; echo -e "$b"
tput cup 11 2; echo "Upower"
tput cup 17 0; echo -e "$a"
}
powrerSupplyCapacity ()
{
source /sys/class/power_supply/BAT1/uevent
#=========================================
d=$POWER_SUPPLY_CAPACITY
if [[ $d -gt 90 ]]
then
#=========================================
tput cup  1 2; echo -e "ЗАРЯД БАТАРЕИ \e[1;32m|\e[0m BATTERY CHARGE \e[1;32m|\e[0m POWER_SUPPLY_CAPACITY = \e[31m$POWER_SUPPLY_CAPACITY %\e[0m"
c=$POWER_SUPPLY_CAPACITY
tput cup 5 2
for ((e=25; e <= c ; e++))
do
 echo -en "\e[0m\e[95m□\e[0m"
done
tput cup 12 4;upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep --color=never -E "state"
tput cup 13 4;upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep --color=never -E "to\ full"
tput cup 14 4;upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep --color=never -E "to\ empty"
tput cup 15 4;upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep --color=never -E "percentage"
#=========================================
else
zenity --warning --text="Низкий заряд ботареи!"
fi
#=========================================
}
powrerStattic
while :;
 do powrerSupplyCapacity;
  sleep 10;
 done
