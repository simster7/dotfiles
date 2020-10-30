
function pl { kubectl logs $1 -c ${2:-main}; }
alias wfs="cd ~/go/src/github.com/argoproj/argo"
alias wf="k get wf -o yaml"
alias acd="cd ~/go/src/github.com/argoproj/argo-cd"
