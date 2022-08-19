FROM centos:7

ARG USERNAME=user
EXPOSE 22

RUN yum -y install openssh-server openssh-clients sudo
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa && ssh-keygen -f /etc/ssh/ssh_host_ecdsa_key -N '' -t ecdsa

RUN useradd -ms /bin/bash $USERNAME

USER $USERNAME
RUN mkdir /home/$USERNAME/.ssh
COPY key.pub /home/$USERNAME/.ssh/authorized_keys

USER root
RUN chown $USERNAME /home/$USERNAME/.ssh/authorized_keys && \
chmod 600 /home/$USERNAME/.ssh/authorized_keys
RUN echo "${USERNAME} ALL=(ALL) NOPASSWD: ALL " >> /etc/sudoers

CMD ["/usr/sbin/sshd","-D"]

