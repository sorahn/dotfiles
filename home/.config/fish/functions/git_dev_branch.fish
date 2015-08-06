#
# Copyright (c) 2015 Accretive Technology Group, Inc.  All rights reserved.
# For use only by Accretive Technology Group, its employees and contractors.
# DO NOT DISTRIBUTE.
#
# @author Daryl Roberts
#

function git_dev_branch
  set branch $argv[1]

  # Check if the branch exists, and check it out
  git show-ref -q "DEV-$branch"
  and git checkout "DEV-$branch"

  # or create a new branch
  or git checkout -b "DEV-$branch"

end
