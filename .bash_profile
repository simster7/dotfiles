
# Settings
export PS1="[\#]:\W 🌵  "
export BROWSER=open

# Paths
export GOPATH=~/go
export PATH="/Users/simonbehar/anaconda3/bin:$PATH"
export PATH="/miniconda3/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# Extensions
if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
fi
if [ -x "$(command -v thefuck)" ]; then
    eval $(thefuck --alias)
fi

# Aliases
alias 1and1="ssh u51743908@home268846302.1and1-data.host"
alias so="source ~/.bash_profile"
alias rc="vim ~/.bash_profile"
alias ls="ls -l"
alias rm="rm -i"
alias wvim="mvim -N -u ~/.write.vimrc -c 'Goyo'"
#alias mvim="/Applications/MacVim.app/Contents/MacOS/Vim -g"

# TODO: Extract this into a function
alias merged="echo `git rev-parse --abbrev-ref HEAD` | xargs -I {}  sh -c '[[ {} != \"master\" ]] && git checkout master && git branch -d {}' && git pull"

# Profile extensions
if [ -f ~/.work ]; then
    source ~/.work_bash_profile
fi
