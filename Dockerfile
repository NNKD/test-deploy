# Build stage
FROM openjdk:21-jdk AS build
WORKDIR /app

# Cài đặt Maven
RUN apt-get update && \
    apt-get install -y maven

# Sao chép mã nguồn vào container
COPY . .

# Build ứng dụng
RUN mvn clean package -DskipTests

# Run stage
FROM openjdk:21-jdk
WORKDIR /app

# Sao chép file JAR từ build stage vào container
COPY --from=build /app/target/ManagementBE-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080 

# Chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.jar"]
