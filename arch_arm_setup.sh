echo "Insatlling Packages"
cd $HOME
PKGS=(
'vim'
'git'
'zsh'
'chromium'
'base-devel'
'noto-fonts'
'wget'
		)
for PKG in "${PKGS[@]}"; do
		echo "Installing: ${PKG}"
		sudo pacman -S "$PKG" --noconfirm --needed
done

echo "Installation Finished successfully"
