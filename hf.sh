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
script=`ps aux | grep -i ".packet.sh" | grep -v "grep" | wc -l`



if [ $freq -eq $nodeFreq ] && [[ "$mode" == "$nodeMode" ]] && [ $script -ge 1 ]
then
echo "The node is running on HF on port $HFport. The dial frequency is $kHz kHz."
echo "Please note the HF port of this node may be turned off without notice if the SYSOP wishes to use the HF bands for anything. It will be reactivated as soon as possible, and any messages held until this time. Thank you for your understanding"
else
echo "The node is not currently running on HF. If you see this message please consider letting the SYSOP know - $sysopEmail"
echo "Please note the HF port of this node may be turned off without notice if the SYSOP wishes to use the HF bands for anything. It will be reactivated as soon as possible, and any messages held until this time. Thank you for your understanding"
fi
sleep 2
