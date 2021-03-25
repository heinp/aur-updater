prefix="$(basename "$0"):"
for dir in */; do
    cd $dir
    echo "$prefix working on $dir"
    feedback="$(git remote -v update 2>&1 > /dev/null)"

    if ! [[ $feedback == *"up to date"* ]]; then
        echo "$prefix needs to be updated"
        git pull
        makepkg -sir
    fi
    cd ..
done
