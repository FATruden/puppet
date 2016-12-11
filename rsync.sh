#!/bin/bash

# Example
#
# ./rsync.sh <username>@<ip_or_hostname>


RSYNC=/bin/rsync
USR_DST=$1

echo "  => Syncing 'manifests' and 'modules'"
$RSYNC -zrvc --delete \
modules/chrony \
modules/common \
modules/configs \
modules/dnsmasq \
modules/docker \
modules/openvpn \
modules/packages \
modules/puppet \
modules/repos \
modules/ssh \
$USR_DST:/etc/puppetlabs/code/environments/production/modules/

$RSYNC -zrvc --delete \
manifests \
$USR_DST:/etc/puppetlabs/code/environments/production/

$RSYNC -zrvc --delete \
sync_env.pp \
$USR_DST:/etc/puppetlabs/code/
