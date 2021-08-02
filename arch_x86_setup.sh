x=0
y=0
z=0
while [$x == 5]
	do
		echo "Are you currently using Artix Linux? [Y/N]"
		read linuxOs

		if ["$linuxOs" == "y"] || ["$linuxOs" == "Y"]; then
			PKGS+=('')
			x=1
		elif ["$linuxOs" == "n"] || ["$linuxOs" == "N"]; then
			PKGS+=('base-devel')
			x=1
		fi

		echo "Are you using AMD or Intel CPU? [A/C]"
		read cpu

		if ["$cpu" == "a"] || ["$cpu" == "A"]; then
			PKGS=('amd-ucode')
			y=1
		elif ["$cpu" == "i"] || ["$cpu" == "I"]; then
			PKGS=('intel-ucode')
			y=1
		fi

		echo "Are you using AMD, Intel or Nvidia GPU? [A/C/N]"
		read gpu

		if ["$gpu" == "a"] || ["$gpu" == "A"]; then
			PKGS=('')
			z=1
		elif ["$gpu" == "n"] || ["$gpu" == "N"]; then
			PKGS=('')
			z=1
		elif ["$gpu" == "i"] || ["$gpu" == "I"]; then
			PKGS=('')
			z=1
		fi

	done

echo Installing Packages Arch Linux x86 
cd $HOME
PKGS=(
'git'
'wget'
'neovim'
'vi'
'zsh'
'yay'
'chromium'
'neofetch'
'python'
'npm'
'x86-video-amdgpu'
'go'
'guake'
'kitty'
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
