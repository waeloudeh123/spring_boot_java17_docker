# Verwende ein Basis-Image mit Java 17
FROM openjdk:17-jdk-slim

# Erstelle ein Verzeichnis für die App
WORKDIR /app

# Kopiere die Abhängigkeiten und die kompilierten Dateien in den Container
COPY target/spring_boot_17-0.0.1-SNAPSHOT.jar app.jar

# Setze Umgebungsvariablen für PostgreSQL, falls nötig
ENV SPRING_DATASOURCE_URL=jdbc:postgresql://localhost:5432/student
ENV SPRING_DATASOURCE_USERNAME=wael
ENV SPRING_DATASOURCE_PASSWORD=wael

# Exponiere Port 8081 für die Anwendung
EXPOSE 8081

# Starte die Anwendung
ENTRYPOINT ["java", "-jar", "app.jar"]