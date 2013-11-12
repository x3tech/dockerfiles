FROM x3tech/arch-infra-base

RUN pacman -Sy && \
    pacman -S --noconfirm openssh && \
    ssh-keygen -A && \
    (echo -e "changeme!\nchangeme!" | (passwd root)) && \
    pacman -Scc --noconfirm && \
    sed -i "s/UsePAM yes/UsePAM no/g" /etc/ssh/sshd_config && \
    echo "[program:sshd]" > /etc/supervisor.d/sshd.ini && \
    echo "command=/usr/bin/sshd -D" >> /etc/supervisor.d/sshd.ini
