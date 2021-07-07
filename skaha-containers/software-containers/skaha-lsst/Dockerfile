FROM lsstsqre/centos:7-stack-lsst_distrib-v19_0_0
USER root
# install git-lfs using package cloud
RUN yum -y install sudo.x86_64
RUN curl -s https://packagecloud.io/install/repositories/github/git-lfs/script.rpm.sh | sudo bash
RUN yum -y install git-lfs

# install ds9, no packages
RUN curl https://ds9.si.edu/download/centos7/ds9.centos7.8.2.1.tar.gz | tar -zx -f - -C /usr/bin/

# install the SSSD-CLIENT needed by Arcade ?
RUN yum install -y sssd-client acl

# need an xterm at least
RUN yum -y install xterm 

# install sextractor
RUN yum -y install atlas-devel
RUN yum -y install fftw-devel
RUN yum -y install autoconf
RUN yum -y install automake
RUN yum -y install libtool
WORKDIR "tmp"
RUN curl -L https://github.com/astromatic/sextractor/archive/refs/tags/2.25.0.tar.gz -o 2.25.0.tar.gz
RUN tar xvf 2.25.0.tar.gz 
WORKDIR "sextractor-2.25.0"
RUN sh autogen.sh
RUN ./configure 
RUN make
RUN make install


# system settings and permissions
COPY src/nofiles.conf /etc/security/limits.d/

## see https://bugzilla.redhat.com/show_bug.cgi?id=1773148
RUN touch /etc/sudo.conf && echo "Set disable_coredump false" > /etc/sudo.conf

# generate missing dbus uuid (issue #47)

ADD nsswitch.conf /etc/
COPY src/start_lsst.sh /etc/profile.d/

RUN source /etc/profile.d/start_lsst.sh; conda install scikit-image numba tk
RUN source /etc/profile.d/start_lsst.sh; yum -y install parallel

# USER lsst
CMD [ "bash" ]

