# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.config/zsh/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# HISTORY
HISTSIZE=5000
HISTFILE=$ZDOTDIR/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

# precmd() { print "" } Extra spacing between commands
autoload -Uz compinit
autoload -U colors && colors
autoload -U compinit && compinit
autoload -U compinit colors zcalc

# Completion Styling
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

compinit

# PROMPT='%B  %B%F{015}%~%B%F{006}  %b%F{015} ' 
# RPROMPT='%F{015}$(parse_git_branch)%F{003}$(parse_git_dirty)'

# plugins
source $ZDOTDIR/plugins/powerlevel10k/powerlevel10k.zsh-theme
source $ZDOTDIR/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
source $ZDOTDIR/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $ZDOTDIR/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh

[ -f "${ZDOTDIR}/.aliasrc" ] && source "${ZDOTDIR}/.aliasrc"
[ -f "${ZDOTDIR}/.optionrc" ] && source "${ZDOTDIR}/.optionrc"

# To customize prompt, run `p10k configure` or edit ~/.config/zsh/.p10k.zsh.
[[ ! -f ~/.config/zsh/.p10k.zsh ]] || source ~/.config/zsh/.p10k.zsh

# Key Bindings
bindkey '^f' autosuggest-accept

# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}

bindkey -s '^o' 'lfcd\n'

# VSCODE
# alias code="VSCODE_PORTABLE=$XDG_CONFIG_HOME/vscode /usr/bin/code"

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

PATH=$PATH:/usr/local/go/bin
export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools

alias android='/usr/local/android-studio-2024.2.2.14-linux/android-studio/bin/studio.sh'
