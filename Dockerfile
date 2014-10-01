FROM codekoala/arch
MAINTAINER Josh VanderLinden <codekoala@gmail.com>

RUN pacman -Sqyu --noconfirm --needed --noprogressbar s6

# setup a services directory
ADD finish /services/.s6-svscan/finish
ADD crash /services/.s6-svscan/crash

CMD ["/usr/bin/s6-svscan", "/services"]
