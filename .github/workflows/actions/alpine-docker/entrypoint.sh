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

# Right a file inthe container.
# The file will be available to any subsequent steps in the same job.
# See: https://docs.github.com/en/actions/sharing-automations/creating-actions/creating-a-docker-container-action#accessing-files-created-by-a-container-action
echo "Hello from container !" > ./container_output.log
