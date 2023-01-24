# GIT cheatsheet

- [Back to the Home page](../../README.md)
- [Back to the Dev page](../README.md)
- [Back](README.md)

```
git help [cmd]                                    	## web-page help
git [cmd] --help                                  	## web-page help
```

## Commands
```
git --version --build-options
git unstage [file]
git status
git status -s
git diff
git diff --staged
```

## Global alias
```
git config --global alias.br "branch"
git config --global alias.bra "branch -a -vv"
git config --global alias.branchm "!git branch -m $2 $3 && git push $1 :$2 $3 -u #"
git config --global alias.ci "commit"
git config --global alias.cis "commit -S"
git config --global alias.cism "commit -S -m"
git config --global alias.co "checkout"
git config --global alias.hist "log --oneline --decorate --graph --all"
git config --global alias.hist2 "log --graph --pretty=format:\"%C(yellow)%h%Creset%C(cyan)%C(bold)%d%Creset %C(cyan)(%cr)%Creset %C(green)%ce%Creset %s\""
git config --global alias.hist3 "log --pretty=format:\"%h - %an, %ar : %s\""
git config --global alias.hist4 "log --pretty=oneline"
git config --global alias.last "log -1 HEAD"
git config --global alias.st "status"
git config --global alias.unstage "reset HEAD --"
git config --global alias.visual "!gitk"
```

## Global config
```
git config --global --list
git config --global --unset user.email
git config --global --unset user.name
git config --global color.ui auto
git config --global core.editor [editor]
git config --global credential.helper cache
git config --global credential.helper store
git config --global diff.tool [tool]
git config --global http.proxy http://user_name:password@server_address:port_number
git config --global push.default current
git config --global user.email "[email address]"
git config --global user.name "[name]"
git config --list
git config --unset user.email
git config --unset user.name
git config core.editor
git config user.email "[email address]"
git config user.name "[name]"
```

## Local config
```
git config --local --list
git config --local user.name "[name]"
git config --local user.email "[email]"
git config --local --unset user.email
git config --local --unset user.name
```

## Work with changes
```
git status                                        	## 
git status -s                                     	## 
git diff                                          	## 
git diff --staged                                 	## 
git diff HEAD                                     	## 
git diff HEAD^                                    	## 
git diff [branch]                                 	## 
git difftool -d                                   	## 
git difftool -d [branch]                          	## 
git diff --stat                                   	## 
git diff [file-branch] [second-branch]            	## 
```

## Indexing
```
git add .                                         	## add all files to the stage
git add [file]                                    	## add file to the stage
git add [directory/*] -f                           	## force add files in directory to the stage
```

## Commits
```
git commit -m "Message"								## commit with message
git commit -m "Subject" -m "Message"				## commit with subject and message
git commit -m "Subject"$'\n'"Message"				## commit with subject and message
git commit -a -m "text"								## add all files and commit with message
git add [forgotten_file]							## add file
git commit --amend									## replace last commit
git commit -a --amend								## add all files and replace last commit
git reset											## 
git reset [commit/tag]								## 
git reset [file]									## 
git reset HEAD [file]								## 
reset HEAD --[file]									## unstage file
git reset --soft HEAD^								## 
git reset --hard									## 
git reset --hard HEAD^								## 
git reset --hard HEAD~1								## delete the previous 1 commit in your existing branch
git reset --hard HEAD~5								## delete the previous 5 commits in your existing branch
git reset --hard [commit]							## go back to a specific commit
git push origin HEAD --force						## remove commits from the remote origin/branch
git revert [commit_hash]							## 
git checkout --[file]								## 
git checkout [commit_hash]							## 
```

## Repositories config
```
git init                                          	## 
git clone [url]                                   	## 
git clone [url] "[folder]"                        	## 
git remote                                        	## 
git remote -v                                     	## 
git remote add origin [url]                       	## 
git remote remove origin                          	## 
git remote rename origin [gitlab]                 	## 
git remote rm origin                              	## 
git remote set-url origin [https://...]           	## 
git remote show origin                            	## 
```

## Files deleting
```
git clean -f                                      	## 
git clean -fd                                     	## 
git mv [file-original] [file-renamed]             	## 
git rm [file]                                     	## 
git rm -rf .git*                                  	## 
git rm -rf .git                                   	## 
git rm log/\*.txt                                 	## 
git rm \*~                                        	## 
git rm --cached .                                 	## 
git rm --cached -rf .                             	## 
git rm --cached [file]                            	## 
git update-index --assume-unchanged [file]        	## 
git update-index --no-assume-unchanged [file]     	## 
```

## Files indexing
```
.gitignore                                        	## 
git ls-files --other --ignored --exclude-standard 	## 
```

## Version history
```
git log                                           	## 
git log --follow [file]                           	## 
git log -p -2                                     	## 
git log --oneline --decorate --graph --all        	## 
git log --pretty=oneline                          	## 
git log --pretty=format:"%h %s" --graph           	## 
git log --graph --pretty=format:"%C(yellow)%h%Creset%C(cyan)%C(bold)%d%Creset %C(cyan)(%cr)%Creset %C(green)%ce%Creset %s"
git log --graph --pretty=format:"%C(yellow)%h%Creset %Cgreen(%cd) %C(bold blue)<%an>%Creset %C(red)%d%Creset %s" --all
git log --author='Name' --after={1.week.ago} --pretty=oneline --abbrev-commit ## 
git log --no-merges master                        	## 
git log --since=2.weeks                           	## 
git log --stat                                    	## 
git shortlog                                      	## 
git show [commit]                                 	## 
git show [branch]:[file]                          	## 
```

## Tags
```
git push origin --tags                            	## send all tags to the repository
git push origin tag                               	## send the tag to the repository
git show v0.0.000                                 	## view tag content
git tag                                           	## view all tags
git tag -a v0.0.000 -m "TASK-xxx"                 	## create a tag with a version and a comment
git tag -a v0.0.000 0011223344                    	## create a tag with the version to commit on the hash part
git tag -d v0.0.000                               	## delete a tag
git tag -l *v0.0*                                 	## search for tags by mask
```

## Branches
```
git fetch [bookmark]                              	## 
git fetch --all                                   	## 
git pull                                          	## 
git pull [origin]                                 	## 
git pull [origin][branch]                         	## 
git pull [origin] --rebase                        	## 
git push --all                                    	## 
git push [origin]                                 	## 
git push [origin] [branch]                        	## 
git push -u [origin] [branch]                     	## 
git push [origin] :[branch]                       	## 
git push [origin] :[branch] [branch]              	## 
git push [origin] [branchLocal]:[branchRemote]    	## 
git push [origin] --delete [branch]               	## 
git push -u [origin] [master]                     	## 
git push -u [origin] --all                        	## 
git push -u [origin] --tags                       	## 
git push --delete [remote_name] [branch]          	## 
git push --set-upstream [origin] [branch]         	## 
git checkout [branch]								## 
git checkout [file]									## 
git checkout -b [branch]							## 
git checkout -b [branch] [origin/branch]			## 
git branch											## 
git branch [branch]									## 
git branch -a										## 
git branch -a -vv									## view list of branches
git branch -d [branch]								## delete branch
git branch -D [branch]								## delete branch
git branch -m [oldName] [newName]					## 
git branch -v										## 
git branch -vv										## 
git branch --merged									## 
git branch --no-merged								## 
git merge [branchHotfix]							## 
git merge [origin/branch]							## 
git merge --no-ff [branch]							## 
git mergetool										## 
git rebase [branch]									## 
git rebase [master] [server]						## 
git rebase --onto master [server] [client]			## 
-- git checkout [master]							## 
-- git merge [client]								## 
git checkout --track [origin/branch]				## 
git branch -u [origin/branch]						## 
git merge @{u}										## 
git branch --list									## view list of branches
git fetch origin master:master						## get other branch
git pull origin master:master						## get other branch
git branch -r --list								## view remote list of branches
git branch -r -d all/preview						## delete remote branch
git push all -d preview								## delete remote branch
```

## Stashes
```
git stash                                         	## hide the changes in a special stash section
git stash list                                    	## list of hidden changes
git stash apply                                   	## apply the last stash
git stash apply stash@{2}                         	## apply the specified stash
git stash apply --index                           	## apply the last stash and make changes to the index
git stash drop                                    	## delete the last files placed in the temporary stash
git stash pop                                     	## apply hidden changes and immediately remove them from the stack
git stash branch                                  	## create branches from hidden changes
```

## How to revert uncommitted changes including files and folders?
```
git reset --hard                                  	## Revert changes to modified files.
git clean -fd                                     	## Remove all untracked files and directories.
```

## Revert changes
```
git checkout .                                    	## revert changes made to your working copy for all directories and files
git checkout [folder/file]                        	## revert changes made to your working copy for directory/file
git reset [folder/file]                           	## revert changes made to the index
git revert [commit 1] [commit 2]                  	## revert a change that you have committed
git clean -f                                      	## remove untracked files
git clean -fd                                     	## remove untracked directories
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
git branch -m oldname newname                     	## local renaming
git push origin :old_branch                       	## remote deleting old branch
git push origin new_branch                        	## remote creating new branch
git config --global alias.branchm "!git branch -m $2 $3 && git push $1 :$2 $3 -u #"
git branchm origin old_branch new_branch          	## remote branch renaming
```

## Push all repos
```
git remote show origin								## view and copy push URL
git remote show second								## view and copy push URL
git remote add all https://github.com/...git		## add new remote 'all' repo with 'origin' repo link
git remote set-url --add all https://...git			## add second repo into "all" repo
git remote remove origin							## remove 'origin' repo
git remote remove second							## remove 'second' repo
git pull all main                              		## get remote main branch
git push -u all main								## set upstream
git push											## push changes
git pull											## get remote branch
```

## Make current stash, rollback to need commit, publish need commit, restore the stash
```
git stash                                         	## make stash
git hist                                          	## view commits hashes
git checkout <hash2>                              	## move HEAD to commit 2
## make product publish
git restore .                                     	## restore all files after publish
git hist                                          	## view commits hashes
git checkout <hash1>                              	## move HEAD to 'commit 1'
git branch -f main <hash1>                        	## move the 'main' branch to 'commit 1'
git checkout main                                 	## move HEAD to the 'main' branch
git stash list                                    	## view list of stashes
git stash apply stash@{0}                         	## apply the backup stash
git stash drop                                    	## drop the backup stash
```

## Merge conflicts
```
git merge --quit
git reset .
git checkout .
git clean -fd
```

## SSH sign
```
git verify-commit -v <hash1>						## print commit contents
```
