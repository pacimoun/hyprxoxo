#!/bin/bash

#--------------------------------#
# import variables and functions #
#--------------------------------#
source ./scripts/functions.sh
if [ $? -ne 0 ]; then
  echo "Error: failed to source functions.sh, please execute from $(dirname $(realpath $0))..."
  exit 1
fi

cat ./lists/install_fnt.lst | while read lst; do

  fnt=$(echo $lst | awk -F '|' '{print $1}')
  tgt=$(echo $lst | awk -F '|' '{print $2}')
  tgt=$(eval "echo $tgt")

  if [ ! -d "${tgt}" ]; then
    mkdir -p ${tgt} || echo "creating the directory as root instead..." && sudo mkdir -p ${tgt}
    echo "${tgt} directory created..."
  fi

  echo "uncompressing ${fnt}.tar.gz --> ${tgt}..."
  if [[ "$tgt" == "$HOME"* ]]; then
    mkdir -p "$tgt"
    tar -xzf "$archive" -C "$tgt"
  else
    sudo mkdir -p "$tgt"
    sudo tar -xzf "$archive" -C "$tgt"
  fi
done

echo "rebuilding font cache..."
fc-cache -f
