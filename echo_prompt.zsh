error_code=$1
execution_time=$2
for file in lib/*.zsh; do
  source $file
done
for file in src/*.zsh; do
  source $file
done

default_background_color="0"
default_foreground_color=$(color_no white)

# first line
default_background_color=$(color_no bg_hi_black)
default_foreground_color=$(color_no black)
echo -e "$(exit_code $error_code) $(user)@$(host) $(path) $(prompt_git) $(rvm_info)$(timer $execution_time)%E"

# second line
default_background_color="0"
# default_background_color="$(color_no bg_blue)"
default_foreground_color=$(color_no white)
echo -e "$(prompt)%E"
