#!/usr/bin/env bash

error() {
  echo "$1"
  exit 1
}

validate_usage() {
  (( $# == 2 )) || error "Usage: hamming.sh <string1> <string2>"
}

validate_equal_length() {
  (( "${#1}" == "${#2}" )) || error "strands must be of equal length"
}

main() {
  validate_usage "$@"
  validate_equal_length "$@"
  hamming_distance=0
  for ((i = 0; i < "${#1}"; i++)); do
    if [[ "${1:i:1}" != "${2:i:1}" ]]; then
      ((hamming_distance++))
    fi
  done
  echo $hamming_distance
}

main "$@"
