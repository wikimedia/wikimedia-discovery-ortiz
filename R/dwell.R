#'@title Identify User Satisfaction Rate Based on Dwell Time
#'
#'@description One simple satisfaction heuristic is to look at the dwell time
#'a user has on each page in a session and whether any one of those
#'dwell-times exceeds a certain threshold. If it does, that session is deemed
#'to be one in which the user was satisfied. \code{dwell_time} calculates
#'that for a data.frame of user sessions.
#'
#'@param data a data.frame containing session data
#'
#'@param ids the name or indices of the column containing unique session IDs
#'
#'@param timestamps the name or indices of the column containing timestamps.
#'
#'@param dwell_threshold the value (in seconds) to use to indicate a "successful"
#'session.
#'
#'@export
dwell_time <- function(data, ids, timestamps, dwell_threshold = 100){
  
  # Check type. We need timestamps to end up as numeric seconds representations,
  # which we can trivially convert to if they're POSIX (or if they're already)
  # formatted) but can't handle consistently otherwise.
  if(any(c("POSIXlt","POSIXt") %in% c(class(data[,timestamps])))){
    data[,timestamps] <- as.numeric(data[,timestamps])
  } else if(!any(c("numeric","integer") %in% class(data[,timestamps]))){
    stop("The timestamps column must be either a numeric value representing seconds,
         or POSIX timestamps")
  }
  
  # Split the data up per unique session/user ID.
  split_data <- split(x = data[,timestamps], f = data[,ids])
  
  return(dwell_time_(split_data, dwell_threshold))
}
