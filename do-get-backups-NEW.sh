#!/bin/sh

# Purpose: Get all Confluence backup files

#set -x
set -e

if [ $# -lt 1 ]; then
    echo "Usage: $0 <vagrant_id>"
    exit 1
fi

VAGRANT_ID=$1
REMOTEDIR=/var/atlassian/application-data/confluence/backups
LOCALDIR=${PWD}/tmp/BK_confluence
TMPDIR=${PWD}/tmp

echo "INFO: Saving Confluence backups from VM $1 to ${LOCALDIR}"
mkdir -p ${TMPDIR}/
vagrant ssh-config ${VAGRANT_ID} >${TMPDIR}/sshconfig

#ssh -F tmp-sshconfig atlassian ls -la /var/atlassian/application-data/confluence/backups
#ssh -F tmp-sshconfig atlassian ls -la ${REMOTEDIR}

[ ! -e "${LOCALDIR}" ] && mkdir -p ${LOCALDIR}/

ssh -F ${TMPDIR}/sshconfig atlassian ls ${REMOTEDIR} >${TMPDIR}/filelist
for f in $(cat ${TMPDIR}/filelist); do
    if [ -e ${LOCALDIR}/${f} ]; then
        echo "DEBUG: File $f exists - skipping";
    else
        scp -F ${TMPDIR}/sshconfig atlassian:${REMOTEDIR}/${f} ${LOCALDIR}/
    fi
done
# TODO: rsync -avz xxx .

#rm -f ${TMPDIR}/sshconfig
#rm -f ${TMPDIR}/filelist

# EOF
