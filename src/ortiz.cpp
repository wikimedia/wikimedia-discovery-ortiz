#include "dwell.h"

// [[Rcpp::export]]
std::vector < unsigned int > dwell_time_(std::list < std::vector < int > > timestamps){
  
  // Instantiate the dwelltime class, giving it the dwell value
  dwelltime dwell_inst;
  
  // Compute dwell times for the input list and return it.
  return dwell_inst.dwell_vector(timestamps);
}
