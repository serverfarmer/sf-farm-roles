#!/bin/sh
. /opt/farm/scripts/init


if [ "$1" = "" ]; then
	echo "usage: $0 <list>"
	exit
fi

lists=/opt/farm/ext/farm-roles/lists/$OSVER
list=$1

if [ -f $lists/$list ]; then
	for p in `cat $lists/$list`; do
		/opt/farm/ext/packages/utils/install.sh $p
	done
fi

if [ -f $lists/$list.purge ]; then
	for p in `cat $lists/$list.purge`; do
		/opt/farm/ext/packages/utils/uninstall.sh $p
	done
fi

if [ -f $lists/$list.cpan ]; then
	for p in `cat $lists/$list.cpan`; do
		/opt/farm/ext/packages/utils/install-cpan.sh $p
	done
fi
