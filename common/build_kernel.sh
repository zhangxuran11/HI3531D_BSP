#!/bin/bash

pushd ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/opensource/kernel/linux-3.18.y/
if [ -d ${TOP_DIRECTOR}/resource/kernel/${KERNEL_CONFIG} ];then
    cp ${TOP_DIRECTOR}/resource/kernel/${KERNEL_CONFIG} arch/arm/configs/
fi
if [ "x"$1 != "x" ];then
  case $1 in
    clean)
        make ARCH=arm CROSS_COMPILE=${CROSS_COMPILER_PREFIX}- distclean
        exit 0
        ;;
    force)
        echo 'kernel distclean ...'
        make ARCH=arm CROSS_COMPILE=${CROSS_COMPILER_PREFIX}- distclean
        ;;
    *)
        echo './build.sh clean|force'
  esac

fi
if [ -f ${TOP_DIRECTOR}/resource/kernel/${KERNEL_CONFIG} ];then
    cp ${TOP_DIRECTOR}/resource/kernel/${KERNEL_CONFIG} arch/arm/configs/
fi
cp ${TOP_DIRECTOR}/resource/kernel/hi3531d.dtsi arch/arm/boot/dts/      
if [ -f ${TOP_DIRECTOR}/resource/kernel/${KERNEL_DTS} ];then
    cp ${TOP_DIRECTOR}/resource/kernel/${KERNEL_DTS} arch/arm/boot/dts/hi3531d-demb.dts
fi
cp ${TOP_DIRECTOR}/resource/kernel/at803x.c drivers/net/phy/  #v2.0.4.0/v1.0.3.0双版本通用
if [ $? != 0 ];then
    echo "cp higmac.c 失败!!"
    exit 1
fi
make ARCH=arm CROSS_COMPILE=${CROSS_COMPILER_PREFIX}- ${KERNEL_CONFIG}
make ARCH=arm CROSS_COMPILE=${CROSS_COMPILER_PREFIX}- -j 4 uImage
cp arch/arm/boot/uImage ${TOP_DIRECTOR}/build/out/



popd
