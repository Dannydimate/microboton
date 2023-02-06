FROM openjdk:8-jre-alpine
RUN mkdir servicio
COPY build/libs/*.jar servicio/
ENTRYPOINT ["java", "-jar", "servicio/rest-1.0.jar"]
EXPOSE 8080

# Install Kubernetes CLI
RUN apt-get update && apt-get install -y curl
RUN curl -LO "https://dl.k8s.io/release/stable.txt"
RUN curl -LO "https://dl.k8s.io/$(cat stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin/
# Install Azure CLI
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
CMD ["/bin/bash"]
