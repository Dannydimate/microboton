FROM openjdk:8-jre-alpine
RUN mkdir microboton
COPY build/libs/*.jar microboton/
ENTRYPOINT ["java", "-jar", "microboton/micro-boton:1.0.jar"]
EXPOSE 8080

FROM ubuntu:20.04

# Install dependencies for Kubernetes
RUN apt-get update && apt-get install -y curl

# Install Kubernetes CLI
RUN curl -LO "https://dl.k8s.io/release/stable.txt"
RUN curl -LO "https://dl.k8s.io/$(cat stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin/

# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash


