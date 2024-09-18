# Build stage
FROM maven:3.9.0-openjdk-21 AS build
WORKDIR /app

# Sao chép mã nguồn vào container
COPY . .

# Build ứng dụng
RUN mvn clean package -DskipTests

# Run stage
FROM openjdk:21-jdk-slim
WORKDIR /app

# Sao chép file WAR từ build stage vào container
COPY --from=build /app/target/DrComputer-0.0.1-SNAPSHOT.war drcomputer.war
EXPOSE 8080 

# Chạy ứng dụng
ENTRYPOINT ["java", "-jar", "drcomputer.war"]
