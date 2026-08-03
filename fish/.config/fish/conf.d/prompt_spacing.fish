if status is-interactive
    # Insert a clean newline before drawing every prompt!
    # Placing this inside conf.d ensures Fish automatically loads and registers the event listener.
    # By firing BEFORE fish_prompt draws, this gives generous top padding when opening tabs
    # and breathing room between command outputs, while keeping fish_prompt strictly 1-line
    # so fish_right_prompt never misaligns and command history scrolling never glitches!
    function __add_prompt_spacing --on-event fish_prompt
        echo
    end
end
