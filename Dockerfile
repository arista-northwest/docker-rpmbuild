FROM fedora:latest

RUN dnf -y install \
    mock \
    rpm-build \
    rpmdevtools \
    sudo \
    python2 && \
    dnf clean all

RUN useradd -m rpmbuild && \
    echo "rpmbuild ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/rpmbuild

USER rpmbuild
# WORKDIR /home/rpmbuild

VOLUME project
WORKDIR /project

CMD ["/bin/bash"]
