function fish_prompt
    if set -q CONTAINER_ID
        echo -n "($CONTAINER_ID) "
    end
    echo -n (set_color --bold green)"$USER"'@'(prompt_hostname)(set_color normal):
    echo -n (set_color --bold blue)(prompt_pwd)(set_color normal)'> '
end
