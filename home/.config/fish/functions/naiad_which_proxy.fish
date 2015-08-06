#
# Copyright (c) 2015 Accretive Technology Group, Inc.  All rights reserved.
# For use only by Accretive Technology Group, its employees and contractors.
# DO NOT DISTRIBUTE.
#
# @author Daryl Roberts
#
# This function checks which proxy you are currently connected to.
#

function naiad_which_proxy

  set dir ~/.naiad
  set file $dir/devel_server

  # Check for the directory and the file
  if test -e $file
    set server (cat $file)
    echo "$server.fciis.net"
  end

end
