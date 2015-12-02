#!/usr/local/bin/fish
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

  set dir (path_with_tilde)
  set server (naiad_which_proxy)
  set repo (basename (git rev-parse --show-toplevel))

  echo "installing files to $server"

  # Special cases for any of the repos that need to do fancy stuff.
  switch $repo
    case 'naiad.css'

      # Make sure we get to the root of the repo to run make.
      cd (git_root)

      # If we have any arguments, run it with those.
      if count $argv > /dev/null
        make $argv

      # Otherwise run a handful of skins through it, and ignore SM2.
      else
        make SKIN=sm,onc,drg,phl,rtl,yjl,xvl,xhc,47,cffn SUPPRESS=sm2 FORCE=1

      end
      return 0

  end

  # any arguments that made it this far are probably just a list of files to
  # get installed.
  if count $argv > /dev/null
    naiad_tds_copy $argv
    naiad_remote_script "cd $dir; /usr/local/bin/kitty install -r $argv | grep install"
  end

  # set dir ~/.naiad
  # set file $dir/server

  # # Check for the directory and the file
  # if test -d $dir
  #   if test -e $file
  #     cat $file
  #   end
  # end
end
