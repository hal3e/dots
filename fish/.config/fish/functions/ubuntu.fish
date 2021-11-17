function ubuntu --wraps='qemu-system-x86_64 -m 4096 -cpu host -enable-kvm -net nic -net user,hostfwd=tcp::10022-:22 -drive file=/home/hal3e/vrt/ubuntu-20-04.qcow2,media=disk,if=virtio' --description 'alias ubuntu=qemu-system-x86_64 -m 4096 -cpu host -enable-kvm -net nic -net user,hostfwd=tcp::10022-:22 -drive file=/home/hal3e/vrt/ubuntu-20-04.qcow2,media=disk,if=virtio'
  qemu-system-x86_64 -m 4096 -cpu host -enable-kvm -net nic -net user,hostfwd=tcp::10022-:22 -drive file=/home/hal3e/vrt/ubuntu-20-04.qcow2,media=disk,if=virtio $argv; 
end
