# Defined via `source`
function upgrade --wraps='sudo xbps-install -Suv && ~/scpt/xpbs-packages.sh' --wraps='sudo xbps-install -Suv && /home/hal3e/scpt/xbps-packages.sh' --wraps='sudo xbps-install -Suv && /home/hal3e/scrpt/xbps-packages.sh && sudo xbps-remov -Oo' --wraps='sudo xbps-install -Suv && /home/hal3e/scpt/xbps-packages.sh && sudo xbps-remov -Oo' --wraps='sudo xbps-install -Suv && /home/hal3e/scpt/xbps-packages.sh && sudo xbps-remove -Oo' --description 'alias upgrade=sudo xbps-install -Suv && /home/hal3e/scpt/xbps-packages.sh && sudo xbps-remove -Oo'
  sudo xbps-install -Suv && /home/hal3e/scpt/xbps-packages.sh && sudo xbps-remove -Oo $argv; 
end
