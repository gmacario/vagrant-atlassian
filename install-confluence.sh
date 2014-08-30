#!/bin/bash
# ==================================================================================================
# Script to download and install Atlassian Confluence
#
# See also
#	https://maxlab.polito.it/confluence/x/DAAb
# ==================================================================================================

#set -x

DOWNLOAD_DIR=`pwd`/tmp
#DOWNLOAD_DIR=$/Downloads

CONFLUENCE_INSTALLFILE="atlassian-confluence-5.5.6-x64.bin"
CONFLUENCE_BACKUP="backup-2014_07_10.zip"

mkdir -p ${DOWNLOAD_DIR}
cd ${DOWNLOAD_DIR}

# Install dependencies for Atlassian Confluence
# (none identified so far)

[ ! -z "${CONFLUENCE_INSTALLFILE}" ] && if [ ! -e ${CONFLUENCE_INSTALLFILE} ]; then
    echo "INFO: Downloading ${CONFLUENCE_INSTALLFILE}"
    wget http://www.atlassian.com/software/confluence/downloads/binary/${CONFLUENCE_INSTALLFILE}
    chmod 755 ${CONFLUENCE_INSTALLFILE}
fi

# Download maxlab.polito.it/confluence backup
[ ! -z "${CONFLUENCE_BACKUP}" ] && if [ ! -e ${CONFLUENCE_BACKUP} ]; then
    echo "INFO: Downloading ${CONFLUENCE_BACKUP}"
    scp gmacario@maxlab.polito.it:/var/atlassian/application-data/confluence/backups/${CONFLUENCE_BACKUP} .
fi

if [ `whoami` != root ]; then
    SUDO=sudo
else
    SUDO=""
fi

echo "INFO: Installing ${CONFLUENCE_INSTALLFILE}"
${SUDO} ${DOWNLOAD_DIR}/${CONFLUENCE_INSTALLFILE} <<__END__
o
2
/opt/atlassian/confluence
/var/atlassian/application-data/confluence
1
y
__END__

if [ ! -z "${CONFLUENCE_BACKUP}" ]; then
    echo "INFO: Preparing restore of ${CONFLUENCE_BACKUP}..."
    ${SUDO} mkdir -p /var/atlassian/application-data/confluence/restore
    ${SUDO} chown confluence /var/atlassian/application-data/confluence/restore
    ${SUDO} cp ${DOWNLOAD_DIR}/${CONFLUENCE_BACKUP} /var/atlassian/application-data/confluence/restore/
fi

# END
