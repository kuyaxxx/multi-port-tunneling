#!/bin/bash
# ==========================================
wget -O /usr/bin/menu "https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/menu.sh"
wget -O /usr/bin/traffic "https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/traffic.sh"
wget -O /usr/bin/menu-xray "https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/menu-xray.sh"
wget -O /usr/bin/add-xray "https://raw.githubusercontent.com/kuyaxxx/multi-port-tunneling/main/menu/menu-xray/add-xray.sh"

#
chmod +x /usr/bin/menu
chmod +x /usr/bin/traffic
chmod +x /usr/bin/menu-xray
chmod +x /usr/bin/add-xray