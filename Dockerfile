FROM openjdk:8-jre-alpine
RUN mkdir microboton
COPY build/libs/*.jar microboton/
ENTRYPOINT ["java", "-jar", "microboton/micro-boton:1.0.jar"]
EXPOSE 8080

FROM ubuntu:20.04

# Instalar las herramientas necesarias para agregar repositorios y actualizar paquetes
RUN apt-get update && apt-get install -y \
    apt-transport-https \
    curl

# Agregar el repositorio de Kubernetes
RUN curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list

# Instalar Kubernetes
RUN apt-get update && apt-get install -y kubectl

# Instalar la CLI de Azure
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | bash
CMD [ "bash" ]
