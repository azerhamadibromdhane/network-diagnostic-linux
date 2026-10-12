#!/usr/bin/env bash

echo "=============================="
echo "   NETWORK DIAGNOSTIC TOOL"
echo "=============================="
echo

echo "[1] Internet connectivity"
if ping -c 1 -W 2 1.1.1.1 >/dev/null 2>&1; then
    echo "ONLINE"
else
    echo "OFFLINE or connection blocked"
fi

echo
echo "[2] DNS resolution"
if getent hosts google.com >/dev/null 2>&1; then
    echo "DNS WORKING"
else
    echo "DNS FAILED"
fi

echo
echo "[3] Default gateway"
ip route | awk '/default/ {print $3; exit}'

echo
echo "[4] Ping latency"
ping -c 4 -W 2 1.1.1.1 2>/dev/null | tail -n 2

echo
echo "Diagnostic complete."
