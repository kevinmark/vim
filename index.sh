#!/bin/bash

# rm symbol files for analyzer
if [ -f cscope.files ]; then
	rm cscope.files
	echo -e "rm cscope.files\n"
fi
if [ -f cscope.in.out ]; then
	rm cscope.in.out
	echo -e "rm cscope.in.out\n"
fi
if [ -f cscope.out ]; then
	rm cscope.out
	echo -e "rm cscope.out\n"
fi
if [ -f cscope.po.out ]; then
	rm cscope.po.out
	echo -e "rm cscope.po.out\n"
fi
if [ -f tags ]; then
	rm tags
	echo -e "rm tags\n"
fi
if [ -n "`ls -al | grep *.cflow`" ]; then
	rm *.cflow
	echo -e "rm *.cflow\n"
fi

# argument "clean"
if [  "$1" = "clean"  ]; then
	exit 1
fi

echo -e "= establish symbol files =\n"
find . -name "*.h" -o -name "*.c" -o -name "*.cc" > cscope.files
sed -i 's#\.\/#'${PWD}'\/#g' cscope.files
cscope -bkq -i cscope.files
ctags -R

