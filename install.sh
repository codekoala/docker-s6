#!/bin/bash

# install instarch repository
cat >> /etc/pacman.conf <<EOT
[instarch]
Server = http://instarch.codekoala.com/\$arch/
EOT

# accept instarch key
pacman-key -r 051680AC
pacman-key --lsign-key 051680AC

# install a pre-made s6 package
pacman -Sqyu --noconfirm --needed --noprogressbar s6

# setup a services directory
SVDIR=/services/.s6-svscan
mkdir -p ${SVDIR}
echo "#!/bin/bash" > ${SVDIR}/finish
echo "#!/bin/bash" > ${SVDIR}/crash
chmod +x ${SVDIR}/{finish,crash}

# clean up the package cache
rm -rf /var/cache/pacman/* /install.sh
