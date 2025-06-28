# Replacement
alias cat='bat --paging=never'
alias ls='eza'

# Package manager
alias paru='paru --skipreview'
alias unusedpkg='paru -Qtdq'
alias clearunusedpkg='if [ $(unusedpkg | wc -l) != 0 ]; then paru -Rcns $(unusedpkg) --noconfirm; fi; flatpak uninstall --unused -y'
alias cleanpkgcache='sudo paccache -rk3; paru -Scc --noconfirm'
alias cleanup='clearunusedpkg; cleanpkgcache'
alias updatepkg='paru -Syu --noconfirm; flatpak update -y'
alias update='updatepkg; cleanup'
alias updatemirrors='tmpfile=$(mktemp); \
  sudo true;
  rate-mirrors --save=$tmpfile arch \
    && sudo mv /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.backup \
    && sudo mv $tmpfile /etc/pacman.d/mirrorlist;
  rate-mirrors --save=$tmpfile chaotic-aur \
    && sudo mv /etc/pacman.d/chaotic-mirrorlist /etc/pacman.d/chaotic-mirrorlist.backup \
    && sudo mv $tmpfile /etc/pacman.d/chaotic-mirrorlist'
alias fullupdate='updatemirrors; update'

# Bootloader
alias bootupdate='sudo bootctl update'

# Fixes
alias unlockpwd="su -c 'faillock --reset'"

# Git
alias gitsignall="git rebase --exec 'git commit --amend --no-edit -S -n' --root && git rebase --committer-date-is-author-date --root"

# Utils
alias newterm='$TERMINAL -e' # exec command in new terminal
alias vimcfg='tmp=$(pwd); cd $HOME/.config/nvim; vim .; cd $tmp'
alias upoff='update && poweroff'

# Android
alias adbrmpkg='adb shell pm uninstall -k --user 0'

# Games
alias stellarisproton="STEAM_COMPAT_CLIENT_INSTALL_PATH=/home/malcret/.local/share/Steam STEAM_COMPAT_DATA_PATH=/media/Data-4TB/Games/other/stellaris/pfx /home/malcret/.local/share/lutris/runners/proton/ge-proton/proton"
