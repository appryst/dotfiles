# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/noah/.zshrc'

autoload -Uz compinit
compinit

# End of lines added by compinstall
export VISUAL="nvim"
export EDITOR="nvim"
export PATH=$PATH:$HOME/.local/bin
bindkey -s ^f "~/.config/hypr/scripts/tmux-sessionizer.sh\n"
export PATH=$PATH:/usr/local/texlive/2025/bin/x86_64-linux
source <(fzf --zsh)
alias ls='eza --icons'
eval "$(oh-my-posh init zsh --config $HOME/oh-my-posh/catppuccin.omp.json)"
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}
eval "$(zoxide init zsh --cmd cd)"
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

