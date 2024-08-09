# Build stage
FROM maven:eclipse-temurin AS build

WORKDIR /app

COPY . .

RUN mvn package -DskipTests

# Run stage
FROM eclipse-temurin:21-jre-alpine

WORKDIR /app

COPY --from=build /app/target/spring-petclinic-3.3.0-SNAPSHOT.jar /app/

EXPOSE 8080

CMD ["java", "-jar", "spring-petclinic-3.3.0-SNAPSHOT.jar"]
