function push
  
  
  
  # If there are any variables, loop through
  if count $argv > /dev/null

    for file in $argv

      scp "./$file" 


end