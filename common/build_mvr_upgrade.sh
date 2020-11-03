#/bin/sh
export ROOTFS=${TOP_DIRECTOR}/build/out/upgrade
if [  -d ${ROOTFS} ];then
    rm ${ROOTFS} -rf
fi
mkdir ${ROOTFS}

cp ${TOP_DIRECTOR}/resource/hidoo/* ${ROOTFS}/ -rfd
echo app$(date '+%Y%m%d%H%M') > ${ROOTFS}/usr/Hseries/configs/version.txt

chmod +x ${TOP_DIRECTOR}/resource/upgrade.sh
cp ${TOP_DIRECTOR}/resource/upgrade.sh ${ROOTFS}/ -rfd
pushd ${TOP_DIRECTOR}/build/out/
tar cvf upgrade.tar upgrade
popd

