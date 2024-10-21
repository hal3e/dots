function fuel-main --description 'connect to fuel mainnet cluster'
  set -gx KUBECONFIG ~/.kube/fuel-main
  set -gx AWS_PROFILE fuel-main
  aws sso login --profile fuel-main $argv
end
