function gad
  if count $argv > /dev/null
    git add $argv
  else
    git add .
  end
end
