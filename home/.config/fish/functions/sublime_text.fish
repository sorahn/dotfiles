#
# @author Daryl Roberts <daryl.robert@gmail.com>
#

function sublime_text
  if count $argv > /dev/null
    subl $argv
  else
    subl .
  end
end
