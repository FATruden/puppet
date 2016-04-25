#!/bin/bash

# Example
#
# ./rsync.sh <username>@<ip_or_hostname>


RSYNC=/bin/rsync
USR_DST=$1

$RSYNC -zrvc    auth.conf \
                environments \
                fileserver.conf \
                hiera.yaml \
                hieradata \
                manifests \
                modules \
                puppet.conf.master.example \
                $USR_DST:/etc/puppet/
