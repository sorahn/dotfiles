function path_with_tilde
  
  set my_path (pwd | sed -e "s,$HOME,~,")
  
  echo $my_path

end