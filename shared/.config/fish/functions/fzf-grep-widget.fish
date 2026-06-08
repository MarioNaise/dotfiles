function fzf-grep-widget
    set -l commandline (__fzf_parse_commandline)

    begin
        set result (fzf -m --disabled --bind 'change:reload(if test -z {q};fd -t f -H -E ".git";
          else; rg -S --line-number --color=always {q};end)' \
          --preview='if test -z {q};bat {} --color=always; else; set -l line (string split ":" {})[2];
          bat (string split ":" {})[1] \
            -r (if test -z $line; set line 0; end; if test $line -lt 20; echo 0; else; echo (math $line-20); end): \
            -H $line --color=always;end' \
        --tmux 80% --ansi)
    end

    if [ -z "$result" ]
        commandline -f repaint
        return
    else
        commandline -t ""
    end
    commandline -it -- 'vim '
    for i in $result
        set -l file (string split ":" $i[1])[1]
        set -l line (string split ":" $i[1])[2]
        commandline -it -- $file
        commandline -it -- ' '
        if test -n $line
            commandline -it -- +$line' '
        end
    end
    commandline -f repaint
end
