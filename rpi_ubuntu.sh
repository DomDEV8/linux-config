cd $HOME
PKGS=(
  "neovim"
  "git"
  "zsh"
  "wget"
  "htop"
  "llvm"
  "dpkg-dev"
  "golang"
)

REPOS=(
  "sudo add-apt-repository ppa:ubuntu-lxc/stable"
)

GIT_PKGS=(

)

APT=(
"/var/lib/apt/lists/lock"
"/var/cache/apt/archives/lock"
"/var/lib/dpkg/lock"
)

echo "Welcome to:"
echo "       _   _ _                 _           ____                           
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
echo "Enter email you want to use for SSH Key:"
read ssh_email

echo "Starting the script"

# Prevent the apt process issue

echo "Removing old apt directories"

for DIR in "${APT[@]}"; do
  sudo rm "$DIR"
done


sudo dpkg --configure -a

echo "Apt update"

sudo apt update
sudo apt upgrade -y

# Add repositories


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

# Generating ssh key
ssh-keygen -t ed25519 -C ssh_email 
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_ed25519

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

echo "Your public ssh key: ${cat ~/.ssh/id_ed25519.pub}"
