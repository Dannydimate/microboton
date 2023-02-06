FROM openjdk:8-jre-alpine
RUN mkdir servicio
COPY build/libs/*.jar servicio/
RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl
RUN chmod +x ./kubectl
RUN mv ./kubectl /usr/local/bin
ENTRYPOINT ["java", "-jar", "servicio/rest-1.0.jar"]
EXPOSE 8080
