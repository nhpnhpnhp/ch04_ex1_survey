# Dockerfile
FROM tomcat:9.0-jdk17

# Xoá webapp mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Deploy app thành ROOT.war để chạy ở "/"
COPY ch04_ex1_survey.war /usr/local/tomcat/webapps/ROOT.war

# Cổng mặc định khi chạy local; Render sẽ gán biến $PORT riêng
EXPOSE 8080

# Đổi cổng trong server.xml sang $PORT (hoặc 8080 nếu không có $PORT) rồi chạy Tomcat
CMD sh -c 'P="${PORT:-8080}"; \
  sed -i "s/port=\\\"8080\\\"/port=\\\"$P\\\"/" /usr/local/tomcat/conf/server.xml && \
  catalina.sh run'
