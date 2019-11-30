# Find files in ml that doesn't have a template
# If so, we need to delete that file in ml
# scripty doesn't remove file in localization folders
# if it gets removed from templates

pos=$(find l10n-kf5/ml/ -name *.po -type f)
for mlpath in $pos; do
    templatepath=${mlpath/ml\//templates/}
    templatepath=${templatepath%.po}.pot
    if [ ! -f $templatepath ]; then
        echo $mlpath
    fi
done