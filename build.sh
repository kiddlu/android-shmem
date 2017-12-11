#!/bin/sh

[ -e libancillary/ancillary.h ] || git submodule update --init libancillary || exit 1

#gcc -march=armv5 -shared -fpic -std=gnu99 -Wall *.c -I . -I libancillary \
#	-o libandroid-shmem-gnueabi.so -Wl,--version-script=exports.txt -lc -lpthread && \
#strip libandroid-shmem-gnueabi.so

gcc -march=armv7-a -shared -fpic -std=gnu99 -Wall *.c -I . -I libancillary \
	-o libandroid-shmem-gnueabihf.so -Wl,--version-script=exports.txt -lc -lpthread && \
strip libandroid-shmem-gnueabihf.so \

mv libandroid-shmem-gnueabihf.so libandroid-shmem.so 
