pipeline {
     agent  { label 'dev_node' }
     stages {
         stage ("cloning the git repo") {
             steps {
                  git 'https://github.com/gowthamvishnu/website.git'
                }
            }
         stage ("building the website") {
             steps {
                  sh "sudo rm -rf website"
                  sh "sudo rm -rf /var/www/html/website"
                  sh "sudo apt-get update -y"
                  sh "sudo apt-get install apache2 -y"
                  sh "sudo service apache2 start"
                  sh "sudo git clone -b develop https://github.com/gowthamvishnu/website.git"
                  sh "sudo mv -v ./website /var/www/html"
                }
            }
         stage ("Building docker container") {
           steps { 
                  sh "sudo docker rmi -f webappimage"
                  sh  "sudo docker build /var/www/html/website -t webappimage"
                  sh  "docker run -it -d -p 1002:80 --name websiteconatiner1 webappimage"
                }
            }
         stage ("testing the website") {
             steps {
                  sh "/home/website.sh"
                }
            }
        }
   }
