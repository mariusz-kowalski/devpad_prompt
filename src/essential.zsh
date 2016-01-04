function exit_code {
  if [ "$1" -gt 0 ]; then
    cecho "$1 " bg_red
  else
    cecho "$1 " green
  fi
}

function user {
  local user_hash=$(str_hash "$USER" "3")
  local user_color=$(expr 44 + $user_hash)

  local icon_no=$(str_hash "$USER" "$(icon_count)")
  cecho "$(icon_no $icon_no) " $user_color bold
  cecho "%n" $user_color
}

function host {
  local host_hash=$(str_hash "$HOST" 3)
  local host_color=$(expr 44 + $host_hash)
  cecho "%m:" $host_color
}

function path {
  local pwd=${PWD/$HOME/\~}
  if [ "${pwd:0:1}" == "~" ]; then
    cecho "$pwd"
  else
    cecho "$pwd" yellow bold
  fi
}

function prompt {
  cecho "%# " bold
}
