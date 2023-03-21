#!/bin/bash

# Install Apache2
sudo apt-get update
sudo apt-get install apache2 -y

# Start Apache2 and enable it to start at boot
sudo systemctl start apache2
sudo systemctl enable apache2