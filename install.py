#!/usr/bin/env python3

# python3 -c "$(curl -fsSL https://raw.githubusercontent.com/magnusviri/dotfiles/master/install.py)"
#  or
# python -c "$(curl -fsSL https://raw.githubusercontent.com/magnusviri/dotfiles/master/install.py)"

from uuid import getnode as get_mac
mac = get_mac()
print( ':'.join(("%012X" % mac)[i:i+2] for i in range(0, 12, 2)) )



