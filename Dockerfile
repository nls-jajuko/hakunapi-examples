LABEL org.opencontainers.image.source=https://github.com/nls-jajuko/hakunapi-image
LABEL org.opencontainers.image.description="Hakunapi"
LABEL org.opencontainers.image.licenses=MIT

FROM maven AS build

RUN git clone https://github.com/nlsfi/hakunapi.git
WORKDIR /hakunapi
RUN mvn clean verify -q --fail-never
RUN mvn clean package -Dmaven.test.skip

FROM tomcat

COPY --from=build /hakunapi/webapp-jakarta/hakunapi-simple-webapp-jakarta/target/features.war /usr/local/tomcat/webapps/

CMD ["catalina.sh", "run"]

