export ZSH=$HOME/.oh-my-zsh
export GOROOT=/usr/local/go
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH

ZSH_THEME="robbyrussell"
HIST_STAMPS="yyyy/mm/dd"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
export EDITOR='nvim'

source $HOME/.zsh_profile
export PATH=$PATH:$HOME/.local/bin
export PATH=$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH
export PATH=$PATH:/usr/local/go/bin
alias luamake=/home/daneel/lua-language-server/3rd/luamake/luamake
