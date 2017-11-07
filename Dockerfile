FROM ubuntu:16.04

LABEL maintainer="Jaeyoung Chun (jaeyoung.chun@weizmann.ac.il)"

# copy script that installs R packages
COPY install-packages.R /tmp/install-packages.R

RUN apt-get update -y \
    && apt-get install -y software-properties-common wget git bzip2 apt-transport-https

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 \
    && add-apt-repository 'deb [arch=amd64,i386] https://cran.rstudio.com/bin/linux/ubuntu xenial/' \
    && apt-get update -y \
    && apt-get install -y r-base r-base-dev

RUN Rscript --vanilla /tmp/install-packages.R

WORKDIR /tmp

RUN git clone https://github.com/Oshlack/STRetch.git STRetch \
    && cd STRetch \
    && ./install.sh

# clean up
RUN rm -rf /tmp/install-packages.R

ENTRYPOINT ["bash"]
