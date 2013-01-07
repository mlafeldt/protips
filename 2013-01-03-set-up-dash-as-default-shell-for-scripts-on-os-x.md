# Set up Dash as default shell for scripts on OS X

- Install Dash via brew: `brew install dash`
- Edit `/etc/paths` so that `/usr/local/bin` is at the top of the list.
- Symlink `/usr/local/bin/sh` to Dash: `ln -sf dash /usr/local/bin/sh`
- Start your scripts with `#!/usr/bin/env sh`

The benefits:

- It is portable: your scripts will be run by Dash on OS X and Debian-based systems like Ubuntu (of course, the scripts themselves have to conform to POSIX).
- It doesn't break OS X and apps that require `/bin/sh` to be Bash.
- Dash is rad.
