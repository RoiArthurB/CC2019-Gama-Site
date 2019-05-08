##
# Copyright (c) 2019-present, Arthur Brugiere, GAMA-Platform
#
# This source code is licensed under the GPL3 license found in the
# LICENSE file in the root directory of this source tree.
##

# This script will move every <file>.md in the root docs/ folder.
# The goal is to have a path-less architecture on the website
# similare to paths on the github wiki
#
# ex: <baseUrl>/[docs,wiki]/<file>

#!/bin/sh

# If no folder _docs/_
if [ ! -d ./docs ];then
	mkdir ./docs
fi

# Remove folder _.git/_
if [ -d ./gama.wiki/.git ];then
	rm -fr ./gama.wiki/.git
fi

# Move folder resource in the static folder in _website/_
if [ -d ./website/static/resources ];then
	rm -fr ./website/static/resources
fi

mv ./gama.wiki/resources ./website/static/

# Soft link form _resource/_ folder in root _static/_ folder
# -> Removed because github.io doesn't link symbolic links :/ 
#ln -s ./website/static/resources/* ./website/static/


# Move every <file>.md from a [sub]folder of _gama.wiki/_
# to the folder _docs/_
# https://superuser.com/questions/658075/how-do-i-move-files-out-of-nested-subdirectories-into-another-folder-in-ubuntu
find gama.wiki/ -type f -iname "*.md" -exec mv --backup=numbered -t docs {} +
