# Defined in - @ line 1
function upgrade --wraps='sudo xbps-install -Suv && ~/scpt/xpbs-packages.sh' --wraps='sudo xbps-install -Suv && /home/hal3e/scpt/xbps-packages.sh' --description 'alias upgrade=sudo xbps-install -Suv && /home/hal3e/scpt/xbps-packages.sh'
  sudo xbps-install -Suv && /home/hal3e/scpt/xbps-packages.sh $argv;
end
