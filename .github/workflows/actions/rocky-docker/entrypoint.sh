#!/bin/sh -l

echo "Hello $1"

echo "=========== Environment ==========="
env

echo "=========== os-release ==========="
cat /etc/os-release

echo "PWD: $PWD"
ls -la .

time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
