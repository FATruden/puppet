#!/bin/bash

# Example
#
# ./rsync.sh <username>@<ip_or_hostname>


RSYNC=/bin/rsync
USR_DST=$1

echo "  => Syncing 'manifests' and 'modules'"
$RSYNC -zrvc --delete \
modules \
$USR_DST:/var/lib/docker/data/puppetserver/environments/production/

$RSYNC -zrvc --delete \
manifests \
$USR_DST:/var/lib/docker/data/puppetserver/environments/production/
