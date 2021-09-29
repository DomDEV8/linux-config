import os
import sys
import platform as pl
import argparse

parser = argparse.ArgumentParser(description="Install packages using this simple script")
parser.add_argument("-a", "--arch", help="Specify system as Arch Linux", action="store_true")
parser.add_argument("-e", "--extensive", help="Install all available packages for a given platform", action="store_true")
parser.add_argument("-d", "--debian", help="Specify system as Debian", action="store_true")
parser.add_argument("-x", "--x86", help="Specify cpu architecture as x86_64", action="store_true")
parser.add_argument("-r", "--arm", help="Specify cpu architecture as arm", action="store_true")
args = parser.parse_args()

if args.x86:
    aarch = 1
elif args.arm:
    aarch = 2
else:
    aarch=0

print(aarch)

if sys.platform == 'linux':
    print('using Linux')
    if pl.machine() == 'x86_64': aarch=1
    elif pl.machine() == 'arm': aarch=2
    else: aarch=0
else:
    print('Script works only on linux based systems')

# Check OS, searching for a method

# Drivers
if aarch == 1: drivers = input(print("What CPU are you currently using? (Intel or AMD?)"))
else: print("Installing RPI drivers")

# Package manager install drivers

install = input(print("Would you like to install extensive set of packages? [y/n]"))
if install == "y" or install == "Y" or install == "Yes" or install == "yes":
    # Specify extensive set of packages or append the current list
    pass
else:
    # Use package manager to install packages
    pass