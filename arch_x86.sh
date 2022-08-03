#!/bin/bash
cd $HOME
PKGS=(
  "neovim"
  "git"
  "zsh"
  "wget"
  "lua"
  "htop"
  "nodejs"
  "npm"
  "build-essential"
  "llvm"
  "clang"
  "dpkg-dev"
  "golang"
  "kitty"
  "python3-pip"
)

PKG_REMOVE = ()

GIT_PKGS = ()

SERVICES = ()

sudo pacman -Syu

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done