#!/usr/bin/env bash

main () {
  (( $1 % 3 )) || str+="Pling"
  (( $1 % 5 )) || str+="Plang"
  (( $1 % 7 )) || str+="Plong"

  echo "${str:-$1}"
  exit 0
}

main "$@"
