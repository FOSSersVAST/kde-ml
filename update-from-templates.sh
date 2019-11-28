#!/bin/bash

# Update existing .po files
pos=$(find l10n-kf5/ml/ -name *.po -type f)
for filepath in $pos; do
    templatepath=${filepath/ml\//templates\/}
    # Append t of .pot
    templatepath+=t
    msgmerge -vU $filepath $filepath
done