#!/bin/bash
echo "## Installing bridge-utils"
apt install -y bridge-utils

echo "## Setting up dummy interface for bridge"
ip link add dummy0 type dummy
ip link set up dummy0

# This forces the bridge interface up so Docker can macvlan to it.
echo "## Creating the bridge, adding dummy0"
brctl addbr in-band
brctl addif in-band dummy0