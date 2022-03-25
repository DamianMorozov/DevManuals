# SVN cheatsheet

- [Back](README.md)

```
svn co --username eax https://example.com/project/trunk/    -- checkout
svn up                                                      -- latest changes
svn info                                                    -- Check which branch we are on and which server we are looking at
svn up                                                      -- View change history
svn log | less                                              -- View change history
svn log --diff | less                                       -- Changelog with diffs, similar to git log -p
svn blame -v test.txt                                       -- Who changed which lines when
svn diff                                                    -- View uncommitted changes
svn diff --summarize                                        -- Which files have been changed or added
svn log -c 123456                                           -- view comment
svn diff -c 123456                                          -- see changes
svn diff --summarize -c 123456                              -- View files changed in revision
svn diff -r 123456                                          -- Changes from the current revision, similar to git diff
svn diff --summarize -r 123456                              -- Changes from the current revision, similar to git diff
patch -p0 -i myfile.diff                                    -- Applying a diff saved to a file, analogous to git apply
svn revert --recursive .                                    -- Revert recent changes, similar to git reset --hard HEAD
svn status                                                  -- The current state of the repository, modified files, and so on
```

## Delete untracked files and directories - alas, there is no built-in command, but you can add an alias to .bashrc
```
svn status | perl -lne 'if (/ ^ \? \ s + (. *?) $ /) {print $ 1}' | xargs rm -r
```

## Getting a list of branches
```
svn ls https://example.com/project/branches/
```

## Creating a new branch or tag
```
svn copy https://example.com/project/trunk/ \
    https://example.com/project/branches/test-branch
svn copy https://example.com/project/trunk/ \
    https://example.com/project/tags/1.0 \
    -m "Release 1.0"
```

## Switching to brunch
```
cd path / to / trunk
cd ..
mkdir branches
cd branches
svn co https://example.com/project/branches/test-branch
cd test-branch
```

```
svn merge http://example.ru/project/branches/test-branch    -- Merge brunch
svn delete http://example.ru/project/branches/test-branch -m "Removing test-branch"  -- Removing a branch
svn add text.txt                                            -- To add a file
svn mv from.txt to.txt                                      -- Rename file
svn del file.txt                                            -- Delete a file
svn lock file.txt                                           -- Lock so that no one can change the file except us
svn unlock file.txt                                         -- unlock so that no one can change the file except us
svn commit -m 'Your comment here'                           -- Commit and immediately push, because it's SVN
```
