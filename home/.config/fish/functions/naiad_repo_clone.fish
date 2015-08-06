function naiad_repo_clone

  set group 'tools'
  set server 'gitstash.accretivetg.com'

  if count $argv > /dev/null
    set repo $argv[1]

    if count $argv > 1
      echo count $argv
      set group $argv[2]
    end
  end

  set path "$group/$repo"
  echo "ssh://git@$server/$path"
  # ssh://git@gitstash.accretivetg.com/sm/n=


  # git clone ssh://git@gitstash.accretivetg.com/sm/naiad.css
end
