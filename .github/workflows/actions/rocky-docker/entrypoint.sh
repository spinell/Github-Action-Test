#!/bin/sh -l

echo "Hello $1"
echo "MY_ENV_1=$MY_ENV_1"
echo "MY_ENV_2=$MY_ENV_2"

cat /etc/os-release

echo "PWD: $PWD"
ls -la .

time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
