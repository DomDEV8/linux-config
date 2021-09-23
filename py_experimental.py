import os
import sys
import platform as pl

aarch=0

if sys.platform == 'linux':
    print('using Linux')
    if pl.machine() == 'x86_64': aarch=1
    elif pl.machine() == 'arm': aarch=2
    else: aarch=0
else:
    print('Script works only on linux based systems')
