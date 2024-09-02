# Etapa de construcción
FROM maven:3.9.3-eclipse-temurin-21 AS build
COPY . .
RUN mvn package -DskipTests

# Etapa de ejecución
FROM eclipse-temurin:21-jdk-slim
COPY --from=build /target/moteteapp-0.0.1-SNAPSHOT.jar moteteapp.jar

EXPOSE 8080

ENTRYPOINT [ "java", "-jar", "moteteapp.jar" ]
