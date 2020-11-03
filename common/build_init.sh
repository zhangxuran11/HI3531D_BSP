#!/bin/bash
which ${CROSS_COMPILER_PREFIX}-gcc
if [ $? != 0 ];then
    pushd SDK_package

    if [ -d ${CROSS_COMPILER_PREFIX} ];then
        rm ${CROSS_COMPILER_PREFIX} -rf
    fi
    tar -xvf ${CROSS_COMPILER_PREFIX}.tgz
    pushd ${CROSS_COMPILER_PREFIX}
    chmod +x ./${CROSS_COMPILER_PREFIX}.install
    sudo ./${CROSS_COMPILER_PREFIX}.install
    sudo apt install lib32z1 lib32ncurses5 cmake lib32stdc++6 u-boot-tools
    echo please input : source /etc/profile
    popd
    rm ${CROSS_COMPILER_PREFIX} -rf
    popd #SDK_package
fi
which gcc
if [ $? != 0 ];then
    sudo apt install gcc
fi
which g++
if [ $? != 0 ];then
    sudo apt install g++
fi
if [ ! -d build/${HI3531D_SDK} ];then
    tar -xvf SDK_package/${HI3531D_SDK}.tgz -C build/
    pushd build/${HI3531D_SDK}
    sed  -i "s/\/bin\/sh/\/bin\/bash/g" ./sdk.unpack
    ./sdk.unpack
    popd #build/${HI3531D_SDK} 
fi

#pushd resource
#if [ ! -d hidoo_third_soft ];then
#    tar xzf hidoo_third_soft.tgz hidoo_third_soft
#fi
#if [ ! -d nova ];then
#    tar xzf nova.tgz nova
#fi
#popd
