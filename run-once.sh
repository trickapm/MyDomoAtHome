#!/bin/sh
echo "Will update packages list first..."
clear
echo "Will update packages list first..."
#sudo apt-get update 2>&1 > /dev/null
echo "Now getting the needed software..."
sudo apt-get -y install whiptail  2>&1 > /dev/null

 if ! whiptail  --backtitle "MyDomoAtHome ISS Interface" --yesno "Have you configured MyDomoAtHome.sh with your parameters before continuing ? Otherwise please say NO" 0 0; then
                whiptail  --backtitle "MyDomoAtHome ISS Interface" --msgbox "Understood! Aborting!" 0 0 
                return
        fi


echo "Now getting getting and installing dependencies..."
sudo apt-get -y install libdancer-perl libswitch-perl libfile-slurp-perl  liblwp-protocol-psgi-perl cpanminus 2>&1 
sudo apt-get -y install libtime-piece-perl libjson-perl libplack-perl starman  libcrypt-ssleay-perl libdatetime-perl 2>&1 
sudo apt-get -y install libdbd-sqlite3-perl libdbi-perl sqlite3 2>&1 
sudo apt-get -y install libaudio-mpd-perl libnet-upnp-perl libpoe-component-client-mpd-perl  2>&1 
sudo cpanm Time::Moment
curl -L http://cpanmin.us | perl - --sudo Dancer2
sudo chown www-data.www-data logs
sudo chown www-data.www-data logs/*
echo "Now installing the service"
sudo cp MyDomoAtHome.sh /etc/init.d/MyDomoAtHome.sh
sudo chmod +x /etc/init.d/MyDomoAtHome.sh
sudo update-rc.d MyDomoAtHome.sh defaults
whiptail  --backtitle "MyDomoAtHome ISS Interface" --msgbox "Everything has been installed ! Please remember default port is 3001." 0 0 

