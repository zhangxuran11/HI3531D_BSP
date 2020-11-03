#!/bin/bash
NAND_SIZE=512
echo $1
if [ $# == 1 ];then
    NAND_SIZE=$1
fi
pushd ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/tools/pc/ubi_sh/
chmod +x mkubiimg.sh
rm *.ubifs
./mkubiimg.sh hi35xx 2k 128k ${ROOTFS} $(($NAND_SIZE-5))M ${TOP_DIRECTOR}/build/${HI3531D_SDK}/osdrv/pub/bin/pc 1
cp *.ubifs ${TOP_DIRECTOR}/build/out/


popd
