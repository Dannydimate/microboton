FROM openjdk:8-jre-alpine
RUN mkdir servicio
RUN apt-get update && apt-get install -y curlRUN curl -LO "https://dl.k8s.io/release/stable.txt"
RUN curl -LO "https://dl.k8s.io/$(cat stable.txt)/bin/linux/amd64/kubectl"
RUN chmod +x kubectl
RUN mv kubectl /usr/local/bin/
COPY build/libs/*.jar servicio/
ENTRYPOINT ["java", "-jar", "servicio/rest-1.0.jar"]
EXPOSE 8080

