#!/bin/bash
cd $HOME
PKGS=(
  "neovim"
  "git"
  "zsh"
  "wget"
  "lua"
  "htop"
  "nodejs"
  "npm"
  "build-essential"
  "llvm"
  "clang"
  "dpkg-dev"
  "golang"
  "kitty"
  "nala"
  "python3-pip"
)

REPOS=(
  "sudo add-apt-repository ppa:ubuntu-lxc/stable"
  "echo 'deb http://deb.volian.org/volian/ scar main' | sudo tee /etc/apt/sources.list.d/volian-archive-scar-unstable.list"
  "wget -qO - https://deb.volian.org/volian/scar.key | sudo tee /etc/apt/trusted.gpg.d/volian-archive-scar-unstable.gpg > /dev/null"
)

GIT_PKGS=(

)

APT=(
  "/var/lib/apt/lists/lock"
  "/var/cache/apt/archives/lock"
  "/var/lib/dpkg/lock"
)

verbose='false'

function print_usage {
  echo "./rpi_ubuntu.sh -v"
  echo "-v Verbose"
}

while getopts 'v' flag; do
  case "${flag}" in
    v) verbose='true';;
    *) print_usage
    exit 1 ;;
  esac
done

# If verbose is false, set apt commands to quiet mode

arg=""
if [ -z ${val}]; then
  arg="-qq"
else
  arg=""
fi


echo "Welcome to:"
echo " _   _ _                 _           ____                           
      | | | | |__  _   _ _ __ | |_ _   _  / ___|  ___ _ ____   _____ _ __ 
      | | | | '_ \| | | | '_ \| __| | | | \___ \ / _ \ '__\ \ / / _ \ '__|
      | |_| | |_) | |_| | | | | |_| |_| |  ___) |  __/ |   \ V /  __/ |   
       \___/|_.__/ \__,_|_| |_|\__|\__,_| |____/ \___|_|    \_/ \___|_|   
                                                                          
                          ____            _       _   
                         / ___|  ___ _ __(_)_ __ | |_ 
                         \___ \ / __| '__| | '_ \| __|
                          ___) | (__| |  | | |_) | |_ 
                         |____/ \___|_|  |_| .__/ \__|
                                           |_| "       

echo "This script will download and install all required packages, this process may take a while.."
read -p "Enter email you want to use for SSH Key:" ssh_email

echo "Starting the script"

# Prevent the apt database lock, present in the latest ubuntu version

echo "Removing old apt directories"

for DIR in "${APT[@]}"; do
  sudo rm -rf "$DIR"
done

sudo dpkg --configure -a


echo "updating packages"

sudo apt update
sudo apt upgrade -y

# Add repositories

for REPO in "${REPOS[@]}"; do
  sudo add-apt-repository "$REPO"
done

# Install packages

for PKG in "${PKGS[@]}"; do
		echo "Installing: ${PKG}"
		sudo apt install "$PKG" -y
done

# Start configuration

echo "Package Installation complete"

# Install github packages

# Change default shell to zsh

sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

for PKG in "${GIT_PKGS[@]}"; do
    git clone "$PKG"
    cd "$PKG"
done

# Generating ssh key if email provided

if [ $ssh_email ]
then
  ssh-keygen -t ed25519 -C ssh_email 
  eval "$(ssh-agent -s)"
  ssh-add ~/.ssh/id_ed25519
fi

# List all repositories and PPAs

for APT in `find /etc/apt/ -name \*.list`; do
    grep -Po "(?<=^deb\s).*?(?=#|$)" $APT | while read ENTRY ; do
        HOST=`echo $ENTRY | cut -d/ -f3`
        USER=`echo $ENTRY | cut -d/ -f4`
        PPA=`echo $ENTRY | cut -d/ -f5`
        if [ "ppa.launchpad.net" = "$HOST" ]; then
            echo sudo apt-add-repository ppa:$USER/$PPA
        else
            echo sudo apt-add-repository \'${ENTRY}\'
        fi
    done
done

# Print ssh key

echo "Your public ssh key: ${cat ~/.ssh/id_ed25519.pub}"
