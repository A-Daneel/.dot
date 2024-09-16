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
addToPathFront /usr/local/texlive/2023/bin/x86_64-linux
addToPathFront $HOME/.idea/bin/

ZSH_THEME="robbyrussell"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
export EDITOR=nvim

source $HOME/.zsh_profile
alias luamake=/home/daneel/lua-language-server/3rd/luamake/luamake


PATH="/home/daneel/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/daneel/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/daneel/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/daneel/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/daneel/perl5"; export PERL_MM_OPT;
