error_code=$1
execution_time=$2
HOST=$3
command_number=$4
root_path=$(dirname $0)

for file in $root_path/lib/*.zsh; do
  source $file
done
for file in $root_path/src/*.zsh; do
  source $file
done

default_background_color="${styles[bg_black]}"
default_foreground_color="${styles[white]}"
default_font_style="${styles[normal]}"

# if [ "$(expr $command_number % 2)" == "0" ]; then
#   tput sc
#   change_style hi_black bg_black
#   style_echo
#   for ((i=0; i<$columns; i++)); do
#     echo -ne "░"
#   done
#   tput rc
# fi

# first line
change_style white bg_hi_black
echo -en "$(exit_code $error_code)"
echo -en "$(user)"
style_echo "@" black
echo -en "$(host)"
echo -en "$(path)"
echo -en "$(git_info)"
echo -en "$(rvm_info)"
echo -en "$(nvm_info)"
echo -en "$(timer $execution_time)"
echo -en "%E"

echo # new line
# second line
change_style bg_black
echo -en "$(prompt)"
hard_reset_colors
echo -ne "%E"
