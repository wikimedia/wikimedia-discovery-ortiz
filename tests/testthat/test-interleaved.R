context("Interleaved search results")

test_data <- readRDS(system.file("extdata/sample_clicks.rds", package = "ortiz"))

test_that("preference statistic", {
  expect_equal(
    interleaved_preference(
      test_data$no_preference$session_id,
      test_data$no_preference$ranking_function
    ),
    -0.0833,
    tolerance = 0.001
  )
  expect_equal(
    interleaved_preference(
      test_data$a_preferred$session_id,
      test_data$a_preferred$ranking_function
    ),
    0.3571,
    tolerance = 0.001
  )
  expect_equal(
    interleaved_preference(
      test_data$b_preferred$session_id,
      test_data$b_preferred$ranking_function
    ),
    -0.4444,
    tolerance = 0.001
  )
})

set.seed(42)
bootstrapped_preferences <- interleaved_bootstraps(
  test_data$no_preference$session_id,
  test_data$no_preference$ranking_function,
  bootstraps = 10L
)

test_that("preference confidence intervals", {
  expect_equal(length(bootstrapped_preferences), 10)
})
