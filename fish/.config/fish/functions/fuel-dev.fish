function fuel-dev --description 'connect to fuel dev cluster'
  set -gx KUBECONFIG ~/.kube/fuel-dev-2
  set -gx AWS_PROFILE fuel-dev-2
  aws sso login --profile fuel-dev-2 $argv
end
