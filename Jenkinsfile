pipeline {
     agent any
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
        }
   }