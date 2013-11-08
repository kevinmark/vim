#!/bin/bash

##
export PLATFORM="mipsel-uclibc"
export PREFIX="/tmp/home/omk/local"
export CONFIGUREOPT=$*


###
export CROSS_COMPILE="$PLATFORM-"
export CROSS_COMPILER=$CROSS_COMPILE
export eval BUILD=`gcc -dumpmachine`
export CONFIGURE="./configure --host=mipsel-linux --build=$BUILD"
#export eval SRCBASE=`pwd`
#  eval TOOLCHAIN=`which "$CROSS_COMPILE"gcc| sed s/"$CROSS_COMPILE"gcc//g`
#export eval TOOLCHAIN=`cd "$TOOLCHAIN"/.. && pwd -P`

export HOSTCC="gcc"
export CC="$CROSS_COMPILE"gcc
export AR="$CROSS_COMPILE"ar
export AS="$CROSS_COMPILE"as
export LD="$CROSS_COMPILE"ld
export NM="$CROSS_COMPILE"nm
export RANLIB="$CROSS_COMPILE"ranlib
export STRIP="$CROSS_COMPILE""strip -R .note -R .comment -s"
export SIZE="$CROSS_COMPILE"size

export EXTRACFLAGS=" -DLINUX26 -DCONFIG_BCMWL5 -pipe -DBCMWPA2 -funit-at-a-time -Wno-pointer-sign -mtune=mips32 -mips32 "


#export NAME="ncurses-5.9"
#	cd $NAME && \
	CC=$CC && CFLAGS="-g -O2 -fPIC ""$EXTRACFLAGS" \
	$CONFIGURE --prefix="$PREFIX" --enable-shared $CONFIGUREOPT


[ $? -eq 0 ] && make #&& eval `$STRIP lib/libncurses.so.5.9` 
[ $? -eq 0 ] && make install && \
		eval `find $PREFIX -name "*.so" -o -name "*.a"| xargs chmod u=rwx`  && \
		eval `find $PREFIX -name "*.so" -o -name "*.a"| xargs $STRIP` && \
		eval `find $PREFIX -type f -executable        | xargs chmod u=rwx` && \
		eval `find $PREFIX -type f -executable        | xargs $STRIP` && \
		echo -e "\n$PLATFORM-stip sucess."


# if make install fail
#find . -name "*.so" -o -name "*.a"| xargs chmod u=rwx \
#find . -name "*.so" -o -name "*.a"| xargs mipsel-uclibc-strip -R .note -R .comment -s \
#find . -type f -executable        | xargs chmod u=rwx \
#find . -type f -executable        | xargs mipsel-uclibc-strip -R .note -R .comment -s

