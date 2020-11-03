#/bin/sh
export ROOTFS=${TOP_DIRECTOR}/build/out/rootfs_hidoo

./build.sh busybox
cp ${TOP_DIRECTOR}/resource/hidoo/* ${ROOTFS}/ -rfd
./build.sh compoment install
./build.sh yaffs2
#./build.sh ubi 512
