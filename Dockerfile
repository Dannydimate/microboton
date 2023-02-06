FROM openjdk:8-jre-alpine
RUN mkdir servicio
COPY build/libs/*.jar servicio/
RUN  /usr/bin/curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl \
     && chmod +x ./kubectl  \
     &&  mv ./kubectl /usr/local/bin/kubectl \
     && zypper install -y python2 \
     && zypper install -y python2-pip \
     && pip install kubernetes \
     && zypper install -y git \
     && zypper clean -a \
     && git clone --recursive https://github.com/kubernetes-client/python.git \
     && cd python \
     && python setup.py install
ENTRYPOINT ["java", "-jar", "servicio/rest-1.0.jar"]
EXPOSE 8080
