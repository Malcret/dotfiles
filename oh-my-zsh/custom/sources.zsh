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
