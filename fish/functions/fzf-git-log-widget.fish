function fzf-git-log-widget
    set -l commandline (__fzf_parse_commandline)

    begin
        set result (git log --oneline \
      | awk '{for (i=1; i<=NF;i++)if (i==1) printf "\033[33m%s\033[0m", $i;else printf " %s", $i;print ""}' \
      | fzf -m --preview='git show --color=always {1}' --tmux 70% --ansi)
    end

    if [ -z "$result" ]
        commandline -f repaint
        return
    else
        commandline -t ""
    end
    for i in $result
        commandline -it -- $prefix
        commandline -it -- (string split " " $i[1])[1]
        commandline -it -- ' '
    end
    commandline -f repaint
end
