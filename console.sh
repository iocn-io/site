SESSION_NAME="HexoEditor"
#if [[ ! -z "$TMUX" ]] || [[ ! -z "$TMUX_PANE" ]]; then
#    echo "Already inside a tmux session, do not know what to do"
#    exit 1
#fi
tmux has-session -t ${SESSION_NAME}
test=$?
if [ $test -eq 0 ]; then
        read -p "Session of ${SESSION_NAME} already exists, do you want to attach this session? [y/n]:" select
        if [ "$select" = "y" ];then
                tmux -q attach-session -t ${SESSION_NAME}
        fi
        exit 0
fi

tmux new-session -d -s ${SESSION_NAME} -n editor vim

tmux split-window -v hexo server
tmux split-window -h -p 80 hexo generate -w
tmux select-pane -U

tmux select-window -t ${SESSION_NAME}
tmux -2 attach-session -d
