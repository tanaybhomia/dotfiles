function set_fzf_theme --description "Configure fzf color scheme based on GNOME desktop mode"
    if not type -q gsettings; or not type -q fzf
        return
    end

    set theme (gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null | tr -d "'")

    if test "$theme" = "prefer-dark"
        # Dark GNOME / Catppuccin-style fzf
        set -gx FZF_DEFAULT_OPTS "
            --color=bg:#1e1e2e,fg:#cdd6f4,hl:#f38ba8
            --color=fg+:#ffffff,bg+:#313244,hl+:#f38ba8
            --color=info:#89b4fa,prompt:#a6e3a1,pointer:#f38ba8
            --color=marker:#f5c2e7,spinner:#f38ba8,header:#89b4fa
            --layout=reverse --border=rounded
        "
    else
        # Light GNOME-style fzf
        set -gx FZF_DEFAULT_OPTS "
            --color=bg:#ffffff,fg:#2e3440,hl:#d08770
            --color=fg+:#000000,bg+:#e5e9f0,hl+:#bf616a
            --color=info:#5e81ac,prompt:#4c566a,pointer:#bf616a
            --color=marker:#b48ead,spinner:#d08770,header:#5e81ac
            --layout=reverse --border=rounded
        "
    end
end
