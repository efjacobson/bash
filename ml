#! /bin/bash

source $(brew --prefix nvm)/nvm.sh
nvm use
make lint
