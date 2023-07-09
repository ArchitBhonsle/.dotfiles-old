#! /usr/bin/env bash

/usr/bin/env rclone sync                                                             \
    --exclude="/.git/**" --exclude=.gitignore                           \
    --exclude="/.stversions" --exclude="/.stfolder" --exclude=.stignore \
    --log-level=INFO                                                    \
    /home/architbhonsle/Documents/Notes/                                \
    gdrive-notes:
