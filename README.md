# wmfastr: Speedy Dwelltime and Search Preference Computations

**NOTICE**: while this package is installed from GitHub ([wikimedia/wmfastr](https://github.com/wikimedia/wmfastr)), that repository is a read-only mirror of [wikimedia/discovery/ortiz](https://gerrit.wikimedia.org/g/wikimedia/discovery/ortiz) repository hosted on [Gerrit](https://www.mediawiki.org/wiki/Gerrit). See [mediawiki:Developer account](https://www.mediawiki.org/wiki/Developer_account) for information about creating a Wikimedia Developer account for contributing to this package, MediaWiki, and other Wikimedia projects.

Other packages from [Wikimedia Foundations's Product Analytics team](https://www.mediawiki.org/wiki/Product_Analytics) include: [wmfdata](https://github.com/wikimedia/wmfdata-r) for working with Wikimedia data in R, [wmfdata](https://github.com/wikimedia/wmfdata-python) for working with Wikimedia data in Python, and [waxer](https://github.com/wikimedia/waxer) for querying Wikimedia Analytics Query Service in R.

## Installation

This package requires compilation with a compiler that supports [C++11](https://en.wikipedia.org/wiki/C%2B%2B11). `g++-5` and `clang++` 3.3 have (near-)complete C++11 support. `g++-6` and `g++-7` are pretty common on Linux and if you have the most recent version of Command Line Tools for Xcode (via `xcode-select --install`) for macOS, you should have `clang++` 5.0.0 (or later), which includes full C++11 support.

```R
# install.packages("remotes", repos = c(CRAN = "https://cran.rstudio.com/"))
remotes::install_github("wikimedia/wmfastr")
```

To update:

```R
remotes::update_packages("wmfastr")
```

## Highlights

Functions for estimating preference of ranking functions using clicks on interleaved search results:
  - `interleaved_preference` estimates preference; see vignette for details
  - `interleaved_bootstraps` resamples sessions with replacement to yield bootstrapped sample of preferences
  - `interleaved_confint` uses `interleaved_bootstraps` and `stats::quantile` to yield a bootstrapped confidence interval

Functions for determining user satisfaction rate based on dwell time:
  - `dwell_time`

## Maintainers

- [Mikhail Popov](https://meta.wikimedia.org/wiki/User:MPopov_(WMF))

## Additional Information

Please note that this project is released with a [Contributor Code of Conduct](CONDUCT.md). By participating in this project you agree to abide by its terms.
