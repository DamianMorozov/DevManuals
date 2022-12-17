# GIT unprotect

## remote: GitLab: You are not allowed to push code to protected branches on this project
Folow the steps:
1. Try push
`git push` - `failed to push some refs to`
`git push -f` - `remote rejected`
2. The branch is in a protected state and cannot be forced to operate
`Gitlab -> Repository -> Branches`
3. Temporarily remove branch protection
`Gitlab -> Settings -> Repository -> Protected Branches -> Unprotect`
4. Try pushing again
`git push -f`
5. Add back protection
`Gitlab -> Settings -> Repository -> Protected Branches -> Protect a branch`
`Branch -> Allowed to merge + Maintainers - Allowed to push + Maintainers -> Allowed to force push + No -> Protect`
