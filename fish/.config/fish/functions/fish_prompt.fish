function fish_prompt
    # Save the last command status first
    set -l last_status $status

    echo # Newline for breathing room

    # Signature Teal (#2190A4) for clean path display
    set_color 2190A4
    echo -n (prompt_pwd)

    # Sleek Git prompt integration (parentheses removed via global config for smoothness)
    if type -q fish_git_prompt
        echo -n (fish_git_prompt)
    end

    # Command Execution Duration Timer (only displays if command took > 3 seconds)
    if test $CMD_DURATION -gt 3000
        set_color e0af68 # Soft gold/yellow
        set -l duration (math -s1 $CMD_DURATION / 1000)
        echo -n " 󰥔 {$duration}s"
    end

    # Prompt symbol turns red if the last command failed
    if test $last_status -eq 0
        set_color green
    else
        set_color ff5555 # Soft red error color
    end

    # Sleek single space spacing around your custom icon
    echo -n "   "

    set_color normal
end
