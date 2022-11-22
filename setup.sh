#!/bin/bash
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# ==========================================
# Color
RED='\033[0;31m'
NC='\033[0m'
GREEN='\033[0;32m'
ORANGE='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
LIGHT='\033[0;37m'
# =========================================
# Getting
MYIP=$(wget -qO- ipinfo.io/ip);
echo "Checking VPS"
IZIN=$(wget -qO- ipinfo.io/ip);
clear
mkdir /var/lib/crot;
echo "IP=" >> /var/lib/crot/ipvps.conf
cd
#install tools/alat
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/tools.sh && chmod +x tools.sh && ./tools.sh
#Instal Xray
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/xray/xray.sh && chmod +x xray.sh && ./xray.sh
#Instal Xray Certificate
wget -O /usr/bin/certxray "https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/menu-xray/certxray.sh";chmod +x /usr/bin/certxray;/usr/bin/certxray
#Instal SSH
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/ssh/ssh.sh && chmod +x ssh.sh && ./ssh.sh
#Instal SSLH
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/sslh/sslh.sh && chmod +x sslh.sh && ./sslh.sh
#Instal Stunnel5
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/stunnel5/stunnel5.sh && chmod +x stunnel5.sh && ./stunnel5.sh
#Instal websocket
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/websocket/websocket.sh && chmod +x websocket.sh && ./websocket.sh
#install menu
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/install-menu.sh && chmod +x install-menu.sh && ./install-menu.sh
#SELESAI
echo " Reboot 15 Sec"
sleep 15
cd
rm -rf setup.sh
rm -rf tools.sh
rm -rf xray.sh
rm -rf ssh.sh
rm -rf sslh.sh
rm -rf stunnel5.sh
rm -rf websocket.sh
rm -rf install-menu.sh
reboot