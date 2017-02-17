#   mkcd command
#   This is an improvised version of the mkcd command at http://superuser.com/questions/152794/is-there-a-shortcut-to-mkdir-foo-and-immediately-cd-into-it
#   This function has to be added to the ~/.bashrc file
#   After that you can run command like: mkdir abc, mkdir -p one/two/three
#
function mkcd {
  last=$(eval "echo \$$#")
  if [ ! -n "$last" ]; then
    echo "Enter a directory name"
  elif [ -d $last ]; then
    echo "\`$last' already exists"
  else
    mkdir $@ && cd $last
  fi
}
