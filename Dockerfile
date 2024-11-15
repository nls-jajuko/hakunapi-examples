FROM maven AS build

WORKDIR /app

COPY pom.xml .
RUN mvn clean verify -q --fail-never
COPY src ./src
COPY webapp-javax ./webapp-javax
COPY webapp-jakarta ./webapp-jakarta
RUN mvn clean package -Dmaven.test.skip

FROM tomcat

COPY --from=build /app/webapp-jakarta/hakunapi-simple-webapp-jakarta/target/features.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]

