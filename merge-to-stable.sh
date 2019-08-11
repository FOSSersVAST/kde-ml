#!/bin/bash

'''
This is a lazy script to merge localizations from trunk to
stable. The idea is to not manage stable at all and just
copy localizations from trunk. There should be `l10n-kf5`
folder, the trunk branch and `stable-kf5, the stable branch
'''

# Merge localizations to stable
date=$(TZ=Asia/Kolkata date +"%Y-%m-%d %H:%M+0530")
pos=$(find l10n-kf5/ml/ -name *.po -type f)
for trunkpath in $pos; do
    stablepath=${trunkpath/l10n-kf5\//stable-kf5\/}

    # Some files in stable doesn't exist, add it
    if [ ! -f $stablepath ]; then
        cp $trunkpath $stablepath
    else
        msgcat $trunkpath $stablepath -o $stablepath --use-first
        sed -i "s/PO-Revision-Date: .*\"/PO-Revision-Date: $date\\\n\"/" $stablepath
    fi
    sed -i 's/Language-Team: none/Language-Team: Swathanthra|സ്വതന്ത്ര Malayalam|മലയാളം Computing|കമ്പ്യൂട്ടിങ്ങ് <smc."\n"org.in>/' $stablepath
done