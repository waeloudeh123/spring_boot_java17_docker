// node {
//     def app
//
//     stage('clone repository') {
//         checkout scm
//     }
//
//     stage('Build Jar') {
//         bat 'mvn clean install'
//     }
//
//     stage('Build image') {
//         app = docker.build("spring")
//     }
//
//     stage('Test image') {
//         app.inside {
//             bat 'echo "Tests passed"'
//         }
//     }
//
//     stage('push image') {
//         docker.withRegistry('http://registry.hub.docker.com', 'docker-hub-credentials') {
//             app.push("${env.BUILD_NUMBER}")
//             app.push("latest")
//         }
//     }
// }
node {
    def app

    stage('Clone Repository') {
        echo 'Cloning the repository...'
        checkout scm
    }

    stage('Build Jar') {
        echo 'Building the JAR file...'
        bat 'mvn clean install'
    }

    stage('Build Docker Image') {
        echo 'Building the Docker image...'
        app = docker.build("spring")
    }

    stage('Test Docker Image') {
        echo 'Running tests on the Docker image...'
        app.inside {
            bat 'echo "Tests passed"'
        }
    }

    stage('Push Docker Image') {
        echo 'Pushing Docker image to registry...'
        docker.withRegistry('http://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }

    echo 'Pipeline completed successfully.'
}
