function cecho {
  style=$(construct_style $2 $3 $4)
  reset_style=$(construct_style)
  echo -ne "%{\033[${style}m%}"
  echo -ne "$1"
  echo -ne "%{\033[${reset_style}m%}"
}

function construct_style {
  if [ -n "$default_font_style" ]; then
    local font_style="$default_font_style"
  else
    local font_style="$(style_no normal)"
  fi
  if [ -n "$default_foreground_color" ]; then
    local color="$default_foreground_color"
  else
    local color="$(style_no white)"
  fi
  if [ -n "$default_background_color" ]; then
    local bg_color="$default_background_color"
  else
    local bg_color="$(style_no bg_black)"
  fi

  local no="0"
  for param in $1 $2 $3; do
    no=$(style_no $param)
    case $(style_type $no) in
      "color") color=$no;;
      "bg_color") bg_color=$no;;
      "font_style") font_style=$no;;
    esac
  done
  echo "$font_style;$color;$bg_color"
}

function style_no {
  case $1 in
    "black")   echo "30";;
    "red")     echo "31";;
    "green")   echo "32";;
    "yellow")  echo "33";;
    "blue")    echo "34";;
    "magenta") echo "35";;
    "cyan")    echo "36";;
    "white")   echo "37";;

    "hi_black")   echo "90";;
    "hi_red")     echo "91";;
    "hi_green")   echo "92";;
    "hi_yellow")  echo "93";;
    "hi_blue")    echo "94";;
    "hi_magenta") echo "95";;
    "hi_cyan")    echo "96";;
    "hi_white")   echo "97";;

    "bg_black")   echo "40";;
    "bg_red")     echo "41";;
    "bg_green")   echo "42";;
    "bg_yellow")  echo "43";;
    "bg_blue")    echo "44";;
    "bg_magenta") echo "45";;
    "bg_cyan")    echo "46";;
    "bg_white")   echo "47";;

    "bg_hi_black")   echo "100";;
    "bg_hi_red")     echo "101";;
    "bg_hi_green")   echo "102";;
    "bg_hi_yellow")  echo "103";;
    "bg_hi_blue")    echo "104";;
    "bg_hi_magenta") echo "105";;
    "bg_hi_cyan")    echo "106";;
    "bg_hi_white")   echo "107";;

    "normal")     echo "0";;
    "bold")       echo "1";;
    "underline")  echo "4";;
    "blinking")   echo "5";;
    *) echo $1
  esac
}

function change_style {
  # take three params and assign them to default_
  # it works only for cecho functtion
  local no="0"
  for param in $1 $2 $3; do
    no=$(style_no $param)
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
    *) echo "font_style"
  esac
}

function block_begin {
  # cecho "▌" hi_black bg_yellow
  # @TODO: calculate color based on actual bg
  cecho "▌" hi_black $1
}
function block_end {
  # cecho "▐" hi_black bg_yellow
  cecho "▐" hi_black $1
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
        cecho " $c $bg $st %E" $c $bg $st
      done
    done
  done
  # foreground normal|bold|underline|blinking background
}
