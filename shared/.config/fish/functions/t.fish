function t --wraps='tmux -u a || tmux -u' --description 'alias t tmux -u a || tmux -u'
  tmux -u a || tmux -u $argv
        
end
