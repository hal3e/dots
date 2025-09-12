function upgrade
  sudo xbps-install -Suv || exit 1
  sudo xbps-remove -Oo || exit 2
  xcheckrestart || exit 3

  pkill rstat || exit 4
  ~/pro/rstat/target/release/rstat&
  disown
end
