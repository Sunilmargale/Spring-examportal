# Use an official OpenJDK runtime as a parent image
FROM openjdk:17-jdk-alpine

# Set the working directory in the container
WORKDIR /app

# Copy the project’s JAR file to the container
COPY target/spring-examportal-0.0.1-SNAPSHOT.jar app.jar

# Expose the port that the application will run on
EXPOSE 5000

# Set the entry point to run the application
ENTRYPOINT ["java", "-jar", "app.jar"]
