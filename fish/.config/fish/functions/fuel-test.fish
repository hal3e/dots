function fuel-test --description 'connect to fuel testnet cluster'
  set -gx KUBECONFIG ~/.kube/fuel-test
  set -gx AWS_PROFILE fuel-test
  aws sso login --profile fuel-test $argv
end
