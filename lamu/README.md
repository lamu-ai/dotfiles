# Lamù

A rice based on Lum (Lamù in Italian) from Rumiko Takahashi's [Urusei Yatsura](https://wikipedia.org/Urusei_Yatsura). Not 100% finished yet, but it's in a good state. A lot of improvements will probably be made as I use it, especially nvim and tmux configurations.

Also checkout my [Lamù colorscheme for vim/nvim](https://github.com/lamu-ai/lamu.vim) and my [custom st package](https://github.com/lamu-ai/st).

## Packages

**Warning**: This is *my* list of packages, it contains *a lot* more than the minimum requirements to run the theme.

```
pacman -Syu adobe-source-han-serif-otc-fonts alsa-plugins alsa-utils android-tools anki audacity \
base base-devel blender brave-dev-bin bspwm calcurse calibre cuda cudnn cups ddccontrol devtools \
dhcpcd discord dstat dunst fcitx5-configtool fcitx5-gtk fcitx5-mozc fcitx5-qt feh fzf giph git grub gzip htop jdk keepassxc kite \
intel-ucode libappimage libnotify linux linux-firmware maim man-db man-pages mpc mpd mpv ncmpcpp \
neofetch neovim ngrok nnn nvidia noto-fonts-emoji ntfs-3g nvidia obs-studio obsidian-appimage \
openboard openssh pacman-contrib pavucontrol playerctl pulseaudio python-pynvim pycharm-professional \
qbittorrent qolibri rofi rsync stow sudo sxhkd sxiv sysstat thunar thunar-archive-plugin tmux tint2 \
ttf-sarasa-gothic unrar unzip w3m wget wmctrl which xarchiver xclip xdo xorg-server xorg-xev xorg-xinit \
zathura zathura-cb zathura-djvu zathura-pdf-mupdf zip zotero zsh
```

```
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

```
paru eb-library picom-ibhagwan-git pop-icon-theme-bin tabbed
```

```
git clone https://github.com/lamu-ai/st.git
cd st
makepkg -si
```

## Components

- WM: bspwm (+ sxhkd)
- Compositor: picom (ibhagwan fork)
- Bar: tint2
- Terminal: st
- Shell: zsh (+ zinit)
- Editor: nvim
- Fonts: Font Awesome Pro, Noto Emoji, Sarasa Gothic, Source Han Serif
- Calendar: calcurse
- Notifications: dunst
- Screenshot utility: scmenu
- GIF utility: giph

### tint2

#### tint2 top

- Taskbar

#### tint2 bottom

- Clock
- CPU cores (`executor_cpu`)
- RAM (`executor_ram`)
- DL/UP speeds (`executor_net`)
- Pacman updates
- Free space
- mpc repeat (`executor_mpc_repeat`)
- mpc random (`executor_mpc_random`)
- mpc single (`executor_mpc_single`)
- Current song and time (`executor_song`)
- Previous song
- Play/pause (`executor_play`)
- Next song
- Volume (`executor_volume`)

## Screenshots

## TODO

- [ ] nvim configuration/plugins
- [ ] tmux configuration
- [ ] Spotify TUI when I get premium

