#
# Copyright (c) 2015 Accretive Technology Group, Inc.  All rights reserved.
# For use only by Accretive Technology Group, its employees and contractors.
# DO NOT DISTRIBUTE.
#
# @author Daryl Roberts
#
# ssh into the server that your proxy config is pointed to, and execute a
# command.
#

function naiad_remote_script
  set server (naiad_which_proxy)
  ssh -t -t -q $server "$argv"
end
