#!/bin/bash

# ==================================================================================================
# Script to download and install Atlassian JIRA
#
# See also
#	https://maxlab.polito.it/confluence/x/DAAb
# ==================================================================================================

set -x

DOWNLOAD_DIR=`pwd`/tmp
#DOWNLOAD_DIR=$/Downloads

JIRA_INSTALLFILE="atlassian-jira-6.3.3-x64.bin"
JIRA_BACKUP="2014-May-21--0347.zip"

mkdir -p ${DOWNLOAD_DIR}
cd ${DOWNLOAD_DIR}

# Install dependencies for Atlassian JIRA
#TODO

# Download Atlassian JIRA
[ ! -z "${JIRA_INSTALLFILE}" ] && if [ ! -e ${JIRA_INSTALLFILE} ]; then
    wget http://www.atlassian.com/software/jira/downloads/binary/${JIRA_INSTALLFILE}
fi

# Download maxlab.polito.it/jira backup
[ ! -z "${JIRA_BACKUP}" ] && if [ ! -e ${JIRA_BACKUP} ]; then
    scp gmacario@maxlab.polito.it:/var/atlassian/application-data/jira/export/${JIRA_BACKUP} .
fi

# Install Atlassian JIRA
sudo ${DOWNLOAD_DIR}/${JIRA_INSTALLFILE} <<__END__
o
2
/opt/atlassian/jira
/var/atlassian/application-data/jira
1
y
__END__

# END
