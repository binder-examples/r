# Specifying an R environment with a runtime.txt file

Jupyter+R: [![Binder](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/binder-examples/rstudio/master?filepath=index.ipynb)

RStudio: [![Binder](http://mybinder.org/badge.svg)](http://beta.mybinder.org/v2/gh/binder-examples/rstudio/master?urlpath=rstudio)

Binder supports using R + RStudio, with libraries pinned to a specific 
snapshot on [MRAN](https://mran.microsoft.com/documents/rro/reproducibility).

You need to have a `runtime.txt` file that is formatted like:

```
r-<YYYY>-<MM>-<DD>
```

where YYYY-MM-DD is a snapshot at MRAN that will be used for installing
libraries.

You can also have an `install.R` file that will be executed during build,
and can be used to install libraries.

Both [RStudio](https://www.rstudio.com/) and [IRKernel](https://irkernel.github.io/)
are installed by default, so you can use either the Jupyter notebook interface or
the RStudio interface.
