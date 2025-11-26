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

zoxide init --cmd cd fish | source

set -x VIRTUAL_ENV_DISABLE_PROMPT 1

# Quick Conda init
if test -f /opt/miniconda3/etc/fish/conf.d/conda.fish
    source /opt/miniconda3/etc/fish/conf.d/conda.fish
end

eval (oh-my-posh init fish --config $HOME/oh-my-posh/zen.toml)

# Start Hyprland at login
if status is-login
    if test -z "$DISPLAY" -a "$XDG_VTNR" = 1
        exec hyprland -- -keeptty
    end
end
