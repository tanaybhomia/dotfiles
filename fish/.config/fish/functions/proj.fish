function proj --description "Quickly switch to a project in ~/Dev and open in Antigravity"
    if not test -d ~/Dev
        echo "Directory ~/Dev does not exist."
        return 1
    end

    set -l preview_cmd "ls -la {}"
    if type -q eza
        set preview_cmd "eza --icons -la --git --color=always {}"
    end

    set selected (find ~/Dev -mindepth 1 -maxdepth 1 -type d | fzf --preview "$preview_cmd" --header " Select & Open Project in Antigravity" --border=rounded)

    if test -n "$selected"
        cd "$selected"
        echo -s (set_color 2190A4) "🚀 Opening "(basename "$selected")" in Antigravity..." (set_color normal)
        antigravity .
    end
end
