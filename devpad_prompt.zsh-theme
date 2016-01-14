source "${0:a:h}/lib/hard_reset_colors.zsh"
source "${0:a:h}/lib/time.zsh"

root_path=$(dirname $0)

autoload -U add-zsh-hook
add-zsh-hook precmd precmd_hook
add-zsh-hook preexec preexec_hook

start_timestamp=$(timestamp)

function precmd_hook {
  error_code=$?
  execution_time="$(expr $(timestamp) - $start_timestamp)" # first (after error_code assignment) line
  PROMPT="$($root_path/echo_prompt.zsh $error_code $execution_time $HOST)"
}

function preexec_hook {
  start_timestamp=$(timestamp) # last line
}
