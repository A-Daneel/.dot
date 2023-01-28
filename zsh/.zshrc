addToPathFront() {
    if [[ "$PATH" != *"$1"* ]]; then
        export PATH=$1:$PATH
    fi
}

export ZSH=$HOME/.oh-my-zsh
export GOPATH=$HOME/go
export SONAR_JAVA_PATH=/usr/lib/jvm/java-11-openjdk-amd64/bin/java

addToPathFront $HOME/go/bin
addToPathFront /usr/local/go/bin
addToPathFront $HOME/.local/.npm-global/lib/node_modules/vls/bin
addToPathFront $HOME/.local/.npm-global/bin

ZSH_THEME="robbyrussell"
HIST_STAMPS="yyyy/mm/dd"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
export EDITOR=nvim

source $HOME/.zsh_profile
alias luamake=/home/daneel/lua-language-server/3rd/luamake/luamake

