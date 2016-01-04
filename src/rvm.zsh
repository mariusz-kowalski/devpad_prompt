function rvm_installed {
  # @TODO: optimization
  which rvm > /dev/null 2>&1
}

function rvm_info {
  if ! rvm_installed; then return 0; fi
  local current=$(rvm current)
  if [[ $current == *"@"* ]]; then
    cecho " $current" white bg_magenta
  fi
}
