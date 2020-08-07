#! /bin/bash
PROFILE=$1
if [[ -z "$PROFILE" ]]; then
    PROFILE=dev
fi
echo "profile:${PROFILE}"
mvn clean package -P${PROFILE} -DskipTests
echo "profile:${PROFILE}"