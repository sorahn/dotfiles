#
# Copyright (c) 2015 Accretive Technology Group, Inc.  All rights reserved.
# For use only by Accretive Technology Group, its employees and contractors.
# DO NOT DISTRIBUTE.
#
# @author Daryl Roberts
#
# This function allows you to quickly jump around different directories in the
# naiad codebase.

function naiad_jump

  # Switch on the args
  switch $argv[1];

    case nc;    cd ~/src/naiad.css

    # naiad.web
    case nw;    cd ~/src/naiad.web/
    case ninc;  cd ~/src/naiad.web/php-libs
    case winc;  cd ~/src/naiad.web/php-libs/WWW
    case s3;    cd ~/src/naiad.web/tmplts/streamate_3.0/www
    case s2;    cd ~/src/naiad.web/tmplts/streamate_2.0/www
    case sw;    cd ~/src/naiad.web/www/streamate.com/www
    case stm;   cd ~/src/naiad.web/tmplts/streamate_touch/mobile/www

    # naiad.gfx
    case g;     cd ~/src/naiad.gfx
    case g3;    cd ~/src/naiad.gfx/3.0
    case g2;    cd ~/src/naiad.gfx/2.0/shared

    case r;     cd (git_root)

    # notes
    case notes; cd ~/Dropbox/Work/notes

    case self
      set whoami (naiad_whoami)
      cd ~/src/users/$whoami

  end

end
