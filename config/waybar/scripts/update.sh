#!/bin/bash

updatefn() {
    status=0

    # Update pkg
    paru -Syu --noconfirm --skipreview || status=1
    flatpak update -y || status=1

    # Remove unused pkg
    if [ $(paru -Qtdq | wc -l) != 0 ]; then
        paru -Rcns $(paru -Qtdq) --noconfirm || status=1
    fi 
    flatpak uninstall --unused -y || status=1

    # Clear pkg cache
    sudo paccache -rk3 || status=1
    paru -Scc --noconfirm || status=1

    return $status
}

# Update
updatefn

# Check for errors
if [ $? != 0 ]; then
    notify-send "System update failed!"
else
    notify-send "System updated"
fi

# Exit confirmation
printf "%s" "Press enter to continue..."
read ans
