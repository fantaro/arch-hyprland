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

log_message "Installation started for utilities section"
print_info "\nStarting utilities setup..."

run_command "pacman -S --noconfirm waybar" "Install Waybar - Status Bar" "yes"
run_command "cp -r $BASE_DIR/configs/waybar /home/$SUDO_USER/.config/" "Copy Waybar config" "yes" "no"

run_command "paru -S --sudoloop --noconfirm tofi" "Install Tofi - Application Launcher" "yes" "no"
run_command "cp -r $BASE_DIR/configs/tofi /home/$SUDO_USER/.config/" "Copy Tofi config(s)" "yes" "no"

run_command "pacman -S --noconfirm cliphist" "Install Cliphist - Clipboard Manager" "yes"

run_command "pacman -S --noconfirm swww" "Install SWWW for wallpaper management" "yes"
run_command "mkdir -p /home/$SUDO_USER/.config/assets/backgrounds && cp -r $BASE_DIR/assets/backgrounds /home/$SUDO_USER/.config/assets/" "Copy sample wallpapers to assets directory (Recommended)" "yes" "no"

run_command "pacman -S --noconfirm hyprpicker" "Install Hyprpicker - Color Picker" "yes"

run_command "pacman -S --noconfirm hyprlock" "Install Hyprlock - Screen Locker (Must)" "yes"
run_command "cp -r $BASE_DIR/configs/hypr/hyprlock.conf /home/$SUDO_USER/.config/hypr/" "Copy Hyprlock config" "yes" "no"

run_command "paru -S --sudoloop --noconfirm wlogout" "Install Wlogout - Session Manager" "yes" "no"
run_command "cp -r $BASE_DIR/configs/wlogout /home/$SUDO_USER/.config/" "Copy Wlogout config" "yes" "no"

run_command "paru -S --sudoloop --noconfirm grimblast" "Install Grimblast (Screenshot tool)" "yes" "no"

run_command "paru -S --sudoloop --noconfirm jome" "Install Jome (Emoji picker tool)" "yes" "no"

run_command "pacman -S --noconfirm hypridle" "Install Hypridle for idle management (Must)" "yes"
run_command "cp -r $BASE_DIR/configs/hypr/hypridle.conf /home/$SUDO_USER/.config/hypr/" "Copy Hypridle config" "yes" "no"

echo "------------------------------------------------------------------------"
