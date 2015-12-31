function rvm_installed {
  which rvm > /dev/null 2>&1
}

function rvm_info {
  if ! rvm_installed; then return 0; fi
  current=$(rvm current)
  if echo "$current" | grep "@" >/dev/null 2>&1; then
    cecho "$current" white
  fi
}
