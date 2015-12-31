function dpp_rvm_installed {
  which rvm > /dev/null 2>&1
}

function dpp_rvm_info {
  if ! dpp_rvm_installed; then return 0; fi
  current=$(rvm current)
  if echo "$current" | grep "2" >/dev/null 2>&1; then
    dpp_cecho "$current" white
  fi
}
