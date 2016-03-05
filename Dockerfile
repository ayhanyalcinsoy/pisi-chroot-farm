#ertugerata/pisi-chroot-farm
FROM ayhanyalcinsoy/pisi-chroot-32bit
MAINTAINER Ayhan Yalçınsoy <ayhanyalcinsoy@pisilinux.org>

RUN service dbus start && pisi cp && pisi ar pisi-32bit https://dl.dropboxusercontent.com/u/71120717/i686/pisi-index.xml.xz \
    && pisi it --ignore-safety --ignore-dependency autoconf autogen automake binutils bison flex gawk gc gcc gnuconfig \
    guile libmpc libtool-ltdl libtool lzo m4 make mpfr pkgconfig yacc glibc-devel && service dbus stop

RUN pisi dc &&  rm -rf /usr/share/man \
                       /usr/share/doc \
                       /usr/share/gtk-doc \
                       /usr/share/locale/[a-d][f-z]* \
                       /usr/share/locale/e[a-m,o-z]*

RUN pisi ar core https://github.com/pisilinux/core/raw/master/pisi-index.xml.xz && pisi ar main https://github.com/pisilinux/main/raw/master/pisi-index.xml.xz --at 2

WORKDIR /root
