#!/bin/sh
# Purpose: Restore {Confluence, JIRA} backups from tarball/Clonezilla image

#set -x
set -e

if [ `whoami` != root ]; then
    echo This script has to be run as root
    exit 1
fi

# OPTION 1: RESTORE FILES FROM A TARBALL

if [ ! -e /tmp/sdc1/BACKUP ]; then
    mkdir -p /tmp/sdc1
    mount -o ro /dev/sdc1 /tmp/sdc1
fi

#tar tvfz /tmp/sdc1/BACKUP/20140805-bk-mv-linux-powerhorse-opt.tar.gz | less
#tar tvfz /tmp/sdc1/BACKUP/20140805-bk-mv-linux-powerhorse-scratch.tar.gz

#tar tvz -C tmp -f /tmp/sdc1/BACKUP/20140805-bk-mv-linux-powerhorse-opt.tar.gz \
#	./atlassian/confluence/backup \
#	./atlassian/jira/backup

# OPTION 2: RESTORE FILES FROM A CLONEZILLA IMAGE
# See http://blog.christosoft.de/2012/05/mount-clonezilla-image-to-restore-single-file-browse/

CLONEZILLA_BKDIR=/tmp/sdc1/CLONEZILLA/2014-08-04-15-img_mv-linux-powerhorse
BIGTMPDIR=/tmp/sdb1/tmp
RESTOREIMG=${BIGTMPDIR}/sdd1-restore.img
MOUNTPOINT=/tmp/oldsdd1

if [ ! -e /tmp/sdc1/CLONEZILLA ]; then
    mkdir -p /tmp/sdc1
    mount -o ro /dev/sdc1 /tmp/sdc1
fi

which clonezilla >/dev/null || sudo apt-get -y install clonezilla

#sudo ls -la ${CLONEZILLA_BKDIR}

# Convert the clonezilla-image into an .img file

if [ ! -e ${RESTOREIMG} ]; then
    echo INFO: Restoring partition to ${RESTOREIMG}
    mkdir -p ${BIGTMPDIR}
    sudo cat ${CLONEZILLA_BKDIR}/sdd1.ext4-ptcl-img.gz.* \
	| sudo gzip -dc \
	| sudo partclone.restore -C -s - -O ${RESTOREIMG}
fi

if [ ! -e ${MOUNTPOINT}/vmlinuz ]; then
    echo INFO: Mount image to ${MOUNTPOINT}
    mkdir -p ${MOUNTPOINT}
    sudo mount -o ro,loop -t ext4 ${RESTOREIMG} ${MOUNTPOINT}
fi
echo INFO: You can access old partition under ${MOUNTPOINT}

CONFLUENCE_BKDIR=/var/atlassian/application-data/confluence/backups
CONFLUENCE_BKFILE=backup-2014_07_30.zip
#ls -la ${MOUNTPOINT}/${CONFLUENCE_BKDIR}

if [ ! -e ${CONFLUENCE_BKDIR} ]; then
    mkdir -p ${CONFLUENCE_BKDIR}
    #chown confluence.root ${CONFLUENCE_BKDIR}
fi
echo INFO: Restoring Confluence backup ${CONFLUENCE_BKFILE} to ${CONFLUENCE_BKDIR}
cp ${MOUNTPOINT}/${CONFLUENCE_BKDIR}/${CONFLUENCE_BKFILE} ${CONFLUENCE_BKDIR}

JIRA_BKDIR=/var/atlassian/application-data/jira/export
JIRA_BKFILE=2014-Aug-04--1041.zip
#ls -la ${MOUNTPOINT}/${JIRA_BKDIR}

if [ ! -e ${JIRA_BKDIR} ]; then
    mkdir -p ${JIRA_BKDIR}
    #chown jira.root ${JIRA_BKDIR}
fi
echo INFO: Restoring JIRA backup ${JIRA_BKFILE} to ${JIRA_BKDIR}
cp ${MOUNTPOINT}/${JIRA_BKDIR}/${JIRA_BKFILE} ${JIRA_BKDIR}

# Unmount images
sudo umount ${MOUNTPOINT}
sudo rm -f ${RESTOREIMG}

# EOF
