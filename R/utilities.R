numeric_check <- function(data, timestamps){
  if(any(c("POSIXlt","POSIXt") %in% c(class(data[,timestamps])))){
    data[,timestamps] <- as.numeric(data[,timestamps])
  } else if(!any(c("numeric","integer") %in% class(data[,timestamps]))){
    stop("The timestamps column must be either a numeric value representing seconds,
         or POSIX timestamps")
  }
  return(data)
}
