#!/bin/bash

# Install dependencies
sudo apt update
sudo apt install policykit-1 curl

# Install the OpenVPN repository key used by the OpenVPN packages
sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://packages.openvpn.net/packages-repo.gpg | sudo tee /etc/apt/keyrings/openvpn.asc

# Add the OpenVPN repository
echo "deb [signed-by=/etc/apt/keyrings/openvpn.asc] https://packages.openvpn.net/openvpn3/debian $(lsb_release -c -s) main" | sudo tee /etc/apt/sources.list.d/openvpn-packages.list
sudo apt update

# Install OpenVPN Connector setup tool
sudo apt install python3-openvpn-connector-setup

# Run openvpn-connector-setup to import ovpn profile and connect to VPN.
# You will be asked to provide setup token, You can get it from the
# Linux Connector configuration page in CloudConnexa Portal.
sudo openvpn-connector-setup
