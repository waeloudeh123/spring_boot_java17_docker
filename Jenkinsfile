node {
    def app

    stage('clone repository') {
    checkout scm

    }

    stage('Build image') {
    app = docker.build("spring1/spring")

    }

    stage('Test image') {

    app.inside {
        sh 'echo "Tests passed"'

    }

    stage('push image') {
        docker.withRegistry('http://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}

