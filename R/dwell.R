#' @title Identify User Satisfaction Rate Based on Dwell Time
#' @description One simple satisfaction heuristic is to look at the dwell time
#'  a user has on each page in a session and whether any one of those
#'  dwell-times exceeds a certain threshold. If it does, that session is deemed
#'  to be one in which the user was satisfied. `dwell_time` calculates
#'  that for a data.frame of user sessions.
#' @param data a `data.frame` containing session data
#' @param id_col the name or index of the column containing unique session IDs
#' @param ts_col the name or index of the column containing timestamps
#' @param dwell_threshold the value (in seconds) to use to indicate a
#'  "successful" session
#' @examples
#' # Data:
#' ts <- as.POSIXct(
#'   c("2016-03-01T06:52:49Z", "2016-03-01T06:53:19Z", "2016-03-01T06:53:39Z"),
#'   format = "%Y-%m-%dT%H:%M:%SZ", tz = "UTC"
#' )
#' x <- data.frame(timestamp = ts, session_id = "0024c4506bf92e1c")
#'
#' # Use default threshold:
#' dwell_time(x, "session_id", "timestamp")
#'
#' # Use 10s threshold:
#' dwell_time(x, "session_id", "timestamp", 10)
#' @export
dwell_time <- function(data, id_col, ts_col, dwell_threshold = 100) {

  # Check type. We need timestamps to end up as numeric seconds representations,
  # which we can trivially convert to if they're POSIX (or if they're already)
  # formatted) but can't handle consistently otherwise.
  data <- numeric_check(data, ts_col)

  # Split the data up per unique session/user ID.
  splitData <- split(x = data[, ts_col], f = data[, id_col])

  return(dwell_time_(splitData) - 1 > dwell_threshold + 0.5)
}
