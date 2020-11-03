#/bin/sh
export ROOTFS=${TOP_DIRECTOR}/build/out/rootfs_hisi

./build.sh busybox
./build.sh compoment install
cp resource/hisi/* ${ROOTFS}/ -rfd
#./build.sh yaffs2
./build.sh ubi 256
