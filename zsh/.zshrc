if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

autoload -Uz compinit
compinit

setopt autocd
setopt promptsubst
setopt MENU_COMPLETE
setopt AUTO_LIST
setopt COMPLETE_IN_WORD
setopt SHARE_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
unsetopt BEEP

alias ala='alacritty --working-directory=$(pwd) & disown'
alias gs='git status'
alias gc='git commit -m'
alias gp='git push'

source ~/.config/zsh/themes/powerlevel10k/powerlevel10k.zsh-theme
source ~/.p10k.zsh

source ~/.config/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.config/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh
