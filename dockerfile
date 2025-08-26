FROM tomcat:9.0-jdk17

# Xoá webapp mặc định
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR thành ROOT.war để chạy ở "/"
COPY ch04_ex1_survey.war /usr/local/tomcat/webapps/ROOT.war

# Render set biến PORT, ta thay cổng Tomcat về đúng giá trị này
EXPOSE 8080
CMD sh -c "sed -i 's/port=\"8080\"/port=\"'\"${PORT:-8080}\"'/' /usr/local/tomcat/conf/server.xml && catalina.sh run"
