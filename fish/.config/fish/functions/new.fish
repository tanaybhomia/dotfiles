function new --description "Display a minimalist cheat sheet of newly added terminal commands and shortcuts"
    set -l teal (set_color 2190A4)
    set -l blue (set_color 89b4fa)
    set -l grey (set_color 6c7086)
    set -l reset (set_color normal)
    set -l bold (set_color --bold)

    echo # Empty line for padding

    echo -e "$bold$teal TERMINAL REFERENCE GUIDE $reset\n"

    echo -e "$bold Navigation & Project Switching $reset"
    echo -e "  $blue cdf $reset              Directory jumper with live tree preview"
    echo -e "  $blue proj $reset             Switch to project in $grey~/Dev$reset and auto-launch Antigravity"
    echo -e "  $blue dot $reset / $blue dotag $reset     Jump straight into $grey~/Dev/dotfiles$reset (or open in Antigravity)"
    echo -e "  $blue z <dir> $reset          Teleport across visited directories ($grey z Whisp $reset)"
    echo -e "  $blue zi $reset               Interactive directory database picker"
    echo -e "  $blue whisp $reset            Jump directly to Whisp and start Antigravity\n"

    echo -e "$bold Shortcuts & Expansions $reset"
    echo -e "  $blue Ctrl + O $reset         Fuzzy find file/folder and insert path mid-command"
    echo -e "  $blue Ctrl + R $reset         Search command history with preview window"
    echo -e "  $blue ! $grey(start)$reset          Single $blue!$reset at prompt start expands to $blue sudo <last command>$reset"
    echo -e "  $blue .. $reset / $blue... $reset        Auto-expands into $grey../$reset and $grey../../$reset as you type"
    echo -e "  $blue Tab $reset              Dedicated key for dropdown option completion"
    echo -e "  $blue Right Arrow $reset      Accept grey ghosted autosuggestion text\n"

    echo -e "$bold Top Abbreviations $grey(type + space/enter to expand)$reset"
    echo -e "  $grey Dotfiles $reset         $blue dotup $reset(auto add & commit dotfiles repo from ANYWHERE!)"
    echo -e "  $grey Git $reset              $blue g $reset(git)  $blue gs $reset(status)  $blue ga $reset(add .)  $blue gcm $reset(commit -m)  $blue gp $reset(pull)  $blue gl $reset(graph)  $blue lg $reset(lazygit)"
    echo -e "  $grey System $reset           $blue dnfin $reset(install)  $blue dnfout $reset(remove)  $blue flatin $reset(install)  $blue update $reset(dnf + flatpak)"
    echo -e "  $grey File & Work $reset      $blue rm $reset(trash)  $blue wrk $reset(work start)  $blue wrkd $reset(work day)  $blue venv $reset / $blue act $reset(python venv)\n"
end
