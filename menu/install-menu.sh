#!/bin/bash
# ==========================================
cd /usr/bin

wget -O menu "https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/menu.sh"
wget -O traffic "https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/traffic.sh"

wget -O add-xray "https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu-xray/add-xray.sh"

#
chmod +x /usr/bin/menu
chmod +x /usr/bin/traffic
chmod +x /usr/bin/add-xray

#
cd


wget -r https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/menu-ssh