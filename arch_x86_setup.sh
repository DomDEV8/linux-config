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
'amd-ucode'
'xf86-video-amdgpu'
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

touch $HOME/mirrorlist-arch
reflector --save $HOME/mirrorlist-arch -c gb -c fr -c cn -c nl -c it -c ca -c nl -c us -f 20 -p "https"
cp -r /etc/pacman.d/mirrorlist-arch /etc/pacman.d/mirrrorlist-arch-default
sudo mv $HOME/mirrorlist-arch /etc/pacman.d/


echo "Finished!"
