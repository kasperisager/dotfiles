function o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}