function fzf-file-widget --description 'List files and folders'
    set -l commandline (__fzf_parse_commandline)
    set -lx dir $commandline[1]
    set -l fzf_query $commandline[2]
    set -l prefix $commandline[3]

    begin
        set -lx FZF_DEFAULT_OPTS (__fzf_defaults "--reverse --walker=file,dir,follow,hidden --scheme=path --walker-root='$dir'" "$FZF_CTRL_T_OPTS")
        set -lx FZF_DEFAULT_COMMAND "$FZF_CTRL_T_COMMAND"
        set -lx FZF_DEFAULT_OPTS_FILE ''
        eval (__fzfcmd)' -m --query "'$fzf_query'" --preview="bat {} --color=always" --tmux 70%' | while read -l r
            set result $result $r
        end
    end
    if [ -z "$result" ]
        commandline -f repaint
        return
    else
        # Remove last token from commandline.
        commandline -t ""
    end
    for i in $result
        commandline -it -- $prefix
        commandline -it -- (string escape $i)
        commandline -it -- ' '
    end
    commandline -f repaint

end
