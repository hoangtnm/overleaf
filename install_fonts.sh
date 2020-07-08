#!/usr/bin/env bash

set -e

font_dir=/usr/share/fonts

# Roboto Mono
wget 'https://fonts.google.com/download?family=Roboto%20Mono' -O Roboto_Mono.zip && \
unzip Roboto_Mono.zip -d "${font_dir}/roboto-mono"
rm Roboto_Mono.zip

# Source Serif Pro, Source Sans Pro and Source Code Pro
git clone --depth 1 https://github.com/adobe-fonts/source-serif-pro.git
git clone --depth 1 https://github.com/adobe-fonts/source-sans-pro.git
git clone --depth 1 https://github.com/adobe-fonts/source-code-pro.git

for dir in source*pro; do
  # Keep only OTF font files
  mv "${dir}/OTF/"* "${dir}"
  find "${dir}" -mindepth 1 -maxdepth 1 ! -name '*.otf' -exec rm -rf {} \;
done

# Rebuild cached list of fonts
# See details at
# https://wiki.debian.org/Fonts
fc-cache -fv
