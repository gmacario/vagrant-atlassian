#!/bin/bash

# ==================================================================================================
# Script to download and install Atlassian Confluence
#
# See also
#	https://maxlab.polito.it/confluence/x/DAAb
# ==================================================================================================

set -x

DOWNLOAD_DIR=`pwd`/tmp
#DOWNLOAD_DIR=$/Downloads

CONFLUENCE_INSTALLFILE="atlassian-confluence-5.5.2-x64.bin"
CONFLUENCE_BACKUP="backup-2014_06_03.zip"

mkdir -p ${DOWNLOAD_DIR}
cd ${DOWNLOAD_DIR}

# Install dependencies for Atlassian Confluence
# (none identified so far)

# Download Atlassian Confluence
[ ! -z "${CONFLUENCE_INSTALLFILE}" ] && if [ ! -e ${CONFLUENCE_INSTALLFILE} ]; then
    wget http://www.atlassian.com/software/confluence/downloads/binary/${CONFLUENCE_INSTALLFILE}
fi

# Download maxlab.polito.it/confluence backup
[ ! -z "${CONFLUENCE_BACKUP}" ] && if [ ! -e ${CONFLUENCE_BACKUP} ]; then
    scp gmacario@maxlab.polito.it:/var/atlassian/application-data/confluence/backups/${CONFLUENCE_BACKUP} .
fi

# Install Atlassian Confluence
sudo ${DOWNLOAD_DIR}/${CONFLUENCE_INSTALLFILE} <<__END__
o
2
/opt/atlassian/confluence
/var/atlassian/application-data/confluence
1
y
__END__

# END
