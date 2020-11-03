#!/bin/bash
if [ 0 == 1 ];then
    sh_exec=$(ls -lh /bin/sh | awk '{print $11}')
    export TOP_DIRECTOR=$(pwd)
    if [ "x"$sh_exec != "xbash" ];then
        sudo rm /bin/sh
        sudo ln -s /bin/bash /bin/sh
    fi
fi
source ./local.cfg
which ${CROSS_COMPILER_PREFIX}-gcc
if [ $? == 0 ];then
    SYSROOT=$(${CROSS_COMPILER_PREFIX}-gcc -print-sysroot)
fi
if [ ! -d build ];then
    mkdir build
fi

if [ ! -f common/build_$1.sh ];then
    echo './build.sh init|make'
    exit -1
fi
echo " start $1..."
    common/build_$1.sh $2
echo " end $1..."
if [ ! -d resource/hidoo ];then
    mkdir resource/hidoo
fi
