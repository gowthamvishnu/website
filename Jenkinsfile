pipeline {
      agent  { label 'master' }
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
                  sh "sudo git clone https://github.com/gowthamvishnu/website.git"
                  sh "sudo mv -v ./website /var/www/html"
                }
            }
        stage ("Building docker container") {
           steps { 
                  sh  "sudo docker stop websiteconatiner1"
                  sh "sudo docker rm -f websiteconatiner1"
                  sh "sudo docker rmi -f webappimage1"
                  sh  "sudo docker build /var/www/html/website -t webappimage1"
                  sh  "docker run -it -d -p 1001:80 --name websiteconatiner1 webappimage1"
                }
            }    
       stage ("testing the website") {
             steps {
                  sh "/home/website.sh"
                }
            }
         stage ("push to production") {
             steps {
                  sh "sudo ansible-playbook /home/prod.yml"
                }
            }
        }
   }
