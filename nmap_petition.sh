#!/bin/bash
echo "Enter the IP:"

read IP

if [[ ! "$IP" =~ ^[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
    echo "Invalid IP address. Please enter a valid IP."
    exit 1
fi

sudo nmap -n -Pn -sS -p- --min-rate="5000" $IP > SYN_Scan.txt
echo "SYN scan completed"
sudo nmap -n -Pn -sT -p- --min-rate="5000" $IP > TCP_Scan.txt
echo "TCP scan completed"
sudo nmap -n -Pn -sU -p- --min-rate="5000" $IP > UDP_Scan.txt
echo "UDP scan completed"
sudo nmap -n -Pn -A -p- --min-rate="5000" $IP > Aggro_Scan.txt
echo "Aggro scan completed"
sudo nmap -n -Pn -sX -p- --min-rate="5000" $IP > XMAS_Scan.txt
echo "XMAS scan completed"
sudo nmap -n -Pn -p- --script=vuln --min-rate="5000" $IP > Vuln_Scan.txt
echo "Vuln scan completed"

exit 0
