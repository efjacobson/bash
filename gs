#! /bin/bash

declare ignores=(
  'provisioning/docker/environment.sh'
  'provisioning/docker/vhost.conf.tpl'
)

tmpdir="$HOME/.gs.tmp"
mkdir "$tmpdir"

for ignore in "${ignores[@]}"; do
  if [ -f "$ignore" ]; then
    mv "$ignore" "$tmpdir"
    git checkout -q "$ignore"
  fi
done

git status

for ignore in "${ignores[@]}"; do
  if [ -f "$ignore" ]; then
    mv "$tmpdir/$(basename "$ignore")" "$ignore"
  fi
done

rm -rf "$tmpdir"
