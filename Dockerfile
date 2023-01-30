FROM openjdk:8-jre-alpine
RUN mkdir servicio
COPY build/libs/*.jar servicio/
ENTRYPOINT ["java", "-jar", "servicio/micro-boton:1.0.jar"]
EXPOSE 8080
