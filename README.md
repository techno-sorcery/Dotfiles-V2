# Dotfiles-V2
---
## Getting started
### Requirements
Run the following command as root to install dependencies:

    apt install sudo ansible git

Add yourself to the sudoers group if you haven't already (might be different on other distros like Arch):

    usermod -aG sudo [your username]


### Install  

Log into your user account, and clone the repo into your home directory:

    git clone https://github.com/techno-sorcery/Dotfiles-V2

It's recommended you rename it to something like ".dotfiles", and keep it as a backup.
Go to the ansible folder within your new dotfiles folder, and run the following to start system configuration:

    ansible-playbook setup.yml --ask-become-pass

Let ansible do its thing, and you're done.


### Configuration
I suggest modifying the ansible scripts before running them, since you likely don't want the same packages I do. Some notable examples are:
* tasks/suckless.yml - st and dwm window managers
* tasks/flatpak-install - Configures flatpak and installs several programs, such as Steam, Zoom, and Vivado
* tasks/laptop.yml - laptop-specific utilities like tlp, upower, and light
* tasks/kjv.yml - King James command-line bible viewer


## dwm
### Plugins
dwm uses the following plugins:
* adjacenttag - Keybinds to traverse to adjacent tags
* alpha fixborders - Fixes border transparency under picom
* attachbottom - Adds new windows to bottom of stack
* bar height - Sets custom topbar height
* cyclelayouts - Keybinds to cycle through layounts
* hide vacant tags - Hides tags without and windows
* pertag - Lets you set different layouts for each tag
* push - Keybinds to move windows around stack
* restartsig - Keybind to restart DWM and apply changes
* scratchpad - Keybind to open temporary, floating terminal
* sticky - Keybind to make window appear across all tags
* stickyindicator - Indicator in topbar for sticky windows
* swallow - Terminal windows "swallow" apps launched by them
* vanitygaps - Configurable gaps between windows and edges
* warp - Automatically moves mouse pointer to selected window
* xresources - Uses .Xresources file for certain options


### Keybindings
dwm is configured with the following keybinds:
* alt + x - Close window
* alt + enter - Open terminal
* alt + p - Open rofi launcher
* alt + s - Toggle sticky
* alt + ` - Scratchpad terminal
* alt + num - Goto tag  

* alt + Q - Refresh DWM
* alt + ctrl + Q - Exit to TTY  

* alt + h - Dec main size
* alt + j - Focus down
* alt + k - Focus up
* alt + l - Inc main size  

* alt + H - Prev tag
* alt + J - Move window up in stack
* alt + K - Move window down in stack
* alt + L - Next tag  

* alt + ctrl + h - Prev layout
* alt + ctrl + l - Next layout  

It also supports brightness and volume keys, though you may have to edit the corresponding
commands for your system


## st
### Plugins
st uses the following plugins:
* alpha - Background transparency
* clipboard - Synchronizes desktop and terminal clipboards
* desktopentry - Desktop entry for st
* font2 - Support for secondary fonts
* glyph wide support - Support for wide unicode glyphs, like emojis
* hidecursor - Hides cursor while typing
* newterm - Adds keybind to open new window in working directory (ctrl + shift + enter)
* scrollback - Enables scrollback buffer
* scrollback mouse - Lets you scroll with the mouse
* scrollback mouse altscreen - Lets you scroll anywhere with the mouse
* scrollback reflow - Reorganizes terminal contents when resized
* undercurl - Adds undercurl character
* w3m - Adds support for w3m-style framebuffer graphics


## zsh
### Plugins
zsh uses the following plugins:
* autopair - Automatically pairs typed parenthesis
* fast-syntax-highlighting - Highlights commands
* fzf - Fuzzy finding search algorithm 
* vim-cursor - Block cursor to indicate editing mode

### Configuration
zsh is set up such that .zshrc, a separate "aliases" file, and a separate "autorun" file inhabit ~/.config/zsh while .zshenv inhabits the home folder. A lot of the aliases and environment vars could probably be removed by virtue of being specific to me.

You can use tab to open autocomplete for basically any function, and hjkl to move through the options. To use fuzzy finding, type "**" after your function and press tab to open the search prompt. vim-style input is also enabled; just press ESC and i/a/etc to switch between normal and insert mode.
