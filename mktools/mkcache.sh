#!/bin/bash
find conf.d -type f | xargs cat | grep -E '^Plugin' > ~/.vimrc.d/cache/plugins.conf
find conf.d -type f | xargs cat | grep -vE '^Plugin' > ~/.vimrc.d/cache/noplugins.conf
