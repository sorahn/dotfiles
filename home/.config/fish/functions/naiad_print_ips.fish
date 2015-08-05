#
# Copyright (c) 2015 Accretive Technology Group, Inc.  All rights reserved.
# For use only by Accretive Technology Group, its employees and contractors.
# DO NOT DISTRIBUTE.
#
# @author Daryl Roberts
#
# Check if we are connected to work, looking for a 207 ip address.
#

function naiad_print_ips
  
  # Print out the IP addresses and cut out any that start with 207.
  /sbin/ifconfig | grep inet\ 207 | cut -d: -f2 | awk '{print $2}'
    
end