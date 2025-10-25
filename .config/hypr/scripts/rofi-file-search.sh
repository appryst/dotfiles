#!/bin/bash

selection=$(fd . --hidden --type f "$HOME" 2>/dev/null | \
    sed "s;$HOME;~;" | \
    rofi -sort -sorting-method fzf -disable-history -keep-right -dmenu -i -theme catppuccin -no-custom -p "󰍉 File Search" | \
    sed "s;~;$HOME;")

if [ -n "$selection" ]; then
    filename="${selection##*/}"
    case "${selection##*.}" in
        txt|md|markdown|c|cpp|cc|cxx|css|h|hpp|hh|hxx|py|java|js|ts|tsx|jsx|sh|bash|zsh|fish|lua|vim|tex|rb|pl|pm|php|go|rs|swift|kt|kts|scala|r|jl|sql|json|yaml|yml|ini|conf|cfg|dockerfile|make|mk|gradle|groovy|bat|rasi|ps1)
            ghostty -e nvim "$selection"
            ;;
        *)
            # Prüfen auf bekannte dotfiles
            case "$filename" in
                .zshrc|.bashrc|.vimrc|.gitconfig|.tmux.conf|config|.config/*)
                    ghostty -e nvim "$selection"
                    ;;
                *)
                    xdg-open "$selection"
                    ;;
            esac
            ;;
    esac
fi

