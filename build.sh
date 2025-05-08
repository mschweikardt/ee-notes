#!/bin/bash

cd notes

for dir in *; do
  echo $dir
  cd $dir
  make
  cp main.pdf ./../../$dir.pdf
  cd ..
done