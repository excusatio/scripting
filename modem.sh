#!/bin/bash
# The /sys filesystem entry for your modem
bus="/sys/bus/usb/devices"
num="2-2/2-2:1.0"
dev="wwp0s20f0u2"
sys="{bus}/${num}/net/${dev}/cdc_ncm"
# Apply values to the relevant parameters
echo 16383 | sudo tee ${sys}/rx_max
echo 16383 | sudo tee ${sys}/tx_max
echo 16384 | sudo tee ${sys}/rx_max
echo 16384 | sudo tee ${sys}/tx_max
# Find the device name
for n in {0..9}
do
 echo $n
 test -e /dev/cdc-wdm${n} && break
done
# Store the right device name
ice=/dev/cdc-wdm${n}
# Modify the proper device
echo "At ${ice}"
sudo qmicli -d ${ice} --device-open-proxy --device-open-mbim --uim-get-card-status
sleep 2
sudo qmicli -d ${ice} --device-open-proxy --device-open-mbim --uim-switch-slot=1
sleep 2
# Restart modem manager
sudo systemctl restart ModemManager
# Check if the connection is ready. 
