#!/bin/sh

# rm cscope.files cscope.in.out cscope.out cscope.po.out tags
if [ -f cscope.files ]; then
	rm cscope.files
fi
if [ -f cscope.in.out ]; then
	rm cscope.in.out
fi
if [ -f cscope.out ]; then
	rm cscope.out
fi
if [ -f cscope.po.out ]; then
	rm cscope.po.out
fi
if [ -f tags ]; then
	rm tags
fi

# argument "clean"
if [  "$1" = "clean"  ]; then
	echo "rm cscope.files cscope.in.out cscope.out cscope.po.out tags"
	exit 1
fi

find . -name "*.h" -o -name "*.c" -o -name "*.cc" > cscope.files
sed -i 's#\.\/#'${PWD}'\/#g' cscope.files
cscope -bkq -i cscope.files
ctags -R

