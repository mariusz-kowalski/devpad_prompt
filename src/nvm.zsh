function nvm_installed {
  if [ -f ~/.nvm/nvm.sh ]; then
    source ~/.nvm/nvm.sh
    return 0
  else
    return 1
  fi
}

function nvm_info {
  if ! nvm_installed; then
    return 0;
  fi

  local version="$(nvm current)"
  if [ "$version" == "system" ]; then return 0; fi
  local bg_color=bg_cyan
  style_echo " node-$version" $bg_color $(readable_color_for $bg_color)
}
