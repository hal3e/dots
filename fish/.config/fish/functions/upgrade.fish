function upgrade --wraps='sudo xbps-install -Suv && /home/hal3e/bin/xbps-num-packages.sh && sudo xbps-remove -Oo && xcheckrestart' --description 'alias upgrade=sudo xbps-install -Suv && /home/hal3e/bin/xbps-num-packages.sh && sudo xbps-remove -Oo && xcheckrestart'
  sudo xbps-install -Suv && ~/bin/xbps-num-packages.sh && sudo xbps-remove -Oo && xcheckrestart;
end
