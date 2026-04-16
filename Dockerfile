FROM eclipse-temurin:11-jre

WORKDIR /app

# Copia el JAR generado previamente por CI y descargado como artifact
COPY artifact/*.jar app.jar

# Puerto habitual de Spring Boot
EXPOSE 8888

# Ejecuta la aplicación java
ENTRYPOINT ["java", "-jar", "/app/app.jar"]
VOLUME ["/app/work", "/app/work/logs"]

# ENTRYPOINT: crea BD con sql-maven-plugin (usa src/main/resources/*.sql del pom)
ENTRYPOINT ["sh", "-c", "mvn sql:execute -Dsql.format=false && java -jar app.jar"]
