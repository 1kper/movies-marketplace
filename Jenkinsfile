def imageName = '1kper/movies-marketplace'
def registry = 'https://registry.slowcoder.com'

node('workers'){
    stage('Checkout'){
        checkout scm
    }

    def imageTest= docker.build("${imageName}-test", "-f Dockerfile.test .")

    stage('Quality Tests'){
        sh 'echo "SKIPPING LINTING IN QA FOR NOW"'
    } 

 



    stage('Build'){
         sh "docker build -t 1kper/movies-marketplace   --build-arg ENVIRONMENT=sandbox ."
        
    }

    stage('Push'){
        
          sh "aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 635154829813.dkr.ecr.us-west-2.amazonaws.com"
          sh  "docker tag 1kper/movies-marketplace:latest 635154829813.dkr.ecr.us-west-2.amazonaws.com/1kper/movies-marketplace:latest"
          sh  "docker push 635154829813.dkr.ecr.us-west-2.amazonaws.com/1kper/movies-marketplace:latest"
            
    }
}

def commitID() {
    sh 'git rev-parse HEAD > .git/commitID'
    def commitID = readFile('.git/commitID').trim()
    sh 'rm .git/commitID'
    commitID
}
