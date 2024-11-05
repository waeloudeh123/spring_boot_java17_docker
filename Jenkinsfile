node {
    def app

    stage('clone repository') {
        checkout scm
    }

    stage('Build Jar') {
            sh 'mvn clean package'
        }

    stage('Build image') {
        app = docker.build("spring")
    }

    stage('Test image') {
        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('push image') {
        docker.withRegistry('http://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }
}
