#!/bin/bash

# ==================================================================================================
# Script to download and install Atlassian Confluence
#
# See also
#	http://maxlab.polito.it/confluence/display/~gmacario/Configuration+of+mv-linux-powerhorse
# ==================================================================================================

set -x

DOWNLOAD_DIR=`pwd`/tmp
#DOWNLOAD_DIR=$/Downloads

CONFLUENCE_INSTALLFILE="atlassian-confluence-5.4.4-x64.bin"
CONFLUENCE_BACKUP="backup-2014_04_28.zip"

mkdir -p ${DOWNLOAD_DIR}
cd ${DOWNLOAD_DIR}

# Install dependencies for Atlassian Confluence
#TODO

# Download Atlassian Confluence
[ ! -z "${CONFLUENCE_INSTALLFILE}" ] && if [ ! -e ${CONFLUENCE_INSTALLFILE} ]; then
    wget http://www.atlassian.com/software/confluence/downloads/binary/${CONFLUENCE_INSTALLFILE}
fi

# Download maxlab.polito.it/confluence backup
[ ! -z "${CONFLUENCE_BACKUP}" ] && if [ ! -e ${CONFLUENCE_BACKUP} ]; then
    scp gmacario@maxlab.polito.it:/var/atlassian/application-data/confluence/backups/${CONFLUENCE_BACKUP} .
fi

# Install Atlassian Confluence
sudo ${DOWNLOAD_DIR}/${CONFLUENCE_INSTALLFILE}

# END
