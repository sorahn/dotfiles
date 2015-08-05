#
# Copyright (c) 2015 Accretive Technology Group, Inc.  All rights reserved.
# For use only by Accretive Technology Group, its employees and contractors.
# DO NOT DISTRIBUTE.
#
# @author Daryl Roberts
#

function naiad_tds_copy

  set devel_user (naiad_whoami)
  set devel_server (naiad_which_proxy)
  set devel_directory (path_with_tilde)
  set server_dir "$devel_user@$devel_server:$devel_directory"

  # Check to see if we're connected to the network
  if count (naiad_print_ips) > "/dev/null"

    # If there are arguments, scp all the files, if not, rsync the directory
    if count $argv > /dev/null
      for file in $argv
        set remote_path "$server_dir/$file"
        scp -r "./$file" "$remote_path"
      end
    else
      rsync -vaz ./ "$server_dir/" --exclude '.git'
    end
  
  # bail out!
  else
    echo "----------"
    echo "I'm sorry dave, I'm afraid I can't do that."
    echo "You are not connected to work."
    echo "----------"
    return 1
  end

end