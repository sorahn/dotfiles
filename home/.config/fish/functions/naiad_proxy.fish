#
# Copyright (c) 2015 Accretive Technology Group, Inc.  All rights reserved.
# For use only by Accretive Technology Group, its employees and contractors.
# DO NOT DISTRIBUTE.
#
# @author Daryl Roberts
#
# This function switches between TDS servers and saves the last server it
# switched to a a file to be referenced by other scripts.
# 
# Example: `proxy wriggler`
#

function naiad_proxy
  
  # variable setup
  set devel_server 'wether'
  set devel_dir ~/.naiad
  set devel_file $devel_dir/devel_server
  set proxy_url "http://devel.streamate.com/INTERNAL/ProxyConfig/index.php"
  
  function reset_proxy_config
    if test -d /Applications/ProxyConfig.App
      killall "ProxyConfig"
      and open /Applications/ProxyConfig.App
    end
  end

  # shortcut some of the longer servers
  if count $argv > /dev/null
    switch $argv[1];
      case ch;      set devel_server 'coonhound';
      case bh;      set devel_server 'bloodhound';
      case pbw;     set devel_server 'pigbuttworm';
      case rbbf;    set devel_server 'roughbackbatfish';
      case ob;      set devel_server 'olivebaboon';
      case web;     set devel_server 'kaiken';
      case sm3;     set devel_server 'blobfish';
      case '*';     set devel_server $argv[1];
    end
  end

  # Make the ~/.naiad directory if it doesn't exist.
  if test -d $devel_dir
  else
    mkdir $devel_dir
  end

  # Curl the proxy config URL, and write the server to storage
  curl --data "backend=$devel_server&change=1" $proxy_url
  and echo "Switching to $devel_server"
  and echo $devel_server > $devel_file
  and reset_proxy_config
  
  # or bail out.
  or echo "Failed to change your proxy"
  
end 