#!/bin/bash

set -e

CloneDir=$(dirname $(dirname $(realpath $0)))
GitPkgDir=$HOME/Packages

service_ctl() {
    local unit="$1"

    if systemctl is-enabled "$unit" &>/dev/null; then
        echo "$unit is already enabled"
    else
        echo "enabling $unit..."
        sudo systemctl enable --now "$unit"
    fi
}

pkg_installed() {
  pacman -Qi "$1" &>/dev/null
  return $?
}

pkg_available() {
  pacman -Si "$1" &>/dev/null
  return $?
}

chk_aurh() {
  if pkg_installed yay; then
    aurhlpr="yay"
  elif pkg_installed paru; then
    aurhlpr="paru"
  fi
}

aur_available() {
  chk_aurh
  $aurhlpr -Si "$1" &>/dev/null
  return $?
}
