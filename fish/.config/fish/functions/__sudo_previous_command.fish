function __sudo_previous_command --description "Expand single exclamation point at command start to sudo last command"
    echo "sudo $history[1]"
end
