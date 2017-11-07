#!/usr/bin/Rscript

# install required R libraries
pkgs = c('optparse', 'plyr', 'dplyr', 'tidyr', 'reshape2')

install.packages(pkgs, repos='http://cran.us.r-project.org')
