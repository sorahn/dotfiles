function gim
  if count $argv > /dev/null
    git commit -m "$argv"
  else
    git commit -m "(no commit message)"
  end
end
