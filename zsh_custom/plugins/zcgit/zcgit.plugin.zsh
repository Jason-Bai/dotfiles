#
# Aliases
#

# Check for test and similarly named branches
function git_test_branch() {
  command git rev-parse --git-dir &>/dev/null || return
  local branch
  for branch in test; do
    if command git show-ref -q --verify refs/heads/$branch; then
      echo $branch
      return
    fi
  done
  echo test
}

function gpo() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git push origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git push origin "${b:=$1}"
  fi
}

function gpl() {
  if [[ "$#" != 0 ]] && [[ "$#" != 1 ]]; then
    git pull origin "${*}"
  else
    [[ "$#" == 0 ]] && local b="$(git_current_branch)"
    git pull origin "${b:=$1}"
  fi
}

alias gac='git add . && git commit -m'
alias gcob='git checkout -b'
alias gcod='git checkout $(git_develop_branch)'
alias gcot='git checkout $(git_test_branch)'
alias gct='git checkout $(git_test_branch)'
alias gcom='git checkout $(git_main_branch)'

alias ghelp='git help'

alias gls='git log --stat'
alias glsp='git log --stat --patch'
alias glg='git log --graph'
alias glpf="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"

alias gs='git status'
