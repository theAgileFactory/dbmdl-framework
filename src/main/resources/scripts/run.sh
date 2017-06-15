#!/bin/sh

cd `dirname $0`

chmod u+x *.sh

echo "Execute database migration if needed"
#mvn -f migration-pom.xml migration:up -Dmigration.env=deploy
./migrate.sh up --path=../repo --env=deploy

echo "End of execution"
