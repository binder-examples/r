# Specifying an R environment with a runtime.txt file

Jupyter+R: [![Binder](http://mybinder.org/badge_logo.svg)](http://mybinder.org/v2/gh/binder-examples/r/master?filepath=index.ipynb)

RStudio: [![Binder](http://mybinder.org/badge_logo.svg)](http://mybinder.org/v2/gh/binder-examples/r/master?urlpath=rstudio)

RShiny: [![Binder](http://mybinder.org/badge_logo.svg)](http://mybinder.org/v2/gh/binder-examples/r/master?urlpath=shiny/bus-dashboard/)

Binder supports using R and RStudio, with libraries pinned to a specific 
snapshot on [MRAN](https://mran.microsoft.com/documents/rro/reproducibility).

**Note:** An alternative is to use the [holepunch package for R](https://karthik.github.io/holepunch/articles/getting_started.html).

You need to have a `runtime.txt` file that is formatted like:

```
r-<YYYY>-<MM>-<DD>
```

where YYYY-MM-DD is a snapshot at MRAN that will be used for installing 
libraries. In this line, you can request a [specific 
version of R](https://github.com/jupyter/repo2docker/pull/772#issue-313426641). To do this list the version between the 'r' 
and the year, as in `r-3.6-2019-09-24`. Right now the default version of R is 3.6.

> We recommend using https://github.com/binder-examples/r-conda for faster installs than using a `install.R`

To install R libraries (or packages) you can add an [`install.R`](install.R) file that specifies one library to install per line.

Both [RStudio](https://www.rstudio.com/) and [IRKernel](https://irkernel.github.io/)
are installed by default, so you can use either the Jupyter notebook interface or
the RStudio interface.

This repository also contains an example of a Shiny app.

Last, note that if your Binder URL points to a folder, as in 

http://mybinder.org/v2/gh/binder-examples/r/master?urlpath=shiny/bus-dashboard/,

you will need (1) to put in the final slash in the URL, and (2) to avoid converted 
spaces-'%20'-in the URL, instead placing a hyphen.
