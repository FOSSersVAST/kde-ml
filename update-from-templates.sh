#!/bin/bash

# Update existing .po files
pos=$(find l10n-kf5/ml/ -name *.po -type f)
for filepath in $pos; do
    templatepath=${filepath/ml\//templates\/}
    # Append t of .pot
    templatepath+=t
    msgmerge -vU $filepath $filepath
done

# Make new .po files
pots=$(find l10n-kf5/templates/ -name *.pot -type f)
for templatepath in $pots; do
    filepath=${templatepath/templates\//ml/}
    filepath=${filepath/.pot/.po}
    if [ ! -f $filepath ]; then
        msginit -o $filepath -i $templatepath --no-translator --locale=ml_IN
    fi
    sed -i 's/Language-Team: none/Language-Team: SMC <smc.org.in>/' $filepath
done
