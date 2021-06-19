#!/usr/bin/env bash

# Base script taken from this blogpost: https://dev.to/writingcode/how-i-manage-my-dotfiles-using-gnu-stow-4l59

old_theme="$1"
new_theme="$2"

# make sure we have pulled in and updated any submodules
git submodule init
git submodule update

destow() {
  usr=$1
  app=$2
  stow -v -D -t $usr $app
}

# run the stow command for the passed in directory $2 in location $1
stowit() {
  usr=$1
  app=$2
  stow -v -R --no-folding -t $usr $app
}

echo ""
echo "Removing current theme dotfiles"

cd $(dirname "$(realpath $0)")/$old_theme
source config.sh

# install apps available to local users and root
for app in ${base[@]}; do
  destow "${HOME}" "$app" 
done

# install only user space folders
for app in ${useronly[@]}; do
  if [[ ! "$(whoami)" = "root" ]]; then
    destow "${HOME}" "$app" 
  fi
done

echo ""
echo "Stowing apps for user: $(whoami)"

cd ../$old_theme
source config.sh

# install apps available to local users and root
for app in ${base[@]}; do
  stowit "${HOME}" "$app" 
done

# install only user space folders
for app in ${useronly[@]}; do
  if [[ ! "$(whoami)" = "root" ]]; then
    stowit "${HOME}" "$app" 
  fi
done

echo ""
echo "Executing theme commands..."

for cmd in "${commands[@]}"; do
  $(eval $cmd)
done

echo ""
if [[ "${base[@]}" =~ "zsh" || "${useronly[@]}" =~ "zsh" ]]; then
  echo "Remember to set \$ZDOTDIR"
  echo "(e.g. sudo echo 'export ZDOTDIR=~/.config/zsh' >> /etc/zsh/zshenv)"
fi

echo ""
echo "##### ALL DONE #####"

