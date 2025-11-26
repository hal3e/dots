function upgrade
  sudo xbps-install -Suv || return 1
  sudo xbps-remove -Oo || return 2
  xcheckrestart || return 3

  pkill rstat || return 4
  ~/pro/rstat/target/release/rstat&
  disown
end
