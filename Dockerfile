FROM rocker/verse

# Unminimize the Ubuntu system to restore man pages and other documentation
RUN yes | unminimize

# Install required packages
RUN apt update && apt install -y \
    git \
    man-db \
    manpages \
    && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c('tidyverse', 'survivoR', 'ggplot2'))"


# Expose the default RStudio port
EXPOSE 8787

# Set the command to start RStudio
CMD ["/init"]

