#!/bin/bash
case $1 in
   "clean")
       rm build -rf
       printf "clean all directory"
    ;;
    **)
    ;;
esac
pushd ./
cd ../zephyr
 source zephyr-env.sh
cd ../../zephyr-sdk
 ./mkenv.sh
popd 

if [ ! -d build ];then
mkdir build
fi
rootdir=$(pwd)
cd build

cmake -GNinja -DBOARD=efm32gg_slstk3700 -DSOC_ROOT=$rootdir -DBOARD_ROOT=$rootdir  ..
