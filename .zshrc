export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="avit"
ZVM_INIT_MODE=sourcing
plugins=(git sudo zsh-vi-mode zsh-autocomplete zsh-syntax-highlighting ssh-agent)
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
alias fcd='cd $(fd --type d --hidden --exclude .npm --exclude .gnupg --exclude .local --exclude .thunderbird --exclude .rustup --exclude .git --exclude .cache --exclude .mozilla --exclude .config/discord --exclude .cargo | fzf)'
alias vd='cd $(fd --type d --exclude .local --exclude .thunderbird --exclude .rustup --exclude .git --exclude .cache --exclude .mozilla --base-directory $HOME --search-path $HOME/dev --max-depth 1 | fzf) && vim .'
alias open='xdg-open'
alias c='clear'
alias tree='exa -T'
alias docker='podman'
alias fman="compgen -c | fzf | xargs man"
alias ls="exa"
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
    ls
}


export FZF_DEFAULT_COMMAND='rg --files --hidden'
eval "$(fzf --zsh)"
export MOZ_ENABLE_WAYLAND=1
eval "$(zoxide init zsh)"

autoload -Uz compinit
compinit
export PATH="$PATH:/opt/mssql-tools18/bin"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
