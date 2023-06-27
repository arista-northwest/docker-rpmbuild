FROM centos:7

ENV PYTHON=3.9.14

# rpm-build rpm-devel rpmlint make python bash coreutils diffutils patch rpmdevtools
RUN \
    yum -y install \
    mock \
    rpm-build \
    rpmdevtools \
    sudo \
    python2 \
    wget \ 
    python-setuptools \
    openssl-devel bzip2-devel libffi-devel

RUN \ 
    yum -y groupinstall 'Development Tools'

RUN \
    wget https://www.python.org/ftp/python/${PYTHON}/Python-${PYTHON}.tar.xz && \
    tar xf Python-${PYTHON}.tar.xz && \
    cd Python-${PYTHON} && \
    ./configure --enable-optimizations --enable-shared && \
    make altinstall && \
    ln -s /usr/local/bin/python$(echo ${PYTHON} | cut -d'.' -f 1,2) /usr/bin/python3 && \
    cd ~

ENV LD_LIBRARY_PATH=/lib:/usr/lib:/usr/local/lib
RUN \
    useradd -m rpmbuild && \
    echo "rpmbuild ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/rpmbuild

USER rpmbuild

RUN rpmdev-setuptree 

VOLUME /project
WORKDIR /project

CMD ["/bin/bash"]
