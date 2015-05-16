#ertugerata/pisi-chroot-farm
FROM ertugerata/pisi-chroot-base
MAINTAINER Ertuğrul Erata <ertugrulerata@gmail.com>

RUN service dbus start && pisi lp && pisi cp && pisi ar ilker http://manap.se/pisi/pisi-index.xml.xz \
    && pisi ar farm http://farm.pisilinux.org/.nofarm-repo/x86_64/pisi-index.xml.xz --at 2 \ 
    && pisi ur && pisi it --ignore-safety --ignore-dependency autoconf autogen automake binutils bison flex gawk gc gcc gmp gnuconfig \
    guile libmpc libtool-ltdl libtool lzo m4 make mpfr pkgconfig yacc glibc-devel && service dbus stop

RUN pisi dc

RUN rm -rf /usr/share/man \
           /usr/share/doc \
           /usr/share/gtk-doc \
           /usr/share/locale/[a-d][f-z]* \
           /usr/share/locale/e[a-m,o-z]* 
           
RUN pisi ar github https://github.com/ertugerata/PisiLinux/raw/Pisi-2.0/pisi-index.xml.xz && pisi ur

WORKDIR /root
