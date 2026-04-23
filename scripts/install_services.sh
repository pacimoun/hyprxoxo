#!/bin/bash

source ./scripts/functions.sh
if [ $? -ne 0 ]; then
  echo "Error: failed to source functions.sh, please execute from $(dirname $(realpath $0))..."
  exit 1
fi

# rules
sudo cp $CloneDir/rules/81-bluetooth-hci.rules /etc/udev/rules.d/
sudo cp $CloneDir/rules/30-amdgpu-high-power.rules /etc/udev/rules.d/

# sysctl configs
sudo cp $CloneDir/sysconfigs/99-disable-ipv6.conf /etc/sysctl.d/

# NetworkManager configs
sudo cp $CloneDir/sysconfigs/disable-ipv6.conf /etc/NetworkManager/conf.d/disable-ipv6.conf