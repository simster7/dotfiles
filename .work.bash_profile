alias qbo='cd $HOME/dev/qbo/src/qbo; $HOME/dev/ecosystem-docker/start.sh'

function ktl {

C17="--kubeconfig=/Users/sbeharyutk/.kube/kubeconfig/admins@accounting-core-qbo-c17-usw2-ppd-qal"
C16="--kubeconfig=/Users/sbeharyutk/.kube/kubeconfig/admins@accounting-core-qbo-c16-usw2-ppd-qal"
C15="--kubeconfig=/Users/sbeharyutk/.kube/kubeconfig/admins@accounting-core-qbo-c15-usw2-ppd-qal"
PR="--kubeconfig=/Users/sbeharyutk/.kube/kubeconfig/admins@accounting-accountingcore-qbomonolith-usw2-ppd-pr"
E2E="--kubeconfig=/Users/sbeharyutk/.kube/kubeconfig/admins@accounting-core-qbo-iks-usw2-ppd-e2e"

    case $1 in
        "c15")
            kubeconfig="$C15"
            ;;
        "c16")
            kubeconfig="$C16"
            ;;
        "c17")
            kubeconfig="$C17"
            ;;
        "pr")
            kubeconfig="$PR"
            ;;
        "e2e")
            kubeconfig="$E2E"
            ;;
        *)
            echo "$1 is not an valid cluster";
            ;;
    esac

    case $2 in
        "del")
            export NSL=(pdb cm ingress rollout all)
            echo ${NSL[*]} | xargs -n 1 -I {} kubectl "$kubeconfig" delete {} -l type="$3"
            ;;
        "sh")
            kubectl "$kubeconfig" exec -ti "$3" sh
            ;;
        *)
            kubectl "$kubeconfig" "${@:2}"
            ;;
    esac
}

function delp { export NSL=(pdb cm ingress rollout all); echo ${NSL[*]} | xargs -n 1 -I {} kubectl --kubeconfig=/Users/sbeharyutk/.kube/kubeconfig/admins@accounting-accountingcore-qbomonolith-usw2-ppd-pr delete {} -l pr=pr"$1"; }

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
