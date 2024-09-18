# Stage 1: Build
FROM maven:3.9.0-openjdk-21 AS build
WORKDIR /app
COPY pom.xml .
COPY src ./src
RUN mvn clean package -DskipTests

# Stage 2: Run
FROM openjdk:21-jdk-alpine
WORKDIR /app
COPY --from=build /app/target/your-app.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
