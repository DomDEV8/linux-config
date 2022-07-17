## Welcome to my Linux configuration files
#### I use these scipts to quickly setup Linux operating systems to working environments.
```Keep in mind these files are targeted at different platforms.```

### Scripts List:
- sddm_screen.sh - script to rotate your screen when using SDDM
- rpi_ubuntu.sh - set up minimal Ubuntu Server install for Raspberry Pi


``` For more detailed explanation check the wiki ```

## Important Notes:
- Pacman.conf includes Artix repos at the moment, and has parrellel downloads enabled (up to 5)
- pacman mirror list consists of servers that were tested using rankmirror for the best speed, keep in mind there are only https protocoles enabled, if you want to use more mirrors, uncomment them using *sed -i 's/^#Server/Server/ <dir>* dir usually is /etc/pacman.d/mirrorlist or mirrorlist-arch (in case of Artix) 
HTTPS protocols are only enabled for security reasons, they were tested to provide the best download speed
