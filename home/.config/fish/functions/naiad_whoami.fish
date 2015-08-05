#
# Copyright (c) 2015 Accretive Technology Group, Inc.  All rights reserved.
# For use only by Accretive Technology Group, its employees and contractors.
# DO NOT DISTRIBUTE.
#
# @author Daryl Roberts
#
# set your username from 'whoami' or get an override from a file in ~/.naiad.
# If your username for the TDS is differnet than the username on your local
# machine, you can create a file called '~/.naiad/username' that contains
# the username to use for SSH.

function naiad_whoami
  
  set devel_username (whoami)
  if test -e ~/.naiad/username
    set devel_username (cat ~/.naiad/username)
  end
  
  echo $devel_username

end