#!/usr/bin/env bash

input=${1//[^A-Za-z\']/ }
input="${input^^}"
result=""

for word in $input; do
  result="$result${word:0:1}"
done

echo "$result"
