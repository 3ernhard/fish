function fish_prompt
    if set -q _PROMPT_SHOWN
        echo -n (set_color brblack)(date +%H:%M:%S)(set_color normal)

        set -l duration $CMD_DURATION
        if test $duration -gt 1000
            echo -n " "(set_color yellow)(math -s2 $duration / 1000)"s"(set_color normal)
        end

        set -l last_status $status
        if test $last_status -ne 0
            echo -n " "(set_color --bold red)"["$last_status"]"(set_color normal)
        end

        echo ""
        echo ""
    else
        set -g _PROMPT_SHOWN 1
    end

    if set -q CONTAINER_ID
        echo -n "("$CONTAINER_ID") "
    end
    if set -q VIRTUAL_ENV
        echo -n "("basename $VIRTUAL_ENV") "
    end
    if set -q CONDA_DEFAULT_ENV
        echo -n "("$CONDA_DEFAULT_ENV") "
    end
    if test "$HOSTNAME" = "toolbx"
        echo -n (set_color purple)"⬢ "(set_color normal)
    end

    echo -n (set_color --bold green)$USER"@"(prompt_hostname)(set_color normal)":"
    echo -n (set_color --bold blue)(prompt_pwd)(set_color normal)"> "
end
