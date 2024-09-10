# Use the rocker/verse base image
FROM rocker/verse

# Unminimize the Ubuntu system to restore man pages and other documentation
RUN yes | unminimize

RUN apt update && apt-get install -y git


# Install man-db and manpages, which are required to view manual pages
RUN apt update && apt install -y \
    man-db \
    manpages \
    && rm -rf /var/lib/apt/lists/*

# Expose the default RStudio port
EXPOSE 8787

# Set the command to start RStudio
CMD ["/init"]

