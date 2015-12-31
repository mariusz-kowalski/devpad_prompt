
function is_repo {
  git rev-parse --is-inside-work-tree > /dev/null 2>&1
}

function repo_icon {
  cecho "±" black
}

function branch_name {
  cecho $(git rev-parse --abbrev-ref HEAD 2> /dev/null) white
}

function check_status {
  git status 2>/dev/null | grep "$1" > /dev/null 2>&1
}

function untracked_files {
  if check_status "Untracked files:"; then
    cecho "untracked" red
  fi
}

function new_files {
  if check_status "new file:"; then
    cecho "new" green
  fi
}

function modified_files {
  if check_status "modified:"; then
    cecho "modified" blue
  fi
}

function prompt_git {
  if is_repo; then
    # this is git repo :-)
    echo "$(repo_icon)$(branch_name)$(untracked_files)$(new_files)$(modified_files) "
  fi
}
