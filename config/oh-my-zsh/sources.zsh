src() {
    local file=$1
    if [ -f $file ]; then
        . $file
    else
        echo "Failed to source '$file', file doesn't exist!"
    fi
}

src "/usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh"
src "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
src "/usr/share/zsh/plugins/zsh-autopair/autopair.zsh"

# NOTE: Only load vi-mode if not inside VIM.
if [ -n "$VIM" ] && [ -n "$NVIM" ] && [ -n "$VIMRUNTIME" ] then
    src "/usr/share/zsh/plugins/zsh-vi-mode/zsh-vi-mode.plugin.zsh"
fi
