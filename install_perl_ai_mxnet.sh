#!/bin/bash

# for ubuntu 14.05 and newer, including Debian Jessie or newer
sudo apt update
sudo apt install -y build-essential libopenblas-dev liblapack-dev libopencv-dev

# download libmxnet
wget -c "https://github.com/dmlc/mxnet/archive/0.10.0.post2.tar.gz"
tar -xvzf "0.10.0.post2.tar.gz"
cd mxnet-0.10.0.post2

# build mxnet
make -j $(nproc) USE_OPENCV=1 USE_BLAS=openblas

# install mxnet module from CPAN
[[ command -v cpanm ]] && cpanm AI::MXNet

# if no cpanm
cpan AI::MXNet

echo "AI::MXNet library installed."


