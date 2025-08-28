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

log_message "Installation started for prerequisites section"
print_info "\nStarting prerequisites setup..."

sudo echo '[archlinuxcn]' >> /etc/pacman.conf
sudo echo 'Server = https://repo.archlinuxcn.org/$arch' >> /etc/pacman.conf
run_command "pacman -Sy --noconfirm" "Refresh package databases from the server" "no"
run_command "pacman -S --noconfirm archlinuxcn-keyring" "Install Arch Linux CN PGP keyring" "no"

run_command "pacman -Syyu --noconfirm" "Update package database and upgrade packages (Recommended)" "yes"

if command -v paru > /dev/null; then
    print_info "Skipping paru installation (already installed)."
elif run_command "pacman -S --noconfirm --needed git base-devel" "Install paru (Must)/Breaks the script" "yes"; then
    run_command "git clone https://aur.archlinux.org/paru.git && cd paru" "Clone paru (Must)/Breaks the script" "no" "no"
    run_command "makepkg --noconfirm -si && cd .. # builds with makepkg" "Build paru (Must)/Breaks the script" "no" "no"
fi

run_command "pacman -S --noconfirm pipewire wireplumber pamixer brightnessctl" "Configuring audio and brightness (Recommended)" "yes"

run_command "pacman -S --noconfirm ttf-jetbrains-mono-nerd ttf-jetbrains-mono ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols ttf-nerd-fonts-symbols-mono noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra" "Installing recommended fonts" "yes"

run_command "pacman -S --noconfirm ttf-cascadia-code-nerd ttf-cascadia-mono-nerd ttf-fira-code ttf-fira-mono ttf-fira-sans ttf-firacode-nerd ttf-iosevka-nerd ttf-iosevkaterm-nerd ttf-maplemono-nf-cn-unhinted" "Installing additional fonts" "yes"

run_command "pacman -S --noconfirm bluez bluez-utils blueman && systemctl enable bluetooth.service" "Installing and enable bluetooth (Recommended)" "yes"

run_command "pacman -S --noconfirm sddm && systemctl enable sddm.service" "Install and enable SDDM (Recommended)" "yes"

run_command "pacman -S --noconfirm fcitx5 fcitx5-mozc fcitx5-configtool fcitx5-gtk fcitx5-qt fcitx5-chinese-addons fcitx5-pinyin-zhwiki" "Installing input method (Fcitx5)" "yes"

run_command "pacman -S --noconfirm nemo mousepad" "Install GUI file manager (nemo) and simple text editor (mousepad)" "yes"

run_command "paru -S --sudoloop --noconfirm microsoft-edge-stable-bin" "Install Microsoft edge browser" "yes" "no"

run_command "paru -S --sudoloop --noconfirm visual-studio-code-bin" "Install visual studio code" "yes" "no"

run_command "pacman -S --noconfirm kitty ghostty" "Install terminal tools (Kitty and Ghostty)" "yes"

run_command "pacman -S --noconfirm neovim" "Install Vim (Neovim) editor" "yes"

run_command "git clone https://github.com/LazyVim/starter /home/$SUDO_USER/.config/nvim && rm -rf /home/$SUDO_USER/.config/nvim/.git" "Install LazyVim" "yes" "no"

run_command "pacman -S --noconfirm neovide" "Install GUI client for Neovim (Neovide)" "yes"

run_command "pacman -S --noconfirm tar man-db gcc make bat lsd lazygit curl wget wl-clipboard xclip xsel fuse2 fastfetch ncdu btop tmux yt-dlp aria2 zsh" "Install basic CLI tools" "yes"

run_command "pacman -S --noconfirm yazi ffmpeg 7zip jq poppler fd ripgrep fzf zoxide imagemagick chafa ueberzugpp resvg" "Install CLI file manager (Yazi)" "yes"

if run_command "git clone https://github.com/fantaro/dotfiles /home/$SUDO_USER/dotfiles" "Get dotfiles (https://github.com/fantaro/dotfiles)" "yes" "no"; then
    run_command "mv /home/$SUDO_USER/dotfiles/.config/kitty /home/$SUDO_USER/.config/" "Configuration for Kitty terminal" "no" "no"
    run_command "mv /home/$SUDO_USER/dotfiles/.config/ghostty /home/$SUDO_USER/.config/" "Configuration for Ghostty terminal" "no" "no"
    run_command "mv /home/$SUDO_USER/dotfiles/.config/nvim/lua/config/keymaps.lua /home/$SUDO_USER/.config/nvim/lua/config/keymaps.lua" "Key maps configuration for neovim" "no" "no"
    run_command "mv /home/$SUDO_USER/dotfiles/.config/nvim/lua/config/options.lua /home/$SUDO_USER/.config/nvim/lua/config/options.lua" "Options configuration for neovim" "no" "no"
    run_command "mv /home/$SUDO_USER/dotfiles/.config/neovide /home/$SUDO_USER/.config/" "Configuration for Neovide" "no" "no"
    run_command "mv /home/$SUDO_USER/dotfiles/.tmux.conf /home/$SUDO_USER/" "Configuration for tmux" "no" "no"
    run_command "mv /home/$SUDO_USER/dotfiles/.config/tmux /home/$SUDO_USER/.config/" "Plugins for tmux" "no" "no"
    run_command "mv /home/$SUDO_USER/dotfiles/.aria2 /home/$SUDO_USER/" "Configuration for aria2" "no" "no"
    run_command "mv /home/$SUDO_USER/dotfiles/.config/btop /home/$SUDO_USER/.config/" "Configuration for btop" "no" "no"
    run_command "mv /home/$SUDO_USER/dotfiles/.config/lsd /home/$SUDO_USER/.config/" "Configuration for lsd" "no" "no"
    run_command "mv /home/$SUDO_USER/dotfiles/.config/fastfetch /home/$SUDO_USER/.config/" "Configuration for fastfetch" "no" "no"
    run_command "mv /home/$SUDO_USER/dotfiles/.config/yazi /home/$SUDO_USER/.config/" "Configuration and plugins for Yazi" "no" "no"
    run_command "mv /home/$SUDO_USER/dotfiles/.config/environment.d /home/$SUDO_USER/.config/" "Definition of user service environment" "no" "no"
fi

echo "------------------------------------------------------------------------"
