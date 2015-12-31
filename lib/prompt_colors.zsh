function cecho {
  col_conf=$(construct_col_conf $2 $3 $4)
  echo "%{\033[${col_conf}m%}$1%{\033[${default_background_color}m%}"
}

function construct_col_conf {
  local style="$(color_no normal)"
  local color="$(color_no white)"
  # local bg_color="$(color_no bg_black)"
  local bg_color="$default_background_color"
  local no="0"

  for param in $1 $2 $3; do
    no=$(color_no $param)
    case ${no:0:1} in
      "3") color=$no;;
      "9") color=$no;;
      "4") if [ "$no" -eq "4" ]; then
             style=4
           else
             bg_color=$no
           fi
         ;;
      "1") if [ "$no" -eq "1" ]; then
             style=1
           else
             bg_color=$no
           fi
         ;;
      *) style=$no
    esac
  done
  echo "$style;$color;$bg_color"
}

function color_no {
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

function color_demo {
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
