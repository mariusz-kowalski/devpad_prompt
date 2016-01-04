function exit_code {
  if [ "$1" -gt 0 ]; then
    style_echo "$1 " bg_red
  else
    style_echo "$1 " green
  fi
}

function user {
  local available_colors=(bg_blue bg_magenta bg_cyan bg_white bg_hi_blue bg_hi_magenta bg_hi_cyan bg_hi_white)
  local hash=$(str_hash "$USER" "${#available_colors[@]}")

  local icon_no=$(str_hash "$USER" "$(icon_count)")
  style_echo "$(icon_no $icon_no) " ${available_colors[$hash]} bold
  style_echo "%n" ${available_colors[$hash]}
}

function host {
  local host_hash=$(str_hash "$HOST" 3)
  local host_color=$(expr 44 + $host_hash)
  style_echo "%m:" $host_color
}

function path {
  local pwd=${PWD/$HOME/\~}
  if [ "${pwd:0:1}" == "~" ]; then
    style_echo "$pwd"
  else
    style_echo "$pwd" yellow bold
  fi
}

function prompt {
  style_echo "%# " bold
}
