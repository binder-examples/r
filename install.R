# List of packages to install
pkgs = c("tidyverse", "rmarkdown", "httr", "shinydashboard", "leaflet")

# Speed up install by allowing multiple cores as
# the packages above are installed from source and not a binary
ncores = parallel::detectCores()

# Install each package
install.packages(pkgs, Ncpus = ncores)
