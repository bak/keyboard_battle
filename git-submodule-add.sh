#!/usr/bin/env bash -

# $1 = source repo for submodule
# $2 = local name
#
# Usage:  omit leading and trailing / on the local name:
# sh git-submodule-add.sh git://github.com/h5bp/html5-boilerplate.git submodules/html5-boilerplate

argv=$@

echo "Adding submodule from repo $1 as $2 ..."

git submodule add $1 $2


