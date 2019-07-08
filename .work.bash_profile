alias ktlq="kubectl --kubeconfig=/Users/sbeharyutk/.kube/kubeconfig/admins@accounting-core-qbo-c17-usw2-ppd-qal"
alias ktlp="kubectl --kubeconfig=/Users/sbeharyutk/.kube/kubeconfig/admins@accounting-accountingcore-qbomonolith-usw2-ppd-pr"
alias ktle="kubectl --kubeconfig=/Users/sbeharyutk/.kube/kubeconfig/admins@accounting-core-qbo-iks-usw2-ppd-e2e"

function delpr { export NSL=(cm ingress rollout all); echo ${NSL[*]} | xargs -n 1 -I {} kubectl --kubeconfig=/Users/sbeharyutk/.kube/kubeconfig/admins@accounting-accountingcore-qbomonolith-usw2-ppd-pr delete {} -l pr=pr"$1"; }
function delqa { export NSL=(cm ingress rollout all); echo ${NSL[*]} | xargs -n 1 -I {} kubectl --kubeconfig=/Users/sbeharyutk/.kube/kubeconfig/admins@accounting-core-qbo-c17-usw2-ppd-qal delete {} -l type="$1"; }

function csh { ktlq exec -ti $1 sh; }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
