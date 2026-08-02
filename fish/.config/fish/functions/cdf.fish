function cdf --description "Fuzzy navigation for directories with live tree preview"
    set -l preview_cmd "ls -la {}"
    if type -q eza
        set preview_cmd "eza --icons --tree --level=2 --color=always {}"
    end

    if type -q fd; or type -q fdfind
        set -l fd_cmd (type -q fd; and echo fd; or echo fdfind)
        set dir ($fd_cmd --type d --hidden --follow --exclude .git --exclude node_modules --exclude target --exclude build --exclude Trash --exclude .Trash\* --exclude .cache . | fzf --preview "$preview_cmd" --header " Jump to Directory" --border=rounded)
    else
        # Fallback using find if fd isn't installed yet, but still with gorgeous eza preview!
        set dir (find . -maxdepth 5 -type d -not -path "*/.*" | fzf --preview "$preview_cmd" --header " Jump to Directory" --border=rounded)
    end

    if test -n "$dir"
        cd "$dir"
    end
end
