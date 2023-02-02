FROM openjdk:19
COPY target/spring-boot-docker.jar spring-boot-docker.jar
CMD [ "java","-jar", "/spring-boot-docker.jar"]
