function style_echo {
  local style=$(construct_style $2 $3 $4)
  local reset_style=$(construct_style)
  echo -ne "%{\033[${style}m%}"
  echo -ne "$1"
  echo -ne "%{\033[${reset_style}m%}"
}

function construct_style {
  local font_style
  local color
  local bg_colo
  if [ -n "$default_font_style" ]; then
    font_style="$default_font_style"
  else
    font_style="${styles[normal]}"
  fi
  if [ -n "$default_foreground_color" ]; then
    color="$default_foreground_color"
  else
    color="${styles[white]}"
  fi
  if [ -n "$default_background_color" ]; then
    bg_color="$default_background_color"
  else
    bg_color="${styles[bg_black]}"
  fi

  for param in $1 $2 $3; do
    local no=${styles[$param]}
    case $(style_type $no) in
      "color") color=$no;;
      "bg_color") bg_color=$no;;
      "font_style") font_style=$no;;
    esac
  done
  echo "$font_style;$color;$bg_color"
}

#function style_no {
declare -A styles

styles[black]=30
styles[red]=31
styles[green]=32
styles[yellow]=33
styles[blue]=34
styles[magenta]=35
styles[cyan]=36
styles[white]=37

styles[hi_black]=90
styles[hi_red]=91
styles[hi_green]=92
styles[hi_yellow]=93
styles[hi_blue]=94
styles[hi_magenta]=95
styles[hi_cyan]=96
styles[hi_white]=97

styles[bg_black]=40
styles[bg_red]=41
styles[bg_green]=42
styles[bg_yellow]=43
styles[bg_blue]=44
styles[bg_magenta]=45
styles[bg_cyan]=46
styles[bg_white]=47

styles[bg_hi_black]=100
styles[bg_hi_red]=101
styles[bg_hi_green]=102
styles[bg_hi_yellow]=103
styles[bg_hi_blue]=104
styles[bg_hi_magenta]=105
styles[bg_hi_cyan]=106
styles[bg_hi_white]=107

styles[normal]=0
styles[bold]=1
styles[underline]=4
styles[blinking]=5

function change_style {
  # take three params and assign them to default_
  # it works only for style_echo functtion
  local no="0"
  for param in $1 $2 $3; do
    no="${styles[$param]}"
    case $(style_type $no) in
      "color") default_foreground_color=$no;;
      "bg_color") default_background_color=$no;;
      "font_style") default_font_style=$no;;
    esac
  done;
}

function style_type {
  case ${1:0:1} in
    "3"|"9") echo "color";;
    "4") if [ "$1" -eq "4" ]; then
           echo "font_style"
         else
           echo "bg_color"
         fi
       ;;
    "1") if [ "$1" -eq "1" ]; then
           echo "font_style"
         else
           echo "bg_color"
         fi
       ;;
    "0"|"2"|"5") echo "font_style";;
    *) echo "unknown"
  esac
}

function block_begin {
  # style_echo "▌" hi_black bg_yellow
  # @TODO: calculate color based on actual bg
  style_echo "▌" hi_black $1
}
function block_end {
  # style_echo "▐" hi_black bg_yellow
  style_echo "▐" hi_black $1
}

function color_demo {
  # @TODO: remove this shit
  for st in normal bold underline; do
    for bg in bg_black bg_hi_black \
              bg_red bg_hi_red \
              bg_green bg_hi_green \
              bg_yellow bg_hi_yellow \
              bg_blue bg_hi_blue \
              bg_magenta bg_hi_magenta \
              bg_cyan bg_hi_cyan \
              bg_white bg_hi_white; do
      for c in black red green yellow blue magenta cyan white hi_black hi_red hi_green hi_yellow hi_blue hi_magenta hi_cyan hi_white; do
        style_echo " $c $bg $st %E" $c $bg $st
      done
    done
  done
  # foreground normal|bold|underline|blinking background
}
