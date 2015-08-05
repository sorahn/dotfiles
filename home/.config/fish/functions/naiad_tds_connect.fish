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
  
  set current_shell (basename (echo $SHELL))
  set current_shell "~/local/bin/$current_shell"
  set extra_command ''
  
  set user (naiad_whoami)
  set server (naiad_which_proxy)
  set directory (path_with_tilde)
  
  function git_clean
    pushd (git)
  end

  if count $argv > /dev/null
    if $argv[1] == 'clean'
      set branch (git symbolic-ref HEAD 2>/dev/null | sed "s|refs/heads/||")
      set extra_command 
    end
  end
  
  set user_server "$user@$server"
  set remote_command "cd -P $directory; $extra_command $current_shell"
  ssh -t $user_server "$remote_command"


end