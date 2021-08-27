PKGS=(
'git'
'wget'
'neovim'
'htop'
'vim'
'zsh'
'chromium'
'neofetch'
'python'
'npm'
'go'
'guake'
'kitty'
'noto-fonts-emoji'
'lua'
'reflector'
)

MAKEPKGS=(
'https://aur.archlinux.org/vscodium-bin.git'
'https://aur.archlinux.org/yay.git'
)

echo Installing Arch x86 Packages 



for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

echo "Finished!"
