#' print function
#'
#' @param x Object of class Rasch
#'
#' @return Test-taker student's name and the EAP results
#' @author Noah Bardash: \email{noah.bardash@@wustl.edu}
#' 
#' @rdname print
#' @aliases print
#' 

# create print method for Rasch class
#' @export
setMethod(f = "print", "Rasch", definition = function(x){
  # return student's name & their EAP results
  #return(c(x@name, EAP(x, -6, 6))
  return(1)
}
)
