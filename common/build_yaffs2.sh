#!/bin/bash
if [ "x$ROOTFS" == "x" ];then
    ROOTFS=${TOP_DIRECTOR}/build/out/rootfs
fi
echo ${ROOTFS}
chmod +x ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/tools/pc/mkyaffs2image/bin/mkyaffs2image610
${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/tools/pc/mkyaffs2image/bin/mkyaffs2image610 ${ROOTFS} ${ROOTFS}_2k_4bit.yaffs2 1 2
#${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/tools/pc/mkyaffs2image/bin/mkyaffs2image610 ${TOP_DIRECTOR}/build/out/rootfs_xa ${TOP_DIRECTOR}/build/out/rootfs_xa.yaffs2 1 2


