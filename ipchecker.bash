#!/bin/bash

#Malicious IP address checking script
#Created by Mattia Campagnano on Sat Feb 6 00:43:56 EST 2016
#OS X version coded for El Capitan and later.

echo -n "Please enter an IP address to check:  ";

read ip

#Checks whether the user enters an IP.
#If not, it throws an error

if [ -z  $ip ]
then
   echo "Enter an IP address"
fi

#stores each octet to a variable

    octet1=$(echo $ip | cut -d "." -f1)
    octet2=$(echo $ip | cut -d "." -f2)
    octet3=$(echo $ip | cut -d "." -f3)
    octet4=$(echo $ip | cut -d "." -f4)
    stat=0
    
    #IP address validation through if statement 
#and a regular expression.

if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]] && [ $octet1 -le 255 ] && [ $octet2 -le 255 ] && [ $octet3 -le 255 ] && [ $octet4 -le 255 ];
then
       stat=1
else
       stat=0
fi

    
#If the user enters a valid IP, it starts recon process, otherwise it throws an error and aborts execution.

case "$stat" in
   "1")echo "Recon on $ip" ;;
   "0")echo "Invalid IP address" 
      exit 1 ;;
esac
if  [[ "$ip" =~ (^192.168|^10\.) ]];
then
     echo "${ip} is a private IP address. No recon can be performed"
  
     exit 1;
elif [if [[ "$ip" =~ (^172.1[6-9].|^172.2[0-9].|^172.3[0-1].) ]];
then 
     echo "${ip} is a private IP address. No recon can be performed"
     exit 1;
elif [[ "$ip" =~ (^127\.) ]]
then
     echo "${ip} is a loopback IP address. No recon can be performed"
     exit 1;


elif [[ "$ip" =~ (^224\.|^225\.|^226\.|^227\.|^228\.|^229\.|^230\.|^231\.|^232\.|^233\.|^234\.|^235\.|^236\.|^237\.|^238\.|^239\.|^240\.|^241\.|^242\.|^243\.|^244\.|^245\.|^246\.|^247\.|^248\.|^249\.|^250\.|^251\.|^252\.|^253\.|^254\.|^255\.) ]];

then
     echo "Reserved IP address range. No recon can be performed"
     exit 1;


else
     echo "Valid public IP Address"

fi

#cd into Applications folder

cd /Applications/Google\ Chrome.app/
#cd into hidden folder containing the actual Chrome executable
cd Contents/MacOS/

#Launch Google Chrome in a new tab
./Google\ Chrome -new-tab http://www.ipvoid.com/scan/$ip/ &
./Google\ Chrome -new-tab http://www.robtex.com?q=$ip/ &
./Google\ Chrome -new-tab  http://www.senderbase.org/lookup?search_string=$ip/ &
./Google\ Chrome -new -tab http://evuln.com/tools/malware-scanner/$ip/ &
./Google\ Chrome -new-tab www.ip-tracker.org/blacklist-check.php?ip=$ip
./Google\ Chrome -new-tab http://www.ipv4lookup.com/$ip-ip-address-lookup/
