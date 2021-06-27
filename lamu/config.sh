#!/usr/bin/env bash

# what directories should be installable by all users including the root user
base=(
  nvim
  tmux
  zsh
)

# folders that should, or only need to be installed for a local user
useronly=(
  applications
  bin
  bspwm
  discord
  dunst
  fontconfig
  git
  gtk
  mpd
  ncmpcpp
  neofetch
  nnn
  picom
  rofi
  sxhkd
  tint2
  wal
  x
  xdg
)

zinitdir=~/.config/zsh/.zinit 
commands=(
  'curl -Ls https://raw.githubusercontent.com/jarun/nnn/master/plugins/getplugs | sh'
  'wget -P ~/dwn https://github.com/BetterDiscord/Installer/releases/latest/download/BetterDiscord-Linux.AppImage'
  'if [[ -z $(ls -A $zinitdir) ]]; then git clone https://github.com/zdharma/zinit.git $zinitdir; else cd $zinitdir; git pull > /dev/null; fi'
)
