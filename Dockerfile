# Pupose of this Dockerfile is to build an image for yocto dev container

# Use Ubuntu 22.04 as the base image
FROM ubuntu:22.04

# Set environment variables to avoid prompts during package installations
ENV DEBIAN_FRONTEND=noninteractive

# Update the package list
RUN apt-get update

# Install basic utilities
RUN apt-get install -y curl
RUN apt-get install -y vim
RUN apt-get install -y git
RUN apt-get install -y sudo

# Install additional packages separately
RUN apt-get install -y gawk
RUN apt-get install -y wget
RUN apt-get install -y git-core
RUN apt-get install -y diffstat
RUN apt-get install -y unzip
RUN apt-get install -y texinfo
RUN apt-get install -y gcc-multilib
RUN apt-get install -y build-essential
RUN apt-get install -y chrpath
RUN apt-get install -y socat
RUN apt-get install -y cpio
RUN apt-get install -y python3
RUN apt-get install -y python3-pip
RUN apt-get install -y python3-pexpect
RUN apt-get install -y xz-utils
RUN apt-get install -y debianutils
RUN apt-get install -y iputils-ping
RUN apt-get install -y libsdl1.2-dev
RUN apt-get install -y xterm
RUN apt-get install -y lz4
RUN apt-get install -y zstd
RUN apt-get install -y file

# Install locales package and generate en_US.UTF-8
RUN apt-get install -y locales
RUN locale-gen en_US.UTF-8
ENV LANG=en_US.UTF-8
ENV LANGUAGE=en_US:en
ENV LC_ALL=en_US.UTF-8

# Clean up to reduce image size
RUN rm -rf /var/lib/apt/lists/*

# add a non-root passwordless user to avoid sanity errors
RUN groupadd containergroup
RUN adduser --ingroup containergroup vsuser --disabled-password

# Set the working directory
WORKDIR /workspaces
COPY change_owner.sh /usr/local/bin/change_owner.sh
RUN chmod +x /usr/local/bin/change_owner.sh

#switch to non-root user
USER vsuser

# Execute the change_owner script
ENTRYPOINT ["/usr/local/bin/change_owner.sh"]

# Print Welcome on Screen (optional)
CMD [ "echo Welcome" ]
