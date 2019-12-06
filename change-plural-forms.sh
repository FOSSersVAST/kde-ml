 #!/bin/bash

# Fix Plural Forms value in .po files
pos=$(find l10n-kf5/ml/kdegames -name *.po -type f)
for path in $pos; do
    if [ -f $path ]; then
        echo $path
        sed -i "s/Plural-Forms: nplurals=INTEGER; plural=EXPRESSION;/Plural-Forms: nplurals=2; plural=(n != 1);/" $path
    fi
done
