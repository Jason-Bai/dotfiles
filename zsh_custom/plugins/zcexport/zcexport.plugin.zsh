# tmux-session-tmp
export TMUX_TMPDIR=~/.tmux/tmp

# mysql
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

#  go
export PATH="/usr/local/opt/go@1.17/bin:$PATH"

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# pnpm
export PNPM_HOME="/Users/baiyu/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end
#

# ncurses
export PATH="/usr/local/opt/ncurses/bin:$PATH"
