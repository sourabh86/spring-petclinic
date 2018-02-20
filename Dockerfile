FROM maven as interim

WORKDIR /opt/petclinic 

COPY . .

RUN mvn package 

FROM java:8-jre-alpine

WORKDIR /

COPY --from=interim /opt/petclinic/target/spring-petclinic-*.jar app

EXPOSE 8080

CMD java -jar app
