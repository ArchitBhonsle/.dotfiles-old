rclone sync                                                             \
    --exclude="/.git/**" --exclude=.gitignore                           \
    --exclude="/.stversions" --exclude="/.stfolder" --exclude=.stignore \
    --progress                                                          \
    /home/architbhonsle/Documents/Notes/                                \
    gdrive-notes:
