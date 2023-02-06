FROM openjdk:8-jre-alpine
RUN mkdir servicio
COPY build/libs/*.jar servicio/
COPY --from=lachlanevenson/k8s-kubectl:v1.10.3 /usr/local/bin/kubectl /usr/local/bin/kubectl
ENTRYPOINT ["java", "-jar", "servicio/rest-1.0.jar"]
EXPOSE 8080
