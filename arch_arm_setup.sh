echo "-------------------------"
echo "Do you want to install GUI?[y/n]"
echo "-------------------------"
read ask_gui
if [[ "$ask_gui" == "y"]] || [[ "$ask_gui" == "Y"]] || [[ "ask_gui" == "yes"]]; then
		gui=2
else if [[ "$ask_gui" == "n"]] || [[ "$ask_gui" == "N"]] || [[ "ask_gui" == "no" ]]
		gui=1
else
		gui=0
		echo "-------------------------"
		echo "GUI not selected"
		echo "-------------------------"
fi

if [ $gui = 2 ]; then
		echo "-------------------------"
		echo "Would you like to install LXQT or XFCE4 [L/X] ?" 
		echo "-------------------------"
		read dm
		if [[ "$dm" == "l"]] || [[ "$dm" == "L"]]; then
				echo "-------------------------"
				echo "Installing LXQT"
				echo "-------------------------"
				if [pacman -Ss sudo]; then
						sudo pacman -S lxqt
				else 
					echo "-------------------------"
					echo "sudo not found, please install and try again"
					echo "-------------------------"

		else if [[ "$dm" == "x"]] || [[ "$dm" == "X"]]
				echo "-------------------------"
				echo "Installing XFCE4"
				echo "-------------------------"
				if [pacman -Ss sudo]; then
						sudo pacman -S xfce4 
				else 
					echo "-------------------------"
					echo "sudo not found, please install and try again"
					echo "-------------------------"

cd $HOME
PKGS=(
'vim'
'git'
'zsh'
'chromium'
'base-devel'
'noto-fonts'
'wget'
'konsole'
		)

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

for PKG in "${PKGS[@]}"; do
		echo "Installing: ${PKG}"
		pacman -S "$PKG" --noconfirm --needed
done

echo "Installation Finished successfully"
