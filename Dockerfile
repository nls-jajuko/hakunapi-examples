FROM adoptopenjdk/maven-openjdk11 AS build

WORKDIR /app

COPY pom.xml .
RUN mvn clean verify -q --fail-never
COPY src ./src
RUN mvn clean package -Dmaven.test.skip

FROM tomcat:9-jre11

COPY --from=build /app/src/hakunapi-simple-webapp-javax/target/features.war /usr/local/tomcat/webapps/

#EXPOSE 8080
CMD ["catalina.sh", "run"]
