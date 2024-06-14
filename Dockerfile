FROM jenkins/jenkins:jdk17

# LABEL maintainer="yourname@example.com"
USER root
COPY . /user/local/devops_class

RUN mkdir -p /root/.ssh
RUN apt-get update && apt-get install -y git


RUN apt-get update && apt-get install -y \
    # apt-transport-https \
    ca-certificates \
    curl \
    gnupg \
    # gnupg-agent \
    # software-properties-common\
    lsb-release

RUN install -m 0755 -d /etc/apt/keyrings && \
    curl -fsSL https://download.docker.com/linux/debian/gpg -o /etc/apt/keyrings/docker.asc && \
    chmod a+r /etc/apt/keyrings/docker.asc && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/debian \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
     tee /etc/apt/sources.list.d/docker.list > /dev/null

# RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -

# RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
#     $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
#      tee /etc/apt/sources.list.d/docker.list > /dev/null

# RUN add-apt-repository \
#    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
#    focal \
#    stable"
# RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io

RUN apt-get update && apt-get install -y \
    docker-ce \
    docker-ce-cli \
    containerd.io \
    docker-buildx-plugin \
    docker-compose-plugin

RUN docker --version

# USER jenkins

