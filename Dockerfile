FROM openjdk:8-jre-alpine
RUN mkdir microboton
COPY build/libs/*.jar microboton/
ENTRYPOINT ["java", "-jar", "microboton/micro-boton:1.0.jar"]
EXPOSE 8080

FROM jenkins/jenkins
USER root
RUN apt-get -y update && \
    apt-get -y install apt-transport-https ca-certificates curl gnupg-agent software-properties-common && \
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get -y install docker-ce docker-ce-cli containerd.io
RUN curl -L "https://github.com/docker/compose/releases/download/1.26.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose  \
    && chmod +x /usr/local/bin/docker-compose  \
    && ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose \
    && curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - 
RUN echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee /etc/apt/sources.list.d/kubernetes.list \
    && apt-get -y update \
    && apt install -y kubectl
USER jenkins
