#!/bin/bash
# ==========================================
cd /usr/bin

wget -O menu "https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/menu.sh"
wget -O traffic "https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/traffic.sh"
wget -O traffic "https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/traffic.sh"

wget -O menu-xray "https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/menu-xray.sh"

#
chmod +x /usr/bin/menu
chmod +x /usr/bin/traffic
chmod +x /usr/bin/menu-xray
chmod +x /usr/bin/add-xray

#
cd