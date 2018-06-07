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
    if ((CURRENT == 2)); then
      compadd create new publish remotize share delete destroy kill remove rm rename rn mv move track follow grab fetch
    elif (( CURRENT == 3 )); then
      # if command is `grb publish ` then I would like to be
      # able to just hit <tab> to complete the name of the current branch
      # the following did not work
      # if (( ${words[2]} == publish )); then
      #   compadd `git symbolic-ref HEAD | cut -c12-`
      # else
        compadd ${$(git branch)//[\*[:space:]]}
      # fi
    fi
  else;
    _files
  fi
}
compdef _git_remote_branch grb

git_pr() {
  branch=$(git branch | grep "^\*" | cut -d ' ' -f 2)
  if [[ $branch = release* ]]; then
    open "https://github.com/borrowedandblue/borrowed-and-blue/compare/master...$branch?expand=1" -a "Google Chrome"
  else;
    open "https://github.com/borrowedandblue/borrowed-and-blue/compare/$branch?expand=1" -a "Google Chrome"
  fi
}
