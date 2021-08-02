x=0
y=0
z=0
while [$x == 5]
	do
		echo "Are you currently using Artix Linux? [Y/N]"
		read linuxOs

		if ["$linuxOs" == "y"] || ["$linuxOs" == "Y"] && ["$x" == 0]; then
			PKGS+=('')
			x=1
		elif ["$linuxOs" == "n"] || ["$linuxOs" == "N"] && ["$x" == 0]; then
			PKGS+=('base-devel')
			x=1
		fi

		echo "Are you using AMD or Intel CPU? [A/C]"
		read cpu

		if ["$cpu" == "a"] || ["$cpu" == "A"] && ["$y" == 0]; then
			PKGS=('amd-ucode')
			y=1
		elif ["$cpu" == "i"] || ["$cpu" == "I"] && ["$y" == 0]; then
			PKGS=('intel-ucode')
			y=1
		fi

		echo "Are you using AMD, Intel or Nvidia GPU? [A/C/N]"
		read gpu

		if ["$gpu" == "a"] || ["$gpu" == "A"] && ["$z" == 0]; then
			PKGS=('x86-video-amdgpu')
			## git clone https://aur.archlinux.org/opencl-amd.git
			## git clone https://aur.archlinux.org/amdgpu-pro-installer.git
			z=1
		elif ["$gpu" == "n"] || ["$gpu" == "N"] && ["$z" == 0]; then
			PKGS=('')
			z=1
		elif ["$gpu" == "i"] || ["$gpu" == "I"] && ["$z" == 0]; then
			PKGS=('')
			z=1
		fi

	done

echo Installing Arch x86 Packages 
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
'go'
'guake'
'kitty'
'noto-fonts-emoji'
)

MAKEPKGS=(
'https://aur.archlinux.org/vscodium-bin.git'
)


for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo pacman -S "$PKG" --noconfirm --needed
done

for MAKEPKG in "${MAKEPKGS[@]}"; do
	cd $HOME
	git clone "$MAKEPKG" 
	cd "$MAKEPKG"
	makepkg --si	
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
