#include <Rcpp.h>
using namespace Rcpp;

#ifndef __ORTIZ_DWELLTIME__
#define __ORTIZ_DWELLTIME__

class dwelltime {
  
private:
  
  unsigned int dwell_val;
  
  bool dwell_single(std::vector < int > timestamps);
  
public:
  
  std::vector < bool > dwell_vector(std::list < std::vector < int > > timestamps);
  
  dwelltime(int val);
};

#endif
