# 配置文件
- `git clone git@github.com:trace1729/dotfiles.git` 
- `cd dotfiles`
- `cp .* ~/`
- `cp -r .config .vim ~/`
 
有三个文件建立了`hard link` 会与本机同步更改
1. `.vim/sync.vim` --> 应用于 .vimrc.custom.config
2. `.config/ranger/rc.conf` --> 应用于 ranger 
3. `.alias` --> 应用于 .bashrc
