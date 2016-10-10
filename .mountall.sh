#!/bin/bash
#Mount all the HDD Manually (Type mountall in command line)

echo "Enter the PASSWORD to mount all drives !"

sudo mount /dev/sda2 /media/chahatdeep/Win7/
sudo mount /dev/sda7 /media/chahatdeep/Work/
sudo mount /dev/sda6 /media/chahatdeep/Everything/
sudo mount /dev/sda5 /media/chahatdeep/LinuX/

echo "Drives mounted successfully"
