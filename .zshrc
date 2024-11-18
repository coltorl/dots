export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="avit"
ZVM_INIT_MODE=sourcing
plugins=(git sudo zsh-vi-mode zsh-syntax-highlighting ssh-agent bd)
zstyle :omz:plugins:ssh-agent identities gatech
source $ZSH/oh-my-zsh.sh

export PATH=$HOME/.local/bin:$PATH
export PATH=/usr/local/texlive/2023/bin/x86_64-linux:$PATH
export XDG_CONFIG_HOME="$HOME/.config"
export BAT_THEME=fly16
export XCURSOR_SIZE=24

export SAL_USE_VCLPLUGIN=gtk3

export EDITOR='nvim'
alias vim="nvim"
alias vi="nvim"
alias v="nvim"
alias cat="bat"
alias cd="z"
alias fcd='zi'
alias vd='zi && vim'
alias open='xdg-open'
alias c='clear'
alias tree='exa -T'
alias docker='podman'
alias fman=""
alias ls="exa -a"
alias lg="lazygit"
alias config='/usr/bin/git --git-dir=$HOME/dots.git/ --work-tree=$HOME'
alias viewconf='lazygit -g $HOME/dots.git -w $HOME'

function yy() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")"
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		cd $cwd
	fi
	rm -f -- "$tmp"
}

function onchange() {
    # Check for correct usage
    if [[ $# -lt 2 ]]; then
        echo "Usage: onchange <file_to_watch> <command_to_execute>"
        return 1
    fi

    local file_to_watch=$1
    local command_to_execute=$2

    # Monitor the file and execute the command when the file is modified
    echo "Watching $file_to_watch for changes. Command to execute: $command_to_execute"
    while inotifywait -m -e modify "$file_to_watch"; do
        echo "File $file_to_watch modified. Executing command..."
        eval $command_to_execute
    done
}

chpwd ()
{
    exa
}

# moonfly theme for fzf
#
# Upstream: github.com/bluz71/vim-moonfly-colors
export FZF_DEFAULT_OPTS="$FZF_DEFAULT_OPTS \
  --color bg:#080808 \
  --color bg+:#262626 \
  --color border:#2e2e2e \
  --color fg:#b2b2b2 \
  --color fg+:#e4e4e4 \
  --color gutter:#262626 \
  --color header:#80a0ff \
  --color hl+:#f09479 \
  --color hl:#f09479 \
  --color info:#cfcfb0 \
  --color marker:#f09479 \
  --color pointer:#ff5189 \
  --color prompt:#80a0ff \
  --color spinner:#36c692
"
export FZF_DEFAULT_COMMAND='rg --files --hidden'
eval "$(fzf --zsh)"
export MOZ_ENABLE_WAYLAND=1
eval "$(zoxide init zsh)"

autoload -Uz compinit
compinit

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export CRYPTOGRAPHY_OPENSSL_NO_LEGACY=1
[ -f /opt/miniconda3/etc/profile.d/conda.sh ] && source /opt/miniconda3/etc/profile.d/conda.sh
