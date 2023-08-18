(( $+commands[npm] )) && {
  command rm -f "${ZSH_CACHE_DIR:-$ZSH/cache}/npm_completion"

  _npm_completion() {
    local si=$IFS
    compadd -- $(COMP_CWORD=$((CURRENT-1)) \
                 COMP_LINE=$BUFFER \
                 COMP_POINT=0 \
                 npm completion -- "${words[@]}" \
                 2>/dev/null)
    IFS=$si
  }
  compdef _npm_completion npm
}


# Install dependencies globally
alias nig="npm i -g "

# npm package names are lowercase
# Thus, we've used camelCase for the following aliases:

# Install and save to dependencies in your package.json
# npms is used by https://www.npmjs.com/package/npms
alias nis="npm i -S "

# Install and save to dev-dependencies in your package.json
# npmd is used by https://github.com/dominictarr/npmd
alias nid="npm i -D "

# Force npm to fetch remote resources even if a local copy exists on disk.
alias nif='npm i -f'

# Execute command from node_modules folder based on current directory
# i.e npmE gulp
alias ne='PATH="$(npm bin)":"$PATH"'

# Check which npm modules are outdated
alias no="npm outdated"

# Update all the packages listed to the latest version
alias nu="npm update"

# Check package versions
alias nV="npm -v"

# List packages
alias nlt="npm list"

# List top-level installed packages
alias nlt0="npm ls --depth=0"

# Run npm start
alias ns="npm start"

# Run npm test
alias nt="npm test"

# Run npm scripts
alias nr="npm run"

# Run npm publish 
alias np="npm publish"

# Run npm publish with public
alias npap="npm publish --access public"

# Run npm init
alias ni="npm init"

# Run npm info
alias ninfo="npm info"

# Run npm search
alias nse="npm search"

# Run npm run dev
alias nd="npm run dev"

# run npm run build
alias nb="npm run build"

npm_toggle_install_uninstall() {
  # Look up to the previous 2 history commands
  local line
  for line in "$BUFFER" \
    "${history[$((HISTCMD-1))]}" \
    "${history[$((HISTCMD-2))]}"
  do
    case "$line" in
      "npm uninstall"*)
        BUFFER="${line/npm uninstall/npm install}"
        (( CURSOR = CURSOR + 2 )) # uninstall -> install: 2 chars removed
        ;;
      "npm install"*)
        BUFFER="${line/npm install/npm uninstall}"
        (( CURSOR = CURSOR + 2 )) # install -> uninstall: 2 chars added
        ;;
      "npm un "*)
        BUFFER="${line/npm un/npm install}"
        (( CURSOR = CURSOR + 5 )) # un -> install: 5 chars added
        ;;
      "npm i "*)
        BUFFER="${line/npm i/npm uninstall}"
        (( CURSOR = CURSOR + 8 )) # i -> uninstall: 8 chars added
        ;;
      *) continue ;;
    esac
    return 0
  done

  BUFFER="npm install"
  CURSOR=${#BUFFER}
}

zle -N npm_toggle_install_uninstall

# Defined shortcut keys: [F2] [F2]
bindkey -M emacs '^[OQ^[OQ' npm_toggle_install_uninstall
bindkey -M vicmd '^[OQ^[OQ' npm_toggle_install_uninstall
bindkey -M viins '^[OQ^[OQ' npm_toggle_install_uninstall
