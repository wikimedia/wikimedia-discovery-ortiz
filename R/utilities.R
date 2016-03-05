numeric_check <- function(data, timestamps) {
  if (any(c("POSIXt", "POSIXlt", "POSIXct") %in% unlist(lapply(data[, timestamps], class)))) {
    data[, timestamps] <- as.numeric(data[, timestamps])
  } else if (!any(c("numeric", "integer") %in% class(data[, timestamps]))) {
    stop("The timestamps column must be either a numeric value representing seconds or POSIX timestamps")
  }
  return(data)
}
