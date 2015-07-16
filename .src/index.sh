#!/bin/bash
TagPath=${HOME}"/.vim/.tag"

# rm symbol files for analyzer
function rm_tag {
	if [ -f $TagPath/$1 ]; then
	        rm $TagPath/$1
	        echo -e "rm $1\n"
	fi
}
rm_tag cscope.files
rm_tag cscope.in.out
rm_tag cscope.out
rm_tag cscope.po.out
rm_tag cscope.out.in
rm_tag cscope.out.po
rm_tag tags

if [ -n "`ls -al $TagPath/| grep .cflow`" ]; then
	rm $TagPath/*.cflow
	echo -e "rm *.cflow\n"
fi

# argument "clean"
if [  "$1" = "clean"  ]; then
	exit 1
fi

echo -e "= establish symbol files =\n"
find . -name "*.h" -o -name "*.c" -o -name "*.cc" -o -name "*.cpp" > $TagPath/cscope.files
sed -i 's#\.\/#'${PWD}'\/#g' $TagPath/cscope.files
cscope -bkq -i $TagPath/cscope.files -f $TagPath/cscope.out
ctags -R -f $TagPath/tags --file-scope=no `pwd`

