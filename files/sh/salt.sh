#!/usr/bin/env sh

if [ "$(id -u)" != "0" ]
then
	su
fi

dpkg -s salt-minion
code=$?

if [ "$code" != "0" ]
then 
	curl -L https://bootstrap.saltstack.com | sh -s -- stable
fi

sed -i 's/.*file_client:.*/file_client: local/g' /etc/salt/minion

salt-call --local state.highstate
