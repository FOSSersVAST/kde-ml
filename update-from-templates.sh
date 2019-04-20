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
        sed -i 's/Team: none/Team: Swathanthra|സ്വതന്ത്ര Malayalam|മലയാളം Computing|കമ്പ്യൂട്ടിങ്ങ് <smc.org.in>/' $filepath
    fi
done
