# GIT cheatsheet

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back](README.md)

```
git help [cmd]                                    ## web-page help
git [cmd] --help                                  ## web-page help
```

## Config
```
git --version --build-options                     ## 
git config --list                                 ## 
git config --local --list                         ## 
git config --unset user.name                      ## 
git config user.email                             ## 
git config user.name                              ## 
git config core.editor                            ## 
git config --global user.name "[name]"            ## 
git config --global user.email "[email address]"  ## 
git config --global color.ui auto                 ## 
git config --global push.default current          ## 
git config --global core.editor [editor]          ## 
git config --global diff.tool [tool]              ## 
git config --global alias.co checkout             ## 
git config --global alias.ci commit               ## 
git config --global alias.br branch               ## 
git config --global alias.st status               ## 
git config --global alias.branchm "!git branch -m $2 $3 && git push $1 :$2 $3 -u #"
git config --global alias.unstage "reset HEAD --" ## 
git config --global alias.hist "log --oneline --decorate --graph --all"
git config --global alias.hist2 "log --graph --pretty=format:\"%C(yellow)%h%Creset%C(cyan)%C(bold)%d%Creset %C(cyan)(%cr)%Creset %C(green)%ce%Creset %s\""
git unstage [file]                                ## 
git config --global alias.last "log -1 HEAD"      ## 
git config --global alias.visual "!gitk"          ## 
git config --global credential.helper cache       ## 
git config --global credential.helper store       ## 
git config --global http.proxy http://user_name:password@server_address:port_number  ## 
git status                                        ## 
git status -s                                     ## 
git diff                                          ## 
git diff --staged                                 ## 
```

## Work with changes
```
git status                                        ## 
git status -s                                     ## 
git diff                                          ## 
git diff --staged                                 ## 
git diff HEAD                                     ## 
git diff HEAD^                                    ## 
git diff [branch]                                 ## 
git difftool -d                                   ## 
git difftool -d [branch]                          ## 
git diff --stat                                   ## 
git diff [file-branch] [second-branch]            ## 
```

## Indexing
```
git add .                                         ## 
git add *.cs                                      ## 
git add [file]                                    ## 
```

## Commits
```
git commit -m "Message"                           ## commit with message
git commit -m "Subject" -m "Message"              ## commit with subject and message
git commit -m "Subject"$'\n'"Message"             ## commit with subject and message
git commit -a -m "text"                           ## add all files and commit with message
git add [forgotten_file]                          ## add file
git commit --amend                                ## replace last commit
git commit -a --amend                             ## add all files and replace last commit
git reset                                         ## 
git reset [commit/tag]                            ## 
git reset [file]                                  ## 
git reset HEAD [file]                             ## 
git reset --soft HEAD^                            ## 
git reset --hard HEAD^                            ## 
git reset --hard                                  ## 
git reset --hard [commit]                         ## 
git revert [commit_hash]                          ## 
git checkout --[file]                             ## 
git checkout [commit_hash]                        ## 
```

## Repositories
```
git init                                          ## 
git clone [url]                                   ## 
git clone [url] "[folder]"                        ## 
git fetch [bookmark]                              ## 
git fetch --all                                   ## 
git pull                                          ## 
git pull [origin]                                 ## 
git pull [origin][branch]                         ## 
git pull [origin] --rebase                        ## 
git push --all                                    ## 
git push [origin]                                 ## 
git push [origin] [branch]                        ## 
git push -u [origin] [branch]                     ## 
git push [origin] :[branch]                       ## 
git push [origin] :[branch] [branch]              ## 
git push [origin] [branchLocal]:[branchRemote]    ## 
git push [origin] --delete [branch]               ## 
git push -u [origin] [master]                     ## 
git push -u [origin] --all                        ## 
git push -u [origin] --tags                       ## 
git push --delete [remote_name] [branch]          ## 
git push --set-upstream [origin] [branch]         ## 
git remote                                        ## 
git remote -v                                     ## 
git remote add origin [url]                       ## 
git remote remove origin                          ## 
git remote rename origin [gitlab]                 ## 
git remote rm origin                              ## 
git remote set-url origin [https://...]           ## 
git remote show origin                            ## 
```

## Files deleting
```
git clean -f                                      ## 
git clean -fd                                     ## 
git mv [file-original] [file-renamed]             ## 
git rm [file]                                     ## 
git rm -rf .git*                                  ## 
git rm -rf .git                                   ## 
git rm log/\*.txt                                 ## 
git rm \*~                                        ## 
git rm --cached .                                 ## 
git rm --cached -rf .                             ## 
git rm --cached [file]                            ## 
git update-index --assume-unchanged [file]        ## 
git update-index --no-assume-unchanged [file]     ## 
```

## Files indexing
```
.gitignore                                        ## 
git ls-files --other --ignored --exclude-standard ## 
```

## Version history
```
git log                                           ## 
git log --follow [file]                           ## 
git log -p -2                                     ## 
git log --oneline --decorate --graph --all        ## 
git log --pretty=oneline                          ## 
git log --pretty=format:"%h %s" --graph           ## 
git log --author='Name' --after={1.week.ago} --pretty=oneline --abbrev-commit ## 
git log --no-merges master                        ## 
git log --since=2.weeks                           ## 
git log --stat                                    ## 
git shortlog                                      ## 
git show [commit]                                 ## 
git show [branch]:[file]                          ## 
```

## Tags
```
git push [origin] [tag]                           ## 
git push [origin] --tags                          ## 
git show v1.6.4.047                               ## 
git tag                                           ## 
git tag -l *v1.6*                                 ## 
git tag -a v1.6.4.047 -m "26.04.2018"             ## 
git tag v1.6.4.047-lw                             ## 
git tag -a v1.6.1.001 d0704b00b5                  ## 
```

## Branches
```
HEAD                                              ## 
git checkout [branch]                             ## 
git checkout [file]                               ## 
git checkout -b [branch]                          ## 
git checkout -b [branch] [origin/branch]          ## 
git branch                                        ## 
git branch [branch]                               ## 
git branch -a                                     ## 
git branch -d [branch]                            ## 
git branch -D [branch]                            ## 
git branch -m [oldName] [newName]                 ## 
git branch -v                                     ## 
git branch -vv                                    ## 
git branch --merged                               ## 
git branch --no-merged                            ## 
git merge [branchHotfix]                          ## 
git merge [origin/branch]                         ## 
git merge --no-ff [branch]                        ## 
git mergetool                                     ## 
git rebase [branch]                               ## 
git rebase [master] [server]                      ## 
git rebase --onto master [server] [client]        ## 
-- git checkout [master]                          ## 
-- git merge [client]                             ## 
git checkout --track [origin/branch]              ## 
git branch -u [origin/branch]                     ## 
git merge @{u}                                    ## 
git branch --list                                 ## view list of branches
git fetch origin master:master                    ## get other branch
git pull origin master:master                     ## get other branch
```

## Stashes
```
git stash                                         ## 
git stash list                                    ## 
git stash apply                                   ## 
git stash apply stash@{2}                         ## 
git stash apply --index                           ## 
git stash drop                                    ## 
git stash pop                                     ## 
git stash branch                                  ## 
```

## How to revert uncommitted changes including files and folders?
```
git reset --hard                                  ## Revert changes to modified files.
git clean -fd                                     ## Remove all untracked files and directories.
```

## Revert changes
```
git checkout .                                    ## revert changes made to your working copy for all directories and files
git checkout [folder/file]                        ## revert changes made to your working copy for directory/file
git reset [folder/file]                           ## revert changes made to the index
git revert [commit 1] [commit 2]                  ## revert a change that you have committed
git clean -f                                      ## remove untracked files
git clean -fd                                     ## remove untracked directories
```

## Exclude files from commit
```
Need first gitignore and then files.
git rm -r --cached . || git rm --cached || git rm --cached [file-name] || git rm -r --cached [folder-name]
git add .
git commit -m ".gitignore"
```

## Renaming a branch
```
git branch -m oldname newname                     ## local renaming
git push origin :old_branch                       ## remote deleting old branch
git push origin new_branch                        ## remote creating new branch
git config --global alias.branchm "!git branch -m $2 $3 && git push $1 :$2 $3 -u #"
git branchm origin old_branch new_branch          ## remote branch renaming
```

## Push all repos
```
git remote show origin                            ## view and copy push URL
git remote show gitlab                            ## view and copy push URL
git remote add all https://github.com/...git      ## add new remote "all" repo
git remote set-url --add all https://...git       ## add second repo into "all" repo
git push -u all main                              ## set upstream
git push                                          ## push changes
```
