# Container image that runs your code
FROM quay.io/rockylinux/rockylinux:9.5

RUN dnf -y install gcc-toolset-14-toolchain
