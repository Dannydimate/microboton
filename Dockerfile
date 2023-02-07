FROM openjdk:8-jre-alpine
RUN mkdir microboton
COPY build/libs/*.jar microboton/
ENTRYPOINT ["java", "-jar", "microboton/micro-boton:1.0.jar"]
EXPOSE 8080

FROM jenkins/jenkins
USER root
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
RUN sudo touch /etc/apt/sources.list.d/kubernetes.list
RUN echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
RUN sudo apt-get update
RUN sudo apt-get install -y kubectl
RUN kubectl version --short --client
USER jenkins
