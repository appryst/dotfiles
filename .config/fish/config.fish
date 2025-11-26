# Editor
set -x VISUAL nvim
set -x EDITOR nvim

# PATH additions
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.config/hypr/scripts
fish_add_path $HOME/.filen-cli/bin
fish_add_path /usr/local/texlive/2025/bin/x86_64-linux

# Keybinding for tmux-sessionizer (Ctrl+f)
bind ctrl-f 'tmux-sessionizer.sh ""'

# OpenSSL legacy restriction
set -x CRYPTOGRAPHY_OPENSSL_NO_LEGACY 1

# Set up fzf key bindings
fzf --fish | source
# Alias
alias ls='eza --icons'

# Yazi
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
		builtin cd -- "$cwd"
	end
	rm -f -- "$tmp"
end

zoxide init fish | source

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
if test -f /opt/miniconda3/bin/conda
    eval /opt/miniconda3/bin/conda "shell.fish" "hook" $argv | source
else
    if test -f "/opt/miniconda3/etc/fish/conf.d/conda.fish"
        . "/opt/miniconda3/etc/fish/conf.d/conda.fish"
    else
        set -x PATH "/opt/miniconda3/bin" $PATH
    end
end
# <<< conda initialize <<<

eval (oh-my-posh init fish --config $HOME/oh-my-posh/zen.toml)

# Start Hyprlaand at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec hyprland -- -keeptty
    end
end
