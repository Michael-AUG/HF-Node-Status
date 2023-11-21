#!/bin/bash
# Written by Michael Topple GM5AUG
# gm5aug.topple.scot

nodeFreq=7045740 # Change this to match the node dial frequency
nodeMode="PKTUSB" # Change this to whatever your radio calls the mode you use for Packet
sysopEmail="gm5aug@topple.scot" # Change this to your email address
HFport=4 # Change this to the port number used for HF

freq=$(rigctl -m2 f)
mode=$(rigctl -m2 \get_mode | sed -n '1p')
kHz=$(echo "scale=2; $freq/1000" | bc -l)

if [ $freq -eq $nodeFreq ] && [ $mode -eq $nodeMode ]
then
echo "The node is running on HF on port $HFport. The dial frequency is $kHz kHz."
else
echo "The node is not currently running on HF. If you see this message please consider letting the SYSOP know - $sysopEmail"
fi
