function exit_code {
  # echo "%?"
  if [ "$1" -gt 0 ]; then
    cecho "$1" red
  else
    cecho "$1" green
  fi
}

function user {
  # user_color=34
  hash_no=$(str_hash "$USER" "3")
  user_color=$(expr 34 + $hash_no)
  cecho "$user_color%n" bold $user_color
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
