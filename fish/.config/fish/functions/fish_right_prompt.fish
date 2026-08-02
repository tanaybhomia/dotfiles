function fish_right_prompt
    set -l right_prompt ""

    # 1. Read-Only indicator (Nerd Font lock icon)
    if not test -w (pwd)
        set -a right_prompt "$(set_color ff5555)"
    end

    # 2. Python Virtual Environment indicator (Nerd Font Python icon)
    if set -q VIRTUAL_ENV
        set -l venv_name (basename $VIRTUAL_ENV)
        set -a right_prompt "$(set_color a6e3a1) $venv_name"
    end

    # 3. Background Jobs Indicator (Nerd Font gear icon)
    set -l jobs_count (jobs | wc -l)
    if test $jobs_count -gt 0
        set -a right_prompt "$(set_color 89b4fa) $jobs_count"
    end

    # 4. Restored: Subtle minimalist timestamp on the far right
    set -a right_prompt "$(set_color 6c7086)"(date "+%H:%M")

    # Render right prompt elements separated by a space
    echo -n -s (string join " " $right_prompt) "$(set_color normal)"
end
