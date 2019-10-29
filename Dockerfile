FROM centos:7

# rpm-build rpm-devel rpmlint make python bash coreutils diffutils patch rpmdevtools
RUN \
    yum -y install \
    mock \
    rpm-build \
    rpmdevtools \
    sudo \
    python2 \
    python-setuptools
    # && \
    #dnf clean all

RUN \
    useradd -m rpmbuild && \
    echo "rpmbuild ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/rpmbuild

USER rpmbuild

RUN rpmdev-setuptree 
    # && \
    #echo '%_topdir %(echo $HOME)/rpmbuild' > ~/.rpmmacros

# WORKDIR /home/rpmbuild

VOLUME project
WORKDIR /project

CMD ["/bin/bash"]
