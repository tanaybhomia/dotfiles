function set_fzf_theme --description "Configure fzf to dynamically inherit native terminal colors and theme"
    # Setting bg:-1 and bg+:-1 instructs FZF to leave the background completely transparent,
    # seamlessly adopting your terminal emulator's live theme (Light mode, Dark mode, Catppuccin, etc.).
    # Using standard ANSI palette colors for highlights ensures readability on ANY terminal background!
    set -gx FZF_DEFAULT_OPTS "
        --color=bg:-1,fg:-1,hl:cyan
        --color=fg+:-1,bg+:-1,hl+:cyan
        --color=info:blue,prompt:green,pointer:magenta
        --color=marker:yellow,spinner:magenta,header:blue
        --layout=reverse --border=rounded
    "
end
