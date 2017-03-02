# Uses git's autocompletion for inner commands. Assumes an install of git's
# bash `git-completion` script at $completion below (this is where Homebrew
# tosses it, at least).
completion='$(brew --prefix)/share/zsh/site-functions/_git'

if test -f $completion
then
  source $completion
fi

_git_remote_branch() {
  ref=$(git symbolic-ref HEAD 2> /dev/null)
  if [[ -n $ref ]]; then
    if (( CURRENT == 2 )); then
      compadd create new publish remotize share delete destroy kill remove rm rename rn mv move track follow grab fetch
    elif (( CURRENT == 3 )); then
      compadd `git branch | sed "s/[\* ]//g"`
    fi
  else;
    _files
  fi
}
compdef _git_remote_branch grb
