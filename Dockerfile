FROM openjdk:8-jre-alpine
RUN mkdir microboton
COPY build/libs/*.jar microboton/
ENTRYPOINT ["java", "-jar", "microboton/micro-boton:1.0.jar"]
EXPOSE 8080
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin
