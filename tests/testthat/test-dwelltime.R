context("dwelltime")

sample_events <- read.csv(system.file("extdata", "sample_events.csv", package="ortiz"), stringsAsFactors = FALSE)
sample_events$timestamp <- as.POSIXct(sample_events$timestamp, format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC")

test_that("intertimes are correctly estimated", {
  expect_equal(ortiz:::dwell_time_(split(x = sample_events[, "timestamp"], f = sample_events[, "session_id"])), c(31, 30))
})

test_that("session intertimes are correctly estimated", {
  expect_equal(ortiz:::dwell_time_(split(x = sample_events[c(1, 8:9, 18), "timestamp"], f = sample_events[c(1, 8:9, 18), "session_id"])), c(92, 150))
})

test_that("threshold of 0 returns all TRUE", {
  expect_equal(dwell_time(sample_events, "session_id", "timestamp", 0), c(TRUE, TRUE))
})

test_that("threshold of 100 returns all FALSE", {
  expect_equal(dwell_time(sample_events, "session_id", "timestamp", 100), c(FALSE, FALSE))
})

test_that("threshold of 30 returns 50% pass rate", {
  expect_equal(dwell_time(sample_events, "session_id", "timestamp", 30), c(TRUE, FALSE))
})
