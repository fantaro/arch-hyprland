#!/bin/bash

#                        __          __                                ___                           __
#                       /\ \        /\ \                              /\_ \                         /\ \
#     __     _ __   ___ \ \ \___    \ \ \___    __  __   _____    _ __\//\ \       __       ___     \_\ \
#   /'__`\  /\`'__\/'___\\ \  _ `\   \ \  _ `\ /\ \/\ \ /\ '__`\ /\`'__\\ \ \    /'__`\   /' _ `\   /'_` \
#  /\ \L\.\_\ \ \//\ \__/ \ \ \ \ \   \ \ \ \ \\ \ \_\ \\ \ \L\ \\ \ \/  \_\ \_ /\ \L\.\_ /\ \/\ \ /\ \L\ \
#  \ \__/.\_\\ \_\\ \____\ \ \_\ \_\   \ \_\ \_\\/`____ \\ \ ,__/ \ \_\  /\____\\ \__/.\_\\ \_\ \_\\ \___,_\
#   \/__/\/_/ \/_/ \/____/  \/_/\/_/    \/_/\/_/ `/___/> \\ \ \/   \/_/  \/____/ \/__/\/_/ \/_/\/_/ \/__,_ /
#                                                   /\___/ \ \_\
#                                                   \/__/   \/_/

# Last Change : 2025-08-15
#  Maintainer : 樊 振剛（ハン シンゴウ）
#        Mail : fantaro@gmail.com
#      Github : https://github.com/fantaro

# Get the directory of the current script
BASE_DIR=$(realpath "$(dirname "${BASH_SOURCE[0]}")/../../")

# Source helper file
source $BASE_DIR/scripts/installer/helper.sh

log_message "Installation started for theming section"
print_info "\nStarting theming setup..."

if run_command "wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh && sh install.sh" "Install Oh my Zsh" "yes" "no"; then
    run_command "git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions" "Import zsh-autosuggestions" "no" "no"
    run_command "git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting" "Import zsh-syntax-highlighting" "no" "no"
    run_command "mv /home/$SUDO_USER/dotfiles/.zshrc /home/$SUDO_USER/" "Configuration for zsh" "no" "no"
fi

if run_command "git clone https://gitlab.com/phoneybadger/pokemon-colorscripts.git && cd pokemon-colorscripts" "Get Pokemon colorscripts" "yes" "no"; then
    run_command "./install.sh" "Install Pokemon colorscripts" "no"
    run_command "cd .. && rm -rf pokemon-colorscripts" "Remove Pokemon colorscripts installer" "no" "no"
fi

run_command "pacman -S --noconfirm nwg-look" "Install nwg-look for GTK theme management" "yes"

run_command "pacman -S --noconfirm qt5ct qt6ct kvantum" "Install Qt5, Qt6 Settings, and Kvantum theme engines" "yes"

run_command "tar -xvf $BASE_DIR/assets/themes/Catppuccin-Dark.tar.xz -C /usr/share/themes/" "Install Catppuccin Dark GTK theme" "yes"
run_command "tar -xvf $BASE_DIR/assets/themes/Gruvbox-Dark.tar.xz -C /usr/share/themes/" "Install Gruvbox Dark GTK theme" "yes"

run_command "tar -xvf $BASE_DIR/assets/icons/Gruvbox-Plus-Dark.tar.xz -C /usr/share/icons/" "Install Gruvbox icon theme" "yes"
run_command "tar -xvf $BASE_DIR/assets/icons/Moga-White.tar.xz -C /usr/share/icons/" "Install Moga-White cursor theme" "yes"

run_command "paru -S --sudoloop --noconfirm kvantum-theme-catppuccin-git" "Install Catppuccin theme for Kvantum" "yes" "no"
run_command "paru -S --sudoloop --noconfirm kvantum-theme-gruvbox-git" "Install Gruvbox theme for Kvantum" "yes" "no"

# Add instructions to configure theming
print_info "\nPost-installation instructions:"
print_bold_blue "Set themes and icons:"
echo "   - Open 'nwg-look' to set global GTK and icon theme"
echo "   - Open 'kvantummanager' (run with sudo for system-wide changes) to select and apply the theme"
echo "   - Open 'qt5ct, qt6ct' to set the icon theme"

echo "------------------------------------------------------------------------"
