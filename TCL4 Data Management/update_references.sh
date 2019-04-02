#!/bin/bash
# -----------------------------------------------------------------------------
# Filename  : update_references.sh
# Desc.     : This script updates references of the form release-vx.y.z to
#           : master for all yaml files
# Project   : UTM
# Author    : Abraham K. Ishihara
# -----------------------------------------------------------------------------
echo
echo "------------------------"
echo "Enter the destination branch for utm-docs repo:"
echo
read my_branch
my_branch=$( echo $my_branch | sed 's/ //g' )
echo "You selected: $my_branch"
echo "------------------------"

for f in *.yaml
do
    temp=$( mktemp )
#    cat $f | sed 's/\/release\-v[0-9]\.[0-9]\.[0-9]*\//\/master\//g' > $temp
#    cat $f | sed "s:\/utm-docs\/.*\/:\/utm-docs\/$my_branch\/:g" > $temp
    cat $f | sed "s:\/utm-docs\/\(.*\)\/\(TCL4.*\):\/utm-docs\/$my_branch\/\2:g" > $temp
    mv $temp $f
done


exit 0
