#!/bin/sh

# if 'masternodeprivkey' or 'externalip' does not exist it should just stop

if [ -z ${masternodeprivkey+x} ]; then
	echo "'masternodeprivkey' is unset"
	exit 1
fi
if [ -z ${externalip+x} ]; then
	echo "'externalip' is unset"
	exit 1
fi

# conf

USERNAME=$(pwgen -s 16 1)
PASSWORD=$(pwgen -s 64 1)

mkdir ~/.chaincoin

cat << EOF > ~/.chaincoin/chaincoin.conf
rpcuser=$USERNAME
rpcpassword=$PASSWORD
rpcallowip=127.0.0.1
server=1
listen=1
masternode=1
masternodeprivkey=$masternodeprivkey
masternodeaddr=$externalip:11994
EOF

cat << EOF > ~/check.sh
chaincoind getinfo
chaincoind masternodelist status $externalip
chaincoind masternodelist activeseconds $externalip
EOF

chmod 755 check.sh

# daemon

chaincoind --daemon

tail -f /dev/null