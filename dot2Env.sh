#!/bin/bash

help() {
  echo "usage: dot2Env [-f <filename>][-h]"
}

exportFileContent() {
  while IFS= read -r line || [ -n "$line" ]; do
    echo "export $line"
  done <"$1"
}

validateFile() {
  if [ ! -f "$1" ]; then
    echo "File '$1' not found!"
  else
    exportFileContent "$1"
  fi
}

[ $# -eq 0 ] && help

while getopts f:h opt; do
  case "${opt}" in
  f) validateFile "$OPTARG" ;;
  h) help ;;
  *) echo "Invalid option: -$opt." && help ;;
  esac
done
