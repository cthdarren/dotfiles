fortune | cowsay > /home/darren/fflogo.txt
fastfetch --logo /home/darren/fflogo.txt --logo-type file
# fastfetch #Add git ssh to keychain (ssh-agent)
eval $(keychain --eval id_ed25519 psa-deploy)
eval $(thefuck --alias)
source ~/.ventirc.bash

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

export PATH=/opt/nvim-linux-x86_64/bin:/home/darren/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git)

source $ZSH/oh-my-zsh.sh
source /usr/share/nvm/init-nvm.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh


alias gs='git status'
alias ll='ls -alh --color=auto'
alias rough='nvim /home/darren/todotmr.md'
alias lk='ls -altrh --color=auto'
alias connectspk='bluetoothctl connect F8:DF:15:D4:98:F0'
alias connecthp='bluetoothctl connect 38:18:4C:5A:8B:A6'
alias connectkb='bluetoothctl connect D9:D2:5F:C0:75:AC'
alias monattach='xrandr --output HDMI-1-0 --mode 3440x1440 --primary --right-of eDP --output eDP --mode 1920x1080;/home/darren/.config/bspwm/bspwmrc;'
alias mondetach='xrandr --output eDP --mode 1920x1080 --primary --output HDMI-1-0 --off;/home/darren/.config/bspwm/bspwmrc;'
alias vact='source venv/bin/activate'
alias gco='git checkout'
alias gpush='git push origin `git rev-parse --abbrev-ref HEAD`'
alias gpull='git pull origin `git rev-parse --abbrev-ref HEAD`'
alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

alias kctxprod='kubectl config use-context prod-hybrid-kubernetes-admin@venti-k8s.prod-hybrid'
alias kctxstg='kubectl config use-context stg-hybrid-kubernetes-admin@venti-k8s.stg-hybrid'
alias kctxgcp='kubectl config use-context gke_ventigcp_asia-southeast1_venti-gke-prod'
alias kctxkind='kubectl config use-context kind-local'

