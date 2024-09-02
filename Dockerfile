FROM eclipse-temurin:21-jdk as build
COPY . .
RUN mvn package -DskipTests

FROM eclipse-temurin:21-jre

COPY --from=build /target/moteteapp-0.0.1-SNAPSHOT.jar moteteapp.jar

EXPOSE 8080

ENTRYPOINT [ "java", "-jar", "moteteapp.jar" ]