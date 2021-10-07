function o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}

function c() {
  if [ $# -eq 0 ]; then
    code .;
  else
    code "$@";
  fi;
}
