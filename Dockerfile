FROM ubuntu:latest
RUN apt-get update -y
COPY build/libs/*.jar servicio/
ENTRYPOINT ["java", "-jar", "servicio/micro-boton:1.0.jar"]
EXPOSE 8080
