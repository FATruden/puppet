#!/bin/bash

if $(rpm -q puppetserver > /dev/null)
then
    echo is_puppetserver=true
else
    echo is_puppetserver=false
fi
