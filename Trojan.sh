#!/bin/sh

# Download and install Trojan-go
mkdir /tmp/trojan-go
wget -O /tmp/trojan-go/trojan-go.zip https://github.com/p4gefau1t/trojan-go/releases/latest/download/trojan-go-linux-amd64.zip
unzip /tmp/trojan-go/trojan-go.zip -d /tmp/trojan-go
install -m 0755 /tmp/trojan-go/trojan-go /usr/local/bin/trojan-go

# Remove temporary directory
rm -r /tmp/trojan-go

# Trojan-go new configuration
install -d /usr/local/etc/trojan-go
cat << EOF > /usr/local/etc/trojan-go/config.yaml
run-type: server
local-addr: 0.0.0.0
local-port: $PORT
remote-addr: example.com
remote-port: 80
log-level: 5
password:
    - $PASSWORD
websocket:
  enabled: true
  path: /
transport-plugin:
  enabled: true
  type: plaintext
EOF

# Run Trojan-go
/usr/local/bin/trojan-go -config /usr/local/etc/trojan-go/config.yaml
