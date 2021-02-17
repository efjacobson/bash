#! /bin/bash

BRANCH=$(git symbolic-ref --short HEAD)
IS_MASTER=$(git ls-remote --heads origin master)

if [[ -z "$IS_MASTER" ]]; then
  if [ $BRANCH == "main" ]; then
    echo "don't push main, dummy"
    exit 1
  fi
else
  if [ $BRANCH == "master" ]; then
    echo "don't push master, dummy"
    exit 1
  fi
fi

if [ $BRANCH == "develop" ]; then
  echo "don't push develop, dummy"
else
  if [ $BRANCH == "release-next" ]; then
    echo "don't push release-next, dummy"
  else
    git push origin $BRANCH
  fi
fi
