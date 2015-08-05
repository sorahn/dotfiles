#
# Copyright (c) 2015 Accretive Technology Group, Inc.  All rights reserved.
# For use only by Accretive Technology Group, its employees and contractors.
# DO NOT DISTRIBUTE.
#
# @author Daryl Roberts
#
# connect to a TDS
# change to the directory you were in if it exists
# drop you into whichever shell you were using
#

function naiad_tds_connect
  
  # Allow you to specify a custom shell to launch when connecting to a TDS
  set launch_shell bash
  set custom_shell_path ~/.naiad/custom_shell
  if test -e $custom_shell_path
    set launch_shell (cat $custom_shell_path)
  end
  
  set user (naiad_whoami)
  set server (naiad_which_proxy)
  set directory (path_with_tilde)

  # @TODO Add 'clean' option.
  # Drops all git changes, and sets the active branch to what origin is.
  #
  # if count $argv > /dev/null
  #   if $argv[1] == 'clean'
  #     set branch (git symbolic-ref HEAD 2>/dev/null | sed "s|refs/heads/||")
  #   end
  # end
  
  set user_server "$user@$server"
  set remote_command "cd -P $directory; $launch_shell"
  ssh -t $user_server "$remote_command"

end