# Utils
sharedir() {
  if [ -n "$1" ]; then
    dir=$1
  else
    dir=$(pwd)
  fi

  printf "%s" "Do you want to share \"$dir\" ? (y/n) "
  read yn
  if [ -z "$yn" ] || ([ "$#yn" = "1" ] && [ "$yn" != "${yn#[Yy]}" ]); then
    python3 -m http.server 8180 -d $dir
  elif [ "$#yn" = "1" ] && [ "$yn" != "${yn#[Nn]}" ]; then
    echo "Command interrupted"
  else
    echo "\"$yn\" is an invalid input"
  fi
}
