#!/bin/bash
# -----------------------------------------------------------------------------
# Filename  : update_references.sh
# Desc.     : This script updates references of the form release-vx.y.z to
#           : master for all yaml files
# Project   : UTM
# Author    : Abraham K. Ishihara
# -----------------------------------------------------------------------------

for f in *.yaml
do
    temp=$( mktemp )
#    cat $f | sed 's/\/release\-v[0-9]\.[0-9]\.[0-9]*\//\/master\//g' > $temp
    cat $f | sed 's:\/utm-docs\/master\/:\/utm-docs\/develop\/:g' > $temp
    mv $temp $f
done


exit 0
