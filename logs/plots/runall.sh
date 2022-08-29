#! /bin/bash

# import os
# os.system("rm -f svgs/*.svg")
# os.system("rm -f svgs/*.pdf")
# for filename in os.listdir("./plots"):
#   if filename == "runall.py":
#     continue
#   os.system("gnuplot plots/" + filename)

rm -f svgs/*.svg
rm -f svgs/*.pdf

for entry in plots/*
do
  extension="${entry##*.}"
  if [ "$extension" = "gnu" ]; then
    echo $entry
    gnuplot $entry
  fi
done