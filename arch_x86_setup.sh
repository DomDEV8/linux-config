echo Pulling Arch Linux x86 Config
cd $HOME
if  pacman -Qk git 
then
		echo git installed
else
		echo Installing git
		sudo pacman -S git
fi
#git clone https://github.com/ChrisTitusTech/secure-linux.git
#cd secure-linux
#sh secure.sh
