# Required tools
## starship: https://starship.rs/guide/#%F0%9F%9A%80-installation
Linux installation 
```sh
curl -sS https://starship.rs/install.sh | sh -s -- --bin-dir ~/bin
```

# Windows install steps
```
git config --global core.sshCommand "C:/Windows/System32/OpenSSH/ssh.exe"
chezmoi init cazador481/dotfiles --branch lazyvim-merge --ssh
```
