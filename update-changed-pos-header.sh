 #!/bin/bash

# Update revision date and last translator name in .po files
pots=$(git diff --stat HEAD~1 HEAD --name-only '*.po')
for path in $pots; do
    date=$(TZ=Asia/Kolkata date +"%Y-%m-%d %H:%M+0530")
    if [ -f $path ]; then
        echo "s/PO-Revision-Date: .*\"/PO-Revision-Date: $date\n\"/"
        sed -i "s/PO-Revision-Date: .*\"/PO-Revision-Date: $date\\\n\"/" $path
        sed -i "s/Last-Translator: .*\"/Last-Translator: Subin Siby <subins2000@gmai.com>\\\n\"/" $path
    fi
done
