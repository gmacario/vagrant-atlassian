#!/bin/bash
# =============================================================================
# Script to download and install Atlassian Confluence
# =============================================================================

DOWNLOAD_DIR="$PWD/tmp"
#DOWNLOAD_DIR=$/Downloads

CONFLUENCE_INSTALLFILE="atlassian-confluence-5.7-x64.bin"
CONFLUENCE_BACKUP="backup-2015_02_03.zip"

set -e

if [ `whoami` != root ]; then
    SUDO=sudo
else
    SUDO=""
fi

mkdir -p ${DOWNLOAD_DIR}
cd ${DOWNLOAD_DIR}

# Install dependencies for Atlassian Confluence
# (none identified so far)

[ ! -z "${CONFLUENCE_INSTALLFILE}" ] && if [ ! -e ${CONFLUENCE_INSTALLFILE} ]; then
    echo "INFO: Downloading ${CONFLUENCE_INSTALLFILE}"
    wget http://www.atlassian.com/software/confluence/downloads/binary/${CONFLUENCE_INSTALLFILE}
    chmod 755 ${CONFLUENCE_INSTALLFILE}
fi

cd -

echo "INFO: Installing ${CONFLUENCE_INSTALLFILE}"
${SUDO} ${DOWNLOAD_DIR}/${CONFLUENCE_INSTALLFILE} <<__END__
o
2
/opt/atlassian/confluence
/var/atlassian/application-data/confluence
1
y
__END__

# Ensure that Confluence is automatically restarted even if running inside
# Docker container gmacario/baseimage:0.9.15 (where `/sbin/my_init` runs as PID 1)
echo "INFO: Installing /etc/service/confluence/run"
cat >/tmp/run <<__END__
#!/bin/sh
set -e
cd "/opt/atlassian/confluence/bin"
exec ./start-confluence.sh -fg
__END__
${SUDO} install -m 755 -d /etc/service/confluence/
${SUDO} install -m 755 /tmp/run /etc/service/confluence/

if [ ! -z "${CONFLUENCE_BACKUP}" ]; then
    echo "INFO: Preparing restore of ${CONFLUENCE_BACKUP}..."
    ${SUDO} mkdir -p /var/atlassian/application-data/confluence/restore
    ${SUDO} chown confluence /var/atlassian/application-data/confluence/restore
    ${SUDO} cp ${DOWNLOAD_DIR}/${CONFLUENCE_BACKUP} /var/atlassian/application-data/confluence/restore/
fi

# END
