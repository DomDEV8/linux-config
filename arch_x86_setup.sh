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
)

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done
# Security 
#git clone https://github.com/ChrisTitusTech/secure-linux.git
#cd secure-linux
#sh secure.sh

echo "Finished!"
