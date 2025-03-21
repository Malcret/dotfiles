#!/bin/sh

cwd=$(pwd)

deploy() {
    local config=$1
    if [ -d $cwd/$config ] || [ -e $cwd/$config ]; then
        local path="$HOME/.$config"
        mkdir -p $(dirname $path)
        if [ ! -d $path ] && [ ! -e $path ] && [ ! -L $path ]; then
            echo "Deploy '$config'..."
            ln -s $cwd/$config $path
        else
            echo "Skip, '$path' already exist!"
        fi
    else
        echo "Invalid config, '$config' doesn't exist!"
    fi
}

deploy "clang-format"
deploy "zshrc"
deploy "config/btop"
deploy "config/clangd"
deploy "config/electron-flags.conf"
deploy "config/fastfetch"
deploy "config/hypr"
deploy "config/kitty"
deploy "config/lazygit"
deploy "config/mpv"
deploy "config/oh-my-zsh"
deploy "config/rofi"
deploy "config/spotify-player"
deploy "config/swaync"
deploy "config/waybar"
