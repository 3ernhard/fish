function fish_prompt

    set -l last_status $status
    set -l duration (math -s2 $CMD_DURATION / 1000)
    if test $duration -gt 1; or test $last_status -ne 0
        echo -n (set_color brblack)(date +%H:%M:%S)(set_color normal)
        if test $duration -gt 1
            echo -n " "(set_color yellow)"$duration""s"(set_color normal)
        end
        if test $last_status -ne 0
            echo -n " "(set_color --bold red)"[$last_status]"(set_color normal)
        end
        echo ""
    end

    if set -q CONTAINER_ID
        echo -n "($CONTAINER_ID) "
    end
    if set -q VIRTUAL_ENV
        echo -n "(basename $VIRTUAL_ENV) "
    end
    if set -q CONDA_DEFAULT_ENV
        echo -n "($CONDA_DEFAULT_ENV) "
    end
    if test "$HOSTNAME" = "toolbx"
        echo -n (set_color purple)"⬢ "(set_color normal)
    end

    echo -n (set_color --bold green)"$USER"'@'(prompt_hostname)(set_color normal):
    echo -n (set_color --bold blue)(prompt_pwd)(set_color normal)'> '
end
