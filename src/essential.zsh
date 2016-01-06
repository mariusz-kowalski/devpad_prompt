function exit_code {
  if [ "$1" -gt 0 ]; then
    style_echo "$1 " bg_red
  else
    style_echo "$1 " green
  fi
}

function user {
  local available_bg_colors=(bg_blue bg_magenta bg_cyan bg_white bg_hi_blue \
                             bg_hi_magenta bg_hi_cyan)
  local hash=$(str_hash "$USER" "${#available_bg_colors[@]}")

  local icon_no=$(str_hash "$USER" "$(icon_count)")
  local color_bg=${available_bg_colors[$hash]}
  local color=$(readable_color_for $color_bg)
  style_echo "$(icon_no $icon_no) " $color_bg  $color
  style_echo "%n" $color_bg $color
}

function host {
  local available_bg_colors=(bg_blue bg_magenta bg_cyan bg_white bg_hi_blue \
                             bg_hi_magenta bg_hi_cyan)
  local hash=$(str_hash "$HOST" "${#available_bg_colors[@]}")
  local icon_no=$(str_hash "$HOST" "$(icon_count)")
  local color_bg=${available_bg_colors[$hash]}
  local color=$(readable_color_for $color_bg)
  style_echo "%m" $color_bg $color
  style_echo " $(icon_no $icon_no) " $color_bg $color
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
