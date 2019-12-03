context("Sample size calculations")

test_that("exact_binom calculates appropriate sample sizes", {
  expect_equal(exact_binom(0.75, 0.03, alpha = 0.05, power = 0.9, two_tail = TRUE), 2105)
  expect_equal(exact_binom(0.75, 0.03, alpha = 0.05, power = 0.9, two_tail = FALSE), 1716)
  expect_equal(exact_binom(0.75, 0.01, alpha = 0.05, power = 0.9, two_tail = TRUE), 19394)
})
