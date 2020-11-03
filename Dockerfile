FROM adoptopenjdk/openjdk11:x86_64-alpine-jre-11.0.6_10
RUN apk --no-cache add curl
HEALTHCHECK --interval=30s --timeout=10s --start-period=30s --retries=30 CMD curl -f http://localhost:8888/actuator/health || exit 1

ENTRYPOINT ["java", "-jar", "config-service-0.0.1-SNAPSHOT.jar"]

WORKDIR /app
COPY target/config-service-0.0.1-SNAPSHOT.jar /app/config-service-0.0.1-SNAPSHOT.jar
