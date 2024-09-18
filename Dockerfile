# Build stage
FROM maven:3.9.0-eclipse-temurin-21 AS build
WORKDIR /app

# Sao chép mã nguồn vào container
COPY . .

# Build ứng dụng
RUN mvn clean package -DskipTests

# Run stage
FROM eclipse-temurin:21-jdk-slim
WORKDIR /app

# Sao chép file JAR từ build stage vào container
COPY --from=build /app/target/ManagementBE-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080

# Chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.jar"]
