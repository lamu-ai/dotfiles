# ls
alias ls='ls --color=auto'
alias lsal='ls -Aoh'

# applications
alias vim='nvim -p'

# dotfiles
alias aliases='vim $ZDOTDIR/aliases.zsh'
alias zshrc='vim $ZDOTDIR/.zshrc'
alias bspwmrc='vim ~/.config/bspwm/bspwmrc'
alias sxhkdrc='vim ~/.config/sxhkd/sxhkdrc'
alias picomrc='vim ~/.config/picom/picom.conf'
alias tint2rctop='vim ~/.config/tint2/tint2rc.top'
alias tint2rcbottom='vim ~/.config/tint2/tint2rc.bottom'
alias rofirc='vim ~/.config/rofi/config.rasi'
alias vimrc='vim ~/.config/nvim/init.vim'
alias dunstrc='vim ~/.config/dunst/dunstrc'

# pacman/paru
if [[ -x /usr/bin/pacman ]]
then
  alias pacins='sudo pacman -S'
  alias pacrem='sudo pacman -Rsn'
  alias pacupd='sudo pacman -Syu'
  alias pacinf='sudo pacman -Si'
  alias paclst='pacman -Q'

  if [[ -x /usr/bin/paru ]]
  then
    alias pacins='paru -S'
    alias pacrem='paru -Rsn'
    alias pacupd='paru -Syu'
    alias pacinf='paru -Si'
    alias paclst='pacman -Q'
  fi
fi

