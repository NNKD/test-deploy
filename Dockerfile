# Sử dụng hình ảnh chính thức của OpenJDK 21
FROM openjdk:21-jdk-slim

# Đặt thư mục làm việc
WORKDIR /app

# Sao chép file JAR được build từ ứng dụng vào container
COPY target/ManagementBE-0.0.1-SNAPSHOT.jar app.jar

# Mở cổng ứng dụng (nếu cần, Render.com tự động gán cổng)
EXPOSE 8080

# Chạy ứng dụng
ENTRYPOINT ["java", "-jar", "app.jar"]
