#
# Copyright (c) 2015 Accretive Technology Group, Inc.  All rights reserved.
# For use only by Accretive Technology Group, its employees and contractors.
# DO NOT DISTRIBUTE.
#
# @author Daryl Roberts
#
# This function checks which proxy you are currently connected to.
#

function naiad_tds_install
  
  set devel_server (naiad_which_proxy)
  set devel_directory (path_with_tilde)




  # set devel_dir ~/.naiad
  # set devel_file $devel_dir/devel_server
  
  # # Check for the directory and the file
  # if test -d $devel_dir
  #   if test -e $devel_file
  #     cat $devel_file
  #   end
  # end
end