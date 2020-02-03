#! /bin/bash

BRANCH=$(git symbolic-ref --short HEAD)

if [ $BRANCH == "master" ]; then
  echo "don't push master, dummy"
else
  if [ $BRANCH == "develop" ]; then
    echo "don't push develop, dummy"
  else
    if [ $BRANCH == "release-next" ]; then
      echo "don't push release-next, dummy"
    else
      git push origin $BRANCH
    fi
  fi
fi
