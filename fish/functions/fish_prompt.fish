function fish_prompt --description 'Write out the prompt'
    set -l last_pipestatus $pipestatus
    set -lx __fish_last_status $status # Export for __fish_print_pipestatus.
    set -l normal (set_color black -b normal)
    set -q fish_color_status
    or set -g fish_color_status red
    set -l color_cwd white
    set -l suffix "❯"
    set -l git_branch ""
    set git_prompt (fish_vcs_prompt | sed "s/\(^ (\)\(.*\)\()\)/[$git_branch \2]/")
    # Color the prompt differently when we're root
    if functions -q fish_is_root_user; and fish_is_root_user
        if set -q fish_color_cwd_root
            set color_cwd $fish_color_cwd_root
        end
        set suffix '$'
    end

    # Write pipestatus
    # If the status was carried over (if no command is issued or if `set` leaves the status untouched), don't bold it.
    set -l bold_flag --bold
    set -q __fish_prompt_status_generation; or set -g __fish_prompt_status_generation $status_generation
    if test $__fish_prompt_status_generation = $status_generation
        set bold_flag
    end
    set __fish_prompt_status_generation $status_generation
    set -l status_color (set_color $fish_color_status)
    set -l statusb_color (set_color $bold_flag $fish_color_status)
    set -l prompt_status (__fish_print_pipestatus "[" "]" "|" "$status_color" "$statusb_color" $last_pipestatus)

    echo -e -s (set_color $fish_color_user) "┌─── " "["(prompt_login) (set_color $fish_color_user) "]" (set_color $color_cwd) "[" (prompt_pwd) "]" \
        (set_color brblack -b normal) $git_prompt $prompt_status "\n" \
        (set_color $fish_color_user) "└─ " (if not test $__fish_last_status -eq 0; set_color red; end) $suffix $normal " "
end
