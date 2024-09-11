FROM rocker/verse

# Unminimize the Ubuntu system to restore man pages and other documentation
RUN yes | unminimize

RUN apt update && apt install -y git man-db


# Install man-db and manpages
RUN apt update && apt install -y \
    man-db \
    manpages \
    && rm -rf /var/lib/apt/lists/*

# Expose the default RStudio port
EXPOSE 8787

# Set the command to start RStudio
CMD ["/init"]

