# .dotfiles

Almost all of my configuration files

# Other important files

## ~/.git-credentials

`~/.config/gh/hosts` file has an entry like so:
```
github.com:
    user:
    oauth_token:
    git_protocol:
```

Then `~/.git-credentials` will be like so:
```
<protocol>://<user>:<oauth_token>@github.com
```
