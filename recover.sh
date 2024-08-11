#!/usr/bin/env bash

set -e

function yesno() {
    local prompt="$1"

    while true; do
        read -rp "$prompt [y/n] " yn
        case $yn in
            [Yy]* ) echo "y"; return;;
            [Nn]* ) echo "n"; return;;
            * ) echo "Please answer yes or no.";;
        esac
    done
}

BOOTDISK=$(readlink -f /dev/disk/by-label/NIXBOOT)
reformat_boot=$(yesno "Reformat boot?")
if [[ $reformat_boot == "y" ]]; then
    sudo mkfs.fat -F 32 "$BOOTDISK" -n NIXBOOT
fi

# -l prompts for passphrase if needed
echo "Importing zpool"
sudo zpool import -f -l zroot

reformat_nix=$(yesno "Reformat nix?")
if [[ $reformat_nix == "y" ]]; then
    sudo zfs destroy -r zroot/nix

    sudo zfs create -o mountpoint=legacy zroot/nix
    sudo mkdir -p /mnt/nix
    sudo mount -t zfs zroot/nix /mnt/nix
fi

echo "Mounting Disks"

sudo mount --mkdir -t zfs zroot/root /mnt
sudo mount --mkdir "$BOOTDISK" /mnt/boot
sudo mount --mkdir -t zfs zroot/nix /mnt/nix
sudo mount --mkdir -t zfs zroot/tmp /mnt/tmp
sudo mount --mkdir -t zfs zroot/persist /mnt/persist
sudo mount --mkdir -t zfs zroot/cache /mnt/cache


read -rp "Enter git rev for flake (default: main): " git_rev
echo "Reinstalling NixOS"
# nixos minimal iso does not have git add your own repo
nix-shell -p git nixFlakes --command \
    "sudo nixos-install --flake \"github:emptemperor/Nixos-Config/${git_rev:-main}#$nixos\""
