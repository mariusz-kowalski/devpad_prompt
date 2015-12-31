function exit_code {
  # echo "%?"
  if [ "$1" -gt 0 ]; then
    cecho "$1" red
  else
    cecho "$1" green
  fi
}

function user {
  cecho "%n" bold
}

function host {
  cecho "%m" blue bg_white
}

function path {
  cecho "%~"
}

function prompt {
  cecho "%# "
}
