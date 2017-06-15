#!/bin/sh
cd `dirname $0`
./migrate.sh $1 "${@:3}" --path=../repo --env=$2 || exit -1
