Sys.unsetenv("R_TESTS")

library(testthat)
library(ortiz)

test_check("ortiz")
