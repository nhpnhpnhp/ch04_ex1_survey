FROM tomcat:9.0-jdk17

RUN rm -rf /usr/local/tomcat/web/*
COPY ch04_ex1_survey.war /usr/local/tomcat/web/ROOT.war

EXPOSE 8080
