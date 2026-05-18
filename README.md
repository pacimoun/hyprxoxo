<div align="center">
  <h1>-- pacimoun --</h1>
  <br>
  <img src="https://img.shields.io/github/last-commit/pacimoun/hyprxoxo?style=for-the-badge&color=ffb4a2&labelColor=201a19">
  <img src="https://img.shields.io/github/repo-size/pacimoun/hyprxoxo?style=for-the-badge&color=a8c7ff&labelColor=1a1b1f">
</div>

## About

some dot files for minimal styled hyprland setup

### Installation

The installation script is made for Arch  

> **Warning**
>
> Install script will install AMDGPU drivers

After minimal Arch install (with grub), clone and execute -

```shell
pacman -Sy git
git clone https://github.com/pacimoun/hyprxoxo.git
cd ./hyprxoxo
./install.sh
```

Please reboot after the install script completes and takes you to sddm login screen (or black screen) for the first time.

## Keybindings

### <code>Windows/Session actions</code>
<table>
    <tr><td><kbd>Super</kbd> + <kbd>Q</kbd></td><td>quit active/focused window</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>Del</kbd></td><td>quit hyprland session</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>W</kbd></td><td>toggle window on focus to float</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>J</kbd></td><td>toggle layout</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>G</kbd></td><td>toggle window group</td></tr>
    <tr><td><kbd>Alt</kbd> + <kbd>Enter</kbd></td><td>toggle window on focus to fullscreen</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>L</kbd></td><td>lock screen</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>Backspace</kbd></td><td>logout menu</td></tr>
</table>

### <code>Apps</code>
<table>
    <tr><td><kbd>Super</kbd> + <kbd>T</kbd></td><td>launch alacritty terminal</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>B</kbd></td><td>launch vivaldi browser</td></tr>
</table>

### <code>Rofi</code>
<table>
    <tr><td><kbd>Super</kbd> + <kbd>A</kbd></td><td>launch desktop applications</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>R</kbd></td><td>browse system files</td></tr>
</table>

### <code>Audio control</code>
<table>
    <tr><td><kbd>F10</kbd></td><td>mute audio output (toggle)</td></tr>
    <tr><td><kbd>F11</kbd></td><td>decrease volume</td></tr>
    <tr><td><kbd>F12</kbd></td><td>increase volume</td></tr>
</table>

### <code>Screen capturing</code>
<table>
    <tr><td><kbd>Super</kbd> + <kbd>P</kbd></td><td>drag to select area / click on a window to print</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>P</kbd></td><td>print focused screen</td></tr>
</table>

### <code>Custom scripts</code>
<table>
    <tr><td><kbd>Super</kbd> + <kbd>V</kbd></td><td>clipboard history paste</td></tr>
</table>

### <code>Move focus</code>
<table>
    <tr><td><kbd>Super</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd></td><td>move focus</td></tr>
    <tr><td><kbd>Alt</kbd> + <kbd>Tab</kbd></td><td>move focus (down)</td></tr>
</table>

### <code>Switch workspaces</code>
<table>
    <tr><td><kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>←</kbd><kbd>→</kbd></td><td>switch workspaces relative to the active one</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>MouseScroll</kbd></td><td>cycle through workspaces</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>Ctrl</kbd> + <kbd>↓</kbd></td><td>move to first empty workspace</td></tr>
</table>

### <code>Move windows</code>
<table>
    <tr><td><kbd>Super</kbd> + <kbd>Shift</kbd> + <kbd>←</kbd><kbd>→</kbd><kbd>↑</kbd><kbd>↓</kbd></td><td>move active window within the current workspace</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>LeftClick</kbd></td><td>change the window position (drag)</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>RightClick</kbd></td><td>resize the window (drag)</td></tr>
</table>

### <code>Special workspace</code>
<table>
    <tr><td><kbd>Super</kbd> + <kbd>Alt</kbd> + <kbd>S</kbd></td><td>move window to special workspace</td></tr>
    <tr><td><kbd>Super</kbd> + <kbd>S</kbd></td><td>toggle to special workspace</td></tr>
</table>

### <code>Language</code>
<table>
    <tr><td><kbd>Ctrl</kbd> + <kbd>Space</kbd></td><td>switch keyboard layout</td></tr>
</table>
