test_data <- lapply(
  ortiz:::fake_interleaved_data(n_sessions = 10, seed = 0),
  function(dataset) {
    return(dataset[dataset$event == "click", ])
  }
)

saveRDS(test_data, file = "inst/extdata/sample_clicks.rds", compress = TRUE)
