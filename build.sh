#!/bin/bash

cd notes

for dir in *; do
  echo $dir
  cd $dir
  pdflatex main.tex
  cp main.pdf ./../../$dir.pdf
  cd ..
done