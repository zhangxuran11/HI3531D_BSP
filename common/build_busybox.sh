#!/bin/bash

if [ "x$ROOTFS" == "x" ];then
    export ROOTFS=${TOP_DIRECTOR}/build/out/rootfs
fi
pushd ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/opensource/busybox/busybox-1.20.2/


#if [ -f ${TOP_DIRECTOR}/resource/busybox/${BUSYBOX_CONFIG} ];then
#    cp ${TOP_DIRECTOR}/resource/busybox/${BUSYBOX_CONFIG} ./
#fi
#cp ${BUSYBOX_CONFIG} .config

#make -j
#rm _install -rf
#make install

#pushd _install
#mkdir etc dev lib tmp var mnt home proc
#SYSROOT=$(${CROSS_COMPILER_PREFIX}-gcc --print-sysroot)
#cp ${SYSROOT}/lib/* ./lib/ -rfd
#popd

if [  -d ${ROOTFS} ];then
    rm ${ROOTFS} -rf
fi
mkdir ${ROOTFS}

if [ ! -d ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/rootfs_uclibc/ ];then
    tar xvf ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/rootfs_uclibc.tgz -C ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/
fi

cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/rootfs_uclibc/* ${ROOTFS}/ -rfd
cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/mpp/lib/* ${ROOTFS}/lib/ -rfd
cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/mpp/ko ${ROOTFS}/ -rfd
cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/tools/board/gdb/bin/bin/* ${ROOTFS}/bin/
cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/tools/board/reg-tools-1.0.0/bin/* ${ROOTFS}/bin/ -rfd


chmod +x ${ROOTFS}/ko/load3531d
mkdir ${ROOTFS}/var/empty
#cp ${TOP_DIRECTOR}/resource/init-env.sh ${TOP_DIRECTOR}/build/out/rootfs/sbin/

#busybox 文件系统暂时挂载无反应
#cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/rootfs_uclibc/etc ${TOP_DIRECTOR}/build/out/rootfs/ -rfd
#cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/rootfs_uclibc/bin ${TOP_DIRECTOR}/build/out/rootfs/ -rfd
#cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/rootfs_uclibc/sbin ${TOP_DIRECTOR}/build/out/rootfs/ -rfd
#cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/rootfs_uclibc/linuxrc ${TOP_DIRECTOR}/build/out/rootfs/ -rfd
#cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/rootfs_uclibc/user ${TOP_DIRECTOR}/build/out/rootfs/ -rfd
#cp _install/* ${TOP_DIRECTOR}/build/out/rootfs/ -rfd
#cp _install/bin/busybox ${TOP_DIRECTOR}/build/out/rootfs/bin -rfd

popd
