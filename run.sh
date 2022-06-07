#!/bin/sh

set -e

echo -n "Please provide the name of the TARGET: "
read target
if [[ -z $target ]]; then
  echo "ERROR: Please provide proper TARGET value"
  exit 1
fi

sed -i "1s/^/TARGET=$target\n\n/" Makefile
sed -i "1s/^/$target\n\n/" .gitignore

rm -rf $0
rm -rf .git
echo "# README" > README.md

git init
