function time_format {
  local h=$(expr $1 / 3600000)
  if [ "$h" -gt "0" ]; then
    style_echo ${h}
    style_echo "h" hi_blue
  fi

  local m=$(expr $1 / 60000 % 60)
  if [ "$m" -gt "0" ]; then
    style_echo ${m}
    style_echo "m" hi_blue
  fi

  local s=$(expr $1 / 1000 % 60)
  if [ "$s" -gt "0" ]; then
    style_echo ${s}
    style_echo "s" hi_blue
  fi

  local ms=$(expr $1 % 1000)
  if [ "$ms" -gt "0" ]; then
   style_echo ${ms}
   style_echo "ms" hi_blue
  fi
}

function timer {
  style_echo " ${special_icons[clock]} $(time_format $1) "
}
