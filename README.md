# dotfiles

这个项目旨在发现日常工具中提供的自定义入口，记录下来或迁移之后复用

## 如何使用 zsh-custom

- 1. 首先需要安装 oh-my-zsh 在本地，不会安装的同学自行搜索并安装
- 2. 拉取本仓库到$HOME 目录下
- 3. 在$HOME/.zshrc文件修改一下变量ZSH_CUSTOM=$HOME/dotfiles/zsh_custom
- 4. 修改$HOME/.zshrc 文件中 plugns=(zcnpm)部分，注意这个操作会把 oh-my-zsh 默认的 npm 覆盖

### zsh-custom#zcnpm 修改说明

- 1. 将 npmXXX 部分统一修改为 nXXX

注意：使用之前需简单检查一下 zsh_custom/zcnpm/npm.plugin.zsh 中的 alias 是否已经存在系统中，如果存在请自行修改

### zsh-custom#zcdocker 修改说明

### zsh-custom#zcexport 修改说明

### zsh-custom#zcgit 修改说明

### zsh-custom#zclinux 修改说明

### zsh-custom#zcneovim 修改说明

### zsh-custom#zcnvm 修改说明

### zsh-custom#zcpnpm 修改说明

### zsh-custom#zctmux 修改说明

### zsh-custom#zcvpn 修改说明

### zsh-custom#zcyarn 修改说明

## 如何使用 tmux-custom

- 1. 首先到 tmux tpm 里 git clone 一下 tpm，git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
- 2. 建立软链：ls -s ln -s $HOME/dotfiles/tmux_custom/.tmux.conf $HOME/.tmux.conf
- 3. 然后 vi $HOME/.tmux.conf, prefix + I 安装 tmux 插件
