#!/bin/bash
source common/common.sh
which mkimage
if [ $? != 0 ];then
    sudo apt install u-boot-tools
fi
which mkimage
if [ $? != 0 ];then
    echo 无法找到mkimage
    exit 0
fi
pushd build/${HI3531D_SDK}/osdrv/opensource/kernel
check_and_get_source_package "linux-3.18.20.tar.gz" "https://mirrors.edge.kernel.org/pub/linux/kernel/v3.x/linux-3.18.20.tar.gz" "77b9bcb33bfe506ca17446fd9689a536384e19b30f198c7a5b37d228f6c8e0b7"
popd
#cp resource/SDK/himm.c build/${HI3531D_SDK}/osdrv/tools/board/reg-tools-1.0.0/source/tools/himm.c
pushd build/${HI3531D_SDK}/osdrv/
OSDRV_CROSS=${CROSS_COMPILER_PREFIX} make
popd
#pushd build/${HI3531D_SDK}/osdrv/tools/board/gdb
#make
#popd

#cp resource/SDK/${HI3531D_SDK}/mpp/sample/* build/${HI3531D_SDK}/mpp/sample/ -rfd
#pushd build/${HI3531D_SDK}/mpp/sample/vio
#make
#popd
