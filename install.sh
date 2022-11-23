#!/bin/bash
echo "Checking VPS"
if [ "${EUID}" -ne 0 ]; then
		echo "You need to run this script as root"
		exit 1
fi
if [ "$(systemd-detect-virt)" == "openvz" ]; then
		echo "OpenVZ is not supported"
		exit 1
fi
# install wget and curl
apt -y install wget curl
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
if [ ! -d "/var/lib/ncr" ]
then 
   mkdir /var/lib/ncr;
fi
echo "IP=$MYIP" >> /var/lib/ncr/ipvps.conf
echo -e ""
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "\E[44;1;39m              ⇱ System Information ⇲             \E[0m"
echo -e "${CYAN}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m${NC}"
echo -e "❇️  Install tool yang dibutuhkan ..."
#update
apt update -y
apt upgrade -y
apt dist-upgrade -y
apt-get remove --purge ufw firewalld -y
apt-get remove --purge exim4 -y

#
apt install -y wget curl libnss3-dev libnspr4-dev pkg-config libpam0g-dev libcap-ng-dev libcap-ng-utils libselinux1-dev libcurl4-nss-dev flex bison make libnss3-tools libevent-dev xl2tpd pptpd

# 
apt install -y bzip2 gzip coreutils screen unzip

# Install Requirements Tools
apt install -y ruby python make cmake coreutils rsyslog net-tools zip unzip nano sed gnupg gnupg1 bc jq apt-transport-https build-essential dirmngr
apt install -y libxml-parser-perl neofetch git lsof libsqlite3-dev libz-dev gcc g++ libreadline-dev zlib1g-dev libssl-dev libssl1.0-dev dos2unix nano
apt install -y python3 python3-dnslib dnsutils golang ncurses-utils pwgen gnutls-bin iptables cron mlocate dh-make libaudit-dev debconf-utils
apt install -y ssl-cert ca-certificate python3-pip cowsay figlet lolcat tcpdump dsniff grepcidr iptables-persistent socat xz-utils lsb-release
apt install -y bash-completion ntpdate chrony openssl netcat autoclean dropbear
apt install -y grep &>/dev/null
apt-add-repository universe -y &>/dev/null
apt install -y software-properties-common &>/dev/null

apt -y --purge remove unscd;
apt -y --purge remove samba*;
apt -y --purge remove apache2*;
apt -y --purge remove bind9*;
apt -y remove sendmail*
apt autoremove -y

apt purge -y apache2*
rm -rf /etc/apache2
dpkg --configure -a &>/dev/null

service cron reload
service cron restart

echo -e "❇️  Install XRAY ..."
sleep 1
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/xray/xray.sh && chmod +x xray.sh && ./xray.sh
echo -e "❇️  Install Certificate ..."
sleep 1
wget -O /usr/bin/certxray "https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/xray/certxray.sh";chmod +x /usr/bin/certxray;/usr/bin/certxray
echo -e "❇️  Install NGINX ..."
sleep 1
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/nginx/nginx.sh && chmod +x nginx.sh && ./nginx.sh
echo -e "❇️  Install SSH ..."
sleep 1
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/ssh/ssh.sh && chmod +x ssh.sh && ./ssh.sh
echo -e "❇️  Install SSLH ..."
sleep 1
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/sslh/sslh.sh && chmod +x sslh.sh && ./sslh.sh
echo -e "❇️  Install STUNNEL5 ..."
sleep 1
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/stunnel5/stunnel5.sh && chmod +x stunnel5.sh && ./stunnel5.sh
echo -e "❇️  Install WEBSOCKET ..."
sleep 1
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/websocket/websocket.sh && chmod +x websocket.sh && ./websocket.sh
echo -e "❇️  Install MENU ..."
sleep 1
wget https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/install-menu.sh && chmod +x install-menu.sh && ./install-menu.sh

echo " Reboot 15 Sec"
sleep 15
cd
rm -rf install.sh
rm -rf xray.sh
rm -rf nginx.sh
rm -rf ssh.sh
rm -rf sslh.sh
rm -rf stunnel5.sh
rm -rf websocket.sh
rm -rf install-menu.sh
reboot
