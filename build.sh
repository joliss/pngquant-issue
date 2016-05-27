#!/bin/bash

set -e

rm -rf out
mkdir out


# (1) Card back

convert base.png cardback.png -geometry +161+495 -composite -strip out/1-original.png
convert base.png cardback.png -geometry +161+495 -composite -strip png:- \
  | pngquant -s1 --nofs 38 > out/1-or8.png

# 1-composite-or8 has same number of colors (38), but better perceptual quality
pngquant -s1 --nofs 30 < base.png > out/tmp.1-base-or8.png
pngquant -s1 --nofs 9 --posterize 2 < cardback.png > out/tmp.1-cardback-or8.png
convert out/tmp.1-base-or8.png out/tmp.1-cardback-or8.png -geometry +161+495 -composite -strip png:- \
  | pngquant -s1 --nofs 256 > out/1-composite-or8.png


# (2) Reload button

convert base.png reload.png -geometry +319+495 -composite -strip out/2-original.png
convert base.png reload.png -geometry +319+495 -composite -strip png:- \
  | pngquant -s1 --nofs 48 > out/2-or8.png
convert base.png reload.png -geometry +319+495 -composite -strip png:- \
  | pngquant -s1 48 > out/2-fs8.png


# 2-composite-a-or8.png has same number of colors (48), but better perceptual quality
pngquant -s1 --nofs 40 < base.png > out/tmp.2-base-a-or8.png
pngquant -s1 --nofs 9 --posterize 2 < reload.png > out/tmp.2-reload-a-or8.png
convert out/tmp.2-base-a-or8.png out/tmp.2-reload-a-or8.png -geometry +319+495 -composite -strip png:- \
  | pngquant -s1 --nofs 256 > out/2-composite-a-or8.png

# 2-composite-b-or8.png has same file size (66 KB), but better perceptual quality
pngquant -s1 --nofs 46 < base.png > out/tmp.2-base-b-or8.png
pngquant -s1 --nofs 85 < reload.png > out/tmp.2-reload-b-or8.png
convert out/tmp.2-base-b-or8.png out/tmp.2-reload-b-or8.png -geometry +319+495 -composite -strip png:- \
  | pngquant -s1 --nofs 256 > out/2-composite-b-or8.png


rm out/tmp.*
