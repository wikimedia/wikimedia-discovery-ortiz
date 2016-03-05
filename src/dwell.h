#include <Rcpp.h>
using namespace Rcpp;

#ifndef __ORTIZ_DWELLTIME__
#define __ORTIZ_DWELLTIME__

class dwelltime {
  
private:
  
  unsigned int dwell_single(std::vector < int > timestamps);
  
public:
  
  std::vector < unsigned int > dwell_vector(std::list < std::vector < int > > timestamps);
  
};

#endif
