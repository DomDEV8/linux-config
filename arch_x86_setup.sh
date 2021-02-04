echo Installing Packages Arch Linux x86 
cd $HOME
PKGS=(
'git'
'wget'
'vim'
'vi'
'zsh'
'yay'
'chromium'
'neofetch'
'discord'
'python'
'npm'
'x86-video-amdgpu'
'base-devel'
'go'
'noto-fonts-emoji'
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

git clone https://aur.archlinux.org/yay.git
cd $HOME/yay
makepkg --clean --install
cd $HOME

git clone https://aur.archlinux.org/vscodium-bin.git
cd $HOME/vscodium-bin
makepkg --clean --install
cd $HOME


# Security 
git clone https://github.com/ChrisTitusTech/secure-linux.git
cd $HOME/secure-linux
sh secure.sh

echo "Finished!"
