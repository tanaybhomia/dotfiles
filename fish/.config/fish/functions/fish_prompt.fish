function fish_prompt
    set -l last_status $status

    # 1. Directory Path in serene signature Teal (#2190A4)
    set_color --bold 2190A4
    echo -n (prompt_pwd)

    # 2. Minimalist Git branch integration
    if type -q fish_git_prompt
        set_color normal
        echo -n (fish_git_prompt)
    end

    # 3. Whisper-quiet Execution Timer (only appears on tasks > 3 seconds)
    if test $CMD_DURATION -gt 3000
        set_color e0af68
        set -l duration (math -s1 $CMD_DURATION / 1000)
        echo -n " · 󰥔 {$duration}s"
    end

    # 4. Zen Command Symbol (❯): Ultra-clean, geometric, and unambiguous.
    # Turns soft sage green on success, and muted coral red if a command fails.
    if test $last_status -eq 0
        set_color --bold a6e3a1 # Catppuccin sage green
    else
        set_color --bold ff5555 # Soft red error indicator
    end

    # Single precise spacing around the chevron
    echo -n " ❯ "

    set_color normal
end
