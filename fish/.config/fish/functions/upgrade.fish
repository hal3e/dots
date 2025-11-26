function upgrade
  sudo xbps-install -Suv || return 1
  sudo xbps-remove -Oo || return 2
  xcheckrestart || return 3

  pkill stsr || return 4
  stsr &
  disown
end
