function gco --description "Fuzzy git branch checkout with git log preview"
    if not git rev-parse --is-inside-work-tree >/dev/null 2>&1
        echo "Not a git repository."
        return 1
    end

    set branch (git branch --all | grep -v '/HEAD' | string trim | sed 's/^[* ]*//' | fzf --preview "git log --oneline --graph --color=always --stat {} -n 15" --header " Checkout Branch" --border=rounded)

    if test -n "$branch"
        # If it's a remote branch like remotes/origin/feature, extract the branch name
        set clean_branch (string replace -r '^remotes/[^/]+/' '' "$branch")
        git checkout "$clean_branch"
    end
end
