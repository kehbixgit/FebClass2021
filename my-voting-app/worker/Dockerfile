FROM maven:3.6-openjdk-11-slim AS build

WORKDIR /code

COPY pom.xml /code/pom.xml
RUN ["mvn", "dependency:resolve"]
RUN ["mvn", "verify"]

# Adding source, compile and package into a fat jar
COPY ["src/main", "/code/src/main"]
RUN ["mvn", "package"]

FROM openjdk:11-jre-slim

COPY --from=build /code/target/worker-jar-with-dependencies.jar /

CMD ["java", "-XX:+UseContainerSupport", "-jar", "/worker-jar-with-dependencies.jar"]


