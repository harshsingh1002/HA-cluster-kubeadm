cat << EOF | sudo tee -a /etc/haproxy/haproxy.cfg

frontend kubernetes
bind ${loadbalancer_ip}:6443
option tcplog
mode tcp
default_backend kubernetes-master-nodes


backend kubernetes-master-nodes
mode tcp
balance roundrobin
option tcp-check
server master0 ${master0_ip}:6443 check fall 3 rise 2
server master1 ${master1_ip}:6443 check fall 3 rise 2
server master2 ${master2_ip}:6443 check fall 3 rise 2
EOF
