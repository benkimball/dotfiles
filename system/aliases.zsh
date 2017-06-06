# grc overides for ls
#   Made possible through contributions from generous benefactors like
#   `brew install coreutils`
if $(gls &>/dev/null)
then
  alias ls="gls -F --color"
  alias ll="gls -lAh --color"
  alias l="gls -lFh --color"
  alias la='gls -A --color'
fi

alias be="bundle exec"
alias fu="bundle exec"
alias m=tm

alias unity="/Applications/Unity/Unity.app/Contents/MacOS/Unity -force-metal"
