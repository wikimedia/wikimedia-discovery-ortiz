# Speedy Search Preference Computations

## Installation

This package requires compilation with a compiler that supports [C++11](https://en.wikipedia.org/wiki/C%2B%2B11). `g++-5` and `clang++` 3.3 have (near-)complete C++11 support. `g++-6` and `g++-7` are pretty common on Linux and if you have the most recent version of Command Line Tools for Xcode (via `xcode-select --install`) for macOS, you should have `clang++` 5.0.0 (or later), which includes full C++11 support.

```R
# install.packages("remotes", repos = c(CRAN = "https://cran.rstudio.com/"))

remotes::install_git("https://gerrit.wikimedia.org/r/wikimedia/discovery/ortiz")

# Alternatively, you can install from GitHub mirror:
remotes::install_github("wikimedia/wikimedia-discovery-ortiz")
```

To update: `remotes::update_packages("ortiz")`

## Maintainers

- [Mikhail Popov](https://meta.wikimedia.org/wiki/User:MPopov_(WMF))

## Additional Information

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
