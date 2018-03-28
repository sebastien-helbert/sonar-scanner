# SonarQube Scanner

Docker image to run sonar-scanner analyzes.

# Supported tags and respective `Dockerfile` links

-	[`3.1.0`, `latest` (*3.1.0/Dockerfile*)](https://github.com/sebastien-helbert/sonar-scanner/blob/3.1.0/Dockerfile)

# How to use this image

## Run a sonar scan

Assuming that `./sample-project/src` is the source directory of the project :

```console
$ docker run -v $(pwd)/sample-project/src:/sonar-sources -e SONAR_HOST_URL=https://my_sonar_host -e SONAR_LOGIN=my_sonar_login -e SONAR_PASSWORD=my_sonar_pwd -e SONAR_PROJECT_KEY=sample-project shelbert/sonar-scanner
```

## Environment Variables

### `SONAR_HOST_URL`

Mandatory. SonarQube server URL.

### `SONAR_PROJECT_KEY`

Mandatory project kek. Must be unique in a given SonarQube instance.

### `SONAR_LOGIN`

Optional username to connect to SonarQube server.

### `SONAR_PASSWORD`

Optional username to connect to SonarQube server.

### `SONAR_SCANNER_OPTS`

Optional. Other sonar parameters may me specified throught SONAR_SCANNER_OPTS.

For example : `SONAR_SCANNER_OPTS=-Dsonar.projectName=MyProjetName`

See [Sonar scanner official doc](https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner) for more details
