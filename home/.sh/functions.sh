function o() {
  if [ $# -eq 0 ]; then
    open .;
  else
    open "$@";
  fi;
}

function t() {
  if [ $# -ne 0 ]; then
    fd --unrestricted --prune $@ --exec-batch trash -v
  fi;
}
