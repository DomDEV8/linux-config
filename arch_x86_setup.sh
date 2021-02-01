echo Installing Packages Arch Linux x86 
cd $HOME
packages = (
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
)

for package in"${packages[@]}"; do
		echo "Installing: ${package}"
		sudo pacman -S "$package" --noconfirm --needed
done

# Ask if security needed
#git clone https://github.com/ChrisTitusTech/secure-linux.git
#cd secure-linux
#sh secure.sh

echo "Finished!"
