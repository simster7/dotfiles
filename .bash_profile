# added by Anaconda3 4.4.0 installer
export PATH="/Users/simonbehar/anaconda3/bin:$PATH"
export PATH=$PATH:~/.android-sdk-macosx/platform-tools/

export BROWSER=open

export PS1="[\#]:\W 🌵  "

alias 1and1="ssh u51743908@home268846302.1and1-data.host"

alias ls="ls -l"
alias rm="rm -i"
#alias ag="ag --nocolor"

alias mvim="/Applications/MacVim.app/Contents/MacOS/Vim -g"
alias wvim="mvim -N -u ~/.write.vimrc -c 'Goyo'"

alias qbo="export JAVAROOT=`/usr/libexec/java_home`;. /Users/sbeharyutk/dev/qbo/src/build/bin/qbo.env; /Users/sbeharyutk/dev/ecosystem-docker/start.sh"
alias ktlq="kubectl --kubeconfig=/Users/sbeharyutk/.kube/kubeconfig/admins\@accounting-core-qbo-iks-usw2-ppd-qal"
alias ktlp="kubectl --kubeconfig=/Users/sbeharyutk/.kube/kubeconfig/admins@accounting-accountingcore-qbomonolith-usw2-ppd-pr"

alias bike="python ~/Documents/Scripts/ebikes.py"
alias wbike="python ~/Documents/Scripts/ebikes.py -w"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

# added by Miniconda3 4.5.11 installer
export PATH="/miniconda3/bin:$PATH"
