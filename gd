#! /bin/bash

declare ignores=(
  'provisioning/docker/environment.sh'
  'provisioning/docker/vhost.conf.tpl'
)

if [ "$1" != "" ]; then
  git diff $1
else
  tmpdir="$HOME/.gd.tmp"
  mkdir "$tmpdir"

  for ignore in "${ignores[@]}"; do
    if [ -f "$ignore" ]; then
      mv "$ignore" "$tmpdir"
      git checkout -q "$ignore"
    fi
  done

  git diff

  for ignore in "${ignores[@]}"; do
    if [ -f "$ignore" ]; then
      mv "$tmpdir/$(basename "$ignore")" "$ignore"
    fi
  done

  rm -rf "$tmpdir"
fi




# if [ "$1" == "" ]; then
#   environment_sh_path='provisioning/docker/environment.sh'
#   if [ ! -f "$environment_sh_path" ]; then
#     git diff
#     exit 1
#   fi
#   temp_environment_sh=$(mktemp)
#   cp "$environment_sh_path" "$temp_environment_sh"
#   git checkout -q "$environment_sh_path"
#   git diff
#   mv "$temp_environment_sh" "$environment_sh_path"
# else
#   git diff $1
# fi
