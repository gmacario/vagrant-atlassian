#!/bin/sh

# Purpose: Get all backup files

set -e

if [ $# -lt 1 ]; then
    echo "Usage: $0 <vagrant_id>"
    exit 1
fi

VAGRANT_ID=$1
REMOTEDIR=/var/atlassian/application-data/confluence/temp

vagrant ssh-config ${VAGRANT_ID} >tmp-sshconfig

#ssh -F tmp-sshconfig atlassian ls -la /var/atlassian/application-data/confluence/backups
#ssh -F tmp-sshconfig atlassian ls -la ${REMOTEDIR}

ssh -F tmp-sshconfig atlassian ls ${REMOTEDIR} >tmp-files
for f in $(cat tmp-files); do
    scp -F tmp-sshconfig atlassian:${REMOTEDIR}/${f} .
done
# TODO: rsync -avz xxx .

rm -f tmp-sshconfig
rm -f tmp-files

# EOF
