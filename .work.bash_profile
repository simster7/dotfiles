
function pl { kubectl logs $1 -c ${2:-main}; }
