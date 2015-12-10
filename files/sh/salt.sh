#!/usr/bin/env sh
set -eu
if [ "$(id -u)" != "0" ]
then
	echo "Must run as root!"
	exit 1
fi

sed -i 's/^[ ]*deb cdrom.*//g' /etc/apt/sources.list

apt-get update && apt-get install -y curl

set +e
dpkg -s salt-minion
code=$?
set -e

if [ "$code" != "0" ]
then 
	curl -L https://bootstrap.saltstack.com | sh -s -- stable
fi

sed -i 's/.*file_client:.*/file_client: local/g' /etc/salt/minion

salt-call --local state.highstate
