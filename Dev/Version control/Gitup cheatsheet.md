# Gitup cheatsheet

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back](README.md)

## Links
- [gitup - git-repo-updater](https://github.com/earwig/git-repo-updater)

## Config
```
C:\Users\user\.config\gitup\bookmarks
```

## Help
```
gitup -h
usage: gitup [-u] [-t n] [-c] [-f] [-p] [-a path [path ...]] [-d path [path ...]] [-l] [-n] [-b [path]] [-e command] [-h] [-v] [--selftest] [path ...]

Easily update multiple git repositories at once.

updating repositories:
  path                  update this repository, or all repositories it contains (if not a repo directly)
  -u, --update          update all bookmarks (default behavior when called without arguments)
  -t n, --depth n       max recursion depth when searching for repos in subdirectories (default: 3; use 0 for no recursion, or -1 for unlimited)
  -c, --current-only    only fetch the remote tracked by the current branch instead of all remotes
  -f, --fetch-only      only fetch remotes, don't try to fast-forward any branches
  -p, --prune           after fetching, delete remote-tracking branches that no longer exist on their remote

bookmarking:
  -a path [path ...], --add path [path ...]
                        add directory(s) as bookmarks
  -d path [path ...], --delete path [path ...]
                        delete bookmark(s) (leaves actual directories alone)
  -l, --list            list current bookmarks
  -n, --clean, --cleanup
                        delete any bookmarks that don't exist
  -b [path], --bookmark-file [path]
                        use a specific bookmark config file (default: C:\Users\user\.config\gitup\bookmarks)

advanced:
  -e command, --exec command, --batch command
                        run a shell command on all repos

miscellaneous:
  -h, --help            show this help message and exit
  -v, --version         show program's version number and exit
  --selftest            run integrated test suite and exit (pytest must be available)

Both relative and absolute paths are accepted by all arguments. Direct bug reports and feature requests to https://github.com/earwig/git-repo-updater.
```

Update all git repositories in your current directory
```
gitup .
```
