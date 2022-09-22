#! /bin/bash

branch=$(git symbolic-ref --short HEAD)
is_master=$(git ls-remote --heads origin master)
top_level=$(git rev-parse --show-toplevel)

if [[ $top_level == *"efjacobson"* ]]; then
  [ -f .nvmrc ] && source "$(brew --prefix nvm)/nvm.sh" && nvm use
  git push origin "$branch"
  exit 0
fi

vhost_file='provisioning/docker/vhost.conf.tpl'
if [ -f "$vhost_file" ]; then
  sed 's|RewriteRule . http://|RewriteRule . https://|g' "$vhost_file" > "$vhost_file".what && mv "$vhost_file".what "$vhost_file"
fi

if [[ -z "$is_master" ]]; then
  if [ "$branch" == "main" ]; then
    echo "don't push main, dummy"
    exit 1
  fi
else
  if [ "$branch" == "master" ]; then
    echo "don't push master, dummy"
    exit 1
  fi
fi

if [ "$branch" == "develop" ]; then
  echo "don't push develop, dummy"
else
  if [ "$branch" == "release-next" ]; then
    echo "don't push release-next, dummy"
  else
    [ -f .nvmrc ] && source "$(brew --prefix nvm)/nvm.sh" && nvm use
    git push origin "$branch"
  fi
fi
