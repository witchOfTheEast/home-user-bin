#!/bin/bash
# Creates a folder /Volumes/<USERNAME> and mount //<NETWORKSHARE>/Users/<USERNAME>

echo "LOGNAME is: ${LOGNAME}"

if [[ ! -d /Volumes/${LOGNAME} ]]; then
    mkdir /Volumes/${LOGNAME}
fi

/sbin/mount_smbfs //uifs1/Users/${LOGNAME} /Volumes/${LOGNAME}
