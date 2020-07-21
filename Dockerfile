FROM ubuntu:18.04
RUN apt update && apt install maven openjdk-8-jdk -y jetty9 curl
RUN update-java-alternatives --set /usr/lib/jvm/java-1.8.0-openjdk-amd64

COPY . /var/lib/jetty/webapps
WORKDIR "/var/lib/jetty/webapps"
RUN mvn clean package

EXPOSE 8080
CMD mvn jetty:run
