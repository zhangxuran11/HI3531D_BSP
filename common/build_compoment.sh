#!/bin/sh
pushd build
if [ ! -d my_software_set ];then
    git clone https://github.com/zhangxuran11/my_software_set.git
    if [ $? != 0 -a -d my_software_set ];then
        rm my_software_set -r
    fi
fi
pushd my_software_set

export ROOTFS=${TOP_DIRECTOR}/resource/hidoo_third_soft
if [ ! -d  $ROOTFS ];then
    mkdir $ROOTFS -p
fi
if [ "x$ROOTFS" == "x" ];then
    export ROOTFS=${TOP_DIRECTOR}/build/out/rootfs
fi
./build.sh $1
popd

popd
