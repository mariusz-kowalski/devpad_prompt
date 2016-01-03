function str_hash {
  # compute very simple hash number from given string $1, upto $2 or 7
  str="$1"
  if [ -n "$2" ]; then
    max="$2"
  else
    max="8"
  fi
  ord_sum=0
  for (( i = 0; i < ${#str}; ++i )); do
    char=${str:$i:1}
    char_ord=$(ord $char)
    ord_sum=$(expr "$ord_sum" + "$char_ord")
  done
  echo $(expr $ord_sum % $max)
}

function ord {
  # return ord (fake, non-asci!) number of given char (or first char) $1
  case ${1:0:1} in
    "1"|"2"|"7"|"8"|"9"|"0"|"-"|"="|"q"|"A"|"{"|"|") echo 1;;
    "w"|"e"|"r"|"t"|"3"|"4"|"5"|"6"|"y"|"S"|"K"|"P") echo 2;;
    "u"|"i"|","|"."|"/"|"~"|"!"|"@"|"#"|"E"|"L") echo 3;;
    "$"|"f"|"g"|"h"|"j"|"k"|"l"|";"|"z"|"N"|":") echo 4;;
    "x"|"c"|"o"|"p"|"["|"]"|"a"|"s"|"d"|"M"|"Z") echo 5;;
    "v"|"b"|"B"|"n"|"m"|"%"|"^"|"&"|"R"|"<"|"X") echo 6;;
    "T"|"Y"|"U"|"D"|"F"|"G"|"H"|"J"|"V"|">"|"C") echo 7;;
    "*"|"("|")"|"_"|"+"|"Q"|"W"|"I"|"O"|"?"|"}") echo 8;;
    *) echo 9
  esac
}
