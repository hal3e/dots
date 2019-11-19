function upd-dupg-arem --description 'Update, upgrade and autoremove'
  command sudo apt update; and sudo apt dist-upgrade -y; and sudo apt-get autoremove -y
end
