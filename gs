#! /bin/bash

environment_sh_path='provisioning/docker/environment.sh'
if [ ! -f "$environment_sh_path" ]; then
  git status
  exit 1
fi
temp_environment_sh=$(mktemp)
cp "$environment_sh_path" "$temp_environment_sh"
git checkout -q "$environment_sh_path"
git status
mv "$temp_environment_sh" "$environment_sh_path"
