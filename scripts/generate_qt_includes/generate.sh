#!/usr/bin/env bash
root="/Users/oleg/git-rep"
out="git-rep.includes"
tmp="tmp"
cat $(find $root -type f -name "CMakeLists.txt") | ./generate_qt_includes_dirs.py | sed "s|\${GOGO_ROOT}|$root|" > $tmp
find $root -type d | grep include$ >> $tmp
cat $tmp | sort | uniq > $out
rm $tmp
