# Defined via `source`
function scp
  set -x SSH_AUTH_SOCK (gpgconf --list-dirs agent-ssh-socket)
  set -x GPG_TTY (tty);
  gpg-connect-agent UPDATESTARTUPTTY /bye > /dev/null;
  /usr/bin/scp $argv; 
end
