# Settings
export PS1="[\#]:\W 🌵  "
export BROWSER=open

# Paths
export GOPATH=~/go
export PATH="/Users/simonbehar/anaconda3/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# Extensions
if [ -f ~/.fzf.bash ]; then
    source ~/.fzf.bash
fi
if [ -x "$(command -v thefuck)" ]; then
    eval $(thefuck --alias)
fi

# Aliases
alias k="kubectl"
alias 1and1="ssh u51743908@home268846302.1and1-data.host"
alias so="source ~/.bash_profile"
alias rc="vim ~/.bash_profile"
alias ls="ls -l"
alias wf="cd ~/go/src/github.com/argoproj/argo"
alias acd="cd ~/go/src/github.com/argoproj/argo-cd"
alias rm="rm -i"
# alias mvim="/Applications/MacVim.app/Contents/MacOS/Vim -g"
alias wvim="mvim -N -u ~/.write.vimrc -c 'Goyo'"
#alias mvim="/Applications/MacVim.app/Contents/MacOS/Vim -g"

# TODO: Extract this into a function
alias merged="echo `git rev-parse --abbrev-ref HEAD` | xargs -I {}  sh -c '[[ {} != \"master\" ]] && git checkout master && git branch -d {}' && git pull"

function cal {
    if [[ "$1" =~ ^[A-Za-z]+$ && "$#" == 1 ]]; then
        /usr/bin/cal "$1" `date +'%Y'`
    else
        /usr/bin/cal "$@"
    fi
}

# Profile extensions
if [ -f ~/._work ]; then
    source ~/.work.bash_profile
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/sbeharyutk/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/sbeharyutk/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/sbeharyutk/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/sbeharyutk/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

