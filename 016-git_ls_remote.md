# Check that a remote Git repo or ref exists

I've recently configured a build job in Jenkins that clones source code from GitHub. I accidentally entered an invalid Git repository URL and this is what Jenkins yelled at me:

    Failed to connect to repository : Command "git ls-remote -h git@github.com:USER/REPO.git HEAD" returned status code 128:
    stdout:
    stderr: ERROR: Repository not found.
    fatal: The remote end hung up unexpectedly

Through this error I learned about [git ls-remote](http://git-scm.com/docs/git-ls-remote) and how it can be used to

- list references in a remote repository
- check that a repository exists at all
- check that a specific ref exists (use `--exit-code`)

All that without cloning the repository in question.

_Published on [Coderwall](https://coderwall.com/p/tuio0w) on 2013-01-23_
