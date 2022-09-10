#! /bin/bash

if [ "$1" == "" ]; then
  environment_sh_path='provisioning/docker/environment.sh'
  if [ ! -f "$environment_sh_path" ]; then
    git diff
    exit 1
  fi
  temp_environment_sh=$(mktemp)
  cp "$environment_sh_path" "$temp_environment_sh"
  git checkout -q "$environment_sh_path"
  git diff
  mv "$temp_environment_sh" "$environment_sh_path"
else
  git diff $1
fi
