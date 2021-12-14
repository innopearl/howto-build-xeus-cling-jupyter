#!/bin/bash

export INSTALL_PREFIX=TBD
#export PATH=${CLING_ROOT}/cling-build/builddir/bin/:$PATH

#wget https://github.com/Kitware/CMake/releases/download/v3.17.2/cmake-3.17.2.tar.gz
#tar -xvf ./cmake-3.17.2.tar.gz
#cd  cmake-3.17.2 && ./configure && make -j24 && make install
#cd ../

# json
git clone -b v3.7.3 https://github.com/nlohmann/json.git --depth 1
cd json && mkdir build && cd build && cmake ../ -D CMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} && make -j24 && make install
cd ../../

# xtl
git clone -b 0.6.13 https://github.com/xtensor-stack/xtl.git --depth 1
cd xtl && mkdir build && cd build && cmake ../ -D CMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} && make -j24 && make install
cd ../../

# openssl
git clone -b OpenSSL_1_1_1g https://github.com/openssl/openssl.git --depth 1
cd openssl && ./config --prefix=${INSTALL_PREFIX} && make -j24 && make test && make install
cd ../

# libzmq
git clone -b v4.3.2 https://github.com/zeromq/libzmq.git --depth 1
cd libzmq && mkdir build && cd build && cmake ../ -D CMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} && make -j24 && make install
cd ../../

# cppzmq
git clone -b v4.3.0 https://github.com/zeromq/cppzmq.git --depth 1
cd cppzmq && mkdir build && cd build && cmake ../ -D CMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} && make -j24 && make install
cd ../../

# install xeus
git clone -b 0.23.3 https://github.com/jupyter-xeus/xeus.git --depth 1
cd xeus && mkdir build && cd build && \
    cmake -D CMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} -D CMAKE_BUILD_TYPE=Release ../ && make -j24 && make install
cd ../../

git clone -b v1.8.1 https://github.com/zeux/pugixml.git --depth 1
cd pugixml && mkdir build && cd build && \
    cmake \
        -D CMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} \
        -D CMAKE_BUILD_TYPE=Release \
        -D BUILD_SHARED_LIBS=ON \
        ../ && \
    make -j24 && make install
cd ../../

# install cxxopts
git clone -b v2.1.1 https://github.com/jarro2783/cxxopts --depth 1
cd cxxopts && mkdir build && cd build && cmake -D CMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} ../ && make -j24 && make install
cd ../../

git clone -b 0.8.1 https://github.com/jupyter-xeus/xeus-cling.git --depth 1
cd xeus-cling && mkdir build && cd build && \
    cmake \
        -D CMAKE_INSTALL_PREFIX=${INSTALL_PREFIX} \
        -DCMAKE_BUILD_TYPE=Release \
        ../ && \
    make -j24 && make install
#        -DDOWNLOAD_GTEST=ON \
