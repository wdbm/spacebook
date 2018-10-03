#!/bin/bash

################################################################################
#                                                                              #
# spacebook                                                                    #
#                                                                              #
################################################################################
#                                                                              #
# LICENCE INFORMATION                                                          #
#                                                                              #
# This program tidies images of pages, whiteboards and similar visual          #
# representations.                                                             #
#                                                                              #
# copyright (C) 2014 Will Breaden Madden, wbm@protonmail.ch                    #
#                                                                              #
# This software is released under the terms of the GNU General Public License  #
# version 3 (GPLv3).                                                           #
#                                                                              #
# This program is free software: you can redistribute it and/or modify it      #
# under the terms of the GNU General Public License as published by the Free   #
# Software Foundation, either version 3 of the License, or (at your option)    #
# any later version.                                                           #
#                                                                              #
# This program is distributed in the hope that it will be useful, but WITHOUT  #
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or        #
# FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for     #
# more details.                                                                #
#                                                                              #
# For a copy of the GNU General Public License, see                            #
# <http://www.gnu.org/licenses/>.                                              #
#                                                                              #
################################################################################

export MAGICK_AREA_LIMIT=4096
export MAGICK_FILES_LIMIT=1024
export MAGICK_MAP_LIMIT=4096
export MAGICK_MEMORY_LIMIT=4096
export MAGICK_THREAD_LIMIT=3
export MAGICK_TMPDIR=/tmp

name="spacebook"
version="2018-10-03T1304Z"

main(){
    if [ ! -f "${1}" ]; then
        echo ""${1}" not found"
        exit
    fi
    check_dependencies
    spacebook "${1}" "${2}"
}

check_dependencies(){
    if ! type convert &> /dev/null; then
        echo "ImageMagick not detected"
        exit
    fi
}

spacebook(){
    local filename_input="${1}"
    local filename_output="${2}"
    # if no output specified, prevent overwrite of existing files
    if [ "${filename_output}" == "" ]; then
        local count=1
        filename_output="${filename_input%.*}_${count}.${filename_input##*.}"
        while [ -e "${filename_output}" ]; do
            let count=${count}+1
            filename_output="${filename_input%.*}_${count}.${filename_input##*.}"
        done
    fi
    convert                              \
        "${filename_input}"              \
        -morphology Convolve DoG:15,100,0\
        -negate                          \
        -normalize                       \
        -blur 0x1                        \
        -channel RBG                     \
        -level 60%,91%,0.1               \
        "${filename_output}"
}

main "${@}"
