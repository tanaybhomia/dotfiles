function dotup --description "Back up, commit, and push dotfiles repository to GitHub from anywhere"
    if not test -d ~/Dev/dotfiles
        echo "Error: ~/Dev/dotfiles directory not found."
        return 1
    end

    set -l msg "$argv"
    if test -z "$msg"
        set msg "Update dotfiles: "(date "+%Y-%m-%d %H:%M")
    end

    echo -s (set_color 2190A4) "󰆓 Backing up dotfiles repository in ~/Dev/dotfiles..." (set_color normal)
    git -C ~/Dev/dotfiles add .
    git -C ~/Dev/dotfiles commit -m "$msg"
    
    if test $status -eq 0
        echo -s (set_color green) "󰄬 Dotfiles committed locally! Pushing to GitHub..." (set_color normal)
        git -C ~/Dev/dotfiles push
        if test $status -eq 0
            echo -s (set_color green) "󰊢 Successfully synced to GitHub!" (set_color normal)
        else
            echo -s (set_color ff5555) "󰅖 Committed locally, but push to GitHub failed. Check your network connection." (set_color normal)
        end
    else
        echo -s (set_color 6c7086) "No configuration changes detected to commit." (set_color normal)
    end
end
