# make explicit where the prints are comming from
prefix="$(basename "$0"):"
# iterate over all dicts in cwd -> skript must be started from aur dir
for dir in */; do
    cd $dir
    echo "$prefix working on $dir"
    # update info about remote status
    feedback="$(git remote -v update 2>&1 > /dev/null)"

    # check if needs to be updated using the output of the check
    if ! [[ $feedback == *"up to date"* ]]; then
        echo "$prefix needs to be updated"
        # perform update of this package
        git pull
        makepkg -sir
    fi
    cd ..
done
