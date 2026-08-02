# ==========================================================
# Fish Shell Configuration
# Tailored for GNOME, Ghostty, and Modern Developer Workflow
# ==========================================================

# 1. Environment & Paths
set fish_greeting # Disable default greeting
set -gx EDITOR gnome-text-editor
set -gx VISUAL gnome-text-editor

fish_add_path ~/.npm-global/bin
fish_add_path ~/.local/bin
fish_add_path ~/.cargo/bin

# 2. FZF & FD Configuration (Filters out unwanted folders like .git & node_modules)
if type -q fd; or type -q fdfind
    set -l fd_cmd (type -q fd; and echo fd; or echo fdfind)
    set -gx FZF_DEFAULT_COMMAND "$fd_cmd --type f --hidden --follow --exclude .git --exclude node_modules --exclude target --exclude build --exclude __pycache__ --exclude Trash --exclude .Trash* --exclude .cache"
    
    # Specific filtering rules for PatrickF1/fzf.fish plugin
    set -g fzf_fd_opts --hidden --follow --exclude .git --exclude node_modules --exclude target --exclude build --exclude __pycache__ --exclude Trash --exclude .Trash\* --exclude .cache
end

# Default directory preview command for fzf.fish using eza
if type -q eza
    set -g fzf_preview_dir_cmd "eza --all --icons --tree --level=2 --color=always"
end

# 3. Interactive Shell Setup
if status is-interactive
    # Ensure Tab ALWAYS triggers interactive directory/command completion!
    # (Use Right Arrow or Ctrl+F to accept grey autosuggestions)
    bind \t complete

    # Unbind Ctrl+T and Alt+C so they never clash with your workflow!
    bind -e \ct 2>/dev/null
    bind -e \ec 2>/dev/null

    # Customize fzf.fish bindings: use Ctrl+O ("Open") for file search, keeping Ctrl+T/Alt+C free!
    if type -q fzf_configure_bindings
        fzf_configure_bindings --directory=\co --history=\cr --git_log=\cg --git_status=\cs --processes=\cp --variables=\cv
    end

    # Run custom Work Fetch greeting
    workfetch DSA Aptitude

    # Apply fzf color scheme (matched to GNOME Light/Dark mode)
    set_fzf_theme

    # Git Prompt Global Customization (Sleek layout without parentheses, using Nerd Font icons)
    set -g __fish_git_prompt_show_informative_status 1
    set -g __fish_git_prompt_showcolorhints 1
    set -g __fish_git_prompt_prefix "  "
    set -g __fish_git_prompt_suffix ""
    set -g __fish_git_prompt_char_dirty " *"
    set -g __fish_git_prompt_char_staged " +"
    set -g __fish_git_prompt_char_untracked " ·"
    set -g __fish_git_prompt_char_stashstate " 󰏗"
    set -g __fish_git_prompt_char_upstream_ahead " 󰜷"
    set -g __fish_git_prompt_char_upstream_behind " 󰜮"

    # Initialize Zoxide (enables smart jumping via 'z' and 'zi')
    if type -q zoxide
        zoxide init fish | source
    end

    # ----------------------------------------------------------
    # Abbreviations & Aliases (Tailored to Top Command Usage)
    # ----------------------------------------------------------

    # --- Single '!' Sudo Expansion ---
    # Typing a single '!' as the FIRST word and pressing space/enter expands to 'sudo <last command>'
    abbr -a ! --position command --function __sudo_previous_command

    # --- File System & Navigation ---
    alias l="eza --icons"
    alias ls="eza --icons"
    alias ll="eza -l --icons --git --group-directories-first"
    alias la="eza -la --icons --git --group-directories-first"
    if type -q bat
        alias cat="bat -p"
    end
    abbr -a rm "trash"
    abbr -a tc "touch"
    abbr -a md "mkdir -p"
    abbr -a cl "clear && workfetch DSA Aptitude"
    abbr -a clr "clear"
    abbr -a src "source ~/.config/fish/config.fish"

    # --- Git Superpowers (#1 Most Used Command) ---
    abbr -a g "git"
    abbr -a gs "git status"
    abbr -a ga "git add ."
    abbr -a gcm "git commit -m"
    abbr -a gpm "git push origin main"
    abbr -a gp "git pull"
    abbr -a gd "git diff"
    abbr -a gl "git log --oneline --graph --all -n 20"
    abbr -a revh "git rev-parse HEAD"
    abbr -a lg "lazygit"

    # --- System & Package Management (DNF & Flatpak) ---
    abbr -a dnfin "sudo dnf install"
    abbr -a dnfout "sudo dnf remove"
    abbr -a dnfsearch "dnf search"
    abbr -a dnfupdate "sudo dnf update"
    abbr -a flatin "flatpak install"
    abbr -a flatout "flatpak remove"
    abbr -a flatupdate "flatpak update"
    abbr -a update "sudo dnf update && flatpak update"

    # --- Work Tracking Scripts ---
    abbr -a wrk "work start"
    abbr -a wrksum "work summary today"
    abbr -a wrksumw "work summary week"
    abbr -a wrkcal "work calendar"
    abbr -a wrkres "work resume"
    abbr -a wrkd "work day"
    alias worklog="gnome-text-editor /home/tanay/.worktracker/worklog.csv"

    # --- Docker & Containers ---
    abbr -a dco "docker compose"
    abbr -a dps "docker ps"
    abbr -a dstop "docker stop (docker ps -q)"

    # --- Python & Java ---
    abbr -a pt "python3"
    abbr -a py "python3"
    abbr -a venv "python3 -m venv .venv && source .venv/bin/activate.fish"
    abbr -a act "source .venv/bin/activate.fish"
    alias jsol="java Solution"

    # --- Editors & Configs ---
    alias ed="gnome-text-editor"
    alias gd="gnome-text-editor"
    alias fishconf="gnome-text-editor ~/.config/fish/config.fish"
    alias zedconf="gnome-text-editor ~/.config/zed/settings.json"
    alias szed="sudo-zed"
    alias ag="antigravity ."
    alias whisp="z Whisp && antigravity ."
    alias sqlcon="sudo systemctl start mysqld && mysql -u root -p"
    alias live="live-server"
end
