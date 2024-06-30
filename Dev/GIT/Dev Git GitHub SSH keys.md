# GitHub SSH keys

- [SSH keys](https://github.com/settings/keys)
- [Connecting to GitHub with SSH](https://docs.github.com/en/authentication/connecting-to-github-with-ssh)
- [Setting up SSH-Agent in Windows for Passwordless Git Authentication](https://interworks.com/blog/2021/09/15/setting-up-ssh-agent-in-windows-for-passwordless-git-authentication/)

## Generate SHH at cmd
```
ssh-keygen -t ed25519 -C "your_email@example.com"
```

## Store at [GitHub SSH keys](https://github.com/settings/keys)

## Run ssh-agent at Windows PowerShell
```
Get-Service ssh-agent | Set-Service -StartupType Automatic -PassThru | Start-Service
start-ssh-agent.cmd
```

## Testing your SSH connection at cmd
```
ssh-add path_to_add_ssh/private_key
ssh-add -D path_to_remove_ssh/private_key
ssh -T git@github.com
```

## Copy SSH file to another PC
```
copy path_to_remove_ssh/private_key into c:\Users\user\.ssh\
ssh-add path_to_add_ssh/private_key
ssh -T git@github.com
```

## Git global config
```
git config --global --list
git config --global gpg.format ssh
git config --global --unset gpg.format
git config --global user.signingkey /PATH/TO/.SSH/KEY.PUB
git config --global commit.gpgsign true
```

## Git local config
```
git config --list
git config gpg.format ssh
git config --unset gpg.format
git config user.signingkey /PATH/TO/.SSH/KEY.PUB
git config commit.gpgsign true
```

## Adding or changing a passphrase
```
ssh-keygen -p -f ~/.ssh/id_ed25519
```

## Creates a signed commit
```
git commit -S -m "YOUR_COMMIT_MESSAGE"
```
