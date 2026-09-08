pipeline {
    agent {
        label "webserver"
    }
    stages {
        stage ("pull") {
            steps {
                git 'https://github.com/AnupDudhe/studentapp-ui'
            }
        }
        stage ("build & test") {
            steps {
                // Combine build and test so we only 'clean' once at the start
                sh '''
                mvn clean verify sonar:sonar \
                  -Dsonar.projectKey=student-app \
                  -Dsonar.host.url=http://13.204.92.226:9000 \
                  -Dsonar.login=sqp_c296d0c9cd7f1822bfe28f17adb08d315c0ab8a8
                '''
            }
        }
        stage ("deploy") {
            steps {
                sh '''
                # 1. Download Tomcat (Archive is safer for specific versions)
                sudo curl -L -O https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.115/bin/apache-tomcat-9.0.115.zip
                sudo mv apache-tomcat-9.0.115.zip /opt/
                
                # 2. Extract (using -o to overwrite)
                sudo apt-get install unzip -y 
                sudo unzip -o /opt/apache-tomcat-9.0.115.zip -d /opt/ 
                
                # 3. Deploy the WAR
                # Using ${WORKSPACE} ensures Jenkins finds the file regardless of the absolute path
                sudo mv "${WORKSPACE}/target/studentapp-2.2-SNAPSHOT.war" /opt/apache-tomcat-9.0.115/webapps/student.war

                # 4. Permissions & Start
                sudo chmod +x /opt/apache-tomcat-9.0.115/bin/*.sh
                
                # Stop existing tomcat if running to avoid port conflicts
                sudo bash /opt/apache-tomcat-9.0.115/bin/catalina.sh stop || true
                sudo bash /opt/apache-tomcat-9.0.115/bin/catalina.sh start
                
                # Cleanup zip
                sudo rm -f /opt/apache-tomcat-9.0.115.zip
                '''
            }
        }
    }
}