# Quick open yorg working enviorment

cd ~/program/yorg/
tmux new-session -s yorg-dev -n vim -d

tmux new-window -n run -t yorg-dev
tmux split-window -h -t yorg-dev:2 # 2.2 redis
tmux split-window -v -t yorg-dev:2 # 2.3 redis
tmux split-window -v -t yorg-dev:2 # 2.4 sslocal

# vim window
tmux send-keys -t yorg-dev:1.1 C-m
tmux send-keys -t yorg-dev:1.1 'workon yorg' C-m
tmux send-keys -t yorg-dev:1.1 'vim' C-m

tmux send-keys -t yorg-dev:2.1 'workon yorg' C-m

tmux send-keys -t yorg-dev:2.2 'workon yorg' C-m

tmux send-keys -t yorg-dev:2.3 'cd ~' C-m
tmux send-keys -t yorg-dev:2.3 'redis-server;if [ $? -eq 0 ];then echo success;else exit;fi' C-m

tmux send-keys -t yorg-dev:2.4 'sslocal -c /etc/shadowsocks.json' C-m

tmux -2 attach -t yorg-dev:1