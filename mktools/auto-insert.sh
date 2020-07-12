#!/bin/bash -eux

#*.conf
if [[ -e ~/.vimrc.d/config ]];
then
	mv ~/.vimrc.d/config ~/.vimrc.d/config.$(date +'%Y%m%d_%H%M%S')
fi

for i in $(ls -1 ~/.vimrc.d/*.conf)
do
echo "source $i" >> ~/.vimrc.d/config
done
#*.bundleconf


if [[ -e ~/.vimrc.d/bundle-include.list ]];
then
	mv ~/.vimrc.d/bundle-include.list ~/.vimrc.d/config.$(date +'%Y%m%d_%H%M%S')
fi


for i in $(ls -1 ~/.vimrc.d/*.bundleconf)
do
echo "source $i" >> ~/.vimrc.d/bundle-include.list
done
