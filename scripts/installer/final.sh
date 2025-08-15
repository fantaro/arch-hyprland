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

log_message "Final setup script started"
print_bold_blue "\nCongratulations! Your Arch Hyprland setup is complete!"

print_bold_blue "\nRepository Information:"
echo "   - GitHub Repository: https://github.com/fantaro/arch-hyprland"
echo "   - If you found this repo helpful, please consider giving it a star on GitHub!"

print_bold_blue "\nContribute:"
echo "   - Feel free to open issues, submit pull requests, or provide feedback."
echo "   - Every contribution, big or small, is valuable to the community."

print_bold_blue "\nTroubleshooting:"
echo "   - If you encounter any issues, please check the GitHub issues section."
echo "   - Don't hesitate to open a new issue if you can't find a solution to your problem."

print_success "\nEnjoy your new Hyprland environment!"

echo "------------------------------------------------------------------------"
