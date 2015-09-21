#include "dwell.h"

bool dwelltime::dwell_single(std::vector < int > timestamps){
  
  // We can't compute if there was only one event (this should
  // only happen if a user never made it to a result but whatever)
  int input_size = timestamps.size();
  if(input_size < 2){
    return false;
  }
  
  // Ensure timestamps are sorted
  sort(timestamps.begin(), timestamps.end());
  
  // Compute intertime values. If any of them are >
  // dwell_time, we have a success.
  for(unsigned int i = 1; i < input_size; i++){
    if((timestamps[i] - timestamps[i-1]) >= dwell_val){
      return true;
    }
  }
  
  // Otherwise, fail
  return false;
  
}

std::vector < bool > dwelltime::dwell_vector(std::list < std::vector < int > > timestamps){
  
  // Create output object
  unsigned int input_size = timestamps.size();
  std::vector < bool > output(input_size);
  
  // We can't iterate over a list with indices, which is sad (and means we have to
  // distinctly increment an integer for assignment to the output vector)
  unsigned int i = 0;
  
  // For each session, calculate whether it passed the dwell threshold and add that value to
  // the equivalent slot in 'output'.
  for(std::list < std::vector < int > >::iterator it = timestamps.begin(); it != timestamps.end(); ++it) {
    output[i] = dwell_single(*it);
    i++;
  }
  
  // Return
  return output;
}

dwelltime::dwelltime(int val){
  dwell_val = val;
}
