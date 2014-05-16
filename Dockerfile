FROM codekoala/arch
MAINTAINER Josh VanderLinden <codekoala@gmail.com>

# install instarch repository and key
RUN echo -e "[instarch]\nServer = http://instarch.codekoala.com/\$arch/" >> /etc/pacman.conf && \
    pacman-key -r 051680AC && \
    pacman-key --lsign-key 051680AC

RUN pacman -Sqyu --noconfirm --needed --noprogressbar s6

# setup a services directory
ADD finish /services/.s6-svscan/finish
ADD crash /services/.s6-svscan/crash
ADD run /usr/bin/run

CMD ["/usr/bin/run"]
