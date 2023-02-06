FROM openjdk:8-jre-alpine
FROM bitnami/kubectl:1.20.9 as kubectl
RUN mkdir servicio
COPY build/libs/*.jar servicio/
COPY --from=kubectl /opt/bitnami/kubectl/bin/kubectl /usr/local/bin/
ENTRYPOINT ["java", "-jar", "servicio/rest-1.0.jar"]
EXPOSE 8080
