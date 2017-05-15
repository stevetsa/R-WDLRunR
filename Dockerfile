
#################################################################
# This creates a Docker image for R-dev with WDLRunR
# https://github.com/seandavi/wdlRunR
##################################################################
# Set the base image to Ubuntu:latest Python 3.5.2
FROM rocker/r-devel
# File/Author / Maintainer
MAINTAINER Steve Tsang <mylagimail2004@yahoo.com>
# Updates and Installs

# install WDLRunR
RUN echo 'require(devtools)\ndevtools::install_github('seandavi/wdlRunR')' > /tmp/WDLRunR.R \
    && Rscript /tmp/WDLRunR.R

# create an R user
ENV HOME /home/user
RUN useradd --create-home --home-dir $HOME user \
    && chown -R user:user $HOME

WORKDIR $HOME
USER user

# set the command
CMD ["R"]
