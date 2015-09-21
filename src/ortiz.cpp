#include "dwell.h"

// [[Rcpp::export]]
std::vector < bool > dwell_time_(std::list < std::vector < int > > timestamps, int dwell_value){
  
  // Instantiate the dwelltime class, giving it the dwell value
  dwelltime dwell_inst(dwell_value);
  
  // Compute dwell times for the input list and return it.
  return dwell_inst.dwell_vector(timestamps);
}
