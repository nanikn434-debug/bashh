#!/bin/bash

SEP="--------------------------------------------------------"
HOSTNAME_UPPER=$(hostname | tr '[:lower:]' '[:upper:]')
LOCATION=$(curl -s --max-time 3 https://ipinfo.io/country 2>/dev/null || echo "ID")
PUBLIC_IP=$(curl -s --max-time 3 https://ipinfo.io/ip 2>/dev/null || echo "Unknown")
OS_INFO=$(grep -m1 PRETTY_NAME /etc/os-release 2>/dev/null | cut -d= -f2 | tr -d '"' || uname -s)
CPU_MODEL=$(grep -m1 'model name' /proc/cpuinfo 2>/dev/null | cut -d: -f2 | xargs || echo "Unknown CPU")
CPU_CORES=$(nproc 2>/dev/null || echo "?")
UPTIME=$(uptime -p 2>/dev/null | sed 's/up //' || echo "Unknown")
RAM_TOTAL=$(free -m 2>/dev/null | awk '/^Mem:/{print $2}' || echo "0")
RAM_USED=$(free -m 2>/dev/null | awk '/^Mem:/{print $3}' || echo "0")
DISK_USED=$(df -h / 2>/dev/null | awk 'NR==2{print $3}' || echo "?")
DISK_TOTAL=$(df -h / 2>/dev/null | awk 'NR==2{print $2}' || echo "?")
DISK_PCT=$(df / 2>/dev/null | awk 'NR==2{print $5}' || echo "?")
NODE_VER=$(node -v 2>/dev/null || echo "N/A")
BUN_VER=$(bun -v 2>/dev/null | sed 's/^/v/' || echo "N/A")
GO_VER=$(go version 2>/dev/null | awk '{print $3}' | sed 's/go/v/' || echo "N/A")
PYTHON_VER=$(python3 --version 2>/dev/null | awk '{print $2}' | sed 's/^/v/' || echo "N/A")


















































































echo ""
echo "                    SAIRI HOST"
echo ""
echo "$SEP"
echo ""
printf "%-12s: %s\n" "Location" "$LOCATION"
printf "%-12s: %s\n" "Public IP" "$PUBLIC_IP"
printf "%-12s: %s\n" "OS" "$OS_INFO"
printf "%-12s: %s (%s Cores)\n" "CPU" "$CPU_MODEL" "$CPU_CORES"
printf "%-12s: %s\n" "Uptime" "$UPTIME"
printf "%-12s: %s MB / %s MB\n" "RAM Usage" "$RAM_USED" "$RAM_TOTAL"
printf "%-12s: %s / %s (%s)\n" "Disk Usage" "$DISK_USED" "$DISK_TOTAL" "$DISK_PCT"
echo ""
echo "$SEP"
echo ""
echo "                    RUNTIME VERSIONS"
echo ""
echo "$SEP"
echo ""
printf "%-12s: %s\n" "Node.js" "$NODE_VER"
printf "%-12s: %s\n" "Bun" "$BUN_VER"
printf "%-12s: %s\n" "Golang" "$GO_VER"
printf "%-12s: %s\n" "Python3" "$PYTHON_VER"
echo ""
echo "$SEP"
echo ""
echo "Silahkan masukan perintah."
echo ""
