
function is_repo {
  git rev-parse --is-inside-work-tree > /dev/null 2>&1
}

function repo_icon {
  # style_echo "▌" hi_black bg_yellow bold
  block_begin bg_yellow
  style_echo "± " black bg_yellow
  # style_echo "▐" hi_black bg_yellow
}

function branch_type {
  if [ "$1" == "master" ]; then
    echo "master"
  elif [ "$1" == "develop" ]; then
    echo "develop"
  elif [ "${1:0:7}" == "feature" ]; then
    echo "feature"
  elif [ "${1:0:6}" == "hotfix" ]; then
    echo "hotfix"
  elif [ "${1:0:7}" == "release" ]; then
    echo "release"
  fi
}

function branch_name {
  local branch=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
  local color=black
  local bg_color=bg_yellow
  local font_style=normal

  local branch_type=$(branch_type $branch)
  case $branch_type in
    "master" ) color=black
               bg_color=bg_hi_yellow
               font_style=bold
               ;;
    "develop" ) color=yellow
                font_style=bold
                bg_color=bg_blue
                ;;
    "feature" ) color=yellow
                bg_color=bg_green
                font_style=bold
                branch=${branch/feature/${icons[star]}}
                ;;
    "release" ) color=yellow
                bg_color=bg_yellow
                font_style=bold
                branch=${branch/release/${icons[plane]}}
                ;;
    "hotfix" ) bg_color=bg_hi_yellow
               color=hi_red
               font_style=bold
               branch=${branch/hotfix/${special_icons[hotfix]}}
               ;;
  esac
  style_echo "$branch " $color $bg_color $font_style
}

function check_status {
  git status 2>/dev/null | grep "$1" > /dev/null 2>&1
}

function untracked_files {
  if check_status "Untracked files:"; then
    style_echo "untr " yellow
  fi
}

function new_files {
  if check_status "new file:"; then
    style_echo "new " hi_green
  fi
}

function modified_files {
  if check_status "modified:"; then
    style_echo "mod " hi_yellow
  fi
}

function deleted_files {
  if check_status "deleted:"; then
    style_echo "del " hi_blue
  fi
}

function renamed_files {
  if check_status "renamed:"; then
    style_echo "move " hi_cyan
  fi
}

function remote_status {
  if check_status "is up-to-date"; then
    style_echo "u-t-d " hi_green
  fi
}

function remote_diverged {
  if check_status "have diverged"; then
    style_echo "DIVERGED " hi_white bold bg_red
  fi
}

function remote_behind {
  if check_status "is behind"; then
    style_echo "behind " hi_red bold bg_white
  fi
}

function git_info {
  if is_repo; then
    # this is git repo :-)
    echo -n "$(repo_icon)"
    echo -n "$(branch_name)"
    echo -n "$(untracked_files)"
    echo -n "$(new_files)"
    echo -n "$(modified_files)"
    echo -n "$(deleted_files)"
    echo -n "$(renamed_files)"
    echo -n "$(remote_status)"
    echo -n "$(remote_diverged)"
    echo -n "$(remote_behind)"
  fi
}
