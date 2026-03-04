function fish_prompt
    if set -q CONTAINER_ID
        echo -n "($CONTAINER_ID) "
    end
    if test -n "$SSH_TTY"
    echo -n (set_color --bold green)"$USER"'@'(prompt_hostname)(set_color normal):
    end
    echo -n (set_color --bold blue)(prompt_pwd)(set_color normal)'> '
end
