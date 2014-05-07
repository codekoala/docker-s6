FROM codekoala/arch
MAINTAINER Josh VanderLinden <codekoala@gmail.com>

ADD install.sh /install.sh
RUN /install.sh

CMD ["/usr/bin/s6-svscan", "/services"]
