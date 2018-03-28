#!/bin/sh
set -eu 
IFS=$'\n\t'

if [ "$1" = 'sonar-scanner' ]; then
	if [ -z "${SONAR_HOST_URL-}" ]; then
	  echo ">>> Environment variable SONAR_HOST_URL is mandatory."
	  exit 1
	else
	  export SONAR_SCANNER_OPTS="${SONAR_SCANNER_OPTS} -Dsonar.host.url=$SONAR_HOST_URL"
	fi
	
	if [ -z "${SONAR_PROJECT_KEY-}" ]; then
	  echo ">>> Environment variable SONAR_PROJECT_KEY is mandatory."
	  exit 1
	else
	  export SONAR_SCANNER_OPTS="${SONAR_SCANNER_OPTS} -Dsonar.projectKey=$SONAR_PROJECT_KEY"
	fi
	
	if [ -z "${SONAR_SOURCES-}" ]; then
	  echo ">>> Environment variable SONAR_SOURCES is not defined, using /sonar-sources as default source directory."
	  export SONAR_SCANNER_OPTS="${SONAR_SCANNER_OPTS} -Dsonar.sources=/sonar-sources"
	else
	  export SONAR_SCANNER_OPTS="${SONAR_SCANNER_OPTS} -Dsonar.sources=$SONAR_SOURCES"
	fi
	
	if [ ! -z "${SONAR_LOGIN-}" ]; then
	  export SONAR_SCANNER_OPTS="${SONAR_SCANNER_OPTS} -Dsonar.login=$SONAR_LOGIN"
	fi
	
	if [ ! -z "${SONAR_PASSWORD-}" ]; then
	  export SONAR_SCANNER_OPTS="${SONAR_SCANNER_OPTS} -Dsonar.password=$SONAR_PASSWORD"
	fi
fi

exec "$@"