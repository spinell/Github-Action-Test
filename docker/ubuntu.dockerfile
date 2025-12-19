FROM ubuntu:25.04

ARG USERNAME="devcontainer"
ARG USERID="1001"

# Prevent interactive prompts during installation
# This will be set inside the docker for all user.
ENV DEBIAN_FRONTEND=noninteractive

RUN useradd --shell /bin/bash          \
               --create-home ${USERNAME} \
               --uid ${USERID}


# This will auto create the folder and should have root permission
WORKDIR /my_working_root

USER ${USERNAME}

# Set somme environment variable.
# This will be set for root and the current user.
ENV MY_DOCKER_ENV1="MY_DOCKER_ENV1"
ENV MY_DOCKER_ENV2="MY_DOCKER_ENV2"

# This will auto create the folder and This should have the "user" permission
WORKDIR /my_working_directory

ENTRYPOINT ["/bin/bash"]
