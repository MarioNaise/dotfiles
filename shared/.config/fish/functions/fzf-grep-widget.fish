function fzf-grep-widget
    set -l result (
        fzf -m --disabled \
            --bind 'start:reload(fd -t f -H -E .git)' \
            --bind 'change:reload(
                if test -z {q}
                    fd -t f -H -E .git
                else
                    rg -.S --line-number --color=always -g "!.git/**" -- {q} .
                end
            )' \
            --preview='
                if test -z {q}
                    bat {} --color=always
                else
                    set -l file (string split ":" -- {})[1]
                    set -l line (string split ":" -- {})[2]

                    if test -z "$line"
                        set line 0
                    end

                    set -l start 0
                    if test "$line" -ge 20
                        set start (math $line - 20)
                    end

                    bat "$file" -r "$start": -H "$line" --color=always
                end
            ' \
            --tmux 80% --ansi
    )

    if test -z "$result"
        commandline -f repaint
        return
    end

    commandline -t ""
    commandline -it -- "vim "

    for i in $result
        set -l file (string split ":" -- $i)[1]
        set -l line (string split ":" -- $i)[2]

        commandline -it -- "$file "

        if test -n "$line"
            commandline -it -- "+$line "
        end
    end

    commandline -f repaint
end
