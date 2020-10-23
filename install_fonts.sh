#!/usr/bin/env bash

set -e

font_dir=/usr/share/fonts

# Roboto Mono
wget 'https://fonts.google.com/download?family=Roboto%20Mono' -O Roboto_Mono.zip
unzip Roboto_Mono.zip -d "${font_dir}/roboto-mono"
rm Roboto_Mono.zip

# Source Serif Pro, Source Sans Pro and Source Code Pro
git clone -b release --depth 1 https://github.com/adobe-fonts/source-serif-pro.git "${font_dir}/source-serif-pro"
git clone -b release --depth 1 https://github.com/adobe-fonts/source-sans-pro.git "${font_dir}/source-sans-pro"
git clone -b release --depth 1 https://github.com/adobe-fonts/source-code-pro.git "${font_dir}/source-code-pro"

for dir in "${font_dir}/source"*"pro"; do
  # Keep only OTF font files
  mv "${dir}/OTF/"* "${dir}"
  find "${dir}" -mindepth 1 -maxdepth 1 ! -name '*.otf' -exec rm -rf {} \;

  if [[ "${dir}" = "${font_dir}/source-sans-pro" ]]; then
      for file in "${dir}"/*; do
          new_file=$(echo "${file}" | sed 's/3/Pro/')
          mv "${file}" "${new_file}"
      done
  fi
done

# Rebuild cached list of fonts
# See details at
# https://wiki.debian.org/Fonts
fc-cache -fv
