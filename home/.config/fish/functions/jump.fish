function jump

  # Switch on the args
	switch $argv[1];

    # Streamate Jumps
    case s3; cd ~/src/naiad.web/tmplts/streamate_3.0/www;
    case s2; cd ~/src/naiad.web/tmplts/streamate_2.0/www;
    case sw; cd ~/src/naiad.web/www/streamate.com/www;
   
    # Self Repo
    case self; cd ~/src/users/darylr/;

  end

end
