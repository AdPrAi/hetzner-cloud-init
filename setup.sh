#!/bin/bash

TOKEN="$1"
WHITELIST_S="$2"

apt install -y jq ufw fail2ban

curl -o /usr/local/bin/update-ufw.sh https://raw.githubusercontent.com/vitobotta/hetzner-cloud-init/master/update-ufw.sh

chmod +x /usr/local/bin/update-ufw.sh

cat <<EOF > /root/crontab
* * * * * /usr/local/bin/update-ufw.sh ${TOKEN} ${WHITELIST}
EOF

crontab /root/crontab