FROM ubuntu:23.04

# Make sure all sources are up to date
RUN apt update && \
        apt upgrade -y --autoremove && \
        apt install -y --no-install-recommends \
                python3 python3-pip python3-dev \
                gcc clang git gdb make \
                findutils bzip2 e2fsprogs sudo && \
        apt clean && rm -rf /var/lib/apt/lists/*

# UserID 5000 required for Artemis Build Infrastructure
RUN useradd --uid 5000 artemis_user

# Give the artemis_user sudo rights without a password by default
RUN echo "artemis_user     ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers

# Change the user to the default Artemis user (away from root)
USER artemis_user
