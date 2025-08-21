# Minimalist Hyprland for Arch Linux 🌟 

## 目的 ✨

在 Arch Linux 上搭建极简 Hyprland 环境。

力求提供清晰、简洁的最小化方案，便于理解每个步骤，并自由定制个性化环境。

## 兼容性 ⚙️

此脚本基于 [Arch Linux](https://archlinux.org/) 制作。
Arch linux 的衍生发行版（如：Manjaro）能否正常运行还有待测试。

## 脚本执行步骤 🚀

1. 将脚本完整克隆至本地 Home 文件夹
    ```
    git clone https://github.com/fantaro/arch-hyprland.git ~/arch-hyprland
    ```
2. 进入 installer 文件夹
    ```
    cd ~/arch-hyprland/scripts/installer
    ```
3. 以管理员权限执行 install.sh
    ```
    sudo sh install.sh
    ```

### 默认键位绑定 ⌨️

#### 常规
- `Super + Enter`: Open the primary terminal ([Kitty](https://sw.kovidgoyal.net/kitty/)).
- `Super + T`: Open the alternative terminal ([Ghostty](https://ghostty.org/)).
- `Super + B`: Open the browser ([Microsoft Edge](https://www.microsoft.com/en-us/edge)).
- `Super + C`: Open the primary editor ([Neovim](https://neovim.io/)).
- `Super + S`: Open the alternative editor ([Mousepad](https://docs.xfce.org/apps/mousepad/start)).
- `Super + E`: Open the primary file manager ([Nemo](https://github.com/linuxmint/nemo)).
- `Super + SHIFT + E`: Open the alternative file manager ([Yazi](https://yazi-rs.github.io/)).
- `Super + D`: Open the application menu.
- `Super + M`: Exit Hyprland.
- `Super + V`: Open the clipboard history and paste the selected item.
- `Super + P`: Open the color picker and copy the selected color to the clipboard.
- `Super + ALT + E`: Open the Emoji picker and copy the selected emoji to the clipboard.
- `Super + L`: Lock the screen.
- `Super + ALT + [Mouse scroll]`: Desktop zooming.
- `Super + Escape`: Open the logout menu.
- `Super + W`: Randomly change wallpaper.

#### 窗口和工作区
- `Super + Q`: Close the active window.
- `Super + F`: Toggle floating mode for the active window.
- `Super + SHIFT + F`: Whole full screen.
- `Super + CTRL + F`: Fake full screen.
- `Super + J`: Toggle split mode in the Dwindle layout.
- `SUPER + [Arrow Keys]`: Move focus between windows.
- `SUPER + SHIFT + [Arrow Keys]`: Resize active window.
- `SUPER + ALT + [Arrow Keys]`: Swap active window.
- `SUPER + [1-9]`: Switch to workspace 1-9.
- `SUPER + SHIFT + [1-9]`: Move active window to workspace 1-9.

#### 屏幕亮度，音量，媒体控制
- `Brightness Up`: Increase the screen brightness by 5%.
- `Brightness Down`: Decrease the screen brightness by 5%.
- `Volume Up`: Increase the volume by 5%.
- `Volume Down`: Decrease the volume by 5%.
- `Mic Mute`: Mute the microphone.
- `Audio Mute`: Mute the audio.
- `Play/Pause`: Toggle play/pause for media.
- `Next Track`: Skip to the next track.
- `Previous Track`: Go back to the previous track.

#### 其他
- `Ctrl + Escape`: Toggle the Waybar (kill if running, start if not).
- `Print Screen`: Take a screenshot of the entire screen and copy it to the clipboard.
- `Super + Print Screen`: Take a screenshot of the active window and copy it to the clipboard.
- `Super + Alt + Print Screen`: Select an area to take a screenshot and copy it to the clipboard.

## Hyprland 官网 📖
* [Hyprland](https://github.com/hyprwm/Hyprland)
* [Hyprland Wiki](https://wiki.hyprland.org)
