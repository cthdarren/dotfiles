fortune | cowsay > /home/lingyuan/fflogo.txt
fastfetch --logo /home/lingyuan/fflogo.txt --logo-type file
eval $(keychain --eval id_ed25519)

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh
 

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


# for the fuck plugin
eval $(thefuck --alias)

alias gs='git status'
alias ll='ls -alh --color=auto'
alias rough='nvim /home/lingyuan/todotmr.md'
alias lk='ls -altrh --color=auto'
alias connectspk='bluetoothctl connect F8:DF:15:D4:98:F0'
alias connecthp='bluetoothctl connect 38:18:4C:5A:8B:A6'
alias connectkb='bluetoothctl connect D9:D2:5F:C0:75:AC'
alias dotf='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias gco='git checkout'
alias gpush='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gpull='git pull origin `git rev-parse --abbrev-ref HEAD`'

vact() {
  if [ -f ".venv/bin/activate" ]; then
    source ./.venv/bin/activate
  elif [ -f "venv/bin/activate" ]; then
    source ./venv/bin/activate
  else
    echo "No .venv or venv directory found"
  fi
}

. "$HOME/.local/bin/env"

export NPM_CONFIG_PREFIX=~/.npm-global
export PATH=$PATH:~/.npm-global/bin

