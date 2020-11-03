#/bin/sh
if [ $# -lt 3 ];then                                               
    echo not version                                          
    echo Useage:                                                                                                                                       
    echo '  ./build.sh mvr "H_MVR_9U 1.0.0.0 S3.T3" '
    exit 1                                                          
fi
DEV_V=$1
VER1_V=$2
VER2_V=$3

export ROOTFS=${TOP_DIRECTOR}/build/out/rootfs_mvr
if [  -d ${ROOTFS} ];then
    rm ${ROOTFS} -rf
fi

mkdir ${ROOTFS} -p

if [ ! -d ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/rootfs_uclibc/ ];then
    tar xvf ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/rootfs_uclibc.tgz -C ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/
fi


cp ${TOP_DIRECTOR}/resource/nova/rootfs/* ${ROOTFS}/ -rfd

rm ${ROOTFS}/usr/nova/bin/himm

#cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/rootfs_uclibc/* ${TOP_DIRECTOR}/build/out/rootfs/ -rfd
#cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/mpp/lib/* ${TOP_DIRECTOR}/build/out/rootfs/lib/ -rfd
#cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/mpp/ko ${TOP_DIRECTOR}/build/out/rootfs/ -rfd

cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/tools/board/gdb/bin/bin/* ${ROOTFS}/bin/
cp ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/tools/board/reg-tools-1.0.0/bin/* ${ROOTFS}/bin/ -rfd

if [ -f ${ROOTFS}/etc/init.d/S80network ];then
    rm ${ROOTFS}/etc/init.d/S80network
fi

cp ${TOP_DIRECTOR}/resource/hidoo/* ${ROOTFS}/ -rfd
cp ${TOP_DIRECTOR}/resource/hidoo_third_soft/* ${ROOTFS}/ -rfd
echo app$(date '+%Y%m%d%H%M') > ${ROOTFS}/usr/Hseries/configs/version.txt

pushd tools/ver_tool/
DEV=$DEV_V VER1=$VER1_V VER2=$VER2_V ./create_ver.sh
cp ./mcu_version.bin ./fpga_version.bin
cp ./mcu_version.bin ./version.bin
cp ./*version.bin ${ROOTFS}/usr/Hseries/configs/
popd

#chmod +x ${TOP_DIRECTOR}/build/out/${ROOTFS}/ko/load3531d
#mkdir ${ROOTFS}/var/empty
#cp ${TOP_DIRECTOR}/resource/init-env.sh ${TOP_DIRECTOR}/build/out/${ROOTFS}/sbin/


#./build.sh compoment install
./build.sh yaffs2

pushd ${TOP_DIRECTOR}/build/out/
tar cvf rootfs_mvr.tar rootfs_mvr
popd

./build.sh mvr_upgrade
