function fish_prompt
    set -l last_status $status
    if contains -- --final-rendering $argv
        set_color brblack
        printf '%s > ' (path basename $PWD)
        set_color normal
    else
        echo
        __restore_status $last_status
        fish_prompt_original $argv
    end
end
