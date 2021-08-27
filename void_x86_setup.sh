PKG = {
'mesa-dri'
'htop'
'vulkan-loader'
'mesa-vulkan-radeon'
'mesa-vaapi'
'mesa-vdpau'
'curl'
'wget'
'neovim'
'lua'
'kitty'
'zsh'
}

sudo xbps-install -Su

for PKG in "${PKGS[@]}"; do
    echo "INSTALLING: ${PKG}"
    sudo xbps-install "$PKG" -y
done

echo 'Finished!'
