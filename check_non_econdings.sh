#!/bin/bash

########################################################################################################
#
# usage: $ ./check_non_econdings.sh <directory> <econdding not desired 1> <econdding not desired 2> ...
# 
# example: $ ./check_non_econdings.sh ./src ascii binary iso-8859-1
# 
# The given example will print all the files in the directory ./src  
# whose econdings are not ascii, binary and iso-8859-1.
########################################################################################################
directory=$1
shift
encondigs_not_desired=$1
shift

for enconding in "$@"
do
    encondigs_not_desired="$encondigs_not_desired\|$enconding"
done

find $directory -name "*.*" -exec sh -c "( \
	file -i {} | grep -v '$encondigs_not_desired'
)" \;