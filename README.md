# Terminal Profile

![terminal](./terminal_screenshot.png)

This is my profile for UNIX (MacOS/Linux) terminals. For Ubuntu, I just use the default terminal
app. For MacOS, I use [iTerm2](https://iterm2.com/).

> In the MacOS case, I have successfully installed this theme once before, but most of the terminal commands
> will be different. You'll just have to open the `.sh` files and figure out how to adapt it to MacOS
> until I can prepare MacOS commands.

These commands were last tested on April 2026 on Ubuntu 24.

# Prerequisites

For the scripts to work, I think these are the bare minimum requirements.

```bash
# Update your software repositories.
sudo apt update
sudo apt upgrade

# Install Git.
sudo apt install -y git

# Install Vim.
sudo apt install -y vim

# Install Python3 and pip.
sudo apt install -y python3 python3-pip
```

# Installation

### 1. Set Up Virtual Environment

First, create and activate a Python virtual environment to isolate the installation:

```bash
# Create the virtual environment
# Use python3 if you have both Python 2 and Python 3 installed
python3 -m venv terminal-profile

# Or if your system only has Python 3 installed, you can use
python -m venv terminal-profile

# Navigate into the project directory
cd terminal-profile

# Activate the virtual environment
source bin/activate
```

> You can check which version of Python your system is using by running:
>
> ```bash
> python --version
> python3 --version
> ```
>
> Make sure it is Python 3.x before proceeding. Python 2 is no longer supported.

> You should see `(terminal-profile)` appear at the start of your terminal prompt, confirming
> the virtual environment is active. Sometimes `(terminal-profile)` may not appear in the prompt.
> Make sure the `source bin/activate` command completed successfully before proceeding.

> **Note:** All scripts must be run from within the activated virtual environment. If you open
> a new terminal session, you will need to activate it again with `source bin/activate`.

### 2. Clone the Repository

```bash
git clone https://github.com/pixegami/terminal-profile.git .
```

### 3. Powerline (and fonts)

We'll install the font (RobotoMono for Powerline). I'll also install it into VIM, since that
is my built-in editor of choice (but you don't have to use it).

The Powerline fonts also include special characters (like Git branches) that we will use later in
the terminal profile theme.

```bash
./install_powerline.sh
```

> **Note:** The script requires bash to run. Make sure you are not running it with `sh` as it will
> cause compatibility errors. Run it directly with `./install_powerline.sh` or `bash install_powerline.sh`.

> **Note:** Since we are running inside a virtual environment, the `--user` flag is not used
> for pip installs. The script handles this automatically.

### 4. ZSH, OhMyZSH and Plugins

The shell that I use is "ZSH", with the OhMyZSH upgrade on top of that. To install all of that stuff,
you can run the helper script (and may need to restart after).

```bash
./install_terminal.sh
```

After this, the terminal should look a bit different, but we need to do the next step to have the
entire theme.

### 5. Profile (plugins, theme, font and color)

This script will first install two plugins that I like to use: auto-complete and color highlighting.

```bash
# You don't need to execute this - it's part of the script already.
(cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-syntax-highlighting)
(cd ~/.oh-my-zsh/custom/plugins && git clone https://github.com/zsh-users/zsh-autosuggestions)
```

It will also copy over the `.zshrc` and `pixegami-agnoster.zsh-theme` files for the
terminal to use (which will wire up the plugins and the theme).

The last command is to create a terminal profile that will set the colors and also set the font
to be the Powerline one we installed earlier (required for the theme to display correctly).

```bash
./install_profile.sh
```

> You can also change the font to any of the other [Powerline Patched Fonts](https://github.com/powerline/fonts) too if you don't like RobotoMono.

After running the script, reload your shell configuration for the changes to take effect:

```bash
source ~/.zshrc
```

If it looks funky after this command, then you might need to wait until the theme is updated with a
Powerline font, and may need to also restart your machine.

## Notes

How to dump current terminal profiles.

```bash
dconf dump /org/gnome/terminal/legacy/profiles:/ > gnome-terminal-profiles.dconf
```

How to display terminal information (I use [Neofetch](https://github.com/dylanaraps/neofetch)).

```bash
sudo apt install neofetch

# Display the profile
# I override the colors because the default red is kinda ugly in this theme.
neofetch --ascii_colors 6 7 --colors 2 2 2 2
```

## How do I reset the changes back to the old terminal?

There's two main modifications being done to the terminal. The terminal theme, and the shell itself.

For the theme, here's a thread I found on the internet on how to reset it to the default: https://askubuntu.com/questions/14487/how-to-reset-the-terminal-properties-and-preferences

For the terminal shell itself, we actually installed a new terminal (zsh) alongside the default bash. Bash itself wasn't removed, but we just set the default shell to `zsh`. Here is a thread on how to uninstall zsh and default back to bash: https://askubuntu.com/questions/958120/remove-zsh-from-ubuntu-16-04

To switch back to bash manually:

```bash
chsh -s /bin/bash
```

Then log out and back in for the change to take effect.

## Deactivating the Virtual Environment

When you are done, you can deactivate the virtual environment by running:

```bash
deactivate
```

## Sources

Here are some of the main resources I used as part of this terminal setup.

[Oh My Zsh!](https://medium.com/wearetheledger/oh-my-zsh-made-for-cli-lovers-installation-guide-3131ca5491fb) | [Robby Russel OMZ](https://github.com/robbyrussell/oh-my-zsh) | [Install Powerline](https://askubuntu.com/questions/283908/how-can-i-install-and-use-powerline-plugin) | [Powerline Patched Fonts](https://github.com/powerline/fonts) | [Agnoster Theme](https://gist.github.com/3712874)
