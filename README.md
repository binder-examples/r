# Specifying an R environment with a runtime.txt file

Jupyter+R: [![Binder](http://mybinder.org/badge_logo.svg)](http://mybinder.org/v2/gh/binder-examples/r/master?filepath=index.ipynb)

RStudio: [![Binder](http://mybinder.org/badge_logo.svg)](http://mybinder.org/v2/gh/binder-examples/r/master?urlpath=rstudio)

RShiny: [![Binder](http://mybinder.org/badge_logo.svg)](http://mybinder.org/v2/gh/binder-examples/r/master?urlpath=shiny/bus-dashboard/)

Binder supports using R and RStudio, with libraries pinned to a specific
snapshot on [packagemanager.rstudio.com](https://packagemanager.rstudio.com/client/#/).

### Requirements and suggestions

You need to have a `runtime.txt` file that is formatted like:

```
r-<r-version>-<YYYY>-<MM>-<DD>
```

where `<r-version>` is a version of R (like 4.1, 4.0, etc) you want to use,
and `<YYYY>-<MM>-<DD>` is the date for [a snapshot](https://packagemanager.rstudio.com/client/#/repos/1/overview)
from [packagemanager.rstudio.com](https://packagemanager.rstudio.com) that will
be used for installing your R packages.

Try using a date newer than `2022-01-01`, as you'll get faster
package installs thanks to [binary packages](https://www.rstudio.com/blog/package-manager-v1-1-no-interruptions/)
from rstudio.packagemanager.com!

To install R libraries, add `install.package("<package-name>")` calls to
`install.R`. If you want to pin to a specific version of the library, you
can also do `devtools::install_version("<package-name>", "<version>")`.

For some R packages, you might need to install system packages via apt - you can
do so by writing out a list of apt package names in `apt.txt`. You can find
the list of such packages in the page for your package at
[packagemanager.rstudio.com](https://packagemanager.rstudio.com/client/#/). Make sure
to select "Ubuntu 18.04 (Bionic)" in the dropdown on the top right.

Both [RStudio](https://www.rstudio.com/) and [IRKernel](https://irkernel.github.io/)
are installed by default, so you can use either the Jupyter notebook interface or
the RStudio interface.

This repository also contains an example of a [Shiny app](https://github.com/binder-examples/r/tree/master/bus-dashboard).

## Alternatives

There are many ways to use R in mybinder.org!

**[rocker/binder](https://github.com/rocker-org/binder/)** - this uses a base image from the R community's
excellent [rocker project](https://www.rocker-project.org/) - you get a lot of curated base
packages, faster binary package installs as well as ability to pin to a specific version of R (>4.0).

**[r-conda](https://github.com/binder-examples/r-conda)** - mybinder.org also
supports using the [conda](https://conda.io) package manager to manage R and R packages.
This gives you access to specific R versions as well as fast installs of R
packages available in [conda-forge](https://conda-forge.org/)

Another alternative is to use the [holepunch package for R](https://karthik.github.io/holepunch/articles/getting_started.html).

### URL addresses for RStudio and Shiny environments

The Binder repository can be used to allow anyone to access an RStudio environment containing our code and data right
in their web browser. It also allows hosting a Shiny app. For those purposes, we have to append a bit of text to the
URL of our Binder repository, which we can find out at [mybinder.org](https://mybinder.org/) when we enter
the URL of our original repository from GitHub or Figshare, etc.

- For the RStudio environment, we must add the following at the end of the URL: `?urlpath=rstudio`

  - Example: http://mybinder.org/v2/gh/binder-examples/r/master?urlpath=rstudio

- For the Shiny app environment, we must add the following at the end of the URL: `?urlpath=shiny`. In this case, we
also have to note that if the Shiny app files are located in a folder, this folder should be specified in the URL,
after a slash. We would then also have to put in a trailing slash at the end of the URL, and to avoid spaces in the
name of the repository, placing instead a hyphen (the reason is that spaces are converted to `%20`).

  - Example: http://mybinder.org/v2/gh/binder-examples/r/master?urlpath=shiny/bus-dashboard/
