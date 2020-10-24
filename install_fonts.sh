#!/usr/bin/env bash

set -e

font_dir=/usr/share/fonts


# Roboto Mono
wget -O 'Roboto_Mono.zip' 'https://fonts.google.com/download?family=Roboto%20Mono'
unzip 'Roboto_Mono.zip' -d "${font_dir}/roboto-mono"


# Source Serif Pro, Source Sans Pro and Source Code Pro
wget -O 'source-serif-pro.zip' 'https://fonts.google.com/download?family=Source%20Serif%20Pro'
wget -O 'source-sans-pro.zip' 'https://fonts.google.com/download?family=Source%20Sans%20Pro'
wget -O 'source-code-pro.zip' 'https://fonts.google.com/download?family=Source%20Code%20Pro'
unzip 'source-serif-pro.zip' -d "${font_dir}/source-serif-pro"
unzip 'source-sans-pro.zip' -d "${font_dir}/source-sans-pro"
unzip 'source-code-pro.zip' -d "${font_dir}/source-code-pro"


# Remove intermediate files
rm *.zip


# Rebuild cached list of fonts
# See details at
# https://wiki.debian.org/Fonts
fc-cache -fv
