#!/bin/bash

# Example
#
# ./rsync.sh <username>@<ip_or_hostname>


RSYNC=/bin/rsync
USR_DST=$1

$RSYNC -zrvc manifests modules $USR_DST:/etc/puppetlabs/code/environments/production/
