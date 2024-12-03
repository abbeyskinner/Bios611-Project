FROM rocker/verse

# Unminimize the Ubuntu system to restore man pages and other documentation
RUN yes | unminimize

RUN apt update && apt install -y \
    git \
    man-db \
    manpages \
    libcurl4-openssl-dev \
    libssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c('tidyverse', 'survivoR))"


# Expose the default RStudio port
EXPOSE 8787

# Set the command to start RStudio
CMD ["/init"]


