for config ($ZDOTDIR/*.zsh) source $config

setopt autocd
setopt correctall

bindkey -v

# Fix Home, End and Del keys for st and tmux
if [[ -n "$TMUX" ]]; then
	bindkey "^[[1~" beginning-of-line
else
	bindkey "^[[H" beginning-of-line
fi
bindkey "^[[4~" end-of-line
bindkey "^[[3~" delete-char

n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    # NOTE: NNN_TMPFILE is fixed, should not be modified
    export NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@"

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}

# Zinit

source $ZDOTDIR/.zinit/zinit.zsh

zinit wait lucid for \
                  OMZP::git \
                  OMZP::cp \
                  OMZP::dotenv \
                  OMZP::dotnet \
                  OMZP::fzf \
  as"completion"  OMZP::docker/_docker \
                  zsh-users/zsh-syntax-highlighting \
                  zsh-users/zsh-history-substring-search \
                  zsh-users/zsh-autosuggestions \
                  zsh-users/zsh-completions \

zinit ice wait"!" compile"(pure|async).zsh" pick"async.zsh" src"pure.zsh"
zinit light sindresorhus/pure

autoload -U compinit && compinit

