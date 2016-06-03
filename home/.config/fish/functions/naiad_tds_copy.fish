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
  set devel_where "$devel_user@$devel_server"
  set server_dir "$devel_where:$devel_directory"
  set rsync_flags ". \"$server_dir/\" --exclude \".git\""

  # Check to see if we're connected to the network
  if count (naiad_print_ips) > "/dev/null"

    # If there are arguments, scp all the files
    if count $argv > /dev/null

      # # # If The first argument is "r", pass a new file list into rsync.
      # if [ $argv[1] = "r" ]
      #   echo ($argv[2])
      #   # rsync -vaz --from-files=<($file_list) $rsync_flags

      # else
        for file in $argv
          set server_location "$devel_directory/$file"
          set remote_dir (dirname $server_location)
          naiad_remote_script mkdir -p $remote_dir >/dev/null

          set remote_path "$devel_where:$server_location"
          scp -r "./$file" "$remote_path"
        end
      # end

    # if nothing else, rsync the whole directory
    else
      rsync -vaz $rsync_flags

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
