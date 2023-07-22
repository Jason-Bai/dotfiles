if ! (( $+commands[tmux] )); then
  print "zsh tmux plugin: tmux not found. Please install tmux before using this plugin." >&2
  return 1
fi

# ALIASES

alias etc='nv $ZSH_TMUX_CONFIG'
