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
  first_strand=($(echo "$1" | grep -o .))
  second_strand=($(echo "$2" | grep -o .))
  hamming_distance=0
  for ((i = 0; i < "${#first_strand[@]}"; i++)); do
    if [[ "${first_strand[i]}" != "${second_strand[i]}" ]]; then
      ((hamming_distance++))
    fi
  done
  echo $hamming_distance
}

main "$@"
