#!/bin/bash

#Malicious IP address checking script
#Created by Mattia Campagnano on Sat Feb 6 00:43:56 EST 2016
#Version created for use with Windows Subsystem for Linux in Windows 10 

echo -n "Please enter an IP address to check:  ";

read ip

#Checks whether the user enters an IP.
#If not, it throws an error

#If the user enters an IP, it starts recon process.

#IP address validation through if statement 
#and a regular expression.

if [ -z  $ip ]
then
   echo "Enter an IP address"
fi

    octet1=$(echo $ip | cut -d "." -f1)
    octet2=$(echo $ip | cut -d "." -f2)
    octet3=$(echo $ip | cut -d "." -f3)
    octet4=$(echo $ip | cut -d "." -f4)
    stat=0
if [[ $ip =~ ^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$ ]] && [ $octet1 -le 255 ] && [ $octet2 -le 255 ] && [ $octet3 -le 255 ] && [ $octet4 -le 255 ];
then
       stat=1
else
       stat=0
fi
case "$stat" in
   "1")echo "Recon on $ip" ;;
   "0")echo "Invalid IP address" 
      exit 1 ;;
esac
if  [[ "$ip" =~ (^192.168|^10\.) ]];
then
     echo "${ip} is a private IP address: no recon can be performed"
  
     exit 1;
elif [[ "$ip" =~ (^172.1[6-9].|^172.2[0-9].|^172.3[0-1].) ]];
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

/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe -new-tab http://www.ipvoid.com/scan/$ip/ &
/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe -new-tab http://www.robtex.com?q=$ip/ &         

/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe -new-tab https://www.talosintelligence.com/reputation_center/lookup?search=$ip/ &/ &

/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe -new-tab http://evuln.com/tools/malware-scanner/$ip/ &
/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe -new-tab www.ip-tracker.org/blacklist-check.php?ip=$ip

/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe -new-tab http://www.ipv4lookup.com/$ip-ip-address-lookup/&
/mnt/c/Program\ Files\ \(x86\)/Google/Chrome/Application/chrome.exe -new-tab http://www.virustotal.com/#/ip-address/$ip/&
