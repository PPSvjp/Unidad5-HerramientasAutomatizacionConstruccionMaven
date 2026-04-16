FROM eclipse-temurin:11-jre

WORKDIR /app

# Copia el JAR generado previamente por CI y descargado como artifact
COPY artifact/*.jar app.jar

# Puerto habitual de Spring Boot
EXPOSE 8080

# Ejecuta la aplicación java
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
