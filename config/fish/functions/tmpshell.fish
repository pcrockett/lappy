function tmpshell
    set temp_dir (mktemp --directory)
    cd $temp_dir
    echo "Run `exit` when finished"
    fish
    cd -
    rm -rf $temp_dir
end
