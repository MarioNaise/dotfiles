function fzf-cd-widget --description 'Change directory'
    set -l commandline (__fzf_parse_commandline)
    set -lx dir $commandline[1]
    set -l fzf_query $commandline[2]
    set -l prefix $commandline[3]

    test -n "$FZF_TMUX_HEIGHT"; or set FZF_TMUX_HEIGHT 40%
    begin
        set -lx FZF_DEFAULT_OPTS (__fzf_defaults "--reverse --walker=dir,follow,hidden --scheme=path --walker-root='$dir'" "$FZF_ALT_C_OPTS")
        set -lx FZF_DEFAULT_OPTS_FILE ''
        set -lx FZF_DEFAULT_COMMAND "$FZF_ALT_C_COMMAND"
        eval (__fzfcmd)' +m --query "'$fzf_query'" --preview="ls --color=always {}"' | read -l result

        if [ -n "$result" ]
            cd -- $result

            # Remove last token from commandline.
            commandline -t ""
            commandline -it -- $prefix
        end
    end

    commandline -f repaint

end
