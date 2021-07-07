FROM ubuntu:latest
RUN apt-get -y update
RUN apt-get -y install xorg xterm gcc sudo vim
RUN apt-get -y install sssd acl
RUN apt-get -y install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
RUN apt-get -y install curl emacs
WORKDIR /opt
RUN curl -L https://repo.anaconda.com/archive/Anaconda3-2021.05-Linux-x86_64.sh -o Anaconda3-2021.05-Linux-x86_64.sh
RUN bash Anaconda3-2021.05-Linux-x86_64.sh -b -p /opt/Anaconda3
RUN rm  Anaconda3-2021.05-Linux-x86_64.sh 
RUN apt-get -y install proj-bin libgeos-dev
RUN apt-get -y install pkg-config
RUN apt-get -y upgrade
RUN apt-get -y install g++ libsqlite3-dev sqlite3 libtiff-dev libproj-dev  cmake
RUN curl  -L https://download.osgeo.org/proj/proj-8.1.0.tar.gz -o f.tar.gz
RUN tar xf f.tar.gz 
WORKDIR /opt/proj-8.1.0/
RUN eval "$(/opt/Anaconda3/bin/conda shell.bash hook)" ; \
	conda init ; \
	./configure --disable-dependency-tracking ; \ 
	make  ; \
	make install ;\
	pip install cartopy ;\
	pip install sora-astro

RUN eval "$(/opt/Anaconda3/bin/conda shell.bash hook)" ; \
	conda init ; \
	pip install vos

RUN apt-get -y install git
# nsswitch for correct sss lookup
WORKDIR /

ADD src/nsswitch.conf /etc/
ADD bin/* /usr/local/bin/
RUN echo "[ -f /opt/Anaconda3/etc/profile.d/conda.sh ] && . /opt/Anaconda3/etc/profile.d/conda.sh" >> /etc/bash.bashrc
RUN echo "conda activate" >> /etc/bash.bashrc
RUN useradd -m jkavelaars
USER jkavelaars
