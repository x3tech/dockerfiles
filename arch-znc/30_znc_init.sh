#!/bin/bash
if [ "$1" != "start" ]; then
    exit 0;
fi

ZNC_DATA_PATH="/var/lib/znc/"
ZNC_CONFIG_FILE="${ZNC_DATA_PATH}/configs/znc.conf"
ZNC_ADMIN_SALT="$(dd if=/dev/urandom | tr -dc _A-Z-a-z-0-9 | head -c20)"
ZNC_ADMIN_HASH="sha256#$(echo -n ${ZNC_ADMIN_PASS}${ZNC_ADMIN_SALT} | sha256sum | awk '{print $1}')#$ZNC_ADMIN_SALT#"

# Create ZNC config folder
mkdir -p $(dirname "${ZNC_CONFIG_FILE}";)

# Generate PEM file
znc -p -d $ZNC_DATA_PATH

# Generate config file (No IPv6, not supported by Docker)
cat > $ZNC_CONFIG_FILE <<EOF
Version = 1.2
<Listener l>
	Port = 6697
	IPv4 = true
	IPv6 = false
	SSL = true
</Listener>
LoadModule = webadmin

<User $ZNC_ADMIN_USER>
    Pass       = ${ZNC_ADMIN_HASH}
	Admin      = true
	Nick       = ${ZNC_ADMIN_USER}
	AltNick    = ${ZNC_ADMIN_USER}_
	Ident      = ${ZNC_ADMIN_USER}
	RealName   = ${ZNC_ADMIN_USER}
	Buffer     = 50
	AutoClearChanBuffer = true
	ChanModes  = +stn
</User>
EOF

chown -R znc:znc $ZNC_DATA_PATH
echo "ZNC config generated, self destructing..."
rm $0
