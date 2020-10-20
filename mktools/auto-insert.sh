#!/bin/bash -eux


mkdir -p ~/.vimrc.d/backups

#*.conf
if [[ -e ~/.vimrc.d/config ]];
then
	mv ~/.vimrc.d/config ~/.vimrc.d/backups/config.$(date +'%Y%m%d_%H%M%S')
fi

for i in $(ls -1 ~/.vimrc.d/*.conf)
do
echo "source $i" >> ~/.vimrc.d/config
done
#*.bundleconf


if [[ -e ~/.vimrc.d/bundle-include.list ]];
then
	mv ~/.vimrc.d/bundle-include.list ~/.vimrc.d/backups/bundle-include.$(date +'%Y%m%d_%H%M%S')
fi


for i in $(ls -1 ~/.vimrc.d/*.bundleconf)
do
echo "source $i" >> ~/.vimrc.d/bundle-include.list
done

# after-bundleconf

if [[ -e ~/.vimrc.d/bundle-after.list ]];
then
	mv ~/.vimrc.d/bundle-after.list ~/.vimrc.d/backups/bundle-after.$(date +'%Y%m%d_%H%M%S')
fi


for i in $(ls -1 ~/.vimrc.d/*.after-bundleconf)
do
echo "source $i" >> ~/.vimrc.d/bundle-after.list
done
