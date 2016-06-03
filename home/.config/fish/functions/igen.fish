function igen
  set path ~/.homesick/repos/dotfiles/home/.config/fish/functions/
  if count $argv > /dev/null
    bash $path/index_gen.sh $argv;
  else
    bash $path/index_gen.sh $script *.js index.js
  end
end
