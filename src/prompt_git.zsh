
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
    style_echo "untracked" red
  fi
}

function new_files {
  if check_status "new file:"; then
    style_echo "new" green
  fi
}

function modified_files {
  if check_status "modified:"; then
    style_echo "modified" blue
  fi
}

function prompt_git {
  if is_repo; then
    # this is git repo :-)
    echo "$(repo_icon)$(branch_name)$(untracked_files)$(new_files)$(modified_files) "
  fi
}
