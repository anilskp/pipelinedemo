node {
   def commit_id
   stage('Preparation') {
     checkout scm
     sh "git rev-parse --short HEAD > .git/commit-id"                       
     commit_id = readFile('.git/commit-id').trim()
   }
 
   stage('docker build/push') {
     docker.withRegistry('https://index.docker.io/v1/', 'dockerhub') {
       def app = docker.build("anilskp/pipelinedemo", '.')
    
       app.push("${commit_id}")
       app.push("latest")
     }
   }
  
    stage ('Run Application') {
    sh 'sh ./job-dsl/startscript.sh' 
    }
}
